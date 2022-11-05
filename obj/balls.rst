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
                             11 	.globl _background_bounce_ball
                             12 	.globl _background_restore_world_coords
                             13 	.globl _blocks_bounce_ball
                             14 	.globl _bat_bounce_ball
                             15 	.globl _cpct_getScreenPtr
                             16 	.globl _cpct_drawSpriteMasked
                             17 	.globl _serving
                             18 	.globl _all_balls
                             19 	.globl _balls_initialize
                             20 	.globl _balls_update
                             21 	.globl _balls_restore_background
                             22 	.globl _balls_draw
                             23 	.globl _balls_get_first_active
                             24 	.globl _initialize_balls
                             25 	.globl _center_ball
                             26 	.globl _handle_serve
                             27 	.globl _update_ball
                             28 ;--------------------------------------------------------
                             29 ; special function registers
                             30 ;--------------------------------------------------------
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _DATA
   839E                      35 _all_balls::
   839E                      36 	.ds 39
   83C5                      37 _serving::
   83C5                      38 	.ds 1
                             39 ;--------------------------------------------------------
                             40 ; ram data
                             41 ;--------------------------------------------------------
                             42 	.area _INITIALIZED
                             43 ;--------------------------------------------------------
                             44 ; absolute external ram data
                             45 ;--------------------------------------------------------
                             46 	.area _DABS (ABS)
                             47 ;--------------------------------------------------------
                             48 ; global & static initialisations
                             49 ;--------------------------------------------------------
                             50 	.area _HOME
                             51 	.area _GSINIT
                             52 	.area _GSFINAL
                             53 	.area _GSINIT
                             54 ;--------------------------------------------------------
                             55 ; Home
                             56 ;--------------------------------------------------------
                             57 	.area _HOME
                             58 	.area _HOME
                             59 ;--------------------------------------------------------
                             60 ; code
                             61 ;--------------------------------------------------------
                             62 	.area _CODE
                             63 ;src/balls.c:31: void balls_initialize()
                             64 ;	---------------------------------
                             65 ; Function balls_initialize
                             66 ; ---------------------------------
   6B67                      67 _balls_initialize::
                             68 ;src/balls.c:34: serving = 1;
   6B67 21 C5 83      [10]   69 	ld	hl,#_serving + 0
   6B6A 36 01         [10]   70 	ld	(hl), #0x01
                             71 ;src/balls.c:36: initialize_balls();
   6B6C CD 8E 6C      [17]   72 	call	_initialize_balls
                             73 ;src/balls.c:39: center_ball(all_balls);
   6B6F 21 9E 83      [10]   74 	ld	hl, #_all_balls
   6B72 E5            [11]   75 	push	hl
   6B73 CD DF 6C      [17]   76 	call	_center_ball
   6B76 F1            [10]   77 	pop	af
   6B77 C9            [10]   78 	ret
                             79 ;src/balls.c:42: void balls_update()
                             80 ;	---------------------------------
                             81 ; Function balls_update
                             82 ; ---------------------------------
   6B78                      83 _balls_update::
                             84 ;src/balls.c:44: Ball *ball = all_balls;
   6B78 01 9E 83      [10]   85 	ld	bc, #_all_balls+0
                             86 ;src/balls.c:45: if (serving)
   6B7B 3A C5 83      [13]   87 	ld	a,(#_serving + 0)
   6B7E B7            [ 4]   88 	or	a, a
   6B7F 28 12         [12]   89 	jr	Z,00115$
                             90 ;src/balls.c:47: center_ball(ball);
   6B81 C5            [11]   91 	push	bc
   6B82 C5            [11]   92 	push	bc
   6B83 CD DF 6C      [17]   93 	call	_center_ball
   6B86 F1            [10]   94 	pop	af
   6B87 C1            [10]   95 	pop	bc
                             96 ;src/balls.c:48: if (key_serve_is_pressed)
   6B88 3A 31 88      [13]   97 	ld	a,(#_key_serve_is_pressed + 0)
   6B8B B7            [ 4]   98 	or	a, a
   6B8C C8            [11]   99 	ret	Z
                            100 ;src/balls.c:50: handle_serve(ball);
   6B8D C5            [11]  101 	push	bc
   6B8E CD 49 6D      [17]  102 	call	_handle_serve
   6B91 F1            [10]  103 	pop	af
   6B92 C9            [10]  104 	ret
                            105 ;src/balls.c:55: for (u8 i = 0; i < MAX_BALLS; i++)
   6B93                     106 00115$:
   6B93 1E 00         [ 7]  107 	ld	e, #0x00
   6B95                     108 00108$:
   6B95 7B            [ 4]  109 	ld	a, e
   6B96 D6 03         [ 7]  110 	sub	a, #0x03
   6B98 D0            [11]  111 	ret	NC
                            112 ;src/balls.c:57: update_ball(ball);
   6B99 C5            [11]  113 	push	bc
   6B9A D5            [11]  114 	push	de
   6B9B C5            [11]  115 	push	bc
   6B9C CD 95 6D      [17]  116 	call	_update_ball
   6B9F F1            [10]  117 	pop	af
   6BA0 D1            [10]  118 	pop	de
   6BA1 C1            [10]  119 	pop	bc
                            120 ;src/balls.c:58: ball++;
   6BA2 21 0D 00      [10]  121 	ld	hl, #0x000d
   6BA5 09            [11]  122 	add	hl,bc
   6BA6 4D            [ 4]  123 	ld	c, l
   6BA7 44            [ 4]  124 	ld	b, h
                            125 ;src/balls.c:55: for (u8 i = 0; i < MAX_BALLS; i++)
   6BA8 1C            [ 4]  126 	inc	e
   6BA9 18 EA         [12]  127 	jr	00108$
                            128 ;src/balls.c:63: void balls_restore_background()
                            129 ;	---------------------------------
                            130 ; Function balls_restore_background
                            131 ; ---------------------------------
   6BAB                     132 _balls_restore_background::
   6BAB DD E5         [15]  133 	push	ix
   6BAD DD 21 00 00   [14]  134 	ld	ix,#0
   6BB1 DD 39         [15]  135 	add	ix,sp
   6BB3 F5            [11]  136 	push	af
   6BB4 3B            [ 6]  137 	dec	sp
                            138 ;src/balls.c:65: Ball *ball = all_balls;
   6BB5 01 9E 83      [10]  139 	ld	bc, #_all_balls+0
                            140 ;src/balls.c:66: for (u8 i = 0; i < MAX_BALLS; i++)
   6BB8 DD 36 FD 00   [19]  141 	ld	-3 (ix), #0x00
   6BBC                     142 00105$:
   6BBC DD 7E FD      [19]  143 	ld	a, -3 (ix)
   6BBF D6 03         [ 7]  144 	sub	a, #0x03
   6BC1 30 3D         [12]  145 	jr	NC,00107$
                            146 ;src/balls.c:68: if (ball->active)
   6BC3 0A            [ 7]  147 	ld	a, (bc)
   6BC4 B7            [ 4]  148 	or	a, a
   6BC5 28 2E         [12]  149 	jr	Z,00102$
                            150 ;src/balls.c:70: background_restore_world_coords(ball->prev_x, ball->prev_y, SP_BALL_W, SP_BALL_H);
   6BC7 69            [ 4]  151 	ld	l, c
   6BC8 60            [ 4]  152 	ld	h, b
   6BC9 11 07 00      [10]  153 	ld	de, #0x0007
   6BCC 19            [11]  154 	add	hl, de
   6BCD 5E            [ 7]  155 	ld	e, (hl)
   6BCE 23            [ 6]  156 	inc	hl
   6BCF 56            [ 7]  157 	ld	d, (hl)
   6BD0 C5            [11]  158 	push	bc
   6BD1 FD E1         [14]  159 	pop	iy
   6BD3 FD 7E 05      [19]  160 	ld	a, 5 (iy)
   6BD6 DD 77 FE      [19]  161 	ld	-2 (ix), a
   6BD9 FD 7E 06      [19]  162 	ld	a, 6 (iy)
   6BDC DD 77 FF      [19]  163 	ld	-1 (ix), a
   6BDF C5            [11]  164 	push	bc
   6BE0 21 03 06      [10]  165 	ld	hl, #0x0603
   6BE3 E5            [11]  166 	push	hl
   6BE4 D5            [11]  167 	push	de
   6BE5 DD 6E FE      [19]  168 	ld	l,-2 (ix)
   6BE8 DD 66 FF      [19]  169 	ld	h,-1 (ix)
   6BEB E5            [11]  170 	push	hl
   6BEC CD 5E 6A      [17]  171 	call	_background_restore_world_coords
   6BEF 21 06 00      [10]  172 	ld	hl, #6
   6BF2 39            [11]  173 	add	hl, sp
   6BF3 F9            [ 6]  174 	ld	sp, hl
   6BF4 C1            [10]  175 	pop	bc
   6BF5                     176 00102$:
                            177 ;src/balls.c:72: ball++;
   6BF5 21 0D 00      [10]  178 	ld	hl, #0x000d
   6BF8 09            [11]  179 	add	hl,bc
   6BF9 4D            [ 4]  180 	ld	c, l
   6BFA 44            [ 4]  181 	ld	b, h
                            182 ;src/balls.c:66: for (u8 i = 0; i < MAX_BALLS; i++)
   6BFB DD 34 FD      [23]  183 	inc	-3 (ix)
   6BFE 18 BC         [12]  184 	jr	00105$
   6C00                     185 00107$:
   6C00 DD F9         [10]  186 	ld	sp, ix
   6C02 DD E1         [14]  187 	pop	ix
   6C04 C9            [10]  188 	ret
                            189 ;src/balls.c:76: void balls_draw()
                            190 ;	---------------------------------
                            191 ; Function balls_draw
                            192 ; ---------------------------------
   6C05                     193 _balls_draw::
   6C05 DD E5         [15]  194 	push	ix
   6C07 DD 21 00 00   [14]  195 	ld	ix,#0
   6C0B DD 39         [15]  196 	add	ix,sp
   6C0D 3B            [ 6]  197 	dec	sp
                            198 ;src/balls.c:79: Ball *ball = all_balls;
   6C0E 01 9E 83      [10]  199 	ld	bc, #_all_balls+0
                            200 ;src/balls.c:80: for (u8 i = 0; i < MAX_BALLS; i++)
   6C11 DD 36 FF 00   [19]  201 	ld	-1 (ix), #0x00
   6C15                     202 00105$:
   6C15 DD 7E FF      [19]  203 	ld	a, -1 (ix)
   6C18 D6 03         [ 7]  204 	sub	a, #0x03
   6C1A 30 3A         [12]  205 	jr	NC,00107$
                            206 ;src/balls.c:82: if (ball->active)
   6C1C 0A            [ 7]  207 	ld	a, (bc)
   6C1D B7            [ 4]  208 	or	a, a
   6C1E 28 31         [12]  209 	jr	Z,00106$
                            210 ;src/balls.c:84: svmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(ball->x), W_2_S_Y(ball->y));
   6C20 69            [ 4]  211 	ld	l, c
   6C21 60            [ 4]  212 	ld	h, b
   6C22 23            [ 6]  213 	inc	hl
   6C23 23            [ 6]  214 	inc	hl
   6C24 23            [ 6]  215 	inc	hl
   6C25 5E            [ 7]  216 	ld	e, (hl)
   6C26 23            [ 6]  217 	inc	hl
   6C27 56            [ 7]  218 	ld	d, (hl)
   6C28 7B            [ 4]  219 	ld	a, e
   6C29 C6 08         [ 7]  220 	add	a, #0x08
   6C2B 57            [ 4]  221 	ld	d, a
   6C2C 69            [ 4]  222 	ld	l, c
   6C2D 60            [ 4]  223 	ld	h, b
   6C2E 23            [ 6]  224 	inc	hl
   6C2F 7E            [ 7]  225 	ld	a, (hl)
   6C30 23            [ 6]  226 	inc	hl
   6C31 66            [ 7]  227 	ld	h, (hl)
   6C32 C6 0C         [ 7]  228 	add	a, #0x0c
   6C34 C5            [11]  229 	push	bc
   6C35 5F            [ 4]  230 	ld	e, a
   6C36 D5            [11]  231 	push	de
   6C37 21 00 C0      [10]  232 	ld	hl, #0xc000
   6C3A E5            [11]  233 	push	hl
   6C3B CD C9 82      [17]  234 	call	_cpct_getScreenPtr
   6C3E 11 03 06      [10]  235 	ld	de, #0x0603
   6C41 D5            [11]  236 	push	de
   6C42 E5            [11]  237 	push	hl
   6C43 21 7A 7B      [10]  238 	ld	hl, #_sp_masked_ball
   6C46 E5            [11]  239 	push	hl
   6C47 CD FB 80      [17]  240 	call	_cpct_drawSpriteMasked
   6C4A C1            [10]  241 	pop	bc
                            242 ;src/balls.c:88: ball++;
   6C4B 21 0D 00      [10]  243 	ld	hl, #0x000d
   6C4E 09            [11]  244 	add	hl,bc
   6C4F 4D            [ 4]  245 	ld	c, l
   6C50 44            [ 4]  246 	ld	b, h
   6C51                     247 00106$:
                            248 ;src/balls.c:80: for (u8 i = 0; i < MAX_BALLS; i++)
   6C51 DD 34 FF      [23]  249 	inc	-1 (ix)
   6C54 18 BF         [12]  250 	jr	00105$
   6C56                     251 00107$:
   6C56 33            [ 6]  252 	inc	sp
   6C57 DD E1         [14]  253 	pop	ix
   6C59 C9            [10]  254 	ret
                            255 ;src/balls.c:93: Ball *balls_get_first_active()
                            256 ;	---------------------------------
                            257 ; Function balls_get_first_active
                            258 ; ---------------------------------
   6C5A                     259 _balls_get_first_active::
   6C5A DD E5         [15]  260 	push	ix
   6C5C DD 21 00 00   [14]  261 	ld	ix,#0
   6C60 DD 39         [15]  262 	add	ix,sp
   6C62 F5            [11]  263 	push	af
                            264 ;src/balls.c:95: Ball *ball = all_balls;
   6C63 DD 36 FE 9E   [19]  265 	ld	-2 (ix), #<(_all_balls)
   6C67 DD 36 FF 83   [19]  266 	ld	-1 (ix), #>(_all_balls)
                            267 ;src/balls.c:96: for (u8 i = 0; i < MAX_BALLS; i++)
   6C6B E1            [10]  268 	pop	hl
   6C6C E5            [11]  269 	push	hl
   6C6D 0E 00         [ 7]  270 	ld	c, #0x00
   6C6F                     271 00105$:
   6C6F 79            [ 4]  272 	ld	a, c
   6C70 D6 03         [ 7]  273 	sub	a, #0x03
   6C72 30 12         [12]  274 	jr	NC,00103$
                            275 ;src/balls.c:98: if (ball->active)
   6C74 7E            [ 7]  276 	ld	a, (hl)
   6C75 B7            [ 4]  277 	or	a, a
   6C76 28 04         [12]  278 	jr	Z,00102$
                            279 ;src/balls.c:100: return ball;
   6C78 E1            [10]  280 	pop	hl
   6C79 E5            [11]  281 	push	hl
   6C7A 18 0D         [12]  282 	jr	00107$
   6C7C                     283 00102$:
                            284 ;src/balls.c:102: ball++;
   6C7C 11 0D 00      [10]  285 	ld	de, #0x000d
   6C7F 19            [11]  286 	add	hl, de
   6C80 33            [ 6]  287 	inc	sp
   6C81 33            [ 6]  288 	inc	sp
   6C82 E5            [11]  289 	push	hl
                            290 ;src/balls.c:96: for (u8 i = 0; i < MAX_BALLS; i++)
   6C83 0C            [ 4]  291 	inc	c
   6C84 18 E9         [12]  292 	jr	00105$
   6C86                     293 00103$:
                            294 ;src/balls.c:104: return NULL;
   6C86 21 00 00      [10]  295 	ld	hl, #0x0000
   6C89                     296 00107$:
   6C89 DD F9         [10]  297 	ld	sp, ix
   6C8B DD E1         [14]  298 	pop	ix
   6C8D C9            [10]  299 	ret
                            300 ;src/balls.c:111: void initialize_balls()
                            301 ;	---------------------------------
                            302 ; Function initialize_balls
                            303 ; ---------------------------------
   6C8E                     304 _initialize_balls::
                            305 ;src/balls.c:114: for (u8 i = 0; i < MAX_BALLS; i++)
   6C8E 0E 00         [ 7]  306 	ld	c, #0x00
   6C90                     307 00103$:
   6C90 79            [ 4]  308 	ld	a, c
   6C91 D6 03         [ 7]  309 	sub	a, #0x03
   6C93 30 44         [12]  310 	jr	NC,00101$
                            311 ;src/balls.c:116: all_balls[i].active = 0;
   6C95 06 00         [ 7]  312 	ld	b,#0x00
   6C97 69            [ 4]  313 	ld	l, c
   6C98 60            [ 4]  314 	ld	h, b
   6C99 29            [11]  315 	add	hl, hl
   6C9A 09            [11]  316 	add	hl, bc
   6C9B 29            [11]  317 	add	hl, hl
   6C9C 29            [11]  318 	add	hl, hl
   6C9D 09            [11]  319 	add	hl, bc
   6C9E EB            [ 4]  320 	ex	de,hl
   6C9F 21 9E 83      [10]  321 	ld	hl, #_all_balls
   6CA2 19            [11]  322 	add	hl,de
   6CA3 EB            [ 4]  323 	ex	de,hl
   6CA4 AF            [ 4]  324 	xor	a, a
   6CA5 12            [ 7]  325 	ld	(de), a
                            326 ;src/balls.c:117: all_balls[i].x = 0;
   6CA6 6B            [ 4]  327 	ld	l, e
   6CA7 62            [ 4]  328 	ld	h, d
   6CA8 23            [ 6]  329 	inc	hl
   6CA9 AF            [ 4]  330 	xor	a, a
   6CAA 77            [ 7]  331 	ld	(hl), a
   6CAB 23            [ 6]  332 	inc	hl
   6CAC 77            [ 7]  333 	ld	(hl), a
                            334 ;src/balls.c:118: all_balls[i].y = 0;
   6CAD 6B            [ 4]  335 	ld	l, e
   6CAE 62            [ 4]  336 	ld	h, d
   6CAF 23            [ 6]  337 	inc	hl
   6CB0 23            [ 6]  338 	inc	hl
   6CB1 23            [ 6]  339 	inc	hl
   6CB2 AF            [ 4]  340 	xor	a, a
   6CB3 77            [ 7]  341 	ld	(hl), a
   6CB4 23            [ 6]  342 	inc	hl
   6CB5 77            [ 7]  343 	ld	(hl), a
                            344 ;src/balls.c:119: all_balls[i].prev_x = 0;
   6CB6 21 05 00      [10]  345 	ld	hl, #0x0005
   6CB9 19            [11]  346 	add	hl, de
   6CBA AF            [ 4]  347 	xor	a, a
   6CBB 77            [ 7]  348 	ld	(hl), a
   6CBC 23            [ 6]  349 	inc	hl
   6CBD 77            [ 7]  350 	ld	(hl), a
                            351 ;src/balls.c:120: all_balls[i].prev_y = 0;
   6CBE 21 07 00      [10]  352 	ld	hl, #0x0007
   6CC1 19            [11]  353 	add	hl, de
   6CC2 AF            [ 4]  354 	xor	a, a
   6CC3 77            [ 7]  355 	ld	(hl), a
   6CC4 23            [ 6]  356 	inc	hl
   6CC5 77            [ 7]  357 	ld	(hl), a
                            358 ;src/balls.c:121: all_balls[i].dx = 0;
   6CC6 21 09 00      [10]  359 	ld	hl, #0x0009
   6CC9 19            [11]  360 	add	hl, de
   6CCA AF            [ 4]  361 	xor	a, a
   6CCB 77            [ 7]  362 	ld	(hl), a
   6CCC 23            [ 6]  363 	inc	hl
   6CCD 77            [ 7]  364 	ld	(hl), a
                            365 ;src/balls.c:122: all_balls[i].dy = 0;
   6CCE 21 0B 00      [10]  366 	ld	hl, #0x000b
   6CD1 19            [11]  367 	add	hl, de
   6CD2 AF            [ 4]  368 	xor	a, a
   6CD3 77            [ 7]  369 	ld	(hl), a
   6CD4 23            [ 6]  370 	inc	hl
   6CD5 77            [ 7]  371 	ld	(hl), a
                            372 ;src/balls.c:114: for (u8 i = 0; i < MAX_BALLS; i++)
   6CD6 0C            [ 4]  373 	inc	c
   6CD7 18 B7         [12]  374 	jr	00103$
   6CD9                     375 00101$:
                            376 ;src/balls.c:126: all_balls[0].active = 1;
   6CD9 21 9E 83      [10]  377 	ld	hl, #_all_balls
   6CDC 36 01         [10]  378 	ld	(hl), #0x01
   6CDE C9            [10]  379 	ret
                            380 ;src/balls.c:129: void center_ball(Ball *ball)
                            381 ;	---------------------------------
                            382 ; Function center_ball
                            383 ; ---------------------------------
   6CDF                     384 _center_ball::
   6CDF DD E5         [15]  385 	push	ix
   6CE1 DD 21 00 00   [14]  386 	ld	ix,#0
   6CE5 DD 39         [15]  387 	add	ix,sp
   6CE7 F5            [11]  388 	push	af
                            389 ;src/balls.c:132: ball->prev_x = ball->x;
   6CE8 DD 5E 04      [19]  390 	ld	e,4 (ix)
   6CEB DD 56 05      [19]  391 	ld	d,5 (ix)
   6CEE FD 21 05 00   [14]  392 	ld	iy, #0x0005
   6CF2 FD 19         [15]  393 	add	iy, de
   6CF4 4B            [ 4]  394 	ld	c, e
   6CF5 42            [ 4]  395 	ld	b, d
   6CF6 03            [ 6]  396 	inc	bc
   6CF7 69            [ 4]  397 	ld	l, c
   6CF8 60            [ 4]  398 	ld	h, b
   6CF9 7E            [ 7]  399 	ld	a, (hl)
   6CFA 23            [ 6]  400 	inc	hl
   6CFB 66            [ 7]  401 	ld	h, (hl)
   6CFC FD 77 00      [19]  402 	ld	0 (iy), a
   6CFF FD 74 01      [19]  403 	ld	1 (iy), h
                            404 ;src/balls.c:133: ball->prev_y = ball->y;
   6D02 FD 21 07 00   [14]  405 	ld	iy, #0x0007
   6D06 FD 19         [15]  406 	add	iy, de
   6D08 13            [ 6]  407 	inc	de
   6D09 13            [ 6]  408 	inc	de
   6D0A 13            [ 6]  409 	inc	de
   6D0B 33            [ 6]  410 	inc	sp
   6D0C 33            [ 6]  411 	inc	sp
   6D0D D5            [11]  412 	push	de
   6D0E E1            [10]  413 	pop	hl
   6D0F E5            [11]  414 	push	hl
   6D10 5E            [ 7]  415 	ld	e, (hl)
   6D11 23            [ 6]  416 	inc	hl
   6D12 56            [ 7]  417 	ld	d, (hl)
   6D13 FD 73 00      [19]  418 	ld	0 (iy), e
   6D16 FD 72 01      [19]  419 	ld	1 (iy), d
                            420 ;src/balls.c:136: ball->x = batX + (batW / 4);
   6D19 21 3E 88      [10]  421 	ld	hl,#_batX + 0
   6D1C 5E            [ 7]  422 	ld	e, (hl)
   6D1D 16 00         [ 7]  423 	ld	d, #0x00
   6D1F FD 21 40 88   [14]  424 	ld	iy, #_batW
   6D23 FD 6E 00      [19]  425 	ld	l, 0 (iy)
   6D26 CB 3D         [ 8]  426 	srl	l
   6D28 CB 3D         [ 8]  427 	srl	l
   6D2A 26 00         [ 7]  428 	ld	h, #0x00
   6D2C 19            [11]  429 	add	hl,de
   6D2D EB            [ 4]  430 	ex	de,hl
   6D2E 7B            [ 4]  431 	ld	a, e
   6D2F 02            [ 7]  432 	ld	(bc), a
   6D30 03            [ 6]  433 	inc	bc
   6D31 7A            [ 4]  434 	ld	a, d
   6D32 02            [ 7]  435 	ld	(bc), a
                            436 ;src/balls.c:137: ball->y = batY - SP_BALL_H;
   6D33 3A 3D 88      [13]  437 	ld	a,(#_batY + 0)
   6D36 06 00         [ 7]  438 	ld	b, #0x00
   6D38 C6 FA         [ 7]  439 	add	a, #0xfa
   6D3A 4F            [ 4]  440 	ld	c, a
   6D3B 78            [ 4]  441 	ld	a, b
   6D3C CE FF         [ 7]  442 	adc	a, #0xff
   6D3E 47            [ 4]  443 	ld	b, a
   6D3F E1            [10]  444 	pop	hl
   6D40 E5            [11]  445 	push	hl
   6D41 71            [ 7]  446 	ld	(hl), c
   6D42 23            [ 6]  447 	inc	hl
   6D43 70            [ 7]  448 	ld	(hl), b
   6D44 DD F9         [10]  449 	ld	sp, ix
   6D46 DD E1         [14]  450 	pop	ix
   6D48 C9            [10]  451 	ret
                            452 ;src/balls.c:140: void handle_serve(Ball *ball)
                            453 ;	---------------------------------
                            454 ; Function handle_serve
                            455 ; ---------------------------------
   6D49                     456 _handle_serve::
   6D49 DD E5         [15]  457 	push	ix
   6D4B DD 21 00 00   [14]  458 	ld	ix,#0
   6D4F DD 39         [15]  459 	add	ix,sp
                            460 ;src/balls.c:143: serving = 0;
   6D51 21 C5 83      [10]  461 	ld	hl,#_serving + 0
   6D54 36 00         [10]  462 	ld	(hl), #0x00
                            463 ;src/balls.c:146: ball->dx = 1;
   6D56 DD 5E 04      [19]  464 	ld	e,4 (ix)
   6D59 DD 56 05      [19]  465 	ld	d,5 (ix)
   6D5C 21 09 00      [10]  466 	ld	hl, #0x0009
   6D5F 19            [11]  467 	add	hl, de
   6D60 36 01         [10]  468 	ld	(hl), #0x01
   6D62 23            [ 6]  469 	inc	hl
   6D63 36 00         [10]  470 	ld	(hl), #0x00
                            471 ;src/balls.c:147: ball->dy = -2;
   6D65 21 0B 00      [10]  472 	ld	hl, #0x000b
   6D68 19            [11]  473 	add	hl, de
   6D69 36 FE         [10]  474 	ld	(hl), #0xfe
   6D6B 23            [ 6]  475 	inc	hl
   6D6C 36 FF         [10]  476 	ld	(hl), #0xff
                            477 ;src/balls.c:150: ball->prev_x = ball->x;
   6D6E FD 21 05 00   [14]  478 	ld	iy, #0x0005
   6D72 FD 19         [15]  479 	add	iy, de
   6D74 6B            [ 4]  480 	ld	l, e
   6D75 62            [ 4]  481 	ld	h, d
   6D76 23            [ 6]  482 	inc	hl
   6D77 4E            [ 7]  483 	ld	c, (hl)
   6D78 23            [ 6]  484 	inc	hl
   6D79 46            [ 7]  485 	ld	b, (hl)
   6D7A FD 71 00      [19]  486 	ld	0 (iy), c
   6D7D FD 70 01      [19]  487 	ld	1 (iy), b
                            488 ;src/balls.c:151: ball->prev_y = ball->y;
   6D80 21 07 00      [10]  489 	ld	hl, #0x0007
   6D83 19            [11]  490 	add	hl,de
   6D84 4D            [ 4]  491 	ld	c, l
   6D85 44            [ 4]  492 	ld	b, h
   6D86 EB            [ 4]  493 	ex	de,hl
   6D87 23            [ 6]  494 	inc	hl
   6D88 23            [ 6]  495 	inc	hl
   6D89 23            [ 6]  496 	inc	hl
   6D8A 5E            [ 7]  497 	ld	e, (hl)
   6D8B 23            [ 6]  498 	inc	hl
   6D8C 56            [ 7]  499 	ld	d, (hl)
   6D8D 7B            [ 4]  500 	ld	a, e
   6D8E 02            [ 7]  501 	ld	(bc), a
   6D8F 03            [ 6]  502 	inc	bc
   6D90 7A            [ 4]  503 	ld	a, d
   6D91 02            [ 7]  504 	ld	(bc), a
   6D92 DD E1         [14]  505 	pop	ix
   6D94 C9            [10]  506 	ret
                            507 ;src/balls.c:154: void update_ball(Ball *ball)
                            508 ;	---------------------------------
                            509 ; Function update_ball
                            510 ; ---------------------------------
   6D95                     511 _update_ball::
   6D95 DD E5         [15]  512 	push	ix
   6D97 DD 21 00 00   [14]  513 	ld	ix,#0
   6D9B DD 39         [15]  514 	add	ix,sp
   6D9D 21 F5 FF      [10]  515 	ld	hl, #-11
   6DA0 39            [11]  516 	add	hl, sp
   6DA1 F9            [ 6]  517 	ld	sp, hl
                            518 ;src/balls.c:156: ball->prev_x = ball->x;
   6DA2 DD 4E 04      [19]  519 	ld	c,4 (ix)
   6DA5 DD 46 05      [19]  520 	ld	b,5 (ix)
   6DA8 FD 21 05 00   [14]  521 	ld	iy, #0x0005
   6DAC FD 09         [15]  522 	add	iy, bc
   6DAE 21 01 00      [10]  523 	ld	hl, #0x0001
   6DB1 09            [11]  524 	add	hl,bc
   6DB2 DD 75 F9      [19]  525 	ld	-7 (ix), l
   6DB5 DD 74 FA      [19]  526 	ld	-6 (ix), h
   6DB8 5E            [ 7]  527 	ld	e, (hl)
   6DB9 23            [ 6]  528 	inc	hl
   6DBA 56            [ 7]  529 	ld	d, (hl)
   6DBB FD 73 00      [19]  530 	ld	0 (iy), e
   6DBE FD 72 01      [19]  531 	ld	1 (iy), d
                            532 ;src/balls.c:157: ball->prev_y = ball->y;
   6DC1 FD 21 07 00   [14]  533 	ld	iy, #0x0007
   6DC5 FD 09         [15]  534 	add	iy, bc
   6DC7 21 03 00      [10]  535 	ld	hl, #0x0003
   6DCA 09            [11]  536 	add	hl,bc
   6DCB DD 75 F7      [19]  537 	ld	-9 (ix), l
   6DCE DD 74 F8      [19]  538 	ld	-8 (ix), h
   6DD1 5E            [ 7]  539 	ld	e, (hl)
   6DD2 23            [ 6]  540 	inc	hl
   6DD3 56            [ 7]  541 	ld	d, (hl)
   6DD4 FD 73 00      [19]  542 	ld	0 (iy), e
   6DD7 FD 72 01      [19]  543 	ld	1 (iy), d
                            544 ;src/balls.c:159: if (ball->active)
   6DDA 0A            [ 7]  545 	ld	a, (bc)
   6DDB B7            [ 4]  546 	or	a, a
   6DDC CA CF 6E      [10]  547 	jp	Z, 00111$
                            548 ;src/balls.c:162: i16 new_x = ball->x + ball->dx;
   6DDF DD 6E F9      [19]  549 	ld	l,-7 (ix)
   6DE2 DD 66 FA      [19]  550 	ld	h,-6 (ix)
   6DE5 5E            [ 7]  551 	ld	e, (hl)
   6DE6 23            [ 6]  552 	inc	hl
   6DE7 56            [ 7]  553 	ld	d, (hl)
   6DE8 21 09 00      [10]  554 	ld	hl, #0x0009
   6DEB 09            [11]  555 	add	hl,bc
   6DEC DD 75 FE      [19]  556 	ld	-2 (ix), l
   6DEF DD 74 FF      [19]  557 	ld	-1 (ix), h
   6DF2 7E            [ 7]  558 	ld	a, (hl)
   6DF3 23            [ 6]  559 	inc	hl
   6DF4 66            [ 7]  560 	ld	h, (hl)
   6DF5 6F            [ 4]  561 	ld	l, a
   6DF6 19            [11]  562 	add	hl, de
   6DF7 33            [ 6]  563 	inc	sp
   6DF8 33            [ 6]  564 	inc	sp
   6DF9 E5            [11]  565 	push	hl
                            566 ;src/balls.c:163: i16 new_y = ball->y + ball->dy;
   6DFA DD 6E F7      [19]  567 	ld	l,-9 (ix)
   6DFD DD 66 F8      [19]  568 	ld	h,-8 (ix)
   6E00 5E            [ 7]  569 	ld	e, (hl)
   6E01 23            [ 6]  570 	inc	hl
   6E02 56            [ 7]  571 	ld	d, (hl)
   6E03 21 0B 00      [10]  572 	ld	hl, #0x000b
   6E06 09            [11]  573 	add	hl,bc
   6E07 DD 75 FC      [19]  574 	ld	-4 (ix), l
   6E0A DD 74 FD      [19]  575 	ld	-3 (ix), h
   6E0D 7E            [ 7]  576 	ld	a, (hl)
   6E0E 23            [ 6]  577 	inc	hl
   6E0F 66            [ 7]  578 	ld	h, (hl)
   6E10 6F            [ 4]  579 	ld	l, a
   6E11 19            [11]  580 	add	hl,de
   6E12 EB            [ 4]  581 	ex	de,hl
                            582 ;src/balls.c:165: if (new_y >= YOUR_DEAD_Y)
   6E13 7B            [ 4]  583 	ld	a, e
   6E14 D6 BA         [ 7]  584 	sub	a, #0xba
   6E16 7A            [ 4]  585 	ld	a, d
   6E17 17            [ 4]  586 	rla
   6E18 3F            [ 4]  587 	ccf
   6E19 1F            [ 4]  588 	rra
   6E1A DE 80         [ 7]  589 	sbc	a, #0x80
   6E1C 38 0F         [12]  590 	jr	C,00102$
                            591 ;src/balls.c:168: ball->active = 0;
   6E1E AF            [ 4]  592 	xor	a, a
   6E1F 02            [ 7]  593 	ld	(bc), a
                            594 ;src/balls.c:169: ball->dy = 0;
   6E20 DD 6E FC      [19]  595 	ld	l,-4 (ix)
   6E23 DD 66 FD      [19]  596 	ld	h,-3 (ix)
   6E26 AF            [ 4]  597 	xor	a, a
   6E27 77            [ 7]  598 	ld	(hl), a
   6E28 23            [ 6]  599 	inc	hl
   6E29 77            [ 7]  600 	ld	(hl), a
                            601 ;src/balls.c:170: return;
   6E2A C3 CF 6E      [10]  602 	jp	00111$
   6E2D                     603 00102$:
                            604 ;src/balls.c:173: hits |= background_bounce_ball(new_x, new_y);
   6E2D C5            [11]  605 	push	bc
   6E2E D5            [11]  606 	push	de
   6E2F D5            [11]  607 	push	de
   6E30 DD 6E F5      [19]  608 	ld	l,-11 (ix)
   6E33 DD 66 F6      [19]  609 	ld	h,-10 (ix)
   6E36 E5            [11]  610 	push	hl
   6E37 CD 1F 6A      [17]  611 	call	_background_bounce_ball
   6E3A F1            [10]  612 	pop	af
   6E3B F1            [10]  613 	pop	af
   6E3C D1            [10]  614 	pop	de
   6E3D C1            [10]  615 	pop	bc
   6E3E DD 75 FB      [19]  616 	ld	-5 (ix), l
                            617 ;src/balls.c:174: hits |= bat_bounce_ball(ball, new_x, new_y);
   6E41 D5            [11]  618 	push	de
   6E42 D5            [11]  619 	push	de
   6E43 DD 6E F5      [19]  620 	ld	l,-11 (ix)
   6E46 DD 66 F6      [19]  621 	ld	h,-10 (ix)
   6E49 E5            [11]  622 	push	hl
   6E4A C5            [11]  623 	push	bc
   6E4B CD A6 6F      [17]  624 	call	_bat_bounce_ball
   6E4E F1            [10]  625 	pop	af
   6E4F F1            [10]  626 	pop	af
   6E50 F1            [10]  627 	pop	af
   6E51 D1            [10]  628 	pop	de
   6E52 DD 7E FB      [19]  629 	ld	a, -5 (ix)
   6E55 B5            [ 4]  630 	or	a, l
   6E56 4F            [ 4]  631 	ld	c, a
                            632 ;src/balls.c:175: hits |= blocks_bounce_ball(ball, new_x, new_y);
   6E57 C5            [11]  633 	push	bc
   6E58 D5            [11]  634 	push	de
   6E59 D5            [11]  635 	push	de
   6E5A DD 6E F5      [19]  636 	ld	l,-11 (ix)
   6E5D DD 66 F6      [19]  637 	ld	h,-10 (ix)
   6E60 E5            [11]  638 	push	hl
   6E61 DD 6E 04      [19]  639 	ld	l,4 (ix)
   6E64 DD 66 05      [19]  640 	ld	h,5 (ix)
   6E67 E5            [11]  641 	push	hl
   6E68 CD 6A 70      [17]  642 	call	_blocks_bounce_ball
   6E6B F1            [10]  643 	pop	af
   6E6C F1            [10]  644 	pop	af
   6E6D F1            [10]  645 	pop	af
   6E6E D1            [10]  646 	pop	de
   6E6F C1            [10]  647 	pop	bc
   6E70 79            [ 4]  648 	ld	a, c
   6E71 B5            [ 4]  649 	or	a, l
   6E72 DD 77 FB      [19]  650 	ld	-5 (ix), a
                            651 ;src/balls.c:177: if (hits & BOUNCE_X)
   6E75 DD CB FB 46   [20]  652 	bit	0, -5 (ix)
   6E79 28 1B         [12]  653 	jr	Z,00104$
                            654 ;src/balls.c:179: ball->dx = -ball->dx;
   6E7B DD 6E FE      [19]  655 	ld	l,-2 (ix)
   6E7E DD 66 FF      [19]  656 	ld	h,-1 (ix)
   6E81 4E            [ 7]  657 	ld	c, (hl)
   6E82 23            [ 6]  658 	inc	hl
   6E83 46            [ 7]  659 	ld	b, (hl)
   6E84 AF            [ 4]  660 	xor	a, a
   6E85 91            [ 4]  661 	sub	a, c
   6E86 4F            [ 4]  662 	ld	c, a
   6E87 3E 00         [ 7]  663 	ld	a, #0x00
   6E89 98            [ 4]  664 	sbc	a, b
   6E8A 47            [ 4]  665 	ld	b, a
   6E8B DD 6E FE      [19]  666 	ld	l,-2 (ix)
   6E8E DD 66 FF      [19]  667 	ld	h,-1 (ix)
   6E91 71            [ 7]  668 	ld	(hl), c
   6E92 23            [ 6]  669 	inc	hl
   6E93 70            [ 7]  670 	ld	(hl), b
   6E94 18 0F         [12]  671 	jr	00105$
   6E96                     672 00104$:
                            673 ;src/balls.c:183: ball->x = new_x;
   6E96 DD 6E F9      [19]  674 	ld	l,-7 (ix)
   6E99 DD 66 FA      [19]  675 	ld	h,-6 (ix)
   6E9C DD 7E F5      [19]  676 	ld	a, -11 (ix)
   6E9F 77            [ 7]  677 	ld	(hl), a
   6EA0 23            [ 6]  678 	inc	hl
   6EA1 DD 7E F6      [19]  679 	ld	a, -10 (ix)
   6EA4 77            [ 7]  680 	ld	(hl), a
   6EA5                     681 00105$:
                            682 ;src/balls.c:186: if (hits & BOUNCE_Y)
   6EA5 DD CB FB 4E   [20]  683 	bit	1, -5 (ix)
   6EA9 28 1B         [12]  684 	jr	Z,00107$
                            685 ;src/balls.c:188: ball->dy = -ball->dy;
   6EAB DD 6E FC      [19]  686 	ld	l,-4 (ix)
   6EAE DD 66 FD      [19]  687 	ld	h,-3 (ix)
   6EB1 4E            [ 7]  688 	ld	c, (hl)
   6EB2 23            [ 6]  689 	inc	hl
   6EB3 46            [ 7]  690 	ld	b, (hl)
   6EB4 AF            [ 4]  691 	xor	a, a
   6EB5 91            [ 4]  692 	sub	a, c
   6EB6 4F            [ 4]  693 	ld	c, a
   6EB7 3E 00         [ 7]  694 	ld	a, #0x00
   6EB9 98            [ 4]  695 	sbc	a, b
   6EBA 47            [ 4]  696 	ld	b, a
   6EBB DD 6E FC      [19]  697 	ld	l,-4 (ix)
   6EBE DD 66 FD      [19]  698 	ld	h,-3 (ix)
   6EC1 71            [ 7]  699 	ld	(hl), c
   6EC2 23            [ 6]  700 	inc	hl
   6EC3 70            [ 7]  701 	ld	(hl), b
   6EC4 18 09         [12]  702 	jr	00111$
   6EC6                     703 00107$:
                            704 ;src/balls.c:192: ball->y = new_y;
   6EC6 DD 6E F7      [19]  705 	ld	l,-9 (ix)
   6EC9 DD 66 F8      [19]  706 	ld	h,-8 (ix)
   6ECC 73            [ 7]  707 	ld	(hl), e
   6ECD 23            [ 6]  708 	inc	hl
   6ECE 72            [ 7]  709 	ld	(hl), d
   6ECF                     710 00111$:
   6ECF DD F9         [10]  711 	ld	sp, ix
   6ED1 DD E1         [14]  712 	pop	ix
   6ED3 C9            [10]  713 	ret
                            714 	.area _CODE
                            715 	.area _INITIALIZER
                            716 	.area _CABS (ABS)
