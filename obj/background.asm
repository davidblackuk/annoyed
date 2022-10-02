;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module background
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpct_etm_setTileset2x4
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_etm_drawTilemap2x4_f
	.globl _cpct_getScreenPtr
	.globl _pvmem
	.globl _initializeBackground
	.globl _restoreBackground
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
;src/background.c:10: void initializeBackground()
;	---------------------------------
; Function initializeBackground
; ---------------------------------
_initializeBackground::
;src/background.c:14: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X, TILE_MAP_SCREEN_PIXEL_OFFSET_Y);
	ld	hl, #0x1008
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvmem), hl
;src/background.c:16: cpct_etm_setTileset2x4(g_tileset);
	ld	hl, #_g_tileset
	call	_cpct_etm_setTileset2x4
;src/background.c:19: cpct_etm_drawTilemap2x4_f(g_tilemap_l00_W, g_tilemap_l00_H, pvmem, g_tilemap_l00);
	ld	bc, #_g_tilemap_l00+0
	ld	hl, (_pvmem)
	push	bc
	push	hl
	ld	hl, #0x2e1f
	push	hl
	call	_cpct_etm_drawTilemap2x4_f
	ret
;src/background.c:24: void restoreBackground(u8 screenX, u8 screenY, u8 bwidth, u8 pHeight)
;	---------------------------------
; Function restoreBackground
; ---------------------------------
_restoreBackground::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/background.c:28: u8 tileX = (screenX - TILE_MAP_SCREEN_BYTE_OFFSET_X) / 2;
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
	jr	Z,00109$
	ld	hl, #0xfff9
	add	hl, bc
00109$:
	sra	h
	rr	l
	ld	-2 (ix), l
;src/background.c:29: u8 tileY = (screenY - TILE_MAP_SCREEN_PIXEL_OFFSET_Y) / 4;
	ld	c, 5 (ix)
	ld	b, #0x00
	ld	a, c
	add	a, #0xf0
	ld	e, a
	ld	a, b
	adc	a, #0xff
	ld	d, a
	ld	l, e
	ld	h, d
	bit	7, d
	jr	Z,00110$
	ld	hl, #0xfff3
	add	hl, bc
00110$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-1 (ix), l
;src/background.c:30: u8 tileW = bwidth / 2;
	ld	e, 6 (ix)
	srl	e
;src/background.c:31: u8 tileH = pHeight / 4;
	ld	d, 7 (ix)
	srl	d
	srl	d
;src/background.c:33: if (pHeight % 4 > 0) {
	ld	a, 7 (ix)
	and	a, #0x03
	jr	Z,00102$
;src/background.c:34: tileH ++;
	inc	d
00102$:
;src/background.c:37: if (bwidth % 2 > 0) {
	bit	0, 6 (ix)
	jr	Z,00104$
;src/background.c:38: tileW ++;
	inc	e
00104$:
;src/background.c:41: if (screenX & 1 == 1)
	bit	0, 4 (ix)
	jr	Z,00106$
;src/background.c:43: tileW += 1;
	inc	e
00106$:
;src/background.c:46: cpct_etm_drawTileBox2x4(tileX, tileY, tileW , tileH , g_tilemap_l00_W, pvmem, g_tilemap_l00);
	ld	hl, (_pvmem)
	ld	bc, #_g_tilemap_l00
	push	bc
	push	hl
	ld	a, #0x1f
	push	af
	inc	sp
	push	de
	inc	sp
	ld	d, e
	ld	e, -1 (ix)
	push	de
	ld	a, -2 (ix)
	push	af
	inc	sp
	call	_cpct_etm_drawTileBox2x4
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
