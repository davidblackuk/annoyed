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
                             11 	.globl _balls_restore_background
                             12 	.globl _restoreBackground
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _cpct_drawSprite
                             15 	.globl _serving
                             16 	.globl _balls
                             17 	.globl _balls_initialize
                             18 	.globl _balls_update
                             19 	.globl _balls_draw
                             20 	.globl _balls_get_first_active
                             21 	.globl _center_ball
                             22 	.globl _update_ball
                             23 ;--------------------------------------------------------
                             24 ; special function registers
                             25 ;--------------------------------------------------------
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DATA
   546A                      30 _balls::
   546A                      31 	.ds 21
   547F                      32 _serving::
   547F                      33 	.ds 1
                             34 ;--------------------------------------------------------
                             35 ; ram data
                             36 ;--------------------------------------------------------
                             37 	.area _INITIALIZED
                             38 ;--------------------------------------------------------
                             39 ; absolute external ram data
                             40 ;--------------------------------------------------------
                             41 	.area _DABS (ABS)
                             42 ;--------------------------------------------------------
                             43 ; global & static initialisations
                             44 ;--------------------------------------------------------
                             45 	.area _HOME
                             46 	.area _GSINIT
                             47 	.area _GSFINAL
                             48 	.area _GSINIT
                             49 ;--------------------------------------------------------
                             50 ; Home
                             51 ;--------------------------------------------------------
                             52 	.area _HOME
                             53 	.area _HOME
                             54 ;--------------------------------------------------------
                             55 ; code
                             56 ;--------------------------------------------------------
                             57 	.area _CODE
                             58 ;src/balls.c:14: void balls_initialize()
                             59 ;	---------------------------------
                             60 ; Function balls_initialize
                             61 ; ---------------------------------
   4BCA                      62 _balls_initialize::
                             63 ;src/balls.c:17: serving = 1;
   4BCA 21 7F 54      [10]   64 	ld	hl,#_serving + 0
   4BCD 36 01         [10]   65 	ld	(hl), #0x01
                             66 ;src/balls.c:20: for (u8 i = 0; i < MAX_BALLS; i++)
   4BCF 0E 00         [ 7]   67 	ld	c, #0x00
   4BD1                      68 00103$:
   4BD1 79            [ 4]   69 	ld	a, c
   4BD2 D6 03         [ 7]   70 	sub	a, #0x03
   4BD4 30 37         [12]   71 	jr	NC,00101$
                             72 ;src/balls.c:22: balls[i].active = 0;
   4BD6 06 00         [ 7]   73 	ld	b,#0x00
   4BD8 69            [ 4]   74 	ld	l, c
   4BD9 60            [ 4]   75 	ld	h, b
   4BDA 29            [11]   76 	add	hl, hl
   4BDB 09            [11]   77 	add	hl, bc
   4BDC 29            [11]   78 	add	hl, hl
   4BDD 09            [11]   79 	add	hl, bc
   4BDE EB            [ 4]   80 	ex	de,hl
   4BDF 21 6A 54      [10]   81 	ld	hl, #_balls
   4BE2 19            [11]   82 	add	hl,de
   4BE3 EB            [ 4]   83 	ex	de,hl
   4BE4 AF            [ 4]   84 	xor	a, a
   4BE5 12            [ 7]   85 	ld	(de), a
                             86 ;src/balls.c:23: balls[i].x = TILE_MAP_SCREEN_BYTE_OFFSET_X;
   4BE6 6B            [ 4]   87 	ld	l, e
   4BE7 62            [ 4]   88 	ld	h, d
   4BE8 23            [ 6]   89 	inc	hl
   4BE9 36 08         [10]   90 	ld	(hl), #0x08
                             91 ;src/balls.c:24: balls[i].y = TILE_MAP_SCREEN_PIXEL_OFFSET_Y;
   4BEB 6B            [ 4]   92 	ld	l, e
   4BEC 62            [ 4]   93 	ld	h, d
   4BED 23            [ 6]   94 	inc	hl
   4BEE 23            [ 6]   95 	inc	hl
   4BEF 36 10         [10]   96 	ld	(hl), #0x10
                             97 ;src/balls.c:25: balls[i].prev_x = TILE_MAP_SCREEN_BYTE_OFFSET_X;
   4BF1 6B            [ 4]   98 	ld	l, e
   4BF2 62            [ 4]   99 	ld	h, d
   4BF3 23            [ 6]  100 	inc	hl
   4BF4 23            [ 6]  101 	inc	hl
   4BF5 23            [ 6]  102 	inc	hl
   4BF6 36 08         [10]  103 	ld	(hl), #0x08
                            104 ;src/balls.c:26: balls[i].prev_y = TILE_MAP_SCREEN_PIXEL_OFFSET_Y;
   4BF8 21 04 00      [10]  105 	ld	hl, #0x0004
   4BFB 19            [11]  106 	add	hl, de
   4BFC 36 10         [10]  107 	ld	(hl), #0x10
                            108 ;src/balls.c:27: balls[i].dx = 1;
   4BFE 21 05 00      [10]  109 	ld	hl, #0x0005
   4C01 19            [11]  110 	add	hl, de
   4C02 36 01         [10]  111 	ld	(hl), #0x01
                            112 ;src/balls.c:28: balls[i].dy = 0;
   4C04 21 06 00      [10]  113 	ld	hl, #0x0006
   4C07 19            [11]  114 	add	hl, de
   4C08 36 00         [10]  115 	ld	(hl), #0x00
                            116 ;src/balls.c:20: for (u8 i = 0; i < MAX_BALLS; i++)
   4C0A 0C            [ 4]  117 	inc	c
   4C0B 18 C4         [12]  118 	jr	00103$
   4C0D                     119 00101$:
                            120 ;src/balls.c:30: balls[0].active = 1;
   4C0D 21 6A 54      [10]  121 	ld	hl, #_balls
   4C10 36 01         [10]  122 	ld	(hl), #0x01
                            123 ;src/balls.c:33: center_ball(balls);
   4C12 E5            [11]  124 	push	hl
   4C13 CD 0C 4D      [17]  125 	call	_center_ball
   4C16 F1            [10]  126 	pop	af
   4C17 C9            [10]  127 	ret
                            128 ;src/balls.c:36: void balls_update()
                            129 ;	---------------------------------
                            130 ; Function balls_update
                            131 ; ---------------------------------
   4C18                     132 _balls_update::
                            133 ;src/balls.c:38: Ball *ball = balls;
   4C18 01 6A 54      [10]  134 	ld	bc, #_balls+0
                            135 ;src/balls.c:39: if (serving)
   4C1B 3A 7F 54      [13]  136 	ld	a,(#_serving + 0)
   4C1E B7            [ 4]  137 	or	a, a
   4C1F 28 2D         [12]  138 	jr	Z,00115$
                            139 ;src/balls.c:41: center_ball(ball);
   4C21 C5            [11]  140 	push	bc
   4C22 C5            [11]  141 	push	bc
   4C23 CD 0C 4D      [17]  142 	call	_center_ball
   4C26 F1            [10]  143 	pop	af
   4C27 C1            [10]  144 	pop	bc
                            145 ;src/balls.c:42: if (key_serve_is_pressed)
   4C28 3A 82 54      [13]  146 	ld	a,(#_key_serve_is_pressed + 0)
   4C2B B7            [ 4]  147 	or	a, a
   4C2C C8            [11]  148 	ret	Z
                            149 ;src/balls.c:44: serving = 0;
   4C2D 21 7F 54      [10]  150 	ld	hl,#_serving + 0
   4C30 36 00         [10]  151 	ld	(hl), #0x00
                            152 ;src/balls.c:45: ball->dx = 1; // 45 degrees right
   4C32 21 6F 54      [10]  153 	ld	hl, #(_balls + 0x0005)
   4C35 36 01         [10]  154 	ld	(hl), #0x01
                            155 ;src/balls.c:46: ball->dy = -2;
   4C37 21 70 54      [10]  156 	ld	hl, #(_balls + 0x0006)
   4C3A 36 FE         [10]  157 	ld	(hl), #0xfe
                            158 ;src/balls.c:47: ball->prev_x = ball->x;
   4C3C 69            [ 4]  159 	ld	l, c
   4C3D 60            [ 4]  160 	ld	h, b
   4C3E 23            [ 6]  161 	inc	hl
   4C3F 5E            [ 7]  162 	ld	e, (hl)
   4C40 21 6D 54      [10]  163 	ld	hl, #(_balls + 0x0003)
   4C43 73            [ 7]  164 	ld	(hl), e
                            165 ;src/balls.c:48: ball->prev_y = ball->y;
   4C44 69            [ 4]  166 	ld	l, c
   4C45 60            [ 4]  167 	ld	h, b
   4C46 23            [ 6]  168 	inc	hl
   4C47 23            [ 6]  169 	inc	hl
   4C48 4E            [ 7]  170 	ld	c, (hl)
   4C49 21 6E 54      [10]  171 	ld	hl, #(_balls + 0x0004)
   4C4C 71            [ 7]  172 	ld	(hl), c
   4C4D C9            [10]  173 	ret
                            174 ;src/balls.c:53: for (u8 i = 0; i < MAX_BALLS; i++)
   4C4E                     175 00115$:
   4C4E 1E 00         [ 7]  176 	ld	e, #0x00
   4C50                     177 00108$:
   4C50 7B            [ 4]  178 	ld	a, e
   4C51 D6 03         [ 7]  179 	sub	a, #0x03
   4C53 D0            [11]  180 	ret	NC
                            181 ;src/balls.c:55: update_ball(ball);
   4C54 C5            [11]  182 	push	bc
   4C55 D5            [11]  183 	push	de
   4C56 C5            [11]  184 	push	bc
   4C57 CD 4F 4D      [17]  185 	call	_update_ball
   4C5A F1            [10]  186 	pop	af
   4C5B D1            [10]  187 	pop	de
   4C5C C1            [10]  188 	pop	bc
                            189 ;src/balls.c:56: ball++;
   4C5D 21 07 00      [10]  190 	ld	hl, #0x0007
   4C60 09            [11]  191 	add	hl,bc
   4C61 4D            [ 4]  192 	ld	c, l
   4C62 44            [ 4]  193 	ld	b, h
                            194 ;src/balls.c:53: for (u8 i = 0; i < MAX_BALLS; i++)
   4C63 1C            [ 4]  195 	inc	e
   4C64 18 EA         [12]  196 	jr	00108$
                            197 ;src/balls.c:61: void balls_restore_background()
                            198 ;	---------------------------------
                            199 ; Function balls_restore_background
                            200 ; ---------------------------------
   4C66                     201 _balls_restore_background::
   4C66 DD E5         [15]  202 	push	ix
   4C68 DD 21 00 00   [14]  203 	ld	ix,#0
   4C6C DD 39         [15]  204 	add	ix,sp
   4C6E 3B            [ 6]  205 	dec	sp
                            206 ;src/balls.c:63: Ball *ball = balls;
   4C6F 01 6A 54      [10]  207 	ld	bc, #_balls
                            208 ;src/balls.c:64: for (u8 i = 0; i < MAX_BALLS; i++)
   4C72 DD 36 FF 00   [19]  209 	ld	-1 (ix), #0x00
   4C76                     210 00105$:
   4C76 DD 7E FF      [19]  211 	ld	a, -1 (ix)
   4C79 D6 03         [ 7]  212 	sub	a, #0x03
   4C7B 30 29         [12]  213 	jr	NC,00107$
                            214 ;src/balls.c:66: if (ball->active)
   4C7D 0A            [ 7]  215 	ld	a, (bc)
   4C7E B7            [ 4]  216 	or	a, a
   4C7F 28 1A         [12]  217 	jr	Z,00102$
                            218 ;src/balls.c:68: restoreBackground(ball->prev_x, balls->prev_y, SP_BALL_W, SP_BALL_H);
   4C81 21 6E 54      [10]  219 	ld	hl, #_balls + 4
   4C84 5E            [ 7]  220 	ld	e, (hl)
   4C85 69            [ 4]  221 	ld	l, c
   4C86 60            [ 4]  222 	ld	h, b
   4C87 23            [ 6]  223 	inc	hl
   4C88 23            [ 6]  224 	inc	hl
   4C89 23            [ 6]  225 	inc	hl
   4C8A 56            [ 7]  226 	ld	d, (hl)
   4C8B C5            [11]  227 	push	bc
   4C8C 21 03 06      [10]  228 	ld	hl, #0x0603
   4C8F E5            [11]  229 	push	hl
   4C90 7B            [ 4]  230 	ld	a, e
   4C91 F5            [11]  231 	push	af
   4C92 33            [ 6]  232 	inc	sp
   4C93 D5            [11]  233 	push	de
   4C94 33            [ 6]  234 	inc	sp
   4C95 CD 3F 4B      [17]  235 	call	_restoreBackground
   4C98 F1            [10]  236 	pop	af
   4C99 F1            [10]  237 	pop	af
   4C9A C1            [10]  238 	pop	bc
   4C9B                     239 00102$:
                            240 ;src/balls.c:70: ball++;
   4C9B 21 07 00      [10]  241 	ld	hl, #0x0007
   4C9E 09            [11]  242 	add	hl,bc
   4C9F 4D            [ 4]  243 	ld	c, l
   4CA0 44            [ 4]  244 	ld	b, h
                            245 ;src/balls.c:64: for (u8 i = 0; i < MAX_BALLS; i++)
   4CA1 DD 34 FF      [23]  246 	inc	-1 (ix)
   4CA4 18 D0         [12]  247 	jr	00105$
   4CA6                     248 00107$:
   4CA6 33            [ 6]  249 	inc	sp
   4CA7 DD E1         [14]  250 	pop	ix
   4CA9 C9            [10]  251 	ret
                            252 ;src/balls.c:74: void balls_draw()
                            253 ;	---------------------------------
                            254 ; Function balls_draw
                            255 ; ---------------------------------
   4CAA                     256 _balls_draw::
                            257 ;src/balls.c:78: for (u8 i = 0; i < MAX_BALLS; i++)
   4CAA 0E 00         [ 7]  258 	ld	c, #0x00
   4CAC                     259 00105$:
   4CAC 79            [ 4]  260 	ld	a, c
   4CAD D6 03         [ 7]  261 	sub	a, #0x03
   4CAF D0            [11]  262 	ret	NC
                            263 ;src/balls.c:80: if (balls->active)
   4CB0 3A 6A 54      [13]  264 	ld	a, (#_balls + 0)
   4CB3 B7            [ 4]  265 	or	a, a
   4CB4 28 1F         [12]  266 	jr	Z,00106$
                            267 ;src/balls.c:82: svmem = cpct_getScreenPtr(CPCT_VMEM_START, balls->x, balls->y);
   4CB6 21 6C 54      [10]  268 	ld	hl, #_balls + 2
   4CB9 46            [ 7]  269 	ld	b, (hl)
   4CBA 21 6B 54      [10]  270 	ld	hl, #_balls + 1
   4CBD 56            [ 7]  271 	ld	d, (hl)
   4CBE C5            [11]  272 	push	bc
   4CBF 4A            [ 4]  273 	ld	c, d
   4CC0 C5            [11]  274 	push	bc
   4CC1 21 00 C0      [10]  275 	ld	hl, #0xc000
   4CC4 E5            [11]  276 	push	hl
   4CC5 CD 55 53      [17]  277 	call	_cpct_getScreenPtr
   4CC8 11 03 06      [10]  278 	ld	de, #0x0603
   4CCB D5            [11]  279 	push	de
   4CCC E5            [11]  280 	push	hl
   4CCD 21 92 4A      [10]  281 	ld	hl, #_sp_ball
   4CD0 E5            [11]  282 	push	hl
   4CD1 CD 1D 51      [17]  283 	call	_cpct_drawSprite
   4CD4 C1            [10]  284 	pop	bc
   4CD5                     285 00106$:
                            286 ;src/balls.c:78: for (u8 i = 0; i < MAX_BALLS; i++)
   4CD5 0C            [ 4]  287 	inc	c
   4CD6 18 D4         [12]  288 	jr	00105$
                            289 ;src/balls.c:88: Ball * balls_get_first_active() {
                            290 ;	---------------------------------
                            291 ; Function balls_get_first_active
                            292 ; ---------------------------------
   4CD8                     293 _balls_get_first_active::
   4CD8 DD E5         [15]  294 	push	ix
   4CDA DD 21 00 00   [14]  295 	ld	ix,#0
   4CDE DD 39         [15]  296 	add	ix,sp
   4CE0 F5            [11]  297 	push	af
                            298 ;src/balls.c:89: Ball *ball = balls;
   4CE1 DD 36 FE 6A   [19]  299 	ld	-2 (ix), #<(_balls)
   4CE5 DD 36 FF 54   [19]  300 	ld	-1 (ix), #>(_balls)
                            301 ;src/balls.c:90: for (u8 i = 0; i < MAX_BALLS; i++)
   4CE9 E1            [10]  302 	pop	hl
   4CEA E5            [11]  303 	push	hl
   4CEB 0E 00         [ 7]  304 	ld	c, #0x00
   4CED                     305 00105$:
   4CED 79            [ 4]  306 	ld	a, c
   4CEE D6 03         [ 7]  307 	sub	a, #0x03
   4CF0 30 12         [12]  308 	jr	NC,00103$
                            309 ;src/balls.c:92: if (ball->active)
   4CF2 7E            [ 7]  310 	ld	a, (hl)
   4CF3 B7            [ 4]  311 	or	a, a
   4CF4 28 04         [12]  312 	jr	Z,00102$
                            313 ;src/balls.c:94: return ball;
   4CF6 E1            [10]  314 	pop	hl
   4CF7 E5            [11]  315 	push	hl
   4CF8 18 0D         [12]  316 	jr	00107$
   4CFA                     317 00102$:
                            318 ;src/balls.c:96: ball++;
   4CFA 11 07 00      [10]  319 	ld	de, #0x0007
   4CFD 19            [11]  320 	add	hl, de
   4CFE 33            [ 6]  321 	inc	sp
   4CFF 33            [ 6]  322 	inc	sp
   4D00 E5            [11]  323 	push	hl
                            324 ;src/balls.c:90: for (u8 i = 0; i < MAX_BALLS; i++)
   4D01 0C            [ 4]  325 	inc	c
   4D02 18 E9         [12]  326 	jr	00105$
   4D04                     327 00103$:
                            328 ;src/balls.c:98: return NULL;
   4D04 21 00 00      [10]  329 	ld	hl, #0x0000
   4D07                     330 00107$:
   4D07 DD F9         [10]  331 	ld	sp, ix
   4D09 DD E1         [14]  332 	pop	ix
   4D0B C9            [10]  333 	ret
                            334 ;src/balls.c:105: void center_ball(Ball *ball)
                            335 ;	---------------------------------
                            336 ; Function center_ball
                            337 ; ---------------------------------
   4D0C                     338 _center_ball::
   4D0C DD E5         [15]  339 	push	ix
   4D0E DD 21 00 00   [14]  340 	ld	ix,#0
   4D12 DD 39         [15]  341 	add	ix,sp
                            342 ;src/balls.c:107: ball->prev_x = ball->x;
   4D14 DD 4E 04      [19]  343 	ld	c,4 (ix)
   4D17 DD 46 05      [19]  344 	ld	b,5 (ix)
   4D1A C5            [11]  345 	push	bc
   4D1B FD E1         [14]  346 	pop	iy
   4D1D FD 23         [10]  347 	inc	iy
   4D1F FD 23         [10]  348 	inc	iy
   4D21 FD 23         [10]  349 	inc	iy
   4D23 59            [ 4]  350 	ld	e, c
   4D24 50            [ 4]  351 	ld	d, b
   4D25 13            [ 6]  352 	inc	de
   4D26 1A            [ 7]  353 	ld	a, (de)
   4D27 FD 77 00      [19]  354 	ld	0 (iy), a
                            355 ;src/balls.c:108: ball->prev_y = ball->y;
   4D2A FD 21 04 00   [14]  356 	ld	iy, #0x0004
   4D2E FD 09         [15]  357 	add	iy, bc
   4D30 03            [ 6]  358 	inc	bc
   4D31 03            [ 6]  359 	inc	bc
   4D32 0A            [ 7]  360 	ld	a, (bc)
   4D33 FD 77 00      [19]  361 	ld	0 (iy), a
                            362 ;src/balls.c:109: ball->x = batX + (batW / 4);
   4D36 FD 21 86 54   [14]  363 	ld	iy, #_batW
   4D3A FD 6E 00      [19]  364 	ld	l, 0 (iy)
   4D3D CB 3D         [ 8]  365 	srl	l
   4D3F CB 3D         [ 8]  366 	srl	l
   4D41 3A 84 54      [13]  367 	ld	a,(#_batX + 0)
   4D44 85            [ 4]  368 	add	a, l
   4D45 12            [ 7]  369 	ld	(de), a
                            370 ;src/balls.c:110: ball->y = batY - SP_BALL_H;
   4D46 3A 83 54      [13]  371 	ld	a,(#_batY + 0)
   4D49 C6 FA         [ 7]  372 	add	a, #0xfa
   4D4B 02            [ 7]  373 	ld	(bc), a
   4D4C DD E1         [14]  374 	pop	ix
   4D4E C9            [10]  375 	ret
                            376 ;src/balls.c:113: void update_ball(Ball *ball)
                            377 ;	---------------------------------
                            378 ; Function update_ball
                            379 ; ---------------------------------
   4D4F                     380 _update_ball::
   4D4F DD E5         [15]  381 	push	ix
   4D51 DD 21 00 00   [14]  382 	ld	ix,#0
   4D55 DD 39         [15]  383 	add	ix,sp
   4D57 21 F3 FF      [10]  384 	ld	hl, #-13
   4D5A 39            [11]  385 	add	hl, sp
   4D5B F9            [ 6]  386 	ld	sp, hl
                            387 ;src/balls.c:115: ball->prev_x = ball->x;
   4D5C DD 7E 04      [19]  388 	ld	a, 4 (ix)
   4D5F DD 77 F7      [19]  389 	ld	-9 (ix), a
   4D62 DD 7E 05      [19]  390 	ld	a, 5 (ix)
   4D65 DD 77 F8      [19]  391 	ld	-8 (ix), a
   4D68 DD 4E F7      [19]  392 	ld	c,-9 (ix)
   4D6B DD 46 F8      [19]  393 	ld	b,-8 (ix)
   4D6E 03            [ 6]  394 	inc	bc
   4D6F 03            [ 6]  395 	inc	bc
   4D70 03            [ 6]  396 	inc	bc
   4D71 DD 7E F7      [19]  397 	ld	a, -9 (ix)
   4D74 C6 01         [ 7]  398 	add	a, #0x01
   4D76 DD 77 F5      [19]  399 	ld	-11 (ix), a
   4D79 DD 7E F8      [19]  400 	ld	a, -8 (ix)
   4D7C CE 00         [ 7]  401 	adc	a, #0x00
   4D7E DD 77 F6      [19]  402 	ld	-10 (ix), a
   4D81 DD 6E F5      [19]  403 	ld	l,-11 (ix)
   4D84 DD 66 F6      [19]  404 	ld	h,-10 (ix)
   4D87 7E            [ 7]  405 	ld	a, (hl)
   4D88 02            [ 7]  406 	ld	(bc), a
                            407 ;src/balls.c:116: ball->prev_y = ball->y;
   4D89 DD 7E F7      [19]  408 	ld	a, -9 (ix)
   4D8C C6 04         [ 7]  409 	add	a, #0x04
   4D8E 4F            [ 4]  410 	ld	c, a
   4D8F DD 7E F8      [19]  411 	ld	a, -8 (ix)
   4D92 CE 00         [ 7]  412 	adc	a, #0x00
   4D94 47            [ 4]  413 	ld	b, a
   4D95 DD 7E F7      [19]  414 	ld	a, -9 (ix)
   4D98 C6 02         [ 7]  415 	add	a, #0x02
   4D9A DD 77 FE      [19]  416 	ld	-2 (ix), a
   4D9D DD 7E F8      [19]  417 	ld	a, -8 (ix)
   4DA0 CE 00         [ 7]  418 	adc	a, #0x00
   4DA2 DD 77 FF      [19]  419 	ld	-1 (ix), a
   4DA5 DD 6E FE      [19]  420 	ld	l,-2 (ix)
   4DA8 DD 66 FF      [19]  421 	ld	h,-1 (ix)
   4DAB 7E            [ 7]  422 	ld	a, (hl)
   4DAC 02            [ 7]  423 	ld	(bc), a
                            424 ;src/balls.c:118: if (ball->active)
   4DAD DD 6E F7      [19]  425 	ld	l,-9 (ix)
   4DB0 DD 66 F8      [19]  426 	ld	h,-8 (ix)
   4DB3 7E            [ 7]  427 	ld	a, (hl)
   4DB4 DD 77 FD      [19]  428 	ld	-3 (ix), a
   4DB7 B7            [ 4]  429 	or	a, a
   4DB8 CA C8 4E      [10]  430 	jp	Z, 00121$
                            431 ;src/balls.c:120: u8 new_x = ball->x + ball->dx;
   4DBB DD 6E F5      [19]  432 	ld	l,-11 (ix)
   4DBE DD 66 F6      [19]  433 	ld	h,-10 (ix)
   4DC1 7E            [ 7]  434 	ld	a, (hl)
   4DC2 DD 77 FD      [19]  435 	ld	-3 (ix), a
   4DC5 DD 7E F7      [19]  436 	ld	a, -9 (ix)
   4DC8 C6 05         [ 7]  437 	add	a, #0x05
   4DCA DD 77 FB      [19]  438 	ld	-5 (ix), a
   4DCD DD 7E F8      [19]  439 	ld	a, -8 (ix)
   4DD0 CE 00         [ 7]  440 	adc	a, #0x00
   4DD2 DD 77 FC      [19]  441 	ld	-4 (ix), a
   4DD5 DD 6E FB      [19]  442 	ld	l,-5 (ix)
   4DD8 DD 66 FC      [19]  443 	ld	h,-4 (ix)
   4DDB 7E            [ 7]  444 	ld	a, (hl)
   4DDC DD 77 FA      [19]  445 	ld	-6 (ix), a
   4DDF DD 7E FD      [19]  446 	ld	a, -3 (ix)
   4DE2 DD 86 FA      [19]  447 	add	a, -6 (ix)
   4DE5 DD 77 F4      [19]  448 	ld	-12 (ix), a
                            449 ;src/balls.c:121: u8 new_y = ball->y + ball->dy;
   4DE8 DD 6E FE      [19]  450 	ld	l,-2 (ix)
   4DEB DD 66 FF      [19]  451 	ld	h,-1 (ix)
   4DEE 7E            [ 7]  452 	ld	a, (hl)
   4DEF DD 77 FD      [19]  453 	ld	-3 (ix), a
   4DF2 DD 7E F7      [19]  454 	ld	a, -9 (ix)
   4DF5 C6 06         [ 7]  455 	add	a, #0x06
   4DF7 DD 77 F7      [19]  456 	ld	-9 (ix), a
   4DFA DD 7E F8      [19]  457 	ld	a, -8 (ix)
   4DFD CE 00         [ 7]  458 	adc	a, #0x00
   4DFF DD 77 F8      [19]  459 	ld	-8 (ix), a
   4E02 DD 6E F7      [19]  460 	ld	l,-9 (ix)
   4E05 DD 66 F8      [19]  461 	ld	h,-8 (ix)
   4E08 7E            [ 7]  462 	ld	a, (hl)
   4E09 DD 77 F9      [19]  463 	ld	-7 (ix), a
   4E0C DD 7E FD      [19]  464 	ld	a, -3 (ix)
   4E0F DD 86 F9      [19]  465 	add	a, -7 (ix)
   4E12 DD 77 F3      [19]  466 	ld	-13 (ix), a
   4E15 4F            [ 4]  467 	ld	c, a
                            468 ;src/balls.c:122: if (ball->dx > 0)
   4E16 AF            [ 4]  469 	xor	a, a
   4E17 DD 96 FA      [19]  470 	sub	a, -6 (ix)
   4E1A E2 1F 4E      [10]  471 	jp	PO, 00151$
   4E1D EE 80         [ 7]  472 	xor	a, #0x80
   4E1F                     473 00151$:
   4E1F F2 50 4E      [10]  474 	jp	P, 00108$
                            475 ;src/balls.c:124: if (new_x >= PLAY_AREA_RIGHT_EDGE - SP_BALL_W)
   4E22 DD 7E F4      [19]  476 	ld	a, -12 (ix)
   4E25 D6 3F         [ 7]  477 	sub	a, #0x3f
   4E27 38 1B         [12]  478 	jr	C,00102$
                            479 ;src/balls.c:126: ball->x = PLAY_AREA_RIGHT_EDGE - SP_BALL_W;
   4E29 DD 6E F5      [19]  480 	ld	l,-11 (ix)
   4E2C DD 66 F6      [19]  481 	ld	h,-10 (ix)
   4E2F 36 3F         [10]  482 	ld	(hl), #0x3f
                            483 ;src/balls.c:127: ball->dx = -ball->dx;
   4E31 DD 6E FB      [19]  484 	ld	l,-5 (ix)
   4E34 DD 66 FC      [19]  485 	ld	h,-4 (ix)
   4E37 46            [ 7]  486 	ld	b, (hl)
   4E38 AF            [ 4]  487 	xor	a, a
   4E39 90            [ 4]  488 	sub	a, b
   4E3A 47            [ 4]  489 	ld	b, a
   4E3B DD 6E FB      [19]  490 	ld	l,-5 (ix)
   4E3E DD 66 FC      [19]  491 	ld	h,-4 (ix)
   4E41 70            [ 7]  492 	ld	(hl), b
   4E42 18 38         [12]  493 	jr	00109$
   4E44                     494 00102$:
                            495 ;src/balls.c:131: ball->x = new_x;
   4E44 DD 6E F5      [19]  496 	ld	l,-11 (ix)
   4E47 DD 66 F6      [19]  497 	ld	h,-10 (ix)
   4E4A DD 7E F4      [19]  498 	ld	a, -12 (ix)
   4E4D 77            [ 7]  499 	ld	(hl), a
   4E4E 18 2C         [12]  500 	jr	00109$
   4E50                     501 00108$:
                            502 ;src/balls.c:137: if (new_x <= PLAY_AREA_LEFT_EDGE)
   4E50 3E 0C         [ 7]  503 	ld	a, #0x0c
   4E52 DD 96 F4      [19]  504 	sub	a, -12 (ix)
   4E55 38 1B         [12]  505 	jr	C,00105$
                            506 ;src/balls.c:139: ball->x = PLAY_AREA_LEFT_EDGE;
   4E57 DD 6E F5      [19]  507 	ld	l,-11 (ix)
   4E5A DD 66 F6      [19]  508 	ld	h,-10 (ix)
   4E5D 36 0C         [10]  509 	ld	(hl), #0x0c
                            510 ;src/balls.c:140: ball->dx = -ball->dx;
   4E5F DD 6E FB      [19]  511 	ld	l,-5 (ix)
   4E62 DD 66 FC      [19]  512 	ld	h,-4 (ix)
   4E65 46            [ 7]  513 	ld	b, (hl)
   4E66 AF            [ 4]  514 	xor	a, a
   4E67 90            [ 4]  515 	sub	a, b
   4E68 47            [ 4]  516 	ld	b, a
   4E69 DD 6E FB      [19]  517 	ld	l,-5 (ix)
   4E6C DD 66 FC      [19]  518 	ld	h,-4 (ix)
   4E6F 70            [ 7]  519 	ld	(hl), b
   4E70 18 0A         [12]  520 	jr	00109$
   4E72                     521 00105$:
                            522 ;src/balls.c:144: ball->x = new_x;
   4E72 DD 6E F5      [19]  523 	ld	l,-11 (ix)
   4E75 DD 66 F6      [19]  524 	ld	h,-10 (ix)
   4E78 DD 7E F4      [19]  525 	ld	a, -12 (ix)
   4E7B 77            [ 7]  526 	ld	(hl), a
   4E7C                     527 00109$:
                            528 ;src/balls.c:148: if (ball->dy < 0)
   4E7C DD 6E F7      [19]  529 	ld	l,-9 (ix)
   4E7F DD 66 F8      [19]  530 	ld	h,-8 (ix)
   4E82 46            [ 7]  531 	ld	b, (hl)
   4E83 CB 78         [ 8]  532 	bit	7, b
   4E85 28 29         [12]  533 	jr	Z,00117$
                            534 ;src/balls.c:150: if (new_y <= PLAY_AREA_TOP_EDGE)
   4E87 3E 18         [ 7]  535 	ld	a, #0x18
   4E89 91            [ 4]  536 	sub	a, c
   4E8A 38 1B         [12]  537 	jr	C,00111$
                            538 ;src/balls.c:152: ball->y = PLAY_AREA_TOP_EDGE;
   4E8C DD 6E FE      [19]  539 	ld	l,-2 (ix)
   4E8F DD 66 FF      [19]  540 	ld	h,-1 (ix)
   4E92 36 18         [10]  541 	ld	(hl), #0x18
                            542 ;src/balls.c:153: ball->dy = -ball->dy;
   4E94 DD 6E F7      [19]  543 	ld	l,-9 (ix)
   4E97 DD 66 F8      [19]  544 	ld	h,-8 (ix)
   4E9A 4E            [ 7]  545 	ld	c, (hl)
   4E9B AF            [ 4]  546 	xor	a, a
   4E9C 91            [ 4]  547 	sub	a, c
   4E9D 4F            [ 4]  548 	ld	c, a
   4E9E DD 6E F7      [19]  549 	ld	l,-9 (ix)
   4EA1 DD 66 F8      [19]  550 	ld	h,-8 (ix)
   4EA4 71            [ 7]  551 	ld	(hl), c
   4EA5 18 21         [12]  552 	jr	00121$
   4EA7                     553 00111$:
                            554 ;src/balls.c:157: ball->y = new_y;
   4EA7 DD 6E FE      [19]  555 	ld	l,-2 (ix)
   4EAA DD 66 FF      [19]  556 	ld	h,-1 (ix)
   4EAD 71            [ 7]  557 	ld	(hl), c
   4EAE 18 18         [12]  558 	jr	00121$
   4EB0                     559 00117$:
                            560 ;src/balls.c:162: if (new_y >= YOUR_DEAD_PIXEL_ROW)
   4EB0 79            [ 4]  561 	ld	a, c
   4EB1 D6 C2         [ 7]  562 	sub	a, #0xc2
   4EB3 38 0C         [12]  563 	jr	C,00114$
                            564 ;src/balls.c:165: ball->dy = -ball->dy;
   4EB5 AF            [ 4]  565 	xor	a, a
   4EB6 90            [ 4]  566 	sub	a, b
   4EB7 4F            [ 4]  567 	ld	c, a
   4EB8 DD 6E F7      [19]  568 	ld	l,-9 (ix)
   4EBB DD 66 F8      [19]  569 	ld	h,-8 (ix)
   4EBE 71            [ 7]  570 	ld	(hl), c
   4EBF 18 07         [12]  571 	jr	00121$
   4EC1                     572 00114$:
                            573 ;src/balls.c:169: ball->y = new_y;
   4EC1 DD 6E FE      [19]  574 	ld	l,-2 (ix)
   4EC4 DD 66 FF      [19]  575 	ld	h,-1 (ix)
   4EC7 71            [ 7]  576 	ld	(hl), c
   4EC8                     577 00121$:
   4EC8 DD F9         [10]  578 	ld	sp, ix
   4ECA DD E1         [14]  579 	pop	ix
   4ECC C9            [10]  580 	ret
                            581 	.area _CODE
                            582 	.area _INITIALIZER
                            583 	.area _CABS (ABS)
