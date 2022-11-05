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
	.globl _cpct_drawSolidBox
	.globl _pvmem
	.globl _background_initialize
	.globl _background_bounce_ball
	.globl _background_restore_world_coords
	.globl _background_debug_box_wc
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
;src/background.c:17: void background_initialize()
;	---------------------------------
; Function background_initialize
; ---------------------------------
_background_initialize::
;src/background.c:20: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X, TILE_MAP_SCREEN_PIXEL_OFFSET_Y);
	ld	hl, #0x0008
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvmem), hl
;src/background.c:22: cpct_etm_setTileset2x4(g_tileset);
	ld	hl, #_g_tileset
	call	_cpct_etm_setTileset2x4
;src/background.c:25: cpct_etm_drawTilemap2x4_f(BACKGROUND_TILMAP_W, BACKGROUND_TILMAP_H, pvmem, current_level->background_tilemap);
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
;src/background.c:28: BounceHits background_bounce_ball(i16 at_wx, i16 at_wy)
;	---------------------------------
; Function background_bounce_ball
; ---------------------------------
_background_bounce_ball::
;src/background.c:31: BounceHits bounces = at_wx < 0 ? BOUNCE_X : 0;
	ld	hl, #2+1
	add	hl, sp
	bit	7, (hl)
	jr	Z,00103$
	ld	c, #0x01
	jr	00104$
00103$:
	ld	c, #0x00
00104$:
;src/background.c:33: bounces |= (at_wx + BALL_WIDTH) > PLAY_AREA_WIDTH ? BOUNCE_X : BOUNCE_NONE;
	ld	hl, #2
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	de
	inc	de
	inc	de
	ld	a, #0x34
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jp	PO, 00121$
	xor	a, #0x80
00121$:
	jp	P, 00105$
	ld	a, #0x01
	jr	00106$
00105$:
	ld	a, #0x00
00106$:
	or	a, c
	ld	c, a
;src/background.c:35: bounces |= (at_wy < 0) ? BOUNCE_Y : BOUNCE_NONE;
	ld	hl, #4+1
	add	hl, sp
	bit	7, (hl)
	jr	Z,00107$
	ld	a, #0x02
	jr	00108$
00107$:
	ld	a, #0x00
00108$:
	or	a, c
	ld	l, a
;src/background.c:37: return bounces;
	ret
;src/background.c:40: void background_restore_world_coords(i16 wx, i16 wy, u8 width, u8 height)
;	---------------------------------
; Function background_restore_world_coords
; ---------------------------------
_background_restore_world_coords::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/background.c:47: u8 tileX = (wx / 2) + 2;
	ld	c,4 (ix)
	ld	b,5 (ix)
	bit	7, b
	jr	Z,00109$
	inc	bc
00109$:
	sra	b
	rr	c
	ld	a, c
	add	a, #0x02
	ld	-4 (ix), a
;src/background.c:48: u8 tileY = (wy / 4) + 2;
	ld	c,6 (ix)
	ld	b,7 (ix)
	bit	7, b
	jr	Z,00110$
	inc	bc
	inc	bc
	inc	bc
00110$:
	sra	b
	rr	c
	sra	b
	rr	c
	ld	a, c
	add	a, #0x02
	ld	-3 (ix), a
;src/background.c:49: u8 tileW = width / 2;
	ld	e, 8 (ix)
	srl	e
;src/background.c:50: u8 tileH = height / 4;
	ld	d, 9 (ix)
	srl	d
	srl	d
;src/background.c:53: if (height % 4 > 0)
	ld	a, 9 (ix)
	and	a, #0x03
	jr	Z,00102$
;src/background.c:55: tileH++;
	inc	d
00102$:
;src/background.c:59: if (width % 2 > 0)
	bit	0, 8 (ix)
	jr	Z,00104$
;src/background.c:61: tileW++;
	inc	e
00104$:
;src/background.c:65: if (wx & 1 == 1)
	bit	0, 4 (ix)
	jr	Z,00106$
;src/background.c:67: tileW += 1;
	inc	e
00106$:
;src/background.c:70: cpct_etm_drawTileBox2x4(tileX, tileY, tileW, tileH, BACKGROUND_TILMAP_W, pvmem, current_level->background_tilemap);
	ld	hl, (_current_level)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	-2 (ix), c
	ld	-1 (ix), b
	ld	hl, (_pvmem)
	ld	c,-2 (ix)
	ld	b,-1 (ix)
	push	bc
	push	hl
	ld	a, #0x1e
	push	af
	inc	sp
	push	de
	inc	sp
	ld	d, e
	ld	e, -3 (ix)
	push	de
	ld	a, -4 (ix)
	push	af
	inc	sp
	call	_cpct_etm_drawTileBox2x4
	ld	sp, ix
	pop	ix
	ret
;src/background.c:73: void background_debug_box_wc(i16 wx, i16 wy, u8 width, u8 height)
;	---------------------------------
; Function background_debug_box_wc
; ---------------------------------
_background_debug_box_wc::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/background.c:80: u8 tileX = (wx / 2) + 2;
	ld	l,4 (ix)
	ld	h,5 (ix)
	bit	7, h
	jr	Z,00109$
	inc	hl
00109$:
	sra	h
	rr	l
	inc	l
	inc	l
;src/background.c:81: u8 tileY = (wy / 4) + 2;
	ld	c,6 (ix)
	ld	b,7 (ix)
	bit	7, b
	jr	Z,00110$
	inc	bc
	inc	bc
	inc	bc
00110$:
	sra	b
	rr	c
	sra	b
	rr	c
	inc	c
	inc	c
;src/background.c:82: u8 tileW = width / 2;
	ld	e, 8 (ix)
	srl	e
;src/background.c:83: u8 tileH = height / 4;
	ld	d, 9 (ix)
	srl	d
	srl	d
;src/background.c:86: if (height % 4 > 0)
	ld	a, 9 (ix)
	and	a, #0x03
	jr	Z,00102$
;src/background.c:88: tileH++;
	inc	d
00102$:
;src/background.c:92: if (width % 2 > 0)
	bit	0, 8 (ix)
	jr	Z,00104$
;src/background.c:94: tileW++;
	inc	e
00104$:
;src/background.c:98: if (wx & 1 == 1)
	bit	0, 4 (ix)
	jr	Z,00106$
;src/background.c:100: tileW += 1;
	inc	e
00106$:
;src/background.c:104: tileY * TILE_H);
	sla	c
	sla	c
;src/background.c:103: pvm = cpct_getScreenPtr(CPCT_VMEM_START, (tileX * TILE_W) + (4 * TILE_W),
	ld	a, l
	add	a, a
	add	a, #0x08
	ld	b, a
	push	de
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
	pop	de
;src/background.c:106: cpct_drawSolidBox(pvm, 255, tileW * TILE_W, tileH + TILE_H);
	inc	d
	inc	d
	inc	d
	inc	d
	ld	a, e
	add	a, a
	ld	e, a
	push	de
	ld	hl, #0x00ff
	push	hl
	push	bc
	call	_cpct_drawSolidBox
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
