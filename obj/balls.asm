;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module balls
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _balls_restore_background
	.globl _restoreBackground
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSprite
	.globl _serving
	.globl _balls
	.globl _balls_initialize
	.globl _balls_update
	.globl _balls_draw
	.globl _balls_get_first_active
	.globl _center_ball
	.globl _update_ball
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
;src/balls.c:14: void balls_initialize()
;	---------------------------------
; Function balls_initialize
; ---------------------------------
_balls_initialize::
;src/balls.c:17: serving = 1;
	ld	hl,#_serving + 0
	ld	(hl), #0x01
;src/balls.c:20: for (u8 i = 0; i < MAX_BALLS; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x03
	jr	NC,00101$
;src/balls.c:22: balls[i].active = 0;
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
;src/balls.c:23: balls[i].x = TILE_MAP_SCREEN_BYTE_OFFSET_X;
	ld	l, e
	ld	h, d
	inc	hl
	ld	(hl), #0x08
;src/balls.c:24: balls[i].y = TILE_MAP_SCREEN_PIXEL_OFFSET_Y;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	(hl), #0x10
;src/balls.c:25: balls[i].prev_x = TILE_MAP_SCREEN_BYTE_OFFSET_X;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x08
;src/balls.c:26: balls[i].prev_y = TILE_MAP_SCREEN_PIXEL_OFFSET_Y;
	ld	hl, #0x0004
	add	hl, de
	ld	(hl), #0x10
;src/balls.c:27: balls[i].dx = 1;
	ld	hl, #0x0005
	add	hl, de
	ld	(hl), #0x01
;src/balls.c:28: balls[i].dy = 0;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x00
;src/balls.c:20: for (u8 i = 0; i < MAX_BALLS; i++)
	inc	c
	jr	00103$
00101$:
;src/balls.c:30: balls[0].active = 1;
	ld	hl, #_balls
	ld	(hl), #0x01
;src/balls.c:33: center_ball(balls);
	push	hl
	call	_center_ball
	pop	af
	ret
;src/balls.c:36: void balls_update()
;	---------------------------------
; Function balls_update
; ---------------------------------
_balls_update::
;src/balls.c:38: Ball *ball = balls;
	ld	bc, #_balls+0
;src/balls.c:39: if (serving)
	ld	a,(#_serving + 0)
	or	a, a
	jr	Z,00115$
;src/balls.c:41: center_ball(ball);
	push	bc
	push	bc
	call	_center_ball
	pop	af
	pop	bc
;src/balls.c:42: if (key_serve_is_pressed)
	ld	a,(#_key_serve_is_pressed + 0)
	or	a, a
	ret	Z
;src/balls.c:44: serving = 0;
	ld	hl,#_serving + 0
	ld	(hl), #0x00
;src/balls.c:45: ball->dx = 1; // 45 degrees right
	ld	hl, #(_balls + 0x0005)
	ld	(hl), #0x01
;src/balls.c:46: ball->dy = -2;
	ld	hl, #(_balls + 0x0006)
	ld	(hl), #0xfe
;src/balls.c:47: ball->prev_x = ball->x;
	ld	l, c
	ld	h, b
	inc	hl
	ld	e, (hl)
	ld	hl, #(_balls + 0x0003)
	ld	(hl), e
;src/balls.c:48: ball->prev_y = ball->y;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	c, (hl)
	ld	hl, #(_balls + 0x0004)
	ld	(hl), c
	ret
;src/balls.c:53: for (u8 i = 0; i < MAX_BALLS; i++)
00115$:
	ld	e, #0x00
00108$:
	ld	a, e
	sub	a, #0x03
	ret	NC
;src/balls.c:55: update_ball(ball);
	push	bc
	push	de
	push	bc
	call	_update_ball
	pop	af
	pop	de
	pop	bc
;src/balls.c:56: ball++;
	ld	hl, #0x0007
	add	hl,bc
	ld	c, l
	ld	b, h
;src/balls.c:53: for (u8 i = 0; i < MAX_BALLS; i++)
	inc	e
	jr	00108$
;src/balls.c:61: void balls_restore_background()
;	---------------------------------
; Function balls_restore_background
; ---------------------------------
_balls_restore_background::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/balls.c:63: Ball *ball = balls;
	ld	bc, #_balls
;src/balls.c:64: for (u8 i = 0; i < MAX_BALLS; i++)
	ld	-1 (ix), #0x00
00105$:
	ld	a, -1 (ix)
	sub	a, #0x03
	jr	NC,00107$
;src/balls.c:66: if (ball->active)
	ld	a, (bc)
	or	a, a
	jr	Z,00102$
;src/balls.c:68: restoreBackground(ball->prev_x, balls->prev_y, SP_BALL_W, SP_BALL_H);
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
	call	_restoreBackground
	pop	af
	pop	af
	pop	bc
00102$:
;src/balls.c:70: ball++;
	ld	hl, #0x0007
	add	hl,bc
	ld	c, l
	ld	b, h
;src/balls.c:64: for (u8 i = 0; i < MAX_BALLS; i++)
	inc	-1 (ix)
	jr	00105$
00107$:
	inc	sp
	pop	ix
	ret
;src/balls.c:74: void balls_draw()
;	---------------------------------
; Function balls_draw
; ---------------------------------
_balls_draw::
;src/balls.c:78: for (u8 i = 0; i < MAX_BALLS; i++)
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x03
	ret	NC
;src/balls.c:80: if (balls->active)
	ld	a, (#_balls + 0)
	or	a, a
	jr	Z,00106$
;src/balls.c:82: svmem = cpct_getScreenPtr(CPCT_VMEM_START, balls->x, balls->y);
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
;src/balls.c:78: for (u8 i = 0; i < MAX_BALLS; i++)
	inc	c
	jr	00105$
;src/balls.c:88: Ball * balls_get_first_active() {
;	---------------------------------
; Function balls_get_first_active
; ---------------------------------
_balls_get_first_active::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/balls.c:89: Ball *ball = balls;
	ld	-2 (ix), #<(_balls)
	ld	-1 (ix), #>(_balls)
;src/balls.c:90: for (u8 i = 0; i < MAX_BALLS; i++)
	pop	hl
	push	hl
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x03
	jr	NC,00103$
;src/balls.c:92: if (ball->active)
	ld	a, (hl)
	or	a, a
	jr	Z,00102$
;src/balls.c:94: return ball;
	pop	hl
	push	hl
	jr	00107$
00102$:
;src/balls.c:96: ball++;
	ld	de, #0x0007
	add	hl, de
	inc	sp
	inc	sp
	push	hl
;src/balls.c:90: for (u8 i = 0; i < MAX_BALLS; i++)
	inc	c
	jr	00105$
00103$:
;src/balls.c:98: return NULL;
	ld	hl, #0x0000
00107$:
	ld	sp, ix
	pop	ix
	ret
;src/balls.c:105: void center_ball(Ball *ball)
;	---------------------------------
; Function center_ball
; ---------------------------------
_center_ball::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/balls.c:107: ball->prev_x = ball->x;
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
;src/balls.c:108: ball->prev_y = ball->y;
	ld	iy, #0x0004
	add	iy, bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	0 (iy), a
;src/balls.c:109: ball->x = batX + (batW / 4);
	ld	iy, #_batW
	ld	l, 0 (iy)
	srl	l
	srl	l
	ld	a,(#_batX + 0)
	add	a, l
	ld	(de), a
;src/balls.c:110: ball->y = batY - SP_BALL_H;
	ld	a,(#_batY + 0)
	add	a, #0xfa
	ld	(bc), a
	pop	ix
	ret
;src/balls.c:113: void update_ball(Ball *ball)
;	---------------------------------
; Function update_ball
; ---------------------------------
_update_ball::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-13
	add	hl, sp
	ld	sp, hl
;src/balls.c:115: ball->prev_x = ball->x;
	ld	a, 4 (ix)
	ld	-9 (ix), a
	ld	a, 5 (ix)
	ld	-8 (ix), a
	ld	c,-9 (ix)
	ld	b,-8 (ix)
	inc	bc
	inc	bc
	inc	bc
	ld	a, -9 (ix)
	add	a, #0x01
	ld	-11 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a, (hl)
	ld	(bc), a
;src/balls.c:116: ball->prev_y = ball->y;
	ld	a, -9 (ix)
	add	a, #0x04
	ld	c, a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, -9 (ix)
	add	a, #0x02
	ld	-2 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a, (hl)
	ld	(bc), a
;src/balls.c:118: if (ball->active)
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	or	a, a
	jp	Z, 00121$
;src/balls.c:120: u8 new_x = ball->x + ball->dx;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	ld	a, -9 (ix)
	add	a, #0x05
	ld	-5 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a, (hl)
	ld	-6 (ix), a
	ld	a, -3 (ix)
	add	a, -6 (ix)
	ld	-12 (ix), a
;src/balls.c:121: u8 new_y = ball->y + ball->dy;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	ld	a, -9 (ix)
	add	a, #0x06
	ld	-9 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a, (hl)
	ld	-7 (ix), a
	ld	a, -3 (ix)
	add	a, -7 (ix)
	ld	-13 (ix), a
	ld	c, a
;src/balls.c:122: if (ball->dx > 0)
	xor	a, a
	sub	a, -6 (ix)
	jp	PO, 00151$
	xor	a, #0x80
00151$:
	jp	P, 00108$
;src/balls.c:124: if (new_x >= PLAY_AREA_RIGHT_EDGE - SP_BALL_W)
	ld	a, -12 (ix)
	sub	a, #0x3f
	jr	C,00102$
;src/balls.c:126: ball->x = PLAY_AREA_RIGHT_EDGE - SP_BALL_W;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl), #0x3f
;src/balls.c:127: ball->dx = -ball->dx;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	b, (hl)
	xor	a, a
	sub	a, b
	ld	b, a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl), b
	jr	00109$
00102$:
;src/balls.c:131: ball->x = new_x;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a, -12 (ix)
	ld	(hl), a
	jr	00109$
00108$:
;src/balls.c:137: if (new_x <= PLAY_AREA_LEFT_EDGE)
	ld	a, #0x0c
	sub	a, -12 (ix)
	jr	C,00105$
;src/balls.c:139: ball->x = PLAY_AREA_LEFT_EDGE;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl), #0x0c
;src/balls.c:140: ball->dx = -ball->dx;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	b, (hl)
	xor	a, a
	sub	a, b
	ld	b, a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl), b
	jr	00109$
00105$:
;src/balls.c:144: ball->x = new_x;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a, -12 (ix)
	ld	(hl), a
00109$:
;src/balls.c:148: if (ball->dy < 0)
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	b, (hl)
	bit	7, b
	jr	Z,00117$
;src/balls.c:150: if (new_y <= PLAY_AREA_TOP_EDGE)
	ld	a, #0x18
	sub	a, c
	jr	C,00111$
;src/balls.c:152: ball->y = PLAY_AREA_TOP_EDGE;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl), #0x18
;src/balls.c:153: ball->dy = -ball->dy;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	c, (hl)
	xor	a, a
	sub	a, c
	ld	c, a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl), c
	jr	00121$
00111$:
;src/balls.c:157: ball->y = new_y;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl), c
	jr	00121$
00117$:
;src/balls.c:162: if (new_y >= YOUR_DEAD_PIXEL_ROW)
	ld	a, c
	sub	a, #0xc2
	jr	C,00114$
;src/balls.c:165: ball->dy = -ball->dy;
	xor	a, a
	sub	a, b
	ld	c, a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl), c
	jr	00121$
00114$:
;src/balls.c:169: ball->y = new_y;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl), c
00121$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
