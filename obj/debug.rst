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
                             46 ;src/debug.c:14: void dbg_displayNumber(u8 char_row, i16 num)
                             47 ;	---------------------------------
                             48 ; Function dbg_displayNumber
                             49 ; ---------------------------------
   8033                      50 _dbg_displayNumber::
   8033 DD E5         [15]   51 	push	ix
   8035 DD 21 00 00   [14]   52 	ld	ix,#0
   8039 DD 39         [15]   53 	add	ix,sp
   803B F5            [11]   54 	push	af
   803C 3B            [ 6]   55 	dec	sp
                             56 ;src/debug.c:17: u8 negative = 0;
   803D DD 36 FF 00   [19]   57 	ld	-1 (ix), #0x00
                             58 ;src/debug.c:18: u8 *pv = cpct_getScreenPtr(CPCT_VMEM_START, 74, char_row * 10);
   8041 DD 7E 04      [19]   59 	ld	a, 4 (ix)
   8044 4F            [ 4]   60 	ld	c, a
   8045 87            [ 4]   61 	add	a, a
   8046 87            [ 4]   62 	add	a, a
   8047 81            [ 4]   63 	add	a, c
   8048 87            [ 4]   64 	add	a, a
   8049 47            [ 4]   65 	ld	b, a
   804A C5            [11]   66 	push	bc
   804B 33            [ 6]   67 	inc	sp
   804C 3E 4A         [ 7]   68 	ld	a, #0x4a
   804E F5            [11]   69 	push	af
   804F 33            [ 6]   70 	inc	sp
   8050 21 00 C0      [10]   71 	ld	hl, #0xc000
   8053 E5            [11]   72 	push	hl
   8054 CD 44 8D      [17]   73 	call	_cpct_getScreenPtr
   8057 33            [ 6]   74 	inc	sp
   8058 33            [ 6]   75 	inc	sp
   8059 E5            [11]   76 	push	hl
                             77 ;src/debug.c:20: if (num < 0)
   805A DD CB 06 7E   [20]   78 	bit	7, 6 (ix)
   805E 28 1C         [12]   79 	jr	Z,00102$
                             80 ;src/debug.c:22: negative = 1;
   8060 DD 36 FF 01   [19]   81 	ld	-1 (ix), #0x01
                             82 ;src/debug.c:23: num = -num;
   8064 AF            [ 4]   83 	xor	a, a
   8065 DD 96 05      [19]   84 	sub	a, 5 (ix)
   8068 DD 77 05      [19]   85 	ld	5 (ix), a
   806B 3E 00         [ 7]   86 	ld	a, #0x00
   806D DD 9E 06      [19]   87 	sbc	a, 6 (ix)
   8070 DD 77 06      [19]   88 	ld	6 (ix), a
                             89 ;src/debug.c:25: cpct_setDrawCharM0(AN_PEN_BRIGHT_RED, AN_PEN_ORANGE);
   8073 21 05 02      [10]   90 	ld	hl, #0x0205
   8076 E5            [11]   91 	push	hl
   8077 CD 1F 8D      [17]   92 	call	_cpct_setDrawCharM0
   807A 18 07         [12]   93 	jr	00112$
   807C                      94 00102$:
                             95 ;src/debug.c:29: cpct_setDrawCharM0(AN_PEN_SKY_BLUE, AN_PEN_BLUE);
   807C 21 06 0A      [10]   96 	ld	hl, #0x0a06
   807F E5            [11]   97 	push	hl
   8080 CD 1F 8D      [17]   98 	call	_cpct_setDrawCharM0
                             99 ;src/debug.c:32: for (i = 0; i < 5; i++)
   8083                     100 00112$:
   8083 01 00 00      [10]  101 	ld	bc, #0x0000
   8086                     102 00107$:
                            103 ;src/debug.c:34: u8 digit = '0' + (num % 10);
   8086 C5            [11]  104 	push	bc
   8087 21 0A 00      [10]  105 	ld	hl, #0x000a
   808A E5            [11]  106 	push	hl
   808B DD 6E 05      [19]  107 	ld	l,5 (ix)
   808E DD 66 06      [19]  108 	ld	h,6 (ix)
   8091 E5            [11]  109 	push	hl
   8092 CD 12 8D      [17]  110 	call	__modsint
   8095 F1            [10]  111 	pop	af
   8096 F1            [10]  112 	pop	af
   8097 C1            [10]  113 	pop	bc
   8098 7D            [ 4]  114 	ld	a, l
   8099 C6 30         [ 7]  115 	add	a, #0x30
   809B 5F            [ 4]  116 	ld	e, a
                            117 ;src/debug.c:35: cpct_drawCharM0((void *)(pv - 4 * i), digit);
   809C 16 00         [ 7]  118 	ld	d, #0x00
   809E 69            [ 4]  119 	ld	l, c
   809F 60            [ 4]  120 	ld	h, b
   80A0 29            [11]  121 	add	hl, hl
   80A1 29            [11]  122 	add	hl, hl
   80A2 DD 7E FD      [19]  123 	ld	a, -3 (ix)
   80A5 95            [ 4]  124 	sub	a, l
   80A6 6F            [ 4]  125 	ld	l, a
   80A7 DD 7E FE      [19]  126 	ld	a, -2 (ix)
   80AA 9C            [ 4]  127 	sbc	a, h
   80AB 67            [ 4]  128 	ld	h, a
   80AC C5            [11]  129 	push	bc
   80AD D5            [11]  130 	push	de
   80AE E5            [11]  131 	push	hl
   80AF CD 24 8B      [17]  132 	call	_cpct_drawCharM0
   80B2 21 0A 00      [10]  133 	ld	hl, #0x000a
   80B5 E5            [11]  134 	push	hl
   80B6 DD 6E 05      [19]  135 	ld	l,5 (ix)
   80B9 DD 66 06      [19]  136 	ld	h,6 (ix)
   80BC E5            [11]  137 	push	hl
   80BD CD 5A 8D      [17]  138 	call	__divsint
   80C0 F1            [10]  139 	pop	af
   80C1 F1            [10]  140 	pop	af
   80C2 C1            [10]  141 	pop	bc
   80C3 DD 75 05      [19]  142 	ld	5 (ix), l
   80C6 DD 74 06      [19]  143 	ld	6 (ix), h
                            144 ;src/debug.c:32: for (i = 0; i < 5; i++)
   80C9 03            [ 6]  145 	inc	bc
   80CA 79            [ 4]  146 	ld	a, c
   80CB D6 05         [ 7]  147 	sub	a, #0x05
   80CD 78            [ 4]  148 	ld	a, b
   80CE 17            [ 4]  149 	rla
   80CF 3F            [ 4]  150 	ccf
   80D0 1F            [ 4]  151 	rra
   80D1 DE 80         [ 7]  152 	sbc	a, #0x80
   80D3 38 B1         [12]  153 	jr	C,00107$
                            154 ;src/debug.c:38: if (negative)
   80D5 DD 7E FF      [19]  155 	ld	a, -1 (ix)
   80D8 B7            [ 4]  156 	or	a, a
   80D9 28 14         [12]  157 	jr	Z,00109$
                            158 ;src/debug.c:40: cpct_drawCharM0((void *)(pv - 20), '-');
   80DB DD 7E FD      [19]  159 	ld	a, -3 (ix)
   80DE C6 EC         [ 7]  160 	add	a, #0xec
   80E0 4F            [ 4]  161 	ld	c, a
   80E1 DD 7E FE      [19]  162 	ld	a, -2 (ix)
   80E4 CE FF         [ 7]  163 	adc	a, #0xff
   80E6 47            [ 4]  164 	ld	b, a
   80E7 21 2D 00      [10]  165 	ld	hl, #0x002d
   80EA E5            [11]  166 	push	hl
   80EB C5            [11]  167 	push	bc
   80EC CD 24 8B      [17]  168 	call	_cpct_drawCharM0
   80EF                     169 00109$:
   80EF DD F9         [10]  170 	ld	sp, ix
   80F1 DD E1         [14]  171 	pop	ix
   80F3 C9            [10]  172 	ret
                            173 	.area _CODE
                            174 	.area _INITIALIZER
                            175 	.area _CABS (ABS)
