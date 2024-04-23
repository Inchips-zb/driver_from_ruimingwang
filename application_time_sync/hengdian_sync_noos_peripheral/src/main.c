#include <stdio.h>
#include <string.h>
#include "profile.h"
#include "ingsoc.h"
#include "platform_api.h"
#include "port_gen_os_driver.h"
#include "btstack_event.h"
#include "btstack_defines.h"
#include "eflash.inc"
#include "time_sync.h"

#define PIN_UART_RX   GIO_GPIO_4
#define PIN_UART_TX   GIO_GPIO_5

#define TEST_GPIO                       GIO_GPIO_6

#define WRTIE_GPIO_1 *GPIO_DO = (*GPIO_DO) | (1 << TEST_GPIO)
#define WRTIE_GPIO_0 *GPIO_DO = (*GPIO_DO) & (~(1 << TEST_GPIO))

uart_rx_packet_format_s uart_rx_packet;
uart_tx_packet_format_s uart_tx_packet;
/* ==============================================================
    APIs definition
*/
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

uint32_t uart_driver_send_data(uint8_t *c, uint16_t len)
{
  uint16_t i;
  for(i = 0; i < len; i++)
  {
    while (apUART_Check_TXFIFO_FULL(APB_UART1) == 1);
    UART_SendData(APB_UART1, (uint8_t)*(c+i));
  }
  return 0;
}

void uart_driver_read_data(void)
{
    static uint16_t c = 0;
    uint8_t *p = (uint8_t*)&uart_rx_packet;
  
    while (apUART_Check_RXFIFO_EMPTY(APB_UART1) != 1)
    {
        uint8_t b = APB_UART1->DataRead;
        p[c++] = b;
    }
    //first two are header and length
    if((c >= 2) && (c == (uart_rx_packet.len+2)))
    {
      platform_printf("uart rx %x %x %x\n", p[0],p[1],p[2]);
      switch(uart_rx_packet.header)
      {
        case UART_PACKET_HEADER_SYNC_INFO:
        {
          //first two are header and length
          if(c > 2)ble_external_send_dev_sync_data(uart_rx_packet.data, c-2);
        }
        break;
        case UART_PACKET_HEADER_DATA:
        {
          //first two are header and length
          if(c > 2)ble_external_send_data(uart_rx_packet.data, c-2);
        }
        break;
        default:
          break;
      }
      c = 0;
    }
}

uint32_t uart_driver_isr(void *user_data)
{
    uint32_t status;

    while(1)
    {
        status = apUART_Get_all_raw_int_stat(APB_UART1);
        if (status == 0)
            break;

        APB_UART1->IntClear = status;

        // rx int
        if (status & (1 << bsUART_RECEIVE_INTENAB))
        {
          uart_driver_read_data();
        }

        // tx int
        if (status & (1 << bsUART_TRANSMIT_INTENAB))
        {

        }
    }
    return 0;
}
#define UART_RX_WATERLEVEL (1)//attention !!!
static void config_comm_uart()
{
    UART_sStateStruct config;

    SYSCTRL_ClearClkGateMulti((1 << SYSCTRL_ClkGate_APB_UART1));
    PINCTRL_SetPadMux(PIN_UART_RX, IO_SOURCE_GENERAL);
    PINCTRL_SelUartRxdIn(UART_PORT_1, PIN_UART_RX);
    PINCTRL_SetPadMux(PIN_UART_TX, IO_SOURCE_UART1_TXD);

    config.word_length       = UART_WLEN_8_BITS;
    config.parity            = UART_PARITY_NOT_CHECK;
    config.fifo_enable       = 1;
    config.two_stop_bits     = 0;
    config.receive_en        = 1;
    config.transmit_en       = 1;
    config.UART_en           = 1;
    config.cts_en            = 0;
    config.rts_en            = 0;
    config.rxfifo_waterlevel = UART_RX_WATERLEVEL;
    config.txfifo_waterlevel = 1;
    config.ClockFrequency    = OSC_CLK_FREQ;
    config.BaudRate          = 921600;

    apUART_Initialize(APB_UART1, &config, 1 << bsUART_RECEIVE_INTENAB);
    
    platform_set_irq_callback(PLATFORM_CB_IRQ_UART1, uart_driver_isr, NULL);
}


void timer1_init(void)
{
    SYSCTRL_ClearClkGateMulti(1 << SYSCTRL_ClkGate_APB_TMR1);

    TMR_SetOpMode(APB_TMR1, TMR_CTL_OP_MODE_ONESHOT);
    TMR_Reload(APB_TMR1);
    TMR_IntEnable(APB_TMR1);
}

void timer1_enable(uint32_t cycles)
{
    TMR_SetCMP(APB_TMR1, cycles);
    TMR_Enable(APB_TMR1);
}

void timer1_disable(void)
{
    TMR_Disable(APB_TMR1);
}

uint32_t timer1_isr(void *user_data)
{
    internal_time_sync_stop();
    TMR_IntClr(APB_TMR1);
    return 0;
}

void timer2_init(void)
{
    SYSCTRL_ClearClkGateMulti(1 << SYSCTRL_ClkGate_APB_TMR2);

    TMR_SetOpMode(APB_TMR2, TMR_CTL_OP_MODE_ONESHOT);
    TMR_Reload(APB_TMR2);
    TMR_IntEnable(APB_TMR2);
}

void timer2_enable(uint32_t cycles)
{
    #if 0
    TMR_SetCMP(APB_TMR2, cycles);
    TMR_Enable(APB_TMR2);
    #else
    APB_TMR2->CTL &= ~(1);
    APB_TMR2->CTL |= 1 << 1;
    APB_TMR2->CMP = cycles;
    APB_TMR2->CTL |= 1;
    #endif
}

void timer2_disable(void)
{
    TMR_Disable(APB_TMR2);
}

uint32_t timer2_isr(void *user_data)
{
    #if TEST_TRIGGER_MODE_V0
    #ifdef TEST_SYNC_GPIO_SIMU
    *GPIO_DO = *GPIO_DO ^ (1<<TEST_GPIO);
    #endif
    #endif
  
    #if TEST_TRIGGER_MODE_V1
    __disable_irq();
    int64_t advance = came_sync_info.next_start_time_us - platform_get_us_time();
    if((advance > 0) && (advance < SYNC_TIMER_ADVANCE_US))
    {
      while(came_sync_info.next_start_time_us < platform_get_us_time());
      *GPIO_DO = *GPIO_DO ^ (1<<TEST_GPIO);
    }
    __enable_irq();
    
    #ifdef PROFILE_DEBUG_1
    platform_printf("advance %lld\n",advance);
    #endif
    #endif
    // write uart or toggle gpio to inform equipment
    #define DATA_LEN (1)
    static uint8_t data[DATA_LEN] = {UART_PACKET_HEADER_SYNC_TRIGGER,};
    uart_driver_send_data(data, DATA_LEN);
    
    TMR_IntClr(APB_TMR2);
    return 0;
}

void setup_peripherals(void)
{
    SYSCTRL_ClearClkGateMulti(0);
    config_uart(OSC_CLK_FREQ, 115200);

    timer1_init();
    timer2_init();
    platform_set_irq_callback(PLATFORM_CB_IRQ_TIMER1,(f_platform_irq_cb)timer1_isr, NULL);
    platform_set_irq_callback(PLATFORM_CB_IRQ_TIMER2,(f_platform_irq_cb)timer2_isr, NULL);
  
    #ifdef TEST_SYNC_GPIO_SIMU
    SYSCTRL_ClearClkGateMulti((1 << SYSCTRL_ClkGate_APB_GPIO)
                              | (1 << SYSCTRL_ClkGate_APB_PinCtrl));

    PINCTRL_SetPadMux(TEST_GPIO, IO_SOURCE_GENERAL);
    GIO_SetDirection(TEST_GPIO, GIO_DIR_OUTPUT);
    #endif
  
    config_comm_uart();
  
    NVIC_SetPriority(6,1);//set the priority of irq_timer2
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

// TODO: add RTOS source code to the project.
uintptr_t app_main()
{
    //EflashCacheBypass();
    platform_set_evt_callback(PLATFORM_CB_EVT_PROFILE_INIT, setup_profile, NULL);

    // setup handlers
    platform_set_evt_callback(PLATFORM_CB_EVT_HARD_FAULT, (f_platform_evt_cb)cb_hard_fault, NULL);
    platform_set_evt_callback(PLATFORM_CB_EVT_ASSERTION, (f_platform_evt_cb)cb_assertion, NULL);
    platform_set_evt_callback(PLATFORM_CB_EVT_HEAP_OOM, (f_platform_evt_cb)cb_heap_out_of_mem, NULL);
    platform_set_evt_callback(PLATFORM_CB_EVT_ON_DEEP_SLEEP_WAKEUP, on_deep_sleep_wakeup, NULL);
    platform_set_evt_callback(PLATFORM_CB_EVT_QUERY_DEEP_SLEEP_ALLOWED, query_deep_sleep_allowed, NULL);
    platform_set_evt_callback(PLATFORM_CB_EVT_PUTC, (f_platform_evt_cb)cb_putc, NULL);

    setup_peripherals();

    return (uintptr_t)os_impl_get_driver();

}

