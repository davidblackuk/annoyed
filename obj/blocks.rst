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
                             11 	.globl _background_restore_tiles_exact
                             12 	.globl _cpct_etm_drawTileBox2x4
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _cpct_drawSolidBox
                             15 	.globl _blocks_remaining
                             16 	.globl _block_meta
                             17 	.globl _blocks_initialize
                             18 	.globl _blocks_draw
                             19 	.globl _blocks_restore_background
                             20 	.globl _blocks_bounce_ball
                             21 	.globl _is_ball_colliding_with_block
                             22 	.globl _get_metaData_at
                             23 	.globl _draw_current_blocks
                             24 	.globl _map_blocks_to_meta
                             25 	.globl _plant_tile_meta
                             26 ;--------------------------------------------------------
                             27 ; special function registers
                             28 ;--------------------------------------------------------
                             29 ;--------------------------------------------------------
                             30 ; ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DATA
   8E41                      33 _block_meta::
   8E41                      34 	.ds 1092
   9285                      35 _blocks_remaining::
   9285                      36 	.ds 2
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
                             61 ;src/blocks.c:39: void blocks_initialize(u8 is_restart)
                             62 ;	---------------------------------
                             63 ; Function blocks_initialize
                             64 ; ---------------------------------
   7B50                      65 _blocks_initialize::
                             66 ;src/blocks.c:41: if (!is_restart)
   7B50 21 02 00      [10]   67 	ld	hl, #2+0
   7B53 39            [11]   68 	add	hl, sp
   7B54 7E            [ 7]   69 	ld	a, (hl)
   7B55 B7            [ 4]   70 	or	a, a
   7B56 C2 6B 7D      [10]   71 	jp	NZ,_draw_current_blocks
                             72 ;src/blocks.c:44: map_blocks_to_meta();
   7B59 CD F3 7D      [17]   73 	call	_map_blocks_to_meta
                             74 ;src/blocks.c:49: draw_current_blocks();
   7B5C C3 6B 7D      [10]   75 	jp  _draw_current_blocks
                             76 ;src/blocks.c:52: void blocks_draw()
                             77 ;	---------------------------------
                             78 ; Function blocks_draw
                             79 ; ---------------------------------
   7B5F                      80 _blocks_draw::
                             81 ;src/blocks.c:54: }
   7B5F C9            [10]   82 	ret
                             83 ;src/blocks.c:56: void blocks_restore_background()
                             84 ;	---------------------------------
                             85 ; Function blocks_restore_background
                             86 ; ---------------------------------
   7B60                      87 _blocks_restore_background::
                             88 ;src/blocks.c:58: }
   7B60 C9            [10]   89 	ret
                             90 ;src/blocks.c:60: BounceHits blocks_bounce_ball(Ball *ball, i16 at_x, i16 at_y)
                             91 ;	---------------------------------
                             92 ; Function blocks_bounce_ball
                             93 ; ---------------------------------
   7B61                      94 _blocks_bounce_ball::
   7B61 DD E5         [15]   95 	push	ix
   7B63 DD 21 00 00   [14]   96 	ld	ix,#0
   7B67 DD 39         [15]   97 	add	ix,sp
   7B69 F5            [11]   98 	push	af
                             99 ;src/blocks.c:67: if (W_2_S_Y(at_y) < BRICKS_MAP_PIXEL_TOP_SCR ||
   7B6A DD 7E 08      [19]  100 	ld	a, 8 (ix)
   7B6D C6 08         [ 7]  101 	add	a, #0x08
   7B6F 4F            [ 4]  102 	ld	c, a
   7B70 DD 7E 09      [19]  103 	ld	a, 9 (ix)
   7B73 CE 00         [ 7]  104 	adc	a, #0x00
   7B75 47            [ 4]  105 	ld	b, a
   7B76 79            [ 4]  106 	ld	a, c
   7B77 D6 18         [ 7]  107 	sub	a, #0x18
   7B79 78            [ 4]  108 	ld	a, b
   7B7A 17            [ 4]  109 	rla
   7B7B 3F            [ 4]  110 	ccf
   7B7C 1F            [ 4]  111 	rra
   7B7D DE 80         [ 7]  112 	sbc	a, #0x80
   7B7F 38 0E         [12]  113 	jr	C,00101$
                            114 ;src/blocks.c:68: W_2_S_Y(at_y) > BRICKS_MAP_PIXEL_BOTTOM_SCR)
   7B81 3E 88         [ 7]  115 	ld	a, #0x88
   7B83 B9            [ 4]  116 	cp	a, c
   7B84 3E 00         [ 7]  117 	ld	a, #0x00
   7B86 98            [ 4]  118 	sbc	a, b
   7B87 E2 8C 7B      [10]  119 	jp	PO, 00124$
   7B8A EE 80         [ 7]  120 	xor	a, #0x80
   7B8C                     121 00124$:
   7B8C F2 94 7B      [10]  122 	jp	P, 00102$
   7B8F                     123 00101$:
                            124 ;src/blocks.c:70: return BOUNCE_NONE;
   7B8F 2E 00         [ 7]  125 	ld	l, #0x00
   7B91 C3 34 7C      [10]  126 	jp	00112$
   7B94                     127 00102$:
                            128 ;src/blocks.c:73: if (ball->dy < 0)
   7B94 DD 4E 04      [19]  129 	ld	c,4 (ix)
   7B97 DD 46 05      [19]  130 	ld	b,5 (ix)
   7B9A C5            [11]  131 	push	bc
   7B9B FD E1         [14]  132 	pop	iy
   7B9D FD 66 0C      [19]  133 	ld	h, 12 (iy)
                            134 ;src/blocks.c:77: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y, BOUNCE_Y);
   7BA0 DD 5E 06      [19]  135 	ld	e,6 (ix)
   7BA3 DD 56 07      [19]  136 	ld	d,7 (ix)
   7BA6 13            [ 6]  137 	inc	de
   7BA7 13            [ 6]  138 	inc	de
   7BA8 13            [ 6]  139 	inc	de
                            140 ;src/blocks.c:73: if (ball->dy < 0)
   7BA9 CB 7C         [ 8]  141 	bit	7, h
   7BAB 28 3C         [12]  142 	jr	Z,00105$
                            143 ;src/blocks.c:76: bounces |= is_ball_colliding_with_block(ball, at_x, at_y, BOUNCE_Y);
   7BAD D5            [11]  144 	push	de
   7BAE 3E 02         [ 7]  145 	ld	a, #0x02
   7BB0 F5            [11]  146 	push	af
   7BB1 33            [ 6]  147 	inc	sp
   7BB2 DD 6E 08      [19]  148 	ld	l,8 (ix)
   7BB5 DD 66 09      [19]  149 	ld	h,9 (ix)
   7BB8 E5            [11]  150 	push	hl
   7BB9 DD 6E 06      [19]  151 	ld	l,6 (ix)
   7BBC DD 66 07      [19]  152 	ld	h,7 (ix)
   7BBF E5            [11]  153 	push	hl
   7BC0 C5            [11]  154 	push	bc
   7BC1 CD 39 7C      [17]  155 	call	_is_ball_colliding_with_block
   7BC4 F1            [10]  156 	pop	af
   7BC5 F1            [10]  157 	pop	af
   7BC6 F1            [10]  158 	pop	af
   7BC7 33            [ 6]  159 	inc	sp
   7BC8 D1            [10]  160 	pop	de
                            161 ;src/blocks.c:77: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y, BOUNCE_Y);
   7BC9 E5            [11]  162 	push	hl
   7BCA 3E 02         [ 7]  163 	ld	a, #0x02
   7BCC F5            [11]  164 	push	af
   7BCD 33            [ 6]  165 	inc	sp
   7BCE DD 4E 08      [19]  166 	ld	c,8 (ix)
   7BD1 DD 46 09      [19]  167 	ld	b,9 (ix)
   7BD4 C5            [11]  168 	push	bc
   7BD5 D5            [11]  169 	push	de
   7BD6 DD 4E 04      [19]  170 	ld	c,4 (ix)
   7BD9 DD 46 05      [19]  171 	ld	b,5 (ix)
   7BDC C5            [11]  172 	push	bc
   7BDD CD 39 7C      [17]  173 	call	_is_ball_colliding_with_block
   7BE0 F1            [10]  174 	pop	af
   7BE1 F1            [10]  175 	pop	af
   7BE2 F1            [10]  176 	pop	af
   7BE3 33            [ 6]  177 	inc	sp
   7BE4 7D            [ 4]  178 	ld	a, l
   7BE5 E1            [10]  179 	pop	hl
   7BE6 B5            [ 4]  180 	or	a, l
   7BE7 18 4A         [12]  181 	jr	00111$
   7BE9                     182 00105$:
                            183 ;src/blocks.c:82: bounces |= is_ball_colliding_with_block(ball, at_x, at_y + 6, BOUNCE_Y);
   7BE9 DD 7E 08      [19]  184 	ld	a, 8 (ix)
   7BEC C6 06         [ 7]  185 	add	a, #0x06
   7BEE DD 77 FE      [19]  186 	ld	-2 (ix), a
   7BF1 DD 7E 09      [19]  187 	ld	a, 9 (ix)
   7BF4 CE 00         [ 7]  188 	adc	a, #0x00
   7BF6 DD 77 FF      [19]  189 	ld	-1 (ix), a
   7BF9 D5            [11]  190 	push	de
   7BFA 3E 02         [ 7]  191 	ld	a, #0x02
   7BFC F5            [11]  192 	push	af
   7BFD 33            [ 6]  193 	inc	sp
   7BFE DD 6E FE      [19]  194 	ld	l,-2 (ix)
   7C01 DD 66 FF      [19]  195 	ld	h,-1 (ix)
   7C04 E5            [11]  196 	push	hl
   7C05 DD 6E 06      [19]  197 	ld	l,6 (ix)
   7C08 DD 66 07      [19]  198 	ld	h,7 (ix)
   7C0B E5            [11]  199 	push	hl
   7C0C C5            [11]  200 	push	bc
   7C0D CD 39 7C      [17]  201 	call	_is_ball_colliding_with_block
   7C10 F1            [10]  202 	pop	af
   7C11 F1            [10]  203 	pop	af
   7C12 F1            [10]  204 	pop	af
   7C13 33            [ 6]  205 	inc	sp
   7C14 D1            [10]  206 	pop	de
                            207 ;src/blocks.c:83: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y + 6, BOUNCE_Y);
   7C15 E5            [11]  208 	push	hl
   7C16 3E 02         [ 7]  209 	ld	a, #0x02
   7C18 F5            [11]  210 	push	af
   7C19 33            [ 6]  211 	inc	sp
   7C1A DD 4E FE      [19]  212 	ld	c,-2 (ix)
   7C1D DD 46 FF      [19]  213 	ld	b,-1 (ix)
   7C20 C5            [11]  214 	push	bc
   7C21 D5            [11]  215 	push	de
   7C22 DD 4E 04      [19]  216 	ld	c,4 (ix)
   7C25 DD 46 05      [19]  217 	ld	b,5 (ix)
   7C28 C5            [11]  218 	push	bc
   7C29 CD 39 7C      [17]  219 	call	_is_ball_colliding_with_block
   7C2C F1            [10]  220 	pop	af
   7C2D F1            [10]  221 	pop	af
   7C2E F1            [10]  222 	pop	af
   7C2F 33            [ 6]  223 	inc	sp
   7C30 7D            [ 4]  224 	ld	a, l
   7C31 E1            [10]  225 	pop	hl
   7C32 B5            [ 4]  226 	or	a, l
                            227 ;src/blocks.c:98: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y + 6, BOUNCE_X);
   7C33                     228 00111$:
                            229 ;src/blocks.c:102: return bounces;
   7C33 6F            [ 4]  230 	ld	l, a
   7C34                     231 00112$:
   7C34 DD F9         [10]  232 	ld	sp, ix
   7C36 DD E1         [14]  233 	pop	ix
   7C38 C9            [10]  234 	ret
                            235 ;src/blocks.c:109: BounceHits is_ball_colliding_with_block(Ball *ball, i16 wx, i16 wy, BounceHits bounceType)
                            236 ;	---------------------------------
                            237 ; Function is_ball_colliding_with_block
                            238 ; ---------------------------------
   7C39                     239 _is_ball_colliding_with_block::
   7C39 DD E5         [15]  240 	push	ix
   7C3B DD 21 00 00   [14]  241 	ld	ix,#0
   7C3F DD 39         [15]  242 	add	ix,sp
   7C41 F5            [11]  243 	push	af
                            244 ;src/blocks.c:111: BounceHits bounces = BOUNCE_NONE;
   7C42 2E 00         [ 7]  245 	ld	l, #0x00
                            246 ;src/blocks.c:114: meta = get_metaData_at(wx, wy);
   7C44 E5            [11]  247 	push	hl
   7C45 DD 4E 08      [19]  248 	ld	c,8 (ix)
   7C48 DD 46 09      [19]  249 	ld	b,9 (ix)
   7C4B C5            [11]  250 	push	bc
   7C4C DD 4E 06      [19]  251 	ld	c,6 (ix)
   7C4F DD 46 07      [19]  252 	ld	b,7 (ix)
   7C52 C5            [11]  253 	push	bc
   7C53 CD E3 7C      [17]  254 	call	_get_metaData_at
   7C56 F1            [10]  255 	pop	af
   7C57 F1            [10]  256 	pop	af
   7C58 EB            [ 4]  257 	ex	de,hl
   7C59 E1            [10]  258 	pop	hl
                            259 ;src/blocks.c:115: if (meta)
   7C5A 7A            [ 4]  260 	ld	a, d
   7C5B B3            [ 4]  261 	or	a,e
   7C5C CA DE 7C      [10]  262 	jp	Z, 00107$
                            263 ;src/blocks.c:117: if (meta->remaining_hits != INDESTRUCTABLE)
   7C5F 6B            [ 4]  264 	ld	l, e
   7C60 62            [ 4]  265 	ld	h, d
   7C61 23            [ 6]  266 	inc	hl
   7C62 23            [ 6]  267 	inc	hl
   7C63 23            [ 6]  268 	inc	hl
   7C64 4E            [ 7]  269 	ld	c, (hl)
   7C65 79            [ 4]  270 	ld	a, c
   7C66 3C            [ 4]  271 	inc	a
   7C67 28 72         [12]  272 	jr	Z,00105$
                            273 ;src/blocks.c:119: if (meta->remaining_hits > 1)
   7C69 3E 01         [ 7]  274 	ld	a, #0x01
   7C6B 91            [ 4]  275 	sub	a, c
   7C6C 30 04         [12]  276 	jr	NC,00102$
                            277 ;src/blocks.c:121: meta->remaining_hits -= 1;
   7C6E 0D            [ 4]  278 	dec	c
   7C6F 71            [ 7]  279 	ld	(hl), c
   7C70 18 69         [12]  280 	jr	00105$
   7C72                     281 00102$:
                            282 ;src/blocks.c:125: meta->remaining_hits = 0;
   7C72 36 00         [10]  283 	ld	(hl), #0x00
                            284 ;src/blocks.c:126: meta->is_active = 0;
   7C74 AF            [ 4]  285 	xor	a, a
   7C75 12            [ 7]  286 	ld	(de), a
                            287 ;src/blocks.c:127: blocks_remaining -= 1;
   7C76 2A 85 92      [16]  288 	ld	hl, (_blocks_remaining)
   7C79 2B            [ 6]  289 	dec	hl
   7C7A 22 85 92      [16]  290 	ld	(_blocks_remaining), hl
                            291 ;src/blocks.c:128: current_score += meta->score;
   7C7D 6B            [ 4]  292 	ld	l, e
   7C7E 62            [ 4]  293 	ld	h, d
   7C7F 23            [ 6]  294 	inc	hl
   7C80 23            [ 6]  295 	inc	hl
   7C81 4E            [ 7]  296 	ld	c, (hl)
   7C82 06 00         [ 7]  297 	ld	b, #0x00
   7C84 21 90 92      [10]  298 	ld	hl, #_current_score
   7C87 7E            [ 7]  299 	ld	a, (hl)
   7C88 81            [ 4]  300 	add	a, c
   7C89 77            [ 7]  301 	ld	(hl), a
   7C8A 23            [ 6]  302 	inc	hl
   7C8B 7E            [ 7]  303 	ld	a, (hl)
   7C8C 88            [ 4]  304 	adc	a, b
   7C8D 77            [ 7]  305 	ld	(hl), a
                            306 ;src/blocks.c:133: BRICKS_MAP_PIXEL_TOP_SCR + (meta->block_tile_y * TILE_H));
   7C8E 21 05 00      [10]  307 	ld	hl, #0x0005
   7C91 19            [11]  308 	add	hl,de
   7C92 E3            [19]  309 	ex	(sp), hl
   7C93 E1            [10]  310 	pop	hl
   7C94 E5            [11]  311 	push	hl
   7C95 7E            [ 7]  312 	ld	a, (hl)
   7C96 87            [ 4]  313 	add	a, a
   7C97 87            [ 4]  314 	add	a, a
   7C98 C6 18         [ 7]  315 	add	a, #0x18
   7C9A 47            [ 4]  316 	ld	b, a
                            317 ;src/blocks.c:132: W_2_S_X(meta->block_tile_x * TILE_W),
   7C9B 13            [ 6]  318 	inc	de
   7C9C 13            [ 6]  319 	inc	de
   7C9D 13            [ 6]  320 	inc	de
   7C9E 13            [ 6]  321 	inc	de
   7C9F 1A            [ 7]  322 	ld	a, (de)
   7CA0 87            [ 4]  323 	add	a, a
   7CA1 C6 0C         [ 7]  324 	add	a, #0x0c
                            325 ;src/blocks.c:131: pvm = cpct_getScreenPtr(CPCT_VMEM_START,
   7CA3 D5            [11]  326 	push	de
   7CA4 C5            [11]  327 	push	bc
   7CA5 33            [ 6]  328 	inc	sp
   7CA6 F5            [11]  329 	push	af
   7CA7 33            [ 6]  330 	inc	sp
   7CA8 21 00 C0      [10]  331 	ld	hl, #0xc000
   7CAB E5            [11]  332 	push	hl
   7CAC CD 44 8D      [17]  333 	call	_cpct_getScreenPtr
   7CAF 01 04 08      [10]  334 	ld	bc, #0x0804
   7CB2 C5            [11]  335 	push	bc
   7CB3 01 00 00      [10]  336 	ld	bc, #0x0000
   7CB6 C5            [11]  337 	push	bc
   7CB7 E5            [11]  338 	push	hl
   7CB8 CD 3D 8C      [17]  339 	call	_cpct_drawSolidBox
   7CBB D1            [10]  340 	pop	de
                            341 ;src/blocks.c:138: meta->block_tile_y + 6,
   7CBC E1            [10]  342 	pop	hl
   7CBD E5            [11]  343 	push	hl
   7CBE 4E            [ 7]  344 	ld	c, (hl)
   7CBF 06 00         [ 7]  345 	ld	b, #0x00
   7CC1 21 06 00      [10]  346 	ld	hl, #0x0006
   7CC4 09            [11]  347 	add	hl,bc
   7CC5 4D            [ 4]  348 	ld	c, l
   7CC6 44            [ 4]  349 	ld	b, h
                            350 ;src/blocks.c:137: background_restore_tiles_exact(meta->block_tile_x + 2,
   7CC7 1A            [ 7]  351 	ld	a, (de)
   7CC8 5F            [ 4]  352 	ld	e, a
   7CC9 16 00         [ 7]  353 	ld	d, #0x00
   7CCB 13            [ 6]  354 	inc	de
   7CCC 13            [ 6]  355 	inc	de
   7CCD 21 02 02      [10]  356 	ld	hl, #0x0202
   7CD0 E5            [11]  357 	push	hl
   7CD1 C5            [11]  358 	push	bc
   7CD2 D5            [11]  359 	push	de
   7CD3 CD B1 75      [17]  360 	call	_background_restore_tiles_exact
   7CD6 21 06 00      [10]  361 	ld	hl, #6
   7CD9 39            [11]  362 	add	hl, sp
   7CDA F9            [ 6]  363 	ld	sp, hl
   7CDB                     364 00105$:
                            365 ;src/blocks.c:150: bounces = bounceType;
   7CDB DD 6E 0A      [19]  366 	ld	l, 10 (ix)
   7CDE                     367 00107$:
                            368 ;src/blocks.c:153: return bounces;
   7CDE DD F9         [10]  369 	ld	sp, ix
   7CE0 DD E1         [14]  370 	pop	ix
   7CE2 C9            [10]  371 	ret
                            372 ;src/blocks.c:156: BlockMeta *get_metaData_at(i16 wx, i16 wy)
                            373 ;	---------------------------------
                            374 ; Function get_metaData_at
                            375 ; ---------------------------------
   7CE3                     376 _get_metaData_at::
   7CE3 DD E5         [15]  377 	push	ix
   7CE5 DD 21 00 00   [14]  378 	ld	ix,#0
   7CE9 DD 39         [15]  379 	add	ix,sp
                            380 ;src/blocks.c:164: tx = (wx / 2);
   7CEB DD 5E 04      [19]  381 	ld	e,4 (ix)
   7CEE DD 56 05      [19]  382 	ld	d,5 (ix)
   7CF1 CB 7A         [ 8]  383 	bit	7, d
   7CF3 28 01         [12]  384 	jr	Z,00108$
   7CF5 13            [ 6]  385 	inc	de
   7CF6                     386 00108$:
   7CF6 CB 2A         [ 8]  387 	sra	d
   7CF8 CB 1B         [ 8]  388 	rr	e
                            389 ;src/blocks.c:168: ty = ((wy) / 4) - 4;
   7CFA DD 4E 06      [19]  390 	ld	c,6 (ix)
   7CFD DD 46 07      [19]  391 	ld	b,7 (ix)
   7D00 CB 78         [ 8]  392 	bit	7, b
   7D02 28 03         [12]  393 	jr	Z,00109$
   7D04 03            [ 6]  394 	inc	bc
   7D05 03            [ 6]  395 	inc	bc
   7D06 03            [ 6]  396 	inc	bc
   7D07                     397 00109$:
   7D07 CB 28         [ 8]  398 	sra	b
   7D09 CB 19         [ 8]  399 	rr	c
   7D0B CB 28         [ 8]  400 	sra	b
   7D0D CB 19         [ 8]  401 	rr	c
   7D0F 79            [ 4]  402 	ld	a, c
   7D10 C6 FC         [ 7]  403 	add	a, #0xfc
   7D12 6F            [ 4]  404 	ld	l, a
   7D13 78            [ 4]  405 	ld	a, b
   7D14 CE FF         [ 7]  406 	adc	a, #0xff
   7D16 67            [ 4]  407 	ld	h, a
                            408 ;src/blocks.c:172: mx = tx / 2;
   7D17 4B            [ 4]  409 	ld	c, e
   7D18 42            [ 4]  410 	ld	b, d
   7D19 CB 7A         [ 8]  411 	bit	7, d
   7D1B 28 03         [12]  412 	jr	Z,00110$
   7D1D 4B            [ 4]  413 	ld	c, e
   7D1E 42            [ 4]  414 	ld	b, d
   7D1F 03            [ 6]  415 	inc	bc
   7D20                     416 00110$:
   7D20 CB 28         [ 8]  417 	sra	b
   7D22 CB 19         [ 8]  418 	rr	c
                            419 ;src/blocks.c:173: my = ty / 2;
   7D24 5D            [ 4]  420 	ld	e, l
   7D25 54            [ 4]  421 	ld	d, h
   7D26 CB 7C         [ 8]  422 	bit	7, h
   7D28 28 02         [12]  423 	jr	Z,00111$
   7D2A EB            [ 4]  424 	ex	de,hl
   7D2B 13            [ 6]  425 	inc	de
   7D2C                     426 00111$:
   7D2C CB 2A         [ 8]  427 	sra	d
   7D2E CB 1B         [ 8]  428 	rr	e
                            429 ;src/blocks.c:177: if ((mx >= BLOCKS_MAP_W / 2) || (my >= BLOCKS_MAP_H / 2))
   7D30 79            [ 4]  430 	ld	a, c
   7D31 D6 0D         [ 7]  431 	sub	a, #0x0d
   7D33 78            [ 4]  432 	ld	a, b
   7D34 17            [ 4]  433 	rla
   7D35 3F            [ 4]  434 	ccf
   7D36 1F            [ 4]  435 	rra
   7D37 DE 80         [ 7]  436 	sbc	a, #0x80
   7D39 30 0B         [12]  437 	jr	NC,00101$
   7D3B 7B            [ 4]  438 	ld	a, e
   7D3C D6 0E         [ 7]  439 	sub	a, #0x0e
   7D3E 7A            [ 4]  440 	ld	a, d
   7D3F 17            [ 4]  441 	rla
   7D40 3F            [ 4]  442 	ccf
   7D41 1F            [ 4]  443 	rra
   7D42 DE 80         [ 7]  444 	sbc	a, #0x80
   7D44 38 05         [12]  445 	jr	C,00102$
   7D46                     446 00101$:
                            447 ;src/blocks.c:179: return BOUNCE_NONE;
   7D46 21 00 00      [10]  448 	ld	hl, #0x0000
   7D49 18 1D         [12]  449 	jr	00106$
   7D4B                     450 00102$:
                            451 ;src/blocks.c:182: meta = &block_meta[mx][my];
   7D4B 69            [ 4]  452 	ld	l, c
   7D4C 60            [ 4]  453 	ld	h, b
   7D4D 29            [11]  454 	add	hl, hl
   7D4E 29            [11]  455 	add	hl, hl
   7D4F 09            [11]  456 	add	hl, bc
   7D50 29            [11]  457 	add	hl, hl
   7D51 29            [11]  458 	add	hl, hl
   7D52 09            [11]  459 	add	hl, bc
   7D53 29            [11]  460 	add	hl, hl
   7D54 29            [11]  461 	add	hl, hl
   7D55 01 41 8E      [10]  462 	ld	bc,#_block_meta
   7D58 09            [11]  463 	add	hl,bc
   7D59 4D            [ 4]  464 	ld	c, l
   7D5A 44            [ 4]  465 	ld	b, h
   7D5B 6B            [ 4]  466 	ld	l, e
   7D5C 62            [ 4]  467 	ld	h, d
   7D5D 29            [11]  468 	add	hl, hl
   7D5E 19            [11]  469 	add	hl, de
   7D5F 29            [11]  470 	add	hl, hl
   7D60 09            [11]  471 	add	hl, bc
                            472 ;src/blocks.c:183: if (meta->is_active)
   7D61 7E            [ 7]  473 	ld	a, (hl)
   7D62 B7            [ 4]  474 	or	a, a
                            475 ;src/blocks.c:185: return meta;
   7D63 20 03         [12]  476 	jr	NZ,00106$
                            477 ;src/blocks.c:187: return NULL;
   7D65 21 00 00      [10]  478 	ld	hl, #0x0000
   7D68                     479 00106$:
   7D68 DD E1         [14]  480 	pop	ix
   7D6A C9            [10]  481 	ret
                            482 ;src/blocks.c:190: void draw_current_blocks()
                            483 ;	---------------------------------
                            484 ; Function draw_current_blocks
                            485 ; ---------------------------------
   7D6B                     486 _draw_current_blocks::
   7D6B DD E5         [15]  487 	push	ix
   7D6D DD 21 00 00   [14]  488 	ld	ix,#0
   7D71 DD 39         [15]  489 	add	ix,sp
   7D73 F5            [11]  490 	push	af
   7D74 3B            [ 6]  491 	dec	sp
                            492 ;src/blocks.c:192: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(0),
   7D75 21 0C 18      [10]  493 	ld	hl, #0x180c
   7D78 E5            [11]  494 	push	hl
   7D79 21 00 C0      [10]  495 	ld	hl, #0xc000
   7D7C E5            [11]  496 	push	hl
   7D7D CD 44 8D      [17]  497 	call	_cpct_getScreenPtr
   7D80 EB            [ 4]  498 	ex	de,hl
                            499 ;src/blocks.c:194: for (u8 y = 0; y < BLOCKS_MAP_H / 2; y++)
   7D81 0E 00         [ 7]  500 	ld	c, #0x00
   7D83                     501 00109$:
                            502 ;src/blocks.c:196: for (u8 x = 0; x < BLOCKS_MAP_W / 2; x++)
   7D83 79            [ 4]  503 	ld	a,c
   7D84 FE 0E         [ 7]  504 	cp	a,#0x0e
   7D86 30 66         [12]  505 	jr	NC,00111$
   7D88 87            [ 4]  506 	add	a, a
   7D89 DD 77 FF      [19]  507 	ld	-1 (ix), a
   7D8C 79            [ 4]  508 	ld	a, c
   7D8D 87            [ 4]  509 	add	a, a
   7D8E 81            [ 4]  510 	add	a, c
   7D8F 87            [ 4]  511 	add	a, a
   7D90 DD 77 FE      [19]  512 	ld	-2 (ix), a
   7D93 06 00         [ 7]  513 	ld	b, #0x00
   7D95                     514 00106$:
   7D95 78            [ 4]  515 	ld	a, b
   7D96 D6 0D         [ 7]  516 	sub	a, #0x0d
   7D98 30 51         [12]  517 	jr	NC,00110$
                            518 ;src/blocks.c:198: BlockMeta *meta = &block_meta[x][y];
   7D9A D5            [11]  519 	push	de
   7D9B 58            [ 4]  520 	ld	e,b
   7D9C 16 00         [ 7]  521 	ld	d,#0x00
   7D9E 6B            [ 4]  522 	ld	l, e
   7D9F 62            [ 4]  523 	ld	h, d
   7DA0 29            [11]  524 	add	hl, hl
   7DA1 29            [11]  525 	add	hl, hl
   7DA2 19            [11]  526 	add	hl, de
   7DA3 29            [11]  527 	add	hl, hl
   7DA4 29            [11]  528 	add	hl, hl
   7DA5 19            [11]  529 	add	hl, de
   7DA6 29            [11]  530 	add	hl, hl
   7DA7 29            [11]  531 	add	hl, hl
   7DA8 D1            [10]  532 	pop	de
   7DA9 3E 41         [ 7]  533 	ld	a, #<(_block_meta)
   7DAB 85            [ 4]  534 	add	a, l
   7DAC 6F            [ 4]  535 	ld	l, a
   7DAD 3E 8E         [ 7]  536 	ld	a, #>(_block_meta)
   7DAF 8C            [ 4]  537 	adc	a, h
   7DB0 67            [ 4]  538 	ld	h, a
   7DB1 7D            [ 4]  539 	ld	a, l
   7DB2 DD 86 FE      [19]  540 	add	a, -2 (ix)
   7DB5 6F            [ 4]  541 	ld	l, a
   7DB6 7C            [ 4]  542 	ld	a, h
   7DB7 CE 00         [ 7]  543 	adc	a, #0x00
   7DB9 67            [ 4]  544 	ld	h, a
                            545 ;src/blocks.c:200: if (meta->is_active)
   7DBA 7E            [ 7]  546 	ld	a, (hl)
   7DBB B7            [ 4]  547 	or	a, a
   7DBC 28 2A         [12]  548 	jr	Z,00107$
                            549 ;src/blocks.c:203: current_level->blocks_tilemap);
   7DBE 2A 94 92      [16]  550 	ld	hl, (_current_level)
   7DC1 23            [ 6]  551 	inc	hl
   7DC2 23            [ 6]  552 	inc	hl
   7DC3 7E            [ 7]  553 	ld	a, (hl)
   7DC4 23            [ 6]  554 	inc	hl
   7DC5 66            [ 7]  555 	ld	h, (hl)
   7DC6 6F            [ 4]  556 	ld	l, a
                            557 ;src/blocks.c:202: cpct_etm_drawTileBox2x4(x * 2, y * 2, 2, 2, BLOCKS_MAP_W, pvmem,
   7DC7 D5            [11]  558 	push	de
   7DC8 FD E1         [14]  559 	pop	iy
   7DCA 78            [ 4]  560 	ld	a, b
   7DCB 87            [ 4]  561 	add	a, a
   7DCC DD 77 FD      [19]  562 	ld	-3 (ix), a
   7DCF C5            [11]  563 	push	bc
   7DD0 D5            [11]  564 	push	de
   7DD1 E5            [11]  565 	push	hl
   7DD2 FD E5         [15]  566 	push	iy
   7DD4 21 02 1A      [10]  567 	ld	hl, #0x1a02
   7DD7 E5            [11]  568 	push	hl
   7DD8 3E 02         [ 7]  569 	ld	a, #0x02
   7DDA F5            [11]  570 	push	af
   7DDB 33            [ 6]  571 	inc	sp
   7DDC DD 66 FF      [19]  572 	ld	h, -1 (ix)
   7DDF DD 6E FD      [19]  573 	ld	l, -3 (ix)
   7DE2 E5            [11]  574 	push	hl
   7DE3 CD 7E 8A      [17]  575 	call	_cpct_etm_drawTileBox2x4
   7DE6 D1            [10]  576 	pop	de
   7DE7 C1            [10]  577 	pop	bc
   7DE8                     578 00107$:
                            579 ;src/blocks.c:196: for (u8 x = 0; x < BLOCKS_MAP_W / 2; x++)
   7DE8 04            [ 4]  580 	inc	b
   7DE9 18 AA         [12]  581 	jr	00106$
   7DEB                     582 00110$:
                            583 ;src/blocks.c:194: for (u8 y = 0; y < BLOCKS_MAP_H / 2; y++)
   7DEB 0C            [ 4]  584 	inc	c
   7DEC 18 95         [12]  585 	jr	00109$
   7DEE                     586 00111$:
   7DEE DD F9         [10]  587 	ld	sp, ix
   7DF0 DD E1         [14]  588 	pop	ix
   7DF2 C9            [10]  589 	ret
                            590 ;src/blocks.c:212: void map_blocks_to_meta()
                            591 ;	---------------------------------
                            592 ; Function map_blocks_to_meta
                            593 ; ---------------------------------
   7DF3                     594 _map_blocks_to_meta::
   7DF3 DD E5         [15]  595 	push	ix
   7DF5 DD 21 00 00   [14]  596 	ld	ix,#0
   7DF9 DD 39         [15]  597 	add	ix,sp
   7DFB F5            [11]  598 	push	af
   7DFC F5            [11]  599 	push	af
   7DFD 3B            [ 6]  600 	dec	sp
                            601 ;src/blocks.c:214: blocks_remaining = 0;
   7DFE 21 00 00      [10]  602 	ld	hl, #0x0000
   7E01 22 85 92      [16]  603 	ld	(_blocks_remaining), hl
                            604 ;src/blocks.c:216: for (u8 y = 0; y < BLOCKS_MAP_H; y += 2)
   7E04 DD 36 FC 00   [19]  605 	ld	-4 (ix), #0x00
   7E08                     606 00119$:
   7E08 DD 7E FC      [19]  607 	ld	a, -4 (ix)
   7E0B D6 1C         [ 7]  608 	sub	a, #0x1c
   7E0D D2 BF 7F      [10]  609 	jp	NC, 00121$
                            610 ;src/blocks.c:218: for (u8 x = 0; x < BLOCKS_MAP_W; x += 2)
   7E10 DD 4E FC      [19]  611 	ld	c,-4 (ix)
   7E13 06 00         [ 7]  612 	ld	b,#0x00
   7E15 69            [ 4]  613 	ld	l, c
   7E16 60            [ 4]  614 	ld	h, b
   7E17 29            [11]  615 	add	hl, hl
   7E18 09            [11]  616 	add	hl, bc
   7E19 29            [11]  617 	add	hl, hl
   7E1A 29            [11]  618 	add	hl, hl
   7E1B 09            [11]  619 	add	hl, bc
   7E1C 29            [11]  620 	add	hl, hl
   7E1D DD 75 FD      [19]  621 	ld	-3 (ix), l
   7E20 DD 74 FE      [19]  622 	ld	-2 (ix), h
   7E23 DD 4E FC      [19]  623 	ld	c, -4 (ix)
   7E26 CB 39         [ 8]  624 	srl	c
   7E28 79            [ 4]  625 	ld	a, c
   7E29 87            [ 4]  626 	add	a, a
   7E2A 81            [ 4]  627 	add	a, c
   7E2B 87            [ 4]  628 	add	a, a
   7E2C DD 77 FF      [19]  629 	ld	-1 (ix), a
   7E2F DD 36 FB 00   [19]  630 	ld	-5 (ix), #0x00
   7E33                     631 00116$:
   7E33 DD 7E FB      [19]  632 	ld	a, -5 (ix)
   7E36 D6 1A         [ 7]  633 	sub	a, #0x1a
   7E38 D2 B6 7F      [10]  634 	jp	NC, 00120$
                            635 ;src/blocks.c:220: u8 tile = current_level->blocks_tilemap[(y * BLOCKS_MAP_W) + x];
   7E3B 2A 94 92      [16]  636 	ld	hl, (_current_level)
   7E3E 23            [ 6]  637 	inc	hl
   7E3F 23            [ 6]  638 	inc	hl
   7E40 4E            [ 7]  639 	ld	c, (hl)
   7E41 23            [ 6]  640 	inc	hl
   7E42 46            [ 7]  641 	ld	b, (hl)
   7E43 DD 5E FB      [19]  642 	ld	e, -5 (ix)
   7E46 16 00         [ 7]  643 	ld	d, #0x00
   7E48 DD 6E FD      [19]  644 	ld	l,-3 (ix)
   7E4B DD 66 FE      [19]  645 	ld	h,-2 (ix)
   7E4E 19            [11]  646 	add	hl, de
   7E4F 09            [11]  647 	add	hl, bc
   7E50 7E            [ 7]  648 	ld	a, (hl)
                            649 ;src/blocks.c:221: switch (tile)
   7E51 B7            [ 4]  650 	or	a, a
   7E52 28 2C         [12]  651 	jr	Z,00101$
   7E54 FE 02         [ 7]  652 	cp	a, #0x02
   7E56 28 3F         [12]  653 	jr	Z,00102$
   7E58 FE 04         [ 7]  654 	cp	a, #0x04
   7E5A 28 53         [12]  655 	jr	Z,00103$
   7E5C FE 06         [ 7]  656 	cp	a, #0x06
   7E5E 28 67         [12]  657 	jr	Z,00104$
   7E60 FE 08         [ 7]  658 	cp	a, #0x08
   7E62 28 7B         [12]  659 	jr	Z,00105$
   7E64 FE 0A         [ 7]  660 	cp	a, #0x0a
   7E66 CA F7 7E      [10]  661 	jp	Z,00106$
   7E69 FE 0C         [ 7]  662 	cp	a, #0x0c
   7E6B CA 0F 7F      [10]  663 	jp	Z,00107$
   7E6E FE 0E         [ 7]  664 	cp	a, #0x0e
   7E70 CA 27 7F      [10]  665 	jp	Z,00108$
   7E73 FE 10         [ 7]  666 	cp	a, #0x10
   7E75 CA 3E 7F      [10]  667 	jp	Z,00109$
   7E78 D6 12         [ 7]  668 	sub	a, #0x12
   7E7A CA 61 7F      [10]  669 	jp	Z,00110$
   7E7D C3 78 7F      [10]  670 	jp	00111$
                            671 ;src/blocks.c:223: case WHITE_BLOCK:
   7E80                     672 00101$:
                            673 ;src/blocks.c:224: plant_tile_meta(x, y, WHITE_BLOCK, WHITE_SCORE, SINGLE_HIT_TO_REMOVE);
   7E80 21 05 01      [10]  674 	ld	hl, #0x0105
   7E83 E5            [11]  675 	push	hl
   7E84 AF            [ 4]  676 	xor	a, a
   7E85 F5            [11]  677 	push	af
   7E86 33            [ 6]  678 	inc	sp
   7E87 DD 66 FC      [19]  679 	ld	h, -4 (ix)
   7E8A DD 6E FB      [19]  680 	ld	l, -5 (ix)
   7E8D E5            [11]  681 	push	hl
   7E8E CD C4 7F      [17]  682 	call	_plant_tile_meta
   7E91 F1            [10]  683 	pop	af
   7E92 F1            [10]  684 	pop	af
   7E93 33            [ 6]  685 	inc	sp
                            686 ;src/blocks.c:225: break;
   7E94 C3 AD 7F      [10]  687 	jp	00117$
                            688 ;src/blocks.c:226: case ORANGE_BLOCK:
   7E97                     689 00102$:
                            690 ;src/blocks.c:227: plant_tile_meta(x, y, ORANGE_BLOCK, ORANGE_SCORE, SINGLE_HIT_TO_REMOVE);
   7E97 21 06 01      [10]  691 	ld	hl, #0x0106
   7E9A E5            [11]  692 	push	hl
   7E9B 3E 02         [ 7]  693 	ld	a, #0x02
   7E9D F5            [11]  694 	push	af
   7E9E 33            [ 6]  695 	inc	sp
   7E9F DD 66 FC      [19]  696 	ld	h, -4 (ix)
   7EA2 DD 6E FB      [19]  697 	ld	l, -5 (ix)
   7EA5 E5            [11]  698 	push	hl
   7EA6 CD C4 7F      [17]  699 	call	_plant_tile_meta
   7EA9 F1            [10]  700 	pop	af
   7EAA F1            [10]  701 	pop	af
   7EAB 33            [ 6]  702 	inc	sp
                            703 ;src/blocks.c:228: break;
   7EAC C3 AD 7F      [10]  704 	jp	00117$
                            705 ;src/blocks.c:229: case CYAN_BLOCK:
   7EAF                     706 00103$:
                            707 ;src/blocks.c:230: plant_tile_meta(x, y, CYAN_BLOCK, CYAN_SCORE, SINGLE_HIT_TO_REMOVE);
   7EAF 21 07 01      [10]  708 	ld	hl, #0x0107
   7EB2 E5            [11]  709 	push	hl
   7EB3 3E 04         [ 7]  710 	ld	a, #0x04
   7EB5 F5            [11]  711 	push	af
   7EB6 33            [ 6]  712 	inc	sp
   7EB7 DD 66 FC      [19]  713 	ld	h, -4 (ix)
   7EBA DD 6E FB      [19]  714 	ld	l, -5 (ix)
   7EBD E5            [11]  715 	push	hl
   7EBE CD C4 7F      [17]  716 	call	_plant_tile_meta
   7EC1 F1            [10]  717 	pop	af
   7EC2 F1            [10]  718 	pop	af
   7EC3 33            [ 6]  719 	inc	sp
                            720 ;src/blocks.c:231: break;
   7EC4 C3 AD 7F      [10]  721 	jp	00117$
                            722 ;src/blocks.c:232: case GREEN_BLOCK:
   7EC7                     723 00104$:
                            724 ;src/blocks.c:233: plant_tile_meta(x, y, GREEN_BLOCK, GREEN_SCORE, SINGLE_HIT_TO_REMOVE);
   7EC7 21 08 01      [10]  725 	ld	hl, #0x0108
   7ECA E5            [11]  726 	push	hl
   7ECB 3E 06         [ 7]  727 	ld	a, #0x06
   7ECD F5            [11]  728 	push	af
   7ECE 33            [ 6]  729 	inc	sp
   7ECF DD 66 FC      [19]  730 	ld	h, -4 (ix)
   7ED2 DD 6E FB      [19]  731 	ld	l, -5 (ix)
   7ED5 E5            [11]  732 	push	hl
   7ED6 CD C4 7F      [17]  733 	call	_plant_tile_meta
   7ED9 F1            [10]  734 	pop	af
   7EDA F1            [10]  735 	pop	af
   7EDB 33            [ 6]  736 	inc	sp
                            737 ;src/blocks.c:234: break;
   7EDC C3 AD 7F      [10]  738 	jp	00117$
                            739 ;src/blocks.c:235: case RED_BLOCK:
   7EDF                     740 00105$:
                            741 ;src/blocks.c:236: plant_tile_meta(x, y, RED_BLOCK, RED_SCORE, SINGLE_HIT_TO_REMOVE);
   7EDF 21 09 01      [10]  742 	ld	hl, #0x0109
   7EE2 E5            [11]  743 	push	hl
   7EE3 3E 08         [ 7]  744 	ld	a, #0x08
   7EE5 F5            [11]  745 	push	af
   7EE6 33            [ 6]  746 	inc	sp
   7EE7 DD 66 FC      [19]  747 	ld	h, -4 (ix)
   7EEA DD 6E FB      [19]  748 	ld	l, -5 (ix)
   7EED E5            [11]  749 	push	hl
   7EEE CD C4 7F      [17]  750 	call	_plant_tile_meta
   7EF1 F1            [10]  751 	pop	af
   7EF2 F1            [10]  752 	pop	af
   7EF3 33            [ 6]  753 	inc	sp
                            754 ;src/blocks.c:237: break;
   7EF4 C3 AD 7F      [10]  755 	jp	00117$
                            756 ;src/blocks.c:238: case BLUE_BLOCK:
   7EF7                     757 00106$:
                            758 ;src/blocks.c:239: plant_tile_meta(x, y, BLUE_BLOCK, BLUE_SCORE, SINGLE_HIT_TO_REMOVE);
   7EF7 21 0A 01      [10]  759 	ld	hl, #0x010a
   7EFA E5            [11]  760 	push	hl
   7EFB 3E 0A         [ 7]  761 	ld	a, #0x0a
   7EFD F5            [11]  762 	push	af
   7EFE 33            [ 6]  763 	inc	sp
   7EFF DD 66 FC      [19]  764 	ld	h, -4 (ix)
   7F02 DD 6E FB      [19]  765 	ld	l, -5 (ix)
   7F05 E5            [11]  766 	push	hl
   7F06 CD C4 7F      [17]  767 	call	_plant_tile_meta
   7F09 F1            [10]  768 	pop	af
   7F0A F1            [10]  769 	pop	af
   7F0B 33            [ 6]  770 	inc	sp
                            771 ;src/blocks.c:240: break;
   7F0C C3 AD 7F      [10]  772 	jp	00117$
                            773 ;src/blocks.c:241: case MAGENTA_BLOCK:
   7F0F                     774 00107$:
                            775 ;src/blocks.c:242: plant_tile_meta(x, y, MAGENTA_BLOCK, MAGENTA_SCORE, SINGLE_HIT_TO_REMOVE);
   7F0F 21 0B 01      [10]  776 	ld	hl, #0x010b
   7F12 E5            [11]  777 	push	hl
   7F13 3E 0C         [ 7]  778 	ld	a, #0x0c
   7F15 F5            [11]  779 	push	af
   7F16 33            [ 6]  780 	inc	sp
   7F17 DD 66 FC      [19]  781 	ld	h, -4 (ix)
   7F1A DD 6E FB      [19]  782 	ld	l, -5 (ix)
   7F1D E5            [11]  783 	push	hl
   7F1E CD C4 7F      [17]  784 	call	_plant_tile_meta
   7F21 F1            [10]  785 	pop	af
   7F22 F1            [10]  786 	pop	af
   7F23 33            [ 6]  787 	inc	sp
                            788 ;src/blocks.c:243: break;
   7F24 C3 AD 7F      [10]  789 	jp	00117$
                            790 ;src/blocks.c:244: case YELLOW_BLOCK:
   7F27                     791 00108$:
                            792 ;src/blocks.c:245: plant_tile_meta(x, y, YELLOW_BLOCK, YELLOW_SCORE, SINGLE_HIT_TO_REMOVE);
   7F27 21 0C 01      [10]  793 	ld	hl, #0x010c
   7F2A E5            [11]  794 	push	hl
   7F2B 3E 0E         [ 7]  795 	ld	a, #0x0e
   7F2D F5            [11]  796 	push	af
   7F2E 33            [ 6]  797 	inc	sp
   7F2F DD 66 FC      [19]  798 	ld	h, -4 (ix)
   7F32 DD 6E FB      [19]  799 	ld	l, -5 (ix)
   7F35 E5            [11]  800 	push	hl
   7F36 CD C4 7F      [17]  801 	call	_plant_tile_meta
   7F39 F1            [10]  802 	pop	af
   7F3A F1            [10]  803 	pop	af
   7F3B 33            [ 6]  804 	inc	sp
                            805 ;src/blocks.c:246: break;
   7F3C 18 6F         [12]  806 	jr	00117$
                            807 ;src/blocks.c:247: case STEEL_BLOCK:
   7F3E                     808 00109$:
                            809 ;src/blocks.c:250: current_level->steel_hits_to_destroy);
   7F3E 2A 94 92      [16]  810 	ld	hl, (_current_level)
   7F41 11 05 00      [10]  811 	ld	de, #0x0005
   7F44 19            [11]  812 	add	hl, de
   7F45 56            [ 7]  813 	ld	d, (hl)
                            814 ;src/blocks.c:249: current_level->steel_score,
   7F46 FD 2A 94 92   [20]  815 	ld	iy, (_current_level)
                            816 ;src/blocks.c:248: plant_tile_meta(x, y, STEEL_BLOCK,
   7F4A FD 5E 04      [19]  817 	ld	e, 4 (iy)
   7F4D D5            [11]  818 	push	de
   7F4E 3E 10         [ 7]  819 	ld	a, #0x10
   7F50 F5            [11]  820 	push	af
   7F51 33            [ 6]  821 	inc	sp
   7F52 DD 66 FC      [19]  822 	ld	h, -4 (ix)
   7F55 DD 6E FB      [19]  823 	ld	l, -5 (ix)
   7F58 E5            [11]  824 	push	hl
   7F59 CD C4 7F      [17]  825 	call	_plant_tile_meta
   7F5C F1            [10]  826 	pop	af
   7F5D F1            [10]  827 	pop	af
   7F5E 33            [ 6]  828 	inc	sp
                            829 ;src/blocks.c:251: break;
   7F5F 18 4C         [12]  830 	jr	00117$
                            831 ;src/blocks.c:252: case GOLD_BLOCK:
   7F61                     832 00110$:
                            833 ;src/blocks.c:253: plant_tile_meta(x, y, GOLD_BLOCK, 0, INDESTRUCTABLE);
   7F61 21 00 FF      [10]  834 	ld	hl, #0xff00
   7F64 E5            [11]  835 	push	hl
   7F65 3E 12         [ 7]  836 	ld	a, #0x12
   7F67 F5            [11]  837 	push	af
   7F68 33            [ 6]  838 	inc	sp
   7F69 DD 66 FC      [19]  839 	ld	h, -4 (ix)
   7F6C DD 6E FB      [19]  840 	ld	l, -5 (ix)
   7F6F E5            [11]  841 	push	hl
   7F70 CD C4 7F      [17]  842 	call	_plant_tile_meta
   7F73 F1            [10]  843 	pop	af
   7F74 F1            [10]  844 	pop	af
   7F75 33            [ 6]  845 	inc	sp
                            846 ;src/blocks.c:254: break;
   7F76 18 35         [12]  847 	jr	00117$
                            848 ;src/blocks.c:255: default:
   7F78                     849 00111$:
                            850 ;src/blocks.c:257: block_meta[x / 2][y / 2].is_active = 0;
   7F78 DD 4E FB      [19]  851 	ld	c, -5 (ix)
   7F7B CB 39         [ 8]  852 	srl	c
   7F7D 06 00         [ 7]  853 	ld	b,#0x00
   7F7F 69            [ 4]  854 	ld	l, c
   7F80 60            [ 4]  855 	ld	h, b
   7F81 29            [11]  856 	add	hl, hl
   7F82 29            [11]  857 	add	hl, hl
   7F83 09            [11]  858 	add	hl, bc
   7F84 29            [11]  859 	add	hl, hl
   7F85 29            [11]  860 	add	hl, hl
   7F86 09            [11]  861 	add	hl, bc
   7F87 29            [11]  862 	add	hl, hl
   7F88 29            [11]  863 	add	hl, hl
   7F89 01 41 8E      [10]  864 	ld	bc,#_block_meta
   7F8C 09            [11]  865 	add	hl,bc
   7F8D 4D            [ 4]  866 	ld	c, l
   7F8E 44            [ 4]  867 	ld	b, h
   7F8F DD 6E FF      [19]  868 	ld	l,-1 (ix)
   7F92 26 00         [ 7]  869 	ld	h,#0x00
   7F94 09            [11]  870 	add	hl, bc
   7F95 36 00         [10]  871 	ld	(hl), #0x00
                            872 ;src/blocks.c:258: block_meta[x / 2][y / 2].score = 0;
   7F97 DD 7E FF      [19]  873 	ld	a, -1 (ix)
   7F9A 81            [ 4]  874 	add	a, c
   7F9B 4F            [ 4]  875 	ld	c, a
   7F9C 3E 00         [ 7]  876 	ld	a, #0x00
   7F9E 88            [ 4]  877 	adc	a, b
   7F9F 47            [ 4]  878 	ld	b, a
   7FA0 59            [ 4]  879 	ld	e, c
   7FA1 50            [ 4]  880 	ld	d, b
   7FA2 13            [ 6]  881 	inc	de
   7FA3 13            [ 6]  882 	inc	de
   7FA4 AF            [ 4]  883 	xor	a, a
   7FA5 12            [ 7]  884 	ld	(de), a
                            885 ;src/blocks.c:259: block_meta[x / 2][y / 2].remaining_hits = 0;
   7FA6 03            [ 6]  886 	inc	bc
   7FA7 03            [ 6]  887 	inc	bc
   7FA8 03            [ 6]  888 	inc	bc
   7FA9 60            [ 4]  889 	ld	h, b
   7FAA 69            [ 4]  890 	ld	l, c
   7FAB 36 00         [10]  891 	ld	(hl), #0x00
                            892 ;src/blocks.c:262: }
   7FAD                     893 00117$:
                            894 ;src/blocks.c:218: for (u8 x = 0; x < BLOCKS_MAP_W; x += 2)
   7FAD DD 34 FB      [23]  895 	inc	-5 (ix)
   7FB0 DD 34 FB      [23]  896 	inc	-5 (ix)
   7FB3 C3 33 7E      [10]  897 	jp	00116$
   7FB6                     898 00120$:
                            899 ;src/blocks.c:216: for (u8 y = 0; y < BLOCKS_MAP_H; y += 2)
   7FB6 DD 34 FC      [23]  900 	inc	-4 (ix)
   7FB9 DD 34 FC      [23]  901 	inc	-4 (ix)
   7FBC C3 08 7E      [10]  902 	jp	00119$
   7FBF                     903 00121$:
   7FBF DD F9         [10]  904 	ld	sp, ix
   7FC1 DD E1         [14]  905 	pop	ix
   7FC3 C9            [10]  906 	ret
                            907 ;src/blocks.c:267: void plant_tile_meta(u8 map_x, u8 map_y, u8 tile_type, u8 score, u8 hits_to_destroy)
                            908 ;	---------------------------------
                            909 ; Function plant_tile_meta
                            910 ; ---------------------------------
   7FC4                     911 _plant_tile_meta::
   7FC4 DD E5         [15]  912 	push	ix
   7FC6 DD 21 00 00   [14]  913 	ld	ix,#0
   7FCA DD 39         [15]  914 	add	ix,sp
                            915 ;src/blocks.c:269: if (hits_to_destroy != INDESTRUCTABLE)
   7FCC DD 7E 08      [19]  916 	ld	a, 8 (ix)
   7FCF 3C            [ 4]  917 	inc	a
   7FD0 28 0C         [12]  918 	jr	Z,00102$
                            919 ;src/blocks.c:271: blocks_remaining += 1;
   7FD2 FD 21 85 92   [14]  920 	ld	iy, #_blocks_remaining
   7FD6 FD 34 00      [23]  921 	inc	0 (iy)
   7FD9 20 03         [12]  922 	jr	NZ,00110$
   7FDB FD 34 01      [23]  923 	inc	1 (iy)
   7FDE                     924 00110$:
   7FDE                     925 00102$:
                            926 ;src/blocks.c:274: block_meta[map_x / 2][map_y / 2].is_active = 1;
   7FDE 01 41 8E      [10]  927 	ld	bc, #_block_meta+0
   7FE1 DD 5E 04      [19]  928 	ld	e, 4 (ix)
   7FE4 CB 3B         [ 8]  929 	srl	e
   7FE6 16 00         [ 7]  930 	ld	d,#0x00
   7FE8 6B            [ 4]  931 	ld	l, e
   7FE9 62            [ 4]  932 	ld	h, d
   7FEA 29            [11]  933 	add	hl, hl
   7FEB 29            [11]  934 	add	hl, hl
   7FEC 19            [11]  935 	add	hl, de
   7FED 29            [11]  936 	add	hl, hl
   7FEE 29            [11]  937 	add	hl, hl
   7FEF 19            [11]  938 	add	hl, de
   7FF0 29            [11]  939 	add	hl, hl
   7FF1 29            [11]  940 	add	hl, hl
   7FF2 09            [11]  941 	add	hl,bc
   7FF3 4D            [ 4]  942 	ld	c, l
   7FF4 44            [ 4]  943 	ld	b, h
   7FF5 DD 5E 05      [19]  944 	ld	e, 5 (ix)
   7FF8 CB 3B         [ 8]  945 	srl	e
   7FFA 6B            [ 4]  946 	ld	l, e
   7FFB 29            [11]  947 	add	hl, hl
   7FFC 19            [11]  948 	add	hl, de
   7FFD 29            [11]  949 	add	hl, hl
   7FFE 7D            [ 4]  950 	ld	a, l
   7FFF 81            [ 4]  951 	add	a, c
   8000 4F            [ 4]  952 	ld	c, a
   8001 3E 00         [ 7]  953 	ld	a, #0x00
   8003 88            [ 4]  954 	adc	a, b
   8004 47            [ 4]  955 	ld	b, a
   8005 3E 01         [ 7]  956 	ld	a, #0x01
   8007 02            [ 7]  957 	ld	(bc), a
                            958 ;src/blocks.c:275: block_meta[map_x / 2][map_y / 2].score = score;
   8008 59            [ 4]  959 	ld	e, c
   8009 50            [ 4]  960 	ld	d, b
   800A 13            [ 6]  961 	inc	de
   800B 13            [ 6]  962 	inc	de
   800C DD 7E 07      [19]  963 	ld	a, 7 (ix)
   800F 12            [ 7]  964 	ld	(de), a
                            965 ;src/blocks.c:276: block_meta[map_x / 2][map_y / 2].remaining_hits = hits_to_destroy;
   8010 59            [ 4]  966 	ld	e, c
   8011 50            [ 4]  967 	ld	d, b
   8012 13            [ 6]  968 	inc	de
   8013 13            [ 6]  969 	inc	de
   8014 13            [ 6]  970 	inc	de
   8015 DD 7E 08      [19]  971 	ld	a, 8 (ix)
   8018 12            [ 7]  972 	ld	(de), a
                            973 ;src/blocks.c:277: block_meta[map_x / 2][map_y / 2].type = tile_type;
   8019 59            [ 4]  974 	ld	e, c
   801A 50            [ 4]  975 	ld	d, b
   801B 13            [ 6]  976 	inc	de
   801C DD 7E 06      [19]  977 	ld	a, 6 (ix)
   801F 12            [ 7]  978 	ld	(de), a
                            979 ;src/blocks.c:278: block_meta[map_x / 2][map_y / 2].block_tile_x = map_x;
   8020 21 04 00      [10]  980 	ld	hl, #0x0004
   8023 09            [11]  981 	add	hl, bc
   8024 DD 7E 04      [19]  982 	ld	a, 4 (ix)
   8027 77            [ 7]  983 	ld	(hl), a
                            984 ;src/blocks.c:279: block_meta[map_x / 2][map_y / 2].block_tile_y = map_y;
   8028 21 05 00      [10]  985 	ld	hl, #0x0005
   802B 09            [11]  986 	add	hl, bc
   802C DD 7E 05      [19]  987 	ld	a, 5 (ix)
   802F 77            [ 7]  988 	ld	(hl), a
   8030 DD E1         [14]  989 	pop	ix
   8032 C9            [10]  990 	ret
                            991 	.area _CODE
                            992 	.area _INITIALIZER
                            993 	.area _CABS (ABS)
