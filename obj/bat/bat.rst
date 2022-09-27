                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module bat
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _restoreBackground
                             12 	.globl _cpct_getScreenPtr
                             13 	.globl _cpct_drawSprite
                             14 	.globl _cpct_isKeyPressed
                             15 	.globl _batW
                             16 	.globl _oldBatX
                             17 	.globl _batX
                             18 	.globl _batY
                             19 	.globl _initializeBat
                             20 	.globl _updateBat
                             21 	.globl _drawBat
                             22 ;--------------------------------------------------------
                             23 ; special function registers
                             24 ;--------------------------------------------------------
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _DATA
                             29 ;--------------------------------------------------------
                             30 ; ram data
                             31 ;--------------------------------------------------------
                             32 	.area _INITIALIZED
   4A40                      33 _batY::
   4A40                      34 	.ds 1
   4A41                      35 _batX::
   4A41                      36 	.ds 1
   4A42                      37 _oldBatX::
   4A42                      38 	.ds 1
   4A43                      39 _batW::
   4A43                      40 	.ds 1
                             41 ;--------------------------------------------------------
                             42 ; absolute external ram data
                             43 ;--------------------------------------------------------
                             44 	.area _DABS (ABS)
                             45 ;--------------------------------------------------------
                             46 ; global & static initialisations
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _GSINIT
                             50 	.area _GSFINAL
                             51 	.area _GSINIT
                             52 ;--------------------------------------------------------
                             53 ; Home
                             54 ;--------------------------------------------------------
                             55 	.area _HOME
                             56 	.area _HOME
                             57 ;--------------------------------------------------------
                             58 ; code
                             59 ;--------------------------------------------------------
                             60 	.area _CODE
                             61 ;src/bat/bat.c:30: void initializeBat() {
                             62 ;	---------------------------------
                             63 ; Function initializeBat
                             64 ; ---------------------------------
   45E2                      65 _initializeBat::
                             66 ;src/bat/bat.c:31: batW = 8;
   45E2 21 43 4A      [10]   67 	ld	hl,#_batW + 0
   45E5 36 08         [10]   68 	ld	(hl), #0x08
                             69 ;src/bat/bat.c:32: batX = (SCREEN_WIDTH_BYTES- batW) / 2;
   45E7 21 41 4A      [10]   70 	ld	hl,#_batX + 0
   45EA 36 24         [10]   71 	ld	(hl), #0x24
                             72 ;src/bat/bat.c:33: batY = SCREEN_HEIGHT_ROWS - BAT_HEIGHT_PIXELS - BAT_BOTTOM_OFFSET_PIXELS;
   45EC 21 40 4A      [10]   73 	ld	hl,#_batY + 0
   45EF 36 B8         [10]   74 	ld	(hl), #0xb8
                             75 ;src/bat/bat.c:34: oldBatX = batX;
   45F1 21 42 4A      [10]   76 	ld	hl,#_oldBatX + 0
   45F4 36 24         [10]   77 	ld	(hl), #0x24
   45F6 C9            [10]   78 	ret
                             79 ;src/bat/bat.c:38: void updateBat() {
                             80 ;	---------------------------------
                             81 ; Function updateBat
                             82 ; ---------------------------------
   45F7                      83 _updateBat::
                             84 ;src/bat/bat.c:40: if (cpct_isKeyPressed(Key_CursorLeft)) {
   45F7 21 01 01      [10]   85 	ld	hl, #0x0101
   45FA CD 0F 47      [17]   86 	call	_cpct_isKeyPressed
   45FD 7D            [ 4]   87 	ld	a, l
   45FE B7            [ 4]   88 	or	a, a
   45FF 28 0E         [12]   89 	jr	Z,00108$
                             90 ;src/bat/bat.c:41: if (batX > BAT_MIN_X_BYTE_OFFSET) {
   4601 3E 0C         [ 7]   91 	ld	a, #0x0c
   4603 FD 21 41 4A   [14]   92 	ld	iy, #_batX
   4607 FD 96 00      [19]   93 	sub	a, 0 (iy)
   460A D0            [11]   94 	ret	NC
                             95 ;src/bat/bat.c:42: batX--;
   460B FD 35 00      [23]   96 	dec	0 (iy)
   460E C9            [10]   97 	ret
   460F                      98 00108$:
                             99 ;src/bat/bat.c:44: } else if (cpct_isKeyPressed(Key_CursorRight)) {
   460F 21 00 02      [10]  100 	ld	hl, #0x0200
   4612 CD 0F 47      [17]  101 	call	_cpct_isKeyPressed
   4615 7D            [ 4]  102 	ld	a, l
   4616 B7            [ 4]  103 	or	a, a
   4617 C8            [11]  104 	ret	Z
                            105 ;src/bat/bat.c:45: batX++;
   4618 21 41 4A      [10]  106 	ld	hl, #_batX+0
   461B 34            [11]  107 	inc	(hl)
                            108 ;src/bat/bat.c:46: if (batX > BAT_MAX_X_BYTE_OFFSET - batW) {
   461C 21 43 4A      [10]  109 	ld	hl,#_batW + 0
   461F 4E            [ 7]  110 	ld	c, (hl)
   4620 06 00         [ 7]  111 	ld	b, #0x00
   4622 3E 44         [ 7]  112 	ld	a, #0x44
   4624 91            [ 4]  113 	sub	a, c
   4625 4F            [ 4]  114 	ld	c, a
   4626 3E 00         [ 7]  115 	ld	a, #0x00
   4628 98            [ 4]  116 	sbc	a, b
   4629 47            [ 4]  117 	ld	b, a
   462A 21 41 4A      [10]  118 	ld	hl,#_batX + 0
   462D 5E            [ 7]  119 	ld	e, (hl)
   462E 16 00         [ 7]  120 	ld	d, #0x00
   4630 79            [ 4]  121 	ld	a, c
   4631 93            [ 4]  122 	sub	a, e
   4632 78            [ 4]  123 	ld	a, b
   4633 9A            [ 4]  124 	sbc	a, d
   4634 E2 39 46      [10]  125 	jp	PO, 00128$
   4637 EE 80         [ 7]  126 	xor	a, #0x80
   4639                     127 00128$:
   4639 F2 49 46      [10]  128 	jp	P, 00104$
                            129 ;src/bat/bat.c:47: batX = BAT_MAX_X_BYTE_OFFSET - batW;
   463C 21 43 4A      [10]  130 	ld	hl, #_batW
   463F FD 21 41 4A   [14]  131 	ld	iy, #_batX
   4643 3E 44         [ 7]  132 	ld	a, #0x44
   4645 96            [ 7]  133 	sub	a, (hl)
   4646 FD 77 00      [19]  134 	ld	0 (iy), a
   4649                     135 00104$:
                            136 ;src/bat/bat.c:49: oldBatX = batX;
   4649 3A 41 4A      [13]  137 	ld	a,(#_batX + 0)
   464C 32 42 4A      [13]  138 	ld	(#_oldBatX + 0),a
   464F C9            [10]  139 	ret
                            140 ;src/bat/bat.c:54: void drawBat()
                            141 ;	---------------------------------
                            142 ; Function drawBat
                            143 ; ---------------------------------
   4650                     144 _drawBat::
                            145 ;src/bat/bat.c:57: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, batX, batY);
   4650 3A 40 4A      [13]  146 	ld	a, (_batY)
   4653 F5            [11]  147 	push	af
   4654 33            [ 6]  148 	inc	sp
   4655 3A 41 4A      [13]  149 	ld	a, (_batX)
   4658 F5            [11]  150 	push	af
   4659 33            [ 6]  151 	inc	sp
   465A 21 00 C0      [10]  152 	ld	hl, #0xc000
   465D E5            [11]  153 	push	hl
   465E CD 28 4A      [17]  154 	call	_cpct_getScreenPtr
   4661 4D            [ 4]  155 	ld	c, l
   4662 44            [ 4]  156 	ld	b, h
                            157 ;src/bat/bat.c:62: restoreBackground(oldBatX, batY / 8, batW, BAT_HEIGHT_PIXELS);
   4663 21 40 4A      [10]  158 	ld	hl,#_batY + 0
   4666 56            [ 7]  159 	ld	d, (hl)
   4667 CB 3A         [ 8]  160 	srl	d
   4669 CB 3A         [ 8]  161 	srl	d
   466B CB 3A         [ 8]  162 	srl	d
   466D C5            [11]  163 	push	bc
   466E 3E 08         [ 7]  164 	ld	a, #0x08
   4670 F5            [11]  165 	push	af
   4671 33            [ 6]  166 	inc	sp
   4672 3A 43 4A      [13]  167 	ld	a, (_batW)
   4675 F5            [11]  168 	push	af
   4676 33            [ 6]  169 	inc	sp
   4677 D5            [11]  170 	push	de
   4678 33            [ 6]  171 	inc	sp
   4679 3A 42 4A      [13]  172 	ld	a, (_oldBatX)
   467C F5            [11]  173 	push	af
   467D 33            [ 6]  174 	inc	sp
   467E CD F7 46      [17]  175 	call	_restoreBackground
   4681 F1            [10]  176 	pop	af
   4682 F1            [10]  177 	pop	af
   4683 C1            [10]  178 	pop	bc
                            179 ;src/bat/bat.c:67: cpct_drawSprite(sp_bat_left, pvmem, SP_BAT_LEFT_W, SP_BAT_LEFT_H);
   4684 59            [ 4]  180 	ld	e, c
   4685 50            [ 4]  181 	ld	d, b
   4686 C5            [11]  182 	push	bc
   4687 21 02 08      [10]  183 	ld	hl, #0x0802
   468A E5            [11]  184 	push	hl
   468B D5            [11]  185 	push	de
   468C 21 90 45      [10]  186 	ld	hl, #_sp_bat_left
   468F E5            [11]  187 	push	hl
   4690 CD A8 47      [17]  188 	call	_cpct_drawSprite
   4693 C1            [10]  189 	pop	bc
                            190 ;src/bat/bat.c:68: cpct_drawSprite(sp_bat_mid, pvmem + BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
   4694 59            [ 4]  191 	ld	e, c
   4695 50            [ 4]  192 	ld	d, b
   4696 13            [ 6]  193 	inc	de
   4697 13            [ 6]  194 	inc	de
   4698 C5            [11]  195 	push	bc
   4699 21 02 08      [10]  196 	ld	hl, #0x0802
   469C E5            [11]  197 	push	hl
   469D D5            [11]  198 	push	de
   469E 21 80 45      [10]  199 	ld	hl, #_sp_bat_mid
   46A1 E5            [11]  200 	push	hl
   46A2 CD A8 47      [17]  201 	call	_cpct_drawSprite
   46A5 C1            [10]  202 	pop	bc
                            203 ;src/bat/bat.c:69: cpct_drawSprite(sp_bat_mid, pvmem + 2*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
   46A6 21 04 00      [10]  204 	ld	hl, #0x0004
   46A9 09            [11]  205 	add	hl, bc
   46AA C5            [11]  206 	push	bc
   46AB 11 02 08      [10]  207 	ld	de, #0x0802
   46AE D5            [11]  208 	push	de
   46AF E5            [11]  209 	push	hl
   46B0 21 80 45      [10]  210 	ld	hl, #_sp_bat_mid
   46B3 E5            [11]  211 	push	hl
   46B4 CD A8 47      [17]  212 	call	_cpct_drawSprite
   46B7 C1            [10]  213 	pop	bc
                            214 ;src/bat/bat.c:70: cpct_drawSprite(sp_bat_right, pvmem + 3*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_RIGHT_W, SP_BAT_RIGHT_H);
   46B8 21 06 00      [10]  215 	ld	hl, #0x0006
   46BB 09            [11]  216 	add	hl, bc
   46BC 01 70 45      [10]  217 	ld	bc, #_sp_bat_right+0
   46BF 11 02 08      [10]  218 	ld	de, #0x0802
   46C2 D5            [11]  219 	push	de
   46C3 E5            [11]  220 	push	hl
   46C4 C5            [11]  221 	push	bc
   46C5 CD A8 47      [17]  222 	call	_cpct_drawSprite
   46C8 C9            [10]  223 	ret
                            224 	.area _CODE
                            225 	.area _INITIALIZER
   4A44                     226 __xinit__batY:
   4A44 00                  227 	.db #0x00	; 0
   4A45                     228 __xinit__batX:
   4A45 00                  229 	.db #0x00	; 0
   4A46                     230 __xinit__oldBatX:
   4A46 00                  231 	.db #0x00	; 0
   4A47                     232 __xinit__batW:
   4A47 00                  233 	.db #0x00	; 0
                            234 	.area _CABS (ABS)
