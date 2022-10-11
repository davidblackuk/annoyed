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
                             11 	.globl _background_restore_world_coords
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
   75CD                      33 _batY::
   75CD                      34 	.ds 1
   75CE                      35 _batX::
   75CE                      36 	.ds 1
   75CF                      37 _oldBatX::
   75CF                      38 	.ds 1
   75D0                      39 _batW::
   75D0                      40 	.ds 1
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
                             61 ;src/bat.c:35: void bat_initialize() {
                             62 ;	---------------------------------
                             63 ; Function bat_initialize
                             64 ; ---------------------------------
   651C                      65 _bat_initialize::
                             66 ;src/bat.c:36: batW = 8;
   651C 21 D0 75      [10]   67 	ld	hl,#_batW + 0
   651F 36 08         [10]   68 	ld	(hl), #0x08
                             69 ;src/bat.c:37: batX = (PLAY_AREA_WIDTH- batW) / 2;
   6521 21 CE 75      [10]   70 	ld	hl,#_batX + 0
   6524 36 16         [10]   71 	ld	(hl), #0x16
                             72 ;src/bat.c:38: batY = PLAY_AREA_HEIGHT - BAT_HEIGHT_PIXELS - BAT_BOTTOM_OFFSET_PIXELS;
   6526 21 CD 75      [10]   73 	ld	hl,#_batY + 0
   6529 36 B0         [10]   74 	ld	(hl), #0xb0
                             75 ;src/bat.c:39: oldBatX = batX;
   652B 21 CF 75      [10]   76 	ld	hl,#_oldBatX + 0
   652E 36 16         [10]   77 	ld	(hl), #0x16
   6530 C9            [10]   78 	ret
                             79 ;src/bat.c:43: void bat_update() {
                             80 ;	---------------------------------
                             81 ; Function bat_update
                             82 ; ---------------------------------
   6531                      83 _bat_update::
                             84 ;src/bat.c:46: oldBatX = batX;
   6531 21 CE 75      [10]   85 	ld	hl,#_batX + 0
   6534 4E            [ 7]   86 	ld	c, (hl)
                             87 ;src/bat.c:44: if (key_left_is_pressed) {
   6535 3A C0 75      [13]   88 	ld	a,(#_key_left_is_pressed + 0)
   6538 B7            [ 4]   89 	or	a, a
   6539 28 0E         [12]   90 	jr	Z,00108$
                             91 ;src/bat.c:45: if (batX > 0) {
   653B 3A CE 75      [13]   92 	ld	a,(#_batX + 0)
   653E B7            [ 4]   93 	or	a, a
   653F C8            [11]   94 	ret	Z
                             95 ;src/bat.c:46: oldBatX = batX;
   6540 21 CF 75      [10]   96 	ld	hl,#_oldBatX + 0
   6543 71            [ 7]   97 	ld	(hl), c
                             98 ;src/bat.c:47: batX--;
   6544 21 CE 75      [10]   99 	ld	hl, #_batX+0
   6547 35            [11]  100 	dec	(hl)
   6548 C9            [10]  101 	ret
   6549                     102 00108$:
                            103 ;src/bat.c:49: } else if (key_right_is_pressed) {
   6549 3A C1 75      [13]  104 	ld	a,(#_key_right_is_pressed + 0)
   654C B7            [ 4]  105 	or	a, a
   654D C8            [11]  106 	ret	Z
                            107 ;src/bat.c:50: if (batX < PLAY_AREA_WIDTH - batW) {
   654E 21 D0 75      [10]  108 	ld	hl,#_batW + 0
   6551 5E            [ 7]  109 	ld	e, (hl)
   6552 16 00         [ 7]  110 	ld	d, #0x00
   6554 3E 34         [ 7]  111 	ld	a, #0x34
   6556 93            [ 4]  112 	sub	a, e
   6557 47            [ 4]  113 	ld	b, a
   6558 3E 00         [ 7]  114 	ld	a, #0x00
   655A 9A            [ 4]  115 	sbc	a, d
   655B 5F            [ 4]  116 	ld	e, a
   655C 3A CE 75      [13]  117 	ld	a,(#_batX + 0)
   655F 16 00         [ 7]  118 	ld	d, #0x00
   6561 90            [ 4]  119 	sub	a, b
   6562 7A            [ 4]  120 	ld	a, d
   6563 9B            [ 4]  121 	sbc	a, e
   6564 E2 69 65      [10]  122 	jp	PO, 00128$
   6567 EE 80         [ 7]  123 	xor	a, #0x80
   6569                     124 00128$:
   6569 F0            [11]  125 	ret	P
                            126 ;src/bat.c:51: oldBatX = batX;
   656A 21 CF 75      [10]  127 	ld	hl,#_oldBatX + 0
   656D 71            [ 7]  128 	ld	(hl), c
                            129 ;src/bat.c:52: batX++;
   656E 21 CE 75      [10]  130 	ld	hl, #_batX+0
   6571 34            [11]  131 	inc	(hl)
   6572 C9            [10]  132 	ret
                            133 ;src/bat.c:57: void bat_restore_background() {
                            134 ;	---------------------------------
                            135 ; Function bat_restore_background
                            136 ; ---------------------------------
   6573                     137 _bat_restore_background::
                            138 ;src/bat.c:58: background_restore_world_coords(oldBatX, batY, batW, BAT_HEIGHT_PIXELS);
   6573 3E 08         [ 7]  139 	ld	a, #0x08
   6575 F5            [11]  140 	push	af
   6576 33            [ 6]  141 	inc	sp
   6577 3A D0 75      [13]  142 	ld	a, (_batW)
   657A F5            [11]  143 	push	af
   657B 33            [ 6]  144 	inc	sp
   657C 3A CD 75      [13]  145 	ld	a, (_batY)
   657F F5            [11]  146 	push	af
   6580 33            [ 6]  147 	inc	sp
   6581 3A CF 75      [13]  148 	ld	a, (_oldBatX)
   6584 F5            [11]  149 	push	af
   6585 33            [ 6]  150 	inc	sp
   6586 CD FD 60      [17]  151 	call	_background_restore_world_coords
   6589 F1            [10]  152 	pop	af
   658A F1            [10]  153 	pop	af
   658B C9            [10]  154 	ret
                            155 ;src/bat.c:61: void bat_draw()
                            156 ;	---------------------------------
                            157 ; Function bat_draw
                            158 ; ---------------------------------
   658C                     159 _bat_draw::
                            160 ;src/bat.c:65: svmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(batX), W_2_S_Y(batY));
   658C 21 CD 75      [10]  161 	ld	hl,#_batY + 0
   658F 56            [ 7]  162 	ld	d, (hl)
   6590 14            [ 4]  163 	inc	d
   6591 14            [ 4]  164 	inc	d
   6592 14            [ 4]  165 	inc	d
   6593 14            [ 4]  166 	inc	d
   6594 3A CE 75      [13]  167 	ld	a,(#_batX + 0)
   6597 C6 0C         [ 7]  168 	add	a, #0x0c
   6599 5F            [ 4]  169 	ld	e,a
   659A D5            [11]  170 	push	de
   659B 21 00 C0      [10]  171 	ld	hl, #0xc000
   659E E5            [11]  172 	push	hl
   659F CD 0F 72      [17]  173 	call	_cpct_getScreenPtr
   65A2 4D            [ 4]  174 	ld	c, l
   65A3 44            [ 4]  175 	ld	b, h
                            176 ;src/bat.c:67: cpct_drawSprite(sp_bat_left, svmem, SP_BAT_LEFT_W, SP_BAT_LEFT_H);
   65A4 59            [ 4]  177 	ld	e, c
   65A5 50            [ 4]  178 	ld	d, b
   65A6 C5            [11]  179 	push	bc
   65A7 21 02 08      [10]  180 	ld	hl, #0x0802
   65AA E5            [11]  181 	push	hl
   65AB D5            [11]  182 	push	de
   65AC 21 4F 60      [10]  183 	ld	hl, #_sp_bat_left
   65AF E5            [11]  184 	push	hl
   65B0 CD F9 6E      [17]  185 	call	_cpct_drawSprite
   65B3 C1            [10]  186 	pop	bc
                            187 ;src/bat.c:68: cpct_drawSprite(sp_bat_mid, svmem + BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
   65B4 59            [ 4]  188 	ld	e, c
   65B5 50            [ 4]  189 	ld	d, b
   65B6 13            [ 6]  190 	inc	de
   65B7 13            [ 6]  191 	inc	de
   65B8 C5            [11]  192 	push	bc
   65B9 21 02 08      [10]  193 	ld	hl, #0x0802
   65BC E5            [11]  194 	push	hl
   65BD D5            [11]  195 	push	de
   65BE 21 3F 60      [10]  196 	ld	hl, #_sp_bat_mid
   65C1 E5            [11]  197 	push	hl
   65C2 CD F9 6E      [17]  198 	call	_cpct_drawSprite
   65C5 C1            [10]  199 	pop	bc
                            200 ;src/bat.c:69: cpct_drawSprite(sp_bat_mid, svmem + 2*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
   65C6 21 04 00      [10]  201 	ld	hl, #0x0004
   65C9 09            [11]  202 	add	hl, bc
   65CA C5            [11]  203 	push	bc
   65CB 11 02 08      [10]  204 	ld	de, #0x0802
   65CE D5            [11]  205 	push	de
   65CF E5            [11]  206 	push	hl
   65D0 21 3F 60      [10]  207 	ld	hl, #_sp_bat_mid
   65D3 E5            [11]  208 	push	hl
   65D4 CD F9 6E      [17]  209 	call	_cpct_drawSprite
   65D7 C1            [10]  210 	pop	bc
                            211 ;src/bat.c:70: cpct_drawSprite(sp_bat_right, svmem + 3*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_RIGHT_W, SP_BAT_RIGHT_H);
   65D8 21 06 00      [10]  212 	ld	hl, #0x0006
   65DB 09            [11]  213 	add	hl, bc
   65DC 01 2F 60      [10]  214 	ld	bc, #_sp_bat_right+0
   65DF 11 02 08      [10]  215 	ld	de, #0x0802
   65E2 D5            [11]  216 	push	de
   65E3 E5            [11]  217 	push	hl
   65E4 C5            [11]  218 	push	bc
   65E5 CD F9 6E      [17]  219 	call	_cpct_drawSprite
   65E8 C9            [10]  220 	ret
                            221 	.area _CODE
                            222 	.area _INITIALIZER
   75D1                     223 __xinit__batY:
   75D1 00                  224 	.db #0x00	; 0
   75D2                     225 __xinit__batX:
   75D2 00                  226 	.db #0x00	; 0
   75D3                     227 __xinit__oldBatX:
   75D3 00                  228 	.db #0x00	; 0
   75D4                     229 __xinit__batW:
   75D4 00                  230 	.db #0x00	; 0
                            231 	.area _CABS (ABS)
