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
	.globl _cpct_etm_drawTilemap4x8_ag
	.globl _cpct_etm_setDrawTilemap4x8_ag
	.globl _cpct_etm_setTileset2x4
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_getScreenPtr
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
;src/background/background.c:9: void initializeBackground()
;	---------------------------------
; Function initializeBackground
; ---------------------------------
_initializeBackground::
;src/background/background.c:12: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 8, 16);
	ld	hl, #0x1008
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvmem), hl
;src/background/background.c:16: cpct_etm_setDrawTilemap4x8_ag(g_tilemap_W, g_tilemap_H, g_tilemap_W, g_tiles_00);
	ld	hl, #_g_tiles_00
	push	hl
	ld	hl, #0x0010
	push	hl
	ld	h, #0x17
	push	hl
	call	_cpct_etm_setDrawTilemap4x8_ag
;src/background/background.c:20: cpct_etm_drawTilemap4x8_ag(pvmem, g_tilemap);
	ld	bc, #_g_tilemap+0
	ld	hl, (_pvmem)
	push	bc
	push	hl
	call	_cpct_etm_drawTilemap4x8_ag
;src/background/background.c:22: cpct_etm_setTileset2x4(g_tiles_00);
	ld	hl, #_g_tiles_00
	call	_cpct_etm_setTileset2x4
	ret
;src/background/background.c:27: void restoreBackground(u8 tx, u8 ty, u8 twidth, u8 tHeight) {
;	---------------------------------
; Function restoreBackground
; ---------------------------------
_restoreBackground::
;src/background/background.c:30: cpct_etm_drawTileBox2x4(1, 1, 2, 2, g_tilemap_W, pvmem, g_tilemap);
	ld	bc, #_g_tilemap+0
	ld	hl, (_pvmem)
	push	bc
	push	hl
	ld	hl, #0x1002
	push	hl
	ld	hl, #0x0201
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	call	_cpct_etm_drawTileBox2x4
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
