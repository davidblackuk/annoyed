                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module hud
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _text_write_string
                             12 	.globl _cpct_getScreenPtr
                             13 	.globl _cpct_drawSprite
                             14 	.globl _digits
                             15 	.globl _displayed_score
                             16 	.globl _hud_initialize
                             17 	.globl _hud_continue_from_death
                             18 	.globl _hud_update
                             19 	.globl _hud_restore_background
                             20 	.globl _hud_draw
                             21 	.globl _hud_initialize_internal
                             22 	.globl _hud_initialize_static_text
                             23 	.globl _hud_draw_score_with_added_last_zero
                             24 	.globl _hud_draw_lives
                             25 ;--------------------------------------------------------
                             26 ; special function registers
                             27 ;--------------------------------------------------------
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _DATA
   9351                      32 _displayed_score::
   9351                      33 	.ds 2
   9353                      34 _digits::
   9353                      35 	.ds 20
                             36 ;--------------------------------------------------------
                             37 ; ram data
                             38 ;--------------------------------------------------------
                             39 	.area _INITIALIZED
                             40 ;--------------------------------------------------------
                             41 ; absolute external ram data
                             42 ;--------------------------------------------------------
                             43 	.area _DABS (ABS)
                             44 ;--------------------------------------------------------
                             45 ; global & static initialisations
                             46 ;--------------------------------------------------------
                             47 	.area _HOME
                             48 	.area _GSINIT
                             49 	.area _GSFINAL
                             50 	.area _GSINIT
                             51 ;--------------------------------------------------------
                             52 ; Home
                             53 ;--------------------------------------------------------
                             54 	.area _HOME
                             55 	.area _HOME
                             56 ;--------------------------------------------------------
                             57 ; code
                             58 ;--------------------------------------------------------
                             59 	.area _CODE
                             60 ;src/hud.c:33: void hud_initialize()
                             61 ;	---------------------------------
                             62 ; Function hud_initialize
                             63 ; ---------------------------------
   824B                      64 _hud_initialize::
                             65 ;src/hud.c:35: digits[0] = sp_font_00;
   824B 21 80 67      [10]   66 	ld	hl, #_sp_font_00
   824E 22 53 93      [16]   67 	ld	(_digits), hl
                             68 ;src/hud.c:36: digits[1] = sp_font_01;
   8251 21 90 67      [10]   69 	ld	hl, #_sp_font_01
   8254 22 55 93      [16]   70 	ld	((_digits + 0x0002)), hl
                             71 ;src/hud.c:37: digits[2] = sp_font_02;
   8257 21 A0 67      [10]   72 	ld	hl, #_sp_font_02
   825A 22 57 93      [16]   73 	ld	((_digits + 0x0004)), hl
                             74 ;src/hud.c:38: digits[3] = sp_font_03;
   825D 21 B0 67      [10]   75 	ld	hl, #_sp_font_03
   8260 22 59 93      [16]   76 	ld	((_digits + 0x0006)), hl
                             77 ;src/hud.c:39: digits[4] = sp_font_04;
   8263 21 C0 67      [10]   78 	ld	hl, #_sp_font_04
   8266 22 5B 93      [16]   79 	ld	((_digits + 0x0008)), hl
                             80 ;src/hud.c:40: digits[5] = sp_font_05;
   8269 21 D0 67      [10]   81 	ld	hl, #_sp_font_05
   826C 22 5D 93      [16]   82 	ld	((_digits + 0x000a)), hl
                             83 ;src/hud.c:41: digits[6] = sp_font_06;
   826F 21 E0 67      [10]   84 	ld	hl, #_sp_font_06
   8272 22 5F 93      [16]   85 	ld	((_digits + 0x000c)), hl
                             86 ;src/hud.c:42: digits[7] = sp_font_07;
   8275 21 F0 67      [10]   87 	ld	hl, #_sp_font_07
   8278 22 61 93      [16]   88 	ld	((_digits + 0x000e)), hl
                             89 ;src/hud.c:43: digits[8] = sp_font_08;
   827B 21 00 68      [10]   90 	ld	hl, #_sp_font_08
   827E 22 63 93      [16]   91 	ld	((_digits + 0x0010)), hl
                             92 ;src/hud.c:44: digits[9] = sp_font_09;
   8281 21 10 68      [10]   93 	ld	hl, #_sp_font_09
   8284 22 65 93      [16]   94 	ld	((_digits + 0x0012)), hl
                             95 ;src/hud.c:46: hud_initialize_internal(FALSE);
   8287 AF            [ 4]   96 	xor	a, a
   8288 F5            [11]   97 	push	af
   8289 33            [ 6]   98 	inc	sp
   828A CD C4 82      [17]   99 	call	_hud_initialize_internal
   828D 33            [ 6]  100 	inc	sp
   828E C9            [10]  101 	ret
                            102 ;src/hud.c:49: void hud_continue_from_death()
                            103 ;	---------------------------------
                            104 ; Function hud_continue_from_death
                            105 ; ---------------------------------
   828F                     106 _hud_continue_from_death::
                            107 ;src/hud.c:51: hud_initialize_internal(TRUE);
   828F 3E 01         [ 7]  108 	ld	a, #0x01
   8291 F5            [11]  109 	push	af
   8292 33            [ 6]  110 	inc	sp
   8293 CD C4 82      [17]  111 	call	_hud_initialize_internal
   8296 33            [ 6]  112 	inc	sp
   8297 C9            [10]  113 	ret
                            114 ;src/hud.c:54: void hud_update()
                            115 ;	---------------------------------
                            116 ; Function hud_update
                            117 ; ---------------------------------
   8298                     118 _hud_update::
                            119 ;src/hud.c:56: if (current_score > displayed_score) {
   8298 21 51 93      [10]  120 	ld	hl, #_displayed_score
   829B 7E            [ 7]  121 	ld	a, (hl)
   829C FD 21 4B 93   [14]  122 	ld	iy, #_current_score
   82A0 FD 96 00      [19]  123 	sub	a, 0 (iy)
   82A3 23            [ 6]  124 	inc	hl
   82A4 7E            [ 7]  125 	ld	a, (hl)
   82A5 FD 9E 01      [19]  126 	sbc	a, 1 (iy)
   82A8 D0            [11]  127 	ret	NC
                            128 ;src/hud.c:57: displayed_score++;
   82A9 FD 21 51 93   [14]  129 	ld	iy, #_displayed_score
   82AD FD 34 00      [23]  130 	inc	0 (iy)
   82B0 C0            [11]  131 	ret	NZ
   82B1 FD 34 01      [23]  132 	inc	1 (iy)
   82B4 C9            [10]  133 	ret
                            134 ;src/hud.c:61: void hud_restore_background()
                            135 ;	---------------------------------
                            136 ; Function hud_restore_background
                            137 ; ---------------------------------
   82B5                     138 _hud_restore_background::
                            139 ;src/hud.c:63: }
   82B5 C9            [10]  140 	ret
                            141 ;src/hud.c:65: void hud_draw()
                            142 ;	---------------------------------
                            143 ; Function hud_draw
                            144 ; ---------------------------------
   82B6                     145 _hud_draw::
                            146 ;src/hud.c:67: hud_draw_score_with_added_last_zero(displayed_score, HUD_TOP + HUD_TEXT_SPACING);
   82B6 3E 0B         [ 7]  147 	ld	a, #0x0b
   82B8 F5            [11]  148 	push	af
   82B9 33            [ 6]  149 	inc	sp
   82BA 2A 51 93      [16]  150 	ld	hl, (_displayed_score)
   82BD E5            [11]  151 	push	hl
   82BE CD 9D 83      [17]  152 	call	_hud_draw_score_with_added_last_zero
   82C1 F1            [10]  153 	pop	af
   82C2 33            [ 6]  154 	inc	sp
   82C3 C9            [10]  155 	ret
                            156 ;src/hud.c:74: void hud_initialize_internal(u8 is_restart)
                            157 ;	---------------------------------
                            158 ; Function hud_initialize_internal
                            159 ; ---------------------------------
   82C4                     160 _hud_initialize_internal::
   82C4 DD E5         [15]  161 	push	ix
   82C6 DD 21 00 00   [14]  162 	ld	ix,#0
   82CA DD 39         [15]  163 	add	ix,sp
   82CC F5            [11]  164 	push	af
                            165 ;src/hud.c:76: u8 initial_y = SCREEN_HEIGHT_ROWS - (((lives_left - 1) / 2) * 8) - 8;
   82CD 21 4A 93      [10]  166 	ld	hl,#_lives_left + 0
   82D0 5E            [ 7]  167 	ld	e, (hl)
   82D1 16 00         [ 7]  168 	ld	d, #0x00
   82D3 6B            [ 4]  169 	ld	l, e
   82D4 62            [ 4]  170 	ld	h, d
   82D5 2B            [ 6]  171 	dec	hl
   82D6 4D            [ 4]  172 	ld	c, l
   82D7 44            [ 4]  173 	ld	b, h
   82D8 CB 7C         [ 8]  174 	bit	7, h
   82DA 28 02         [12]  175 	jr	Z,00107$
   82DC 4B            [ 4]  176 	ld	c, e
   82DD 42            [ 4]  177 	ld	b, d
   82DE                     178 00107$:
   82DE CB 28         [ 8]  179 	sra	b
   82E0 CB 19         [ 8]  180 	rr	c
   82E2 79            [ 4]  181 	ld	a, c
   82E3 07            [ 4]  182 	rlca
   82E4 07            [ 4]  183 	rlca
   82E5 07            [ 4]  184 	rlca
   82E6 E6 F8         [ 7]  185 	and	a, #0xf8
   82E8 4F            [ 4]  186 	ld	c, a
   82E9 3E C0         [ 7]  187 	ld	a, #0xc0
   82EB 91            [ 4]  188 	sub	a, c
   82EC DD 77 FE      [19]  189 	ld	-2 (ix), a
                            190 ;src/hud.c:78: displayed_score = current_score;
   82EF 2A 4B 93      [16]  191 	ld	hl, (_current_score)
   82F2 22 51 93      [16]  192 	ld	(_displayed_score), hl
                            193 ;src/hud.c:80: hud_initialize_static_text();
   82F5 CD 53 83      [17]  194 	call	_hud_initialize_static_text
                            195 ;src/hud.c:81: hud_draw_score_with_added_last_zero(current_score, HUD_TOP + HUD_TEXT_SPACING);
   82F8 3E 0B         [ 7]  196 	ld	a, #0x0b
   82FA F5            [11]  197 	push	af
   82FB 33            [ 6]  198 	inc	sp
   82FC 2A 4B 93      [16]  199 	ld	hl, (_current_score)
   82FF E5            [11]  200 	push	hl
   8300 CD 9D 83      [17]  201 	call	_hud_draw_score_with_added_last_zero
   8303 F1            [10]  202 	pop	af
   8304 33            [ 6]  203 	inc	sp
                            204 ;src/hud.c:83: hud_draw_score_with_added_last_zero(high_score, HUD_TOP + (HUD_TEXT_SPACING * 5));
   8305 3E 33         [ 7]  205 	ld	a, #0x33
   8307 F5            [11]  206 	push	af
   8308 33            [ 6]  207 	inc	sp
   8309 2A 4D 93      [16]  208 	ld	hl, (_high_score)
   830C E5            [11]  209 	push	hl
   830D CD 9D 83      [17]  210 	call	_hud_draw_score_with_added_last_zero
   8310 F1            [10]  211 	pop	af
   8311 33            [ 6]  212 	inc	sp
                            213 ;src/hud.c:85: for (u8 i = 0; i < lives_left; i++)
   8312 0E 00         [ 7]  214 	ld	c, #0x00
   8314                     215 00103$:
   8314 21 4A 93      [10]  216 	ld	hl, #_lives_left
   8317 79            [ 4]  217 	ld	a, c
   8318 96            [ 7]  218 	sub	a, (hl)
   8319 30 33         [12]  219 	jr	NC,00105$
                            220 ;src/hud.c:87: u8 x = ((i & 1) == 0) ? HUD_LEFT : HUD_LEFT + (SP_LIFE_W + 1);
   831B CB 41         [ 8]  221 	bit	0, c
   831D 20 04         [12]  222 	jr	NZ,00108$
   831F 06 44         [ 7]  223 	ld	b, #0x44
   8321 18 02         [12]  224 	jr	00109$
   8323                     225 00108$:
   8323 06 4A         [ 7]  226 	ld	b, #0x4a
   8325                     227 00109$:
                            228 ;src/hud.c:88: u8 y = initial_y + ((i / 2) * 8);
   8325 79            [ 4]  229 	ld	a, c
   8326 CB 3F         [ 8]  230 	srl	a
   8328 07            [ 4]  231 	rlca
   8329 07            [ 4]  232 	rlca
   832A 07            [ 4]  233 	rlca
   832B E6 F8         [ 7]  234 	and	a, #0xf8
   832D 5F            [ 4]  235 	ld	e, a
   832E DD 7E FE      [19]  236 	ld	a, -2 (ix)
   8331 83            [ 4]  237 	add	a, e
                            238 ;src/hud.c:90: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   8332 C5            [11]  239 	push	bc
   8333 F5            [11]  240 	push	af
   8334 33            [ 6]  241 	inc	sp
   8335 C5            [11]  242 	push	bc
   8336 33            [ 6]  243 	inc	sp
   8337 21 00 C0      [10]  244 	ld	hl, #0xc000
   833A E5            [11]  245 	push	hl
   833B CD FF 8D      [17]  246 	call	_cpct_getScreenPtr
   833E 11 05 06      [10]  247 	ld	de, #0x0605
   8341 D5            [11]  248 	push	de
   8342 E5            [11]  249 	push	hl
   8343 21 10 6A      [10]  250 	ld	hl, #_sp_life
   8346 E5            [11]  251 	push	hl
   8347 CD 94 8A      [17]  252 	call	_cpct_drawSprite
   834A C1            [10]  253 	pop	bc
                            254 ;src/hud.c:85: for (u8 i = 0; i < lives_left; i++)
   834B 0C            [ 4]  255 	inc	c
   834C 18 C6         [12]  256 	jr	00103$
   834E                     257 00105$:
   834E DD F9         [10]  258 	ld	sp, ix
   8350 DD E1         [14]  259 	pop	ix
   8352 C9            [10]  260 	ret
                            261 ;src/hud.c:95: void hud_initialize_static_text()
                            262 ;	---------------------------------
                            263 ; Function hud_initialize_static_text
                            264 ; ---------------------------------
   8353                     265 _hud_initialize_static_text::
                            266 ;src/hud.c:97: text_write_string(HUD_LEFT + 1, 1, "SCORE");
   8353 21 8C 83      [10]  267 	ld	hl, #___str_0
   8356 E5            [11]  268 	push	hl
   8357 21 45 01      [10]  269 	ld	hl, #0x0145
   835A E5            [11]  270 	push	hl
   835B CD A9 88      [17]  271 	call	_text_write_string
   835E F1            [10]  272 	pop	af
                            273 ;src/hud.c:99: text_write_string(HUD_LEFT + 2, 1 + (3 * HUD_TEXT_SPACING), "HIGH");
   835F 21 92 83      [10]  274 	ld	hl, #___str_1
   8362 E3            [19]  275 	ex	(sp),hl
   8363 21 46 1F      [10]  276 	ld	hl, #0x1f46
   8366 E5            [11]  277 	push	hl
   8367 CD A9 88      [17]  278 	call	_text_write_string
   836A F1            [10]  279 	pop	af
                            280 ;src/hud.c:100: text_write_string(HUD_LEFT + 1, 1 + (4 * HUD_TEXT_SPACING), "SCORE");
   836B 21 8C 83      [10]  281 	ld	hl, #___str_0
   836E E3            [19]  282 	ex	(sp),hl
   836F 21 45 29      [10]  283 	ld	hl, #0x2945
   8372 E5            [11]  284 	push	hl
   8373 CD A9 88      [17]  285 	call	_text_write_string
   8376 F1            [10]  286 	pop	af
                            287 ;src/hud.c:102: text_write_string(HUD_LEFT + 1, 1 + (7 * HUD_TEXT_SPACING), "LEVEL");
   8377 21 97 83      [10]  288 	ld	hl, #___str_2
   837A E3            [19]  289 	ex	(sp),hl
   837B 21 45 47      [10]  290 	ld	hl, #0x4745
   837E E5            [11]  291 	push	hl
   837F CD A9 88      [17]  292 	call	_text_write_string
   8382 F1            [10]  293 	pop	af
                            294 ;src/hud.c:104: hud_draw_lives(1 + (8 * HUD_TEXT_SPACING));
   8383 26 51         [ 7]  295 	ld	h,#0x51
   8385 E3            [19]  296 	ex	(sp),hl
   8386 33            [ 6]  297 	inc	sp
   8387 CD 24 84      [17]  298 	call	_hud_draw_lives
   838A 33            [ 6]  299 	inc	sp
   838B C9            [10]  300 	ret
   838C                     301 ___str_0:
   838C 53 43 4F 52 45      302 	.ascii "SCORE"
   8391 00                  303 	.db 0x00
   8392                     304 ___str_1:
   8392 48 49 47 48         305 	.ascii "HIGH"
   8396 00                  306 	.db 0x00
   8397                     307 ___str_2:
   8397 4C 45 56 45 4C      308 	.ascii "LEVEL"
   839C 00                  309 	.db 0x00
                            310 ;src/hud.c:109: void hud_draw_score_with_added_last_zero(u16 score, u8 row)
                            311 ;	---------------------------------
                            312 ; Function hud_draw_score_with_added_last_zero
                            313 ; ---------------------------------
   839D                     314 _hud_draw_score_with_added_last_zero::
   839D DD E5         [15]  315 	push	ix
   839F DD 21 00 00   [14]  316 	ld	ix,#0
   83A3 DD 39         [15]  317 	add	ix,sp
   83A5 F5            [11]  318 	push	af
   83A6 3B            [ 6]  319 	dec	sp
                            320 ;src/hud.c:112: u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, 80 - 2, row);
   83A7 DD 56 06      [19]  321 	ld	d, 6 (ix)
   83AA 1E 4E         [ 7]  322 	ld	e,#0x4e
   83AC D5            [11]  323 	push	de
   83AD 21 00 C0      [10]  324 	ld	hl, #0xc000
   83B0 E5            [11]  325 	push	hl
   83B1 CD FF 8D      [17]  326 	call	_cpct_getScreenPtr
   83B4 33            [ 6]  327 	inc	sp
   83B5 33            [ 6]  328 	inc	sp
                            329 ;src/hud.c:115: cpct_drawSprite(sp_font_00, svmem, SP_FONT_CHAR_W, SP_FONT_CHAR_H);
   83B6 4D            [ 4]  330 	ld	c, l
   83B7 44            [ 4]  331 	ld	b, h
   83B8 C5            [11]  332 	push	bc
   83B9 21 02 08      [10]  333 	ld	hl, #0x0802
   83BC E5            [11]  334 	push	hl
   83BD C5            [11]  335 	push	bc
   83BE 21 80 67      [10]  336 	ld	hl, #_sp_font_00
   83C1 E5            [11]  337 	push	hl
   83C2 CD 94 8A      [17]  338 	call	_cpct_drawSprite
                            339 ;src/hud.c:117: for (i = 0; i < 5; i++)
   83C5 DD 36 FF 00   [19]  340 	ld	-1 (ix), #0x00
   83C9                     341 00102$:
                            342 ;src/hud.c:119: u8 digit = (score % 10);
   83C9 21 0A 00      [10]  343 	ld	hl, #0x000a
   83CC E5            [11]  344 	push	hl
   83CD DD 6E 04      [19]  345 	ld	l,4 (ix)
   83D0 DD 66 05      [19]  346 	ld	h,5 (ix)
   83D3 E5            [11]  347 	push	hl
   83D4 CD D4 8B      [17]  348 	call	__moduint
   83D7 F1            [10]  349 	pop	af
   83D8 F1            [10]  350 	pop	af
   83D9 4D            [ 4]  351 	ld	c, l
                            352 ;src/hud.c:121: cpct_drawSprite(digits[digit], (svmem - (2 * (i + 1))), SP_FONT_CHAR_W, SP_FONT_CHAR_H);
   83DA DD 6E FF      [19]  353 	ld	l, -1 (ix)
   83DD 26 00         [ 7]  354 	ld	h, #0x00
   83DF 23            [ 6]  355 	inc	hl
   83E0 29            [11]  356 	add	hl, hl
   83E1 DD 7E FD      [19]  357 	ld	a, -3 (ix)
   83E4 95            [ 4]  358 	sub	a, l
   83E5 5F            [ 4]  359 	ld	e, a
   83E6 DD 7E FE      [19]  360 	ld	a, -2 (ix)
   83E9 9C            [ 4]  361 	sbc	a, h
   83EA 57            [ 4]  362 	ld	d, a
   83EB 69            [ 4]  363 	ld	l, c
   83EC 26 00         [ 7]  364 	ld	h, #0x00
   83EE 29            [11]  365 	add	hl, hl
   83EF 01 53 93      [10]  366 	ld	bc, #_digits
   83F2 09            [11]  367 	add	hl, bc
   83F3 4E            [ 7]  368 	ld	c, (hl)
   83F4 23            [ 6]  369 	inc	hl
   83F5 46            [ 7]  370 	ld	b, (hl)
   83F6 21 02 08      [10]  371 	ld	hl, #0x0802
   83F9 E5            [11]  372 	push	hl
   83FA D5            [11]  373 	push	de
   83FB C5            [11]  374 	push	bc
   83FC CD 94 8A      [17]  375 	call	_cpct_drawSprite
                            376 ;src/hud.c:122: score /= 10;
   83FF 21 0A 00      [10]  377 	ld	hl, #0x000a
   8402 E5            [11]  378 	push	hl
   8403 DD 6E 04      [19]  379 	ld	l,4 (ix)
   8406 DD 66 05      [19]  380 	ld	h,5 (ix)
   8409 E5            [11]  381 	push	hl
   840A CD BA 89      [17]  382 	call	__divuint
   840D F1            [10]  383 	pop	af
   840E F1            [10]  384 	pop	af
   840F DD 75 04      [19]  385 	ld	4 (ix), l
   8412 DD 74 05      [19]  386 	ld	5 (ix), h
                            387 ;src/hud.c:117: for (i = 0; i < 5; i++)
   8415 DD 34 FF      [23]  388 	inc	-1 (ix)
   8418 DD 7E FF      [19]  389 	ld	a, -1 (ix)
   841B D6 05         [ 7]  390 	sub	a, #0x05
   841D 38 AA         [12]  391 	jr	C,00102$
   841F DD F9         [10]  392 	ld	sp, ix
   8421 DD E1         [14]  393 	pop	ix
   8423 C9            [10]  394 	ret
                            395 ;src/hud.c:128: void hud_draw_lives(u8 row)
                            396 ;	---------------------------------
                            397 ; Function hud_draw_lives
                            398 ; ---------------------------------
   8424                     399 _hud_draw_lives::
   8424 DD E5         [15]  400 	push	ix
   8426 DD 21 00 00   [14]  401 	ld	ix,#0
   842A DD 39         [15]  402 	add	ix,sp
   842C F5            [11]  403 	push	af
   842D 3B            [ 6]  404 	dec	sp
                            405 ;src/hud.c:130: u8 num = current_level_num + 1;
   842E 3A 49 93      [13]  406 	ld	a,(#_current_level_num + 0)
   8431 3C            [ 4]  407 	inc	a
   8432 DD 77 FD      [19]  408 	ld	-3 (ix), a
                            409 ;src/hud.c:131: u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, 74, row);
   8435 DD 56 04      [19]  410 	ld	d, 4 (ix)
   8438 1E 4A         [ 7]  411 	ld	e,#0x4a
   843A D5            [11]  412 	push	de
   843B 21 00 C0      [10]  413 	ld	hl, #0xc000
   843E E5            [11]  414 	push	hl
   843F CD FF 8D      [17]  415 	call	_cpct_getScreenPtr
   8442 DD 75 FE      [19]  416 	ld	-2 (ix), l
   8445 DD 74 FF      [19]  417 	ld	-1 (ix), h
                            418 ;src/hud.c:133: u8 digit = (num % 10);
   8448 3E 0A         [ 7]  419 	ld	a, #0x0a
   844A F5            [11]  420 	push	af
   844B 33            [ 6]  421 	inc	sp
   844C DD 7E FD      [19]  422 	ld	a, -3 (ix)
   844F F5            [11]  423 	push	af
   8450 33            [ 6]  424 	inc	sp
   8451 CD C8 8B      [17]  425 	call	__moduchar
   8454 F1            [10]  426 	pop	af
   8455 4D            [ 4]  427 	ld	c, l
                            428 ;src/hud.c:134: cpct_drawSprite(digits[digit], svmem, SP_FONT_CHAR_W, SP_FONT_CHAR_H);
   8456 DD 5E FE      [19]  429 	ld	e,-2 (ix)
   8459 DD 56 FF      [19]  430 	ld	d,-1 (ix)
   845C 69            [ 4]  431 	ld	l, c
   845D 26 00         [ 7]  432 	ld	h, #0x00
   845F 29            [11]  433 	add	hl, hl
   8460 01 53 93      [10]  434 	ld	bc, #_digits
   8463 09            [11]  435 	add	hl, bc
   8464 4E            [ 7]  436 	ld	c, (hl)
   8465 23            [ 6]  437 	inc	hl
   8466 46            [ 7]  438 	ld	b, (hl)
   8467 21 02 08      [10]  439 	ld	hl, #0x0802
   846A E5            [11]  440 	push	hl
   846B D5            [11]  441 	push	de
   846C C5            [11]  442 	push	bc
   846D CD 94 8A      [17]  443 	call	_cpct_drawSprite
                            444 ;src/hud.c:136: digit = ((num / 10) % 10);
   8470 3E 0A         [ 7]  445 	ld	a, #0x0a
   8472 F5            [11]  446 	push	af
   8473 33            [ 6]  447 	inc	sp
   8474 DD 7E FD      [19]  448 	ld	a, -3 (ix)
   8477 F5            [11]  449 	push	af
   8478 33            [ 6]  450 	inc	sp
   8479 CD C2 89      [17]  451 	call	__divuchar
   847C F1            [10]  452 	pop	af
   847D 45            [ 4]  453 	ld	b, l
   847E 3E 0A         [ 7]  454 	ld	a, #0x0a
   8480 F5            [11]  455 	push	af
   8481 33            [ 6]  456 	inc	sp
   8482 C5            [11]  457 	push	bc
   8483 33            [ 6]  458 	inc	sp
   8484 CD C8 8B      [17]  459 	call	__moduchar
   8487 F1            [10]  460 	pop	af
                            461 ;src/hud.c:137: cpct_drawSprite(digits[digit], svmem - 2, SP_FONT_CHAR_W, SP_FONT_CHAR_H);
   8488 DD 5E FE      [19]  462 	ld	e, -2 (ix)
   848B DD 56 FF      [19]  463 	ld	d, -1 (ix)
   848E 1B            [ 6]  464 	dec	de
   848F 1B            [ 6]  465 	dec	de
   8490 26 00         [ 7]  466 	ld	h, #0x00
   8492 29            [11]  467 	add	hl, hl
   8493 01 53 93      [10]  468 	ld	bc, #_digits
   8496 09            [11]  469 	add	hl, bc
   8497 4E            [ 7]  470 	ld	c, (hl)
   8498 23            [ 6]  471 	inc	hl
   8499 46            [ 7]  472 	ld	b, (hl)
   849A 21 02 08      [10]  473 	ld	hl, #0x0802
   849D E5            [11]  474 	push	hl
   849E D5            [11]  475 	push	de
   849F C5            [11]  476 	push	bc
   84A0 CD 94 8A      [17]  477 	call	_cpct_drawSprite
   84A3 DD F9         [10]  478 	ld	sp, ix
   84A5 DD E1         [14]  479 	pop	ix
   84A7 C9            [10]  480 	ret
                            481 	.area _CODE
                            482 	.area _INITIALIZER
                            483 	.area _CABS (ABS)
