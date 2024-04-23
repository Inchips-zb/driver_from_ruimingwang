#ifdef SPI_RW_ONLY_W_DMA_TFT
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

void peripherals_spi_send_data(void);
void peripherals_spi_read_data(void);
void peripherals_spi_send_data_trigger(void);

#define SPI_DMA_TX_CHANNEL   (0)//DMA channel 0
  
#ifdef A_PACKAGE
/*in: clk 0xa,  cs 0xd, miso 0xc, mosi 0xb, hold 0x13, wp 0x12*/
#define SPI_MIC_CLK         GIO_GPIO_10/* out: 9 */
#define SPI_MIC_MOSI        GIO_GPIO_11/* out: 0xc */
#define SPI_MIC_MISO        GIO_GPIO_12/* out: 0xb */
#define SPI_MIC_CS          GIO_GPIO_13/* out: 0xa *//* out: 0x6 */
#define SPI_MIC_WP          GIO_GPIO_21/* out: 0xe */
#define SPI_MIC_HOLD        GIO_GPIO_22/* out: 0xd */
#else
#define SPI_MIC_CLK         GIO_GPIO_7
#define SPI_MIC_MOSI        GIO_GPIO_8
#define SPI_MIC_MISO        GIO_GPIO_9
#define SPI_MIC_CS          GIO_GPIO_10
#define SPI_MIC_WP          GIO_GPIO_11
#define SPI_MIC_HOLD        GIO_GPIO_12
#endif

//#define DATA_LEN (SPI_FIFO_DEPTH * 10)
#define DATA_LEN_U16 (240*320)
#define DATA_LEN_BYTE (240*320*2)
#define DATA_LEN_CNT_MAX_FOR_SPI (512)

#ifdef SPI_MASTER
uint16_t *write_data;
uint32_t write_data_cnt = 0;
#endif
#ifdef SPI_SLAVE
uint32_t write_data[DATA_LEN] = {0x23232323,0x12345678,0x12345678,0x12345678,0xffffffff,0xffffffff,0xffffffff,0xffffffff};
uint32_t read_data[DATA_LEN] = {3,3,3,3,3,3,3,3};
#endif

static uint32_t peripherals_spi_isr(void *user_data)
{
  uint32_t stat = apSSP_GetIntRawStatus(APB_SSP1), i, write_cnt;

  if(stat & (1 << bsSPI_INTREN_ENDINTEN))
  {
    /* check if rx fifo still have some left data */
    
    #ifdef SPI_SLAVE
    uint32_t num = apSSP_GetDataNumInRxFifo(APB_SSP1);
    peripherals_spi_read_data();
    #ifdef NO_SIMU
    printf("num %d %d %d", num, apSSP_GetSlaveTxDataCnt(APB_SSP1), apSSP_GetSlaveRxDataCnt(APB_SSP1));for(i=0;i<DATA_LEN;i++){printf(" 0x%x -", read_data[i]);}
    #endif
    #endif
    apSSP_ClearIntStatus(APB_SSP1, 1 << bsSPI_INTREN_ENDINTEN);
    peripherals_spi_send_data_trigger();
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
  //platform_printf("spi_isr 0x%x \n", stat);
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

void peripherals_spi_send_data_trigger(void)
{
  uint16_t write_cnt;
  static uint16_t cnt = 0;
  
  if(write_data_cnt < DATA_LEN_U16)
  {
    write_cnt = ((DATA_LEN_U16 - write_data_cnt) > DATA_LEN_CNT_MAX_FOR_SPI) ?
                    DATA_LEN_CNT_MAX_FOR_SPI : (DATA_LEN_U16 - write_data_cnt);
                    
    apSSP_SetTransferControlWrTranCnt(APB_SSP1,write_cnt);
    apSSP_WriteCmd(APB_SSP1,0,0);
    
    write_data_cnt += write_cnt;
    //platform_printf("AA %d %d\n",write_cnt,write_data_cnt);
  }
  #if 1
  else
  {
    //apSSP_SetTxDmaEn(APB_SSP1,0);
    if(cnt < 1)
    peripherals_spi_send_data();
    cnt++;
    //platform_printf("master write done.%d %d\n",write_cnt,write_data_cnt);
  }
  #endif
}

void peripherals_spi_send_data(void)
{
  #ifdef SPI_MASTER
  
  write_data_cnt = 0;

//  platform_printf("B: 0x%x 0x%x 0x%x 0x%x 0x%x\n",APB_DMA->Channels[SPI_DMA_TX_CHANNEL].Descriptor.Ctrl,
//  APB_DMA->Channels[SPI_DMA_TX_CHANNEL].Descriptor.DstAddr,
//  APB_DMA->Channels[SPI_DMA_TX_CHANNEL].Descriptor.Next,
//  APB_DMA->Channels[SPI_DMA_TX_CHANNEL].Descriptor.SrcAddr,
//  APB_DMA->Channels[SPI_DMA_TX_CHANNEL].Descriptor.TranSize);
  
  apSSP_SetTxDmaEn(APB_SSP1,1);
  peripherals_spi_dma_to_txfifo(SPI_DMA_TX_CHANNEL, write_data, DATA_LEN_BYTE);
  
  peripherals_spi_send_data_trigger();

  #ifdef NO_SIMU
  //platform_printf("master write done 0x%x \n", data);
  #endif
  #endif
}

void peripherals_spi_read_data(void)
{
    #ifdef SPI_SLAVE
    apSSP_SetRxDmaEn(APB_SSP1,1);
    apSSP_SetTransferControlRdTranCnt(APB_SSP1,DATA_LEN);
    
    #define SPI_DMA_RX_CHANNEL   (0)//DMA channel 0
    peripherals_spi_rxfifo_to_dma(SPI_DMA_RX_CHANNEL, read_data, sizeof(read_data));
    #endif
}

static void setup_peripherals_spi_pin(void)
{
    SYSCTRL_ClearClkGateMulti(    (1 << SYSCTRL_ITEM_APB_SPI1)
                                | (1 << SYSCTRL_ITEM_APB_SysCtrl)
                                | (1 << SYSCTRL_ITEM_APB_PinCtrl)
                                | (1 << SYSCTRL_ITEM_APB_GPIO1)
                                | (1 << SYSCTRL_ITEM_APB_GPIO0));
  
    #if 0
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
    
    #if 0
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
    
    #if 1
    #ifdef SPI_MASTER
    PINCTRL_SelSpiIn(SPI_PORT_1, SPI_MIC_CLK, SPI_MIC_CS, SPI_MIC_HOLD, SPI_MIC_WP, SPI_MIC_MISO, SPI_MIC_MOSI);
    PINCTRL_SetPadMux(SPI_MIC_CLK, IO_SOURCE_SPI1_CLK_OUT);
    PINCTRL_SetPadMux(SPI_MIC_CS, IO_SOURCE_SPI1_CSN_OUT);
    PINCTRL_SetPadMux(SPI_MIC_MOSI, IO_SOURCE_SPI1_MOSI_OUT);
    PINCTRL_SetPadMux(SPI_MIC_MISO, IO_SOURCE_SPI1_MISO_OUT);
    PINCTRL_SetPadMux(SPI_MIC_WP, IO_SOURCE_SPI1_WP_OUT);
    PINCTRL_SetPadMux(SPI_MIC_HOLD, IO_SOURCE_SPI1_HOLD_OUT);
    #endif
    #ifdef SPI_SLAVE
    PINCTRL_Pull(IO_SOURCE_SPI1_CLK_IN,PINCTRL_PULL_DOWN);
    PINCTRL_Pull(IO_SOURCE_SPI1_CSN_IN,PINCTRL_PULL_UP);
    PINCTRL_SelSpiIn(SPI_PORT_1, SPI_MIC_CLK, SPI_MIC_CS, SPI_MIC_HOLD, SPI_MIC_WP, SPI_MIC_MISO, SPI_MIC_MOSI);
    PINCTRL_SetPadMux(SPI_MIC_CLK, IO_SOURCE_SPI1_CLK_OUT);
    PINCTRL_SetPadMux(SPI_MIC_CS, IO_SOURCE_SPI1_CSN_OUT);
    PINCTRL_SetPadMux(SPI_MIC_MOSI, IO_SOURCE_SPI1_MOSI_OUT);
    PINCTRL_SetPadMux(SPI_MIC_MISO, IO_SOURCE_SPI1_MISO_OUT);
    PINCTRL_SetPadMux(SPI_MIC_WP, IO_SOURCE_SPI1_WP_OUT);
    PINCTRL_SetPadMux(SPI_MIC_HOLD, IO_SOURCE_SPI1_HOLD_OUT);
    #endif
    #endif

    #ifdef SET_PLL
    APB_SYSCTRL->PllCtrl |= 1 << 0;//Enable pll
    while(!((APB_SYSCTRL->PllCtrl >> 30) & 0x1));
    APB_SYSCTRL->CguCfg[1] |= ((1 << 14) | (1 << 22));//sel_hclk | sel_clk_spi
    #endif
    
    #ifdef SET_PLL_V1
    SYSCTRL_SelectHClk(SYSCTRL_CLK_PLL_DIV_1+3);
    SYSCTRL_SelectSpiClk(SPI_PORT_1,SYSCTRL_CLK_HCLK);
    
    platform_printf("clk %d \n",SYSCTRL_GetClk(SYSCTRL_ITEM_APB_SPI1));
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
    #ifdef SET_PLL_V1
    pParam.eSclkDiv = SPI_INTERFACETIMINGSCLKDIV_HCLK_24M;
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
    pParam.eReadTransCnt = 512;//DATA_LEN;
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
    
    apSSP_DeviceParametersSet(APB_SSP1, &pParam);
    
    write_data = (uint16_t*)screen;
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
    //platform_set_irq_callback(PLATFORM_CB_IRQ_DMA, DMA_cb_isr, 0);
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
  
    setup_peripherals_dma_module();
  
    #ifdef SPI_SLAVE
    peripherals_spi_read_data();
    #endif
  
    platform_printf("setup done. \n");
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
