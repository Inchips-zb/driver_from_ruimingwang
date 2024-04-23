#include <stdio.h>
#include <string.h>
#include "profile.h"
#include "ingsoc.h"
#include "platform_api.h"
#include "FreeRTOS.h"
#include "task.h"
#include "trace.h"
#include "timers.h"
#include "common.h"

//#define IR_DOUT GIO_GPIO_10
#define IR_DOUT GIO_GPIO_17
#define IR_DIN  GIO_GPIO_11

static uint32_t cb_hard_fault(hard_fault_info_t *info, void *_)
{
    platform_printf("HARDFAULT:\nPC : 0x%08X\nLR : 0x%08X\nPSR: 0x%08X\n"
                    "R0 : 0x%08X\nR1 : 0x%08X\nR2 : 0x%08X\nP3 : 0x%08X\n"
                    "R12: 0x%08X\n",
                    info->pc, info->lr, info->psr,
                    info->r0, info->r1, info->r2, info->r3, info->r12);
    for (;;);
}

static uint32_t cb_assertion(assertion_info_t *info, void *_)
{
    platform_printf("[ASSERTION] @ %s:%d\n",
                    info->file_name,
                    info->line_no);
    for (;;);
}

static uint32_t cb_heap_out_of_mem(uint32_t tag, void *_)
{
    platform_printf("[OOM] @ %d\n", tag);
    for (;;);
}

#define PRINT_PORT    APB_UART0

uint32_t cb_putc(char *c, void *dummy)
{
    while (apUART_Check_TXFIFO_FULL(PRINT_PORT) == 1);
    UART_SendData(PRINT_PORT, (uint8_t)*c);
    return 0;
}

int fputc(int ch, FILE *f)
{
    cb_putc((char *)&ch, NULL);
    return ch;
}

void config_uart(uint32_t freq, uint32_t baud)
{
    UART_sStateStruct config;

    config.word_length       = UART_WLEN_8_BITS;
    config.parity            = UART_PARITY_NOT_CHECK;
    config.fifo_enable       = 1;
    config.two_stop_bits     = 0;
    config.receive_en        = 1;
    config.transmit_en       = 1;
    config.UART_en           = 1;
    config.cts_en            = 0;
    config.rts_en            = 0;
    config.rxfifo_waterlevel = 1;
    config.txfifo_waterlevel = 1;
    config.ClockFrequency    = freq;
    config.BaudRate          = baud;

    apUART_Initialize(PRINT_PORT, &config, 0);
}

#define FCLK            32000
#define NEC_WAVE_FREQ   38000
#define RC5_WAVE_FREQ   36000

#define IR_WAVE_NEC_TC9012_FREQ (OSC_CLK_FREQ/NEC_WAVE_FREQ)    
#define IR_WAVE_RC5_FREQ (OSC_CLK_FREQ/RC5_WAVE_FREQ)   
#define NEC_UINT    (FCLK*560/1000000+1)
#define TC9012_UINT (FCLK*260/1000000+1)
#define RC5_UINT    (FCLK*889/1000000+1)

#define INESSENTIAL     0
typedef struct
{
    uint16_t timer1;
    uint16_t timer2;
    uint16_t timer3;
    uint16_t timer4;
    uint16_t timer5;
    uint16_t btimer1;
    uint16_t btimer2;
    uint16_t bit_cycle;
    uint16_t carry_low;
    uint16_t carry_high;
}Ir_mode_param_t;

typedef struct{
    Ir_mode_param_t param_tx;
    Ir_mode_param_t param_rx;
}Ir_type_param_t;
//
const static Ir_type_param_t t_ir_type_param_table[] = 
{
    {//NEC param
        {  //TX
            16*NEC_UINT-1,4*NEC_UINT-1,8*NEC_UINT-1,1*NEC_UINT-1,INESSENTIAL,
            2*NEC_UINT-1, 4*NEC_UINT-1,1*NEC_UINT-1,IR_WAVE_NEC_TC9012_FREQ*2/3,IR_WAVE_NEC_TC9012_FREQ*1/3},
        {   //RX
            14*NEC_UINT-1,18*NEC_UINT-1,22*NEC_UINT-1,26*NEC_UINT-1,0xfff,
            INESSENTIAL,2*NEC_UINT-1,0x7f,INESSENTIAL,INESSENTIAL},
    },
    {//TC9012 param
        {   //TX
            16*TC9012_UINT-1,8*TC9012_UINT-1,16*TC9012_UINT-1,2*TC9012_UINT-1,INESSENTIAL,
            4*TC9012_UINT-1,6*TC9012_UINT-1,2*TC9012_UINT-1,IR_WAVE_NEC_TC9012_FREQ*2/3,IR_WAVE_NEC_TC9012_FREQ*1/3},
        {    //RX
            28*TC9012_UINT-1,36*TC9012_UINT-1,44*TC9012_UINT-1,32*TC9012_UINT-1,0xfff,INESSENTIAL,
            4*TC9012_UINT-1,0x7f,INESSENTIAL,INESSENTIAL},
    },    
    {//RC5 param
        {   //TX
            2*RC5_UINT-1,2*RC5_UINT-1,INESSENTIAL,INESSENTIAL,INESSENTIAL,2*RC5_UINT-1,
            INESSENTIAL,1*RC5_UINT,IR_WAVE_RC5_FREQ*2/3,IR_WAVE_RC5_FREQ*1/3},
        
        {   //RX
            1*RC5_UINT-2,1*RC5_UINT,3*RC5_UINT-1,5*RC5_UINT-1,INESSENTIAL,1*RC5_UINT-3,
            1*RC5_UINT-1,2*RC5_UINT-1,INESSENTIAL,INESSENTIAL},
    }
};

static uint32_t IRQHandler_IR_INT(void *user_data)
{
    if(IR_FsmGetIrTransmitOk(APB_IR))
        platform_printf("int ir send ok\n");
    if(IR_FsmGetIrTxRepeat(APB_IR))
        platform_printf("int ir repeat ok\n");
    if(IR_FsmGetIrReceivedOk(APB_IR))
    {
        uint32_t value = IR_RxCodeGetIrRxUsercode(APB_IR) <<16 | IR_RxCodeGetIrRxDatacode(APB_IR);
        platform_printf("Received:0x%x\n",value);
    }
    
    if(IR_FsmGetIrRepeat(APB_IR))
        ;
    IR_FsmClearIrInt(APB_IR);
    platform_printf("int ir \n");
    return 0;
}

int ir_transmit_fun(uint16_t addr,uint16_t data)
{
    IR_TxCodeSetIrTxUsercode(APB_IR,addr);
    IR_TxCodeSetIrTxDatacode(APB_IR,data);
    IR_CleanIrTxRepeatMode(APB_IR);
    IR_TxConfigTxStart(APB_IR);
    return 0;
}
static int ir_transmit_repeat(void) //ir hard transmit repeat
{
    IR_CtrlIrTxRepeatMode(APB_IR);   
    IR_TxConfigTxStart(APB_IR);
 //   while(!IR_FsmGetIrTransmitOk(APB_IR)); 
    return 0;
}

static TimerHandle_t app_timer = 0;

static void app_timer_callback(TimerHandle_t xTimer)
{
  #ifdef IR_TX
    ir_transmit_fun(0x3333, 0x1234);
  #endif
  #ifdef IR_RX
    platform_printf("ir_ctrl 0x%x 0x%x 0x%x, 0x%x 0x%x 0x%x 0x%x 0x%x, 0x%x 0x%x 0x%x\n", 
    APB_IR->ir_ctrl,APB_IR->ir_tx_config,APB_IR->ir_carry_config,
    APB_IR->ir_time_1,APB_IR->ir_time_2,APB_IR->ir_time_3,APB_IR->ir_time_4,APB_IR->ir_time_5,
    APB_IR->ir_rx_code,APB_IR->ir_tx_code,APB_IR->ir_fsm);
  #endif
}

void setup_peripherals_ir_pin(void)
{
    SYSCTRL_ClearClkGateMulti(  (1 << SYSCTRL_ClkGate_APB_IR)
                                | (1 << SYSCTRL_ClkGate_APB_PinCtrl));

    #if 1
    PINCTRL_SelIrIn(IR_DIN);
    PINCTRL_SetPadMux(IR_DOUT,IO_SOURCE_IR_DATA_OUT);
    #else
    SetIRPIN(IR_DOUT,IR_DIN);
    #endif
    
    platform_set_irq_callback(PLATFORM_CB_IRQ_IR_INT, IRQHandler_IR_INT, NULL);
}

void setup_peripherals_ir_module_rx(IR_IrMode_e mode, const Ir_mode_param_t* param_p)
{
    IR_CtrlSetIrMode(APB_IR,mode);
    IR_CtrlSetTxRxMode(APB_IR,IR_TXRX_MODE_RX_MODE);
    IR_CtrlSetIrIntEn(APB_IR);

    IR_CtrlSetIrEndDetectEn(APB_IR);
    IR_CtrlIrUsercodeVerify(APB_IR);
    IR_CtrlIrDatacodeVerify(APB_IR);
    IR_TimeSetIrTime1(APB_IR,param_p->timer1);
    IR_TimeSetIrTime2(APB_IR,param_p->timer2);
    IR_TimeSetIrTime3(APB_IR,param_p->timer3);
    IR_TimeSetIrTime4(APB_IR,param_p->timer4); 
    IR_TimeSetIrTime5(APB_IR,param_p->timer5); 
    IR_CtrlIrSetBitTime1(APB_IR,param_p->btimer1);
    IR_CtrlIrSetBitTime2(APB_IR,param_p->btimer2);
    IR_CtrlIrSetIrBitCycle(APB_IR,param_p->bit_cycle);

    IR_CtrlEnable(APB_IR);
}

void setup_peripherals_ir_module_tx(IR_IrMode_e mode, const Ir_mode_param_t* param_p)
{
    IR_CtrlSetIrMode(APB_IR,mode);
    IR_CtrlSetTxRxMode(APB_IR,IR_TXRX_MODE_TX_MODE);
    IR_CtrlSetIrIntEn(APB_IR);

    IR_TxConfigIrTxPol(APB_IR);
    IR_TxConfigCarrierCntClr(APB_IR);
    IR_TxConfigIrIntEn(APB_IR);
    IR_CarryConfigSetIrCarryLow(APB_IR,param_p->carry_low);
    IR_CarryConfigSetIrCarryHigh(APB_IR,param_p->carry_high);
    IR_TimeSetIrTime1(APB_IR,param_p->timer1);
    IR_TimeSetIrTime2(APB_IR,param_p->timer2);
    IR_TimeSetIrTime3(APB_IR,param_p->timer3 );
    IR_TimeSetIrTime4(APB_IR,param_p->timer4); 
    IR_CtrlIrSetBitTime1(APB_IR,param_p->btimer1);
    IR_CtrlIrSetBitTime2(APB_IR,param_p->btimer2);
    IR_CtrlIrSetIrBitCycle(APB_IR,param_p->bit_cycle);

    IR_CtrlEnable(APB_IR);
}

static void user_ir_device_init(IR_IrMode_e mode,IR_TxRxMode_e tx_rx_mode)
{
    IR_CtrlSetIrMode(APB_IR,mode);
    IR_CtrlSetTxRxMode(APB_IR,tx_rx_mode);
    IR_CtrlSetIrIntEn(APB_IR);

    if(IR_TXRX_MODE_TX_MODE == tx_rx_mode)
    {
        platform_printf("IR mode TX\n");
        IR_TxConfigIrTxPol(APB_IR);
        IR_TxConfigCarrierCntClr(APB_IR);
        IR_TxConfigIrIntEn(APB_IR);
        IR_CarryConfigSetIrCarryLow(APB_IR,t_ir_type_param_table[mode].param_tx.carry_low);   //30% pwm
        IR_CarryConfigSetIrCarryHigh(APB_IR,t_ir_type_param_table[mode].param_tx.carry_high);
        IR_TimeSetIrTime1(APB_IR,t_ir_type_param_table[mode].param_tx.timer1);
        IR_TimeSetIrTime2(APB_IR,t_ir_type_param_table[mode].param_tx.timer2);
        IR_TimeSetIrTime3(APB_IR,t_ir_type_param_table[mode].param_tx.timer3 );
        IR_TimeSetIrTime4(APB_IR,t_ir_type_param_table[mode].param_tx.timer4); 
        IR_CtrlIrSetBitTime1(APB_IR,t_ir_type_param_table[mode].param_tx.btimer1);
        IR_CtrlIrSetBitTime2(APB_IR,t_ir_type_param_table[mode].param_tx.btimer2);    
        IR_CtrlIrSetIrBitCycle(APB_IR,t_ir_type_param_table[mode].param_tx.bit_cycle);        
        
    }
    else{
        platform_printf("IR mode RX\n");
        #if 1
        IR_CtrlSetIrEndDetectEn(APB_IR);//end code detect en
        //IR_CtrlSetIrIntVerifyEn(APB_IR);//if set to 1, there is no rx int
        IR_CtrlIrUsercodeVerify(APB_IR);
        IR_CtrlIrDatacodeVerify(APB_IR);
        IR_TimeSetIrTime1(APB_IR,t_ir_type_param_table[mode].param_rx.timer1);
        IR_TimeSetIrTime2(APB_IR,t_ir_type_param_table[mode].param_rx.timer2);
        IR_TimeSetIrTime3(APB_IR,t_ir_type_param_table[mode].param_rx.timer3);
        IR_TimeSetIrTime4(APB_IR,t_ir_type_param_table[mode].param_rx.timer4); 
        IR_TimeSetIrTime5(APB_IR,t_ir_type_param_table[mode].param_rx.timer5); 
        IR_CtrlIrSetBitTime1(APB_IR,t_ir_type_param_table[mode].param_rx.btimer1);
        IR_CtrlIrSetBitTime2(APB_IR,t_ir_type_param_table[mode].param_rx.btimer2);    
        IR_CtrlIrSetIrBitCycle(APB_IR,t_ir_type_param_table[mode].param_rx.bit_cycle);   
        #else
        ir_reg->ir_ctrl.f.ir_mode = 0;
        ir_reg->ir_tx_config.f.ir_pol = 0;
        ir_reg->ir_ctrl.f.ir_end_detect_en = 1;
        ir_reg->ir_ctrl.f.ir_usercode_verify = 1;
        ir_reg->ir_ctrl.f.ir_datacode_verify = 1;
      
        ir_reg->ir_time_1.f.ir_time_s1 = 15*NEC_UINT-1;
        ir_reg->ir_time_2.f.ir_time_s2 = 17*NEC_UINT-1;
        ir_reg->ir_time_3.f.ir_time_s3 = 23*NEC_UINT-1;
        ir_reg->ir_time_4.f.ir_time_s4 = 25*NEC_UINT-1;
        
        ir_reg->ir_ctrl.f.bit_time_1 = 0;
        ir_reg->ir_ctrl.f.bit_time_2 = 2*NEC_UINT-1;
        ir_reg->ir_ctrl.f.ir_bit_cycle = 100;
        
        ir_reg->ir_ctrl.f.txrx_mode = 0;
        ir_reg->ir_ctrl.f.ir_en = 1;
        #endif
    }
    IR_CtrlEnable(APB_IR);
    
    platform_printf("ir_ctrl 0x%x 0x%x 0x%x, 0x%x 0x%x 0x%x 0x%x 0x%x, 0x%x 0x%x 0x%x\n", 
    APB_IR->ir_ctrl,APB_IR->ir_tx_config,APB_IR->ir_carry_config,
    APB_IR->ir_time_1,APB_IR->ir_time_2,APB_IR->ir_time_3,APB_IR->ir_time_4,APB_IR->ir_time_5,
    APB_IR->ir_rx_code,APB_IR->ir_tx_code,APB_IR->ir_fsm);
}

void ir_rx_init_v1(void)
{
    IR_IrMode_e mode = 0;
    ir_reg->ir_ctrl.f.ir_mode = 0;
    ir_reg->ir_tx_config.f.ir_pol = 1;
    ir_reg->ir_ctrl.f.ir_end_detect_en = 1;
    ir_reg->ir_ctrl.f.ir_usercode_verify = 1;
    ir_reg->ir_ctrl.f.ir_datacode_verify = 1;
  
    ir_reg->ir_time_1.f.ir_time_s1 = 15*NEC_UINT-1;
    ir_reg->ir_time_2.f.ir_time_s2 = 17*NEC_UINT-1;
    ir_reg->ir_time_3.f.ir_time_s3 = 23*NEC_UINT-1;
    ir_reg->ir_time_4.f.ir_time_s4 = 25*NEC_UINT-1;
    
    ir_reg->ir_ctrl.f.bit_time_1 = 0;
    ir_reg->ir_ctrl.f.bit_time_2 = 2*NEC_UINT-1;
    ir_reg->ir_ctrl.f.ir_bit_cycle = 100;
    
    ir_reg->ir_ctrl.f.txrx_mode = 0;
    ir_reg->ir_ctrl.f.ir_en = 1;
  
//    IR_CtrlSetIrMode(APB_IR,mode);
//    IR_CtrlSetTxRxMode(APB_IR,IR_TXRX_MODE_RX_MODE);
//    IR_CtrlSetIrIntEn(APB_IR);
//  
//        IR_CtrlSetIrEndDetectEn(APB_IR);//end code detect en
//        IR_CtrlSetIrIntVerifyEn(APB_IR);
//        IR_CtrlIrUsercodeVerify(APB_IR);
//        IR_CtrlIrDatacodeVerify(APB_IR);
//        
//        IR_TimeSetIrTime1(APB_IR,t_ir_type_param_table[mode].param_rx.timer1);
//        IR_TimeSetIrTime2(APB_IR,t_ir_type_param_table[mode].param_rx.timer2);
//        IR_TimeSetIrTime3(APB_IR,t_ir_type_param_table[mode].param_rx.timer3);
//        IR_TimeSetIrTime4(APB_IR,t_ir_type_param_table[mode].param_rx.timer4); 
//        IR_TimeSetIrTime5(APB_IR,t_ir_type_param_table[mode].param_rx.timer5); 
//        IR_CtrlIrSetBitTime1(APB_IR,t_ir_type_param_table[mode].param_rx.btimer1);
//        IR_CtrlIrSetBitTime2(APB_IR,t_ir_type_param_table[mode].param_rx.btimer2);    
//        IR_CtrlIrSetIrBitCycle(APB_IR,t_ir_type_param_table[mode].param_rx.bit_cycle);   
}


void setup_peripherals(void)
{
    SYSCTRL_ClearClkGateMulti(0
                            | (1 << SYSCTRL_ClkGate_APB_WDT));
    config_uart(OSC_CLK_FREQ, 115200);

    if (!IS_DEBUGGER_ATTACHED())
    {
        // Watchdog will timeout after ~20sec
        TMR_WatchDogEnable(TMR_CLK_FREQ * 10);
    }
    
    setup_peripherals_ir_pin();
    
    #ifdef IR_TX
    //user_ir_device_init(IR_IR_MODE_IR_NEC, IR_TXRX_MODE_TX_MODE);
    setup_peripherals_ir_module_tx(IR_IR_MODE_IR_NEC, &(t_ir_type_param_table[IR_IR_MODE_IR_NEC].param_tx));
    #endif
    
    #ifdef IR_RX
    //ir_rx_init_v1();
    //user_ir_device_init(IR_IR_MODE_IR_NEC, IR_TXRX_MODE_RX_MODE);
    setup_peripherals_ir_module_rx(IR_IR_MODE_IR_NEC, &(t_ir_type_param_table[IR_IR_MODE_IR_NEC].param_rx));
    #endif
    
    #ifdef NO_SIMU
    app_timer = xTimerCreate("a",
                            pdMS_TO_TICKS(1000),
                            pdTRUE,
                            NULL,
                            app_timer_callback);
    xTimerStart(app_timer, portMAX_DELAY);
    #endif
}

uint32_t on_deep_sleep_wakeup(void *dummy, void *user_data)
{
    (void)(dummy);
    (void)(user_data);
    setup_peripherals();
    return 0;
}

uint32_t query_deep_sleep_allowed(void *dummy, void *user_data)
{
    (void)(dummy);
    (void)(user_data);
    // TODO: return 0 if deep sleep is not allowed now; else deep sleep is allowed
    return 0;
}

static void watchdog_task(void *pdata)
{
    for (;;)
    {
        vTaskDelay(pdMS_TO_TICKS(9000));
        TMR_WatchDogRestart();
    }
}

trace_rtt_t trace_ctx = {0};


int app_main()
{
    #if 0
    platform_set_evt_callback(PLATFORM_CB_EVT_PROFILE_INIT, setup_profile, NULL);
    #endif

    // setup handlers
    platform_set_evt_callback(PLATFORM_CB_EVT_HARD_FAULT, (f_platform_evt_cb)cb_hard_fault, NULL);
    platform_set_evt_callback(PLATFORM_CB_EVT_ASSERTION, (f_platform_evt_cb)cb_assertion, NULL);
    platform_set_evt_callback(PLATFORM_CB_EVT_HEAP_OOM, (f_platform_evt_cb)cb_heap_out_of_mem, NULL);
    platform_set_evt_callback(PLATFORM_CB_EVT_ON_DEEP_SLEEP_WAKEUP, on_deep_sleep_wakeup, NULL);
    platform_set_evt_callback(PLATFORM_CB_EVT_QUERY_DEEP_SLEEP_ALLOWED, query_deep_sleep_allowed, NULL);
    platform_set_evt_callback(PLATFORM_CB_EVT_PUTC, (f_platform_evt_cb)cb_putc, NULL);

    setup_peripherals();
    xTaskCreate(watchdog_task,
           "w",
           configMINIMAL_STACK_SIZE,
           NULL,
           (configMAX_PRIORITIES - 1),
           NULL);

    trace_rtt_init(&trace_ctx);
    platform_set_evt_callback(PLATFORM_CB_EVT_TRACE, (f_platform_evt_cb)cb_trace_rtt, &trace_ctx);
    // TODO: config trace mask
    platform_config(PLATFORM_CFG_TRACE_MASK, 0);
    return 0;
}

