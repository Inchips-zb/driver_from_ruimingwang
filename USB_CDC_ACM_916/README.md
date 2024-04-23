# USB_CDC_ACM_916

# 初始化

  在app main中调用bsp_usb_init();
  
# 发送数据

  1.  发送数据的API是bsp_cdc_push_data，已经放在打印函数cb_putc中，可以直接调用printf来输出数据
  
# 接收数据

  1.  接收API在app_usb_read_data_from_cdc中实现，该例子中，收到的数据直接通过printf回环给了串口工具
  
# 编译下载运行
  
# 观察枚举是否成功

  在电脑的设备管理器中，应该出现一个新的"USB串行设备(COMx)"
  如果出现，代表识别成功
  
# 打开串口工具

  配置波特率

# 通过串口工具发送数据，数据应该会回环并显示在串口工具上

