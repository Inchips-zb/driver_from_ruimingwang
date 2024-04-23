#include <stdio.h>
#include <string.h>
#include <math.h>
#include "platform_api.h"
#include "att_db.h"
#include "gap.h"
#include "btstack_event.h"
#include "btstack_defines.h"
#include "port_gen_os.h"
#include "profile.h"
#include "time_sync.h"

/* ==============================================================
    variables definition
*/
struct ll_raw_packet      *raw_packet;
uint8_t                   sync_data[256] = {0};
internal_time_sync_offset_track_s  internal_time_sync_offset;
came_sync_info_s          came_sync_info;

/* ==============================================================
    APIs definition
*/

void internal_time_sync_schedule(void)
{
    //start recving raw packet
    internal_time_sync_offset.filter_pool1_idx = 0;
    internal_time_sync_offset.filter_pool2_idx = 0;

    internal_time_sync_offset.time_sync_flag = TIME_SYNC_PERIOD_START;
    // time sync event only last for TIME_SYNC_WINDOW_MS, setup a timer to stop the event
    timer1_enable(TIMER_CYCLE_PER_MS*internal_time_sync_offset.sync_period_ms);
    // start raw packet receiving
    __disable_irq();
    btstack_push_user_msg(USER_TRIGGER_RAW_PKT_RECV, 0, 0);
}

void came_sync_schedule0(void)
{
  int64_t local = 0;
  int64_t delta = 0;
  double a,b;
  int64_t offset = 0;
  uint32_t offset_1 = 0;
  if(internal_time_sync_offset.offset_gap_us)
  {
    // convert it to local time
    local = came_sync_info.packet.start_time_us - internal_time_sync_offset.offset_gap_us;
    delta = (local - internal_time_sync_offset.last_recv_time_us);
    
    a = local;
    b = delta;
    b = (b*internal_time_sync_offset.d_offset_us_per_sec)/(1000*1000);
    
    a += b;
    
    offset = round(a);

    #if TRIGGER_MODE_V0
    __disable_irq();
    #define OFFSET_ADVANCE_US (1000)
    if((offset - platform_get_us_time()) > OFFSET_ADVANCE_US)
    {
      offset_1 = (offset - platform_get_us_time());
      timer2_enable(offset_1*TIMER_CYCLE_PER_US);
    }
    __enable_irq();
    #endif
    
    #if TRIGGER_MODE_V1
    if(offset > 0)
    {
      came_sync_info.next_start_time_us = offset;
      if((offset - platform_get_us_time()) > SYNC_OFFSET_ADVANCE_US)
      {
        offset_1 = (offset - platform_get_us_time());
        timer2_enable((offset_1-SYNC_TIMER_ADVANCE_US)*TIMER_CYCLE_PER_US);
      }
    }
    #endif
    
    #ifdef PROFILE_DEBUG_1
    platform_printf("local (%lld,%lld)%0.2f [%0.2f][%d] \n",came_sync_info.packet.start_time_us,
      internal_time_sync_offset.offset_gap_us,
      a, b, offset_1);
    #endif
    #ifdef PROFILE_DEBUG_2
    platform_printf("SYNC CMD (M:%lld, S:%lld)us drift:%0.2f \n",came_sync_info.packet.start_time_us,offset,
      internal_time_sync_offset.d_offset_us_per_sec);
    #endif
  }
}

double data_get_average_float(double a[], uint32_t n)
{
  uint32_t i;
  double total = 0;
  
  for(i = 0; i < n; i++)
  {
    total += a[i];
  }

  return (total/n);
}

int32_t data_with_high_frequency(int32_t a[], uint32_t n)
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
  for(i = 0,j = 0; i < n; i++)
  {
    if(b[i] > b[j]){j = i;}
  }

  return (a[j]);
}

int64_t data_with_high_frequency1(int64_t a[], uint32_t n)
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
  for(i = 0,j = 0; i < n; i++)
  {
    if(b[i] > b[j]){j = i;}
  }

  return (a[j]);
}

double data_get_variance(int64_t a[], uint32_t n)
{
  uint32_t i;
  double sum = 0;
  double ave = 0;
  int64_t total = 0;
  for(i = 0; i < n; i++)
  {
    total += a[i];
  }
  ave = total/n;
  
  for(i = 0; i < n; i++)
  {
      sum += pow(a[i] - ave, 2);
  }
  
  return pow(sum/n, 0.5);
}


double time_sync_delta_get_variance(internal_time_sync_offset_data_s a[], uint32_t n)
{
  uint32_t i;
  double sum = 0;
  double ave = 0;
  int64_t total = 0;
  for(i = 0; i < n; i++)
  {
    total += a[i].delta_us;
  }
  ave = total/n;
  
  for(i = 0; i < n; i++)
  {
      sum += pow(a[i].delta_us - ave, 2);
  }
  
  return pow(sum/n, 0.5);
}
/*
  a[], the source data list
  n, how many items in the data list
  idx, the index of the item which appears with the highest frequency
  cnt, how many times it appears
*/
void time_sync_delta_with_high_frequency(internal_time_sync_offset_data_s a[], uint32_t n, uint32_t* idx, uint32_t* cnt)
{
  uint32_t i, j;
  uint8_t b[FILTER_DEPTH2] = {0};
  
  memset(b, 0 , sizeof(b));
  for(i = 0; i < n; i++)
  {
    for(j = 0; j < i; j++)
    {
      if(a[i].delta_us == a[j].delta_us){b[j]++;break;}
    }
  }
  for(i = 0,j = 0; i < n; i++)
  {
    if(b[i] > b[j]){j = i;}
    //platform_printf("- %d - ", b[i]);
  }

  *idx = j;
  *cnt = b[j];
}

void internal_time_sync_reset(void)
{
    timer1_disable();
    timer2_disable();

    memset(&internal_time_sync_offset,0,sizeof(internal_time_sync_offset));
}


void internal_time_sync_stop(void)
{
    __enable_irq();
    internal_time_sync_offset.time_sync_flag = TIME_SYNC_PERIOD_STOP;
    
    #ifdef PROFILE_DEBUG_1
    platform_printf("idx %d ", internal_time_sync_offset.filter_pool2_idx);
    #endif
    btstack_push_user_msg(USER_MSG_INTERNAL_SYNC_POST_PROCESSING, 0, 0);

}


void internal_internal_time_sync_offset_post_processing(void)
{
  uint32_t idx = 0xff, cnt = 0;

  time_sync_delta_with_high_frequency(internal_time_sync_offset.filter_pool2, internal_time_sync_offset.filter_pool2_idx, &idx, &cnt);
  #define STABLE_INDEX (10)
  if(cnt >= STABLE_INDEX)
  {
    if(internal_time_sync_offset.last_recv_time_us && internal_time_sync_offset.last_send_time_us)
    {
      internal_internal_time_sync_offset_calculation(internal_time_sync_offset.last_send_time_us, internal_time_sync_offset.last_recv_time_us, 
                                  internal_time_sync_offset.filter_pool2[idx].send_time_us,
                                  internal_time_sync_offset.filter_pool2[idx].recv_time_us);
      internal_time_sync_offset.offset_gap_us = internal_time_sync_offset.filter_pool2[idx].delta_us;
    }
    internal_time_sync_offset.last_recv_time_us = internal_time_sync_offset.filter_pool2[idx].recv_time_us;
    internal_time_sync_offset.last_send_time_us = internal_time_sync_offset.filter_pool2[idx].send_time_us;

  }
  #ifdef PROFILE_DEBUG_1
  platform_printf("(%d) (%d) (%0.2f) \n", cnt, idx, internal_time_sync_offset.d_offset_us_per_sec);
  #endif
}

int32_t internal_time_sync_drift_filter(int32_t val)
{
  static uint32_t cnt = 0;
  static uint32_t flag = 0;
  
  came_sync_info.filter_pool[cnt++] = val;
  if(FILTER_DEPTH == cnt){cnt = 0; flag = 1;}

  return data_with_high_frequency(came_sync_info.filter_pool,(flag)?FILTER_DEPTH:cnt);
}

double internal_time_sync_drift_filter1(double val)
{
  static uint32_t cnt = 0;
  static uint32_t flag = 0;
  
  came_sync_info.filter_pool1[cnt++] = val;
  if(FILTER_DEPTH == cnt){cnt = 0; flag = 1;}

  return data_get_average_float(came_sync_info.filter_pool1,(flag)?FILTER_DEPTH:cnt);
}

void internal_internal_time_sync_offset_calculation(uint64_t l0,uint64_t l1,uint64_t c0,uint64_t c1)
{
    int64_t offset_us = 0;
    int64_t offset_us_base = 0;
    double a,b;
  
    if((c0 > l0) && (c1 > l1))
    {
        offset_us = ((c1 - l1) - (c0 - l0));
        offset_us = (offset_us * (1000*1000));
        offset_us_base = (c0 - l0) ;
        // offset per second compared with raw packet distributor
      
        a = offset_us;
        b = offset_us_base;
        
        #if 0
        internal_time_sync_offset.offset_us_per_sec = internal_time_sync_drift_filter(offset_us/offset_us_base);//round(offset_us_per_sec);
        #else
        internal_time_sync_offset.d_offset_us_per_sec = internal_time_sync_drift_filter1(a/b);
        #endif

        internal_time_sync_offset.sync_peroid_interval_us = offset_us_base;

    }
}

void internal_internal_time_sync_offset_record(uint64_t send_time, uint64_t recv_time)
{

    uint32_t *buf_index2 = &(internal_time_sync_offset.filter_pool2_idx);
    if(*buf_index2 < FILTER_DEPTH2)
    {
      internal_time_sync_offset.filter_pool2[*buf_index2].send_time_us = send_time;
      internal_time_sync_offset.filter_pool2[*buf_index2].recv_time_us = recv_time;
      internal_time_sync_offset.filter_pool2[*buf_index2].delta_us = ((int64_t)send_time - recv_time);
      (*buf_index2)++;
    }
    else
    {
      internal_time_sync_offset.time_sync_flag = TIME_SYNC_PERIOD_STOP;
    }

}

void internal_time_sync_show_rx(struct ll_raw_packet *packet)
{
    uint64_t air_time;
    uint8_t header;
    uint8_t packet_index;
    uint64_t packet_time_us;
    int len;
    int rssi;
    
    if (ll_raw_packet_get_rx_data(packet, &air_time, &header, sync_data, &len, &rssi) == 0)
    {
        // read data out from payload
        time_sync_packet_format_s *p = (time_sync_packet_format_s*)sync_data;
        packet_index = p->index;
        packet_time_us = p->send_time_us;

        internal_internal_time_sync_offset_record(packet_time_us, air_time);

        #ifdef PROFILE_DEBUG
        platform_printf("T(%d): %llu (%llu)us\n", packet_index, packet_time_us, air_time);
        #endif
    }
    else
    {
        // enable debug only when necessary
        #ifdef PROFILE_DEBUG
        platform_printf("Rx error\n");
        #endif
    }
    btstack_push_user_msg(USER_TRIGGER_RAW_PKT_RECV, 0, 0);
}

int internal_time_sync_recv_schedule(uint32_t window_len_us)
{
    int ret = 0;
    
    ret = ll_raw_packet_recv(raw_packet, platform_get_us_time() + 500, window_len_us);
    if(ret)
    {
        btstack_push_user_msg(USER_TRIGGER_RAW_PKT_RECV, 0, 0);
        // enable debug only when necessary
        #ifdef PROFILE_DEBUG
        platform_printf("RX recv error (%d)\n",ret);
        #endif
    }
    
    return ret;
}

/*
    call back function of raw packet when rx is done
*/
void on_raw_packet_done(struct ll_raw_packet *packet, void *user_data)
{
    internal_time_sync_show_rx(raw_packet);
}
/*  
    time sync init function, initialization of raw packet
*/
void internal_time_sync_init()
{
    #define FOR_TX 0
    raw_packet = ll_raw_packet_alloc(FOR_TX, on_raw_packet_done, NULL);
    ll_raw_packet_set_param(raw_packet,
                      3,        // tx_power
                      CH_ID,    // phy_channel_id
                      1,        // phy
                      0x8E89BED6,//0xabcdef,
                      0x555555);

}