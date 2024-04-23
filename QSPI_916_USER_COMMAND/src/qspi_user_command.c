#include <stdio.h>
#include <string.h>
#include "profile.h"
#include "ingsoc.h"
#include "platform_api.h"
#include "FreeRTOS.h"
#include "task.h"
#include "trace.h"
#include "timers.h"

// ============================ static definition ===============================
#define SPI_MODE_MASTER (0)
#define SPI_MODE_SLAVE (1)

#define QSPI_WRITE_ONLY_CMD (0x54)
#define QSPI_READ_ONLY_CMD (0x0E)

#define SPI_MIC_CLK         GIO_GPIO_7
#define SPI_MIC_MOSI        GIO_GPIO_8
#define SPI_MIC_MISO        GIO_GPIO_9
#define SPI_MIC_CS          GIO_GPIO_10
#define SPI_MIC_WP          GIO_GPIO_11
#define SPI_MIC_HOLD        GIO_GPIO_12

// 1 byte per uint
#define DATA_UNIT 8
// QSPI use 4 line to transfer data
#define IO_WIDTH  4
// has to be exact 8 cycle
#define DUMMY_CNT_USER_CMD  (4 / ((DATA_UNIT / IO_WIDTH)))

// ============================ user configuration ===============================
#ifndef SPI_MODE
#define SPI_MODE SPI_MODE_MASTER
//#define SPI_MODE SPI_MODE_SLAVE
#endif

#ifndef SPI_CMD
#define SPI_CMD QSPI_WRITE_ONLY_CMD
//#define SPI_CMD QSPI_READ_ONLY_CMD
#endif

//#define SPI_HIGH_SPEED

#define DATA_LEN (8)
uint32_t write_data[DATA_LEN] = {0,};
uint32_t read_data[DATA_LEN] = {0,};

// ============================ functions ===============================

static uint32_t peripherals_spi_isr(void *user_data)
{
  static uint8_t data_cnt = 0, user_cmd = 0;
  uint32_t stat = apSSP_GetIntRawStatus(AHB_SSP0), i;
  if(stat & (1 << bsSPI_INTREN_ENDINTEN))
  {
    /* check if rx fifo still have some left data */
    
    #if SPI_MODE == SPI_MODE_SLAVE
    
    #if SPI_CMD == QSPI_WRITE_ONLY_CMD
    uint32_t num = apSSP_GetDataNumInRxFifo(AHB_SSP0);
    for(i = 0; i < num; i++)
    {
      apSSP_ReadFIFO(AHB_SSP0, &read_data[i]);
    }
    printf("S(%x) read %d", user_cmd, num);for(i=0;i<num;i++){printf(" 0x%x -", read_data[i]);}printf("\n");
    #elif SPI_CMD == QSPI_READ_ONLY_CMD
    for(i = 0; i < DATA_LEN; i++)
    {
      apSSP_WriteFIFO(AHB_SSP0, data_cnt++);
    }
    #endif

    #endif
    apSSP_ClearIntStatus(AHB_SSP0, 1 << bsSPI_INTREN_ENDINTEN);
  }

  if(stat & (1 << bsSPI_INTREN_SLVCMDEN))
  {
    user_cmd = apSSP_ReadCommand(AHB_SSP0);
    apSSP_ClearIntStatus(AHB_SSP0, 1 << bsSPI_INTREN_SLVCMDEN);
  }

  return 0;
}

void peripherals_spi_send_data(void)
{
  #if SPI_MODE == SPI_MODE_MASTER
  static uint8_t cnt = 0;
  uint32_t i;
  
  memset(write_data, cnt++, sizeof(write_data));
  // addr should be disabled in user command mode
  apSSP_WriteCmd(AHB_SSP0, 0, SPI_CMD);
  
  #if SPI_CMD == QSPI_WRITE_ONLY_CMD
  for(i = 0; i < DATA_LEN; i++)
  {
    apSSP_WriteFIFO(AHB_SSP0, write_data[i]);
  }
  #endif
  
  while(apSSP_GetSPIActiveStatus(AHB_SSP0));

  #if SPI_CMD == QSPI_READ_ONLY_CMD
  uint32_t num = apSSP_GetDataNumInRxFifo(AHB_SSP0);
  for(i = 0; i < num; i++)
  {
    apSSP_ReadFIFO(AHB_SSP0, &read_data[i]);
  }

  printf("M read( cmd: %x): ",apSSP_ReadCommand(AHB_SSP0));for(i=0;i<DATA_LEN;i++){printf(" 0x%x -", read_data[i]);}printf("\n");
  #endif
  
  #endif
}

static void setup_peripherals_spi_pin(void)
{
    SYSCTRL_ClearClkGateMulti(    (1 << SYSCTRL_ITEM_AHB_SPI0)
                                | (1 << SYSCTRL_ITEM_APB_PinCtrl));

    PINCTRL_SelSpiIn(SPI_PORT_0, SPI_MIC_CLK, SPI_MIC_CS, SPI_MIC_HOLD,
                     SPI_MIC_WP, SPI_MIC_MISO, SPI_MIC_MOSI);
    PINCTRL_SetPadMux(SPI_MIC_CLK, IO_SOURCE_SPI0_CLK_OUT);
    PINCTRL_SetPadMux(SPI_MIC_CS, IO_SOURCE_SPI0_CSN_OUT);
    PINCTRL_SetPadMux(SPI_MIC_MOSI, IO_SOURCE_SPI0_MOSI_OUT);
    PINCTRL_SetPadMux(SPI_MIC_MISO, IO_SOURCE_SPI0_MISO_OUT);
    PINCTRL_SetPadMux(SPI_MIC_WP, IO_SOURCE_SPI0_WP_OUT);
    PINCTRL_SetPadMux(SPI_MIC_HOLD, IO_SOURCE_SPI0_HOLD_OUT);
    #if SPI_MODE == SPI_MODE_SLAVE
    PINCTRL_Pull(IO_SOURCE_SPI0_CLK_IN,PINCTRL_PULL_DOWN);
    PINCTRL_Pull(IO_SOURCE_SPI0_CSN_IN,PINCTRL_PULL_UP);
    #endif

    platform_set_irq_callback(PLATFORM_CB_IRQ_AHPSPI, peripherals_spi_isr, NULL);
}

uint8_t setup_peripherals_spi_0_high_speed_interface_clk(uint32_t spiClk)
{
    //for spi0 only
    uint8_t eSclkDiv = 0;
    uint32_t spiIntfClk;
    uint32_t pllClk = SYSCTRL_GetPLLClk();
    
    SYSCTRL_SelectSpiClk(SPI_PORT_0,SYSCTRL_CLK_PLL_DIV_1+1);
    
    spiIntfClk = SYSCTRL_GetClk(SYSCTRL_ITEM_AHB_SPI0);
    eSclkDiv = ((spiIntfClk/spiClk)/2)-1;

    return eSclkDiv;
}

#if (DATA_UNIT == 8) && (IO_WIDTH == 4)

#define SPI_MASTER_PARAM(DataLen) { SPI_INTERFACETIMINGSCLKDIV_DEFAULT_2M, \
SPI_CPHA_ODD_SCLK_EDGES, SPI_CPOL_SCLK_LOW_IN_IDLE_STATES, \
SPI_LSB_MOST_SIGNIFICANT_BIT_FIRST, SPI_DATALEN_8_BITS, SPI_SLVMODE_MASTER_MODE, \
SPI_TRANSMODE_DUMMY_WRITE, SPI_DUALQUAD_QUAD_IO_MODE, DataLen, DataLen, \
SPI_ADDREN_DISABLE, SPI_CMDEN_ENABLE, (1 << bsSPI_INTREN_ENDINTEN), \
SPI_FIFO_DEPTH>>1, SPI_FIFO_DEPTH>>1, SPI_SLVDATAONLY_DISABLE, SPI_ADDRLEN_1_BYTE }

#define SPI_SLAVE_PARAM(DataLen) { SPI_INTERFACETIMINGSCLKDIV_DEFAULT_2M, \
SPI_CPHA_ODD_SCLK_EDGES, SPI_CPOL_SCLK_LOW_IN_IDLE_STATES, \
SPI_LSB_MOST_SIGNIFICANT_BIT_FIRST, SPI_DATALEN_8_BITS, SPI_SLVMODE_SLAVE_MODE, \
SPI_TRANSMODE_DUMMY_READ, SPI_DUALQUAD_QUAD_IO_MODE, DataLen, DataLen, \
SPI_ADDREN_DISABLE, SPI_CMDEN_ENABLE, (1 << bsSPI_INTREN_ENDINTEN)|(1 << bsSPI_INTREN_SLVCMDEN), \
SPI_FIFO_DEPTH>>1, SPI_FIFO_DEPTH>>1, SPI_SLVDATAONLY_DISABLE, SPI_ADDRLEN_1_BYTE }

#endif

static void setup_peripherals_spi_module(void)
{

    #if SPI_MODE == SPI_MODE_MASTER
    apSSP_sDeviceControlBlock pParam = SPI_MASTER_PARAM(DATA_LEN);
    
    #if SPI_CMD == QSPI_WRITE_ONLY_CMD
    pParam.eReadWriteMode = SPI_TRANSMODE_DUMMY_WRITE;
    #elif SPI_CMD == QSPI_READ_ONLY_CMD 
    pParam.eReadWriteMode = SPI_TRANSMODE_DUMMY_READ;
    #endif

    #elif SPI_MODE == SPI_MODE_SLAVE
    apSSP_sDeviceControlBlock pParam = SPI_SLAVE_PARAM(DATA_LEN);
    
    #if SPI_CMD == QSPI_WRITE_ONLY_CMD
    pParam.eReadWriteMode = SPI_TRANSMODE_DUMMY_READ;
    #elif SPI_CMD == QSPI_READ_ONLY_CMD 
    pParam.eReadWriteMode = SPI_TRANSMODE_DUMMY_WRITE;
    #endif
    #endif
    
    #ifdef SPI_HIGH_SPEED
    pParam.eSclkDiv = setup_peripherals_spi_0_high_speed_interface_clk(21000000);
    #endif
    
    apSSP_DeviceParametersSet(AHB_SSP0, &pParam);
    apSSP_SetTransferControlDummyCnt(AHB_SSP0, DUMMY_CNT_USER_CMD);
}

void setup_peripherals_spi(void)
{
    setup_peripherals_spi_pin();
    setup_peripherals_spi_module();

    platform_printf(" setup clk %d \n", SYSCTRL_GetPLLClk());
}

