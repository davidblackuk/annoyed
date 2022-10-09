;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module bat
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _background_restore
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
;src/bat.c:27: void bat_initialize() {
;	---------------------------------
; Function bat_initialize
; ---------------------------------
_bat_initialize::
;src/bat.c:28: batW = 8;
	ld	hl,#_batW + 0
	ld	(hl), #0x08
;src/bat.c:29: batX = (SCREEN_WIDTH_BYTES- batW) / 2;
	ld	hl,#_batX + 0
	ld	(hl), #0x24
;src/bat.c:30: batY = SCREEN_HEIGHT_ROWS - BAT_HEIGHT_PIXELS - BAT_BOTTOM_OFFSET_PIXELS;
	ld	hl,#_batY + 0
	ld	(hl), #0xb8
;src/bat.c:31: oldBatX = batX;
	ld	hl,#_oldBatX + 0
	ld	(hl), #0x24
	ret
;src/bat.c:35: void bat_update() {
;	---------------------------------
; Function bat_update
; ---------------------------------
_bat_update::
;src/bat.c:38: oldBatX = batX;
	ld	hl,#_batX + 0
	ld	c, (hl)
;src/bat.c:36: if (key_left_is_pressed) {
	ld	a,(#_key_left_is_pressed + 0)
	or	a, a
	jr	Z,00108$
;src/bat.c:37: if (batX > PLAY_AREA_LEFT_EDGE) {
	ld	a, #0x0c
	ld	iy, #_batX
	sub	a, 0 (iy)
	ret	NC
;src/bat.c:38: oldBatX = batX;
	ld	hl,#_oldBatX + 0
	ld	(hl), c
;src/bat.c:39: batX--;
	ld	hl, #_batX+0
	dec	(hl)
	ret
00108$:
;src/bat.c:41: } else if (key_right_is_pressed) {
	ld	a,(#_key_right_is_pressed + 0)
	or	a, a
	ret	Z
;src/bat.c:42: if (batX < PLAY_AREA_RIGHT_EDGE - batW) {
	ld	hl,#_batW + 0
	ld	e, (hl)
	ld	d, #0x00
	ld	a, #0x40
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
;src/bat.c:43: oldBatX = batX;
	ld	hl,#_oldBatX + 0
	ld	(hl), c
;src/bat.c:44: batX++;
	ld	hl, #_batX+0
	inc	(hl)
	ret
;src/bat.c:49: void bat_restore_background() {
;	---------------------------------
; Function bat_restore_background
; ---------------------------------
_bat_restore_background::
;src/bat.c:50: background_restore(oldBatX, batY, batW, BAT_HEIGHT_PIXELS);
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
	call	_background_restore
	pop	af
	pop	af
	ret
;src/bat.c:53: void bat_draw()
;	---------------------------------
; Function bat_draw
; ---------------------------------
_bat_draw::
;src/bat.c:57: svmem = cpct_getScreenPtr(CPCT_VMEM_START, batX, batY);
	ld	a, (_batY)
	push	af
	inc	sp
	ld	a, (_batX)
	push	af
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
;src/bat.c:59: cpct_drawSprite(sp_bat_left, svmem, SP_BAT_LEFT_W, SP_BAT_LEFT_H);
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
;src/bat.c:60: cpct_drawSprite(sp_bat_mid, svmem + BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
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
;src/bat.c:61: cpct_drawSprite(sp_bat_mid, svmem + 2*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
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
;src/bat.c:62: cpct_drawSprite(sp_bat_right, svmem + 3*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_RIGHT_W, SP_BAT_RIGHT_H);
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
