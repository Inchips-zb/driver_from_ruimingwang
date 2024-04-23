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
#define SPI_MIC_CLK         GIO_GPIO_7
#define SPI_MIC_MOSI        GIO_GPIO_8
#define SPI_MIC_MISO        GIO_GPIO_9
#define SPI_MIC_CS          GIO_GPIO_10
#define SPI_MIC_WP          GIO_GPIO_11
#define SPI_MIC_HOLD        GIO_GPIO_12

enum{STATUS_REG_1_BUSY = 0,};
enum{STATUS_REG_1 = 0x05, STATUS_REG_2 = 0x35, STATUS_REG_3 = 0x15};

#define SPI_MASTER_PARAM { SPI_INTERFACETIMINGSCLKDIV_DEFAULT_2M, \
SPI_CPHA_ODD_SCLK_EDGES, SPI_CPOL_SCLK_LOW_IN_IDLE_STATES, \
SPI_LSB_MOST_SIGNIFICANT_BIT_FIRST, SPI_DATALEN_8_BITS, SPI_SLVMODE_MASTER_MODE, \
SPI_TRANSMODE_WRITE_ONLY, SPI_DUALQUAD_QUAD_IO_MODE, 1, 1, \
SPI_ADDREN_ENABLE, SPI_CMDEN_ENABLE, (1 << bsSPI_INTREN_ENDINTEN), \
0, 0, SPI_SLVDATAONLY_DISABLE, SPI_ADDRLEN_3_BYTES }

apSSP_sDeviceControlBlock pParam = SPI_MASTER_PARAM;

#define QUAD_MODE // SINGLE_MODE
// ============================ functions ===============================

static uint32_t peripherals_spi_isr(void *user_data)
{
  uint32_t stat = apSSP_GetIntRawStatus(AHB_SSP0);
  if(stat & (1 << bsSPI_INTREN_ENDINTEN))
  {
    apSSP_ClearIntStatus(AHB_SSP0, 1 << bsSPI_INTREN_ENDINTEN);
  }

  return 0;
}

static uint32_t W25QXX_read_manufacturer(void)
{
  uint8_t data[2];
  pParam.eQuadMode = SPI_DUALQUAD_REGULAR_MODE;
  pParam.eAddrEn = SPI_ADDREN_ENABLE;
  pParam.eCmdEn = SPI_CMDEN_ENABLE;
  pParam.eReadTransCnt = 2;
  pParam.eReadWriteMode = SPI_TRANSMODE_READ_ONLY;
  apSSP_DeviceParametersSet(AHB_SSP0, &pParam);
  
  apSSP_WriteCmd(AHB_SSP0, 0, 0x90);
  while(apSSP_GetSPIActiveStatus(AHB_SSP0));
  apSSP_ReadFIFO(AHB_SSP0, (uint32_t*)&data[0]);
  apSSP_ReadFIFO(AHB_SSP0, (uint32_t*)&data[1]);
  return *(uint32_t*)data;
}

static uint8_t W25QXX_read_status(uint32_t reg)
{
  uint32_t status = 0;
  pParam.eQuadMode = SPI_DUALQUAD_REGULAR_MODE;
  pParam.eAddrEn = SPI_ADDREN_DISABLE;
  pParam.eCmdEn = SPI_CMDEN_ENABLE;
  pParam.eReadTransCnt = 1;
  pParam.eReadWriteMode = SPI_TRANSMODE_READ_ONLY;
  apSSP_DeviceParametersSet(AHB_SSP0, &pParam);
  
  apSSP_WriteCmd(AHB_SSP0, 0, reg);
  while(apSSP_GetSPIActiveStatus(AHB_SSP0));
  apSSP_ReadFIFO(AHB_SSP0, &status);
  
  return status;
}

static void W25QXX_write_enable(void)
{
  pParam.eQuadMode = SPI_DUALQUAD_REGULAR_MODE;
  pParam.eAddrEn = SPI_ADDREN_DISABLE;
  pParam.eCmdEn = SPI_CMDEN_ENABLE;
  pParam.eReadWriteMode = 7;//SPI_TRANSMODE_NONE_DATA;
  apSSP_DeviceParametersSet(AHB_SSP0, &pParam);
  
  apSSP_WriteCmd(AHB_SSP0, 0, 0x06);
  while(apSSP_GetSPIActiveStatus(AHB_SSP0));
}

static void W25QXX_sector_erase_flash(uint32_t addr)
{
  W25QXX_write_enable();
  
  pParam.eQuadMode = SPI_DUALQUAD_REGULAR_MODE;
  pParam.eAddrEn = SPI_ADDREN_ENABLE;
  pParam.eCmdEn = SPI_CMDEN_ENABLE;
  pParam.eAddrLen = SPI_ADDRLEN_3_BYTES;
  pParam.eReadWriteMode = 7;//SPI_TRANSMODE_NONE_DATA;
  apSSP_DeviceParametersSet(AHB_SSP0, &pParam);
  
  apSSP_WriteCmd(AHB_SSP0, addr&0xffffff, 0x20);
  while(apSSP_GetSPIActiveStatus(AHB_SSP0));
  while(W25QXX_read_status(STATUS_REG_1)&(1<<STATUS_REG_1_BUSY));
}

static void W25QXX_write_status(uint32_t reg, uint8_t data)
{
  W25QXX_write_enable();
  
  pParam.eQuadMode = SPI_DUALQUAD_REGULAR_MODE;
  pParam.eAddrEn = SPI_ADDREN_DISABLE;
  pParam.eCmdEn = SPI_CMDEN_ENABLE;
  pParam.eWriteTransCnt = 1;
  pParam.eReadWriteMode = SPI_TRANSMODE_WRITE_ONLY;
  apSSP_DeviceParametersSet(AHB_SSP0, &pParam);
  
  apSSP_WriteCmd(AHB_SSP0, 0, 0x20);
  while(apSSP_GetSPIActiveStatus(AHB_SSP0));
  while(W25QXX_read_status(STATUS_REG_1)&(1<<STATUS_REG_1_BUSY));
}

static void W25QXX_page_program_single_mode(uint32_t addr, uint8_t *data, uint32_t len)
{
  W25QXX_write_enable();
  
  pParam.eQuadMode = SPI_DUALQUAD_REGULAR_MODE;
  pParam.eAddrEn = SPI_ADDREN_ENABLE;
  pParam.eCmdEn = SPI_CMDEN_ENABLE;
  pParam.eAddrLen = SPI_ADDRLEN_3_BYTES;
  pParam.eWriteTransCnt = len;
  pParam.eReadWriteMode = SPI_TRANSMODE_WRITE_ONLY;
  apSSP_DeviceParametersSet(AHB_SSP0, &pParam);
  
  apSSP_WriteCmd(AHB_SSP0, addr&0xffffff, 0x02);
  for(uint32_t i=0; i < len; i++)
  {
    apSSP_WriteFIFO(AHB_SSP0, data[i]);
  }
  while(apSSP_GetSPIActiveStatus(AHB_SSP0));
  while(W25QXX_read_status(STATUS_REG_1)&(1<<STATUS_REG_1_BUSY));
}

static void W25QXX_page_program_quad_mode(uint32_t addr, uint8_t *data, uint32_t len)
{
  W25QXX_write_enable();
  
  pParam.eQuadMode = SPI_DUALQUAD_QUAD_IO_MODE;
  pParam.eAddrEn = SPI_ADDREN_ENABLE;
  pParam.eCmdEn = SPI_CMDEN_ENABLE;
  pParam.eAddrLen = SPI_ADDRLEN_3_BYTES;
  pParam.eWriteTransCnt = len;
  pParam.eReadWriteMode = SPI_TRANSMODE_WRITE_ONLY;
  apSSP_DeviceParametersSet(AHB_SSP0, &pParam);
  
  apSSP_WriteCmd(AHB_SSP0, addr&0xffffff, 0x32);
  for(uint32_t i=0; i < len; i++)
  {
    apSSP_WriteFIFO(AHB_SSP0, data[i]);
  }
  while(apSSP_GetSPIActiveStatus(AHB_SSP0));
  while(W25QXX_read_status(STATUS_REG_1)&(1<<STATUS_REG_1_BUSY));
}

void peripherals_spi_send_data(void)
{
  printf("manufacturer 0x%x \n",W25QXX_read_manufacturer());
  printf("status 0x%x 0x%x 0x%x\n",W25QXX_read_status(STATUS_REG_1),W25QXX_read_status(STATUS_REG_2),W25QXX_read_status(STATUS_REG_3));

  #define FLASH_ADDR (0x00FF00)
  
  W25QXX_sector_erase_flash(FLASH_ADDR);

  uint8_t data[256];memset(data, 0x39, sizeof(data));
  // write to flash
  #ifdef QUAD_MODE
  W25QXX_page_program_quad_mode(FLASH_ADDR, data, sizeof(data));
  #else
  W25QXX_page_program_single_mode(FLASH_ADDR, data, sizeof(data));
  #endif

  // read from flash
  #ifdef QUAD_MODE
  apSSP_SetMemAccessCmd(AHB_SSP0,SPI_MEMRD_CMD_6B);
  #else
  apSSP_SetMemAccessCmd(AHB_SSP0,SPI_MEMRD_CMD_03);
  #endif
  printf("read back: ");for(uint32_t i=0; i < 256; i++){printf("%x, ", *((uint8_t*)AHB_QSPI_MEM_BASE+FLASH_ADDR+i));};printf("\n");

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

static void setup_peripherals_spi_module(void)
{
    #ifdef SPI_HIGH_SPEED
    pParam.eSclkDiv = setup_peripherals_spi_0_high_speed_interface_clk(21000000);
    #endif
}

void setup_peripherals_spi(void)
{
    setup_peripherals_spi_pin();
    setup_peripherals_spi_module();

    platform_printf(" setup clk %d \n", SYSCTRL_GetPLLClk());
}

