#ifdef W_W_DMA
#include <stdio.h>
#include <string.h>
#include "profile.h"
#include "ingsoc.h"
#include "platform_api.h"
#include "FreeRTOS.h"
#include "task.h"
#include "trace.h"

#define I2C_SCL         GIO_GPIO_10
#define I2C_SDA         GIO_GPIO_11

#define DATA_CNT (23)
uint8_t write_data[DATA_CNT] = {0,};
uint8_t write_data_cnt = 0;
uint8_t read_data[DATA_CNT] = {0,};

void setup_peripherals_i2c_module(void);
void peripherals_i2c_read_data_dma_setup(void);

#ifdef I2C_MASTER
static uint32_t peripherals_i2c_isr(void *user_data)
{
  uint8_t i;
  uint32_t status = I2C_GetIntState(APB_I2C0);
  
  if(status & (1 << I2C_STATUS_CMPL))
  {
    platform_printf("cmp %d\n", I2C_CtrlGetDataCnt(APB_I2C0));
    I2C_ClearIntState(APB_I2C0, (1 << I2C_STATUS_CMPL));
  }
  
  platform_printf("status 0x%x ", status);
  printf("\n");
  return 0;
}
#endif

#ifdef I2C_SLAVE
static uint32_t peripherals_i2c_isr(void *user_data)
{
  uint8_t i;
  static uint8_t dir = 2;
  uint32_t status = I2C_GetIntState(APB_I2C0);

  if(status & (1 << I2C_STATUS_ADDRHIT))
  {
    dir = I2C_GetTransactionDir(APB_I2C0);
    if(dir == I2C_TRANSACTION_MASTER2SLAVE)
    {
        peripherals_i2c_read_data_dma_setup();
        platform_printf("addr wr \n");
    }
    else if(dir == I2C_TRANSACTION_SLAVE2MASTER)
    {
        platform_printf("addr rd \n");
    }
    I2C_ClearIntState(APB_I2C0, (1 << I2C_STATUS_ADDRHIT));
  }
  
  if(status & (1 << I2C_STATUS_CMPL))
  {
    //I2C_DmaEnable(APB_I2C0,0);
    I2C_ClearIntState(APB_I2C0, (1 << I2C_STATUS_CMPL));
    
    // debug trace
    platform_printf("cmp %d ",I2C_CtrlGetDataCnt(APB_I2C0));
    for(i=0;i<DATA_CNT;i++){platform_printf(" 0x%x -", read_data[i]);};
    printf("\n");
  }
  
  platform_printf("status 0x%x \n ", status);

  return 0;
}
#endif

void peripherals_i2c_rxfifo_to_dma(int channel_id, void *dst, int size)
{
    DMA_Descriptor descriptor __attribute__((aligned (8)));

    descriptor.Next = (DMA_Descriptor *)0;
    DMA_PreparePeripheral2Mem(&descriptor,dst,SYSCTRL_DMA_I2C0,size,DMA_ADDRESS_INC,0);

    DMA_EnableChannel(channel_id, &descriptor);
}

void peripherals_i2c_dma_to_txfifo(int channel_id, void *src, int size)
{
    DMA_Descriptor descriptor __attribute__((aligned (8)));

    descriptor.Next = (DMA_Descriptor *)0;
    DMA_PrepareMem2Peripheral(&descriptor,SYSCTRL_DMA_I2C0,src,size,DMA_ADDRESS_INC,0);

    DMA_EnableChannel(channel_id, &descriptor);
}

void peripheral_i2c_send_data(void)
{
  #ifdef I2C_MASTER
  
  write_data_cnt = 0;
  memset(write_data, 0x33, sizeof(write_data));

  I2C_DmaEnable(APB_I2C0,1);
  I2C_CtrlUpdateDirection(APB_I2C0,I2C_TRANSACTION_MASTER2SLAVE);
  I2C_CtrlUpdateDataCnt(APB_I2C0, DATA_CNT);

  #define I2C_DMA_TX_CHANNEL   (0)//DMA channel 0
  peripherals_i2c_dma_to_txfifo(I2C_DMA_TX_CHANNEL, write_data, sizeof(write_data));
  I2C_CommandWrite(APB_I2C0, I2C_COMMAND_ISSUE_DATA_TRANSACTION);
  
  #if 0
  platform_printf("0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x \n", 
  APB_I2C0->Cfg, APB_I2C0->IntEn, APB_I2C0->Status, APB_I2C0->Addr, APB_I2C0->Ctrl, APB_I2C0->Cmd, APB_I2C0->Setup);
  #endif
  #endif
}

void peripherals_i2c_read_data_dma_setup(void)
{
    #ifdef I2C_SLAVE
    memset(read_data, 0xff, sizeof(read_data));
    #define I2C_DMA_RX_CHANNEL   (0)//DMA channel 0
    peripherals_i2c_rxfifo_to_dma(I2C_DMA_RX_CHANNEL, read_data, sizeof(read_data));
    I2C_CtrlUpdateDataCnt(APB_I2C0, DATA_CNT);
    I2C_DmaEnable(APB_I2C0,1);
    #endif
}

void setup_peripherals_i2c_pin(void)
{
  SYSCTRL_ClearClkGateMulti(    (1 << SYSCTRL_ITEM_APB_I2C0)
                                | (1 << SYSCTRL_ITEM_APB_SysCtrl)
                                | (1 << SYSCTRL_ITEM_APB_PinCtrl)
                                | (1 << SYSCTRL_ITEM_APB_GPIO1)
                                | (1 << SYSCTRL_ITEM_APB_GPIO0));
  #ifdef DRIVE
  APB_PINCTRL->DR_CTRL[0] |= (3 << 20) | (3 << 22); 
  #endif
  #if 0
  PINCTRL_Pull(IO_SOURCE_I2C0_SCL_OUT,PINCTRL_PULL_UP);
  PINCTRL_Pull(IO_SOURCE_I2C0_SDA_OUT,PINCTRL_PULL_UP);
  PINCTRL_Pull(IO_SOURCE_I2C0_SCL_IN,PINCTRL_PULL_UP);
  PINCTRL_Pull(IO_SOURCE_I2C0_SDA_IN,PINCTRL_PULL_UP);
  PINCTRL_SelI2cIn(I2C_PORT_0,I2C_SCL,I2C_SDA);
  #endif
  
  #if 1
  PINCTRL_Pull(I2C_SCL,PINCTRL_PULL_UP);
  PINCTRL_Pull(I2C_SDA,PINCTRL_PULL_UP);
  PINCTRL_SelI2cIn(I2C_PORT_0,I2C_SCL,I2C_SDA);
  PINCTRL_SetPadMux(I2C_SCL,IO_SOURCE_I2C0_SCL_OUT);
  PINCTRL_SetPadMux(I2C_SDA,IO_SOURCE_I2C0_SDA_OUT);
  #else
  SetI2C0PIN(I2C_SCL,I2C_SDA);
  #endif
  
  SYSCTRL_ResetBlock(SYSCTRL_ITEM_APB_I2C0);
  SYSCTRL_ReleaseBlock(SYSCTRL_ITEM_APB_I2C0);
  
  platform_printf("DR_CTRL 0x%x \n",*(uint32_t*)(APB_IOMUX_BASE+0x108));
}

void setup_peripherals_i2c_module(void)
{
  #ifdef I2C_MASTER
  I2C_Config(APB_I2C0,I2C_ROLE_MASTER,I2C_ADDRESSING_MODE_07BIT,0x71);
  I2C_ConfigClkFrequency(APB_I2C0,I2C_CLOCKFREQUENY_STANDARD);
  I2C_Enable(APB_I2C0,1);
  I2C_IntEnable(APB_I2C0,(1<<I2C_INT_CMPL));
  #endif
  
  #ifdef I2C_SLAVE
  I2C_Config(APB_I2C0,I2C_ROLE_SLAVE,I2C_ADDRESSING_MODE_07BIT,0x71);
  I2C_Enable(APB_I2C0,1);
  I2C_IntEnable(APB_I2C0,(1<<I2C_INT_ADDR_HIT)|(1<<I2C_INT_CMPL));
  #endif
  

}

static void setup_peripherals_dma_module(void)
{
    SYSCTRL_ClearClkGateMulti(1 << SYSCTRL_ClkGate_APB_DMA);
    DMA_Reset(1);
    DMA_Reset(0);
}

void setup_peripherals_i2c(void)
{
  setup_peripherals_i2c_pin();
  setup_peripherals_i2c_module();
  setup_peripherals_dma_module();
  
  platform_set_irq_callback(PLATFORM_CB_IRQ_I2C0, peripherals_i2c_isr, NULL);
  
  platform_printf("setup done... I2C_BASE->Setup 0x%x 0x%x APB_PINCTRL->OUT_CTRL 0x%x 0x%x\n", 
  APB_I2C0->Setup, APB_I2C0->Ctrl, APB_PINCTRL->OUT_CTRL[2], APB_PINCTRL->IN_CTRL[4]);
  platform_printf("clk %d hclk %d pclk %d\n",SYSCTRL_GetPLLClk(),SYSCTRL_GetHClk(),SYSCTRL_GetPClk());
  
}

#endif