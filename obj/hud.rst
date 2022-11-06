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
   9296                      32 _displayed_score::
   9296                      33 	.ds 2
   9298                      34 _digits::
   9298                      35 	.ds 20
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
   8190                      64 _hud_initialize::
                             65 ;src/hud.c:35: digits[0] = sp_font_00;
   8190 21 80 67      [10]   66 	ld	hl, #_sp_font_00
   8193 22 98 92      [16]   67 	ld	(_digits), hl
                             68 ;src/hud.c:36: digits[1] = sp_font_01;
   8196 21 90 67      [10]   69 	ld	hl, #_sp_font_01
   8199 22 9A 92      [16]   70 	ld	((_digits + 0x0002)), hl
                             71 ;src/hud.c:37: digits[2] = sp_font_02;
   819C 21 A0 67      [10]   72 	ld	hl, #_sp_font_02
   819F 22 9C 92      [16]   73 	ld	((_digits + 0x0004)), hl
                             74 ;src/hud.c:38: digits[3] = sp_font_03;
   81A2 21 B0 67      [10]   75 	ld	hl, #_sp_font_03
   81A5 22 9E 92      [16]   76 	ld	((_digits + 0x0006)), hl
                             77 ;src/hud.c:39: digits[4] = sp_font_04;
   81A8 21 C0 67      [10]   78 	ld	hl, #_sp_font_04
   81AB 22 A0 92      [16]   79 	ld	((_digits + 0x0008)), hl
                             80 ;src/hud.c:40: digits[5] = sp_font_05;
   81AE 21 D0 67      [10]   81 	ld	hl, #_sp_font_05
   81B1 22 A2 92      [16]   82 	ld	((_digits + 0x000a)), hl
                             83 ;src/hud.c:41: digits[6] = sp_font_06;
   81B4 21 E0 67      [10]   84 	ld	hl, #_sp_font_06
   81B7 22 A4 92      [16]   85 	ld	((_digits + 0x000c)), hl
                             86 ;src/hud.c:42: digits[7] = sp_font_07;
   81BA 21 F0 67      [10]   87 	ld	hl, #_sp_font_07
   81BD 22 A6 92      [16]   88 	ld	((_digits + 0x000e)), hl
                             89 ;src/hud.c:43: digits[8] = sp_font_08;
   81C0 21 00 68      [10]   90 	ld	hl, #_sp_font_08
   81C3 22 A8 92      [16]   91 	ld	((_digits + 0x0010)), hl
                             92 ;src/hud.c:44: digits[9] = sp_font_09;
   81C6 21 10 68      [10]   93 	ld	hl, #_sp_font_09
   81C9 22 AA 92      [16]   94 	ld	((_digits + 0x0012)), hl
                             95 ;src/hud.c:46: hud_initialize_internal(FALSE);
   81CC AF            [ 4]   96 	xor	a, a
   81CD F5            [11]   97 	push	af
   81CE 33            [ 6]   98 	inc	sp
   81CF CD 09 82      [17]   99 	call	_hud_initialize_internal
   81D2 33            [ 6]  100 	inc	sp
   81D3 C9            [10]  101 	ret
                            102 ;src/hud.c:49: void hud_continue_from_death()
                            103 ;	---------------------------------
                            104 ; Function hud_continue_from_death
                            105 ; ---------------------------------
   81D4                     106 _hud_continue_from_death::
                            107 ;src/hud.c:51: hud_initialize_internal(TRUE);
   81D4 3E 01         [ 7]  108 	ld	a, #0x01
   81D6 F5            [11]  109 	push	af
   81D7 33            [ 6]  110 	inc	sp
   81D8 CD 09 82      [17]  111 	call	_hud_initialize_internal
   81DB 33            [ 6]  112 	inc	sp
   81DC C9            [10]  113 	ret
                            114 ;src/hud.c:54: void hud_update()
                            115 ;	---------------------------------
                            116 ; Function hud_update
                            117 ; ---------------------------------
   81DD                     118 _hud_update::
                            119 ;src/hud.c:56: if (current_score > displayed_score) {
   81DD 21 96 92      [10]  120 	ld	hl, #_displayed_score
   81E0 7E            [ 7]  121 	ld	a, (hl)
   81E1 FD 21 90 92   [14]  122 	ld	iy, #_current_score
   81E5 FD 96 00      [19]  123 	sub	a, 0 (iy)
   81E8 23            [ 6]  124 	inc	hl
   81E9 7E            [ 7]  125 	ld	a, (hl)
   81EA FD 9E 01      [19]  126 	sbc	a, 1 (iy)
   81ED D0            [11]  127 	ret	NC
                            128 ;src/hud.c:57: displayed_score++;
   81EE FD 21 96 92   [14]  129 	ld	iy, #_displayed_score
   81F2 FD 34 00      [23]  130 	inc	0 (iy)
   81F5 C0            [11]  131 	ret	NZ
   81F6 FD 34 01      [23]  132 	inc	1 (iy)
   81F9 C9            [10]  133 	ret
                            134 ;src/hud.c:61: void hud_restore_background()
                            135 ;	---------------------------------
                            136 ; Function hud_restore_background
                            137 ; ---------------------------------
   81FA                     138 _hud_restore_background::
                            139 ;src/hud.c:63: }
   81FA C9            [10]  140 	ret
                            141 ;src/hud.c:65: void hud_draw()
                            142 ;	---------------------------------
                            143 ; Function hud_draw
                            144 ; ---------------------------------
   81FB                     145 _hud_draw::
                            146 ;src/hud.c:67: hud_draw_score_with_added_last_zero(displayed_score, HUD_TOP + HUD_TEXT_SPACING);
   81FB 3E 0B         [ 7]  147 	ld	a, #0x0b
   81FD F5            [11]  148 	push	af
   81FE 33            [ 6]  149 	inc	sp
   81FF 2A 96 92      [16]  150 	ld	hl, (_displayed_score)
   8202 E5            [11]  151 	push	hl
   8203 CD E2 82      [17]  152 	call	_hud_draw_score_with_added_last_zero
   8206 F1            [10]  153 	pop	af
   8207 33            [ 6]  154 	inc	sp
   8208 C9            [10]  155 	ret
                            156 ;src/hud.c:74: void hud_initialize_internal(u8 is_restart)
                            157 ;	---------------------------------
                            158 ; Function hud_initialize_internal
                            159 ; ---------------------------------
   8209                     160 _hud_initialize_internal::
   8209 DD E5         [15]  161 	push	ix
   820B DD 21 00 00   [14]  162 	ld	ix,#0
   820F DD 39         [15]  163 	add	ix,sp
   8211 F5            [11]  164 	push	af
                            165 ;src/hud.c:76: u8 initial_y = SCREEN_HEIGHT_ROWS - (((lives_left - 1) / 2) * 8) - 8;
   8212 21 8F 92      [10]  166 	ld	hl,#_lives_left + 0
   8215 5E            [ 7]  167 	ld	e, (hl)
   8216 16 00         [ 7]  168 	ld	d, #0x00
   8218 6B            [ 4]  169 	ld	l, e
   8219 62            [ 4]  170 	ld	h, d
   821A 2B            [ 6]  171 	dec	hl
   821B 4D            [ 4]  172 	ld	c, l
   821C 44            [ 4]  173 	ld	b, h
   821D CB 7C         [ 8]  174 	bit	7, h
   821F 28 02         [12]  175 	jr	Z,00107$
   8221 4B            [ 4]  176 	ld	c, e
   8222 42            [ 4]  177 	ld	b, d
   8223                     178 00107$:
   8223 CB 28         [ 8]  179 	sra	b
   8225 CB 19         [ 8]  180 	rr	c
   8227 79            [ 4]  181 	ld	a, c
   8228 07            [ 4]  182 	rlca
   8229 07            [ 4]  183 	rlca
   822A 07            [ 4]  184 	rlca
   822B E6 F8         [ 7]  185 	and	a, #0xf8
   822D 4F            [ 4]  186 	ld	c, a
   822E 3E C0         [ 7]  187 	ld	a, #0xc0
   8230 91            [ 4]  188 	sub	a, c
   8231 DD 77 FE      [19]  189 	ld	-2 (ix), a
                            190 ;src/hud.c:78: displayed_score = current_score;
   8234 2A 90 92      [16]  191 	ld	hl, (_current_score)
   8237 22 96 92      [16]  192 	ld	(_displayed_score), hl
                            193 ;src/hud.c:80: hud_initialize_static_text();
   823A CD 98 82      [17]  194 	call	_hud_initialize_static_text
                            195 ;src/hud.c:81: hud_draw_score_with_added_last_zero(current_score, HUD_TOP + HUD_TEXT_SPACING);
   823D 3E 0B         [ 7]  196 	ld	a, #0x0b
   823F F5            [11]  197 	push	af
   8240 33            [ 6]  198 	inc	sp
   8241 2A 90 92      [16]  199 	ld	hl, (_current_score)
   8244 E5            [11]  200 	push	hl
   8245 CD E2 82      [17]  201 	call	_hud_draw_score_with_added_last_zero
   8248 F1            [10]  202 	pop	af
   8249 33            [ 6]  203 	inc	sp
                            204 ;src/hud.c:83: hud_draw_score_with_added_last_zero(high_score, HUD_TOP + (HUD_TEXT_SPACING * 5));
   824A 3E 33         [ 7]  205 	ld	a, #0x33
   824C F5            [11]  206 	push	af
   824D 33            [ 6]  207 	inc	sp
   824E 2A 92 92      [16]  208 	ld	hl, (_high_score)
   8251 E5            [11]  209 	push	hl
   8252 CD E2 82      [17]  210 	call	_hud_draw_score_with_added_last_zero
   8255 F1            [10]  211 	pop	af
   8256 33            [ 6]  212 	inc	sp
                            213 ;src/hud.c:85: for (u8 i = 0; i < lives_left; i++)
   8257 0E 00         [ 7]  214 	ld	c, #0x00
   8259                     215 00103$:
   8259 21 8F 92      [10]  216 	ld	hl, #_lives_left
   825C 79            [ 4]  217 	ld	a, c
   825D 96            [ 7]  218 	sub	a, (hl)
   825E 30 33         [12]  219 	jr	NC,00105$
                            220 ;src/hud.c:87: u8 x = ((i & 1) == 0) ? HUD_LEFT : HUD_LEFT + (SP_LIFE_W + 1);
   8260 CB 41         [ 8]  221 	bit	0, c
   8262 20 04         [12]  222 	jr	NZ,00108$
   8264 06 44         [ 7]  223 	ld	b, #0x44
   8266 18 02         [12]  224 	jr	00109$
   8268                     225 00108$:
   8268 06 4A         [ 7]  226 	ld	b, #0x4a
   826A                     227 00109$:
                            228 ;src/hud.c:88: u8 y = initial_y + ((i / 2) * 8);
   826A 79            [ 4]  229 	ld	a, c
   826B CB 3F         [ 8]  230 	srl	a
   826D 07            [ 4]  231 	rlca
   826E 07            [ 4]  232 	rlca
   826F 07            [ 4]  233 	rlca
   8270 E6 F8         [ 7]  234 	and	a, #0xf8
   8272 5F            [ 4]  235 	ld	e, a
   8273 DD 7E FE      [19]  236 	ld	a, -2 (ix)
   8276 83            [ 4]  237 	add	a, e
                            238 ;src/hud.c:90: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   8277 C5            [11]  239 	push	bc
   8278 F5            [11]  240 	push	af
   8279 33            [ 6]  241 	inc	sp
   827A C5            [11]  242 	push	bc
   827B 33            [ 6]  243 	inc	sp
   827C 21 00 C0      [10]  244 	ld	hl, #0xc000
   827F E5            [11]  245 	push	hl
   8280 CD 44 8D      [17]  246 	call	_cpct_getScreenPtr
   8283 11 05 06      [10]  247 	ld	de, #0x0605
   8286 D5            [11]  248 	push	de
   8287 E5            [11]  249 	push	hl
   8288 21 10 6A      [10]  250 	ld	hl, #_sp_life
   828B E5            [11]  251 	push	hl
   828C CD D9 89      [17]  252 	call	_cpct_drawSprite
   828F C1            [10]  253 	pop	bc
                            254 ;src/hud.c:85: for (u8 i = 0; i < lives_left; i++)
   8290 0C            [ 4]  255 	inc	c
   8291 18 C6         [12]  256 	jr	00103$
   8293                     257 00105$:
   8293 DD F9         [10]  258 	ld	sp, ix
   8295 DD E1         [14]  259 	pop	ix
   8297 C9            [10]  260 	ret
                            261 ;src/hud.c:95: void hud_initialize_static_text()
                            262 ;	---------------------------------
                            263 ; Function hud_initialize_static_text
                            264 ; ---------------------------------
   8298                     265 _hud_initialize_static_text::
                            266 ;src/hud.c:97: text_write_string(HUD_LEFT + 1, 1, "SCORE");
   8298 21 D1 82      [10]  267 	ld	hl, #___str_0
   829B E5            [11]  268 	push	hl
   829C 21 45 01      [10]  269 	ld	hl, #0x0145
   829F E5            [11]  270 	push	hl
   82A0 CD EE 87      [17]  271 	call	_text_write_string
   82A3 F1            [10]  272 	pop	af
                            273 ;src/hud.c:99: text_write_string(HUD_LEFT + 2, 1 + (3 * HUD_TEXT_SPACING), "HIGH");
   82A4 21 D7 82      [10]  274 	ld	hl, #___str_1
   82A7 E3            [19]  275 	ex	(sp),hl
   82A8 21 46 1F      [10]  276 	ld	hl, #0x1f46
   82AB E5            [11]  277 	push	hl
   82AC CD EE 87      [17]  278 	call	_text_write_string
   82AF F1            [10]  279 	pop	af
                            280 ;src/hud.c:100: text_write_string(HUD_LEFT + 1, 1 + (4 * HUD_TEXT_SPACING), "SCORE");
   82B0 21 D1 82      [10]  281 	ld	hl, #___str_0
   82B3 E3            [19]  282 	ex	(sp),hl
   82B4 21 45 29      [10]  283 	ld	hl, #0x2945
   82B7 E5            [11]  284 	push	hl
   82B8 CD EE 87      [17]  285 	call	_text_write_string
   82BB F1            [10]  286 	pop	af
                            287 ;src/hud.c:102: text_write_string(HUD_LEFT + 1, 1 + (7 * HUD_TEXT_SPACING), "LEVEL");
   82BC 21 DC 82      [10]  288 	ld	hl, #___str_2
   82BF E3            [19]  289 	ex	(sp),hl
   82C0 21 45 47      [10]  290 	ld	hl, #0x4745
   82C3 E5            [11]  291 	push	hl
   82C4 CD EE 87      [17]  292 	call	_text_write_string
   82C7 F1            [10]  293 	pop	af
                            294 ;src/hud.c:104: hud_draw_lives(1 + (8 * HUD_TEXT_SPACING));
   82C8 26 51         [ 7]  295 	ld	h,#0x51
   82CA E3            [19]  296 	ex	(sp),hl
   82CB 33            [ 6]  297 	inc	sp
   82CC CD 69 83      [17]  298 	call	_hud_draw_lives
   82CF 33            [ 6]  299 	inc	sp
   82D0 C9            [10]  300 	ret
   82D1                     301 ___str_0:
   82D1 53 43 4F 52 45      302 	.ascii "SCORE"
   82D6 00                  303 	.db 0x00
   82D7                     304 ___str_1:
   82D7 48 49 47 48         305 	.ascii "HIGH"
   82DB 00                  306 	.db 0x00
   82DC                     307 ___str_2:
   82DC 4C 45 56 45 4C      308 	.ascii "LEVEL"
   82E1 00                  309 	.db 0x00
                            310 ;src/hud.c:109: void hud_draw_score_with_added_last_zero(u16 score, u8 row)
                            311 ;	---------------------------------
                            312 ; Function hud_draw_score_with_added_last_zero
                            313 ; ---------------------------------
   82E2                     314 _hud_draw_score_with_added_last_zero::
   82E2 DD E5         [15]  315 	push	ix
   82E4 DD 21 00 00   [14]  316 	ld	ix,#0
   82E8 DD 39         [15]  317 	add	ix,sp
   82EA F5            [11]  318 	push	af
   82EB 3B            [ 6]  319 	dec	sp
                            320 ;src/hud.c:112: u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, 80 - 2, row);
   82EC DD 56 06      [19]  321 	ld	d, 6 (ix)
   82EF 1E 4E         [ 7]  322 	ld	e,#0x4e
   82F1 D5            [11]  323 	push	de
   82F2 21 00 C0      [10]  324 	ld	hl, #0xc000
   82F5 E5            [11]  325 	push	hl
   82F6 CD 44 8D      [17]  326 	call	_cpct_getScreenPtr
   82F9 33            [ 6]  327 	inc	sp
   82FA 33            [ 6]  328 	inc	sp
                            329 ;src/hud.c:115: cpct_drawSprite(sp_font_00, svmem, SP_FONT_CHAR_W, SP_FONT_CHAR_H);
   82FB 4D            [ 4]  330 	ld	c, l
   82FC 44            [ 4]  331 	ld	b, h
   82FD C5            [11]  332 	push	bc
   82FE 21 02 08      [10]  333 	ld	hl, #0x0802
   8301 E5            [11]  334 	push	hl
   8302 C5            [11]  335 	push	bc
   8303 21 80 67      [10]  336 	ld	hl, #_sp_font_00
   8306 E5            [11]  337 	push	hl
   8307 CD D9 89      [17]  338 	call	_cpct_drawSprite
                            339 ;src/hud.c:117: for (i = 0; i < 5; i++)
   830A DD 36 FF 00   [19]  340 	ld	-1 (ix), #0x00
   830E                     341 00102$:
                            342 ;src/hud.c:119: u8 digit = (score % 10);
   830E 21 0A 00      [10]  343 	ld	hl, #0x000a
   8311 E5            [11]  344 	push	hl
   8312 DD 6E 04      [19]  345 	ld	l,4 (ix)
   8315 DD 66 05      [19]  346 	ld	h,5 (ix)
   8318 E5            [11]  347 	push	hl
   8319 CD 19 8B      [17]  348 	call	__moduint
   831C F1            [10]  349 	pop	af
   831D F1            [10]  350 	pop	af
   831E 4D            [ 4]  351 	ld	c, l
                            352 ;src/hud.c:121: cpct_drawSprite(digits[digit], (svmem - (2 * (i + 1))), SP_FONT_CHAR_W, SP_FONT_CHAR_H);
   831F DD 6E FF      [19]  353 	ld	l, -1 (ix)
   8322 26 00         [ 7]  354 	ld	h, #0x00
   8324 23            [ 6]  355 	inc	hl
   8325 29            [11]  356 	add	hl, hl
   8326 DD 7E FD      [19]  357 	ld	a, -3 (ix)
   8329 95            [ 4]  358 	sub	a, l
   832A 5F            [ 4]  359 	ld	e, a
   832B DD 7E FE      [19]  360 	ld	a, -2 (ix)
   832E 9C            [ 4]  361 	sbc	a, h
   832F 57            [ 4]  362 	ld	d, a
   8330 69            [ 4]  363 	ld	l, c
   8331 26 00         [ 7]  364 	ld	h, #0x00
   8333 29            [11]  365 	add	hl, hl
   8334 01 98 92      [10]  366 	ld	bc, #_digits
   8337 09            [11]  367 	add	hl, bc
   8338 4E            [ 7]  368 	ld	c, (hl)
   8339 23            [ 6]  369 	inc	hl
   833A 46            [ 7]  370 	ld	b, (hl)
   833B 21 02 08      [10]  371 	ld	hl, #0x0802
   833E E5            [11]  372 	push	hl
   833F D5            [11]  373 	push	de
   8340 C5            [11]  374 	push	bc
   8341 CD D9 89      [17]  375 	call	_cpct_drawSprite
                            376 ;src/hud.c:122: score /= 10;
   8344 21 0A 00      [10]  377 	ld	hl, #0x000a
   8347 E5            [11]  378 	push	hl
   8348 DD 6E 04      [19]  379 	ld	l,4 (ix)
   834B DD 66 05      [19]  380 	ld	h,5 (ix)
   834E E5            [11]  381 	push	hl
   834F CD FF 88      [17]  382 	call	__divuint
   8352 F1            [10]  383 	pop	af
   8353 F1            [10]  384 	pop	af
   8354 DD 75 04      [19]  385 	ld	4 (ix), l
   8357 DD 74 05      [19]  386 	ld	5 (ix), h
                            387 ;src/hud.c:117: for (i = 0; i < 5; i++)
   835A DD 34 FF      [23]  388 	inc	-1 (ix)
   835D DD 7E FF      [19]  389 	ld	a, -1 (ix)
   8360 D6 05         [ 7]  390 	sub	a, #0x05
   8362 38 AA         [12]  391 	jr	C,00102$
   8364 DD F9         [10]  392 	ld	sp, ix
   8366 DD E1         [14]  393 	pop	ix
   8368 C9            [10]  394 	ret
                            395 ;src/hud.c:128: void hud_draw_lives(u8 row)
                            396 ;	---------------------------------
                            397 ; Function hud_draw_lives
                            398 ; ---------------------------------
   8369                     399 _hud_draw_lives::
   8369 DD E5         [15]  400 	push	ix
   836B DD 21 00 00   [14]  401 	ld	ix,#0
   836F DD 39         [15]  402 	add	ix,sp
   8371 F5            [11]  403 	push	af
   8372 3B            [ 6]  404 	dec	sp
                            405 ;src/hud.c:130: u8 num = current_level_num + 1;
   8373 3A 8E 92      [13]  406 	ld	a,(#_current_level_num + 0)
   8376 3C            [ 4]  407 	inc	a
   8377 DD 77 FD      [19]  408 	ld	-3 (ix), a
                            409 ;src/hud.c:131: u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, 74, row);
   837A DD 56 04      [19]  410 	ld	d, 4 (ix)
   837D 1E 4A         [ 7]  411 	ld	e,#0x4a
   837F D5            [11]  412 	push	de
   8380 21 00 C0      [10]  413 	ld	hl, #0xc000
   8383 E5            [11]  414 	push	hl
   8384 CD 44 8D      [17]  415 	call	_cpct_getScreenPtr
   8387 DD 75 FE      [19]  416 	ld	-2 (ix), l
   838A DD 74 FF      [19]  417 	ld	-1 (ix), h
                            418 ;src/hud.c:133: u8 digit = (num % 10);
   838D 3E 0A         [ 7]  419 	ld	a, #0x0a
   838F F5            [11]  420 	push	af
   8390 33            [ 6]  421 	inc	sp
   8391 DD 7E FD      [19]  422 	ld	a, -3 (ix)
   8394 F5            [11]  423 	push	af
   8395 33            [ 6]  424 	inc	sp
   8396 CD 0D 8B      [17]  425 	call	__moduchar
   8399 F1            [10]  426 	pop	af
   839A 4D            [ 4]  427 	ld	c, l
                            428 ;src/hud.c:134: cpct_drawSprite(digits[digit], svmem, SP_FONT_CHAR_W, SP_FONT_CHAR_H);
   839B DD 5E FE      [19]  429 	ld	e,-2 (ix)
   839E DD 56 FF      [19]  430 	ld	d,-1 (ix)
   83A1 69            [ 4]  431 	ld	l, c
   83A2 26 00         [ 7]  432 	ld	h, #0x00
   83A4 29            [11]  433 	add	hl, hl
   83A5 01 98 92      [10]  434 	ld	bc, #_digits
   83A8 09            [11]  435 	add	hl, bc
   83A9 4E            [ 7]  436 	ld	c, (hl)
   83AA 23            [ 6]  437 	inc	hl
   83AB 46            [ 7]  438 	ld	b, (hl)
   83AC 21 02 08      [10]  439 	ld	hl, #0x0802
   83AF E5            [11]  440 	push	hl
   83B0 D5            [11]  441 	push	de
   83B1 C5            [11]  442 	push	bc
   83B2 CD D9 89      [17]  443 	call	_cpct_drawSprite
                            444 ;src/hud.c:136: digit = ((num / 10) % 10);
   83B5 3E 0A         [ 7]  445 	ld	a, #0x0a
   83B7 F5            [11]  446 	push	af
   83B8 33            [ 6]  447 	inc	sp
   83B9 DD 7E FD      [19]  448 	ld	a, -3 (ix)
   83BC F5            [11]  449 	push	af
   83BD 33            [ 6]  450 	inc	sp
   83BE CD 07 89      [17]  451 	call	__divuchar
   83C1 F1            [10]  452 	pop	af
   83C2 45            [ 4]  453 	ld	b, l
   83C3 3E 0A         [ 7]  454 	ld	a, #0x0a
   83C5 F5            [11]  455 	push	af
   83C6 33            [ 6]  456 	inc	sp
   83C7 C5            [11]  457 	push	bc
   83C8 33            [ 6]  458 	inc	sp
   83C9 CD 0D 8B      [17]  459 	call	__moduchar
   83CC F1            [10]  460 	pop	af
                            461 ;src/hud.c:137: cpct_drawSprite(digits[digit], svmem - 2, SP_FONT_CHAR_W, SP_FONT_CHAR_H);
   83CD DD 5E FE      [19]  462 	ld	e, -2 (ix)
   83D0 DD 56 FF      [19]  463 	ld	d, -1 (ix)
   83D3 1B            [ 6]  464 	dec	de
   83D4 1B            [ 6]  465 	dec	de
   83D5 26 00         [ 7]  466 	ld	h, #0x00
   83D7 29            [11]  467 	add	hl, hl
   83D8 01 98 92      [10]  468 	ld	bc, #_digits
   83DB 09            [11]  469 	add	hl, bc
   83DC 4E            [ 7]  470 	ld	c, (hl)
   83DD 23            [ 6]  471 	inc	hl
   83DE 46            [ 7]  472 	ld	b, (hl)
   83DF 21 02 08      [10]  473 	ld	hl, #0x0802
   83E2 E5            [11]  474 	push	hl
   83E3 D5            [11]  475 	push	de
   83E4 C5            [11]  476 	push	bc
   83E5 CD D9 89      [17]  477 	call	_cpct_drawSprite
   83E8 DD F9         [10]  478 	ld	sp, ix
   83EA DD E1         [14]  479 	pop	ix
   83EC C9            [10]  480 	ret
                            481 	.area _CODE
                            482 	.area _INITIALIZER
                            483 	.area _CABS (ABS)
