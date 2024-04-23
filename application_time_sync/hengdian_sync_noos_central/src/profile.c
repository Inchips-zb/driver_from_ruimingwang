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

/* ==============================================================
    macro definition
*/
// change it depend on how many peripherals that need to connect with, maximum 6
#define MAX_CONN_NUMBER          2

/* ==============================================================
    variables definition
*/
static uint8_t              is_initiating = 0;
hci_con_handle_t            conn_handles[MAX_CONN_NUMBER];
gatt_client_notification_t  clients[MAX_CONN_NUMBER] = {0};

ble_att_time_sync_packet_format_s ble_data_time_sync;
ble_att_came_sync_packet_format_s ble_data_came_sync;
ble_att_data_packet_format_s      ble_data_packet;
/* ==============================================================
    APIs definition
*/
static uint16_t att_read_callback(hci_con_handle_t connection_handle, uint16_t att_handle, uint16_t offset, 
                                  uint8_t * buffer, uint16_t buffer_size)
{
    switch (att_handle)
    {
    case HANDLE_GENERIC_INPUT:
        if (buffer)
        {
            // add your code
            return buffer_size;
        }
        else
            return 1; // TODO: return required buffer size

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
    case HANDLE_GENERIC_INPUT:
        // add your code
        return 0;

    default:
        return 0;
    }
}

void ble_att_send_data(int i, uint8_t* data, uint32_t size)
{
    uint8_t r;
    uint16_t send_packet_len = 0;

    if (conn_handles[i] != INVALID_HANDLE)
    {
        gatt_client_get_mtu(conn_handles[i], &send_packet_len);
        send_packet_len -= 3;
        size = (size > send_packet_len) ? send_packet_len : size;
        r = gatt_client_write_value_of_characteristic_without_response(conn_handles[i],
                                                                       HANDLE_GENERIC_INPUT,
                                                                       size, data);
        if (r != 0)
        {
            #ifdef PROFILE_DEBUG
            platform_printf("error!(%d)\n", r);
            #endif
        }
    }

}
 
void ble_att_send_time_sync_data(int i)
{
    ble_data_time_sync.header = BLE_ATT_PACKET_HEADER_INTERNAL_TIME_SYNC;
    ble_data_time_sync.period_ms = TIME_SYNC_WINDOW_MS;
    ble_att_send_data(i, (uint8_t*)&ble_data_time_sync, sizeof(ble_att_time_sync_packet_format_s));
}

void ble_att_send_came_sync_data(int i)
{
    ble_data_came_sync.header = BLE_ATT_PACKET_HEADER_CAME_SYNC;
    ble_att_send_data(i, (uint8_t*)&ble_data_came_sync, sizeof(ble_att_came_sync_packet_format_s));
}

void ble_att_send_application_data(int i)
{
    ble_att_send_data(i, (uint8_t*)&ble_data_packet, ble_data_packet.len+3);
}

/*
    API that informs application layer of the data comes from peripheral devices
*/
static void output_notification_handler(uint8_t packet_type, uint16_t channel, const uint8_t *packet, uint16_t size)
{
    const gatt_event_value_packet_t *value;
    uint16_t value_size, i;

    switch (packet[0])
    {
    case GATT_EVENT_NOTIFICATION:
        value = gatt_event_notification_parse(packet, size, &value_size);
        if (value_size)
        {
            ble_att_data_packet_format_s *p = (ble_att_data_packet_format_s*)&(value->value[0]);
            switch(p->header)
            {
                case BLE_ATT_PACKET_HEADER_DATA:
                    {
                        uart_external_send_data(p->data,p->len);
                        platform_printf("peripheral(%d) size:%d, 0x%x\n",channel, value_size, p->data);
                    }
                    break;
                case BLE_ATT_PACKET_HEADER_DEV_SYNC:
                    {
                        ble_external_send_dev_sync_data(p->data,p->len,channel);
                        platform_printf("dev sync(%d) size:%d, 0x%x\n",channel, value_size, p->data);
                    }
                    break;
                default:
                    break;
            }
        }
        break;
    }
}
/*
    on the att call back, start time sync event, since ble connection has already been setup
*/
void write_characteristic_descriptor_callback(uint8_t packet_type, uint16_t _, const uint8_t *packet, uint16_t size)
{
    switch (packet[0])
    {
    case GATT_EVENT_QUERY_COMPLETE:

        break;
    }
}

/*  
    API to inform att server that notify is allowed at this time
*/
void start_notify(int i)
{

    static uint16_t config = GATT_CLIENT_CHARACTERISTICS_CONFIGURATION_NOTIFICATION;

    {
      if (conn_handles[i] != INVALID_HANDLE)
      {
        platform_printf("start_notify handle %d\n", conn_handles[i]);
        gatt_client_listen_for_characteristic_value_updates(
                    clients + i, output_notification_handler,
                    conn_handles[i], HANDLE_GENERIC_OUTPUT);
        gatt_client_write_characteristic_descriptor_using_descriptor_handle(
                write_characteristic_descriptor_callback,
                conn_handles[i],
                HANDLE_GENERIC_OUTPUT_CLIENT_CHAR_CONFIG,
                sizeof(config),
                (uint8_t *)&config);
      }
    }
}

void print_conn_state(void)
{
    int i;
    platform_printf("Conn Map:");
    for (i = 0; i < MAX_CONN_NUMBER; i++)
    {
        if ((i & 7) == 0)
            platform_printf("\n%2d: ", i);
        platform_printf(conn_handles[i] == INVALID_HANDLE ? "." : "*");
    }
    platform_printf("\n");
}

int is_all_peripheral_connected(void)
{
  return (total_conn_num() == MAX_CONN_NUMBER);
}

int total_conn_num(void)
{
    int i;
    int r = 0;

    for (i = 0; i < MAX_CONN_NUMBER; i++)
    {
        if (conn_handles[i] != INVALID_HANDLE)
            r++;
    }
    return r;
}

void start_scan_if_needed0(void)
{
    int i;

    print_conn_state();

    if (is_initiating) return;

    for (i = 0; i < MAX_CONN_NUMBER; i++)
    {
        if (conn_handles[i] == INVALID_HANDLE)
            break;
    }

    if (i >= MAX_CONN_NUMBER)
    {
        platform_printf("ALL Connected\n");
        gap_set_ext_scan_enable(0, 0, 0, 0);
        return;
    }

    gap_set_ext_scan_enable(1, 0, 0, 0);   // start continuous scanning
}

/*
    the ble address of central and peripheral
    the address of peripheral should be increased by step 1(if there are multiple peripheral)
    { 0xC3, 0xD4, 0x17, 0x9A, 0xED, 0x00 }
    { 0xC3, 0xD4, 0x17, 0x9A, 0xED, 0x01 }
    etc...
*/
const static bd_addr_t rand_addr = { 0xD1, 0xF8, 0x33, 0x65, 0xF4, 0x23 };
bd_addr_t peer_addr              = { 0xC3, 0xD4, 0x17, 0x9A, 0xED, 0x00 };

static initiating_phy_config_t phy_configs[] =
{
    {
        .phy = PHY_1M,
        .conn_param =
        {
            .scan_int = 150,
            .scan_win = 100,
            .interval_min = 350,
            .interval_max = 350,
            .latency = 0,
            .supervision_timeout = 800,
            .min_ce_len = 7,
            .max_ce_len = 7
        }
    }
};

/*
    API to achieve mass ble connection, the peer ble address should be known in advance and put into white list
*/
void initiate_if_needed(void)
{
    int i;
    int c = 0;

    print_conn_state();

    if (is_initiating) return;

    gap_clear_white_lists();

    for (i = 0; i < MAX_CONN_NUMBER; i++)
    {
        if (conn_handles[i] == INVALID_HANDLE)
        {
            c++;
            // take care here, the peer address has a fixed pattern
            peer_addr[BD_ADDR_LEN - 1] = i;
            gap_add_whitelist(peer_addr, BD_ADDR_TYPE_LE_RANDOM);
        }
    }

    if (0 == c)
    {
        platform_printf("ALL Connected\n");
        gap_set_ext_scan_enable(0, 0, 0, 0);
        return;
    }

    platform_printf("connecting...\n");

    gap_ext_create_connection(INITIATING_ADVERTISER_FROM_LIST, // Initiator_Filter_Policy,
                              BD_ADDR_TYPE_LE_RANDOM,          // Own_Address_Type,
                              BD_ADDR_TYPE_LE_RANDOM,          // Peer_Address_Type,
                              NULL,                            // Peer_Address,
                              sizeof(phy_configs) / sizeof(phy_configs[0]),
                              phy_configs);
    is_initiating = 1;
    // setup timeout timer
    platform_set_timer(app_timer_callback, 5000);
}


void app_timer_callback(void)
{
    btstack_push_user_msg(USER_MSG_INITIATE_TIMOUT, NULL, 0);
}

void ble_external_set_phy(int phy)
{
    btstack_push_user_msg(USER_MSG_SET_PHY, NULL, phy);
}

void ble_external_set_interval(int interval)
{
    btstack_push_user_msg(USER_MSG_SET_INTERVAL, NULL, interval);
}

void ble_external_send_data(uint8_t* data, uint16_t len)
{
    ble_data_packet.header = BLE_ATT_PACKET_HEADER_DATA;
    ble_data_packet.len = len;
    memcpy(ble_data_packet.data, data, len);
    btstack_push_user_msg(USER_MSG_DATA_EVENT, NULL, 0);
}

void ble_external_send_dev_sync_data(uint8_t* data, uint16_t len, uint16_t dev)
{
    static uint16_t handle;
    ble_data_packet.header = BLE_ATT_PACKET_HEADER_DEV_SYNC;
    ble_data_packet.len = len;
    handle = dev;
    memcpy(ble_data_packet.data, data, len);
    btstack_push_user_msg(USER_MSG_DATA_EVENT, &handle, 1);
}

void uart_external_send_data(uint8_t* data, uint16_t len)
{
    uart_tx_packet.header = UART_PACKET_HEADER_DATA;
    uart_tx_packet.len = len;
    memcpy(uart_tx_packet.data, data, len);
    btstack_push_user_msg(USER_MSG_UART_TX_DATA, NULL, NULL);
}

static void user_msg_handler(uint32_t msg_id, void *data, uint16_t size)
{
    switch (msg_id)
    {
    case USER_MSG_INITIATE_TIMOUT:
        if (is_initiating)
        {
            platform_printf("initiate timout\n");
            is_initiating = 0;
            gap_create_connection_cancel();
            initiate_if_needed();
        }
        break;
    case USER_TRIGGER_RAW_PKT:
        if(internal_time_sync_info.time_sync_flag&TIME_SYNC_START){packet_action();}
        break;
    case USER_MEG_SCHEDULE_INTERNAL_RAW_PKT:
        internal_time_sync_schedule();
        break;
    case USER_MSG_CAME_SYNC_EVENT:
    {
        uint8_t i;
      
        for (i = 0; i < MAX_CONN_NUMBER; i++)
        {
            if (conn_handles[i] != INVALID_HANDLE)
            {
                ble_att_send_came_sync_data(i);
            }
        }
    }
    case USER_MSG_DATA_EVENT:
    {
        uint8_t i;
      
        for (i = 0; i < MAX_CONN_NUMBER; i++)
        {
            if ((conn_handles[i] != INVALID_HANDLE) && ((!size) || (size && (conn_handles[i] != *(uint16_t*)data))))
            {
                ble_att_send_application_data(i);
            }
        }
    }
    case USER_MSG_SET_PHY:
        {
            uint8_t i;
            uint16_t       phy = size;
            phy_bittypes_t phy_bit;
            phy_option_t   phy_opt = HOST_PREFER_S8_CODING;
            switch (phy)
            {
            case 0:
                phy_bit = PHY_1M_BIT;
                break;
            case 1:
                phy_bit = PHY_2M_BIT;
                break;
            case 2:
                phy_opt = HOST_PREFER_S2_CODING; // fall through
            case 3:
                phy_bit = PHY_CODED_BIT;
                break;
            }
            
            for (i = 0; i < MAX_CONN_NUMBER; i++)
            {
              if (conn_handles[i] != INVALID_HANDLE)
              {
                gap_set_phy(conn_handles[i], 0, phy_bit, phy_bit, phy_opt);
              }
            }
        }
        break;
    case USER_MSG_SET_INTERVAL:
        {
            uint8_t i;
            int ret;
            uint16_t interval = size;
            uint16_t ce_len = (interval << 1) - 2;

            for (i = 0; i < MAX_CONN_NUMBER; i++)
            {
              if (conn_handles[i] != INVALID_HANDLE)
              {
                ret = gap_update_connection_parameters(conn_handles[i], interval, interval, 0, 1600, ce_len, ce_len);
                platform_printf("conn update(%d) to %dms (%d) \n", i, (interval*125)/100, ret);
              }
            }
        }
        break;
    case USER_MSG_UART_TX_DATA:
    {
      uart_driver_send_data(uart_tx_packet.data, uart_tx_packet.len);
    }
    break;
    default:
        ;
    }
}

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
    const le_meta_event_enh_create_conn_complete_t *conn_complete;
    uint8_t event = hci_event_packet_get_type(packet);
    const btstack_user_msg_t *p_user_msg;
    if (packet_type != HCI_EVENT_PACKET) return;

    switch (event)
    {
    case BTSTACK_EVENT_STATE:
        if (btstack_event_state_get_state(packet) != HCI_STATE_WORKING)
            break;
        platform_printf("peripheral num: %d\n",ll_set_max_conn_number(MAX_CONN_NUMBER));
        gap_set_random_device_address(rand_addr);
        initiate_if_needed();
        break;

    case HCI_EVENT_LE_META:
        switch (hci_event_le_meta_get_subevent_code(packet))
        {
        case HCI_SUBEVENT_LE_EXTENDED_ADVERTISING_REPORT:
            {
                const le_ext_adv_report_t *report = decode_hci_le_meta_event(packet, le_meta_event_ext_adv_report_t)->reports;
                printf("%02X:%02X:%02X:%02X:%02X:%02X: %dBm\n",
                        report->address[5], report->address[4], report->address[3],
                        report->address[2], report->address[1], report->address[0],
                        report->rssi);
            }
            break;
        case HCI_SUBEVENT_LE_ENHANCED_CONNECTION_COMPLETE:
            {
                int id;
                is_initiating = 0;

                conn_complete = decode_hci_le_meta_event(packet, le_meta_event_enh_create_conn_complete_t);
                id = conn_complete->peer_addr[0];
                if (conn_complete->status == 0)
                {
                    conn_handles[id] = conn_complete->handle;
                    platform_printf("Connected to #%d. Total = %d\n", id, total_conn_num());
                    gatt_client_is_ready(conn_complete->handle);
                    gap_update_connection_parameters(conn_complete->handle, 8, 8, 0, 800, 6, 6);
                }
                else
                    platform_printf("fails\n");
                initiate_if_needed();
                
            }
            break;
        case HCI_SUBEVENT_LE_CONNECTION_UPDATE_COMPLETE:
          {
            const le_meta_event_conn_update_complete_t *cmpl = decode_hci_le_meta_event(packet, le_meta_event_conn_update_complete_t);
            platform_printf("CONN updated: %d, interval %.2f ms\n", cmpl->handle, cmpl->interval * 1.25);
          
            uint8_t i;
            for (i = 0; i < MAX_CONN_NUMBER; i++)
            {
              if (conn_handles[i] == cmpl->handle)
              {
                start_notify(i);
                break;
              }
            }
          }
          break;
        default:
            break;
        }

        break;

    case HCI_EVENT_DISCONNECTION_COMPLETE:
        {
            const event_disconn_complete_t *disconn = decode_hci_event_disconn_complete(packet);
            int i;
            for (i = 0; i < MAX_CONN_NUMBER; i++)
            {
                if (conn_handles[i] == disconn->conn_handle)
                {
                    conn_handles[i] = INVALID_HANDLE;
                    platform_printf("Disc #%d. ", i);
                }
            }
            platform_printf("Total = %d\n", total_conn_num());
            initiate_if_needed();
        }
        break;

    case L2CAP_EVENT_CAN_SEND_NOW:
        {
            int i;
            for (i = 0; i < MAX_CONN_NUMBER; i++)
            {
                if (conn_handles[i] != INVALID_HANDLE)
                {
                    ble_att_send_time_sync_data(i);
                }
            }
        }
        break;

    case BTSTACK_EVENT_USER_MSG:
        p_user_msg = hci_event_packet_get_user_msg(packet);
        user_msg_handler(p_user_msg->msg_id, p_user_msg->data, p_user_msg->len);
        break;

    default:
        break;
    }
}



uint32_t setup_profile(void *data, void *user_data)
{
    internal_time_sync_init();
  
    memset(conn_handles, 0xff, sizeof(conn_handles));

    att_server_init(att_read_callback, att_write_callback);
    hci_event_callback_registration.callback = user_packet_handler;
    hci_add_event_handler(&hci_event_callback_registration);
    att_server_register_packet_handler(user_packet_handler);
    gatt_client_register_handler(user_packet_handler);
    return 0;
}

