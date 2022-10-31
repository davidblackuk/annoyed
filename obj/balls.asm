;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module balls
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _background_bounce_ball
	.globl _background_restore_world_coords
	.globl _blocks_bounce_ball
	.globl _bat_bounce_ball
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSpriteMaskedAlignedTable
	.globl _serving
	.globl _all_balls
	.globl _balls_initialize
	.globl _balls_update
	.globl _balls_restore_background
	.globl _balls_draw
	.globl _balls_get_first_active
	.globl _initialize_balls
	.globl _center_ball
	.globl _handle_serve
	.globl _update_ball
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_all_balls::
	.ds 39
_serving::
	.ds 1
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
;src/balls.c:32: void balls_initialize()
;	---------------------------------
; Function balls_initialize
; ---------------------------------
_balls_initialize::
;src/balls.c:35: serving = 1;
	ld	hl,#_serving + 0
	ld	(hl), #0x01
;src/balls.c:37: initialize_balls();
	call	_initialize_balls
;src/balls.c:40: center_ball(all_balls);
	ld	hl, #_all_balls
	push	hl
	call	_center_ball
	pop	af
	ret
;src/balls.c:43: void balls_update()
;	---------------------------------
; Function balls_update
; ---------------------------------
_balls_update::
;src/balls.c:45: Ball *ball = all_balls;
	ld	bc, #_all_balls+0
;src/balls.c:46: if (serving)
	ld	a,(#_serving + 0)
	or	a, a
	jr	Z,00115$
;src/balls.c:48: center_ball(ball);
	push	bc
	push	bc
	call	_center_ball
	pop	af
	pop	bc
;src/balls.c:49: if (key_serve_is_pressed)
	ld	a,(#_key_serve_is_pressed + 0)
	or	a, a
	ret	Z
;src/balls.c:51: handle_serve(ball);
	push	bc
	call	_handle_serve
	pop	af
	ret
;src/balls.c:56: for (u8 i = 0; i < MAX_BALLS; i++)
00115$:
	ld	e, #0x00
00108$:
	ld	a, e
	sub	a, #0x03
	ret	NC
;src/balls.c:58: update_ball(ball);
	push	bc
	push	de
	push	bc
	call	_update_ball
	pop	af
	pop	de
	pop	bc
;src/balls.c:59: ball++;
	ld	hl, #0x000d
	add	hl,bc
	ld	c, l
	ld	b, h
;src/balls.c:56: for (u8 i = 0; i < MAX_BALLS; i++)
	inc	e
	jr	00108$
;src/balls.c:64: void balls_restore_background()
;	---------------------------------
; Function balls_restore_background
; ---------------------------------
_balls_restore_background::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/balls.c:66: Ball *ball = all_balls;
	ld	bc, #_all_balls+0
;src/balls.c:67: for (u8 i = 0; i < MAX_BALLS; i++)
	ld	-3 (ix), #0x00
00105$:
	ld	a, -3 (ix)
	sub	a, #0x03
	jr	NC,00107$
;src/balls.c:69: if (ball->active)
	ld	a, (bc)
	or	a, a
	jr	Z,00102$
;src/balls.c:71: background_restore_world_coords(ball->prev_x, ball->prev_y, SP_BALL_W, SP_BALL_H);
	ld	l, c
	ld	h, b
	ld	de, #0x0007
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	pop	iy
	ld	a, 5 (iy)
	ld	-2 (ix), a
	ld	a, 6 (iy)
	ld	-1 (ix), a
	push	bc
	ld	hl, #0x0603
	push	hl
	push	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_background_restore_world_coords
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
00102$:
;src/balls.c:73: ball++;
	ld	hl, #0x000d
	add	hl,bc
	ld	c, l
	ld	b, h
;src/balls.c:67: for (u8 i = 0; i < MAX_BALLS; i++)
	inc	-3 (ix)
	jr	00105$
00107$:
	ld	sp, ix
	pop	ix
	ret
;src/balls.c:77: void balls_draw()
;	---------------------------------
; Function balls_draw
; ---------------------------------
_balls_draw::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/balls.c:80: Ball *ball = all_balls;
	ld	bc, #_all_balls+0
;src/balls.c:81: for (u8 i = 0; i < MAX_BALLS; i++)
	ld	-1 (ix), #0x00
00105$:
	ld	a, -1 (ix)
	sub	a, #0x03
	jr	NC,00107$
;src/balls.c:83: if (ball->active)
	ld	a, (bc)
	or	a, a
	jr	Z,00106$
;src/balls.c:85: svmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(ball->x), W_2_S_Y(ball->y));
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	add	a, #0x08
	ld	d, a
	ld	l, c
	ld	h, b
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	add	a, #0x0c
	push	bc
	ld	e, a
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	de, #_g_masktable
	push	de
	ld	de, #0x0603
	push	de
	push	hl
	ld	hl, #_sp_ball
	push	hl
	call	_cpct_drawSpriteMaskedAlignedTable
	pop	bc
;src/balls.c:90: ball++;
	ld	hl, #0x000d
	add	hl,bc
	ld	c, l
	ld	b, h
00106$:
;src/balls.c:81: for (u8 i = 0; i < MAX_BALLS; i++)
	inc	-1 (ix)
	jr	00105$
00107$:
	inc	sp
	pop	ix
	ret
;src/balls.c:95: Ball *balls_get_first_active()
;	---------------------------------
; Function balls_get_first_active
; ---------------------------------
_balls_get_first_active::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/balls.c:97: Ball *ball = all_balls;
	ld	-2 (ix), #<(_all_balls)
	ld	-1 (ix), #>(_all_balls)
;src/balls.c:98: for (u8 i = 0; i < MAX_BALLS; i++)
	pop	hl
	push	hl
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x03
	jr	NC,00103$
;src/balls.c:100: if (ball->active)
	ld	a, (hl)
	or	a, a
	jr	Z,00102$
;src/balls.c:102: return ball;
	pop	hl
	push	hl
	jr	00107$
00102$:
;src/balls.c:104: ball++;
	ld	de, #0x000d
	add	hl, de
	inc	sp
	inc	sp
	push	hl
;src/balls.c:98: for (u8 i = 0; i < MAX_BALLS; i++)
	inc	c
	jr	00105$
00103$:
;src/balls.c:106: return NULL;
	ld	hl, #0x0000
00107$:
	ld	sp, ix
	pop	ix
	ret
;src/balls.c:113: void initialize_balls()
;	---------------------------------
; Function initialize_balls
; ---------------------------------
_initialize_balls::
;src/balls.c:116: for (u8 i = 0; i < MAX_BALLS; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x03
	jr	NC,00101$
;src/balls.c:118: all_balls[i].active = 0;
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	de,hl
	ld	hl, #_all_balls
	add	hl,de
	ex	de,hl
	xor	a, a
	ld	(de), a
;src/balls.c:119: all_balls[i].x = 0;
	ld	l, e
	ld	h, d
	inc	hl
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/balls.c:120: all_balls[i].y = 0;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/balls.c:121: all_balls[i].prev_x = 0;
	ld	hl, #0x0005
	add	hl, de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/balls.c:122: all_balls[i].prev_y = 0;
	ld	hl, #0x0007
	add	hl, de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/balls.c:123: all_balls[i].dx = 0;
	ld	hl, #0x0009
	add	hl, de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/balls.c:124: all_balls[i].dy = 0;
	ld	hl, #0x000b
	add	hl, de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/balls.c:116: for (u8 i = 0; i < MAX_BALLS; i++)
	inc	c
	jr	00103$
00101$:
;src/balls.c:128: all_balls[0].active = 1;
	ld	hl, #_all_balls
	ld	(hl), #0x01
	ret
;src/balls.c:131: void center_ball(Ball *ball)
;	---------------------------------
; Function center_ball
; ---------------------------------
_center_ball::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/balls.c:134: ball->prev_x = ball->x;
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	iy, #0x0005
	add	iy, de
	ld	c, e
	ld	b, d
	inc	bc
	ld	l, c
	ld	h, b
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	0 (iy), a
	ld	1 (iy), h
;src/balls.c:135: ball->prev_y = ball->y;
	ld	iy, #0x0007
	add	iy, de
	inc	de
	inc	de
	inc	de
	inc	sp
	inc	sp
	push	de
	pop	hl
	push	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	0 (iy), e
	ld	1 (iy), d
;src/balls.c:138: ball->x = batX + (batW / 4) + 1;
	ld	hl,#_batX + 0
	ld	e, (hl)
	ld	d, #0x00
	ld	iy, #_batW
	ld	l, 0 (iy)
	srl	l
	srl	l
	ld	h, #0x00
	add	hl, de
	inc	hl
	ld	d, l
	ld	e, h
	ld	a, d
	ld	(bc), a
	inc	bc
	ld	a, e
	ld	(bc), a
;src/balls.c:139: ball->y = batY - SP_BALL_H;
	ld	a,(#_batY + 0)
	ld	b, #0x00
	add	a, #0xfa
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	pop	hl
	push	hl
	ld	(hl), c
	inc	hl
	ld	(hl), b
	ld	sp, ix
	pop	ix
	ret
;src/balls.c:142: void handle_serve(Ball *ball)
;	---------------------------------
; Function handle_serve
; ---------------------------------
_handle_serve::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/balls.c:145: serving = 0;
	ld	hl,#_serving + 0
	ld	(hl), #0x00
;src/balls.c:148: ball->dx = 1;
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	hl, #0x0009
	add	hl, de
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
;src/balls.c:149: ball->dy = -2;
	ld	hl, #0x000b
	add	hl, de
	ld	(hl), #0xfe
	inc	hl
	ld	(hl), #0xff
;src/balls.c:152: ball->prev_x = ball->x;
	ld	iy, #0x0005
	add	iy, de
	ld	l, e
	ld	h, d
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	0 (iy), c
	ld	1 (iy), b
;src/balls.c:153: ball->prev_y = ball->y;
	ld	hl, #0x0007
	add	hl,de
	ld	c, l
	ld	b, h
	ex	de,hl
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	pop	ix
	ret
;src/balls.c:156: void update_ball(Ball *ball)
;	---------------------------------
; Function update_ball
; ---------------------------------
_update_ball::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-11
	add	hl, sp
	ld	sp, hl
;src/balls.c:158: ball->prev_x = ball->x;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	iy, #0x0005
	add	iy, bc
	ld	hl, #0x0001
	add	hl,bc
	ld	-7 (ix), l
	ld	-6 (ix), h
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	0 (iy), e
	ld	1 (iy), d
;src/balls.c:159: ball->prev_y = ball->y;
	ld	iy, #0x0007
	add	iy, bc
	ld	hl, #0x0003
	add	hl,bc
	ld	-9 (ix), l
	ld	-8 (ix), h
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	0 (iy), e
	ld	1 (iy), d
;src/balls.c:161: if (ball->active)
	ld	a, (bc)
	or	a, a
	jp	Z, 00111$
;src/balls.c:164: i16 new_x = ball->x + ball->dx;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl,bc
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl, de
	inc	sp
	inc	sp
	push	hl
;src/balls.c:165: i16 new_y = ball->y + ball->dy;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0x000b
	add	hl,bc
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl,de
	ex	de,hl
;src/balls.c:167: if (new_y >= YOUR_DEAD_Y)
	ld	a, e
	sub	a, #0xba
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00102$
;src/balls.c:170: ball->active = 0;
	xor	a, a
	ld	(bc), a
;src/balls.c:171: ball->dy = 0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/balls.c:172: return;
	jp	00111$
00102$:
;src/balls.c:175: hits |= background_bounce_ball(new_x, new_y);
	push	bc
	push	de
	push	de
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	hl
	call	_background_bounce_ball
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	-5 (ix), l
;src/balls.c:176: hits |= bat_bounce_ball(ball, new_x, new_y);
	push	de
	push	de
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	hl
	push	bc
	call	_bat_bounce_ball
	pop	af
	pop	af
	pop	af
	pop	de
	ld	a, -5 (ix)
	or	a, l
	ld	c, a
;src/balls.c:177: hits |= blocks_bounce_ball(ball, new_x, new_y);
	push	bc
	push	de
	push	de
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_blocks_bounce_ball
	pop	af
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	a, c
	or	a, l
	ld	-5 (ix), a
;src/balls.c:179: if (hits & BOUNCE_X)
	bit	0, -5 (ix)
	jr	Z,00104$
;src/balls.c:181: ball->dx = -ball->dx;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	xor	a, a
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	jr	00105$
00104$:
;src/balls.c:185: ball->x = new_x;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a, -11 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -10 (ix)
	ld	(hl), a
00105$:
;src/balls.c:188: if (hits & BOUNCE_Y)
	bit	1, -5 (ix)
	jr	Z,00107$
;src/balls.c:190: ball->dy = -ball->dy;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	xor	a, a
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	jr	00111$
00107$:
;src/balls.c:194: ball->y = new_y;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
00111$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
