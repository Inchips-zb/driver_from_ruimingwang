#if 1
#include <stdio.h>
#include <string.h>
#include "profile.h"
#include "ingsoc.h"
#include "platform_api.h"
#include "FreeRTOS.h"
#include "task.h"
#include "trace.h"
#include "timers.h"

#define SPI_MASTER
void peripherals_spi_send_data(void);
void peripherals_spi_read_data(void);
void peripherals_spi_push_data(void);

#define SPI_MIC_CLK         GIO_GPIO_7
#define SPI_MIC_MOSI        GIO_GPIO_8
#define SPI_MIC_MISO        GIO_GPIO_9
#define SPI_MIC_CS          GIO_GPIO_10
#define SPI_MIC_WP          GIO_GPIO_11
#define SPI_MIC_HOLD        GIO_GPIO_12

#define SPI_DMA_TX_CHANNEL   (0)//DMA channel 0
#define SPI_DMA_RX_CHANNEL   (1)//DMA channel 1
  
#define DATA_LEN (SPI_FIFO_DEPTH * 10)

uint8_t write_data[DATA_LEN] = {0,};
uint8_t read_data[DATA_LEN] = {0,};

static uint32_t peripherals_spi_isr(void *user_data)
{
  uint32_t stat = apSSP_GetIntRawStatus(APB_SSP1), i;

  if(stat & (1 << bsSPI_INTREN_ENDINTEN))
  {
    /* check if rx fifo still have some left data */
    
    #ifdef SPI_SLAVE
    uint32_t num = apSSP_GetDataNumInRxFifo(APB_SSP1);
    peripherals_spi_read_data();
    peripherals_spi_push_data();
    #ifdef NO_SIMU
    printf("num %d %d %d", num, apSSP_GetSlaveTxDataCnt(APB_SSP1), apSSP_GetSlaveRxDataCnt(APB_SSP1));for(i=0;i<DATA_LEN;i++){printf(" 0x%x -", read_data[i]);}
    #endif
    #endif
    apSSP_ClearIntStatus(APB_SSP1, 1 << bsSPI_INTREN_ENDINTEN);
    
  }
  else if(stat & (1 << bsSPI_INTREN_RXFIFOINTEN))
  {
    /* read data out of rx fifo */
    uint32_t num = apSSP_GetDataNumInRxFifo(APB_SSP1);

    platform_printf("rx half fifo %d\n", num);
    apSSP_ClearIntStatus(APB_SSP1, 1 << bsSPI_INTREN_RXFIFOINTEN);
  }
  else if(stat & (1 << bsSPI_INTREN_TXFIFOINTEN))
  {
    /* feed more data if needed */
    platform_printf("tx half fifo \n");
    apSSP_ClearIntStatus(APB_SSP1, 1 << bsSPI_INTREN_TXFIFOINTEN);
  }
  
  #ifdef NO_SIMU
  //platform_printf("spi_isr 0x%x, status 0x%x \n", stat, apSSP_GetSpiStatus(APB_SSP1));
  #endif
  return 0;
}

void peripherals_spi_rxfifo_to_dma(int channel_id, void *dst, int size)
{
    DMA_Descriptor descriptor __attribute__((aligned (8)));

    descriptor.Next = (DMA_Descriptor *)0;
    DMA_PreparePeripheral2Mem(&descriptor,dst,SYSCTRL_DMA_SPI1_RX,size,DMA_ADDRESS_INC,0);

    DMA_EnableChannel(channel_id, &descriptor);
}

void peripherals_spi_dma_to_txfifo(int channel_id, void *src, int size)
{
    DMA_Descriptor descriptor __attribute__((aligned (8)));

    descriptor.Next = (DMA_Descriptor *)0;
    DMA_PrepareMem2Peripheral(&descriptor,SYSCTRL_DMA_SPI1_TX,src,size,DMA_ADDRESS_INC,0);

    DMA_EnableChannel(channel_id, &descriptor);
}

void peripherals_spi_push_data(void)
{
  uint32_t i;
  #ifdef SPI_MASTER
  static uint32_t data = 0x22;
  #endif
  #ifdef SPI_SLAVE
  static uint32_t data = 0x33;
  #endif
  
  memset(write_data, (++data)&0xff, sizeof(write_data));
  apSSP_SetTxDmaEn(APB_SSP1,1);
  apSSP_SetTransferControlWrTranCnt(APB_SSP1,DATA_LEN);
  
  peripherals_spi_dma_to_txfifo(SPI_DMA_TX_CHANNEL, write_data, sizeof(write_data));

}

void peripherals_spi_send_data(void)
{
  #ifdef SPI_MASTER
  uint32_t i;
  
  peripherals_spi_read_data();
  peripherals_spi_push_data();

  apSSP_WriteCmd(APB_SSP1,0,0);
  while(apSSP_GetSPIActiveStatus(APB_SSP1));

  apSSP_SetTxDmaEn(APB_SSP1,0);

  #ifdef NO_SIMU
  printf("M read: ");for(i=0;i<DATA_LEN;i++){printf(" 0x%x -", read_data[i]);}
  #endif
  #endif
}

void peripherals_spi_read_data(void)
{
    apSSP_SetRxDmaEn(APB_SSP1,1);
    apSSP_SetTransferControlRdTranCnt(APB_SSP1,DATA_LEN);
    
    peripherals_spi_rxfifo_to_dma(SPI_DMA_RX_CHANNEL, read_data, sizeof(read_data));
}

static void setup_peripherals_spi_pin(void)
{
    SYSCTRL_ClearClkGateMulti(    (1 << SYSCTRL_ITEM_APB_SPI1)
                                | (1 << SYSCTRL_ITEM_APB_SysCtrl)
                                | (1 << SYSCTRL_ITEM_APB_PinCtrl)
                                | (1 << SYSCTRL_ITEM_APB_GPIO1)
                                | (1 << SYSCTRL_ITEM_APB_GPIO0));
  
    #ifdef SPI_MASTER
    PINCTRL_SelSpiIn(SPI_PORT_1, SPI_MIC_CLK, SPI_MIC_CS, SPI_MIC_HOLD, SPI_MIC_WP, SPI_MIC_MISO, SPI_MIC_MOSI);
    PINCTRL_SetPadMux(SPI_MIC_CLK, IO_SOURCE_SPI1_CLK_OUT);
    PINCTRL_SetPadMux(SPI_MIC_CS, IO_SOURCE_SPI1_CSN_OUT);
    PINCTRL_SetPadMux(SPI_MIC_MOSI, IO_SOURCE_SPI1_MOSI_OUT);
    #endif
    #ifdef SPI_SLAVE
    PINCTRL_Pull(IO_SOURCE_SPI1_CLK_IN,PINCTRL_PULL_DOWN);
    PINCTRL_Pull(IO_SOURCE_SPI1_CSN_IN,PINCTRL_PULL_UP);
    PINCTRL_SelSpiIn(SPI_PORT_1, SPI_MIC_CLK, SPI_MIC_CS, SPI_MIC_HOLD, SPI_MIC_WP, SPI_MIC_MISO, SPI_MIC_MOSI);
    PINCTRL_SetPadMux(SPI_MIC_CLK, IO_SOURCE_SPI1_CLK_OUT);
    PINCTRL_SetPadMux(SPI_MIC_MISO, IO_SOURCE_SPI1_MISO_OUT);
    #endif
    #if 0
    #ifdef SPI_MASTER
    PINCTRL_SelSpiIn(SPI_PORT_1, SPI_MIC_CLK, SPI_MIC_CS, SPI_MIC_HOLD, SPI_MIC_WP, SPI_MIC_MISO, SPI_MIC_MOSI);
    PINCTRL_SetPadMux(SPI_MIC_CLK, IO_SOURCE_SPI1_CLK_OUT);
    PINCTRL_SetPadMux(SPI_MIC_CS, IO_SOURCE_SPI1_CSN_OUT);
    PINCTRL_SetPadMux(SPI_MIC_MOSI, IO_SOURCE_SPI1_MOSI_OUT);
    PINCTRL_SetPadMux(SPI_MIC_MISO, IO_SOURCE_SPI1_MISO_OUT);
    #endif
    #ifdef SPI_SLAVE
    #if 0
    PINCTRL_Pull(IO_SOURCE_SPI1_CSN_IN,PINCTRL_PULL_UP);
    PINCTRL_SelSpiIn(SPI_PORT_1, SPI_MIC_CLK, SPI_MIC_CS, SPI_MIC_HOLD, SPI_MIC_WP, IO_NOT_A_PIN, SPI_MIC_MOSI);
    PINCTRL_SetPadMux(SPI_MIC_MISO, IO_SOURCE_SPI1_MISO_OUT);
    #else
    PINCTRL_Pull(IO_SOURCE_SPI1_CLK_OUT,PINCTRL_PULL_DOWN);
    PINCTRL_Pull(IO_SOURCE_SPI1_CSN_OUT,PINCTRL_PULL_UP);
    PINCTRL_Pull(IO_SOURCE_SPI1_MISO_OUT,PINCTRL_PULL_UP);
    PINCTRL_Pull(IO_SOURCE_SPI1_MOSI_OUT,PINCTRL_PULL_UP);
    
    PINCTRL_Pull(IO_SOURCE_SPI1_CLK_IN,PINCTRL_PULL_DOWN);
    PINCTRL_Pull(IO_SOURCE_SPI1_CSN_IN,PINCTRL_PULL_UP);
    PINCTRL_Pull(IO_SOURCE_SPI1_MISO_IN,PINCTRL_PULL_UP);
    PINCTRL_Pull(IO_SOURCE_SPI1_MOSI_IN,PINCTRL_PULL_UP);
    
    PINCTRL_SelSpiIn(SPI_PORT_1, SPI_MIC_CLK, SPI_MIC_CS, SPI_MIC_HOLD, SPI_MIC_WP, SPI_MIC_MISO, SPI_MIC_MOSI);
    PINCTRL_SetPadMux(SPI_MIC_CLK, IO_SOURCE_SPI1_CLK_OUT);
    PINCTRL_SetPadMux(SPI_MIC_CS, IO_SOURCE_SPI1_CSN_OUT);
    PINCTRL_SetPadMux(SPI_MIC_MOSI, IO_SOURCE_SPI1_MOSI_OUT);
    PINCTRL_SetPadMux(SPI_MIC_MISO, IO_SOURCE_SPI1_MISO_OUT);
    #endif
    #endif
    #endif

    #ifdef SET_PLL
    APB_SYSCTRL->PllCtrl |= 1 << 0;//Enable pll
    while(!((APB_SYSCTRL->PllCtrl >> 30) & 0x1));
    APB_SYSCTRL->CguCfg[1] |= ((1 << 14) | (1 << 22));//sel_hclk | sel_clk_spi
    #endif
    
    platform_set_irq_callback(PLATFORM_CB_IRQ_APBSPI, peripherals_spi_isr, NULL);
    
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
    pParam.eDataSize = SPI_DATALEN_8_BITS;
    #ifdef SPI_MASTER
    pParam.eMasterSlaveMode = SPI_SLVMODE_MASTER_MODE;
    pParam.eReadWriteMode = SPI_TRANSMODE_WRITE_READ_SAME_TIME;
    #endif
    #ifdef SPI_SLAVE
    pParam.eMasterSlaveMode = SPI_SLVMODE_SLAVE_MODE;
    pParam.eReadWriteMode = SPI_TRANSMODE_WRITE_READ_SAME_TIME;
    #endif
    pParam.eQuadMode = SPI_DUALQUAD_REGULAR_MODE;
    pParam.eWriteTransCnt = DATA_LEN;
    pParam.eReadTransCnt = DATA_LEN;
    pParam.eAddrEn = SPI_ADDREN_DISABLE;
    pParam.eCmdEn = SPI_CMDEN_DISABLE;
    pParam.RxThres = 0;
    pParam.TxThres = 0;
    pParam.SlaveDataOnly = SPI_SLVDATAONLY_ENABLE;
    pParam.eAddrLen = SPI_ADDRLEN_1_BYTE;
    pParam.eInterruptMask = (1 << bsSPI_INTREN_ENDINTEN);
  
    apSSP_DeviceParametersSet(APB_SSP1, &pParam);
}


void setup_peripherals_spi(void)
{
    uint32_t SystemCoreClock, i;

    SystemCoreClock = SYSCTRL_GetHClk();
  
    setup_peripherals_spi_pin();
    setup_peripherals_spi_module();
    
    #ifdef GET_CPU_CLK
    platform_printf(" setup clk 0x%x %d \n", APB_SYSCTRL->CguCfg[1], SystemCoreClock);
    #endif
  
    SYSCTRL_ClearClkGateMulti(1 << SYSCTRL_ClkGate_APB_DMA);
    DMA_Reset(1);
    DMA_Reset(0);

    #ifdef SPI_SLAVE
    peripherals_spi_read_data();
    peripherals_spi_push_data();
    #endif
  
}

uint8_t src[0x100], dst[0x100];
void dma_simple_test(void)
{
    uint32_t i;
    memset(src, 0x33, sizeof(src));
    
    SYSCTRL_ClearClkGateMulti(1 << SYSCTRL_ClkGate_APB_DMA);
    
    DMA_Reset(1);
    DMA_Reset(0);
    
    DMA_MemCopy(0,dst,src,sizeof(dst));
    
    for(i=0;i<sizeof(dst);i++){printf(" 0x%x -", dst[i]);}
}

#endif
