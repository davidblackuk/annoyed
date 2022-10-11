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
                             12 	.globl _blocks_intersect_ball
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _cpct_drawSprite
                             15 	.globl _serving
                             16 	.globl _balls
                             17 	.globl _balls_initialize
                             18 	.globl _balls_update
                             19 	.globl _balls_restore_background
                             20 	.globl _balls_draw
                             21 	.globl _balls_get_first_active
                             22 	.globl _center_ball
                             23 	.globl _update_ball
                             24 	.globl _move_ball_x
                             25 	.globl _move_ball_y
                             26 	.globl _check_bat_collision
                             27 ;--------------------------------------------------------
                             28 ; special function registers
                             29 ;--------------------------------------------------------
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _DATA
   72C1                      34 _balls::
   72C1                      35 	.ds 21
   72D6                      36 _serving::
   72D6                      37 	.ds 1
                             38 ;--------------------------------------------------------
                             39 ; ram data
                             40 ;--------------------------------------------------------
                             41 	.area _INITIALIZED
                             42 ;--------------------------------------------------------
                             43 ; absolute external ram data
                             44 ;--------------------------------------------------------
                             45 	.area _DABS (ABS)
                             46 ;--------------------------------------------------------
                             47 ; global & static initialisations
                             48 ;--------------------------------------------------------
                             49 	.area _HOME
                             50 	.area _GSINIT
                             51 	.area _GSFINAL
                             52 	.area _GSINIT
                             53 ;--------------------------------------------------------
                             54 ; Home
                             55 ;--------------------------------------------------------
                             56 	.area _HOME
                             57 	.area _HOME
                             58 ;--------------------------------------------------------
                             59 ; code
                             60 ;--------------------------------------------------------
                             61 	.area _CODE
                             62 ;src/balls.c:16: void balls_initialize()
                             63 ;	---------------------------------
                             64 ; Function balls_initialize
                             65 ; ---------------------------------
   61F9                      66 _balls_initialize::
                             67 ;src/balls.c:19: serving = 1;
   61F9 21 D6 72      [10]   68 	ld	hl,#_serving + 0
   61FC 36 01         [10]   69 	ld	(hl), #0x01
                             70 ;src/balls.c:22: for (u8 i = 0; i < MAX_BALLS; i++)
   61FE 0E 00         [ 7]   71 	ld	c, #0x00
   6200                      72 00103$:
   6200 79            [ 4]   73 	ld	a, c
   6201 D6 03         [ 7]   74 	sub	a, #0x03
   6203 30 37         [12]   75 	jr	NC,00101$
                             76 ;src/balls.c:24: balls[i].active = 0;
   6205 06 00         [ 7]   77 	ld	b,#0x00
   6207 69            [ 4]   78 	ld	l, c
   6208 60            [ 4]   79 	ld	h, b
   6209 29            [11]   80 	add	hl, hl
   620A 09            [11]   81 	add	hl, bc
   620B 29            [11]   82 	add	hl, hl
   620C 09            [11]   83 	add	hl, bc
   620D EB            [ 4]   84 	ex	de,hl
   620E 21 C1 72      [10]   85 	ld	hl, #_balls
   6211 19            [11]   86 	add	hl,de
   6212 EB            [ 4]   87 	ex	de,hl
   6213 AF            [ 4]   88 	xor	a, a
   6214 12            [ 7]   89 	ld	(de), a
                             90 ;src/balls.c:25: balls[i].x = TILE_MAP_SCREEN_BYTE_OFFSET_X;
   6215 6B            [ 4]   91 	ld	l, e
   6216 62            [ 4]   92 	ld	h, d
   6217 23            [ 6]   93 	inc	hl
   6218 36 08         [10]   94 	ld	(hl), #0x08
                             95 ;src/balls.c:26: balls[i].y = TILE_MAP_SCREEN_PIXEL_OFFSET_Y;
   621A 6B            [ 4]   96 	ld	l, e
   621B 62            [ 4]   97 	ld	h, d
   621C 23            [ 6]   98 	inc	hl
   621D 23            [ 6]   99 	inc	hl
   621E 36 00         [10]  100 	ld	(hl), #0x00
                            101 ;src/balls.c:27: balls[i].prev_x = TILE_MAP_SCREEN_BYTE_OFFSET_X;
   6220 6B            [ 4]  102 	ld	l, e
   6221 62            [ 4]  103 	ld	h, d
   6222 23            [ 6]  104 	inc	hl
   6223 23            [ 6]  105 	inc	hl
   6224 23            [ 6]  106 	inc	hl
   6225 36 08         [10]  107 	ld	(hl), #0x08
                            108 ;src/balls.c:28: balls[i].prev_y = TILE_MAP_SCREEN_PIXEL_OFFSET_Y;
   6227 21 04 00      [10]  109 	ld	hl, #0x0004
   622A 19            [11]  110 	add	hl, de
   622B 36 00         [10]  111 	ld	(hl), #0x00
                            112 ;src/balls.c:29: balls[i].dx = 1;
   622D 21 05 00      [10]  113 	ld	hl, #0x0005
   6230 19            [11]  114 	add	hl, de
   6231 36 01         [10]  115 	ld	(hl), #0x01
                            116 ;src/balls.c:30: balls[i].dy = 0;
   6233 21 06 00      [10]  117 	ld	hl, #0x0006
   6236 19            [11]  118 	add	hl, de
   6237 36 00         [10]  119 	ld	(hl), #0x00
                            120 ;src/balls.c:22: for (u8 i = 0; i < MAX_BALLS; i++)
   6239 0C            [ 4]  121 	inc	c
   623A 18 C4         [12]  122 	jr	00103$
   623C                     123 00101$:
                            124 ;src/balls.c:32: balls[0].active = 1;
   623C 21 C1 72      [10]  125 	ld	hl, #_balls
   623F 36 01         [10]  126 	ld	(hl), #0x01
                            127 ;src/balls.c:35: center_ball(balls);
   6241 E5            [11]  128 	push	hl
   6242 CD 3B 63      [17]  129 	call	_center_ball
   6245 F1            [10]  130 	pop	af
   6246 C9            [10]  131 	ret
                            132 ;src/balls.c:38: void balls_update()
                            133 ;	---------------------------------
                            134 ; Function balls_update
                            135 ; ---------------------------------
   6247                     136 _balls_update::
                            137 ;src/balls.c:40: Ball *ball = balls;
   6247 01 C1 72      [10]  138 	ld	bc, #_balls+0
                            139 ;src/balls.c:41: if (serving)
   624A 3A D6 72      [13]  140 	ld	a,(#_serving + 0)
   624D B7            [ 4]  141 	or	a, a
   624E 28 2D         [12]  142 	jr	Z,00115$
                            143 ;src/balls.c:43: center_ball(ball);
   6250 C5            [11]  144 	push	bc
   6251 C5            [11]  145 	push	bc
   6252 CD 3B 63      [17]  146 	call	_center_ball
   6255 F1            [10]  147 	pop	af
   6256 C1            [10]  148 	pop	bc
                            149 ;src/balls.c:44: if (key_serve_is_pressed)
   6257 3A C2 75      [13]  150 	ld	a,(#_key_serve_is_pressed + 0)
   625A B7            [ 4]  151 	or	a, a
   625B C8            [11]  152 	ret	Z
                            153 ;src/balls.c:46: serving = 0;
   625C 21 D6 72      [10]  154 	ld	hl,#_serving + 0
   625F 36 00         [10]  155 	ld	(hl), #0x00
                            156 ;src/balls.c:47: ball->dx = 1; // 45 degrees right
   6261 21 C6 72      [10]  157 	ld	hl, #(_balls + 0x0005)
   6264 36 01         [10]  158 	ld	(hl), #0x01
                            159 ;src/balls.c:48: ball->dy = -2;
   6266 21 C7 72      [10]  160 	ld	hl, #(_balls + 0x0006)
   6269 36 FE         [10]  161 	ld	(hl), #0xfe
                            162 ;src/balls.c:49: ball->prev_x = ball->x;
   626B 69            [ 4]  163 	ld	l, c
   626C 60            [ 4]  164 	ld	h, b
   626D 23            [ 6]  165 	inc	hl
   626E 5E            [ 7]  166 	ld	e, (hl)
   626F 21 C4 72      [10]  167 	ld	hl, #(_balls + 0x0003)
   6272 73            [ 7]  168 	ld	(hl), e
                            169 ;src/balls.c:50: ball->prev_y = ball->y;
   6273 69            [ 4]  170 	ld	l, c
   6274 60            [ 4]  171 	ld	h, b
   6275 23            [ 6]  172 	inc	hl
   6276 23            [ 6]  173 	inc	hl
   6277 4E            [ 7]  174 	ld	c, (hl)
   6278 21 C5 72      [10]  175 	ld	hl, #(_balls + 0x0004)
   627B 71            [ 7]  176 	ld	(hl), c
   627C C9            [10]  177 	ret
                            178 ;src/balls.c:55: for (u8 i = 0; i < MAX_BALLS; i++)
   627D                     179 00115$:
   627D 1E 00         [ 7]  180 	ld	e, #0x00
   627F                     181 00108$:
   627F 7B            [ 4]  182 	ld	a, e
   6280 D6 03         [ 7]  183 	sub	a, #0x03
   6282 D0            [11]  184 	ret	NC
                            185 ;src/balls.c:57: update_ball(ball);
   6283 C5            [11]  186 	push	bc
   6284 D5            [11]  187 	push	de
   6285 C5            [11]  188 	push	bc
   6286 CD 7E 63      [17]  189 	call	_update_ball
   6289 F1            [10]  190 	pop	af
   628A D1            [10]  191 	pop	de
   628B C1            [10]  192 	pop	bc
                            193 ;src/balls.c:58: ball++;
   628C 21 07 00      [10]  194 	ld	hl, #0x0007
   628F 09            [11]  195 	add	hl,bc
   6290 4D            [ 4]  196 	ld	c, l
   6291 44            [ 4]  197 	ld	b, h
                            198 ;src/balls.c:55: for (u8 i = 0; i < MAX_BALLS; i++)
   6292 1C            [ 4]  199 	inc	e
   6293 18 EA         [12]  200 	jr	00108$
                            201 ;src/balls.c:63: void balls_restore_background()
                            202 ;	---------------------------------
                            203 ; Function balls_restore_background
                            204 ; ---------------------------------
   6295                     205 _balls_restore_background::
   6295 DD E5         [15]  206 	push	ix
   6297 DD 21 00 00   [14]  207 	ld	ix,#0
   629B DD 39         [15]  208 	add	ix,sp
   629D 3B            [ 6]  209 	dec	sp
                            210 ;src/balls.c:65: Ball *ball = balls;
   629E 01 C1 72      [10]  211 	ld	bc, #_balls
                            212 ;src/balls.c:66: for (u8 i = 0; i < MAX_BALLS; i++)
   62A1 DD 36 FF 00   [19]  213 	ld	-1 (ix), #0x00
   62A5                     214 00105$:
   62A5 DD 7E FF      [19]  215 	ld	a, -1 (ix)
   62A8 D6 03         [ 7]  216 	sub	a, #0x03
   62AA 30 29         [12]  217 	jr	NC,00107$
                            218 ;src/balls.c:68: if (ball->active)
   62AC 0A            [ 7]  219 	ld	a, (bc)
   62AD B7            [ 4]  220 	or	a, a
   62AE 28 1A         [12]  221 	jr	Z,00102$
                            222 ;src/balls.c:70: background_restore(ball->prev_x, balls->prev_y, SP_BALL_W, SP_BALL_H);
   62B0 21 C5 72      [10]  223 	ld	hl, #_balls + 4
   62B3 5E            [ 7]  224 	ld	e, (hl)
   62B4 69            [ 4]  225 	ld	l, c
   62B5 60            [ 4]  226 	ld	h, b
   62B6 23            [ 6]  227 	inc	hl
   62B7 23            [ 6]  228 	inc	hl
   62B8 23            [ 6]  229 	inc	hl
   62B9 56            [ 7]  230 	ld	d, (hl)
   62BA C5            [11]  231 	push	bc
   62BB 21 03 06      [10]  232 	ld	hl, #0x0603
   62BE E5            [11]  233 	push	hl
   62BF 7B            [ 4]  234 	ld	a, e
   62C0 F5            [11]  235 	push	af
   62C1 33            [ 6]  236 	inc	sp
   62C2 D5            [11]  237 	push	de
   62C3 33            [ 6]  238 	inc	sp
   62C4 CD 65 61      [17]  239 	call	_background_restore
   62C7 F1            [10]  240 	pop	af
   62C8 F1            [10]  241 	pop	af
   62C9 C1            [10]  242 	pop	bc
   62CA                     243 00102$:
                            244 ;src/balls.c:72: ball++;
   62CA 21 07 00      [10]  245 	ld	hl, #0x0007
   62CD 09            [11]  246 	add	hl,bc
   62CE 4D            [ 4]  247 	ld	c, l
   62CF 44            [ 4]  248 	ld	b, h
                            249 ;src/balls.c:66: for (u8 i = 0; i < MAX_BALLS; i++)
   62D0 DD 34 FF      [23]  250 	inc	-1 (ix)
   62D3 18 D0         [12]  251 	jr	00105$
   62D5                     252 00107$:
   62D5 33            [ 6]  253 	inc	sp
   62D6 DD E1         [14]  254 	pop	ix
   62D8 C9            [10]  255 	ret
                            256 ;src/balls.c:76: void balls_draw()
                            257 ;	---------------------------------
                            258 ; Function balls_draw
                            259 ; ---------------------------------
   62D9                     260 _balls_draw::
                            261 ;src/balls.c:80: for (u8 i = 0; i < MAX_BALLS; i++)
   62D9 0E 00         [ 7]  262 	ld	c, #0x00
   62DB                     263 00105$:
   62DB 79            [ 4]  264 	ld	a, c
   62DC D6 03         [ 7]  265 	sub	a, #0x03
   62DE D0            [11]  266 	ret	NC
                            267 ;src/balls.c:82: if (balls->active)
   62DF 3A C1 72      [13]  268 	ld	a, (#_balls + 0)
   62E2 B7            [ 4]  269 	or	a, a
   62E3 28 1F         [12]  270 	jr	Z,00106$
                            271 ;src/balls.c:84: svmem = cpct_getScreenPtr(CPCT_VMEM_START, balls->x, balls->y);
   62E5 21 C3 72      [10]  272 	ld	hl, #_balls + 2
   62E8 46            [ 7]  273 	ld	b, (hl)
   62E9 21 C2 72      [10]  274 	ld	hl, #_balls + 1
   62EC 56            [ 7]  275 	ld	d, (hl)
   62ED C5            [11]  276 	push	bc
   62EE 4A            [ 4]  277 	ld	c, d
   62EF C5            [11]  278 	push	bc
   62F0 21 00 C0      [10]  279 	ld	hl, #0xc000
   62F3 E5            [11]  280 	push	hl
   62F4 CD 0F 72      [17]  281 	call	_cpct_getScreenPtr
   62F7 11 03 06      [10]  282 	ld	de, #0x0603
   62FA D5            [11]  283 	push	de
   62FB E5            [11]  284 	push	hl
   62FC 21 1D 60      [10]  285 	ld	hl, #_sp_ball
   62FF E5            [11]  286 	push	hl
   6300 CD F9 6E      [17]  287 	call	_cpct_drawSprite
   6303 C1            [10]  288 	pop	bc
   6304                     289 00106$:
                            290 ;src/balls.c:80: for (u8 i = 0; i < MAX_BALLS; i++)
   6304 0C            [ 4]  291 	inc	c
   6305 18 D4         [12]  292 	jr	00105$
                            293 ;src/balls.c:90: Ball *balls_get_first_active()
                            294 ;	---------------------------------
                            295 ; Function balls_get_first_active
                            296 ; ---------------------------------
   6307                     297 _balls_get_first_active::
   6307 DD E5         [15]  298 	push	ix
   6309 DD 21 00 00   [14]  299 	ld	ix,#0
   630D DD 39         [15]  300 	add	ix,sp
   630F F5            [11]  301 	push	af
                            302 ;src/balls.c:92: Ball *ball = balls;
   6310 DD 36 FE C1   [19]  303 	ld	-2 (ix), #<(_balls)
   6314 DD 36 FF 72   [19]  304 	ld	-1 (ix), #>(_balls)
                            305 ;src/balls.c:93: for (u8 i = 0; i < MAX_BALLS; i++)
   6318 E1            [10]  306 	pop	hl
   6319 E5            [11]  307 	push	hl
   631A 0E 00         [ 7]  308 	ld	c, #0x00
   631C                     309 00105$:
   631C 79            [ 4]  310 	ld	a, c
   631D D6 03         [ 7]  311 	sub	a, #0x03
   631F 30 12         [12]  312 	jr	NC,00103$
                            313 ;src/balls.c:95: if (ball->active)
   6321 7E            [ 7]  314 	ld	a, (hl)
   6322 B7            [ 4]  315 	or	a, a
   6323 28 04         [12]  316 	jr	Z,00102$
                            317 ;src/balls.c:97: return ball;
   6325 E1            [10]  318 	pop	hl
   6326 E5            [11]  319 	push	hl
   6327 18 0D         [12]  320 	jr	00107$
   6329                     321 00102$:
                            322 ;src/balls.c:99: ball++;
   6329 11 07 00      [10]  323 	ld	de, #0x0007
   632C 19            [11]  324 	add	hl, de
   632D 33            [ 6]  325 	inc	sp
   632E 33            [ 6]  326 	inc	sp
   632F E5            [11]  327 	push	hl
                            328 ;src/balls.c:93: for (u8 i = 0; i < MAX_BALLS; i++)
   6330 0C            [ 4]  329 	inc	c
   6331 18 E9         [12]  330 	jr	00105$
   6333                     331 00103$:
                            332 ;src/balls.c:101: return NULL;
   6333 21 00 00      [10]  333 	ld	hl, #0x0000
   6336                     334 00107$:
   6336 DD F9         [10]  335 	ld	sp, ix
   6338 DD E1         [14]  336 	pop	ix
   633A C9            [10]  337 	ret
                            338 ;src/balls.c:107: void center_ball(Ball *ball)
                            339 ;	---------------------------------
                            340 ; Function center_ball
                            341 ; ---------------------------------
   633B                     342 _center_ball::
   633B DD E5         [15]  343 	push	ix
   633D DD 21 00 00   [14]  344 	ld	ix,#0
   6341 DD 39         [15]  345 	add	ix,sp
                            346 ;src/balls.c:109: ball->prev_x = ball->x;
   6343 DD 4E 04      [19]  347 	ld	c,4 (ix)
   6346 DD 46 05      [19]  348 	ld	b,5 (ix)
   6349 C5            [11]  349 	push	bc
   634A FD E1         [14]  350 	pop	iy
   634C FD 23         [10]  351 	inc	iy
   634E FD 23         [10]  352 	inc	iy
   6350 FD 23         [10]  353 	inc	iy
   6352 59            [ 4]  354 	ld	e, c
   6353 50            [ 4]  355 	ld	d, b
   6354 13            [ 6]  356 	inc	de
   6355 1A            [ 7]  357 	ld	a, (de)
   6356 FD 77 00      [19]  358 	ld	0 (iy), a
                            359 ;src/balls.c:110: ball->prev_y = ball->y;
   6359 FD 21 04 00   [14]  360 	ld	iy, #0x0004
   635D FD 09         [15]  361 	add	iy, bc
   635F 03            [ 6]  362 	inc	bc
   6360 03            [ 6]  363 	inc	bc
   6361 0A            [ 7]  364 	ld	a, (bc)
   6362 FD 77 00      [19]  365 	ld	0 (iy), a
                            366 ;src/balls.c:111: ball->x = batX + (batW / 4);
   6365 FD 21 D0 75   [14]  367 	ld	iy, #_batW
   6369 FD 6E 00      [19]  368 	ld	l, 0 (iy)
   636C CB 3D         [ 8]  369 	srl	l
   636E CB 3D         [ 8]  370 	srl	l
   6370 3A CE 75      [13]  371 	ld	a,(#_batX + 0)
   6373 85            [ 4]  372 	add	a, l
   6374 12            [ 7]  373 	ld	(de), a
                            374 ;src/balls.c:112: ball->y = batY - SP_BALL_H;
   6375 3A CD 75      [13]  375 	ld	a,(#_batY + 0)
   6378 C6 FA         [ 7]  376 	add	a, #0xfa
   637A 02            [ 7]  377 	ld	(bc), a
   637B DD E1         [14]  378 	pop	ix
   637D C9            [10]  379 	ret
                            380 ;src/balls.c:115: void update_ball(Ball *ball)
                            381 ;	---------------------------------
                            382 ; Function update_ball
                            383 ; ---------------------------------
   637E                     384 _update_ball::
   637E DD E5         [15]  385 	push	ix
   6380 DD 21 00 00   [14]  386 	ld	ix,#0
   6384 DD 39         [15]  387 	add	ix,sp
                            388 ;src/balls.c:117: ball->prev_x = ball->x;
   6386 DD 4E 04      [19]  389 	ld	c,4 (ix)
   6389 DD 46 05      [19]  390 	ld	b,5 (ix)
   638C 59            [ 4]  391 	ld	e, c
   638D 50            [ 4]  392 	ld	d, b
   638E 13            [ 6]  393 	inc	de
   638F 13            [ 6]  394 	inc	de
   6390 13            [ 6]  395 	inc	de
   6391 69            [ 4]  396 	ld	l, c
   6392 60            [ 4]  397 	ld	h, b
   6393 23            [ 6]  398 	inc	hl
   6394 7E            [ 7]  399 	ld	a, (hl)
   6395 12            [ 7]  400 	ld	(de), a
                            401 ;src/balls.c:118: ball->prev_y = ball->y;
   6396 21 04 00      [10]  402 	ld	hl, #0x0004
   6399 09            [11]  403 	add	hl,bc
   639A EB            [ 4]  404 	ex	de,hl
   639B 69            [ 4]  405 	ld	l, c
   639C 60            [ 4]  406 	ld	h, b
   639D 23            [ 6]  407 	inc	hl
   639E 23            [ 6]  408 	inc	hl
   639F 7E            [ 7]  409 	ld	a, (hl)
   63A0 12            [ 7]  410 	ld	(de), a
                            411 ;src/balls.c:120: if (ball->active)
   63A1 0A            [ 7]  412 	ld	a, (bc)
   63A2 B7            [ 4]  413 	or	a, a
   63A3 28 1B         [12]  414 	jr	Z,00103$
                            415 ;src/balls.c:122: blocks_intersect_ball(ball);
   63A5 C5            [11]  416 	push	bc
   63A6 CD 25 66      [17]  417 	call	_blocks_intersect_ball
   63A9 F1            [10]  418 	pop	af
                            419 ;src/balls.c:124: move_ball_x(ball);
   63AA DD 6E 04      [19]  420 	ld	l,4 (ix)
   63AD DD 66 05      [19]  421 	ld	h,5 (ix)
   63B0 E5            [11]  422 	push	hl
   63B1 CD C3 63      [17]  423 	call	_move_ball_x
   63B4 F1            [10]  424 	pop	af
                            425 ;src/balls.c:125: move_ball_y(ball);
   63B5 DD 6E 04      [19]  426 	ld	l,4 (ix)
   63B8 DD 66 05      [19]  427 	ld	h,5 (ix)
   63BB E5            [11]  428 	push	hl
   63BC CD 17 64      [17]  429 	call	_move_ball_y
   63BF F1            [10]  430 	pop	af
   63C0                     431 00103$:
   63C0 DD E1         [14]  432 	pop	ix
   63C2 C9            [10]  433 	ret
                            434 ;src/balls.c:129: void move_ball_x(Ball *ball)
                            435 ;	---------------------------------
                            436 ; Function move_ball_x
                            437 ; ---------------------------------
   63C3                     438 _move_ball_x::
   63C3 DD E5         [15]  439 	push	ix
   63C5 DD 21 00 00   [14]  440 	ld	ix,#0
   63C9 DD 39         [15]  441 	add	ix,sp
                            442 ;src/balls.c:131: u8 new_x = ball->x + ball->dx;
   63CB DD 5E 04      [19]  443 	ld	e,4 (ix)
   63CE DD 56 05      [19]  444 	ld	d,5 (ix)
   63D1 D5            [11]  445 	push	de
   63D2 FD E1         [14]  446 	pop	iy
   63D4 FD 23         [10]  447 	inc	iy
   63D6 FD 46 00      [19]  448 	ld	b, 0 (iy)
   63D9 13            [ 6]  449 	inc	de
   63DA 13            [ 6]  450 	inc	de
   63DB 13            [ 6]  451 	inc	de
   63DC 13            [ 6]  452 	inc	de
   63DD 13            [ 6]  453 	inc	de
   63DE 1A            [ 7]  454 	ld	a, (de)
   63DF 4F            [ 4]  455 	ld	c, a
   63E0 68            [ 4]  456 	ld	l, b
   63E1 09            [11]  457 	add	hl, bc
                            458 ;src/balls.c:133: if (ball->dx > 0)
   63E2 AF            [ 4]  459 	xor	a, a
   63E3 91            [ 4]  460 	sub	a, c
   63E4 E2 E9 63      [10]  461 	jp	PO, 00124$
   63E7 EE 80         [ 7]  462 	xor	a, #0x80
   63E9                     463 00124$:
   63E9 F2 01 64      [10]  464 	jp	P, 00108$
                            465 ;src/balls.c:136: if (new_x >= PLAY_AREA_RIGHT_EDGE - SP_BALL_W)
   63EC 7D            [ 4]  466 	ld	a, l
   63ED D6 3D         [ 7]  467 	sub	a, #0x3d
   63EF 38 0B         [12]  468 	jr	C,00102$
                            469 ;src/balls.c:138: ball->x = PLAY_AREA_RIGHT_EDGE - SP_BALL_W;
   63F1 FD 36 00 3D   [19]  470 	ld	0 (iy), #0x3d
                            471 ;src/balls.c:139: ball->dx = -ball->dx;
   63F5 1A            [ 7]  472 	ld	a, (de)
   63F6 4F            [ 4]  473 	ld	c, a
   63F7 AF            [ 4]  474 	xor	a, a
   63F8 91            [ 4]  475 	sub	a, c
   63F9 12            [ 7]  476 	ld	(de), a
   63FA 18 18         [12]  477 	jr	00110$
   63FC                     478 00102$:
                            479 ;src/balls.c:143: ball->x = new_x;
   63FC FD 75 00      [19]  480 	ld	0 (iy), l
   63FF 18 13         [12]  481 	jr	00110$
   6401                     482 00108$:
                            483 ;src/balls.c:150: if (new_x <= PLAY_AREA_LEFT_EDGE)
   6401 3E 0C         [ 7]  484 	ld	a, #0x0c
   6403 95            [ 4]  485 	sub	a, l
   6404 38 0B         [12]  486 	jr	C,00105$
                            487 ;src/balls.c:152: ball->x = PLAY_AREA_LEFT_EDGE;
   6406 FD 36 00 0C   [19]  488 	ld	0 (iy), #0x0c
                            489 ;src/balls.c:153: ball->dx = -ball->dx;
   640A 1A            [ 7]  490 	ld	a, (de)
   640B 4F            [ 4]  491 	ld	c, a
   640C AF            [ 4]  492 	xor	a, a
   640D 91            [ 4]  493 	sub	a, c
   640E 12            [ 7]  494 	ld	(de), a
   640F 18 03         [12]  495 	jr	00110$
   6411                     496 00105$:
                            497 ;src/balls.c:157: ball->x = new_x;
   6411 FD 75 00      [19]  498 	ld	0 (iy), l
   6414                     499 00110$:
   6414 DD E1         [14]  500 	pop	ix
   6416 C9            [10]  501 	ret
                            502 ;src/balls.c:164: void move_ball_y(Ball *ball)
                            503 ;	---------------------------------
                            504 ; Function move_ball_y
                            505 ; ---------------------------------
   6417                     506 _move_ball_y::
   6417 DD E5         [15]  507 	push	ix
   6419 DD 21 00 00   [14]  508 	ld	ix,#0
   641D DD 39         [15]  509 	add	ix,sp
   641F F5            [11]  510 	push	af
                            511 ;src/balls.c:167: u8 new_y = ball->y + ball->dy;
   6420 DD 4E 04      [19]  512 	ld	c,4 (ix)
   6423 DD 46 05      [19]  513 	ld	b,5 (ix)
   6426 59            [ 4]  514 	ld	e, c
   6427 50            [ 4]  515 	ld	d, b
   6428 13            [ 6]  516 	inc	de
   6429 13            [ 6]  517 	inc	de
   642A 1A            [ 7]  518 	ld	a, (de)
   642B DD 77 FF      [19]  519 	ld	-1 (ix), a
   642E FD 21 06 00   [14]  520 	ld	iy, #0x0006
   6432 FD 09         [15]  521 	add	iy, bc
   6434 FD 6E 00      [19]  522 	ld	l, 0 (iy)
   6437 DD 7E FF      [19]  523 	ld	a, -1 (ix)
   643A 85            [ 4]  524 	add	a, l
   643B DD 77 FE      [19]  525 	ld	-2 (ix), a
                            526 ;src/balls.c:170: if (ball->dy < 0)
   643E CB 7D         [ 8]  527 	bit	7, l
   6440 28 1A         [12]  528 	jr	Z,00108$
                            529 ;src/balls.c:172: if (new_y <= PLAY_AREA_TOP_EDGE)
   6442 3E 08         [ 7]  530 	ld	a, #0x08
   6444 DD 96 FE      [19]  531 	sub	a, -2 (ix)
   6447 38 0D         [12]  532 	jr	C,00102$
                            533 ;src/balls.c:174: ball->y = PLAY_AREA_TOP_EDGE;
   6449 3E 08         [ 7]  534 	ld	a, #0x08
   644B 12            [ 7]  535 	ld	(de), a
                            536 ;src/balls.c:175: ball->dy = -ball->dy;
   644C FD 4E 00      [19]  537 	ld	c, 0 (iy)
   644F AF            [ 4]  538 	xor	a, a
   6450 91            [ 4]  539 	sub	a, c
   6451 FD 77 00      [19]  540 	ld	0 (iy), a
   6454 18 26         [12]  541 	jr	00109$
   6456                     542 00102$:
                            543 ;src/balls.c:179: ball->y = new_y;
   6456 DD 7E FE      [19]  544 	ld	a, -2 (ix)
   6459 12            [ 7]  545 	ld	(de), a
   645A 18 20         [12]  546 	jr	00109$
   645C                     547 00108$:
                            548 ;src/balls.c:186: if (new_y >= YOUR_DEAD_PIXEL_ROW)
   645C DD 7E FE      [19]  549 	ld	a, -2 (ix)
   645F D6 C2         [ 7]  550 	sub	a, #0xc2
   6461 38 0C         [12]  551 	jr	C,00105$
                            552 ;src/balls.c:189: ball->active = 0;
   6463 AF            [ 4]  553 	xor	a, a
   6464 02            [ 7]  554 	ld	(bc), a
                            555 ;src/balls.c:190: ball->dy = -ball->dy;
   6465 FD 4E 00      [19]  556 	ld	c, 0 (iy)
   6468 AF            [ 4]  557 	xor	a, a
   6469 91            [ 4]  558 	sub	a, c
   646A FD 77 00      [19]  559 	ld	0 (iy), a
   646D 18 0D         [12]  560 	jr	00109$
   646F                     561 00105$:
                            562 ;src/balls.c:195: check_bat_collision(ball, new_y);
   646F D5            [11]  563 	push	de
   6470 DD 7E FE      [19]  564 	ld	a, -2 (ix)
   6473 F5            [11]  565 	push	af
   6474 33            [ 6]  566 	inc	sp
   6475 C5            [11]  567 	push	bc
   6476 CD 85 64      [17]  568 	call	_check_bat_collision
   6479 F1            [10]  569 	pop	af
   647A 33            [ 6]  570 	inc	sp
   647B D1            [10]  571 	pop	de
   647C                     572 00109$:
                            573 ;src/balls.c:198: ball->y = new_y;
   647C DD 7E FE      [19]  574 	ld	a, -2 (ix)
   647F 12            [ 7]  575 	ld	(de), a
   6480 DD F9         [10]  576 	ld	sp, ix
   6482 DD E1         [14]  577 	pop	ix
   6484 C9            [10]  578 	ret
                            579 ;src/balls.c:201: void check_bat_collision(Ball *ball, u8 new_y)
                            580 ;	---------------------------------
                            581 ; Function check_bat_collision
                            582 ; ---------------------------------
   6485                     583 _check_bat_collision::
   6485 DD E5         [15]  584 	push	ix
   6487 DD 21 00 00   [14]  585 	ld	ix,#0
   648B DD 39         [15]  586 	add	ix,sp
   648D F5            [11]  587 	push	af
   648E F5            [11]  588 	push	af
                            589 ;src/balls.c:203: if ((ball->x + SP_BALL_W >= batX && ball->x <= batX + batW) &&
   648F DD 7E 04      [19]  590 	ld	a, 4 (ix)
   6492 DD 77 FE      [19]  591 	ld	-2 (ix), a
   6495 DD 7E 05      [19]  592 	ld	a, 5 (ix)
   6498 DD 77 FF      [19]  593 	ld	-1 (ix), a
   649B C1            [10]  594 	pop	bc
   649C E1            [10]  595 	pop	hl
   649D E5            [11]  596 	push	hl
   649E C5            [11]  597 	push	bc
   649F 23            [ 6]  598 	inc	hl
   64A0 4E            [ 7]  599 	ld	c, (hl)
   64A1 06 00         [ 7]  600 	ld	b, #0x00
   64A3 21 03 00      [10]  601 	ld	hl, #0x0003
   64A6 09            [11]  602 	add	hl,bc
   64A7 E3            [19]  603 	ex	(sp), hl
   64A8 21 CE 75      [10]  604 	ld	hl,#_batX + 0
   64AB 5E            [ 7]  605 	ld	e, (hl)
   64AC 16 00         [ 7]  606 	ld	d, #0x00
   64AE DD 7E FC      [19]  607 	ld	a, -4 (ix)
   64B1 93            [ 4]  608 	sub	a, e
   64B2 DD 7E FD      [19]  609 	ld	a, -3 (ix)
   64B5 9A            [ 4]  610 	sbc	a, d
   64B6 E2 BB 64      [10]  611 	jp	PO, 00124$
   64B9 EE 80         [ 7]  612 	xor	a, #0x80
   64BB                     613 00124$:
   64BB FA 17 65      [10]  614 	jp	M, 00106$
   64BE FD 21 D0 75   [14]  615 	ld	iy, #_batW
   64C2 FD 6E 00      [19]  616 	ld	l, 0 (iy)
   64C5 26 00         [ 7]  617 	ld	h, #0x00
   64C7 19            [11]  618 	add	hl, de
   64C8 7D            [ 4]  619 	ld	a, l
   64C9 91            [ 4]  620 	sub	a, c
   64CA 7C            [ 4]  621 	ld	a, h
   64CB 98            [ 4]  622 	sbc	a, b
   64CC E2 D1 64      [10]  623 	jp	PO, 00125$
   64CF EE 80         [ 7]  624 	xor	a, #0x80
   64D1                     625 00125$:
   64D1 FA 17 65      [10]  626 	jp	M, 00106$
                            627 ;src/balls.c:204: (ball->y + SP_BALL_H >= batY && ball->y < batY + SP_BAT_LEFT_H))
   64D4 C1            [10]  628 	pop	bc
   64D5 E1            [10]  629 	pop	hl
   64D6 E5            [11]  630 	push	hl
   64D7 C5            [11]  631 	push	bc
   64D8 23            [ 6]  632 	inc	hl
   64D9 23            [ 6]  633 	inc	hl
   64DA 4E            [ 7]  634 	ld	c, (hl)
   64DB 06 00         [ 7]  635 	ld	b, #0x00
   64DD 21 06 00      [10]  636 	ld	hl, #0x0006
   64E0 09            [11]  637 	add	hl,bc
   64E1 EB            [ 4]  638 	ex	de,hl
   64E2 FD 21 CD 75   [14]  639 	ld	iy, #_batY
   64E6 FD 6E 00      [19]  640 	ld	l, 0 (iy)
   64E9 26 00         [ 7]  641 	ld	h, #0x00
   64EB 7B            [ 4]  642 	ld	a, e
   64EC 95            [ 4]  643 	sub	a, l
   64ED 7A            [ 4]  644 	ld	a, d
   64EE 9C            [ 4]  645 	sbc	a, h
   64EF E2 F4 64      [10]  646 	jp	PO, 00126$
   64F2 EE 80         [ 7]  647 	xor	a, #0x80
   64F4                     648 00126$:
   64F4 FA 17 65      [10]  649 	jp	M, 00106$
   64F7 11 08 00      [10]  650 	ld	de, #0x0008
   64FA 19            [11]  651 	add	hl, de
   64FB 79            [ 4]  652 	ld	a, c
   64FC 95            [ 4]  653 	sub	a, l
   64FD 78            [ 4]  654 	ld	a, b
   64FE 9C            [ 4]  655 	sbc	a, h
   64FF E2 04 65      [10]  656 	jp	PO, 00127$
   6502 EE 80         [ 7]  657 	xor	a, #0x80
   6504                     658 00127$:
   6504 F2 17 65      [10]  659 	jp	P, 00106$
                            660 ;src/balls.c:206: ball->dy = -ball->dy;
   6507 DD 7E FE      [19]  661 	ld	a, -2 (ix)
   650A C6 06         [ 7]  662 	add	a, #0x06
   650C 6F            [ 4]  663 	ld	l, a
   650D DD 7E FF      [19]  664 	ld	a, -1 (ix)
   6510 CE 00         [ 7]  665 	adc	a, #0x00
   6512 67            [ 4]  666 	ld	h, a
   6513 4E            [ 7]  667 	ld	c, (hl)
   6514 AF            [ 4]  668 	xor	a, a
   6515 91            [ 4]  669 	sub	a, c
   6516 77            [ 7]  670 	ld	(hl), a
   6517                     671 00106$:
   6517 DD F9         [10]  672 	ld	sp, ix
   6519 DD E1         [14]  673 	pop	ix
   651B C9            [10]  674 	ret
                            675 	.area _CODE
                            676 	.area _INITIALIZER
                            677 	.area _CABS (ABS)
