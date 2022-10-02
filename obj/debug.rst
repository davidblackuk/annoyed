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
   4F9A                      49 _dbg_displayNumber::
   4F9A DD E5         [15]   50 	push	ix
   4F9C DD 21 00 00   [14]   51 	ld	ix,#0
   4FA0 DD 39         [15]   52 	add	ix,sp
                             53 ;src/debug.c:8: cpct_setDrawCharM0(5, 0);
   4FA2 21 05 00      [10]   54 	ld	hl, #0x0005
   4FA5 E5            [11]   55 	push	hl
   4FA6 CD 30 53      [17]   56 	call	_cpct_setDrawCharM0
                             57 ;src/debug.c:10: for (i = 0; i < 5; i++)
   4FA9 01 00 00      [10]   58 	ld	bc, #0x0000
   4FAC                      59 00102$:
                             60 ;src/debug.c:12: u8 digit = '0' + (num % 10);
   4FAC C5            [11]   61 	push	bc
   4FAD 21 0A 00      [10]   62 	ld	hl, #0x000a
   4FB0 E5            [11]   63 	push	hl
   4FB1 DD 6E 04      [19]   64 	ld	l,4 (ix)
   4FB4 DD 66 05      [19]   65 	ld	h,5 (ix)
   4FB7 E5            [11]   66 	push	hl
   4FB8 CD 23 53      [17]   67 	call	__modsint
   4FBB F1            [10]   68 	pop	af
   4FBC F1            [10]   69 	pop	af
   4FBD C1            [10]   70 	pop	bc
   4FBE 7D            [ 4]   71 	ld	a, l
   4FBF C6 30         [ 7]   72 	add	a, #0x30
   4FC1 5F            [ 4]   73 	ld	e, a
                             74 ;src/debug.c:13: cpct_drawCharM0((void *)(LASTDIGIT_VMEM - 4 * i), digit);
   4FC2 16 00         [ 7]   75 	ld	d, #0x00
   4FC4 69            [ 4]   76 	ld	l, c
   4FC5 60            [ 4]   77 	ld	h, b
   4FC6 29            [11]   78 	add	hl, hl
   4FC7 29            [11]   79 	add	hl, hl
   4FC8 3E 4B         [ 7]   80 	ld	a, #0x4b
   4FCA 95            [ 4]   81 	sub	a, l
   4FCB 6F            [ 4]   82 	ld	l, a
   4FCC 3E C0         [ 7]   83 	ld	a, #0xc0
   4FCE 9C            [ 4]   84 	sbc	a, h
   4FCF 67            [ 4]   85 	ld	h, a
   4FD0 C5            [11]   86 	push	bc
   4FD1 D5            [11]   87 	push	de
   4FD2 E5            [11]   88 	push	hl
   4FD3 CD 51 52      [17]   89 	call	_cpct_drawCharM0
   4FD6 21 0A 00      [10]   90 	ld	hl, #0x000a
   4FD9 E5            [11]   91 	push	hl
   4FDA DD 6E 04      [19]   92 	ld	l,4 (ix)
   4FDD DD 66 05      [19]   93 	ld	h,5 (ix)
   4FE0 E5            [11]   94 	push	hl
   4FE1 CD 6B 53      [17]   95 	call	__divsint
   4FE4 F1            [10]   96 	pop	af
   4FE5 F1            [10]   97 	pop	af
   4FE6 C1            [10]   98 	pop	bc
   4FE7 DD 75 04      [19]   99 	ld	4 (ix), l
   4FEA DD 74 05      [19]  100 	ld	5 (ix), h
                            101 ;src/debug.c:10: for (i = 0; i < 5; i++)
   4FED 03            [ 6]  102 	inc	bc
   4FEE 79            [ 4]  103 	ld	a, c
   4FEF D6 05         [ 7]  104 	sub	a, #0x05
   4FF1 78            [ 4]  105 	ld	a, b
   4FF2 17            [ 4]  106 	rla
   4FF3 3F            [ 4]  107 	ccf
   4FF4 1F            [ 4]  108 	rra
   4FF5 DE 80         [ 7]  109 	sbc	a, #0x80
   4FF7 38 B3         [12]  110 	jr	C,00102$
   4FF9 DD E1         [14]  111 	pop	ix
   4FFB C9            [10]  112 	ret
                            113 	.area _CODE
                            114 	.area _INITIALIZER
                            115 	.area _CABS (ABS)
