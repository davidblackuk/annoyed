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
                             15 	.globl _pvmem
                             16 	.globl _initializeBackground
                             17 	.globl _restoreBackground
                             18 ;--------------------------------------------------------
                             19 ; special function registers
                             20 ;--------------------------------------------------------
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _DATA
   5468                      25 _pvmem::
   5468                      26 	.ds 2
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _INITIALIZED
                             31 ;--------------------------------------------------------
                             32 ; absolute external ram data
                             33 ;--------------------------------------------------------
                             34 	.area _DABS (ABS)
                             35 ;--------------------------------------------------------
                             36 ; global & static initialisations
                             37 ;--------------------------------------------------------
                             38 	.area _HOME
                             39 	.area _GSINIT
                             40 	.area _GSFINAL
                             41 	.area _GSINIT
                             42 ;--------------------------------------------------------
                             43 ; Home
                             44 ;--------------------------------------------------------
                             45 	.area _HOME
                             46 	.area _HOME
                             47 ;--------------------------------------------------------
                             48 ; code
                             49 ;--------------------------------------------------------
                             50 	.area _CODE
                             51 ;src/background.c:10: void initializeBackground()
                             52 ;	---------------------------------
                             53 ; Function initializeBackground
                             54 ; ---------------------------------
   4B1B                      55 _initializeBackground::
                             56 ;src/background.c:14: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X, TILE_MAP_SCREEN_PIXEL_OFFSET_Y);
   4B1B 21 08 10      [10]   57 	ld	hl, #0x1008
   4B1E E5            [11]   58 	push	hl
   4B1F 21 00 C0      [10]   59 	ld	hl, #0xc000
   4B22 E5            [11]   60 	push	hl
   4B23 CD 55 53      [17]   61 	call	_cpct_getScreenPtr
   4B26 22 68 54      [16]   62 	ld	(_pvmem), hl
                             63 ;src/background.c:16: cpct_etm_setTileset2x4(g_tileset);
   4B29 21 92 45      [10]   64 	ld	hl, #_g_tileset
   4B2C CD 74 52      [17]   65 	call	_cpct_etm_setTileset2x4
                             66 ;src/background.c:19: cpct_etm_drawTilemap2x4_f(g_tilemap_l00_W, g_tilemap_l00_H, pvmem, g_tilemap_l00);
   4B2F 01 00 40      [10]   67 	ld	bc, #_g_tilemap_l00+0
   4B32 2A 68 54      [16]   68 	ld	hl, (_pvmem)
   4B35 C5            [11]   69 	push	bc
   4B36 E5            [11]   70 	push	hl
   4B37 21 1F 2E      [10]   71 	ld	hl, #0x2e1f
   4B3A E5            [11]   72 	push	hl
   4B3B CD A3 52      [17]   73 	call	_cpct_etm_drawTilemap2x4_f
   4B3E C9            [10]   74 	ret
                             75 ;src/background.c:24: void restoreBackground(u8 screenX, u8 screenY, u8 bwidth, u8 pHeight)
                             76 ;	---------------------------------
                             77 ; Function restoreBackground
                             78 ; ---------------------------------
   4B3F                      79 _restoreBackground::
   4B3F DD E5         [15]   80 	push	ix
   4B41 DD 21 00 00   [14]   81 	ld	ix,#0
   4B45 DD 39         [15]   82 	add	ix,sp
   4B47 F5            [11]   83 	push	af
                             84 ;src/background.c:28: u8 tileX = (screenX - TILE_MAP_SCREEN_BYTE_OFFSET_X) / 2;
   4B48 DD 4E 04      [19]   85 	ld	c, 4 (ix)
   4B4B 06 00         [ 7]   86 	ld	b, #0x00
   4B4D 79            [ 4]   87 	ld	a, c
   4B4E C6 F8         [ 7]   88 	add	a, #0xf8
   4B50 5F            [ 4]   89 	ld	e, a
   4B51 78            [ 4]   90 	ld	a, b
   4B52 CE FF         [ 7]   91 	adc	a, #0xff
   4B54 57            [ 4]   92 	ld	d, a
   4B55 6B            [ 4]   93 	ld	l, e
   4B56 62            [ 4]   94 	ld	h, d
   4B57 CB 7A         [ 8]   95 	bit	7, d
   4B59 28 04         [12]   96 	jr	Z,00109$
   4B5B 21 F9 FF      [10]   97 	ld	hl, #0xfff9
   4B5E 09            [11]   98 	add	hl, bc
   4B5F                      99 00109$:
   4B5F CB 2C         [ 8]  100 	sra	h
   4B61 CB 1D         [ 8]  101 	rr	l
   4B63 DD 75 FE      [19]  102 	ld	-2 (ix), l
                            103 ;src/background.c:29: u8 tileY = (screenY - TILE_MAP_SCREEN_PIXEL_OFFSET_Y) / 4;
   4B66 DD 4E 05      [19]  104 	ld	c, 5 (ix)
   4B69 06 00         [ 7]  105 	ld	b, #0x00
   4B6B 79            [ 4]  106 	ld	a, c
   4B6C C6 F0         [ 7]  107 	add	a, #0xf0
   4B6E 5F            [ 4]  108 	ld	e, a
   4B6F 78            [ 4]  109 	ld	a, b
   4B70 CE FF         [ 7]  110 	adc	a, #0xff
   4B72 57            [ 4]  111 	ld	d, a
   4B73 6B            [ 4]  112 	ld	l, e
   4B74 62            [ 4]  113 	ld	h, d
   4B75 CB 7A         [ 8]  114 	bit	7, d
   4B77 28 04         [12]  115 	jr	Z,00110$
   4B79 21 F3 FF      [10]  116 	ld	hl, #0xfff3
   4B7C 09            [11]  117 	add	hl, bc
   4B7D                     118 00110$:
   4B7D CB 2C         [ 8]  119 	sra	h
   4B7F CB 1D         [ 8]  120 	rr	l
   4B81 CB 2C         [ 8]  121 	sra	h
   4B83 CB 1D         [ 8]  122 	rr	l
   4B85 DD 75 FF      [19]  123 	ld	-1 (ix), l
                            124 ;src/background.c:30: u8 tileW = bwidth / 2;
   4B88 DD 5E 06      [19]  125 	ld	e, 6 (ix)
   4B8B CB 3B         [ 8]  126 	srl	e
                            127 ;src/background.c:31: u8 tileH = pHeight / 4;
   4B8D DD 56 07      [19]  128 	ld	d, 7 (ix)
   4B90 CB 3A         [ 8]  129 	srl	d
   4B92 CB 3A         [ 8]  130 	srl	d
                            131 ;src/background.c:33: if (pHeight % 4 > 0) {
   4B94 DD 7E 07      [19]  132 	ld	a, 7 (ix)
   4B97 E6 03         [ 7]  133 	and	a, #0x03
   4B99 28 01         [12]  134 	jr	Z,00102$
                            135 ;src/background.c:34: tileH ++;
   4B9B 14            [ 4]  136 	inc	d
   4B9C                     137 00102$:
                            138 ;src/background.c:37: if (bwidth % 2 > 0) {
   4B9C DD CB 06 46   [20]  139 	bit	0, 6 (ix)
   4BA0 28 01         [12]  140 	jr	Z,00104$
                            141 ;src/background.c:38: tileW ++;
   4BA2 1C            [ 4]  142 	inc	e
   4BA3                     143 00104$:
                            144 ;src/background.c:41: if (screenX & 1 == 1)
   4BA3 DD CB 04 46   [20]  145 	bit	0, 4 (ix)
   4BA7 28 01         [12]  146 	jr	Z,00106$
                            147 ;src/background.c:43: tileW += 1;
   4BA9 1C            [ 4]  148 	inc	e
   4BAA                     149 00106$:
                            150 ;src/background.c:46: cpct_etm_drawTileBox2x4(tileX, tileY, tileW , tileH , g_tilemap_l00_W, pvmem, g_tilemap_l00);
   4BAA 2A 68 54      [16]  151 	ld	hl, (_pvmem)
   4BAD 01 00 40      [10]  152 	ld	bc, #_g_tilemap_l00
   4BB0 C5            [11]  153 	push	bc
   4BB1 E5            [11]  154 	push	hl
   4BB2 3E 1F         [ 7]  155 	ld	a, #0x1f
   4BB4 F5            [11]  156 	push	af
   4BB5 33            [ 6]  157 	inc	sp
   4BB6 D5            [11]  158 	push	de
   4BB7 33            [ 6]  159 	inc	sp
   4BB8 53            [ 4]  160 	ld	d, e
   4BB9 DD 5E FF      [19]  161 	ld	e, -1 (ix)
   4BBC D5            [11]  162 	push	de
   4BBD DD 7E FE      [19]  163 	ld	a, -2 (ix)
   4BC0 F5            [11]  164 	push	af
   4BC1 33            [ 6]  165 	inc	sp
   4BC2 CD C2 51      [17]  166 	call	_cpct_etm_drawTileBox2x4
   4BC5 DD F9         [10]  167 	ld	sp, ix
   4BC7 DD E1         [14]  168 	pop	ix
   4BC9 C9            [10]  169 	ret
                            170 	.area _CODE
                            171 	.area _INITIALIZER
                            172 	.area _CABS (ABS)
