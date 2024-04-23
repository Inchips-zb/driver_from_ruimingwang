#include <stdio.h>
#include <string.h>
#include "platform_api.h"
#include "att_db.h"
#include "gap.h"
#include "att_dispatch.h"
#include "btstack_util.h"
#include "btstack_event.h"
#include "btstack_defines.h"
#include "gatt_client.h"

#include "ad_parser.h"

void ranging_init(void);
void raning_record_data(int8_t rssi);
void ranging_enable_rssi_sampling(uint8_t enable);

// GATT characteristic handles
#include "../data/gatt.const"

const static uint8_t adv_data[] = {
    #include "../data/advertising.adv"
};

#include "../data/advertising.const"

const static uint8_t scan_data[] = {
    #include "../data/scan_response.adv"
};

#include "../data/scan_response.const"

const static uint8_t profile_data[] = {
    #include "../data/gatt.profile"
};

#pragma pack (push, 1)
typedef struct read_rssi_complete
{
  uint8_t  status;
  uint16_t handle;
  int8_t   rssi;
} read_rssi_complete_t;
#pragma pack (pop)

#define OGF_STATUS_PARAMETERS       0x05
#define OPCODE(ogf, ocf)            (ocf | ogf << 10)
#define OPCODE_READ_RSSI            OPCODE(OGF_STATUS_PARAMETERS, 0x05)



static uint16_t att_read_callback(hci_con_handle_t connection_handle, uint16_t att_handle, uint16_t offset, 
                                  uint8_t * buffer, uint16_t buffer_size)
{
    switch (att_handle)
    {

    default:
        return 0;
    }
}

static btstack_packet_callback_registration_t hci_event_callback_registration;

static int att_write_callback(hci_con_handle_t connection_handle, uint16_t att_handle, uint16_t transaction_mode, 
                              uint16_t offset, const uint8_t *buffer, uint16_t buffer_size)
{
    switch (att_handle)
    {

    default:
        return 0;
    }
}
#define USER_MSG_READ_RSSI  7
static void user_msg_handler(uint32_t msg_id, void *data, uint16_t size)
{
    switch (msg_id)
    {
    case USER_MSG_READ_RSSI:
      {
        gap_read_rssi(size);
      }
      break;
    default:
        ;
    }
}

static initiating_phy_config_t phy_configs[] =
{
    {
        .phy = PHY_1M,
        .conn_param =
        {
            .scan_int = 200,
            .scan_win = 180,
            .interval_min = 20,
            .interval_max = 20,
            .latency = 0,
            .supervision_timeout = 600,
            .min_ce_len = 30,
            .max_ce_len = 30
        }
    }
};

static const scan_phy_config_t configs[2] =
{
    {
        .phy = PHY_1M,
        .type = SCAN_PASSIVE,
        .interval = 200,
        .window = 50
    },
    {
        .phy = PHY_CODED,
        .type = SCAN_PASSIVE,
        .interval = 200,
        .window = 50
    }
};

static void user_packet_handler(uint8_t packet_type, uint16_t channel, const uint8_t *packet, uint16_t size)
{
    static const bd_addr_t rand_addr = { 0xF2, 0x8D, 0xC4, 0x7E, 0x76, 0x59 };
    static const bd_addr_t peer_addr = { 0xD9, 0x34, 0x35, 0x36, 0x37, 0x96 };
    uint8_t event = hci_event_packet_get_type(packet);
    const btstack_user_msg_t *p_user_msg;
    if (packet_type != HCI_EVENT_PACKET) return;

    switch (event)
    {
    case BTSTACK_EVENT_STATE:
        if (btstack_event_state_get_state(packet) != HCI_STATE_WORKING)
            break;
        gap_set_random_device_address(rand_addr);
        gap_set_ext_scan_para(BD_ADDR_TYPE_LE_RANDOM, SCAN_ACCEPT_ALL_EXCEPT_NOT_DIRECTED,
                              sizeof(configs) / sizeof(configs[0]),
                              configs);
        gap_set_ext_scan_enable(1, 0, 0, 0);   // start continuous scanning
        break;

    case HCI_EVENT_LE_META:
        switch (hci_event_le_meta_get_subevent_code(packet))
        {
        case HCI_SUBEVENT_LE_EXTENDED_ADVERTISING_REPORT:
            {
              const le_ext_adv_report_t *report = decode_hci_le_meta_event(packet, le_meta_event_ext_adv_report_t)->reports;
              bd_addr_t adv_peer_addr;
              reverse_bd_addr(report->address, adv_peer_addr);

              if (memcmp(peer_addr, adv_peer_addr, BD_ADDR_LEN) == 0)
              {
                /* RSSI_ADV: use adv to collect rssi */
                #ifdef RSSI_ADV
                raning_record_data(report->rssi);
                #endif
              
                /* RSSI_CONNECTION: use connection to collect rssi */
                #ifdef RSSI_CONNECTION
                gap_set_ext_scan_enable(0, 0, 0, 0);
                
                printf(">> connecting to salve ...\n");

                if (report->evt_type & HCI_EXT_ADV_PROP_USE_LEGACY)
                    phy_configs[0].phy = PHY_1M;
                else
                    phy_configs[0].phy = (phy_type_t)(report->s_phy != 0 ? report->s_phy : report->p_phy); 
                gap_ext_create_connection(    INITIATING_ADVERTISER_FROM_PARAM, // Initiator_Filter_Policy,
                                              BD_ADDR_TYPE_LE_RANDOM,           // Own_Address_Type,
                                              report->addr_type,                // Peer_Address_Type,
                                              peer_addr,                        // Peer_Address,
                                              sizeof(phy_configs) / sizeof(phy_configs[0]),
                                              phy_configs);
                #endif
              }
            }
            break;
       case HCI_SUBEVENT_LE_ENHANCED_CONNECTION_COMPLETE:
            {
                const le_meta_event_enh_create_conn_complete_t *conn_complete;
                conn_complete = decode_hci_le_meta_event(packet, le_meta_event_enh_create_conn_complete_t);
                if (conn_complete->status == 0)
                {
                  platform_printf("Connected to handle %d \n", conn_complete->handle);
                  gatt_client_is_ready(conn_complete->handle);
                  
                  #ifdef RSSI_CONNECTION
                  /* default is 0dbm power, use POWER_MIN to decrease tx power of both central and peripheral */
                  #ifdef POWER_MIN
                  ll_set_conn_tx_power(conn_complete->handle,-30);
                  ll_adjust_conn_peer_tx_power(conn_complete->handle,-30);
                  #endif
                  ranging_enable_rssi_sampling(1);
                  #endif
                }
                else
                  platform_printf("fails\n");

            }
            break;
        default:
            break;
        }

        break;

    case HCI_EVENT_DISCONNECTION_COMPLETE:
        #ifdef RSSI_CONNECTION
        ranging_enable_rssi_sampling(0);
        #endif
        break;

    case L2CAP_EVENT_CAN_SEND_NOW:
        // add your code
        break;

    case BTSTACK_EVENT_USER_MSG:
        p_user_msg = hci_event_packet_get_user_msg(packet);
        user_msg_handler(p_user_msg->msg_id, p_user_msg->data, p_user_msg->len);
        break;

    case HCI_EVENT_COMMAND_COMPLETE:
    {
      if (hci_event_command_complete_get_command_opcode(packet) == OPCODE_READ_RSSI)
      {
        const read_rssi_complete_t *cmpl =
          (const read_rssi_complete_t *)hci_event_command_complete_get_return_parameters(packet);
        static uint32_t cnt = 0;
        if(cnt++ > 50) raning_record_data(cmpl->rssi);
      }
    }
    break;
    
    default:
        break;
    }
}

uint32_t setup_profile(void *data, void *user_data)
{   
    att_server_init(att_read_callback, att_write_callback);
    hci_event_callback_registration.callback = user_packet_handler;
    hci_add_event_handler(&hci_event_callback_registration);
    att_server_register_packet_handler(user_packet_handler);
    gatt_client_register_handler(user_packet_handler);
    
    ranging_init();
    return 0;
}

