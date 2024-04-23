#ifdef SPI0_RW_WO_DMA
#include <stdio.h>
#include <string.h>
#include "profile.h"
#include "ingsoc.h"
#include "platform_api.h"
#include "FreeRTOS.h"
#include "task.h"
#include "trace.h"
#include "timers.h"

void peripherals_spi_send_data(void);

#define SPI_MIC_CLK         GIO_GPIO_9
#define SPI_MIC_MOSI        GIO_GPIO_11
#define SPI_MIC_MISO        GIO_GPIO_12
#define SPI_MIC_CS          GIO_GPIO_13
#define SPI_MIC_WP          GIO_GPIO_14
#define SPI_MIC_HOLD        GIO_GPIO_15
static uint32_t spi_flag = 0;

//(SPI_FIFO_DEPTH)
#define DATA_LEN (1)
#ifdef SPI_MASTER
uint32_t write_data[DATA_LEN] = {0,};
#endif
#ifdef SPI_SLAVE
uint32_t write_data[DATA_LEN] = {0,};
#endif
uint32_t read_data[DATA_LEN] = {0,};

static uint32_t peripherals_spi_isr(void *user_data)
{
  uint32_t stat = apSSP_GetIntRawStatus(AHB_SSP0), i;
  static uint32_t data = 0x23232323;
  if(stat & (1 << bsSPI_INTREN_ENDINTEN))
  {
    /* check if rx fifo still have some left data */
    
    #ifdef SPI_SLAVE
    uint32_t num = apSSP_GetDataNumInRxFifo(AHB_SSP0);
    for(i = 0; i < num; i++)
    {
      apSSP_ReadFIFO(AHB_SSP0, &read_data[i]);
    }

    write_data[0] = ++data;
    for(i = 0; i < DATA_LEN; i++)
    {
      apSSP_WriteFIFO(AHB_SSP0, write_data[i]);
    }
    #ifdef NO_SIMU
    platform_printf("slave read data(%d)(%d)(%d) 0x%x \n", num, apSSP_GetSlaveTxDataCnt(AHB_SSP0),
    apSSP_GetSlaveRxDataCnt(AHB_SSP0),read_data[0]);
    #endif
    #endif
    apSSP_ClearIntStatus(AHB_SSP0, 1 << bsSPI_INTREN_ENDINTEN);
    
  }
  else if(stat & (1 << bsSPI_INTREN_RXFIFOINTEN))
  {
    /* read data out of rx fifo */
    uint32_t num = apSSP_GetDataNumInRxFifo(AHB_SSP0);

    platform_printf("rx fifo int %d\n", num);
    apSSP_ClearIntStatus(AHB_SSP0, 1 << bsSPI_INTREN_RXFIFOINTEN);
  }
  else if(stat & (1 << bsSPI_INTREN_TXFIFOINTEN))
  {
    /* feed more data if needed */
    platform_printf("tx fifo int \n");
    apSSP_ClearIntStatus(AHB_SSP0, 1 << bsSPI_INTREN_TXFIFOINTEN);
  }
  
  #ifdef NO_SIMU
  //platform_printf("spi_isr 0x%x, status 0x%x \n", stat, apSSP_GetSpiStatus(AHB_SSP0));
  #endif
  return 0;
}

void delay(int32_t cnt)
{
  while(--cnt){;}
}

void peripherals_spi_send_data(void)
{
  #ifdef SPI_MASTER
  uint32_t i;
  static uint32_t data = 0x14121212;

  write_data[0] = ++data;
  #ifdef CS_MANUAL
    GIO_WriteValue(SPI_MIC_CS, 0);
  #endif
  apSSP_WriteCmd(AHB_SSP0, 0x00, 0x00);//trigger transfer
  for(i = 0; i < DATA_LEN; i++)
  {
    apSSP_WriteFIFO(AHB_SSP0, write_data[i]);
  }
  #ifdef CS_MANUAL
    delay(300);
    GIO_WriteValue(SPI_MIC_CS, 1);
  #endif
  #if 1
  while(apSSP_GetSpiActive(AHB_SSP0));
  uint32_t num = apSSP_GetDataNumInRxFifo(AHB_SSP0);
  for(i = 0; i < num; i++)
  {
    apSSP_ReadFIFO(AHB_SSP0, &read_data[i]);
  }
  #ifdef NO_SIMU
  platform_printf("master read data(%d) 0x%x \n", num, read_data[0]);
  #endif
  #endif
  #endif
}

static void setup_peripherals_spi_pin(void)
{
    SYSCTRL_ClearClkGateMulti(    (1 << SYSCTRL_ITEM_AHB_SPI0)
                                | (1 << SYSCTRL_ITEM_APB_SysCtrl)
                                | (1 << SYSCTRL_ITEM_APB_PinCtrl)
                                | (1 << SYSCTRL_ITEM_APB_GPIO1)
                                | (1 << SYSCTRL_ITEM_APB_GPIO0));
  
    #ifdef SPI_MASTER
    PINCTRL_Pull(IO_SOURCE_SPI0_CLK_OUT,PINCTRL_PULL_DOWN);
    PINCTRL_Pull(IO_SOURCE_SPI0_CSN_OUT,PINCTRL_PULL_UP);
    PINCTRL_Pull(IO_SOURCE_SPI0_MISO_OUT,PINCTRL_PULL_UP);
    PINCTRL_Pull(IO_SOURCE_SPI0_MOSI_OUT,PINCTRL_PULL_UP);

    PINCTRL_Pull(IO_SOURCE_SPI0_CLK_IN,PINCTRL_PULL_DOWN);
    PINCTRL_Pull(IO_SOURCE_SPI0_CSN_IN,PINCTRL_PULL_UP);
    PINCTRL_Pull(IO_SOURCE_SPI0_MISO_IN,PINCTRL_PULL_UP);
    PINCTRL_Pull(IO_SOURCE_SPI0_MOSI_IN,PINCTRL_PULL_UP);
    #endif
    #ifdef SPI_SLAVE
    PINCTRL_Pull(IO_SOURCE_SPI0_CLK_OUT,PINCTRL_PULL_DOWN);
    //PINCTRL_Pull(IO_SOURCE_SPI0_CSN_OUT,PINCTRL_PULL_UP);
    PINCTRL_Pull(IO_SOURCE_SPI0_MISO_OUT,PINCTRL_PULL_UP);
    PINCTRL_Pull(IO_SOURCE_SPI0_MOSI_OUT,PINCTRL_PULL_UP);

    PINCTRL_Pull(IO_SOURCE_SPI0_CLK_IN,PINCTRL_PULL_DOWN);
    PINCTRL_Pull(IO_SOURCE_SPI0_CSN_IN,PINCTRL_PULL_UP);
    PINCTRL_Pull(IO_SOURCE_SPI0_MISO_IN,PINCTRL_PULL_UP);
    PINCTRL_Pull(IO_SOURCE_SPI0_MOSI_IN,PINCTRL_PULL_UP);
    #endif
    
    #ifdef CS_MANUAL
    PINCTRL_SetPadMux(SPI_MIC_CS, IO_SOURCE_GENERAL);
    GIO_SetDirection(SPI_MIC_CS, GIO_DIR_OUTPUT);
    GIO_WriteValue(SPI_MIC_CS, 1);
    PINCTRL_SelSpiIn(SPI_PORT_0, SPI_MIC_CLK, IO_NOT_A_PIN, IO_NOT_A_PIN, IO_NOT_A_PIN, SPI_MIC_MISO, SPI_MIC_MOSI);
    PINCTRL_SetPadMux(SPI_MIC_CLK, IO_SOURCE_SPI0_CLK_OUT);
    PINCTRL_SetPadMux(SPI_MIC_MOSI, IO_SOURCE_SPI0_MOSI_OUT);
    PINCTRL_SetPadMux(SPI_MIC_MISO, IO_SOURCE_SPI0_MISO_OUT);
    #else
    PINCTRL_SelSpiIn(SPI_PORT_0, SPI_MIC_CLK, SPI_MIC_CS, SPI_MIC_HOLD, SPI_MIC_WP, SPI_MIC_MISO, SPI_MIC_MOSI);
    PINCTRL_SetPadMux(SPI_MIC_CLK, IO_SOURCE_SPI0_CLK_OUT);
    PINCTRL_SetPadMux(SPI_MIC_CS, IO_SOURCE_SPI0_CSN_OUT);
    PINCTRL_SetPadMux(SPI_MIC_MOSI, IO_SOURCE_SPI0_MOSI_OUT);
    PINCTRL_SetPadMux(SPI_MIC_MISO, IO_SOURCE_SPI0_MISO_OUT);
    #endif

    #ifdef SPI_SLAVE
    #ifdef INTERNAL_CS_DEBUG_BUS_GPIO10
    PINCTRL_SetPadMux(GIO_GPIO_10, IO_SOURCE_DEBUG_BUS);
    *(uint32_t*)(APB_SYSCTRL_BASE+0x190) = ((1 << 6) | (12 << 7));
    #endif
    #ifdef INTERNAL_CLK_DEBUG_BUS_GPIO11
    PINCTRL_SetPadMux(GIO_GPIO_11, IO_SOURCE_DEBUG_BUS);
    *(uint32_t*)(APB_SYSCTRL_BASE+0x190) = ((1 << 6) | (13 << 7));
    #endif
    #ifdef INTERNAL_CS_DEBUG_BUS_GPIO10_28
    PINCTRL_SetPadMux(GIO_GPIO_10, IO_SOURCE_DEBUG_BUS);
    PINCTRL_SetPadMux(GIO_GPIO_28, IO_SOURCE_DEBUG_BUS);
    *(uint32_t*)(APB_SYSCTRL_BASE+0x190) = ((1 << 6) | (12 << 7) | (20 << 12));
    #endif
    #endif

    #ifdef SET_PLL
    APB_SYSCTRL->PllCtrl |= 1 << 0;//Enable pll
    while(!((APB_SYSCTRL->PllCtrl >> 30) & 0x1));
    APB_SYSCTRL->CguCfg[1] |= ((1 << 14) | (1 << 22));//sel_hclk | sel_clk_spi
    #endif
    
    platform_set_irq_callback(PLATFORM_CB_IRQ_QSPI, peripherals_spi_isr, NULL);
    
    #ifdef NO_SIMU
    //platform_printf("APB_PINCTRL->IN_CTRL 0x%x 0x%x 0x%x \n", APB_PINCTRL->IN_CTRL[0],APB_PINCTRL->IN_CTRL[1],APB_PINCTRL->IN_CTRL[2]);
    //platform_printf("APB_PINCTRL->OUT_CTRL 0x%x 0x%x 0x%x 0x%x \n", APB_PINCTRL->OUT_CTRL[0],APB_PINCTRL->OUT_CTRL[1],APB_PINCTRL->OUT_CTRL[2],APB_PINCTRL->OUT_CTRL[3]);
    #endif
}

static void setup_peripherals_spi_module(void)
{
    apSSP_sDeviceControlBlock pParam;
    pParam.eSclkDiv = SPI_INTERFACETIMINGSCLKDIV_DEFAULT_2M;
    pParam.eSCLKPolarity = SPI_CPOL_SCLK_LOW_IN_IDLE_STATES;
    pParam.eSCLKPhase = SPI_CPHA_ODD_SCLK_EDGES;
    pParam.eLsbMsbOrder = SPI_LSB_MOST_SIGNIFICANT_BIT_FIRST;
    pParam.eDataSize = SPI_DATALEN_32_BITS;
    #ifdef SPI_MASTER
    pParam.eMasterSlaveMode = SPI_SLVMODE_MASTER_MODE;
    #endif
    #ifdef SPI_SLAVE
    pParam.eMasterSlaveMode = SPI_SLVMODE_SLAVE_MODE;
    #endif
    pParam.eReadWriteMode = SPI_TRANSMODE_WRITE_READ_SAME_TIME;
    pParam.eQuadMode = SPI_DUALQUAD_REGULAR_MODE;
    pParam.eWriteTransCnt = DATA_LEN;
    pParam.eReadTransCnt = DATA_LEN;
    pParam.eAddrEn = SPI_ADDREN_DISABLE;
    pParam.eCmdEn = SPI_CMDEN_DISABLE;
    pParam.RxThres = DATA_LEN/2;
    pParam.TxThres = DATA_LEN/2;
    pParam.SlaveDataOnly = SPI_SLVDATAONLY_ENABLE;
    pParam.eAddrLen = SPI_ADDRLEN_1_BYTE;
    pParam.eInterruptMask = (1 << bsSPI_INTREN_ENDINTEN);
  
    spi_MasterTransferFormatSetup(AHB_SSP0, &pParam);
}


void setup_peripherals_spi(void)
{
    uint32_t SystemCoreClock, i;

    SystemCoreClock = SYSCTRL_GetHClk();
  
    setup_peripherals_spi_pin();
    setup_peripherals_spi_module();
  
    #ifdef SPI_SLAVE
    for(i = 0; i < DATA_LEN; i++)
    {
      apSSP_WriteFIFO(AHB_SSP0, write_data[i]);
    }
    #endif
    
    #ifdef GET_CPU_CLK
    platform_printf(" setup clk 0x%x %d \n", APB_SYSCTRL->CguCfg[1], SystemCoreClock);
    #endif
}



#endif
