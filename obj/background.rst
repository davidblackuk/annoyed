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
                             16 	.globl _background_initialize
                             17 	.globl _background_restore_world_coords
                             18 	.globl _background_restore
                             19 ;--------------------------------------------------------
                             20 ; special function registers
                             21 ;--------------------------------------------------------
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _DATA
   72BF                      26 _pvmem::
   72BF                      27 	.ds 2
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _INITIALIZED
                             32 ;--------------------------------------------------------
                             33 ; absolute external ram data
                             34 ;--------------------------------------------------------
                             35 	.area _DABS (ABS)
                             36 ;--------------------------------------------------------
                             37 ; global & static initialisations
                             38 ;--------------------------------------------------------
                             39 	.area _HOME
                             40 	.area _GSINIT
                             41 	.area _GSFINAL
                             42 	.area _GSINIT
                             43 ;--------------------------------------------------------
                             44 ; Home
                             45 ;--------------------------------------------------------
                             46 	.area _HOME
                             47 	.area _HOME
                             48 ;--------------------------------------------------------
                             49 ; code
                             50 ;--------------------------------------------------------
                             51 	.area _CODE
                             52 ;src/background.c:11: void background_initialize()
                             53 ;	---------------------------------
                             54 ; Function background_initialize
                             55 ; ---------------------------------
   60D6                      56 _background_initialize::
                             57 ;src/background.c:16: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X, TILE_MAP_SCREEN_PIXEL_OFFSET_Y);
   60D6 21 08 00      [10]   58 	ld	hl, #0x0008
   60D9 E5            [11]   59 	push	hl
   60DA 21 00 C0      [10]   60 	ld	hl, #0xc000
   60DD E5            [11]   61 	push	hl
   60DE CD 0F 72      [17]   62 	call	_cpct_getScreenPtr
   60E1 22 BF 72      [16]   63 	ld	(_pvmem), hl
                             64 ;src/background.c:18: cpct_etm_setTileset2x4(g_tileset);
   60E4 21 68 51      [10]   65 	ld	hl, #_g_tileset
   60E7 CD 50 70      [17]   66 	call	_cpct_etm_setTileset2x4
                             67 ;src/background.c:21: cpct_etm_drawTilemap2x4_f(BACKGROUND_TILMAP_W, BACKGROUND_TILMAP_H, pvmem, current_level->background_tilemap);
   60EA 2A BE 75      [16]   68 	ld	hl, (_current_level)
   60ED 4E            [ 7]   69 	ld	c, (hl)
   60EE 23            [ 6]   70 	inc	hl
   60EF 46            [ 7]   71 	ld	b, (hl)
   60F0 2A BF 72      [16]   72 	ld	hl, (_pvmem)
   60F3 C5            [11]   73 	push	bc
   60F4 E5            [11]   74 	push	hl
   60F5 21 1E 32      [10]   75 	ld	hl, #0x321e
   60F8 E5            [11]   76 	push	hl
   60F9 CD 80 70      [17]   77 	call	_cpct_etm_drawTilemap2x4_f
   60FC C9            [10]   78 	ret
                             79 ;src/background.c:26: void background_restore_world_coords(u8 x, u8 y, u8 width, u8 height) {
                             80 ;	---------------------------------
                             81 ; Function background_restore_world_coords
                             82 ; ---------------------------------
   60FD                      83 _background_restore_world_coords::
   60FD DD E5         [15]   84 	push	ix
   60FF DD 21 00 00   [14]   85 	ld	ix,#0
   6103 DD 39         [15]   86 	add	ix,sp
   6105 F5            [11]   87 	push	af
   6106 3B            [ 6]   88 	dec	sp
                             89 ;src/background.c:29: u8 tileX = 2 + (x / 2);
   6107 DD 7E 04      [19]   90 	ld	a, 4 (ix)
   610A CB 3F         [ 8]   91 	srl	a
   610C C6 02         [ 7]   92 	add	a, #0x02
   610E DD 77 FD      [19]   93 	ld	-3 (ix), a
                             94 ;src/background.c:30: u8 tileY = 1 + (y / 4);
   6111 DD 4E 05      [19]   95 	ld	c, 5 (ix)
   6114 CB 39         [ 8]   96 	srl	c
   6116 CB 39         [ 8]   97 	srl	c
   6118 0C            [ 4]   98 	inc	c
                             99 ;src/background.c:31: u8 tileW = width / 2;
   6119 DD 46 06      [19]  100 	ld	b, 6 (ix)
   611C CB 38         [ 8]  101 	srl	b
                            102 ;src/background.c:32: u8 tileH = height / 4;
   611E DD 5E 07      [19]  103 	ld	e, 7 (ix)
   6121 CB 3B         [ 8]  104 	srl	e
   6123 CB 3B         [ 8]  105 	srl	e
                            106 ;src/background.c:34: if (height % 4 > 0)
   6125 DD 7E 07      [19]  107 	ld	a, 7 (ix)
   6128 E6 03         [ 7]  108 	and	a, #0x03
   612A 28 01         [12]  109 	jr	Z,00102$
                            110 ;src/background.c:36: tileH++;
   612C 1C            [ 4]  111 	inc	e
   612D                     112 00102$:
                            113 ;src/background.c:39: if (width % 2 > 0)
   612D DD CB 06 46   [20]  114 	bit	0, 6 (ix)
   6131 28 01         [12]  115 	jr	Z,00104$
                            116 ;src/background.c:41: tileW++;
   6133 04            [ 4]  117 	inc	b
   6134                     118 00104$:
                            119 ;src/background.c:44: if (x & 1 == 1)
   6134 DD CB 04 46   [20]  120 	bit	0, 4 (ix)
   6138 28 01         [12]  121 	jr	Z,00106$
                            122 ;src/background.c:46: tileW += 1;
   613A 04            [ 4]  123 	inc	b
   613B                     124 00106$:
                            125 ;src/background.c:49: cpct_etm_drawTileBox2x4(tileX, tileY, tileW, tileH, BACKGROUND_TILMAP_W, pvmem, current_level->background_tilemap);
   613B 2A BE 75      [16]  126 	ld	hl, (_current_level)
   613E 7E            [ 7]  127 	ld	a, (hl)
   613F 23            [ 6]  128 	inc	hl
   6140 66            [ 7]  129 	ld	h, (hl)
   6141 DD 77 FE      [19]  130 	ld	-2 (ix), a
   6144 DD 74 FF      [19]  131 	ld	-1 (ix), h
   6147 FD 2A BF 72   [20]  132 	ld	iy, (_pvmem)
   614B DD 6E FE      [19]  133 	ld	l,-2 (ix)
   614E DD 66 FF      [19]  134 	ld	h,-1 (ix)
   6151 E5            [11]  135 	push	hl
   6152 FD E5         [15]  136 	push	iy
   6154 16 1E         [ 7]  137 	ld	d,#0x1e
   6156 D5            [11]  138 	push	de
   6157 C5            [11]  139 	push	bc
   6158 DD 7E FD      [19]  140 	ld	a, -3 (ix)
   615B F5            [11]  141 	push	af
   615C 33            [ 6]  142 	inc	sp
   615D CD 9E 6F      [17]  143 	call	_cpct_etm_drawTileBox2x4
   6160 DD F9         [10]  144 	ld	sp, ix
   6162 DD E1         [14]  145 	pop	ix
   6164 C9            [10]  146 	ret
                            147 ;src/background.c:54: void background_restore(u8 screenX, u8 screenY, u8 bwidth, u8 pHeight)
                            148 ;	---------------------------------
                            149 ; Function background_restore
                            150 ; ---------------------------------
   6165                     151 _background_restore::
   6165 DD E5         [15]  152 	push	ix
   6167 DD 21 00 00   [14]  153 	ld	ix,#0
   616B DD 39         [15]  154 	add	ix,sp
   616D F5            [11]  155 	push	af
   616E F5            [11]  156 	push	af
                            157 ;src/background.c:58: u8 tileX = (screenX - TILE_MAP_SCREEN_BYTE_OFFSET_X) / 2;
   616F DD 4E 04      [19]  158 	ld	c, 4 (ix)
   6172 06 00         [ 7]  159 	ld	b, #0x00
   6174 79            [ 4]  160 	ld	a, c
   6175 C6 F8         [ 7]  161 	add	a, #0xf8
   6177 5F            [ 4]  162 	ld	e, a
   6178 78            [ 4]  163 	ld	a, b
   6179 CE FF         [ 7]  164 	adc	a, #0xff
   617B 57            [ 4]  165 	ld	d, a
   617C 6B            [ 4]  166 	ld	l, e
   617D 62            [ 4]  167 	ld	h, d
   617E CB 7A         [ 8]  168 	bit	7, d
   6180 28 04         [12]  169 	jr	Z,00109$
   6182 21 F9 FF      [10]  170 	ld	hl, #0xfff9
   6185 09            [11]  171 	add	hl, bc
   6186                     172 00109$:
   6186 CB 2C         [ 8]  173 	sra	h
   6188 CB 1D         [ 8]  174 	rr	l
   618A DD 75 FD      [19]  175 	ld	-3 (ix), l
                            176 ;src/background.c:59: u8 tileY = (screenY - TILE_MAP_SCREEN_PIXEL_OFFSET_Y) / 4;
   618D DD 4E 05      [19]  177 	ld	c, 5 (ix)
   6190 06 00         [ 7]  178 	ld	b, #0x00
   6192 59            [ 4]  179 	ld	e, c
   6193 68            [ 4]  180 	ld	l, b
   6194 CB 78         [ 8]  181 	bit	7, b
   6196 28 05         [12]  182 	jr	Z,00110$
   6198 03            [ 6]  183 	inc	bc
   6199 03            [ 6]  184 	inc	bc
   619A 03            [ 6]  185 	inc	bc
   619B 59            [ 4]  186 	ld	e, c
   619C 68            [ 4]  187 	ld	l, b
   619D                     188 00110$:
   619D CB 2D         [ 8]  189 	sra	l
   619F CB 1B         [ 8]  190 	rr	e
   61A1 CB 2D         [ 8]  191 	sra	l
   61A3 CB 1B         [ 8]  192 	rr	e
   61A5 DD 73 FC      [19]  193 	ld	-4 (ix), e
                            194 ;src/background.c:60: u8 tileW = bwidth / 2;
   61A8 DD 5E 06      [19]  195 	ld	e, 6 (ix)
   61AB CB 3B         [ 8]  196 	srl	e
                            197 ;src/background.c:61: u8 tileH = pHeight / 4;
   61AD DD 56 07      [19]  198 	ld	d, 7 (ix)
   61B0 CB 3A         [ 8]  199 	srl	d
   61B2 CB 3A         [ 8]  200 	srl	d
                            201 ;src/background.c:63: if (pHeight % 4 > 0)
   61B4 DD 7E 07      [19]  202 	ld	a, 7 (ix)
   61B7 E6 03         [ 7]  203 	and	a, #0x03
   61B9 28 01         [12]  204 	jr	Z,00102$
                            205 ;src/background.c:65: tileH++;
   61BB 14            [ 4]  206 	inc	d
   61BC                     207 00102$:
                            208 ;src/background.c:68: if (bwidth % 2 > 0)
   61BC DD CB 06 46   [20]  209 	bit	0, 6 (ix)
   61C0 28 01         [12]  210 	jr	Z,00104$
                            211 ;src/background.c:70: tileW++;
   61C2 1C            [ 4]  212 	inc	e
   61C3                     213 00104$:
                            214 ;src/background.c:73: if (screenX & 1 == 1)
   61C3 DD CB 04 46   [20]  215 	bit	0, 4 (ix)
   61C7 28 01         [12]  216 	jr	Z,00106$
                            217 ;src/background.c:75: tileW += 1;
   61C9 1C            [ 4]  218 	inc	e
   61CA                     219 00106$:
                            220 ;src/background.c:78: cpct_etm_drawTileBox2x4(tileX, tileY, tileW, tileH, BACKGROUND_TILMAP_W, pvmem, current_level->background_tilemap);
   61CA 2A BE 75      [16]  221 	ld	hl, (_current_level)
   61CD 4E            [ 7]  222 	ld	c, (hl)
   61CE 23            [ 6]  223 	inc	hl
   61CF 46            [ 7]  224 	ld	b, (hl)
   61D0 DD 71 FE      [19]  225 	ld	-2 (ix), c
   61D3 DD 70 FF      [19]  226 	ld	-1 (ix), b
   61D6 2A BF 72      [16]  227 	ld	hl, (_pvmem)
   61D9 DD 4E FE      [19]  228 	ld	c,-2 (ix)
   61DC DD 46 FF      [19]  229 	ld	b,-1 (ix)
   61DF C5            [11]  230 	push	bc
   61E0 E5            [11]  231 	push	hl
   61E1 3E 1E         [ 7]  232 	ld	a, #0x1e
   61E3 F5            [11]  233 	push	af
   61E4 33            [ 6]  234 	inc	sp
   61E5 D5            [11]  235 	push	de
   61E6 33            [ 6]  236 	inc	sp
   61E7 53            [ 4]  237 	ld	d, e
   61E8 DD 5E FC      [19]  238 	ld	e, -4 (ix)
   61EB D5            [11]  239 	push	de
   61EC DD 7E FD      [19]  240 	ld	a, -3 (ix)
   61EF F5            [11]  241 	push	af
   61F0 33            [ 6]  242 	inc	sp
   61F1 CD 9E 6F      [17]  243 	call	_cpct_etm_drawTileBox2x4
   61F4 DD F9         [10]  244 	ld	sp, ix
   61F6 DD E1         [14]  245 	pop	ix
   61F8 C9            [10]  246 	ret
                            247 	.area _CODE
                            248 	.area _INITIALIZER
                            249 	.area _CABS (ABS)
