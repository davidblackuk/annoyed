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
	.globl _background_initialize
	.globl _background_restore
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
;src/background.c:11: void background_initialize()
;	---------------------------------
; Function background_initialize
; ---------------------------------
_background_initialize::
;src/background.c:16: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X, TILE_MAP_SCREEN_PIXEL_OFFSET_Y);
	ld	hl, #0x0008
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvmem), hl
;src/background.c:18: cpct_etm_setTileset2x4(g_tileset);
	ld	hl, #_g_tileset
	call	_cpct_etm_setTileset2x4
;src/background.c:21: cpct_etm_drawTilemap2x4_f(BACKGROUND_TILMAP_W, BACKGROUND_TILMAP_H, pvmem, current_level->background_tilemap);
	ld	hl, (_current_level)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, (_pvmem)
	push	bc
	push	hl
	ld	hl, #0x321e
	push	hl
	call	_cpct_etm_drawTilemap2x4_f
	ret
;src/background.c:26: void background_restore(u8 screenX, u8 screenY, u8 bwidth, u8 pHeight)
;	---------------------------------
; Function background_restore
; ---------------------------------
_background_restore::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/background.c:30: u8 tileX = (screenX - TILE_MAP_SCREEN_BYTE_OFFSET_X) / 2;
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
	ld	c, l
	sra	h
	rr	c
;src/background.c:31: u8 tileY = (screenY - TILE_MAP_SCREEN_PIXEL_OFFSET_Y) / 4;
	ld	l, 5 (ix)
	ld	h, #0x00
	ld	b, l
	ld	d, h
	bit	7, h
	jr	Z,00110$
	inc	hl
	inc	hl
	inc	hl
	ld	b, l
	ld	d, h
00110$:
	ld	e, b
	sra	d
	rr	e
	sra	d
	rr	e
;src/background.c:32: u8 tileW = bwidth / 2;
	ld	b, 6 (ix)
	srl	b
;src/background.c:33: u8 tileH = pHeight / 4;
	ld	d, 7 (ix)
	srl	d
	srl	d
;src/background.c:35: if (pHeight % 4 > 0)
	ld	a, 7 (ix)
	and	a, #0x03
	jr	Z,00102$
;src/background.c:37: tileH++;
	inc	d
00102$:
;src/background.c:40: if (bwidth % 2 > 0)
	bit	0, 6 (ix)
	jr	Z,00104$
;src/background.c:42: tileW++;
	inc	b
00104$:
;src/background.c:45: if (screenX & 1 == 1)
	bit	0, 4 (ix)
	jr	Z,00106$
;src/background.c:47: tileW += 1;
	inc	b
00106$:
;src/background.c:50: cpct_etm_drawTileBox2x4(tileX, tileY, tileW, tileH, BACKGROUND_TILMAP_W, pvmem, current_level->background_tilemap);
	ld	hl, (_current_level)
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	ld	hl, (_pvmem)
	ld	-2 (ix), l
	ld	-1 (ix), h
	pop	hl
	push	hl
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	a, #0x1e
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	b, e
	push	bc
	call	_cpct_etm_drawTileBox2x4
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)