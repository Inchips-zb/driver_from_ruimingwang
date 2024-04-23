#ifndef _TIMESYNC_H_
#define _TIMESYNC_H_

#include <stdint.h>
#include "ll_api.h"

/* ==============================================================
    struction definition
*/
#pragma pack (push, 1)

typedef struct{
    uint8_t index;
    uint64_t send_time_us;
}raw_sync_packet_format_s;

typedef enum{
  TIME_SYNC_STOP,
  TIME_SYNC_START = (1 << 0),
  TIME_SYNC_CONNECTION_STOP = (1 << 1),
  TIME_SYNC_CONNECTION_START = (1 << 2),
  TIME_SYNC_CMD = (1 << 3)
}time_sync_flag_e;

typedef struct{
    uint8_t ready;
    uint8_t time_sync_flag;
    uint32_t pkt_cnt;
    uint32_t debug_failed_pkt_cnt;
}time_sync_info_s;

#pragma pack (pop)

typedef enum{
  RISING_EDGE_0 = 0,
  FALLING_EDGE_0,
  RISING_EDGE_1,
  FALLING_EDGE_1
}xr2_cam_time_pool_index_e;

typedef enum{
  CAPTURE_HALT = 0,
  CAPTURE_START,
  CAPTURE_STOP
}xr2_cam_flag_index_e;

typedef struct{
    uint64_t time_pool[3];
    uint32_t time_pool_index;
    #define FILTER_DEPTH (10)
    uint32_t filter_pool[FILTER_DEPTH];
    uint32_t filter_pool1[FILTER_DEPTH];
    uint32_t flag;
}xr2_cam_sync_capture_s;
/* ==============================================================
    macro definition
*/


#define CH_ID                   15
#define TIMER_CYCLE_PER_US              (TMR_CLK_FREQ/1000000)
#define TIMER_CYCLE_PER_MS              (TMR_CLK_FREQ/1000)
#define TIME_SYNC_WINDOW_MS             (300)
#define TIME_SYNC_CALCULATION_MS        (100)

/* ==============================================================
    external variable declaration
*/

extern time_sync_info_s        internal_time_sync_info;
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
extern void internal_time_sync_init(void);
extern void external_time_sync_schedule(void);
#endif


