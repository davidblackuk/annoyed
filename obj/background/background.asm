;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module background
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _restoreBackground
	.globl _initializeBackground
	.globl _drawNumber
	.globl _cpct_etm_setTileset2x4
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_etm_drawTilemap2x4_f
	.globl _cpct_getScreenPtr
	.globl _cpct_drawCharM0
	.globl _cpct_setDrawCharM0
	.globl _pvmem
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_pvmem::
	.ds 2
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
;src/background/background.c:12: void drawNumber(u8 num) {
;	---------------------------------
; Function drawNumber
; ---------------------------------
_drawNumber::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/background/background.c:14: cpct_setDrawCharM0(5, 0);
	ld	hl, #0x0005
	push	hl
	call	_cpct_setDrawCharM0
;src/background/background.c:16: for(i=0; i<5; i++) {
	ld	c, #0x00
00102$:
;src/background/background.c:17: u8 digit = '0' + (num % 10);
	push	bc
	ld	a, #0x0a
	push	af
	inc	sp
	ld	a, 4 (ix)
	push	af
	inc	sp
	call	__moduchar
	pop	af
	pop	bc
	ld	a, l
	add	a, #0x30
	ld	e, a
;src/background/background.c:18: cpct_drawCharM0((void*)(LASTDIGIT_VMEM - 4*i), digit);
	ld	d, #0x00
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	a, #0x4b
	sub	a, l
	ld	l, a
	ld	a, #0xc0
	sbc	a, h
	ld	h, a
	push	bc
	push	de
	push	hl
	call	_cpct_drawCharM0
	ld	a, #0x0a
	push	af
	inc	sp
	ld	a, 4 (ix)
	push	af
	inc	sp
	call	__divuchar
	pop	af
	pop	bc
	ld	4 (ix), l
;src/background/background.c:16: for(i=0; i<5; i++) {
	inc	c
	ld	a, c
	sub	a, #0x05
	jr	C,00102$
	pop	ix
	ret
;src/background/background.c:23: void initializeBackground()
;	---------------------------------
; Function initializeBackground
; ---------------------------------
_initializeBackground::
;src/background/background.c:26: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X, TILE_MAP_SCREEN_PIXEL_OFFSET_y);
	ld	hl, #0x1008
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvmem), hl
;src/background/background.c:28: cpct_etm_setTileset2x4(g_tileset);
	ld	hl, #_g_tileset
	call	_cpct_etm_setTileset2x4
;src/background/background.c:31: cpct_etm_drawTilemap2x4_f(g_tilemap_l00_W, g_tilemap_l00_H, pvmem, g_tilemap_l00);
	ld	bc, #_g_tilemap_l00+0
	ld	hl, (_pvmem)
	push	bc
	push	hl
	ld	hl, #0x2e1f
	push	hl
	call	_cpct_etm_drawTilemap2x4_f
	ret
;src/background/background.c:37: void restoreBackground(u8 screenX, u8 screenY, u8 bwidth, u8 pHeight)
;	---------------------------------
; Function restoreBackground
; ---------------------------------
_restoreBackground::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/background/background.c:39: u8 tileX = (screenX - TILE_MAP_SCREEN_BYTE_OFFSET_X) / 2;
	ld	c, 4 (ix)
	ld	b, #0x00
	ld	a, c
	add	a, #0xf8
	ld	e, a
	ld	a, b
	adc	a, #0xff
	ld	d, a
	ld	l, e
	ld	h, d
	bit	7, d
	jr	Z,00103$
	ld	hl, #0xfff9
	add	hl, bc
00103$:
	sra	h
	rr	l
	ld	b, l
;src/background/background.c:40: u8 tileY = (screenY - TILE_MAP_SCREEN_PIXEL_OFFSET_y) / 4; 
	ld	e, 5 (ix)
	ld	d, #0x00
	ld	a, e
	add	a, #0xf0
	ld	-2 (ix), a
	ld	a, d
	adc	a, #0xff
	ld	-1 (ix), a
	pop	hl
	push	hl
	bit	7, -1 (ix)
	jr	Z,00104$
	ld	hl, #0xfff3
	add	hl, de
00104$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	c, l
;src/background/background.c:41: cpct_etm_drawTileBox2x4(tileX, tileY, bwidth / 2, pHeight / 4, g_tilemap_l00_W, pvmem, g_tilemap_l00);
	ld	hl, (_pvmem)
	ex	(sp), hl
	ld	e, 7 (ix)
	srl	e
	srl	e
	ld	d, 6 (ix)
	srl	d
	push	bc
	ld	hl, #_g_tilemap_l00
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	a, #0x1f
	push	af
	inc	sp
	ld	a, e
	push	af
	inc	sp
	ld	e, c
	push	de
	push	bc
	inc	sp
	call	_cpct_etm_drawTileBox2x4
	inc	sp
	call	_drawNumber
	ld	sp,ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
