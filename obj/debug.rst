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
   80EE                      50 _dbg_displayNumber::
   80EE DD E5         [15]   51 	push	ix
   80F0 DD 21 00 00   [14]   52 	ld	ix,#0
   80F4 DD 39         [15]   53 	add	ix,sp
   80F6 F5            [11]   54 	push	af
   80F7 3B            [ 6]   55 	dec	sp
                             56 ;src/debug.c:17: u8 negative = 0;
   80F8 DD 36 FF 00   [19]   57 	ld	-1 (ix), #0x00
                             58 ;src/debug.c:18: u8 *pv = cpct_getScreenPtr(CPCT_VMEM_START, 74, char_row * 10);
   80FC DD 7E 04      [19]   59 	ld	a, 4 (ix)
   80FF 4F            [ 4]   60 	ld	c, a
   8100 87            [ 4]   61 	add	a, a
   8101 87            [ 4]   62 	add	a, a
   8102 81            [ 4]   63 	add	a, c
   8103 87            [ 4]   64 	add	a, a
   8104 47            [ 4]   65 	ld	b, a
   8105 C5            [11]   66 	push	bc
   8106 33            [ 6]   67 	inc	sp
   8107 3E 4A         [ 7]   68 	ld	a, #0x4a
   8109 F5            [11]   69 	push	af
   810A 33            [ 6]   70 	inc	sp
   810B 21 00 C0      [10]   71 	ld	hl, #0xc000
   810E E5            [11]   72 	push	hl
   810F CD FF 8D      [17]   73 	call	_cpct_getScreenPtr
   8112 33            [ 6]   74 	inc	sp
   8113 33            [ 6]   75 	inc	sp
   8114 E5            [11]   76 	push	hl
                             77 ;src/debug.c:20: if (num < 0)
   8115 DD CB 06 7E   [20]   78 	bit	7, 6 (ix)
   8119 28 1C         [12]   79 	jr	Z,00102$
                             80 ;src/debug.c:22: negative = 1;
   811B DD 36 FF 01   [19]   81 	ld	-1 (ix), #0x01
                             82 ;src/debug.c:23: num = -num;
   811F AF            [ 4]   83 	xor	a, a
   8120 DD 96 05      [19]   84 	sub	a, 5 (ix)
   8123 DD 77 05      [19]   85 	ld	5 (ix), a
   8126 3E 00         [ 7]   86 	ld	a, #0x00
   8128 DD 9E 06      [19]   87 	sbc	a, 6 (ix)
   812B DD 77 06      [19]   88 	ld	6 (ix), a
                             89 ;src/debug.c:25: cpct_setDrawCharM0(AN_PEN_BRIGHT_RED, AN_PEN_ORANGE);
   812E 21 05 02      [10]   90 	ld	hl, #0x0205
   8131 E5            [11]   91 	push	hl
   8132 CD DA 8D      [17]   92 	call	_cpct_setDrawCharM0
   8135 18 07         [12]   93 	jr	00112$
   8137                      94 00102$:
                             95 ;src/debug.c:29: cpct_setDrawCharM0(AN_PEN_SKY_BLUE, AN_PEN_BLUE);
   8137 21 06 0A      [10]   96 	ld	hl, #0x0a06
   813A E5            [11]   97 	push	hl
   813B CD DA 8D      [17]   98 	call	_cpct_setDrawCharM0
                             99 ;src/debug.c:32: for (i = 0; i < 5; i++)
   813E                     100 00112$:
   813E 01 00 00      [10]  101 	ld	bc, #0x0000
   8141                     102 00107$:
                            103 ;src/debug.c:34: u8 digit = '0' + (num % 10);
   8141 C5            [11]  104 	push	bc
   8142 21 0A 00      [10]  105 	ld	hl, #0x000a
   8145 E5            [11]  106 	push	hl
   8146 DD 6E 05      [19]  107 	ld	l,5 (ix)
   8149 DD 66 06      [19]  108 	ld	h,6 (ix)
   814C E5            [11]  109 	push	hl
   814D CD CD 8D      [17]  110 	call	__modsint
   8150 F1            [10]  111 	pop	af
   8151 F1            [10]  112 	pop	af
   8152 C1            [10]  113 	pop	bc
   8153 7D            [ 4]  114 	ld	a, l
   8154 C6 30         [ 7]  115 	add	a, #0x30
   8156 5F            [ 4]  116 	ld	e, a
                            117 ;src/debug.c:35: cpct_drawCharM0((void *)(pv - 4 * i), digit);
   8157 16 00         [ 7]  118 	ld	d, #0x00
   8159 69            [ 4]  119 	ld	l, c
   815A 60            [ 4]  120 	ld	h, b
   815B 29            [11]  121 	add	hl, hl
   815C 29            [11]  122 	add	hl, hl
   815D DD 7E FD      [19]  123 	ld	a, -3 (ix)
   8160 95            [ 4]  124 	sub	a, l
   8161 6F            [ 4]  125 	ld	l, a
   8162 DD 7E FE      [19]  126 	ld	a, -2 (ix)
   8165 9C            [ 4]  127 	sbc	a, h
   8166 67            [ 4]  128 	ld	h, a
   8167 C5            [11]  129 	push	bc
   8168 D5            [11]  130 	push	de
   8169 E5            [11]  131 	push	hl
   816A CD DF 8B      [17]  132 	call	_cpct_drawCharM0
   816D 21 0A 00      [10]  133 	ld	hl, #0x000a
   8170 E5            [11]  134 	push	hl
   8171 DD 6E 05      [19]  135 	ld	l,5 (ix)
   8174 DD 66 06      [19]  136 	ld	h,6 (ix)
   8177 E5            [11]  137 	push	hl
   8178 CD 15 8E      [17]  138 	call	__divsint
   817B F1            [10]  139 	pop	af
   817C F1            [10]  140 	pop	af
   817D C1            [10]  141 	pop	bc
   817E DD 75 05      [19]  142 	ld	5 (ix), l
   8181 DD 74 06      [19]  143 	ld	6 (ix), h
                            144 ;src/debug.c:32: for (i = 0; i < 5; i++)
   8184 03            [ 6]  145 	inc	bc
   8185 79            [ 4]  146 	ld	a, c
   8186 D6 05         [ 7]  147 	sub	a, #0x05
   8188 78            [ 4]  148 	ld	a, b
   8189 17            [ 4]  149 	rla
   818A 3F            [ 4]  150 	ccf
   818B 1F            [ 4]  151 	rra
   818C DE 80         [ 7]  152 	sbc	a, #0x80
   818E 38 B1         [12]  153 	jr	C,00107$
                            154 ;src/debug.c:38: if (negative)
   8190 DD 7E FF      [19]  155 	ld	a, -1 (ix)
   8193 B7            [ 4]  156 	or	a, a
   8194 28 14         [12]  157 	jr	Z,00109$
                            158 ;src/debug.c:40: cpct_drawCharM0((void *)(pv - 20), '-');
   8196 DD 7E FD      [19]  159 	ld	a, -3 (ix)
   8199 C6 EC         [ 7]  160 	add	a, #0xec
   819B 4F            [ 4]  161 	ld	c, a
   819C DD 7E FE      [19]  162 	ld	a, -2 (ix)
   819F CE FF         [ 7]  163 	adc	a, #0xff
   81A1 47            [ 4]  164 	ld	b, a
   81A2 21 2D 00      [10]  165 	ld	hl, #0x002d
   81A5 E5            [11]  166 	push	hl
   81A6 C5            [11]  167 	push	bc
   81A7 CD DF 8B      [17]  168 	call	_cpct_drawCharM0
   81AA                     169 00109$:
   81AA DD F9         [10]  170 	ld	sp, ix
   81AC DD E1         [14]  171 	pop	ix
   81AE C9            [10]  172 	ret
                            173 	.area _CODE
                            174 	.area _INITIALIZER
                            175 	.area _CABS (ABS)
