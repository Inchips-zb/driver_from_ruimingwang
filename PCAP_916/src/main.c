#include <stdio.h>
#include <string.h>
#include "profile.h"
#include "ingsoc.h"
#include "platform_api.h"
#include "FreeRTOS.h"
#include "task.h"
#include "trace.h"
#include "../data/setup_soc.cgen"

typedef struct
{
    uint32_t p_cap_0_p:1; // rising  edge on input 0 (A) is detected
    uint32_t p_cap_0_n:1; // falling edge on input 0 (A) is detected
    uint32_t p_cap_1_p:1; // rising  edge on input 1 (B) is detected
    uint32_t p_cap_1_n:1; // falling edge on input 1 (B) is detected
    uint32_t padding:28;
}pcap_edge_s;

#define CHANNEL_ID  0
#define PCAP_CHANNEL (0)

#define PCAP_LEN (80)
uint32_t pcap_data_buf[PCAP_LEN];
void peripherals_icap_to_dma(int channel_id, void *dst, int size);

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
#ifdef USE_DMA
static uint32_t DMA_cb_isr(void *user_data)
{
    uint32_t i;
    uint32_t state = DMA_GetChannelIntState(CHANNEL_ID), last_cnt=0;
    DMA_ClearChannelIntState(CHANNEL_ID, state);

    for(i=0;i<PCAP_LEN;i+=2)
    {
      pcap_edge_s *edge = (pcap_edge_s *)&pcap_data_buf[i+1];
      printf("cnt: 0x%x (%u %u %u %u) offset: %d\n", pcap_data_buf[i], edge->p_cap_0_n,edge->p_cap_0_p,
      edge->p_cap_1_n,edge->p_cap_1_p, (pcap_data_buf[i]-last_cnt)/(PWM_CLOCK_FREQ/1000000));
      last_cnt = pcap_data_buf[i];
    }
    return 0;
}
#endif
static uint32_t PCAP0_cb_isr(void *user_data)
{
    pcap_edge_s *edge;
    static uint32_t last_cnt = 0;

    pcap_data_buf[0] = PCAP_ReadData(PCAP_CHANNEL);
    pcap_data_buf[1] = PCAP_ReadData(PCAP_CHANNEL);
    
    edge = (pcap_edge_s *)&pcap_data_buf[1];
    printf("cnt: 0x%x (%u %u %u %u) offset: %d\n", pcap_data_buf[0], edge->p_cap_0_n,edge->p_cap_0_p,
    edge->p_cap_1_n,edge->p_cap_1_p, (pcap_data_buf[0]-last_cnt)/(PWM_CLOCK_FREQ/1000000));
    last_cnt = pcap_data_buf[0];

    return 0;
}
#ifdef USE_DMA
static void setup_peripherals_dma_module(void)
{
  DMA_Reset(1);
  DMA_Reset(0);
  SYSCTRL_SelectUsedDmaItems(1<<SYSCTRL_DMA_PWM0);
  platform_set_irq_callback(PLATFORM_CB_IRQ_DMA, DMA_cb_isr, 0);
}

int DMA_PreparePcap2Mem(DMA_Descriptor *pDesc,
                                        uint32_t *dst, SYSCTRL_DMA src, uint32_t pcap_channel, int size,
                                        DMA_AddressControl dst_addr_ctrl,
                                        uint32_t options)
{
  int req = SYSCTRL_GetDmaId(src);
  uint32_t peri_addr;
  switch(pcap_channel)
  {
    case 0:
        peri_addr = (uint32_t)&APB_PWM->PCAPChannels[0].Ctrl1;
        break;
    case 1:
        peri_addr = (uint32_t)&APB_PWM->PCAPChannels[1].Ctrl1;
        break;
    case 2:
        peri_addr = (uint32_t)&APB_PWM->PCAPChannels[2].Ctrl1;
        break;
  }

  pDesc->Ctrl = options
               | ((uint32_t)1 << 17)
               | ((uint32_t)req << 8)
               | ((uint32_t)DMA_ADDRESS_FIXED << 14)
               | ((uint32_t)2 << 21)
               | ((uint32_t)dst_addr_ctrl << 12)
               | ((2) << 18);
  pDesc->TranSize = size / (1 << 2);
  pDesc->DstAddr = (uint32_t)dst;
  pDesc->SrcAddr = (uint32_t)peri_addr;

  return 0;
}

void peripherals_icap_to_dma(int channel_id, void *dst, int size)
{
  DMA_Descriptor descriptor __attribute__((aligned (8)));

  descriptor.Next = (DMA_Descriptor *)0;
  DMA_PreparePcap2Mem(&descriptor,dst,SYSCTRL_DMA_PWM0,0,size,DMA_ADDRESS_INC,0);

  DMA_EnableChannel(channel_id, &descriptor);
}
#endif
void setup_pacp(void)
{
  SYSCTRL_ClearClkGateMulti(   (1 << SYSCTRL_ITEM_APB_SysCtrl)
                                | (1 << SYSCTRL_ClkGate_APB_DMA)
                                | (1 << SYSCTRL_ITEM_APB_PinCtrl)
                                | (1 << SYSCTRL_ITEM_APB_GPIO1)
                                | (1 << SYSCTRL_ITEM_APB_GPIO0));
  #ifdef USE_DMA
  setup_peripherals_dma_module();
  #endif
  // enable pin for pwm ch 0
  PINCTRL_SelPCAPIn(0,6);
  PINCTRL_SelPCAPIn(1,7);

  // reset pcap module
  SYSCTRL_SetClkGateMulti(1 << SYSCTRL_ITEM_APB_PWM);
  SYSCTRL_ResetBlock(SYSCTRL_ITEM_APB_PWM);
  SYSCTRL_EnablePcapMode(PCAP_CHANNEL,1);
  SYSCTRL_ClearClkGateMulti(1 << SYSCTRL_ITEM_APB_PWM);
  SYSCTRL_ReleaseBlock(SYSCTRL_ITEM_APB_PWM);
  
  // set pwm to pcap mode(6)
  PWM_SetMode(PCAP_CHANNEL, PWM_WORK_MODE_PCAP);
  #ifdef USE_DMA
  // enable pcap dma, and set the trigger threshold to 2
  PCAP_DmaEnable(PCAP_CHANNEL,2,1);
  #endif
  #ifdef USE_ISR
  PCAP_FifoTriggerEnable(PCAP_CHANNEL, 1, PWM_FIFO_HALFFULL_EN | PWM_FIFO_TRIGGER_EN);
  platform_set_irq_callback(PLATFORM_CB_IRQ_PCAP0, PCAP0_cb_isr, 0);
  #endif
  
  // enable capture event, capture both edge
  PCAP_EnableEvents(PCAP_CHANNEL,PCAP_PULSE_RISING_EDGE | PCAP_PULSE_FALLING_EDGE,PCAP_PULSE_RISING_EDGE | PCAP_PULSE_FALLING_EDGE);
  // enable counter
  PCAP_CounterEnable(1);
  // enable pwm
  PWM_Enable(PCAP_CHANNEL, 1);
  
  #ifdef USE_DMA
  peripherals_icap_to_dma(CHANNEL_ID,pcap_data_buf,sizeof(pcap_data_buf));
  #endif
}

void setup_peripherals(void)
{
    cube_setup_peripherals();
    
    setup_pacp();
    
    #ifdef PWM_OUTPUT
    PINCTRL_SetPadMux(12,IO_SOURCE_PWM2_A);
    PINCTRL_SetPadMux(13,IO_SOURCE_PWM2_B);
    PWM_SetupSimple(2,100,50);
    #endif

    #ifdef FAKE_DATA_FOR_PCAP
    PINCTRL_SetPadMux(12,IO_SOURCE_GPIO);
    PINCTRL_SetPadMux(13,IO_SOURCE_GPIO);
    GIO_SetDirection(12,GIO_DIR_OUTPUT);
    GIO_SetDirection(13,GIO_DIR_OUTPUT);
    #endif
    platform_printf("setup done.\n");
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
 
static void app_task(void *pdata)
{
    static uint32_t val=0;
    for (;;)
    {
        vTaskDelay(pdMS_TO_TICKS(1000));
        #ifdef FAKE_DATA_FOR_PCAP
        GIO_WriteValue(12,val);
        vTaskDelay(pdMS_TO_TICKS(1000));
        GIO_WriteValue(13,val);
        val=val?0:1;
        #endif
    }
}

trace_rtt_t trace_ctx = {0};


int app_main()
{
    cube_soc_init();

    //platform_set_evt_callback(PLATFORM_CB_EVT_PROFILE_INIT, setup_profile, NULL);

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
    xTaskCreate(app_task,
           "a",
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

