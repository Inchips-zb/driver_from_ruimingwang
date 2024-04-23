#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include "platform_api.h"
#include "att_db.h"
#include "gap.h"
#include "att_dispatch.h"
#include "btstack_util.h"
#include "btstack_event.h"
#include "btstack_defines.h"
#include "gatt_client.h"
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"
#include "timers.h"
#include "queue.h"

typedef enum
{
  RANGING_SAMPLING_START,
  RANGING_SAMPLING_DATA_PREPARED,
  RANGING_SAMPLING_DATA_PROCESSED
}ranging_sampling_e;

#define RSSI_NUM (105)
#define RSSI_XXX (10)

typedef struct
{
  float n;/* comes from training data, such as 1.7 */
  float x;/* iterated data of distance*/
  float P;/* iterated data of variance*/
  
  /* params for Kalman */
  uint8_t A;
  uint8_t H;
  float Q;
  float R;
  
  float rssi0;/* rssi at 1m*/
  uint8_t d0;/* 1m*/
  
  uint8_t            ref_rssi_idx;
  int8_t             ref_rssi[2][RSSI_NUM];
  ranging_sampling_e sampling;
  
  /* compare tendency */
  uint32_t pos;
  uint32_t neg;
}ranging_info_s;

static TimerHandle_t app_timer = 0;
static SemaphoreHandle_t sem_wakeup = NULL;
static const bd_addr_t peer_addr = { 0xD9, 0x34, 0x35, 0x36, 0x37, 0x96 };
//static const bd_addr_t peer_addr = { 0xAC, 0xDE, 0x48, 0x00, 0x00, 0x80 };
ranging_info_s ranging_info;

#define QUEUE_LENGTH    30
#define ITEM_SIZE       sizeof(uint32_t) 
static StaticQueue_t xStaticSampleQueue;
static uint8_t ucQueueStorageArea[ITEM_SIZE * QUEUE_LENGTH];
QueueHandle_t xSampleQueue;
 
void raning_get_cox_staut(int8_t a[], uint32_t n, uint32_t *pos_cnt, uint32_t *neg_cnt)
{
  uint32_t mid = n/2, pos = 0, neg = 0, i;
  int32_t diff = 0;
  for(i = 0; i < mid; i++)
  {
    diff=a[i+mid]-a[i];
    if(diff > 0){pos += 1;}
    else if(diff < 0){neg += 1;}
  }
  *pos_cnt = pos;
  *neg_cnt = neg;
}

float gaussrand_NORMAL()
{
  static float V1, V2, S;
  static int phase = 0;
  float X;

  if (phase == 0) {
    do {
      float U1 = (float) rand() / (float)RAND_MAX;
      float U2 = (float) rand() / (float)RAND_MAX;

      V1 = 2 * U1 - 1;
      V2 = 2 * U2 - 1;
      S = V1 * V1 + V2 * V2;
    } while (S >= 1 || S == 0);

    X = V1 * sqrt(-2 * log(S) / S);
  } else
    X = V2 * sqrt(-2 * log(S) / S);

  phase = 1 - phase;

  return X;
}

float gaussrand(float mean, float stdc) {
  return mean + gaussrand_NORMAL() * stdc;
}

void ranging_kalman(float x, float P, int8_t s, uint8_t A, uint8_t H, float Q, float R, float *nx, float *nP)
{
  /*
    input:
        - signal: signal to be filtered
        - x: previous mean state
        - P: previous variance state
        - s: current observation
        - A, H, Q, R: kalman filter parameters

    output:
        - x: mean state prediction
        - P: variance state prediction
  */
  float x_mean, P_mean, K, lx, lP;
  
  x_mean = A * x + gaussrand(0,Q);
  P_mean = A * P * A + Q;

  K = P_mean * H * (1 / (H * P_mean * H + R));
  lx = x_mean + K * (s - H * x_mean);
  lP = (1 - K * H) * P_mean;

  *nx = lx;
  *nP = lP;
}

int32_t ranging_get_mode_of_data(int8_t a[], uint32_t n, uint32_t *idx, uint32_t *num)
{
  uint32_t i, j;
  uint8_t b[RSSI_XXX] = {0};
  
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

  *idx = j;
  *num = b[j];
  
  return (a[j]);
}

float ranging_get_variance_of_data(float a[], uint32_t n, float *aveage)
{
  uint32_t i;
  double sum = 0,ave = 0;
  for(i = 0; i < n; i++)
  {
    ave += a[i];
  }
  ave = ave / n;
  *aveage = ave;
  for(i = 0; i < n; i++)
  {
    sum += pow(a[i] - ave, 2);
  }
  return (pow(sum/n, 0.5));
}

float ranging_get_rssi_gauss(float min, float max, int8_t a[], uint32_t n)
{
  uint32_t i;
  double sum = 0,cnt=0, rst = 0;
  
  for(i = 0; i < n; i++)
  {
      if((min <= a[i]) &&(a[i] <= max))
      {
        sum += a[i];cnt++;
      }
  }
  rst = sum/cnt;
  return (rst);
}

float estimate_distance(float rssi0, uint8_t d0, float rssi, float n)
{
  return (d0 * pow(10, (rssi0 - rssi) / (10.0 * n)));
}

static void packet_schedule_task(void *pdata)
{
  uint32_t i;
  float ave, d, x, P;
  uint32_t msg;
  float temp[RSSI_NUM];
  for (;;)
  {
    if (xQueueReceive(xSampleQueue, &msg, portMAX_DELAY ) != pdPASS)
        continue;
    
    switch(ranging_info.sampling)
    {
      case RANGING_SAMPLING_DATA_PREPARED:
      {
        /* two options:
           ALG_AVERAGE: take an average of the raw rssi, and produce one value 
           ALG_KALMAN: process the raw data with Kalman first, then average it */
        #ifdef ALG_AVERAGE
        ranging_get_variance_of_data(ranging_info.ref_rssi[(uint8_t)msg], RSSI_NUM, &ave);
        d = estimate_distance(ranging_info.rssi0,ranging_info.d0,ave,ranging_info.n);
        #endif
        
        #ifdef ALG_KALMAN
        ranging_info.x = ranging_info.ref_rssi[(uint8_t)msg][0];
        ranging_info.P = 0;
        temp[0] = ranging_info.x;
        for(i = 1; i < RSSI_NUM; i++)
        {
          ranging_kalman(ranging_info.x,ranging_info.P,ranging_info.ref_rssi[(uint8_t)msg][i],1,1,0.1,2.5,&x, &P);
          ranging_info.x = x;
          ranging_info.P = P;
          temp[i] = ranging_info.x;
        }
        
        ranging_get_variance_of_data(temp, RSSI_NUM, &ave);
        d = estimate_distance(ranging_info.rssi0,ranging_info.d0,ave,ranging_info.n);
        #endif
        
        raning_get_cox_staut(ranging_info.ref_rssi[(uint8_t)msg],RSSI_NUM,&ranging_info.pos,&ranging_info.neg);
        ranging_info.sampling = RANGING_SAMPLING_DATA_PROCESSED;
        // ranging_info.pos-ranging_info.neg > 0: approaching
        platform_printf("d %f ave %f [%d]\n", d, ave, ranging_info.pos-ranging_info.neg);
      }break;
      default:
      break;
    }
  }
}

void raning_record_data(int8_t rssi)
{
    uint32_t i;
    static uint32_t index = 0;
    
    ranging_info.ref_rssi[ranging_info.ref_rssi_idx][index++] = rssi;
    if(index >= (RSSI_NUM-1))
    {
      ranging_info.sampling = RANGING_SAMPLING_DATA_PREPARED;
      xQueueSend(xSampleQueue, &(ranging_info.ref_rssi_idx),0);
      ranging_info.ref_rssi_idx = (ranging_info.ref_rssi_idx) ? 0 : 1;
      index = 0;
    }
}

void ranging_enable_rssi_sampling(uint8_t enable)
{
  if(enable)
  {
    xTimerReset(app_timer, portMAX_DELAY);
  }
  else
  {
    xTimerStop(app_timer, portMAX_DELAY);
  }
}

#define USER_MSG_READ_RSSI  7
static void app_timer_callback(TimerHandle_t xTimer)
{
    btstack_push_user_msg(USER_MSG_READ_RSSI, NULL, 0);
}

void ranging_init(void)
{
  ranging_info.n = 1.6;
  ranging_info.sampling = RANGING_SAMPLING_START;
  ranging_info.ref_rssi_idx = 0;
  ranging_info.d0 = 1;
  ranging_info.rssi0 = -28.83;
  
  ranging_info.A = 1;
  ranging_info.H = 1;
  ranging_info.Q = 0.1;
  ranging_info.R = 2.5;

  xSampleQueue = xQueueCreateStatic(QUEUE_LENGTH,
                               ITEM_SIZE,
                               ucQueueStorageArea,
                               &xStaticSampleQueue); 
  sem_wakeup = xSemaphoreCreateBinary();
  xTaskCreate(packet_schedule_task,
         "p",
         configMINIMAL_STACK_SIZE*10,
         NULL,
         (configMAX_PRIORITIES - 14),
         NULL);

  app_timer = xTimerCreate("a",
                          pdMS_TO_TICKS(50),
                          pdTRUE,
                          NULL,
                          app_timer_callback);

}
