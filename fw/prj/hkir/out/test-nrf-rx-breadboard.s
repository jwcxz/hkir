
out/test-nrf-rx-breadboard.out:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	0c 94 34 00 	jmp	0x68	; 0x68 <__ctors_end>
   4:	0c 94 24 01 	jmp	0x248	; 0x248 <__vector_1>
   8:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
   c:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  10:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  14:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  18:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  1c:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  20:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  24:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  28:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  2c:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  30:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  34:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  38:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  3c:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  40:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  44:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  48:	0c 94 30 04 	jmp	0x860	; 0x860 <__vector_18>
  4c:	0c 94 68 04 	jmp	0x8d0	; 0x8d0 <__vector_19>
  50:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  54:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  58:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  5c:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  60:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  64:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>

00000068 <__ctors_end>:
  68:	11 24       	eor	r1, r1
  6a:	1f be       	out	0x3f, r1	; 63
  6c:	cf ef       	ldi	r28, 0xFF	; 255
  6e:	d4 e0       	ldi	r29, 0x04	; 4
  70:	de bf       	out	0x3e, r29	; 62
  72:	cd bf       	out	0x3d, r28	; 61

00000074 <__do_copy_data>:
  74:	11 e0       	ldi	r17, 0x01	; 1
  76:	a0 e0       	ldi	r26, 0x00	; 0
  78:	b1 e0       	ldi	r27, 0x01	; 1
  7a:	ee e6       	ldi	r30, 0x6E	; 110
  7c:	f9 e0       	ldi	r31, 0x09	; 9
  7e:	02 c0       	rjmp	.+4      	; 0x84 <__do_copy_data+0x10>
  80:	05 90       	lpm	r0, Z+
  82:	0d 92       	st	X+, r0
  84:	aa 31       	cpi	r26, 0x1A	; 26
  86:	b1 07       	cpc	r27, r17
  88:	d9 f7       	brne	.-10     	; 0x80 <__do_copy_data+0xc>

0000008a <__do_clear_bss>:
  8a:	11 e0       	ldi	r17, 0x01	; 1
  8c:	aa e1       	ldi	r26, 0x1A	; 26
  8e:	b1 e0       	ldi	r27, 0x01	; 1
  90:	01 c0       	rjmp	.+2      	; 0x94 <.do_clear_bss_start>

00000092 <.do_clear_bss_loop>:
  92:	1d 92       	st	X+, r1

00000094 <.do_clear_bss_start>:
  94:	ad 3d       	cpi	r26, 0xDD	; 221
  96:	b1 07       	cpc	r27, r17
  98:	e1 f7       	brne	.-8      	; 0x92 <.do_clear_bss_loop>
  9a:	0e 94 8f 04 	call	0x91e	; 0x91e <main>
  9e:	0c 94 b5 04 	jmp	0x96a	; 0x96a <_exit>

000000a2 <__bad_interrupt>:
  a2:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

000000a6 <dbg_set>:

#include "config.h"
#include "dbg.h"

void dbg_set(uint8_t val) {
    uint8_t tmp = val & 0xF;
  a6:	8f 70       	andi	r24, 0x0F	; 15
    DBGLED_PRT |= tmp;
  a8:	98 b1       	in	r25, 0x08	; 8
  aa:	98 2b       	or	r25, r24
  ac:	98 b9       	out	0x08, r25	; 8
    DBGLED_PRT &= 0xF0 | tmp;
  ae:	98 b1       	in	r25, 0x08	; 8
  b0:	80 6f       	ori	r24, 0xF0	; 240
  b2:	89 23       	and	r24, r25
  b4:	88 b9       	out	0x08, r24	; 8
  b6:	08 95       	ret

000000b8 <dbg_on>:
}

void dbg_on(uint8_t val) {
    _ON(DBGLED_PRT, val);
  b8:	98 b1       	in	r25, 0x08	; 8
  ba:	21 e0       	ldi	r18, 0x01	; 1
  bc:	30 e0       	ldi	r19, 0x00	; 0
  be:	08 2e       	mov	r0, r24
  c0:	01 c0       	rjmp	.+2      	; 0xc4 <dbg_on+0xc>
  c2:	22 0f       	add	r18, r18
  c4:	0a 94       	dec	r0
  c6:	ea f7       	brpl	.-6      	; 0xc2 <dbg_on+0xa>
  c8:	92 2b       	or	r25, r18
  ca:	98 b9       	out	0x08, r25	; 8
  cc:	08 95       	ret

000000ce <dbg_off>:
}

void dbg_off(uint8_t val) {
    _OFF(DBGLED_PRT, val);
  ce:	98 b1       	in	r25, 0x08	; 8
  d0:	21 e0       	ldi	r18, 0x01	; 1
  d2:	30 e0       	ldi	r19, 0x00	; 0
  d4:	08 2e       	mov	r0, r24
  d6:	01 c0       	rjmp	.+2      	; 0xda <dbg_off+0xc>
  d8:	22 0f       	add	r18, r18
  da:	0a 94       	dec	r0
  dc:	ea f7       	brpl	.-6      	; 0xd8 <dbg_off+0xa>
  de:	20 95       	com	r18
  e0:	29 23       	and	r18, r25
  e2:	28 b9       	out	0x08, r18	; 8
  e4:	08 95       	ret

000000e6 <dbg_init>:
}

void dbg_init(void) {
    // this requires the debug bank to be the bottom 4 bits of a bank
    // TODO: make it more advanced
    DBGLED_DDR |= 0x0F;
  e6:	87 b1       	in	r24, 0x07	; 7
  e8:	8f 60       	ori	r24, 0x0F	; 15
  ea:	87 b9       	out	0x07, r24	; 7
    DBGLED_PRT &= 0xF0; // clear leds
  ec:	88 b1       	in	r24, 0x08	; 8
  ee:	80 7f       	andi	r24, 0xF0	; 240
  f0:	88 b9       	out	0x08, r24	; 8
  f2:	08 95       	ret

000000f4 <nrf_enable_irq>:
}


// application-level commands
void nrf_enable_irq(void) {
    _ON(EIFR, INTF0);
  f4:	e0 9a       	sbi	0x1c, 0	; 28
    _ON(EIMSK, INT0);
  f6:	e8 9a       	sbi	0x1d, 0	; 29
  f8:	08 95       	ret

000000fa <nrf_disable_irq>:
}

void nrf_disable_irq(void) {
    _OFF(EIMSK, INT0);
  fa:	e8 98       	cbi	0x1d, 0	; 29
    packet_ready = 0;
  fc:	10 92 1a 01 	sts	0x011A, r1
 100:	08 95       	ret

00000102 <nrf_wait_for_rxpacket>:
    nrf_disable_irq();
}


void nrf_wait_for_rxpacket(void) {
    while (!packet_ready);
 102:	80 91 1a 01 	lds	r24, 0x011A
 106:	88 23       	and	r24, r24
 108:	e1 f3       	breq	.-8      	; 0x102 <nrf_wait_for_rxpacket>
}
 10a:	08 95       	ret

0000010c <nrf_isready_packet>:

uint8_t nrf_isready_packet(void) {
    return packet_ready;
 10c:	80 91 1a 01 	lds	r24, 0x011A
}
 110:	08 95       	ret

00000112 <nrf_accept_packet>:

void nrf_accept_packet(void) {
    packet_ready = 0;
 112:	10 92 1a 01 	sts	0x011A, r1
    nrf_enable_irq();
 116:	0c 94 7a 00 	jmp	0xf4	; 0xf4 <nrf_enable_irq>

0000011a <nrf_ce_on>:
}


// chip commands
void nrf_ce_on(void) {
    _ON(NRF_CE_PRT, NRF_CE_PIN);
 11a:	28 9a       	sbi	0x05, 0	; 5
 11c:	08 95       	ret

0000011e <nrf_ce_off>:
}


void nrf_ce_off(void) {
    _OFF(NRF_CE_PRT, NRF_CE_PIN);
 11e:	28 98       	cbi	0x05, 0	; 5
 120:	08 95       	ret

00000122 <nrf_txpayload>:
        nrf_regwr(NRF_REG_CONFIG, NRF_INI_CONFIG & ~(_BV(NRF_BIT_PWR_UP)));
    }
}


uint8_t nrf_txpayload(uint8_t *buf) {
 122:	1f 93       	push	r17
 124:	cf 93       	push	r28
 126:	df 93       	push	r29
 128:	ec 01       	movw	r28, r24
    uint8_t status;

    nrfspi_cs_en();
 12a:	0e 94 2b 03 	call	0x656	; 0x656 <nrfspi_cs_en>
    status = nrfspi_txrx_byte(NRF_CMD_TXPLW);
 12e:	80 ea       	ldi	r24, 0xA0	; 160
 130:	0e 94 25 03 	call	0x64a	; 0x64a <nrfspi_txrx_byte>
 134:	18 2f       	mov	r17, r24
    nrfspi_txrx(COM_PL_SIZE, buf, 0);
 136:	40 e0       	ldi	r20, 0x00	; 0
 138:	50 e0       	ldi	r21, 0x00	; 0
 13a:	be 01       	movw	r22, r28
 13c:	89 e1       	ldi	r24, 0x19	; 25
 13e:	0e 94 07 03 	call	0x60e	; 0x60e <nrfspi_txrx>
    nrfspi_cs_ds();
 142:	0e 94 2d 03 	call	0x65a	; 0x65a <nrfspi_cs_ds>

    return status;
}
 146:	81 2f       	mov	r24, r17
 148:	df 91       	pop	r29
 14a:	cf 91       	pop	r28
 14c:	1f 91       	pop	r17
 14e:	08 95       	ret

00000150 <nrf_rxpayload>:


uint8_t nrf_rxpayload(uint8_t *buf) {
 150:	1f 93       	push	r17
 152:	cf 93       	push	r28
 154:	df 93       	push	r29
 156:	ec 01       	movw	r28, r24
    uint8_t status;

    nrfspi_cs_en();
 158:	0e 94 2b 03 	call	0x656	; 0x656 <nrfspi_cs_en>
    status = nrfspi_txrx_byte(NRF_CMD_RXPLR);
 15c:	81 e6       	ldi	r24, 0x61	; 97
 15e:	0e 94 25 03 	call	0x64a	; 0x64a <nrfspi_txrx_byte>
 162:	18 2f       	mov	r17, r24
    nrfspi_txrx(COM_PL_SIZE, buf, buf);
 164:	ae 01       	movw	r20, r28
 166:	be 01       	movw	r22, r28
 168:	89 e1       	ldi	r24, 0x19	; 25
 16a:	0e 94 07 03 	call	0x60e	; 0x60e <nrfspi_txrx>
    nrfspi_cs_ds();
 16e:	0e 94 2d 03 	call	0x65a	; 0x65a <nrfspi_cs_ds>

    return status;
}
 172:	81 2f       	mov	r24, r17
 174:	df 91       	pop	r29
 176:	cf 91       	pop	r28
 178:	1f 91       	pop	r17
 17a:	08 95       	ret

0000017c <nrf_regwr_long>:


uint8_t nrf_regwr_long(uint8_t reg, uint8_t len, uint8_t *buf) {
 17c:	ef 92       	push	r14
 17e:	ff 92       	push	r15
 180:	0f 93       	push	r16
 182:	1f 93       	push	r17
 184:	cf 93       	push	r28
 186:	df 93       	push	r29
 188:	1f 92       	push	r1
 18a:	cd b7       	in	r28, 0x3d	; 61
 18c:	de b7       	in	r29, 0x3e	; 62
 18e:	06 2f       	mov	r16, r22
 190:	7a 01       	movw	r14, r20
    uint8_t status;

    nrfspi_cs_en();
 192:	89 83       	std	Y+1, r24	; 0x01
 194:	0e 94 2b 03 	call	0x656	; 0x656 <nrfspi_cs_en>
    status = nrfspi_txrx_byte(reg);
 198:	89 81       	ldd	r24, Y+1	; 0x01
 19a:	0e 94 25 03 	call	0x64a	; 0x64a <nrfspi_txrx_byte>
 19e:	18 2f       	mov	r17, r24
    nrfspi_txrx(len, buf, 0);
 1a0:	40 e0       	ldi	r20, 0x00	; 0
 1a2:	50 e0       	ldi	r21, 0x00	; 0
 1a4:	b7 01       	movw	r22, r14
 1a6:	80 2f       	mov	r24, r16
 1a8:	0e 94 07 03 	call	0x60e	; 0x60e <nrfspi_txrx>
    nrfspi_cs_ds();
 1ac:	0e 94 2d 03 	call	0x65a	; 0x65a <nrfspi_cs_ds>

    return status;
}
 1b0:	81 2f       	mov	r24, r17
 1b2:	0f 90       	pop	r0
 1b4:	df 91       	pop	r29
 1b6:	cf 91       	pop	r28
 1b8:	1f 91       	pop	r17
 1ba:	0f 91       	pop	r16
 1bc:	ff 90       	pop	r15
 1be:	ef 90       	pop	r14
 1c0:	08 95       	ret

000001c2 <nrf_regrd_long>:


uint8_t nrf_regrd_long(uint8_t reg, uint8_t len, uint8_t *buf) {
 1c2:	ef 92       	push	r14
 1c4:	ff 92       	push	r15
 1c6:	0f 93       	push	r16
 1c8:	1f 93       	push	r17
 1ca:	cf 93       	push	r28
 1cc:	df 93       	push	r29
 1ce:	1f 92       	push	r1
 1d0:	cd b7       	in	r28, 0x3d	; 61
 1d2:	de b7       	in	r29, 0x3e	; 62
 1d4:	06 2f       	mov	r16, r22
 1d6:	7a 01       	movw	r14, r20
    uint8_t status;

    nrfspi_cs_en();
 1d8:	89 83       	std	Y+1, r24	; 0x01
 1da:	0e 94 2b 03 	call	0x656	; 0x656 <nrfspi_cs_en>
    status = nrfspi_txrx_byte(reg);
 1de:	89 81       	ldd	r24, Y+1	; 0x01
 1e0:	0e 94 25 03 	call	0x64a	; 0x64a <nrfspi_txrx_byte>
 1e4:	18 2f       	mov	r17, r24
    nrfspi_txrx(len, buf, buf);
 1e6:	a7 01       	movw	r20, r14
 1e8:	b7 01       	movw	r22, r14
 1ea:	80 2f       	mov	r24, r16
 1ec:	0e 94 07 03 	call	0x60e	; 0x60e <nrfspi_txrx>
    nrfspi_cs_ds();
 1f0:	0e 94 2d 03 	call	0x65a	; 0x65a <nrfspi_cs_ds>

    return status;
}
 1f4:	81 2f       	mov	r24, r17
 1f6:	0f 90       	pop	r0
 1f8:	df 91       	pop	r29
 1fa:	cf 91       	pop	r28
 1fc:	1f 91       	pop	r17
 1fe:	0f 91       	pop	r16
 200:	ff 90       	pop	r15
 202:	ef 90       	pop	r14
 204:	08 95       	ret

00000206 <nrf_regwr>:


uint8_t nrf_regwr(uint8_t reg, uint8_t data) {
 206:	1f 93       	push	r17
 208:	cf 93       	push	r28
 20a:	df 93       	push	r29
 20c:	00 d0       	rcall	.+0      	; 0x20e <nrf_regwr+0x8>
 20e:	cd b7       	in	r28, 0x3d	; 61
 210:	de b7       	in	r29, 0x3e	; 62
    uint8_t status;
    reg = NRF_CMD_REGWR | reg;

    nrfspi_cs_en();
 212:	6a 83       	std	Y+2, r22	; 0x02
 214:	89 83       	std	Y+1, r24	; 0x01
 216:	0e 94 2b 03 	call	0x656	; 0x656 <nrfspi_cs_en>
    status = nrfspi_txrx_byte(reg);
 21a:	89 81       	ldd	r24, Y+1	; 0x01
 21c:	80 62       	ori	r24, 0x20	; 32
 21e:	0e 94 25 03 	call	0x64a	; 0x64a <nrfspi_txrx_byte>
 222:	18 2f       	mov	r17, r24
    nrfspi_txrx_byte(data);
 224:	6a 81       	ldd	r22, Y+2	; 0x02
 226:	86 2f       	mov	r24, r22
 228:	0e 94 25 03 	call	0x64a	; 0x64a <nrfspi_txrx_byte>
    nrfspi_cs_ds();
 22c:	0e 94 2d 03 	call	0x65a	; 0x65a <nrfspi_cs_ds>

    return status;
}
 230:	81 2f       	mov	r24, r17
 232:	0f 90       	pop	r0
 234:	0f 90       	pop	r0
 236:	df 91       	pop	r29
 238:	cf 91       	pop	r28
 23a:	1f 91       	pop	r17
 23c:	08 95       	ret

0000023e <nrf_set_channel>:
    packet_ready = 0;
}


void nrf_set_channel(uint8_t channel) {
    nrf_regwr(NRF_REG_RF_CH, ( (channel & 0x7F) << NRF_BIT_RF_CH60 ) );
 23e:	68 2f       	mov	r22, r24
 240:	6f 77       	andi	r22, 0x7F	; 127
 242:	85 e0       	ldi	r24, 0x05	; 5
 244:	0c 94 03 01 	jmp	0x206	; 0x206 <nrf_regwr>

00000248 <__vector_1>:
    nrf_enable_irq();
}


// nrf24l01+ interrupt handler
ISR(INT0_vect) {
 248:	1f 92       	push	r1
 24a:	0f 92       	push	r0
 24c:	0f b6       	in	r0, 0x3f	; 63
 24e:	0f 92       	push	r0
 250:	11 24       	eor	r1, r1
 252:	2f 93       	push	r18
 254:	3f 93       	push	r19
 256:	4f 93       	push	r20
 258:	5f 93       	push	r21
 25a:	6f 93       	push	r22
 25c:	7f 93       	push	r23
 25e:	8f 93       	push	r24
 260:	9f 93       	push	r25
 262:	af 93       	push	r26
 264:	bf 93       	push	r27
 266:	cf 93       	push	r28
 268:	ef 93       	push	r30
 26a:	ff 93       	push	r31

    // when configured as a receiver, indicates that a packet was received by
    // the device and we must read it out

    // shut off receiver
    nrf_ce_off();
 26c:	0e 94 8f 00 	call	0x11e	; 0x11e <nrf_ce_off>

    // shut off interrupt
    nrf_disable_irq();
 270:	0e 94 7d 00 	call	0xfa	; 0xfa <nrf_disable_irq>

    // read out data into buffer
    status = nrf_rxpayload(rx_packet_buffer);
 274:	80 91 53 01 	lds	r24, 0x0153
 278:	90 91 54 01 	lds	r25, 0x0154
 27c:	0e 94 a8 00 	call	0x150	; 0x150 <nrf_rxpayload>
 280:	c8 2f       	mov	r28, r24
    dbg_set(status & 0xF);
 282:	8f 70       	andi	r24, 0x0F	; 15
 284:	90 e0       	ldi	r25, 0x00	; 0
 286:	0e 94 53 00 	call	0xa6	; 0xa6 <dbg_set>

    // clear RX flag
    nrf_regwr(NRF_REG_STATUS, status | _BV(NRF_BIT_RX_DR));
 28a:	6c 2f       	mov	r22, r28
 28c:	60 64       	ori	r22, 0x40	; 64
 28e:	87 e0       	ldi	r24, 0x07	; 7
 290:	0e 94 03 01 	call	0x206	; 0x206 <nrf_regwr>

    // report that the packet is ready
    packet_ready = 1;
 294:	81 e0       	ldi	r24, 0x01	; 1
 296:	80 93 1a 01 	sts	0x011A, r24

    // re-enable receiver
    nrf_ce_on();
 29a:	0e 94 8d 00 	call	0x11a	; 0x11a <nrf_ce_on>
}
 29e:	ff 91       	pop	r31
 2a0:	ef 91       	pop	r30
 2a2:	cf 91       	pop	r28
 2a4:	bf 91       	pop	r27
 2a6:	af 91       	pop	r26
 2a8:	9f 91       	pop	r25
 2aa:	8f 91       	pop	r24
 2ac:	7f 91       	pop	r23
 2ae:	6f 91       	pop	r22
 2b0:	5f 91       	pop	r21
 2b2:	4f 91       	pop	r20
 2b4:	3f 91       	pop	r19
 2b6:	2f 91       	pop	r18
 2b8:	0f 90       	pop	r0
 2ba:	0f be       	out	0x3f, r0	; 63
 2bc:	0f 90       	pop	r0
 2be:	1f 90       	pop	r1
 2c0:	18 95       	reti

000002c2 <nrf_regrd>:

    return status;
}


uint8_t nrf_regrd(uint8_t reg) {
 2c2:	cf 93       	push	r28
 2c4:	df 93       	push	r29
 2c6:	1f 92       	push	r1
 2c8:	cd b7       	in	r28, 0x3d	; 61
 2ca:	de b7       	in	r29, 0x3e	; 62
    uint8_t data;
    reg = NRF_CMD_REGRD | reg;

    nrfspi_cs_en();
 2cc:	89 83       	std	Y+1, r24	; 0x01
 2ce:	0e 94 2b 03 	call	0x656	; 0x656 <nrfspi_cs_en>
    nrfspi_txrx_byte(reg);
 2d2:	89 81       	ldd	r24, Y+1	; 0x01
 2d4:	0e 94 25 03 	call	0x64a	; 0x64a <nrfspi_txrx_byte>
    data = nrfspi_txrx_byte(0);
 2d8:	80 e0       	ldi	r24, 0x00	; 0
 2da:	0e 94 25 03 	call	0x64a	; 0x64a <nrfspi_txrx_byte>
    nrfspi_cs_ds();
 2de:	89 83       	std	Y+1, r24	; 0x01
 2e0:	0e 94 2d 03 	call	0x65a	; 0x65a <nrfspi_cs_ds>

    return data;
}
 2e4:	89 81       	ldd	r24, Y+1	; 0x01
 2e6:	0f 90       	pop	r0
 2e8:	df 91       	pop	r29
 2ea:	cf 91       	pop	r28
 2ec:	08 95       	ret

000002ee <nrf_init>:
uint8_t *rx_packet_buffer;

uint8_t volatile packet_ready = 0;

// initialization
void nrf_init(uint8_t *rxpbuf) {
 2ee:	cf 93       	push	r28
 2f0:	df 93       	push	r29
 2f2:	ec 01       	movw	r28, r24
    // turn off wireless communication
    nrf_ce_off();
 2f4:	0e 94 8f 00 	call	0x11e	; 0x11e <nrf_ce_off>
    // set up nrf chip enable
    _ON(NRF_CE_DDR, NRF_CE_PIN);
 2f8:	20 9a       	sbi	0x04, 0	; 4

    // initialize SPI layer
    nrfspi_init();
 2fa:	0e 94 f7 02 	call	0x5ee	; 0x5ee <nrfspi_init>
    nrfspi_enable();
 2fe:	0e 94 ff 02 	call	0x5fe	; 0x5fe <nrfspi_enable>

    // register buffer addresses
    rx_packet_buffer = rxpbuf;
 302:	d0 93 54 01 	sts	0x0154, r29
 306:	c0 93 53 01 	sts	0x0153, r28

    // set up interrupt with pull-up for falling edge
    _OFF(NRF_IRQ_DDR, NRF_IRQ_PIN);
 30a:	52 98       	cbi	0x0a, 2	; 10
    _ON(NRF_IRQ_PRT, NRF_IRQ_PIN);
 30c:	5a 9a       	sbi	0x0b, 2	; 11
    EICRA = _BV(ISC01);
 30e:	82 e0       	ldi	r24, 0x02	; 2
 310:	80 93 69 00 	sts	0x0069, r24
    // can be different depending on whether the system is powering up or the
    // micro is reset, and most of the others are initialized to all 0 or
    // change a lot from the default settings.  The other candidate for this is
    // NRF_REG_RF_SETUP, whose default is 0x7 and initialization is 0x3
    // (diference is NRF_BIT_RF_DR_HIGH)
    while ( !(nrf_regrd(NRF_REG_CONFIG) & _BV(NRF_BIT_EN_CRC)) );
 314:	80 e0       	ldi	r24, 0x00	; 0
 316:	0e 94 61 01 	call	0x2c2	; 0x2c2 <nrf_regrd>
 31a:	83 ff       	sbrs	r24, 3
 31c:	fb cf       	rjmp	.-10     	; 0x314 <nrf_init+0x26>

    // perform system configuration
    nrf_regwr(NRF_REG_CONFIG, NRF_INI_CONFIG);
 31e:	6b e3       	ldi	r22, 0x3B	; 59
 320:	80 e0       	ldi	r24, 0x00	; 0
 322:	0e 94 03 01 	call	0x206	; 0x206 <nrf_regwr>
    nrf_regwr(NRF_REG_SETUP_AW, NRF_INI_SETUP_AW);
 326:	61 e0       	ldi	r22, 0x01	; 1
 328:	83 e0       	ldi	r24, 0x03	; 3
 32a:	0e 94 03 01 	call	0x206	; 0x206 <nrf_regwr>
    nrf_regwr(NRF_REG_SETUP_RETR, NRF_INI_SETUP_RETR);
 32e:	60 e0       	ldi	r22, 0x00	; 0
 330:	84 e0       	ldi	r24, 0x04	; 4
 332:	0e 94 03 01 	call	0x206	; 0x206 <nrf_regwr>
    nrf_regwr(NRF_REG_RF_SETUP, NRF_INI_RF_SETUP);
 336:	66 e0       	ldi	r22, 0x06	; 6
 338:	86 e0       	ldi	r24, 0x06	; 6
    //nrf_regwr(NRF_REG_RX_PW_P1, NRF_INI_RX_PW_P1);
    //nrf_regwr(NRF_REG_RX_PW_P2, NRF_INI_RX_PW_P2);
    //nrf_regwr(NRF_REG_RX_PW_P3, NRF_INI_RX_PW_P3);
    //nrf_regwr(NRF_REG_RX_PW_P4, NRF_INI_RX_PW_P4);
    //nrf_regwr(NRF_REG_RX_PW_P5, NRF_INI_RX_PW_P5);
}
 33a:	df 91       	pop	r29
 33c:	cf 91       	pop	r28

    // perform system configuration
    nrf_regwr(NRF_REG_CONFIG, NRF_INI_CONFIG);
    nrf_regwr(NRF_REG_SETUP_AW, NRF_INI_SETUP_AW);
    nrf_regwr(NRF_REG_SETUP_RETR, NRF_INI_SETUP_RETR);
    nrf_regwr(NRF_REG_RF_SETUP, NRF_INI_RF_SETUP);
 33e:	0c 94 03 01 	jmp	0x206	; 0x206 <nrf_regwr>

00000342 <nrf_enable_pipe>:
void nrf_set_channel(uint8_t channel) {
    nrf_regwr(NRF_REG_RF_CH, ( (channel & 0x7F) << NRF_BIT_RF_CH60 ) );
}


void nrf_enable_pipe(uint8_t pipe, uint8_t *addr) {
 342:	ff 92       	push	r15
 344:	0f 93       	push	r16
 346:	1f 93       	push	r17
 348:	cf 93       	push	r28
 34a:	df 93       	push	r29
 34c:	f8 2e       	mov	r15, r24
 34e:	8b 01       	movw	r16, r22
    // set payload width for that pipe
    nrf_regwr(NRF_REG_RX_PW_P0 + pipe, COM_PL_SIZE);
 350:	69 e1       	ldi	r22, 0x19	; 25
 352:	81 e1       	ldi	r24, 0x11	; 17
 354:	8f 0d       	add	r24, r15
 356:	0e 94 03 01 	call	0x206	; 0x206 <nrf_regwr>

    // enable auto-ack on pipe
    uint8_t v = nrf_regrd(NRF_REG_EN_AA);
 35a:	81 e0       	ldi	r24, 0x01	; 1
 35c:	0e 94 61 01 	call	0x2c2	; 0x2c2 <nrf_regrd>
    nrf_regwr(NRF_REG_EN_AA, v | _BV(pipe));
 360:	c1 e0       	ldi	r28, 0x01	; 1
 362:	d0 e0       	ldi	r29, 0x00	; 0
 364:	0f 2c       	mov	r0, r15
 366:	01 c0       	rjmp	.+2      	; 0x36a <nrf_enable_pipe+0x28>
 368:	cc 0f       	add	r28, r28
 36a:	0a 94       	dec	r0
 36c:	ea f7       	brpl	.-6      	; 0x368 <nrf_enable_pipe+0x26>
 36e:	6c 2f       	mov	r22, r28
 370:	68 2b       	or	r22, r24
 372:	81 e0       	ldi	r24, 0x01	; 1
 374:	0e 94 03 01 	call	0x206	; 0x206 <nrf_regwr>

    // enable reception on the selected pipe
    v = nrf_regrd(NRF_REG_EN_RXADDR);
 378:	82 e0       	ldi	r24, 0x02	; 2
 37a:	0e 94 61 01 	call	0x2c2	; 0x2c2 <nrf_regrd>
    nrf_regwr(NRF_REG_EN_RXADDR, v | _BV(pipe));
 37e:	6c 2f       	mov	r22, r28
 380:	68 2b       	or	r22, r24
 382:	82 e0       	ldi	r24, 0x02	; 2
 384:	0e 94 03 01 	call	0x206	; 0x206 <nrf_regwr>
 388:	8a e0       	ldi	r24, 0x0A	; 10
 38a:	8f 0d       	add	r24, r15

    // set address
    if (pipe <= 1) {
 38c:	91 e0       	ldi	r25, 0x01	; 1
 38e:	9f 15       	cp	r25, r15
 390:	48 f0       	brcs	.+18     	; 0x3a4 <nrf_enable_pipe+0x62>
        // use full pipe address
        nrf_regwr_long(NRF_REG_RX_ADDR_P0 + pipe, COM_AD_SIZE, addr);
 392:	a8 01       	movw	r20, r16
 394:	63 e0       	ldi	r22, 0x03	; 3
    } else {
        // use short pipe address
        nrf_regwr(NRF_REG_RX_ADDR_P0 + pipe, addr[0]);
    }
}
 396:	df 91       	pop	r29
 398:	cf 91       	pop	r28
 39a:	1f 91       	pop	r17
 39c:	0f 91       	pop	r16
 39e:	ff 90       	pop	r15
    nrf_regwr(NRF_REG_EN_RXADDR, v | _BV(pipe));

    // set address
    if (pipe <= 1) {
        // use full pipe address
        nrf_regwr_long(NRF_REG_RX_ADDR_P0 + pipe, COM_AD_SIZE, addr);
 3a0:	0c 94 be 00 	jmp	0x17c	; 0x17c <nrf_regwr_long>
    } else {
        // use short pipe address
        nrf_regwr(NRF_REG_RX_ADDR_P0 + pipe, addr[0]);
 3a4:	f8 01       	movw	r30, r16
 3a6:	60 81       	ld	r22, Z
    }
}
 3a8:	df 91       	pop	r29
 3aa:	cf 91       	pop	r28
 3ac:	1f 91       	pop	r17
 3ae:	0f 91       	pop	r16
 3b0:	ff 90       	pop	r15
    if (pipe <= 1) {
        // use full pipe address
        nrf_regwr_long(NRF_REG_RX_ADDR_P0 + pipe, COM_AD_SIZE, addr);
    } else {
        // use short pipe address
        nrf_regwr(NRF_REG_RX_ADDR_P0 + pipe, addr[0]);
 3b2:	0c 94 03 01 	jmp	0x206	; 0x206 <nrf_regwr>

000003b6 <nrf_disable_pipe>:
    }
}

void nrf_disable_pipe(uint8_t pipe) {
 3b6:	cf 93       	push	r28
 3b8:	c8 2f       	mov	r28, r24
    uint8_t v = nrf_regrd(NRF_REG_EN_RXADDR);
 3ba:	82 e0       	ldi	r24, 0x02	; 2
 3bc:	0e 94 61 01 	call	0x2c2	; 0x2c2 <nrf_regrd>
    nrf_regwr(NRF_REG_EN_RXADDR, v & ~_BV(pipe));
 3c0:	61 e0       	ldi	r22, 0x01	; 1
 3c2:	70 e0       	ldi	r23, 0x00	; 0
 3c4:	01 c0       	rjmp	.+2      	; 0x3c8 <nrf_disable_pipe+0x12>
 3c6:	66 0f       	add	r22, r22
 3c8:	ca 95       	dec	r28
 3ca:	ea f7       	brpl	.-6      	; 0x3c6 <nrf_disable_pipe+0x10>
 3cc:	60 95       	com	r22
 3ce:	68 23       	and	r22, r24
 3d0:	82 e0       	ldi	r24, 0x02	; 2
}
 3d2:	cf 91       	pop	r28
    }
}

void nrf_disable_pipe(uint8_t pipe) {
    uint8_t v = nrf_regrd(NRF_REG_EN_RXADDR);
    nrf_regwr(NRF_REG_EN_RXADDR, v & ~_BV(pipe));
 3d4:	0c 94 03 01 	jmp	0x206	; 0x206 <nrf_regwr>

000003d8 <nrf_flushtx>:

    return data;
}


uint8_t nrf_flushtx(void) {
 3d8:	cf 93       	push	r28
 3da:	df 93       	push	r29
 3dc:	1f 92       	push	r1
 3de:	cd b7       	in	r28, 0x3d	; 61
 3e0:	de b7       	in	r29, 0x3e	; 62
    uint8_t status;

    nrfspi_cs_en();
 3e2:	0e 94 2b 03 	call	0x656	; 0x656 <nrfspi_cs_en>
    status = nrfspi_txrx_byte(NRF_CMD_FLSHT);
 3e6:	81 ee       	ldi	r24, 0xE1	; 225
 3e8:	0e 94 25 03 	call	0x64a	; 0x64a <nrfspi_txrx_byte>
    nrfspi_cs_ds();
 3ec:	89 83       	std	Y+1, r24	; 0x01
 3ee:	0e 94 2d 03 	call	0x65a	; 0x65a <nrfspi_cs_ds>

    return status;
}
 3f2:	89 81       	ldd	r24, Y+1	; 0x01
 3f4:	0f 90       	pop	r0
 3f6:	df 91       	pop	r29
 3f8:	cf 91       	pop	r28
 3fa:	08 95       	ret

000003fc <nrf_setmode.part.0>:
}


void nrf_setmode(nrf_mode_t mode) {
    if (mode == NRF_MODE_TX) {
        nrf_flushtx();
 3fc:	0e 94 ec 01 	call	0x3d8	; 0x3d8 <nrf_flushtx>

        nrf_regwr(NRF_REG_STATUS, _BV(NRF_BIT_RX_DR) | _BV(NRF_BIT_TX_DS) |
 400:	60 e7       	ldi	r22, 0x70	; 112
 402:	87 e0       	ldi	r24, 0x07	; 7
 404:	0e 94 03 01 	call	0x206	; 0x206 <nrf_regwr>
                                  _BV(NRF_BIT_MAX_RT));

        nrf_regwr(NRF_REG_CONFIG, (NRF_INI_CONFIG & ~(_BV(NRF_BIT_PRIM_RX))) |
 408:	6a e3       	ldi	r22, 0x3A	; 58
 40a:	80 e0       	ldi	r24, 0x00	; 0
 40c:	0c 94 03 01 	jmp	0x206	; 0x206 <nrf_regwr>

00000410 <nrf_flushrx>:

    return status;
}


uint8_t nrf_flushrx(void) {
 410:	cf 93       	push	r28
 412:	df 93       	push	r29
 414:	1f 92       	push	r1
 416:	cd b7       	in	r28, 0x3d	; 61
 418:	de b7       	in	r29, 0x3e	; 62
    uint8_t status;

    nrfspi_cs_en();
 41a:	0e 94 2b 03 	call	0x656	; 0x656 <nrfspi_cs_en>
    status = nrfspi_txrx_byte(NRF_CMD_FLSHR);
 41e:	82 ee       	ldi	r24, 0xE2	; 226
 420:	0e 94 25 03 	call	0x64a	; 0x64a <nrfspi_txrx_byte>
    nrfspi_cs_ds();
 424:	89 83       	std	Y+1, r24	; 0x01
 426:	0e 94 2d 03 	call	0x65a	; 0x65a <nrfspi_cs_ds>

    return status;
}
 42a:	89 81       	ldd	r24, Y+1	; 0x01
 42c:	0f 90       	pop	r0
 42e:	df 91       	pop	r29
 430:	cf 91       	pop	r28
 432:	08 95       	ret

00000434 <nrf_stop_receiver>:
    nrf_ce_on();
}


void nrf_stop_receiver(void) {
    nrf_ce_off();
 434:	0e 94 8f 00 	call	0x11e	; 0x11e <nrf_ce_off>
    nrf_flushrx();
 438:	0e 94 08 02 	call	0x410	; 0x410 <nrf_flushrx>
    nrf_disable_irq();
 43c:	0c 94 7d 00 	jmp	0xfa	; 0xfa <nrf_disable_irq>

00000440 <nrf_setmode>:
    _OFF(NRF_CE_PRT, NRF_CE_PIN);
}


void nrf_setmode(nrf_mode_t mode) {
    if (mode == NRF_MODE_TX) {
 440:	81 30       	cpi	r24, 0x01	; 1
 442:	11 f4       	brne	.+4      	; 0x448 <nrf_setmode+0x8>
 444:	0c 94 fe 01 	jmp	0x3fc	; 0x3fc <nrf_setmode.part.0>
        nrf_regwr(NRF_REG_STATUS, _BV(NRF_BIT_RX_DR) | _BV(NRF_BIT_TX_DS) |
                                  _BV(NRF_BIT_MAX_RT));

        nrf_regwr(NRF_REG_CONFIG, (NRF_INI_CONFIG & ~(_BV(NRF_BIT_PRIM_RX))) |
                                  _BV(NRF_BIT_PWR_UP));
    } else if (mode == NRF_MODE_RX ) {
 448:	82 30       	cpi	r24, 0x02	; 2
 44a:	41 f4       	brne	.+16     	; 0x45c <nrf_setmode+0x1c>
        nrf_flushrx();
 44c:	0e 94 08 02 	call	0x410	; 0x410 <nrf_flushrx>

        nrf_regwr(NRF_REG_STATUS, _BV(NRF_BIT_RX_DR) | _BV(NRF_BIT_TX_DS)
 450:	60 e7       	ldi	r22, 0x70	; 112
 452:	87 e0       	ldi	r24, 0x07	; 7
 454:	0e 94 03 01 	call	0x206	; 0x206 <nrf_regwr>
                                  | _BV(NRF_BIT_MAX_RT));

        nrf_regwr(NRF_REG_CONFIG, NRF_INI_CONFIG | _BV(NRF_BIT_PWR_UP) |
 458:	6b e3       	ldi	r22, 0x3B	; 59
 45a:	03 c0       	rjmp	.+6      	; 0x462 <nrf_setmode+0x22>
                                  _BV(NRF_BIT_PRIM_RX));
    } else {
        nrf_ce_off();
 45c:	0e 94 8f 00 	call	0x11e	; 0x11e <nrf_ce_off>
        nrf_regwr(NRF_REG_CONFIG, NRF_INI_CONFIG & ~(_BV(NRF_BIT_PWR_UP)));
 460:	69 e3       	ldi	r22, 0x39	; 57
 462:	80 e0       	ldi	r24, 0x00	; 0
 464:	0c 94 03 01 	jmp	0x206	; 0x206 <nrf_regwr>

00000468 <nrf_start_receiver>:
    return ack;
}


void nrf_start_receiver(void) {
    packet_ready = 0;
 468:	10 92 1a 01 	sts	0x011A, r1

    nrf_setmode(NRF_MODE_RX);
 46c:	82 e0       	ldi	r24, 0x02	; 2
 46e:	0e 94 20 02 	call	0x440	; 0x440 <nrf_setmode>
    nrf_enable_irq();
 472:	0e 94 7a 00 	call	0xf4	; 0xf4 <nrf_enable_irq>
    nrf_ce_on();
 476:	0c 94 8d 00 	jmp	0x11a	; 0x11a <nrf_ce_on>

0000047a <nrf_reusetx>:

    return status;
}


uint8_t nrf_reusetx(void) {
 47a:	cf 93       	push	r28
 47c:	df 93       	push	r29
 47e:	1f 92       	push	r1
 480:	cd b7       	in	r28, 0x3d	; 61
 482:	de b7       	in	r29, 0x3e	; 62
    uint8_t status;

    nrfspi_cs_en();
 484:	0e 94 2b 03 	call	0x656	; 0x656 <nrfspi_cs_en>
    status = nrfspi_txrx_byte(NRF_CMD_REUSE);
 488:	83 ee       	ldi	r24, 0xE3	; 227
 48a:	0e 94 25 03 	call	0x64a	; 0x64a <nrfspi_txrx_byte>
    nrfspi_cs_ds();
 48e:	89 83       	std	Y+1, r24	; 0x01
 490:	0e 94 2d 03 	call	0x65a	; 0x65a <nrfspi_cs_ds>

    return status;
}
 494:	89 81       	ldd	r24, Y+1	; 0x01
 496:	0f 90       	pop	r0
 498:	df 91       	pop	r29
 49a:	cf 91       	pop	r28
 49c:	08 95       	ret

0000049e <nrf_rxplwidth>:


uint8_t nrf_rxplwidth(void) {
 49e:	cf 93       	push	r28
 4a0:	df 93       	push	r29
 4a2:	1f 92       	push	r1
 4a4:	cd b7       	in	r28, 0x3d	; 61
 4a6:	de b7       	in	r29, 0x3e	; 62
    uint8_t ret;

    nrfspi_cs_en();
 4a8:	0e 94 2b 03 	call	0x656	; 0x656 <nrfspi_cs_en>
    nrfspi_txrx_byte(NRF_CMD_RXPLW);
 4ac:	80 e6       	ldi	r24, 0x60	; 96
 4ae:	0e 94 25 03 	call	0x64a	; 0x64a <nrfspi_txrx_byte>
    ret = nrfspi_txrx_byte(0);
 4b2:	80 e0       	ldi	r24, 0x00	; 0
 4b4:	0e 94 25 03 	call	0x64a	; 0x64a <nrfspi_txrx_byte>
    nrfspi_cs_ds();
 4b8:	89 83       	std	Y+1, r24	; 0x01
 4ba:	0e 94 2d 03 	call	0x65a	; 0x65a <nrfspi_cs_ds>

    return ret;
}
 4be:	89 81       	ldd	r24, Y+1	; 0x01
 4c0:	0f 90       	pop	r0
 4c2:	df 91       	pop	r29
 4c4:	cf 91       	pop	r28
 4c6:	08 95       	ret

000004c8 <nrf_ackpl>:


uint8_t nrf_ackpl(uint8_t pipe, uint8_t len, uint8_t *buf) {
 4c8:	ef 92       	push	r14
 4ca:	ff 92       	push	r15
 4cc:	0f 93       	push	r16
 4ce:	1f 93       	push	r17
 4d0:	cf 93       	push	r28
 4d2:	df 93       	push	r29
 4d4:	1f 92       	push	r1
 4d6:	cd b7       	in	r28, 0x3d	; 61
 4d8:	de b7       	in	r29, 0x3e	; 62
 4da:	06 2f       	mov	r16, r22
 4dc:	7a 01       	movw	r14, r20
    uint8_t status;
    
    nrfspi_cs_en();
 4de:	89 83       	std	Y+1, r24	; 0x01
 4e0:	0e 94 2b 03 	call	0x656	; 0x656 <nrfspi_cs_en>
    status = nrfspi_txrx_byte(NRF_CMD_RXPLW | pipe);
 4e4:	89 81       	ldd	r24, Y+1	; 0x01
 4e6:	80 66       	ori	r24, 0x60	; 96
 4e8:	0e 94 25 03 	call	0x64a	; 0x64a <nrfspi_txrx_byte>
 4ec:	18 2f       	mov	r17, r24
    nrfspi_txrx(len, buf, 0);
 4ee:	40 e0       	ldi	r20, 0x00	; 0
 4f0:	50 e0       	ldi	r21, 0x00	; 0
 4f2:	b7 01       	movw	r22, r14
 4f4:	80 2f       	mov	r24, r16
 4f6:	0e 94 07 03 	call	0x60e	; 0x60e <nrfspi_txrx>
    nrfspi_cs_ds();
 4fa:	0e 94 2d 03 	call	0x65a	; 0x65a <nrfspi_cs_ds>

    return status;
}
 4fe:	81 2f       	mov	r24, r17
 500:	0f 90       	pop	r0
 502:	df 91       	pop	r29
 504:	cf 91       	pop	r28
 506:	1f 91       	pop	r17
 508:	0f 91       	pop	r16
 50a:	ff 90       	pop	r15
 50c:	ef 90       	pop	r14
 50e:	08 95       	ret

00000510 <nrf_txnoack>:


uint8_t nrf_txnoack(uint8_t pipe, uint8_t len, uint8_t *buf) {
 510:	ef 92       	push	r14
 512:	ff 92       	push	r15
 514:	0f 93       	push	r16
 516:	1f 93       	push	r17
 518:	cf 93       	push	r28
 51a:	df 93       	push	r29
 51c:	1f 92       	push	r1
 51e:	cd b7       	in	r28, 0x3d	; 61
 520:	de b7       	in	r29, 0x3e	; 62
 522:	06 2f       	mov	r16, r22
 524:	7a 01       	movw	r14, r20
    uint8_t status;

    nrfspi_cs_en();
 526:	89 83       	std	Y+1, r24	; 0x01
 528:	0e 94 2b 03 	call	0x656	; 0x656 <nrfspi_cs_en>
    status = nrfspi_txrx_byte(NRF_CMD_NOACK | pipe);
 52c:	89 81       	ldd	r24, Y+1	; 0x01
 52e:	80 6b       	ori	r24, 0xB0	; 176
 530:	0e 94 25 03 	call	0x64a	; 0x64a <nrfspi_txrx_byte>
 534:	18 2f       	mov	r17, r24
    nrfspi_txrx(len, buf, 0);
 536:	40 e0       	ldi	r20, 0x00	; 0
 538:	50 e0       	ldi	r21, 0x00	; 0
 53a:	b7 01       	movw	r22, r14
 53c:	80 2f       	mov	r24, r16
 53e:	0e 94 07 03 	call	0x60e	; 0x60e <nrfspi_txrx>
    nrfspi_cs_ds();
 542:	0e 94 2d 03 	call	0x65a	; 0x65a <nrfspi_cs_ds>

    return status;
}
 546:	81 2f       	mov	r24, r17
 548:	0f 90       	pop	r0
 54a:	df 91       	pop	r29
 54c:	cf 91       	pop	r28
 54e:	1f 91       	pop	r17
 550:	0f 91       	pop	r16
 552:	ff 90       	pop	r15
 554:	ef 90       	pop	r14
 556:	08 95       	ret

00000558 <nrf_status>:


uint8_t nrf_status(void) {
 558:	cf 93       	push	r28
 55a:	df 93       	push	r29
 55c:	1f 92       	push	r1
 55e:	cd b7       	in	r28, 0x3d	; 61
 560:	de b7       	in	r29, 0x3e	; 62
    uint8_t status;

    nrfspi_cs_en();
 562:	0e 94 2b 03 	call	0x656	; 0x656 <nrfspi_cs_en>
    status = nrfspi_txrx_byte(NRF_CMD_XXNOP);
 566:	8f ef       	ldi	r24, 0xFF	; 255
 568:	0e 94 25 03 	call	0x64a	; 0x64a <nrfspi_txrx_byte>
    nrfspi_cs_ds();
 56c:	89 83       	std	Y+1, r24	; 0x01
 56e:	0e 94 2d 03 	call	0x65a	; 0x65a <nrfspi_cs_ds>

    return status;
}
 572:	89 81       	ldd	r24, Y+1	; 0x01
 574:	0f 90       	pop	r0
 576:	df 91       	pop	r29
 578:	cf 91       	pop	r28
 57a:	08 95       	ret

0000057c <nrf_transmit_packet>:
    uint8_t v = nrf_regrd(NRF_REG_EN_RXADDR);
    nrf_regwr(NRF_REG_EN_RXADDR, v & ~_BV(pipe));
}


uint8_t nrf_transmit_packet(uint8_t *addr, uint8_t *buf) {
 57c:	0f 93       	push	r16
 57e:	1f 93       	push	r17
 580:	cf 93       	push	r28
 582:	df 93       	push	r29
 584:	ec 01       	movw	r28, r24
 586:	8b 01       	movw	r16, r22
    uint8_t ack;

    // switch to transmit mode
    nrf_ce_off();
 588:	0e 94 8f 00 	call	0x11e	; 0x11e <nrf_ce_off>
 58c:	0e 94 fe 01 	call	0x3fc	; 0x3fc <nrf_setmode.part.0>
    nrf_setmode(NRF_MODE_TX);

    // set transmit address
    nrf_regwr_long(NRF_REG_RX_ADDR_P0, COM_AD_SIZE, addr);
 590:	ae 01       	movw	r20, r28
 592:	63 e0       	ldi	r22, 0x03	; 3
 594:	8a e0       	ldi	r24, 0x0A	; 10
 596:	0e 94 be 00 	call	0x17c	; 0x17c <nrf_regwr_long>
    nrf_regwr_long(NRF_REG_TX_ADDR, COM_AD_SIZE, addr);
 59a:	ae 01       	movw	r20, r28
 59c:	63 e0       	ldi	r22, 0x03	; 3
 59e:	80 e1       	ldi	r24, 0x10	; 16
 5a0:	0e 94 be 00 	call	0x17c	; 0x17c <nrf_regwr_long>


    // load up the FIFO
    nrf_txpayload(buf);
 5a4:	c8 01       	movw	r24, r16
 5a6:	0e 94 91 00 	call	0x122	; 0x122 <nrf_txpayload>

    // pulse CE to perform transmit
    nrf_ce_on();
 5aa:	0e 94 8d 00 	call	0x11a	; 0x11a <nrf_ce_on>
	#else
		//round up by default
		__ticks_dc = (uint32_t)(ceil(fabs(__tmp)));
	#endif

	__builtin_avr_delay_cycles(__ticks_dc);
 5ae:	84 e6       	ldi	r24, 0x64	; 100
 5b0:	8a 95       	dec	r24
 5b2:	f1 f7       	brne	.-4      	; 0x5b0 <nrf_transmit_packet+0x34>
    _delay_us(NRF_TX_PULSE_MIN_US);
    nrf_ce_off();
 5b4:	0e 94 8f 00 	call	0x11e	; 0x11e <nrf_ce_off>

    // wait until transmit complete
    while ( !(nrf_status() & (_BV(NRF_BIT_TX_DS)|_BV(NRF_BIT_MAX_RT))) );
 5b8:	0e 94 ac 02 	call	0x558	; 0x558 <nrf_status>
 5bc:	80 73       	andi	r24, 0x30	; 48
 5be:	e1 f3       	breq	.-8      	; 0x5b8 <nrf_transmit_packet+0x3c>

    if ( nrf_status() & _BV(NRF_BIT_TX_DS) ) {
 5c0:	0e 94 ac 02 	call	0x558	; 0x558 <nrf_status>
 5c4:	c8 2f       	mov	r28, r24
    } else {
        ack = 0;
    }

    // clear bits
    nrf_regwr(NRF_REG_STATUS, nrf_status() | _BV(NRF_BIT_TX_DS) | _BV(NRF_BIT_MAX_RT));
 5c6:	0e 94 ac 02 	call	0x558	; 0x558 <nrf_status>
 5ca:	68 2f       	mov	r22, r24
 5cc:	60 63       	ori	r22, 0x30	; 48
 5ce:	87 e0       	ldi	r24, 0x07	; 7
 5d0:	0e 94 03 01 	call	0x206	; 0x206 <nrf_regwr>

    // switch back to receive mode
    nrf_setmode(NRF_MODE_RX);
 5d4:	82 e0       	ldi	r24, 0x02	; 2
 5d6:	0e 94 20 02 	call	0x440	; 0x440 <nrf_setmode>
    nrf_ce_on();
 5da:	0e 94 8d 00 	call	0x11a	; 0x11a <nrf_ce_on>
    
    // return 1 for successful transmission, 0 otherwise
    return ack;
}
 5de:	c5 fb       	bst	r28, 5
 5e0:	88 27       	eor	r24, r24
 5e2:	80 f9       	bld	r24, 0
 5e4:	df 91       	pop	r29
 5e6:	cf 91       	pop	r28
 5e8:	1f 91       	pop	r17
 5ea:	0f 91       	pop	r16
 5ec:	08 95       	ret

000005ee <nrfspi_init>:

void nrfspi_init(void) {
    // NRF24L01+ accepts a maximum baud rate of 10mbps and is mode '00' with MSB first

    // set up the pins
    _ON(NRF_CSN_DDR, NRF_CSN_PIN);
 5ee:	3c 9a       	sbi	0x07, 4	; 7
    _ON(NRF_SCLK_DDR, NRF_SCLK_PIN);
 5f0:	25 9a       	sbi	0x04, 5	; 4
    _ON(NRF_MOSI_DDR, NRF_MOSI_PIN);
 5f2:	23 9a       	sbi	0x04, 3	; 4
    _OFF(NRF_MISO_DDR, NRF_MISO_PIN);
 5f4:	24 98       	cbi	0x04, 4	; 4

    // the chip select line, regardless of whether it's used, must be
    // configured as output or a h->l transition will spuriously set SPIF
    _ON(NRF_CSEL_DDR, NRF_CSEL_PIN);
 5f6:	22 9a       	sbi	0x04, 2	; 4

    // enable spi in master
    SPCR = _BV(MSTR) | _BV(SPR0);
 5f8:	81 e1       	ldi	r24, 0x11	; 17
 5fa:	8c bd       	out	0x2c, r24	; 44
 5fc:	08 95       	ret

000005fe <nrfspi_enable>:
    //SPSR = _BV(SPI2X);
}


void nrfspi_enable(void) {
    _ON(SPCR, SPE);
 5fe:	8c b5       	in	r24, 0x2c	; 44
 600:	80 64       	ori	r24, 0x40	; 64
 602:	8c bd       	out	0x2c, r24	; 44
 604:	08 95       	ret

00000606 <nrfspi_disable>:
}

void nrfspi_disable(void) {
    _OFF(SPCR, SPE);
 606:	8c b5       	in	r24, 0x2c	; 44
 608:	8f 7b       	andi	r24, 0xBF	; 191
 60a:	8c bd       	out	0x2c, r24	; 44
 60c:	08 95       	ret

0000060e <nrfspi_txrx>:

uint8_t nrfspi_txrx(uint8_t len, uint8_t *txbuf, uint8_t *rxbuf) {
    uint8_t count = 0;
    uint8_t tmp;

    if (rxbuf) {
 60e:	41 15       	cp	r20, r1
 610:	51 05       	cpc	r21, r1
 612:	19 f4       	brne	.+6      	; 0x61a <nrfspi_txrx+0xc>
 614:	fb 01       	movw	r30, r22
 616:	98 2f       	mov	r25, r24
 618:	12 c0       	rjmp	.+36     	; 0x63e <nrfspi_txrx+0x30>
 61a:	da 01       	movw	r26, r20
 61c:	fb 01       	movw	r30, r22
 61e:	98 2f       	mov	r25, r24
        // transmit and read
        while (len--) {
 620:	91 50       	subi	r25, 0x01	; 1
 622:	40 f0       	brcs	.+16     	; 0x634 <nrfspi_txrx+0x26>
            SPDR = *(txbuf++);
 624:	21 91       	ld	r18, Z+
 626:	2e bd       	out	0x2e, r18	; 46
            while ((SPSR & _BV(SPIF)) == 0);
 628:	0d b4       	in	r0, 0x2d	; 45
 62a:	07 fe       	sbrs	r0, 7
 62c:	fd cf       	rjmp	.-6      	; 0x628 <nrfspi_txrx+0x1a>
            *(rxbuf++) = SPDR;
 62e:	2e b5       	in	r18, 0x2e	; 46
 630:	2d 93       	st	X+, r18
 632:	f6 cf       	rjmp	.-20     	; 0x620 <nrfspi_txrx+0x12>
 634:	08 95       	ret
        }
    } else {
        // just transmit
        while (len--) {
            SPDR = *(txbuf++);
            while ((SPSR & _BV(SPIF)) == 0);
 636:	0d b4       	in	r0, 0x2d	; 45
 638:	07 fe       	sbrs	r0, 7
 63a:	fd cf       	rjmp	.-6      	; 0x636 <nrfspi_txrx+0x28>
            tmp = SPDR;
 63c:	2e b5       	in	r18, 0x2e	; 46

            count++;
        }
    } else {
        // just transmit
        while (len--) {
 63e:	91 50       	subi	r25, 0x01	; 1
 640:	18 f0       	brcs	.+6      	; 0x648 <nrfspi_txrx+0x3a>
            SPDR = *(txbuf++);
 642:	21 91       	ld	r18, Z+
 644:	2e bd       	out	0x2e, r18	; 46
            while ((SPSR & _BV(SPIF)) == 0);
 646:	f7 cf       	rjmp	.-18     	; 0x636 <nrfspi_txrx+0x28>
        }
        tmp=tmp;
    }

    return count;
}
 648:	08 95       	ret

0000064a <nrfspi_txrx_byte>:


uint8_t nrfspi_txrx_byte(uint8_t data) {
    uint8_t ret;

    SPDR = data;
 64a:	8e bd       	out	0x2e, r24	; 46
    while ((SPSR & _BV(SPIF)) == 0);
 64c:	0d b4       	in	r0, 0x2d	; 45
 64e:	07 fe       	sbrs	r0, 7
 650:	fd cf       	rjmp	.-6      	; 0x64c <nrfspi_txrx_byte+0x2>
    ret = SPDR;
 652:	8e b5       	in	r24, 0x2e	; 46

    return ret;
}
 654:	08 95       	ret

00000656 <nrfspi_cs_en>:


__inline void nrfspi_cs_en(void) {
    _OFF(NRF_CSN_PRT, NRF_CSN_PIN);
 656:	44 98       	cbi	0x08, 4	; 8
 658:	08 95       	ret

0000065a <nrfspi_cs_ds>:
}

__inline void nrfspi_cs_ds(void) {
    _ON(NRF_CSN_PRT, NRF_CSN_PIN);
 65a:	44 9a       	sbi	0x08, 4	; 8
 65c:	08 95       	ret

0000065e <uart_printf_putchar>:
}


int uart_printf_putchar(char var, FILE *stream) {
    //if (var == '\n') var = '\n';
    uart_rb_tx(var);
 65e:	0e 94 cd 03 	call	0x79a	; 0x79a <uart_rb_tx>
    return 0;
}
 662:	80 e0       	ldi	r24, 0x00	; 0
 664:	90 e0       	ldi	r25, 0x00	; 0
 666:	08 95       	ret

00000668 <uart_printf_init>:

static FILE uart_printf_stdout = FDEV_SETUP_STREAM(uart_printf_putchar, NULL, _FDEV_SETUP_WRITE);


void uart_printf_init(void) {
    stdout = &uart_printf_stdout;
 668:	83 e0       	ldi	r24, 0x03	; 3
 66a:	91 e0       	ldi	r25, 0x01	; 1
 66c:	90 93 da 01 	sts	0x01DA, r25
 670:	80 93 d9 01 	sts	0x01D9, r24
 674:	08 95       	ret

00000676 <uart_rb_rxh>:
    UCSR0B |= _BV(UDRIE0);
}


void uart_rb_rxh(uint8_t data) {
    if ( uart_rxbuf_count <= UART_RX_BUFSZ ) {
 676:	90 91 1c 01 	lds	r25, 0x011C
 67a:	91 34       	cpi	r25, 0x41	; 65
 67c:	e0 f4       	brcc	.+56     	; 0x6b6 <uart_rb_rxh+0x40>
        *uart_rxbuf_iptr = data;
 67e:	e0 91 17 01 	lds	r30, 0x0117
 682:	f0 91 18 01 	lds	r31, 0x0118
 686:	80 83       	st	Z, r24
        uart_rxbuf_count++;
 688:	80 91 1c 01 	lds	r24, 0x011C
 68c:	8f 5f       	subi	r24, 0xFF	; 255
 68e:	80 93 1c 01 	sts	0x011C, r24

        uart_rxbuf_iptr++;
 692:	80 91 17 01 	lds	r24, 0x0117
 696:	90 91 18 01 	lds	r25, 0x0118
 69a:	01 96       	adiw	r24, 0x01	; 1
 69c:	90 93 18 01 	sts	0x0118, r25
 6a0:	80 93 17 01 	sts	0x0117, r24
        if ( uart_rxbuf_iptr >= uart_rxbuf + UART_RX_BUFSZ )
 6a4:	87 59       	subi	r24, 0x97	; 151
 6a6:	91 40       	sbci	r25, 0x01	; 1
 6a8:	30 f0       	brcs	.+12     	; 0x6b6 <uart_rb_rxh+0x40>
            uart_rxbuf_iptr = uart_rxbuf;
 6aa:	87 e5       	ldi	r24, 0x57	; 87
 6ac:	91 e0       	ldi	r25, 0x01	; 1
 6ae:	90 93 18 01 	sts	0x0118, r25
 6b2:	80 93 17 01 	sts	0x0117, r24
 6b6:	08 95       	ret

000006b8 <uart_rb_txh>:
}

void uart_rb_txh(void) {
    uint8_t data;

    data = *uart_txbuf_optr;
 6b8:	e0 91 11 01 	lds	r30, 0x0111
 6bc:	f0 91 12 01 	lds	r31, 0x0112
 6c0:	21 91       	ld	r18, Z+
    uart_txbuf_count--;
 6c2:	80 91 1b 01 	lds	r24, 0x011B
 6c6:	81 50       	subi	r24, 0x01	; 1
 6c8:	80 93 1b 01 	sts	0x011B, r24

    uart_txbuf_optr++;
    if ( uart_txbuf_optr >= uart_txbuf + UART_TX_BUFSZ )
 6cc:	81 e0       	ldi	r24, 0x01	; 1
 6ce:	e7 3d       	cpi	r30, 0xD7	; 215
 6d0:	f8 07       	cpc	r31, r24
 6d2:	28 f4       	brcc	.+10     	; 0x6de <uart_rb_txh+0x26>
    uint8_t data;

    data = *uart_txbuf_optr;
    uart_txbuf_count--;

    uart_txbuf_optr++;
 6d4:	f0 93 12 01 	sts	0x0112, r31
 6d8:	e0 93 11 01 	sts	0x0111, r30
 6dc:	06 c0       	rjmp	.+12     	; 0x6ea <uart_rb_txh+0x32>
    if ( uart_txbuf_optr >= uart_txbuf + UART_TX_BUFSZ )
        uart_txbuf_optr = uart_txbuf;
 6de:	87 e9       	ldi	r24, 0x97	; 151
 6e0:	91 e0       	ldi	r25, 0x01	; 1
 6e2:	90 93 12 01 	sts	0x0112, r25
 6e6:	80 93 11 01 	sts	0x0111, r24

    UDR0 = data;
 6ea:	20 93 c6 00 	sts	0x00C6, r18

    // if we're out of things to send, disable the interrupt until more data is
    // added to the buffer
    if (!uart_txbuf_count) {
 6ee:	80 91 1b 01 	lds	r24, 0x011B
 6f2:	81 11       	cpse	r24, r1
 6f4:	05 c0       	rjmp	.+10     	; 0x700 <uart_rb_txh+0x48>
        UCSR0B &= ~(_BV(UDRIE0));
 6f6:	80 91 c1 00 	lds	r24, 0x00C1
 6fa:	8f 7d       	andi	r24, 0xDF	; 223
 6fc:	80 93 c1 00 	sts	0x00C1, r24
 700:	08 95       	ret

00000702 <uart_rb_init>:
volatile uint8_t *uart_txbuf_optr = uart_txbuf;
volatile uint8_t uart_txbuf_count = 0;


void uart_rb_init(void) {
    uart_init(&uart_rb_txh, &uart_rb_rxh);
 702:	6b e3       	ldi	r22, 0x3B	; 59
 704:	73 e0       	ldi	r23, 0x03	; 3
 706:	8c e5       	ldi	r24, 0x5C	; 92
 708:	93 e0       	ldi	r25, 0x03	; 3
 70a:	0e 94 f5 03 	call	0x7ea	; 0x7ea <uart_init>
    uart_enable();
 70e:	0e 94 13 04 	call	0x826	; 0x826 <uart_enable>

	uart_rxbuf_iptr = uart_rxbuf;
 712:	87 e5       	ldi	r24, 0x57	; 87
 714:	91 e0       	ldi	r25, 0x01	; 1
 716:	90 93 18 01 	sts	0x0118, r25
 71a:	80 93 17 01 	sts	0x0117, r24
	uart_rxbuf_optr = uart_rxbuf;
 71e:	90 93 16 01 	sts	0x0116, r25
 722:	80 93 15 01 	sts	0x0115, r24
    uart_rxbuf_count = 0;
 726:	10 92 1c 01 	sts	0x011C, r1

	uart_txbuf_iptr = uart_txbuf;
 72a:	87 e9       	ldi	r24, 0x97	; 151
 72c:	91 e0       	ldi	r25, 0x01	; 1
 72e:	90 93 14 01 	sts	0x0114, r25
 732:	80 93 13 01 	sts	0x0113, r24
	uart_txbuf_optr = uart_txbuf;
 736:	90 93 12 01 	sts	0x0112, r25
 73a:	80 93 11 01 	sts	0x0111, r24
    uart_txbuf_count = 0;
 73e:	10 92 1b 01 	sts	0x011B, r1
 742:	08 95       	ret

00000744 <uart_rb_data_rdy>:
}

uint8_t uart_rb_data_rdy(void) {
	return ( uart_rxbuf_count );
 744:	80 91 1c 01 	lds	r24, 0x011C
}
 748:	08 95       	ret

0000074a <uart_rb_rx>:

uint8_t uart_rb_rx(void) {
	unsigned char tmp;

    // blocking call -- wait until we receive data
	while ( uart_rxbuf_count == 0 );
 74a:	80 91 1c 01 	lds	r24, 0x011C
 74e:	88 23       	and	r24, r24
 750:	e1 f3       	breq	.-8      	; 0x74a <uart_rb_rx>

    UCSR0B &= ~(_BV(RXCIE0) | _BV(RXEN0));
 752:	80 91 c1 00 	lds	r24, 0x00C1
 756:	8f 76       	andi	r24, 0x6F	; 111
 758:	80 93 c1 00 	sts	0x00C1, r24

	tmp = *uart_rxbuf_optr;
 75c:	e0 91 15 01 	lds	r30, 0x0115
 760:	f0 91 16 01 	lds	r31, 0x0116
 764:	81 91       	ld	r24, Z+
	uart_rxbuf_count--;
 766:	90 91 1c 01 	lds	r25, 0x011C
 76a:	91 50       	subi	r25, 0x01	; 1
 76c:	90 93 1c 01 	sts	0x011C, r25

    // increment pointer
	uart_rxbuf_optr++;
	if ( uart_rxbuf_optr >= uart_rxbuf + UART_RX_BUFSZ )
 770:	91 e0       	ldi	r25, 0x01	; 1
 772:	e7 39       	cpi	r30, 0x97	; 151
 774:	f9 07       	cpc	r31, r25
 776:	28 f4       	brcc	.+10     	; 0x782 <uart_rb_rx+0x38>

	tmp = *uart_rxbuf_optr;
	uart_rxbuf_count--;

    // increment pointer
	uart_rxbuf_optr++;
 778:	f0 93 16 01 	sts	0x0116, r31
 77c:	e0 93 15 01 	sts	0x0115, r30
 780:	06 c0       	rjmp	.+12     	; 0x78e <uart_rb_rx+0x44>
	if ( uart_rxbuf_optr >= uart_rxbuf + UART_RX_BUFSZ )
		uart_rxbuf_optr = uart_rxbuf;
 782:	27 e5       	ldi	r18, 0x57	; 87
 784:	31 e0       	ldi	r19, 0x01	; 1
 786:	30 93 16 01 	sts	0x0116, r19
 78a:	20 93 15 01 	sts	0x0115, r18

    UCSR0B |= (_BV(RXCIE0) | _BV(RXEN0));
 78e:	90 91 c1 00 	lds	r25, 0x00C1
 792:	90 69       	ori	r25, 0x90	; 144
 794:	90 93 c1 00 	sts	0x00C1, r25
    
	return tmp;
}
 798:	08 95       	ret

0000079a <uart_rb_tx>:

void uart_rb_tx(uint8_t data) {
    UCSR0B &= ~(_BV(UDRIE0));
 79a:	90 91 c1 00 	lds	r25, 0x00C1
 79e:	9f 7d       	andi	r25, 0xDF	; 223
 7a0:	90 93 c1 00 	sts	0x00C1, r25
    
    // blocking call -- wait until transmit buffer is no longer full
	while ( uart_txbuf_count == UART_TX_BUFSZ );
 7a4:	90 91 1b 01 	lds	r25, 0x011B
 7a8:	90 34       	cpi	r25, 0x40	; 64
 7aa:	e1 f3       	breq	.-8      	; 0x7a4 <uart_rb_tx+0xa>

	*uart_txbuf_iptr = data;
 7ac:	e0 91 13 01 	lds	r30, 0x0113
 7b0:	f0 91 14 01 	lds	r31, 0x0114
 7b4:	80 83       	st	Z, r24
	uart_txbuf_count++;
 7b6:	80 91 1b 01 	lds	r24, 0x011B
 7ba:	8f 5f       	subi	r24, 0xFF	; 255
 7bc:	80 93 1b 01 	sts	0x011B, r24

    // increment pointer
	uart_txbuf_iptr++;
 7c0:	80 91 13 01 	lds	r24, 0x0113
 7c4:	90 91 14 01 	lds	r25, 0x0114
 7c8:	01 96       	adiw	r24, 0x01	; 1
	if ( uart_txbuf_iptr >= uart_txbuf + UART_TX_BUFSZ )
 7ca:	21 e0       	ldi	r18, 0x01	; 1
 7cc:	87 3d       	cpi	r24, 0xD7	; 215
 7ce:	92 07       	cpc	r25, r18
 7d0:	10 f0       	brcs	.+4      	; 0x7d6 <uart_rb_tx+0x3c>
		uart_txbuf_iptr = uart_txbuf;
 7d2:	87 e9       	ldi	r24, 0x97	; 151
 7d4:	91 e0       	ldi	r25, 0x01	; 1
 7d6:	90 93 14 01 	sts	0x0114, r25
 7da:	80 93 13 01 	sts	0x0113, r24

    // enable interrupts
    UCSR0B |= _BV(UDRIE0);
 7de:	80 91 c1 00 	lds	r24, 0x00C1
 7e2:	80 62       	ori	r24, 0x20	; 32
 7e4:	80 93 c1 00 	sts	0x00C1, r24
 7e8:	08 95       	ret

000007ea <uart_init>:
void (*tx_handler)(void) = 0;
void (*rx_handler)(uint8_t) = 0;


void uart_init(void (*txh)(void), void (*rxh)(uint8_t)) {
	UBRR0 = UART_PRESCALER;
 7ea:	25 e1       	ldi	r18, 0x15	; 21
 7ec:	30 e0       	ldi	r19, 0x00	; 0
 7ee:	30 93 c5 00 	sts	0x00C5, r19
 7f2:	20 93 c4 00 	sts	0x00C4, r18

    UCSR0A = ( UART_DBL << U2X0 );
 7f6:	22 e0       	ldi	r18, 0x02	; 2
 7f8:	20 93 c0 00 	sts	0x00C0, r18
	UCSR0C = ( _BV(UCSZ01) | _BV(UCSZ00) );
 7fc:	26 e0       	ldi	r18, 0x06	; 6
 7fe:	20 93 c2 00 	sts	0x00C2, r18

    UCSR0C |= UART_PARITY;
 802:	20 91 c2 00 	lds	r18, 0x00C2
 806:	20 93 c2 00 	sts	0x00C2, r18

    UCSR0B = 0;
 80a:	10 92 c1 00 	sts	0x00C1, r1

    tx_handler = txh;
 80e:	90 93 20 01 	sts	0x0120, r25
 812:	80 93 1f 01 	sts	0x011F, r24
    rx_handler = rxh;
 816:	70 93 1e 01 	sts	0x011E, r23
 81a:	60 93 1d 01 	sts	0x011D, r22

    if (tx_handler) {
 81e:	89 2b       	or	r24, r25
 820:	09 f0       	breq	.+2      	; 0x824 <uart_init+0x3a>
        UART_TX_DDR |= 1<<UART_TX_PIN;
 822:	51 9a       	sbi	0x0a, 1	; 10
 824:	08 95       	ret

00000826 <uart_enable>:
    }
}


void uart_enable(void) {
    if (tx_handler) {
 826:	80 91 1f 01 	lds	r24, 0x011F
 82a:	90 91 20 01 	lds	r25, 0x0120
 82e:	89 2b       	or	r24, r25
 830:	29 f0       	breq	.+10     	; 0x83c <uart_enable+0x16>
        UCSR0B |= ( _BV(UDRIE0) | _BV(TXEN0) );
 832:	80 91 c1 00 	lds	r24, 0x00C1
 836:	88 62       	ori	r24, 0x28	; 40
 838:	80 93 c1 00 	sts	0x00C1, r24
    }

    if (rx_handler) {
 83c:	80 91 1d 01 	lds	r24, 0x011D
 840:	90 91 1e 01 	lds	r25, 0x011E
 844:	89 2b       	or	r24, r25
 846:	29 f0       	breq	.+10     	; 0x852 <uart_enable+0x2c>
        UCSR0B |= ( _BV(RXCIE0) | _BV(RXEN0) );
 848:	80 91 c1 00 	lds	r24, 0x00C1
 84c:	80 69       	ori	r24, 0x90	; 144
 84e:	80 93 c1 00 	sts	0x00C1, r24
 852:	08 95       	ret

00000854 <uart_disable>:
    }
}


void uart_disable(void) {
    UCSR0B &= ~( _BV(UDRIE0) | _BV(TXEN0) | _BV(RXCIE0) | _BV(RXEN0) );
 854:	e1 ec       	ldi	r30, 0xC1	; 193
 856:	f0 e0       	ldi	r31, 0x00	; 0
 858:	80 81       	ld	r24, Z
 85a:	87 74       	andi	r24, 0x47	; 71
 85c:	80 83       	st	Z, r24
 85e:	08 95       	ret

00000860 <__vector_18>:
}


ISR(USART_RX_vect) {
 860:	1f 92       	push	r1
 862:	0f 92       	push	r0
 864:	0f b6       	in	r0, 0x3f	; 63
 866:	0f 92       	push	r0
 868:	11 24       	eor	r1, r1
 86a:	2f 93       	push	r18
 86c:	3f 93       	push	r19
 86e:	4f 93       	push	r20
 870:	5f 93       	push	r21
 872:	6f 93       	push	r22
 874:	7f 93       	push	r23
 876:	8f 93       	push	r24
 878:	9f 93       	push	r25
 87a:	af 93       	push	r26
 87c:	bf 93       	push	r27
 87e:	ef 93       	push	r30
 880:	ff 93       	push	r31
	uint8_t byte;

    // check for framing errors, overrun errors, and parity errors
    // reset the uart if necessary
    if ( UCSR0A & (_BV(FE0) | _BV(DOR0) | _BV(UPE0)) ) {
 882:	80 91 c0 00 	lds	r24, 0x00C0
 886:	8c 71       	andi	r24, 0x1C	; 28
 888:	59 f0       	breq	.+22     	; 0x8a0 <__vector_18+0x40>
        UCSR0B &= ~(_BV(RXCIE0) | _BV(RXEN0));
 88a:	80 91 c1 00 	lds	r24, 0x00C1
 88e:	8f 76       	andi	r24, 0x6F	; 111
 890:	80 93 c1 00 	sts	0x00C1, r24
        UCSR0B |=  (_BV(RXCIE0) | _BV(RXEN0));
 894:	80 91 c1 00 	lds	r24, 0x00C1
 898:	80 69       	ori	r24, 0x90	; 144
 89a:	80 93 c1 00 	sts	0x00C1, r24
 89e:	07 c0       	rjmp	.+14     	; 0x8ae <__vector_18+0x4e>
    } else {
        byte = UDR0;
 8a0:	80 91 c6 00 	lds	r24, 0x00C6
        rx_handler(byte);
 8a4:	e0 91 1d 01 	lds	r30, 0x011D
 8a8:	f0 91 1e 01 	lds	r31, 0x011E
 8ac:	09 95       	icall
    }
}
 8ae:	ff 91       	pop	r31
 8b0:	ef 91       	pop	r30
 8b2:	bf 91       	pop	r27
 8b4:	af 91       	pop	r26
 8b6:	9f 91       	pop	r25
 8b8:	8f 91       	pop	r24
 8ba:	7f 91       	pop	r23
 8bc:	6f 91       	pop	r22
 8be:	5f 91       	pop	r21
 8c0:	4f 91       	pop	r20
 8c2:	3f 91       	pop	r19
 8c4:	2f 91       	pop	r18
 8c6:	0f 90       	pop	r0
 8c8:	0f be       	out	0x3f, r0	; 63
 8ca:	0f 90       	pop	r0
 8cc:	1f 90       	pop	r1
 8ce:	18 95       	reti

000008d0 <__vector_19>:
 8d0:	1f 92       	push	r1
 8d2:	0f 92       	push	r0
 8d4:	0f b6       	in	r0, 0x3f	; 63
 8d6:	0f 92       	push	r0
 8d8:	11 24       	eor	r1, r1
 8da:	2f 93       	push	r18
 8dc:	3f 93       	push	r19
 8de:	4f 93       	push	r20
 8e0:	5f 93       	push	r21
 8e2:	6f 93       	push	r22
 8e4:	7f 93       	push	r23
 8e6:	8f 93       	push	r24
 8e8:	9f 93       	push	r25
 8ea:	af 93       	push	r26
 8ec:	bf 93       	push	r27
 8ee:	ef 93       	push	r30
 8f0:	ff 93       	push	r31
 8f2:	e0 91 1f 01 	lds	r30, 0x011F
 8f6:	f0 91 20 01 	lds	r31, 0x0120
 8fa:	09 95       	icall
 8fc:	ff 91       	pop	r31
 8fe:	ef 91       	pop	r30
 900:	bf 91       	pop	r27
 902:	af 91       	pop	r26
 904:	9f 91       	pop	r25
 906:	8f 91       	pop	r24
 908:	7f 91       	pop	r23
 90a:	6f 91       	pop	r22
 90c:	5f 91       	pop	r21
 90e:	4f 91       	pop	r20
 910:	3f 91       	pop	r19
 912:	2f 91       	pop	r18
 914:	0f 90       	pop	r0
 916:	0f be       	out	0x3f, r0	; 63
 918:	0f 90       	pop	r0
 91a:	1f 90       	pop	r1
 91c:	18 95       	reti

0000091e <main>:
 91e:	cf 93       	push	r28
 920:	df 93       	push	r29
 922:	1f 92       	push	r1
 924:	cd b7       	in	r28, 0x3d	; 61
 926:	de b7       	in	r29, 0x3e	; 62
 928:	0e 94 73 00 	call	0xe6	; 0xe6 <dbg_init>
 92c:	86 e0       	ldi	r24, 0x06	; 6
 92e:	0e 94 53 00 	call	0xa6	; 0xa6 <dbg_set>
 932:	81 e2       	ldi	r24, 0x21	; 33
 934:	91 e0       	ldi	r25, 0x01	; 1
 936:	0e 94 77 01 	call	0x2ee	; 0x2ee <nrf_init>
 93a:	85 e0       	ldi	r24, 0x05	; 5
 93c:	0e 94 1f 01 	call	0x23e	; 0x23e <nrf_set_channel>
 940:	60 e0       	ldi	r22, 0x00	; 0
 942:	71 e0       	ldi	r23, 0x01	; 1
 944:	81 e0       	ldi	r24, 0x01	; 1
 946:	0e 94 a1 01 	call	0x342	; 0x342 <nrf_enable_pipe>
 94a:	78 94       	sei
 94c:	0e 94 34 02 	call	0x468	; 0x468 <nrf_start_receiver>
 950:	80 e0       	ldi	r24, 0x00	; 0
 952:	89 83       	std	Y+1, r24	; 0x01
 954:	0e 94 81 00 	call	0x102	; 0x102 <nrf_wait_for_rxpacket>
 958:	0e 94 89 00 	call	0x112	; 0x112 <nrf_accept_packet>
 95c:	89 81       	ldd	r24, Y+1	; 0x01
 95e:	11 e0       	ldi	r17, 0x01	; 1
 960:	18 0f       	add	r17, r24
 962:	0e 94 53 00 	call	0xa6	; 0xa6 <dbg_set>
 966:	81 2f       	mov	r24, r17
 968:	f4 cf       	rjmp	.-24     	; 0x952 <main+0x34>

0000096a <_exit>:
 96a:	f8 94       	cli

0000096c <__stop_program>:
 96c:	ff cf       	rjmp	.-2      	; 0x96c <__stop_program>
