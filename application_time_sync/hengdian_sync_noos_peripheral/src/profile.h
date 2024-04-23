#ifndef _PROFILESTASK_H_
#define _PROFILESTASK_H_

#include <stdint.h>

/* ==============================================================
    macro definition
*/
#define USER_TRIGGER_RAW_PKT_RECV         7
#define USER_MSG_SEND_DATA                8
#define USER_MSG_SCHEDULE_CAME_SYNC       9
#define USER_MSG_SCHEDULE_CAME_SYNC0      10
#define USER_MSG_SCHEDULE_CAME_SYNC1      11
#define USER_MSG_INTERNAL_SYNC_POST_PROCESSING    12
#define USER_MSG_DATA_EVENT                       13
#define USER_MSG_UART_TX_DATA                     14

#define BLE_ATT_PACKET_HEADER_INTERNAL_TIME_SYNC (0xA0)
#define BLE_ATT_PACKET_HEADER_DATA          (0xA1)
#define BLE_ATT_PACKET_HEADER_CAME_SYNC     (0xA2)
#define BLE_ATT_PACKET_HEADER_DEV_SYNC      (0xA3)

/* ==============================================================
    struction definition
*/
#pragma pack (push, 1)

typedef struct{
    uint8_t header;
    uint8_t *data;
}ble_att_packet_format_s;

typedef struct{
    uint8_t header;
    uint32_t period_ms;
}ble_att_time_sync_packet_format_s;

typedef struct{
    uint8_t header;
    uint64_t start_time_us;
    uint32_t high_dur_us;
    uint32_t interval_us;
}ble_att_came_sync_packet_format_s;

#define BLE_ATT_DATA_PACKET_LEN (231)
typedef struct{
    uint8_t header;
    uint16_t len;
    uint8_t data[BLE_ATT_DATA_PACKET_LEN];
}ble_att_data_packet_format_s;

typedef enum
{
  UART_PACKET_HEADER_NULL = 0,
  UART_PACKET_HEADER_SYNC_TRIGGER = 1,//trigger by master every 5s
  UART_PACKET_HEADER_DATA = 2,//pure data transfer
  UART_PACKET_HEADER_SWITCH_TO_IDLE_MODE = 3,//change to power saving mode with 1s connection interval
  UART_PACKET_HEADER_SWITCH_TO_WORK_MODE = 4,//change to normal working mode with 10ms connection interval
  UART_PACKET_HEADER_SYNC_INFO = 5//sync info from device A for say, which has to be shared with device B/C
}uart_packet_header_e;

#define UART_RX_DATA_LEN (256)
typedef struct{
    uint8_t header;
    uint8_t len;
    uint8_t data[UART_RX_DATA_LEN];
}uart_rx_packet_format_s;

#define UART_TX_DATA_LEN (256)
typedef struct{
    uint8_t header;
    uint8_t len;
    uint8_t data[UART_TX_DATA_LEN];
}uart_tx_packet_format_s;

#pragma pack (pop)


/* ==============================================================
    external variable declaration
*/
extern uart_rx_packet_format_s uart_rx_packet;
extern uart_tx_packet_format_s uart_tx_packet;
/* ==============================================================
    external function declaration
*/

extern void ble_att_data_handle(const uint8_t *buffer, uint16_t buffer_size);
extern uint32_t setup_profile(void *data, void *user_data);
extern void ble_external_send_data(uint8_t* data, uint16_t len);
extern uint32_t uart_driver_send_data(uint8_t *c, uint16_t len);
extern void uart_external_send_data(uint8_t* data, uint16_t len);
extern void ble_external_send_dev_sync_data(uint8_t* data, uint16_t len);
#endif


