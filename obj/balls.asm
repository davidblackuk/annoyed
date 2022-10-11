;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module balls
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _background_restore
	.globl _blocks_intersect_ball
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSprite
	.globl _serving
	.globl _balls
	.globl _balls_initialize
	.globl _balls_update
	.globl _balls_restore_background
	.globl _balls_draw
	.globl _balls_get_first_active
	.globl _center_ball
	.globl _update_ball
	.globl _move_ball_x
	.globl _move_ball_y
	.globl _check_bat_collision
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_balls::
	.ds 21
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
;src/balls.c:16: void balls_initialize()
;	---------------------------------
; Function balls_initialize
; ---------------------------------
_balls_initialize::
;src/balls.c:19: serving = 1;
	ld	hl,#_serving + 0
	ld	(hl), #0x01
;src/balls.c:22: for (u8 i = 0; i < MAX_BALLS; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x03
	jr	NC,00101$
;src/balls.c:24: balls[i].active = 0;
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ex	de,hl
	ld	hl, #_balls
	add	hl,de
	ex	de,hl
	xor	a, a
	ld	(de), a
;src/balls.c:25: balls[i].x = TILE_MAP_SCREEN_BYTE_OFFSET_X;
	ld	l, e
	ld	h, d
	inc	hl
	ld	(hl), #0x08
;src/balls.c:26: balls[i].y = TILE_MAP_SCREEN_PIXEL_OFFSET_Y;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	(hl), #0x00
;src/balls.c:27: balls[i].prev_x = TILE_MAP_SCREEN_BYTE_OFFSET_X;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x08
;src/balls.c:28: balls[i].prev_y = TILE_MAP_SCREEN_PIXEL_OFFSET_Y;
	ld	hl, #0x0004
	add	hl, de
	ld	(hl), #0x00
;src/balls.c:29: balls[i].dx = 1;
	ld	hl, #0x0005
	add	hl, de
	ld	(hl), #0x01
;src/balls.c:30: balls[i].dy = 0;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x00
;src/balls.c:22: for (u8 i = 0; i < MAX_BALLS; i++)
	inc	c
	jr	00103$
00101$:
;src/balls.c:32: balls[0].active = 1;
	ld	hl, #_balls
	ld	(hl), #0x01
;src/balls.c:35: center_ball(balls);
	push	hl
	call	_center_ball
	pop	af
	ret
;src/balls.c:38: void balls_update()
;	---------------------------------
; Function balls_update
; ---------------------------------
_balls_update::
;src/balls.c:40: Ball *ball = balls;
	ld	bc, #_balls+0
;src/balls.c:41: if (serving)
	ld	a,(#_serving + 0)
	or	a, a
	jr	Z,00115$
;src/balls.c:43: center_ball(ball);
	push	bc
	push	bc
	call	_center_ball
	pop	af
	pop	bc
;src/balls.c:44: if (key_serve_is_pressed)
	ld	a,(#_key_serve_is_pressed + 0)
	or	a, a
	ret	Z
;src/balls.c:46: serving = 0;
	ld	hl,#_serving + 0
	ld	(hl), #0x00
;src/balls.c:47: ball->dx = 1; // 45 degrees right
	ld	hl, #(_balls + 0x0005)
	ld	(hl), #0x01
;src/balls.c:48: ball->dy = -2;
	ld	hl, #(_balls + 0x0006)
	ld	(hl), #0xfe
;src/balls.c:49: ball->prev_x = ball->x;
	ld	l, c
	ld	h, b
	inc	hl
	ld	e, (hl)
	ld	hl, #(_balls + 0x0003)
	ld	(hl), e
;src/balls.c:50: ball->prev_y = ball->y;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	c, (hl)
	ld	hl, #(_balls + 0x0004)
	ld	(hl), c
	ret
;src/balls.c:55: for (u8 i = 0; i < MAX_BALLS; i++)
00115$:
	ld	e, #0x00
00108$:
	ld	a, e
	sub	a, #0x03
	ret	NC
;src/balls.c:57: update_ball(ball);
	push	bc
	push	de
	push	bc
	call	_update_ball
	pop	af
	pop	de
	pop	bc
;src/balls.c:58: ball++;
	ld	hl, #0x0007
	add	hl,bc
	ld	c, l
	ld	b, h
;src/balls.c:55: for (u8 i = 0; i < MAX_BALLS; i++)
	inc	e
	jr	00108$
;src/balls.c:63: void balls_restore_background()
;	---------------------------------
; Function balls_restore_background
; ---------------------------------
_balls_restore_background::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/balls.c:65: Ball *ball = balls;
	ld	bc, #_balls
;src/balls.c:66: for (u8 i = 0; i < MAX_BALLS; i++)
	ld	-1 (ix), #0x00
00105$:
	ld	a, -1 (ix)
	sub	a, #0x03
	jr	NC,00107$
;src/balls.c:68: if (ball->active)
	ld	a, (bc)
	or	a, a
	jr	Z,00102$
;src/balls.c:70: background_restore(ball->prev_x, balls->prev_y, SP_BALL_W, SP_BALL_H);
	ld	hl, #_balls + 4
	ld	e, (hl)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	d, (hl)
	push	bc
	ld	hl, #0x0603
	push	hl
	ld	a, e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_background_restore
	pop	af
	pop	af
	pop	bc
00102$:
;src/balls.c:72: ball++;
	ld	hl, #0x0007
	add	hl,bc
	ld	c, l
	ld	b, h
;src/balls.c:66: for (u8 i = 0; i < MAX_BALLS; i++)
	inc	-1 (ix)
	jr	00105$
00107$:
	inc	sp
	pop	ix
	ret
;src/balls.c:76: void balls_draw()
;	---------------------------------
; Function balls_draw
; ---------------------------------
_balls_draw::
;src/balls.c:80: for (u8 i = 0; i < MAX_BALLS; i++)
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x03
	ret	NC
;src/balls.c:82: if (balls->active)
	ld	a, (#_balls + 0)
	or	a, a
	jr	Z,00106$
;src/balls.c:84: svmem = cpct_getScreenPtr(CPCT_VMEM_START, balls->x, balls->y);
	ld	hl, #_balls + 2
	ld	b, (hl)
	ld	hl, #_balls + 1
	ld	d, (hl)
	push	bc
	ld	c, d
	push	bc
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	de, #0x0603
	push	de
	push	hl
	ld	hl, #_sp_ball
	push	hl
	call	_cpct_drawSprite
	pop	bc
00106$:
;src/balls.c:80: for (u8 i = 0; i < MAX_BALLS; i++)
	inc	c
	jr	00105$
;src/balls.c:90: Ball *balls_get_first_active()
;	---------------------------------
; Function balls_get_first_active
; ---------------------------------
_balls_get_first_active::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/balls.c:92: Ball *ball = balls;
	ld	-2 (ix), #<(_balls)
	ld	-1 (ix), #>(_balls)
;src/balls.c:93: for (u8 i = 0; i < MAX_BALLS; i++)
	pop	hl
	push	hl
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x03
	jr	NC,00103$
;src/balls.c:95: if (ball->active)
	ld	a, (hl)
	or	a, a
	jr	Z,00102$
;src/balls.c:97: return ball;
	pop	hl
	push	hl
	jr	00107$
00102$:
;src/balls.c:99: ball++;
	ld	de, #0x0007
	add	hl, de
	inc	sp
	inc	sp
	push	hl
;src/balls.c:93: for (u8 i = 0; i < MAX_BALLS; i++)
	inc	c
	jr	00105$
00103$:
;src/balls.c:101: return NULL;
	ld	hl, #0x0000
00107$:
	ld	sp, ix
	pop	ix
	ret
;src/balls.c:107: void center_ball(Ball *ball)
;	---------------------------------
; Function center_ball
; ---------------------------------
_center_ball::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/balls.c:109: ball->prev_x = ball->x;
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	inc	iy
	inc	iy
	inc	iy
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (de)
	ld	0 (iy), a
;src/balls.c:110: ball->prev_y = ball->y;
	ld	iy, #0x0004
	add	iy, bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	0 (iy), a
;src/balls.c:111: ball->x = batX + (batW / 4);
	ld	iy, #_batW
	ld	l, 0 (iy)
	srl	l
	srl	l
	ld	a,(#_batX + 0)
	add	a, l
	ld	(de), a
;src/balls.c:112: ball->y = batY - SP_BALL_H;
	ld	a,(#_batY + 0)
	add	a, #0xfa
	ld	(bc), a
	pop	ix
	ret
;src/balls.c:115: void update_ball(Ball *ball)
;	---------------------------------
; Function update_ball
; ---------------------------------
_update_ball::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/balls.c:117: ball->prev_x = ball->x;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	l, c
	ld	h, b
	inc	hl
	ld	a, (hl)
	ld	(de), a
;src/balls.c:118: ball->prev_y = ball->y;
	ld	hl, #0x0004
	add	hl,bc
	ex	de,hl
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	(de), a
;src/balls.c:120: if (ball->active)
	ld	a, (bc)
	or	a, a
	jr	Z,00103$
;src/balls.c:122: blocks_intersect_ball(ball);
	push	bc
	call	_blocks_intersect_ball
	pop	af
;src/balls.c:124: move_ball_x(ball);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_move_ball_x
	pop	af
;src/balls.c:125: move_ball_y(ball);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_move_ball_y
	pop	af
00103$:
	pop	ix
	ret
;src/balls.c:129: void move_ball_x(Ball *ball)
;	---------------------------------
; Function move_ball_x
; ---------------------------------
_move_ball_x::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/balls.c:131: u8 new_x = ball->x + ball->dx;
	ld	e,4 (ix)
	ld	d,5 (ix)
	push	de
	pop	iy
	inc	iy
	ld	b, 0 (iy)
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ld	c, a
	ld	l, b
	add	hl, bc
;src/balls.c:133: if (ball->dx > 0)
	xor	a, a
	sub	a, c
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	jp	P, 00108$
;src/balls.c:136: if (new_x >= PLAY_AREA_RIGHT_EDGE - SP_BALL_W)
	ld	a, l
	sub	a, #0x3d
	jr	C,00102$
;src/balls.c:138: ball->x = PLAY_AREA_RIGHT_EDGE - SP_BALL_W;
	ld	0 (iy), #0x3d
;src/balls.c:139: ball->dx = -ball->dx;
	ld	a, (de)
	ld	c, a
	xor	a, a
	sub	a, c
	ld	(de), a
	jr	00110$
00102$:
;src/balls.c:143: ball->x = new_x;
	ld	0 (iy), l
	jr	00110$
00108$:
;src/balls.c:150: if (new_x <= PLAY_AREA_LEFT_EDGE)
	ld	a, #0x0c
	sub	a, l
	jr	C,00105$
;src/balls.c:152: ball->x = PLAY_AREA_LEFT_EDGE;
	ld	0 (iy), #0x0c
;src/balls.c:153: ball->dx = -ball->dx;
	ld	a, (de)
	ld	c, a
	xor	a, a
	sub	a, c
	ld	(de), a
	jr	00110$
00105$:
;src/balls.c:157: ball->x = new_x;
	ld	0 (iy), l
00110$:
	pop	ix
	ret
;src/balls.c:164: void move_ball_y(Ball *ball)
;	---------------------------------
; Function move_ball_y
; ---------------------------------
_move_ball_y::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/balls.c:167: u8 new_y = ball->y + ball->dy;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, (de)
	ld	-1 (ix), a
	ld	iy, #0x0006
	add	iy, bc
	ld	l, 0 (iy)
	ld	a, -1 (ix)
	add	a, l
	ld	-2 (ix), a
;src/balls.c:170: if (ball->dy < 0)
	bit	7, l
	jr	Z,00108$
;src/balls.c:172: if (new_y <= PLAY_AREA_TOP_EDGE)
	ld	a, #0x08
	sub	a, -2 (ix)
	jr	C,00102$
;src/balls.c:174: ball->y = PLAY_AREA_TOP_EDGE;
	ld	a, #0x08
	ld	(de), a
;src/balls.c:175: ball->dy = -ball->dy;
	ld	c, 0 (iy)
	xor	a, a
	sub	a, c
	ld	0 (iy), a
	jr	00109$
00102$:
;src/balls.c:179: ball->y = new_y;
	ld	a, -2 (ix)
	ld	(de), a
	jr	00109$
00108$:
;src/balls.c:186: if (new_y >= YOUR_DEAD_PIXEL_ROW)
	ld	a, -2 (ix)
	sub	a, #0xc2
	jr	C,00105$
;src/balls.c:189: ball->active = 0;
	xor	a, a
	ld	(bc), a
;src/balls.c:190: ball->dy = -ball->dy;
	ld	c, 0 (iy)
	xor	a, a
	sub	a, c
	ld	0 (iy), a
	jr	00109$
00105$:
;src/balls.c:195: check_bat_collision(ball, new_y);
	push	de
	ld	a, -2 (ix)
	push	af
	inc	sp
	push	bc
	call	_check_bat_collision
	pop	af
	inc	sp
	pop	de
00109$:
;src/balls.c:198: ball->y = new_y;
	ld	a, -2 (ix)
	ld	(de), a
	ld	sp, ix
	pop	ix
	ret
;src/balls.c:201: void check_bat_collision(Ball *ball, u8 new_y)
;	---------------------------------
; Function check_bat_collision
; ---------------------------------
_check_bat_collision::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/balls.c:203: if ((ball->x + SP_BALL_W >= batX && ball->x <= batX + batW) &&
	ld	a, 4 (ix)
	ld	-2 (ix), a
	ld	a, 5 (ix)
	ld	-1 (ix), a
	pop	bc
	pop	hl
	push	hl
	push	bc
	inc	hl
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #0x0003
	add	hl,bc
	ex	(sp), hl
	ld	hl,#_batX + 0
	ld	e, (hl)
	ld	d, #0x00
	ld	a, -4 (ix)
	sub	a, e
	ld	a, -3 (ix)
	sbc	a, d
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	jp	M, 00106$
	ld	iy, #_batW
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, de
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	jp	PO, 00125$
	xor	a, #0x80
00125$:
	jp	M, 00106$
;src/balls.c:204: (ball->y + SP_BALL_H >= batY && ball->y < batY + SP_BAT_LEFT_H))
	pop	bc
	pop	hl
	push	hl
	push	bc
	inc	hl
	inc	hl
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #0x0006
	add	hl,bc
	ex	de,hl
	ld	iy, #_batY
	ld	l, 0 (iy)
	ld	h, #0x00
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jp	PO, 00126$
	xor	a, #0x80
00126$:
	jp	M, 00106$
	ld	de, #0x0008
	add	hl, de
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jp	PO, 00127$
	xor	a, #0x80
00127$:
	jp	P, 00106$
;src/balls.c:206: ball->dy = -ball->dy;
	ld	a, -2 (ix)
	add	a, #0x06
	ld	l, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	h, a
	ld	c, (hl)
	xor	a, a
	sub	a, c
	ld	(hl), a
00106$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)