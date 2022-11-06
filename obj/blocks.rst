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
   8EFC                      33 _block_meta::
   8EFC                      34 	.ds 1092
   9340                      35 _blocks_remaining::
   9340                      36 	.ds 2
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
   7B56 C2 26 7E      [10]   71 	jp	NZ,_draw_current_blocks
                             72 ;src/blocks.c:44: map_blocks_to_meta();
   7B59 CD AE 7E      [17]   73 	call	_map_blocks_to_meta
                             74 ;src/blocks.c:49: draw_current_blocks();
   7B5C C3 26 7E      [10]   75 	jp  _draw_current_blocks
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
   7B6A 3B            [ 6]   99 	dec	sp
                            100 ;src/blocks.c:67: if (W_2_S_Y(at_y) < BRICKS_MAP_PIXEL_TOP_SCR ||
   7B6B DD 7E 08      [19]  101 	ld	a, 8 (ix)
   7B6E C6 08         [ 7]  102 	add	a, #0x08
   7B70 DD 77 FD      [19]  103 	ld	-3 (ix), a
   7B73 DD 7E 09      [19]  104 	ld	a, 9 (ix)
   7B76 CE 00         [ 7]  105 	adc	a, #0x00
   7B78 DD 77 FE      [19]  106 	ld	-2 (ix), a
   7B7B DD 7E FD      [19]  107 	ld	a, -3 (ix)
   7B7E D6 18         [ 7]  108 	sub	a, #0x18
   7B80 DD 7E FE      [19]  109 	ld	a, -2 (ix)
   7B83 17            [ 4]  110 	rla
   7B84 3F            [ 4]  111 	ccf
   7B85 1F            [ 4]  112 	rra
   7B86 DE 80         [ 7]  113 	sbc	a, #0x80
   7B88 38 12         [12]  114 	jr	C,00101$
                            115 ;src/blocks.c:68: W_2_S_Y(at_y) > BRICKS_MAP_PIXEL_BOTTOM_SCR)
   7B8A 3E 88         [ 7]  116 	ld	a, #0x88
   7B8C DD BE FD      [19]  117 	cp	a, -3 (ix)
   7B8F 3E 00         [ 7]  118 	ld	a, #0x00
   7B91 DD 9E FE      [19]  119 	sbc	a, -2 (ix)
   7B94 E2 99 7B      [10]  120 	jp	PO, 00124$
   7B97 EE 80         [ 7]  121 	xor	a, #0x80
   7B99                     122 00124$:
   7B99 F2 A1 7B      [10]  123 	jp	P, 00102$
   7B9C                     124 00101$:
                            125 ;src/blocks.c:70: return BOUNCE_NONE;
   7B9C 2E 00         [ 7]  126 	ld	l, #0x00
   7B9E C3 EF 7C      [10]  127 	jp	00110$
   7BA1                     128 00102$:
                            129 ;src/blocks.c:73: if (ball->dy < 0)
   7BA1 DD 7E 04      [19]  130 	ld	a, 4 (ix)
   7BA4 DD 77 FD      [19]  131 	ld	-3 (ix), a
   7BA7 DD 7E 05      [19]  132 	ld	a, 5 (ix)
   7BAA DD 77 FE      [19]  133 	ld	-2 (ix), a
   7BAD E1            [10]  134 	pop	hl
   7BAE E5            [11]  135 	push	hl
   7BAF 11 0B 00      [10]  136 	ld	de, #0x000b
   7BB2 19            [11]  137 	add	hl, de
   7BB3 7E            [ 7]  138 	ld	a, (hl)
   7BB4 23            [ 6]  139 	inc	hl
   7BB5 66            [ 7]  140 	ld	h, (hl)
                            141 ;src/blocks.c:77: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y, BOUNCE_Y);
   7BB6 DD 4E 06      [19]  142 	ld	c,6 (ix)
   7BB9 DD 46 07      [19]  143 	ld	b,7 (ix)
   7BBC 03            [ 6]  144 	inc	bc
   7BBD 03            [ 6]  145 	inc	bc
   7BBE 03            [ 6]  146 	inc	bc
                            147 ;src/blocks.c:82: bounces |= is_ball_colliding_with_block(ball, at_x, at_y + 6, BOUNCE_Y);
   7BBF DD 7E 08      [19]  148 	ld	a, 8 (ix)
   7BC2 C6 06         [ 7]  149 	add	a, #0x06
   7BC4 5F            [ 4]  150 	ld	e, a
   7BC5 DD 7E 09      [19]  151 	ld	a, 9 (ix)
   7BC8 CE 00         [ 7]  152 	adc	a, #0x00
   7BCA 57            [ 4]  153 	ld	d, a
                            154 ;src/blocks.c:73: if (ball->dy < 0)
   7BCB CB 7C         [ 8]  155 	bit	7, h
   7BCD 28 4E         [12]  156 	jr	Z,00105$
                            157 ;src/blocks.c:76: bounces |= is_ball_colliding_with_block(ball, at_x, at_y, BOUNCE_Y);
   7BCF C5            [11]  158 	push	bc
   7BD0 D5            [11]  159 	push	de
   7BD1 3E 02         [ 7]  160 	ld	a, #0x02
   7BD3 F5            [11]  161 	push	af
   7BD4 33            [ 6]  162 	inc	sp
   7BD5 DD 6E 08      [19]  163 	ld	l,8 (ix)
   7BD8 DD 66 09      [19]  164 	ld	h,9 (ix)
   7BDB E5            [11]  165 	push	hl
   7BDC DD 6E 06      [19]  166 	ld	l,6 (ix)
   7BDF DD 66 07      [19]  167 	ld	h,7 (ix)
   7BE2 E5            [11]  168 	push	hl
   7BE3 DD 6E FD      [19]  169 	ld	l,-3 (ix)
   7BE6 DD 66 FE      [19]  170 	ld	h,-2 (ix)
   7BE9 E5            [11]  171 	push	hl
   7BEA CD F4 7C      [17]  172 	call	_is_ball_colliding_with_block
   7BED F1            [10]  173 	pop	af
   7BEE F1            [10]  174 	pop	af
   7BEF F1            [10]  175 	pop	af
   7BF0 33            [ 6]  176 	inc	sp
   7BF1 D1            [10]  177 	pop	de
   7BF2 C1            [10]  178 	pop	bc
   7BF3 DD 75 FF      [19]  179 	ld	-1 (ix), l
                            180 ;src/blocks.c:77: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y, BOUNCE_Y);
   7BF6 C5            [11]  181 	push	bc
   7BF7 D5            [11]  182 	push	de
   7BF8 3E 02         [ 7]  183 	ld	a, #0x02
   7BFA F5            [11]  184 	push	af
   7BFB 33            [ 6]  185 	inc	sp
   7BFC DD 6E 08      [19]  186 	ld	l,8 (ix)
   7BFF DD 66 09      [19]  187 	ld	h,9 (ix)
   7C02 E5            [11]  188 	push	hl
   7C03 C5            [11]  189 	push	bc
   7C04 DD 6E 04      [19]  190 	ld	l,4 (ix)
   7C07 DD 66 05      [19]  191 	ld	h,5 (ix)
   7C0A E5            [11]  192 	push	hl
   7C0B CD F4 7C      [17]  193 	call	_is_ball_colliding_with_block
   7C0E F1            [10]  194 	pop	af
   7C0F F1            [10]  195 	pop	af
   7C10 F1            [10]  196 	pop	af
   7C11 33            [ 6]  197 	inc	sp
   7C12 D1            [10]  198 	pop	de
   7C13 C1            [10]  199 	pop	bc
   7C14 DD 7E FF      [19]  200 	ld	a, -1 (ix)
   7C17 B5            [ 4]  201 	or	a, l
   7C18 DD 77 FF      [19]  202 	ld	-1 (ix), a
   7C1B 18 3D         [12]  203 	jr	00106$
   7C1D                     204 00105$:
                            205 ;src/blocks.c:82: bounces |= is_ball_colliding_with_block(ball, at_x, at_y + 6, BOUNCE_Y);
   7C1D C5            [11]  206 	push	bc
   7C1E D5            [11]  207 	push	de
   7C1F 3E 02         [ 7]  208 	ld	a, #0x02
   7C21 F5            [11]  209 	push	af
   7C22 33            [ 6]  210 	inc	sp
   7C23 D5            [11]  211 	push	de
   7C24 DD 6E 06      [19]  212 	ld	l,6 (ix)
   7C27 DD 66 07      [19]  213 	ld	h,7 (ix)
   7C2A E5            [11]  214 	push	hl
   7C2B DD 6E FD      [19]  215 	ld	l,-3 (ix)
   7C2E DD 66 FE      [19]  216 	ld	h,-2 (ix)
   7C31 E5            [11]  217 	push	hl
   7C32 CD F4 7C      [17]  218 	call	_is_ball_colliding_with_block
   7C35 F1            [10]  219 	pop	af
   7C36 F1            [10]  220 	pop	af
   7C37 F1            [10]  221 	pop	af
   7C38 33            [ 6]  222 	inc	sp
   7C39 D1            [10]  223 	pop	de
   7C3A C1            [10]  224 	pop	bc
                            225 ;src/blocks.c:83: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y + 6, BOUNCE_Y);
   7C3B E5            [11]  226 	push	hl
   7C3C C5            [11]  227 	push	bc
   7C3D D5            [11]  228 	push	de
   7C3E 3E 02         [ 7]  229 	ld	a, #0x02
   7C40 F5            [11]  230 	push	af
   7C41 33            [ 6]  231 	inc	sp
   7C42 D5            [11]  232 	push	de
   7C43 C5            [11]  233 	push	bc
   7C44 DD 6E 04      [19]  234 	ld	l,4 (ix)
   7C47 DD 66 05      [19]  235 	ld	h,5 (ix)
   7C4A E5            [11]  236 	push	hl
   7C4B CD F4 7C      [17]  237 	call	_is_ball_colliding_with_block
   7C4E F1            [10]  238 	pop	af
   7C4F F1            [10]  239 	pop	af
   7C50 F1            [10]  240 	pop	af
   7C51 33            [ 6]  241 	inc	sp
   7C52 7D            [ 4]  242 	ld	a, l
   7C53 D1            [10]  243 	pop	de
   7C54 C1            [10]  244 	pop	bc
   7C55 E1            [10]  245 	pop	hl
   7C56 B5            [ 4]  246 	or	a, l
   7C57 DD 77 FF      [19]  247 	ld	-1 (ix), a
   7C5A                     248 00106$:
                            249 ;src/blocks.c:86: if (ball->dx < 0)
   7C5A E1            [10]  250 	pop	hl
   7C5B E5            [11]  251 	push	hl
   7C5C C5            [11]  252 	push	bc
   7C5D 01 09 00      [10]  253 	ld	bc, #0x0009
   7C60 09            [11]  254 	add	hl, bc
   7C61 C1            [10]  255 	pop	bc
   7C62 7E            [ 7]  256 	ld	a, (hl)
   7C63 23            [ 6]  257 	inc	hl
   7C64 CB 7E         [12]  258 	bit	7, (hl)
   7C66 28 49         [12]  259 	jr	Z,00108$
                            260 ;src/blocks.c:89: bounces |= is_ball_colliding_with_block(ball, at_x, at_y, BOUNCE_X);
   7C68 D5            [11]  261 	push	de
   7C69 3E 01         [ 7]  262 	ld	a, #0x01
   7C6B F5            [11]  263 	push	af
   7C6C 33            [ 6]  264 	inc	sp
   7C6D DD 6E 08      [19]  265 	ld	l,8 (ix)
   7C70 DD 66 09      [19]  266 	ld	h,9 (ix)
   7C73 E5            [11]  267 	push	hl
   7C74 DD 6E 06      [19]  268 	ld	l,6 (ix)
   7C77 DD 66 07      [19]  269 	ld	h,7 (ix)
   7C7A E5            [11]  270 	push	hl
   7C7B DD 6E 04      [19]  271 	ld	l,4 (ix)
   7C7E DD 66 05      [19]  272 	ld	h,5 (ix)
   7C81 E5            [11]  273 	push	hl
   7C82 CD F4 7C      [17]  274 	call	_is_ball_colliding_with_block
   7C85 F1            [10]  275 	pop	af
   7C86 F1            [10]  276 	pop	af
   7C87 F1            [10]  277 	pop	af
   7C88 33            [ 6]  278 	inc	sp
   7C89 D1            [10]  279 	pop	de
   7C8A DD 7E FF      [19]  280 	ld	a, -1 (ix)
   7C8D B5            [ 4]  281 	or	a, l
   7C8E DD 77 FD      [19]  282 	ld	-3 (ix), a
                            283 ;src/blocks.c:90: bounces |= is_ball_colliding_with_block(ball, at_x, at_y + 6, BOUNCE_X);
   7C91 3E 01         [ 7]  284 	ld	a, #0x01
   7C93 F5            [11]  285 	push	af
   7C94 33            [ 6]  286 	inc	sp
   7C95 D5            [11]  287 	push	de
   7C96 DD 6E 06      [19]  288 	ld	l,6 (ix)
   7C99 DD 66 07      [19]  289 	ld	h,7 (ix)
   7C9C E5            [11]  290 	push	hl
   7C9D DD 6E 04      [19]  291 	ld	l,4 (ix)
   7CA0 DD 66 05      [19]  292 	ld	h,5 (ix)
   7CA3 E5            [11]  293 	push	hl
   7CA4 CD F4 7C      [17]  294 	call	_is_ball_colliding_with_block
   7CA7 F1            [10]  295 	pop	af
   7CA8 F1            [10]  296 	pop	af
   7CA9 F1            [10]  297 	pop	af
   7CAA 33            [ 6]  298 	inc	sp
   7CAB DD 7E FD      [19]  299 	ld	a, -3 (ix)
   7CAE B5            [ 4]  300 	or	a, l
   7CAF 18 3D         [12]  301 	jr	00109$
   7CB1                     302 00108$:
                            303 ;src/blocks.c:95: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y, BOUNCE_X);
   7CB1 C5            [11]  304 	push	bc
   7CB2 D5            [11]  305 	push	de
   7CB3 3E 01         [ 7]  306 	ld	a, #0x01
   7CB5 F5            [11]  307 	push	af
   7CB6 33            [ 6]  308 	inc	sp
   7CB7 DD 6E 08      [19]  309 	ld	l,8 (ix)
   7CBA DD 66 09      [19]  310 	ld	h,9 (ix)
   7CBD E5            [11]  311 	push	hl
   7CBE C5            [11]  312 	push	bc
   7CBF DD 6E 04      [19]  313 	ld	l,4 (ix)
   7CC2 DD 66 05      [19]  314 	ld	h,5 (ix)
   7CC5 E5            [11]  315 	push	hl
   7CC6 CD F4 7C      [17]  316 	call	_is_ball_colliding_with_block
   7CC9 F1            [10]  317 	pop	af
   7CCA F1            [10]  318 	pop	af
   7CCB F1            [10]  319 	pop	af
   7CCC 33            [ 6]  320 	inc	sp
   7CCD D1            [10]  321 	pop	de
   7CCE C1            [10]  322 	pop	bc
   7CCF DD 7E FF      [19]  323 	ld	a, -1 (ix)
   7CD2 B5            [ 4]  324 	or	a, l
   7CD3 DD 77 FD      [19]  325 	ld	-3 (ix), a
                            326 ;src/blocks.c:96: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y + 6, BOUNCE_X);
   7CD6 3E 01         [ 7]  327 	ld	a, #0x01
   7CD8 F5            [11]  328 	push	af
   7CD9 33            [ 6]  329 	inc	sp
   7CDA D5            [11]  330 	push	de
   7CDB C5            [11]  331 	push	bc
   7CDC DD 6E 04      [19]  332 	ld	l,4 (ix)
   7CDF DD 66 05      [19]  333 	ld	h,5 (ix)
   7CE2 E5            [11]  334 	push	hl
   7CE3 CD F4 7C      [17]  335 	call	_is_ball_colliding_with_block
   7CE6 F1            [10]  336 	pop	af
   7CE7 F1            [10]  337 	pop	af
   7CE8 F1            [10]  338 	pop	af
   7CE9 33            [ 6]  339 	inc	sp
   7CEA DD 7E FD      [19]  340 	ld	a, -3 (ix)
   7CED B5            [ 4]  341 	or	a, l
   7CEE                     342 00109$:
                            343 ;src/blocks.c:99: return bounces;
   7CEE 6F            [ 4]  344 	ld	l, a
   7CEF                     345 00110$:
   7CEF DD F9         [10]  346 	ld	sp, ix
   7CF1 DD E1         [14]  347 	pop	ix
   7CF3 C9            [10]  348 	ret
                            349 ;src/blocks.c:106: BounceHits is_ball_colliding_with_block(Ball *ball, i16 wx, i16 wy, BounceHits bounceType)
                            350 ;	---------------------------------
                            351 ; Function is_ball_colliding_with_block
                            352 ; ---------------------------------
   7CF4                     353 _is_ball_colliding_with_block::
   7CF4 DD E5         [15]  354 	push	ix
   7CF6 DD 21 00 00   [14]  355 	ld	ix,#0
   7CFA DD 39         [15]  356 	add	ix,sp
   7CFC F5            [11]  357 	push	af
                            358 ;src/blocks.c:108: BounceHits bounces = BOUNCE_NONE;
   7CFD 2E 00         [ 7]  359 	ld	l, #0x00
                            360 ;src/blocks.c:111: meta = get_metaData_at(wx, wy);
   7CFF E5            [11]  361 	push	hl
   7D00 DD 4E 08      [19]  362 	ld	c,8 (ix)
   7D03 DD 46 09      [19]  363 	ld	b,9 (ix)
   7D06 C5            [11]  364 	push	bc
   7D07 DD 4E 06      [19]  365 	ld	c,6 (ix)
   7D0A DD 46 07      [19]  366 	ld	b,7 (ix)
   7D0D C5            [11]  367 	push	bc
   7D0E CD 9E 7D      [17]  368 	call	_get_metaData_at
   7D11 F1            [10]  369 	pop	af
   7D12 F1            [10]  370 	pop	af
   7D13 EB            [ 4]  371 	ex	de,hl
   7D14 E1            [10]  372 	pop	hl
                            373 ;src/blocks.c:112: if (meta)
   7D15 7A            [ 4]  374 	ld	a, d
   7D16 B3            [ 4]  375 	or	a,e
   7D17 CA 99 7D      [10]  376 	jp	Z, 00107$
                            377 ;src/blocks.c:114: if (meta->remaining_hits != INDESTRUCTABLE) {
   7D1A 6B            [ 4]  378 	ld	l, e
   7D1B 62            [ 4]  379 	ld	h, d
   7D1C 23            [ 6]  380 	inc	hl
   7D1D 23            [ 6]  381 	inc	hl
   7D1E 23            [ 6]  382 	inc	hl
   7D1F 4E            [ 7]  383 	ld	c, (hl)
   7D20 79            [ 4]  384 	ld	a, c
   7D21 3C            [ 4]  385 	inc	a
   7D22 28 72         [12]  386 	jr	Z,00105$
                            387 ;src/blocks.c:115: if (meta->remaining_hits > 1) {
   7D24 3E 01         [ 7]  388 	ld	a, #0x01
   7D26 91            [ 4]  389 	sub	a, c
   7D27 30 04         [12]  390 	jr	NC,00102$
                            391 ;src/blocks.c:116: meta->remaining_hits -= 1;
   7D29 0D            [ 4]  392 	dec	c
   7D2A 71            [ 7]  393 	ld	(hl), c
   7D2B 18 69         [12]  394 	jr	00105$
   7D2D                     395 00102$:
                            396 ;src/blocks.c:118: meta->remaining_hits = 0;
   7D2D 36 00         [10]  397 	ld	(hl), #0x00
                            398 ;src/blocks.c:119: meta->is_active = 0;
   7D2F AF            [ 4]  399 	xor	a, a
   7D30 12            [ 7]  400 	ld	(de), a
                            401 ;src/blocks.c:120: blocks_remaining -= 1;
   7D31 2A 40 93      [16]  402 	ld	hl, (_blocks_remaining)
   7D34 2B            [ 6]  403 	dec	hl
   7D35 22 40 93      [16]  404 	ld	(_blocks_remaining), hl
                            405 ;src/blocks.c:121: current_score += meta->score;
   7D38 6B            [ 4]  406 	ld	l, e
   7D39 62            [ 4]  407 	ld	h, d
   7D3A 23            [ 6]  408 	inc	hl
   7D3B 23            [ 6]  409 	inc	hl
   7D3C 4E            [ 7]  410 	ld	c, (hl)
   7D3D 06 00         [ 7]  411 	ld	b, #0x00
   7D3F 21 4B 93      [10]  412 	ld	hl, #_current_score
   7D42 7E            [ 7]  413 	ld	a, (hl)
   7D43 81            [ 4]  414 	add	a, c
   7D44 77            [ 7]  415 	ld	(hl), a
   7D45 23            [ 6]  416 	inc	hl
   7D46 7E            [ 7]  417 	ld	a, (hl)
   7D47 88            [ 4]  418 	adc	a, b
   7D48 77            [ 7]  419 	ld	(hl), a
                            420 ;src/blocks.c:126: BRICKS_MAP_PIXEL_TOP_SCR + (meta->block_tile_y * TILE_H ) );
   7D49 21 05 00      [10]  421 	ld	hl, #0x0005
   7D4C 19            [11]  422 	add	hl,de
   7D4D E3            [19]  423 	ex	(sp), hl
   7D4E E1            [10]  424 	pop	hl
   7D4F E5            [11]  425 	push	hl
   7D50 7E            [ 7]  426 	ld	a, (hl)
   7D51 87            [ 4]  427 	add	a, a
   7D52 87            [ 4]  428 	add	a, a
   7D53 C6 18         [ 7]  429 	add	a, #0x18
   7D55 47            [ 4]  430 	ld	b, a
                            431 ;src/blocks.c:125: W_2_S_X(meta->block_tile_x * TILE_W),
   7D56 13            [ 6]  432 	inc	de
   7D57 13            [ 6]  433 	inc	de
   7D58 13            [ 6]  434 	inc	de
   7D59 13            [ 6]  435 	inc	de
   7D5A 1A            [ 7]  436 	ld	a, (de)
   7D5B 87            [ 4]  437 	add	a, a
   7D5C C6 0C         [ 7]  438 	add	a, #0x0c
                            439 ;src/blocks.c:124: pvm = cpct_getScreenPtr(CPCT_VMEM_START, 
   7D5E D5            [11]  440 	push	de
   7D5F C5            [11]  441 	push	bc
   7D60 33            [ 6]  442 	inc	sp
   7D61 F5            [11]  443 	push	af
   7D62 33            [ 6]  444 	inc	sp
   7D63 21 00 C0      [10]  445 	ld	hl, #0xc000
   7D66 E5            [11]  446 	push	hl
   7D67 CD FF 8D      [17]  447 	call	_cpct_getScreenPtr
   7D6A 01 04 08      [10]  448 	ld	bc, #0x0804
   7D6D C5            [11]  449 	push	bc
   7D6E 01 00 00      [10]  450 	ld	bc, #0x0000
   7D71 C5            [11]  451 	push	bc
   7D72 E5            [11]  452 	push	hl
   7D73 CD F8 8C      [17]  453 	call	_cpct_drawSolidBox
   7D76 D1            [10]  454 	pop	de
                            455 ;src/blocks.c:131: meta->block_tile_y + 6,
   7D77 E1            [10]  456 	pop	hl
   7D78 E5            [11]  457 	push	hl
   7D79 4E            [ 7]  458 	ld	c, (hl)
   7D7A 06 00         [ 7]  459 	ld	b, #0x00
   7D7C 21 06 00      [10]  460 	ld	hl, #0x0006
   7D7F 09            [11]  461 	add	hl,bc
   7D80 4D            [ 4]  462 	ld	c, l
   7D81 44            [ 4]  463 	ld	b, h
                            464 ;src/blocks.c:130: background_restore_tiles_exact(meta->block_tile_x + 2,
   7D82 1A            [ 7]  465 	ld	a, (de)
   7D83 5F            [ 4]  466 	ld	e, a
   7D84 16 00         [ 7]  467 	ld	d, #0x00
   7D86 13            [ 6]  468 	inc	de
   7D87 13            [ 6]  469 	inc	de
   7D88 21 02 02      [10]  470 	ld	hl, #0x0202
   7D8B E5            [11]  471 	push	hl
   7D8C C5            [11]  472 	push	bc
   7D8D D5            [11]  473 	push	de
   7D8E CD B1 75      [17]  474 	call	_background_restore_tiles_exact
   7D91 21 06 00      [10]  475 	ld	hl, #6
   7D94 39            [11]  476 	add	hl, sp
   7D95 F9            [ 6]  477 	ld	sp, hl
   7D96                     478 00105$:
                            479 ;src/blocks.c:145: bounces = bounceType;
   7D96 DD 6E 0A      [19]  480 	ld	l, 10 (ix)
   7D99                     481 00107$:
                            482 ;src/blocks.c:148: return bounces;
   7D99 DD F9         [10]  483 	ld	sp, ix
   7D9B DD E1         [14]  484 	pop	ix
   7D9D C9            [10]  485 	ret
                            486 ;src/blocks.c:151: BlockMeta *get_metaData_at(i16 wx, i16 wy)
                            487 ;	---------------------------------
                            488 ; Function get_metaData_at
                            489 ; ---------------------------------
   7D9E                     490 _get_metaData_at::
   7D9E DD E5         [15]  491 	push	ix
   7DA0 DD 21 00 00   [14]  492 	ld	ix,#0
   7DA4 DD 39         [15]  493 	add	ix,sp
                            494 ;src/blocks.c:159: tx = (wx / 2);
   7DA6 DD 5E 04      [19]  495 	ld	e,4 (ix)
   7DA9 DD 56 05      [19]  496 	ld	d,5 (ix)
   7DAC CB 7A         [ 8]  497 	bit	7, d
   7DAE 28 01         [12]  498 	jr	Z,00108$
   7DB0 13            [ 6]  499 	inc	de
   7DB1                     500 00108$:
   7DB1 CB 2A         [ 8]  501 	sra	d
   7DB3 CB 1B         [ 8]  502 	rr	e
                            503 ;src/blocks.c:163: ty = ((wy) / 4) - 4;
   7DB5 DD 4E 06      [19]  504 	ld	c,6 (ix)
   7DB8 DD 46 07      [19]  505 	ld	b,7 (ix)
   7DBB CB 78         [ 8]  506 	bit	7, b
   7DBD 28 03         [12]  507 	jr	Z,00109$
   7DBF 03            [ 6]  508 	inc	bc
   7DC0 03            [ 6]  509 	inc	bc
   7DC1 03            [ 6]  510 	inc	bc
   7DC2                     511 00109$:
   7DC2 CB 28         [ 8]  512 	sra	b
   7DC4 CB 19         [ 8]  513 	rr	c
   7DC6 CB 28         [ 8]  514 	sra	b
   7DC8 CB 19         [ 8]  515 	rr	c
   7DCA 79            [ 4]  516 	ld	a, c
   7DCB C6 FC         [ 7]  517 	add	a, #0xfc
   7DCD 6F            [ 4]  518 	ld	l, a
   7DCE 78            [ 4]  519 	ld	a, b
   7DCF CE FF         [ 7]  520 	adc	a, #0xff
   7DD1 67            [ 4]  521 	ld	h, a
                            522 ;src/blocks.c:167: mx = tx / 2;
   7DD2 4B            [ 4]  523 	ld	c, e
   7DD3 42            [ 4]  524 	ld	b, d
   7DD4 CB 7A         [ 8]  525 	bit	7, d
   7DD6 28 03         [12]  526 	jr	Z,00110$
   7DD8 4B            [ 4]  527 	ld	c, e
   7DD9 42            [ 4]  528 	ld	b, d
   7DDA 03            [ 6]  529 	inc	bc
   7DDB                     530 00110$:
   7DDB CB 28         [ 8]  531 	sra	b
   7DDD CB 19         [ 8]  532 	rr	c
                            533 ;src/blocks.c:168: my = ty / 2;
   7DDF 5D            [ 4]  534 	ld	e, l
   7DE0 54            [ 4]  535 	ld	d, h
   7DE1 CB 7C         [ 8]  536 	bit	7, h
   7DE3 28 02         [12]  537 	jr	Z,00111$
   7DE5 EB            [ 4]  538 	ex	de,hl
   7DE6 13            [ 6]  539 	inc	de
   7DE7                     540 00111$:
   7DE7 CB 2A         [ 8]  541 	sra	d
   7DE9 CB 1B         [ 8]  542 	rr	e
                            543 ;src/blocks.c:172: if ((mx >= BLOCKS_MAP_W / 2) || (my >= BLOCKS_MAP_H / 2))
   7DEB 79            [ 4]  544 	ld	a, c
   7DEC D6 0D         [ 7]  545 	sub	a, #0x0d
   7DEE 78            [ 4]  546 	ld	a, b
   7DEF 17            [ 4]  547 	rla
   7DF0 3F            [ 4]  548 	ccf
   7DF1 1F            [ 4]  549 	rra
   7DF2 DE 80         [ 7]  550 	sbc	a, #0x80
   7DF4 30 0B         [12]  551 	jr	NC,00101$
   7DF6 7B            [ 4]  552 	ld	a, e
   7DF7 D6 0E         [ 7]  553 	sub	a, #0x0e
   7DF9 7A            [ 4]  554 	ld	a, d
   7DFA 17            [ 4]  555 	rla
   7DFB 3F            [ 4]  556 	ccf
   7DFC 1F            [ 4]  557 	rra
   7DFD DE 80         [ 7]  558 	sbc	a, #0x80
   7DFF 38 05         [12]  559 	jr	C,00102$
   7E01                     560 00101$:
                            561 ;src/blocks.c:174: return BOUNCE_NONE;
   7E01 21 00 00      [10]  562 	ld	hl, #0x0000
   7E04 18 1D         [12]  563 	jr	00106$
   7E06                     564 00102$:
                            565 ;src/blocks.c:177: meta = &block_meta[mx][my];
   7E06 69            [ 4]  566 	ld	l, c
   7E07 60            [ 4]  567 	ld	h, b
   7E08 29            [11]  568 	add	hl, hl
   7E09 29            [11]  569 	add	hl, hl
   7E0A 09            [11]  570 	add	hl, bc
   7E0B 29            [11]  571 	add	hl, hl
   7E0C 29            [11]  572 	add	hl, hl
   7E0D 09            [11]  573 	add	hl, bc
   7E0E 29            [11]  574 	add	hl, hl
   7E0F 29            [11]  575 	add	hl, hl
   7E10 01 FC 8E      [10]  576 	ld	bc,#_block_meta
   7E13 09            [11]  577 	add	hl,bc
   7E14 4D            [ 4]  578 	ld	c, l
   7E15 44            [ 4]  579 	ld	b, h
   7E16 6B            [ 4]  580 	ld	l, e
   7E17 62            [ 4]  581 	ld	h, d
   7E18 29            [11]  582 	add	hl, hl
   7E19 19            [11]  583 	add	hl, de
   7E1A 29            [11]  584 	add	hl, hl
   7E1B 09            [11]  585 	add	hl, bc
                            586 ;src/blocks.c:178: if (meta->is_active)
   7E1C 7E            [ 7]  587 	ld	a, (hl)
   7E1D B7            [ 4]  588 	or	a, a
                            589 ;src/blocks.c:180: return meta;
   7E1E 20 03         [12]  590 	jr	NZ,00106$
                            591 ;src/blocks.c:182: return NULL;
   7E20 21 00 00      [10]  592 	ld	hl, #0x0000
   7E23                     593 00106$:
   7E23 DD E1         [14]  594 	pop	ix
   7E25 C9            [10]  595 	ret
                            596 ;src/blocks.c:185: void draw_current_blocks()
                            597 ;	---------------------------------
                            598 ; Function draw_current_blocks
                            599 ; ---------------------------------
   7E26                     600 _draw_current_blocks::
   7E26 DD E5         [15]  601 	push	ix
   7E28 DD 21 00 00   [14]  602 	ld	ix,#0
   7E2C DD 39         [15]  603 	add	ix,sp
   7E2E F5            [11]  604 	push	af
   7E2F 3B            [ 6]  605 	dec	sp
                            606 ;src/blocks.c:187: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(0),
   7E30 21 0C 18      [10]  607 	ld	hl, #0x180c
   7E33 E5            [11]  608 	push	hl
   7E34 21 00 C0      [10]  609 	ld	hl, #0xc000
   7E37 E5            [11]  610 	push	hl
   7E38 CD FF 8D      [17]  611 	call	_cpct_getScreenPtr
   7E3B EB            [ 4]  612 	ex	de,hl
                            613 ;src/blocks.c:189: for (u8 y = 0; y < BLOCKS_MAP_H / 2; y++)
   7E3C 0E 00         [ 7]  614 	ld	c, #0x00
   7E3E                     615 00109$:
                            616 ;src/blocks.c:191: for (u8 x = 0; x < BLOCKS_MAP_W / 2; x++)
   7E3E 79            [ 4]  617 	ld	a,c
   7E3F FE 0E         [ 7]  618 	cp	a,#0x0e
   7E41 30 66         [12]  619 	jr	NC,00111$
   7E43 87            [ 4]  620 	add	a, a
   7E44 DD 77 FD      [19]  621 	ld	-3 (ix), a
   7E47 79            [ 4]  622 	ld	a, c
   7E48 87            [ 4]  623 	add	a, a
   7E49 81            [ 4]  624 	add	a, c
   7E4A 87            [ 4]  625 	add	a, a
   7E4B DD 77 FE      [19]  626 	ld	-2 (ix), a
   7E4E 06 00         [ 7]  627 	ld	b, #0x00
   7E50                     628 00106$:
   7E50 78            [ 4]  629 	ld	a, b
   7E51 D6 0D         [ 7]  630 	sub	a, #0x0d
   7E53 30 51         [12]  631 	jr	NC,00110$
                            632 ;src/blocks.c:193: BlockMeta *meta = &block_meta[x][y];
   7E55 D5            [11]  633 	push	de
   7E56 58            [ 4]  634 	ld	e,b
   7E57 16 00         [ 7]  635 	ld	d,#0x00
   7E59 6B            [ 4]  636 	ld	l, e
   7E5A 62            [ 4]  637 	ld	h, d
   7E5B 29            [11]  638 	add	hl, hl
   7E5C 29            [11]  639 	add	hl, hl
   7E5D 19            [11]  640 	add	hl, de
   7E5E 29            [11]  641 	add	hl, hl
   7E5F 29            [11]  642 	add	hl, hl
   7E60 19            [11]  643 	add	hl, de
   7E61 29            [11]  644 	add	hl, hl
   7E62 29            [11]  645 	add	hl, hl
   7E63 D1            [10]  646 	pop	de
   7E64 3E FC         [ 7]  647 	ld	a, #<(_block_meta)
   7E66 85            [ 4]  648 	add	a, l
   7E67 6F            [ 4]  649 	ld	l, a
   7E68 3E 8E         [ 7]  650 	ld	a, #>(_block_meta)
   7E6A 8C            [ 4]  651 	adc	a, h
   7E6B 67            [ 4]  652 	ld	h, a
   7E6C 7D            [ 4]  653 	ld	a, l
   7E6D DD 86 FE      [19]  654 	add	a, -2 (ix)
   7E70 6F            [ 4]  655 	ld	l, a
   7E71 7C            [ 4]  656 	ld	a, h
   7E72 CE 00         [ 7]  657 	adc	a, #0x00
   7E74 67            [ 4]  658 	ld	h, a
                            659 ;src/blocks.c:195: if (meta->is_active)
   7E75 7E            [ 7]  660 	ld	a, (hl)
   7E76 B7            [ 4]  661 	or	a, a
   7E77 28 2A         [12]  662 	jr	Z,00107$
                            663 ;src/blocks.c:198: current_level->blocks_tilemap);
   7E79 2A 4F 93      [16]  664 	ld	hl, (_current_level)
   7E7C 23            [ 6]  665 	inc	hl
   7E7D 23            [ 6]  666 	inc	hl
   7E7E 7E            [ 7]  667 	ld	a, (hl)
   7E7F 23            [ 6]  668 	inc	hl
   7E80 66            [ 7]  669 	ld	h, (hl)
   7E81 6F            [ 4]  670 	ld	l, a
                            671 ;src/blocks.c:197: cpct_etm_drawTileBox2x4(x * 2, y * 2, 2, 2, BLOCKS_MAP_W, pvmem,
   7E82 D5            [11]  672 	push	de
   7E83 FD E1         [14]  673 	pop	iy
   7E85 78            [ 4]  674 	ld	a, b
   7E86 87            [ 4]  675 	add	a, a
   7E87 DD 77 FF      [19]  676 	ld	-1 (ix), a
   7E8A C5            [11]  677 	push	bc
   7E8B D5            [11]  678 	push	de
   7E8C E5            [11]  679 	push	hl
   7E8D FD E5         [15]  680 	push	iy
   7E8F 21 02 1A      [10]  681 	ld	hl, #0x1a02
   7E92 E5            [11]  682 	push	hl
   7E93 3E 02         [ 7]  683 	ld	a, #0x02
   7E95 F5            [11]  684 	push	af
   7E96 33            [ 6]  685 	inc	sp
   7E97 DD 66 FD      [19]  686 	ld	h, -3 (ix)
   7E9A DD 6E FF      [19]  687 	ld	l, -1 (ix)
   7E9D E5            [11]  688 	push	hl
   7E9E CD 39 8B      [17]  689 	call	_cpct_etm_drawTileBox2x4
   7EA1 D1            [10]  690 	pop	de
   7EA2 C1            [10]  691 	pop	bc
   7EA3                     692 00107$:
                            693 ;src/blocks.c:191: for (u8 x = 0; x < BLOCKS_MAP_W / 2; x++)
   7EA3 04            [ 4]  694 	inc	b
   7EA4 18 AA         [12]  695 	jr	00106$
   7EA6                     696 00110$:
                            697 ;src/blocks.c:189: for (u8 y = 0; y < BLOCKS_MAP_H / 2; y++)
   7EA6 0C            [ 4]  698 	inc	c
   7EA7 18 95         [12]  699 	jr	00109$
   7EA9                     700 00111$:
   7EA9 DD F9         [10]  701 	ld	sp, ix
   7EAB DD E1         [14]  702 	pop	ix
   7EAD C9            [10]  703 	ret
                            704 ;src/blocks.c:207: void map_blocks_to_meta()
                            705 ;	---------------------------------
                            706 ; Function map_blocks_to_meta
                            707 ; ---------------------------------
   7EAE                     708 _map_blocks_to_meta::
   7EAE DD E5         [15]  709 	push	ix
   7EB0 DD 21 00 00   [14]  710 	ld	ix,#0
   7EB4 DD 39         [15]  711 	add	ix,sp
   7EB6 F5            [11]  712 	push	af
   7EB7 F5            [11]  713 	push	af
   7EB8 3B            [ 6]  714 	dec	sp
                            715 ;src/blocks.c:209: blocks_remaining = 0;
   7EB9 21 00 00      [10]  716 	ld	hl, #0x0000
   7EBC 22 40 93      [16]  717 	ld	(_blocks_remaining), hl
                            718 ;src/blocks.c:211: for (u8 y = 0; y < BLOCKS_MAP_H; y += 2)
   7EBF DD 36 FC 00   [19]  719 	ld	-4 (ix), #0x00
   7EC3                     720 00119$:
   7EC3 DD 7E FC      [19]  721 	ld	a, -4 (ix)
   7EC6 D6 1C         [ 7]  722 	sub	a, #0x1c
   7EC8 D2 7A 80      [10]  723 	jp	NC, 00121$
                            724 ;src/blocks.c:213: for (u8 x = 0; x < BLOCKS_MAP_W; x += 2)
   7ECB DD 4E FC      [19]  725 	ld	c,-4 (ix)
   7ECE 06 00         [ 7]  726 	ld	b,#0x00
   7ED0 69            [ 4]  727 	ld	l, c
   7ED1 60            [ 4]  728 	ld	h, b
   7ED2 29            [11]  729 	add	hl, hl
   7ED3 09            [11]  730 	add	hl, bc
   7ED4 29            [11]  731 	add	hl, hl
   7ED5 29            [11]  732 	add	hl, hl
   7ED6 09            [11]  733 	add	hl, bc
   7ED7 29            [11]  734 	add	hl, hl
   7ED8 DD 75 FD      [19]  735 	ld	-3 (ix), l
   7EDB DD 74 FE      [19]  736 	ld	-2 (ix), h
   7EDE DD 4E FC      [19]  737 	ld	c, -4 (ix)
   7EE1 CB 39         [ 8]  738 	srl	c
   7EE3 79            [ 4]  739 	ld	a, c
   7EE4 87            [ 4]  740 	add	a, a
   7EE5 81            [ 4]  741 	add	a, c
   7EE6 87            [ 4]  742 	add	a, a
   7EE7 DD 77 FF      [19]  743 	ld	-1 (ix), a
   7EEA DD 36 FB 00   [19]  744 	ld	-5 (ix), #0x00
   7EEE                     745 00116$:
   7EEE DD 7E FB      [19]  746 	ld	a, -5 (ix)
   7EF1 D6 1A         [ 7]  747 	sub	a, #0x1a
   7EF3 D2 71 80      [10]  748 	jp	NC, 00120$
                            749 ;src/blocks.c:215: u8 tile = current_level->blocks_tilemap[(y * BLOCKS_MAP_W) + x];
   7EF6 2A 4F 93      [16]  750 	ld	hl, (_current_level)
   7EF9 23            [ 6]  751 	inc	hl
   7EFA 23            [ 6]  752 	inc	hl
   7EFB 4E            [ 7]  753 	ld	c, (hl)
   7EFC 23            [ 6]  754 	inc	hl
   7EFD 46            [ 7]  755 	ld	b, (hl)
   7EFE DD 5E FB      [19]  756 	ld	e, -5 (ix)
   7F01 16 00         [ 7]  757 	ld	d, #0x00
   7F03 DD 6E FD      [19]  758 	ld	l,-3 (ix)
   7F06 DD 66 FE      [19]  759 	ld	h,-2 (ix)
   7F09 19            [11]  760 	add	hl, de
   7F0A 09            [11]  761 	add	hl, bc
   7F0B 7E            [ 7]  762 	ld	a, (hl)
                            763 ;src/blocks.c:216: switch (tile)
   7F0C B7            [ 4]  764 	or	a, a
   7F0D 28 2C         [12]  765 	jr	Z,00101$
   7F0F FE 02         [ 7]  766 	cp	a, #0x02
   7F11 28 3F         [12]  767 	jr	Z,00102$
   7F13 FE 04         [ 7]  768 	cp	a, #0x04
   7F15 28 53         [12]  769 	jr	Z,00103$
   7F17 FE 06         [ 7]  770 	cp	a, #0x06
   7F19 28 67         [12]  771 	jr	Z,00104$
   7F1B FE 08         [ 7]  772 	cp	a, #0x08
   7F1D 28 7B         [12]  773 	jr	Z,00105$
   7F1F FE 0A         [ 7]  774 	cp	a, #0x0a
   7F21 CA B2 7F      [10]  775 	jp	Z,00106$
   7F24 FE 0C         [ 7]  776 	cp	a, #0x0c
   7F26 CA CA 7F      [10]  777 	jp	Z,00107$
   7F29 FE 0E         [ 7]  778 	cp	a, #0x0e
   7F2B CA E2 7F      [10]  779 	jp	Z,00108$
   7F2E FE 10         [ 7]  780 	cp	a, #0x10
   7F30 CA F9 7F      [10]  781 	jp	Z,00109$
   7F33 D6 12         [ 7]  782 	sub	a, #0x12
   7F35 CA 1C 80      [10]  783 	jp	Z,00110$
   7F38 C3 33 80      [10]  784 	jp	00111$
                            785 ;src/blocks.c:218: case WHITE_BLOCK:
   7F3B                     786 00101$:
                            787 ;src/blocks.c:219: plant_tile_meta(x, y, WHITE_BLOCK, WHITE_SCORE, SINGLE_HIT_TO_REMOVE);
   7F3B 21 05 01      [10]  788 	ld	hl, #0x0105
   7F3E E5            [11]  789 	push	hl
   7F3F AF            [ 4]  790 	xor	a, a
   7F40 F5            [11]  791 	push	af
   7F41 33            [ 6]  792 	inc	sp
   7F42 DD 66 FC      [19]  793 	ld	h, -4 (ix)
   7F45 DD 6E FB      [19]  794 	ld	l, -5 (ix)
   7F48 E5            [11]  795 	push	hl
   7F49 CD 7F 80      [17]  796 	call	_plant_tile_meta
   7F4C F1            [10]  797 	pop	af
   7F4D F1            [10]  798 	pop	af
   7F4E 33            [ 6]  799 	inc	sp
                            800 ;src/blocks.c:220: break;
   7F4F C3 68 80      [10]  801 	jp	00117$
                            802 ;src/blocks.c:221: case ORANGE_BLOCK:
   7F52                     803 00102$:
                            804 ;src/blocks.c:222: plant_tile_meta(x, y, ORANGE_BLOCK, ORANGE_SCORE, SINGLE_HIT_TO_REMOVE);
   7F52 21 06 01      [10]  805 	ld	hl, #0x0106
   7F55 E5            [11]  806 	push	hl
   7F56 3E 02         [ 7]  807 	ld	a, #0x02
   7F58 F5            [11]  808 	push	af
   7F59 33            [ 6]  809 	inc	sp
   7F5A DD 66 FC      [19]  810 	ld	h, -4 (ix)
   7F5D DD 6E FB      [19]  811 	ld	l, -5 (ix)
   7F60 E5            [11]  812 	push	hl
   7F61 CD 7F 80      [17]  813 	call	_plant_tile_meta
   7F64 F1            [10]  814 	pop	af
   7F65 F1            [10]  815 	pop	af
   7F66 33            [ 6]  816 	inc	sp
                            817 ;src/blocks.c:223: break;
   7F67 C3 68 80      [10]  818 	jp	00117$
                            819 ;src/blocks.c:224: case CYAN_BLOCK:
   7F6A                     820 00103$:
                            821 ;src/blocks.c:225: plant_tile_meta(x, y, CYAN_BLOCK, CYAN_SCORE, SINGLE_HIT_TO_REMOVE);
   7F6A 21 07 01      [10]  822 	ld	hl, #0x0107
   7F6D E5            [11]  823 	push	hl
   7F6E 3E 04         [ 7]  824 	ld	a, #0x04
   7F70 F5            [11]  825 	push	af
   7F71 33            [ 6]  826 	inc	sp
   7F72 DD 66 FC      [19]  827 	ld	h, -4 (ix)
   7F75 DD 6E FB      [19]  828 	ld	l, -5 (ix)
   7F78 E5            [11]  829 	push	hl
   7F79 CD 7F 80      [17]  830 	call	_plant_tile_meta
   7F7C F1            [10]  831 	pop	af
   7F7D F1            [10]  832 	pop	af
   7F7E 33            [ 6]  833 	inc	sp
                            834 ;src/blocks.c:226: break;
   7F7F C3 68 80      [10]  835 	jp	00117$
                            836 ;src/blocks.c:227: case GREEN_BLOCK:
   7F82                     837 00104$:
                            838 ;src/blocks.c:228: plant_tile_meta(x, y, GREEN_BLOCK, GREEN_SCORE, SINGLE_HIT_TO_REMOVE);
   7F82 21 08 01      [10]  839 	ld	hl, #0x0108
   7F85 E5            [11]  840 	push	hl
   7F86 3E 06         [ 7]  841 	ld	a, #0x06
   7F88 F5            [11]  842 	push	af
   7F89 33            [ 6]  843 	inc	sp
   7F8A DD 66 FC      [19]  844 	ld	h, -4 (ix)
   7F8D DD 6E FB      [19]  845 	ld	l, -5 (ix)
   7F90 E5            [11]  846 	push	hl
   7F91 CD 7F 80      [17]  847 	call	_plant_tile_meta
   7F94 F1            [10]  848 	pop	af
   7F95 F1            [10]  849 	pop	af
   7F96 33            [ 6]  850 	inc	sp
                            851 ;src/blocks.c:229: break;
   7F97 C3 68 80      [10]  852 	jp	00117$
                            853 ;src/blocks.c:230: case RED_BLOCK:
   7F9A                     854 00105$:
                            855 ;src/blocks.c:231: plant_tile_meta(x, y, RED_BLOCK, RED_SCORE, SINGLE_HIT_TO_REMOVE);
   7F9A 21 09 01      [10]  856 	ld	hl, #0x0109
   7F9D E5            [11]  857 	push	hl
   7F9E 3E 08         [ 7]  858 	ld	a, #0x08
   7FA0 F5            [11]  859 	push	af
   7FA1 33            [ 6]  860 	inc	sp
   7FA2 DD 66 FC      [19]  861 	ld	h, -4 (ix)
   7FA5 DD 6E FB      [19]  862 	ld	l, -5 (ix)
   7FA8 E5            [11]  863 	push	hl
   7FA9 CD 7F 80      [17]  864 	call	_plant_tile_meta
   7FAC F1            [10]  865 	pop	af
   7FAD F1            [10]  866 	pop	af
   7FAE 33            [ 6]  867 	inc	sp
                            868 ;src/blocks.c:232: break;
   7FAF C3 68 80      [10]  869 	jp	00117$
                            870 ;src/blocks.c:233: case BLUE_BLOCK:
   7FB2                     871 00106$:
                            872 ;src/blocks.c:234: plant_tile_meta(x, y, BLUE_BLOCK, BLUE_SCORE, SINGLE_HIT_TO_REMOVE);
   7FB2 21 0A 01      [10]  873 	ld	hl, #0x010a
   7FB5 E5            [11]  874 	push	hl
   7FB6 3E 0A         [ 7]  875 	ld	a, #0x0a
   7FB8 F5            [11]  876 	push	af
   7FB9 33            [ 6]  877 	inc	sp
   7FBA DD 66 FC      [19]  878 	ld	h, -4 (ix)
   7FBD DD 6E FB      [19]  879 	ld	l, -5 (ix)
   7FC0 E5            [11]  880 	push	hl
   7FC1 CD 7F 80      [17]  881 	call	_plant_tile_meta
   7FC4 F1            [10]  882 	pop	af
   7FC5 F1            [10]  883 	pop	af
   7FC6 33            [ 6]  884 	inc	sp
                            885 ;src/blocks.c:235: break;
   7FC7 C3 68 80      [10]  886 	jp	00117$
                            887 ;src/blocks.c:236: case MAGENTA_BLOCK:
   7FCA                     888 00107$:
                            889 ;src/blocks.c:237: plant_tile_meta(x, y, MAGENTA_BLOCK, MAGENTA_SCORE, SINGLE_HIT_TO_REMOVE);
   7FCA 21 0B 01      [10]  890 	ld	hl, #0x010b
   7FCD E5            [11]  891 	push	hl
   7FCE 3E 0C         [ 7]  892 	ld	a, #0x0c
   7FD0 F5            [11]  893 	push	af
   7FD1 33            [ 6]  894 	inc	sp
   7FD2 DD 66 FC      [19]  895 	ld	h, -4 (ix)
   7FD5 DD 6E FB      [19]  896 	ld	l, -5 (ix)
   7FD8 E5            [11]  897 	push	hl
   7FD9 CD 7F 80      [17]  898 	call	_plant_tile_meta
   7FDC F1            [10]  899 	pop	af
   7FDD F1            [10]  900 	pop	af
   7FDE 33            [ 6]  901 	inc	sp
                            902 ;src/blocks.c:238: break;
   7FDF C3 68 80      [10]  903 	jp	00117$
                            904 ;src/blocks.c:239: case YELLOW_BLOCK:
   7FE2                     905 00108$:
                            906 ;src/blocks.c:240: plant_tile_meta(x, y, YELLOW_BLOCK, YELLOW_SCORE, SINGLE_HIT_TO_REMOVE);
   7FE2 21 0C 01      [10]  907 	ld	hl, #0x010c
   7FE5 E5            [11]  908 	push	hl
   7FE6 3E 0E         [ 7]  909 	ld	a, #0x0e
   7FE8 F5            [11]  910 	push	af
   7FE9 33            [ 6]  911 	inc	sp
   7FEA DD 66 FC      [19]  912 	ld	h, -4 (ix)
   7FED DD 6E FB      [19]  913 	ld	l, -5 (ix)
   7FF0 E5            [11]  914 	push	hl
   7FF1 CD 7F 80      [17]  915 	call	_plant_tile_meta
   7FF4 F1            [10]  916 	pop	af
   7FF5 F1            [10]  917 	pop	af
   7FF6 33            [ 6]  918 	inc	sp
                            919 ;src/blocks.c:241: break;
   7FF7 18 6F         [12]  920 	jr	00117$
                            921 ;src/blocks.c:242: case STEEL_BLOCK:
   7FF9                     922 00109$:
                            923 ;src/blocks.c:245: current_level->steel_hits_to_destroy);
   7FF9 2A 4F 93      [16]  924 	ld	hl, (_current_level)
   7FFC 11 05 00      [10]  925 	ld	de, #0x0005
   7FFF 19            [11]  926 	add	hl, de
   8000 56            [ 7]  927 	ld	d, (hl)
                            928 ;src/blocks.c:244: current_level->steel_score, 
   8001 FD 2A 4F 93   [20]  929 	ld	iy, (_current_level)
                            930 ;src/blocks.c:243: plant_tile_meta(x, y, STEEL_BLOCK, 
   8005 FD 5E 04      [19]  931 	ld	e, 4 (iy)
   8008 D5            [11]  932 	push	de
   8009 3E 10         [ 7]  933 	ld	a, #0x10
   800B F5            [11]  934 	push	af
   800C 33            [ 6]  935 	inc	sp
   800D DD 66 FC      [19]  936 	ld	h, -4 (ix)
   8010 DD 6E FB      [19]  937 	ld	l, -5 (ix)
   8013 E5            [11]  938 	push	hl
   8014 CD 7F 80      [17]  939 	call	_plant_tile_meta
   8017 F1            [10]  940 	pop	af
   8018 F1            [10]  941 	pop	af
   8019 33            [ 6]  942 	inc	sp
                            943 ;src/blocks.c:246: break;
   801A 18 4C         [12]  944 	jr	00117$
                            945 ;src/blocks.c:247: case GOLD_BLOCK:
   801C                     946 00110$:
                            947 ;src/blocks.c:248: plant_tile_meta(x, y, GOLD_BLOCK, 0, INDESTRUCTABLE);
   801C 21 00 FF      [10]  948 	ld	hl, #0xff00
   801F E5            [11]  949 	push	hl
   8020 3E 12         [ 7]  950 	ld	a, #0x12
   8022 F5            [11]  951 	push	af
   8023 33            [ 6]  952 	inc	sp
   8024 DD 66 FC      [19]  953 	ld	h, -4 (ix)
   8027 DD 6E FB      [19]  954 	ld	l, -5 (ix)
   802A E5            [11]  955 	push	hl
   802B CD 7F 80      [17]  956 	call	_plant_tile_meta
   802E F1            [10]  957 	pop	af
   802F F1            [10]  958 	pop	af
   8030 33            [ 6]  959 	inc	sp
                            960 ;src/blocks.c:249: break;
   8031 18 35         [12]  961 	jr	00117$
                            962 ;src/blocks.c:250: default:
   8033                     963 00111$:
                            964 ;src/blocks.c:252: block_meta[x / 2][y / 2].is_active = 0;
   8033 DD 4E FB      [19]  965 	ld	c, -5 (ix)
   8036 CB 39         [ 8]  966 	srl	c
   8038 06 00         [ 7]  967 	ld	b,#0x00
   803A 69            [ 4]  968 	ld	l, c
   803B 60            [ 4]  969 	ld	h, b
   803C 29            [11]  970 	add	hl, hl
   803D 29            [11]  971 	add	hl, hl
   803E 09            [11]  972 	add	hl, bc
   803F 29            [11]  973 	add	hl, hl
   8040 29            [11]  974 	add	hl, hl
   8041 09            [11]  975 	add	hl, bc
   8042 29            [11]  976 	add	hl, hl
   8043 29            [11]  977 	add	hl, hl
   8044 01 FC 8E      [10]  978 	ld	bc,#_block_meta
   8047 09            [11]  979 	add	hl,bc
   8048 4D            [ 4]  980 	ld	c, l
   8049 44            [ 4]  981 	ld	b, h
   804A DD 6E FF      [19]  982 	ld	l,-1 (ix)
   804D 26 00         [ 7]  983 	ld	h,#0x00
   804F 09            [11]  984 	add	hl, bc
   8050 36 00         [10]  985 	ld	(hl), #0x00
                            986 ;src/blocks.c:253: block_meta[x / 2][y / 2].score = 0;
   8052 DD 7E FF      [19]  987 	ld	a, -1 (ix)
   8055 81            [ 4]  988 	add	a, c
   8056 4F            [ 4]  989 	ld	c, a
   8057 3E 00         [ 7]  990 	ld	a, #0x00
   8059 88            [ 4]  991 	adc	a, b
   805A 47            [ 4]  992 	ld	b, a
   805B 59            [ 4]  993 	ld	e, c
   805C 50            [ 4]  994 	ld	d, b
   805D 13            [ 6]  995 	inc	de
   805E 13            [ 6]  996 	inc	de
   805F AF            [ 4]  997 	xor	a, a
   8060 12            [ 7]  998 	ld	(de), a
                            999 ;src/blocks.c:254: block_meta[x / 2][y / 2].remaining_hits = 0;
   8061 03            [ 6] 1000 	inc	bc
   8062 03            [ 6] 1001 	inc	bc
   8063 03            [ 6] 1002 	inc	bc
   8064 60            [ 4] 1003 	ld	h, b
   8065 69            [ 4] 1004 	ld	l, c
   8066 36 00         [10] 1005 	ld	(hl), #0x00
                           1006 ;src/blocks.c:257: }
   8068                    1007 00117$:
                           1008 ;src/blocks.c:213: for (u8 x = 0; x < BLOCKS_MAP_W; x += 2)
   8068 DD 34 FB      [23] 1009 	inc	-5 (ix)
   806B DD 34 FB      [23] 1010 	inc	-5 (ix)
   806E C3 EE 7E      [10] 1011 	jp	00116$
   8071                    1012 00120$:
                           1013 ;src/blocks.c:211: for (u8 y = 0; y < BLOCKS_MAP_H; y += 2)
   8071 DD 34 FC      [23] 1014 	inc	-4 (ix)
   8074 DD 34 FC      [23] 1015 	inc	-4 (ix)
   8077 C3 C3 7E      [10] 1016 	jp	00119$
   807A                    1017 00121$:
   807A DD F9         [10] 1018 	ld	sp, ix
   807C DD E1         [14] 1019 	pop	ix
   807E C9            [10] 1020 	ret
                           1021 ;src/blocks.c:262: void plant_tile_meta(u8 map_x, u8 map_y, u8 tile_type, u8 score, u8 hits_to_destroy)
                           1022 ;	---------------------------------
                           1023 ; Function plant_tile_meta
                           1024 ; ---------------------------------
   807F                    1025 _plant_tile_meta::
   807F DD E5         [15] 1026 	push	ix
   8081 DD 21 00 00   [14] 1027 	ld	ix,#0
   8085 DD 39         [15] 1028 	add	ix,sp
                           1029 ;src/blocks.c:264: if (hits_to_destroy != INDESTRUCTABLE) {
   8087 DD 7E 08      [19] 1030 	ld	a, 8 (ix)
   808A 3C            [ 4] 1031 	inc	a
   808B 28 0C         [12] 1032 	jr	Z,00102$
                           1033 ;src/blocks.c:265: blocks_remaining += 1;
   808D FD 21 40 93   [14] 1034 	ld	iy, #_blocks_remaining
   8091 FD 34 00      [23] 1035 	inc	0 (iy)
   8094 20 03         [12] 1036 	jr	NZ,00110$
   8096 FD 34 01      [23] 1037 	inc	1 (iy)
   8099                    1038 00110$:
   8099                    1039 00102$:
                           1040 ;src/blocks.c:268: block_meta[map_x / 2][map_y / 2].is_active = 1;
   8099 01 FC 8E      [10] 1041 	ld	bc, #_block_meta+0
   809C DD 5E 04      [19] 1042 	ld	e, 4 (ix)
   809F CB 3B         [ 8] 1043 	srl	e
   80A1 16 00         [ 7] 1044 	ld	d,#0x00
   80A3 6B            [ 4] 1045 	ld	l, e
   80A4 62            [ 4] 1046 	ld	h, d
   80A5 29            [11] 1047 	add	hl, hl
   80A6 29            [11] 1048 	add	hl, hl
   80A7 19            [11] 1049 	add	hl, de
   80A8 29            [11] 1050 	add	hl, hl
   80A9 29            [11] 1051 	add	hl, hl
   80AA 19            [11] 1052 	add	hl, de
   80AB 29            [11] 1053 	add	hl, hl
   80AC 29            [11] 1054 	add	hl, hl
   80AD 09            [11] 1055 	add	hl,bc
   80AE 4D            [ 4] 1056 	ld	c, l
   80AF 44            [ 4] 1057 	ld	b, h
   80B0 DD 5E 05      [19] 1058 	ld	e, 5 (ix)
   80B3 CB 3B         [ 8] 1059 	srl	e
   80B5 6B            [ 4] 1060 	ld	l, e
   80B6 29            [11] 1061 	add	hl, hl
   80B7 19            [11] 1062 	add	hl, de
   80B8 29            [11] 1063 	add	hl, hl
   80B9 7D            [ 4] 1064 	ld	a, l
   80BA 81            [ 4] 1065 	add	a, c
   80BB 4F            [ 4] 1066 	ld	c, a
   80BC 3E 00         [ 7] 1067 	ld	a, #0x00
   80BE 88            [ 4] 1068 	adc	a, b
   80BF 47            [ 4] 1069 	ld	b, a
   80C0 3E 01         [ 7] 1070 	ld	a, #0x01
   80C2 02            [ 7] 1071 	ld	(bc), a
                           1072 ;src/blocks.c:269: block_meta[map_x / 2][map_y / 2].score = score;
   80C3 59            [ 4] 1073 	ld	e, c
   80C4 50            [ 4] 1074 	ld	d, b
   80C5 13            [ 6] 1075 	inc	de
   80C6 13            [ 6] 1076 	inc	de
   80C7 DD 7E 07      [19] 1077 	ld	a, 7 (ix)
   80CA 12            [ 7] 1078 	ld	(de), a
                           1079 ;src/blocks.c:270: block_meta[map_x / 2][map_y / 2].remaining_hits = hits_to_destroy;
   80CB 59            [ 4] 1080 	ld	e, c
   80CC 50            [ 4] 1081 	ld	d, b
   80CD 13            [ 6] 1082 	inc	de
   80CE 13            [ 6] 1083 	inc	de
   80CF 13            [ 6] 1084 	inc	de
   80D0 DD 7E 08      [19] 1085 	ld	a, 8 (ix)
   80D3 12            [ 7] 1086 	ld	(de), a
                           1087 ;src/blocks.c:271: block_meta[map_x / 2][map_y / 2].type = tile_type;
   80D4 59            [ 4] 1088 	ld	e, c
   80D5 50            [ 4] 1089 	ld	d, b
   80D6 13            [ 6] 1090 	inc	de
   80D7 DD 7E 06      [19] 1091 	ld	a, 6 (ix)
   80DA 12            [ 7] 1092 	ld	(de), a
                           1093 ;src/blocks.c:272: block_meta[map_x / 2][map_y / 2].block_tile_x = map_x;
   80DB 21 04 00      [10] 1094 	ld	hl, #0x0004
   80DE 09            [11] 1095 	add	hl, bc
   80DF DD 7E 04      [19] 1096 	ld	a, 4 (ix)
   80E2 77            [ 7] 1097 	ld	(hl), a
                           1098 ;src/blocks.c:273: block_meta[map_x / 2][map_y / 2].block_tile_y = map_y;
   80E3 21 05 00      [10] 1099 	ld	hl, #0x0005
   80E6 09            [11] 1100 	add	hl, bc
   80E7 DD 7E 05      [19] 1101 	ld	a, 5 (ix)
   80EA 77            [ 7] 1102 	ld	(hl), a
   80EB DD E1         [14] 1103 	pop	ix
   80ED C9            [10] 1104 	ret
                           1105 	.area _CODE
                           1106 	.area _INITIALIZER
                           1107 	.area _CABS (ABS)
