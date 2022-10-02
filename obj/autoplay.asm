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
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;src/autoplay.c:13: }
	ret
;src/autoplay.c:15: void auto_update() {
;	---------------------------------
; Function auto_update
; ---------------------------------
_auto_update::
;src/autoplay.c:17: Ball* ball = balls_get_first_active();
	call	_balls_get_first_active
;src/autoplay.c:19: keys_resetAllKeys();
	push	hl
	call	_keys_resetAllKeys
	pop	bc
;src/autoplay.c:21: if (ball != NULL) {
	ld	a, b
	or	a,c
	ret	Z
;src/autoplay.c:22: if (serving) {
	ld	a,(#_serving + 0)
	or	a, a
	jr	Z,00107$
;src/autoplay.c:23: key_serve_is_pressed = 1;
	ld	hl,#_key_serve_is_pressed + 0
	ld	(hl), #0x01
	ret
00107$:
;src/autoplay.c:24: } else if (batX < ball->x) {
	ld	l, c
	ld	h, b
	inc	hl
	ld	c, (hl)
	ld	a,(#_batX + 0)
	sub	a, c
	jr	NC,00104$
;src/autoplay.c:25: key_right_is_pressed = 1;
	ld	hl,#_key_right_is_pressed + 0
	ld	(hl), #0x01
	ret
00104$:
;src/autoplay.c:26: } else if (batX > ball->x) {
	ld	a, c
	ld	iy, #_batX
	sub	a, 0 (iy)
	ret	NC
;src/autoplay.c:27: key_left_is_pressed = 1;
	ld	hl,#_key_left_is_pressed + 0
	ld	(hl), #0x01
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
