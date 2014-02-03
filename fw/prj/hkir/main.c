/*
 * HK IR Blaster
 * jwc :: jwcxz.com
 */

#include "config.h"
#include "ir.h"
#include "uart_rb.h"

static uint8_t vol_up[7] = { 0xD7, 0xDA, 0xD5, 0xED, 0xB5, 0xB6, 0x80 };
static uint8_t vol_dn[7] = { 0xD7, 0xDA, 0xD5, 0xAE, 0xDE, 0xB6, 0x80 };
static uint8_t vol_mt[7] = { 0xD7, 0xDA, 0xD5, 0xDA, 0xDB, 0x76, 0x80 };
static uint8_t pwr_on[7] = { 0xD7, 0xDA, 0xD5, 0xFE, 0xD5, 0x56, 0x80 };
static uint8_t pwr_of[7] = { 0xD7, 0xDA, 0xD5, 0xBF, 0x75, 0x56, 0x80 };

enum ir_commands_e {
    VOL_UP = 'u',
    VOL_DN = 'd',
    VOL_MT = 'm',
    PWR_ON = 'o',
    PWR_OF = 'O'
};
typedef uint8_t ir_commands_t;


int main(void) {
    uint8_t cmd;

    ir_init();
    uart_rb_init();

    sei();

    while (1) {
        cmd = uart_rb_rx();
        switch (cmd) {
            case 'u':
                ir_send(vol_up, 7);
                break;
            case VOL_DN:
                ir_send(vol_dn, 7);
                break;
            case VOL_MT:
                ir_send(vol_mt, 7);
                break;
            case PWR_ON:
                ir_send(pwr_on, 7);
                break;
            case PWR_OF:
                ir_send(pwr_of, 7);
                break;
            default:
                break;
        }
    }
}
