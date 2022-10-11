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
   69B1                      50 _dbg_displayNumber::
   69B1 DD E5         [15]   51 	push	ix
   69B3 DD 21 00 00   [14]   52 	ld	ix,#0
   69B7 DD 39         [15]   53 	add	ix,sp
   69B9 F5            [11]   54 	push	af
                             55 ;src/debug.c:8: u8 *pv = cpct_getScreenPtr(CPCT_VMEM_START,74, char_row * 10);
   69BA DD 7E 04      [19]   56 	ld	a, 4 (ix)
   69BD 4F            [ 4]   57 	ld	c, a
   69BE 87            [ 4]   58 	add	a, a
   69BF 87            [ 4]   59 	add	a, a
   69C0 81            [ 4]   60 	add	a, c
   69C1 87            [ 4]   61 	add	a, a
   69C2 47            [ 4]   62 	ld	b, a
   69C3 C5            [11]   63 	push	bc
   69C4 33            [ 6]   64 	inc	sp
   69C5 3E 4A         [ 7]   65 	ld	a, #0x4a
   69C7 F5            [11]   66 	push	af
   69C8 33            [ 6]   67 	inc	sp
   69C9 21 00 C0      [10]   68 	ld	hl, #0xc000
   69CC E5            [11]   69 	push	hl
   69CD CD A7 71      [17]   70 	call	_cpct_getScreenPtr
   69D0 33            [ 6]   71 	inc	sp
   69D1 33            [ 6]   72 	inc	sp
   69D2 E5            [11]   73 	push	hl
                             74 ;src/debug.c:9: cpct_setDrawCharM0(5, 0);
   69D3 21 05 00      [10]   75 	ld	hl, #0x0005
   69D6 E5            [11]   76 	push	hl
   69D7 CD 82 71      [17]   77 	call	_cpct_setDrawCharM0
                             78 ;src/debug.c:11: for (i = 0; i < 5; i++)
   69DA 01 00 00      [10]   79 	ld	bc, #0x0000
   69DD                      80 00102$:
                             81 ;src/debug.c:13: u8 digit = '0' + (num % 10);
   69DD C5            [11]   82 	push	bc
   69DE 21 0A 00      [10]   83 	ld	hl, #0x000a
   69E1 E5            [11]   84 	push	hl
   69E2 DD 6E 05      [19]   85 	ld	l,5 (ix)
   69E5 DD 66 06      [19]   86 	ld	h,6 (ix)
   69E8 E5            [11]   87 	push	hl
   69E9 CD 75 71      [17]   88 	call	__modsint
   69EC F1            [10]   89 	pop	af
   69ED F1            [10]   90 	pop	af
   69EE C1            [10]   91 	pop	bc
   69EF 7D            [ 4]   92 	ld	a, l
   69F0 C6 30         [ 7]   93 	add	a, #0x30
   69F2 5F            [ 4]   94 	ld	e, a
                             95 ;src/debug.c:14: cpct_drawCharM0((void *)(pv - 4 * i), digit);
   69F3 16 00         [ 7]   96 	ld	d, #0x00
   69F5 69            [ 4]   97 	ld	l, c
   69F6 60            [ 4]   98 	ld	h, b
   69F7 29            [11]   99 	add	hl, hl
   69F8 29            [11]  100 	add	hl, hl
   69F9 DD 7E FE      [19]  101 	ld	a, -2 (ix)
   69FC 95            [ 4]  102 	sub	a, l
   69FD 6F            [ 4]  103 	ld	l, a
   69FE DD 7E FF      [19]  104 	ld	a, -1 (ix)
   6A01 9C            [ 4]  105 	sbc	a, h
   6A02 67            [ 4]  106 	ld	h, a
   6A03 C5            [11]  107 	push	bc
   6A04 D5            [11]  108 	push	de
   6A05 E5            [11]  109 	push	hl
   6A06 CD C5 6F      [17]  110 	call	_cpct_drawCharM0
   6A09 21 0A 00      [10]  111 	ld	hl, #0x000a
   6A0C E5            [11]  112 	push	hl
   6A0D DD 6E 05      [19]  113 	ld	l,5 (ix)
   6A10 DD 66 06      [19]  114 	ld	h,6 (ix)
   6A13 E5            [11]  115 	push	hl
   6A14 CD BD 71      [17]  116 	call	__divsint
   6A17 F1            [10]  117 	pop	af
   6A18 F1            [10]  118 	pop	af
   6A19 C1            [10]  119 	pop	bc
   6A1A DD 75 05      [19]  120 	ld	5 (ix), l
   6A1D DD 74 06      [19]  121 	ld	6 (ix), h
                            122 ;src/debug.c:11: for (i = 0; i < 5; i++)
   6A20 03            [ 6]  123 	inc	bc
   6A21 79            [ 4]  124 	ld	a, c
   6A22 D6 05         [ 7]  125 	sub	a, #0x05
   6A24 78            [ 4]  126 	ld	a, b
   6A25 17            [ 4]  127 	rla
   6A26 3F            [ 4]  128 	ccf
   6A27 1F            [ 4]  129 	rra
   6A28 DE 80         [ 7]  130 	sbc	a, #0x80
   6A2A 38 B1         [12]  131 	jr	C,00102$
   6A2C DD F9         [10]  132 	ld	sp, ix
   6A2E DD E1         [14]  133 	pop	ix
   6A30 C9            [10]  134 	ret
                            135 	.area _CODE
                            136 	.area _INITIALIZER
                            137 	.area _CABS (ABS)
