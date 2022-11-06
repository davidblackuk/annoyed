                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module background
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _cpct_etm_setTileset2x4
                             12 	.globl _cpct_etm_drawTileBox2x4
                             13 	.globl _cpct_etm_drawTilemap2x4_f
                             14 	.globl _cpct_getScreenPtr
                             15 	.globl _cpct_drawSolidBox
                             16 	.globl _pvmem
                             17 	.globl _background_initialize
                             18 	.globl _background_bounce_ball
                             19 	.globl _background_restore_world_coords
                             20 	.globl _background_restore_tiles_exact
                             21 	.globl _background_debug_box_wc
                             22 ;--------------------------------------------------------
                             23 ; special function registers
                             24 ;--------------------------------------------------------
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _DATA
   8ED2                      29 _pvmem::
   8ED2                      30 	.ds 2
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _INITIALIZED
                             35 ;--------------------------------------------------------
                             36 ; absolute external ram data
                             37 ;--------------------------------------------------------
                             38 	.area _DABS (ABS)
                             39 ;--------------------------------------------------------
                             40 ; global & static initialisations
                             41 ;--------------------------------------------------------
                             42 	.area _HOME
                             43 	.area _GSINIT
                             44 	.area _GSFINAL
                             45 	.area _GSINIT
                             46 ;--------------------------------------------------------
                             47 ; Home
                             48 ;--------------------------------------------------------
                             49 	.area _HOME
                             50 	.area _HOME
                             51 ;--------------------------------------------------------
                             52 ; code
                             53 ;--------------------------------------------------------
                             54 	.area _CODE
                             55 ;src/background.c:17: void background_initialize()
                             56 ;	---------------------------------
                             57 ; Function background_initialize
                             58 ; ---------------------------------
   74C0                      59 _background_initialize::
                             60 ;src/background.c:20: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X, TILE_MAP_SCREEN_PIXEL_OFFSET_Y);
   74C0 21 08 00      [10]   61 	ld	hl, #0x0008
   74C3 E5            [11]   62 	push	hl
   74C4 21 00 C0      [10]   63 	ld	hl, #0xc000
   74C7 E5            [11]   64 	push	hl
   74C8 CD FF 8D      [17]   65 	call	_cpct_getScreenPtr
   74CB 22 D2 8E      [16]   66 	ld	(_pvmem), hl
                             67 ;src/background.c:22: cpct_etm_setTileset2x4(g_tileset);
   74CE 21 D0 62      [10]   68 	ld	hl, #_g_tileset
   74D1 CD 02 8C      [17]   69 	call	_cpct_etm_setTileset2x4
                             70 ;src/background.c:25: cpct_etm_drawTilemap2x4_f(BACKGROUND_TILMAP_W, BACKGROUND_TILMAP_H, pvmem, current_level->background_tilemap);
   74D4 2A 4F 93      [16]   71 	ld	hl, (_current_level)
   74D7 4E            [ 7]   72 	ld	c, (hl)
   74D8 23            [ 6]   73 	inc	hl
   74D9 46            [ 7]   74 	ld	b, (hl)
   74DA 2A D2 8E      [16]   75 	ld	hl, (_pvmem)
   74DD C5            [11]   76 	push	bc
   74DE E5            [11]   77 	push	hl
   74DF 21 1E 32      [10]   78 	ld	hl, #0x321e
   74E2 E5            [11]   79 	push	hl
   74E3 CD 61 8C      [17]   80 	call	_cpct_etm_drawTilemap2x4_f
   74E6 C9            [10]   81 	ret
                             82 ;src/background.c:28: BounceHits background_bounce_ball(i16 at_wx, i16 at_wy)
                             83 ;	---------------------------------
                             84 ; Function background_bounce_ball
                             85 ; ---------------------------------
   74E7                      86 _background_bounce_ball::
                             87 ;src/background.c:31: BounceHits bounces = at_wx < 0 ? BOUNCE_X : 0;
   74E7 21 03 00      [10]   88 	ld	hl, #2+1
   74EA 39            [11]   89 	add	hl, sp
   74EB CB 7E         [12]   90 	bit	7, (hl)
   74ED 28 04         [12]   91 	jr	Z,00103$
   74EF 0E 01         [ 7]   92 	ld	c, #0x01
   74F1 18 02         [12]   93 	jr	00104$
   74F3                      94 00103$:
   74F3 0E 00         [ 7]   95 	ld	c, #0x00
   74F5                      96 00104$:
                             97 ;src/background.c:33: bounces |= (at_wx + BALL_WIDTH) > PLAY_AREA_WIDTH ? BOUNCE_X : BOUNCE_NONE;
   74F5 21 02 00      [10]   98 	ld	hl, #2
   74F8 39            [11]   99 	add	hl, sp
   74F9 5E            [ 7]  100 	ld	e, (hl)
   74FA 23            [ 6]  101 	inc	hl
   74FB 56            [ 7]  102 	ld	d, (hl)
   74FC 13            [ 6]  103 	inc	de
   74FD 13            [ 6]  104 	inc	de
   74FE 13            [ 6]  105 	inc	de
   74FF 3E 34         [ 7]  106 	ld	a, #0x34
   7501 BB            [ 4]  107 	cp	a, e
   7502 3E 00         [ 7]  108 	ld	a, #0x00
   7504 9A            [ 4]  109 	sbc	a, d
   7505 E2 0A 75      [10]  110 	jp	PO, 00121$
   7508 EE 80         [ 7]  111 	xor	a, #0x80
   750A                     112 00121$:
   750A F2 11 75      [10]  113 	jp	P, 00105$
   750D 3E 01         [ 7]  114 	ld	a, #0x01
   750F 18 02         [12]  115 	jr	00106$
   7511                     116 00105$:
   7511 3E 00         [ 7]  117 	ld	a, #0x00
   7513                     118 00106$:
   7513 B1            [ 4]  119 	or	a, c
   7514 4F            [ 4]  120 	ld	c, a
                            121 ;src/background.c:35: bounces |= (at_wy < 0) ? BOUNCE_Y : BOUNCE_NONE;
   7515 21 05 00      [10]  122 	ld	hl, #4+1
   7518 39            [11]  123 	add	hl, sp
   7519 CB 7E         [12]  124 	bit	7, (hl)
   751B 28 04         [12]  125 	jr	Z,00107$
   751D 3E 02         [ 7]  126 	ld	a, #0x02
   751F 18 02         [12]  127 	jr	00108$
   7521                     128 00107$:
   7521 3E 00         [ 7]  129 	ld	a, #0x00
   7523                     130 00108$:
   7523 B1            [ 4]  131 	or	a, c
   7524 6F            [ 4]  132 	ld	l, a
                            133 ;src/background.c:37: return bounces;
   7525 C9            [10]  134 	ret
                            135 ;src/background.c:40: void background_restore_world_coords(i16 wx, i16 wy, u8 width, u8 height)
                            136 ;	---------------------------------
                            137 ; Function background_restore_world_coords
                            138 ; ---------------------------------
   7526                     139 _background_restore_world_coords::
   7526 DD E5         [15]  140 	push	ix
   7528 DD 21 00 00   [14]  141 	ld	ix,#0
   752C DD 39         [15]  142 	add	ix,sp
   752E F5            [11]  143 	push	af
   752F F5            [11]  144 	push	af
                            145 ;src/background.c:47: u8 tileX = (wx / 2) + 2;
   7530 DD 4E 04      [19]  146 	ld	c,4 (ix)
   7533 DD 46 05      [19]  147 	ld	b,5 (ix)
   7536 CB 78         [ 8]  148 	bit	7, b
   7538 28 01         [12]  149 	jr	Z,00109$
   753A 03            [ 6]  150 	inc	bc
   753B                     151 00109$:
   753B CB 28         [ 8]  152 	sra	b
   753D CB 19         [ 8]  153 	rr	c
   753F 79            [ 4]  154 	ld	a, c
   7540 C6 02         [ 7]  155 	add	a, #0x02
   7542 DD 77 FC      [19]  156 	ld	-4 (ix), a
                            157 ;src/background.c:48: u8 tileY = (wy / 4) + 2;
   7545 DD 4E 06      [19]  158 	ld	c,6 (ix)
   7548 DD 46 07      [19]  159 	ld	b,7 (ix)
   754B CB 78         [ 8]  160 	bit	7, b
   754D 28 03         [12]  161 	jr	Z,00110$
   754F 03            [ 6]  162 	inc	bc
   7550 03            [ 6]  163 	inc	bc
   7551 03            [ 6]  164 	inc	bc
   7552                     165 00110$:
   7552 CB 28         [ 8]  166 	sra	b
   7554 CB 19         [ 8]  167 	rr	c
   7556 CB 28         [ 8]  168 	sra	b
   7558 CB 19         [ 8]  169 	rr	c
   755A 79            [ 4]  170 	ld	a, c
   755B C6 02         [ 7]  171 	add	a, #0x02
   755D DD 77 FD      [19]  172 	ld	-3 (ix), a
                            173 ;src/background.c:49: u8 tileW = width / 2;
   7560 DD 5E 08      [19]  174 	ld	e, 8 (ix)
   7563 CB 3B         [ 8]  175 	srl	e
                            176 ;src/background.c:50: u8 tileH = height / 4;
   7565 DD 56 09      [19]  177 	ld	d, 9 (ix)
   7568 CB 3A         [ 8]  178 	srl	d
   756A CB 3A         [ 8]  179 	srl	d
                            180 ;src/background.c:53: if (height % 4 > 0)
   756C DD 7E 09      [19]  181 	ld	a, 9 (ix)
   756F E6 03         [ 7]  182 	and	a, #0x03
   7571 28 01         [12]  183 	jr	Z,00102$
                            184 ;src/background.c:55: tileH++;
   7573 14            [ 4]  185 	inc	d
   7574                     186 00102$:
                            187 ;src/background.c:59: if (width % 2 > 0)
   7574 DD CB 08 46   [20]  188 	bit	0, 8 (ix)
   7578 28 01         [12]  189 	jr	Z,00104$
                            190 ;src/background.c:61: tileW++;
   757A 1C            [ 4]  191 	inc	e
   757B                     192 00104$:
                            193 ;src/background.c:65: if (wx & 1 == 1)
   757B DD CB 04 46   [20]  194 	bit	0, 4 (ix)
   757F 28 01         [12]  195 	jr	Z,00106$
                            196 ;src/background.c:67: tileW += 1;
   7581 1C            [ 4]  197 	inc	e
   7582                     198 00106$:
                            199 ;src/background.c:70: cpct_etm_drawTileBox2x4(tileX, tileY, tileW, tileH, BACKGROUND_TILMAP_W, pvmem, current_level->background_tilemap);
   7582 2A 4F 93      [16]  200 	ld	hl, (_current_level)
   7585 4E            [ 7]  201 	ld	c, (hl)
   7586 23            [ 6]  202 	inc	hl
   7587 46            [ 7]  203 	ld	b, (hl)
   7588 DD 71 FE      [19]  204 	ld	-2 (ix), c
   758B DD 70 FF      [19]  205 	ld	-1 (ix), b
   758E 2A D2 8E      [16]  206 	ld	hl, (_pvmem)
   7591 DD 4E FE      [19]  207 	ld	c,-2 (ix)
   7594 DD 46 FF      [19]  208 	ld	b,-1 (ix)
   7597 C5            [11]  209 	push	bc
   7598 E5            [11]  210 	push	hl
   7599 3E 1E         [ 7]  211 	ld	a, #0x1e
   759B F5            [11]  212 	push	af
   759C 33            [ 6]  213 	inc	sp
   759D D5            [11]  214 	push	de
   759E 33            [ 6]  215 	inc	sp
   759F 53            [ 4]  216 	ld	d, e
   75A0 DD 5E FD      [19]  217 	ld	e, -3 (ix)
   75A3 D5            [11]  218 	push	de
   75A4 DD 7E FC      [19]  219 	ld	a, -4 (ix)
   75A7 F5            [11]  220 	push	af
   75A8 33            [ 6]  221 	inc	sp
   75A9 CD 39 8B      [17]  222 	call	_cpct_etm_drawTileBox2x4
   75AC DD F9         [10]  223 	ld	sp, ix
   75AE DD E1         [14]  224 	pop	ix
   75B0 C9            [10]  225 	ret
                            226 ;src/background.c:73: void background_restore_tiles_exact(u16 tx, u16 ty, u8 tw, u8 th) {
                            227 ;	---------------------------------
                            228 ; Function background_restore_tiles_exact
                            229 ; ---------------------------------
   75B1                     230 _background_restore_tiles_exact::
   75B1 DD E5         [15]  231 	push	ix
   75B3 DD 21 00 00   [14]  232 	ld	ix,#0
   75B7 DD 39         [15]  233 	add	ix,sp
                            234 ;src/background.c:75: pvmem, current_level->background_tilemap);
   75B9 2A 4F 93      [16]  235 	ld	hl, (_current_level)
   75BC 4E            [ 7]  236 	ld	c, (hl)
   75BD 23            [ 6]  237 	inc	hl
   75BE 46            [ 7]  238 	ld	b, (hl)
   75BF 2A D2 8E      [16]  239 	ld	hl, (_pvmem)
                            240 ;src/background.c:74: cpct_etm_drawTileBox2x4(tx, ty, tw, th, BACKGROUND_TILMAP_W, 
   75C2 DD 5E 06      [19]  241 	ld	e, 6 (ix)
   75C5 DD 56 04      [19]  242 	ld	d, 4 (ix)
   75C8 C5            [11]  243 	push	bc
   75C9 E5            [11]  244 	push	hl
   75CA 3E 1E         [ 7]  245 	ld	a, #0x1e
   75CC F5            [11]  246 	push	af
   75CD 33            [ 6]  247 	inc	sp
   75CE DD 66 09      [19]  248 	ld	h, 9 (ix)
   75D1 DD 6E 08      [19]  249 	ld	l, 8 (ix)
   75D4 E5            [11]  250 	push	hl
   75D5 7B            [ 4]  251 	ld	a, e
   75D6 F5            [11]  252 	push	af
   75D7 33            [ 6]  253 	inc	sp
   75D8 D5            [11]  254 	push	de
   75D9 33            [ 6]  255 	inc	sp
   75DA CD 39 8B      [17]  256 	call	_cpct_etm_drawTileBox2x4
   75DD DD E1         [14]  257 	pop	ix
   75DF C9            [10]  258 	ret
                            259 ;src/background.c:80: void background_debug_box_wc(i16 tx, i16 ty, u8 width, u8 height)
                            260 ;	---------------------------------
                            261 ; Function background_debug_box_wc
                            262 ; ---------------------------------
   75E0                     263 _background_debug_box_wc::
   75E0 DD E5         [15]  264 	push	ix
   75E2 DD 21 00 00   [14]  265 	ld	ix,#0
   75E6 DD 39         [15]  266 	add	ix,sp
                            267 ;src/background.c:87: u8 tileX = (tx / 2) + 2;
   75E8 DD 6E 04      [19]  268 	ld	l,4 (ix)
   75EB DD 66 05      [19]  269 	ld	h,5 (ix)
   75EE CB 7C         [ 8]  270 	bit	7, h
   75F0 28 01         [12]  271 	jr	Z,00109$
   75F2 23            [ 6]  272 	inc	hl
   75F3                     273 00109$:
   75F3 CB 2C         [ 8]  274 	sra	h
   75F5 CB 1D         [ 8]  275 	rr	l
   75F7 2C            [ 4]  276 	inc	l
   75F8 2C            [ 4]  277 	inc	l
                            278 ;src/background.c:88: u8 tileY = (ty / 4) + 2;
   75F9 DD 4E 06      [19]  279 	ld	c,6 (ix)
   75FC DD 46 07      [19]  280 	ld	b,7 (ix)
   75FF CB 78         [ 8]  281 	bit	7, b
   7601 28 03         [12]  282 	jr	Z,00110$
   7603 03            [ 6]  283 	inc	bc
   7604 03            [ 6]  284 	inc	bc
   7605 03            [ 6]  285 	inc	bc
   7606                     286 00110$:
   7606 CB 28         [ 8]  287 	sra	b
   7608 CB 19         [ 8]  288 	rr	c
   760A CB 28         [ 8]  289 	sra	b
   760C CB 19         [ 8]  290 	rr	c
   760E 0C            [ 4]  291 	inc	c
   760F 0C            [ 4]  292 	inc	c
                            293 ;src/background.c:89: u8 tileW = width / 2;
   7610 DD 5E 08      [19]  294 	ld	e, 8 (ix)
   7613 CB 3B         [ 8]  295 	srl	e
                            296 ;src/background.c:90: u8 tileH = height / 4;
   7615 DD 56 09      [19]  297 	ld	d, 9 (ix)
   7618 CB 3A         [ 8]  298 	srl	d
   761A CB 3A         [ 8]  299 	srl	d
                            300 ;src/background.c:93: if (height % 4 > 0)
   761C DD 7E 09      [19]  301 	ld	a, 9 (ix)
   761F E6 03         [ 7]  302 	and	a, #0x03
   7621 28 01         [12]  303 	jr	Z,00102$
                            304 ;src/background.c:95: tileH++;
   7623 14            [ 4]  305 	inc	d
   7624                     306 00102$:
                            307 ;src/background.c:99: if (width % 2 > 0)
   7624 DD CB 08 46   [20]  308 	bit	0, 8 (ix)
   7628 28 01         [12]  309 	jr	Z,00104$
                            310 ;src/background.c:101: tileW++;
   762A 1C            [ 4]  311 	inc	e
   762B                     312 00104$:
                            313 ;src/background.c:105: if (tx & 1 == 1)
   762B DD CB 04 46   [20]  314 	bit	0, 4 (ix)
   762F 28 01         [12]  315 	jr	Z,00106$
                            316 ;src/background.c:107: tileW += 1;
   7631 1C            [ 4]  317 	inc	e
   7632                     318 00106$:
                            319 ;src/background.c:111: tileY * TILE_H);
   7632 CB 21         [ 8]  320 	sla	c
   7634 CB 21         [ 8]  321 	sla	c
                            322 ;src/background.c:110: pvm = cpct_getScreenPtr(CPCT_VMEM_START, (tileX * TILE_W) + (4 * TILE_W),
   7636 7D            [ 4]  323 	ld	a, l
   7637 87            [ 4]  324 	add	a, a
   7638 C6 08         [ 7]  325 	add	a, #0x08
   763A 47            [ 4]  326 	ld	b, a
   763B D5            [11]  327 	push	de
   763C 79            [ 4]  328 	ld	a, c
   763D F5            [11]  329 	push	af
   763E 33            [ 6]  330 	inc	sp
   763F C5            [11]  331 	push	bc
   7640 33            [ 6]  332 	inc	sp
   7641 21 00 C0      [10]  333 	ld	hl, #0xc000
   7644 E5            [11]  334 	push	hl
   7645 CD FF 8D      [17]  335 	call	_cpct_getScreenPtr
   7648 4D            [ 4]  336 	ld	c, l
   7649 44            [ 4]  337 	ld	b, h
   764A D1            [10]  338 	pop	de
                            339 ;src/background.c:113: cpct_drawSolidBox(pvm, 255, tileW * TILE_W, tileH + TILE_H);
   764B 14            [ 4]  340 	inc	d
   764C 14            [ 4]  341 	inc	d
   764D 14            [ 4]  342 	inc	d
   764E 14            [ 4]  343 	inc	d
   764F 7B            [ 4]  344 	ld	a, e
   7650 87            [ 4]  345 	add	a, a
   7651 5F            [ 4]  346 	ld	e, a
   7652 D5            [11]  347 	push	de
   7653 21 FF 00      [10]  348 	ld	hl, #0x00ff
   7656 E5            [11]  349 	push	hl
   7657 C5            [11]  350 	push	bc
   7658 CD F8 8C      [17]  351 	call	_cpct_drawSolidBox
   765B DD E1         [14]  352 	pop	ix
   765D C9            [10]  353 	ret
                            354 	.area _CODE
                            355 	.area _INITIALIZER
                            356 	.area _CABS (ABS)
