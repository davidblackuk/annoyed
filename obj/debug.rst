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
                             12 	.globl _cpct_drawCharM0
                             13 	.globl _cpct_setDrawCharM0
                             14 ;--------------------------------------------------------
                             15 ; special function registers
                             16 ;--------------------------------------------------------
                             17 ;--------------------------------------------------------
                             18 ; ram data
                             19 ;--------------------------------------------------------
                             20 	.area _DATA
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _INITIALIZED
                             25 ;--------------------------------------------------------
                             26 ; absolute external ram data
                             27 ;--------------------------------------------------------
                             28 	.area _DABS (ABS)
                             29 ;--------------------------------------------------------
                             30 ; global & static initialisations
                             31 ;--------------------------------------------------------
                             32 	.area _HOME
                             33 	.area _GSINIT
                             34 	.area _GSFINAL
                             35 	.area _GSINIT
                             36 ;--------------------------------------------------------
                             37 ; Home
                             38 ;--------------------------------------------------------
                             39 	.area _HOME
                             40 	.area _HOME
                             41 ;--------------------------------------------------------
                             42 ; code
                             43 ;--------------------------------------------------------
                             44 	.area _CODE
                             45 ;src/debug.c:5: void dbg_displayNumber(int num)
                             46 ;	---------------------------------
                             47 ; Function dbg_displayNumber
                             48 ; ---------------------------------
   6596                      49 _dbg_displayNumber::
   6596 DD E5         [15]   50 	push	ix
   6598 DD 21 00 00   [14]   51 	ld	ix,#0
   659C DD 39         [15]   52 	add	ix,sp
                             53 ;src/debug.c:8: cpct_setDrawCharM0(5, 0);
   659E 21 05 00      [10]   54 	ld	hl, #0x0005
   65A1 E5            [11]   55 	push	hl
   65A2 CD 9A 6C      [17]   56 	call	_cpct_setDrawCharM0
                             57 ;src/debug.c:10: for (i = 0; i < 5; i++)
   65A5 01 00 00      [10]   58 	ld	bc, #0x0000
   65A8                      59 00102$:
                             60 ;src/debug.c:12: u8 digit = '0' + (num % 10);
   65A8 C5            [11]   61 	push	bc
   65A9 21 0A 00      [10]   62 	ld	hl, #0x000a
   65AC E5            [11]   63 	push	hl
   65AD DD 6E 04      [19]   64 	ld	l,4 (ix)
   65B0 DD 66 05      [19]   65 	ld	h,5 (ix)
   65B3 E5            [11]   66 	push	hl
   65B4 CD 8D 6C      [17]   67 	call	__modsint
   65B7 F1            [10]   68 	pop	af
   65B8 F1            [10]   69 	pop	af
   65B9 C1            [10]   70 	pop	bc
   65BA 7D            [ 4]   71 	ld	a, l
   65BB C6 30         [ 7]   72 	add	a, #0x30
   65BD 5F            [ 4]   73 	ld	e, a
                             74 ;src/debug.c:13: cpct_drawCharM0((void *)(LASTDIGIT_VMEM - 4 * i), digit);
   65BE 16 00         [ 7]   75 	ld	d, #0x00
   65C0 69            [ 4]   76 	ld	l, c
   65C1 60            [ 4]   77 	ld	h, b
   65C2 29            [11]   78 	add	hl, hl
   65C3 29            [11]   79 	add	hl, hl
   65C4 3E 4B         [ 7]   80 	ld	a, #0x4b
   65C6 95            [ 4]   81 	sub	a, l
   65C7 6F            [ 4]   82 	ld	l, a
   65C8 3E C0         [ 7]   83 	ld	a, #0xc0
   65CA 9C            [ 4]   84 	sbc	a, h
   65CB 67            [ 4]   85 	ld	h, a
   65CC C5            [11]   86 	push	bc
   65CD D5            [11]   87 	push	de
   65CE E5            [11]   88 	push	hl
   65CF CD 84 6B      [17]   89 	call	_cpct_drawCharM0
   65D2 21 0A 00      [10]   90 	ld	hl, #0x000a
   65D5 E5            [11]   91 	push	hl
   65D6 DD 6E 04      [19]   92 	ld	l,4 (ix)
   65D9 DD 66 05      [19]   93 	ld	h,5 (ix)
   65DC E5            [11]   94 	push	hl
   65DD CD D5 6C      [17]   95 	call	__divsint
   65E0 F1            [10]   96 	pop	af
   65E1 F1            [10]   97 	pop	af
   65E2 C1            [10]   98 	pop	bc
   65E3 DD 75 04      [19]   99 	ld	4 (ix), l
   65E6 DD 74 05      [19]  100 	ld	5 (ix), h
                            101 ;src/debug.c:10: for (i = 0; i < 5; i++)
   65E9 03            [ 6]  102 	inc	bc
   65EA 79            [ 4]  103 	ld	a, c
   65EB D6 05         [ 7]  104 	sub	a, #0x05
   65ED 78            [ 4]  105 	ld	a, b
   65EE 17            [ 4]  106 	rla
   65EF 3F            [ 4]  107 	ccf
   65F0 1F            [ 4]  108 	rra
   65F1 DE 80         [ 7]  109 	sbc	a, #0x80
   65F3 38 B3         [12]  110 	jr	C,00102$
   65F5 DD E1         [14]  111 	pop	ix
   65F7 C9            [10]  112 	ret
                            113 	.area _CODE
                            114 	.area _INITIALIZER
                            115 	.area _CABS (ABS)
