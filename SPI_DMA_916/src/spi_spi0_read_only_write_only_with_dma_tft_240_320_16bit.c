#ifdef SPI0_RW_ONLY_W_DMA_TFT
#include <stdio.h>
#include <string.h>
#include "profile.h"
#include "ingsoc.h"
#include "platform_api.h"
#include "FreeRTOS.h"
#include "task.h"
#include "trace.h"
#include "timers.h"
#include "screen.h"

void peripherals_spi_read_data(void);
void peripherals_spi_send_data_trigger(void);
void peripherals_spi_send_data(uint8_t flag);

#define SPI_DMA_TX_CHANNEL   (0)//DMA channel 0
  
#define SPI_MIC_CLK         GIO_GPIO_19
#define SPI_MIC_MOSI        GIO_GPIO_28
#define SPI_MIC_MISO        GIO_GPIO_27
#define SPI_MIC_CS          GIO_GPIO_18
#define SPI_MIC_WP          GIO_GPIO_26
#define SPI_MIC_HOLD        GIO_GPIO_20

typedef struct
{
  uint16_t *screen_data;//a pointer point to flash addr
  uint32_t screen_data_size_byte;//240*320*16 bit
  uint32_t screen_data_size_u16;//240*320
  uint32_t spi_transfer_cnt;//from 0 to 150
  uint16_t spi_max_per_transfer;//max 512
}app_screen_info_s;

#define DATA_LEN_U16 (240*320)
#define DATA_LEN_BYTE (240*320*2)
#define DATA_LEN_CNT_MAX_FOR_SPI (512)

app_screen_info_s screen_info;

static uint32_t peripherals_spi_isr(void *user_data)
{
  uint32_t stat = apSSP_GetIntRawStatus(AHB_SSP0), i, write_cnt;
  static uint32_t cnt = 0;
  if(stat & (1 << bsSPI_INTREN_ENDINTEN))
  {
    apSSP_ClearIntStatus(AHB_SSP0, 1 << bsSPI_INTREN_ENDINTEN);
    
    if(screen_info.spi_transfer_cnt < DATA_LEN_U16)
      peripherals_spi_send_data_trigger();
    else
    {
      if(cnt<1){peripherals_spi_send_data(0);cnt++;}
    }
  }
  else if(stat & (1 << bsSPI_INTREN_RXFIFOINTEN))
  {
    /* read data out of rx fifo */
    uint32_t num = apSSP_GetDataNumInRxFifo(AHB_SSP0);

    platform_printf("rx half fifo %d\n", num);
    apSSP_ClearIntStatus(AHB_SSP0, 1 << bsSPI_INTREN_RXFIFOINTEN);
  }
  else if(stat & (1 << bsSPI_INTREN_TXFIFOINTEN))
  {
    /* feed more data if needed */
    platform_printf("tx half fifo \n");
    apSSP_ClearIntStatus(AHB_SSP0, 1 << bsSPI_INTREN_TXFIFOINTEN);
  }
  
  #ifdef NO_SIMU
  //platform_printf("spi_isr 0x%x \n", stat);
  #endif
  return 0;
}

void peripherals_spi_rxfifo_to_dma(int channel_id, void *dst, int size)
{
    DMA_Descriptor descriptor __attribute__((aligned (8)));

    descriptor.Next = (DMA_Descriptor *)0;
    DMA_PreparePeripheral2Mem(&descriptor,dst,SYSCTRL_DMA_SPI0_RX,size,DMA_ADDRESS_INC,0);

    DMA_EnableChannel(channel_id, &descriptor);
}

DMA_Descriptor descriptor __attribute__((aligned (8)));
void peripherals_spi_dma_to_txfifo(int channel_id, void *src, int size)
{
    
    descriptor.Next = (DMA_Descriptor *)0;
    DMA_PrepareMem2Peripheral(&descriptor,SYSCTRL_DMA_SPI0_TX,src,size,DMA_ADDRESS_INC,0);

    DMA_EnableChannel(channel_id, &descriptor);
}

void peripherals_spi_dma_to_txfifo_trigger(int channel_id)
{
    DMA_EnableChannel(channel_id, &descriptor);
}

void peripherals_spi_send_data_trigger(void)
{
  uint16_t write_cnt;

  write_cnt = ((DATA_LEN_U16 - screen_info.spi_transfer_cnt) > DATA_LEN_CNT_MAX_FOR_SPI) ?
                  DATA_LEN_CNT_MAX_FOR_SPI : (DATA_LEN_U16 - screen_info.spi_transfer_cnt);
                  
  apSSP_SetTransferControlWrTranCnt(AHB_SSP0,write_cnt);
  apSSP_WriteCmd(AHB_SSP0,0,0);
  
  screen_info.spi_transfer_cnt += write_cnt;
}

void peripherals_spi_send_data(uint8_t flag)
{
  #ifdef SPI_MASTER
  
  if(flag == 1)//first time to setup dma, take 16us
  {
    apSSP_SetTxDmaEn(AHB_SSP0,1);
    peripherals_spi_dma_to_txfifo(SPI_DMA_TX_CHANNEL, screen_info.screen_data, DATA_LEN_BYTE);
  }
  else//not the first time, take 6us
  {
    //no need to enable spi dma again
    //no need to generate dma param again
    peripherals_spi_dma_to_txfifo_trigger(SPI_DMA_TX_CHANNEL);
  }
  
  screen_info.spi_transfer_cnt = 0;//reset cnt number to 0, each transfer is 512 spi unit
  peripherals_spi_send_data_trigger();

  #ifdef NO_SIMU
  platform_printf("master write %d\n", flag);
  #endif
  #endif
}

static void setup_peripherals_spi_pin(void)
{
    SYSCTRL_ClearClkGateMulti(    (1 << SYSCTRL_ITEM_AHB_SPI0)
                                | (1 << SYSCTRL_ITEM_APB_SPI1)
                                | (1 << SYSCTRL_ITEM_APB_SysCtrl)
                                | (1 << SYSCTRL_ITEM_APB_PinCtrl)
                                | (1 << SYSCTRL_ITEM_APB_GPIO1)
                                | (1 << SYSCTRL_ITEM_APB_GPIO0));

    #if 1
    #ifdef SPI_MASTER
    PINCTRL_SelSpiIn(SPI_PORT_0, SPI_MIC_CLK, SPI_MIC_CS, SPI_MIC_HOLD, SPI_MIC_WP, SPI_MIC_MISO, SPI_MIC_MOSI);
    PINCTRL_SetPadMux(SPI_MIC_CLK, IO_SOURCE_SPI0_CLK_OUT);
    PINCTRL_SetPadMux(SPI_MIC_CS, IO_SOURCE_SPI0_CSN_OUT);
    PINCTRL_SetPadMux(SPI_MIC_MOSI, IO_SOURCE_SPI0_MOSI_OUT);
    PINCTRL_SetPadMux(SPI_MIC_MISO, IO_SOURCE_SPI0_MISO_OUT);
    PINCTRL_SetPadMux(SPI_MIC_WP, IO_SOURCE_SPI0_WP_OUT);
    PINCTRL_SetPadMux(SPI_MIC_HOLD, IO_SOURCE_SPI0_HOLD_OUT);
    #endif
    #endif

    platform_set_irq_callback(PLATFORM_CB_IRQ_AHPSPI, peripherals_spi_isr, NULL);
    
}

uint8_t setup_peripherals_spi_0_high_speed_interface_clk(uint32_t spiClk)
{
    //for spi0 only
    uint8_t eSclkDiv = 0;
    uint32_t spiIntfClk;
    //1. check pll clock
    uint32_t pllClk = SYSCTRL_GetPLLClk();
    SYSCTRL_SelectSpiClk(SPI_PORT_0,SYSCTRL_CLK_HCLK+1);
    
    spiIntfClk = SYSCTRL_GetClk(SYSCTRL_ITEM_AHB_SPI0);
    eSclkDiv = ((spiIntfClk/spiClk)/2)-1;
    
    platform_printf("clk %d %d %d \n",pllClk,spiIntfClk,eSclkDiv);
    return eSclkDiv;
}

static void setup_peripherals_spi_module(void)
{
    apSSP_sDeviceControlBlock pParam;
    #ifdef SET_PLL_V1
    pParam.eSclkDiv = setup_peripherals_spi_0_high_speed_interface_clk(21000000);//84/(2*(0+1)) = 42M
    #else
    pParam.eSclkDiv = SPI_INTERFACETIMINGSCLKDIV_DEFAULT_2M;
    #endif//;
    pParam.eSCLKPolarity = SPI_CPOL_SCLK_LOW_IN_IDLE_STATES;
    pParam.eSCLKPhase = SPI_CPHA_ODD_SCLK_EDGES;
    pParam.eLsbMsbOrder = SPI_LSB_MOST_SIGNIFICANT_BIT_FIRST;
    pParam.eDataSize = SPI_DATALEN_16_BITS;
    #ifdef SPI_MASTER
    pParam.eMasterSlaveMode = SPI_SLVMODE_MASTER_MODE;
    pParam.eReadWriteMode = SPI_TRANSMODE_WRITE_ONLY;
    #endif
    #ifdef SPI_SLAVE
    pParam.eMasterSlaveMode = SPI_SLVMODE_SLAVE_MODE;
    pParam.eReadWriteMode = SPI_TRANSMODE_READ_ONLY;
    #endif
    pParam.eQuadMode = SPI_DUALQUAD_REGULAR_MODE;
    pParam.eWriteTransCnt = 512;//DATA_LEN;
    pParam.eReadTransCnt = 512;//DATA_LEN;// has to be same with eWriteTransCnt
    pParam.eAddrEn = SPI_ADDREN_DISABLE;
    pParam.eCmdEn = SPI_CMDEN_DISABLE;
    pParam.RxThres = 0;
    pParam.TxThres = 0;
    pParam.SlaveDataOnly = SPI_SLVDATAONLY_ENABLE;
    pParam.eAddrLen = SPI_ADDRLEN_1_BYTE;
    pParam.eInterruptMask = (1 << bsSPI_INTREN_ENDINTEN);
  
    #ifdef QUAD
    pParam.eQuadMode = SPI_DUALQUAD_QUAD_IO_MODE;
    pParam.SlaveDataOnly = SPI_SLVDATAONLY_DISABLE;
    pParam.eAddrEn = SPI_ADDREN_ENABLE;
    pParam.eCmdEn = SPI_CMDEN_ENABLE;
    #ifdef SPI_MASTER
    pParam.eReadWriteMode = SPI_TRANSMODE_DUMMY_WRITE;
    #endif
    #ifdef SPI_SLAVE
    pParam.eReadWriteMode = SPI_TRANSMODE_DUMMY_READ;
    #endif
    #endif
    
    apSSP_DeviceParametersSet(AHB_SSP0, &pParam);
}

static uint32_t DMA_cb_isr(void *user_data)
{
    uint32_t state = DMA_GetChannelIntState(SPI_DMA_TX_CHANNEL);
    DMA_ClearChannelIntState(SPI_DMA_TX_CHANNEL, state);

    platform_printf("dma done \n");
    return 0;
}

static void setup_peripherals_dma_module(void)
{
    SYSCTRL_ClearClkGateMulti(1 << SYSCTRL_ClkGate_APB_DMA);
    DMA_Reset(1);
    DMA_Reset(0);
}

void setup_peripherals_spi(void)
{
    uint32_t SystemCoreClock, i;

    SystemCoreClock = SYSCTRL_GetHClk();
  
    setup_peripherals_spi_pin();
    setup_peripherals_spi_module();
    
    #ifdef GET_CPU_CLK
    platform_printf(" setup clk %d %d\n", SystemCoreClock, SYSCTRL_GetPLLClk());
    #endif
  
    setup_peripherals_dma_module();
  
    screen_info.screen_data = (uint16_t*)screen;
    screen_info.screen_data_size_byte = DATA_LEN_BYTE;
    screen_info.screen_data_size_u16 = DATA_LEN_U16;
    
    screen_info.spi_max_per_transfer = DATA_LEN_CNT_MAX_FOR_SPI;//fixed, 9bit
    screen_info.spi_transfer_cnt = (screen_info.screen_data_size_u16)/(screen_info.spi_max_per_transfer);
    
    platform_printf("setup done. \n");
}

#endif
