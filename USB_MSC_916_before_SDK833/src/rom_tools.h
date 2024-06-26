#ifndef _CRC_H
#define _CRC_H

#include <stdint.h>
#include "ingsoc.h"

#ifdef __cplusplus
extern "C" {
#endif

/**
 ****************************************************************************************
 * @brief Calculate a 16bit CRC code (Polynomial x^16+x^15+x^5+1)
 *
 * @param[in] buffer        input bytes
 * @param[in] len           data length
 * @return                  CRC result
 ****************************************************************************************
 */
typedef uint16_t (* f_crc_t)(uint8_t *buffer, uint16_t len);

/**
 ****************************************************************************************
 * @brief Start UART downloading mode
 *
 ****************************************************************************************
 */
typedef uint16_t (* f_void_t)(void);

#if (INGCHIPS_FAMILY == INGCHIPS_FAMILY_918)

#define crc                 ((f_crc_t)(0x00000f79))
#define boot_uart_init      ((f_void_t)(0x000006f5))
#define boot_uart_download  ((f_void_t)(0x00000bc9))

#elif (INGCHIPS_FAMILY == INGCHIPS_FAMILY_916)

#define crc     ((f_crc_t)(0x00001d21))

typedef void (* f_erase_sector)(uint32_t addr);
typedef void (* f_void)(void);
typedef void (* f_prog_page)(uint32_t addr, const uint8_t data[256], uint32_t len);

typedef int (* f_program_flash)(const uint32_t dest_addr, const uint8_t *buffer, uint32_t size);
typedef int (* f_write_flash)(const uint32_t dest_addr, const uint8_t *buffer, uint32_t size);
typedef int (* f_flash_do_update)(const int block_num, const fota_update_block_t *blocks, uint8_t *ram_buffer);

typedef void (* f_enable_continuous_mode)(void);
typedef void (* f_disable_continuous_mode)(void);
typedef void (* f_dcache_flash)(void);
typedef void (* f_erase_page)(uint32_t addr);
typedef void (* f_write_page)(uint32_t addr, const uint8_t data[256], uint32_t len);
typedef void (* f_write_disable)(void);

#define ROM_program_flash               ((f_program_flash)0x00003b9b)
#define ROM_write_flash                 ((f_write_flash)0x00003cff)
#define ROM_flash_do_update             ((f_flash_do_update)0x00001d73)
#define ROM_enable_continuous_mode      ((f_enable_continuous_mode)0x0000080d)
#define ROM_disable_continuous_mode     ((f_disable_continuous_mode)0x000007c9)
#define ROM_dcache_flash                ((f_dcache_flash)0x00000651)
#define ROM_erase_page                  ((f_erase_page)0x000008c1)
#define ROM_write_page                  ((f_write_page)0x000008ed)
#define ROM_write_disable               ((f_write_disable)0x00000be1)

#endif

#ifdef __cplusplus
}
#endif

#endif

