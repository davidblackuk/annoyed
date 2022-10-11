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
                             11 	.globl _background_restore
                             12 	.globl _cpct_getScreenPtr
                             13 	.globl _cpct_drawSprite
                             14 	.globl _batW
                             15 	.globl _oldBatX
                             16 	.globl _batX
                             17 	.globl _batY
                             18 	.globl _bat_initialize
                             19 	.globl _bat_update
                             20 	.globl _bat_restore_background
                             21 	.globl _bat_draw
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
   7565                      33 _batY::
   7565                      34 	.ds 1
   7566                      35 _batX::
   7566                      36 	.ds 1
   7567                      37 _oldBatX::
   7567                      38 	.ds 1
   7568                      39 _batW::
   7568                      40 	.ds 1
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
                             61 ;src/bat.c:27: void bat_initialize() {
                             62 ;	---------------------------------
                             63 ; Function bat_initialize
                             64 ; ---------------------------------
   64B4                      65 _bat_initialize::
                             66 ;src/bat.c:28: batW = 8;
   64B4 21 68 75      [10]   67 	ld	hl,#_batW + 0
   64B7 36 08         [10]   68 	ld	(hl), #0x08
                             69 ;src/bat.c:29: batX = (SCREEN_WIDTH_BYTES- batW) / 2;
   64B9 21 66 75      [10]   70 	ld	hl,#_batX + 0
   64BC 36 24         [10]   71 	ld	(hl), #0x24
                             72 ;src/bat.c:30: batY = SCREEN_HEIGHT_ROWS - BAT_HEIGHT_PIXELS - BAT_BOTTOM_OFFSET_PIXELS;
   64BE 21 65 75      [10]   73 	ld	hl,#_batY + 0
   64C1 36 B8         [10]   74 	ld	(hl), #0xb8
                             75 ;src/bat.c:31: oldBatX = batX;
   64C3 21 67 75      [10]   76 	ld	hl,#_oldBatX + 0
   64C6 36 24         [10]   77 	ld	(hl), #0x24
   64C8 C9            [10]   78 	ret
                             79 ;src/bat.c:35: void bat_update() {
                             80 ;	---------------------------------
                             81 ; Function bat_update
                             82 ; ---------------------------------
   64C9                      83 _bat_update::
                             84 ;src/bat.c:38: oldBatX = batX;
   64C9 21 66 75      [10]   85 	ld	hl,#_batX + 0
   64CC 4E            [ 7]   86 	ld	c, (hl)
                             87 ;src/bat.c:36: if (key_left_is_pressed) {
   64CD 3A 58 75      [13]   88 	ld	a,(#_key_left_is_pressed + 0)
   64D0 B7            [ 4]   89 	or	a, a
   64D1 28 13         [12]   90 	jr	Z,00108$
                             91 ;src/bat.c:37: if (batX > PLAY_AREA_LEFT_EDGE) {
   64D3 3E 0C         [ 7]   92 	ld	a, #0x0c
   64D5 FD 21 66 75   [14]   93 	ld	iy, #_batX
   64D9 FD 96 00      [19]   94 	sub	a, 0 (iy)
   64DC D0            [11]   95 	ret	NC
                             96 ;src/bat.c:38: oldBatX = batX;
   64DD 21 67 75      [10]   97 	ld	hl,#_oldBatX + 0
   64E0 71            [ 7]   98 	ld	(hl), c
                             99 ;src/bat.c:39: batX--;
   64E1 21 66 75      [10]  100 	ld	hl, #_batX+0
   64E4 35            [11]  101 	dec	(hl)
   64E5 C9            [10]  102 	ret
   64E6                     103 00108$:
                            104 ;src/bat.c:41: } else if (key_right_is_pressed) {
   64E6 3A 59 75      [13]  105 	ld	a,(#_key_right_is_pressed + 0)
   64E9 B7            [ 4]  106 	or	a, a
   64EA C8            [11]  107 	ret	Z
                            108 ;src/bat.c:42: if (batX < PLAY_AREA_RIGHT_EDGE - batW) {
   64EB 21 68 75      [10]  109 	ld	hl,#_batW + 0
   64EE 5E            [ 7]  110 	ld	e, (hl)
   64EF 16 00         [ 7]  111 	ld	d, #0x00
   64F1 3E 40         [ 7]  112 	ld	a, #0x40
   64F3 93            [ 4]  113 	sub	a, e
   64F4 47            [ 4]  114 	ld	b, a
   64F5 3E 00         [ 7]  115 	ld	a, #0x00
   64F7 9A            [ 4]  116 	sbc	a, d
   64F8 5F            [ 4]  117 	ld	e, a
   64F9 3A 66 75      [13]  118 	ld	a,(#_batX + 0)
   64FC 16 00         [ 7]  119 	ld	d, #0x00
   64FE 90            [ 4]  120 	sub	a, b
   64FF 7A            [ 4]  121 	ld	a, d
   6500 9B            [ 4]  122 	sbc	a, e
   6501 E2 06 65      [10]  123 	jp	PO, 00128$
   6504 EE 80         [ 7]  124 	xor	a, #0x80
   6506                     125 00128$:
   6506 F0            [11]  126 	ret	P
                            127 ;src/bat.c:43: oldBatX = batX;
   6507 21 67 75      [10]  128 	ld	hl,#_oldBatX + 0
   650A 71            [ 7]  129 	ld	(hl), c
                            130 ;src/bat.c:44: batX++;
   650B 21 66 75      [10]  131 	ld	hl, #_batX+0
   650E 34            [11]  132 	inc	(hl)
   650F C9            [10]  133 	ret
                            134 ;src/bat.c:49: void bat_restore_background() {
                            135 ;	---------------------------------
                            136 ; Function bat_restore_background
                            137 ; ---------------------------------
   6510                     138 _bat_restore_background::
                            139 ;src/bat.c:50: background_restore(oldBatX, batY, batW, BAT_HEIGHT_PIXELS);
   6510 3E 08         [ 7]  140 	ld	a, #0x08
   6512 F5            [11]  141 	push	af
   6513 33            [ 6]  142 	inc	sp
   6514 3A 68 75      [13]  143 	ld	a, (_batW)
   6517 F5            [11]  144 	push	af
   6518 33            [ 6]  145 	inc	sp
   6519 3A 65 75      [13]  146 	ld	a, (_batY)
   651C F5            [11]  147 	push	af
   651D 33            [ 6]  148 	inc	sp
   651E 3A 67 75      [13]  149 	ld	a, (_oldBatX)
   6521 F5            [11]  150 	push	af
   6522 33            [ 6]  151 	inc	sp
   6523 CD FD 60      [17]  152 	call	_background_restore
   6526 F1            [10]  153 	pop	af
   6527 F1            [10]  154 	pop	af
   6528 C9            [10]  155 	ret
                            156 ;src/bat.c:53: void bat_draw()
                            157 ;	---------------------------------
                            158 ; Function bat_draw
                            159 ; ---------------------------------
   6529                     160 _bat_draw::
                            161 ;src/bat.c:57: svmem = cpct_getScreenPtr(CPCT_VMEM_START, batX, batY);
   6529 3A 65 75      [13]  162 	ld	a, (_batY)
   652C F5            [11]  163 	push	af
   652D 33            [ 6]  164 	inc	sp
   652E 3A 66 75      [13]  165 	ld	a, (_batX)
   6531 F5            [11]  166 	push	af
   6532 33            [ 6]  167 	inc	sp
   6533 21 00 C0      [10]  168 	ld	hl, #0xc000
   6536 E5            [11]  169 	push	hl
   6537 CD A7 71      [17]  170 	call	_cpct_getScreenPtr
   653A 4D            [ 4]  171 	ld	c, l
   653B 44            [ 4]  172 	ld	b, h
                            173 ;src/bat.c:59: cpct_drawSprite(sp_bat_left, svmem, SP_BAT_LEFT_W, SP_BAT_LEFT_H);
   653C 59            [ 4]  174 	ld	e, c
   653D 50            [ 4]  175 	ld	d, b
   653E C5            [11]  176 	push	bc
   653F 21 02 08      [10]  177 	ld	hl, #0x0802
   6542 E5            [11]  178 	push	hl
   6543 D5            [11]  179 	push	de
   6544 21 4F 60      [10]  180 	ld	hl, #_sp_bat_left
   6547 E5            [11]  181 	push	hl
   6548 CD 91 6E      [17]  182 	call	_cpct_drawSprite
   654B C1            [10]  183 	pop	bc
                            184 ;src/bat.c:60: cpct_drawSprite(sp_bat_mid, svmem + BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
   654C 59            [ 4]  185 	ld	e, c
   654D 50            [ 4]  186 	ld	d, b
   654E 13            [ 6]  187 	inc	de
   654F 13            [ 6]  188 	inc	de
   6550 C5            [11]  189 	push	bc
   6551 21 02 08      [10]  190 	ld	hl, #0x0802
   6554 E5            [11]  191 	push	hl
   6555 D5            [11]  192 	push	de
   6556 21 3F 60      [10]  193 	ld	hl, #_sp_bat_mid
   6559 E5            [11]  194 	push	hl
   655A CD 91 6E      [17]  195 	call	_cpct_drawSprite
   655D C1            [10]  196 	pop	bc
                            197 ;src/bat.c:61: cpct_drawSprite(sp_bat_mid, svmem + 2*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
   655E 21 04 00      [10]  198 	ld	hl, #0x0004
   6561 09            [11]  199 	add	hl, bc
   6562 C5            [11]  200 	push	bc
   6563 11 02 08      [10]  201 	ld	de, #0x0802
   6566 D5            [11]  202 	push	de
   6567 E5            [11]  203 	push	hl
   6568 21 3F 60      [10]  204 	ld	hl, #_sp_bat_mid
   656B E5            [11]  205 	push	hl
   656C CD 91 6E      [17]  206 	call	_cpct_drawSprite
   656F C1            [10]  207 	pop	bc
                            208 ;src/bat.c:62: cpct_drawSprite(sp_bat_right, svmem + 3*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_RIGHT_W, SP_BAT_RIGHT_H);
   6570 21 06 00      [10]  209 	ld	hl, #0x0006
   6573 09            [11]  210 	add	hl, bc
   6574 01 2F 60      [10]  211 	ld	bc, #_sp_bat_right+0
   6577 11 02 08      [10]  212 	ld	de, #0x0802
   657A D5            [11]  213 	push	de
   657B E5            [11]  214 	push	hl
   657C C5            [11]  215 	push	bc
   657D CD 91 6E      [17]  216 	call	_cpct_drawSprite
   6580 C9            [10]  217 	ret
                            218 	.area _CODE
                            219 	.area _INITIALIZER
   7569                     220 __xinit__batY:
   7569 00                  221 	.db #0x00	; 0
   756A                     222 __xinit__batX:
   756A 00                  223 	.db #0x00	; 0
   756B                     224 __xinit__oldBatX:
   756B 00                  225 	.db #0x00	; 0
   756C                     226 __xinit__batW:
   756C 00                  227 	.db #0x00	; 0
                            228 	.area _CABS (ABS)
