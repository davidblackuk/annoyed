                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module balls
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _background_restore
                             12 	.globl _cpct_getScreenPtr
                             13 	.globl _cpct_drawSprite
                             14 	.globl _serving
                             15 	.globl _balls
                             16 	.globl _balls_initialize
                             17 	.globl _balls_update
                             18 	.globl _balls_restore_background
                             19 	.globl _balls_draw
                             20 	.globl _balls_get_first_active
                             21 	.globl _center_ball
                             22 	.globl _update_ball
                             23 	.globl _move_ball_x
                             24 	.globl _move_ball_y
                             25 	.globl _check_bat_collision
                             26 ;--------------------------------------------------------
                             27 ; special function registers
                             28 ;--------------------------------------------------------
                             29 ;--------------------------------------------------------
                             30 ; ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DATA
   6D71                      33 _balls::
   6D71                      34 	.ds 21
   6D86                      35 _serving::
   6D86                      36 	.ds 1
                             37 ;--------------------------------------------------------
                             38 ; ram data
                             39 ;--------------------------------------------------------
                             40 	.area _INITIALIZED
                             41 ;--------------------------------------------------------
                             42 ; absolute external ram data
                             43 ;--------------------------------------------------------
                             44 	.area _DABS (ABS)
                             45 ;--------------------------------------------------------
                             46 ; global & static initialisations
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _GSINIT
                             50 	.area _GSFINAL
                             51 	.area _GSINIT
                             52 ;--------------------------------------------------------
                             53 ; Home
                             54 ;--------------------------------------------------------
                             55 	.area _HOME
                             56 	.area _HOME
                             57 ;--------------------------------------------------------
                             58 ; code
                             59 ;--------------------------------------------------------
                             60 	.area _CODE
                             61 ;src/balls.c:15: void balls_initialize()
                             62 ;	---------------------------------
                             63 ; Function balls_initialize
                             64 ; ---------------------------------
   618F                      65 _balls_initialize::
                             66 ;src/balls.c:18: serving = 1;
   618F 21 86 6D      [10]   67 	ld	hl,#_serving + 0
   6192 36 01         [10]   68 	ld	(hl), #0x01
                             69 ;src/balls.c:21: for (u8 i = 0; i < MAX_BALLS; i++)
   6194 0E 00         [ 7]   70 	ld	c, #0x00
   6196                      71 00103$:
   6196 79            [ 4]   72 	ld	a, c
   6197 D6 03         [ 7]   73 	sub	a, #0x03
   6199 30 37         [12]   74 	jr	NC,00101$
                             75 ;src/balls.c:23: balls[i].active = 0;
   619B 06 00         [ 7]   76 	ld	b,#0x00
   619D 69            [ 4]   77 	ld	l, c
   619E 60            [ 4]   78 	ld	h, b
   619F 29            [11]   79 	add	hl, hl
   61A0 09            [11]   80 	add	hl, bc
   61A1 29            [11]   81 	add	hl, hl
   61A2 09            [11]   82 	add	hl, bc
   61A3 EB            [ 4]   83 	ex	de,hl
   61A4 21 71 6D      [10]   84 	ld	hl, #_balls
   61A7 19            [11]   85 	add	hl,de
   61A8 EB            [ 4]   86 	ex	de,hl
   61A9 AF            [ 4]   87 	xor	a, a
   61AA 12            [ 7]   88 	ld	(de), a
                             89 ;src/balls.c:24: balls[i].x = TILE_MAP_SCREEN_BYTE_OFFSET_X;
   61AB 6B            [ 4]   90 	ld	l, e
   61AC 62            [ 4]   91 	ld	h, d
   61AD 23            [ 6]   92 	inc	hl
   61AE 36 08         [10]   93 	ld	(hl), #0x08
                             94 ;src/balls.c:25: balls[i].y = TILE_MAP_SCREEN_PIXEL_OFFSET_Y;
   61B0 6B            [ 4]   95 	ld	l, e
   61B1 62            [ 4]   96 	ld	h, d
   61B2 23            [ 6]   97 	inc	hl
   61B3 23            [ 6]   98 	inc	hl
   61B4 36 00         [10]   99 	ld	(hl), #0x00
                            100 ;src/balls.c:26: balls[i].prev_x = TILE_MAP_SCREEN_BYTE_OFFSET_X;
   61B6 6B            [ 4]  101 	ld	l, e
   61B7 62            [ 4]  102 	ld	h, d
   61B8 23            [ 6]  103 	inc	hl
   61B9 23            [ 6]  104 	inc	hl
   61BA 23            [ 6]  105 	inc	hl
   61BB 36 08         [10]  106 	ld	(hl), #0x08
                            107 ;src/balls.c:27: balls[i].prev_y = TILE_MAP_SCREEN_PIXEL_OFFSET_Y;
   61BD 21 04 00      [10]  108 	ld	hl, #0x0004
   61C0 19            [11]  109 	add	hl, de
   61C1 36 00         [10]  110 	ld	(hl), #0x00
                            111 ;src/balls.c:28: balls[i].dx = 1;
   61C3 21 05 00      [10]  112 	ld	hl, #0x0005
   61C6 19            [11]  113 	add	hl, de
   61C7 36 01         [10]  114 	ld	(hl), #0x01
                            115 ;src/balls.c:29: balls[i].dy = 0;
   61C9 21 06 00      [10]  116 	ld	hl, #0x0006
   61CC 19            [11]  117 	add	hl, de
   61CD 36 00         [10]  118 	ld	(hl), #0x00
                            119 ;src/balls.c:21: for (u8 i = 0; i < MAX_BALLS; i++)
   61CF 0C            [ 4]  120 	inc	c
   61D0 18 C4         [12]  121 	jr	00103$
   61D2                     122 00101$:
                            123 ;src/balls.c:31: balls[0].active = 1;
   61D2 21 71 6D      [10]  124 	ld	hl, #_balls
   61D5 36 01         [10]  125 	ld	(hl), #0x01
                            126 ;src/balls.c:34: center_ball(balls);
   61D7 E5            [11]  127 	push	hl
   61D8 CD D1 62      [17]  128 	call	_center_ball
   61DB F1            [10]  129 	pop	af
   61DC C9            [10]  130 	ret
                            131 ;src/balls.c:37: void balls_update()
                            132 ;	---------------------------------
                            133 ; Function balls_update
                            134 ; ---------------------------------
   61DD                     135 _balls_update::
                            136 ;src/balls.c:39: Ball *ball = balls;
   61DD 01 71 6D      [10]  137 	ld	bc, #_balls+0
                            138 ;src/balls.c:40: if (serving)
   61E0 3A 86 6D      [13]  139 	ld	a,(#_serving + 0)
   61E3 B7            [ 4]  140 	or	a, a
   61E4 28 2D         [12]  141 	jr	Z,00115$
                            142 ;src/balls.c:42: center_ball(ball);
   61E6 C5            [11]  143 	push	bc
   61E7 C5            [11]  144 	push	bc
   61E8 CD D1 62      [17]  145 	call	_center_ball
   61EB F1            [10]  146 	pop	af
   61EC C1            [10]  147 	pop	bc
                            148 ;src/balls.c:43: if (key_serve_is_pressed)
   61ED 3A 96 6D      [13]  149 	ld	a,(#_key_serve_is_pressed + 0)
   61F0 B7            [ 4]  150 	or	a, a
   61F1 C8            [11]  151 	ret	Z
                            152 ;src/balls.c:45: serving = 0;
   61F2 21 86 6D      [10]  153 	ld	hl,#_serving + 0
   61F5 36 00         [10]  154 	ld	(hl), #0x00
                            155 ;src/balls.c:46: ball->dx = 1; // 45 degrees right
   61F7 21 76 6D      [10]  156 	ld	hl, #(_balls + 0x0005)
   61FA 36 01         [10]  157 	ld	(hl), #0x01
                            158 ;src/balls.c:47: ball->dy = -2;
   61FC 21 77 6D      [10]  159 	ld	hl, #(_balls + 0x0006)
   61FF 36 FE         [10]  160 	ld	(hl), #0xfe
                            161 ;src/balls.c:48: ball->prev_x = ball->x;
   6201 69            [ 4]  162 	ld	l, c
   6202 60            [ 4]  163 	ld	h, b
   6203 23            [ 6]  164 	inc	hl
   6204 5E            [ 7]  165 	ld	e, (hl)
   6205 21 74 6D      [10]  166 	ld	hl, #(_balls + 0x0003)
   6208 73            [ 7]  167 	ld	(hl), e
                            168 ;src/balls.c:49: ball->prev_y = ball->y;
   6209 69            [ 4]  169 	ld	l, c
   620A 60            [ 4]  170 	ld	h, b
   620B 23            [ 6]  171 	inc	hl
   620C 23            [ 6]  172 	inc	hl
   620D 4E            [ 7]  173 	ld	c, (hl)
   620E 21 75 6D      [10]  174 	ld	hl, #(_balls + 0x0004)
   6211 71            [ 7]  175 	ld	(hl), c
   6212 C9            [10]  176 	ret
                            177 ;src/balls.c:54: for (u8 i = 0; i < MAX_BALLS; i++)
   6213                     178 00115$:
   6213 1E 00         [ 7]  179 	ld	e, #0x00
   6215                     180 00108$:
   6215 7B            [ 4]  181 	ld	a, e
   6216 D6 03         [ 7]  182 	sub	a, #0x03
   6218 D0            [11]  183 	ret	NC
                            184 ;src/balls.c:56: update_ball(ball);
   6219 C5            [11]  185 	push	bc
   621A D5            [11]  186 	push	de
   621B C5            [11]  187 	push	bc
   621C CD 14 63      [17]  188 	call	_update_ball
   621F F1            [10]  189 	pop	af
   6220 D1            [10]  190 	pop	de
   6221 C1            [10]  191 	pop	bc
                            192 ;src/balls.c:57: ball++;
   6222 21 07 00      [10]  193 	ld	hl, #0x0007
   6225 09            [11]  194 	add	hl,bc
   6226 4D            [ 4]  195 	ld	c, l
   6227 44            [ 4]  196 	ld	b, h
                            197 ;src/balls.c:54: for (u8 i = 0; i < MAX_BALLS; i++)
   6228 1C            [ 4]  198 	inc	e
   6229 18 EA         [12]  199 	jr	00108$
                            200 ;src/balls.c:62: void balls_restore_background()
                            201 ;	---------------------------------
                            202 ; Function balls_restore_background
                            203 ; ---------------------------------
   622B                     204 _balls_restore_background::
   622B DD E5         [15]  205 	push	ix
   622D DD 21 00 00   [14]  206 	ld	ix,#0
   6231 DD 39         [15]  207 	add	ix,sp
   6233 3B            [ 6]  208 	dec	sp
                            209 ;src/balls.c:64: Ball *ball = balls;
   6234 01 71 6D      [10]  210 	ld	bc, #_balls
                            211 ;src/balls.c:65: for (u8 i = 0; i < MAX_BALLS; i++)
   6237 DD 36 FF 00   [19]  212 	ld	-1 (ix), #0x00
   623B                     213 00105$:
   623B DD 7E FF      [19]  214 	ld	a, -1 (ix)
   623E D6 03         [ 7]  215 	sub	a, #0x03
   6240 30 29         [12]  216 	jr	NC,00107$
                            217 ;src/balls.c:67: if (ball->active)
   6242 0A            [ 7]  218 	ld	a, (bc)
   6243 B7            [ 4]  219 	or	a, a
   6244 28 1A         [12]  220 	jr	Z,00102$
                            221 ;src/balls.c:69: background_restore(ball->prev_x, balls->prev_y, SP_BALL_W, SP_BALL_H);
   6246 21 75 6D      [10]  222 	ld	hl, #_balls + 4
   6249 5E            [ 7]  223 	ld	e, (hl)
   624A 69            [ 4]  224 	ld	l, c
   624B 60            [ 4]  225 	ld	h, b
   624C 23            [ 6]  226 	inc	hl
   624D 23            [ 6]  227 	inc	hl
   624E 23            [ 6]  228 	inc	hl
   624F 56            [ 7]  229 	ld	d, (hl)
   6250 C5            [11]  230 	push	bc
   6251 21 03 06      [10]  231 	ld	hl, #0x0603
   6254 E5            [11]  232 	push	hl
   6255 7B            [ 4]  233 	ld	a, e
   6256 F5            [11]  234 	push	af
   6257 33            [ 6]  235 	inc	sp
   6258 D5            [11]  236 	push	de
   6259 33            [ 6]  237 	inc	sp
   625A CD FD 60      [17]  238 	call	_background_restore
   625D F1            [10]  239 	pop	af
   625E F1            [10]  240 	pop	af
   625F C1            [10]  241 	pop	bc
   6260                     242 00102$:
                            243 ;src/balls.c:71: ball++;
   6260 21 07 00      [10]  244 	ld	hl, #0x0007
   6263 09            [11]  245 	add	hl,bc
   6264 4D            [ 4]  246 	ld	c, l
   6265 44            [ 4]  247 	ld	b, h
                            248 ;src/balls.c:65: for (u8 i = 0; i < MAX_BALLS; i++)
   6266 DD 34 FF      [23]  249 	inc	-1 (ix)
   6269 18 D0         [12]  250 	jr	00105$
   626B                     251 00107$:
   626B 33            [ 6]  252 	inc	sp
   626C DD E1         [14]  253 	pop	ix
   626E C9            [10]  254 	ret
                            255 ;src/balls.c:75: void balls_draw()
                            256 ;	---------------------------------
                            257 ; Function balls_draw
                            258 ; ---------------------------------
   626F                     259 _balls_draw::
                            260 ;src/balls.c:79: for (u8 i = 0; i < MAX_BALLS; i++)
   626F 0E 00         [ 7]  261 	ld	c, #0x00
   6271                     262 00105$:
   6271 79            [ 4]  263 	ld	a, c
   6272 D6 03         [ 7]  264 	sub	a, #0x03
   6274 D0            [11]  265 	ret	NC
                            266 ;src/balls.c:81: if (balls->active)
   6275 3A 71 6D      [13]  267 	ld	a, (#_balls + 0)
   6278 B7            [ 4]  268 	or	a, a
   6279 28 1F         [12]  269 	jr	Z,00106$
                            270 ;src/balls.c:83: svmem = cpct_getScreenPtr(CPCT_VMEM_START, balls->x, balls->y);
   627B 21 73 6D      [10]  271 	ld	hl, #_balls + 2
   627E 46            [ 7]  272 	ld	b, (hl)
   627F 21 72 6D      [10]  273 	ld	hl, #_balls + 1
   6282 56            [ 7]  274 	ld	d, (hl)
   6283 C5            [11]  275 	push	bc
   6284 4A            [ 4]  276 	ld	c, d
   6285 C5            [11]  277 	push	bc
   6286 21 00 C0      [10]  278 	ld	hl, #0xc000
   6289 E5            [11]  279 	push	hl
   628A CD BF 6C      [17]  280 	call	_cpct_getScreenPtr
   628D 11 03 06      [10]  281 	ld	de, #0x0603
   6290 D5            [11]  282 	push	de
   6291 E5            [11]  283 	push	hl
   6292 21 1D 60      [10]  284 	ld	hl, #_sp_ball
   6295 E5            [11]  285 	push	hl
   6296 CD 50 6A      [17]  286 	call	_cpct_drawSprite
   6299 C1            [10]  287 	pop	bc
   629A                     288 00106$:
                            289 ;src/balls.c:79: for (u8 i = 0; i < MAX_BALLS; i++)
   629A 0C            [ 4]  290 	inc	c
   629B 18 D4         [12]  291 	jr	00105$
                            292 ;src/balls.c:89: Ball *balls_get_first_active()
                            293 ;	---------------------------------
                            294 ; Function balls_get_first_active
                            295 ; ---------------------------------
   629D                     296 _balls_get_first_active::
   629D DD E5         [15]  297 	push	ix
   629F DD 21 00 00   [14]  298 	ld	ix,#0
   62A3 DD 39         [15]  299 	add	ix,sp
   62A5 F5            [11]  300 	push	af
                            301 ;src/balls.c:91: Ball *ball = balls;
   62A6 DD 36 FE 71   [19]  302 	ld	-2 (ix), #<(_balls)
   62AA DD 36 FF 6D   [19]  303 	ld	-1 (ix), #>(_balls)
                            304 ;src/balls.c:92: for (u8 i = 0; i < MAX_BALLS; i++)
   62AE E1            [10]  305 	pop	hl
   62AF E5            [11]  306 	push	hl
   62B0 0E 00         [ 7]  307 	ld	c, #0x00
   62B2                     308 00105$:
   62B2 79            [ 4]  309 	ld	a, c
   62B3 D6 03         [ 7]  310 	sub	a, #0x03
   62B5 30 12         [12]  311 	jr	NC,00103$
                            312 ;src/balls.c:94: if (ball->active)
   62B7 7E            [ 7]  313 	ld	a, (hl)
   62B8 B7            [ 4]  314 	or	a, a
   62B9 28 04         [12]  315 	jr	Z,00102$
                            316 ;src/balls.c:96: return ball;
   62BB E1            [10]  317 	pop	hl
   62BC E5            [11]  318 	push	hl
   62BD 18 0D         [12]  319 	jr	00107$
   62BF                     320 00102$:
                            321 ;src/balls.c:98: ball++;
   62BF 11 07 00      [10]  322 	ld	de, #0x0007
   62C2 19            [11]  323 	add	hl, de
   62C3 33            [ 6]  324 	inc	sp
   62C4 33            [ 6]  325 	inc	sp
   62C5 E5            [11]  326 	push	hl
                            327 ;src/balls.c:92: for (u8 i = 0; i < MAX_BALLS; i++)
   62C6 0C            [ 4]  328 	inc	c
   62C7 18 E9         [12]  329 	jr	00105$
   62C9                     330 00103$:
                            331 ;src/balls.c:100: return NULL;
   62C9 21 00 00      [10]  332 	ld	hl, #0x0000
   62CC                     333 00107$:
   62CC DD F9         [10]  334 	ld	sp, ix
   62CE DD E1         [14]  335 	pop	ix
   62D0 C9            [10]  336 	ret
                            337 ;src/balls.c:106: void center_ball(Ball *ball)
                            338 ;	---------------------------------
                            339 ; Function center_ball
                            340 ; ---------------------------------
   62D1                     341 _center_ball::
   62D1 DD E5         [15]  342 	push	ix
   62D3 DD 21 00 00   [14]  343 	ld	ix,#0
   62D7 DD 39         [15]  344 	add	ix,sp
                            345 ;src/balls.c:108: ball->prev_x = ball->x;
   62D9 DD 4E 04      [19]  346 	ld	c,4 (ix)
   62DC DD 46 05      [19]  347 	ld	b,5 (ix)
   62DF C5            [11]  348 	push	bc
   62E0 FD E1         [14]  349 	pop	iy
   62E2 FD 23         [10]  350 	inc	iy
   62E4 FD 23         [10]  351 	inc	iy
   62E6 FD 23         [10]  352 	inc	iy
   62E8 59            [ 4]  353 	ld	e, c
   62E9 50            [ 4]  354 	ld	d, b
   62EA 13            [ 6]  355 	inc	de
   62EB 1A            [ 7]  356 	ld	a, (de)
   62EC FD 77 00      [19]  357 	ld	0 (iy), a
                            358 ;src/balls.c:109: ball->prev_y = ball->y;
   62EF FD 21 04 00   [14]  359 	ld	iy, #0x0004
   62F3 FD 09         [15]  360 	add	iy, bc
   62F5 03            [ 6]  361 	inc	bc
   62F6 03            [ 6]  362 	inc	bc
   62F7 0A            [ 7]  363 	ld	a, (bc)
   62F8 FD 77 00      [19]  364 	ld	0 (iy), a
                            365 ;src/balls.c:110: ball->x = batX + (batW / 4);
   62FB FD 21 A4 6D   [14]  366 	ld	iy, #_batW
   62FF FD 6E 00      [19]  367 	ld	l, 0 (iy)
   6302 CB 3D         [ 8]  368 	srl	l
   6304 CB 3D         [ 8]  369 	srl	l
   6306 3A A2 6D      [13]  370 	ld	a,(#_batX + 0)
   6309 85            [ 4]  371 	add	a, l
   630A 12            [ 7]  372 	ld	(de), a
                            373 ;src/balls.c:111: ball->y = batY - SP_BALL_H;
   630B 3A A1 6D      [13]  374 	ld	a,(#_batY + 0)
   630E C6 FA         [ 7]  375 	add	a, #0xfa
   6310 02            [ 7]  376 	ld	(bc), a
   6311 DD E1         [14]  377 	pop	ix
   6313 C9            [10]  378 	ret
                            379 ;src/balls.c:114: void update_ball(Ball *ball)
                            380 ;	---------------------------------
                            381 ; Function update_ball
                            382 ; ---------------------------------
   6314                     383 _update_ball::
   6314 DD E5         [15]  384 	push	ix
   6316 DD 21 00 00   [14]  385 	ld	ix,#0
   631A DD 39         [15]  386 	add	ix,sp
                            387 ;src/balls.c:116: ball->prev_x = ball->x;
   631C DD 4E 04      [19]  388 	ld	c,4 (ix)
   631F DD 46 05      [19]  389 	ld	b,5 (ix)
   6322 59            [ 4]  390 	ld	e, c
   6323 50            [ 4]  391 	ld	d, b
   6324 13            [ 6]  392 	inc	de
   6325 13            [ 6]  393 	inc	de
   6326 13            [ 6]  394 	inc	de
   6327 69            [ 4]  395 	ld	l, c
   6328 60            [ 4]  396 	ld	h, b
   6329 23            [ 6]  397 	inc	hl
   632A 7E            [ 7]  398 	ld	a, (hl)
   632B 12            [ 7]  399 	ld	(de), a
                            400 ;src/balls.c:117: ball->prev_y = ball->y;
   632C 21 04 00      [10]  401 	ld	hl, #0x0004
   632F 09            [11]  402 	add	hl,bc
   6330 EB            [ 4]  403 	ex	de,hl
   6331 69            [ 4]  404 	ld	l, c
   6332 60            [ 4]  405 	ld	h, b
   6333 23            [ 6]  406 	inc	hl
   6334 23            [ 6]  407 	inc	hl
   6335 7E            [ 7]  408 	ld	a, (hl)
   6336 12            [ 7]  409 	ld	(de), a
                            410 ;src/balls.c:118: move_ball_x(ball);
   6337 C5            [11]  411 	push	bc
   6338 CD 4A 63      [17]  412 	call	_move_ball_x
   633B F1            [10]  413 	pop	af
                            414 ;src/balls.c:119: move_ball_y(ball);
   633C DD 6E 04      [19]  415 	ld	l,4 (ix)
   633F DD 66 05      [19]  416 	ld	h,5 (ix)
   6342 E5            [11]  417 	push	hl
   6343 CD 9F 63      [17]  418 	call	_move_ball_y
   6346 F1            [10]  419 	pop	af
   6347 DD E1         [14]  420 	pop	ix
   6349 C9            [10]  421 	ret
                            422 ;src/balls.c:123: void move_ball_x(Ball *ball)
                            423 ;	---------------------------------
                            424 ; Function move_ball_x
                            425 ; ---------------------------------
   634A                     426 _move_ball_x::
   634A DD E5         [15]  427 	push	ix
   634C DD 21 00 00   [14]  428 	ld	ix,#0
   6350 DD 39         [15]  429 	add	ix,sp
                            430 ;src/balls.c:125: if (ball->active)
   6352 DD 5E 04      [19]  431 	ld	e,4 (ix)
   6355 DD 56 05      [19]  432 	ld	d,5 (ix)
   6358 1A            [ 7]  433 	ld	a, (de)
   6359 B7            [ 4]  434 	or	a, a
   635A 28 40         [12]  435 	jr	Z,00112$
                            436 ;src/balls.c:127: u8 new_x = ball->x + ball->dx;
   635C D5            [11]  437 	push	de
   635D FD E1         [14]  438 	pop	iy
   635F FD 23         [10]  439 	inc	iy
   6361 FD 4E 00      [19]  440 	ld	c, 0 (iy)
   6364 21 05 00      [10]  441 	ld	hl, #0x0005
   6367 19            [11]  442 	add	hl, de
   6368 5E            [ 7]  443 	ld	e, (hl)
   6369 79            [ 4]  444 	ld	a, c
   636A 83            [ 4]  445 	add	a, e
   636B 4F            [ 4]  446 	ld	c, a
                            447 ;src/balls.c:130: if (ball->dx > 0)
   636C AF            [ 4]  448 	xor	a, a
   636D 93            [ 4]  449 	sub	a, e
   636E E2 73 63      [10]  450 	jp	PO, 00130$
   6371 EE 80         [ 7]  451 	xor	a, #0x80
   6373                     452 00130$:
   6373 F2 8A 63      [10]  453 	jp	P, 00108$
                            454 ;src/balls.c:133: if (new_x >= PLAY_AREA_RIGHT_EDGE - SP_BALL_W)
   6376 79            [ 4]  455 	ld	a, c
   6377 D6 3D         [ 7]  456 	sub	a, #0x3d
   6379 38 0A         [12]  457 	jr	C,00102$
                            458 ;src/balls.c:135: ball->x = PLAY_AREA_RIGHT_EDGE - SP_BALL_W;
   637B FD 36 00 3D   [19]  459 	ld	0 (iy), #0x3d
                            460 ;src/balls.c:136: ball->dx = -ball->dx;
   637F 4E            [ 7]  461 	ld	c, (hl)
   6380 AF            [ 4]  462 	xor	a, a
   6381 91            [ 4]  463 	sub	a, c
   6382 77            [ 7]  464 	ld	(hl), a
   6383 18 17         [12]  465 	jr	00112$
   6385                     466 00102$:
                            467 ;src/balls.c:140: ball->x = new_x;
   6385 FD 71 00      [19]  468 	ld	0 (iy), c
   6388 18 12         [12]  469 	jr	00112$
   638A                     470 00108$:
                            471 ;src/balls.c:147: if (new_x <= PLAY_AREA_LEFT_EDGE)
   638A 3E 0C         [ 7]  472 	ld	a, #0x0c
   638C 91            [ 4]  473 	sub	a, c
   638D 38 0A         [12]  474 	jr	C,00105$
                            475 ;src/balls.c:149: ball->x = PLAY_AREA_LEFT_EDGE;
   638F FD 36 00 0C   [19]  476 	ld	0 (iy), #0x0c
                            477 ;src/balls.c:150: ball->dx = -ball->dx;
   6393 4E            [ 7]  478 	ld	c, (hl)
   6394 AF            [ 4]  479 	xor	a, a
   6395 91            [ 4]  480 	sub	a, c
   6396 77            [ 7]  481 	ld	(hl), a
   6397 18 03         [12]  482 	jr	00112$
   6399                     483 00105$:
                            484 ;src/balls.c:154: ball->x = new_x;
   6399 FD 71 00      [19]  485 	ld	0 (iy), c
   639C                     486 00112$:
   639C DD E1         [14]  487 	pop	ix
   639E C9            [10]  488 	ret
                            489 ;src/balls.c:162: void move_ball_y(Ball * ball)
                            490 ;	---------------------------------
                            491 ; Function move_ball_y
                            492 ; ---------------------------------
   639F                     493 _move_ball_y::
   639F DD E5         [15]  494 	push	ix
   63A1 DD 21 00 00   [14]  495 	ld	ix,#0
   63A5 DD 39         [15]  496 	add	ix,sp
   63A7 F5            [11]  497 	push	af
                            498 ;src/balls.c:165: u8 new_y = ball->y + ball->dy;
   63A8 DD 4E 04      [19]  499 	ld	c,4 (ix)
   63AB DD 46 05      [19]  500 	ld	b,5 (ix)
   63AE 59            [ 4]  501 	ld	e, c
   63AF 50            [ 4]  502 	ld	d, b
   63B0 13            [ 6]  503 	inc	de
   63B1 13            [ 6]  504 	inc	de
   63B2 1A            [ 7]  505 	ld	a, (de)
   63B3 DD 77 FF      [19]  506 	ld	-1 (ix), a
   63B6 FD 21 06 00   [14]  507 	ld	iy, #0x0006
   63BA FD 09         [15]  508 	add	iy, bc
   63BC FD 6E 00      [19]  509 	ld	l, 0 (iy)
   63BF DD 7E FF      [19]  510 	ld	a, -1 (ix)
   63C2 85            [ 4]  511 	add	a, l
   63C3 DD 77 FE      [19]  512 	ld	-2 (ix), a
                            513 ;src/balls.c:168: if (ball->dy < 0)
   63C6 CB 7D         [ 8]  514 	bit	7, l
   63C8 28 1A         [12]  515 	jr	Z,00108$
                            516 ;src/balls.c:170: if (new_y <= PLAY_AREA_TOP_EDGE)
   63CA 3E 08         [ 7]  517 	ld	a, #0x08
   63CC DD 96 FE      [19]  518 	sub	a, -2 (ix)
   63CF 38 0D         [12]  519 	jr	C,00102$
                            520 ;src/balls.c:172: ball->y = PLAY_AREA_TOP_EDGE;
   63D1 3E 08         [ 7]  521 	ld	a, #0x08
   63D3 12            [ 7]  522 	ld	(de), a
                            523 ;src/balls.c:173: ball->dy = -ball->dy;
   63D4 FD 4E 00      [19]  524 	ld	c, 0 (iy)
   63D7 AF            [ 4]  525 	xor	a, a
   63D8 91            [ 4]  526 	sub	a, c
   63D9 FD 77 00      [19]  527 	ld	0 (iy), a
   63DC 18 26         [12]  528 	jr	00109$
   63DE                     529 00102$:
                            530 ;src/balls.c:177: ball->y = new_y;
   63DE DD 7E FE      [19]  531 	ld	a, -2 (ix)
   63E1 12            [ 7]  532 	ld	(de), a
   63E2 18 20         [12]  533 	jr	00109$
   63E4                     534 00108$:
                            535 ;src/balls.c:184: if (new_y >= YOUR_DEAD_PIXEL_ROW)
   63E4 DD 7E FE      [19]  536 	ld	a, -2 (ix)
   63E7 D6 C2         [ 7]  537 	sub	a, #0xc2
   63E9 38 0C         [12]  538 	jr	C,00105$
                            539 ;src/balls.c:187: ball->active = 0;
   63EB AF            [ 4]  540 	xor	a, a
   63EC 02            [ 7]  541 	ld	(bc), a
                            542 ;src/balls.c:188: ball->dy = -ball->dy;
   63ED FD 4E 00      [19]  543 	ld	c, 0 (iy)
   63F0 AF            [ 4]  544 	xor	a, a
   63F1 91            [ 4]  545 	sub	a, c
   63F2 FD 77 00      [19]  546 	ld	0 (iy), a
   63F5 18 0D         [12]  547 	jr	00109$
   63F7                     548 00105$:
                            549 ;src/balls.c:193: check_bat_collision(ball, new_y);
   63F7 D5            [11]  550 	push	de
   63F8 DD 7E FE      [19]  551 	ld	a, -2 (ix)
   63FB F5            [11]  552 	push	af
   63FC 33            [ 6]  553 	inc	sp
   63FD C5            [11]  554 	push	bc
   63FE CD 0D 64      [17]  555 	call	_check_bat_collision
   6401 F1            [10]  556 	pop	af
   6402 33            [ 6]  557 	inc	sp
   6403 D1            [10]  558 	pop	de
   6404                     559 00109$:
                            560 ;src/balls.c:196: ball->y = new_y;
   6404 DD 7E FE      [19]  561 	ld	a, -2 (ix)
   6407 12            [ 7]  562 	ld	(de), a
   6408 DD F9         [10]  563 	ld	sp, ix
   640A DD E1         [14]  564 	pop	ix
   640C C9            [10]  565 	ret
                            566 ;src/balls.c:199: void check_bat_collision(Ball * ball, u8 new_y)
                            567 ;	---------------------------------
                            568 ; Function check_bat_collision
                            569 ; ---------------------------------
   640D                     570 _check_bat_collision::
   640D DD E5         [15]  571 	push	ix
   640F DD 21 00 00   [14]  572 	ld	ix,#0
   6413 DD 39         [15]  573 	add	ix,sp
   6415 F5            [11]  574 	push	af
   6416 F5            [11]  575 	push	af
                            576 ;src/balls.c:201: if ((ball->x + SP_BALL_W >= batX && ball->x <= batX+batW) && 
   6417 DD 7E 04      [19]  577 	ld	a, 4 (ix)
   641A DD 77 FE      [19]  578 	ld	-2 (ix), a
   641D DD 7E 05      [19]  579 	ld	a, 5 (ix)
   6420 DD 77 FF      [19]  580 	ld	-1 (ix), a
   6423 C1            [10]  581 	pop	bc
   6424 E1            [10]  582 	pop	hl
   6425 E5            [11]  583 	push	hl
   6426 C5            [11]  584 	push	bc
   6427 23            [ 6]  585 	inc	hl
   6428 4E            [ 7]  586 	ld	c, (hl)
   6429 06 00         [ 7]  587 	ld	b, #0x00
   642B 21 03 00      [10]  588 	ld	hl, #0x0003
   642E 09            [11]  589 	add	hl,bc
   642F E3            [19]  590 	ex	(sp), hl
   6430 21 A2 6D      [10]  591 	ld	hl,#_batX + 0
   6433 5E            [ 7]  592 	ld	e, (hl)
   6434 16 00         [ 7]  593 	ld	d, #0x00
   6436 DD 7E FC      [19]  594 	ld	a, -4 (ix)
   6439 93            [ 4]  595 	sub	a, e
   643A DD 7E FD      [19]  596 	ld	a, -3 (ix)
   643D 9A            [ 4]  597 	sbc	a, d
   643E E2 43 64      [10]  598 	jp	PO, 00124$
   6441 EE 80         [ 7]  599 	xor	a, #0x80
   6443                     600 00124$:
   6443 FA 9F 64      [10]  601 	jp	M, 00106$
   6446 FD 21 A4 6D   [14]  602 	ld	iy, #_batW
   644A FD 6E 00      [19]  603 	ld	l, 0 (iy)
   644D 26 00         [ 7]  604 	ld	h, #0x00
   644F 19            [11]  605 	add	hl, de
   6450 7D            [ 4]  606 	ld	a, l
   6451 91            [ 4]  607 	sub	a, c
   6452 7C            [ 4]  608 	ld	a, h
   6453 98            [ 4]  609 	sbc	a, b
   6454 E2 59 64      [10]  610 	jp	PO, 00125$
   6457 EE 80         [ 7]  611 	xor	a, #0x80
   6459                     612 00125$:
   6459 FA 9F 64      [10]  613 	jp	M, 00106$
                            614 ;src/balls.c:202: (ball->y + SP_BALL_H >= batY && ball->y < batY + SP_BAT_LEFT_H))
   645C C1            [10]  615 	pop	bc
   645D E1            [10]  616 	pop	hl
   645E E5            [11]  617 	push	hl
   645F C5            [11]  618 	push	bc
   6460 23            [ 6]  619 	inc	hl
   6461 23            [ 6]  620 	inc	hl
   6462 4E            [ 7]  621 	ld	c, (hl)
   6463 06 00         [ 7]  622 	ld	b, #0x00
   6465 21 06 00      [10]  623 	ld	hl, #0x0006
   6468 09            [11]  624 	add	hl,bc
   6469 EB            [ 4]  625 	ex	de,hl
   646A FD 21 A1 6D   [14]  626 	ld	iy, #_batY
   646E FD 6E 00      [19]  627 	ld	l, 0 (iy)
   6471 26 00         [ 7]  628 	ld	h, #0x00
   6473 7B            [ 4]  629 	ld	a, e
   6474 95            [ 4]  630 	sub	a, l
   6475 7A            [ 4]  631 	ld	a, d
   6476 9C            [ 4]  632 	sbc	a, h
   6477 E2 7C 64      [10]  633 	jp	PO, 00126$
   647A EE 80         [ 7]  634 	xor	a, #0x80
   647C                     635 00126$:
   647C FA 9F 64      [10]  636 	jp	M, 00106$
   647F 11 08 00      [10]  637 	ld	de, #0x0008
   6482 19            [11]  638 	add	hl, de
   6483 79            [ 4]  639 	ld	a, c
   6484 95            [ 4]  640 	sub	a, l
   6485 78            [ 4]  641 	ld	a, b
   6486 9C            [ 4]  642 	sbc	a, h
   6487 E2 8C 64      [10]  643 	jp	PO, 00127$
   648A EE 80         [ 7]  644 	xor	a, #0x80
   648C                     645 00127$:
   648C F2 9F 64      [10]  646 	jp	P, 00106$
                            647 ;src/balls.c:204: ball-> dy = - ball->dy;
   648F DD 7E FE      [19]  648 	ld	a, -2 (ix)
   6492 C6 06         [ 7]  649 	add	a, #0x06
   6494 6F            [ 4]  650 	ld	l, a
   6495 DD 7E FF      [19]  651 	ld	a, -1 (ix)
   6498 CE 00         [ 7]  652 	adc	a, #0x00
   649A 67            [ 4]  653 	ld	h, a
   649B 4E            [ 7]  654 	ld	c, (hl)
   649C AF            [ 4]  655 	xor	a, a
   649D 91            [ 4]  656 	sub	a, c
   649E 77            [ 7]  657 	ld	(hl), a
   649F                     658 00106$:
   649F DD F9         [10]  659 	ld	sp, ix
   64A1 DD E1         [14]  660 	pop	ix
   64A3 C9            [10]  661 	ret
                            662 	.area _CODE
                            663 	.area _INITIALIZER
                            664 	.area _CABS (ABS)
