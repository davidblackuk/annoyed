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
                             20 	.globl _background_debug_box_wc
                             21 ;--------------------------------------------------------
                             22 ; special function registers
                             23 ;--------------------------------------------------------
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DATA
   8391                      28 _pvmem::
   8391                      29 	.ds 2
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _INITIALIZED
                             34 ;--------------------------------------------------------
                             35 ; absolute external ram data
                             36 ;--------------------------------------------------------
                             37 	.area _DABS (ABS)
                             38 ;--------------------------------------------------------
                             39 ; global & static initialisations
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _GSINIT
                             43 	.area _GSFINAL
                             44 	.area _GSINIT
                             45 ;--------------------------------------------------------
                             46 ; Home
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _HOME
                             50 ;--------------------------------------------------------
                             51 ; code
                             52 ;--------------------------------------------------------
                             53 	.area _CODE
                             54 ;src/background.c:17: void background_initialize()
                             55 ;	---------------------------------
                             56 ; Function background_initialize
                             57 ; ---------------------------------
   69F8                      58 _background_initialize::
                             59 ;src/background.c:20: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X, TILE_MAP_SCREEN_PIXEL_OFFSET_Y);
   69F8 21 08 00      [10]   60 	ld	hl, #0x0008
   69FB E5            [11]   61 	push	hl
   69FC 21 00 C0      [10]   62 	ld	hl, #0xc000
   69FF E5            [11]   63 	push	hl
   6A00 CD BE 82      [17]   64 	call	_cpct_getScreenPtr
   6A03 22 91 83      [16]   65 	ld	(_pvmem), hl
                             66 ;src/background.c:22: cpct_etm_setTileset2x4(g_tileset);
   6A06 21 44 57      [10]   67 	ld	hl, #_g_tileset
   6A09 CD C1 80      [17]   68 	call	_cpct_etm_setTileset2x4
                             69 ;src/background.c:25: cpct_etm_drawTilemap2x4_f(BACKGROUND_TILMAP_W, BACKGROUND_TILMAP_H, pvmem, current_level->background_tilemap);
   6A0C 2A 0E 88      [16]   70 	ld	hl, (_current_level)
   6A0F 4E            [ 7]   71 	ld	c, (hl)
   6A10 23            [ 6]   72 	inc	hl
   6A11 46            [ 7]   73 	ld	b, (hl)
   6A12 2A 91 83      [16]   74 	ld	hl, (_pvmem)
   6A15 C5            [11]   75 	push	bc
   6A16 E5            [11]   76 	push	hl
   6A17 21 1E 32      [10]   77 	ld	hl, #0x321e
   6A1A E5            [11]   78 	push	hl
   6A1B CD 20 81      [17]   79 	call	_cpct_etm_drawTilemap2x4_f
   6A1E C9            [10]   80 	ret
                             81 ;src/background.c:28: BounceHits background_bounce_ball(i16 at_wx, i16 at_wy)
                             82 ;	---------------------------------
                             83 ; Function background_bounce_ball
                             84 ; ---------------------------------
   6A1F                      85 _background_bounce_ball::
                             86 ;src/background.c:31: BounceHits bounces = at_wx < 0 ? BOUNCE_X : 0;
   6A1F 21 03 00      [10]   87 	ld	hl, #2+1
   6A22 39            [11]   88 	add	hl, sp
   6A23 CB 7E         [12]   89 	bit	7, (hl)
   6A25 28 04         [12]   90 	jr	Z,00103$
   6A27 0E 01         [ 7]   91 	ld	c, #0x01
   6A29 18 02         [12]   92 	jr	00104$
   6A2B                      93 00103$:
   6A2B 0E 00         [ 7]   94 	ld	c, #0x00
   6A2D                      95 00104$:
                             96 ;src/background.c:33: bounces |= (at_wx + BALL_WIDTH) > PLAY_AREA_WIDTH ? BOUNCE_X : BOUNCE_NONE;
   6A2D 21 02 00      [10]   97 	ld	hl, #2
   6A30 39            [11]   98 	add	hl, sp
   6A31 5E            [ 7]   99 	ld	e, (hl)
   6A32 23            [ 6]  100 	inc	hl
   6A33 56            [ 7]  101 	ld	d, (hl)
   6A34 13            [ 6]  102 	inc	de
   6A35 13            [ 6]  103 	inc	de
   6A36 13            [ 6]  104 	inc	de
   6A37 3E 34         [ 7]  105 	ld	a, #0x34
   6A39 BB            [ 4]  106 	cp	a, e
   6A3A 3E 00         [ 7]  107 	ld	a, #0x00
   6A3C 9A            [ 4]  108 	sbc	a, d
   6A3D E2 42 6A      [10]  109 	jp	PO, 00121$
   6A40 EE 80         [ 7]  110 	xor	a, #0x80
   6A42                     111 00121$:
   6A42 F2 49 6A      [10]  112 	jp	P, 00105$
   6A45 3E 01         [ 7]  113 	ld	a, #0x01
   6A47 18 02         [12]  114 	jr	00106$
   6A49                     115 00105$:
   6A49 3E 00         [ 7]  116 	ld	a, #0x00
   6A4B                     117 00106$:
   6A4B B1            [ 4]  118 	or	a, c
   6A4C 4F            [ 4]  119 	ld	c, a
                            120 ;src/background.c:35: bounces |= (at_wy < 0) ? BOUNCE_Y : BOUNCE_NONE;
   6A4D 21 05 00      [10]  121 	ld	hl, #4+1
   6A50 39            [11]  122 	add	hl, sp
   6A51 CB 7E         [12]  123 	bit	7, (hl)
   6A53 28 04         [12]  124 	jr	Z,00107$
   6A55 3E 02         [ 7]  125 	ld	a, #0x02
   6A57 18 02         [12]  126 	jr	00108$
   6A59                     127 00107$:
   6A59 3E 00         [ 7]  128 	ld	a, #0x00
   6A5B                     129 00108$:
   6A5B B1            [ 4]  130 	or	a, c
   6A5C 6F            [ 4]  131 	ld	l, a
                            132 ;src/background.c:37: return bounces;
   6A5D C9            [10]  133 	ret
                            134 ;src/background.c:40: void background_restore_world_coords(i16 wx, i16 wy, u8 width, u8 height)
                            135 ;	---------------------------------
                            136 ; Function background_restore_world_coords
                            137 ; ---------------------------------
   6A5E                     138 _background_restore_world_coords::
   6A5E DD E5         [15]  139 	push	ix
   6A60 DD 21 00 00   [14]  140 	ld	ix,#0
   6A64 DD 39         [15]  141 	add	ix,sp
   6A66 F5            [11]  142 	push	af
   6A67 F5            [11]  143 	push	af
                            144 ;src/background.c:47: u8 tileX = (wx / 2) + 2;
   6A68 DD 4E 04      [19]  145 	ld	c,4 (ix)
   6A6B DD 46 05      [19]  146 	ld	b,5 (ix)
   6A6E CB 78         [ 8]  147 	bit	7, b
   6A70 28 01         [12]  148 	jr	Z,00109$
   6A72 03            [ 6]  149 	inc	bc
   6A73                     150 00109$:
   6A73 CB 28         [ 8]  151 	sra	b
   6A75 CB 19         [ 8]  152 	rr	c
   6A77 79            [ 4]  153 	ld	a, c
   6A78 C6 02         [ 7]  154 	add	a, #0x02
   6A7A DD 77 FC      [19]  155 	ld	-4 (ix), a
                            156 ;src/background.c:48: u8 tileY = (wy / 4) + 2;
   6A7D DD 4E 06      [19]  157 	ld	c,6 (ix)
   6A80 DD 46 07      [19]  158 	ld	b,7 (ix)
   6A83 CB 78         [ 8]  159 	bit	7, b
   6A85 28 03         [12]  160 	jr	Z,00110$
   6A87 03            [ 6]  161 	inc	bc
   6A88 03            [ 6]  162 	inc	bc
   6A89 03            [ 6]  163 	inc	bc
   6A8A                     164 00110$:
   6A8A CB 28         [ 8]  165 	sra	b
   6A8C CB 19         [ 8]  166 	rr	c
   6A8E CB 28         [ 8]  167 	sra	b
   6A90 CB 19         [ 8]  168 	rr	c
   6A92 79            [ 4]  169 	ld	a, c
   6A93 C6 02         [ 7]  170 	add	a, #0x02
   6A95 DD 77 FD      [19]  171 	ld	-3 (ix), a
                            172 ;src/background.c:49: u8 tileW = width / 2;
   6A98 DD 5E 08      [19]  173 	ld	e, 8 (ix)
   6A9B CB 3B         [ 8]  174 	srl	e
                            175 ;src/background.c:50: u8 tileH = height / 4;
   6A9D DD 56 09      [19]  176 	ld	d, 9 (ix)
   6AA0 CB 3A         [ 8]  177 	srl	d
   6AA2 CB 3A         [ 8]  178 	srl	d
                            179 ;src/background.c:53: if (height % 4 > 0)
   6AA4 DD 7E 09      [19]  180 	ld	a, 9 (ix)
   6AA7 E6 03         [ 7]  181 	and	a, #0x03
   6AA9 28 01         [12]  182 	jr	Z,00102$
                            183 ;src/background.c:55: tileH++;
   6AAB 14            [ 4]  184 	inc	d
   6AAC                     185 00102$:
                            186 ;src/background.c:59: if (width % 2 > 0)
   6AAC DD CB 08 46   [20]  187 	bit	0, 8 (ix)
   6AB0 28 01         [12]  188 	jr	Z,00104$
                            189 ;src/background.c:61: tileW++;
   6AB2 1C            [ 4]  190 	inc	e
   6AB3                     191 00104$:
                            192 ;src/background.c:65: if (wx & 1 == 1)
   6AB3 DD CB 04 46   [20]  193 	bit	0, 4 (ix)
   6AB7 28 01         [12]  194 	jr	Z,00106$
                            195 ;src/background.c:67: tileW += 1;
   6AB9 1C            [ 4]  196 	inc	e
   6ABA                     197 00106$:
                            198 ;src/background.c:70: cpct_etm_drawTileBox2x4(tileX, tileY, tileW, tileH, BACKGROUND_TILMAP_W, pvmem, current_level->background_tilemap);
   6ABA 2A 0E 88      [16]  199 	ld	hl, (_current_level)
   6ABD 4E            [ 7]  200 	ld	c, (hl)
   6ABE 23            [ 6]  201 	inc	hl
   6ABF 46            [ 7]  202 	ld	b, (hl)
   6AC0 DD 71 FE      [19]  203 	ld	-2 (ix), c
   6AC3 DD 70 FF      [19]  204 	ld	-1 (ix), b
   6AC6 2A 91 83      [16]  205 	ld	hl, (_pvmem)
   6AC9 DD 4E FE      [19]  206 	ld	c,-2 (ix)
   6ACC DD 46 FF      [19]  207 	ld	b,-1 (ix)
   6ACF C5            [11]  208 	push	bc
   6AD0 E5            [11]  209 	push	hl
   6AD1 3E 1E         [ 7]  210 	ld	a, #0x1e
   6AD3 F5            [11]  211 	push	af
   6AD4 33            [ 6]  212 	inc	sp
   6AD5 D5            [11]  213 	push	de
   6AD6 33            [ 6]  214 	inc	sp
   6AD7 53            [ 4]  215 	ld	d, e
   6AD8 DD 5E FD      [19]  216 	ld	e, -3 (ix)
   6ADB D5            [11]  217 	push	de
   6ADC DD 7E FC      [19]  218 	ld	a, -4 (ix)
   6ADF F5            [11]  219 	push	af
   6AE0 33            [ 6]  220 	inc	sp
   6AE1 CD F8 7F      [17]  221 	call	_cpct_etm_drawTileBox2x4
   6AE4 DD F9         [10]  222 	ld	sp, ix
   6AE6 DD E1         [14]  223 	pop	ix
   6AE8 C9            [10]  224 	ret
                            225 ;src/background.c:73: void background_debug_box_wc(i16 wx, i16 wy, u8 width, u8 height)
                            226 ;	---------------------------------
                            227 ; Function background_debug_box_wc
                            228 ; ---------------------------------
   6AE9                     229 _background_debug_box_wc::
   6AE9 DD E5         [15]  230 	push	ix
   6AEB DD 21 00 00   [14]  231 	ld	ix,#0
   6AEF DD 39         [15]  232 	add	ix,sp
                            233 ;src/background.c:80: u8 tileX = (wx / 2) + 2;
   6AF1 DD 6E 04      [19]  234 	ld	l,4 (ix)
   6AF4 DD 66 05      [19]  235 	ld	h,5 (ix)
   6AF7 CB 7C         [ 8]  236 	bit	7, h
   6AF9 28 01         [12]  237 	jr	Z,00109$
   6AFB 23            [ 6]  238 	inc	hl
   6AFC                     239 00109$:
   6AFC CB 2C         [ 8]  240 	sra	h
   6AFE CB 1D         [ 8]  241 	rr	l
   6B00 2C            [ 4]  242 	inc	l
   6B01 2C            [ 4]  243 	inc	l
                            244 ;src/background.c:81: u8 tileY = (wy / 4) + 2;
   6B02 DD 4E 06      [19]  245 	ld	c,6 (ix)
   6B05 DD 46 07      [19]  246 	ld	b,7 (ix)
   6B08 CB 78         [ 8]  247 	bit	7, b
   6B0A 28 03         [12]  248 	jr	Z,00110$
   6B0C 03            [ 6]  249 	inc	bc
   6B0D 03            [ 6]  250 	inc	bc
   6B0E 03            [ 6]  251 	inc	bc
   6B0F                     252 00110$:
   6B0F CB 28         [ 8]  253 	sra	b
   6B11 CB 19         [ 8]  254 	rr	c
   6B13 CB 28         [ 8]  255 	sra	b
   6B15 CB 19         [ 8]  256 	rr	c
   6B17 0C            [ 4]  257 	inc	c
   6B18 0C            [ 4]  258 	inc	c
                            259 ;src/background.c:82: u8 tileW = width / 2;
   6B19 DD 5E 08      [19]  260 	ld	e, 8 (ix)
   6B1C CB 3B         [ 8]  261 	srl	e
                            262 ;src/background.c:83: u8 tileH = height / 4;
   6B1E DD 56 09      [19]  263 	ld	d, 9 (ix)
   6B21 CB 3A         [ 8]  264 	srl	d
   6B23 CB 3A         [ 8]  265 	srl	d
                            266 ;src/background.c:86: if (height % 4 > 0)
   6B25 DD 7E 09      [19]  267 	ld	a, 9 (ix)
   6B28 E6 03         [ 7]  268 	and	a, #0x03
   6B2A 28 01         [12]  269 	jr	Z,00102$
                            270 ;src/background.c:88: tileH++;
   6B2C 14            [ 4]  271 	inc	d
   6B2D                     272 00102$:
                            273 ;src/background.c:92: if (width % 2 > 0)
   6B2D DD CB 08 46   [20]  274 	bit	0, 8 (ix)
   6B31 28 01         [12]  275 	jr	Z,00104$
                            276 ;src/background.c:94: tileW++;
   6B33 1C            [ 4]  277 	inc	e
   6B34                     278 00104$:
                            279 ;src/background.c:98: if (wx & 1 == 1)
   6B34 DD CB 04 46   [20]  280 	bit	0, 4 (ix)
   6B38 28 01         [12]  281 	jr	Z,00106$
                            282 ;src/background.c:100: tileW += 1;
   6B3A 1C            [ 4]  283 	inc	e
   6B3B                     284 00106$:
                            285 ;src/background.c:104: tileY * TILE_H);
   6B3B CB 21         [ 8]  286 	sla	c
   6B3D CB 21         [ 8]  287 	sla	c
                            288 ;src/background.c:103: pvm = cpct_getScreenPtr(CPCT_VMEM_START, (tileX * TILE_W) + (4 * TILE_W),
   6B3F 7D            [ 4]  289 	ld	a, l
   6B40 87            [ 4]  290 	add	a, a
   6B41 C6 08         [ 7]  291 	add	a, #0x08
   6B43 47            [ 4]  292 	ld	b, a
   6B44 D5            [11]  293 	push	de
   6B45 79            [ 4]  294 	ld	a, c
   6B46 F5            [11]  295 	push	af
   6B47 33            [ 6]  296 	inc	sp
   6B48 C5            [11]  297 	push	bc
   6B49 33            [ 6]  298 	inc	sp
   6B4A 21 00 C0      [10]  299 	ld	hl, #0xc000
   6B4D E5            [11]  300 	push	hl
   6B4E CD BE 82      [17]  301 	call	_cpct_getScreenPtr
   6B51 4D            [ 4]  302 	ld	c, l
   6B52 44            [ 4]  303 	ld	b, h
   6B53 D1            [10]  304 	pop	de
                            305 ;src/background.c:106: cpct_drawSolidBox(pvm, 255, tileW * TILE_W, tileH + TILE_H);
   6B54 14            [ 4]  306 	inc	d
   6B55 14            [ 4]  307 	inc	d
   6B56 14            [ 4]  308 	inc	d
   6B57 14            [ 4]  309 	inc	d
   6B58 7B            [ 4]  310 	ld	a, e
   6B59 87            [ 4]  311 	add	a, a
   6B5A 5F            [ 4]  312 	ld	e, a
   6B5B D5            [11]  313 	push	de
   6B5C 21 FF 00      [10]  314 	ld	hl, #0x00ff
   6B5F E5            [11]  315 	push	hl
   6B60 C5            [11]  316 	push	bc
   6B61 CD B7 81      [17]  317 	call	_cpct_drawSolidBox
   6B64 DD E1         [14]  318 	pop	ix
   6B66 C9            [10]  319 	ret
                            320 	.area _CODE
                            321 	.area _INITIALIZER
                            322 	.area _CABS (ABS)
