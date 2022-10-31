                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module blocks
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _background_debug_box_wc
                             12 	.globl _cpct_etm_drawTileBox2x4
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _block_meta
                             15 	.globl _blocks_initialize
                             16 	.globl _blocks_draw
                             17 	.globl _blocks_restore_background
                             18 	.globl _blocks_bounce_ball
                             19 	.globl _is_ball_colliding_with_block
                             20 	.globl _get_metaData_at
                             21 	.globl _draw_current_blocks
                             22 	.globl _map_blocks_to_meta
                             23 	.globl _plant_tile_meta
                             24 ;--------------------------------------------------------
                             25 ; special function registers
                             26 ;--------------------------------------------------------
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DATA
   7C22                      31 _block_meta::
   7C22                      32 	.ds 1092
                             33 ;--------------------------------------------------------
                             34 ; ram data
                             35 ;--------------------------------------------------------
                             36 	.area _INITIALIZED
                             37 ;--------------------------------------------------------
                             38 ; absolute external ram data
                             39 ;--------------------------------------------------------
                             40 	.area _DABS (ABS)
                             41 ;--------------------------------------------------------
                             42 ; global & static initialisations
                             43 ;--------------------------------------------------------
                             44 	.area _HOME
                             45 	.area _GSINIT
                             46 	.area _GSFINAL
                             47 	.area _GSINIT
                             48 ;--------------------------------------------------------
                             49 ; Home
                             50 ;--------------------------------------------------------
                             51 	.area _HOME
                             52 	.area _HOME
                             53 ;--------------------------------------------------------
                             54 ; code
                             55 ;--------------------------------------------------------
                             56 	.area _CODE
                             57 ;src/blocks.c:38: void blocks_initialize(u8 is_restart)
                             58 ;	---------------------------------
                             59 ; Function blocks_initialize
                             60 ; ---------------------------------
   6D6E                      61 _blocks_initialize::
                             62 ;src/blocks.c:40: if (!is_restart)
   6D6E 21 02 00      [10]   63 	ld	hl, #2+0
   6D71 39            [11]   64 	add	hl, sp
   6D72 7E            [ 7]   65 	ld	a, (hl)
   6D73 B7            [ 4]   66 	or	a, a
   6D74 C2 F0 6F      [10]   67 	jp	NZ,_draw_current_blocks
                             68 ;src/blocks.c:43: map_blocks_to_meta();
   6D77 CD 78 70      [17]   69 	call	_map_blocks_to_meta
                             70 ;src/blocks.c:48: draw_current_blocks();
   6D7A C3 F0 6F      [10]   71 	jp  _draw_current_blocks
                             72 ;src/blocks.c:51: void blocks_draw()
                             73 ;	---------------------------------
                             74 ; Function blocks_draw
                             75 ; ---------------------------------
   6D7D                      76 _blocks_draw::
                             77 ;src/blocks.c:53: }
   6D7D C9            [10]   78 	ret
                             79 ;src/blocks.c:55: void blocks_restore_background()
                             80 ;	---------------------------------
                             81 ; Function blocks_restore_background
                             82 ; ---------------------------------
   6D7E                      83 _blocks_restore_background::
                             84 ;src/blocks.c:57: }
   6D7E C9            [10]   85 	ret
                             86 ;src/blocks.c:59: BounceHits blocks_bounce_ball(Ball *ball, i16 at_x, i16 at_y)
                             87 ;	---------------------------------
                             88 ; Function blocks_bounce_ball
                             89 ; ---------------------------------
   6D7F                      90 _blocks_bounce_ball::
   6D7F DD E5         [15]   91 	push	ix
   6D81 DD 21 00 00   [14]   92 	ld	ix,#0
   6D85 DD 39         [15]   93 	add	ix,sp
   6D87 F5            [11]   94 	push	af
   6D88 3B            [ 6]   95 	dec	sp
                             96 ;src/blocks.c:66: if (W_2_S_Y(at_y) < BRICKS_MAP_PIXEL_TOP_SCR ||
   6D89 DD 7E 08      [19]   97 	ld	a, 8 (ix)
   6D8C C6 08         [ 7]   98 	add	a, #0x08
   6D8E DD 77 FD      [19]   99 	ld	-3 (ix), a
   6D91 DD 7E 09      [19]  100 	ld	a, 9 (ix)
   6D94 CE 00         [ 7]  101 	adc	a, #0x00
   6D96 DD 77 FE      [19]  102 	ld	-2 (ix), a
   6D99 DD 7E FD      [19]  103 	ld	a, -3 (ix)
   6D9C D6 18         [ 7]  104 	sub	a, #0x18
   6D9E DD 7E FE      [19]  105 	ld	a, -2 (ix)
   6DA1 17            [ 4]  106 	rla
   6DA2 3F            [ 4]  107 	ccf
   6DA3 1F            [ 4]  108 	rra
   6DA4 DE 80         [ 7]  109 	sbc	a, #0x80
   6DA6 38 12         [12]  110 	jr	C,00101$
                            111 ;src/blocks.c:67: W_2_S_Y(at_y) > BRICKS_MAP_PIXEL_BOTTOM_SCR)
   6DA8 3E 88         [ 7]  112 	ld	a, #0x88
   6DAA DD BE FD      [19]  113 	cp	a, -3 (ix)
   6DAD 3E 00         [ 7]  114 	ld	a, #0x00
   6DAF DD 9E FE      [19]  115 	sbc	a, -2 (ix)
   6DB2 E2 B7 6D      [10]  116 	jp	PO, 00124$
   6DB5 EE 80         [ 7]  117 	xor	a, #0x80
   6DB7                     118 00124$:
   6DB7 F2 BF 6D      [10]  119 	jp	P, 00102$
   6DBA                     120 00101$:
                            121 ;src/blocks.c:69: return BOUNCE_NONE;
   6DBA 2E 00         [ 7]  122 	ld	l, #0x00
   6DBC C3 0D 6F      [10]  123 	jp	00110$
   6DBF                     124 00102$:
                            125 ;src/blocks.c:72: if (ball->dy < 0)
   6DBF DD 7E 04      [19]  126 	ld	a, 4 (ix)
   6DC2 DD 77 FD      [19]  127 	ld	-3 (ix), a
   6DC5 DD 7E 05      [19]  128 	ld	a, 5 (ix)
   6DC8 DD 77 FE      [19]  129 	ld	-2 (ix), a
   6DCB E1            [10]  130 	pop	hl
   6DCC E5            [11]  131 	push	hl
   6DCD 11 0B 00      [10]  132 	ld	de, #0x000b
   6DD0 19            [11]  133 	add	hl, de
   6DD1 7E            [ 7]  134 	ld	a, (hl)
   6DD2 23            [ 6]  135 	inc	hl
   6DD3 66            [ 7]  136 	ld	h, (hl)
                            137 ;src/blocks.c:76: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y, BOUNCE_Y);
   6DD4 DD 4E 06      [19]  138 	ld	c,6 (ix)
   6DD7 DD 46 07      [19]  139 	ld	b,7 (ix)
   6DDA 03            [ 6]  140 	inc	bc
   6DDB 03            [ 6]  141 	inc	bc
   6DDC 03            [ 6]  142 	inc	bc
                            143 ;src/blocks.c:81: bounces |= is_ball_colliding_with_block(ball, at_x, at_y + 6, BOUNCE_Y);
   6DDD DD 7E 08      [19]  144 	ld	a, 8 (ix)
   6DE0 C6 06         [ 7]  145 	add	a, #0x06
   6DE2 5F            [ 4]  146 	ld	e, a
   6DE3 DD 7E 09      [19]  147 	ld	a, 9 (ix)
   6DE6 CE 00         [ 7]  148 	adc	a, #0x00
   6DE8 57            [ 4]  149 	ld	d, a
                            150 ;src/blocks.c:72: if (ball->dy < 0)
   6DE9 CB 7C         [ 8]  151 	bit	7, h
   6DEB 28 4E         [12]  152 	jr	Z,00105$
                            153 ;src/blocks.c:75: bounces |= is_ball_colliding_with_block(ball, at_x, at_y, BOUNCE_Y);
   6DED C5            [11]  154 	push	bc
   6DEE D5            [11]  155 	push	de
   6DEF 3E 02         [ 7]  156 	ld	a, #0x02
   6DF1 F5            [11]  157 	push	af
   6DF2 33            [ 6]  158 	inc	sp
   6DF3 DD 6E 08      [19]  159 	ld	l,8 (ix)
   6DF6 DD 66 09      [19]  160 	ld	h,9 (ix)
   6DF9 E5            [11]  161 	push	hl
   6DFA DD 6E 06      [19]  162 	ld	l,6 (ix)
   6DFD DD 66 07      [19]  163 	ld	h,7 (ix)
   6E00 E5            [11]  164 	push	hl
   6E01 DD 6E FD      [19]  165 	ld	l,-3 (ix)
   6E04 DD 66 FE      [19]  166 	ld	h,-2 (ix)
   6E07 E5            [11]  167 	push	hl
   6E08 CD 12 6F      [17]  168 	call	_is_ball_colliding_with_block
   6E0B F1            [10]  169 	pop	af
   6E0C F1            [10]  170 	pop	af
   6E0D F1            [10]  171 	pop	af
   6E0E 33            [ 6]  172 	inc	sp
   6E0F D1            [10]  173 	pop	de
   6E10 C1            [10]  174 	pop	bc
   6E11 DD 75 FF      [19]  175 	ld	-1 (ix), l
                            176 ;src/blocks.c:76: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y, BOUNCE_Y);
   6E14 C5            [11]  177 	push	bc
   6E15 D5            [11]  178 	push	de
   6E16 3E 02         [ 7]  179 	ld	a, #0x02
   6E18 F5            [11]  180 	push	af
   6E19 33            [ 6]  181 	inc	sp
   6E1A DD 6E 08      [19]  182 	ld	l,8 (ix)
   6E1D DD 66 09      [19]  183 	ld	h,9 (ix)
   6E20 E5            [11]  184 	push	hl
   6E21 C5            [11]  185 	push	bc
   6E22 DD 6E 04      [19]  186 	ld	l,4 (ix)
   6E25 DD 66 05      [19]  187 	ld	h,5 (ix)
   6E28 E5            [11]  188 	push	hl
   6E29 CD 12 6F      [17]  189 	call	_is_ball_colliding_with_block
   6E2C F1            [10]  190 	pop	af
   6E2D F1            [10]  191 	pop	af
   6E2E F1            [10]  192 	pop	af
   6E2F 33            [ 6]  193 	inc	sp
   6E30 D1            [10]  194 	pop	de
   6E31 C1            [10]  195 	pop	bc
   6E32 DD 7E FF      [19]  196 	ld	a, -1 (ix)
   6E35 B5            [ 4]  197 	or	a, l
   6E36 DD 77 FF      [19]  198 	ld	-1 (ix), a
   6E39 18 3D         [12]  199 	jr	00106$
   6E3B                     200 00105$:
                            201 ;src/blocks.c:81: bounces |= is_ball_colliding_with_block(ball, at_x, at_y + 6, BOUNCE_Y);
   6E3B C5            [11]  202 	push	bc
   6E3C D5            [11]  203 	push	de
   6E3D 3E 02         [ 7]  204 	ld	a, #0x02
   6E3F F5            [11]  205 	push	af
   6E40 33            [ 6]  206 	inc	sp
   6E41 D5            [11]  207 	push	de
   6E42 DD 6E 06      [19]  208 	ld	l,6 (ix)
   6E45 DD 66 07      [19]  209 	ld	h,7 (ix)
   6E48 E5            [11]  210 	push	hl
   6E49 DD 6E FD      [19]  211 	ld	l,-3 (ix)
   6E4C DD 66 FE      [19]  212 	ld	h,-2 (ix)
   6E4F E5            [11]  213 	push	hl
   6E50 CD 12 6F      [17]  214 	call	_is_ball_colliding_with_block
   6E53 F1            [10]  215 	pop	af
   6E54 F1            [10]  216 	pop	af
   6E55 F1            [10]  217 	pop	af
   6E56 33            [ 6]  218 	inc	sp
   6E57 D1            [10]  219 	pop	de
   6E58 C1            [10]  220 	pop	bc
                            221 ;src/blocks.c:82: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y + 6, BOUNCE_Y);
   6E59 E5            [11]  222 	push	hl
   6E5A C5            [11]  223 	push	bc
   6E5B D5            [11]  224 	push	de
   6E5C 3E 02         [ 7]  225 	ld	a, #0x02
   6E5E F5            [11]  226 	push	af
   6E5F 33            [ 6]  227 	inc	sp
   6E60 D5            [11]  228 	push	de
   6E61 C5            [11]  229 	push	bc
   6E62 DD 6E 04      [19]  230 	ld	l,4 (ix)
   6E65 DD 66 05      [19]  231 	ld	h,5 (ix)
   6E68 E5            [11]  232 	push	hl
   6E69 CD 12 6F      [17]  233 	call	_is_ball_colliding_with_block
   6E6C F1            [10]  234 	pop	af
   6E6D F1            [10]  235 	pop	af
   6E6E F1            [10]  236 	pop	af
   6E6F 33            [ 6]  237 	inc	sp
   6E70 7D            [ 4]  238 	ld	a, l
   6E71 D1            [10]  239 	pop	de
   6E72 C1            [10]  240 	pop	bc
   6E73 E1            [10]  241 	pop	hl
   6E74 B5            [ 4]  242 	or	a, l
   6E75 DD 77 FF      [19]  243 	ld	-1 (ix), a
   6E78                     244 00106$:
                            245 ;src/blocks.c:85: if (ball->dx < 0)
   6E78 E1            [10]  246 	pop	hl
   6E79 E5            [11]  247 	push	hl
   6E7A C5            [11]  248 	push	bc
   6E7B 01 09 00      [10]  249 	ld	bc, #0x0009
   6E7E 09            [11]  250 	add	hl, bc
   6E7F C1            [10]  251 	pop	bc
   6E80 7E            [ 7]  252 	ld	a, (hl)
   6E81 23            [ 6]  253 	inc	hl
   6E82 CB 7E         [12]  254 	bit	7, (hl)
   6E84 28 49         [12]  255 	jr	Z,00108$
                            256 ;src/blocks.c:88: bounces |= is_ball_colliding_with_block(ball, at_x, at_y, BOUNCE_X);
   6E86 D5            [11]  257 	push	de
   6E87 3E 01         [ 7]  258 	ld	a, #0x01
   6E89 F5            [11]  259 	push	af
   6E8A 33            [ 6]  260 	inc	sp
   6E8B DD 6E 08      [19]  261 	ld	l,8 (ix)
   6E8E DD 66 09      [19]  262 	ld	h,9 (ix)
   6E91 E5            [11]  263 	push	hl
   6E92 DD 6E 06      [19]  264 	ld	l,6 (ix)
   6E95 DD 66 07      [19]  265 	ld	h,7 (ix)
   6E98 E5            [11]  266 	push	hl
   6E99 DD 6E 04      [19]  267 	ld	l,4 (ix)
   6E9C DD 66 05      [19]  268 	ld	h,5 (ix)
   6E9F E5            [11]  269 	push	hl
   6EA0 CD 12 6F      [17]  270 	call	_is_ball_colliding_with_block
   6EA3 F1            [10]  271 	pop	af
   6EA4 F1            [10]  272 	pop	af
   6EA5 F1            [10]  273 	pop	af
   6EA6 33            [ 6]  274 	inc	sp
   6EA7 D1            [10]  275 	pop	de
   6EA8 DD 7E FF      [19]  276 	ld	a, -1 (ix)
   6EAB B5            [ 4]  277 	or	a, l
   6EAC DD 77 FD      [19]  278 	ld	-3 (ix), a
                            279 ;src/blocks.c:89: bounces |= is_ball_colliding_with_block(ball, at_x, at_y + 6, BOUNCE_X);
   6EAF 3E 01         [ 7]  280 	ld	a, #0x01
   6EB1 F5            [11]  281 	push	af
   6EB2 33            [ 6]  282 	inc	sp
   6EB3 D5            [11]  283 	push	de
   6EB4 DD 6E 06      [19]  284 	ld	l,6 (ix)
   6EB7 DD 66 07      [19]  285 	ld	h,7 (ix)
   6EBA E5            [11]  286 	push	hl
   6EBB DD 6E 04      [19]  287 	ld	l,4 (ix)
   6EBE DD 66 05      [19]  288 	ld	h,5 (ix)
   6EC1 E5            [11]  289 	push	hl
   6EC2 CD 12 6F      [17]  290 	call	_is_ball_colliding_with_block
   6EC5 F1            [10]  291 	pop	af
   6EC6 F1            [10]  292 	pop	af
   6EC7 F1            [10]  293 	pop	af
   6EC8 33            [ 6]  294 	inc	sp
   6EC9 DD 7E FD      [19]  295 	ld	a, -3 (ix)
   6ECC B5            [ 4]  296 	or	a, l
   6ECD 18 3D         [12]  297 	jr	00109$
   6ECF                     298 00108$:
                            299 ;src/blocks.c:94: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y, BOUNCE_X);
   6ECF C5            [11]  300 	push	bc
   6ED0 D5            [11]  301 	push	de
   6ED1 3E 01         [ 7]  302 	ld	a, #0x01
   6ED3 F5            [11]  303 	push	af
   6ED4 33            [ 6]  304 	inc	sp
   6ED5 DD 6E 08      [19]  305 	ld	l,8 (ix)
   6ED8 DD 66 09      [19]  306 	ld	h,9 (ix)
   6EDB E5            [11]  307 	push	hl
   6EDC C5            [11]  308 	push	bc
   6EDD DD 6E 04      [19]  309 	ld	l,4 (ix)
   6EE0 DD 66 05      [19]  310 	ld	h,5 (ix)
   6EE3 E5            [11]  311 	push	hl
   6EE4 CD 12 6F      [17]  312 	call	_is_ball_colliding_with_block
   6EE7 F1            [10]  313 	pop	af
   6EE8 F1            [10]  314 	pop	af
   6EE9 F1            [10]  315 	pop	af
   6EEA 33            [ 6]  316 	inc	sp
   6EEB D1            [10]  317 	pop	de
   6EEC C1            [10]  318 	pop	bc
   6EED DD 7E FF      [19]  319 	ld	a, -1 (ix)
   6EF0 B5            [ 4]  320 	or	a, l
   6EF1 DD 77 FD      [19]  321 	ld	-3 (ix), a
                            322 ;src/blocks.c:95: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y + 6, BOUNCE_X);
   6EF4 3E 01         [ 7]  323 	ld	a, #0x01
   6EF6 F5            [11]  324 	push	af
   6EF7 33            [ 6]  325 	inc	sp
   6EF8 D5            [11]  326 	push	de
   6EF9 C5            [11]  327 	push	bc
   6EFA DD 6E 04      [19]  328 	ld	l,4 (ix)
   6EFD DD 66 05      [19]  329 	ld	h,5 (ix)
   6F00 E5            [11]  330 	push	hl
   6F01 CD 12 6F      [17]  331 	call	_is_ball_colliding_with_block
   6F04 F1            [10]  332 	pop	af
   6F05 F1            [10]  333 	pop	af
   6F06 F1            [10]  334 	pop	af
   6F07 33            [ 6]  335 	inc	sp
   6F08 DD 7E FD      [19]  336 	ld	a, -3 (ix)
   6F0B B5            [ 4]  337 	or	a, l
   6F0C                     338 00109$:
                            339 ;src/blocks.c:98: return bounces;
   6F0C 6F            [ 4]  340 	ld	l, a
   6F0D                     341 00110$:
   6F0D DD F9         [10]  342 	ld	sp, ix
   6F0F DD E1         [14]  343 	pop	ix
   6F11 C9            [10]  344 	ret
                            345 ;src/blocks.c:105: BounceHits is_ball_colliding_with_block(Ball *ball, i16 wx, i16 wy, BounceHits bounceType)
                            346 ;	---------------------------------
                            347 ; Function is_ball_colliding_with_block
                            348 ; ---------------------------------
   6F12                     349 _is_ball_colliding_with_block::
   6F12 DD E5         [15]  350 	push	ix
   6F14 DD 21 00 00   [14]  351 	ld	ix,#0
   6F18 DD 39         [15]  352 	add	ix,sp
                            353 ;src/blocks.c:107: BounceHits bounces = BOUNCE_NONE;
   6F1A 2E 00         [ 7]  354 	ld	l, #0x00
                            355 ;src/blocks.c:110: meta = get_metaData_at(wx, wy);
   6F1C E5            [11]  356 	push	hl
   6F1D DD 4E 08      [19]  357 	ld	c,8 (ix)
   6F20 DD 46 09      [19]  358 	ld	b,9 (ix)
   6F23 C5            [11]  359 	push	bc
   6F24 DD 4E 06      [19]  360 	ld	c,6 (ix)
   6F27 DD 46 07      [19]  361 	ld	b,7 (ix)
   6F2A C5            [11]  362 	push	bc
   6F2B CD 68 6F      [17]  363 	call	_get_metaData_at
   6F2E F1            [10]  364 	pop	af
   6F2F F1            [10]  365 	pop	af
   6F30 4D            [ 4]  366 	ld	c, l
   6F31 44            [ 4]  367 	ld	b, h
   6F32 E1            [10]  368 	pop	hl
                            369 ;src/blocks.c:111: if (meta)
   6F33 78            [ 4]  370 	ld	a, b
   6F34 B1            [ 4]  371 	or	a,c
   6F35 28 2E         [12]  372 	jr	Z,00102$
                            373 ;src/blocks.c:113: meta->is_active = 0;
   6F37 AF            [ 4]  374 	xor	a, a
   6F38 02            [ 7]  375 	ld	(bc), a
                            376 ;src/blocks.c:116: (meta->block_tile_y * TILE_H) + 24, 
   6F39 69            [ 4]  377 	ld	l, c
   6F3A 60            [ 4]  378 	ld	h, b
   6F3B 11 05 00      [10]  379 	ld	de, #0x0005
   6F3E 19            [11]  380 	add	hl, de
   6F3F 6E            [ 7]  381 	ld	l, (hl)
   6F40 26 00         [ 7]  382 	ld	h, #0x00
   6F42 29            [11]  383 	add	hl, hl
   6F43 29            [11]  384 	add	hl, hl
   6F44 EB            [ 4]  385 	ex	de,hl
   6F45 21 18 00      [10]  386 	ld	hl, #0x0018
   6F48 19            [11]  387 	add	hl,de
   6F49 EB            [ 4]  388 	ex	de,hl
                            389 ;src/blocks.c:115: background_debug_box_wc((meta->block_tile_x) * TILE_W,
   6F4A 69            [ 4]  390 	ld	l, c
   6F4B 60            [ 4]  391 	ld	h, b
   6F4C 01 04 00      [10]  392 	ld	bc, #0x0004
   6F4F 09            [11]  393 	add	hl, bc
   6F50 6E            [ 7]  394 	ld	l, (hl)
   6F51 26 00         [ 7]  395 	ld	h, #0x00
   6F53 29            [11]  396 	add	hl, hl
   6F54 01 03 06      [10]  397 	ld	bc, #0x0603
   6F57 C5            [11]  398 	push	bc
   6F58 D5            [11]  399 	push	de
   6F59 E5            [11]  400 	push	hl
   6F5A CD C7 67      [17]  401 	call	_background_debug_box_wc
   6F5D 21 06 00      [10]  402 	ld	hl, #6
   6F60 39            [11]  403 	add	hl, sp
   6F61 F9            [ 6]  404 	ld	sp, hl
                            405 ;src/blocks.c:122: bounces = bounceType;
   6F62 DD 6E 0A      [19]  406 	ld	l, 10 (ix)
   6F65                     407 00102$:
                            408 ;src/blocks.c:125: return bounces;
   6F65 DD E1         [14]  409 	pop	ix
   6F67 C9            [10]  410 	ret
                            411 ;src/blocks.c:128: BlockMeta *get_metaData_at(i16 wx, i16 wy)
                            412 ;	---------------------------------
                            413 ; Function get_metaData_at
                            414 ; ---------------------------------
   6F68                     415 _get_metaData_at::
   6F68 DD E5         [15]  416 	push	ix
   6F6A DD 21 00 00   [14]  417 	ld	ix,#0
   6F6E DD 39         [15]  418 	add	ix,sp
                            419 ;src/blocks.c:136: tx = (wx / 2);
   6F70 DD 5E 04      [19]  420 	ld	e,4 (ix)
   6F73 DD 56 05      [19]  421 	ld	d,5 (ix)
   6F76 CB 7A         [ 8]  422 	bit	7, d
   6F78 28 01         [12]  423 	jr	Z,00108$
   6F7A 13            [ 6]  424 	inc	de
   6F7B                     425 00108$:
   6F7B CB 2A         [ 8]  426 	sra	d
   6F7D CB 1B         [ 8]  427 	rr	e
                            428 ;src/blocks.c:140: ty = ((wy) / 4) - 4;
   6F7F DD 4E 06      [19]  429 	ld	c,6 (ix)
   6F82 DD 46 07      [19]  430 	ld	b,7 (ix)
   6F85 CB 78         [ 8]  431 	bit	7, b
   6F87 28 03         [12]  432 	jr	Z,00109$
   6F89 03            [ 6]  433 	inc	bc
   6F8A 03            [ 6]  434 	inc	bc
   6F8B 03            [ 6]  435 	inc	bc
   6F8C                     436 00109$:
   6F8C CB 28         [ 8]  437 	sra	b
   6F8E CB 19         [ 8]  438 	rr	c
   6F90 CB 28         [ 8]  439 	sra	b
   6F92 CB 19         [ 8]  440 	rr	c
   6F94 79            [ 4]  441 	ld	a, c
   6F95 C6 FC         [ 7]  442 	add	a, #0xfc
   6F97 6F            [ 4]  443 	ld	l, a
   6F98 78            [ 4]  444 	ld	a, b
   6F99 CE FF         [ 7]  445 	adc	a, #0xff
   6F9B 67            [ 4]  446 	ld	h, a
                            447 ;src/blocks.c:144: mx = tx / 2;
   6F9C 4B            [ 4]  448 	ld	c, e
   6F9D 42            [ 4]  449 	ld	b, d
   6F9E CB 7A         [ 8]  450 	bit	7, d
   6FA0 28 03         [12]  451 	jr	Z,00110$
   6FA2 4B            [ 4]  452 	ld	c, e
   6FA3 42            [ 4]  453 	ld	b, d
   6FA4 03            [ 6]  454 	inc	bc
   6FA5                     455 00110$:
   6FA5 CB 28         [ 8]  456 	sra	b
   6FA7 CB 19         [ 8]  457 	rr	c
                            458 ;src/blocks.c:145: my = ty / 2;
   6FA9 5D            [ 4]  459 	ld	e, l
   6FAA 54            [ 4]  460 	ld	d, h
   6FAB CB 7C         [ 8]  461 	bit	7, h
   6FAD 28 02         [12]  462 	jr	Z,00111$
   6FAF EB            [ 4]  463 	ex	de,hl
   6FB0 13            [ 6]  464 	inc	de
   6FB1                     465 00111$:
   6FB1 CB 2A         [ 8]  466 	sra	d
   6FB3 CB 1B         [ 8]  467 	rr	e
                            468 ;src/blocks.c:149: if ((mx >= BLOCKS_MAP_W / 2) || (my >= BLOCKS_MAP_H / 2))
   6FB5 79            [ 4]  469 	ld	a, c
   6FB6 D6 0D         [ 7]  470 	sub	a, #0x0d
   6FB8 78            [ 4]  471 	ld	a, b
   6FB9 17            [ 4]  472 	rla
   6FBA 3F            [ 4]  473 	ccf
   6FBB 1F            [ 4]  474 	rra
   6FBC DE 80         [ 7]  475 	sbc	a, #0x80
   6FBE 30 0B         [12]  476 	jr	NC,00101$
   6FC0 7B            [ 4]  477 	ld	a, e
   6FC1 D6 0E         [ 7]  478 	sub	a, #0x0e
   6FC3 7A            [ 4]  479 	ld	a, d
   6FC4 17            [ 4]  480 	rla
   6FC5 3F            [ 4]  481 	ccf
   6FC6 1F            [ 4]  482 	rra
   6FC7 DE 80         [ 7]  483 	sbc	a, #0x80
   6FC9 38 05         [12]  484 	jr	C,00102$
   6FCB                     485 00101$:
                            486 ;src/blocks.c:151: return BOUNCE_NONE;
   6FCB 21 00 00      [10]  487 	ld	hl, #0x0000
   6FCE 18 1D         [12]  488 	jr	00106$
   6FD0                     489 00102$:
                            490 ;src/blocks.c:154: meta = &block_meta[mx][my];
   6FD0 69            [ 4]  491 	ld	l, c
   6FD1 60            [ 4]  492 	ld	h, b
   6FD2 29            [11]  493 	add	hl, hl
   6FD3 29            [11]  494 	add	hl, hl
   6FD4 09            [11]  495 	add	hl, bc
   6FD5 29            [11]  496 	add	hl, hl
   6FD6 29            [11]  497 	add	hl, hl
   6FD7 09            [11]  498 	add	hl, bc
   6FD8 29            [11]  499 	add	hl, hl
   6FD9 29            [11]  500 	add	hl, hl
   6FDA 01 22 7C      [10]  501 	ld	bc,#_block_meta
   6FDD 09            [11]  502 	add	hl,bc
   6FDE 4D            [ 4]  503 	ld	c, l
   6FDF 44            [ 4]  504 	ld	b, h
   6FE0 6B            [ 4]  505 	ld	l, e
   6FE1 62            [ 4]  506 	ld	h, d
   6FE2 29            [11]  507 	add	hl, hl
   6FE3 19            [11]  508 	add	hl, de
   6FE4 29            [11]  509 	add	hl, hl
   6FE5 09            [11]  510 	add	hl, bc
                            511 ;src/blocks.c:155: if (meta->is_active)
   6FE6 7E            [ 7]  512 	ld	a, (hl)
   6FE7 B7            [ 4]  513 	or	a, a
                            514 ;src/blocks.c:157: return meta;
   6FE8 20 03         [12]  515 	jr	NZ,00106$
                            516 ;src/blocks.c:159: return NULL;
   6FEA 21 00 00      [10]  517 	ld	hl, #0x0000
   6FED                     518 00106$:
   6FED DD E1         [14]  519 	pop	ix
   6FEF C9            [10]  520 	ret
                            521 ;src/blocks.c:162: void draw_current_blocks()
                            522 ;	---------------------------------
                            523 ; Function draw_current_blocks
                            524 ; ---------------------------------
   6FF0                     525 _draw_current_blocks::
   6FF0 DD E5         [15]  526 	push	ix
   6FF2 DD 21 00 00   [14]  527 	ld	ix,#0
   6FF6 DD 39         [15]  528 	add	ix,sp
   6FF8 F5            [11]  529 	push	af
   6FF9 3B            [ 6]  530 	dec	sp
                            531 ;src/blocks.c:164: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(0),
   6FFA 21 0C 18      [10]  532 	ld	hl, #0x180c
   6FFD E5            [11]  533 	push	hl
   6FFE 21 00 C0      [10]  534 	ld	hl, #0xc000
   7001 E5            [11]  535 	push	hl
   7002 CD 48 7B      [17]  536 	call	_cpct_getScreenPtr
   7005 EB            [ 4]  537 	ex	de,hl
                            538 ;src/blocks.c:166: for (u8 y = 0; y < BLOCKS_MAP_H / 2; y++)
   7006 0E 00         [ 7]  539 	ld	c, #0x00
   7008                     540 00109$:
                            541 ;src/blocks.c:168: for (u8 x = 0; x < BLOCKS_MAP_W / 2; x++)
   7008 79            [ 4]  542 	ld	a,c
   7009 FE 0E         [ 7]  543 	cp	a,#0x0e
   700B 30 66         [12]  544 	jr	NC,00111$
   700D 87            [ 4]  545 	add	a, a
   700E DD 77 FE      [19]  546 	ld	-2 (ix), a
   7011 79            [ 4]  547 	ld	a, c
   7012 87            [ 4]  548 	add	a, a
   7013 81            [ 4]  549 	add	a, c
   7014 87            [ 4]  550 	add	a, a
   7015 DD 77 FD      [19]  551 	ld	-3 (ix), a
   7018 06 00         [ 7]  552 	ld	b, #0x00
   701A                     553 00106$:
   701A 78            [ 4]  554 	ld	a, b
   701B D6 0D         [ 7]  555 	sub	a, #0x0d
   701D 30 51         [12]  556 	jr	NC,00110$
                            557 ;src/blocks.c:170: BlockMeta *meta = &block_meta[x][y];
   701F D5            [11]  558 	push	de
   7020 58            [ 4]  559 	ld	e,b
   7021 16 00         [ 7]  560 	ld	d,#0x00
   7023 6B            [ 4]  561 	ld	l, e
   7024 62            [ 4]  562 	ld	h, d
   7025 29            [11]  563 	add	hl, hl
   7026 29            [11]  564 	add	hl, hl
   7027 19            [11]  565 	add	hl, de
   7028 29            [11]  566 	add	hl, hl
   7029 29            [11]  567 	add	hl, hl
   702A 19            [11]  568 	add	hl, de
   702B 29            [11]  569 	add	hl, hl
   702C 29            [11]  570 	add	hl, hl
   702D D1            [10]  571 	pop	de
   702E 3E 22         [ 7]  572 	ld	a, #<(_block_meta)
   7030 85            [ 4]  573 	add	a, l
   7031 6F            [ 4]  574 	ld	l, a
   7032 3E 7C         [ 7]  575 	ld	a, #>(_block_meta)
   7034 8C            [ 4]  576 	adc	a, h
   7035 67            [ 4]  577 	ld	h, a
   7036 7D            [ 4]  578 	ld	a, l
   7037 DD 86 FD      [19]  579 	add	a, -3 (ix)
   703A 6F            [ 4]  580 	ld	l, a
   703B 7C            [ 4]  581 	ld	a, h
   703C CE 00         [ 7]  582 	adc	a, #0x00
   703E 67            [ 4]  583 	ld	h, a
                            584 ;src/blocks.c:172: if (meta->is_active)
   703F 7E            [ 7]  585 	ld	a, (hl)
   7040 B7            [ 4]  586 	or	a, a
   7041 28 2A         [12]  587 	jr	Z,00107$
                            588 ;src/blocks.c:175: current_level->blocks_tilemap);
   7043 2A 71 80      [16]  589 	ld	hl, (_current_level)
   7046 23            [ 6]  590 	inc	hl
   7047 23            [ 6]  591 	inc	hl
   7048 7E            [ 7]  592 	ld	a, (hl)
   7049 23            [ 6]  593 	inc	hl
   704A 66            [ 7]  594 	ld	h, (hl)
   704B 6F            [ 4]  595 	ld	l, a
                            596 ;src/blocks.c:174: cpct_etm_drawTileBox2x4(x * 2, y * 2, 2, 2, BLOCKS_MAP_W, pvmem,
   704C D5            [11]  597 	push	de
   704D FD E1         [14]  598 	pop	iy
   704F 78            [ 4]  599 	ld	a, b
   7050 87            [ 4]  600 	add	a, a
   7051 DD 77 FF      [19]  601 	ld	-1 (ix), a
   7054 C5            [11]  602 	push	bc
   7055 D5            [11]  603 	push	de
   7056 E5            [11]  604 	push	hl
   7057 FD E5         [15]  605 	push	iy
   7059 21 02 1A      [10]  606 	ld	hl, #0x1a02
   705C E5            [11]  607 	push	hl
   705D 3E 02         [ 7]  608 	ld	a, #0x02
   705F F5            [11]  609 	push	af
   7060 33            [ 6]  610 	inc	sp
   7061 DD 66 FE      [19]  611 	ld	h, -2 (ix)
   7064 DD 6E FF      [19]  612 	ld	l, -1 (ix)
   7067 E5            [11]  613 	push	hl
   7068 CD 9C 78      [17]  614 	call	_cpct_etm_drawTileBox2x4
   706B D1            [10]  615 	pop	de
   706C C1            [10]  616 	pop	bc
   706D                     617 00107$:
                            618 ;src/blocks.c:168: for (u8 x = 0; x < BLOCKS_MAP_W / 2; x++)
   706D 04            [ 4]  619 	inc	b
   706E 18 AA         [12]  620 	jr	00106$
   7070                     621 00110$:
                            622 ;src/blocks.c:166: for (u8 y = 0; y < BLOCKS_MAP_H / 2; y++)
   7070 0C            [ 4]  623 	inc	c
   7071 18 95         [12]  624 	jr	00109$
   7073                     625 00111$:
   7073 DD F9         [10]  626 	ld	sp, ix
   7075 DD E1         [14]  627 	pop	ix
   7077 C9            [10]  628 	ret
                            629 ;src/blocks.c:184: void map_blocks_to_meta()
                            630 ;	---------------------------------
                            631 ; Function map_blocks_to_meta
                            632 ; ---------------------------------
   7078                     633 _map_blocks_to_meta::
   7078 DD E5         [15]  634 	push	ix
   707A DD 21 00 00   [14]  635 	ld	ix,#0
   707E DD 39         [15]  636 	add	ix,sp
   7080 F5            [11]  637 	push	af
   7081 F5            [11]  638 	push	af
   7082 3B            [ 6]  639 	dec	sp
                            640 ;src/blocks.c:188: for (u8 y = 0; y < BLOCKS_MAP_H; y += 2)
   7083 DD 36 FC 00   [19]  641 	ld	-4 (ix), #0x00
   7087                     642 00119$:
   7087 DD 7E FC      [19]  643 	ld	a, -4 (ix)
   708A D6 1C         [ 7]  644 	sub	a, #0x1c
   708C D2 3E 72      [10]  645 	jp	NC, 00121$
                            646 ;src/blocks.c:190: for (u8 x = 0; x < BLOCKS_MAP_W; x += 2)
   708F DD 4E FC      [19]  647 	ld	c,-4 (ix)
   7092 06 00         [ 7]  648 	ld	b,#0x00
   7094 69            [ 4]  649 	ld	l, c
   7095 60            [ 4]  650 	ld	h, b
   7096 29            [11]  651 	add	hl, hl
   7097 09            [11]  652 	add	hl, bc
   7098 29            [11]  653 	add	hl, hl
   7099 29            [11]  654 	add	hl, hl
   709A 09            [11]  655 	add	hl, bc
   709B 29            [11]  656 	add	hl, hl
   709C DD 75 FD      [19]  657 	ld	-3 (ix), l
   709F DD 74 FE      [19]  658 	ld	-2 (ix), h
   70A2 DD 4E FC      [19]  659 	ld	c, -4 (ix)
   70A5 CB 39         [ 8]  660 	srl	c
   70A7 79            [ 4]  661 	ld	a, c
   70A8 87            [ 4]  662 	add	a, a
   70A9 81            [ 4]  663 	add	a, c
   70AA 87            [ 4]  664 	add	a, a
   70AB DD 77 FF      [19]  665 	ld	-1 (ix), a
   70AE DD 36 FB 00   [19]  666 	ld	-5 (ix), #0x00
   70B2                     667 00116$:
   70B2 DD 7E FB      [19]  668 	ld	a, -5 (ix)
   70B5 D6 1A         [ 7]  669 	sub	a, #0x1a
   70B7 D2 35 72      [10]  670 	jp	NC, 00120$
                            671 ;src/blocks.c:192: u8 tile = current_level->blocks_tilemap[(y * BLOCKS_MAP_W) + x];
   70BA 2A 71 80      [16]  672 	ld	hl, (_current_level)
   70BD 23            [ 6]  673 	inc	hl
   70BE 23            [ 6]  674 	inc	hl
   70BF 4E            [ 7]  675 	ld	c, (hl)
   70C0 23            [ 6]  676 	inc	hl
   70C1 46            [ 7]  677 	ld	b, (hl)
   70C2 DD 5E FB      [19]  678 	ld	e, -5 (ix)
   70C5 16 00         [ 7]  679 	ld	d, #0x00
   70C7 DD 6E FD      [19]  680 	ld	l,-3 (ix)
   70CA DD 66 FE      [19]  681 	ld	h,-2 (ix)
   70CD 19            [11]  682 	add	hl, de
   70CE 09            [11]  683 	add	hl, bc
   70CF 7E            [ 7]  684 	ld	a, (hl)
                            685 ;src/blocks.c:193: switch (tile)
   70D0 B7            [ 4]  686 	or	a, a
   70D1 28 2C         [12]  687 	jr	Z,00101$
   70D3 FE 02         [ 7]  688 	cp	a, #0x02
   70D5 28 3F         [12]  689 	jr	Z,00102$
   70D7 FE 04         [ 7]  690 	cp	a, #0x04
   70D9 28 53         [12]  691 	jr	Z,00103$
   70DB FE 06         [ 7]  692 	cp	a, #0x06
   70DD 28 67         [12]  693 	jr	Z,00104$
   70DF FE 08         [ 7]  694 	cp	a, #0x08
   70E1 28 7B         [12]  695 	jr	Z,00105$
   70E3 FE 0A         [ 7]  696 	cp	a, #0x0a
   70E5 CA 76 71      [10]  697 	jp	Z,00106$
   70E8 FE 0C         [ 7]  698 	cp	a, #0x0c
   70EA CA 8E 71      [10]  699 	jp	Z,00107$
   70ED FE 0E         [ 7]  700 	cp	a, #0x0e
   70EF CA A6 71      [10]  701 	jp	Z,00108$
   70F2 FE 10         [ 7]  702 	cp	a, #0x10
   70F4 CA BD 71      [10]  703 	jp	Z,00109$
   70F7 D6 12         [ 7]  704 	sub	a, #0x12
   70F9 CA E0 71      [10]  705 	jp	Z,00110$
   70FC C3 F7 71      [10]  706 	jp	00111$
                            707 ;src/blocks.c:195: case WHITE_BLOCK:
   70FF                     708 00101$:
                            709 ;src/blocks.c:196: plant_tile_meta(x, y, WHITE_BLOCK, WHITE_SCORE, SINGLE_HIT_TO_REMOVE);
   70FF 21 32 01      [10]  710 	ld	hl, #0x0132
   7102 E5            [11]  711 	push	hl
   7103 AF            [ 4]  712 	xor	a, a
   7104 F5            [11]  713 	push	af
   7105 33            [ 6]  714 	inc	sp
   7106 DD 66 FC      [19]  715 	ld	h, -4 (ix)
   7109 DD 6E FB      [19]  716 	ld	l, -5 (ix)
   710C E5            [11]  717 	push	hl
   710D CD 43 72      [17]  718 	call	_plant_tile_meta
   7110 F1            [10]  719 	pop	af
   7111 F1            [10]  720 	pop	af
   7112 33            [ 6]  721 	inc	sp
                            722 ;src/blocks.c:197: break;
   7113 C3 2C 72      [10]  723 	jp	00117$
                            724 ;src/blocks.c:198: case ORANGE_BLOCK:
   7116                     725 00102$:
                            726 ;src/blocks.c:199: plant_tile_meta(x, y, ORANGE_BLOCK, ORANGE_SCORE, SINGLE_HIT_TO_REMOVE);
   7116 21 3C 01      [10]  727 	ld	hl, #0x013c
   7119 E5            [11]  728 	push	hl
   711A 3E 02         [ 7]  729 	ld	a, #0x02
   711C F5            [11]  730 	push	af
   711D 33            [ 6]  731 	inc	sp
   711E DD 66 FC      [19]  732 	ld	h, -4 (ix)
   7121 DD 6E FB      [19]  733 	ld	l, -5 (ix)
   7124 E5            [11]  734 	push	hl
   7125 CD 43 72      [17]  735 	call	_plant_tile_meta
   7128 F1            [10]  736 	pop	af
   7129 F1            [10]  737 	pop	af
   712A 33            [ 6]  738 	inc	sp
                            739 ;src/blocks.c:200: break;
   712B C3 2C 72      [10]  740 	jp	00117$
                            741 ;src/blocks.c:201: case CYAN_BLOCK:
   712E                     742 00103$:
                            743 ;src/blocks.c:202: plant_tile_meta(x, y, CYAN_BLOCK, CYAN_SCORE, SINGLE_HIT_TO_REMOVE);
   712E 21 46 01      [10]  744 	ld	hl, #0x0146
   7131 E5            [11]  745 	push	hl
   7132 3E 04         [ 7]  746 	ld	a, #0x04
   7134 F5            [11]  747 	push	af
   7135 33            [ 6]  748 	inc	sp
   7136 DD 66 FC      [19]  749 	ld	h, -4 (ix)
   7139 DD 6E FB      [19]  750 	ld	l, -5 (ix)
   713C E5            [11]  751 	push	hl
   713D CD 43 72      [17]  752 	call	_plant_tile_meta
   7140 F1            [10]  753 	pop	af
   7141 F1            [10]  754 	pop	af
   7142 33            [ 6]  755 	inc	sp
                            756 ;src/blocks.c:203: break;
   7143 C3 2C 72      [10]  757 	jp	00117$
                            758 ;src/blocks.c:204: case GREEN_BLOCK:
   7146                     759 00104$:
                            760 ;src/blocks.c:205: plant_tile_meta(x, y, GREEN_BLOCK, GREEN_SCORE, SINGLE_HIT_TO_REMOVE);
   7146 21 50 01      [10]  761 	ld	hl, #0x0150
   7149 E5            [11]  762 	push	hl
   714A 3E 06         [ 7]  763 	ld	a, #0x06
   714C F5            [11]  764 	push	af
   714D 33            [ 6]  765 	inc	sp
   714E DD 66 FC      [19]  766 	ld	h, -4 (ix)
   7151 DD 6E FB      [19]  767 	ld	l, -5 (ix)
   7154 E5            [11]  768 	push	hl
   7155 CD 43 72      [17]  769 	call	_plant_tile_meta
   7158 F1            [10]  770 	pop	af
   7159 F1            [10]  771 	pop	af
   715A 33            [ 6]  772 	inc	sp
                            773 ;src/blocks.c:206: break;
   715B C3 2C 72      [10]  774 	jp	00117$
                            775 ;src/blocks.c:207: case RED_BLOCK:
   715E                     776 00105$:
                            777 ;src/blocks.c:208: plant_tile_meta(x, y, RED_BLOCK, RED_SCORE, SINGLE_HIT_TO_REMOVE);
   715E 21 5A 01      [10]  778 	ld	hl, #0x015a
   7161 E5            [11]  779 	push	hl
   7162 3E 08         [ 7]  780 	ld	a, #0x08
   7164 F5            [11]  781 	push	af
   7165 33            [ 6]  782 	inc	sp
   7166 DD 66 FC      [19]  783 	ld	h, -4 (ix)
   7169 DD 6E FB      [19]  784 	ld	l, -5 (ix)
   716C E5            [11]  785 	push	hl
   716D CD 43 72      [17]  786 	call	_plant_tile_meta
   7170 F1            [10]  787 	pop	af
   7171 F1            [10]  788 	pop	af
   7172 33            [ 6]  789 	inc	sp
                            790 ;src/blocks.c:209: break;
   7173 C3 2C 72      [10]  791 	jp	00117$
                            792 ;src/blocks.c:210: case BLUE_BLOCK:
   7176                     793 00106$:
                            794 ;src/blocks.c:211: plant_tile_meta(x, y, BLUE_BLOCK, BLUE_SCORE, SINGLE_HIT_TO_REMOVE);
   7176 21 64 01      [10]  795 	ld	hl, #0x0164
   7179 E5            [11]  796 	push	hl
   717A 3E 0A         [ 7]  797 	ld	a, #0x0a
   717C F5            [11]  798 	push	af
   717D 33            [ 6]  799 	inc	sp
   717E DD 66 FC      [19]  800 	ld	h, -4 (ix)
   7181 DD 6E FB      [19]  801 	ld	l, -5 (ix)
   7184 E5            [11]  802 	push	hl
   7185 CD 43 72      [17]  803 	call	_plant_tile_meta
   7188 F1            [10]  804 	pop	af
   7189 F1            [10]  805 	pop	af
   718A 33            [ 6]  806 	inc	sp
                            807 ;src/blocks.c:212: break;
   718B C3 2C 72      [10]  808 	jp	00117$
                            809 ;src/blocks.c:213: case MAGENTA_BLOCK:
   718E                     810 00107$:
                            811 ;src/blocks.c:214: plant_tile_meta(x, y, MAGENTA_BLOCK, MAGENTA_SCORE, SINGLE_HIT_TO_REMOVE);
   718E 21 6E 01      [10]  812 	ld	hl, #0x016e
   7191 E5            [11]  813 	push	hl
   7192 3E 0C         [ 7]  814 	ld	a, #0x0c
   7194 F5            [11]  815 	push	af
   7195 33            [ 6]  816 	inc	sp
   7196 DD 66 FC      [19]  817 	ld	h, -4 (ix)
   7199 DD 6E FB      [19]  818 	ld	l, -5 (ix)
   719C E5            [11]  819 	push	hl
   719D CD 43 72      [17]  820 	call	_plant_tile_meta
   71A0 F1            [10]  821 	pop	af
   71A1 F1            [10]  822 	pop	af
   71A2 33            [ 6]  823 	inc	sp
                            824 ;src/blocks.c:215: break;
   71A3 C3 2C 72      [10]  825 	jp	00117$
                            826 ;src/blocks.c:216: case YELLOW_BLOCK:
   71A6                     827 00108$:
                            828 ;src/blocks.c:217: plant_tile_meta(x, y, YELLOW_BLOCK, YELLOW_SCORE, SINGLE_HIT_TO_REMOVE);
   71A6 21 78 01      [10]  829 	ld	hl, #0x0178
   71A9 E5            [11]  830 	push	hl
   71AA 3E 0E         [ 7]  831 	ld	a, #0x0e
   71AC F5            [11]  832 	push	af
   71AD 33            [ 6]  833 	inc	sp
   71AE DD 66 FC      [19]  834 	ld	h, -4 (ix)
   71B1 DD 6E FB      [19]  835 	ld	l, -5 (ix)
   71B4 E5            [11]  836 	push	hl
   71B5 CD 43 72      [17]  837 	call	_plant_tile_meta
   71B8 F1            [10]  838 	pop	af
   71B9 F1            [10]  839 	pop	af
   71BA 33            [ 6]  840 	inc	sp
                            841 ;src/blocks.c:218: break;
   71BB 18 6F         [12]  842 	jr	00117$
                            843 ;src/blocks.c:219: case STEEL_BLOCK:
   71BD                     844 00109$:
                            845 ;src/blocks.c:222: current_level->steel_score);
   71BD 2A 71 80      [16]  846 	ld	hl, (_current_level)
   71C0 11 04 00      [10]  847 	ld	de, #0x0004
   71C3 19            [11]  848 	add	hl, de
   71C4 56            [ 7]  849 	ld	d, (hl)
                            850 ;src/blocks.c:221: current_level->steel_hits_to_destroy, 
   71C5 FD 2A 71 80   [20]  851 	ld	iy, (_current_level)
                            852 ;src/blocks.c:220: plant_tile_meta(x, y, STEEL_BLOCK, 
   71C9 FD 5E 05      [19]  853 	ld	e, 5 (iy)
   71CC D5            [11]  854 	push	de
   71CD 3E 10         [ 7]  855 	ld	a, #0x10
   71CF F5            [11]  856 	push	af
   71D0 33            [ 6]  857 	inc	sp
   71D1 DD 66 FC      [19]  858 	ld	h, -4 (ix)
   71D4 DD 6E FB      [19]  859 	ld	l, -5 (ix)
   71D7 E5            [11]  860 	push	hl
   71D8 CD 43 72      [17]  861 	call	_plant_tile_meta
   71DB F1            [10]  862 	pop	af
   71DC F1            [10]  863 	pop	af
   71DD 33            [ 6]  864 	inc	sp
                            865 ;src/blocks.c:223: break;
   71DE 18 4C         [12]  866 	jr	00117$
                            867 ;src/blocks.c:224: case GOLD_BLOCK:
   71E0                     868 00110$:
                            869 ;src/blocks.c:225: plant_tile_meta(x, y, GOLD_BLOCK, 0, INDESTRUCTABLE);
   71E0 21 00 FF      [10]  870 	ld	hl, #0xff00
   71E3 E5            [11]  871 	push	hl
   71E4 3E 12         [ 7]  872 	ld	a, #0x12
   71E6 F5            [11]  873 	push	af
   71E7 33            [ 6]  874 	inc	sp
   71E8 DD 66 FC      [19]  875 	ld	h, -4 (ix)
   71EB DD 6E FB      [19]  876 	ld	l, -5 (ix)
   71EE E5            [11]  877 	push	hl
   71EF CD 43 72      [17]  878 	call	_plant_tile_meta
   71F2 F1            [10]  879 	pop	af
   71F3 F1            [10]  880 	pop	af
   71F4 33            [ 6]  881 	inc	sp
                            882 ;src/blocks.c:226: break;
   71F5 18 35         [12]  883 	jr	00117$
                            884 ;src/blocks.c:227: default:
   71F7                     885 00111$:
                            886 ;src/blocks.c:229: block_meta[x / 2][y / 2].is_active = 0;
   71F7 DD 4E FB      [19]  887 	ld	c, -5 (ix)
   71FA CB 39         [ 8]  888 	srl	c
   71FC 06 00         [ 7]  889 	ld	b,#0x00
   71FE 69            [ 4]  890 	ld	l, c
   71FF 60            [ 4]  891 	ld	h, b
   7200 29            [11]  892 	add	hl, hl
   7201 29            [11]  893 	add	hl, hl
   7202 09            [11]  894 	add	hl, bc
   7203 29            [11]  895 	add	hl, hl
   7204 29            [11]  896 	add	hl, hl
   7205 09            [11]  897 	add	hl, bc
   7206 29            [11]  898 	add	hl, hl
   7207 29            [11]  899 	add	hl, hl
   7208 01 22 7C      [10]  900 	ld	bc,#_block_meta
   720B 09            [11]  901 	add	hl,bc
   720C 4D            [ 4]  902 	ld	c, l
   720D 44            [ 4]  903 	ld	b, h
   720E DD 6E FF      [19]  904 	ld	l,-1 (ix)
   7211 26 00         [ 7]  905 	ld	h,#0x00
   7213 09            [11]  906 	add	hl, bc
   7214 36 00         [10]  907 	ld	(hl), #0x00
                            908 ;src/blocks.c:230: block_meta[x / 2][y / 2].score = 0;
   7216 DD 7E FF      [19]  909 	ld	a, -1 (ix)
   7219 81            [ 4]  910 	add	a, c
   721A 4F            [ 4]  911 	ld	c, a
   721B 3E 00         [ 7]  912 	ld	a, #0x00
   721D 88            [ 4]  913 	adc	a, b
   721E 47            [ 4]  914 	ld	b, a
   721F 59            [ 4]  915 	ld	e, c
   7220 50            [ 4]  916 	ld	d, b
   7221 13            [ 6]  917 	inc	de
   7222 13            [ 6]  918 	inc	de
   7223 AF            [ 4]  919 	xor	a, a
   7224 12            [ 7]  920 	ld	(de), a
                            921 ;src/blocks.c:231: block_meta[x / 2][y / 2].remaining_hits = 0;
   7225 03            [ 6]  922 	inc	bc
   7226 03            [ 6]  923 	inc	bc
   7227 03            [ 6]  924 	inc	bc
   7228 60            [ 4]  925 	ld	h, b
   7229 69            [ 4]  926 	ld	l, c
   722A 36 00         [10]  927 	ld	(hl), #0x00
                            928 ;src/blocks.c:234: }
   722C                     929 00117$:
                            930 ;src/blocks.c:190: for (u8 x = 0; x < BLOCKS_MAP_W; x += 2)
   722C DD 34 FB      [23]  931 	inc	-5 (ix)
   722F DD 34 FB      [23]  932 	inc	-5 (ix)
   7232 C3 B2 70      [10]  933 	jp	00116$
   7235                     934 00120$:
                            935 ;src/blocks.c:188: for (u8 y = 0; y < BLOCKS_MAP_H; y += 2)
   7235 DD 34 FC      [23]  936 	inc	-4 (ix)
   7238 DD 34 FC      [23]  937 	inc	-4 (ix)
   723B C3 87 70      [10]  938 	jp	00119$
   723E                     939 00121$:
   723E DD F9         [10]  940 	ld	sp, ix
   7240 DD E1         [14]  941 	pop	ix
   7242 C9            [10]  942 	ret
                            943 ;src/blocks.c:239: void plant_tile_meta(u8 map_x, u8 map_y, u8 tile_type, u8 score, u8 hits_to_destroy)
                            944 ;	---------------------------------
                            945 ; Function plant_tile_meta
                            946 ; ---------------------------------
   7243                     947 _plant_tile_meta::
   7243 DD E5         [15]  948 	push	ix
   7245 DD 21 00 00   [14]  949 	ld	ix,#0
   7249 DD 39         [15]  950 	add	ix,sp
                            951 ;src/blocks.c:241: block_meta[map_x / 2][map_y / 2].is_active = 1;
   724B 01 22 7C      [10]  952 	ld	bc, #_block_meta+0
   724E DD 5E 04      [19]  953 	ld	e, 4 (ix)
   7251 CB 3B         [ 8]  954 	srl	e
   7253 16 00         [ 7]  955 	ld	d,#0x00
   7255 6B            [ 4]  956 	ld	l, e
   7256 62            [ 4]  957 	ld	h, d
   7257 29            [11]  958 	add	hl, hl
   7258 29            [11]  959 	add	hl, hl
   7259 19            [11]  960 	add	hl, de
   725A 29            [11]  961 	add	hl, hl
   725B 29            [11]  962 	add	hl, hl
   725C 19            [11]  963 	add	hl, de
   725D 29            [11]  964 	add	hl, hl
   725E 29            [11]  965 	add	hl, hl
   725F 09            [11]  966 	add	hl,bc
   7260 4D            [ 4]  967 	ld	c, l
   7261 44            [ 4]  968 	ld	b, h
   7262 DD 5E 05      [19]  969 	ld	e, 5 (ix)
   7265 CB 3B         [ 8]  970 	srl	e
   7267 6B            [ 4]  971 	ld	l, e
   7268 29            [11]  972 	add	hl, hl
   7269 19            [11]  973 	add	hl, de
   726A 29            [11]  974 	add	hl, hl
   726B 7D            [ 4]  975 	ld	a, l
   726C 81            [ 4]  976 	add	a, c
   726D 4F            [ 4]  977 	ld	c, a
   726E 3E 00         [ 7]  978 	ld	a, #0x00
   7270 88            [ 4]  979 	adc	a, b
   7271 47            [ 4]  980 	ld	b, a
   7272 3E 01         [ 7]  981 	ld	a, #0x01
   7274 02            [ 7]  982 	ld	(bc), a
                            983 ;src/blocks.c:242: block_meta[map_x / 2][map_y / 2].score = score;
   7275 59            [ 4]  984 	ld	e, c
   7276 50            [ 4]  985 	ld	d, b
   7277 13            [ 6]  986 	inc	de
   7278 13            [ 6]  987 	inc	de
   7279 DD 7E 07      [19]  988 	ld	a, 7 (ix)
   727C 12            [ 7]  989 	ld	(de), a
                            990 ;src/blocks.c:243: block_meta[map_x / 2][map_y / 2].remaining_hits = hits_to_destroy;
   727D 59            [ 4]  991 	ld	e, c
   727E 50            [ 4]  992 	ld	d, b
   727F 13            [ 6]  993 	inc	de
   7280 13            [ 6]  994 	inc	de
   7281 13            [ 6]  995 	inc	de
   7282 DD 7E 08      [19]  996 	ld	a, 8 (ix)
   7285 12            [ 7]  997 	ld	(de), a
                            998 ;src/blocks.c:244: block_meta[map_x / 2][map_y / 2].type = tile_type;
   7286 59            [ 4]  999 	ld	e, c
   7287 50            [ 4] 1000 	ld	d, b
   7288 13            [ 6] 1001 	inc	de
   7289 DD 7E 06      [19] 1002 	ld	a, 6 (ix)
   728C 12            [ 7] 1003 	ld	(de), a
                           1004 ;src/blocks.c:245: block_meta[map_x / 2][map_y / 2].block_tile_x = map_x;
   728D 21 04 00      [10] 1005 	ld	hl, #0x0004
   7290 09            [11] 1006 	add	hl, bc
   7291 DD 7E 04      [19] 1007 	ld	a, 4 (ix)
   7294 77            [ 7] 1008 	ld	(hl), a
                           1009 ;src/blocks.c:246: block_meta[map_x / 2][map_y / 2].block_tile_y = map_y;
   7295 21 05 00      [10] 1010 	ld	hl, #0x0005
   7298 09            [11] 1011 	add	hl, bc
   7299 DD 7E 05      [19] 1012 	ld	a, 5 (ix)
   729C 77            [ 7] 1013 	ld	(hl), a
   729D DD E1         [14] 1014 	pop	ix
   729F C9            [10] 1015 	ret
                           1016 	.area _CODE
                           1017 	.area _INITIALIZER
                           1018 	.area _CABS (ABS)
