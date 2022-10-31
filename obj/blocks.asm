;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module blocks
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _background_debug_box_wc
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_getScreenPtr
	.globl _block_meta
	.globl _blocks_initialize
	.globl _blocks_draw
	.globl _blocks_restore_background
	.globl _blocks_bounce_ball
	.globl _is_ball_colliding_with_block
	.globl _get_metaData_at
	.globl _draw_current_blocks
	.globl _map_blocks_to_meta
	.globl _plant_tile_meta
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_block_meta::
	.ds 1092
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
;src/blocks.c:38: void blocks_initialize(u8 is_restart)
;	---------------------------------
; Function blocks_initialize
; ---------------------------------
_blocks_initialize::
;src/blocks.c:40: if (!is_restart)
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	or	a, a
	jp	NZ,_draw_current_blocks
;src/blocks.c:43: map_blocks_to_meta();
	call	_map_blocks_to_meta
;src/blocks.c:48: draw_current_blocks();
	jp  _draw_current_blocks
;src/blocks.c:51: void blocks_draw()
;	---------------------------------
; Function blocks_draw
; ---------------------------------
_blocks_draw::
;src/blocks.c:53: }
	ret
;src/blocks.c:55: void blocks_restore_background()
;	---------------------------------
; Function blocks_restore_background
; ---------------------------------
_blocks_restore_background::
;src/blocks.c:57: }
	ret
;src/blocks.c:59: BounceHits blocks_bounce_ball(Ball *ball, i16 at_x, i16 at_y)
;	---------------------------------
; Function blocks_bounce_ball
; ---------------------------------
_blocks_bounce_ball::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/blocks.c:66: if (W_2_S_Y(at_y) < BRICKS_MAP_PIXEL_TOP_SCR ||
	ld	a, 8 (ix)
	add	a, #0x08
	ld	-3 (ix), a
	ld	a, 9 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	ld	a, -3 (ix)
	sub	a, #0x18
	ld	a, -2 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00101$
;src/blocks.c:67: W_2_S_Y(at_y) > BRICKS_MAP_PIXEL_BOTTOM_SCR)
	ld	a, #0x88
	cp	a, -3 (ix)
	ld	a, #0x00
	sbc	a, -2 (ix)
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	jp	P, 00102$
00101$:
;src/blocks.c:69: return BOUNCE_NONE;
	ld	l, #0x00
	jp	00110$
00102$:
;src/blocks.c:72: if (ball->dy < 0)
	ld	a, 4 (ix)
	ld	-3 (ix), a
	ld	a, 5 (ix)
	ld	-2 (ix), a
	pop	hl
	push	hl
	ld	de, #0x000b
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;src/blocks.c:76: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y, BOUNCE_Y);
	ld	c,6 (ix)
	ld	b,7 (ix)
	inc	bc
	inc	bc
	inc	bc
;src/blocks.c:81: bounces |= is_ball_colliding_with_block(ball, at_x, at_y + 6, BOUNCE_Y);
	ld	a, 8 (ix)
	add	a, #0x06
	ld	e, a
	ld	a, 9 (ix)
	adc	a, #0x00
	ld	d, a
;src/blocks.c:72: if (ball->dy < 0)
	bit	7, h
	jr	Z,00105$
;src/blocks.c:75: bounces |= is_ball_colliding_with_block(ball, at_x, at_y, BOUNCE_Y);
	push	bc
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	call	_is_ball_colliding_with_block
	pop	af
	pop	af
	pop	af
	inc	sp
	pop	de
	pop	bc
	ld	-1 (ix), l
;src/blocks.c:76: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y, BOUNCE_Y);
	push	bc
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	push	bc
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_is_ball_colliding_with_block
	pop	af
	pop	af
	pop	af
	inc	sp
	pop	de
	pop	bc
	ld	a, -1 (ix)
	or	a, l
	ld	-1 (ix), a
	jr	00106$
00105$:
;src/blocks.c:81: bounces |= is_ball_colliding_with_block(ball, at_x, at_y + 6, BOUNCE_Y);
	push	bc
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	push	de
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	call	_is_ball_colliding_with_block
	pop	af
	pop	af
	pop	af
	inc	sp
	pop	de
	pop	bc
;src/blocks.c:82: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y + 6, BOUNCE_Y);
	push	hl
	push	bc
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	push	de
	push	bc
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_is_ball_colliding_with_block
	pop	af
	pop	af
	pop	af
	inc	sp
	ld	a, l
	pop	de
	pop	bc
	pop	hl
	or	a, l
	ld	-1 (ix), a
00106$:
;src/blocks.c:85: if (ball->dx < 0)
	pop	hl
	push	hl
	push	bc
	ld	bc, #0x0009
	add	hl, bc
	pop	bc
	ld	a, (hl)
	inc	hl
	bit	7, (hl)
	jr	Z,00108$
;src/blocks.c:88: bounces |= is_ball_colliding_with_block(ball, at_x, at_y, BOUNCE_X);
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_is_ball_colliding_with_block
	pop	af
	pop	af
	pop	af
	inc	sp
	pop	de
	ld	a, -1 (ix)
	or	a, l
	ld	-3 (ix), a
;src/blocks.c:89: bounces |= is_ball_colliding_with_block(ball, at_x, at_y + 6, BOUNCE_X);
	ld	a, #0x01
	push	af
	inc	sp
	push	de
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_is_ball_colliding_with_block
	pop	af
	pop	af
	pop	af
	inc	sp
	ld	a, -3 (ix)
	or	a, l
	jr	00109$
00108$:
;src/blocks.c:94: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y, BOUNCE_X);
	push	bc
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	push	bc
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_is_ball_colliding_with_block
	pop	af
	pop	af
	pop	af
	inc	sp
	pop	de
	pop	bc
	ld	a, -1 (ix)
	or	a, l
	ld	-3 (ix), a
;src/blocks.c:95: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y + 6, BOUNCE_X);
	ld	a, #0x01
	push	af
	inc	sp
	push	de
	push	bc
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_is_ball_colliding_with_block
	pop	af
	pop	af
	pop	af
	inc	sp
	ld	a, -3 (ix)
	or	a, l
00109$:
;src/blocks.c:98: return bounces;
	ld	l, a
00110$:
	ld	sp, ix
	pop	ix
	ret
;src/blocks.c:105: BounceHits is_ball_colliding_with_block(Ball *ball, i16 wx, i16 wy, BounceHits bounceType)
;	---------------------------------
; Function is_ball_colliding_with_block
; ---------------------------------
_is_ball_colliding_with_block::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/blocks.c:107: BounceHits bounces = BOUNCE_NONE;
	ld	l, #0x00
;src/blocks.c:110: meta = get_metaData_at(wx, wy);
	push	hl
	ld	c,8 (ix)
	ld	b,9 (ix)
	push	bc
	ld	c,6 (ix)
	ld	b,7 (ix)
	push	bc
	call	_get_metaData_at
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	pop	hl
;src/blocks.c:111: if (meta)
	ld	a, b
	or	a,c
	jr	Z,00102$
;src/blocks.c:113: meta->is_active = 0;
	xor	a, a
	ld	(bc), a
;src/blocks.c:116: (meta->block_tile_y * TILE_H) + 24, 
	ld	l, c
	ld	h, b
	ld	de, #0x0005
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	hl, #0x0018
	add	hl,de
	ex	de,hl
;src/blocks.c:115: background_debug_box_wc((meta->block_tile_x) * TILE_W,
	ld	l, c
	ld	h, b
	ld	bc, #0x0004
	add	hl, bc
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	bc, #0x0603
	push	bc
	push	de
	push	hl
	call	_background_debug_box_wc
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/blocks.c:122: bounces = bounceType;
	ld	l, 10 (ix)
00102$:
;src/blocks.c:125: return bounces;
	pop	ix
	ret
;src/blocks.c:128: BlockMeta *get_metaData_at(i16 wx, i16 wy)
;	---------------------------------
; Function get_metaData_at
; ---------------------------------
_get_metaData_at::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/blocks.c:136: tx = (wx / 2);
	ld	e,4 (ix)
	ld	d,5 (ix)
	bit	7, d
	jr	Z,00108$
	inc	de
00108$:
	sra	d
	rr	e
;src/blocks.c:140: ty = ((wy) / 4) - 4;
	ld	c,6 (ix)
	ld	b,7 (ix)
	bit	7, b
	jr	Z,00109$
	inc	bc
	inc	bc
	inc	bc
00109$:
	sra	b
	rr	c
	sra	b
	rr	c
	ld	a, c
	add	a, #0xfc
	ld	l, a
	ld	a, b
	adc	a, #0xff
	ld	h, a
;src/blocks.c:144: mx = tx / 2;
	ld	c, e
	ld	b, d
	bit	7, d
	jr	Z,00110$
	ld	c, e
	ld	b, d
	inc	bc
00110$:
	sra	b
	rr	c
;src/blocks.c:145: my = ty / 2;
	ld	e, l
	ld	d, h
	bit	7, h
	jr	Z,00111$
	ex	de,hl
	inc	de
00111$:
	sra	d
	rr	e
;src/blocks.c:149: if ((mx >= BLOCKS_MAP_W / 2) || (my >= BLOCKS_MAP_H / 2))
	ld	a, c
	sub	a, #0x0d
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00101$
	ld	a, e
	sub	a, #0x0e
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00102$
00101$:
;src/blocks.c:151: return BOUNCE_NONE;
	ld	hl, #0x0000
	jr	00106$
00102$:
;src/blocks.c:154: meta = &block_meta[mx][my];
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_block_meta
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
;src/blocks.c:155: if (meta->is_active)
	ld	a, (hl)
	or	a, a
;src/blocks.c:157: return meta;
	jr	NZ,00106$
;src/blocks.c:159: return NULL;
	ld	hl, #0x0000
00106$:
	pop	ix
	ret
;src/blocks.c:162: void draw_current_blocks()
;	---------------------------------
; Function draw_current_blocks
; ---------------------------------
_draw_current_blocks::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/blocks.c:164: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(0),
	ld	hl, #0x180c
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/blocks.c:166: for (u8 y = 0; y < BLOCKS_MAP_H / 2; y++)
	ld	c, #0x00
00109$:
;src/blocks.c:168: for (u8 x = 0; x < BLOCKS_MAP_W / 2; x++)
	ld	a,c
	cp	a,#0x0e
	jr	NC,00111$
	add	a, a
	ld	-2 (ix), a
	ld	a, c
	add	a, a
	add	a, c
	add	a, a
	ld	-3 (ix), a
	ld	b, #0x00
00106$:
	ld	a, b
	sub	a, #0x0d
	jr	NC,00110$
;src/blocks.c:170: BlockMeta *meta = &block_meta[x][y];
	push	de
	ld	e,b
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	pop	de
	ld	a, #<(_block_meta)
	add	a, l
	ld	l, a
	ld	a, #>(_block_meta)
	adc	a, h
	ld	h, a
	ld	a, l
	add	a, -3 (ix)
	ld	l, a
	ld	a, h
	adc	a, #0x00
	ld	h, a
;src/blocks.c:172: if (meta->is_active)
	ld	a, (hl)
	or	a, a
	jr	Z,00107$
;src/blocks.c:175: current_level->blocks_tilemap);
	ld	hl, (_current_level)
	inc	hl
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;src/blocks.c:174: cpct_etm_drawTileBox2x4(x * 2, y * 2, 2, 2, BLOCKS_MAP_W, pvmem,
	push	de
	pop	iy
	ld	a, b
	add	a, a
	ld	-1 (ix), a
	push	bc
	push	de
	push	hl
	push	iy
	ld	hl, #0x1a02
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	h, -2 (ix)
	ld	l, -1 (ix)
	push	hl
	call	_cpct_etm_drawTileBox2x4
	pop	de
	pop	bc
00107$:
;src/blocks.c:168: for (u8 x = 0; x < BLOCKS_MAP_W / 2; x++)
	inc	b
	jr	00106$
00110$:
;src/blocks.c:166: for (u8 y = 0; y < BLOCKS_MAP_H / 2; y++)
	inc	c
	jr	00109$
00111$:
	ld	sp, ix
	pop	ix
	ret
;src/blocks.c:184: void map_blocks_to_meta()
;	---------------------------------
; Function map_blocks_to_meta
; ---------------------------------
_map_blocks_to_meta::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
;src/blocks.c:188: for (u8 y = 0; y < BLOCKS_MAP_H; y += 2)
	ld	-4 (ix), #0x00
00119$:
	ld	a, -4 (ix)
	sub	a, #0x1c
	jp	NC, 00121$
;src/blocks.c:190: for (u8 x = 0; x < BLOCKS_MAP_W; x += 2)
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
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	c, -4 (ix)
	srl	c
	ld	a, c
	add	a, a
	add	a, c
	add	a, a
	ld	-1 (ix), a
	ld	-5 (ix), #0x00
00116$:
	ld	a, -5 (ix)
	sub	a, #0x1a
	jp	NC, 00120$
;src/blocks.c:192: u8 tile = current_level->blocks_tilemap[(y * BLOCKS_MAP_W) + x];
	ld	hl, (_current_level)
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	add	hl, de
	add	hl, bc
	ld	a, (hl)
;src/blocks.c:193: switch (tile)
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
;src/blocks.c:195: case WHITE_BLOCK:
00101$:
;src/blocks.c:196: plant_tile_meta(x, y, WHITE_BLOCK, WHITE_SCORE, SINGLE_HIT_TO_REMOVE);
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
;src/blocks.c:197: break;
	jp	00117$
;src/blocks.c:198: case ORANGE_BLOCK:
00102$:
;src/blocks.c:199: plant_tile_meta(x, y, ORANGE_BLOCK, ORANGE_SCORE, SINGLE_HIT_TO_REMOVE);
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
;src/blocks.c:200: break;
	jp	00117$
;src/blocks.c:201: case CYAN_BLOCK:
00103$:
;src/blocks.c:202: plant_tile_meta(x, y, CYAN_BLOCK, CYAN_SCORE, SINGLE_HIT_TO_REMOVE);
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
;src/blocks.c:203: break;
	jp	00117$
;src/blocks.c:204: case GREEN_BLOCK:
00104$:
;src/blocks.c:205: plant_tile_meta(x, y, GREEN_BLOCK, GREEN_SCORE, SINGLE_HIT_TO_REMOVE);
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
;src/blocks.c:206: break;
	jp	00117$
;src/blocks.c:207: case RED_BLOCK:
00105$:
;src/blocks.c:208: plant_tile_meta(x, y, RED_BLOCK, RED_SCORE, SINGLE_HIT_TO_REMOVE);
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
;src/blocks.c:209: break;
	jp	00117$
;src/blocks.c:210: case BLUE_BLOCK:
00106$:
;src/blocks.c:211: plant_tile_meta(x, y, BLUE_BLOCK, BLUE_SCORE, SINGLE_HIT_TO_REMOVE);
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
;src/blocks.c:212: break;
	jp	00117$
;src/blocks.c:213: case MAGENTA_BLOCK:
00107$:
;src/blocks.c:214: plant_tile_meta(x, y, MAGENTA_BLOCK, MAGENTA_SCORE, SINGLE_HIT_TO_REMOVE);
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
;src/blocks.c:215: break;
	jp	00117$
;src/blocks.c:216: case YELLOW_BLOCK:
00108$:
;src/blocks.c:217: plant_tile_meta(x, y, YELLOW_BLOCK, YELLOW_SCORE, SINGLE_HIT_TO_REMOVE);
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
;src/blocks.c:218: break;
	jr	00117$
;src/blocks.c:219: case STEEL_BLOCK:
00109$:
;src/blocks.c:222: current_level->steel_score);
	ld	hl, (_current_level)
	ld	de, #0x0004
	add	hl, de
	ld	d, (hl)
;src/blocks.c:221: current_level->steel_hits_to_destroy, 
	ld	iy, (_current_level)
;src/blocks.c:220: plant_tile_meta(x, y, STEEL_BLOCK, 
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
;src/blocks.c:223: break;
	jr	00117$
;src/blocks.c:224: case GOLD_BLOCK:
00110$:
;src/blocks.c:225: plant_tile_meta(x, y, GOLD_BLOCK, 0, INDESTRUCTABLE);
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
;src/blocks.c:226: break;
	jr	00117$
;src/blocks.c:227: default:
00111$:
;src/blocks.c:229: block_meta[x / 2][y / 2].is_active = 0;
	ld	c, -5 (ix)
	srl	c
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_block_meta
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	l,-1 (ix)
	ld	h,#0x00
	add	hl, bc
	ld	(hl), #0x00
;src/blocks.c:230: block_meta[x / 2][y / 2].score = 0;
	ld	a, -1 (ix)
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
;src/blocks.c:231: block_meta[x / 2][y / 2].remaining_hits = 0;
	inc	bc
	inc	bc
	inc	bc
	ld	h, b
	ld	l, c
	ld	(hl), #0x00
;src/blocks.c:234: }
00117$:
;src/blocks.c:190: for (u8 x = 0; x < BLOCKS_MAP_W; x += 2)
	inc	-5 (ix)
	inc	-5 (ix)
	jp	00116$
00120$:
;src/blocks.c:188: for (u8 y = 0; y < BLOCKS_MAP_H; y += 2)
	inc	-4 (ix)
	inc	-4 (ix)
	jp	00119$
00121$:
	ld	sp, ix
	pop	ix
	ret
;src/blocks.c:239: void plant_tile_meta(u8 map_x, u8 map_y, u8 tile_type, u8 score, u8 hits_to_destroy)
;	---------------------------------
; Function plant_tile_meta
; ---------------------------------
_plant_tile_meta::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/blocks.c:241: block_meta[map_x / 2][map_y / 2].is_active = 1;
	ld	bc, #_block_meta+0
	ld	e, 4 (ix)
	srl	e
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	e, 5 (ix)
	srl	e
	ld	l, e
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	a, l
	add	a, c
	ld	c, a
	ld	a, #0x00
	adc	a, b
	ld	b, a
	ld	a, #0x01
	ld	(bc), a
;src/blocks.c:242: block_meta[map_x / 2][map_y / 2].score = score;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, 7 (ix)
	ld	(de), a
;src/blocks.c:243: block_meta[map_x / 2][map_y / 2].remaining_hits = hits_to_destroy;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a, 8 (ix)
	ld	(de), a
;src/blocks.c:244: block_meta[map_x / 2][map_y / 2].type = tile_type;
	ld	e, c
	ld	d, b
	inc	de
	ld	a, 6 (ix)
	ld	(de), a
;src/blocks.c:245: block_meta[map_x / 2][map_y / 2].block_tile_x = map_x;
	ld	hl, #0x0004
	add	hl, bc
	ld	a, 4 (ix)
	ld	(hl), a
;src/blocks.c:246: block_meta[map_x / 2][map_y / 2].block_tile_y = map_y;
	ld	hl, #0x0005
	add	hl, bc
	ld	a, 5 (ix)
	ld	(hl), a
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
