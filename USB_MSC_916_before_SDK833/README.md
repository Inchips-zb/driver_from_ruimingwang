# USB_MSC_916

# 使用方式：

在app_main中调用bsp_usb_init，完成USB的初始化。

# MSC配置

通过配置BSP_USB_MSC_FUNC来选择，共有三个选项:

-   BSP_USB_MSC_RAM_DISK: 文件系统（FAT12）存储在RAM中
-   BSP_USB_MSC_FLASH_DISK: 文件系统（FAT12）存储在FLASH中
-   BSP_USB_MSC_FLASH_DISK_NO_VFS: 数据存储在FLASH中，没有文件系统

区别如下：
## BSP_USB_MSC_RAM_DISK

数据空间存储在msc_disk，总大小为VFS_TOTAL_MEM_SIZE = 8KB，其中每个扇区是512B，总共VFS_DISK_BLOCK_NUM = 16个扇区。

## BSP_USB_MSC_FLASH_DISK

文件系统在msc_disk完成初始化，然后搬运到VFS_START_ADDR = 0x02040000开始的连续空间，总大小为VFS_TOTAL_MEM_SIZE = 256KB。
用户可以根据FAT12协议在程序中创建文件。

## BSP_USB_MSC_FLASH_DISK_NO_VFS

提供VFS_START_ADDR = 0x02040000开始的连续空间，总大小为VFS_TOTAL_MEM_SIZE = 256KB，当枚举成功后，HOST(电脑)出现弹窗要求格式化，选择
默认参数：FAT系统，扇区=512B。完成快速格式化。
所有文件由HOST管理，用户无法在程序中创建文件。

默认配置为BSP_USB_MSC_FLASH_DISK。


