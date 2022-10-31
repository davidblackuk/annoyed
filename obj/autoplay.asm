;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module autoplay
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _auto_update
	.globl _auto_initialize
	.globl _keys_resetAllKeys
	.globl _balls_get_first_active
	.globl _is_controling
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_is_controling::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/autoplay.c:11: void auto_initialize() {
;	---------------------------------
; Function auto_initialize
; ---------------------------------
_auto_initialize::
;src/autoplay.c:12: is_controling = 0;
	ld	hl,#_is_controling + 0
	ld	(hl), #0x00
	ret
;src/autoplay.c:15: void auto_update() {
;	---------------------------------
; Function auto_update
; ---------------------------------
_auto_update::
;src/autoplay.c:18: if (key_auto_is_pressed) {
	ld	a,(#_key_auto_is_pressed + 0)
	or	a, a
	jr	Z,00102$
;src/autoplay.c:19: is_controling = is_controling ? 0 : 1;
	ld	a,(#_is_controling + 0)
	or	a, a
	jr	Z,00117$
	ld	c, #0x00
	jr	00118$
00117$:
	ld	c, #0x01
00118$:
	ld	hl,#_is_controling + 0
	ld	(hl), c
00102$:
;src/autoplay.c:22: if (is_controling) {
	ld	a,(#_is_controling + 0)
	or	a, a
	ret	Z
;src/autoplay.c:23: Ball* ball = balls_get_first_active();
	call	_balls_get_first_active
;src/autoplay.c:25: keys_resetAllKeys();
	push	hl
	call	_keys_resetAllKeys
	pop	bc
;src/autoplay.c:26: if (ball != NULL) {
	ld	a, b
	or	a,c
	ret	Z
;src/autoplay.c:27: mid_bat_x = batX + (batW / 2);
	ld	hl,#_batW + 0
	ld	e, (hl)
	srl	e
	ld	a,(#_batX + 0)
	add	a, e
	ld	e, a
;src/autoplay.c:28: if (serving) {
	ld	a,(#_serving + 0)
	or	a, a
	jr	Z,00109$
;src/autoplay.c:29: key_serve_is_pressed = 1;
	ld	hl,#_key_serve_is_pressed + 0
	ld	(hl), #0x01
	ret
00109$:
;src/autoplay.c:30: } else if (mid_bat_x < ball->x ) {
	ld	l, c
	ld	h, b
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	d, #0x00
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jp	PO, 00147$
	xor	a, #0x80
00147$:
	jp	P, 00106$
;src/autoplay.c:31: key_right_is_pressed = 1;
	ld	hl,#_key_right_is_pressed + 0
	ld	(hl), #0x01
	ret
00106$:
;src/autoplay.c:32: } else if (mid_bat_x > ball->x ) {
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jp	PO, 00148$
	xor	a, #0x80
00148$:
	ret	P
;src/autoplay.c:33: key_left_is_pressed = 1;
	ld	hl,#_key_left_is_pressed + 0
	ld	(hl), #0x01
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
