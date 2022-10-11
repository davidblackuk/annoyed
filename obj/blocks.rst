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
                             11 	.globl _dbg_displayNumber
                             12 	.globl _cpct_etm_drawTilemap2x4_f
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _cpct_drawSolidBox
                             15 	.globl _block_meta
                             16 	.globl _max_y
                             17 	.globl _max_x
                             18 	.globl _min_y
                             19 	.globl _min_x
                             20 	.globl _p_block_v_mem
                             21 	.globl _blocks_initialize
                             22 	.globl _blocks_draw
                             23 	.globl _blocks_restore_background
                             24 	.globl _blocks_intersect_ball
                             25 	.globl _map_tiles_to_meta
                             26 	.globl _plant_tile_meta
                             27 ;--------------------------------------------------------
                             28 ; special function registers
                             29 ;--------------------------------------------------------
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _DATA
   726F                      34 _p_block_v_mem::
   726F                      35 	.ds 2
   7271                      36 _min_x::
   7271                      37 	.ds 1
   7272                      38 _min_y::
   7272                      39 	.ds 1
   7273                      40 _max_x::
   7273                      41 	.ds 1
   7274                      42 _max_y::
   7274                      43 	.ds 1
   7275                      44 _block_meta::
   7275                      45 	.ds 728
                             46 ;--------------------------------------------------------
                             47 ; ram data
                             48 ;--------------------------------------------------------
                             49 	.area _INITIALIZED
                             50 ;--------------------------------------------------------
                             51 ; absolute external ram data
                             52 ;--------------------------------------------------------
                             53 	.area _DABS (ABS)
                             54 ;--------------------------------------------------------
                             55 ; global & static initialisations
                             56 ;--------------------------------------------------------
                             57 	.area _HOME
                             58 	.area _GSINIT
                             59 	.area _GSFINAL
                             60 	.area _GSINIT
                             61 ;--------------------------------------------------------
                             62 ; Home
                             63 ;--------------------------------------------------------
                             64 	.area _HOME
                             65 	.area _HOME
                             66 ;--------------------------------------------------------
                             67 ; code
                             68 ;--------------------------------------------------------
                             69 	.area _CODE
                             70 ;src/blocks.c:31: void blocks_initialize()
                             71 ;	---------------------------------
                             72 ; Function blocks_initialize
                             73 ; ---------------------------------
   6581                      74 _blocks_initialize::
                             75 ;src/blocks.c:33: p_block_v_mem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X + 2 * TILE_W, TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y);
   6581 21 0C 18      [10]   76 	ld	hl, #0x180c
   6584 E5            [11]   77 	push	hl
   6585 21 00 C0      [10]   78 	ld	hl, #0xc000
   6588 E5            [11]   79 	push	hl
   6589 CD A7 71      [17]   80 	call	_cpct_getScreenPtr
   658C 22 6F 72      [16]   81 	ld	(_p_block_v_mem), hl
                             82 ;src/blocks.c:34: cpct_etm_drawTilemap2x4_f(g_tilemap_l01_blocks_W, g_tilemap_l01_blocks_H, p_block_v_mem, current_level->blocks_tilemap);
   658F 2A 56 75      [16]   83 	ld	hl, (_current_level)
   6592 23            [ 6]   84 	inc	hl
   6593 23            [ 6]   85 	inc	hl
   6594 4E            [ 7]   86 	ld	c, (hl)
   6595 23            [ 6]   87 	inc	hl
   6596 46            [ 7]   88 	ld	b, (hl)
   6597 2A 6F 72      [16]   89 	ld	hl, (_p_block_v_mem)
   659A C5            [11]   90 	push	bc
   659B E5            [11]   91 	push	hl
   659C 21 1A 1C      [10]   92 	ld	hl, #0x1c1a
   659F E5            [11]   93 	push	hl
   65A0 CD 18 70      [17]   94 	call	_cpct_etm_drawTilemap2x4_f
                             95 ;src/blocks.c:37: map_tiles_to_meta();
   65A3 CD A4 67      [17]   96 	call	_map_tiles_to_meta
                             97 ;src/blocks.c:39: min_x = 0xFF;
   65A6 21 71 72      [10]   98 	ld	hl,#_min_x + 0
   65A9 36 FF         [10]   99 	ld	(hl), #0xff
                            100 ;src/blocks.c:40: min_y = 0xFF;
   65AB 21 72 72      [10]  101 	ld	hl,#_min_y + 0
   65AE 36 FF         [10]  102 	ld	(hl), #0xff
                            103 ;src/blocks.c:41: max_x = 0x00;
   65B0 21 73 72      [10]  104 	ld	hl,#_max_x + 0
   65B3 36 00         [10]  105 	ld	(hl), #0x00
                            106 ;src/blocks.c:42: max_y = 0x00;
   65B5 21 74 72      [10]  107 	ld	hl,#_max_y + 0
   65B8 36 00         [10]  108 	ld	(hl), #0x00
   65BA C9            [10]  109 	ret
                            110 ;src/blocks.c:45: void blocks_draw()
                            111 ;	---------------------------------
                            112 ; Function blocks_draw
                            113 ; ---------------------------------
   65BB                     114 _blocks_draw::
                            115 ;src/blocks.c:49: }
   65BB C9            [10]  116 	ret
                            117 ;src/blocks.c:51: void blocks_restore_background()
                            118 ;	---------------------------------
                            119 ; Function blocks_restore_background
                            120 ; ---------------------------------
   65BC                     121 _blocks_restore_background::
                            122 ;src/blocks.c:53: }
   65BC C9            [10]  123 	ret
                            124 ;src/blocks.c:55: void blocks_intersect_ball(Ball *ball)
                            125 ;	---------------------------------
                            126 ; Function blocks_intersect_ball
                            127 ; ---------------------------------
   65BD                     128 _blocks_intersect_ball::
   65BD DD E5         [15]  129 	push	ix
   65BF DD 21 00 00   [14]  130 	ld	ix,#0
   65C3 DD 39         [15]  131 	add	ix,sp
   65C5 21 F4 FF      [10]  132 	ld	hl, #-12
   65C8 39            [11]  133 	add	hl, sp
   65C9 F9            [ 6]  134 	ld	sp, hl
                            135 ;src/blocks.c:59: if ((ball->y + SP_BALL_H < TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y) ||
   65CA DD 7E 04      [19]  136 	ld	a, 4 (ix)
   65CD DD 77 FE      [19]  137 	ld	-2 (ix), a
   65D0 DD 7E 05      [19]  138 	ld	a, 5 (ix)
   65D3 DD 77 FF      [19]  139 	ld	-1 (ix), a
   65D6 DD 6E FE      [19]  140 	ld	l,-2 (ix)
   65D9 DD 66 FF      [19]  141 	ld	h,-1 (ix)
   65DC 23            [ 6]  142 	inc	hl
   65DD 23            [ 6]  143 	inc	hl
   65DE 7E            [ 7]  144 	ld	a, (hl)
   65DF DD 77 F9      [19]  145 	ld	-7 (ix), a
   65E2 4F            [ 4]  146 	ld	c, a
   65E3 06 00         [ 7]  147 	ld	b, #0x00
   65E5 21 06 00      [10]  148 	ld	hl, #0x0006
   65E8 09            [11]  149 	add	hl, bc
   65E9 11 18 80      [10]  150 	ld	de, #0x8018
   65EC 29            [11]  151 	add	hl, hl
   65ED 3F            [ 4]  152 	ccf
   65EE CB 1C         [ 8]  153 	rr	h
   65F0 CB 1D         [ 8]  154 	rr	l
   65F2 ED 52         [15]  155 	sbc	hl, de
   65F4 DA 9F 67      [10]  156 	jp	C,00114$
                            157 ;src/blocks.c:60: (ball->y > TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y + (BLOCKS_MAP_H * TILE_H)))
   65F7 3E 88         [ 7]  158 	ld	a, #0x88
   65F9 DD 96 F9      [19]  159 	sub	a, -7 (ix)
                            160 ;src/blocks.c:62: return;
   65FC DA 9F 67      [10]  161 	jp	C,00114$
                            162 ;src/blocks.c:66: u8 ball_center_x = ball->x + (SP_BALL_W / 2);
   65FF DD 6E FE      [19]  163 	ld	l,-2 (ix)
   6602 DD 66 FF      [19]  164 	ld	h,-1 (ix)
   6605 23            [ 6]  165 	inc	hl
   6606 4E            [ 7]  166 	ld	c, (hl)
   6607 0C            [ 4]  167 	inc	c
                            168 ;src/blocks.c:67: u8 ball_center_y = ball->y + (SP_BALL_W / 2);
   6608 DD 7E F9      [19]  169 	ld	a, -7 (ix)
   660B 3C            [ 4]  170 	inc	a
   660C DD 77 F8      [19]  171 	ld	-8 (ix), a
                            172 ;src/blocks.c:69: u8 tx = (ball_center_x - (TILE_MAP_SCREEN_BYTE_OFFSET_X + 2)) / 4;
   660F 06 00         [ 7]  173 	ld	b, #0x00
   6611 79            [ 4]  174 	ld	a, c
   6612 C6 F6         [ 7]  175 	add	a, #0xf6
   6614 5F            [ 4]  176 	ld	e, a
   6615 78            [ 4]  177 	ld	a, b
   6616 CE FF         [ 7]  178 	adc	a, #0xff
   6618 57            [ 4]  179 	ld	d, a
   6619 6B            [ 4]  180 	ld	l, e
   661A 62            [ 4]  181 	ld	h, d
   661B CB 7A         [ 8]  182 	bit	7, d
   661D 28 04         [12]  183 	jr	Z,00116$
   661F 21 F9 FF      [10]  184 	ld	hl, #0xfff9
   6622 09            [11]  185 	add	hl, bc
   6623                     186 00116$:
   6623 CB 2C         [ 8]  187 	sra	h
   6625 CB 1D         [ 8]  188 	rr	l
   6627 CB 2C         [ 8]  189 	sra	h
   6629 CB 1D         [ 8]  190 	rr	l
   662B DD 75 F7      [19]  191 	ld	-9 (ix), l
                            192 ;src/blocks.c:70: u8 ty = (ball_center_y - (TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y)) / 8;
   662E DD 4E F8      [19]  193 	ld	c, -8 (ix)
   6631 06 00         [ 7]  194 	ld	b, #0x00
   6633 79            [ 4]  195 	ld	a, c
   6634 C6 E8         [ 7]  196 	add	a, #0xe8
   6636 5F            [ 4]  197 	ld	e, a
   6637 78            [ 4]  198 	ld	a, b
   6638 CE FF         [ 7]  199 	adc	a, #0xff
   663A 57            [ 4]  200 	ld	d, a
   663B 6B            [ 4]  201 	ld	l, e
   663C 62            [ 4]  202 	ld	h, d
   663D CB 7A         [ 8]  203 	bit	7, d
   663F 28 04         [12]  204 	jr	Z,00117$
   6641 21 EF FF      [10]  205 	ld	hl, #0xffef
   6644 09            [11]  206 	add	hl, bc
   6645                     207 00117$:
   6645 CB 2C         [ 8]  208 	sra	h
   6647 CB 1D         [ 8]  209 	rr	l
   6649 CB 2C         [ 8]  210 	sra	h
   664B CB 1D         [ 8]  211 	rr	l
   664D CB 2C         [ 8]  212 	sra	h
   664F CB 1D         [ 8]  213 	rr	l
                            214 ;src/blocks.c:75: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, tx*2  + (TILE_MAP_SCREEN_BYTE_OFFSET_X + 2 * TILE_W), (ty*4) + (TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y));
   6651 DD 75 F6      [19]  215 	ld	-10 (ix), l
   6654 7D            [ 4]  216 	ld	a, l
   6655 87            [ 4]  217 	add	a, a
   6656 87            [ 4]  218 	add	a, a
   6657 DD 77 F9      [19]  219 	ld	-7 (ix), a
   665A C6 18         [ 7]  220 	add	a, #0x18
   665C DD 77 FA      [19]  221 	ld	-6 (ix), a
   665F DD 7E F7      [19]  222 	ld	a, -9 (ix)
   6662 87            [ 4]  223 	add	a, a
   6663 DD 77 FD      [19]  224 	ld	-3 (ix), a
   6666 C6 0C         [ 7]  225 	add	a, #0x0c
   6668 47            [ 4]  226 	ld	b, a
   6669 DD 7E FA      [19]  227 	ld	a, -6 (ix)
   666C F5            [11]  228 	push	af
   666D 33            [ 6]  229 	inc	sp
   666E C5            [11]  230 	push	bc
   666F 33            [ 6]  231 	inc	sp
   6670 21 00 C0      [10]  232 	ld	hl, #0xc000
   6673 E5            [11]  233 	push	hl
   6674 CD A7 71      [17]  234 	call	_cpct_getScreenPtr
   6677 DD 74 F5      [19]  235 	ld	-11 (ix), h
                            236 ;src/blocks.c:76: cpct_drawSolidBox(pvmem, 255, 2,4);
   667A DD 75 F4      [19]  237 	ld	-12 (ix), l
   667D DD 75 FB      [19]  238 	ld	-5 (ix), l
   6680 DD 7E F5      [19]  239 	ld	a, -11 (ix)
   6683 DD 77 FC      [19]  240 	ld	-4 (ix), a
   6686 21 02 04      [10]  241 	ld	hl, #0x0402
   6689 E5            [11]  242 	push	hl
   668A 21 FF 00      [10]  243 	ld	hl, #0x00ff
   668D E5            [11]  244 	push	hl
   668E DD 6E FB      [19]  245 	ld	l,-5 (ix)
   6691 DD 66 FC      [19]  246 	ld	h,-4 (ix)
   6694 E5            [11]  247 	push	hl
   6695 CD A0 70      [17]  248 	call	_cpct_drawSolidBox
                            249 ;src/blocks.c:78: dbg_displayNumber(0, tx);
   6698 DD 4E F7      [19]  250 	ld	c, -9 (ix)
   669B 06 00         [ 7]  251 	ld	b, #0x00
   669D C5            [11]  252 	push	bc
   669E AF            [ 4]  253 	xor	a, a
   669F F5            [11]  254 	push	af
   66A0 33            [ 6]  255 	inc	sp
   66A1 CD B1 69      [17]  256 	call	_dbg_displayNumber
   66A4 F1            [10]  257 	pop	af
   66A5 33            [ 6]  258 	inc	sp
                            259 ;src/blocks.c:79: dbg_displayNumber(1, ty);
   66A6 DD 4E F6      [19]  260 	ld	c, -10 (ix)
   66A9 06 00         [ 7]  261 	ld	b, #0x00
   66AB C5            [11]  262 	push	bc
   66AC 3E 01         [ 7]  263 	ld	a, #0x01
   66AE F5            [11]  264 	push	af
   66AF 33            [ 6]  265 	inc	sp
   66B0 CD B1 69      [17]  266 	call	_dbg_displayNumber
   66B3 F1            [10]  267 	pop	af
   66B4 33            [ 6]  268 	inc	sp
                            269 ;src/blocks.c:81: if (tx < min_x)
   66B5 21 71 72      [10]  270 	ld	hl, #_min_x
   66B8 DD 7E F7      [19]  271 	ld	a, -9 (ix)
   66BB 96            [ 7]  272 	sub	a, (hl)
   66BC 30 06         [12]  273 	jr	NC,00105$
                            274 ;src/blocks.c:82: min_x = tx;
   66BE DD 7E F7      [19]  275 	ld	a, -9 (ix)
   66C1 32 71 72      [13]  276 	ld	(#_min_x + 0),a
   66C4                     277 00105$:
                            278 ;src/blocks.c:83: if (tx > max_x)
   66C4 3A 73 72      [13]  279 	ld	a, (#_max_x)
   66C7 DD 96 F7      [19]  280 	sub	a, -9 (ix)
   66CA 30 06         [12]  281 	jr	NC,00107$
                            282 ;src/blocks.c:84: max_x = tx;
   66CC DD 7E F7      [19]  283 	ld	a, -9 (ix)
   66CF 32 73 72      [13]  284 	ld	(#_max_x + 0),a
   66D2                     285 00107$:
                            286 ;src/blocks.c:85: if (ty < min_y)
   66D2 21 72 72      [10]  287 	ld	hl, #_min_y
   66D5 DD 7E F6      [19]  288 	ld	a, -10 (ix)
   66D8 96            [ 7]  289 	sub	a, (hl)
   66D9 30 06         [12]  290 	jr	NC,00109$
                            291 ;src/blocks.c:86: min_y = ty;
   66DB DD 7E F6      [19]  292 	ld	a, -10 (ix)
   66DE 32 72 72      [13]  293 	ld	(#_min_y + 0),a
   66E1                     294 00109$:
                            295 ;src/blocks.c:87: if (ty > max_y)
   66E1 3A 74 72      [13]  296 	ld	a, (#_max_y)
   66E4 DD 96 F6      [19]  297 	sub	a, -10 (ix)
   66E7 30 06         [12]  298 	jr	NC,00111$
                            299 ;src/blocks.c:88: max_y = ty;
   66E9 DD 7E F6      [19]  300 	ld	a, -10 (ix)
   66EC 32 74 72      [13]  301 	ld	(#_max_y + 0),a
   66EF                     302 00111$:
                            303 ;src/blocks.c:90: dbg_displayNumber(3, min_x);
   66EF 21 71 72      [10]  304 	ld	hl,#_min_x + 0
   66F2 4E            [ 7]  305 	ld	c, (hl)
   66F3 06 00         [ 7]  306 	ld	b, #0x00
   66F5 C5            [11]  307 	push	bc
   66F6 3E 03         [ 7]  308 	ld	a, #0x03
   66F8 F5            [11]  309 	push	af
   66F9 33            [ 6]  310 	inc	sp
   66FA CD B1 69      [17]  311 	call	_dbg_displayNumber
   66FD F1            [10]  312 	pop	af
   66FE 33            [ 6]  313 	inc	sp
                            314 ;src/blocks.c:91: dbg_displayNumber(4, max_x);
   66FF 21 73 72      [10]  315 	ld	hl,#_max_x + 0
   6702 4E            [ 7]  316 	ld	c, (hl)
   6703 06 00         [ 7]  317 	ld	b, #0x00
   6705 C5            [11]  318 	push	bc
   6706 3E 04         [ 7]  319 	ld	a, #0x04
   6708 F5            [11]  320 	push	af
   6709 33            [ 6]  321 	inc	sp
   670A CD B1 69      [17]  322 	call	_dbg_displayNumber
   670D F1            [10]  323 	pop	af
   670E 33            [ 6]  324 	inc	sp
                            325 ;src/blocks.c:93: dbg_displayNumber(6, min_y);
   670F 21 72 72      [10]  326 	ld	hl,#_min_y + 0
   6712 4E            [ 7]  327 	ld	c, (hl)
   6713 06 00         [ 7]  328 	ld	b, #0x00
   6715 C5            [11]  329 	push	bc
   6716 3E 06         [ 7]  330 	ld	a, #0x06
   6718 F5            [11]  331 	push	af
   6719 33            [ 6]  332 	inc	sp
   671A CD B1 69      [17]  333 	call	_dbg_displayNumber
   671D F1            [10]  334 	pop	af
   671E 33            [ 6]  335 	inc	sp
                            336 ;src/blocks.c:94: dbg_displayNumber(7, max_y);
   671F 21 74 72      [10]  337 	ld	hl,#_max_y + 0
   6722 4E            [ 7]  338 	ld	c, (hl)
   6723 06 00         [ 7]  339 	ld	b, #0x00
   6725 C5            [11]  340 	push	bc
   6726 3E 07         [ 7]  341 	ld	a, #0x07
   6728 F5            [11]  342 	push	af
   6729 33            [ 6]  343 	inc	sp
   672A CD B1 69      [17]  344 	call	_dbg_displayNumber
   672D F1            [10]  345 	pop	af
   672E 33            [ 6]  346 	inc	sp
                            347 ;src/blocks.c:96: if (block_meta[tx][ty].is_active)
   672F DD 4E F7      [19]  348 	ld	c,-9 (ix)
   6732 06 00         [ 7]  349 	ld	b,#0x00
   6734 69            [ 4]  350 	ld	l, c
   6735 60            [ 4]  351 	ld	h, b
   6736 29            [11]  352 	add	hl, hl
   6737 09            [11]  353 	add	hl, bc
   6738 29            [11]  354 	add	hl, hl
   6739 09            [11]  355 	add	hl, bc
   673A 29            [11]  356 	add	hl, hl
   673B 29            [11]  357 	add	hl, hl
   673C 29            [11]  358 	add	hl, hl
   673D DD 75 FB      [19]  359 	ld	-5 (ix), l
   6740 DD 74 FC      [19]  360 	ld	-4 (ix), h
   6743 3E 75         [ 7]  361 	ld	a, #<(_block_meta)
   6745 DD 86 FB      [19]  362 	add	a, -5 (ix)
   6748 DD 77 FB      [19]  363 	ld	-5 (ix), a
   674B 3E 72         [ 7]  364 	ld	a, #>(_block_meta)
   674D DD 8E FC      [19]  365 	adc	a, -4 (ix)
   6750 DD 77 FC      [19]  366 	ld	-4 (ix), a
   6753 DD 7E FB      [19]  367 	ld	a, -5 (ix)
   6756 DD 86 F9      [19]  368 	add	a, -7 (ix)
   6759 DD 77 FB      [19]  369 	ld	-5 (ix), a
   675C DD 7E FC      [19]  370 	ld	a, -4 (ix)
   675F CE 00         [ 7]  371 	adc	a, #0x00
   6761 DD 77 FC      [19]  372 	ld	-4 (ix), a
   6764 DD 6E FB      [19]  373 	ld	l,-5 (ix)
   6767 DD 66 FC      [19]  374 	ld	h,-4 (ix)
   676A 7E            [ 7]  375 	ld	a, (hl)
   676B DD 77 FD      [19]  376 	ld	-3 (ix), a
   676E B7            [ 4]  377 	or	a, a
   676F 28 2E         [12]  378 	jr	Z,00114$
                            379 ;src/blocks.c:98: ball->dy = -ball->dy;
   6771 DD 7E FE      [19]  380 	ld	a, -2 (ix)
   6774 C6 06         [ 7]  381 	add	a, #0x06
   6776 DD 77 FE      [19]  382 	ld	-2 (ix), a
   6779 DD 7E FF      [19]  383 	ld	a, -1 (ix)
   677C CE 00         [ 7]  384 	adc	a, #0x00
   677E DD 77 FF      [19]  385 	ld	-1 (ix), a
   6781 DD 6E FE      [19]  386 	ld	l,-2 (ix)
   6784 DD 66 FF      [19]  387 	ld	h,-1 (ix)
   6787 4E            [ 7]  388 	ld	c, (hl)
   6788 AF            [ 4]  389 	xor	a, a
   6789 91            [ 4]  390 	sub	a, c
   678A DD 77 FD      [19]  391 	ld	-3 (ix), a
   678D DD 6E FE      [19]  392 	ld	l,-2 (ix)
   6790 DD 66 FF      [19]  393 	ld	h,-1 (ix)
   6793 DD 7E FD      [19]  394 	ld	a, -3 (ix)
   6796 77            [ 7]  395 	ld	(hl), a
                            396 ;src/blocks.c:99: block_meta[tx][ty].is_active = 0;
   6797 DD 6E FB      [19]  397 	ld	l,-5 (ix)
   679A DD 66 FC      [19]  398 	ld	h,-4 (ix)
   679D 36 00         [10]  399 	ld	(hl), #0x00
   679F                     400 00114$:
   679F DD F9         [10]  401 	ld	sp, ix
   67A1 DD E1         [14]  402 	pop	ix
   67A3 C9            [10]  403 	ret
                            404 ;src/blocks.c:111: void map_tiles_to_meta()
                            405 ;	---------------------------------
                            406 ; Function map_tiles_to_meta
                            407 ; ---------------------------------
   67A4                     408 _map_tiles_to_meta::
   67A4 DD E5         [15]  409 	push	ix
   67A6 DD 21 00 00   [14]  410 	ld	ix,#0
   67AA DD 39         [15]  411 	add	ix,sp
   67AC F5            [11]  412 	push	af
   67AD F5            [11]  413 	push	af
   67AE 3B            [ 6]  414 	dec	sp
                            415 ;src/blocks.c:115: for (u8 y = 0; y < BLOCKS_MAP_H; y += 2)
   67AF DD 36 FC 00   [19]  416 	ld	-4 (ix), #0x00
   67B3                     417 00119$:
   67B3 DD 7E FC      [19]  418 	ld	a, -4 (ix)
   67B6 D6 1C         [ 7]  419 	sub	a, #0x1c
   67B8 D2 67 69      [10]  420 	jp	NC, 00121$
                            421 ;src/blocks.c:117: for (u8 x = 0; x < BLOCKS_MAP_W; x += 2)
   67BB DD 4E FC      [19]  422 	ld	c,-4 (ix)
   67BE 06 00         [ 7]  423 	ld	b,#0x00
   67C0 69            [ 4]  424 	ld	l, c
   67C1 60            [ 4]  425 	ld	h, b
   67C2 29            [11]  426 	add	hl, hl
   67C3 09            [11]  427 	add	hl, bc
   67C4 29            [11]  428 	add	hl, hl
   67C5 29            [11]  429 	add	hl, hl
   67C6 09            [11]  430 	add	hl, bc
   67C7 29            [11]  431 	add	hl, hl
   67C8 DD 75 FE      [19]  432 	ld	-2 (ix), l
   67CB DD 74 FF      [19]  433 	ld	-1 (ix), h
   67CE DD 7E FC      [19]  434 	ld	a, -4 (ix)
   67D1 CB 3F         [ 8]  435 	srl	a
   67D3 87            [ 4]  436 	add	a, a
   67D4 87            [ 4]  437 	add	a, a
   67D5 DD 77 FD      [19]  438 	ld	-3 (ix), a
   67D8 DD 36 FB 00   [19]  439 	ld	-5 (ix), #0x00
   67DC                     440 00116$:
   67DC DD 7E FB      [19]  441 	ld	a, -5 (ix)
   67DF D6 1A         [ 7]  442 	sub	a, #0x1a
   67E1 D2 5E 69      [10]  443 	jp	NC, 00120$
                            444 ;src/blocks.c:119: u8 tile = current_level->blocks_tilemap[y * BLOCKS_MAP_W + x];
   67E4 2A 56 75      [16]  445 	ld	hl, (_current_level)
   67E7 23            [ 6]  446 	inc	hl
   67E8 23            [ 6]  447 	inc	hl
   67E9 4E            [ 7]  448 	ld	c, (hl)
   67EA 23            [ 6]  449 	inc	hl
   67EB 46            [ 7]  450 	ld	b, (hl)
   67EC DD 5E FB      [19]  451 	ld	e, -5 (ix)
   67EF 16 00         [ 7]  452 	ld	d, #0x00
   67F1 DD 6E FE      [19]  453 	ld	l,-2 (ix)
   67F4 DD 66 FF      [19]  454 	ld	h,-1 (ix)
   67F7 19            [11]  455 	add	hl, de
   67F8 09            [11]  456 	add	hl, bc
   67F9 7E            [ 7]  457 	ld	a, (hl)
                            458 ;src/blocks.c:120: switch (tile)
   67FA B7            [ 4]  459 	or	a, a
   67FB 28 2C         [12]  460 	jr	Z,00101$
   67FD FE 02         [ 7]  461 	cp	a, #0x02
   67FF 28 3F         [12]  462 	jr	Z,00102$
   6801 FE 04         [ 7]  463 	cp	a, #0x04
   6803 28 53         [12]  464 	jr	Z,00103$
   6805 FE 06         [ 7]  465 	cp	a, #0x06
   6807 28 67         [12]  466 	jr	Z,00104$
   6809 FE 08         [ 7]  467 	cp	a, #0x08
   680B 28 7B         [12]  468 	jr	Z,00105$
   680D FE 0A         [ 7]  469 	cp	a, #0x0a
   680F CA A0 68      [10]  470 	jp	Z,00106$
   6812 FE 0C         [ 7]  471 	cp	a, #0x0c
   6814 CA B8 68      [10]  472 	jp	Z,00107$
   6817 FE 0E         [ 7]  473 	cp	a, #0x0e
   6819 CA D0 68      [10]  474 	jp	Z,00108$
   681C FE 10         [ 7]  475 	cp	a, #0x10
   681E CA E7 68      [10]  476 	jp	Z,00109$
   6821 D6 12         [ 7]  477 	sub	a, #0x12
   6823 CA 0A 69      [10]  478 	jp	Z,00110$
   6826 C3 21 69      [10]  479 	jp	00111$
                            480 ;src/blocks.c:122: case WHITE_BLOCK:
   6829                     481 00101$:
                            482 ;src/blocks.c:123: plant_tile_meta(x, y, WHITE_BLOCK, WHITE_SCORE, SINGLE_HIT_TO_REMOVE);
   6829 21 32 01      [10]  483 	ld	hl, #0x0132
   682C E5            [11]  484 	push	hl
   682D AF            [ 4]  485 	xor	a, a
   682E F5            [11]  486 	push	af
   682F 33            [ 6]  487 	inc	sp
   6830 DD 66 FC      [19]  488 	ld	h, -4 (ix)
   6833 DD 6E FB      [19]  489 	ld	l, -5 (ix)
   6836 E5            [11]  490 	push	hl
   6837 CD 6C 69      [17]  491 	call	_plant_tile_meta
   683A F1            [10]  492 	pop	af
   683B F1            [10]  493 	pop	af
   683C 33            [ 6]  494 	inc	sp
                            495 ;src/blocks.c:124: break;
   683D C3 55 69      [10]  496 	jp	00117$
                            497 ;src/blocks.c:125: case ORANGE_BLOCK:
   6840                     498 00102$:
                            499 ;src/blocks.c:126: plant_tile_meta(x, y, ORANGE_BLOCK, ORANGE_SCORE, SINGLE_HIT_TO_REMOVE);
   6840 21 3C 01      [10]  500 	ld	hl, #0x013c
   6843 E5            [11]  501 	push	hl
   6844 3E 02         [ 7]  502 	ld	a, #0x02
   6846 F5            [11]  503 	push	af
   6847 33            [ 6]  504 	inc	sp
   6848 DD 66 FC      [19]  505 	ld	h, -4 (ix)
   684B DD 6E FB      [19]  506 	ld	l, -5 (ix)
   684E E5            [11]  507 	push	hl
   684F CD 6C 69      [17]  508 	call	_plant_tile_meta
   6852 F1            [10]  509 	pop	af
   6853 F1            [10]  510 	pop	af
   6854 33            [ 6]  511 	inc	sp
                            512 ;src/blocks.c:127: break;
   6855 C3 55 69      [10]  513 	jp	00117$
                            514 ;src/blocks.c:128: case CYAN_BLOCK:
   6858                     515 00103$:
                            516 ;src/blocks.c:129: plant_tile_meta(x, y, CYAN_BLOCK, CYAN_SCORE, SINGLE_HIT_TO_REMOVE);
   6858 21 46 01      [10]  517 	ld	hl, #0x0146
   685B E5            [11]  518 	push	hl
   685C 3E 04         [ 7]  519 	ld	a, #0x04
   685E F5            [11]  520 	push	af
   685F 33            [ 6]  521 	inc	sp
   6860 DD 66 FC      [19]  522 	ld	h, -4 (ix)
   6863 DD 6E FB      [19]  523 	ld	l, -5 (ix)
   6866 E5            [11]  524 	push	hl
   6867 CD 6C 69      [17]  525 	call	_plant_tile_meta
   686A F1            [10]  526 	pop	af
   686B F1            [10]  527 	pop	af
   686C 33            [ 6]  528 	inc	sp
                            529 ;src/blocks.c:130: break;
   686D C3 55 69      [10]  530 	jp	00117$
                            531 ;src/blocks.c:131: case GREEN_BLOCK:
   6870                     532 00104$:
                            533 ;src/blocks.c:132: plant_tile_meta(x, y, GREEN_BLOCK, GREEN_SCORE, SINGLE_HIT_TO_REMOVE);
   6870 21 50 01      [10]  534 	ld	hl, #0x0150
   6873 E5            [11]  535 	push	hl
   6874 3E 06         [ 7]  536 	ld	a, #0x06
   6876 F5            [11]  537 	push	af
   6877 33            [ 6]  538 	inc	sp
   6878 DD 66 FC      [19]  539 	ld	h, -4 (ix)
   687B DD 6E FB      [19]  540 	ld	l, -5 (ix)
   687E E5            [11]  541 	push	hl
   687F CD 6C 69      [17]  542 	call	_plant_tile_meta
   6882 F1            [10]  543 	pop	af
   6883 F1            [10]  544 	pop	af
   6884 33            [ 6]  545 	inc	sp
                            546 ;src/blocks.c:133: break;
   6885 C3 55 69      [10]  547 	jp	00117$
                            548 ;src/blocks.c:134: case RED_BLOCK:
   6888                     549 00105$:
                            550 ;src/blocks.c:135: plant_tile_meta(x, y, RED_BLOCK, RED_SCORE, SINGLE_HIT_TO_REMOVE);
   6888 21 5A 01      [10]  551 	ld	hl, #0x015a
   688B E5            [11]  552 	push	hl
   688C 3E 08         [ 7]  553 	ld	a, #0x08
   688E F5            [11]  554 	push	af
   688F 33            [ 6]  555 	inc	sp
   6890 DD 66 FC      [19]  556 	ld	h, -4 (ix)
   6893 DD 6E FB      [19]  557 	ld	l, -5 (ix)
   6896 E5            [11]  558 	push	hl
   6897 CD 6C 69      [17]  559 	call	_plant_tile_meta
   689A F1            [10]  560 	pop	af
   689B F1            [10]  561 	pop	af
   689C 33            [ 6]  562 	inc	sp
                            563 ;src/blocks.c:136: break;
   689D C3 55 69      [10]  564 	jp	00117$
                            565 ;src/blocks.c:137: case BLUE_BLOCK:
   68A0                     566 00106$:
                            567 ;src/blocks.c:138: plant_tile_meta(x, y, BLUE_BLOCK, BLUE_SCORE, SINGLE_HIT_TO_REMOVE);
   68A0 21 64 01      [10]  568 	ld	hl, #0x0164
   68A3 E5            [11]  569 	push	hl
   68A4 3E 0A         [ 7]  570 	ld	a, #0x0a
   68A6 F5            [11]  571 	push	af
   68A7 33            [ 6]  572 	inc	sp
   68A8 DD 66 FC      [19]  573 	ld	h, -4 (ix)
   68AB DD 6E FB      [19]  574 	ld	l, -5 (ix)
   68AE E5            [11]  575 	push	hl
   68AF CD 6C 69      [17]  576 	call	_plant_tile_meta
   68B2 F1            [10]  577 	pop	af
   68B3 F1            [10]  578 	pop	af
   68B4 33            [ 6]  579 	inc	sp
                            580 ;src/blocks.c:139: break;
   68B5 C3 55 69      [10]  581 	jp	00117$
                            582 ;src/blocks.c:140: case MAGENTA_BLOCK:
   68B8                     583 00107$:
                            584 ;src/blocks.c:141: plant_tile_meta(x, y, MAGENTA_BLOCK, MAGENTA_SCORE, SINGLE_HIT_TO_REMOVE);
   68B8 21 6E 01      [10]  585 	ld	hl, #0x016e
   68BB E5            [11]  586 	push	hl
   68BC 3E 0C         [ 7]  587 	ld	a, #0x0c
   68BE F5            [11]  588 	push	af
   68BF 33            [ 6]  589 	inc	sp
   68C0 DD 66 FC      [19]  590 	ld	h, -4 (ix)
   68C3 DD 6E FB      [19]  591 	ld	l, -5 (ix)
   68C6 E5            [11]  592 	push	hl
   68C7 CD 6C 69      [17]  593 	call	_plant_tile_meta
   68CA F1            [10]  594 	pop	af
   68CB F1            [10]  595 	pop	af
   68CC 33            [ 6]  596 	inc	sp
                            597 ;src/blocks.c:142: break;
   68CD C3 55 69      [10]  598 	jp	00117$
                            599 ;src/blocks.c:143: case YELLOW_BLOCK:
   68D0                     600 00108$:
                            601 ;src/blocks.c:144: plant_tile_meta(x, y, YELLOW_BLOCK, YELLOW_SCORE, SINGLE_HIT_TO_REMOVE);
   68D0 21 78 01      [10]  602 	ld	hl, #0x0178
   68D3 E5            [11]  603 	push	hl
   68D4 3E 0E         [ 7]  604 	ld	a, #0x0e
   68D6 F5            [11]  605 	push	af
   68D7 33            [ 6]  606 	inc	sp
   68D8 DD 66 FC      [19]  607 	ld	h, -4 (ix)
   68DB DD 6E FB      [19]  608 	ld	l, -5 (ix)
   68DE E5            [11]  609 	push	hl
   68DF CD 6C 69      [17]  610 	call	_plant_tile_meta
   68E2 F1            [10]  611 	pop	af
   68E3 F1            [10]  612 	pop	af
   68E4 33            [ 6]  613 	inc	sp
                            614 ;src/blocks.c:145: break;
   68E5 18 6E         [12]  615 	jr	00117$
                            616 ;src/blocks.c:146: case STEEL_BLOCK:
   68E7                     617 00109$:
                            618 ;src/blocks.c:147: plant_tile_meta(x, y, STEEL_BLOCK, current_level->steel_hits_to_destroy, current_level->steel_score);
   68E7 2A 56 75      [16]  619 	ld	hl, (_current_level)
   68EA 11 04 00      [10]  620 	ld	de, #0x0004
   68ED 19            [11]  621 	add	hl, de
   68EE 56            [ 7]  622 	ld	d, (hl)
   68EF FD 2A 56 75   [20]  623 	ld	iy, (_current_level)
   68F3 FD 5E 05      [19]  624 	ld	e, 5 (iy)
   68F6 D5            [11]  625 	push	de
   68F7 3E 10         [ 7]  626 	ld	a, #0x10
   68F9 F5            [11]  627 	push	af
   68FA 33            [ 6]  628 	inc	sp
   68FB DD 66 FC      [19]  629 	ld	h, -4 (ix)
   68FE DD 6E FB      [19]  630 	ld	l, -5 (ix)
   6901 E5            [11]  631 	push	hl
   6902 CD 6C 69      [17]  632 	call	_plant_tile_meta
   6905 F1            [10]  633 	pop	af
   6906 F1            [10]  634 	pop	af
   6907 33            [ 6]  635 	inc	sp
                            636 ;src/blocks.c:148: break;
   6908 18 4B         [12]  637 	jr	00117$
                            638 ;src/blocks.c:149: case GOLD_BLOCK:
   690A                     639 00110$:
                            640 ;src/blocks.c:150: plant_tile_meta(x, y, GOLD_BLOCK, 0, INDESTRUCTABLE);
   690A 21 00 FF      [10]  641 	ld	hl, #0xff00
   690D E5            [11]  642 	push	hl
   690E 3E 12         [ 7]  643 	ld	a, #0x12
   6910 F5            [11]  644 	push	af
   6911 33            [ 6]  645 	inc	sp
   6912 DD 66 FC      [19]  646 	ld	h, -4 (ix)
   6915 DD 6E FB      [19]  647 	ld	l, -5 (ix)
   6918 E5            [11]  648 	push	hl
   6919 CD 6C 69      [17]  649 	call	_plant_tile_meta
   691C F1            [10]  650 	pop	af
   691D F1            [10]  651 	pop	af
   691E 33            [ 6]  652 	inc	sp
                            653 ;src/blocks.c:151: break;
   691F 18 34         [12]  654 	jr	00117$
                            655 ;src/blocks.c:152: default:
   6921                     656 00111$:
                            657 ;src/blocks.c:154: block_meta[x / 2][y / 2].is_active = 0;
   6921 DD 4E FB      [19]  658 	ld	c, -5 (ix)
   6924 CB 39         [ 8]  659 	srl	c
   6926 06 00         [ 7]  660 	ld	b,#0x00
   6928 69            [ 4]  661 	ld	l, c
   6929 60            [ 4]  662 	ld	h, b
   692A 29            [11]  663 	add	hl, hl
   692B 09            [11]  664 	add	hl, bc
   692C 29            [11]  665 	add	hl, hl
   692D 09            [11]  666 	add	hl, bc
   692E 29            [11]  667 	add	hl, hl
   692F 29            [11]  668 	add	hl, hl
   6930 29            [11]  669 	add	hl, hl
   6931 01 75 72      [10]  670 	ld	bc,#_block_meta
   6934 09            [11]  671 	add	hl,bc
   6935 4D            [ 4]  672 	ld	c, l
   6936 44            [ 4]  673 	ld	b, h
   6937 DD 6E FD      [19]  674 	ld	l,-3 (ix)
   693A 26 00         [ 7]  675 	ld	h,#0x00
   693C 09            [11]  676 	add	hl, bc
   693D 36 00         [10]  677 	ld	(hl), #0x00
                            678 ;src/blocks.c:155: block_meta[x / 2][y / 2].score = 0;
   693F DD 7E FD      [19]  679 	ld	a, -3 (ix)
   6942 81            [ 4]  680 	add	a, c
   6943 4F            [ 4]  681 	ld	c, a
   6944 3E 00         [ 7]  682 	ld	a, #0x00
   6946 88            [ 4]  683 	adc	a, b
   6947 47            [ 4]  684 	ld	b, a
   6948 59            [ 4]  685 	ld	e, c
   6949 50            [ 4]  686 	ld	d, b
   694A 13            [ 6]  687 	inc	de
   694B 13            [ 6]  688 	inc	de
   694C AF            [ 4]  689 	xor	a, a
   694D 12            [ 7]  690 	ld	(de), a
                            691 ;src/blocks.c:156: block_meta[x / 2][y / 2].remaining_hits = 0;
   694E 03            [ 6]  692 	inc	bc
   694F 03            [ 6]  693 	inc	bc
   6950 03            [ 6]  694 	inc	bc
   6951 60            [ 4]  695 	ld	h, b
   6952 69            [ 4]  696 	ld	l, c
   6953 36 00         [10]  697 	ld	(hl), #0x00
                            698 ;src/blocks.c:159: }
   6955                     699 00117$:
                            700 ;src/blocks.c:117: for (u8 x = 0; x < BLOCKS_MAP_W; x += 2)
   6955 DD 34 FB      [23]  701 	inc	-5 (ix)
   6958 DD 34 FB      [23]  702 	inc	-5 (ix)
   695B C3 DC 67      [10]  703 	jp	00116$
   695E                     704 00120$:
                            705 ;src/blocks.c:115: for (u8 y = 0; y < BLOCKS_MAP_H; y += 2)
   695E DD 34 FC      [23]  706 	inc	-4 (ix)
   6961 DD 34 FC      [23]  707 	inc	-4 (ix)
   6964 C3 B3 67      [10]  708 	jp	00119$
   6967                     709 00121$:
   6967 DD F9         [10]  710 	ld	sp, ix
   6969 DD E1         [14]  711 	pop	ix
   696B C9            [10]  712 	ret
                            713 ;src/blocks.c:164: void plant_tile_meta(u8 map_x, u8 map_y, u8 tile_type, u8 score, u8 hits_to_destroy)
                            714 ;	---------------------------------
                            715 ; Function plant_tile_meta
                            716 ; ---------------------------------
   696C                     717 _plant_tile_meta::
   696C DD E5         [15]  718 	push	ix
   696E DD 21 00 00   [14]  719 	ld	ix,#0
   6972 DD 39         [15]  720 	add	ix,sp
                            721 ;src/blocks.c:166: block_meta[map_x / 2][map_y / 2].is_active = 1;
   6974 01 75 72      [10]  722 	ld	bc, #_block_meta+0
   6977 DD 5E 04      [19]  723 	ld	e, 4 (ix)
   697A CB 3B         [ 8]  724 	srl	e
   697C 16 00         [ 7]  725 	ld	d,#0x00
   697E 6B            [ 4]  726 	ld	l, e
   697F 62            [ 4]  727 	ld	h, d
   6980 29            [11]  728 	add	hl, hl
   6981 19            [11]  729 	add	hl, de
   6982 29            [11]  730 	add	hl, hl
   6983 19            [11]  731 	add	hl, de
   6984 29            [11]  732 	add	hl, hl
   6985 29            [11]  733 	add	hl, hl
   6986 29            [11]  734 	add	hl, hl
   6987 09            [11]  735 	add	hl, bc
   6988 DD 7E 05      [19]  736 	ld	a, 5 (ix)
   698B CB 3F         [ 8]  737 	srl	a
   698D 87            [ 4]  738 	add	a, a
   698E 87            [ 4]  739 	add	a, a
   698F 85            [ 4]  740 	add	a, l
   6990 4F            [ 4]  741 	ld	c, a
   6991 3E 00         [ 7]  742 	ld	a, #0x00
   6993 8C            [ 4]  743 	adc	a, h
   6994 47            [ 4]  744 	ld	b, a
   6995 3E 01         [ 7]  745 	ld	a, #0x01
   6997 02            [ 7]  746 	ld	(bc), a
                            747 ;src/blocks.c:167: block_meta[map_x / 2][map_y / 2].score = score;
   6998 59            [ 4]  748 	ld	e, c
   6999 50            [ 4]  749 	ld	d, b
   699A 13            [ 6]  750 	inc	de
   699B 13            [ 6]  751 	inc	de
   699C DD 7E 07      [19]  752 	ld	a, 7 (ix)
   699F 12            [ 7]  753 	ld	(de), a
                            754 ;src/blocks.c:168: block_meta[map_x / 2][map_y / 2].remaining_hits = hits_to_destroy;
   69A0 59            [ 4]  755 	ld	e, c
   69A1 50            [ 4]  756 	ld	d, b
   69A2 13            [ 6]  757 	inc	de
   69A3 13            [ 6]  758 	inc	de
   69A4 13            [ 6]  759 	inc	de
   69A5 DD 7E 08      [19]  760 	ld	a, 8 (ix)
   69A8 12            [ 7]  761 	ld	(de), a
                            762 ;src/blocks.c:169: block_meta[map_x / 2][map_y / 2].type = tile_type;
   69A9 03            [ 6]  763 	inc	bc
   69AA DD 7E 06      [19]  764 	ld	a, 6 (ix)
   69AD 02            [ 7]  765 	ld	(bc), a
   69AE DD E1         [14]  766 	pop	ix
   69B0 C9            [10]  767 	ret
                            768 	.area _CODE
                            769 	.area _INITIALIZER
                            770 	.area _CABS (ABS)
