#include <stdio.h>
#include <string.h>
#include "profile.h"
#include "ingsoc.h"
#include "platform_api.h"
#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"

static TimerHandle_t app_timer = 0;
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

#if 0
#define CHANNEL_ID  0
char src[] = "hello world!";
char dst[20];
DMA_Descriptor test __attribute__((aligned (8)));
static uint32_t DMA_cb_isr(void *user_data)
{
    uint32_t state = DMA_GetChannelIntState(CHANNEL_ID);
    DMA_ClearChannelIntState(CHANNEL_ID, state);

    printf("dst = %s\n", dst);
    return 0;
}

void DMA_Test(void)
{
    DMA_Reset(1);
    DMA_Reset(0);
    platform_set_irq_callback(PLATFORM_CB_IRQ_DMA, DMA_cb_isr, 0);
    DMA_PrepareMem2Mem(&test,
                       dst,
                       src, strlen(src),
                       DMA_ADDRESS_INC, DMA_ADDRESS_INC, 0);
    DMA_EnableChannel(CHANNEL_ID, &test);
}
#endif

#define CHANNEL_ID  0
char src[] = "hello world!";
char src1[] = "I am a chinese.";
char dst[100];
DMA_Descriptor test_0 __attribute__((aligned (8)));
DMA_Descriptor test_1 __attribute__((aligned (8)));
DMA_Descriptor test[2] __attribute__((aligned (8)));
static uint32_t DMA_cb_isr(void *user_data)
{
    uint32_t state = DMA_GetChannelIntState(CHANNEL_ID);
    DMA_ClearChannelIntState(CHANNEL_ID, state);

    printf("dst = %s\n", dst);
    return 0;
}

void DMA_Test(void)
{
    DMA_Reset(1);
    DMA_Reset(0);
    platform_set_irq_callback(PLATFORM_CB_IRQ_DMA, DMA_cb_isr, 0);
    test_0.Next = &test_1;    // make a DMA link chain
    test_1.Next = NULL;
    DMA_PrepareMem2Mem(&test_0,
                       dst,
                       src, strlen(src),
                       DMA_ADDRESS_INC, DMA_ADDRESS_INC, 0);
    DMA_PrepareMem2Mem(&test_1,
                       dst + strlen(src),
                       src1, sizeof(src1),
                       DMA_ADDRESS_INC, DMA_ADDRESS_INC, 0);
    
    platform_printf("0x30: 0x%x %d 0x%x 0x%x\n",APB_DMA->IntStatus, sizeof(DMA_Descriptor), &test[0], &test[1]);
    DMA_EnableChannel(CHANNEL_ID, &test_0);
}

static void app_timer_callback(TimerHandle_t xTimer)
{
    DMA_Test();
    platform_printf("tx send. \n");
}


void setup_peripherals(void)
{
    config_uart(OSC_CLK_FREQ, 115200);
    
    SYSCTRL_ClearClkGateMulti(0
                            | (1 << SYSCTRL_ClkGate_APB_DMA));
    app_timer = xTimerCreate("a",
                            pdMS_TO_TICKS(1000),
                            pdFALSE,
                            NULL,
                            app_timer_callback);
    xTimerStart(app_timer, portMAX_DELAY);
    platform_printf("setup. \n");
}

static void watchdog_task(void *pdata)
{
    for (;;)
    {
        vTaskDelay(pdMS_TO_TICKS(9000));
        TMR_WatchDogRestart();
    }
}


int app_main()
{
    //platform_set_evt_callback(PLATFORM_CB_EVT_PROFILE_INIT, setup_profile, NULL);

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
    return 0;
}

