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
   75C5                      50 _dbg_displayNumber::
   75C5 DD E5         [15]   51 	push	ix
   75C7 DD 21 00 00   [14]   52 	ld	ix,#0
   75CB DD 39         [15]   53 	add	ix,sp
   75CD F5            [11]   54 	push	af
   75CE 3B            [ 6]   55 	dec	sp
                             56 ;src/debug.c:17: u8 negative = 0;
   75CF DD 36 FF 00   [19]   57 	ld	-1 (ix), #0x00
                             58 ;src/debug.c:18: u8 *pv = cpct_getScreenPtr(CPCT_VMEM_START, 74, char_row * 10);
   75D3 DD 7E 04      [19]   59 	ld	a, 4 (ix)
   75D6 4F            [ 4]   60 	ld	c, a
   75D7 87            [ 4]   61 	add	a, a
   75D8 87            [ 4]   62 	add	a, a
   75D9 81            [ 4]   63 	add	a, c
   75DA 87            [ 4]   64 	add	a, a
   75DB 47            [ 4]   65 	ld	b, a
   75DC C5            [11]   66 	push	bc
   75DD 33            [ 6]   67 	inc	sp
   75DE 3E 4A         [ 7]   68 	ld	a, #0x4a
   75E0 F5            [11]   69 	push	af
   75E1 33            [ 6]   70 	inc	sp
   75E2 21 00 C0      [10]   71 	ld	hl, #0xc000
   75E5 E5            [11]   72 	push	hl
   75E6 CD BE 82      [17]   73 	call	_cpct_getScreenPtr
   75E9 33            [ 6]   74 	inc	sp
   75EA 33            [ 6]   75 	inc	sp
   75EB E5            [11]   76 	push	hl
                             77 ;src/debug.c:20: if (num < 0)
   75EC DD CB 06 7E   [20]   78 	bit	7, 6 (ix)
   75F0 28 1C         [12]   79 	jr	Z,00102$
                             80 ;src/debug.c:22: negative = 1;
   75F2 DD 36 FF 01   [19]   81 	ld	-1 (ix), #0x01
                             82 ;src/debug.c:23: num = -num;
   75F6 AF            [ 4]   83 	xor	a, a
   75F7 DD 96 05      [19]   84 	sub	a, 5 (ix)
   75FA DD 77 05      [19]   85 	ld	5 (ix), a
   75FD 3E 00         [ 7]   86 	ld	a, #0x00
   75FF DD 9E 06      [19]   87 	sbc	a, 6 (ix)
   7602 DD 77 06      [19]   88 	ld	6 (ix), a
                             89 ;src/debug.c:25: cpct_setDrawCharM0(AN_PEN_BRIGHT_RED, AN_PEN_ORANGE);
   7605 21 05 02      [10]   90 	ld	hl, #0x0205
   7608 E5            [11]   91 	push	hl
   7609 CD 99 82      [17]   92 	call	_cpct_setDrawCharM0
   760C 18 07         [12]   93 	jr	00112$
   760E                      94 00102$:
                             95 ;src/debug.c:29: cpct_setDrawCharM0(AN_PEN_SKY_BLUE, AN_PEN_BLUE);
   760E 21 06 0A      [10]   96 	ld	hl, #0x0a06
   7611 E5            [11]   97 	push	hl
   7612 CD 99 82      [17]   98 	call	_cpct_setDrawCharM0
                             99 ;src/debug.c:32: for (i = 0; i < 5; i++)
   7615                     100 00112$:
   7615 01 00 00      [10]  101 	ld	bc, #0x0000
   7618                     102 00107$:
                            103 ;src/debug.c:34: u8 digit = '0' + (num % 10);
   7618 C5            [11]  104 	push	bc
   7619 21 0A 00      [10]  105 	ld	hl, #0x000a
   761C E5            [11]  106 	push	hl
   761D DD 6E 05      [19]  107 	ld	l,5 (ix)
   7620 DD 66 06      [19]  108 	ld	h,6 (ix)
   7623 E5            [11]  109 	push	hl
   7624 CD 8C 82      [17]  110 	call	__modsint
   7627 F1            [10]  111 	pop	af
   7628 F1            [10]  112 	pop	af
   7629 C1            [10]  113 	pop	bc
   762A 7D            [ 4]  114 	ld	a, l
   762B C6 30         [ 7]  115 	add	a, #0x30
   762D 5F            [ 4]  116 	ld	e, a
                            117 ;src/debug.c:35: cpct_drawCharM0((void *)(pv - 4 * i), digit);
   762E 16 00         [ 7]  118 	ld	d, #0x00
   7630 69            [ 4]  119 	ld	l, c
   7631 60            [ 4]  120 	ld	h, b
   7632 29            [11]  121 	add	hl, hl
   7633 29            [11]  122 	add	hl, hl
   7634 DD 7E FD      [19]  123 	ld	a, -3 (ix)
   7637 95            [ 4]  124 	sub	a, l
   7638 6F            [ 4]  125 	ld	l, a
   7639 DD 7E FE      [19]  126 	ld	a, -2 (ix)
   763C 9C            [ 4]  127 	sbc	a, h
   763D 67            [ 4]  128 	ld	h, a
   763E C5            [11]  129 	push	bc
   763F D5            [11]  130 	push	de
   7640 E5            [11]  131 	push	hl
   7641 CD 9E 80      [17]  132 	call	_cpct_drawCharM0
   7644 21 0A 00      [10]  133 	ld	hl, #0x000a
   7647 E5            [11]  134 	push	hl
   7648 DD 6E 05      [19]  135 	ld	l,5 (ix)
   764B DD 66 06      [19]  136 	ld	h,6 (ix)
   764E E5            [11]  137 	push	hl
   764F CD D4 82      [17]  138 	call	__divsint
   7652 F1            [10]  139 	pop	af
   7653 F1            [10]  140 	pop	af
   7654 C1            [10]  141 	pop	bc
   7655 DD 75 05      [19]  142 	ld	5 (ix), l
   7658 DD 74 06      [19]  143 	ld	6 (ix), h
                            144 ;src/debug.c:32: for (i = 0; i < 5; i++)
   765B 03            [ 6]  145 	inc	bc
   765C 79            [ 4]  146 	ld	a, c
   765D D6 05         [ 7]  147 	sub	a, #0x05
   765F 78            [ 4]  148 	ld	a, b
   7660 17            [ 4]  149 	rla
   7661 3F            [ 4]  150 	ccf
   7662 1F            [ 4]  151 	rra
   7663 DE 80         [ 7]  152 	sbc	a, #0x80
   7665 38 B1         [12]  153 	jr	C,00107$
                            154 ;src/debug.c:38: if (negative)
   7667 DD 7E FF      [19]  155 	ld	a, -1 (ix)
   766A B7            [ 4]  156 	or	a, a
   766B 28 14         [12]  157 	jr	Z,00109$
                            158 ;src/debug.c:40: cpct_drawCharM0((void *)(pv - 20), '-');
   766D DD 7E FD      [19]  159 	ld	a, -3 (ix)
   7670 C6 EC         [ 7]  160 	add	a, #0xec
   7672 4F            [ 4]  161 	ld	c, a
   7673 DD 7E FE      [19]  162 	ld	a, -2 (ix)
   7676 CE FF         [ 7]  163 	adc	a, #0xff
   7678 47            [ 4]  164 	ld	b, a
   7679 21 2D 00      [10]  165 	ld	hl, #0x002d
   767C E5            [11]  166 	push	hl
   767D C5            [11]  167 	push	bc
   767E CD 9E 80      [17]  168 	call	_cpct_drawCharM0
   7681                     169 00109$:
   7681 DD F9         [10]  170 	ld	sp, ix
   7683 DD E1         [14]  171 	pop	ix
   7685 C9            [10]  172 	ret
                            173 	.area _CODE
                            174 	.area _INITIALIZER
                            175 	.area _CABS (ABS)
