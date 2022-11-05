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
   8830                      35 _batY::
   8830                      36 	.ds 1
   8831                      37 _batX::
   8831                      38 	.ds 1
   8832                      39 _oldBatX::
   8832                      40 	.ds 1
   8833                      41 _batW::
   8833                      42 	.ds 1
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
   6ED4                      67 _bat_initialize::
                             68 ;src/bat.c:42: batW = 8;
   6ED4 21 33 88      [10]   69 	ld	hl,#_batW + 0
   6ED7 36 08         [10]   70 	ld	(hl), #0x08
                             71 ;src/bat.c:43: batX = (PLAY_AREA_WIDTH - batW) / 2;
   6ED9 21 31 88      [10]   72 	ld	hl,#_batX + 0
   6EDC 36 16         [10]   73 	ld	(hl), #0x16
                             74 ;src/bat.c:44: batY = PLAY_AREA_HEIGHT - BAT_HEIGHT_PIXELS - BAT_BOTTOM_OFFSET_PIXELS;
   6EDE 21 30 88      [10]   75 	ld	hl,#_batY + 0
   6EE1 36 B0         [10]   76 	ld	(hl), #0xb0
                             77 ;src/bat.c:45: oldBatX = batX;
   6EE3 21 32 88      [10]   78 	ld	hl,#_oldBatX + 0
   6EE6 36 16         [10]   79 	ld	(hl), #0x16
   6EE8 C9            [10]   80 	ret
                             81 ;src/bat.c:48: void bat_update()
                             82 ;	---------------------------------
                             83 ; Function bat_update
                             84 ; ---------------------------------
   6EE9                      85 _bat_update::
                             86 ;src/bat.c:54: oldBatX = batX;
   6EE9 21 31 88      [10]   87 	ld	hl,#_batX + 0
   6EEC 4E            [ 7]   88 	ld	c, (hl)
                             89 ;src/bat.c:50: if (key_left_is_pressed)
   6EED 3A 24 88      [13]   90 	ld	a,(#_key_left_is_pressed + 0)
   6EF0 B7            [ 4]   91 	or	a, a
   6EF1 28 0E         [12]   92 	jr	Z,00108$
                             93 ;src/bat.c:52: if (batX > 0)
   6EF3 3A 31 88      [13]   94 	ld	a,(#_batX + 0)
   6EF6 B7            [ 4]   95 	or	a, a
   6EF7 C8            [11]   96 	ret	Z
                             97 ;src/bat.c:54: oldBatX = batX;
   6EF8 21 32 88      [10]   98 	ld	hl,#_oldBatX + 0
   6EFB 71            [ 7]   99 	ld	(hl), c
                            100 ;src/bat.c:55: batX--;
   6EFC 21 31 88      [10]  101 	ld	hl, #_batX+0
   6EFF 35            [11]  102 	dec	(hl)
   6F00 C9            [10]  103 	ret
   6F01                     104 00108$:
                            105 ;src/bat.c:58: else if (key_right_is_pressed)
   6F01 3A 25 88      [13]  106 	ld	a,(#_key_right_is_pressed + 0)
   6F04 B7            [ 4]  107 	or	a, a
   6F05 C8            [11]  108 	ret	Z
                            109 ;src/bat.c:60: if (batX < PLAY_AREA_WIDTH - batW)
   6F06 21 33 88      [10]  110 	ld	hl,#_batW + 0
   6F09 5E            [ 7]  111 	ld	e, (hl)
   6F0A 16 00         [ 7]  112 	ld	d, #0x00
   6F0C 3E 34         [ 7]  113 	ld	a, #0x34
   6F0E 93            [ 4]  114 	sub	a, e
   6F0F 47            [ 4]  115 	ld	b, a
   6F10 3E 00         [ 7]  116 	ld	a, #0x00
   6F12 9A            [ 4]  117 	sbc	a, d
   6F13 5F            [ 4]  118 	ld	e, a
   6F14 3A 31 88      [13]  119 	ld	a,(#_batX + 0)
   6F17 16 00         [ 7]  120 	ld	d, #0x00
   6F19 90            [ 4]  121 	sub	a, b
   6F1A 7A            [ 4]  122 	ld	a, d
   6F1B 9B            [ 4]  123 	sbc	a, e
   6F1C E2 21 6F      [10]  124 	jp	PO, 00128$
   6F1F EE 80         [ 7]  125 	xor	a, #0x80
   6F21                     126 00128$:
   6F21 F0            [11]  127 	ret	P
                            128 ;src/bat.c:62: oldBatX = batX;
   6F22 21 32 88      [10]  129 	ld	hl,#_oldBatX + 0
   6F25 71            [ 7]  130 	ld	(hl), c
                            131 ;src/bat.c:63: batX++;
   6F26 21 31 88      [10]  132 	ld	hl, #_batX+0
   6F29 34            [11]  133 	inc	(hl)
   6F2A C9            [10]  134 	ret
                            135 ;src/bat.c:68: void bat_restore_background()
                            136 ;	---------------------------------
                            137 ; Function bat_restore_background
                            138 ; ---------------------------------
   6F2B                     139 _bat_restore_background::
                            140 ;src/bat.c:70: background_restore_world_coords(oldBatX, batY, batW, BAT_HEIGHT_PIXELS);
   6F2B 21 30 88      [10]  141 	ld	hl,#_batY + 0
   6F2E 5E            [ 7]  142 	ld	e, (hl)
   6F2F 16 00         [ 7]  143 	ld	d, #0x00
   6F31 21 32 88      [10]  144 	ld	hl,#_oldBatX + 0
   6F34 4E            [ 7]  145 	ld	c, (hl)
   6F35 06 00         [ 7]  146 	ld	b, #0x00
   6F37 3E 08         [ 7]  147 	ld	a, #0x08
   6F39 F5            [11]  148 	push	af
   6F3A 33            [ 6]  149 	inc	sp
   6F3B 3A 33 88      [13]  150 	ld	a, (_batW)
   6F3E F5            [11]  151 	push	af
   6F3F 33            [ 6]  152 	inc	sp
   6F40 D5            [11]  153 	push	de
   6F41 C5            [11]  154 	push	bc
   6F42 CD 5E 6A      [17]  155 	call	_background_restore_world_coords
   6F45 21 06 00      [10]  156 	ld	hl, #6
   6F48 39            [11]  157 	add	hl, sp
   6F49 F9            [ 6]  158 	ld	sp, hl
   6F4A C9            [10]  159 	ret
                            160 ;src/bat.c:73: void bat_draw()
                            161 ;	---------------------------------
                            162 ; Function bat_draw
                            163 ; ---------------------------------
   6F4B                     164 _bat_draw::
                            165 ;src/bat.c:77: svmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(batX), W_2_S_Y(batY));
   6F4B 3A 30 88      [13]  166 	ld	a,(#_batY + 0)
   6F4E C6 08         [ 7]  167 	add	a, #0x08
   6F50 57            [ 4]  168 	ld	d, a
   6F51 3A 31 88      [13]  169 	ld	a,(#_batX + 0)
   6F54 C6 0C         [ 7]  170 	add	a, #0x0c
   6F56 5F            [ 4]  171 	ld	e,a
   6F57 D5            [11]  172 	push	de
   6F58 21 00 C0      [10]  173 	ld	hl, #0xc000
   6F5B E5            [11]  174 	push	hl
   6F5C CD BE 82      [17]  175 	call	_cpct_getScreenPtr
   6F5F 4D            [ 4]  176 	ld	c, l
   6F60 44            [ 4]  177 	ld	b, h
                            178 ;src/bat.c:79: cpct_drawSpriteMasked(sp_masked_bat_left, svmem, SP_BAT_SEG_W, SP_BAT_SEG_H);
   6F61 59            [ 4]  179 	ld	e, c
   6F62 50            [ 4]  180 	ld	d, b
   6F63 C5            [11]  181 	push	bc
   6F64 21 02 08      [10]  182 	ld	hl, #0x0802
   6F67 E5            [11]  183 	push	hl
   6F68 D5            [11]  184 	push	de
   6F69 21 33 7B      [10]  185 	ld	hl, #_sp_masked_bat_left
   6F6C E5            [11]  186 	push	hl
   6F6D CD F0 80      [17]  187 	call	_cpct_drawSpriteMasked
   6F70 C1            [10]  188 	pop	bc
                            189 ;src/bat.c:81: cpct_drawSprite(sp_bat_mid, svmem + BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
   6F71 59            [ 4]  190 	ld	e, c
   6F72 50            [ 4]  191 	ld	d, b
   6F73 13            [ 6]  192 	inc	de
   6F74 13            [ 6]  193 	inc	de
   6F75 C5            [11]  194 	push	bc
   6F76 21 02 08      [10]  195 	ld	hl, #0x0802
   6F79 E5            [11]  196 	push	hl
   6F7A D5            [11]  197 	push	de
   6F7B 21 6B 69      [10]  198 	ld	hl, #_sp_bat_mid
   6F7E E5            [11]  199 	push	hl
   6F7F CD 53 7F      [17]  200 	call	_cpct_drawSprite
   6F82 C1            [10]  201 	pop	bc
                            202 ;src/bat.c:82: cpct_drawSprite(sp_bat_mid, svmem + 2 * BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
   6F83 21 04 00      [10]  203 	ld	hl, #0x0004
   6F86 09            [11]  204 	add	hl, bc
   6F87 C5            [11]  205 	push	bc
   6F88 11 02 08      [10]  206 	ld	de, #0x0802
   6F8B D5            [11]  207 	push	de
   6F8C E5            [11]  208 	push	hl
   6F8D 21 6B 69      [10]  209 	ld	hl, #_sp_bat_mid
   6F90 E5            [11]  210 	push	hl
   6F91 CD 53 7F      [17]  211 	call	_cpct_drawSprite
   6F94 C1            [10]  212 	pop	bc
                            213 ;src/bat.c:84: cpct_drawSpriteMasked(sp_masked_bat_right, svmem + 3 * BAT_SEGMENT_WIDTH_BYTES, SP_BAT_SEG_W, SP_BAT_SEG_H);
   6F95 21 06 00      [10]  214 	ld	hl, #0x0006
   6F98 09            [11]  215 	add	hl, bc
   6F99 01 53 7B      [10]  216 	ld	bc, #_sp_masked_bat_right+0
   6F9C 11 02 08      [10]  217 	ld	de, #0x0802
   6F9F D5            [11]  218 	push	de
   6FA0 E5            [11]  219 	push	hl
   6FA1 C5            [11]  220 	push	bc
   6FA2 CD F0 80      [17]  221 	call	_cpct_drawSpriteMasked
   6FA5 C9            [10]  222 	ret
                            223 ;src/bat.c:87: BounceHits bat_bounce_ball(Ball *ball, i16 at_x, i16 at_y)
                            224 ;	---------------------------------
                            225 ; Function bat_bounce_ball
                            226 ; ---------------------------------
   6FA6                     227 _bat_bounce_ball::
   6FA6 DD E5         [15]  228 	push	ix
   6FA8 DD 21 00 00   [14]  229 	ld	ix,#0
   6FAC DD 39         [15]  230 	add	ix,sp
   6FAE F5            [11]  231 	push	af
   6FAF F5            [11]  232 	push	af
   6FB0 3B            [ 6]  233 	dec	sp
                            234 ;src/bat.c:89: BounceHits bounces = BOUNCE_NONE;
   6FB1 DD 36 FB 00   [19]  235 	ld	-5 (ix), #0x00
                            236 ;src/bat.c:91: if (ball->dy > 0 &&
   6FB5 DD 4E 04      [19]  237 	ld	c,4 (ix)
   6FB8 DD 46 05      [19]  238 	ld	b,5 (ix)
   6FBB 69            [ 4]  239 	ld	l, c
   6FBC 60            [ 4]  240 	ld	h, b
   6FBD 11 0B 00      [10]  241 	ld	de, #0x000b
   6FC0 19            [11]  242 	add	hl, de
   6FC1 5E            [ 7]  243 	ld	e, (hl)
   6FC2 23            [ 6]  244 	inc	hl
   6FC3 56            [ 7]  245 	ld	d, (hl)
   6FC4 AF            [ 4]  246 	xor	a, a
   6FC5 BB            [ 4]  247 	cp	a, e
   6FC6 9A            [ 4]  248 	sbc	a, d
   6FC7 E2 CC 6F      [10]  249 	jp	PO, 00129$
   6FCA EE 80         [ 7]  250 	xor	a, #0x80
   6FCC                     251 00129$:
   6FCC F2 51 70      [10]  252 	jp	P, 00102$
                            253 ;src/bat.c:92: (ball->x + BALL_WIDTH > batX && ball->x < batX + batW) &&
   6FCF 69            [ 4]  254 	ld	l, c
   6FD0 60            [ 4]  255 	ld	h, b
   6FD1 23            [ 6]  256 	inc	hl
   6FD2 7E            [ 7]  257 	ld	a, (hl)
   6FD3 DD 77 FE      [19]  258 	ld	-2 (ix), a
   6FD6 23            [ 6]  259 	inc	hl
   6FD7 7E            [ 7]  260 	ld	a, (hl)
   6FD8 DD 77 FF      [19]  261 	ld	-1 (ix), a
   6FDB DD 7E FE      [19]  262 	ld	a, -2 (ix)
   6FDE C6 03         [ 7]  263 	add	a, #0x03
   6FE0 DD 77 FC      [19]  264 	ld	-4 (ix), a
   6FE3 DD 7E FF      [19]  265 	ld	a, -1 (ix)
   6FE6 CE 00         [ 7]  266 	adc	a, #0x00
   6FE8 DD 77 FD      [19]  267 	ld	-3 (ix), a
   6FEB 21 31 88      [10]  268 	ld	hl,#_batX + 0
   6FEE 5E            [ 7]  269 	ld	e, (hl)
   6FEF 16 00         [ 7]  270 	ld	d, #0x00
   6FF1 7B            [ 4]  271 	ld	a, e
   6FF2 DD 96 FC      [19]  272 	sub	a, -4 (ix)
   6FF5 7A            [ 4]  273 	ld	a, d
   6FF6 DD 9E FD      [19]  274 	sbc	a, -3 (ix)
   6FF9 E2 FE 6F      [10]  275 	jp	PO, 00130$
   6FFC EE 80         [ 7]  276 	xor	a, #0x80
   6FFE                     277 00130$:
   6FFE F2 51 70      [10]  278 	jp	P, 00102$
   7001 FD 21 33 88   [14]  279 	ld	iy, #_batW
   7005 FD 6E 00      [19]  280 	ld	l, 0 (iy)
   7008 26 00         [ 7]  281 	ld	h, #0x00
   700A 19            [11]  282 	add	hl, de
   700B DD 7E FE      [19]  283 	ld	a, -2 (ix)
   700E 95            [ 4]  284 	sub	a, l
   700F DD 7E FF      [19]  285 	ld	a, -1 (ix)
   7012 9C            [ 4]  286 	sbc	a, h
   7013 E2 18 70      [10]  287 	jp	PO, 00131$
   7016 EE 80         [ 7]  288 	xor	a, #0x80
   7018                     289 00131$:
   7018 F2 51 70      [10]  290 	jp	P, 00102$
                            291 ;src/bat.c:93: (ball->y + BALL_HEIGHT > batY && ball->y < batY + SP_BAT_SEG_H))
   701B 69            [ 4]  292 	ld	l, c
   701C 60            [ 4]  293 	ld	h, b
   701D 23            [ 6]  294 	inc	hl
   701E 23            [ 6]  295 	inc	hl
   701F 23            [ 6]  296 	inc	hl
   7020 4E            [ 7]  297 	ld	c, (hl)
   7021 23            [ 6]  298 	inc	hl
   7022 46            [ 7]  299 	ld	b, (hl)
   7023 21 06 00      [10]  300 	ld	hl, #0x0006
   7026 09            [11]  301 	add	hl,bc
   7027 EB            [ 4]  302 	ex	de,hl
   7028 FD 21 30 88   [14]  303 	ld	iy, #_batY
   702C FD 6E 00      [19]  304 	ld	l, 0 (iy)
   702F 26 00         [ 7]  305 	ld	h, #0x00
   7031 7D            [ 4]  306 	ld	a, l
   7032 93            [ 4]  307 	sub	a, e
   7033 7C            [ 4]  308 	ld	a, h
   7034 9A            [ 4]  309 	sbc	a, d
   7035 E2 3A 70      [10]  310 	jp	PO, 00132$
   7038 EE 80         [ 7]  311 	xor	a, #0x80
   703A                     312 00132$:
   703A F2 51 70      [10]  313 	jp	P, 00102$
   703D 11 08 00      [10]  314 	ld	de, #0x0008
   7040 19            [11]  315 	add	hl, de
   7041 79            [ 4]  316 	ld	a, c
   7042 95            [ 4]  317 	sub	a, l
   7043 78            [ 4]  318 	ld	a, b
   7044 9C            [ 4]  319 	sbc	a, h
   7045 E2 4A 70      [10]  320 	jp	PO, 00133$
   7048 EE 80         [ 7]  321 	xor	a, #0x80
   704A                     322 00133$:
   704A F2 51 70      [10]  323 	jp	P, 00102$
                            324 ;src/bat.c:95: bounces |= BOUNCE_Y;
   704D DD 36 FB 02   [19]  325 	ld	-5 (ix), #0x02
   7051                     326 00102$:
                            327 ;src/bat.c:98: return bounces;
   7051 DD 6E FB      [19]  328 	ld	l, -5 (ix)
   7054 DD F9         [10]  329 	ld	sp, ix
   7056 DD E1         [14]  330 	pop	ix
   7058 C9            [10]  331 	ret
                            332 	.area _CODE
                            333 	.area _INITIALIZER
   8834                     334 __xinit__batY:
   8834 00                  335 	.db #0x00	; 0
   8835                     336 __xinit__batX:
   8835 00                  337 	.db #0x00	; 0
   8836                     338 __xinit__oldBatX:
   8836 00                  339 	.db #0x00	; 0
   8837                     340 __xinit__batW:
   8837 00                  341 	.db #0x00	; 0
                            342 	.area _CABS (ABS)
