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
   7259                      34 _balls::
   7259                      35 	.ds 21
   726E                      36 _serving::
   726E                      37 	.ds 1
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
   6191                      66 _balls_initialize::
                             67 ;src/balls.c:19: serving = 1;
   6191 21 6E 72      [10]   68 	ld	hl,#_serving + 0
   6194 36 01         [10]   69 	ld	(hl), #0x01
                             70 ;src/balls.c:22: for (u8 i = 0; i < MAX_BALLS; i++)
   6196 0E 00         [ 7]   71 	ld	c, #0x00
   6198                      72 00103$:
   6198 79            [ 4]   73 	ld	a, c
   6199 D6 03         [ 7]   74 	sub	a, #0x03
   619B 30 37         [12]   75 	jr	NC,00101$
                             76 ;src/balls.c:24: balls[i].active = 0;
   619D 06 00         [ 7]   77 	ld	b,#0x00
   619F 69            [ 4]   78 	ld	l, c
   61A0 60            [ 4]   79 	ld	h, b
   61A1 29            [11]   80 	add	hl, hl
   61A2 09            [11]   81 	add	hl, bc
   61A3 29            [11]   82 	add	hl, hl
   61A4 09            [11]   83 	add	hl, bc
   61A5 EB            [ 4]   84 	ex	de,hl
   61A6 21 59 72      [10]   85 	ld	hl, #_balls
   61A9 19            [11]   86 	add	hl,de
   61AA EB            [ 4]   87 	ex	de,hl
   61AB AF            [ 4]   88 	xor	a, a
   61AC 12            [ 7]   89 	ld	(de), a
                             90 ;src/balls.c:25: balls[i].x = TILE_MAP_SCREEN_BYTE_OFFSET_X;
   61AD 6B            [ 4]   91 	ld	l, e
   61AE 62            [ 4]   92 	ld	h, d
   61AF 23            [ 6]   93 	inc	hl
   61B0 36 08         [10]   94 	ld	(hl), #0x08
                             95 ;src/balls.c:26: balls[i].y = TILE_MAP_SCREEN_PIXEL_OFFSET_Y;
   61B2 6B            [ 4]   96 	ld	l, e
   61B3 62            [ 4]   97 	ld	h, d
   61B4 23            [ 6]   98 	inc	hl
   61B5 23            [ 6]   99 	inc	hl
   61B6 36 00         [10]  100 	ld	(hl), #0x00
                            101 ;src/balls.c:27: balls[i].prev_x = TILE_MAP_SCREEN_BYTE_OFFSET_X;
   61B8 6B            [ 4]  102 	ld	l, e
   61B9 62            [ 4]  103 	ld	h, d
   61BA 23            [ 6]  104 	inc	hl
   61BB 23            [ 6]  105 	inc	hl
   61BC 23            [ 6]  106 	inc	hl
   61BD 36 08         [10]  107 	ld	(hl), #0x08
                            108 ;src/balls.c:28: balls[i].prev_y = TILE_MAP_SCREEN_PIXEL_OFFSET_Y;
   61BF 21 04 00      [10]  109 	ld	hl, #0x0004
   61C2 19            [11]  110 	add	hl, de
   61C3 36 00         [10]  111 	ld	(hl), #0x00
                            112 ;src/balls.c:29: balls[i].dx = 1;
   61C5 21 05 00      [10]  113 	ld	hl, #0x0005
   61C8 19            [11]  114 	add	hl, de
   61C9 36 01         [10]  115 	ld	(hl), #0x01
                            116 ;src/balls.c:30: balls[i].dy = 0;
   61CB 21 06 00      [10]  117 	ld	hl, #0x0006
   61CE 19            [11]  118 	add	hl, de
   61CF 36 00         [10]  119 	ld	(hl), #0x00
                            120 ;src/balls.c:22: for (u8 i = 0; i < MAX_BALLS; i++)
   61D1 0C            [ 4]  121 	inc	c
   61D2 18 C4         [12]  122 	jr	00103$
   61D4                     123 00101$:
                            124 ;src/balls.c:32: balls[0].active = 1;
   61D4 21 59 72      [10]  125 	ld	hl, #_balls
   61D7 36 01         [10]  126 	ld	(hl), #0x01
                            127 ;src/balls.c:35: center_ball(balls);
   61D9 E5            [11]  128 	push	hl
   61DA CD D3 62      [17]  129 	call	_center_ball
   61DD F1            [10]  130 	pop	af
   61DE C9            [10]  131 	ret
                            132 ;src/balls.c:38: void balls_update()
                            133 ;	---------------------------------
                            134 ; Function balls_update
                            135 ; ---------------------------------
   61DF                     136 _balls_update::
                            137 ;src/balls.c:40: Ball *ball = balls;
   61DF 01 59 72      [10]  138 	ld	bc, #_balls+0
                            139 ;src/balls.c:41: if (serving)
   61E2 3A 6E 72      [13]  140 	ld	a,(#_serving + 0)
   61E5 B7            [ 4]  141 	or	a, a
   61E6 28 2D         [12]  142 	jr	Z,00115$
                            143 ;src/balls.c:43: center_ball(ball);
   61E8 C5            [11]  144 	push	bc
   61E9 C5            [11]  145 	push	bc
   61EA CD D3 62      [17]  146 	call	_center_ball
   61ED F1            [10]  147 	pop	af
   61EE C1            [10]  148 	pop	bc
                            149 ;src/balls.c:44: if (key_serve_is_pressed)
   61EF 3A 5A 75      [13]  150 	ld	a,(#_key_serve_is_pressed + 0)
   61F2 B7            [ 4]  151 	or	a, a
   61F3 C8            [11]  152 	ret	Z
                            153 ;src/balls.c:46: serving = 0;
   61F4 21 6E 72      [10]  154 	ld	hl,#_serving + 0
   61F7 36 00         [10]  155 	ld	(hl), #0x00
                            156 ;src/balls.c:47: ball->dx = 1; // 45 degrees right
   61F9 21 5E 72      [10]  157 	ld	hl, #(_balls + 0x0005)
   61FC 36 01         [10]  158 	ld	(hl), #0x01
                            159 ;src/balls.c:48: ball->dy = -2;
   61FE 21 5F 72      [10]  160 	ld	hl, #(_balls + 0x0006)
   6201 36 FE         [10]  161 	ld	(hl), #0xfe
                            162 ;src/balls.c:49: ball->prev_x = ball->x;
   6203 69            [ 4]  163 	ld	l, c
   6204 60            [ 4]  164 	ld	h, b
   6205 23            [ 6]  165 	inc	hl
   6206 5E            [ 7]  166 	ld	e, (hl)
   6207 21 5C 72      [10]  167 	ld	hl, #(_balls + 0x0003)
   620A 73            [ 7]  168 	ld	(hl), e
                            169 ;src/balls.c:50: ball->prev_y = ball->y;
   620B 69            [ 4]  170 	ld	l, c
   620C 60            [ 4]  171 	ld	h, b
   620D 23            [ 6]  172 	inc	hl
   620E 23            [ 6]  173 	inc	hl
   620F 4E            [ 7]  174 	ld	c, (hl)
   6210 21 5D 72      [10]  175 	ld	hl, #(_balls + 0x0004)
   6213 71            [ 7]  176 	ld	(hl), c
   6214 C9            [10]  177 	ret
                            178 ;src/balls.c:55: for (u8 i = 0; i < MAX_BALLS; i++)
   6215                     179 00115$:
   6215 1E 00         [ 7]  180 	ld	e, #0x00
   6217                     181 00108$:
   6217 7B            [ 4]  182 	ld	a, e
   6218 D6 03         [ 7]  183 	sub	a, #0x03
   621A D0            [11]  184 	ret	NC
                            185 ;src/balls.c:57: update_ball(ball);
   621B C5            [11]  186 	push	bc
   621C D5            [11]  187 	push	de
   621D C5            [11]  188 	push	bc
   621E CD 16 63      [17]  189 	call	_update_ball
   6221 F1            [10]  190 	pop	af
   6222 D1            [10]  191 	pop	de
   6223 C1            [10]  192 	pop	bc
                            193 ;src/balls.c:58: ball++;
   6224 21 07 00      [10]  194 	ld	hl, #0x0007
   6227 09            [11]  195 	add	hl,bc
   6228 4D            [ 4]  196 	ld	c, l
   6229 44            [ 4]  197 	ld	b, h
                            198 ;src/balls.c:55: for (u8 i = 0; i < MAX_BALLS; i++)
   622A 1C            [ 4]  199 	inc	e
   622B 18 EA         [12]  200 	jr	00108$
                            201 ;src/balls.c:63: void balls_restore_background()
                            202 ;	---------------------------------
                            203 ; Function balls_restore_background
                            204 ; ---------------------------------
   622D                     205 _balls_restore_background::
   622D DD E5         [15]  206 	push	ix
   622F DD 21 00 00   [14]  207 	ld	ix,#0
   6233 DD 39         [15]  208 	add	ix,sp
   6235 3B            [ 6]  209 	dec	sp
                            210 ;src/balls.c:65: Ball *ball = balls;
   6236 01 59 72      [10]  211 	ld	bc, #_balls
                            212 ;src/balls.c:66: for (u8 i = 0; i < MAX_BALLS; i++)
   6239 DD 36 FF 00   [19]  213 	ld	-1 (ix), #0x00
   623D                     214 00105$:
   623D DD 7E FF      [19]  215 	ld	a, -1 (ix)
   6240 D6 03         [ 7]  216 	sub	a, #0x03
   6242 30 29         [12]  217 	jr	NC,00107$
                            218 ;src/balls.c:68: if (ball->active)
   6244 0A            [ 7]  219 	ld	a, (bc)
   6245 B7            [ 4]  220 	or	a, a
   6246 28 1A         [12]  221 	jr	Z,00102$
                            222 ;src/balls.c:70: background_restore(ball->prev_x, balls->prev_y, SP_BALL_W, SP_BALL_H);
   6248 21 5D 72      [10]  223 	ld	hl, #_balls + 4
   624B 5E            [ 7]  224 	ld	e, (hl)
   624C 69            [ 4]  225 	ld	l, c
   624D 60            [ 4]  226 	ld	h, b
   624E 23            [ 6]  227 	inc	hl
   624F 23            [ 6]  228 	inc	hl
   6250 23            [ 6]  229 	inc	hl
   6251 56            [ 7]  230 	ld	d, (hl)
   6252 C5            [11]  231 	push	bc
   6253 21 03 06      [10]  232 	ld	hl, #0x0603
   6256 E5            [11]  233 	push	hl
   6257 7B            [ 4]  234 	ld	a, e
   6258 F5            [11]  235 	push	af
   6259 33            [ 6]  236 	inc	sp
   625A D5            [11]  237 	push	de
   625B 33            [ 6]  238 	inc	sp
   625C CD FD 60      [17]  239 	call	_background_restore
   625F F1            [10]  240 	pop	af
   6260 F1            [10]  241 	pop	af
   6261 C1            [10]  242 	pop	bc
   6262                     243 00102$:
                            244 ;src/balls.c:72: ball++;
   6262 21 07 00      [10]  245 	ld	hl, #0x0007
   6265 09            [11]  246 	add	hl,bc
   6266 4D            [ 4]  247 	ld	c, l
   6267 44            [ 4]  248 	ld	b, h
                            249 ;src/balls.c:66: for (u8 i = 0; i < MAX_BALLS; i++)
   6268 DD 34 FF      [23]  250 	inc	-1 (ix)
   626B 18 D0         [12]  251 	jr	00105$
   626D                     252 00107$:
   626D 33            [ 6]  253 	inc	sp
   626E DD E1         [14]  254 	pop	ix
   6270 C9            [10]  255 	ret
                            256 ;src/balls.c:76: void balls_draw()
                            257 ;	---------------------------------
                            258 ; Function balls_draw
                            259 ; ---------------------------------
   6271                     260 _balls_draw::
                            261 ;src/balls.c:80: for (u8 i = 0; i < MAX_BALLS; i++)
   6271 0E 00         [ 7]  262 	ld	c, #0x00
   6273                     263 00105$:
   6273 79            [ 4]  264 	ld	a, c
   6274 D6 03         [ 7]  265 	sub	a, #0x03
   6276 D0            [11]  266 	ret	NC
                            267 ;src/balls.c:82: if (balls->active)
   6277 3A 59 72      [13]  268 	ld	a, (#_balls + 0)
   627A B7            [ 4]  269 	or	a, a
   627B 28 1F         [12]  270 	jr	Z,00106$
                            271 ;src/balls.c:84: svmem = cpct_getScreenPtr(CPCT_VMEM_START, balls->x, balls->y);
   627D 21 5B 72      [10]  272 	ld	hl, #_balls + 2
   6280 46            [ 7]  273 	ld	b, (hl)
   6281 21 5A 72      [10]  274 	ld	hl, #_balls + 1
   6284 56            [ 7]  275 	ld	d, (hl)
   6285 C5            [11]  276 	push	bc
   6286 4A            [ 4]  277 	ld	c, d
   6287 C5            [11]  278 	push	bc
   6288 21 00 C0      [10]  279 	ld	hl, #0xc000
   628B E5            [11]  280 	push	hl
   628C CD A7 71      [17]  281 	call	_cpct_getScreenPtr
   628F 11 03 06      [10]  282 	ld	de, #0x0603
   6292 D5            [11]  283 	push	de
   6293 E5            [11]  284 	push	hl
   6294 21 1D 60      [10]  285 	ld	hl, #_sp_ball
   6297 E5            [11]  286 	push	hl
   6298 CD 91 6E      [17]  287 	call	_cpct_drawSprite
   629B C1            [10]  288 	pop	bc
   629C                     289 00106$:
                            290 ;src/balls.c:80: for (u8 i = 0; i < MAX_BALLS; i++)
   629C 0C            [ 4]  291 	inc	c
   629D 18 D4         [12]  292 	jr	00105$
                            293 ;src/balls.c:90: Ball *balls_get_first_active()
                            294 ;	---------------------------------
                            295 ; Function balls_get_first_active
                            296 ; ---------------------------------
   629F                     297 _balls_get_first_active::
   629F DD E5         [15]  298 	push	ix
   62A1 DD 21 00 00   [14]  299 	ld	ix,#0
   62A5 DD 39         [15]  300 	add	ix,sp
   62A7 F5            [11]  301 	push	af
                            302 ;src/balls.c:92: Ball *ball = balls;
   62A8 DD 36 FE 59   [19]  303 	ld	-2 (ix), #<(_balls)
   62AC DD 36 FF 72   [19]  304 	ld	-1 (ix), #>(_balls)
                            305 ;src/balls.c:93: for (u8 i = 0; i < MAX_BALLS; i++)
   62B0 E1            [10]  306 	pop	hl
   62B1 E5            [11]  307 	push	hl
   62B2 0E 00         [ 7]  308 	ld	c, #0x00
   62B4                     309 00105$:
   62B4 79            [ 4]  310 	ld	a, c
   62B5 D6 03         [ 7]  311 	sub	a, #0x03
   62B7 30 12         [12]  312 	jr	NC,00103$
                            313 ;src/balls.c:95: if (ball->active)
   62B9 7E            [ 7]  314 	ld	a, (hl)
   62BA B7            [ 4]  315 	or	a, a
   62BB 28 04         [12]  316 	jr	Z,00102$
                            317 ;src/balls.c:97: return ball;
   62BD E1            [10]  318 	pop	hl
   62BE E5            [11]  319 	push	hl
   62BF 18 0D         [12]  320 	jr	00107$
   62C1                     321 00102$:
                            322 ;src/balls.c:99: ball++;
   62C1 11 07 00      [10]  323 	ld	de, #0x0007
   62C4 19            [11]  324 	add	hl, de
   62C5 33            [ 6]  325 	inc	sp
   62C6 33            [ 6]  326 	inc	sp
   62C7 E5            [11]  327 	push	hl
                            328 ;src/balls.c:93: for (u8 i = 0; i < MAX_BALLS; i++)
   62C8 0C            [ 4]  329 	inc	c
   62C9 18 E9         [12]  330 	jr	00105$
   62CB                     331 00103$:
                            332 ;src/balls.c:101: return NULL;
   62CB 21 00 00      [10]  333 	ld	hl, #0x0000
   62CE                     334 00107$:
   62CE DD F9         [10]  335 	ld	sp, ix
   62D0 DD E1         [14]  336 	pop	ix
   62D2 C9            [10]  337 	ret
                            338 ;src/balls.c:107: void center_ball(Ball *ball)
                            339 ;	---------------------------------
                            340 ; Function center_ball
                            341 ; ---------------------------------
   62D3                     342 _center_ball::
   62D3 DD E5         [15]  343 	push	ix
   62D5 DD 21 00 00   [14]  344 	ld	ix,#0
   62D9 DD 39         [15]  345 	add	ix,sp
                            346 ;src/balls.c:109: ball->prev_x = ball->x;
   62DB DD 4E 04      [19]  347 	ld	c,4 (ix)
   62DE DD 46 05      [19]  348 	ld	b,5 (ix)
   62E1 C5            [11]  349 	push	bc
   62E2 FD E1         [14]  350 	pop	iy
   62E4 FD 23         [10]  351 	inc	iy
   62E6 FD 23         [10]  352 	inc	iy
   62E8 FD 23         [10]  353 	inc	iy
   62EA 59            [ 4]  354 	ld	e, c
   62EB 50            [ 4]  355 	ld	d, b
   62EC 13            [ 6]  356 	inc	de
   62ED 1A            [ 7]  357 	ld	a, (de)
   62EE FD 77 00      [19]  358 	ld	0 (iy), a
                            359 ;src/balls.c:110: ball->prev_y = ball->y;
   62F1 FD 21 04 00   [14]  360 	ld	iy, #0x0004
   62F5 FD 09         [15]  361 	add	iy, bc
   62F7 03            [ 6]  362 	inc	bc
   62F8 03            [ 6]  363 	inc	bc
   62F9 0A            [ 7]  364 	ld	a, (bc)
   62FA FD 77 00      [19]  365 	ld	0 (iy), a
                            366 ;src/balls.c:111: ball->x = batX + (batW / 4);
   62FD FD 21 68 75   [14]  367 	ld	iy, #_batW
   6301 FD 6E 00      [19]  368 	ld	l, 0 (iy)
   6304 CB 3D         [ 8]  369 	srl	l
   6306 CB 3D         [ 8]  370 	srl	l
   6308 3A 66 75      [13]  371 	ld	a,(#_batX + 0)
   630B 85            [ 4]  372 	add	a, l
   630C 12            [ 7]  373 	ld	(de), a
                            374 ;src/balls.c:112: ball->y = batY - SP_BALL_H;
   630D 3A 65 75      [13]  375 	ld	a,(#_batY + 0)
   6310 C6 FA         [ 7]  376 	add	a, #0xfa
   6312 02            [ 7]  377 	ld	(bc), a
   6313 DD E1         [14]  378 	pop	ix
   6315 C9            [10]  379 	ret
                            380 ;src/balls.c:115: void update_ball(Ball *ball)
                            381 ;	---------------------------------
                            382 ; Function update_ball
                            383 ; ---------------------------------
   6316                     384 _update_ball::
   6316 DD E5         [15]  385 	push	ix
   6318 DD 21 00 00   [14]  386 	ld	ix,#0
   631C DD 39         [15]  387 	add	ix,sp
                            388 ;src/balls.c:117: ball->prev_x = ball->x;
   631E DD 4E 04      [19]  389 	ld	c,4 (ix)
   6321 DD 46 05      [19]  390 	ld	b,5 (ix)
   6324 59            [ 4]  391 	ld	e, c
   6325 50            [ 4]  392 	ld	d, b
   6326 13            [ 6]  393 	inc	de
   6327 13            [ 6]  394 	inc	de
   6328 13            [ 6]  395 	inc	de
   6329 69            [ 4]  396 	ld	l, c
   632A 60            [ 4]  397 	ld	h, b
   632B 23            [ 6]  398 	inc	hl
   632C 7E            [ 7]  399 	ld	a, (hl)
   632D 12            [ 7]  400 	ld	(de), a
                            401 ;src/balls.c:118: ball->prev_y = ball->y;
   632E 21 04 00      [10]  402 	ld	hl, #0x0004
   6331 09            [11]  403 	add	hl,bc
   6332 EB            [ 4]  404 	ex	de,hl
   6333 69            [ 4]  405 	ld	l, c
   6334 60            [ 4]  406 	ld	h, b
   6335 23            [ 6]  407 	inc	hl
   6336 23            [ 6]  408 	inc	hl
   6337 7E            [ 7]  409 	ld	a, (hl)
   6338 12            [ 7]  410 	ld	(de), a
                            411 ;src/balls.c:120: if (ball->active)
   6339 0A            [ 7]  412 	ld	a, (bc)
   633A B7            [ 4]  413 	or	a, a
   633B 28 1B         [12]  414 	jr	Z,00103$
                            415 ;src/balls.c:122: blocks_intersect_ball(ball);
   633D C5            [11]  416 	push	bc
   633E CD BD 65      [17]  417 	call	_blocks_intersect_ball
   6341 F1            [10]  418 	pop	af
                            419 ;src/balls.c:124: move_ball_x(ball);
   6342 DD 6E 04      [19]  420 	ld	l,4 (ix)
   6345 DD 66 05      [19]  421 	ld	h,5 (ix)
   6348 E5            [11]  422 	push	hl
   6349 CD 5B 63      [17]  423 	call	_move_ball_x
   634C F1            [10]  424 	pop	af
                            425 ;src/balls.c:125: move_ball_y(ball);
   634D DD 6E 04      [19]  426 	ld	l,4 (ix)
   6350 DD 66 05      [19]  427 	ld	h,5 (ix)
   6353 E5            [11]  428 	push	hl
   6354 CD AF 63      [17]  429 	call	_move_ball_y
   6357 F1            [10]  430 	pop	af
   6358                     431 00103$:
   6358 DD E1         [14]  432 	pop	ix
   635A C9            [10]  433 	ret
                            434 ;src/balls.c:129: void move_ball_x(Ball *ball)
                            435 ;	---------------------------------
                            436 ; Function move_ball_x
                            437 ; ---------------------------------
   635B                     438 _move_ball_x::
   635B DD E5         [15]  439 	push	ix
   635D DD 21 00 00   [14]  440 	ld	ix,#0
   6361 DD 39         [15]  441 	add	ix,sp
                            442 ;src/balls.c:131: u8 new_x = ball->x + ball->dx;
   6363 DD 5E 04      [19]  443 	ld	e,4 (ix)
   6366 DD 56 05      [19]  444 	ld	d,5 (ix)
   6369 D5            [11]  445 	push	de
   636A FD E1         [14]  446 	pop	iy
   636C FD 23         [10]  447 	inc	iy
   636E FD 46 00      [19]  448 	ld	b, 0 (iy)
   6371 13            [ 6]  449 	inc	de
   6372 13            [ 6]  450 	inc	de
   6373 13            [ 6]  451 	inc	de
   6374 13            [ 6]  452 	inc	de
   6375 13            [ 6]  453 	inc	de
   6376 1A            [ 7]  454 	ld	a, (de)
   6377 4F            [ 4]  455 	ld	c, a
   6378 68            [ 4]  456 	ld	l, b
   6379 09            [11]  457 	add	hl, bc
                            458 ;src/balls.c:133: if (ball->dx > 0)
   637A AF            [ 4]  459 	xor	a, a
   637B 91            [ 4]  460 	sub	a, c
   637C E2 81 63      [10]  461 	jp	PO, 00124$
   637F EE 80         [ 7]  462 	xor	a, #0x80
   6381                     463 00124$:
   6381 F2 99 63      [10]  464 	jp	P, 00108$
                            465 ;src/balls.c:136: if (new_x >= PLAY_AREA_RIGHT_EDGE - SP_BALL_W)
   6384 7D            [ 4]  466 	ld	a, l
   6385 D6 3D         [ 7]  467 	sub	a, #0x3d
   6387 38 0B         [12]  468 	jr	C,00102$
                            469 ;src/balls.c:138: ball->x = PLAY_AREA_RIGHT_EDGE - SP_BALL_W;
   6389 FD 36 00 3D   [19]  470 	ld	0 (iy), #0x3d
                            471 ;src/balls.c:139: ball->dx = -ball->dx;
   638D 1A            [ 7]  472 	ld	a, (de)
   638E 4F            [ 4]  473 	ld	c, a
   638F AF            [ 4]  474 	xor	a, a
   6390 91            [ 4]  475 	sub	a, c
   6391 12            [ 7]  476 	ld	(de), a
   6392 18 18         [12]  477 	jr	00110$
   6394                     478 00102$:
                            479 ;src/balls.c:143: ball->x = new_x;
   6394 FD 75 00      [19]  480 	ld	0 (iy), l
   6397 18 13         [12]  481 	jr	00110$
   6399                     482 00108$:
                            483 ;src/balls.c:150: if (new_x <= PLAY_AREA_LEFT_EDGE)
   6399 3E 0C         [ 7]  484 	ld	a, #0x0c
   639B 95            [ 4]  485 	sub	a, l
   639C 38 0B         [12]  486 	jr	C,00105$
                            487 ;src/balls.c:152: ball->x = PLAY_AREA_LEFT_EDGE;
   639E FD 36 00 0C   [19]  488 	ld	0 (iy), #0x0c
                            489 ;src/balls.c:153: ball->dx = -ball->dx;
   63A2 1A            [ 7]  490 	ld	a, (de)
   63A3 4F            [ 4]  491 	ld	c, a
   63A4 AF            [ 4]  492 	xor	a, a
   63A5 91            [ 4]  493 	sub	a, c
   63A6 12            [ 7]  494 	ld	(de), a
   63A7 18 03         [12]  495 	jr	00110$
   63A9                     496 00105$:
                            497 ;src/balls.c:157: ball->x = new_x;
   63A9 FD 75 00      [19]  498 	ld	0 (iy), l
   63AC                     499 00110$:
   63AC DD E1         [14]  500 	pop	ix
   63AE C9            [10]  501 	ret
                            502 ;src/balls.c:164: void move_ball_y(Ball *ball)
                            503 ;	---------------------------------
                            504 ; Function move_ball_y
                            505 ; ---------------------------------
   63AF                     506 _move_ball_y::
   63AF DD E5         [15]  507 	push	ix
   63B1 DD 21 00 00   [14]  508 	ld	ix,#0
   63B5 DD 39         [15]  509 	add	ix,sp
   63B7 F5            [11]  510 	push	af
                            511 ;src/balls.c:167: u8 new_y = ball->y + ball->dy;
   63B8 DD 4E 04      [19]  512 	ld	c,4 (ix)
   63BB DD 46 05      [19]  513 	ld	b,5 (ix)
   63BE 59            [ 4]  514 	ld	e, c
   63BF 50            [ 4]  515 	ld	d, b
   63C0 13            [ 6]  516 	inc	de
   63C1 13            [ 6]  517 	inc	de
   63C2 1A            [ 7]  518 	ld	a, (de)
   63C3 DD 77 FF      [19]  519 	ld	-1 (ix), a
   63C6 FD 21 06 00   [14]  520 	ld	iy, #0x0006
   63CA FD 09         [15]  521 	add	iy, bc
   63CC FD 6E 00      [19]  522 	ld	l, 0 (iy)
   63CF DD 7E FF      [19]  523 	ld	a, -1 (ix)
   63D2 85            [ 4]  524 	add	a, l
   63D3 DD 77 FE      [19]  525 	ld	-2 (ix), a
                            526 ;src/balls.c:170: if (ball->dy < 0)
   63D6 CB 7D         [ 8]  527 	bit	7, l
   63D8 28 1A         [12]  528 	jr	Z,00108$
                            529 ;src/balls.c:172: if (new_y <= PLAY_AREA_TOP_EDGE)
   63DA 3E 08         [ 7]  530 	ld	a, #0x08
   63DC DD 96 FE      [19]  531 	sub	a, -2 (ix)
   63DF 38 0D         [12]  532 	jr	C,00102$
                            533 ;src/balls.c:174: ball->y = PLAY_AREA_TOP_EDGE;
   63E1 3E 08         [ 7]  534 	ld	a, #0x08
   63E3 12            [ 7]  535 	ld	(de), a
                            536 ;src/balls.c:175: ball->dy = -ball->dy;
   63E4 FD 4E 00      [19]  537 	ld	c, 0 (iy)
   63E7 AF            [ 4]  538 	xor	a, a
   63E8 91            [ 4]  539 	sub	a, c
   63E9 FD 77 00      [19]  540 	ld	0 (iy), a
   63EC 18 26         [12]  541 	jr	00109$
   63EE                     542 00102$:
                            543 ;src/balls.c:179: ball->y = new_y;
   63EE DD 7E FE      [19]  544 	ld	a, -2 (ix)
   63F1 12            [ 7]  545 	ld	(de), a
   63F2 18 20         [12]  546 	jr	00109$
   63F4                     547 00108$:
                            548 ;src/balls.c:186: if (new_y >= YOUR_DEAD_PIXEL_ROW)
   63F4 DD 7E FE      [19]  549 	ld	a, -2 (ix)
   63F7 D6 C2         [ 7]  550 	sub	a, #0xc2
   63F9 38 0C         [12]  551 	jr	C,00105$
                            552 ;src/balls.c:189: ball->active = 0;
   63FB AF            [ 4]  553 	xor	a, a
   63FC 02            [ 7]  554 	ld	(bc), a
                            555 ;src/balls.c:190: ball->dy = -ball->dy;
   63FD FD 4E 00      [19]  556 	ld	c, 0 (iy)
   6400 AF            [ 4]  557 	xor	a, a
   6401 91            [ 4]  558 	sub	a, c
   6402 FD 77 00      [19]  559 	ld	0 (iy), a
   6405 18 0D         [12]  560 	jr	00109$
   6407                     561 00105$:
                            562 ;src/balls.c:195: check_bat_collision(ball, new_y);
   6407 D5            [11]  563 	push	de
   6408 DD 7E FE      [19]  564 	ld	a, -2 (ix)
   640B F5            [11]  565 	push	af
   640C 33            [ 6]  566 	inc	sp
   640D C5            [11]  567 	push	bc
   640E CD 1D 64      [17]  568 	call	_check_bat_collision
   6411 F1            [10]  569 	pop	af
   6412 33            [ 6]  570 	inc	sp
   6413 D1            [10]  571 	pop	de
   6414                     572 00109$:
                            573 ;src/balls.c:198: ball->y = new_y;
   6414 DD 7E FE      [19]  574 	ld	a, -2 (ix)
   6417 12            [ 7]  575 	ld	(de), a
   6418 DD F9         [10]  576 	ld	sp, ix
   641A DD E1         [14]  577 	pop	ix
   641C C9            [10]  578 	ret
                            579 ;src/balls.c:201: void check_bat_collision(Ball *ball, u8 new_y)
                            580 ;	---------------------------------
                            581 ; Function check_bat_collision
                            582 ; ---------------------------------
   641D                     583 _check_bat_collision::
   641D DD E5         [15]  584 	push	ix
   641F DD 21 00 00   [14]  585 	ld	ix,#0
   6423 DD 39         [15]  586 	add	ix,sp
   6425 F5            [11]  587 	push	af
   6426 F5            [11]  588 	push	af
                            589 ;src/balls.c:203: if ((ball->x + SP_BALL_W >= batX && ball->x <= batX + batW) &&
   6427 DD 7E 04      [19]  590 	ld	a, 4 (ix)
   642A DD 77 FE      [19]  591 	ld	-2 (ix), a
   642D DD 7E 05      [19]  592 	ld	a, 5 (ix)
   6430 DD 77 FF      [19]  593 	ld	-1 (ix), a
   6433 C1            [10]  594 	pop	bc
   6434 E1            [10]  595 	pop	hl
   6435 E5            [11]  596 	push	hl
   6436 C5            [11]  597 	push	bc
   6437 23            [ 6]  598 	inc	hl
   6438 4E            [ 7]  599 	ld	c, (hl)
   6439 06 00         [ 7]  600 	ld	b, #0x00
   643B 21 03 00      [10]  601 	ld	hl, #0x0003
   643E 09            [11]  602 	add	hl,bc
   643F E3            [19]  603 	ex	(sp), hl
   6440 21 66 75      [10]  604 	ld	hl,#_batX + 0
   6443 5E            [ 7]  605 	ld	e, (hl)
   6444 16 00         [ 7]  606 	ld	d, #0x00
   6446 DD 7E FC      [19]  607 	ld	a, -4 (ix)
   6449 93            [ 4]  608 	sub	a, e
   644A DD 7E FD      [19]  609 	ld	a, -3 (ix)
   644D 9A            [ 4]  610 	sbc	a, d
   644E E2 53 64      [10]  611 	jp	PO, 00124$
   6451 EE 80         [ 7]  612 	xor	a, #0x80
   6453                     613 00124$:
   6453 FA AF 64      [10]  614 	jp	M, 00106$
   6456 FD 21 68 75   [14]  615 	ld	iy, #_batW
   645A FD 6E 00      [19]  616 	ld	l, 0 (iy)
   645D 26 00         [ 7]  617 	ld	h, #0x00
   645F 19            [11]  618 	add	hl, de
   6460 7D            [ 4]  619 	ld	a, l
   6461 91            [ 4]  620 	sub	a, c
   6462 7C            [ 4]  621 	ld	a, h
   6463 98            [ 4]  622 	sbc	a, b
   6464 E2 69 64      [10]  623 	jp	PO, 00125$
   6467 EE 80         [ 7]  624 	xor	a, #0x80
   6469                     625 00125$:
   6469 FA AF 64      [10]  626 	jp	M, 00106$
                            627 ;src/balls.c:204: (ball->y + SP_BALL_H >= batY && ball->y < batY + SP_BAT_LEFT_H))
   646C C1            [10]  628 	pop	bc
   646D E1            [10]  629 	pop	hl
   646E E5            [11]  630 	push	hl
   646F C5            [11]  631 	push	bc
   6470 23            [ 6]  632 	inc	hl
   6471 23            [ 6]  633 	inc	hl
   6472 4E            [ 7]  634 	ld	c, (hl)
   6473 06 00         [ 7]  635 	ld	b, #0x00
   6475 21 06 00      [10]  636 	ld	hl, #0x0006
   6478 09            [11]  637 	add	hl,bc
   6479 EB            [ 4]  638 	ex	de,hl
   647A FD 21 65 75   [14]  639 	ld	iy, #_batY
   647E FD 6E 00      [19]  640 	ld	l, 0 (iy)
   6481 26 00         [ 7]  641 	ld	h, #0x00
   6483 7B            [ 4]  642 	ld	a, e
   6484 95            [ 4]  643 	sub	a, l
   6485 7A            [ 4]  644 	ld	a, d
   6486 9C            [ 4]  645 	sbc	a, h
   6487 E2 8C 64      [10]  646 	jp	PO, 00126$
   648A EE 80         [ 7]  647 	xor	a, #0x80
   648C                     648 00126$:
   648C FA AF 64      [10]  649 	jp	M, 00106$
   648F 11 08 00      [10]  650 	ld	de, #0x0008
   6492 19            [11]  651 	add	hl, de
   6493 79            [ 4]  652 	ld	a, c
   6494 95            [ 4]  653 	sub	a, l
   6495 78            [ 4]  654 	ld	a, b
   6496 9C            [ 4]  655 	sbc	a, h
   6497 E2 9C 64      [10]  656 	jp	PO, 00127$
   649A EE 80         [ 7]  657 	xor	a, #0x80
   649C                     658 00127$:
   649C F2 AF 64      [10]  659 	jp	P, 00106$
                            660 ;src/balls.c:206: ball->dy = -ball->dy;
   649F DD 7E FE      [19]  661 	ld	a, -2 (ix)
   64A2 C6 06         [ 7]  662 	add	a, #0x06
   64A4 6F            [ 4]  663 	ld	l, a
   64A5 DD 7E FF      [19]  664 	ld	a, -1 (ix)
   64A8 CE 00         [ 7]  665 	adc	a, #0x00
   64AA 67            [ 4]  666 	ld	h, a
   64AB 4E            [ 7]  667 	ld	c, (hl)
   64AC AF            [ 4]  668 	xor	a, a
   64AD 91            [ 4]  669 	sub	a, c
   64AE 77            [ 7]  670 	ld	(hl), a
   64AF                     671 00106$:
   64AF DD F9         [10]  672 	ld	sp, ix
   64B1 DD E1         [14]  673 	pop	ix
   64B3 C9            [10]  674 	ret
                            675 	.area _CODE
                            676 	.area _INITIALIZER
                            677 	.area _CABS (ABS)
