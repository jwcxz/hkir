#ifndef __IR_H
#define __IR_H


void ir_init(void);
void ir_xmit_hdr(void);
void ir_xmit(uint8_t v);
void ir_send(uint8_t *data, uint8_t len);


#endif
