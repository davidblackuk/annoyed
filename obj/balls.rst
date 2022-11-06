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
   8ED4                      35 _all_balls::
   8ED4                      36 	.ds 39
   8EFB                      37 _serving::
   8EFB                      38 	.ds 1
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
                             63 ;src/balls.c:30: void balls_initialize()
                             64 ;	---------------------------------
                             65 ; Function balls_initialize
                             66 ; ---------------------------------
   765E                      67 _balls_initialize::
                             68 ;src/balls.c:33: serving = 1;
   765E 21 FB 8E      [10]   69 	ld	hl,#_serving + 0
   7661 36 01         [10]   70 	ld	(hl), #0x01
                             71 ;src/balls.c:35: initialize_balls();
   7663 CD 85 77      [17]   72 	call	_initialize_balls
                             73 ;src/balls.c:38: center_ball(all_balls);
   7666 21 D4 8E      [10]   74 	ld	hl, #_all_balls
   7669 E5            [11]   75 	push	hl
   766A CD D6 77      [17]   76 	call	_center_ball
   766D F1            [10]   77 	pop	af
   766E C9            [10]   78 	ret
                             79 ;src/balls.c:41: void balls_update()
                             80 ;	---------------------------------
                             81 ; Function balls_update
                             82 ; ---------------------------------
   766F                      83 _balls_update::
                             84 ;src/balls.c:43: Ball *ball = all_balls;
   766F 01 D4 8E      [10]   85 	ld	bc, #_all_balls+0
                             86 ;src/balls.c:44: if (serving)
   7672 3A FB 8E      [13]   87 	ld	a,(#_serving + 0)
   7675 B7            [ 4]   88 	or	a, a
   7676 28 12         [12]   89 	jr	Z,00115$
                             90 ;src/balls.c:46: center_ball(ball);
   7678 C5            [11]   91 	push	bc
   7679 C5            [11]   92 	push	bc
   767A CD D6 77      [17]   93 	call	_center_ball
   767D F1            [10]   94 	pop	af
   767E C1            [10]   95 	pop	bc
                             96 ;src/balls.c:47: if (key_serve_is_pressed)
   767F 3A 69 93      [13]   97 	ld	a,(#_key_serve_is_pressed + 0)
   7682 B7            [ 4]   98 	or	a, a
   7683 C8            [11]   99 	ret	Z
                            100 ;src/balls.c:49: handle_serve(ball);
   7684 C5            [11]  101 	push	bc
   7685 CD 40 78      [17]  102 	call	_handle_serve
   7688 F1            [10]  103 	pop	af
   7689 C9            [10]  104 	ret
                            105 ;src/balls.c:54: for (u8 i = 0; i < MAX_BALLS; i++)
   768A                     106 00115$:
   768A 1E 00         [ 7]  107 	ld	e, #0x00
   768C                     108 00108$:
   768C 7B            [ 4]  109 	ld	a, e
   768D D6 03         [ 7]  110 	sub	a, #0x03
   768F D0            [11]  111 	ret	NC
                            112 ;src/balls.c:56: update_ball(ball);
   7690 C5            [11]  113 	push	bc
   7691 D5            [11]  114 	push	de
   7692 C5            [11]  115 	push	bc
   7693 CD 8C 78      [17]  116 	call	_update_ball
   7696 F1            [10]  117 	pop	af
   7697 D1            [10]  118 	pop	de
   7698 C1            [10]  119 	pop	bc
                            120 ;src/balls.c:57: ball++;
   7699 21 0D 00      [10]  121 	ld	hl, #0x000d
   769C 09            [11]  122 	add	hl,bc
   769D 4D            [ 4]  123 	ld	c, l
   769E 44            [ 4]  124 	ld	b, h
                            125 ;src/balls.c:54: for (u8 i = 0; i < MAX_BALLS; i++)
   769F 1C            [ 4]  126 	inc	e
   76A0 18 EA         [12]  127 	jr	00108$
                            128 ;src/balls.c:62: void balls_restore_background()
                            129 ;	---------------------------------
                            130 ; Function balls_restore_background
                            131 ; ---------------------------------
   76A2                     132 _balls_restore_background::
   76A2 DD E5         [15]  133 	push	ix
   76A4 DD 21 00 00   [14]  134 	ld	ix,#0
   76A8 DD 39         [15]  135 	add	ix,sp
   76AA F5            [11]  136 	push	af
   76AB 3B            [ 6]  137 	dec	sp
                            138 ;src/balls.c:64: Ball *ball = all_balls;
   76AC 01 D4 8E      [10]  139 	ld	bc, #_all_balls+0
                            140 ;src/balls.c:65: for (u8 i = 0; i < MAX_BALLS; i++)
   76AF DD 36 FD 00   [19]  141 	ld	-3 (ix), #0x00
   76B3                     142 00105$:
   76B3 DD 7E FD      [19]  143 	ld	a, -3 (ix)
   76B6 D6 03         [ 7]  144 	sub	a, #0x03
   76B8 30 3D         [12]  145 	jr	NC,00107$
                            146 ;src/balls.c:67: if (ball->active)
   76BA 0A            [ 7]  147 	ld	a, (bc)
   76BB B7            [ 4]  148 	or	a, a
   76BC 28 2E         [12]  149 	jr	Z,00102$
                            150 ;src/balls.c:69: background_restore_world_coords(ball->prev_x, ball->prev_y, SP_BALL_W, SP_BALL_H);
   76BE 69            [ 4]  151 	ld	l, c
   76BF 60            [ 4]  152 	ld	h, b
   76C0 11 07 00      [10]  153 	ld	de, #0x0007
   76C3 19            [11]  154 	add	hl, de
   76C4 5E            [ 7]  155 	ld	e, (hl)
   76C5 23            [ 6]  156 	inc	hl
   76C6 56            [ 7]  157 	ld	d, (hl)
   76C7 C5            [11]  158 	push	bc
   76C8 FD E1         [14]  159 	pop	iy
   76CA FD 7E 05      [19]  160 	ld	a, 5 (iy)
   76CD DD 77 FE      [19]  161 	ld	-2 (ix), a
   76D0 FD 7E 06      [19]  162 	ld	a, 6 (iy)
   76D3 DD 77 FF      [19]  163 	ld	-1 (ix), a
   76D6 C5            [11]  164 	push	bc
   76D7 21 03 06      [10]  165 	ld	hl, #0x0603
   76DA E5            [11]  166 	push	hl
   76DB D5            [11]  167 	push	de
   76DC DD 6E FE      [19]  168 	ld	l,-2 (ix)
   76DF DD 66 FF      [19]  169 	ld	h,-1 (ix)
   76E2 E5            [11]  170 	push	hl
   76E3 CD 26 75      [17]  171 	call	_background_restore_world_coords
   76E6 21 06 00      [10]  172 	ld	hl, #6
   76E9 39            [11]  173 	add	hl, sp
   76EA F9            [ 6]  174 	ld	sp, hl
   76EB C1            [10]  175 	pop	bc
   76EC                     176 00102$:
                            177 ;src/balls.c:71: ball++;
   76EC 21 0D 00      [10]  178 	ld	hl, #0x000d
   76EF 09            [11]  179 	add	hl,bc
   76F0 4D            [ 4]  180 	ld	c, l
   76F1 44            [ 4]  181 	ld	b, h
                            182 ;src/balls.c:65: for (u8 i = 0; i < MAX_BALLS; i++)
   76F2 DD 34 FD      [23]  183 	inc	-3 (ix)
   76F5 18 BC         [12]  184 	jr	00105$
   76F7                     185 00107$:
   76F7 DD F9         [10]  186 	ld	sp, ix
   76F9 DD E1         [14]  187 	pop	ix
   76FB C9            [10]  188 	ret
                            189 ;src/balls.c:75: void balls_draw()
                            190 ;	---------------------------------
                            191 ; Function balls_draw
                            192 ; ---------------------------------
   76FC                     193 _balls_draw::
   76FC DD E5         [15]  194 	push	ix
   76FE DD 21 00 00   [14]  195 	ld	ix,#0
   7702 DD 39         [15]  196 	add	ix,sp
   7704 3B            [ 6]  197 	dec	sp
                            198 ;src/balls.c:78: Ball *ball = all_balls;
   7705 01 D4 8E      [10]  199 	ld	bc, #_all_balls+0
                            200 ;src/balls.c:79: for (u8 i = 0; i < MAX_BALLS; i++)
   7708 DD 36 FF 00   [19]  201 	ld	-1 (ix), #0x00
   770C                     202 00105$:
   770C DD 7E FF      [19]  203 	ld	a, -1 (ix)
   770F D6 03         [ 7]  204 	sub	a, #0x03
   7711 30 3A         [12]  205 	jr	NC,00107$
                            206 ;src/balls.c:81: if (ball->active)
   7713 0A            [ 7]  207 	ld	a, (bc)
   7714 B7            [ 4]  208 	or	a, a
   7715 28 31         [12]  209 	jr	Z,00106$
                            210 ;src/balls.c:83: svmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(ball->x), W_2_S_Y(ball->y));
   7717 69            [ 4]  211 	ld	l, c
   7718 60            [ 4]  212 	ld	h, b
   7719 23            [ 6]  213 	inc	hl
   771A 23            [ 6]  214 	inc	hl
   771B 23            [ 6]  215 	inc	hl
   771C 5E            [ 7]  216 	ld	e, (hl)
   771D 23            [ 6]  217 	inc	hl
   771E 56            [ 7]  218 	ld	d, (hl)
   771F 7B            [ 4]  219 	ld	a, e
   7720 C6 08         [ 7]  220 	add	a, #0x08
   7722 57            [ 4]  221 	ld	d, a
   7723 69            [ 4]  222 	ld	l, c
   7724 60            [ 4]  223 	ld	h, b
   7725 23            [ 6]  224 	inc	hl
   7726 7E            [ 7]  225 	ld	a, (hl)
   7727 23            [ 6]  226 	inc	hl
   7728 66            [ 7]  227 	ld	h, (hl)
   7729 C6 0C         [ 7]  228 	add	a, #0x0c
   772B C5            [11]  229 	push	bc
   772C 5F            [ 4]  230 	ld	e, a
   772D D5            [11]  231 	push	de
   772E 21 00 C0      [10]  232 	ld	hl, #0xc000
   7731 E5            [11]  233 	push	hl
   7732 CD FF 8D      [17]  234 	call	_cpct_getScreenPtr
   7735 11 03 06      [10]  235 	ld	de, #0x0603
   7738 D5            [11]  236 	push	de
   7739 E5            [11]  237 	push	hl
   773A 21 B4 86      [10]  238 	ld	hl, #_sp_masked_ball
   773D E5            [11]  239 	push	hl
   773E CD 31 8C      [17]  240 	call	_cpct_drawSpriteMasked
   7741 C1            [10]  241 	pop	bc
                            242 ;src/balls.c:87: ball++;
   7742 21 0D 00      [10]  243 	ld	hl, #0x000d
   7745 09            [11]  244 	add	hl,bc
   7746 4D            [ 4]  245 	ld	c, l
   7747 44            [ 4]  246 	ld	b, h
   7748                     247 00106$:
                            248 ;src/balls.c:79: for (u8 i = 0; i < MAX_BALLS; i++)
   7748 DD 34 FF      [23]  249 	inc	-1 (ix)
   774B 18 BF         [12]  250 	jr	00105$
   774D                     251 00107$:
   774D 33            [ 6]  252 	inc	sp
   774E DD E1         [14]  253 	pop	ix
   7750 C9            [10]  254 	ret
                            255 ;src/balls.c:92: Ball *balls_get_first_active()
                            256 ;	---------------------------------
                            257 ; Function balls_get_first_active
                            258 ; ---------------------------------
   7751                     259 _balls_get_first_active::
   7751 DD E5         [15]  260 	push	ix
   7753 DD 21 00 00   [14]  261 	ld	ix,#0
   7757 DD 39         [15]  262 	add	ix,sp
   7759 F5            [11]  263 	push	af
                            264 ;src/balls.c:94: Ball *ball = all_balls;
   775A DD 36 FE D4   [19]  265 	ld	-2 (ix), #<(_all_balls)
   775E DD 36 FF 8E   [19]  266 	ld	-1 (ix), #>(_all_balls)
                            267 ;src/balls.c:95: for (u8 i = 0; i < MAX_BALLS; i++)
   7762 E1            [10]  268 	pop	hl
   7763 E5            [11]  269 	push	hl
   7764 0E 00         [ 7]  270 	ld	c, #0x00
   7766                     271 00105$:
   7766 79            [ 4]  272 	ld	a, c
   7767 D6 03         [ 7]  273 	sub	a, #0x03
   7769 30 12         [12]  274 	jr	NC,00103$
                            275 ;src/balls.c:97: if (ball->active)
   776B 7E            [ 7]  276 	ld	a, (hl)
   776C B7            [ 4]  277 	or	a, a
   776D 28 04         [12]  278 	jr	Z,00102$
                            279 ;src/balls.c:99: return ball;
   776F E1            [10]  280 	pop	hl
   7770 E5            [11]  281 	push	hl
   7771 18 0D         [12]  282 	jr	00107$
   7773                     283 00102$:
                            284 ;src/balls.c:101: ball++;
   7773 11 0D 00      [10]  285 	ld	de, #0x000d
   7776 19            [11]  286 	add	hl, de
   7777 33            [ 6]  287 	inc	sp
   7778 33            [ 6]  288 	inc	sp
   7779 E5            [11]  289 	push	hl
                            290 ;src/balls.c:95: for (u8 i = 0; i < MAX_BALLS; i++)
   777A 0C            [ 4]  291 	inc	c
   777B 18 E9         [12]  292 	jr	00105$
   777D                     293 00103$:
                            294 ;src/balls.c:103: return NULL;
   777D 21 00 00      [10]  295 	ld	hl, #0x0000
   7780                     296 00107$:
   7780 DD F9         [10]  297 	ld	sp, ix
   7782 DD E1         [14]  298 	pop	ix
   7784 C9            [10]  299 	ret
                            300 ;src/balls.c:110: void initialize_balls()
                            301 ;	---------------------------------
                            302 ; Function initialize_balls
                            303 ; ---------------------------------
   7785                     304 _initialize_balls::
                            305 ;src/balls.c:113: for (u8 i = 0; i < MAX_BALLS; i++)
   7785 0E 00         [ 7]  306 	ld	c, #0x00
   7787                     307 00103$:
   7787 79            [ 4]  308 	ld	a, c
   7788 D6 03         [ 7]  309 	sub	a, #0x03
   778A 30 44         [12]  310 	jr	NC,00101$
                            311 ;src/balls.c:115: all_balls[i].active = 0;
   778C 06 00         [ 7]  312 	ld	b,#0x00
   778E 69            [ 4]  313 	ld	l, c
   778F 60            [ 4]  314 	ld	h, b
   7790 29            [11]  315 	add	hl, hl
   7791 09            [11]  316 	add	hl, bc
   7792 29            [11]  317 	add	hl, hl
   7793 29            [11]  318 	add	hl, hl
   7794 09            [11]  319 	add	hl, bc
   7795 EB            [ 4]  320 	ex	de,hl
   7796 21 D4 8E      [10]  321 	ld	hl, #_all_balls
   7799 19            [11]  322 	add	hl,de
   779A EB            [ 4]  323 	ex	de,hl
   779B AF            [ 4]  324 	xor	a, a
   779C 12            [ 7]  325 	ld	(de), a
                            326 ;src/balls.c:116: all_balls[i].x = 0;
   779D 6B            [ 4]  327 	ld	l, e
   779E 62            [ 4]  328 	ld	h, d
   779F 23            [ 6]  329 	inc	hl
   77A0 AF            [ 4]  330 	xor	a, a
   77A1 77            [ 7]  331 	ld	(hl), a
   77A2 23            [ 6]  332 	inc	hl
   77A3 77            [ 7]  333 	ld	(hl), a
                            334 ;src/balls.c:117: all_balls[i].y = 0;
   77A4 6B            [ 4]  335 	ld	l, e
   77A5 62            [ 4]  336 	ld	h, d
   77A6 23            [ 6]  337 	inc	hl
   77A7 23            [ 6]  338 	inc	hl
   77A8 23            [ 6]  339 	inc	hl
   77A9 AF            [ 4]  340 	xor	a, a
   77AA 77            [ 7]  341 	ld	(hl), a
   77AB 23            [ 6]  342 	inc	hl
   77AC 77            [ 7]  343 	ld	(hl), a
                            344 ;src/balls.c:118: all_balls[i].prev_x = 0;
   77AD 21 05 00      [10]  345 	ld	hl, #0x0005
   77B0 19            [11]  346 	add	hl, de
   77B1 AF            [ 4]  347 	xor	a, a
   77B2 77            [ 7]  348 	ld	(hl), a
   77B3 23            [ 6]  349 	inc	hl
   77B4 77            [ 7]  350 	ld	(hl), a
                            351 ;src/balls.c:119: all_balls[i].prev_y = 0;
   77B5 21 07 00      [10]  352 	ld	hl, #0x0007
   77B8 19            [11]  353 	add	hl, de
   77B9 AF            [ 4]  354 	xor	a, a
   77BA 77            [ 7]  355 	ld	(hl), a
   77BB 23            [ 6]  356 	inc	hl
   77BC 77            [ 7]  357 	ld	(hl), a
                            358 ;src/balls.c:120: all_balls[i].dx = 0;
   77BD 21 09 00      [10]  359 	ld	hl, #0x0009
   77C0 19            [11]  360 	add	hl, de
   77C1 AF            [ 4]  361 	xor	a, a
   77C2 77            [ 7]  362 	ld	(hl), a
   77C3 23            [ 6]  363 	inc	hl
   77C4 77            [ 7]  364 	ld	(hl), a
                            365 ;src/balls.c:121: all_balls[i].dy = 0;
   77C5 21 0B 00      [10]  366 	ld	hl, #0x000b
   77C8 19            [11]  367 	add	hl, de
   77C9 AF            [ 4]  368 	xor	a, a
   77CA 77            [ 7]  369 	ld	(hl), a
   77CB 23            [ 6]  370 	inc	hl
   77CC 77            [ 7]  371 	ld	(hl), a
                            372 ;src/balls.c:113: for (u8 i = 0; i < MAX_BALLS; i++)
   77CD 0C            [ 4]  373 	inc	c
   77CE 18 B7         [12]  374 	jr	00103$
   77D0                     375 00101$:
                            376 ;src/balls.c:125: all_balls[0].active = 1;
   77D0 21 D4 8E      [10]  377 	ld	hl, #_all_balls
   77D3 36 01         [10]  378 	ld	(hl), #0x01
   77D5 C9            [10]  379 	ret
                            380 ;src/balls.c:128: void center_ball(Ball *ball)
                            381 ;	---------------------------------
                            382 ; Function center_ball
                            383 ; ---------------------------------
   77D6                     384 _center_ball::
   77D6 DD E5         [15]  385 	push	ix
   77D8 DD 21 00 00   [14]  386 	ld	ix,#0
   77DC DD 39         [15]  387 	add	ix,sp
   77DE F5            [11]  388 	push	af
                            389 ;src/balls.c:131: ball->prev_x = ball->x;
   77DF DD 5E 04      [19]  390 	ld	e,4 (ix)
   77E2 DD 56 05      [19]  391 	ld	d,5 (ix)
   77E5 FD 21 05 00   [14]  392 	ld	iy, #0x0005
   77E9 FD 19         [15]  393 	add	iy, de
   77EB 4B            [ 4]  394 	ld	c, e
   77EC 42            [ 4]  395 	ld	b, d
   77ED 03            [ 6]  396 	inc	bc
   77EE 69            [ 4]  397 	ld	l, c
   77EF 60            [ 4]  398 	ld	h, b
   77F0 7E            [ 7]  399 	ld	a, (hl)
   77F1 23            [ 6]  400 	inc	hl
   77F2 66            [ 7]  401 	ld	h, (hl)
   77F3 FD 77 00      [19]  402 	ld	0 (iy), a
   77F6 FD 74 01      [19]  403 	ld	1 (iy), h
                            404 ;src/balls.c:132: ball->prev_y = ball->y;
   77F9 FD 21 07 00   [14]  405 	ld	iy, #0x0007
   77FD FD 19         [15]  406 	add	iy, de
   77FF 13            [ 6]  407 	inc	de
   7800 13            [ 6]  408 	inc	de
   7801 13            [ 6]  409 	inc	de
   7802 33            [ 6]  410 	inc	sp
   7803 33            [ 6]  411 	inc	sp
   7804 D5            [11]  412 	push	de
   7805 E1            [10]  413 	pop	hl
   7806 E5            [11]  414 	push	hl
   7807 5E            [ 7]  415 	ld	e, (hl)
   7808 23            [ 6]  416 	inc	hl
   7809 56            [ 7]  417 	ld	d, (hl)
   780A FD 73 00      [19]  418 	ld	0 (iy), e
   780D FD 72 01      [19]  419 	ld	1 (iy), d
                            420 ;src/balls.c:135: ball->x = batX + (batW / 4);
   7810 21 74 93      [10]  421 	ld	hl,#_batX + 0
   7813 5E            [ 7]  422 	ld	e, (hl)
   7814 16 00         [ 7]  423 	ld	d, #0x00
   7816 FD 21 76 93   [14]  424 	ld	iy, #_batW
   781A FD 6E 00      [19]  425 	ld	l, 0 (iy)
   781D CB 3D         [ 8]  426 	srl	l
   781F CB 3D         [ 8]  427 	srl	l
   7821 26 00         [ 7]  428 	ld	h, #0x00
   7823 19            [11]  429 	add	hl,de
   7824 EB            [ 4]  430 	ex	de,hl
   7825 7B            [ 4]  431 	ld	a, e
   7826 02            [ 7]  432 	ld	(bc), a
   7827 03            [ 6]  433 	inc	bc
   7828 7A            [ 4]  434 	ld	a, d
   7829 02            [ 7]  435 	ld	(bc), a
                            436 ;src/balls.c:136: ball->y = batY - SP_BALL_H;
   782A 3A 73 93      [13]  437 	ld	a,(#_batY + 0)
   782D 06 00         [ 7]  438 	ld	b, #0x00
   782F C6 FA         [ 7]  439 	add	a, #0xfa
   7831 4F            [ 4]  440 	ld	c, a
   7832 78            [ 4]  441 	ld	a, b
   7833 CE FF         [ 7]  442 	adc	a, #0xff
   7835 47            [ 4]  443 	ld	b, a
   7836 E1            [10]  444 	pop	hl
   7837 E5            [11]  445 	push	hl
   7838 71            [ 7]  446 	ld	(hl), c
   7839 23            [ 6]  447 	inc	hl
   783A 70            [ 7]  448 	ld	(hl), b
   783B DD F9         [10]  449 	ld	sp, ix
   783D DD E1         [14]  450 	pop	ix
   783F C9            [10]  451 	ret
                            452 ;src/balls.c:139: void handle_serve(Ball *ball)
                            453 ;	---------------------------------
                            454 ; Function handle_serve
                            455 ; ---------------------------------
   7840                     456 _handle_serve::
   7840 DD E5         [15]  457 	push	ix
   7842 DD 21 00 00   [14]  458 	ld	ix,#0
   7846 DD 39         [15]  459 	add	ix,sp
                            460 ;src/balls.c:142: serving = 0;
   7848 21 FB 8E      [10]  461 	ld	hl,#_serving + 0
   784B 36 00         [10]  462 	ld	(hl), #0x00
                            463 ;src/balls.c:145: ball->dx = 1;
   784D DD 5E 04      [19]  464 	ld	e,4 (ix)
   7850 DD 56 05      [19]  465 	ld	d,5 (ix)
   7853 21 09 00      [10]  466 	ld	hl, #0x0009
   7856 19            [11]  467 	add	hl, de
   7857 36 01         [10]  468 	ld	(hl), #0x01
   7859 23            [ 6]  469 	inc	hl
   785A 36 00         [10]  470 	ld	(hl), #0x00
                            471 ;src/balls.c:146: ball->dy = -2;
   785C 21 0B 00      [10]  472 	ld	hl, #0x000b
   785F 19            [11]  473 	add	hl, de
   7860 36 FE         [10]  474 	ld	(hl), #0xfe
   7862 23            [ 6]  475 	inc	hl
   7863 36 FF         [10]  476 	ld	(hl), #0xff
                            477 ;src/balls.c:149: ball->prev_x = ball->x;
   7865 FD 21 05 00   [14]  478 	ld	iy, #0x0005
   7869 FD 19         [15]  479 	add	iy, de
   786B 6B            [ 4]  480 	ld	l, e
   786C 62            [ 4]  481 	ld	h, d
   786D 23            [ 6]  482 	inc	hl
   786E 4E            [ 7]  483 	ld	c, (hl)
   786F 23            [ 6]  484 	inc	hl
   7870 46            [ 7]  485 	ld	b, (hl)
   7871 FD 71 00      [19]  486 	ld	0 (iy), c
   7874 FD 70 01      [19]  487 	ld	1 (iy), b
                            488 ;src/balls.c:150: ball->prev_y = ball->y;
   7877 21 07 00      [10]  489 	ld	hl, #0x0007
   787A 19            [11]  490 	add	hl,de
   787B 4D            [ 4]  491 	ld	c, l
   787C 44            [ 4]  492 	ld	b, h
   787D EB            [ 4]  493 	ex	de,hl
   787E 23            [ 6]  494 	inc	hl
   787F 23            [ 6]  495 	inc	hl
   7880 23            [ 6]  496 	inc	hl
   7881 5E            [ 7]  497 	ld	e, (hl)
   7882 23            [ 6]  498 	inc	hl
   7883 56            [ 7]  499 	ld	d, (hl)
   7884 7B            [ 4]  500 	ld	a, e
   7885 02            [ 7]  501 	ld	(bc), a
   7886 03            [ 6]  502 	inc	bc
   7887 7A            [ 4]  503 	ld	a, d
   7888 02            [ 7]  504 	ld	(bc), a
   7889 DD E1         [14]  505 	pop	ix
   788B C9            [10]  506 	ret
                            507 ;src/balls.c:153: void update_ball(Ball *ball)
                            508 ;	---------------------------------
                            509 ; Function update_ball
                            510 ; ---------------------------------
   788C                     511 _update_ball::
   788C DD E5         [15]  512 	push	ix
   788E DD 21 00 00   [14]  513 	ld	ix,#0
   7892 DD 39         [15]  514 	add	ix,sp
   7894 21 F5 FF      [10]  515 	ld	hl, #-11
   7897 39            [11]  516 	add	hl, sp
   7898 F9            [ 6]  517 	ld	sp, hl
                            518 ;src/balls.c:155: ball->prev_x = ball->x;
   7899 DD 4E 04      [19]  519 	ld	c,4 (ix)
   789C DD 46 05      [19]  520 	ld	b,5 (ix)
   789F FD 21 05 00   [14]  521 	ld	iy, #0x0005
   78A3 FD 09         [15]  522 	add	iy, bc
   78A5 21 01 00      [10]  523 	ld	hl, #0x0001
   78A8 09            [11]  524 	add	hl,bc
   78A9 DD 75 F9      [19]  525 	ld	-7 (ix), l
   78AC DD 74 FA      [19]  526 	ld	-6 (ix), h
   78AF 5E            [ 7]  527 	ld	e, (hl)
   78B0 23            [ 6]  528 	inc	hl
   78B1 56            [ 7]  529 	ld	d, (hl)
   78B2 FD 73 00      [19]  530 	ld	0 (iy), e
   78B5 FD 72 01      [19]  531 	ld	1 (iy), d
                            532 ;src/balls.c:156: ball->prev_y = ball->y;
   78B8 FD 21 07 00   [14]  533 	ld	iy, #0x0007
   78BC FD 09         [15]  534 	add	iy, bc
   78BE 21 03 00      [10]  535 	ld	hl, #0x0003
   78C1 09            [11]  536 	add	hl,bc
   78C2 DD 75 F7      [19]  537 	ld	-9 (ix), l
   78C5 DD 74 F8      [19]  538 	ld	-8 (ix), h
   78C8 5E            [ 7]  539 	ld	e, (hl)
   78C9 23            [ 6]  540 	inc	hl
   78CA 56            [ 7]  541 	ld	d, (hl)
   78CB FD 73 00      [19]  542 	ld	0 (iy), e
   78CE FD 72 01      [19]  543 	ld	1 (iy), d
                            544 ;src/balls.c:158: if (ball->active)
   78D1 0A            [ 7]  545 	ld	a, (bc)
   78D2 B7            [ 4]  546 	or	a, a
   78D3 CA C6 79      [10]  547 	jp	Z, 00111$
                            548 ;src/balls.c:161: i16 new_x = ball->x + ball->dx;
   78D6 DD 6E F9      [19]  549 	ld	l,-7 (ix)
   78D9 DD 66 FA      [19]  550 	ld	h,-6 (ix)
   78DC 5E            [ 7]  551 	ld	e, (hl)
   78DD 23            [ 6]  552 	inc	hl
   78DE 56            [ 7]  553 	ld	d, (hl)
   78DF 21 09 00      [10]  554 	ld	hl, #0x0009
   78E2 09            [11]  555 	add	hl,bc
   78E3 DD 75 FE      [19]  556 	ld	-2 (ix), l
   78E6 DD 74 FF      [19]  557 	ld	-1 (ix), h
   78E9 7E            [ 7]  558 	ld	a, (hl)
   78EA 23            [ 6]  559 	inc	hl
   78EB 66            [ 7]  560 	ld	h, (hl)
   78EC 6F            [ 4]  561 	ld	l, a
   78ED 19            [11]  562 	add	hl, de
   78EE 33            [ 6]  563 	inc	sp
   78EF 33            [ 6]  564 	inc	sp
   78F0 E5            [11]  565 	push	hl
                            566 ;src/balls.c:162: i16 new_y = ball->y + ball->dy;
   78F1 DD 6E F7      [19]  567 	ld	l,-9 (ix)
   78F4 DD 66 F8      [19]  568 	ld	h,-8 (ix)
   78F7 5E            [ 7]  569 	ld	e, (hl)
   78F8 23            [ 6]  570 	inc	hl
   78F9 56            [ 7]  571 	ld	d, (hl)
   78FA 21 0B 00      [10]  572 	ld	hl, #0x000b
   78FD 09            [11]  573 	add	hl,bc
   78FE DD 75 FC      [19]  574 	ld	-4 (ix), l
   7901 DD 74 FD      [19]  575 	ld	-3 (ix), h
   7904 7E            [ 7]  576 	ld	a, (hl)
   7905 23            [ 6]  577 	inc	hl
   7906 66            [ 7]  578 	ld	h, (hl)
   7907 6F            [ 4]  579 	ld	l, a
   7908 19            [11]  580 	add	hl,de
   7909 EB            [ 4]  581 	ex	de,hl
                            582 ;src/balls.c:164: if (new_y >= YOUR_DEAD_Y)
   790A 7B            [ 4]  583 	ld	a, e
   790B D6 BA         [ 7]  584 	sub	a, #0xba
   790D 7A            [ 4]  585 	ld	a, d
   790E 17            [ 4]  586 	rla
   790F 3F            [ 4]  587 	ccf
   7910 1F            [ 4]  588 	rra
   7911 DE 80         [ 7]  589 	sbc	a, #0x80
   7913 38 0F         [12]  590 	jr	C,00102$
                            591 ;src/balls.c:167: ball->active = 0;
   7915 AF            [ 4]  592 	xor	a, a
   7916 02            [ 7]  593 	ld	(bc), a
                            594 ;src/balls.c:168: ball->dy = 0;
   7917 DD 6E FC      [19]  595 	ld	l,-4 (ix)
   791A DD 66 FD      [19]  596 	ld	h,-3 (ix)
   791D AF            [ 4]  597 	xor	a, a
   791E 77            [ 7]  598 	ld	(hl), a
   791F 23            [ 6]  599 	inc	hl
   7920 77            [ 7]  600 	ld	(hl), a
                            601 ;src/balls.c:169: return;
   7921 C3 C6 79      [10]  602 	jp	00111$
   7924                     603 00102$:
                            604 ;src/balls.c:172: hits |= background_bounce_ball(new_x, new_y);
   7924 C5            [11]  605 	push	bc
   7925 D5            [11]  606 	push	de
   7926 D5            [11]  607 	push	de
   7927 DD 6E F5      [19]  608 	ld	l,-11 (ix)
   792A DD 66 F6      [19]  609 	ld	h,-10 (ix)
   792D E5            [11]  610 	push	hl
   792E CD E7 74      [17]  611 	call	_background_bounce_ball
   7931 F1            [10]  612 	pop	af
   7932 F1            [10]  613 	pop	af
   7933 D1            [10]  614 	pop	de
   7934 C1            [10]  615 	pop	bc
   7935 DD 75 FB      [19]  616 	ld	-5 (ix), l
                            617 ;src/balls.c:173: hits |= bat_bounce_ball(ball, new_x, new_y);
   7938 D5            [11]  618 	push	de
   7939 D5            [11]  619 	push	de
   793A DD 6E F5      [19]  620 	ld	l,-11 (ix)
   793D DD 66 F6      [19]  621 	ld	h,-10 (ix)
   7940 E5            [11]  622 	push	hl
   7941 C5            [11]  623 	push	bc
   7942 CD 9D 7A      [17]  624 	call	_bat_bounce_ball
   7945 F1            [10]  625 	pop	af
   7946 F1            [10]  626 	pop	af
   7947 F1            [10]  627 	pop	af
   7948 D1            [10]  628 	pop	de
   7949 DD 7E FB      [19]  629 	ld	a, -5 (ix)
   794C B5            [ 4]  630 	or	a, l
   794D 4F            [ 4]  631 	ld	c, a
                            632 ;src/balls.c:174: hits |= blocks_bounce_ball(ball, new_x, new_y);
   794E C5            [11]  633 	push	bc
   794F D5            [11]  634 	push	de
   7950 D5            [11]  635 	push	de
   7951 DD 6E F5      [19]  636 	ld	l,-11 (ix)
   7954 DD 66 F6      [19]  637 	ld	h,-10 (ix)
   7957 E5            [11]  638 	push	hl
   7958 DD 6E 04      [19]  639 	ld	l,4 (ix)
   795B DD 66 05      [19]  640 	ld	h,5 (ix)
   795E E5            [11]  641 	push	hl
   795F CD 61 7B      [17]  642 	call	_blocks_bounce_ball
   7962 F1            [10]  643 	pop	af
   7963 F1            [10]  644 	pop	af
   7964 F1            [10]  645 	pop	af
   7965 D1            [10]  646 	pop	de
   7966 C1            [10]  647 	pop	bc
   7967 79            [ 4]  648 	ld	a, c
   7968 B5            [ 4]  649 	or	a, l
   7969 DD 77 FB      [19]  650 	ld	-5 (ix), a
                            651 ;src/balls.c:176: if (hits & BOUNCE_X)
   796C DD CB FB 46   [20]  652 	bit	0, -5 (ix)
   7970 28 1B         [12]  653 	jr	Z,00104$
                            654 ;src/balls.c:178: ball->dx = -ball->dx;
   7972 DD 6E FE      [19]  655 	ld	l,-2 (ix)
   7975 DD 66 FF      [19]  656 	ld	h,-1 (ix)
   7978 4E            [ 7]  657 	ld	c, (hl)
   7979 23            [ 6]  658 	inc	hl
   797A 46            [ 7]  659 	ld	b, (hl)
   797B AF            [ 4]  660 	xor	a, a
   797C 91            [ 4]  661 	sub	a, c
   797D 4F            [ 4]  662 	ld	c, a
   797E 3E 00         [ 7]  663 	ld	a, #0x00
   7980 98            [ 4]  664 	sbc	a, b
   7981 47            [ 4]  665 	ld	b, a
   7982 DD 6E FE      [19]  666 	ld	l,-2 (ix)
   7985 DD 66 FF      [19]  667 	ld	h,-1 (ix)
   7988 71            [ 7]  668 	ld	(hl), c
   7989 23            [ 6]  669 	inc	hl
   798A 70            [ 7]  670 	ld	(hl), b
   798B 18 0F         [12]  671 	jr	00105$
   798D                     672 00104$:
                            673 ;src/balls.c:182: ball->x = new_x;
   798D DD 6E F9      [19]  674 	ld	l,-7 (ix)
   7990 DD 66 FA      [19]  675 	ld	h,-6 (ix)
   7993 DD 7E F5      [19]  676 	ld	a, -11 (ix)
   7996 77            [ 7]  677 	ld	(hl), a
   7997 23            [ 6]  678 	inc	hl
   7998 DD 7E F6      [19]  679 	ld	a, -10 (ix)
   799B 77            [ 7]  680 	ld	(hl), a
   799C                     681 00105$:
                            682 ;src/balls.c:185: if (hits & BOUNCE_Y)
   799C DD CB FB 4E   [20]  683 	bit	1, -5 (ix)
   79A0 28 1B         [12]  684 	jr	Z,00107$
                            685 ;src/balls.c:187: ball->dy = -ball->dy;
   79A2 DD 6E FC      [19]  686 	ld	l,-4 (ix)
   79A5 DD 66 FD      [19]  687 	ld	h,-3 (ix)
   79A8 4E            [ 7]  688 	ld	c, (hl)
   79A9 23            [ 6]  689 	inc	hl
   79AA 46            [ 7]  690 	ld	b, (hl)
   79AB AF            [ 4]  691 	xor	a, a
   79AC 91            [ 4]  692 	sub	a, c
   79AD 4F            [ 4]  693 	ld	c, a
   79AE 3E 00         [ 7]  694 	ld	a, #0x00
   79B0 98            [ 4]  695 	sbc	a, b
   79B1 47            [ 4]  696 	ld	b, a
   79B2 DD 6E FC      [19]  697 	ld	l,-4 (ix)
   79B5 DD 66 FD      [19]  698 	ld	h,-3 (ix)
   79B8 71            [ 7]  699 	ld	(hl), c
   79B9 23            [ 6]  700 	inc	hl
   79BA 70            [ 7]  701 	ld	(hl), b
   79BB 18 09         [12]  702 	jr	00111$
   79BD                     703 00107$:
                            704 ;src/balls.c:191: ball->y = new_y;
   79BD DD 6E F7      [19]  705 	ld	l,-9 (ix)
   79C0 DD 66 F8      [19]  706 	ld	h,-8 (ix)
   79C3 73            [ 7]  707 	ld	(hl), e
   79C4 23            [ 6]  708 	inc	hl
   79C5 72            [ 7]  709 	ld	(hl), d
   79C6                     710 00111$:
   79C6 DD F9         [10]  711 	ld	sp, ix
   79C8 DD E1         [14]  712 	pop	ix
   79CA C9            [10]  713 	ret
                            714 	.area _CODE
                            715 	.area _INITIALIZER
                            716 	.area _CABS (ABS)
