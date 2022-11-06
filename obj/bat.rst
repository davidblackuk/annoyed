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
                             13 	.globl _cpct_drawSpriteMasked
                             14 	.globl _cpct_drawSprite
                             15 	.globl _batW
                             16 	.globl _oldBatX
                             17 	.globl _batX
                             18 	.globl _batY
                             19 	.globl _bat_initialize
                             20 	.globl _bat_update
                             21 	.globl _bat_restore_background
                             22 	.globl _bat_draw
                             23 	.globl _bat_bounce_ball
                             24 ;--------------------------------------------------------
                             25 ; special function registers
                             26 ;--------------------------------------------------------
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DATA
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _INITIALIZED
   92B8                      35 _batY::
   92B8                      36 	.ds 1
   92B9                      37 _batX::
   92B9                      38 	.ds 1
   92BA                      39 _oldBatX::
   92BA                      40 	.ds 1
   92BB                      41 _batW::
   92BB                      42 	.ds 1
                             43 ;--------------------------------------------------------
                             44 ; absolute external ram data
                             45 ;--------------------------------------------------------
                             46 	.area _DABS (ABS)
                             47 ;--------------------------------------------------------
                             48 ; global & static initialisations
                             49 ;--------------------------------------------------------
                             50 	.area _HOME
                             51 	.area _GSINIT
                             52 	.area _GSFINAL
                             53 	.area _GSINIT
                             54 ;--------------------------------------------------------
                             55 ; Home
                             56 ;--------------------------------------------------------
                             57 	.area _HOME
                             58 	.area _HOME
                             59 ;--------------------------------------------------------
                             60 ; code
                             61 ;--------------------------------------------------------
                             62 	.area _CODE
                             63 ;src/bat.c:40: void bat_initialize()
                             64 ;	---------------------------------
                             65 ; Function bat_initialize
                             66 ; ---------------------------------
   79CB                      67 _bat_initialize::
                             68 ;src/bat.c:42: batW = 8;
   79CB 21 BB 92      [10]   69 	ld	hl,#_batW + 0
   79CE 36 08         [10]   70 	ld	(hl), #0x08
                             71 ;src/bat.c:43: batX = (PLAY_AREA_WIDTH - batW) / 2;
   79D0 21 B9 92      [10]   72 	ld	hl,#_batX + 0
   79D3 36 16         [10]   73 	ld	(hl), #0x16
                             74 ;src/bat.c:44: batY = PLAY_AREA_HEIGHT - BAT_HEIGHT_PIXELS - BAT_BOTTOM_OFFSET_PIXELS;
   79D5 21 B8 92      [10]   75 	ld	hl,#_batY + 0
   79D8 36 B0         [10]   76 	ld	(hl), #0xb0
                             77 ;src/bat.c:45: oldBatX = batX;
   79DA 21 BA 92      [10]   78 	ld	hl,#_oldBatX + 0
   79DD 36 16         [10]   79 	ld	(hl), #0x16
   79DF C9            [10]   80 	ret
                             81 ;src/bat.c:48: void bat_update()
                             82 ;	---------------------------------
                             83 ; Function bat_update
                             84 ; ---------------------------------
   79E0                      85 _bat_update::
                             86 ;src/bat.c:54: oldBatX = batX;
   79E0 21 B9 92      [10]   87 	ld	hl,#_batX + 0
   79E3 4E            [ 7]   88 	ld	c, (hl)
                             89 ;src/bat.c:50: if (key_left_is_pressed)
   79E4 3A AC 92      [13]   90 	ld	a,(#_key_left_is_pressed + 0)
   79E7 B7            [ 4]   91 	or	a, a
   79E8 28 0E         [12]   92 	jr	Z,00108$
                             93 ;src/bat.c:52: if (batX > 0)
   79EA 3A B9 92      [13]   94 	ld	a,(#_batX + 0)
   79ED B7            [ 4]   95 	or	a, a
   79EE C8            [11]   96 	ret	Z
                             97 ;src/bat.c:54: oldBatX = batX;
   79EF 21 BA 92      [10]   98 	ld	hl,#_oldBatX + 0
   79F2 71            [ 7]   99 	ld	(hl), c
                            100 ;src/bat.c:55: batX--;
   79F3 21 B9 92      [10]  101 	ld	hl, #_batX+0
   79F6 35            [11]  102 	dec	(hl)
   79F7 C9            [10]  103 	ret
   79F8                     104 00108$:
                            105 ;src/bat.c:58: else if (key_right_is_pressed)
   79F8 3A AD 92      [13]  106 	ld	a,(#_key_right_is_pressed + 0)
   79FB B7            [ 4]  107 	or	a, a
   79FC C8            [11]  108 	ret	Z
                            109 ;src/bat.c:60: if (batX < PLAY_AREA_WIDTH - batW)
   79FD 21 BB 92      [10]  110 	ld	hl,#_batW + 0
   7A00 5E            [ 7]  111 	ld	e, (hl)
   7A01 16 00         [ 7]  112 	ld	d, #0x00
   7A03 3E 34         [ 7]  113 	ld	a, #0x34
   7A05 93            [ 4]  114 	sub	a, e
   7A06 47            [ 4]  115 	ld	b, a
   7A07 3E 00         [ 7]  116 	ld	a, #0x00
   7A09 9A            [ 4]  117 	sbc	a, d
   7A0A 5F            [ 4]  118 	ld	e, a
   7A0B 3A B9 92      [13]  119 	ld	a,(#_batX + 0)
   7A0E 16 00         [ 7]  120 	ld	d, #0x00
   7A10 90            [ 4]  121 	sub	a, b
   7A11 7A            [ 4]  122 	ld	a, d
   7A12 9B            [ 4]  123 	sbc	a, e
   7A13 E2 18 7A      [10]  124 	jp	PO, 00128$
   7A16 EE 80         [ 7]  125 	xor	a, #0x80
   7A18                     126 00128$:
   7A18 F0            [11]  127 	ret	P
                            128 ;src/bat.c:62: oldBatX = batX;
   7A19 21 BA 92      [10]  129 	ld	hl,#_oldBatX + 0
   7A1C 71            [ 7]  130 	ld	(hl), c
                            131 ;src/bat.c:63: batX++;
   7A1D 21 B9 92      [10]  132 	ld	hl, #_batX+0
   7A20 34            [11]  133 	inc	(hl)
   7A21 C9            [10]  134 	ret
                            135 ;src/bat.c:68: void bat_restore_background()
                            136 ;	---------------------------------
                            137 ; Function bat_restore_background
                            138 ; ---------------------------------
   7A22                     139 _bat_restore_background::
                            140 ;src/bat.c:70: background_restore_world_coords(oldBatX, batY, batW, BAT_HEIGHT_PIXELS);
   7A22 21 B8 92      [10]  141 	ld	hl,#_batY + 0
   7A25 5E            [ 7]  142 	ld	e, (hl)
   7A26 16 00         [ 7]  143 	ld	d, #0x00
   7A28 21 BA 92      [10]  144 	ld	hl,#_oldBatX + 0
   7A2B 4E            [ 7]  145 	ld	c, (hl)
   7A2C 06 00         [ 7]  146 	ld	b, #0x00
   7A2E 3E 08         [ 7]  147 	ld	a, #0x08
   7A30 F5            [11]  148 	push	af
   7A31 33            [ 6]  149 	inc	sp
   7A32 3A BB 92      [13]  150 	ld	a, (_batW)
   7A35 F5            [11]  151 	push	af
   7A36 33            [ 6]  152 	inc	sp
   7A37 D5            [11]  153 	push	de
   7A38 C5            [11]  154 	push	bc
   7A39 CD 26 75      [17]  155 	call	_background_restore_world_coords
   7A3C 21 06 00      [10]  156 	ld	hl, #6
   7A3F 39            [11]  157 	add	hl, sp
   7A40 F9            [ 6]  158 	ld	sp, hl
   7A41 C9            [10]  159 	ret
                            160 ;src/bat.c:73: void bat_draw()
                            161 ;	---------------------------------
                            162 ; Function bat_draw
                            163 ; ---------------------------------
   7A42                     164 _bat_draw::
                            165 ;src/bat.c:77: svmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(batX), W_2_S_Y(batY));
   7A42 3A B8 92      [13]  166 	ld	a,(#_batY + 0)
   7A45 C6 08         [ 7]  167 	add	a, #0x08
   7A47 57            [ 4]  168 	ld	d, a
   7A48 3A B9 92      [13]  169 	ld	a,(#_batX + 0)
   7A4B C6 0C         [ 7]  170 	add	a, #0x0c
   7A4D 5F            [ 4]  171 	ld	e,a
   7A4E D5            [11]  172 	push	de
   7A4F 21 00 C0      [10]  173 	ld	hl, #0xc000
   7A52 E5            [11]  174 	push	hl
   7A53 CD 44 8D      [17]  175 	call	_cpct_getScreenPtr
   7A56 4D            [ 4]  176 	ld	c, l
   7A57 44            [ 4]  177 	ld	b, h
                            178 ;src/bat.c:79: cpct_drawSpriteMasked(sp_masked_bat_left, svmem, SP_BAT_SEG_W, SP_BAT_SEG_H);
   7A58 59            [ 4]  179 	ld	e, c
   7A59 50            [ 4]  180 	ld	d, b
   7A5A C5            [11]  181 	push	bc
   7A5B 21 02 08      [10]  182 	ld	hl, #0x0802
   7A5E E5            [11]  183 	push	hl
   7A5F D5            [11]  184 	push	de
   7A60 21 B9 85      [10]  185 	ld	hl, #_sp_masked_bat_left
   7A63 E5            [11]  186 	push	hl
   7A64 CD 76 8B      [17]  187 	call	_cpct_drawSpriteMasked
   7A67 C1            [10]  188 	pop	bc
                            189 ;src/bat.c:81: cpct_drawSprite(sp_bat_mid, svmem + BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
   7A68 59            [ 4]  190 	ld	e, c
   7A69 50            [ 4]  191 	ld	d, b
   7A6A 13            [ 6]  192 	inc	de
   7A6B 13            [ 6]  193 	inc	de
   7A6C C5            [11]  194 	push	bc
   7A6D 21 02 08      [10]  195 	ld	hl, #0x0802
   7A70 E5            [11]  196 	push	hl
   7A71 D5            [11]  197 	push	de
   7A72 21 33 74      [10]  198 	ld	hl, #_sp_bat_mid
   7A75 E5            [11]  199 	push	hl
   7A76 CD D9 89      [17]  200 	call	_cpct_drawSprite
   7A79 C1            [10]  201 	pop	bc
                            202 ;src/bat.c:82: cpct_drawSprite(sp_bat_mid, svmem + 2 * BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
   7A7A 21 04 00      [10]  203 	ld	hl, #0x0004
   7A7D 09            [11]  204 	add	hl, bc
   7A7E C5            [11]  205 	push	bc
   7A7F 11 02 08      [10]  206 	ld	de, #0x0802
   7A82 D5            [11]  207 	push	de
   7A83 E5            [11]  208 	push	hl
   7A84 21 33 74      [10]  209 	ld	hl, #_sp_bat_mid
   7A87 E5            [11]  210 	push	hl
   7A88 CD D9 89      [17]  211 	call	_cpct_drawSprite
   7A8B C1            [10]  212 	pop	bc
                            213 ;src/bat.c:84: cpct_drawSpriteMasked(sp_masked_bat_right, svmem + 3 * BAT_SEGMENT_WIDTH_BYTES, SP_BAT_SEG_W, SP_BAT_SEG_H);
   7A8C 21 06 00      [10]  214 	ld	hl, #0x0006
   7A8F 09            [11]  215 	add	hl, bc
   7A90 01 D9 85      [10]  216 	ld	bc, #_sp_masked_bat_right+0
   7A93 11 02 08      [10]  217 	ld	de, #0x0802
   7A96 D5            [11]  218 	push	de
   7A97 E5            [11]  219 	push	hl
   7A98 C5            [11]  220 	push	bc
   7A99 CD 76 8B      [17]  221 	call	_cpct_drawSpriteMasked
   7A9C C9            [10]  222 	ret
                            223 ;src/bat.c:87: BounceHits bat_bounce_ball(Ball *ball, i16 at_x, i16 at_y)
                            224 ;	---------------------------------
                            225 ; Function bat_bounce_ball
                            226 ; ---------------------------------
   7A9D                     227 _bat_bounce_ball::
   7A9D DD E5         [15]  228 	push	ix
   7A9F DD 21 00 00   [14]  229 	ld	ix,#0
   7AA3 DD 39         [15]  230 	add	ix,sp
   7AA5 F5            [11]  231 	push	af
   7AA6 F5            [11]  232 	push	af
   7AA7 3B            [ 6]  233 	dec	sp
                            234 ;src/bat.c:89: BounceHits bounces = BOUNCE_NONE;
   7AA8 DD 36 FB 00   [19]  235 	ld	-5 (ix), #0x00
                            236 ;src/bat.c:91: if (ball->dy > 0 &&
   7AAC DD 4E 04      [19]  237 	ld	c,4 (ix)
   7AAF DD 46 05      [19]  238 	ld	b,5 (ix)
   7AB2 69            [ 4]  239 	ld	l, c
   7AB3 60            [ 4]  240 	ld	h, b
   7AB4 11 0B 00      [10]  241 	ld	de, #0x000b
   7AB7 19            [11]  242 	add	hl, de
   7AB8 5E            [ 7]  243 	ld	e, (hl)
   7AB9 23            [ 6]  244 	inc	hl
   7ABA 56            [ 7]  245 	ld	d, (hl)
   7ABB AF            [ 4]  246 	xor	a, a
   7ABC BB            [ 4]  247 	cp	a, e
   7ABD 9A            [ 4]  248 	sbc	a, d
   7ABE E2 C3 7A      [10]  249 	jp	PO, 00129$
   7AC1 EE 80         [ 7]  250 	xor	a, #0x80
   7AC3                     251 00129$:
   7AC3 F2 48 7B      [10]  252 	jp	P, 00102$
                            253 ;src/bat.c:92: (ball->x + BALL_WIDTH > batX && ball->x < batX + batW) &&
   7AC6 69            [ 4]  254 	ld	l, c
   7AC7 60            [ 4]  255 	ld	h, b
   7AC8 23            [ 6]  256 	inc	hl
   7AC9 7E            [ 7]  257 	ld	a, (hl)
   7ACA DD 77 FE      [19]  258 	ld	-2 (ix), a
   7ACD 23            [ 6]  259 	inc	hl
   7ACE 7E            [ 7]  260 	ld	a, (hl)
   7ACF DD 77 FF      [19]  261 	ld	-1 (ix), a
   7AD2 DD 7E FE      [19]  262 	ld	a, -2 (ix)
   7AD5 C6 03         [ 7]  263 	add	a, #0x03
   7AD7 DD 77 FC      [19]  264 	ld	-4 (ix), a
   7ADA DD 7E FF      [19]  265 	ld	a, -1 (ix)
   7ADD CE 00         [ 7]  266 	adc	a, #0x00
   7ADF DD 77 FD      [19]  267 	ld	-3 (ix), a
   7AE2 21 B9 92      [10]  268 	ld	hl,#_batX + 0
   7AE5 5E            [ 7]  269 	ld	e, (hl)
   7AE6 16 00         [ 7]  270 	ld	d, #0x00
   7AE8 7B            [ 4]  271 	ld	a, e
   7AE9 DD 96 FC      [19]  272 	sub	a, -4 (ix)
   7AEC 7A            [ 4]  273 	ld	a, d
   7AED DD 9E FD      [19]  274 	sbc	a, -3 (ix)
   7AF0 E2 F5 7A      [10]  275 	jp	PO, 00130$
   7AF3 EE 80         [ 7]  276 	xor	a, #0x80
   7AF5                     277 00130$:
   7AF5 F2 48 7B      [10]  278 	jp	P, 00102$
   7AF8 FD 21 BB 92   [14]  279 	ld	iy, #_batW
   7AFC FD 6E 00      [19]  280 	ld	l, 0 (iy)
   7AFF 26 00         [ 7]  281 	ld	h, #0x00
   7B01 19            [11]  282 	add	hl, de
   7B02 DD 7E FE      [19]  283 	ld	a, -2 (ix)
   7B05 95            [ 4]  284 	sub	a, l
   7B06 DD 7E FF      [19]  285 	ld	a, -1 (ix)
   7B09 9C            [ 4]  286 	sbc	a, h
   7B0A E2 0F 7B      [10]  287 	jp	PO, 00131$
   7B0D EE 80         [ 7]  288 	xor	a, #0x80
   7B0F                     289 00131$:
   7B0F F2 48 7B      [10]  290 	jp	P, 00102$
                            291 ;src/bat.c:93: (ball->y + BALL_HEIGHT > batY && ball->y < batY + SP_BAT_SEG_H))
   7B12 69            [ 4]  292 	ld	l, c
   7B13 60            [ 4]  293 	ld	h, b
   7B14 23            [ 6]  294 	inc	hl
   7B15 23            [ 6]  295 	inc	hl
   7B16 23            [ 6]  296 	inc	hl
   7B17 4E            [ 7]  297 	ld	c, (hl)
   7B18 23            [ 6]  298 	inc	hl
   7B19 46            [ 7]  299 	ld	b, (hl)
   7B1A 21 06 00      [10]  300 	ld	hl, #0x0006
   7B1D 09            [11]  301 	add	hl,bc
   7B1E EB            [ 4]  302 	ex	de,hl
   7B1F FD 21 B8 92   [14]  303 	ld	iy, #_batY
   7B23 FD 6E 00      [19]  304 	ld	l, 0 (iy)
   7B26 26 00         [ 7]  305 	ld	h, #0x00
   7B28 7D            [ 4]  306 	ld	a, l
   7B29 93            [ 4]  307 	sub	a, e
   7B2A 7C            [ 4]  308 	ld	a, h
   7B2B 9A            [ 4]  309 	sbc	a, d
   7B2C E2 31 7B      [10]  310 	jp	PO, 00132$
   7B2F EE 80         [ 7]  311 	xor	a, #0x80
   7B31                     312 00132$:
   7B31 F2 48 7B      [10]  313 	jp	P, 00102$
   7B34 11 08 00      [10]  314 	ld	de, #0x0008
   7B37 19            [11]  315 	add	hl, de
   7B38 79            [ 4]  316 	ld	a, c
   7B39 95            [ 4]  317 	sub	a, l
   7B3A 78            [ 4]  318 	ld	a, b
   7B3B 9C            [ 4]  319 	sbc	a, h
   7B3C E2 41 7B      [10]  320 	jp	PO, 00133$
   7B3F EE 80         [ 7]  321 	xor	a, #0x80
   7B41                     322 00133$:
   7B41 F2 48 7B      [10]  323 	jp	P, 00102$
                            324 ;src/bat.c:95: bounces |= BOUNCE_Y;
   7B44 DD 36 FB 02   [19]  325 	ld	-5 (ix), #0x02
   7B48                     326 00102$:
                            327 ;src/bat.c:98: return bounces;
   7B48 DD 6E FB      [19]  328 	ld	l, -5 (ix)
   7B4B DD F9         [10]  329 	ld	sp, ix
   7B4D DD E1         [14]  330 	pop	ix
   7B4F C9            [10]  331 	ret
                            332 	.area _CODE
                            333 	.area _INITIALIZER
   92BC                     334 __xinit__batY:
   92BC 00                  335 	.db #0x00	; 0
   92BD                     336 __xinit__batX:
   92BD 00                  337 	.db #0x00	; 0
   92BE                     338 __xinit__oldBatX:
   92BE 00                  339 	.db #0x00	; 0
   92BF                     340 __xinit__batW:
   92BF 00                  341 	.db #0x00	; 0
                            342 	.area _CABS (ABS)
