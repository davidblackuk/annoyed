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
   5483                      33 _batY::
   5483                      34 	.ds 1
   5484                      35 _batX::
   5484                      36 	.ds 1
   5485                      37 _oldBatX::
   5485                      38 	.ds 1
   5486                      39 _batW::
   5486                      40 	.ds 1
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
   4ECD                      65 _bat_initialize::
                             66 ;src/bat.c:28: batW = 8;
   4ECD 21 86 54      [10]   67 	ld	hl,#_batW + 0
   4ED0 36 08         [10]   68 	ld	(hl), #0x08
                             69 ;src/bat.c:29: batX = (SCREEN_WIDTH_BYTES- batW) / 2;
   4ED2 21 84 54      [10]   70 	ld	hl,#_batX + 0
   4ED5 36 24         [10]   71 	ld	(hl), #0x24
                             72 ;src/bat.c:30: batY = SCREEN_HEIGHT_ROWS - BAT_HEIGHT_PIXELS - BAT_BOTTOM_OFFSET_PIXELS;
   4ED7 21 83 54      [10]   73 	ld	hl,#_batY + 0
   4EDA 36 B8         [10]   74 	ld	(hl), #0xb8
                             75 ;src/bat.c:31: oldBatX = batX;
   4EDC 21 85 54      [10]   76 	ld	hl,#_oldBatX + 0
   4EDF 36 24         [10]   77 	ld	(hl), #0x24
   4EE1 C9            [10]   78 	ret
                             79 ;src/bat.c:35: void bat_update() {
                             80 ;	---------------------------------
                             81 ; Function bat_update
                             82 ; ---------------------------------
   4EE2                      83 _bat_update::
                             84 ;src/bat.c:38: oldBatX = batX;
   4EE2 21 84 54      [10]   85 	ld	hl,#_batX + 0
   4EE5 4E            [ 7]   86 	ld	c, (hl)
                             87 ;src/bat.c:36: if (key_left_is_pressed) {
   4EE6 3A 80 54      [13]   88 	ld	a,(#_key_left_is_pressed + 0)
   4EE9 B7            [ 4]   89 	or	a, a
   4EEA 28 13         [12]   90 	jr	Z,00108$
                             91 ;src/bat.c:37: if (batX > PLAY_AREA_LEFT_EDGE) {
   4EEC 3E 0C         [ 7]   92 	ld	a, #0x0c
   4EEE FD 21 84 54   [14]   93 	ld	iy, #_batX
   4EF2 FD 96 00      [19]   94 	sub	a, 0 (iy)
   4EF5 D0            [11]   95 	ret	NC
                             96 ;src/bat.c:38: oldBatX = batX;
   4EF6 21 85 54      [10]   97 	ld	hl,#_oldBatX + 0
   4EF9 71            [ 7]   98 	ld	(hl), c
                             99 ;src/bat.c:39: batX--;
   4EFA 21 84 54      [10]  100 	ld	hl, #_batX+0
   4EFD 35            [11]  101 	dec	(hl)
   4EFE C9            [10]  102 	ret
   4EFF                     103 00108$:
                            104 ;src/bat.c:41: } else if (key_right_is_pressed) {
   4EFF 3A 81 54      [13]  105 	ld	a,(#_key_right_is_pressed + 0)
   4F02 B7            [ 4]  106 	or	a, a
   4F03 C8            [11]  107 	ret	Z
                            108 ;src/bat.c:42: if (batX < PLAY_AREA_RIGHT_EDGE - batW) {
   4F04 21 86 54      [10]  109 	ld	hl,#_batW + 0
   4F07 5E            [ 7]  110 	ld	e, (hl)
   4F08 16 00         [ 7]  111 	ld	d, #0x00
   4F0A 3E 42         [ 7]  112 	ld	a, #0x42
   4F0C 93            [ 4]  113 	sub	a, e
   4F0D 47            [ 4]  114 	ld	b, a
   4F0E 3E 00         [ 7]  115 	ld	a, #0x00
   4F10 9A            [ 4]  116 	sbc	a, d
   4F11 5F            [ 4]  117 	ld	e, a
   4F12 3A 84 54      [13]  118 	ld	a,(#_batX + 0)
   4F15 16 00         [ 7]  119 	ld	d, #0x00
   4F17 90            [ 4]  120 	sub	a, b
   4F18 7A            [ 4]  121 	ld	a, d
   4F19 9B            [ 4]  122 	sbc	a, e
   4F1A E2 1F 4F      [10]  123 	jp	PO, 00128$
   4F1D EE 80         [ 7]  124 	xor	a, #0x80
   4F1F                     125 00128$:
   4F1F F0            [11]  126 	ret	P
                            127 ;src/bat.c:43: oldBatX = batX;
   4F20 21 85 54      [10]  128 	ld	hl,#_oldBatX + 0
   4F23 71            [ 7]  129 	ld	(hl), c
                            130 ;src/bat.c:44: batX++;
   4F24 21 84 54      [10]  131 	ld	hl, #_batX+0
   4F27 34            [11]  132 	inc	(hl)
   4F28 C9            [10]  133 	ret
                            134 ;src/bat.c:49: void bat_restore_background() {
                            135 ;	---------------------------------
                            136 ; Function bat_restore_background
                            137 ; ---------------------------------
   4F29                     138 _bat_restore_background::
                            139 ;src/bat.c:50: restoreBackground(oldBatX, batY, batW, BAT_HEIGHT_PIXELS);
   4F29 3E 08         [ 7]  140 	ld	a, #0x08
   4F2B F5            [11]  141 	push	af
   4F2C 33            [ 6]  142 	inc	sp
   4F2D 3A 86 54      [13]  143 	ld	a, (_batW)
   4F30 F5            [11]  144 	push	af
   4F31 33            [ 6]  145 	inc	sp
   4F32 3A 83 54      [13]  146 	ld	a, (_batY)
   4F35 F5            [11]  147 	push	af
   4F36 33            [ 6]  148 	inc	sp
   4F37 3A 85 54      [13]  149 	ld	a, (_oldBatX)
   4F3A F5            [11]  150 	push	af
   4F3B 33            [ 6]  151 	inc	sp
   4F3C CD 3F 4B      [17]  152 	call	_restoreBackground
   4F3F F1            [10]  153 	pop	af
   4F40 F1            [10]  154 	pop	af
   4F41 C9            [10]  155 	ret
                            156 ;src/bat.c:53: void bat_draw()
                            157 ;	---------------------------------
                            158 ; Function bat_draw
                            159 ; ---------------------------------
   4F42                     160 _bat_draw::
                            161 ;src/bat.c:57: svmem = cpct_getScreenPtr(CPCT_VMEM_START, batX, batY);
   4F42 3A 83 54      [13]  162 	ld	a, (_batY)
   4F45 F5            [11]  163 	push	af
   4F46 33            [ 6]  164 	inc	sp
   4F47 3A 84 54      [13]  165 	ld	a, (_batX)
   4F4A F5            [11]  166 	push	af
   4F4B 33            [ 6]  167 	inc	sp
   4F4C 21 00 C0      [10]  168 	ld	hl, #0xc000
   4F4F E5            [11]  169 	push	hl
   4F50 CD 55 53      [17]  170 	call	_cpct_getScreenPtr
   4F53 4D            [ 4]  171 	ld	c, l
   4F54 44            [ 4]  172 	ld	b, h
                            173 ;src/bat.c:59: cpct_drawSprite(sp_bat_left, svmem, SP_BAT_LEFT_W, SP_BAT_LEFT_H);
   4F55 59            [ 4]  174 	ld	e, c
   4F56 50            [ 4]  175 	ld	d, b
   4F57 C5            [11]  176 	push	bc
   4F58 21 02 08      [10]  177 	ld	hl, #0x0802
   4F5B E5            [11]  178 	push	hl
   4F5C D5            [11]  179 	push	de
   4F5D 21 C4 4A      [10]  180 	ld	hl, #_sp_bat_left
   4F60 E5            [11]  181 	push	hl
   4F61 CD 1D 51      [17]  182 	call	_cpct_drawSprite
   4F64 C1            [10]  183 	pop	bc
                            184 ;src/bat.c:60: cpct_drawSprite(sp_bat_mid, svmem + BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
   4F65 59            [ 4]  185 	ld	e, c
   4F66 50            [ 4]  186 	ld	d, b
   4F67 13            [ 6]  187 	inc	de
   4F68 13            [ 6]  188 	inc	de
   4F69 C5            [11]  189 	push	bc
   4F6A 21 02 08      [10]  190 	ld	hl, #0x0802
   4F6D E5            [11]  191 	push	hl
   4F6E D5            [11]  192 	push	de
   4F6F 21 B4 4A      [10]  193 	ld	hl, #_sp_bat_mid
   4F72 E5            [11]  194 	push	hl
   4F73 CD 1D 51      [17]  195 	call	_cpct_drawSprite
   4F76 C1            [10]  196 	pop	bc
                            197 ;src/bat.c:61: cpct_drawSprite(sp_bat_mid, svmem + 2*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
   4F77 21 04 00      [10]  198 	ld	hl, #0x0004
   4F7A 09            [11]  199 	add	hl, bc
   4F7B C5            [11]  200 	push	bc
   4F7C 11 02 08      [10]  201 	ld	de, #0x0802
   4F7F D5            [11]  202 	push	de
   4F80 E5            [11]  203 	push	hl
   4F81 21 B4 4A      [10]  204 	ld	hl, #_sp_bat_mid
   4F84 E5            [11]  205 	push	hl
   4F85 CD 1D 51      [17]  206 	call	_cpct_drawSprite
   4F88 C1            [10]  207 	pop	bc
                            208 ;src/bat.c:62: cpct_drawSprite(sp_bat_right, svmem + 3*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_RIGHT_W, SP_BAT_RIGHT_H);
   4F89 21 06 00      [10]  209 	ld	hl, #0x0006
   4F8C 09            [11]  210 	add	hl, bc
   4F8D 01 A4 4A      [10]  211 	ld	bc, #_sp_bat_right+0
   4F90 11 02 08      [10]  212 	ld	de, #0x0802
   4F93 D5            [11]  213 	push	de
   4F94 E5            [11]  214 	push	hl
   4F95 C5            [11]  215 	push	bc
   4F96 CD 1D 51      [17]  216 	call	_cpct_drawSprite
   4F99 C9            [10]  217 	ret
                            218 	.area _CODE
                            219 	.area _INITIALIZER
   5487                     220 __xinit__batY:
   5487 00                  221 	.db #0x00	; 0
   5488                     222 __xinit__batX:
   5488 00                  223 	.db #0x00	; 0
   5489                     224 __xinit__oldBatX:
   5489 00                  225 	.db #0x00	; 0
   548A                     226 __xinit__batW:
   548A 00                  227 	.db #0x00	; 0
                            228 	.area _CABS (ABS)
