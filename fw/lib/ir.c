#include "config.h"
#include "ir.h"

void ir_init(void) {
    _ON(IR_OUT_DDR, IR_OUT_PIN);
}

void ir_xmit_hdr(void) {
    _ON(IR_OUT_PORT, IR_OUT_PIN);
    _delay_ms(8);
    _delay_us(891);

    _OFF(IR_OUT_PORT, IR_OUT_PIN);
    _delay_ms(4);
    _delay_us(566);
}

void ir_xmit(uint8_t v) {
    if (v) {
        _ON(IR_OUT_PORT, IR_OUT_PIN);
    } else {
        _OFF(IR_OUT_PORT, IR_OUT_PIN);
    }
    _delay_us(631);

    _OFF(IR_OUT_PORT, IR_OUT_PIN);
    _delay_us(631);
}

void ir_send(uint8_t *data, uint8_t len) {
    uint8_t btmp;
    uint8_t byte, bit;

    ir_xmit_hdr();

    for ( byte=0 ; byte<len ; byte++ ) {
        btmp = data[byte];

        for ( bit=0 ; bit<8 ; bit++ ) {
            if ((btmp & _BV(7-bit)) != 0) {
                ir_xmit(1);
            } else {
                ir_xmit(0);
            }
        }
    }
}
