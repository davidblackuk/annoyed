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
                             16 	.globl _cpct_drawSpriteMaskedAlignedTable
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
   7BFA                      35 _all_balls::
   7BFA                      36 	.ds 39
   7C21                      37 _serving::
   7C21                      38 	.ds 1
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
                             63 ;src/balls.c:32: void balls_initialize()
                             64 ;	---------------------------------
                             65 ; Function balls_initialize
                             66 ; ---------------------------------
   686E                      67 _balls_initialize::
                             68 ;src/balls.c:35: serving = 1;
   686E 21 21 7C      [10]   69 	ld	hl,#_serving + 0
   6871 36 01         [10]   70 	ld	(hl), #0x01
                             71 ;src/balls.c:37: initialize_balls();
   6873 CD 99 69      [17]   72 	call	_initialize_balls
                             73 ;src/balls.c:40: center_ball(all_balls);
   6876 21 FA 7B      [10]   74 	ld	hl, #_all_balls
   6879 E5            [11]   75 	push	hl
   687A CD EA 69      [17]   76 	call	_center_ball
   687D F1            [10]   77 	pop	af
   687E C9            [10]   78 	ret
                             79 ;src/balls.c:43: void balls_update()
                             80 ;	---------------------------------
                             81 ; Function balls_update
                             82 ; ---------------------------------
   687F                      83 _balls_update::
                             84 ;src/balls.c:45: Ball *ball = all_balls;
   687F 01 FA 7B      [10]   85 	ld	bc, #_all_balls+0
                             86 ;src/balls.c:46: if (serving)
   6882 3A 21 7C      [13]   87 	ld	a,(#_serving + 0)
   6885 B7            [ 4]   88 	or	a, a
   6886 28 12         [12]   89 	jr	Z,00115$
                             90 ;src/balls.c:48: center_ball(ball);
   6888 C5            [11]   91 	push	bc
   6889 C5            [11]   92 	push	bc
   688A CD EA 69      [17]   93 	call	_center_ball
   688D F1            [10]   94 	pop	af
   688E C1            [10]   95 	pop	bc
                             96 ;src/balls.c:49: if (key_serve_is_pressed)
   688F 3A 75 80      [13]   97 	ld	a,(#_key_serve_is_pressed + 0)
   6892 B7            [ 4]   98 	or	a, a
   6893 C8            [11]   99 	ret	Z
                            100 ;src/balls.c:51: handle_serve(ball);
   6894 C5            [11]  101 	push	bc
   6895 CD 56 6A      [17]  102 	call	_handle_serve
   6898 F1            [10]  103 	pop	af
   6899 C9            [10]  104 	ret
                            105 ;src/balls.c:56: for (u8 i = 0; i < MAX_BALLS; i++)
   689A                     106 00115$:
   689A 1E 00         [ 7]  107 	ld	e, #0x00
   689C                     108 00108$:
   689C 7B            [ 4]  109 	ld	a, e
   689D D6 03         [ 7]  110 	sub	a, #0x03
   689F D0            [11]  111 	ret	NC
                            112 ;src/balls.c:58: update_ball(ball);
   68A0 C5            [11]  113 	push	bc
   68A1 D5            [11]  114 	push	de
   68A2 C5            [11]  115 	push	bc
   68A3 CD A2 6A      [17]  116 	call	_update_ball
   68A6 F1            [10]  117 	pop	af
   68A7 D1            [10]  118 	pop	de
   68A8 C1            [10]  119 	pop	bc
                            120 ;src/balls.c:59: ball++;
   68A9 21 0D 00      [10]  121 	ld	hl, #0x000d
   68AC 09            [11]  122 	add	hl,bc
   68AD 4D            [ 4]  123 	ld	c, l
   68AE 44            [ 4]  124 	ld	b, h
                            125 ;src/balls.c:56: for (u8 i = 0; i < MAX_BALLS; i++)
   68AF 1C            [ 4]  126 	inc	e
   68B0 18 EA         [12]  127 	jr	00108$
                            128 ;src/balls.c:64: void balls_restore_background()
                            129 ;	---------------------------------
                            130 ; Function balls_restore_background
                            131 ; ---------------------------------
   68B2                     132 _balls_restore_background::
   68B2 DD E5         [15]  133 	push	ix
   68B4 DD 21 00 00   [14]  134 	ld	ix,#0
   68B8 DD 39         [15]  135 	add	ix,sp
   68BA F5            [11]  136 	push	af
   68BB 3B            [ 6]  137 	dec	sp
                            138 ;src/balls.c:66: Ball *ball = all_balls;
   68BC 01 FA 7B      [10]  139 	ld	bc, #_all_balls+0
                            140 ;src/balls.c:67: for (u8 i = 0; i < MAX_BALLS; i++)
   68BF DD 36 FD 00   [19]  141 	ld	-3 (ix), #0x00
   68C3                     142 00105$:
   68C3 DD 7E FD      [19]  143 	ld	a, -3 (ix)
   68C6 D6 03         [ 7]  144 	sub	a, #0x03
   68C8 30 3D         [12]  145 	jr	NC,00107$
                            146 ;src/balls.c:69: if (ball->active)
   68CA 0A            [ 7]  147 	ld	a, (bc)
   68CB B7            [ 4]  148 	or	a, a
   68CC 28 2E         [12]  149 	jr	Z,00102$
                            150 ;src/balls.c:71: background_restore_world_coords(ball->prev_x, ball->prev_y, SP_BALL_W, SP_BALL_H);
   68CE 69            [ 4]  151 	ld	l, c
   68CF 60            [ 4]  152 	ld	h, b
   68D0 11 07 00      [10]  153 	ld	de, #0x0007
   68D3 19            [11]  154 	add	hl, de
   68D4 5E            [ 7]  155 	ld	e, (hl)
   68D5 23            [ 6]  156 	inc	hl
   68D6 56            [ 7]  157 	ld	d, (hl)
   68D7 C5            [11]  158 	push	bc
   68D8 FD E1         [14]  159 	pop	iy
   68DA FD 7E 05      [19]  160 	ld	a, 5 (iy)
   68DD DD 77 FE      [19]  161 	ld	-2 (ix), a
   68E0 FD 7E 06      [19]  162 	ld	a, 6 (iy)
   68E3 DD 77 FF      [19]  163 	ld	-1 (ix), a
   68E6 C5            [11]  164 	push	bc
   68E7 21 03 06      [10]  165 	ld	hl, #0x0603
   68EA E5            [11]  166 	push	hl
   68EB D5            [11]  167 	push	de
   68EC DD 6E FE      [19]  168 	ld	l,-2 (ix)
   68EF DD 66 FF      [19]  169 	ld	h,-1 (ix)
   68F2 E5            [11]  170 	push	hl
   68F3 CD 3C 67      [17]  171 	call	_background_restore_world_coords
   68F6 21 06 00      [10]  172 	ld	hl, #6
   68F9 39            [11]  173 	add	hl, sp
   68FA F9            [ 6]  174 	ld	sp, hl
   68FB C1            [10]  175 	pop	bc
   68FC                     176 00102$:
                            177 ;src/balls.c:73: ball++;
   68FC 21 0D 00      [10]  178 	ld	hl, #0x000d
   68FF 09            [11]  179 	add	hl,bc
   6900 4D            [ 4]  180 	ld	c, l
   6901 44            [ 4]  181 	ld	b, h
                            182 ;src/balls.c:67: for (u8 i = 0; i < MAX_BALLS; i++)
   6902 DD 34 FD      [23]  183 	inc	-3 (ix)
   6905 18 BC         [12]  184 	jr	00105$
   6907                     185 00107$:
   6907 DD F9         [10]  186 	ld	sp, ix
   6909 DD E1         [14]  187 	pop	ix
   690B C9            [10]  188 	ret
                            189 ;src/balls.c:77: void balls_draw()
                            190 ;	---------------------------------
                            191 ; Function balls_draw
                            192 ; ---------------------------------
   690C                     193 _balls_draw::
   690C DD E5         [15]  194 	push	ix
   690E DD 21 00 00   [14]  195 	ld	ix,#0
   6912 DD 39         [15]  196 	add	ix,sp
   6914 3B            [ 6]  197 	dec	sp
                            198 ;src/balls.c:80: Ball *ball = all_balls;
   6915 01 FA 7B      [10]  199 	ld	bc, #_all_balls+0
                            200 ;src/balls.c:81: for (u8 i = 0; i < MAX_BALLS; i++)
   6918 DD 36 FF 00   [19]  201 	ld	-1 (ix), #0x00
   691C                     202 00105$:
   691C DD 7E FF      [19]  203 	ld	a, -1 (ix)
   691F D6 03         [ 7]  204 	sub	a, #0x03
   6921 30 3E         [12]  205 	jr	NC,00107$
                            206 ;src/balls.c:83: if (ball->active)
   6923 0A            [ 7]  207 	ld	a, (bc)
   6924 B7            [ 4]  208 	or	a, a
   6925 28 35         [12]  209 	jr	Z,00106$
                            210 ;src/balls.c:85: svmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(ball->x), W_2_S_Y(ball->y));
   6927 69            [ 4]  211 	ld	l, c
   6928 60            [ 4]  212 	ld	h, b
   6929 23            [ 6]  213 	inc	hl
   692A 23            [ 6]  214 	inc	hl
   692B 23            [ 6]  215 	inc	hl
   692C 5E            [ 7]  216 	ld	e, (hl)
   692D 23            [ 6]  217 	inc	hl
   692E 56            [ 7]  218 	ld	d, (hl)
   692F 7B            [ 4]  219 	ld	a, e
   6930 C6 08         [ 7]  220 	add	a, #0x08
   6932 57            [ 4]  221 	ld	d, a
   6933 69            [ 4]  222 	ld	l, c
   6934 60            [ 4]  223 	ld	h, b
   6935 23            [ 6]  224 	inc	hl
   6936 7E            [ 7]  225 	ld	a, (hl)
   6937 23            [ 6]  226 	inc	hl
   6938 66            [ 7]  227 	ld	h, (hl)
   6939 C6 0C         [ 7]  228 	add	a, #0x0c
   693B C5            [11]  229 	push	bc
   693C 5F            [ 4]  230 	ld	e, a
   693D D5            [11]  231 	push	de
   693E 21 00 C0      [10]  232 	ld	hl, #0xc000
   6941 E5            [11]  233 	push	hl
   6942 CD 48 7B      [17]  234 	call	_cpct_getScreenPtr
   6945 11 00 01      [10]  235 	ld	de, #_g_masktable
   6948 D5            [11]  236 	push	de
   6949 11 03 06      [10]  237 	ld	de, #0x0603
   694C D5            [11]  238 	push	de
   694D E5            [11]  239 	push	hl
   694E 21 17 66      [10]  240 	ld	hl, #_sp_ball
   6951 E5            [11]  241 	push	hl
   6952 CD 0D 7B      [17]  242 	call	_cpct_drawSpriteMaskedAlignedTable
   6955 C1            [10]  243 	pop	bc
                            244 ;src/balls.c:90: ball++;
   6956 21 0D 00      [10]  245 	ld	hl, #0x000d
   6959 09            [11]  246 	add	hl,bc
   695A 4D            [ 4]  247 	ld	c, l
   695B 44            [ 4]  248 	ld	b, h
   695C                     249 00106$:
                            250 ;src/balls.c:81: for (u8 i = 0; i < MAX_BALLS; i++)
   695C DD 34 FF      [23]  251 	inc	-1 (ix)
   695F 18 BB         [12]  252 	jr	00105$
   6961                     253 00107$:
   6961 33            [ 6]  254 	inc	sp
   6962 DD E1         [14]  255 	pop	ix
   6964 C9            [10]  256 	ret
                            257 ;src/balls.c:95: Ball *balls_get_first_active()
                            258 ;	---------------------------------
                            259 ; Function balls_get_first_active
                            260 ; ---------------------------------
   6965                     261 _balls_get_first_active::
   6965 DD E5         [15]  262 	push	ix
   6967 DD 21 00 00   [14]  263 	ld	ix,#0
   696B DD 39         [15]  264 	add	ix,sp
   696D F5            [11]  265 	push	af
                            266 ;src/balls.c:97: Ball *ball = all_balls;
   696E DD 36 FE FA   [19]  267 	ld	-2 (ix), #<(_all_balls)
   6972 DD 36 FF 7B   [19]  268 	ld	-1 (ix), #>(_all_balls)
                            269 ;src/balls.c:98: for (u8 i = 0; i < MAX_BALLS; i++)
   6976 E1            [10]  270 	pop	hl
   6977 E5            [11]  271 	push	hl
   6978 0E 00         [ 7]  272 	ld	c, #0x00
   697A                     273 00105$:
   697A 79            [ 4]  274 	ld	a, c
   697B D6 03         [ 7]  275 	sub	a, #0x03
   697D 30 12         [12]  276 	jr	NC,00103$
                            277 ;src/balls.c:100: if (ball->active)
   697F 7E            [ 7]  278 	ld	a, (hl)
   6980 B7            [ 4]  279 	or	a, a
   6981 28 04         [12]  280 	jr	Z,00102$
                            281 ;src/balls.c:102: return ball;
   6983 E1            [10]  282 	pop	hl
   6984 E5            [11]  283 	push	hl
   6985 18 0D         [12]  284 	jr	00107$
   6987                     285 00102$:
                            286 ;src/balls.c:104: ball++;
   6987 11 0D 00      [10]  287 	ld	de, #0x000d
   698A 19            [11]  288 	add	hl, de
   698B 33            [ 6]  289 	inc	sp
   698C 33            [ 6]  290 	inc	sp
   698D E5            [11]  291 	push	hl
                            292 ;src/balls.c:98: for (u8 i = 0; i < MAX_BALLS; i++)
   698E 0C            [ 4]  293 	inc	c
   698F 18 E9         [12]  294 	jr	00105$
   6991                     295 00103$:
                            296 ;src/balls.c:106: return NULL;
   6991 21 00 00      [10]  297 	ld	hl, #0x0000
   6994                     298 00107$:
   6994 DD F9         [10]  299 	ld	sp, ix
   6996 DD E1         [14]  300 	pop	ix
   6998 C9            [10]  301 	ret
                            302 ;src/balls.c:113: void initialize_balls()
                            303 ;	---------------------------------
                            304 ; Function initialize_balls
                            305 ; ---------------------------------
   6999                     306 _initialize_balls::
                            307 ;src/balls.c:116: for (u8 i = 0; i < MAX_BALLS; i++)
   6999 0E 00         [ 7]  308 	ld	c, #0x00
   699B                     309 00103$:
   699B 79            [ 4]  310 	ld	a, c
   699C D6 03         [ 7]  311 	sub	a, #0x03
   699E 30 44         [12]  312 	jr	NC,00101$
                            313 ;src/balls.c:118: all_balls[i].active = 0;
   69A0 06 00         [ 7]  314 	ld	b,#0x00
   69A2 69            [ 4]  315 	ld	l, c
   69A3 60            [ 4]  316 	ld	h, b
   69A4 29            [11]  317 	add	hl, hl
   69A5 09            [11]  318 	add	hl, bc
   69A6 29            [11]  319 	add	hl, hl
   69A7 29            [11]  320 	add	hl, hl
   69A8 09            [11]  321 	add	hl, bc
   69A9 EB            [ 4]  322 	ex	de,hl
   69AA 21 FA 7B      [10]  323 	ld	hl, #_all_balls
   69AD 19            [11]  324 	add	hl,de
   69AE EB            [ 4]  325 	ex	de,hl
   69AF AF            [ 4]  326 	xor	a, a
   69B0 12            [ 7]  327 	ld	(de), a
                            328 ;src/balls.c:119: all_balls[i].x = 0;
   69B1 6B            [ 4]  329 	ld	l, e
   69B2 62            [ 4]  330 	ld	h, d
   69B3 23            [ 6]  331 	inc	hl
   69B4 AF            [ 4]  332 	xor	a, a
   69B5 77            [ 7]  333 	ld	(hl), a
   69B6 23            [ 6]  334 	inc	hl
   69B7 77            [ 7]  335 	ld	(hl), a
                            336 ;src/balls.c:120: all_balls[i].y = 0;
   69B8 6B            [ 4]  337 	ld	l, e
   69B9 62            [ 4]  338 	ld	h, d
   69BA 23            [ 6]  339 	inc	hl
   69BB 23            [ 6]  340 	inc	hl
   69BC 23            [ 6]  341 	inc	hl
   69BD AF            [ 4]  342 	xor	a, a
   69BE 77            [ 7]  343 	ld	(hl), a
   69BF 23            [ 6]  344 	inc	hl
   69C0 77            [ 7]  345 	ld	(hl), a
                            346 ;src/balls.c:121: all_balls[i].prev_x = 0;
   69C1 21 05 00      [10]  347 	ld	hl, #0x0005
   69C4 19            [11]  348 	add	hl, de
   69C5 AF            [ 4]  349 	xor	a, a
   69C6 77            [ 7]  350 	ld	(hl), a
   69C7 23            [ 6]  351 	inc	hl
   69C8 77            [ 7]  352 	ld	(hl), a
                            353 ;src/balls.c:122: all_balls[i].prev_y = 0;
   69C9 21 07 00      [10]  354 	ld	hl, #0x0007
   69CC 19            [11]  355 	add	hl, de
   69CD AF            [ 4]  356 	xor	a, a
   69CE 77            [ 7]  357 	ld	(hl), a
   69CF 23            [ 6]  358 	inc	hl
   69D0 77            [ 7]  359 	ld	(hl), a
                            360 ;src/balls.c:123: all_balls[i].dx = 0;
   69D1 21 09 00      [10]  361 	ld	hl, #0x0009
   69D4 19            [11]  362 	add	hl, de
   69D5 AF            [ 4]  363 	xor	a, a
   69D6 77            [ 7]  364 	ld	(hl), a
   69D7 23            [ 6]  365 	inc	hl
   69D8 77            [ 7]  366 	ld	(hl), a
                            367 ;src/balls.c:124: all_balls[i].dy = 0;
   69D9 21 0B 00      [10]  368 	ld	hl, #0x000b
   69DC 19            [11]  369 	add	hl, de
   69DD AF            [ 4]  370 	xor	a, a
   69DE 77            [ 7]  371 	ld	(hl), a
   69DF 23            [ 6]  372 	inc	hl
   69E0 77            [ 7]  373 	ld	(hl), a
                            374 ;src/balls.c:116: for (u8 i = 0; i < MAX_BALLS; i++)
   69E1 0C            [ 4]  375 	inc	c
   69E2 18 B7         [12]  376 	jr	00103$
   69E4                     377 00101$:
                            378 ;src/balls.c:128: all_balls[0].active = 1;
   69E4 21 FA 7B      [10]  379 	ld	hl, #_all_balls
   69E7 36 01         [10]  380 	ld	(hl), #0x01
   69E9 C9            [10]  381 	ret
                            382 ;src/balls.c:131: void center_ball(Ball *ball)
                            383 ;	---------------------------------
                            384 ; Function center_ball
                            385 ; ---------------------------------
   69EA                     386 _center_ball::
   69EA DD E5         [15]  387 	push	ix
   69EC DD 21 00 00   [14]  388 	ld	ix,#0
   69F0 DD 39         [15]  389 	add	ix,sp
   69F2 F5            [11]  390 	push	af
                            391 ;src/balls.c:134: ball->prev_x = ball->x;
   69F3 DD 5E 04      [19]  392 	ld	e,4 (ix)
   69F6 DD 56 05      [19]  393 	ld	d,5 (ix)
   69F9 FD 21 05 00   [14]  394 	ld	iy, #0x0005
   69FD FD 19         [15]  395 	add	iy, de
   69FF 4B            [ 4]  396 	ld	c, e
   6A00 42            [ 4]  397 	ld	b, d
   6A01 03            [ 6]  398 	inc	bc
   6A02 69            [ 4]  399 	ld	l, c
   6A03 60            [ 4]  400 	ld	h, b
   6A04 7E            [ 7]  401 	ld	a, (hl)
   6A05 23            [ 6]  402 	inc	hl
   6A06 66            [ 7]  403 	ld	h, (hl)
   6A07 FD 77 00      [19]  404 	ld	0 (iy), a
   6A0A FD 74 01      [19]  405 	ld	1 (iy), h
                            406 ;src/balls.c:135: ball->prev_y = ball->y;
   6A0D FD 21 07 00   [14]  407 	ld	iy, #0x0007
   6A11 FD 19         [15]  408 	add	iy, de
   6A13 13            [ 6]  409 	inc	de
   6A14 13            [ 6]  410 	inc	de
   6A15 13            [ 6]  411 	inc	de
   6A16 33            [ 6]  412 	inc	sp
   6A17 33            [ 6]  413 	inc	sp
   6A18 D5            [11]  414 	push	de
   6A19 E1            [10]  415 	pop	hl
   6A1A E5            [11]  416 	push	hl
   6A1B 5E            [ 7]  417 	ld	e, (hl)
   6A1C 23            [ 6]  418 	inc	hl
   6A1D 56            [ 7]  419 	ld	d, (hl)
   6A1E FD 73 00      [19]  420 	ld	0 (iy), e
   6A21 FD 72 01      [19]  421 	ld	1 (iy), d
                            422 ;src/balls.c:138: ball->x = batX + (batW / 4) + 1;
   6A24 21 82 80      [10]  423 	ld	hl,#_batX + 0
   6A27 5E            [ 7]  424 	ld	e, (hl)
   6A28 16 00         [ 7]  425 	ld	d, #0x00
   6A2A FD 21 84 80   [14]  426 	ld	iy, #_batW
   6A2E FD 6E 00      [19]  427 	ld	l, 0 (iy)
   6A31 CB 3D         [ 8]  428 	srl	l
   6A33 CB 3D         [ 8]  429 	srl	l
   6A35 26 00         [ 7]  430 	ld	h, #0x00
   6A37 19            [11]  431 	add	hl, de
   6A38 23            [ 6]  432 	inc	hl
   6A39 55            [ 4]  433 	ld	d, l
   6A3A 5C            [ 4]  434 	ld	e, h
   6A3B 7A            [ 4]  435 	ld	a, d
   6A3C 02            [ 7]  436 	ld	(bc), a
   6A3D 03            [ 6]  437 	inc	bc
   6A3E 7B            [ 4]  438 	ld	a, e
   6A3F 02            [ 7]  439 	ld	(bc), a
                            440 ;src/balls.c:139: ball->y = batY - SP_BALL_H;
   6A40 3A 81 80      [13]  441 	ld	a,(#_batY + 0)
   6A43 06 00         [ 7]  442 	ld	b, #0x00
   6A45 C6 FA         [ 7]  443 	add	a, #0xfa
   6A47 4F            [ 4]  444 	ld	c, a
   6A48 78            [ 4]  445 	ld	a, b
   6A49 CE FF         [ 7]  446 	adc	a, #0xff
   6A4B 47            [ 4]  447 	ld	b, a
   6A4C E1            [10]  448 	pop	hl
   6A4D E5            [11]  449 	push	hl
   6A4E 71            [ 7]  450 	ld	(hl), c
   6A4F 23            [ 6]  451 	inc	hl
   6A50 70            [ 7]  452 	ld	(hl), b
   6A51 DD F9         [10]  453 	ld	sp, ix
   6A53 DD E1         [14]  454 	pop	ix
   6A55 C9            [10]  455 	ret
                            456 ;src/balls.c:142: void handle_serve(Ball *ball)
                            457 ;	---------------------------------
                            458 ; Function handle_serve
                            459 ; ---------------------------------
   6A56                     460 _handle_serve::
   6A56 DD E5         [15]  461 	push	ix
   6A58 DD 21 00 00   [14]  462 	ld	ix,#0
   6A5C DD 39         [15]  463 	add	ix,sp
                            464 ;src/balls.c:145: serving = 0;
   6A5E 21 21 7C      [10]  465 	ld	hl,#_serving + 0
   6A61 36 00         [10]  466 	ld	(hl), #0x00
                            467 ;src/balls.c:148: ball->dx = 1;
   6A63 DD 5E 04      [19]  468 	ld	e,4 (ix)
   6A66 DD 56 05      [19]  469 	ld	d,5 (ix)
   6A69 21 09 00      [10]  470 	ld	hl, #0x0009
   6A6C 19            [11]  471 	add	hl, de
   6A6D 36 01         [10]  472 	ld	(hl), #0x01
   6A6F 23            [ 6]  473 	inc	hl
   6A70 36 00         [10]  474 	ld	(hl), #0x00
                            475 ;src/balls.c:149: ball->dy = -2;
   6A72 21 0B 00      [10]  476 	ld	hl, #0x000b
   6A75 19            [11]  477 	add	hl, de
   6A76 36 FE         [10]  478 	ld	(hl), #0xfe
   6A78 23            [ 6]  479 	inc	hl
   6A79 36 FF         [10]  480 	ld	(hl), #0xff
                            481 ;src/balls.c:152: ball->prev_x = ball->x;
   6A7B FD 21 05 00   [14]  482 	ld	iy, #0x0005
   6A7F FD 19         [15]  483 	add	iy, de
   6A81 6B            [ 4]  484 	ld	l, e
   6A82 62            [ 4]  485 	ld	h, d
   6A83 23            [ 6]  486 	inc	hl
   6A84 4E            [ 7]  487 	ld	c, (hl)
   6A85 23            [ 6]  488 	inc	hl
   6A86 46            [ 7]  489 	ld	b, (hl)
   6A87 FD 71 00      [19]  490 	ld	0 (iy), c
   6A8A FD 70 01      [19]  491 	ld	1 (iy), b
                            492 ;src/balls.c:153: ball->prev_y = ball->y;
   6A8D 21 07 00      [10]  493 	ld	hl, #0x0007
   6A90 19            [11]  494 	add	hl,de
   6A91 4D            [ 4]  495 	ld	c, l
   6A92 44            [ 4]  496 	ld	b, h
   6A93 EB            [ 4]  497 	ex	de,hl
   6A94 23            [ 6]  498 	inc	hl
   6A95 23            [ 6]  499 	inc	hl
   6A96 23            [ 6]  500 	inc	hl
   6A97 5E            [ 7]  501 	ld	e, (hl)
   6A98 23            [ 6]  502 	inc	hl
   6A99 56            [ 7]  503 	ld	d, (hl)
   6A9A 7B            [ 4]  504 	ld	a, e
   6A9B 02            [ 7]  505 	ld	(bc), a
   6A9C 03            [ 6]  506 	inc	bc
   6A9D 7A            [ 4]  507 	ld	a, d
   6A9E 02            [ 7]  508 	ld	(bc), a
   6A9F DD E1         [14]  509 	pop	ix
   6AA1 C9            [10]  510 	ret
                            511 ;src/balls.c:156: void update_ball(Ball *ball)
                            512 ;	---------------------------------
                            513 ; Function update_ball
                            514 ; ---------------------------------
   6AA2                     515 _update_ball::
   6AA2 DD E5         [15]  516 	push	ix
   6AA4 DD 21 00 00   [14]  517 	ld	ix,#0
   6AA8 DD 39         [15]  518 	add	ix,sp
   6AAA 21 F5 FF      [10]  519 	ld	hl, #-11
   6AAD 39            [11]  520 	add	hl, sp
   6AAE F9            [ 6]  521 	ld	sp, hl
                            522 ;src/balls.c:158: ball->prev_x = ball->x;
   6AAF DD 4E 04      [19]  523 	ld	c,4 (ix)
   6AB2 DD 46 05      [19]  524 	ld	b,5 (ix)
   6AB5 FD 21 05 00   [14]  525 	ld	iy, #0x0005
   6AB9 FD 09         [15]  526 	add	iy, bc
   6ABB 21 01 00      [10]  527 	ld	hl, #0x0001
   6ABE 09            [11]  528 	add	hl,bc
   6ABF DD 75 F9      [19]  529 	ld	-7 (ix), l
   6AC2 DD 74 FA      [19]  530 	ld	-6 (ix), h
   6AC5 5E            [ 7]  531 	ld	e, (hl)
   6AC6 23            [ 6]  532 	inc	hl
   6AC7 56            [ 7]  533 	ld	d, (hl)
   6AC8 FD 73 00      [19]  534 	ld	0 (iy), e
   6ACB FD 72 01      [19]  535 	ld	1 (iy), d
                            536 ;src/balls.c:159: ball->prev_y = ball->y;
   6ACE FD 21 07 00   [14]  537 	ld	iy, #0x0007
   6AD2 FD 09         [15]  538 	add	iy, bc
   6AD4 21 03 00      [10]  539 	ld	hl, #0x0003
   6AD7 09            [11]  540 	add	hl,bc
   6AD8 DD 75 F7      [19]  541 	ld	-9 (ix), l
   6ADB DD 74 F8      [19]  542 	ld	-8 (ix), h
   6ADE 5E            [ 7]  543 	ld	e, (hl)
   6ADF 23            [ 6]  544 	inc	hl
   6AE0 56            [ 7]  545 	ld	d, (hl)
   6AE1 FD 73 00      [19]  546 	ld	0 (iy), e
   6AE4 FD 72 01      [19]  547 	ld	1 (iy), d
                            548 ;src/balls.c:161: if (ball->active)
   6AE7 0A            [ 7]  549 	ld	a, (bc)
   6AE8 B7            [ 4]  550 	or	a, a
   6AE9 CA DC 6B      [10]  551 	jp	Z, 00111$
                            552 ;src/balls.c:164: i16 new_x = ball->x + ball->dx;
   6AEC DD 6E F9      [19]  553 	ld	l,-7 (ix)
   6AEF DD 66 FA      [19]  554 	ld	h,-6 (ix)
   6AF2 5E            [ 7]  555 	ld	e, (hl)
   6AF3 23            [ 6]  556 	inc	hl
   6AF4 56            [ 7]  557 	ld	d, (hl)
   6AF5 21 09 00      [10]  558 	ld	hl, #0x0009
   6AF8 09            [11]  559 	add	hl,bc
   6AF9 DD 75 FE      [19]  560 	ld	-2 (ix), l
   6AFC DD 74 FF      [19]  561 	ld	-1 (ix), h
   6AFF 7E            [ 7]  562 	ld	a, (hl)
   6B00 23            [ 6]  563 	inc	hl
   6B01 66            [ 7]  564 	ld	h, (hl)
   6B02 6F            [ 4]  565 	ld	l, a
   6B03 19            [11]  566 	add	hl, de
   6B04 33            [ 6]  567 	inc	sp
   6B05 33            [ 6]  568 	inc	sp
   6B06 E5            [11]  569 	push	hl
                            570 ;src/balls.c:165: i16 new_y = ball->y + ball->dy;
   6B07 DD 6E F7      [19]  571 	ld	l,-9 (ix)
   6B0A DD 66 F8      [19]  572 	ld	h,-8 (ix)
   6B0D 5E            [ 7]  573 	ld	e, (hl)
   6B0E 23            [ 6]  574 	inc	hl
   6B0F 56            [ 7]  575 	ld	d, (hl)
   6B10 21 0B 00      [10]  576 	ld	hl, #0x000b
   6B13 09            [11]  577 	add	hl,bc
   6B14 DD 75 FC      [19]  578 	ld	-4 (ix), l
   6B17 DD 74 FD      [19]  579 	ld	-3 (ix), h
   6B1A 7E            [ 7]  580 	ld	a, (hl)
   6B1B 23            [ 6]  581 	inc	hl
   6B1C 66            [ 7]  582 	ld	h, (hl)
   6B1D 6F            [ 4]  583 	ld	l, a
   6B1E 19            [11]  584 	add	hl,de
   6B1F EB            [ 4]  585 	ex	de,hl
                            586 ;src/balls.c:167: if (new_y >= YOUR_DEAD_Y)
   6B20 7B            [ 4]  587 	ld	a, e
   6B21 D6 BA         [ 7]  588 	sub	a, #0xba
   6B23 7A            [ 4]  589 	ld	a, d
   6B24 17            [ 4]  590 	rla
   6B25 3F            [ 4]  591 	ccf
   6B26 1F            [ 4]  592 	rra
   6B27 DE 80         [ 7]  593 	sbc	a, #0x80
   6B29 38 0F         [12]  594 	jr	C,00102$
                            595 ;src/balls.c:170: ball->active = 0;
   6B2B AF            [ 4]  596 	xor	a, a
   6B2C 02            [ 7]  597 	ld	(bc), a
                            598 ;src/balls.c:171: ball->dy = 0;
   6B2D DD 6E FC      [19]  599 	ld	l,-4 (ix)
   6B30 DD 66 FD      [19]  600 	ld	h,-3 (ix)
   6B33 AF            [ 4]  601 	xor	a, a
   6B34 77            [ 7]  602 	ld	(hl), a
   6B35 23            [ 6]  603 	inc	hl
   6B36 77            [ 7]  604 	ld	(hl), a
                            605 ;src/balls.c:172: return;
   6B37 C3 DC 6B      [10]  606 	jp	00111$
   6B3A                     607 00102$:
                            608 ;src/balls.c:175: hits |= background_bounce_ball(new_x, new_y);
   6B3A C5            [11]  609 	push	bc
   6B3B D5            [11]  610 	push	de
   6B3C D5            [11]  611 	push	de
   6B3D DD 6E F5      [19]  612 	ld	l,-11 (ix)
   6B40 DD 66 F6      [19]  613 	ld	h,-10 (ix)
   6B43 E5            [11]  614 	push	hl
   6B44 CD FD 66      [17]  615 	call	_background_bounce_ball
   6B47 F1            [10]  616 	pop	af
   6B48 F1            [10]  617 	pop	af
   6B49 D1            [10]  618 	pop	de
   6B4A C1            [10]  619 	pop	bc
   6B4B DD 75 FB      [19]  620 	ld	-5 (ix), l
                            621 ;src/balls.c:176: hits |= bat_bounce_ball(ball, new_x, new_y);
   6B4E D5            [11]  622 	push	de
   6B4F D5            [11]  623 	push	de
   6B50 DD 6E F5      [19]  624 	ld	l,-11 (ix)
   6B53 DD 66 F6      [19]  625 	ld	h,-10 (ix)
   6B56 E5            [11]  626 	push	hl
   6B57 C5            [11]  627 	push	bc
   6B58 CD BB 6C      [17]  628 	call	_bat_bounce_ball
   6B5B F1            [10]  629 	pop	af
   6B5C F1            [10]  630 	pop	af
   6B5D F1            [10]  631 	pop	af
   6B5E D1            [10]  632 	pop	de
   6B5F DD 7E FB      [19]  633 	ld	a, -5 (ix)
   6B62 B5            [ 4]  634 	or	a, l
   6B63 4F            [ 4]  635 	ld	c, a
                            636 ;src/balls.c:177: hits |= blocks_bounce_ball(ball, new_x, new_y);
   6B64 C5            [11]  637 	push	bc
   6B65 D5            [11]  638 	push	de
   6B66 D5            [11]  639 	push	de
   6B67 DD 6E F5      [19]  640 	ld	l,-11 (ix)
   6B6A DD 66 F6      [19]  641 	ld	h,-10 (ix)
   6B6D E5            [11]  642 	push	hl
   6B6E DD 6E 04      [19]  643 	ld	l,4 (ix)
   6B71 DD 66 05      [19]  644 	ld	h,5 (ix)
   6B74 E5            [11]  645 	push	hl
   6B75 CD 7F 6D      [17]  646 	call	_blocks_bounce_ball
   6B78 F1            [10]  647 	pop	af
   6B79 F1            [10]  648 	pop	af
   6B7A F1            [10]  649 	pop	af
   6B7B D1            [10]  650 	pop	de
   6B7C C1            [10]  651 	pop	bc
   6B7D 79            [ 4]  652 	ld	a, c
   6B7E B5            [ 4]  653 	or	a, l
   6B7F DD 77 FB      [19]  654 	ld	-5 (ix), a
                            655 ;src/balls.c:179: if (hits & BOUNCE_X)
   6B82 DD CB FB 46   [20]  656 	bit	0, -5 (ix)
   6B86 28 1B         [12]  657 	jr	Z,00104$
                            658 ;src/balls.c:181: ball->dx = -ball->dx;
   6B88 DD 6E FE      [19]  659 	ld	l,-2 (ix)
   6B8B DD 66 FF      [19]  660 	ld	h,-1 (ix)
   6B8E 4E            [ 7]  661 	ld	c, (hl)
   6B8F 23            [ 6]  662 	inc	hl
   6B90 46            [ 7]  663 	ld	b, (hl)
   6B91 AF            [ 4]  664 	xor	a, a
   6B92 91            [ 4]  665 	sub	a, c
   6B93 4F            [ 4]  666 	ld	c, a
   6B94 3E 00         [ 7]  667 	ld	a, #0x00
   6B96 98            [ 4]  668 	sbc	a, b
   6B97 47            [ 4]  669 	ld	b, a
   6B98 DD 6E FE      [19]  670 	ld	l,-2 (ix)
   6B9B DD 66 FF      [19]  671 	ld	h,-1 (ix)
   6B9E 71            [ 7]  672 	ld	(hl), c
   6B9F 23            [ 6]  673 	inc	hl
   6BA0 70            [ 7]  674 	ld	(hl), b
   6BA1 18 0F         [12]  675 	jr	00105$
   6BA3                     676 00104$:
                            677 ;src/balls.c:185: ball->x = new_x;
   6BA3 DD 6E F9      [19]  678 	ld	l,-7 (ix)
   6BA6 DD 66 FA      [19]  679 	ld	h,-6 (ix)
   6BA9 DD 7E F5      [19]  680 	ld	a, -11 (ix)
   6BAC 77            [ 7]  681 	ld	(hl), a
   6BAD 23            [ 6]  682 	inc	hl
   6BAE DD 7E F6      [19]  683 	ld	a, -10 (ix)
   6BB1 77            [ 7]  684 	ld	(hl), a
   6BB2                     685 00105$:
                            686 ;src/balls.c:188: if (hits & BOUNCE_Y)
   6BB2 DD CB FB 4E   [20]  687 	bit	1, -5 (ix)
   6BB6 28 1B         [12]  688 	jr	Z,00107$
                            689 ;src/balls.c:190: ball->dy = -ball->dy;
   6BB8 DD 6E FC      [19]  690 	ld	l,-4 (ix)
   6BBB DD 66 FD      [19]  691 	ld	h,-3 (ix)
   6BBE 4E            [ 7]  692 	ld	c, (hl)
   6BBF 23            [ 6]  693 	inc	hl
   6BC0 46            [ 7]  694 	ld	b, (hl)
   6BC1 AF            [ 4]  695 	xor	a, a
   6BC2 91            [ 4]  696 	sub	a, c
   6BC3 4F            [ 4]  697 	ld	c, a
   6BC4 3E 00         [ 7]  698 	ld	a, #0x00
   6BC6 98            [ 4]  699 	sbc	a, b
   6BC7 47            [ 4]  700 	ld	b, a
   6BC8 DD 6E FC      [19]  701 	ld	l,-4 (ix)
   6BCB DD 66 FD      [19]  702 	ld	h,-3 (ix)
   6BCE 71            [ 7]  703 	ld	(hl), c
   6BCF 23            [ 6]  704 	inc	hl
   6BD0 70            [ 7]  705 	ld	(hl), b
   6BD1 18 09         [12]  706 	jr	00111$
   6BD3                     707 00107$:
                            708 ;src/balls.c:194: ball->y = new_y;
   6BD3 DD 6E F7      [19]  709 	ld	l,-9 (ix)
   6BD6 DD 66 F8      [19]  710 	ld	h,-8 (ix)
   6BD9 73            [ 7]  711 	ld	(hl), e
   6BDA 23            [ 6]  712 	inc	hl
   6BDB 72            [ 7]  713 	ld	(hl), d
   6BDC                     714 00111$:
   6BDC DD F9         [10]  715 	ld	sp, ix
   6BDE DD E1         [14]  716 	pop	ix
   6BE0 C9            [10]  717 	ret
                            718 	.area _CODE
                            719 	.area _INITIALIZER
                            720 	.area _CABS (ABS)
