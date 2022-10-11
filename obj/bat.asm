;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module bat
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _background_restore_world_coords
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSprite
	.globl _batW
	.globl _oldBatX
	.globl _batX
	.globl _batY
	.globl _bat_initialize
	.globl _bat_update
	.globl _bat_restore_background
	.globl _bat_draw
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
_batY::
	.ds 1
_batX::
	.ds 1
_oldBatX::
	.ds 1
_batW::
	.ds 1
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
;src/bat.c:35: void bat_initialize() {
;	---------------------------------
; Function bat_initialize
; ---------------------------------
_bat_initialize::
;src/bat.c:36: batW = 8;
	ld	hl,#_batW + 0
	ld	(hl), #0x08
;src/bat.c:37: batX = (PLAY_AREA_WIDTH- batW) / 2;
	ld	hl,#_batX + 0
	ld	(hl), #0x16
;src/bat.c:38: batY = PLAY_AREA_HEIGHT - BAT_HEIGHT_PIXELS - BAT_BOTTOM_OFFSET_PIXELS;
	ld	hl,#_batY + 0
	ld	(hl), #0xb0
;src/bat.c:39: oldBatX = batX;
	ld	hl,#_oldBatX + 0
	ld	(hl), #0x16
	ret
;src/bat.c:43: void bat_update() {
;	---------------------------------
; Function bat_update
; ---------------------------------
_bat_update::
;src/bat.c:46: oldBatX = batX;
	ld	hl,#_batX + 0
	ld	c, (hl)
;src/bat.c:44: if (key_left_is_pressed) {
	ld	a,(#_key_left_is_pressed + 0)
	or	a, a
	jr	Z,00108$
;src/bat.c:45: if (batX > 0) {
	ld	a,(#_batX + 0)
	or	a, a
	ret	Z
;src/bat.c:46: oldBatX = batX;
	ld	hl,#_oldBatX + 0
	ld	(hl), c
;src/bat.c:47: batX--;
	ld	hl, #_batX+0
	dec	(hl)
	ret
00108$:
;src/bat.c:49: } else if (key_right_is_pressed) {
	ld	a,(#_key_right_is_pressed + 0)
	or	a, a
	ret	Z
;src/bat.c:50: if (batX < PLAY_AREA_WIDTH - batW) {
	ld	hl,#_batW + 0
	ld	e, (hl)
	ld	d, #0x00
	ld	a, #0x34
	sub	a, e
	ld	b, a
	ld	a, #0x00
	sbc	a, d
	ld	e, a
	ld	a,(#_batX + 0)
	ld	d, #0x00
	sub	a, b
	ld	a, d
	sbc	a, e
	jp	PO, 00128$
	xor	a, #0x80
00128$:
	ret	P
;src/bat.c:51: oldBatX = batX;
	ld	hl,#_oldBatX + 0
	ld	(hl), c
;src/bat.c:52: batX++;
	ld	hl, #_batX+0
	inc	(hl)
	ret
;src/bat.c:57: void bat_restore_background() {
;	---------------------------------
; Function bat_restore_background
; ---------------------------------
_bat_restore_background::
;src/bat.c:58: background_restore_world_coords(oldBatX, batY, batW, BAT_HEIGHT_PIXELS);
	ld	a, #0x08
	push	af
	inc	sp
	ld	a, (_batW)
	push	af
	inc	sp
	ld	a, (_batY)
	push	af
	inc	sp
	ld	a, (_oldBatX)
	push	af
	inc	sp
	call	_background_restore_world_coords
	pop	af
	pop	af
	ret
;src/bat.c:61: void bat_draw()
;	---------------------------------
; Function bat_draw
; ---------------------------------
_bat_draw::
;src/bat.c:65: svmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(batX), W_2_S_Y(batY));
	ld	hl,#_batY + 0
	ld	d, (hl)
	inc	d
	inc	d
	inc	d
	inc	d
	ld	a,(#_batX + 0)
	add	a, #0x0c
	ld	e,a
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
;src/bat.c:67: cpct_drawSprite(sp_bat_left, svmem, SP_BAT_LEFT_W, SP_BAT_LEFT_H);
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0802
	push	hl
	push	de
	ld	hl, #_sp_bat_left
	push	hl
	call	_cpct_drawSprite
	pop	bc
;src/bat.c:68: cpct_drawSprite(sp_bat_mid, svmem + BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	push	bc
	ld	hl, #0x0802
	push	hl
	push	de
	ld	hl, #_sp_bat_mid
	push	hl
	call	_cpct_drawSprite
	pop	bc
;src/bat.c:69: cpct_drawSprite(sp_bat_mid, svmem + 2*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
	ld	hl, #0x0004
	add	hl, bc
	push	bc
	ld	de, #0x0802
	push	de
	push	hl
	ld	hl, #_sp_bat_mid
	push	hl
	call	_cpct_drawSprite
	pop	bc
;src/bat.c:70: cpct_drawSprite(sp_bat_right, svmem + 3*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_RIGHT_W, SP_BAT_RIGHT_H);
	ld	hl, #0x0006
	add	hl, bc
	ld	bc, #_sp_bat_right+0
	ld	de, #0x0802
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__batY:
	.db #0x00	; 0
__xinit__batX:
	.db #0x00	; 0
__xinit__oldBatX:
	.db #0x00	; 0
__xinit__batW:
	.db #0x00	; 0
	.area _CABS (ABS)
