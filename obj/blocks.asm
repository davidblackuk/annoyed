;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module blocks
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _dbg_displayNumber
	.globl _cpct_etm_drawTilemap2x4_f
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSolidBox
	.globl _block_meta
	.globl _max_y
	.globl _max_x
	.globl _min_y
	.globl _min_x
	.globl _p_block_v_mem
	.globl _blocks_initialize
	.globl _blocks_draw
	.globl _blocks_restore_background
	.globl _blocks_intersect_ball
	.globl _map_tiles_to_meta
	.globl _plant_tile_meta
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_p_block_v_mem::
	.ds 2
_min_x::
	.ds 1
_min_y::
	.ds 1
_max_x::
	.ds 1
_max_y::
	.ds 1
_block_meta::
	.ds 728
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
;src/blocks.c:31: void blocks_initialize()
;	---------------------------------
; Function blocks_initialize
; ---------------------------------
_blocks_initialize::
;src/blocks.c:33: p_block_v_mem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X + 2 * TILE_W, TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y);
	ld	hl, #0x180c
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_p_block_v_mem), hl
;src/blocks.c:34: cpct_etm_drawTilemap2x4_f(g_tilemap_l01_blocks_W, g_tilemap_l01_blocks_H, p_block_v_mem, current_level->blocks_tilemap);
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
;src/blocks.c:37: map_tiles_to_meta();
	call	_map_tiles_to_meta
;src/blocks.c:39: min_x = 0xFF;
	ld	hl,#_min_x + 0
	ld	(hl), #0xff
;src/blocks.c:40: min_y = 0xFF;
	ld	hl,#_min_y + 0
	ld	(hl), #0xff
;src/blocks.c:41: max_x = 0x00;
	ld	hl,#_max_x + 0
	ld	(hl), #0x00
;src/blocks.c:42: max_y = 0x00;
	ld	hl,#_max_y + 0
	ld	(hl), #0x00
	ret
;src/blocks.c:45: void blocks_draw()
;	---------------------------------
; Function blocks_draw
; ---------------------------------
_blocks_draw::
;src/blocks.c:49: }
	ret
;src/blocks.c:51: void blocks_restore_background()
;	---------------------------------
; Function blocks_restore_background
; ---------------------------------
_blocks_restore_background::
;src/blocks.c:53: }
	ret
;src/blocks.c:55: void blocks_intersect_ball(Ball *ball)
;	---------------------------------
; Function blocks_intersect_ball
; ---------------------------------
_blocks_intersect_ball::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-12
	add	hl, sp
	ld	sp, hl
;src/blocks.c:59: if ((ball->y + SP_BALL_H < TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y) ||
	ld	a, 4 (ix)
	ld	-2 (ix), a
	ld	a, 5 (ix)
	ld	-1 (ix), a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-7 (ix), a
	ld	c, a
	ld	b, #0x00
	ld	hl, #0x0006
	add	hl, bc
	ld	de, #0x8018
	add	hl, hl
	ccf
	rr	h
	rr	l
	sbc	hl, de
	jp	C,00114$
;src/blocks.c:60: (ball->y > TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y + (BLOCKS_MAP_H * TILE_H)))
	ld	a, #0x88
	sub	a, -7 (ix)
;src/blocks.c:62: return;
	jp	C,00114$
;src/blocks.c:66: u8 ball_center_x = ball->x + (SP_BALL_W / 2);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	ld	c, (hl)
	inc	c
;src/blocks.c:67: u8 ball_center_y = ball->y + (SP_BALL_W / 2);
	ld	a, -7 (ix)
	inc	a
	ld	-8 (ix), a
;src/blocks.c:69: u8 tx = (ball_center_x - (TILE_MAP_SCREEN_BYTE_OFFSET_X + 2)) / 4;
	ld	b, #0x00
	ld	a, c
	add	a, #0xf6
	ld	e, a
	ld	a, b
	adc	a, #0xff
	ld	d, a
	ld	l, e
	ld	h, d
	bit	7, d
	jr	Z,00116$
	ld	hl, #0xfff9
	add	hl, bc
00116$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-9 (ix), l
;src/blocks.c:70: u8 ty = (ball_center_y - (TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y)) / 8;
	ld	c, -8 (ix)
	ld	b, #0x00
	ld	a, c
	add	a, #0xe8
	ld	e, a
	ld	a, b
	adc	a, #0xff
	ld	d, a
	ld	l, e
	ld	h, d
	bit	7, d
	jr	Z,00117$
	ld	hl, #0xffef
	add	hl, bc
00117$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
;src/blocks.c:75: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, tx*2  + (TILE_MAP_SCREEN_BYTE_OFFSET_X + 2 * TILE_W), (ty*4) + (TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y));
	ld	-10 (ix), l
	ld	a, l
	add	a, a
	add	a, a
	ld	-7 (ix), a
	add	a, #0x18
	ld	-6 (ix), a
	ld	a, -9 (ix)
	add	a, a
	ld	-3 (ix), a
	add	a, #0x0c
	ld	b, a
	ld	a, -6 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	-11 (ix), h
;src/blocks.c:76: cpct_drawSolidBox(pvmem, 255, 2,4);
	ld	-12 (ix), l
	ld	-5 (ix), l
	ld	a, -11 (ix)
	ld	-4 (ix), a
	ld	hl, #0x0402
	push	hl
	ld	hl, #0x00ff
	push	hl
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	push	hl
	call	_cpct_drawSolidBox
;src/blocks.c:78: dbg_displayNumber(0, tx);
	ld	c, -9 (ix)
	ld	b, #0x00
	push	bc
	xor	a, a
	push	af
	inc	sp
	call	_dbg_displayNumber
	pop	af
	inc	sp
;src/blocks.c:79: dbg_displayNumber(1, ty);
	ld	c, -10 (ix)
	ld	b, #0x00
	push	bc
	ld	a, #0x01
	push	af
	inc	sp
	call	_dbg_displayNumber
	pop	af
	inc	sp
;src/blocks.c:81: if (tx < min_x)
	ld	hl, #_min_x
	ld	a, -9 (ix)
	sub	a, (hl)
	jr	NC,00105$
;src/blocks.c:82: min_x = tx;
	ld	a, -9 (ix)
	ld	(#_min_x + 0),a
00105$:
;src/blocks.c:83: if (tx > max_x)
	ld	a, (#_max_x)
	sub	a, -9 (ix)
	jr	NC,00107$
;src/blocks.c:84: max_x = tx;
	ld	a, -9 (ix)
	ld	(#_max_x + 0),a
00107$:
;src/blocks.c:85: if (ty < min_y)
	ld	hl, #_min_y
	ld	a, -10 (ix)
	sub	a, (hl)
	jr	NC,00109$
;src/blocks.c:86: min_y = ty;
	ld	a, -10 (ix)
	ld	(#_min_y + 0),a
00109$:
;src/blocks.c:87: if (ty > max_y)
	ld	a, (#_max_y)
	sub	a, -10 (ix)
	jr	NC,00111$
;src/blocks.c:88: max_y = ty;
	ld	a, -10 (ix)
	ld	(#_max_y + 0),a
00111$:
;src/blocks.c:90: dbg_displayNumber(3, min_x);
	ld	hl,#_min_x + 0
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	a, #0x03
	push	af
	inc	sp
	call	_dbg_displayNumber
	pop	af
	inc	sp
;src/blocks.c:91: dbg_displayNumber(4, max_x);
	ld	hl,#_max_x + 0
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	a, #0x04
	push	af
	inc	sp
	call	_dbg_displayNumber
	pop	af
	inc	sp
;src/blocks.c:93: dbg_displayNumber(6, min_y);
	ld	hl,#_min_y + 0
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	a, #0x06
	push	af
	inc	sp
	call	_dbg_displayNumber
	pop	af
	inc	sp
;src/blocks.c:94: dbg_displayNumber(7, max_y);
	ld	hl,#_max_y + 0
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	a, #0x07
	push	af
	inc	sp
	call	_dbg_displayNumber
	pop	af
	inc	sp
;src/blocks.c:96: if (block_meta[tx][ty].is_active)
	ld	c,-9 (ix)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	-5 (ix), l
	ld	-4 (ix), h
	ld	a, #<(_block_meta)
	add	a, -5 (ix)
	ld	-5 (ix), a
	ld	a, #>(_block_meta)
	adc	a, -4 (ix)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	add	a, -7 (ix)
	ld	-5 (ix), a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	or	a, a
	jr	Z,00114$
;src/blocks.c:98: ball->dy = -ball->dy;
	ld	a, -2 (ix)
	add	a, #0x06
	ld	-2 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c, (hl)
	xor	a, a
	sub	a, c
	ld	-3 (ix), a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a, -3 (ix)
	ld	(hl), a
;src/blocks.c:99: block_meta[tx][ty].is_active = 0;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl), #0x00
00114$:
	ld	sp, ix
	pop	ix
	ret
;src/blocks.c:111: void map_tiles_to_meta()
;	---------------------------------
; Function map_tiles_to_meta
; ---------------------------------
_map_tiles_to_meta::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
;src/blocks.c:115: for (u8 y = 0; y < BLOCKS_MAP_H; y += 2)
	ld	-4 (ix), #0x00
00119$:
	ld	a, -4 (ix)
	sub	a, #0x1c
	jp	NC, 00121$
;src/blocks.c:117: for (u8 x = 0; x < BLOCKS_MAP_W; x += 2)
	ld	c,-4 (ix)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	a, -4 (ix)
	srl	a
	add	a, a
	add	a, a
	ld	-3 (ix), a
	ld	-5 (ix), #0x00
00116$:
	ld	a, -5 (ix)
	sub	a, #0x1a
	jp	NC, 00120$
;src/blocks.c:119: u8 tile = current_level->blocks_tilemap[y * BLOCKS_MAP_W + x];
	ld	hl, (_current_level)
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	add	hl, de
	add	hl, bc
	ld	a, (hl)
;src/blocks.c:120: switch (tile)
	or	a, a
	jr	Z,00101$
	cp	a, #0x02
	jr	Z,00102$
	cp	a, #0x04
	jr	Z,00103$
	cp	a, #0x06
	jr	Z,00104$
	cp	a, #0x08
	jr	Z,00105$
	cp	a, #0x0a
	jp	Z,00106$
	cp	a, #0x0c
	jp	Z,00107$
	cp	a, #0x0e
	jp	Z,00108$
	cp	a, #0x10
	jp	Z,00109$
	sub	a, #0x12
	jp	Z,00110$
	jp	00111$
;src/blocks.c:122: case WHITE_BLOCK:
00101$:
;src/blocks.c:123: plant_tile_meta(x, y, WHITE_BLOCK, WHITE_SCORE, SINGLE_HIT_TO_REMOVE);
	ld	hl, #0x0132
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, -4 (ix)
	ld	l, -5 (ix)
	push	hl
	call	_plant_tile_meta
	pop	af
	pop	af
	inc	sp
;src/blocks.c:124: break;
	jp	00117$
;src/blocks.c:125: case ORANGE_BLOCK:
00102$:
;src/blocks.c:126: plant_tile_meta(x, y, ORANGE_BLOCK, ORANGE_SCORE, SINGLE_HIT_TO_REMOVE);
	ld	hl, #0x013c
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	h, -4 (ix)
	ld	l, -5 (ix)
	push	hl
	call	_plant_tile_meta
	pop	af
	pop	af
	inc	sp
;src/blocks.c:127: break;
	jp	00117$
;src/blocks.c:128: case CYAN_BLOCK:
00103$:
;src/blocks.c:129: plant_tile_meta(x, y, CYAN_BLOCK, CYAN_SCORE, SINGLE_HIT_TO_REMOVE);
	ld	hl, #0x0146
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	h, -4 (ix)
	ld	l, -5 (ix)
	push	hl
	call	_plant_tile_meta
	pop	af
	pop	af
	inc	sp
;src/blocks.c:130: break;
	jp	00117$
;src/blocks.c:131: case GREEN_BLOCK:
00104$:
;src/blocks.c:132: plant_tile_meta(x, y, GREEN_BLOCK, GREEN_SCORE, SINGLE_HIT_TO_REMOVE);
	ld	hl, #0x0150
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	h, -4 (ix)
	ld	l, -5 (ix)
	push	hl
	call	_plant_tile_meta
	pop	af
	pop	af
	inc	sp
;src/blocks.c:133: break;
	jp	00117$
;src/blocks.c:134: case RED_BLOCK:
00105$:
;src/blocks.c:135: plant_tile_meta(x, y, RED_BLOCK, RED_SCORE, SINGLE_HIT_TO_REMOVE);
	ld	hl, #0x015a
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	h, -4 (ix)
	ld	l, -5 (ix)
	push	hl
	call	_plant_tile_meta
	pop	af
	pop	af
	inc	sp
;src/blocks.c:136: break;
	jp	00117$
;src/blocks.c:137: case BLUE_BLOCK:
00106$:
;src/blocks.c:138: plant_tile_meta(x, y, BLUE_BLOCK, BLUE_SCORE, SINGLE_HIT_TO_REMOVE);
	ld	hl, #0x0164
	push	hl
	ld	a, #0x0a
	push	af
	inc	sp
	ld	h, -4 (ix)
	ld	l, -5 (ix)
	push	hl
	call	_plant_tile_meta
	pop	af
	pop	af
	inc	sp
;src/blocks.c:139: break;
	jp	00117$
;src/blocks.c:140: case MAGENTA_BLOCK:
00107$:
;src/blocks.c:141: plant_tile_meta(x, y, MAGENTA_BLOCK, MAGENTA_SCORE, SINGLE_HIT_TO_REMOVE);
	ld	hl, #0x016e
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	ld	h, -4 (ix)
	ld	l, -5 (ix)
	push	hl
	call	_plant_tile_meta
	pop	af
	pop	af
	inc	sp
;src/blocks.c:142: break;
	jp	00117$
;src/blocks.c:143: case YELLOW_BLOCK:
00108$:
;src/blocks.c:144: plant_tile_meta(x, y, YELLOW_BLOCK, YELLOW_SCORE, SINGLE_HIT_TO_REMOVE);
	ld	hl, #0x0178
	push	hl
	ld	a, #0x0e
	push	af
	inc	sp
	ld	h, -4 (ix)
	ld	l, -5 (ix)
	push	hl
	call	_plant_tile_meta
	pop	af
	pop	af
	inc	sp
;src/blocks.c:145: break;
	jr	00117$
;src/blocks.c:146: case STEEL_BLOCK:
00109$:
;src/blocks.c:147: plant_tile_meta(x, y, STEEL_BLOCK, current_level->steel_hits_to_destroy, current_level->steel_score);
	ld	hl, (_current_level)
	ld	de, #0x0004
	add	hl, de
	ld	d, (hl)
	ld	iy, (_current_level)
	ld	e, 5 (iy)
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	ld	h, -4 (ix)
	ld	l, -5 (ix)
	push	hl
	call	_plant_tile_meta
	pop	af
	pop	af
	inc	sp
;src/blocks.c:148: break;
	jr	00117$
;src/blocks.c:149: case GOLD_BLOCK:
00110$:
;src/blocks.c:150: plant_tile_meta(x, y, GOLD_BLOCK, 0, INDESTRUCTABLE);
	ld	hl, #0xff00
	push	hl
	ld	a, #0x12
	push	af
	inc	sp
	ld	h, -4 (ix)
	ld	l, -5 (ix)
	push	hl
	call	_plant_tile_meta
	pop	af
	pop	af
	inc	sp
;src/blocks.c:151: break;
	jr	00117$
;src/blocks.c:152: default:
00111$:
;src/blocks.c:154: block_meta[x / 2][y / 2].is_active = 0;
	ld	c, -5 (ix)
	srl	c
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc,#_block_meta
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	l,-3 (ix)
	ld	h,#0x00
	add	hl, bc
	ld	(hl), #0x00
;src/blocks.c:155: block_meta[x / 2][y / 2].score = 0;
	ld	a, -3 (ix)
	add	a, c
	ld	c, a
	ld	a, #0x00
	adc	a, b
	ld	b, a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	xor	a, a
	ld	(de), a
;src/blocks.c:156: block_meta[x / 2][y / 2].remaining_hits = 0;
	inc	bc
	inc	bc
	inc	bc
	ld	h, b
	ld	l, c
	ld	(hl), #0x00
;src/blocks.c:159: }
00117$:
;src/blocks.c:117: for (u8 x = 0; x < BLOCKS_MAP_W; x += 2)
	inc	-5 (ix)
	inc	-5 (ix)
	jp	00116$
00120$:
;src/blocks.c:115: for (u8 y = 0; y < BLOCKS_MAP_H; y += 2)
	inc	-4 (ix)
	inc	-4 (ix)
	jp	00119$
00121$:
	ld	sp, ix
	pop	ix
	ret
;src/blocks.c:164: void plant_tile_meta(u8 map_x, u8 map_y, u8 tile_type, u8 score, u8 hits_to_destroy)
;	---------------------------------
; Function plant_tile_meta
; ---------------------------------
_plant_tile_meta::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/blocks.c:166: block_meta[map_x / 2][map_y / 2].is_active = 1;
	ld	bc, #_block_meta+0
	ld	e, 4 (ix)
	srl	e
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	a, 5 (ix)
	srl	a
	add	a, a
	add	a, a
	add	a, l
	ld	c, a
	ld	a, #0x00
	adc	a, h
	ld	b, a
	ld	a, #0x01
	ld	(bc), a
;src/blocks.c:167: block_meta[map_x / 2][map_y / 2].score = score;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, 7 (ix)
	ld	(de), a
;src/blocks.c:168: block_meta[map_x / 2][map_y / 2].remaining_hits = hits_to_destroy;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a, 8 (ix)
	ld	(de), a
;src/blocks.c:169: block_meta[map_x / 2][map_y / 2].type = tile_type;
	inc	bc
	ld	a, 6 (ix)
	ld	(bc), a
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
