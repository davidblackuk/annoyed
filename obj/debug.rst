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
                             11 	.globl _dbg_displayNumber
                             12 	.globl _cpct_getScreenPtr
                             13 	.globl _cpct_drawCharM0
                             14 	.globl _cpct_setDrawCharM0
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
                             46 ;src/debug.c:5: void dbg_displayNumber(u8 char_row, int num)
                             47 ;	---------------------------------
                             48 ; Function dbg_displayNumber
                             49 ; ---------------------------------
   6A19                      50 _dbg_displayNumber::
   6A19 DD E5         [15]   51 	push	ix
   6A1B DD 21 00 00   [14]   52 	ld	ix,#0
   6A1F DD 39         [15]   53 	add	ix,sp
   6A21 F5            [11]   54 	push	af
                             55 ;src/debug.c:8: u8 *pv = cpct_getScreenPtr(CPCT_VMEM_START,74, char_row * 10);
   6A22 DD 7E 04      [19]   56 	ld	a, 4 (ix)
   6A25 4F            [ 4]   57 	ld	c, a
   6A26 87            [ 4]   58 	add	a, a
   6A27 87            [ 4]   59 	add	a, a
   6A28 81            [ 4]   60 	add	a, c
   6A29 87            [ 4]   61 	add	a, a
   6A2A 47            [ 4]   62 	ld	b, a
   6A2B C5            [11]   63 	push	bc
   6A2C 33            [ 6]   64 	inc	sp
   6A2D 3E 4A         [ 7]   65 	ld	a, #0x4a
   6A2F F5            [11]   66 	push	af
   6A30 33            [ 6]   67 	inc	sp
   6A31 21 00 C0      [10]   68 	ld	hl, #0xc000
   6A34 E5            [11]   69 	push	hl
   6A35 CD 0F 72      [17]   70 	call	_cpct_getScreenPtr
   6A38 33            [ 6]   71 	inc	sp
   6A39 33            [ 6]   72 	inc	sp
   6A3A E5            [11]   73 	push	hl
                             74 ;src/debug.c:9: cpct_setDrawCharM0(5, 0);
   6A3B 21 05 00      [10]   75 	ld	hl, #0x0005
   6A3E E5            [11]   76 	push	hl
   6A3F CD EA 71      [17]   77 	call	_cpct_setDrawCharM0
                             78 ;src/debug.c:11: for (i = 0; i < 5; i++)
   6A42 01 00 00      [10]   79 	ld	bc, #0x0000
   6A45                      80 00102$:
                             81 ;src/debug.c:13: u8 digit = '0' + (num % 10);
   6A45 C5            [11]   82 	push	bc
   6A46 21 0A 00      [10]   83 	ld	hl, #0x000a
   6A49 E5            [11]   84 	push	hl
   6A4A DD 6E 05      [19]   85 	ld	l,5 (ix)
   6A4D DD 66 06      [19]   86 	ld	h,6 (ix)
   6A50 E5            [11]   87 	push	hl
   6A51 CD DD 71      [17]   88 	call	__modsint
   6A54 F1            [10]   89 	pop	af
   6A55 F1            [10]   90 	pop	af
   6A56 C1            [10]   91 	pop	bc
   6A57 7D            [ 4]   92 	ld	a, l
   6A58 C6 30         [ 7]   93 	add	a, #0x30
   6A5A 5F            [ 4]   94 	ld	e, a
                             95 ;src/debug.c:14: cpct_drawCharM0((void *)(pv - 4 * i), digit);
   6A5B 16 00         [ 7]   96 	ld	d, #0x00
   6A5D 69            [ 4]   97 	ld	l, c
   6A5E 60            [ 4]   98 	ld	h, b
   6A5F 29            [11]   99 	add	hl, hl
   6A60 29            [11]  100 	add	hl, hl
   6A61 DD 7E FE      [19]  101 	ld	a, -2 (ix)
   6A64 95            [ 4]  102 	sub	a, l
   6A65 6F            [ 4]  103 	ld	l, a
   6A66 DD 7E FF      [19]  104 	ld	a, -1 (ix)
   6A69 9C            [ 4]  105 	sbc	a, h
   6A6A 67            [ 4]  106 	ld	h, a
   6A6B C5            [11]  107 	push	bc
   6A6C D5            [11]  108 	push	de
   6A6D E5            [11]  109 	push	hl
   6A6E CD 2D 70      [17]  110 	call	_cpct_drawCharM0
   6A71 21 0A 00      [10]  111 	ld	hl, #0x000a
   6A74 E5            [11]  112 	push	hl
   6A75 DD 6E 05      [19]  113 	ld	l,5 (ix)
   6A78 DD 66 06      [19]  114 	ld	h,6 (ix)
   6A7B E5            [11]  115 	push	hl
   6A7C CD 25 72      [17]  116 	call	__divsint
   6A7F F1            [10]  117 	pop	af
   6A80 F1            [10]  118 	pop	af
   6A81 C1            [10]  119 	pop	bc
   6A82 DD 75 05      [19]  120 	ld	5 (ix), l
   6A85 DD 74 06      [19]  121 	ld	6 (ix), h
                            122 ;src/debug.c:11: for (i = 0; i < 5; i++)
   6A88 03            [ 6]  123 	inc	bc
   6A89 79            [ 4]  124 	ld	a, c
   6A8A D6 05         [ 7]  125 	sub	a, #0x05
   6A8C 78            [ 4]  126 	ld	a, b
   6A8D 17            [ 4]  127 	rla
   6A8E 3F            [ 4]  128 	ccf
   6A8F 1F            [ 4]  129 	rra
   6A90 DE 80         [ 7]  130 	sbc	a, #0x80
   6A92 38 B1         [12]  131 	jr	C,00102$
   6A94 DD F9         [10]  132 	ld	sp, ix
   6A96 DD E1         [14]  133 	pop	ix
   6A98 C9            [10]  134 	ret
                            135 	.area _CODE
                            136 	.area _INITIALIZER
                            137 	.area _CABS (ABS)
