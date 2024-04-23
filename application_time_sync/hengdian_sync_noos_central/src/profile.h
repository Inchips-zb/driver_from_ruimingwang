#ifndef _PROFILESTASK_H_
#define _PROFILESTASK_H_

#include <stdint.h>
#include "ll_api.h"

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
  UART_PACKET_HEADER_SYNC_INFO = 5,//sync info from device A for say, which has to be shared with device B/C
  UART_PACKET_HEADER_MAX = 6
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
    macro definition
*/
#define INVALID_HANDLE          0xffff
#define BLE_ATT_PACKET_HEADER_INTERNAL_TIME_SYNC (0xA0)
#define BLE_ATT_PACKET_HEADER_DATA          (0xA1)
#define BLE_ATT_PACKET_HEADER_CAME_SYNC     (0xA2)
#define BLE_ATT_PACKET_HEADER_DEV_SYNC      (0xA3)

#define USER_MSG_INITIATE_TIMOUT    5
#define USER_TRIGGER_RAW_PKT        6
#define USER_MSG_CAME_SYNC_EVENT    7
#define USER_MEG_SCHEDULE_INTERNAL_RAW_PKT 8
#define USER_MSG_SET_PHY            9
#define USER_MSG_SET_INTERVAL       0xA
#define USER_MSG_DATA_EVENT         0xB
#define USER_MSG_UART_TX_DATA       0xC

/* ==============================================================
    external variable declaration
*/
extern ble_att_time_sync_packet_format_s ble_data_time_sync;
extern ble_att_came_sync_packet_format_s ble_data_came_sync;
extern uart_rx_packet_format_s uart_rx_packet;
extern uart_tx_packet_format_s uart_tx_packet;
/* ==============================================================
    external function declaration
*/
extern void packet_action(void);
extern void timer1_enable(uint32_t cycles);
extern void internal_time_sync_schedule(void);
extern void app_timer_callback(void);
extern int total_conn_num(void);
extern uint32_t setup_profile(void *data, void *user_data);
extern void time_sync_timer1_callback(void);
extern void came_sync_callback(void);
extern void came_sync_data_record(void);
extern void internal_time_sync_stop(void);
extern void on_raw_packet_done(struct ll_raw_packet *packet, void *user_data);
extern int is_all_peripheral_connected(void);
extern void ble_external_set_interval(int interval);
extern void ble_external_set_phy(int phy);
extern void ble_external_send_data(uint8_t* data, uint16_t len);
extern void uart_external_send_data(uint8_t* data, uint16_t len);
extern uint32_t uart_driver_send_data(uint8_t *c, uint16_t len);
extern void ble_external_send_dev_sync_data(uint8_t* data, uint16_t len, uint16_t dev);
#endif


