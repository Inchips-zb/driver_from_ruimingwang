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
    variables definition
*/
/*
    the ble address of central and peripheral
    the address of peripheral should be increased by step 1(if there are multiple peripheral)
    { 0xC3, 0xD4, 0x17, 0x9A, 0xED, 0x00 }
    { 0xC3, 0xD4, 0x17, 0x9A, 0xED, 0x01 }
    etc...
*/
const bd_addr_t         rand_addr = { 0xC3, 0xD4, 0x17, 0x9A, 0xED, 0x00 };

static uint32_t         total_bytes = 0;
static hci_con_handle_t handle_send = 0;
static uint8_t          notify_enable = 0;

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
        if (buffer != NULL)
        {
            *(uint32_t *)buffer = total_bytes;
            return buffer_size;
        }
        else
            return sizeof(total_bytes);
    default:
        return 0;
    }
}

static int att_write_callback(hci_con_handle_t connection_handle, uint16_t att_handle, uint16_t transaction_mode,
                              uint16_t offset, const uint8_t *buffer, uint16_t buffer_size)
{
    switch (att_handle)
    {
    case HANDLE_GENERIC_INPUT:
        total_bytes += buffer_size;
        ble_att_data_handle(buffer, buffer_size);
        return 0;
    case HANDLE_GENERIC_OUTPUT + 1:
        if(*(uint16_t *)buffer == GATT_CLIENT_CHARACTERISTICS_CONFIGURATION_NOTIFICATION)
        {
            notify_enable = 1;
        }
        else
            notify_enable = 0;
        
        return 0;
    default:
        return 0;
    }
}

/*
    handle the central command
*/
void ble_att_data_handle(const uint8_t *buffer, uint16_t buffer_size)
{
    ble_att_packet_format_s *p = (ble_att_packet_format_s*)buffer;
    platform_printf("recv 0x%x 0x%x 0x%x \n", buffer[0],buffer[1],buffer[2]);
    switch(p->header)
    {
        case BLE_ATT_PACKET_HEADER_INTERNAL_TIME_SYNC:
            {
              ble_att_time_sync_packet_format_s *p = (ble_att_time_sync_packet_format_s*)buffer;
              internal_time_sync_offset.sync_period_ms = p->period_ms;
              internal_time_sync_schedule();
            }
            break;
        case BLE_ATT_PACKET_HEADER_CAME_SYNC:
            {
              // data received from central devices
              ble_att_came_sync_packet_format_s *p = (ble_att_came_sync_packet_format_s*)buffer;
              
              // which means the connection setup was complete
              if(notify_enable)
              {
                came_sync_info.packet.start_time_us = p->start_time_us;
                came_sync_schedule0();
              }
            }
            break;
        case BLE_ATT_PACKET_HEADER_DATA:
            {
              ble_att_data_packet_format_s *p = (ble_att_data_packet_format_s*)buffer;
              uart_external_send_data(p->data,p->len);
            }
            break;
        case BLE_ATT_PACKET_HEADER_DEV_SYNC:
            {
              ble_att_data_packet_format_s *p = (ble_att_data_packet_format_s*)buffer;
              uart_external_send_data(p->data,p->len);
            }
            break;
        default:
            break;
    }
}

void ble_att_send_data(const void *data, int len)
{
    int mtu = att_server_get_mtu(handle_send) - 3;
    
    if (0 == notify_enable)
        return;
    const uint8_t *p = (const uint8_t *)(data);
    platform_printf("send 0x%x 0x%x 0x%x 0x%x %d\n", p[0],p[1],p[2],p[3],len);
    while (len)
    {
        int size = len > mtu ? mtu : len;

        if (att_server_notify(handle_send, HANDLE_GENERIC_OUTPUT, (uint8_t *)p, size))
        {
            platform_printf("att notify error !\n");
            att_server_request_can_send_now_event(handle_send);
            break;
        }
        len -= size;
        p += size;
    }
}

static void hint_ce_len(uint16_t interval)
{
    uint16_t ce_len = interval << 1;
    if (ce_len > 20)
        ll_hint_on_ce_len(0, ce_len - 15, ce_len - 15);
}

void ble_external_send_data(uint8_t* data, uint16_t len)
{
    ble_data_packet.header = BLE_ATT_PACKET_HEADER_DATA;
    ble_data_packet.len = len;
    memcpy(ble_data_packet.data, data, len);
    btstack_push_user_msg(USER_MSG_SEND_DATA, (void*)&ble_data_packet, ble_data_packet.len+3);
}

void ble_external_send_dev_sync_data(uint8_t* data, uint16_t len)
{
    ble_data_packet.header = BLE_ATT_PACKET_HEADER_DEV_SYNC;
    ble_data_packet.len = len;
    memcpy(ble_data_packet.data, data, len);
    platform_printf("s %x %x \n",ble_data_packet.data[0], ble_data_packet.data[1]);
    btstack_push_user_msg(USER_MSG_SEND_DATA, (void*)&ble_data_packet, ble_data_packet.len+3);
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
    case USER_TRIGGER_RAW_PKT_RECV:
        {
            // the time unit is ms, which should be a value smaller than connection event, otherwise fails
            if(internal_time_sync_offset.time_sync_flag & TIME_SYNC_PERIOD_START){internal_time_sync_recv_schedule(2*1000);}
        }
        break;
    case USER_MSG_SEND_DATA:
        ble_att_send_data(data, size);
        break;
    case USER_MSG_INTERNAL_SYNC_POST_PROCESSING:
        internal_internal_time_sync_offset_post_processing();
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

const static ext_adv_set_en_t adv_sets_en[] = { {.handle = 0, .duration = 0, .max_events = 0} };

static void setup_adv(void)
{
    gap_set_ext_adv_para(0,
                            CONNECTABLE_ADV_BIT | SCANNABLE_ADV_BIT | LEGACY_PDU_BIT,
                            0x00a1, 0x00a1,            // Primary_Advertising_Interval_Min, Primary_Advertising_Interval_Max
                            PRIMARY_ADV_ALL_CHANNELS,  // Primary_Advertising_Channel_Map
                            BD_ADDR_TYPE_LE_RANDOM,    // Own_Address_Type
                            BD_ADDR_TYPE_LE_PUBLIC,    // Peer_Address_Type (ignore)
                            NULL,                      // Peer_Address      (ignore)
                            ADV_FILTER_ALLOW_ALL,      // Advertising_Filter_Policy
                            0x00,                      // Advertising_Tx_Power
                            PHY_1M,                    // Primary_Advertising_PHY
                            0,                         // Secondary_Advertising_Max_Skip
                            PHY_1M,                    // Secondary_Advertising_PHY
                            0x00,                      // Advertising_SID
                            0x00);                     // Scan_Request_Notification_Enable
    gap_set_ext_adv_data(0, sizeof(adv_data), (uint8_t*)adv_data);
    gap_set_ext_scan_response_data(0, sizeof(scan_data), (uint8_t*)scan_data);
    gap_set_ext_adv_enable(1, sizeof(adv_sets_en) / sizeof(adv_sets_en[0]), adv_sets_en);
}

static void user_packet_handler(uint8_t packet_type, uint16_t channel, const uint8_t *packet, uint16_t size)
{
    uint8_t event = hci_event_packet_get_type(packet);
    const btstack_user_msg_t *p_user_msg;
    if (packet_type != HCI_EVENT_PACKET) return;

    switch (event)
    {
    case BTSTACK_EVENT_STATE:
        if (btstack_event_state_get_state(packet) != HCI_STATE_WORKING)
            break;
        gap_set_adv_set_random_addr(0, rand_addr);
        setup_adv();
        break;

    case HCI_EVENT_COMMAND_COMPLETE:
        switch (hci_event_command_complete_get_command_opcode(packet))
        {
        // add your code to check command complete response
        // case :
        //     break;
        default:
            break;
        }
        break;

    case HCI_EVENT_LE_META:
        switch (hci_event_le_meta_get_subevent_code(packet))
        {
        case HCI_SUBEVENT_LE_ENHANCED_CONNECTION_COMPLETE:
            {
                const le_meta_event_enh_create_conn_complete_t *cmpl =
                    decode_hci_le_meta_event(packet, le_meta_event_enh_create_conn_complete_t);
                handle_send = cmpl->handle;
                hint_ce_len(cmpl->interval);
                att_set_db(handle_send, profile_data);
            }
            break;
        case HCI_SUBEVENT_LE_CONNECTION_UPDATE_COMPLETE:
        {
            const le_meta_event_conn_update_complete_t *cmpl = decode_hci_le_meta_event(packet, le_meta_event_conn_update_complete_t);
            platform_printf("CONN updated: %d, interval %.2f ms\n", cmpl->handle, cmpl->interval * 1.25);
            hint_ce_len(cmpl->interval);
        }
            break;
        default:
            break;
        }

        break;

    case HCI_EVENT_DISCONNECTION_COMPLETE:
        notify_enable = 0;
        gap_set_ext_adv_enable(1, sizeof(adv_sets_en) / sizeof(adv_sets_en[0]), adv_sets_en);
        internal_time_sync_reset();
        platform_printf("Disconnected...");
        break;

    case ATT_EVENT_MTU_EXCHANGE_COMPLETE:
        platform_printf("ATT_EVENT_MTU updated: %d\n", att_event_mtu_exchange_complete_get_MTU(packet));
        break;
    
    case ATT_EVENT_CAN_SEND_NOW:
        platform_printf("need user implementation......");
        break;

    case BTSTACK_EVENT_USER_MSG:
        p_user_msg = hci_event_packet_get_user_msg(packet);
        user_msg_handler(p_user_msg->msg_id, p_user_msg->data, p_user_msg->len);
        break;

    default:
        break;
    }
}


static btstack_packet_callback_registration_t hci_event_callback_registration;

uint32_t setup_profile(void *data, void *user_data)
{
    platform_printf("setup profile\n");
    internal_time_sync_init();
  
    // Note: security has not been enabled.
    att_server_init(att_read_callback, att_write_callback);
    hci_event_callback_registration.callback = &user_packet_handler;
    hci_add_event_handler(&hci_event_callback_registration);
    att_server_register_packet_handler(&user_packet_handler);
    return 0;
}

