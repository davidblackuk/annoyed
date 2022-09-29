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
   50A3                      33 _batY::
   50A3                      34 	.ds 1
   50A4                      35 _batX::
   50A4                      36 	.ds 1
   50A5                      37 _oldBatX::
   50A5                      38 	.ds 1
   50A6                      39 _batW::
   50A6                      40 	.ds 1
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
                             61 ;src/bat/bat.c:29: void initializeBat() {
                             62 ;	---------------------------------
                             63 ; Function initializeBat
                             64 ; ---------------------------------
   4B2D                      65 _initializeBat::
                             66 ;src/bat/bat.c:30: batW = 8;
   4B2D 21 A6 50      [10]   67 	ld	hl,#_batW + 0
   4B30 36 08         [10]   68 	ld	(hl), #0x08
                             69 ;src/bat/bat.c:31: batX = (SCREEN_WIDTH_BYTES- batW) / 2;
   4B32 21 A4 50      [10]   70 	ld	hl,#_batX + 0
   4B35 36 24         [10]   71 	ld	(hl), #0x24
                             72 ;src/bat/bat.c:32: batY = SCREEN_HEIGHT_ROWS - BAT_HEIGHT_PIXELS - BAT_BOTTOM_OFFSET_PIXELS;
   4B37 21 A3 50      [10]   73 	ld	hl,#_batY + 0
   4B3A 36 B8         [10]   74 	ld	(hl), #0xb8
                             75 ;src/bat/bat.c:33: oldBatX = batX;
   4B3C 21 A5 50      [10]   76 	ld	hl,#_oldBatX + 0
   4B3F 36 24         [10]   77 	ld	(hl), #0x24
   4B41 C9            [10]   78 	ret
                             79 ;src/bat/bat.c:37: void updateBat() {
                             80 ;	---------------------------------
                             81 ; Function updateBat
                             82 ; ---------------------------------
   4B42                      83 _updateBat::
                             84 ;src/bat/bat.c:38: oldBatX = batX;
   4B42 3A A4 50      [13]   85 	ld	a,(#_batX + 0)
   4B45 32 A5 50      [13]   86 	ld	(#_oldBatX + 0),a
                             87 ;src/bat/bat.c:39: if (cpct_isKeyPressed(Key_CursorLeft)) {
   4B48 21 01 01      [10]   88 	ld	hl, #0x0101
   4B4B CD 07 4D      [17]   89 	call	_cpct_isKeyPressed
   4B4E 7D            [ 4]   90 	ld	a, l
   4B4F B7            [ 4]   91 	or	a, a
   4B50 28 14         [12]   92 	jr	Z,00108$
                             93 ;src/bat/bat.c:40: if (batX > BAT_MIN_X_BYTE_OFFSET) {
   4B52 3E 0C         [ 7]   94 	ld	a, #0x0c
   4B54 FD 21 A4 50   [14]   95 	ld	iy, #_batX
   4B58 FD 96 00      [19]   96 	sub	a, 0 (iy)
   4B5B D0            [11]   97 	ret	NC
                             98 ;src/bat/bat.c:41: batX--;
   4B5C FD 35 00      [23]   99 	dec	0 (iy)
                            100 ;src/bat/bat.c:42: oldBatX = batX;
   4B5F FD 7E 00      [19]  101 	ld	a, 0 (iy)
   4B62 32 A5 50      [13]  102 	ld	(#_oldBatX + 0),a
   4B65 C9            [10]  103 	ret
   4B66                     104 00108$:
                            105 ;src/bat/bat.c:44: } else if (cpct_isKeyPressed(Key_CursorRight)) {
   4B66 21 00 02      [10]  106 	ld	hl, #0x0200
   4B69 CD 07 4D      [17]  107 	call	_cpct_isKeyPressed
   4B6C 7D            [ 4]  108 	ld	a, l
   4B6D B7            [ 4]  109 	or	a, a
   4B6E C8            [11]  110 	ret	Z
                            111 ;src/bat/bat.c:45: batX++;
   4B6F 21 A4 50      [10]  112 	ld	hl, #_batX+0
   4B72 34            [11]  113 	inc	(hl)
                            114 ;src/bat/bat.c:46: if (batX > BAT_MAX_X_BYTE_OFFSET - batW) {
   4B73 21 A6 50      [10]  115 	ld	hl,#_batW + 0
   4B76 4E            [ 7]  116 	ld	c, (hl)
   4B77 06 00         [ 7]  117 	ld	b, #0x00
   4B79 3E 42         [ 7]  118 	ld	a, #0x42
   4B7B 91            [ 4]  119 	sub	a, c
   4B7C 4F            [ 4]  120 	ld	c, a
   4B7D 3E 00         [ 7]  121 	ld	a, #0x00
   4B7F 98            [ 4]  122 	sbc	a, b
   4B80 47            [ 4]  123 	ld	b, a
   4B81 21 A4 50      [10]  124 	ld	hl,#_batX + 0
   4B84 5E            [ 7]  125 	ld	e, (hl)
   4B85 16 00         [ 7]  126 	ld	d, #0x00
   4B87 79            [ 4]  127 	ld	a, c
   4B88 93            [ 4]  128 	sub	a, e
   4B89 78            [ 4]  129 	ld	a, b
   4B8A 9A            [ 4]  130 	sbc	a, d
   4B8B E2 90 4B      [10]  131 	jp	PO, 00128$
   4B8E EE 80         [ 7]  132 	xor	a, #0x80
   4B90                     133 00128$:
   4B90 F0            [11]  134 	ret	P
                            135 ;src/bat/bat.c:47: batX = BAT_MAX_X_BYTE_OFFSET - batW;
   4B91 21 A6 50      [10]  136 	ld	hl, #_batW
   4B94 FD 21 A4 50   [14]  137 	ld	iy, #_batX
   4B98 3E 42         [ 7]  138 	ld	a, #0x42
   4B9A 96            [ 7]  139 	sub	a, (hl)
   4B9B FD 77 00      [19]  140 	ld	0 (iy), a
   4B9E C9            [10]  141 	ret
                            142 ;src/bat/bat.c:53: void drawBat()
                            143 ;	---------------------------------
                            144 ; Function drawBat
                            145 ; ---------------------------------
   4B9F                     146 _drawBat::
                            147 ;src/bat/bat.c:59: restoreBackground(oldBatX, batY, batW+2, BAT_HEIGHT_PIXELS);
   4B9F 21 A6 50      [10]  148 	ld	hl,#_batW + 0
   4BA2 46            [ 7]  149 	ld	b, (hl)
   4BA3 04            [ 4]  150 	inc	b
   4BA4 04            [ 4]  151 	inc	b
   4BA5 3E 08         [ 7]  152 	ld	a, #0x08
   4BA7 F5            [11]  153 	push	af
   4BA8 33            [ 6]  154 	inc	sp
   4BA9 C5            [11]  155 	push	bc
   4BAA 33            [ 6]  156 	inc	sp
   4BAB 3A A3 50      [13]  157 	ld	a, (_batY)
   4BAE F5            [11]  158 	push	af
   4BAF 33            [ 6]  159 	inc	sp
   4BB0 3A A5 50      [13]  160 	ld	a, (_oldBatX)
   4BB3 F5            [11]  161 	push	af
   4BB4 33            [ 6]  162 	inc	sp
   4BB5 CD 89 4C      [17]  163 	call	_restoreBackground
   4BB8 F1            [10]  164 	pop	af
   4BB9 F1            [10]  165 	pop	af
                            166 ;src/bat/bat.c:61: svmem = cpct_getScreenPtr(CPCT_VMEM_START, batX, batY);
   4BBA 3A A3 50      [13]  167 	ld	a, (_batY)
   4BBD F5            [11]  168 	push	af
   4BBE 33            [ 6]  169 	inc	sp
   4BBF 3A A4 50      [13]  170 	ld	a, (_batX)
   4BC2 F5            [11]  171 	push	af
   4BC3 33            [ 6]  172 	inc	sp
   4BC4 21 00 C0      [10]  173 	ld	hl, #0xc000
   4BC7 E5            [11]  174 	push	hl
   4BC8 CD 17 50      [17]  175 	call	_cpct_getScreenPtr
   4BCB 4D            [ 4]  176 	ld	c, l
   4BCC 44            [ 4]  177 	ld	b, h
                            178 ;src/bat/bat.c:63: cpct_drawSprite(sp_bat_left, svmem, SP_BAT_LEFT_W, SP_BAT_LEFT_H);
   4BCD 59            [ 4]  179 	ld	e, c
   4BCE 50            [ 4]  180 	ld	d, b
   4BCF C5            [11]  181 	push	bc
   4BD0 21 02 08      [10]  182 	ld	hl, #0x0802
   4BD3 E5            [11]  183 	push	hl
   4BD4 D5            [11]  184 	push	de
   4BD5 21 C4 4A      [10]  185 	ld	hl, #_sp_bat_left
   4BD8 E5            [11]  186 	push	hl
   4BD9 CD A0 4D      [17]  187 	call	_cpct_drawSprite
   4BDC C1            [10]  188 	pop	bc
                            189 ;src/bat/bat.c:64: cpct_drawSprite(sp_bat_mid, svmem + BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
   4BDD 59            [ 4]  190 	ld	e, c
   4BDE 50            [ 4]  191 	ld	d, b
   4BDF 13            [ 6]  192 	inc	de
   4BE0 13            [ 6]  193 	inc	de
   4BE1 C5            [11]  194 	push	bc
   4BE2 21 02 08      [10]  195 	ld	hl, #0x0802
   4BE5 E5            [11]  196 	push	hl
   4BE6 D5            [11]  197 	push	de
   4BE7 21 B4 4A      [10]  198 	ld	hl, #_sp_bat_mid
   4BEA E5            [11]  199 	push	hl
   4BEB CD A0 4D      [17]  200 	call	_cpct_drawSprite
   4BEE C1            [10]  201 	pop	bc
                            202 ;src/bat/bat.c:65: cpct_drawSprite(sp_bat_mid, svmem + 2*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
   4BEF 21 04 00      [10]  203 	ld	hl, #0x0004
   4BF2 09            [11]  204 	add	hl, bc
   4BF3 C5            [11]  205 	push	bc
   4BF4 11 02 08      [10]  206 	ld	de, #0x0802
   4BF7 D5            [11]  207 	push	de
   4BF8 E5            [11]  208 	push	hl
   4BF9 21 B4 4A      [10]  209 	ld	hl, #_sp_bat_mid
   4BFC E5            [11]  210 	push	hl
   4BFD CD A0 4D      [17]  211 	call	_cpct_drawSprite
   4C00 C1            [10]  212 	pop	bc
                            213 ;src/bat/bat.c:66: cpct_drawSprite(sp_bat_right, svmem + 3*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_RIGHT_W, SP_BAT_RIGHT_H);
   4C01 21 06 00      [10]  214 	ld	hl, #0x0006
   4C04 09            [11]  215 	add	hl, bc
   4C05 01 A4 4A      [10]  216 	ld	bc, #_sp_bat_right+0
   4C08 11 02 08      [10]  217 	ld	de, #0x0802
   4C0B D5            [11]  218 	push	de
   4C0C E5            [11]  219 	push	hl
   4C0D C5            [11]  220 	push	bc
   4C0E CD A0 4D      [17]  221 	call	_cpct_drawSprite
   4C11 C9            [10]  222 	ret
                            223 	.area _CODE
                            224 	.area _INITIALIZER
   50A7                     225 __xinit__batY:
   50A7 00                  226 	.db #0x00	; 0
   50A8                     227 __xinit__batX:
   50A8 00                  228 	.db #0x00	; 0
   50A9                     229 __xinit__oldBatX:
   50A9 00                  230 	.db #0x00	; 0
   50AA                     231 __xinit__batW:
   50AA 00                  232 	.db #0x00	; 0
                            233 	.area _CABS (ABS)
