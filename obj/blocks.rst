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
   72D7                      34 _p_block_v_mem::
   72D7                      35 	.ds 2
   72D9                      36 _min_x::
   72D9                      37 	.ds 1
   72DA                      38 _min_y::
   72DA                      39 	.ds 1
   72DB                      40 _max_x::
   72DB                      41 	.ds 1
   72DC                      42 _max_y::
   72DC                      43 	.ds 1
   72DD                      44 _block_meta::
   72DD                      45 	.ds 728
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
   65E9                      74 _blocks_initialize::
                             75 ;src/blocks.c:33: p_block_v_mem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X + 2 * TILE_W, TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y);
   65E9 21 0C 18      [10]   76 	ld	hl, #0x180c
   65EC E5            [11]   77 	push	hl
   65ED 21 00 C0      [10]   78 	ld	hl, #0xc000
   65F0 E5            [11]   79 	push	hl
   65F1 CD 0F 72      [17]   80 	call	_cpct_getScreenPtr
   65F4 22 D7 72      [16]   81 	ld	(_p_block_v_mem), hl
                             82 ;src/blocks.c:34: cpct_etm_drawTilemap2x4_f(g_tilemap_l01_blocks_W, g_tilemap_l01_blocks_H, p_block_v_mem, current_level->blocks_tilemap);
   65F7 2A BE 75      [16]   83 	ld	hl, (_current_level)
   65FA 23            [ 6]   84 	inc	hl
   65FB 23            [ 6]   85 	inc	hl
   65FC 4E            [ 7]   86 	ld	c, (hl)
   65FD 23            [ 6]   87 	inc	hl
   65FE 46            [ 7]   88 	ld	b, (hl)
   65FF 2A D7 72      [16]   89 	ld	hl, (_p_block_v_mem)
   6602 C5            [11]   90 	push	bc
   6603 E5            [11]   91 	push	hl
   6604 21 1A 1C      [10]   92 	ld	hl, #0x1c1a
   6607 E5            [11]   93 	push	hl
   6608 CD 80 70      [17]   94 	call	_cpct_etm_drawTilemap2x4_f
                             95 ;src/blocks.c:37: map_tiles_to_meta();
   660B CD 0C 68      [17]   96 	call	_map_tiles_to_meta
                             97 ;src/blocks.c:39: min_x = 0xFF;
   660E 21 D9 72      [10]   98 	ld	hl,#_min_x + 0
   6611 36 FF         [10]   99 	ld	(hl), #0xff
                            100 ;src/blocks.c:40: min_y = 0xFF;
   6613 21 DA 72      [10]  101 	ld	hl,#_min_y + 0
   6616 36 FF         [10]  102 	ld	(hl), #0xff
                            103 ;src/blocks.c:41: max_x = 0x00;
   6618 21 DB 72      [10]  104 	ld	hl,#_max_x + 0
   661B 36 00         [10]  105 	ld	(hl), #0x00
                            106 ;src/blocks.c:42: max_y = 0x00;
   661D 21 DC 72      [10]  107 	ld	hl,#_max_y + 0
   6620 36 00         [10]  108 	ld	(hl), #0x00
   6622 C9            [10]  109 	ret
                            110 ;src/blocks.c:45: void blocks_draw()
                            111 ;	---------------------------------
                            112 ; Function blocks_draw
                            113 ; ---------------------------------
   6623                     114 _blocks_draw::
                            115 ;src/blocks.c:49: }
   6623 C9            [10]  116 	ret
                            117 ;src/blocks.c:51: void blocks_restore_background()
                            118 ;	---------------------------------
                            119 ; Function blocks_restore_background
                            120 ; ---------------------------------
   6624                     121 _blocks_restore_background::
                            122 ;src/blocks.c:53: }
   6624 C9            [10]  123 	ret
                            124 ;src/blocks.c:55: void blocks_intersect_ball(Ball *ball)
                            125 ;	---------------------------------
                            126 ; Function blocks_intersect_ball
                            127 ; ---------------------------------
   6625                     128 _blocks_intersect_ball::
   6625 DD E5         [15]  129 	push	ix
   6627 DD 21 00 00   [14]  130 	ld	ix,#0
   662B DD 39         [15]  131 	add	ix,sp
   662D 21 F4 FF      [10]  132 	ld	hl, #-12
   6630 39            [11]  133 	add	hl, sp
   6631 F9            [ 6]  134 	ld	sp, hl
                            135 ;src/blocks.c:59: if ((ball->y + SP_BALL_H < TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y) ||
   6632 DD 7E 04      [19]  136 	ld	a, 4 (ix)
   6635 DD 77 FE      [19]  137 	ld	-2 (ix), a
   6638 DD 7E 05      [19]  138 	ld	a, 5 (ix)
   663B DD 77 FF      [19]  139 	ld	-1 (ix), a
   663E DD 6E FE      [19]  140 	ld	l,-2 (ix)
   6641 DD 66 FF      [19]  141 	ld	h,-1 (ix)
   6644 23            [ 6]  142 	inc	hl
   6645 23            [ 6]  143 	inc	hl
   6646 7E            [ 7]  144 	ld	a, (hl)
   6647 DD 77 F9      [19]  145 	ld	-7 (ix), a
   664A 4F            [ 4]  146 	ld	c, a
   664B 06 00         [ 7]  147 	ld	b, #0x00
   664D 21 06 00      [10]  148 	ld	hl, #0x0006
   6650 09            [11]  149 	add	hl, bc
   6651 11 18 80      [10]  150 	ld	de, #0x8018
   6654 29            [11]  151 	add	hl, hl
   6655 3F            [ 4]  152 	ccf
   6656 CB 1C         [ 8]  153 	rr	h
   6658 CB 1D         [ 8]  154 	rr	l
   665A ED 52         [15]  155 	sbc	hl, de
   665C DA 07 68      [10]  156 	jp	C,00114$
                            157 ;src/blocks.c:60: (ball->y > TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y + (BLOCKS_MAP_H * TILE_H)))
   665F 3E 88         [ 7]  158 	ld	a, #0x88
   6661 DD 96 F9      [19]  159 	sub	a, -7 (ix)
                            160 ;src/blocks.c:62: return;
   6664 DA 07 68      [10]  161 	jp	C,00114$
                            162 ;src/blocks.c:66: u8 ball_center_x = ball->x + (SP_BALL_W / 2);
   6667 DD 6E FE      [19]  163 	ld	l,-2 (ix)
   666A DD 66 FF      [19]  164 	ld	h,-1 (ix)
   666D 23            [ 6]  165 	inc	hl
   666E 4E            [ 7]  166 	ld	c, (hl)
   666F 0C            [ 4]  167 	inc	c
                            168 ;src/blocks.c:67: u8 ball_center_y = ball->y + (SP_BALL_W / 2);
   6670 DD 7E F9      [19]  169 	ld	a, -7 (ix)
   6673 3C            [ 4]  170 	inc	a
   6674 DD 77 F8      [19]  171 	ld	-8 (ix), a
                            172 ;src/blocks.c:69: u8 tx = (ball_center_x - (TILE_MAP_SCREEN_BYTE_OFFSET_X + 2)) / 4;
   6677 06 00         [ 7]  173 	ld	b, #0x00
   6679 79            [ 4]  174 	ld	a, c
   667A C6 F6         [ 7]  175 	add	a, #0xf6
   667C 5F            [ 4]  176 	ld	e, a
   667D 78            [ 4]  177 	ld	a, b
   667E CE FF         [ 7]  178 	adc	a, #0xff
   6680 57            [ 4]  179 	ld	d, a
   6681 6B            [ 4]  180 	ld	l, e
   6682 62            [ 4]  181 	ld	h, d
   6683 CB 7A         [ 8]  182 	bit	7, d
   6685 28 04         [12]  183 	jr	Z,00116$
   6687 21 F9 FF      [10]  184 	ld	hl, #0xfff9
   668A 09            [11]  185 	add	hl, bc
   668B                     186 00116$:
   668B CB 2C         [ 8]  187 	sra	h
   668D CB 1D         [ 8]  188 	rr	l
   668F CB 2C         [ 8]  189 	sra	h
   6691 CB 1D         [ 8]  190 	rr	l
   6693 DD 75 F7      [19]  191 	ld	-9 (ix), l
                            192 ;src/blocks.c:70: u8 ty = (ball_center_y - (TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y)) / 8;
   6696 DD 4E F8      [19]  193 	ld	c, -8 (ix)
   6699 06 00         [ 7]  194 	ld	b, #0x00
   669B 79            [ 4]  195 	ld	a, c
   669C C6 E8         [ 7]  196 	add	a, #0xe8
   669E 5F            [ 4]  197 	ld	e, a
   669F 78            [ 4]  198 	ld	a, b
   66A0 CE FF         [ 7]  199 	adc	a, #0xff
   66A2 57            [ 4]  200 	ld	d, a
   66A3 6B            [ 4]  201 	ld	l, e
   66A4 62            [ 4]  202 	ld	h, d
   66A5 CB 7A         [ 8]  203 	bit	7, d
   66A7 28 04         [12]  204 	jr	Z,00117$
   66A9 21 EF FF      [10]  205 	ld	hl, #0xffef
   66AC 09            [11]  206 	add	hl, bc
   66AD                     207 00117$:
   66AD CB 2C         [ 8]  208 	sra	h
   66AF CB 1D         [ 8]  209 	rr	l
   66B1 CB 2C         [ 8]  210 	sra	h
   66B3 CB 1D         [ 8]  211 	rr	l
   66B5 CB 2C         [ 8]  212 	sra	h
   66B7 CB 1D         [ 8]  213 	rr	l
                            214 ;src/blocks.c:75: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, tx*2  + (TILE_MAP_SCREEN_BYTE_OFFSET_X + 2 * TILE_W), (ty*4) + (TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y));
   66B9 DD 75 F6      [19]  215 	ld	-10 (ix), l
   66BC 7D            [ 4]  216 	ld	a, l
   66BD 87            [ 4]  217 	add	a, a
   66BE 87            [ 4]  218 	add	a, a
   66BF DD 77 F9      [19]  219 	ld	-7 (ix), a
   66C2 C6 18         [ 7]  220 	add	a, #0x18
   66C4 DD 77 FA      [19]  221 	ld	-6 (ix), a
   66C7 DD 7E F7      [19]  222 	ld	a, -9 (ix)
   66CA 87            [ 4]  223 	add	a, a
   66CB DD 77 FD      [19]  224 	ld	-3 (ix), a
   66CE C6 0C         [ 7]  225 	add	a, #0x0c
   66D0 47            [ 4]  226 	ld	b, a
   66D1 DD 7E FA      [19]  227 	ld	a, -6 (ix)
   66D4 F5            [11]  228 	push	af
   66D5 33            [ 6]  229 	inc	sp
   66D6 C5            [11]  230 	push	bc
   66D7 33            [ 6]  231 	inc	sp
   66D8 21 00 C0      [10]  232 	ld	hl, #0xc000
   66DB E5            [11]  233 	push	hl
   66DC CD 0F 72      [17]  234 	call	_cpct_getScreenPtr
   66DF DD 74 F5      [19]  235 	ld	-11 (ix), h
                            236 ;src/blocks.c:76: cpct_drawSolidBox(pvmem, 255, 2,4);
   66E2 DD 75 F4      [19]  237 	ld	-12 (ix), l
   66E5 DD 75 FB      [19]  238 	ld	-5 (ix), l
   66E8 DD 7E F5      [19]  239 	ld	a, -11 (ix)
   66EB DD 77 FC      [19]  240 	ld	-4 (ix), a
   66EE 21 02 04      [10]  241 	ld	hl, #0x0402
   66F1 E5            [11]  242 	push	hl
   66F2 21 FF 00      [10]  243 	ld	hl, #0x00ff
   66F5 E5            [11]  244 	push	hl
   66F6 DD 6E FB      [19]  245 	ld	l,-5 (ix)
   66F9 DD 66 FC      [19]  246 	ld	h,-4 (ix)
   66FC E5            [11]  247 	push	hl
   66FD CD 08 71      [17]  248 	call	_cpct_drawSolidBox
                            249 ;src/blocks.c:78: dbg_displayNumber(0, tx);
   6700 DD 4E F7      [19]  250 	ld	c, -9 (ix)
   6703 06 00         [ 7]  251 	ld	b, #0x00
   6705 C5            [11]  252 	push	bc
   6706 AF            [ 4]  253 	xor	a, a
   6707 F5            [11]  254 	push	af
   6708 33            [ 6]  255 	inc	sp
   6709 CD 19 6A      [17]  256 	call	_dbg_displayNumber
   670C F1            [10]  257 	pop	af
   670D 33            [ 6]  258 	inc	sp
                            259 ;src/blocks.c:79: dbg_displayNumber(1, ty);
   670E DD 4E F6      [19]  260 	ld	c, -10 (ix)
   6711 06 00         [ 7]  261 	ld	b, #0x00
   6713 C5            [11]  262 	push	bc
   6714 3E 01         [ 7]  263 	ld	a, #0x01
   6716 F5            [11]  264 	push	af
   6717 33            [ 6]  265 	inc	sp
   6718 CD 19 6A      [17]  266 	call	_dbg_displayNumber
   671B F1            [10]  267 	pop	af
   671C 33            [ 6]  268 	inc	sp
                            269 ;src/blocks.c:81: if (tx < min_x)
   671D 21 D9 72      [10]  270 	ld	hl, #_min_x
   6720 DD 7E F7      [19]  271 	ld	a, -9 (ix)
   6723 96            [ 7]  272 	sub	a, (hl)
   6724 30 06         [12]  273 	jr	NC,00105$
                            274 ;src/blocks.c:82: min_x = tx;
   6726 DD 7E F7      [19]  275 	ld	a, -9 (ix)
   6729 32 D9 72      [13]  276 	ld	(#_min_x + 0),a
   672C                     277 00105$:
                            278 ;src/blocks.c:83: if (tx > max_x)
   672C 3A DB 72      [13]  279 	ld	a, (#_max_x)
   672F DD 96 F7      [19]  280 	sub	a, -9 (ix)
   6732 30 06         [12]  281 	jr	NC,00107$
                            282 ;src/blocks.c:84: max_x = tx;
   6734 DD 7E F7      [19]  283 	ld	a, -9 (ix)
   6737 32 DB 72      [13]  284 	ld	(#_max_x + 0),a
   673A                     285 00107$:
                            286 ;src/blocks.c:85: if (ty < min_y)
   673A 21 DA 72      [10]  287 	ld	hl, #_min_y
   673D DD 7E F6      [19]  288 	ld	a, -10 (ix)
   6740 96            [ 7]  289 	sub	a, (hl)
   6741 30 06         [12]  290 	jr	NC,00109$
                            291 ;src/blocks.c:86: min_y = ty;
   6743 DD 7E F6      [19]  292 	ld	a, -10 (ix)
   6746 32 DA 72      [13]  293 	ld	(#_min_y + 0),a
   6749                     294 00109$:
                            295 ;src/blocks.c:87: if (ty > max_y)
   6749 3A DC 72      [13]  296 	ld	a, (#_max_y)
   674C DD 96 F6      [19]  297 	sub	a, -10 (ix)
   674F 30 06         [12]  298 	jr	NC,00111$
                            299 ;src/blocks.c:88: max_y = ty;
   6751 DD 7E F6      [19]  300 	ld	a, -10 (ix)
   6754 32 DC 72      [13]  301 	ld	(#_max_y + 0),a
   6757                     302 00111$:
                            303 ;src/blocks.c:90: dbg_displayNumber(3, min_x);
   6757 21 D9 72      [10]  304 	ld	hl,#_min_x + 0
   675A 4E            [ 7]  305 	ld	c, (hl)
   675B 06 00         [ 7]  306 	ld	b, #0x00
   675D C5            [11]  307 	push	bc
   675E 3E 03         [ 7]  308 	ld	a, #0x03
   6760 F5            [11]  309 	push	af
   6761 33            [ 6]  310 	inc	sp
   6762 CD 19 6A      [17]  311 	call	_dbg_displayNumber
   6765 F1            [10]  312 	pop	af
   6766 33            [ 6]  313 	inc	sp
                            314 ;src/blocks.c:91: dbg_displayNumber(4, max_x);
   6767 21 DB 72      [10]  315 	ld	hl,#_max_x + 0
   676A 4E            [ 7]  316 	ld	c, (hl)
   676B 06 00         [ 7]  317 	ld	b, #0x00
   676D C5            [11]  318 	push	bc
   676E 3E 04         [ 7]  319 	ld	a, #0x04
   6770 F5            [11]  320 	push	af
   6771 33            [ 6]  321 	inc	sp
   6772 CD 19 6A      [17]  322 	call	_dbg_displayNumber
   6775 F1            [10]  323 	pop	af
   6776 33            [ 6]  324 	inc	sp
                            325 ;src/blocks.c:93: dbg_displayNumber(6, min_y);
   6777 21 DA 72      [10]  326 	ld	hl,#_min_y + 0
   677A 4E            [ 7]  327 	ld	c, (hl)
   677B 06 00         [ 7]  328 	ld	b, #0x00
   677D C5            [11]  329 	push	bc
   677E 3E 06         [ 7]  330 	ld	a, #0x06
   6780 F5            [11]  331 	push	af
   6781 33            [ 6]  332 	inc	sp
   6782 CD 19 6A      [17]  333 	call	_dbg_displayNumber
   6785 F1            [10]  334 	pop	af
   6786 33            [ 6]  335 	inc	sp
                            336 ;src/blocks.c:94: dbg_displayNumber(7, max_y);
   6787 21 DC 72      [10]  337 	ld	hl,#_max_y + 0
   678A 4E            [ 7]  338 	ld	c, (hl)
   678B 06 00         [ 7]  339 	ld	b, #0x00
   678D C5            [11]  340 	push	bc
   678E 3E 07         [ 7]  341 	ld	a, #0x07
   6790 F5            [11]  342 	push	af
   6791 33            [ 6]  343 	inc	sp
   6792 CD 19 6A      [17]  344 	call	_dbg_displayNumber
   6795 F1            [10]  345 	pop	af
   6796 33            [ 6]  346 	inc	sp
                            347 ;src/blocks.c:96: if (block_meta[tx][ty].is_active)
   6797 DD 4E F7      [19]  348 	ld	c,-9 (ix)
   679A 06 00         [ 7]  349 	ld	b,#0x00
   679C 69            [ 4]  350 	ld	l, c
   679D 60            [ 4]  351 	ld	h, b
   679E 29            [11]  352 	add	hl, hl
   679F 09            [11]  353 	add	hl, bc
   67A0 29            [11]  354 	add	hl, hl
   67A1 09            [11]  355 	add	hl, bc
   67A2 29            [11]  356 	add	hl, hl
   67A3 29            [11]  357 	add	hl, hl
   67A4 29            [11]  358 	add	hl, hl
   67A5 DD 75 FB      [19]  359 	ld	-5 (ix), l
   67A8 DD 74 FC      [19]  360 	ld	-4 (ix), h
   67AB 3E DD         [ 7]  361 	ld	a, #<(_block_meta)
   67AD DD 86 FB      [19]  362 	add	a, -5 (ix)
   67B0 DD 77 FB      [19]  363 	ld	-5 (ix), a
   67B3 3E 72         [ 7]  364 	ld	a, #>(_block_meta)
   67B5 DD 8E FC      [19]  365 	adc	a, -4 (ix)
   67B8 DD 77 FC      [19]  366 	ld	-4 (ix), a
   67BB DD 7E FB      [19]  367 	ld	a, -5 (ix)
   67BE DD 86 F9      [19]  368 	add	a, -7 (ix)
   67C1 DD 77 FB      [19]  369 	ld	-5 (ix), a
   67C4 DD 7E FC      [19]  370 	ld	a, -4 (ix)
   67C7 CE 00         [ 7]  371 	adc	a, #0x00
   67C9 DD 77 FC      [19]  372 	ld	-4 (ix), a
   67CC DD 6E FB      [19]  373 	ld	l,-5 (ix)
   67CF DD 66 FC      [19]  374 	ld	h,-4 (ix)
   67D2 7E            [ 7]  375 	ld	a, (hl)
   67D3 DD 77 FD      [19]  376 	ld	-3 (ix), a
   67D6 B7            [ 4]  377 	or	a, a
   67D7 28 2E         [12]  378 	jr	Z,00114$
                            379 ;src/blocks.c:98: ball->dy = -ball->dy;
   67D9 DD 7E FE      [19]  380 	ld	a, -2 (ix)
   67DC C6 06         [ 7]  381 	add	a, #0x06
   67DE DD 77 FE      [19]  382 	ld	-2 (ix), a
   67E1 DD 7E FF      [19]  383 	ld	a, -1 (ix)
   67E4 CE 00         [ 7]  384 	adc	a, #0x00
   67E6 DD 77 FF      [19]  385 	ld	-1 (ix), a
   67E9 DD 6E FE      [19]  386 	ld	l,-2 (ix)
   67EC DD 66 FF      [19]  387 	ld	h,-1 (ix)
   67EF 4E            [ 7]  388 	ld	c, (hl)
   67F0 AF            [ 4]  389 	xor	a, a
   67F1 91            [ 4]  390 	sub	a, c
   67F2 DD 77 FD      [19]  391 	ld	-3 (ix), a
   67F5 DD 6E FE      [19]  392 	ld	l,-2 (ix)
   67F8 DD 66 FF      [19]  393 	ld	h,-1 (ix)
   67FB DD 7E FD      [19]  394 	ld	a, -3 (ix)
   67FE 77            [ 7]  395 	ld	(hl), a
                            396 ;src/blocks.c:99: block_meta[tx][ty].is_active = 0;
   67FF DD 6E FB      [19]  397 	ld	l,-5 (ix)
   6802 DD 66 FC      [19]  398 	ld	h,-4 (ix)
   6805 36 00         [10]  399 	ld	(hl), #0x00
   6807                     400 00114$:
   6807 DD F9         [10]  401 	ld	sp, ix
   6809 DD E1         [14]  402 	pop	ix
   680B C9            [10]  403 	ret
                            404 ;src/blocks.c:111: void map_tiles_to_meta()
                            405 ;	---------------------------------
                            406 ; Function map_tiles_to_meta
                            407 ; ---------------------------------
   680C                     408 _map_tiles_to_meta::
   680C DD E5         [15]  409 	push	ix
   680E DD 21 00 00   [14]  410 	ld	ix,#0
   6812 DD 39         [15]  411 	add	ix,sp
   6814 F5            [11]  412 	push	af
   6815 F5            [11]  413 	push	af
   6816 3B            [ 6]  414 	dec	sp
                            415 ;src/blocks.c:115: for (u8 y = 0; y < BLOCKS_MAP_H; y += 2)
   6817 DD 36 FC 00   [19]  416 	ld	-4 (ix), #0x00
   681B                     417 00119$:
   681B DD 7E FC      [19]  418 	ld	a, -4 (ix)
   681E D6 1C         [ 7]  419 	sub	a, #0x1c
   6820 D2 CF 69      [10]  420 	jp	NC, 00121$
                            421 ;src/blocks.c:117: for (u8 x = 0; x < BLOCKS_MAP_W; x += 2)
   6823 DD 4E FC      [19]  422 	ld	c,-4 (ix)
   6826 06 00         [ 7]  423 	ld	b,#0x00
   6828 69            [ 4]  424 	ld	l, c
   6829 60            [ 4]  425 	ld	h, b
   682A 29            [11]  426 	add	hl, hl
   682B 09            [11]  427 	add	hl, bc
   682C 29            [11]  428 	add	hl, hl
   682D 29            [11]  429 	add	hl, hl
   682E 09            [11]  430 	add	hl, bc
   682F 29            [11]  431 	add	hl, hl
   6830 DD 75 FE      [19]  432 	ld	-2 (ix), l
   6833 DD 74 FF      [19]  433 	ld	-1 (ix), h
   6836 DD 7E FC      [19]  434 	ld	a, -4 (ix)
   6839 CB 3F         [ 8]  435 	srl	a
   683B 87            [ 4]  436 	add	a, a
   683C 87            [ 4]  437 	add	a, a
   683D DD 77 FD      [19]  438 	ld	-3 (ix), a
   6840 DD 36 FB 00   [19]  439 	ld	-5 (ix), #0x00
   6844                     440 00116$:
   6844 DD 7E FB      [19]  441 	ld	a, -5 (ix)
   6847 D6 1A         [ 7]  442 	sub	a, #0x1a
   6849 D2 C6 69      [10]  443 	jp	NC, 00120$
                            444 ;src/blocks.c:119: u8 tile = current_level->blocks_tilemap[y * BLOCKS_MAP_W + x];
   684C 2A BE 75      [16]  445 	ld	hl, (_current_level)
   684F 23            [ 6]  446 	inc	hl
   6850 23            [ 6]  447 	inc	hl
   6851 4E            [ 7]  448 	ld	c, (hl)
   6852 23            [ 6]  449 	inc	hl
   6853 46            [ 7]  450 	ld	b, (hl)
   6854 DD 5E FB      [19]  451 	ld	e, -5 (ix)
   6857 16 00         [ 7]  452 	ld	d, #0x00
   6859 DD 6E FE      [19]  453 	ld	l,-2 (ix)
   685C DD 66 FF      [19]  454 	ld	h,-1 (ix)
   685F 19            [11]  455 	add	hl, de
   6860 09            [11]  456 	add	hl, bc
   6861 7E            [ 7]  457 	ld	a, (hl)
                            458 ;src/blocks.c:120: switch (tile)
   6862 B7            [ 4]  459 	or	a, a
   6863 28 2C         [12]  460 	jr	Z,00101$
   6865 FE 02         [ 7]  461 	cp	a, #0x02
   6867 28 3F         [12]  462 	jr	Z,00102$
   6869 FE 04         [ 7]  463 	cp	a, #0x04
   686B 28 53         [12]  464 	jr	Z,00103$
   686D FE 06         [ 7]  465 	cp	a, #0x06
   686F 28 67         [12]  466 	jr	Z,00104$
   6871 FE 08         [ 7]  467 	cp	a, #0x08
   6873 28 7B         [12]  468 	jr	Z,00105$
   6875 FE 0A         [ 7]  469 	cp	a, #0x0a
   6877 CA 08 69      [10]  470 	jp	Z,00106$
   687A FE 0C         [ 7]  471 	cp	a, #0x0c
   687C CA 20 69      [10]  472 	jp	Z,00107$
   687F FE 0E         [ 7]  473 	cp	a, #0x0e
   6881 CA 38 69      [10]  474 	jp	Z,00108$
   6884 FE 10         [ 7]  475 	cp	a, #0x10
   6886 CA 4F 69      [10]  476 	jp	Z,00109$
   6889 D6 12         [ 7]  477 	sub	a, #0x12
   688B CA 72 69      [10]  478 	jp	Z,00110$
   688E C3 89 69      [10]  479 	jp	00111$
                            480 ;src/blocks.c:122: case WHITE_BLOCK:
   6891                     481 00101$:
                            482 ;src/blocks.c:123: plant_tile_meta(x, y, WHITE_BLOCK, WHITE_SCORE, SINGLE_HIT_TO_REMOVE);
   6891 21 32 01      [10]  483 	ld	hl, #0x0132
   6894 E5            [11]  484 	push	hl
   6895 AF            [ 4]  485 	xor	a, a
   6896 F5            [11]  486 	push	af
   6897 33            [ 6]  487 	inc	sp
   6898 DD 66 FC      [19]  488 	ld	h, -4 (ix)
   689B DD 6E FB      [19]  489 	ld	l, -5 (ix)
   689E E5            [11]  490 	push	hl
   689F CD D4 69      [17]  491 	call	_plant_tile_meta
   68A2 F1            [10]  492 	pop	af
   68A3 F1            [10]  493 	pop	af
   68A4 33            [ 6]  494 	inc	sp
                            495 ;src/blocks.c:124: break;
   68A5 C3 BD 69      [10]  496 	jp	00117$
                            497 ;src/blocks.c:125: case ORANGE_BLOCK:
   68A8                     498 00102$:
                            499 ;src/blocks.c:126: plant_tile_meta(x, y, ORANGE_BLOCK, ORANGE_SCORE, SINGLE_HIT_TO_REMOVE);
   68A8 21 3C 01      [10]  500 	ld	hl, #0x013c
   68AB E5            [11]  501 	push	hl
   68AC 3E 02         [ 7]  502 	ld	a, #0x02
   68AE F5            [11]  503 	push	af
   68AF 33            [ 6]  504 	inc	sp
   68B0 DD 66 FC      [19]  505 	ld	h, -4 (ix)
   68B3 DD 6E FB      [19]  506 	ld	l, -5 (ix)
   68B6 E5            [11]  507 	push	hl
   68B7 CD D4 69      [17]  508 	call	_plant_tile_meta
   68BA F1            [10]  509 	pop	af
   68BB F1            [10]  510 	pop	af
   68BC 33            [ 6]  511 	inc	sp
                            512 ;src/blocks.c:127: break;
   68BD C3 BD 69      [10]  513 	jp	00117$
                            514 ;src/blocks.c:128: case CYAN_BLOCK:
   68C0                     515 00103$:
                            516 ;src/blocks.c:129: plant_tile_meta(x, y, CYAN_BLOCK, CYAN_SCORE, SINGLE_HIT_TO_REMOVE);
   68C0 21 46 01      [10]  517 	ld	hl, #0x0146
   68C3 E5            [11]  518 	push	hl
   68C4 3E 04         [ 7]  519 	ld	a, #0x04
   68C6 F5            [11]  520 	push	af
   68C7 33            [ 6]  521 	inc	sp
   68C8 DD 66 FC      [19]  522 	ld	h, -4 (ix)
   68CB DD 6E FB      [19]  523 	ld	l, -5 (ix)
   68CE E5            [11]  524 	push	hl
   68CF CD D4 69      [17]  525 	call	_plant_tile_meta
   68D2 F1            [10]  526 	pop	af
   68D3 F1            [10]  527 	pop	af
   68D4 33            [ 6]  528 	inc	sp
                            529 ;src/blocks.c:130: break;
   68D5 C3 BD 69      [10]  530 	jp	00117$
                            531 ;src/blocks.c:131: case GREEN_BLOCK:
   68D8                     532 00104$:
                            533 ;src/blocks.c:132: plant_tile_meta(x, y, GREEN_BLOCK, GREEN_SCORE, SINGLE_HIT_TO_REMOVE);
   68D8 21 50 01      [10]  534 	ld	hl, #0x0150
   68DB E5            [11]  535 	push	hl
   68DC 3E 06         [ 7]  536 	ld	a, #0x06
   68DE F5            [11]  537 	push	af
   68DF 33            [ 6]  538 	inc	sp
   68E0 DD 66 FC      [19]  539 	ld	h, -4 (ix)
   68E3 DD 6E FB      [19]  540 	ld	l, -5 (ix)
   68E6 E5            [11]  541 	push	hl
   68E7 CD D4 69      [17]  542 	call	_plant_tile_meta
   68EA F1            [10]  543 	pop	af
   68EB F1            [10]  544 	pop	af
   68EC 33            [ 6]  545 	inc	sp
                            546 ;src/blocks.c:133: break;
   68ED C3 BD 69      [10]  547 	jp	00117$
                            548 ;src/blocks.c:134: case RED_BLOCK:
   68F0                     549 00105$:
                            550 ;src/blocks.c:135: plant_tile_meta(x, y, RED_BLOCK, RED_SCORE, SINGLE_HIT_TO_REMOVE);
   68F0 21 5A 01      [10]  551 	ld	hl, #0x015a
   68F3 E5            [11]  552 	push	hl
   68F4 3E 08         [ 7]  553 	ld	a, #0x08
   68F6 F5            [11]  554 	push	af
   68F7 33            [ 6]  555 	inc	sp
   68F8 DD 66 FC      [19]  556 	ld	h, -4 (ix)
   68FB DD 6E FB      [19]  557 	ld	l, -5 (ix)
   68FE E5            [11]  558 	push	hl
   68FF CD D4 69      [17]  559 	call	_plant_tile_meta
   6902 F1            [10]  560 	pop	af
   6903 F1            [10]  561 	pop	af
   6904 33            [ 6]  562 	inc	sp
                            563 ;src/blocks.c:136: break;
   6905 C3 BD 69      [10]  564 	jp	00117$
                            565 ;src/blocks.c:137: case BLUE_BLOCK:
   6908                     566 00106$:
                            567 ;src/blocks.c:138: plant_tile_meta(x, y, BLUE_BLOCK, BLUE_SCORE, SINGLE_HIT_TO_REMOVE);
   6908 21 64 01      [10]  568 	ld	hl, #0x0164
   690B E5            [11]  569 	push	hl
   690C 3E 0A         [ 7]  570 	ld	a, #0x0a
   690E F5            [11]  571 	push	af
   690F 33            [ 6]  572 	inc	sp
   6910 DD 66 FC      [19]  573 	ld	h, -4 (ix)
   6913 DD 6E FB      [19]  574 	ld	l, -5 (ix)
   6916 E5            [11]  575 	push	hl
   6917 CD D4 69      [17]  576 	call	_plant_tile_meta
   691A F1            [10]  577 	pop	af
   691B F1            [10]  578 	pop	af
   691C 33            [ 6]  579 	inc	sp
                            580 ;src/blocks.c:139: break;
   691D C3 BD 69      [10]  581 	jp	00117$
                            582 ;src/blocks.c:140: case MAGENTA_BLOCK:
   6920                     583 00107$:
                            584 ;src/blocks.c:141: plant_tile_meta(x, y, MAGENTA_BLOCK, MAGENTA_SCORE, SINGLE_HIT_TO_REMOVE);
   6920 21 6E 01      [10]  585 	ld	hl, #0x016e
   6923 E5            [11]  586 	push	hl
   6924 3E 0C         [ 7]  587 	ld	a, #0x0c
   6926 F5            [11]  588 	push	af
   6927 33            [ 6]  589 	inc	sp
   6928 DD 66 FC      [19]  590 	ld	h, -4 (ix)
   692B DD 6E FB      [19]  591 	ld	l, -5 (ix)
   692E E5            [11]  592 	push	hl
   692F CD D4 69      [17]  593 	call	_plant_tile_meta
   6932 F1            [10]  594 	pop	af
   6933 F1            [10]  595 	pop	af
   6934 33            [ 6]  596 	inc	sp
                            597 ;src/blocks.c:142: break;
   6935 C3 BD 69      [10]  598 	jp	00117$
                            599 ;src/blocks.c:143: case YELLOW_BLOCK:
   6938                     600 00108$:
                            601 ;src/blocks.c:144: plant_tile_meta(x, y, YELLOW_BLOCK, YELLOW_SCORE, SINGLE_HIT_TO_REMOVE);
   6938 21 78 01      [10]  602 	ld	hl, #0x0178
   693B E5            [11]  603 	push	hl
   693C 3E 0E         [ 7]  604 	ld	a, #0x0e
   693E F5            [11]  605 	push	af
   693F 33            [ 6]  606 	inc	sp
   6940 DD 66 FC      [19]  607 	ld	h, -4 (ix)
   6943 DD 6E FB      [19]  608 	ld	l, -5 (ix)
   6946 E5            [11]  609 	push	hl
   6947 CD D4 69      [17]  610 	call	_plant_tile_meta
   694A F1            [10]  611 	pop	af
   694B F1            [10]  612 	pop	af
   694C 33            [ 6]  613 	inc	sp
                            614 ;src/blocks.c:145: break;
   694D 18 6E         [12]  615 	jr	00117$
                            616 ;src/blocks.c:146: case STEEL_BLOCK:
   694F                     617 00109$:
                            618 ;src/blocks.c:147: plant_tile_meta(x, y, STEEL_BLOCK, current_level->steel_hits_to_destroy, current_level->steel_score);
   694F 2A BE 75      [16]  619 	ld	hl, (_current_level)
   6952 11 04 00      [10]  620 	ld	de, #0x0004
   6955 19            [11]  621 	add	hl, de
   6956 56            [ 7]  622 	ld	d, (hl)
   6957 FD 2A BE 75   [20]  623 	ld	iy, (_current_level)
   695B FD 5E 05      [19]  624 	ld	e, 5 (iy)
   695E D5            [11]  625 	push	de
   695F 3E 10         [ 7]  626 	ld	a, #0x10
   6961 F5            [11]  627 	push	af
   6962 33            [ 6]  628 	inc	sp
   6963 DD 66 FC      [19]  629 	ld	h, -4 (ix)
   6966 DD 6E FB      [19]  630 	ld	l, -5 (ix)
   6969 E5            [11]  631 	push	hl
   696A CD D4 69      [17]  632 	call	_plant_tile_meta
   696D F1            [10]  633 	pop	af
   696E F1            [10]  634 	pop	af
   696F 33            [ 6]  635 	inc	sp
                            636 ;src/blocks.c:148: break;
   6970 18 4B         [12]  637 	jr	00117$
                            638 ;src/blocks.c:149: case GOLD_BLOCK:
   6972                     639 00110$:
                            640 ;src/blocks.c:150: plant_tile_meta(x, y, GOLD_BLOCK, 0, INDESTRUCTABLE);
   6972 21 00 FF      [10]  641 	ld	hl, #0xff00
   6975 E5            [11]  642 	push	hl
   6976 3E 12         [ 7]  643 	ld	a, #0x12
   6978 F5            [11]  644 	push	af
   6979 33            [ 6]  645 	inc	sp
   697A DD 66 FC      [19]  646 	ld	h, -4 (ix)
   697D DD 6E FB      [19]  647 	ld	l, -5 (ix)
   6980 E5            [11]  648 	push	hl
   6981 CD D4 69      [17]  649 	call	_plant_tile_meta
   6984 F1            [10]  650 	pop	af
   6985 F1            [10]  651 	pop	af
   6986 33            [ 6]  652 	inc	sp
                            653 ;src/blocks.c:151: break;
   6987 18 34         [12]  654 	jr	00117$
                            655 ;src/blocks.c:152: default:
   6989                     656 00111$:
                            657 ;src/blocks.c:154: block_meta[x / 2][y / 2].is_active = 0;
   6989 DD 4E FB      [19]  658 	ld	c, -5 (ix)
   698C CB 39         [ 8]  659 	srl	c
   698E 06 00         [ 7]  660 	ld	b,#0x00
   6990 69            [ 4]  661 	ld	l, c
   6991 60            [ 4]  662 	ld	h, b
   6992 29            [11]  663 	add	hl, hl
   6993 09            [11]  664 	add	hl, bc
   6994 29            [11]  665 	add	hl, hl
   6995 09            [11]  666 	add	hl, bc
   6996 29            [11]  667 	add	hl, hl
   6997 29            [11]  668 	add	hl, hl
   6998 29            [11]  669 	add	hl, hl
   6999 01 DD 72      [10]  670 	ld	bc,#_block_meta
   699C 09            [11]  671 	add	hl,bc
   699D 4D            [ 4]  672 	ld	c, l
   699E 44            [ 4]  673 	ld	b, h
   699F DD 6E FD      [19]  674 	ld	l,-3 (ix)
   69A2 26 00         [ 7]  675 	ld	h,#0x00
   69A4 09            [11]  676 	add	hl, bc
   69A5 36 00         [10]  677 	ld	(hl), #0x00
                            678 ;src/blocks.c:155: block_meta[x / 2][y / 2].score = 0;
   69A7 DD 7E FD      [19]  679 	ld	a, -3 (ix)
   69AA 81            [ 4]  680 	add	a, c
   69AB 4F            [ 4]  681 	ld	c, a
   69AC 3E 00         [ 7]  682 	ld	a, #0x00
   69AE 88            [ 4]  683 	adc	a, b
   69AF 47            [ 4]  684 	ld	b, a
   69B0 59            [ 4]  685 	ld	e, c
   69B1 50            [ 4]  686 	ld	d, b
   69B2 13            [ 6]  687 	inc	de
   69B3 13            [ 6]  688 	inc	de
   69B4 AF            [ 4]  689 	xor	a, a
   69B5 12            [ 7]  690 	ld	(de), a
                            691 ;src/blocks.c:156: block_meta[x / 2][y / 2].remaining_hits = 0;
   69B6 03            [ 6]  692 	inc	bc
   69B7 03            [ 6]  693 	inc	bc
   69B8 03            [ 6]  694 	inc	bc
   69B9 60            [ 4]  695 	ld	h, b
   69BA 69            [ 4]  696 	ld	l, c
   69BB 36 00         [10]  697 	ld	(hl), #0x00
                            698 ;src/blocks.c:159: }
   69BD                     699 00117$:
                            700 ;src/blocks.c:117: for (u8 x = 0; x < BLOCKS_MAP_W; x += 2)
   69BD DD 34 FB      [23]  701 	inc	-5 (ix)
   69C0 DD 34 FB      [23]  702 	inc	-5 (ix)
   69C3 C3 44 68      [10]  703 	jp	00116$
   69C6                     704 00120$:
                            705 ;src/blocks.c:115: for (u8 y = 0; y < BLOCKS_MAP_H; y += 2)
   69C6 DD 34 FC      [23]  706 	inc	-4 (ix)
   69C9 DD 34 FC      [23]  707 	inc	-4 (ix)
   69CC C3 1B 68      [10]  708 	jp	00119$
   69CF                     709 00121$:
   69CF DD F9         [10]  710 	ld	sp, ix
   69D1 DD E1         [14]  711 	pop	ix
   69D3 C9            [10]  712 	ret
                            713 ;src/blocks.c:164: void plant_tile_meta(u8 map_x, u8 map_y, u8 tile_type, u8 score, u8 hits_to_destroy)
                            714 ;	---------------------------------
                            715 ; Function plant_tile_meta
                            716 ; ---------------------------------
   69D4                     717 _plant_tile_meta::
   69D4 DD E5         [15]  718 	push	ix
   69D6 DD 21 00 00   [14]  719 	ld	ix,#0
   69DA DD 39         [15]  720 	add	ix,sp
                            721 ;src/blocks.c:166: block_meta[map_x / 2][map_y / 2].is_active = 1;
   69DC 01 DD 72      [10]  722 	ld	bc, #_block_meta+0
   69DF DD 5E 04      [19]  723 	ld	e, 4 (ix)
   69E2 CB 3B         [ 8]  724 	srl	e
   69E4 16 00         [ 7]  725 	ld	d,#0x00
   69E6 6B            [ 4]  726 	ld	l, e
   69E7 62            [ 4]  727 	ld	h, d
   69E8 29            [11]  728 	add	hl, hl
   69E9 19            [11]  729 	add	hl, de
   69EA 29            [11]  730 	add	hl, hl
   69EB 19            [11]  731 	add	hl, de
   69EC 29            [11]  732 	add	hl, hl
   69ED 29            [11]  733 	add	hl, hl
   69EE 29            [11]  734 	add	hl, hl
   69EF 09            [11]  735 	add	hl, bc
   69F0 DD 7E 05      [19]  736 	ld	a, 5 (ix)
   69F3 CB 3F         [ 8]  737 	srl	a
   69F5 87            [ 4]  738 	add	a, a
   69F6 87            [ 4]  739 	add	a, a
   69F7 85            [ 4]  740 	add	a, l
   69F8 4F            [ 4]  741 	ld	c, a
   69F9 3E 00         [ 7]  742 	ld	a, #0x00
   69FB 8C            [ 4]  743 	adc	a, h
   69FC 47            [ 4]  744 	ld	b, a
   69FD 3E 01         [ 7]  745 	ld	a, #0x01
   69FF 02            [ 7]  746 	ld	(bc), a
                            747 ;src/blocks.c:167: block_meta[map_x / 2][map_y / 2].score = score;
   6A00 59            [ 4]  748 	ld	e, c
   6A01 50            [ 4]  749 	ld	d, b
   6A02 13            [ 6]  750 	inc	de
   6A03 13            [ 6]  751 	inc	de
   6A04 DD 7E 07      [19]  752 	ld	a, 7 (ix)
   6A07 12            [ 7]  753 	ld	(de), a
                            754 ;src/blocks.c:168: block_meta[map_x / 2][map_y / 2].remaining_hits = hits_to_destroy;
   6A08 59            [ 4]  755 	ld	e, c
   6A09 50            [ 4]  756 	ld	d, b
   6A0A 13            [ 6]  757 	inc	de
   6A0B 13            [ 6]  758 	inc	de
   6A0C 13            [ 6]  759 	inc	de
   6A0D DD 7E 08      [19]  760 	ld	a, 8 (ix)
   6A10 12            [ 7]  761 	ld	(de), a
                            762 ;src/blocks.c:169: block_meta[map_x / 2][map_y / 2].type = tile_type;
   6A11 03            [ 6]  763 	inc	bc
   6A12 DD 7E 06      [19]  764 	ld	a, 6 (ix)
   6A15 02            [ 7]  765 	ld	(bc), a
   6A16 DD E1         [14]  766 	pop	ix
   6A18 C9            [10]  767 	ret
                            768 	.area _CODE
                            769 	.area _INITIALIZER
                            770 	.area _CABS (ABS)
