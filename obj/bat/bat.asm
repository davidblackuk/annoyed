;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module bat
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _restoreBackground
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSprite
	.globl _cpct_isKeyPressed
	.globl _batW
	.globl _oldBatX
	.globl _batX
	.globl _batY
	.globl _initializeBat
	.globl _updateBat
	.globl _drawBat
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
;src/bat/bat.c:30: void initializeBat() {
;	---------------------------------
; Function initializeBat
; ---------------------------------
_initializeBat::
;src/bat/bat.c:31: batW = 8;
	ld	hl,#_batW + 0
	ld	(hl), #0x08
;src/bat/bat.c:32: batX = (SCREEN_WIDTH_BYTES- batW) / 2;
	ld	hl,#_batX + 0
	ld	(hl), #0x24
;src/bat/bat.c:33: batY = SCREEN_HEIGHT_ROWS - BAT_HEIGHT_PIXELS - BAT_BOTTOM_OFFSET_PIXELS;
	ld	hl,#_batY + 0
	ld	(hl), #0xb8
;src/bat/bat.c:34: oldBatX = batX;
	ld	hl,#_oldBatX + 0
	ld	(hl), #0x24
	ret
;src/bat/bat.c:38: void updateBat() {
;	---------------------------------
; Function updateBat
; ---------------------------------
_updateBat::
;src/bat/bat.c:40: if (cpct_isKeyPressed(Key_CursorLeft)) {
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00108$
;src/bat/bat.c:41: if (batX > BAT_MIN_X_BYTE_OFFSET) {
	ld	a, #0x0c
	ld	iy, #_batX
	sub	a, 0 (iy)
	ret	NC
;src/bat/bat.c:42: batX--;
	dec	0 (iy)
	ret
00108$:
;src/bat/bat.c:44: } else if (cpct_isKeyPressed(Key_CursorRight)) {
	ld	hl, #0x0200
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	ret	Z
;src/bat/bat.c:45: batX++;
	ld	hl, #_batX+0
	inc	(hl)
;src/bat/bat.c:46: if (batX > BAT_MAX_X_BYTE_OFFSET - batW) {
	ld	hl,#_batW + 0
	ld	c, (hl)
	ld	b, #0x00
	ld	a, #0x44
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	ld	hl,#_batX + 0
	ld	e, (hl)
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jp	PO, 00128$
	xor	a, #0x80
00128$:
	jp	P, 00104$
;src/bat/bat.c:47: batX = BAT_MAX_X_BYTE_OFFSET - batW;
	ld	hl, #_batW
	ld	iy, #_batX
	ld	a, #0x44
	sub	a, (hl)
	ld	0 (iy), a
00104$:
;src/bat/bat.c:49: oldBatX = batX;
	ld	a,(#_batX + 0)
	ld	(#_oldBatX + 0),a
	ret
;src/bat/bat.c:54: void drawBat()
;	---------------------------------
; Function drawBat
; ---------------------------------
_drawBat::
;src/bat/bat.c:57: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, batX, batY);
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
;src/bat/bat.c:62: restoreBackground(oldBatX, batY / 8, batW, BAT_HEIGHT_PIXELS);
	ld	hl,#_batY + 0
	ld	d, (hl)
	srl	d
	srl	d
	srl	d
	push	bc
	ld	a, #0x08
	push	af
	inc	sp
	ld	a, (_batW)
	push	af
	inc	sp
	push	de
	inc	sp
	ld	a, (_oldBatX)
	push	af
	inc	sp
	call	_restoreBackground
	pop	af
	pop	af
	pop	bc
;src/bat/bat.c:67: cpct_drawSprite(sp_bat_left, pvmem, SP_BAT_LEFT_W, SP_BAT_LEFT_H);
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
;src/bat/bat.c:68: cpct_drawSprite(sp_bat_mid, pvmem + BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
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
;src/bat/bat.c:69: cpct_drawSprite(sp_bat_mid, pvmem + 2*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
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
;src/bat/bat.c:70: cpct_drawSprite(sp_bat_right, pvmem + 3*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_RIGHT_W, SP_BAT_RIGHT_H);
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
