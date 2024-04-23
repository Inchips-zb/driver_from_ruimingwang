#include <stdio.h>
#include <string.h>
#include <math.h>
#include "platform_api.h"
#include "att_db.h"
#include "gap.h"
#include "att_dispatch.h"
#include "btstack_util.h"
#include "btstack_event.h"
#include "btstack_defines.h"
#include "gatt_client.h"
#include "profile.h"
#include "ad_parser.h"
#include "time_sync.h"

/* ==============================================================
    variables definition
*/

struct ll_raw_packet            *raw_packet;
time_sync_info_s                internal_time_sync_info;
raw_sync_packet_format_s        internal_raw_data_time_sync;
#define SIDE_OPERATION_FEED_DOG         TMR_WatchDogRestart();
/* ==============================================================
    APIs definition
*/

void internal_time_sync_stop(void)
{
    internal_time_sync_info.time_sync_flag = TIME_SYNC_STOP | TIME_SYNC_CMD;
    
    #ifdef PROFILE_DEBUG_1
    platform_printf("--(%d)(%d)\n",internal_time_sync_info.pkt_cnt, internal_time_sync_info.debug_failed_pkt_cnt);
    #endif
  
    internal_time_sync_info.pkt_cnt = 0;
    internal_time_sync_info.debug_failed_pkt_cnt = 0;
  
    timer1_enable(TIMER_CYCLE_PER_MS*TIME_SYNC_CALCULATION_MS);
}

void internal_time_sync_schedule(void)
{
    internal_time_sync_info.time_sync_flag = TIME_SYNC_START;
    internal_time_sync_info.pkt_cnt = 0;
    internal_time_sync_info.debug_failed_pkt_cnt = 0;
  
    // time sync event only last for TIME_SYNC_WINDOW_MS, setup a timer to stop the event
    timer1_enable(TIMER_CYCLE_PER_MS*TIME_SYNC_WINDOW_MS);
    // send ble packet to inform peripheral to receive raw packets
    att_dispatch_client_request_can_send_now_event(0);
    // start timer to send raw packet
    packet_action();
}

void external_time_sync_schedule(void)
{
    btstack_push_user_msg(USER_MSG_CAME_SYNC_EVENT, NULL, 0);  
}

uint32_t data_with_high_frequency(uint32_t a[], uint32_t n)
{
  uint32_t i, j;
  uint8_t b[FILTER_DEPTH] = {0};
  
  memset(b, 0 , sizeof(b));
  for(i = 0; i < n; i++)
  {
    for(j = 0; j < i; j++)
    {
      if(a[i] == a[j]){b[j]++;break;}
    }
  }
  for(i = 1,j = 0; i < n; i++)
  {
    if(b[i] > b[j]){j = i;}
  }

  return (a[j]);
}

void came_sync_callback(void)
{
  // only start time sync after all devices are in connection state
  if(!is_all_peripheral_connected()) return;
  
  // the synchronized uart action would happen in about 500ms
  #define SYNC_FIX_OFFSET_US (200*1000)
  ble_data_came_sync.start_time_us = platform_get_us_time() + (TIME_SYNC_WINDOW_MS+TIME_SYNC_CALCULATION_MS)*1000 + SYNC_FIX_OFFSET_US;
  
  /*
  -> TA: Master device send cmd to BLE Master to trigger sync every 5 seconds
  -> TA: BLE Master start internal sync
  -> TA+300ms: BLE Master end internal sync
  -> TA+400ms: BLE Master send sync cmd to BLE Slave(A/B/C)
  -> TA+500ms: BLE Slave(A/B/C) write uart at same time
  */
  
  // start internal sync first, which lasts TIME_SYNC_WINDOW_MS
  internal_time_sync_schedule();
  
  // then send cmd to trigger synchronized uart action after internal sync data being available
  
  #ifdef PROFILE_DEBUG_2
  platform_printf("SYNC CMD (M:%lld)us\n",ble_data_came_sync.start_time_us);
  #endif
}

/*
    API to send raw packet, the payload contains the specific time when packet will be issued out with unit of us
*/
void packet_action(void)
{
    static uint8_t counter = 0;
    uint64_t start_time_us = platform_get_us_time() + 3*1000;

    // updatae payload
    internal_raw_data_time_sync.index = ++counter;
    internal_raw_data_time_sync.send_time_us = start_time_us;
    ll_raw_packet_set_tx_data(raw_packet, (counter) & 0x7f, (void*)&internal_raw_data_time_sync, sizeof(raw_sync_packet_format_s));

    // call function to send raw packet
    if(ll_raw_packet_send(raw_packet, start_time_us))
    {
        internal_time_sync_info.debug_failed_pkt_cnt++;
        #ifdef PROFILE_DEBUG
        platform_printf("Tx send error !!!\n");
        #endif
        btstack_push_user_msg(USER_TRIGGER_RAW_PKT, NULL, 0);
    }
    else
    {
        internal_time_sync_info.pkt_cnt++;
        #ifdef PROFILE_DEBUG
        platform_printf("Tx start(%d) %llu us\n", counter, start_time_us);
        #endif
    }
}

void on_raw_packet_done(struct ll_raw_packet *packet, void *user_data)
{
  if(internal_time_sync_info.time_sync_flag&TIME_SYNC_START){packet_action();}
}

/*  
    time sync init function, initialization of raw packet
*/
void internal_time_sync_init(void)
{
    #define FOR_TX 1
    raw_packet = ll_raw_packet_alloc(FOR_TX, on_raw_packet_done, NULL);
    ll_raw_packet_set_param(raw_packet,
                      3,        // tx_power
                      CH_ID,    // phy_channel_id
                      1,        // phy
                      0x8E89BED6,//0xabcdef,
                      0x555555);
}