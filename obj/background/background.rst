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
                             11 	.globl _restoreBackground
                             12 	.globl _initializeBackground
                             13 	.globl _drawNumber
                             14 	.globl _cpct_etm_setTileset2x4
                             15 	.globl _cpct_etm_drawTileBox2x4
                             16 	.globl _cpct_etm_drawTilemap2x4_f
                             17 	.globl _cpct_getScreenPtr
                             18 	.globl _cpct_drawCharM0
                             19 	.globl _cpct_setDrawCharM0
                             20 	.globl _pvmem
                             21 ;--------------------------------------------------------
                             22 ; special function registers
                             23 ;--------------------------------------------------------
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DATA
   50A1                      28 _pvmem::
   50A1                      29 	.ds 2
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
                             54 ;src/background/background.c:12: void drawNumber(u8 num) {
                             55 ;	---------------------------------
                             56 ; Function drawNumber
                             57 ; ---------------------------------
   4C12                      58 _drawNumber::
   4C12 DD E5         [15]   59 	push	ix
   4C14 DD 21 00 00   [14]   60 	ld	ix,#0
   4C18 DD 39         [15]   61 	add	ix,sp
                             62 ;src/background/background.c:14: cpct_setDrawCharM0(5, 0);
   4C1A 21 05 00      [10]   63 	ld	hl, #0x0005
   4C1D E5            [11]   64 	push	hl
   4C1E CD F2 4F      [17]   65 	call	_cpct_setDrawCharM0
                             66 ;src/background/background.c:16: for(i=0; i<5; i++) {
   4C21 0E 00         [ 7]   67 	ld	c, #0x00
   4C23                      68 00102$:
                             69 ;src/background/background.c:17: u8 digit = '0' + (num % 10);
   4C23 C5            [11]   70 	push	bc
   4C24 3E 0A         [ 7]   71 	ld	a, #0x0a
   4C26 F5            [11]   72 	push	af
   4C27 33            [ 6]   73 	inc	sp
   4C28 DD 7E 04      [19]   74 	ld	a, 4 (ix)
   4C2B F5            [11]   75 	push	af
   4C2C 33            [ 6]   76 	inc	sp
   4C2D CD FB 4E      [17]   77 	call	__moduchar
   4C30 F1            [10]   78 	pop	af
   4C31 C1            [10]   79 	pop	bc
   4C32 7D            [ 4]   80 	ld	a, l
   4C33 C6 30         [ 7]   81 	add	a, #0x30
   4C35 5F            [ 4]   82 	ld	e, a
                             83 ;src/background/background.c:18: cpct_drawCharM0((void*)(LASTDIGIT_VMEM - 4*i), digit);
   4C36 16 00         [ 7]   84 	ld	d, #0x00
   4C38 69            [ 4]   85 	ld	l, c
   4C39 26 00         [ 7]   86 	ld	h, #0x00
   4C3B 29            [11]   87 	add	hl, hl
   4C3C 29            [11]   88 	add	hl, hl
   4C3D 3E 4B         [ 7]   89 	ld	a, #0x4b
   4C3F 95            [ 4]   90 	sub	a, l
   4C40 6F            [ 4]   91 	ld	l, a
   4C41 3E C0         [ 7]   92 	ld	a, #0xc0
   4C43 9C            [ 4]   93 	sbc	a, h
   4C44 67            [ 4]   94 	ld	h, a
   4C45 C5            [11]   95 	push	bc
   4C46 D5            [11]   96 	push	de
   4C47 E5            [11]   97 	push	hl
   4C48 CD D8 4E      [17]   98 	call	_cpct_drawCharM0
   4C4B 3E 0A         [ 7]   99 	ld	a, #0x0a
   4C4D F5            [11]  100 	push	af
   4C4E 33            [ 6]  101 	inc	sp
   4C4F DD 7E 04      [19]  102 	ld	a, 4 (ix)
   4C52 F5            [11]  103 	push	af
   4C53 33            [ 6]  104 	inc	sp
   4C54 CD 1A 4F      [17]  105 	call	__divuchar
   4C57 F1            [10]  106 	pop	af
   4C58 C1            [10]  107 	pop	bc
   4C59 DD 75 04      [19]  108 	ld	4 (ix), l
                            109 ;src/background/background.c:16: for(i=0; i<5; i++) {
   4C5C 0C            [ 4]  110 	inc	c
   4C5D 79            [ 4]  111 	ld	a, c
   4C5E D6 05         [ 7]  112 	sub	a, #0x05
   4C60 38 C1         [12]  113 	jr	C,00102$
   4C62 DD E1         [14]  114 	pop	ix
   4C64 C9            [10]  115 	ret
                            116 ;src/background/background.c:23: void initializeBackground()
                            117 ;	---------------------------------
                            118 ; Function initializeBackground
                            119 ; ---------------------------------
   4C65                     120 _initializeBackground::
                            121 ;src/background/background.c:26: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X, TILE_MAP_SCREEN_PIXEL_OFFSET_y);
   4C65 21 08 10      [10]  122 	ld	hl, #0x1008
   4C68 E5            [11]  123 	push	hl
   4C69 21 00 C0      [10]  124 	ld	hl, #0xc000
   4C6C E5            [11]  125 	push	hl
   4C6D CD 17 50      [17]  126 	call	_cpct_getScreenPtr
   4C70 22 A1 50      [16]  127 	ld	(_pvmem), hl
                            128 ;src/background/background.c:28: cpct_etm_setTileset2x4(g_tileset);
   4C73 21 92 45      [10]  129 	ld	hl, #_g_tileset
   4C76 CD D4 4E      [17]  130 	call	_cpct_etm_setTileset2x4
                            131 ;src/background/background.c:31: cpct_etm_drawTilemap2x4_f(g_tilemap_l00_W, g_tilemap_l00_H, pvmem, g_tilemap_l00);
   4C79 01 00 40      [10]  132 	ld	bc, #_g_tilemap_l00+0
   4C7C 2A A1 50      [16]  133 	ld	hl, (_pvmem)
   4C7F C5            [11]  134 	push	bc
   4C80 E5            [11]  135 	push	hl
   4C81 21 1F 2E      [10]  136 	ld	hl, #0x2e1f
   4C84 E5            [11]  137 	push	hl
   4C85 CD 7E 4F      [17]  138 	call	_cpct_etm_drawTilemap2x4_f
   4C88 C9            [10]  139 	ret
                            140 ;src/background/background.c:37: void restoreBackground(u8 screenX, u8 screenY, u8 bwidth, u8 pHeight)
                            141 ;	---------------------------------
                            142 ; Function restoreBackground
                            143 ; ---------------------------------
   4C89                     144 _restoreBackground::
   4C89 DD E5         [15]  145 	push	ix
   4C8B DD 21 00 00   [14]  146 	ld	ix,#0
   4C8F DD 39         [15]  147 	add	ix,sp
   4C91 F5            [11]  148 	push	af
                            149 ;src/background/background.c:39: u8 tileX = (screenX - TILE_MAP_SCREEN_BYTE_OFFSET_X) / 2;
   4C92 DD 4E 04      [19]  150 	ld	c, 4 (ix)
   4C95 06 00         [ 7]  151 	ld	b, #0x00
   4C97 79            [ 4]  152 	ld	a, c
   4C98 C6 F8         [ 7]  153 	add	a, #0xf8
   4C9A 5F            [ 4]  154 	ld	e, a
   4C9B 78            [ 4]  155 	ld	a, b
   4C9C CE FF         [ 7]  156 	adc	a, #0xff
   4C9E 57            [ 4]  157 	ld	d, a
   4C9F 6B            [ 4]  158 	ld	l, e
   4CA0 62            [ 4]  159 	ld	h, d
   4CA1 CB 7A         [ 8]  160 	bit	7, d
   4CA3 28 04         [12]  161 	jr	Z,00103$
   4CA5 21 F9 FF      [10]  162 	ld	hl, #0xfff9
   4CA8 09            [11]  163 	add	hl, bc
   4CA9                     164 00103$:
   4CA9 CB 2C         [ 8]  165 	sra	h
   4CAB CB 1D         [ 8]  166 	rr	l
   4CAD 45            [ 4]  167 	ld	b, l
                            168 ;src/background/background.c:40: u8 tileY = (screenY - TILE_MAP_SCREEN_PIXEL_OFFSET_y) / 4; 
   4CAE DD 5E 05      [19]  169 	ld	e, 5 (ix)
   4CB1 16 00         [ 7]  170 	ld	d, #0x00
   4CB3 7B            [ 4]  171 	ld	a, e
   4CB4 C6 F0         [ 7]  172 	add	a, #0xf0
   4CB6 DD 77 FE      [19]  173 	ld	-2 (ix), a
   4CB9 7A            [ 4]  174 	ld	a, d
   4CBA CE FF         [ 7]  175 	adc	a, #0xff
   4CBC DD 77 FF      [19]  176 	ld	-1 (ix), a
   4CBF E1            [10]  177 	pop	hl
   4CC0 E5            [11]  178 	push	hl
   4CC1 DD CB FF 7E   [20]  179 	bit	7, -1 (ix)
   4CC5 28 04         [12]  180 	jr	Z,00104$
   4CC7 21 F3 FF      [10]  181 	ld	hl, #0xfff3
   4CCA 19            [11]  182 	add	hl, de
   4CCB                     183 00104$:
   4CCB CB 2C         [ 8]  184 	sra	h
   4CCD CB 1D         [ 8]  185 	rr	l
   4CCF CB 2C         [ 8]  186 	sra	h
   4CD1 CB 1D         [ 8]  187 	rr	l
   4CD3 4D            [ 4]  188 	ld	c, l
                            189 ;src/background/background.c:41: cpct_etm_drawTileBox2x4(tileX, tileY, bwidth / 2, pHeight / 4, g_tilemap_l00_W, pvmem, g_tilemap_l00);
   4CD4 2A A1 50      [16]  190 	ld	hl, (_pvmem)
   4CD7 E3            [19]  191 	ex	(sp), hl
   4CD8 DD 5E 07      [19]  192 	ld	e, 7 (ix)
   4CDB CB 3B         [ 8]  193 	srl	e
   4CDD CB 3B         [ 8]  194 	srl	e
   4CDF DD 56 06      [19]  195 	ld	d, 6 (ix)
   4CE2 CB 3A         [ 8]  196 	srl	d
   4CE4 C5            [11]  197 	push	bc
   4CE5 21 00 40      [10]  198 	ld	hl, #_g_tilemap_l00
   4CE8 E5            [11]  199 	push	hl
   4CE9 DD 6E FE      [19]  200 	ld	l,-2 (ix)
   4CEC DD 66 FF      [19]  201 	ld	h,-1 (ix)
   4CEF E5            [11]  202 	push	hl
   4CF0 3E 1F         [ 7]  203 	ld	a, #0x1f
   4CF2 F5            [11]  204 	push	af
   4CF3 33            [ 6]  205 	inc	sp
   4CF4 7B            [ 4]  206 	ld	a, e
   4CF5 F5            [11]  207 	push	af
   4CF6 33            [ 6]  208 	inc	sp
   4CF7 59            [ 4]  209 	ld	e, c
   4CF8 D5            [11]  210 	push	de
   4CF9 C5            [11]  211 	push	bc
   4CFA 33            [ 6]  212 	inc	sp
   4CFB CD 45 4E      [17]  213 	call	_cpct_etm_drawTileBox2x4
   4CFE 33            [ 6]  214 	inc	sp
   4CFF CD 12 4C      [17]  215 	call	_drawNumber
   4D02 DD F9         [10]  216 	ld	sp,ix
   4D04 DD E1         [14]  217 	pop	ix
   4D06 C9            [10]  218 	ret
                            219 	.area _CODE
                            220 	.area _INITIALIZER
                            221 	.area _CABS (ABS)
