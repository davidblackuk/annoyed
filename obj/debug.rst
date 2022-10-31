                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module debug
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _cpct_getScreenPtr
                             12 	.globl _cpct_drawCharM0
                             13 	.globl _cpct_setDrawCharM0
                             14 	.globl _dbg_displayNumber
                             15 ;--------------------------------------------------------
                             16 ; special function registers
                             17 ;--------------------------------------------------------
                             18 ;--------------------------------------------------------
                             19 ; ram data
                             20 ;--------------------------------------------------------
                             21 	.area _DATA
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _INITIALIZED
                             26 ;--------------------------------------------------------
                             27 ; absolute external ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DABS (ABS)
                             30 ;--------------------------------------------------------
                             31 ; global & static initialisations
                             32 ;--------------------------------------------------------
                             33 	.area _HOME
                             34 	.area _GSINIT
                             35 	.area _GSFINAL
                             36 	.area _GSINIT
                             37 ;--------------------------------------------------------
                             38 ; Home
                             39 ;--------------------------------------------------------
                             40 	.area _HOME
                             41 	.area _HOME
                             42 ;--------------------------------------------------------
                             43 ; code
                             44 ;--------------------------------------------------------
                             45 	.area _CODE
                             46 ;src/debug.c:4: void dbg_displayNumber(u8 char_row, i16 num)
                             47 ;	---------------------------------
                             48 ; Function dbg_displayNumber
                             49 ; ---------------------------------
   72A0                      50 _dbg_displayNumber::
   72A0 DD E5         [15]   51 	push	ix
   72A2 DD 21 00 00   [14]   52 	ld	ix,#0
   72A6 DD 39         [15]   53 	add	ix,sp
   72A8 F5            [11]   54 	push	af
   72A9 3B            [ 6]   55 	dec	sp
                             56 ;src/debug.c:7: u8 negative  = 0;
   72AA DD 36 FF 00   [19]   57 	ld	-1 (ix), #0x00
                             58 ;src/debug.c:8: u8 *pv = cpct_getScreenPtr(CPCT_VMEM_START,74, char_row * 10);
   72AE DD 7E 04      [19]   59 	ld	a, 4 (ix)
   72B1 4F            [ 4]   60 	ld	c, a
   72B2 87            [ 4]   61 	add	a, a
   72B3 87            [ 4]   62 	add	a, a
   72B4 81            [ 4]   63 	add	a, c
   72B5 87            [ 4]   64 	add	a, a
   72B6 47            [ 4]   65 	ld	b, a
   72B7 C5            [11]   66 	push	bc
   72B8 33            [ 6]   67 	inc	sp
   72B9 3E 4A         [ 7]   68 	ld	a, #0x4a
   72BB F5            [11]   69 	push	af
   72BC 33            [ 6]   70 	inc	sp
   72BD 21 00 C0      [10]   71 	ld	hl, #0xc000
   72C0 E5            [11]   72 	push	hl
   72C1 CD 48 7B      [17]   73 	call	_cpct_getScreenPtr
   72C4 33            [ 6]   74 	inc	sp
   72C5 33            [ 6]   75 	inc	sp
   72C6 E5            [11]   76 	push	hl
                             77 ;src/debug.c:10: if (num < 0){
   72C7 DD CB 06 7E   [20]   78 	bit	7, 6 (ix)
   72CB 28 1C         [12]   79 	jr	Z,00102$
                             80 ;src/debug.c:11: negative = 1;
   72CD DD 36 FF 01   [19]   81 	ld	-1 (ix), #0x01
                             82 ;src/debug.c:12: num = -num;
   72D1 AF            [ 4]   83 	xor	a, a
   72D2 DD 96 05      [19]   84 	sub	a, 5 (ix)
   72D5 DD 77 05      [19]   85 	ld	5 (ix), a
   72D8 3E 00         [ 7]   86 	ld	a, #0x00
   72DA DD 9E 06      [19]   87 	sbc	a, 6 (ix)
   72DD DD 77 06      [19]   88 	ld	6 (ix), a
                             89 ;src/debug.c:14: cpct_setDrawCharM0(AN_PEN_BRIGHT_RED, AN_PEN_ORANGE);
   72E0 21 05 02      [10]   90 	ld	hl, #0x0205
   72E3 E5            [11]   91 	push	hl
   72E4 CD E8 7A      [17]   92 	call	_cpct_setDrawCharM0
   72E7 18 07         [12]   93 	jr	00112$
   72E9                      94 00102$:
                             95 ;src/debug.c:16: cpct_setDrawCharM0(AN_PEN_SKY_BLUE, AN_PEN_BLUE);
   72E9 21 06 0A      [10]   96 	ld	hl, #0x0a06
   72EC E5            [11]   97 	push	hl
   72ED CD E8 7A      [17]   98 	call	_cpct_setDrawCharM0
                             99 ;src/debug.c:21: for (i = 0; i < 5; i++)
   72F0                     100 00112$:
   72F0 01 00 00      [10]  101 	ld	bc, #0x0000
   72F3                     102 00107$:
                            103 ;src/debug.c:23: u8 digit = '0' + (num % 10);
   72F3 C5            [11]  104 	push	bc
   72F4 21 0A 00      [10]  105 	ld	hl, #0x000a
   72F7 E5            [11]  106 	push	hl
   72F8 DD 6E 05      [19]  107 	ld	l,5 (ix)
   72FB DD 66 06      [19]  108 	ld	h,6 (ix)
   72FE E5            [11]  109 	push	hl
   72FF CD DB 7A      [17]  110 	call	__modsint
   7302 F1            [10]  111 	pop	af
   7303 F1            [10]  112 	pop	af
   7304 C1            [10]  113 	pop	bc
   7305 7D            [ 4]  114 	ld	a, l
   7306 C6 30         [ 7]  115 	add	a, #0x30
   7308 5F            [ 4]  116 	ld	e, a
                            117 ;src/debug.c:24: cpct_drawCharM0((void *)(pv - 4 * i), digit);
   7309 16 00         [ 7]  118 	ld	d, #0x00
   730B 69            [ 4]  119 	ld	l, c
   730C 60            [ 4]  120 	ld	h, b
   730D 29            [11]  121 	add	hl, hl
   730E 29            [11]  122 	add	hl, hl
   730F DD 7E FD      [19]  123 	ld	a, -3 (ix)
   7312 95            [ 4]  124 	sub	a, l
   7313 6F            [ 4]  125 	ld	l, a
   7314 DD 7E FE      [19]  126 	ld	a, -2 (ix)
   7317 9C            [ 4]  127 	sbc	a, h
   7318 67            [ 4]  128 	ld	h, a
   7319 C5            [11]  129 	push	bc
   731A D5            [11]  130 	push	de
   731B E5            [11]  131 	push	hl
   731C CD 2B 79      [17]  132 	call	_cpct_drawCharM0
   731F 21 0A 00      [10]  133 	ld	hl, #0x000a
   7322 E5            [11]  134 	push	hl
   7323 DD 6E 05      [19]  135 	ld	l,5 (ix)
   7326 DD 66 06      [19]  136 	ld	h,6 (ix)
   7329 E5            [11]  137 	push	hl
   732A CD 5E 7B      [17]  138 	call	__divsint
   732D F1            [10]  139 	pop	af
   732E F1            [10]  140 	pop	af
   732F C1            [10]  141 	pop	bc
   7330 DD 75 05      [19]  142 	ld	5 (ix), l
   7333 DD 74 06      [19]  143 	ld	6 (ix), h
                            144 ;src/debug.c:21: for (i = 0; i < 5; i++)
   7336 03            [ 6]  145 	inc	bc
   7337 79            [ 4]  146 	ld	a, c
   7338 D6 05         [ 7]  147 	sub	a, #0x05
   733A 78            [ 4]  148 	ld	a, b
   733B 17            [ 4]  149 	rla
   733C 3F            [ 4]  150 	ccf
   733D 1F            [ 4]  151 	rra
   733E DE 80         [ 7]  152 	sbc	a, #0x80
   7340 38 B1         [12]  153 	jr	C,00107$
                            154 ;src/debug.c:27: if (negative){
   7342 DD 7E FF      [19]  155 	ld	a, -1 (ix)
   7345 B7            [ 4]  156 	or	a, a
   7346 28 14         [12]  157 	jr	Z,00109$
                            158 ;src/debug.c:28: cpct_drawCharM0((void *)(pv - 20), '-');
   7348 DD 7E FD      [19]  159 	ld	a, -3 (ix)
   734B C6 EC         [ 7]  160 	add	a, #0xec
   734D 4F            [ 4]  161 	ld	c, a
   734E DD 7E FE      [19]  162 	ld	a, -2 (ix)
   7351 CE FF         [ 7]  163 	adc	a, #0xff
   7353 47            [ 4]  164 	ld	b, a
   7354 21 2D 00      [10]  165 	ld	hl, #0x002d
   7357 E5            [11]  166 	push	hl
   7358 C5            [11]  167 	push	bc
   7359 CD 2B 79      [17]  168 	call	_cpct_drawCharM0
   735C                     169 00109$:
   735C DD F9         [10]  170 	ld	sp, ix
   735E DD E1         [14]  171 	pop	ix
   7360 C9            [10]  172 	ret
                            173 	.area _CODE
                            174 	.area _INITIALIZER
                            175 	.area _CABS (ABS)
