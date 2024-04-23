#include <stdio.h>
#include <string.h>
#include "ingsoc.h"
#include "platform_api.h"
#include "FreeRTOS.h"
#include "task.h"
#include "trace.h"
#include "timers.h"
#include "bsp_usb_hid.h"

TimerHandle_t xTimer;

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

void setup_peripherals(void)
{
    SYSCTRL_ClearClkGateMulti(0
                            | (1 << SYSCTRL_ClkGate_APB_WDT));
    config_uart(OSC_CLK_FREQ, 921600);

    if (!IS_DEBUGGER_ATTACHED())
    {
        // Watchdog will timeout after ~20sec
        TMR_WatchDogEnable(TMR_CLK_FREQ * 10);
    }
    
    bsp_usb_init();
    
    platform_printf("cpu clk %d, hclk %d usb %d \n",SYSCTRL_GetPLLClk(),SYSCTRL_GetHClk(),SYSCTRL_GetClk(SYSCTRL_ITEM_APB_USB));
}

static void watchdog_task(void *pdata)
{
    for (;;)
    {
        vTaskDelay(pdMS_TO_TICKS(9000));
        TMR_WatchDogRestart();
    }
}
#ifdef HID_TEST
static void xTimer_callback(TimerHandle_t xTimer)
{
  //static uint8_t x = 0, y = 0, btn = 0;
  //bsp_usb_handle_hid_report((int8_t)(++x), (int8_t)(++y), btn);
  //bsp_usb_handle_hid_report((int8_t)(0x33), (int8_t)(0x44), 0x7);
  static uint8_t key = 4, press = 1;
  bsp_usb_handle_hid_keyb_key_report(key, press);
  press = press ? 0 : 1;
  if(press){key++; if(key>29){key = 4;}}
}
#endif

trace_rtt_t trace_ctx = {0};

int app_main()
{
    // setup handlers
    platform_set_evt_callback(PLATFORM_CB_EVT_HARD_FAULT, (f_platform_evt_cb)cb_hard_fault, NULL);
    platform_set_evt_callback(PLATFORM_CB_EVT_ASSERTION, (f_platform_evt_cb)cb_assertion, NULL);
    platform_set_evt_callback(PLATFORM_CB_EVT_HEAP_OOM, (f_platform_evt_cb)cb_heap_out_of_mem, NULL);
    platform_set_evt_callback(PLATFORM_CB_EVT_PUTC, (f_platform_evt_cb)cb_putc, NULL);

    setup_peripherals();
    xTaskCreate(watchdog_task,
           "w",
           configMINIMAL_STACK_SIZE,
           NULL,
           (configMAX_PRIORITIES - 1),
           NULL);
  
    #ifdef HID_TEST
    xTimer = xTimerCreate("a",
                            pdMS_TO_TICKS(10),
                            pdTRUE,
                            NULL,
                            xTimer_callback);
    xTimerStart(xTimer, portMAX_DELAY);
    #endif

    //trace_rtt_init(&trace_ctx);
    //platform_set_evt_callback(PLATFORM_CB_EVT_TRACE, (f_platform_evt_cb)cb_trace_rtt, &trace_ctx);
    // TODO: config trace mask
    //platform_config(PLATFORM_CFG_TRACE_MASK, 0);
  
    return 0;
}

