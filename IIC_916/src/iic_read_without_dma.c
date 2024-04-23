#ifdef R_WO_DMA
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

#define DATA_CNT (10)
uint8_t write_data[DATA_CNT] = {0,};
uint8_t write_data_cnt = 0;
uint8_t read_data[DATA_CNT] = {0,};
uint8_t read_data_cnt = 0;

void setup_peripherals_i2c_module(void);

#ifdef I2C_MASTER
static uint32_t peripherals_i2c_isr(void *user_data)
{
  uint8_t i;
  uint32_t status = I2C_GetIntState(APB_I2C0);
  
  if(status & (1 << I2C_STATUS_FIFO_FULL))
  {
    for(; read_data_cnt < DATA_CNT; read_data_cnt++)
    {
      if(I2C_FifoEmpty(APB_I2C0)){break;}
      read_data[read_data_cnt] = I2C_DataRead(APB_I2C0);
    }
    platform_printf("full %d \n", read_data_cnt);
  }
  
  if(status & (1 << I2C_STATUS_CMPL))
  {
    for(; read_data_cnt < DATA_CNT; read_data_cnt++)
    {
      read_data[read_data_cnt] = I2C_DataRead(APB_I2C0);
    }

    I2C_ClearIntState(APB_I2C0, (1 << I2C_STATUS_CMPL));
    
    // debug trace
    platform_printf("cmp %d ",read_data_cnt);
    for(i=0;i<DATA_CNT;i++){platform_printf(" 0x%x -", read_data[i]);};
    printf("\n");
    
    // prepare for next
    read_data_cnt = 0;
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
        I2C_IntEnable(APB_I2C0,(1 << I2C_INT_FIFO_FULL));
        platform_printf("addr wr 0x%x\n", APB_I2C0->IntEn);
    }
    else if(dir == I2C_TRANSACTION_SLAVE2MASTER)
    {
        I2C_IntEnable(APB_I2C0,(1 << I2C_INT_FIFO_EMPTY));
        platform_printf("addr rd \n");
    }

    I2C_ClearIntState(APB_I2C0, (1 << I2C_STATUS_ADDRHIT));

  }
  
  if(status & (1 << I2C_STATUS_FIFO_EMPTY))
  {
    // push data until fifo is full
    for(; write_data_cnt < DATA_CNT; write_data_cnt++)
    {
      if(I2C_FifoFull(APB_I2C0)){break;}
      I2C_DataWrite(APB_I2C0,write_data[write_data_cnt]);
    }
    platform_printf("empty %d \n", write_data_cnt);
  }
  
  if(status & (1 << I2C_STATUS_CMPL))
  {
    
    I2C_ClearIntState(APB_I2C0, (1 << I2C_STATUS_CMPL));
    
    // prepare for next
    if(dir == I2C_TRANSACTION_MASTER2SLAVE)
    {
        I2C_IntDisable(APB_I2C0,(1 << I2C_INT_FIFO_FULL));
    }
    else if(dir == I2C_TRANSACTION_SLAVE2MASTER)
    {
        I2C_IntDisable(APB_I2C0,(1 << I2C_INT_FIFO_EMPTY));
    }
    
    write_data_cnt = 0;
    platform_printf("cmp \n ");
  }
  
  platform_printf("status 0x%x \n ", status);

  return 0;
}
#endif

void peripheral_i2c_send_data(void)
{
  #ifdef I2C_MASTER

  I2C_CtrlUpdateDirection(APB_I2C0,I2C_TRANSACTION_SLAVE2MASTER);
  I2C_CtrlUpdateDataCnt(APB_I2C0, DATA_CNT);
  I2C_CommandWrite(APB_I2C0, I2C_COMMAND_ISSUE_DATA_TRANSACTION);
  
  #if 0
  platform_printf("0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x \n", 
  APB_I2C0->Cfg, APB_I2C0->IntEn, APB_I2C0->Status, APB_I2C0->Addr, APB_I2C0->Ctrl, APB_I2C0->Cmd, APB_I2C0->Setup);
  #endif
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
  
  platform_set_irq_callback(PLATFORM_CB_IRQ_I2C0, peripherals_i2c_isr, NULL);
  
  platform_printf("DR_CTRL 0x%x \n",*(uint32_t*)(APB_IOMUX_BASE+0x108));
}
#define ADDRESS (0x71)
void setup_peripherals_i2c_module(void)
{
  #ifdef I2C_MASTER
  I2C_Config(APB_I2C0,I2C_ROLE_MASTER,I2C_ADDRESSING_MODE_07BIT,ADDRESS);
  I2C_ConfigClkFrequency(APB_I2C0,I2C_CLOCKFREQUENY_STANDARD);
  
  I2C_Enable(APB_I2C0,1);
  I2C_IntEnable(APB_I2C0,(1<<I2C_INT_CMPL)|(1 << I2C_INT_FIFO_FULL));
  #endif
  
  #ifdef I2C_SLAVE
  I2C_Config(APB_I2C0,I2C_ROLE_SLAVE,I2C_ADDRESSING_MODE_07BIT,ADDRESS);
  I2C_Enable(APB_I2C0,1);
  I2C_IntEnable(APB_I2C0,(1<<I2C_INT_ADDR_HIT)|(1<<I2C_INT_CMPL));
  
  write_data_cnt = 0;
  memset(write_data, 0x33, sizeof(write_data));
  #endif
  

}

void setup_peripherals_i2c(void)
{
  setup_peripherals_i2c_pin();
  setup_peripherals_i2c_module();

  platform_printf("setup done... I2C_BASE->Setup 0x%x 0x%x APB_PINCTRL->OUT_CTRL 0x%x 0x%x\n", 
  APB_I2C0->Setup, APB_I2C0->Ctrl, APB_PINCTRL->OUT_CTRL[2], APB_PINCTRL->IN_CTRL[4]);
  platform_printf("clk %d hclk %d pclk %d\n",SYSCTRL_GetPLLClk(),SYSCTRL_GetHClk(),SYSCTRL_GetPClk());
  
}
#endif