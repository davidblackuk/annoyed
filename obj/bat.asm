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
	.globl _cpct_drawSpriteMaskedAlignedTable
	.globl _cpct_drawSprite
	.globl _batW
	.globl _oldBatX
	.globl _batX
	.globl _batY
	.globl _bat_initialize
	.globl _bat_update
	.globl _bat_restore_background
	.globl _bat_draw
	.globl _bat_bounce_ball
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
	ld	hl,#_batY + 0
	ld	e, (hl)
	ld	d, #0x00
	ld	hl,#_oldBatX + 0
	ld	c, (hl)
	ld	b, #0x00
	ld	a, #0x08
	push	af
	inc	sp
	ld	a, (_batW)
	push	af
	inc	sp
	push	de
	push	bc
	call	_background_restore_world_coords
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	ret
;src/bat.c:61: void bat_draw()
;	---------------------------------
; Function bat_draw
; ---------------------------------
_bat_draw::
;src/bat.c:65: svmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(batX), W_2_S_Y(batY));
	ld	a,(#_batY + 0)
	add	a, #0x08
	ld	d, a
	ld	a,(#_batX + 0)
	add	a, #0x0c
	ld	e,a
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
;src/bat.c:68: SP_BAT_LEFT_H, g_masktable);
;src/bat.c:67: cpct_drawSpriteMaskedAlignedTable(sp_bat_left, svmem, SP_BAT_LEFT_W, 
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #_g_masktable
	push	hl
	ld	hl, #0x0802
	push	hl
	push	de
	ld	hl, #_sp_bat_left
	push	hl
	call	_cpct_drawSpriteMaskedAlignedTable
	pop	bc
;src/bat.c:70: cpct_drawSprite(sp_bat_mid, svmem + BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
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
;src/bat.c:71: cpct_drawSprite(sp_bat_mid, svmem + 2*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
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
;src/bat.c:74: SP_BAT_RIGHT_H, g_masktable);
	ld	de, #_g_masktable
;src/bat.c:73: cpct_drawSpriteMaskedAlignedTable(sp_bat_right, svmem + 3*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_RIGHT_W, 
	ld	hl, #0x0006
	add	hl, bc
	ld	bc, #_sp_bat_right+0
	push	de
	ld	de, #0x0802
	push	de
	push	hl
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	ret
;src/bat.c:81: BounceHits bat_bounce_ball(Ball * ball, i16 at_x, i16 at_y) 
;	---------------------------------
; Function bat_bounce_ball
; ---------------------------------
_bat_bounce_ball::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
;src/bat.c:83: BounceHits bounces = BOUNCE_NONE;
	ld	-5 (ix), #0x00
;src/bat.c:87: if (ball->dy > 0 &&
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	ld	de, #0x000b
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	xor	a, a
	cp	a, e
	sbc	a, d
	jp	PO, 00129$
	xor	a, #0x80
00129$:
	jp	P, 00102$
;src/bat.c:88: (ball->x + BALL_WIDTH > batX && ball->x < batX + batW) &&
	ld	l, c
	ld	h, b
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	add	a, #0x03
	ld	-4 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	hl,#_batX + 0
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	sub	a, -4 (ix)
	ld	a, d
	sbc	a, -3 (ix)
	jp	PO, 00130$
	xor	a, #0x80
00130$:
	jp	P, 00102$
	ld	iy, #_batW
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, de
	ld	a, -2 (ix)
	sub	a, l
	ld	a, -1 (ix)
	sbc	a, h
	jp	PO, 00131$
	xor	a, #0x80
00131$:
	jp	P, 00102$
;src/bat.c:89: (ball->y + BALL_HEIGHT > batY && ball->y < batY + SP_BAT_LEFT_H))
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #0x0006
	add	hl,bc
	ex	de,hl
	ld	iy, #_batY
	ld	l, 0 (iy)
	ld	h, #0x00
	ld	a, l
	sub	a, e
	ld	a, h
	sbc	a, d
	jp	PO, 00132$
	xor	a, #0x80
00132$:
	jp	P, 00102$
	ld	de, #0x0008
	add	hl, de
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jp	PO, 00133$
	xor	a, #0x80
00133$:
	jp	P, 00102$
;src/bat.c:91: bounces |= BOUNCE_Y;        
	ld	-5 (ix), #0x02
00102$:
;src/bat.c:94: return bounces;
	ld	l, -5 (ix)
	ld	sp, ix
	pop	ix
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
