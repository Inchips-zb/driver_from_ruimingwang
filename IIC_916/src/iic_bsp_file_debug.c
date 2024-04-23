#ifdef BLOCKING_SIMU
#include <stdio.h>
#include <string.h>
#include "profile.h"
#include "ingsoc.h"
#include "platform_api.h"
#include "FreeRTOS.h"
#include "task.h"
#include "trace.h"
#include "iic.h"

#define I2C_SCL         GIO_GPIO_10
#define I2C_SDA         GIO_GPIO_11

#define DATA_CNT (8)
uint8_t write_data[DATA_CNT] = {0,};
uint8_t write_data_cnt = 0;
uint8_t read_data[DATA_CNT] = {0,};
uint8_t read_data_cnt = 0;
uint8_t master_write_flag = 0;
void setup_peripherals_i2c_module(void);

#define ADDRESS (0x71)

#ifdef I2C_MASTER
static uint32_t peripherals_i2c_isr(void *user_data)
{
  uint8_t i;
  uint32_t status = I2C_GetIntState(APB_I2C0);
  if(status & (1 << I2C_STATUS_CMPL))
  {
    if(master_write_flag)
    {
      platform_printf("wr cmp %d\n", I2C_CtrlGetDataCnt(APB_I2C0));
      I2C_ClearIntState(APB_I2C0, (1 << I2C_STATUS_CMPL));
    }
    else
    {
      for(; read_data_cnt < DATA_CNT; read_data_cnt++)
      {
        read_data[read_data_cnt] = I2C_DataRead(APB_I2C0);
      }

      I2C_ClearIntState(APB_I2C0, (1 << I2C_STATUS_CMPL));
      
      // debug trace
      platform_printf("rd cmp %d ",read_data_cnt);
      for(i=0;i<DATA_CNT;i++){platform_printf(" 0x%x -", read_data[i]);};
      printf("\n");
      
      // prepare for next
      read_data_cnt = 0;
    }
  }
  
  if(status & (1 << I2C_STATUS_ADDRHIT))
  {
    if(master_write_flag)
    {
      I2C_IntDisable(APB_I2C0,(1 << I2C_INT_FIFO_FULL));
      I2C_IntEnable(APB_I2C0,(1<<I2C_INT_CMPL)|(1 << I2C_INT_FIFO_EMPTY));
    }
    else
    {
      I2C_IntDisable(APB_I2C0,(1 << I2C_INT_FIFO_EMPTY));
      I2C_IntEnable(APB_I2C0,(1<<I2C_INT_CMPL)|(1 << I2C_INT_FIFO_FULL));
    }
    I2C_ClearIntState(APB_I2C0, (1 << I2C_STATUS_ADDRHIT));
    platform_printf("addr hit\n");
  }
  
  if(status & (1 << I2C_STATUS_FIFO_EMPTY))
  {
    if(master_write_flag)
    {
      // push data until fifo is full
      for(; write_data_cnt < DATA_CNT; write_data_cnt++)
      {
        //platform_printf("ept: %d \n",write_data_cnt);
        if(I2C_FifoFull(APB_I2C0)){break;}
        I2C_DataWrite(APB_I2C0,write_data[write_data_cnt]);
      }
      
      // if its the last, disable empty int
      if(write_data_cnt == DATA_CNT)
      {
        I2C_IntDisable(APB_I2C0,(1 << I2C_INT_FIFO_EMPTY));
      }
      platform_printf("cnt %d, 0x%x %d \n", write_data_cnt, APB_I2C0->IntEn, I2C_CtrlGetDataCnt(APB_I2C0));
    }
  }
  
  if(status & (1 << I2C_STATUS_FIFO_FULL))
  {
    if(!master_write_flag)
    {
      for(; read_data_cnt < DATA_CNT; read_data_cnt++)
      {
        if(I2C_FifoEmpty(APB_I2C0)){break;}
        read_data[read_data_cnt] = I2C_DataRead(APB_I2C0);
      }
      platform_printf("rd full %d \n", read_data_cnt);
    }
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
        master_write_flag = 1;
        I2C_IntEnable(APB_I2C0,(1 << I2C_INT_FIFO_FULL));
        platform_printf("addr wr 0x%x\n", APB_I2C0->IntEn);
    }
    else if(dir == I2C_TRANSACTION_SLAVE2MASTER)
    {
        master_write_flag = 0;
        I2C_IntEnable(APB_I2C0,(1 << I2C_INT_FIFO_EMPTY));
        
        write_data_cnt = 0;
        memset(write_data, 0x44, sizeof(write_data));
        platform_printf("addr rd \n");
    }

    I2C_ClearIntState(APB_I2C0, (1 << I2C_STATUS_ADDRHIT));

  }
  
  if(status & (1 << I2C_STATUS_FIFO_EMPTY))
  {
    // master read
    if(!master_write_flag)
    {
      // push data until fifo is full
      for(; write_data_cnt < DATA_CNT; write_data_cnt++)
      {
        if(I2C_FifoFull(APB_I2C0)){break;}
        I2C_DataWrite(APB_I2C0,write_data[write_data_cnt]);
      }
      platform_printf("rd empty %d \n", write_data_cnt);
    }
  }
  
  if(status & (1 << I2C_STATUS_FIFO_FULL))
  {
    // master write
    if(master_write_flag)
    {
      for(; read_data_cnt < DATA_CNT; read_data_cnt++)
      {
        if(I2C_FifoEmpty(APB_I2C0)){break;}
        read_data[read_data_cnt] = I2C_DataRead(APB_I2C0);
      }
      platform_printf("wr full %d \n", read_data_cnt);
    }
  }
  
  if(status & (1 << I2C_STATUS_CMPL))
  {
    // master write
    if(master_write_flag)
    {
      for(;read_data_cnt < DATA_CNT; read_data_cnt++)
      {
        read_data[read_data_cnt] = I2C_DataRead(APB_I2C0);
      }
      
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
      //setup_peripherals_i2c_module();
      
      // debug trace
      platform_printf("wr cmp %d ",read_data_cnt);
      for(i=0;i<DATA_CNT;i++){platform_printf(" 0x%x -", read_data[i]);};
      printf("\n");
      
      read_data_cnt = 0;
    }
    else
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
      platform_printf("rd cmp \n ");
    }
  }
  
  platform_printf("status 0x%x \n ", status);

  return 0;
}
#endif

void peripheral_i2c_write_data(void)
{
  #ifdef I2C_MASTER
  
  master_write_flag = 1;
  write_data_cnt = 0;
  memset(write_data, 0x33, sizeof(write_data));

//  I2C_CtrlUpdateDirection(APB_I2C0,I2C_TRANSACTION_MASTER2SLAVE);
//  I2C_CtrlUpdateDataCnt(APB_I2C0, DATA_CNT);
//  I2C_CommandWrite(APB_I2C0, I2C_COMMAND_ISSUE_DATA_TRANSACTION);
  
  i2c_write(I2C_PORT_0, ADDRESS, write_data, DATA_CNT);
  
  #if 0
  platform_printf("0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x \n", 
  APB_I2C0->Cfg, APB_I2C0->IntEn, APB_I2C0->Status, APB_I2C0->Addr, APB_I2C0->Ctrl, APB_I2C0->Cmd, APB_I2C0->Setup);
  #endif
  #endif
}

void peripheral_i2c_read_data(void)
{
  #ifdef I2C_MASTER
  uint32_t i;
  master_write_flag = 0;
//  I2C_CtrlUpdateDirection(APB_I2C0,I2C_TRANSACTION_SLAVE2MASTER);
//  I2C_CtrlUpdateDataCnt(APB_I2C0, DATA_CNT);
//  I2C_CommandWrite(APB_I2C0, I2C_COMMAND_ISSUE_DATA_TRANSACTION);
  
  memset(write_data, 0x34, sizeof(write_data));
  memset(read_data, 0, sizeof(read_data));
  i2c_read(I2C_PORT_0, ADDRESS, write_data, DATA_CNT, read_data, DATA_CNT);
  // debug trace
  platform_printf("rd data: ");
  for(i=0;i<DATA_CNT;i++){platform_printf(" 0x%x -", read_data[i]);};
  printf("\n");
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
  
  #ifdef I2C_SLAVE
  platform_set_irq_callback(PLATFORM_CB_IRQ_I2C0, peripherals_i2c_isr, NULL);
  #endif
  
}

void setup_peripherals_i2c_module(void)
{
  #ifdef I2C_MASTER
  I2C_Config(APB_I2C0,I2C_ROLE_MASTER,I2C_ADDRESSING_MODE_07BIT,ADDRESS);
  I2C_ConfigClkFrequency(APB_I2C0,I2C_CLOCKFREQUENY_STANDARD);
  I2C_Enable(APB_I2C0,1);
  I2C_IntEnable(APB_I2C0,(1<<I2C_INT_CMPL)|(1<<I2C_INT_ADDR_HIT));
  #endif
  
  #ifdef I2C_SLAVE
  I2C_Config(APB_I2C0,I2C_ROLE_SLAVE,I2C_ADDRESSING_MODE_07BIT,ADDRESS);
  I2C_Enable(APB_I2C0,1);
  I2C_IntEnable(APB_I2C0,(1<<I2C_INT_ADDR_HIT)|(1<<I2C_INT_CMPL));
  #endif
  
}

void setup_peripherals_i2c(void)
{
  #ifdef I2C_MASTER
  setup_peripherals_i2c_pin();
  i2c_init(I2C_PORT_0);
  #endif
  
  #ifdef I2C_SLAVE
  setup_peripherals_i2c_pin();
  setup_peripherals_i2c_module();
  #endif
  #if 0
  platform_printf("setup done... I2C_BASE->Setup 0x%x 0x%x APB_PINCTRL->OUT_CTRL 0x%x 0x%x\n", 
  APB_I2C0->Setup, APB_I2C0->Ctrl, APB_PINCTRL->OUT_CTRL[2], APB_PINCTRL->IN_CTRL[4]);
  platform_printf("clk %d hclk %d pclk %d\n",SYSCTRL_GetPLLClk(),SYSCTRL_GetHClk(),SYSCTRL_GetPClk());
  #endif
}

#endif