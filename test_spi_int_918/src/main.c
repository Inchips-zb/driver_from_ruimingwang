#include <stdio.h>
#include <string.h>
#include "profile.h"
#include "ingsoc.h"
#include "platform_api.h"
#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"

#define SPI_MIC_CLK         GIO_GPIO_5
#define SPI_MIC_MOSI        GIO_GPIO_6
#define SPI_MIC_MISO        GIO_GPIO_7
#define SPI_MIC_CS          GIO_GPIO_8

static TimerHandle_t app_timer = 0;
static TimerHandle_t app_timer1 = 0;

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

#define SPI_CLK_MHz         14
void SPI_Init(SSP_TypeDef *SSP_Ptr)
{
  apSSP_sDeviceControlBlock Param;

  apSSP_Initialize(SSP_Ptr);

  /* Set Device Parameters */
  Param.ClockRate        = 0;  // sspclkout = sspclk/(ClockPrescale*(ClockRate+1))
  Param.ClockPrescale    = 24;//48 / SPI_CLK_MHz;  // Must be an even number from 2 to 254, if it is 192, then clock is 24000000(24M) / (192) = 125k; if it is 2, then the clock is 12M
  Param.eSCLKPhase       = apSSP_SCLKPHASE_TRAILINGEDGE;
  Param.eSCLKPolarity    = apSSP_SCLKPOLARITY_IDLELOW;
  Param.eFrameFormat     = apSSP_FRAMEFORMAT_MOTOROLASPI;
  Param.eDataSize        = apSSP_DATASIZE_8BITS;//apSSP_DATASIZE_16BITS;apSSP_DATASIZE_8BITS// each unit is 8bit width
  Param.eLoopBackMode    = apSSP_LOOPBACKOFF;
  Param.eMasterSlaveMode = apSSP_MASTER;
  Param.eSlaveOutput     = apSSP_SLAVEOUTPUTDISABLED;
  apSSP_DeviceParametersSet(SSP_Ptr, &Param);
}

void SPI_CS_Toggle(uint8_t val)
{
  GIO_WriteValue(SPI_MIC_CS, val);
}

#define TEST_DATA_LEN (16)
uint8_t test_data[TEST_DATA_LEN];
uint32_t test_data_idx = 0;
uint8_t recv_data[TEST_DATA_LEN];
uint32_t recv_data_idx = 0;

#define TX_FIFO_HALF_EMPTY_INT (1<<3)
#define TX_FIFO_HALF_EMPTY_INT_CLAER (1<<1)
#define RX_FIFO_HALF_FULL_INT (1<<2)
#define RX_TIME_OUT_INT (1<<1)
#define RX_OVERRUN_INT (1<<0)
#define RX_OVERRUN_INT_CLAER (1<<0)
uint32_t spi0_isr(void *user_data)
{
  uint32_t status = apSSP_GetIntRawStatus(AHB_SSP0), i;
  
  // tx fifo half empty, write data
  if(status & TX_FIFO_HALF_EMPTY_INT)
  {
    for(;(test_data_idx < TEST_DATA_LEN)&&(apSSP_TxFifoNotFull(AHB_SSP0)); test_data_idx++)
    {
      apSSP_WriteFIFO(AHB_SSP0, test_data[test_data_idx]);
    }
    
    // data transmission complete, disable tx int
    if(test_data_idx == TEST_DATA_LEN)
    {
      apSSP_DeviceTransmitDisable(AHB_SSP0);
    }
    
    apSSP_ClearInt(AHB_SSP0, TX_FIFO_HALF_EMPTY_INT_CLAER);
  }
  // read received data
  if((status & RX_FIFO_HALF_FULL_INT)||(status & RX_TIME_OUT_INT)||(status & RX_OVERRUN_INT))
  {
    do
    {
      recv_data[recv_data_idx++] = apSSP_ReadFIFO(AHB_SSP0);
    }while(apSSP_RxFifoNotEmpty(AHB_SSP0));
    
    if(recv_data_idx == TEST_DATA_LEN)
    {
      apSSP_DeviceReceiveDisable(AHB_SSP0);
      #ifdef SPI_CS_MAN
      SPI_CS_Toggle(1);
      #endif
    }
  }
  if(status & RX_OVERRUN_INT)
  {
    apSSP_ClearInt(AHB_SSP0, RX_OVERRUN_INT_CLAER);
  }

  return 0;
}

void io_interf_setup_peripherals()
{
  SYSCTRL_ClearClkGateMulti((1 << SYSCTRL_ClkGate_AHB_SPI0)
                | (1 << SYSCTRL_ClkGate_APB_PinCtrl)
                | (1 << SYSCTRL_ClkGate_APB_GPIO));

  PINCTRL_Pull(SPI_MIC_MOSI, PINCTRL_PULL_DOWN);
  PINCTRL_Pull(SPI_MIC_CLK, PINCTRL_PULL_UP);
  #ifndef SPI_CS_MAN
  PINCTRL_Pull(SPI_MIC_CS, PINCTRL_PULL_UP);
  #endif
  PINCTRL_Pull(SPI_MIC_MISO, PINCTRL_PULL_UP);

  PINCTRL_SetPadMux(SPI_MIC_MOSI, IO_SOURCE_SPI0_DO);
  PINCTRL_SetPadMux(SPI_MIC_CLK, IO_SOURCE_SPI0_CLK);
  #ifndef SPI_CS_MAN
  PINCTRL_SetPadMux(SPI_MIC_CS, IO_SOURCE_SPI0_SSN);
  #else
  PINCTRL_SetPadMux(SPI_MIC_CS, IO_SOURCE_GENERAL);
  GIO_SetDirection(SPI_MIC_CS, GIO_DIR_OUTPUT);
  GIO_WriteValue(SPI_MIC_CS, 1);
  #endif
  PINCTRL_SelSpiDiIn(SPI_PORT_0, SPI_MIC_MISO);

  SPI_Init(AHB_SSP0);
  
  platform_set_irq_callback(PLATFORM_CB_IRQ_SPI0, spi0_isr, NULL);
  
}

void spi_send_data_start(void)
{
  uint32_t i;for(i=0;i<TEST_DATA_LEN;i++){test_data[i]=i;}
  
  SPI_CS_Toggle(0);
  // enbale tx int, rx int
  apSSP_DeviceTransmitEnable(AHB_SSP0);
  apSSP_DeviceReceiveEnable(AHB_SSP0);
  apSSP_DeviceEnable(AHB_SSP0);
}

static void app_timer_callback(TimerHandle_t xTimer)
{
  spi_send_data_start();
}

static void app_timer1_callback(TimerHandle_t xTimer)
{
  uint32_t i;
  platform_printf(" %d %d\n",test_data_idx, recv_data_idx);
  for(i=0;i<TEST_DATA_LEN;i++){platform_printf("- 0x%x ",recv_data[i]);}
}

void setup_peripherals(void)
{
    config_uart(OSC_CLK_FREQ, 115200);
    io_interf_setup_peripherals();
    
    // send data
    app_timer = xTimerCreate("t1",
                            pdMS_TO_TICKS(3000),
                            pdFALSE,
                            NULL,
                            app_timer_callback);
    
    // read data
    app_timer1 = xTimerCreate("t1",
                            pdMS_TO_TICKS(4000),
                            pdFALSE,
                            NULL,
                            app_timer1_callback);

    xTimerStart(app_timer, 0);
    xTimerStart(app_timer1, 0);

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
    platform_set_evt_callback(PLATFORM_CB_EVT_PUTC, (f_platform_evt_cb)cb_putc, NULL);

    setup_peripherals();
    return 0;
}

