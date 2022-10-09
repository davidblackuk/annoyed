;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module bricks
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _bricks_handle_ball_intersection
	.globl _cpct_etm_drawTilemap2x4_f
	.globl _cpct_getScreenPtr
	.globl _p_block_v_mem
	.globl _bricks_initialize
	.globl _bricks_restore
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_p_block_v_mem::
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
;src/bricks.c:17: void bricks_initialize() {
;	---------------------------------
; Function bricks_initialize
; ---------------------------------
_bricks_initialize::
;src/bricks.c:18: p_block_v_mem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X + 2*TILE_W, TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y);
	ld	hl, #0x180c
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_p_block_v_mem), hl
;src/bricks.c:19: cpct_etm_drawTilemap2x4_f(g_tilemap_l01_blocks_W, g_tilemap_l01_blocks_H, p_block_v_mem, current_level->blocks_tilemap);
	ld	hl, (_current_level)
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, (_p_block_v_mem)
	push	bc
	push	hl
	ld	hl, #0x1c1a
	push	hl
	call	_cpct_etm_drawTilemap2x4_f
	ret
;src/bricks.c:26: void bricks_handle_ball_intersection(Ball *ball) {
;	---------------------------------
; Function bricks_handle_ball_intersection
; ---------------------------------
_bricks_handle_ball_intersection::
;src/bricks.c:28: }
	ret
;src/bricks.c:30: void bricks_restore(u8 x, u8 y, u8 width, u8 height) {
;	---------------------------------
; Function bricks_restore
; ---------------------------------
_bricks_restore::
;src/bricks.c:32: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
