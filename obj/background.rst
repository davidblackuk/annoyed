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
                             11 	.globl _dbg_displayNumber
                             12 	.globl _cpct_etm_setTileset2x4
                             13 	.globl _cpct_etm_drawTileBox2x4
                             14 	.globl _cpct_etm_drawTilemap2x4_f
                             15 	.globl _cpct_getScreenPtr
                             16 	.globl _cpct_drawSolidBox
                             17 	.globl _pvmem
                             18 	.globl _background_initialize
                             19 	.globl _background_bounce_ball
                             20 	.globl _background_restore_world_coords
                             21 	.globl _background_debug_box_wc
                             22 ;--------------------------------------------------------
                             23 ; special function registers
                             24 ;--------------------------------------------------------
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _DATA
   7BF8                      29 _pvmem::
   7BF8                      30 	.ds 2
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
                             55 ;src/background.c:10: void background_initialize()
                             56 ;	---------------------------------
                             57 ; Function background_initialize
                             58 ; ---------------------------------
   66D6                      59 _background_initialize::
                             60 ;src/background.c:13: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X, TILE_MAP_SCREEN_PIXEL_OFFSET_Y);
   66D6 21 08 00      [10]   61 	ld	hl, #0x0008
   66D9 E5            [11]   62 	push	hl
   66DA 21 00 C0      [10]   63 	ld	hl, #0xc000
   66DD E5            [11]   64 	push	hl
   66DE CD 48 7B      [17]   65 	call	_cpct_getScreenPtr
   66E1 22 F8 7B      [16]   66 	ld	(_pvmem), hl
                             67 ;src/background.c:15: cpct_etm_setTileset2x4(g_tileset);
   66E4 21 44 57      [10]   68 	ld	hl, #_g_tileset
   66E7 CD 4E 79      [17]   69 	call	_cpct_etm_setTileset2x4
                             70 ;src/background.c:18: cpct_etm_drawTilemap2x4_f(BACKGROUND_TILMAP_W, BACKGROUND_TILMAP_H, pvmem, current_level->background_tilemap);    
   66EA 2A 71 80      [16]   71 	ld	hl, (_current_level)
   66ED 4E            [ 7]   72 	ld	c, (hl)
   66EE 23            [ 6]   73 	inc	hl
   66EF 46            [ 7]   74 	ld	b, (hl)
   66F0 2A F8 7B      [16]   75 	ld	hl, (_pvmem)
   66F3 C5            [11]   76 	push	bc
   66F4 E5            [11]   77 	push	hl
   66F5 21 1E 32      [10]   78 	ld	hl, #0x321e
   66F8 E5            [11]   79 	push	hl
   66F9 CD 7E 79      [17]   80 	call	_cpct_etm_drawTilemap2x4_f
   66FC C9            [10]   81 	ret
                             82 ;src/background.c:21: BounceHits background_bounce_ball(i16 at_wx, i16 at_wy) {
                             83 ;	---------------------------------
                             84 ; Function background_bounce_ball
                             85 ; ---------------------------------
   66FD                      86 _background_bounce_ball::
                             87 ;src/background.c:23: BounceHits bounces = at_wx < 0 ? BOUNCE_X : 0;
   66FD 21 03 00      [10]   88 	ld	hl, #2+1
   6700 39            [11]   89 	add	hl, sp
   6701 CB 7E         [12]   90 	bit	7, (hl)
   6703 28 04         [12]   91 	jr	Z,00103$
   6705 0E 01         [ 7]   92 	ld	c, #0x01
   6707 18 02         [12]   93 	jr	00104$
   6709                      94 00103$:
   6709 0E 00         [ 7]   95 	ld	c, #0x00
   670B                      96 00104$:
                             97 ;src/background.c:25: bounces |= (at_wx + BALL_WIDTH)  > PLAY_AREA_WIDTH ? BOUNCE_X : BOUNCE_NONE;
   670B 21 02 00      [10]   98 	ld	hl, #2
   670E 39            [11]   99 	add	hl, sp
   670F 5E            [ 7]  100 	ld	e, (hl)
   6710 23            [ 6]  101 	inc	hl
   6711 56            [ 7]  102 	ld	d, (hl)
   6712 13            [ 6]  103 	inc	de
   6713 13            [ 6]  104 	inc	de
   6714 13            [ 6]  105 	inc	de
   6715 3E 34         [ 7]  106 	ld	a, #0x34
   6717 BB            [ 4]  107 	cp	a, e
   6718 3E 00         [ 7]  108 	ld	a, #0x00
   671A 9A            [ 4]  109 	sbc	a, d
   671B E2 20 67      [10]  110 	jp	PO, 00121$
   671E EE 80         [ 7]  111 	xor	a, #0x80
   6720                     112 00121$:
   6720 F2 27 67      [10]  113 	jp	P, 00105$
   6723 3E 01         [ 7]  114 	ld	a, #0x01
   6725 18 02         [12]  115 	jr	00106$
   6727                     116 00105$:
   6727 3E 00         [ 7]  117 	ld	a, #0x00
   6729                     118 00106$:
   6729 B1            [ 4]  119 	or	a, c
   672A 4F            [ 4]  120 	ld	c, a
                            121 ;src/background.c:27: bounces |= (at_wy < 0) ? BOUNCE_Y : BOUNCE_NONE;
   672B 21 05 00      [10]  122 	ld	hl, #4+1
   672E 39            [11]  123 	add	hl, sp
   672F CB 7E         [12]  124 	bit	7, (hl)
   6731 28 04         [12]  125 	jr	Z,00107$
   6733 3E 02         [ 7]  126 	ld	a, #0x02
   6735 18 02         [12]  127 	jr	00108$
   6737                     128 00107$:
   6737 3E 00         [ 7]  129 	ld	a, #0x00
   6739                     130 00108$:
   6739 B1            [ 4]  131 	or	a, c
   673A 6F            [ 4]  132 	ld	l, a
                            133 ;src/background.c:29: return bounces;
   673B C9            [10]  134 	ret
                            135 ;src/background.c:32: void background_restore_world_coords(i16 wx, i16 wy, u8 width, u8 height) {
                            136 ;	---------------------------------
                            137 ; Function background_restore_world_coords
                            138 ; ---------------------------------
   673C                     139 _background_restore_world_coords::
   673C DD E5         [15]  140 	push	ix
   673E DD 21 00 00   [14]  141 	ld	ix,#0
   6742 DD 39         [15]  142 	add	ix,sp
   6744 F5            [11]  143 	push	af
   6745 F5            [11]  144 	push	af
                            145 ;src/background.c:38: u8 tileX =  (wx / 2) + 2;
   6746 DD 4E 04      [19]  146 	ld	c,4 (ix)
   6749 DD 46 05      [19]  147 	ld	b,5 (ix)
   674C CB 78         [ 8]  148 	bit	7, b
   674E 28 01         [12]  149 	jr	Z,00109$
   6750 03            [ 6]  150 	inc	bc
   6751                     151 00109$:
   6751 CB 28         [ 8]  152 	sra	b
   6753 CB 19         [ 8]  153 	rr	c
   6755 79            [ 4]  154 	ld	a, c
   6756 C6 02         [ 7]  155 	add	a, #0x02
   6758 DD 77 FD      [19]  156 	ld	-3 (ix), a
                            157 ;src/background.c:39: u8 tileY = (wy / 4) + 2;
   675B DD 4E 06      [19]  158 	ld	c,6 (ix)
   675E DD 46 07      [19]  159 	ld	b,7 (ix)
   6761 CB 78         [ 8]  160 	bit	7, b
   6763 28 03         [12]  161 	jr	Z,00110$
   6765 03            [ 6]  162 	inc	bc
   6766 03            [ 6]  163 	inc	bc
   6767 03            [ 6]  164 	inc	bc
   6768                     165 00110$:
   6768 CB 28         [ 8]  166 	sra	b
   676A CB 19         [ 8]  167 	rr	c
   676C CB 28         [ 8]  168 	sra	b
   676E CB 19         [ 8]  169 	rr	c
   6770 79            [ 4]  170 	ld	a, c
   6771 C6 02         [ 7]  171 	add	a, #0x02
   6773 DD 77 FC      [19]  172 	ld	-4 (ix), a
                            173 ;src/background.c:40: u8 tileW = width / 2;
   6776 DD 5E 08      [19]  174 	ld	e, 8 (ix)
   6779 CB 3B         [ 8]  175 	srl	e
                            176 ;src/background.c:41: u8 tileH = height / 4;
   677B DD 56 09      [19]  177 	ld	d, 9 (ix)
   677E CB 3A         [ 8]  178 	srl	d
   6780 CB 3A         [ 8]  179 	srl	d
                            180 ;src/background.c:44: if (height % 4 > 0)
   6782 DD 7E 09      [19]  181 	ld	a, 9 (ix)
   6785 E6 03         [ 7]  182 	and	a, #0x03
   6787 28 01         [12]  183 	jr	Z,00102$
                            184 ;src/background.c:46: tileH++;
   6789 14            [ 4]  185 	inc	d
   678A                     186 00102$:
                            187 ;src/background.c:50: if (width % 2 > 0)
   678A DD CB 08 46   [20]  188 	bit	0, 8 (ix)
   678E 28 01         [12]  189 	jr	Z,00104$
                            190 ;src/background.c:52: tileW++;
   6790 1C            [ 4]  191 	inc	e
   6791                     192 00104$:
                            193 ;src/background.c:56: if (wx & 1 == 1)
   6791 DD CB 04 46   [20]  194 	bit	0, 4 (ix)
   6795 28 01         [12]  195 	jr	Z,00106$
                            196 ;src/background.c:58: tileW += 1;
   6797 1C            [ 4]  197 	inc	e
   6798                     198 00106$:
                            199 ;src/background.c:61: cpct_etm_drawTileBox2x4(tileX, tileY, tileW, tileH, BACKGROUND_TILMAP_W, pvmem, current_level->background_tilemap);
   6798 2A 71 80      [16]  200 	ld	hl, (_current_level)
   679B 4E            [ 7]  201 	ld	c, (hl)
   679C 23            [ 6]  202 	inc	hl
   679D 46            [ 7]  203 	ld	b, (hl)
   679E DD 71 FE      [19]  204 	ld	-2 (ix), c
   67A1 DD 70 FF      [19]  205 	ld	-1 (ix), b
   67A4 2A F8 7B      [16]  206 	ld	hl, (_pvmem)
   67A7 DD 4E FE      [19]  207 	ld	c,-2 (ix)
   67AA DD 46 FF      [19]  208 	ld	b,-1 (ix)
   67AD C5            [11]  209 	push	bc
   67AE E5            [11]  210 	push	hl
   67AF 3E 1E         [ 7]  211 	ld	a, #0x1e
   67B1 F5            [11]  212 	push	af
   67B2 33            [ 6]  213 	inc	sp
   67B3 D5            [11]  214 	push	de
   67B4 33            [ 6]  215 	inc	sp
   67B5 53            [ 4]  216 	ld	d, e
   67B6 DD 5E FC      [19]  217 	ld	e, -4 (ix)
   67B9 D5            [11]  218 	push	de
   67BA DD 7E FD      [19]  219 	ld	a, -3 (ix)
   67BD F5            [11]  220 	push	af
   67BE 33            [ 6]  221 	inc	sp
   67BF CD 9C 78      [17]  222 	call	_cpct_etm_drawTileBox2x4
   67C2 DD F9         [10]  223 	ld	sp, ix
   67C4 DD E1         [14]  224 	pop	ix
   67C6 C9            [10]  225 	ret
                            226 ;src/background.c:65: void background_debug_box_wc(i16 wx, i16 wy, u8 width, u8 height) {
                            227 ;	---------------------------------
                            228 ; Function background_debug_box_wc
                            229 ; ---------------------------------
   67C7                     230 _background_debug_box_wc::
   67C7 DD E5         [15]  231 	push	ix
   67C9 DD 21 00 00   [14]  232 	ld	ix,#0
   67CD DD 39         [15]  233 	add	ix,sp
   67CF 3B            [ 6]  234 	dec	sp
                            235 ;src/background.c:71: u8 tileX =  (wx / 2) + 2;
   67D0 DD 4E 04      [19]  236 	ld	c,4 (ix)
   67D3 DD 46 05      [19]  237 	ld	b,5 (ix)
   67D6 CB 78         [ 8]  238 	bit	7, b
   67D8 28 01         [12]  239 	jr	Z,00109$
   67DA 03            [ 6]  240 	inc	bc
   67DB                     241 00109$:
   67DB CB 28         [ 8]  242 	sra	b
   67DD CB 19         [ 8]  243 	rr	c
   67DF 79            [ 4]  244 	ld	a, c
   67E0 C6 02         [ 7]  245 	add	a, #0x02
   67E2 DD 77 FF      [19]  246 	ld	-1 (ix), a
                            247 ;src/background.c:72: u8 tileY = (wy / 4) + 2;
   67E5 DD 5E 06      [19]  248 	ld	e,6 (ix)
   67E8 DD 56 07      [19]  249 	ld	d,7 (ix)
   67EB CB 7A         [ 8]  250 	bit	7, d
   67ED 28 03         [12]  251 	jr	Z,00110$
   67EF 13            [ 6]  252 	inc	de
   67F0 13            [ 6]  253 	inc	de
   67F1 13            [ 6]  254 	inc	de
   67F2                     255 00110$:
   67F2 CB 2A         [ 8]  256 	sra	d
   67F4 CB 1B         [ 8]  257 	rr	e
   67F6 CB 2A         [ 8]  258 	sra	d
   67F8 CB 1B         [ 8]  259 	rr	e
   67FA 1C            [ 4]  260 	inc	e
   67FB 1C            [ 4]  261 	inc	e
                            262 ;src/background.c:73: u8 tileW = width / 2;
   67FC DD 6E 08      [19]  263 	ld	l, 8 (ix)
   67FF CB 3D         [ 8]  264 	srl	l
                            265 ;src/background.c:74: u8 tileH = height / 4;
   6801 DD 56 09      [19]  266 	ld	d, 9 (ix)
   6804 CB 3A         [ 8]  267 	srl	d
   6806 CB 3A         [ 8]  268 	srl	d
                            269 ;src/background.c:77: if (height % 4 > 0)
   6808 DD 7E 09      [19]  270 	ld	a, 9 (ix)
   680B E6 03         [ 7]  271 	and	a, #0x03
   680D 28 01         [12]  272 	jr	Z,00102$
                            273 ;src/background.c:79: tileH++;
   680F 14            [ 4]  274 	inc	d
   6810                     275 00102$:
                            276 ;src/background.c:83: if (width % 2 > 0)
   6810 DD CB 08 46   [20]  277 	bit	0, 8 (ix)
   6814 28 01         [12]  278 	jr	Z,00104$
                            279 ;src/background.c:85: tileW++;
   6816 2C            [ 4]  280 	inc	l
   6817                     281 00104$:
                            282 ;src/background.c:89: if (wx & 1 == 1)
   6817 DD CB 04 46   [20]  283 	bit	0, 4 (ix)
   681B 28 01         [12]  284 	jr	Z,00106$
                            285 ;src/background.c:91: tileW += 1;
   681D 2C            [ 4]  286 	inc	l
   681E                     287 00106$:
                            288 ;src/background.c:95: tileY * TILE_H );
   681E 7B            [ 4]  289 	ld	a, e
   681F 87            [ 4]  290 	add	a, a
   6820 87            [ 4]  291 	add	a, a
   6821 4F            [ 4]  292 	ld	c, a
                            293 ;src/background.c:94: pvm = cpct_getScreenPtr(CPCT_VMEM_START, (tileX * TILE_W) + (4*TILE_W),
   6822 DD 7E FF      [19]  294 	ld	a, -1 (ix)
   6825 87            [ 4]  295 	add	a, a
   6826 C6 08         [ 7]  296 	add	a, #0x08
   6828 67            [ 4]  297 	ld	h, a
   6829 E5            [11]  298 	push	hl
   682A D5            [11]  299 	push	de
   682B 79            [ 4]  300 	ld	a, c
   682C F5            [11]  301 	push	af
   682D 33            [ 6]  302 	inc	sp
   682E E5            [11]  303 	push	hl
   682F 33            [ 6]  304 	inc	sp
   6830 01 00 C0      [10]  305 	ld	bc, #0xc000
   6833 C5            [11]  306 	push	bc
   6834 CD 48 7B      [17]  307 	call	_cpct_getScreenPtr
   6837 4D            [ 4]  308 	ld	c, l
   6838 44            [ 4]  309 	ld	b, h
   6839 D1            [10]  310 	pop	de
   683A E1            [10]  311 	pop	hl
                            312 ;src/background.c:97: cpct_drawSolidBox(pvm, 255, tileW * TILE_W , tileH + TILE_H );
   683B 14            [ 4]  313 	inc	d
   683C 14            [ 4]  314 	inc	d
   683D 14            [ 4]  315 	inc	d
   683E 14            [ 4]  316 	inc	d
   683F 7D            [ 4]  317 	ld	a, l
   6840 87            [ 4]  318 	add	a, a
   6841 D5            [11]  319 	push	de
   6842 5F            [ 4]  320 	ld	e, a
   6843 D5            [11]  321 	push	de
   6844 21 FF 00      [10]  322 	ld	hl, #0x00ff
   6847 E5            [11]  323 	push	hl
   6848 C5            [11]  324 	push	bc
   6849 CD 06 7A      [17]  325 	call	_cpct_drawSolidBox
   684C D1            [10]  326 	pop	de
                            327 ;src/background.c:100: dbg_displayNumber(1, tileX);
   684D DD 4E FF      [19]  328 	ld	c, -1 (ix)
   6850 06 00         [ 7]  329 	ld	b, #0x00
   6852 D5            [11]  330 	push	de
   6853 C5            [11]  331 	push	bc
   6854 3E 01         [ 7]  332 	ld	a, #0x01
   6856 F5            [11]  333 	push	af
   6857 33            [ 6]  334 	inc	sp
   6858 CD A0 72      [17]  335 	call	_dbg_displayNumber
   685B F1            [10]  336 	pop	af
   685C 33            [ 6]  337 	inc	sp
   685D D1            [10]  338 	pop	de
                            339 ;src/background.c:101: dbg_displayNumber(2, tileY);
   685E 16 00         [ 7]  340 	ld	d, #0x00
   6860 D5            [11]  341 	push	de
   6861 3E 02         [ 7]  342 	ld	a, #0x02
   6863 F5            [11]  343 	push	af
   6864 33            [ 6]  344 	inc	sp
   6865 CD A0 72      [17]  345 	call	_dbg_displayNumber
   6868 F1            [10]  346 	pop	af
   6869 33            [ 6]  347 	inc	sp
   686A 33            [ 6]  348 	inc	sp
   686B DD E1         [14]  349 	pop	ix
   686D C9            [10]  350 	ret
                            351 	.area _CODE
                            352 	.area _INITIALIZER
                            353 	.area _CABS (ABS)
