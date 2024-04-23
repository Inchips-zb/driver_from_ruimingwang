#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "profile.h"
#include "ingsoc.h"
#include "platform_api.h"
#include "FreeRTOS.h"
#include "task.h"
#include "trace.h"
#include "semphr.h"

static SemaphoreHandle_t sem_wakeup = NULL;
void key_detector_start_calc(void);

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

uint32_t gpio_isr(void *user_data)
{
  key_detector_start_calc();
  GIO_ClearAllIntStatus();
  return 0;
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

    SYSCTRL_ClearClkGateMulti(  (1 << SYSCTRL_ITEM_APB_SysCtrl)
                                | (1 << SYSCTRL_ITEM_APB_PinCtrl)
                                | (1 << SYSCTRL_ITEM_APB_GPIO1)
                                | (1 << SYSCTRL_ITEM_APB_GPIO0));
    
    PINCTRL_SetPadMux(GIO_GPIO_16, IO_SOURCE_GENERAL);
    //PINCTRL_Pull(GIO_GPIO_1, PINCTRL_PULL_UP);
    GIO_SetDirection(GIO_GPIO_16, GIO_DIR_INPUT);
    
    GIO_ConfigIntSource(GIO_GPIO_16, GIO_INT_EN_LOGIC_LOW_OR_FALLING_EDGE, GIO_INT_EDGE);
    platform_set_irq_callback(PLATFORM_CB_IRQ_GPIO, gpio_isr, NULL);
    
    #ifdef EFUSE_WORD
    SYSCTRL_ClearClkGateMulti( (1 << SYSCTRL_ITEM_APB_EFUSE));
    SYSCTRL_ResetBlock(SYSCTRL_ITEM_APB_EFUSE);
    SYSCTRL_ReleaseBlock(SYSCTRL_ITEM_APB_EFUSE);
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

void key_detector_start_calc(void)
{
  BaseType_t xHigherPriorityTaskWoken = pdFALSE;
  xSemaphoreGiveFromISR(sem_wakeup, &xHigherPriorityTaskWoken);
}

static void packet_schedule_task(void *pdata)
{
  for (;;)
  {
    BaseType_t r = xSemaphoreTake(sem_wakeup,  portMAX_DELAY);

    if (pdTRUE != r) continue;

    #ifdef EFUSE_BIT
    uint8_t pos = rand()%127;
    platform_printf("rand %d \n", pos);
    EFUSE_UnLock(APB_EFUSE, EFUSE_UNLOCK_FLAG);
    EFUSE_WriteEfuseDataBitToOne(APB_EFUSE, pos);//for 0 to 127

    while(1 == EFUSE_GetStatusBusy(EFUSE_BASE));
    EFUSE_Lock(EFUSE_BASE);
    
    SYSCTRL_ResetBlock(SYSCTRL_ITEM_APB_EFUSE);
    SYSCTRL_ReleaseBlock(SYSCTRL_ITEM_APB_EFUSE);
    
    EFUSE_SetRdFlag(APB_EFUSE);
    platform_printf("cfg0: 0x%x status 0x%x \n", APB_EFUSE->Efuse_cfg0, APB_EFUSE->Efuse_status);
    while(!EFUSE_GetDataValidFlag(APB_EFUSE));
    platform_printf("cfg0: 0x%x status 0x%x \n", APB_EFUSE->Efuse_cfg0, APB_EFUSE->Efuse_status);
    platform_printf("word 0: 0x%x \n",EFUSE_GetEfuseData(APB_EFUSE, 0));//bit 0  - 31
    platform_printf("word 1: 0x%x \n",EFUSE_GetEfuseData(APB_EFUSE, 1));//bit 32 - 63
    platform_printf("word 2: 0x%x \n",EFUSE_GetEfuseData(APB_EFUSE, 2));//bit 64 - 95
    platform_printf("word 3: 0x%x \n",EFUSE_GetEfuseData(APB_EFUSE, 3));//bit 96 - 127
    #endif
    
    #ifdef EFUSE_WORD
    uint32_t data = 0x12345678;//rand()&0xffffffff;
    platform_printf("rand 0x%x \n", data);
    platform_printf("cfg0: 0x%x status 0x%x \n", APB_EFUSE->Efuse_cfg0, APB_EFUSE->Efuse_status);
    EFUSE_WriteEfuseDataWord(APB_EFUSE, EFUSE_PROGRAMWORDCNT_2, data);
    platform_printf("cfg0: 0x%x status 0x%x \n", APB_EFUSE->Efuse_cfg0, APB_EFUSE->Efuse_status);
    SYSCTRL_ResetBlock(SYSCTRL_ITEM_APB_EFUSE);
    SYSCTRL_ReleaseBlock(SYSCTRL_ITEM_APB_EFUSE);
    
    EFUSE_SetRdFlag(APB_EFUSE);
    platform_printf("cfg0: 0x%x status 0x%x \n", APB_EFUSE->Efuse_cfg0, APB_EFUSE->Efuse_status);
    while(!EFUSE_GetDataValidFlag(APB_EFUSE));
    platform_printf("cfg0: 0x%x status 0x%x \n", APB_EFUSE->Efuse_cfg0, APB_EFUSE->Efuse_status);
    platform_printf("word 0: 0x%x \n",EFUSE_GetEfuseData(APB_EFUSE, 0));//bit 0  - 31
    platform_printf("word 1: 0x%x \n",EFUSE_GetEfuseData(APB_EFUSE, 1));//bit 32 - 63
    platform_printf("word 2: 0x%x \n",EFUSE_GetEfuseData(APB_EFUSE, 2));//bit 64 - 95
    platform_printf("word 3: 0x%x \n",EFUSE_GetEfuseData(APB_EFUSE, 3));//bit 96 - 127
    #endif
  }
}

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
    
    sem_wakeup = xSemaphoreCreateBinary();
    xTaskCreate(packet_schedule_task,
           "p",
           configMINIMAL_STACK_SIZE*10,
           NULL,
           (configMAX_PRIORITIES - 14),
           NULL);
    return 0;
}

