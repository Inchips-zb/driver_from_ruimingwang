#ifndef _TIMESYNC_H_
#define _TIMESYNC_H_

#include <stdint.h>
#include "profile.h"
/* ==============================================================
    macro definition
*/
#define CH_ID                           15
#define TIMER_CYCLE_PER_US              (TMR_CLK_FREQ/1000000)
#define TIMER_CYCLE_PER_MS              (TMR_CLK_FREQ/1000)
#define PWM_CYCLE_PER_US                (PWM_CLOCK_FREQ/1000000)
#define CONVERT_MS_TO_US                (1000)
#define CAM_SYNC_PWM_CHANNEL            (0)
#define FILTER_DEPTH                    (10)
#define FILTER_DEPTH1                   (100)
#define FILTER_DEPTH2                   (50)
#define SYNC_OFFSET_ADVANCE_US    (1000)
#define SYNC_TIMER_ADVANCE_US     (100)
/* ==============================================================
    struction definition
*/
#pragma pack (push, 1)
typedef struct{
    uint8_t index;
    uint64_t send_time_us;
    uint8_t *data;
}time_sync_packet_format_s;

typedef enum{
    TIME_SYNC_PERIOD_STOP       = 0,
    TIME_SYNC_PERIOD_START      = 1 << 0,
    TIME_SYNC_PERIOD_DRIFT_DONE = 1 << 1,
}time_sync_flag_e;

typedef struct{
  uint64_t send_time_us;
  uint64_t recv_time_us;
  int64_t  delta_us;
}internal_time_sync_offset_data_s;

typedef struct{
    uint64_t last_send_time_us;
    uint64_t last_recv_time_us;
    int64_t  offset_gap_us;
    int32_t  offset_us_per_sec;
    int64_t  filter_pool1[FILTER_DEPTH1];
    uint32_t filter_pool1_idx;
    int64_t  sync_peroid_interval_us;
    uint8_t  time_sync_flag;
  
    internal_time_sync_offset_data_s  filter_pool2[FILTER_DEPTH2];
    uint32_t                          filter_pool2_idx;
  
    uint32_t sync_period_ms;
    double  d_offset_us_per_sec;
}internal_time_sync_offset_track_s;


typedef struct{
    ble_att_came_sync_packet_format_s packet;
    uint32_t interval_tick;
    uint32_t high_dur_tick;
    int32_t  filter_pool[FILTER_DEPTH];
    uint64_t next_start_time_us;
    double  filter_pool1[FILTER_DEPTH];
}came_sync_info_s;

#pragma pack (pop)


/* ==============================================================
    external variable declaration
*/
extern came_sync_info_s came_sync_info;
extern internal_time_sync_offset_track_s  internal_time_sync_offset;
/* ==============================================================
    external function declaration
*/
extern void timer1_enable(uint32_t cycles);
extern void timer1_disable(void);
extern void timer2_enable(uint32_t cycles);
extern void timer2_disable(void);
extern void ble_att_data_handle(const uint8_t *buffer, uint16_t buffer_size);
extern void internal_internal_time_sync_offset_calculation(uint64_t l0,uint64_t l1,uint64_t c0,uint64_t c1);
extern void internal_time_sync_reset(void);
extern uint32_t setup_profile(void *data, void *user_data);
extern void internal_time_sync_stop(void);
extern void gpio_test_output(void);
extern void PWM_Setup(const uint8_t channel_index, const uint32_t interval_ticks, const uint32_t on_duty_ticks);
extern void came_sync_schedule1(void);
extern void came_sync_schedule0(void);
extern void PWM_Disable(const uint8_t channel_index);
extern void internal_time_sync_init();
extern int internal_time_sync_recv_schedule(uint32_t window_len_us);
extern void internal_internal_time_sync_offset_post_processing(void);
extern void internal_time_sync_schedule(void);
#endif


