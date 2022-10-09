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
                             17 	.globl _background_restore
                             18 ;--------------------------------------------------------
                             19 ; special function registers
                             20 ;--------------------------------------------------------
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _DATA
   6D6F                      25 _pvmem::
   6D6F                      26 	.ds 2
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
                             51 ;src/background.c:11: void background_initialize()
                             52 ;	---------------------------------
                             53 ; Function background_initialize
                             54 ; ---------------------------------
   60D6                      55 _background_initialize::
                             56 ;src/background.c:16: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X, TILE_MAP_SCREEN_PIXEL_OFFSET_Y);
   60D6 21 08 00      [10]   57 	ld	hl, #0x0008
   60D9 E5            [11]   58 	push	hl
   60DA 21 00 C0      [10]   59 	ld	hl, #0xc000
   60DD E5            [11]   60 	push	hl
   60DE CD BF 6C      [17]   61 	call	_cpct_getScreenPtr
   60E1 22 6F 6D      [16]   62 	ld	(_pvmem), hl
                             63 ;src/background.c:18: cpct_etm_setTileset2x4(g_tileset);
   60E4 21 68 51      [10]   64 	ld	hl, #_g_tileset
   60E7 CD A7 6B      [17]   65 	call	_cpct_etm_setTileset2x4
                             66 ;src/background.c:21: cpct_etm_drawTilemap2x4_f(BACKGROUND_TILMAP_W, BACKGROUND_TILMAP_H, pvmem, current_level->background_tilemap);
   60EA 2A 92 6D      [16]   67 	ld	hl, (_current_level)
   60ED 4E            [ 7]   68 	ld	c, (hl)
   60EE 23            [ 6]   69 	inc	hl
   60EF 46            [ 7]   70 	ld	b, (hl)
   60F0 2A 6F 6D      [16]   71 	ld	hl, (_pvmem)
   60F3 C5            [11]   72 	push	bc
   60F4 E5            [11]   73 	push	hl
   60F5 21 1E 32      [10]   74 	ld	hl, #0x321e
   60F8 E5            [11]   75 	push	hl
   60F9 CD D7 6B      [17]   76 	call	_cpct_etm_drawTilemap2x4_f
   60FC C9            [10]   77 	ret
                             78 ;src/background.c:26: void background_restore(u8 screenX, u8 screenY, u8 bwidth, u8 pHeight)
                             79 ;	---------------------------------
                             80 ; Function background_restore
                             81 ; ---------------------------------
   60FD                      82 _background_restore::
   60FD DD E5         [15]   83 	push	ix
   60FF DD 21 00 00   [14]   84 	ld	ix,#0
   6103 DD 39         [15]   85 	add	ix,sp
   6105 F5            [11]   86 	push	af
   6106 F5            [11]   87 	push	af
                             88 ;src/background.c:30: u8 tileX = (screenX - TILE_MAP_SCREEN_BYTE_OFFSET_X) / 2;
   6107 DD 4E 04      [19]   89 	ld	c, 4 (ix)
   610A 06 00         [ 7]   90 	ld	b, #0x00
   610C 79            [ 4]   91 	ld	a, c
   610D C6 F8         [ 7]   92 	add	a, #0xf8
   610F 5F            [ 4]   93 	ld	e, a
   6110 78            [ 4]   94 	ld	a, b
   6111 CE FF         [ 7]   95 	adc	a, #0xff
   6113 57            [ 4]   96 	ld	d, a
   6114 6B            [ 4]   97 	ld	l, e
   6115 62            [ 4]   98 	ld	h, d
   6116 CB 7A         [ 8]   99 	bit	7, d
   6118 28 04         [12]  100 	jr	Z,00109$
   611A 21 F9 FF      [10]  101 	ld	hl, #0xfff9
   611D 09            [11]  102 	add	hl, bc
   611E                     103 00109$:
   611E 4D            [ 4]  104 	ld	c, l
   611F CB 2C         [ 8]  105 	sra	h
   6121 CB 19         [ 8]  106 	rr	c
                            107 ;src/background.c:31: u8 tileY = (screenY - TILE_MAP_SCREEN_PIXEL_OFFSET_Y) / 4;
   6123 DD 6E 05      [19]  108 	ld	l, 5 (ix)
   6126 26 00         [ 7]  109 	ld	h, #0x00
   6128 45            [ 4]  110 	ld	b, l
   6129 54            [ 4]  111 	ld	d, h
   612A CB 7C         [ 8]  112 	bit	7, h
   612C 28 05         [12]  113 	jr	Z,00110$
   612E 23            [ 6]  114 	inc	hl
   612F 23            [ 6]  115 	inc	hl
   6130 23            [ 6]  116 	inc	hl
   6131 45            [ 4]  117 	ld	b, l
   6132 54            [ 4]  118 	ld	d, h
   6133                     119 00110$:
   6133 58            [ 4]  120 	ld	e, b
   6134 CB 2A         [ 8]  121 	sra	d
   6136 CB 1B         [ 8]  122 	rr	e
   6138 CB 2A         [ 8]  123 	sra	d
   613A CB 1B         [ 8]  124 	rr	e
                            125 ;src/background.c:32: u8 tileW = bwidth / 2;
   613C DD 46 06      [19]  126 	ld	b, 6 (ix)
   613F CB 38         [ 8]  127 	srl	b
                            128 ;src/background.c:33: u8 tileH = pHeight / 4;
   6141 DD 56 07      [19]  129 	ld	d, 7 (ix)
   6144 CB 3A         [ 8]  130 	srl	d
   6146 CB 3A         [ 8]  131 	srl	d
                            132 ;src/background.c:35: if (pHeight % 4 > 0)
   6148 DD 7E 07      [19]  133 	ld	a, 7 (ix)
   614B E6 03         [ 7]  134 	and	a, #0x03
   614D 28 01         [12]  135 	jr	Z,00102$
                            136 ;src/background.c:37: tileH++;
   614F 14            [ 4]  137 	inc	d
   6150                     138 00102$:
                            139 ;src/background.c:40: if (bwidth % 2 > 0)
   6150 DD CB 06 46   [20]  140 	bit	0, 6 (ix)
   6154 28 01         [12]  141 	jr	Z,00104$
                            142 ;src/background.c:42: tileW++;
   6156 04            [ 4]  143 	inc	b
   6157                     144 00104$:
                            145 ;src/background.c:45: if (screenX & 1 == 1)
   6157 DD CB 04 46   [20]  146 	bit	0, 4 (ix)
   615B 28 01         [12]  147 	jr	Z,00106$
                            148 ;src/background.c:47: tileW += 1;
   615D 04            [ 4]  149 	inc	b
   615E                     150 00106$:
                            151 ;src/background.c:50: cpct_etm_drawTileBox2x4(tileX, tileY, tileW, tileH, BACKGROUND_TILMAP_W, pvmem, current_level->background_tilemap);
   615E 2A 92 6D      [16]  152 	ld	hl, (_current_level)
   6161 7E            [ 7]  153 	ld	a, (hl)
   6162 DD 77 FC      [19]  154 	ld	-4 (ix), a
   6165 23            [ 6]  155 	inc	hl
   6166 7E            [ 7]  156 	ld	a, (hl)
   6167 DD 77 FD      [19]  157 	ld	-3 (ix), a
   616A 2A 6F 6D      [16]  158 	ld	hl, (_pvmem)
   616D DD 75 FE      [19]  159 	ld	-2 (ix), l
   6170 DD 74 FF      [19]  160 	ld	-1 (ix), h
   6173 E1            [10]  161 	pop	hl
   6174 E5            [11]  162 	push	hl
   6175 E5            [11]  163 	push	hl
   6176 DD 6E FE      [19]  164 	ld	l,-2 (ix)
   6179 DD 66 FF      [19]  165 	ld	h,-1 (ix)
   617C E5            [11]  166 	push	hl
   617D 3E 1E         [ 7]  167 	ld	a, #0x1e
   617F F5            [11]  168 	push	af
   6180 33            [ 6]  169 	inc	sp
   6181 D5            [11]  170 	push	de
   6182 33            [ 6]  171 	inc	sp
   6183 C5            [11]  172 	push	bc
   6184 33            [ 6]  173 	inc	sp
   6185 43            [ 4]  174 	ld	b, e
   6186 C5            [11]  175 	push	bc
   6187 CD F5 6A      [17]  176 	call	_cpct_etm_drawTileBox2x4
   618A DD F9         [10]  177 	ld	sp, ix
   618C DD E1         [14]  178 	pop	ix
   618E C9            [10]  179 	ret
                            180 	.area _CODE
                            181 	.area _INITIALIZER
                            182 	.area _CABS (ABS)
