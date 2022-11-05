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
                             11 	.globl _cpct_getScreenPtr
                             12 	.globl _cpct_drawSprite
                             13 	.globl _digits
                             14 	.globl _hud_initialize
                             15 	.globl _hud_continue_from_death
                             16 	.globl _hud_update
                             17 	.globl _hud_restore_background
                             18 	.globl _hud_draw
                             19 	.globl _hud_initialize_internal
                             20 	.globl _hud_initialize_static_text
                             21 	.globl _hud_draw_score_with_added_last_zero
                             22 	.globl _hud_draw_lives
                             23 ;--------------------------------------------------------
                             24 ; special function registers
                             25 ;--------------------------------------------------------
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DATA
   881B                      30 _digits::
   881B                      31 	.ds 20
                             32 ;--------------------------------------------------------
                             33 ; ram data
                             34 ;--------------------------------------------------------
                             35 	.area _INITIALIZED
                             36 ;--------------------------------------------------------
                             37 ; absolute external ram data
                             38 ;--------------------------------------------------------
                             39 	.area _DABS (ABS)
                             40 ;--------------------------------------------------------
                             41 ; global & static initialisations
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _GSINIT
                             45 	.area _GSFINAL
                             46 	.area _GSINIT
                             47 ;--------------------------------------------------------
                             48 ; Home
                             49 ;--------------------------------------------------------
                             50 	.area _HOME
                             51 	.area _HOME
                             52 ;--------------------------------------------------------
                             53 ; code
                             54 ;--------------------------------------------------------
                             55 	.area _CODE
                             56 ;src/hud.c:32: void hud_initialize()
                             57 ;	---------------------------------
                             58 ; Function hud_initialize
                             59 ; ---------------------------------
   771C                      60 _hud_initialize::
                             61 ;src/hud.c:34: digits[0] = sp_font_00; 
   771C 21 F4 5B      [10]   62 	ld	hl, #_sp_font_00
   771F 22 1B 88      [16]   63 	ld	(_digits), hl
                             64 ;src/hud.c:35: digits[1] = sp_font_01; 
   7722 21 04 5C      [10]   65 	ld	hl, #_sp_font_01
   7725 22 1D 88      [16]   66 	ld	((_digits + 0x0002)), hl
                             67 ;src/hud.c:36: digits[2] = sp_font_02; 
   7728 21 14 5C      [10]   68 	ld	hl, #_sp_font_02
   772B 22 1F 88      [16]   69 	ld	((_digits + 0x0004)), hl
                             70 ;src/hud.c:37: digits[3] = sp_font_03; 
   772E 21 24 5C      [10]   71 	ld	hl, #_sp_font_03
   7731 22 21 88      [16]   72 	ld	((_digits + 0x0006)), hl
                             73 ;src/hud.c:38: digits[4] = sp_font_04; 
   7734 21 34 5C      [10]   74 	ld	hl, #_sp_font_04
   7737 22 23 88      [16]   75 	ld	((_digits + 0x0008)), hl
                             76 ;src/hud.c:39: digits[5] = sp_font_05; 
   773A 21 44 5C      [10]   77 	ld	hl, #_sp_font_05
   773D 22 25 88      [16]   78 	ld	((_digits + 0x000a)), hl
                             79 ;src/hud.c:40: digits[6] = sp_font_06; 
   7740 21 54 5C      [10]   80 	ld	hl, #_sp_font_06
   7743 22 27 88      [16]   81 	ld	((_digits + 0x000c)), hl
                             82 ;src/hud.c:41: digits[7] = sp_font_07; 
   7746 21 64 5C      [10]   83 	ld	hl, #_sp_font_07
   7749 22 29 88      [16]   84 	ld	((_digits + 0x000e)), hl
                             85 ;src/hud.c:42: digits[8] = sp_font_08; 
   774C 21 74 5C      [10]   86 	ld	hl, #_sp_font_08
   774F 22 2B 88      [16]   87 	ld	((_digits + 0x0010)), hl
                             88 ;src/hud.c:43: digits[9] = sp_font_09; 
   7752 21 84 5C      [10]   89 	ld	hl, #_sp_font_09
   7755 22 2D 88      [16]   90 	ld	((_digits + 0x0012)), hl
                             91 ;src/hud.c:45: hud_initialize_internal(FALSE);
   7758 AF            [ 4]   92 	xor	a, a
   7759 F5            [11]   93 	push	af
   775A 33            [ 6]   94 	inc	sp
   775B CD 6C 77      [17]   95 	call	_hud_initialize_internal
   775E 33            [ 6]   96 	inc	sp
   775F C9            [10]   97 	ret
                             98 ;src/hud.c:48: void hud_continue_from_death()
                             99 ;	---------------------------------
                            100 ; Function hud_continue_from_death
                            101 ; ---------------------------------
   7760                     102 _hud_continue_from_death::
                            103 ;src/hud.c:50: hud_initialize_internal(TRUE);
   7760 3E 01         [ 7]  104 	ld	a, #0x01
   7762 F5            [11]  105 	push	af
   7763 33            [ 6]  106 	inc	sp
   7764 CD 6C 77      [17]  107 	call	_hud_initialize_internal
   7767 33            [ 6]  108 	inc	sp
   7768 C9            [10]  109 	ret
                            110 ;src/hud.c:53: void hud_update()
                            111 ;	---------------------------------
                            112 ; Function hud_update
                            113 ; ---------------------------------
   7769                     114 _hud_update::
                            115 ;src/hud.c:55: }
   7769 C9            [10]  116 	ret
                            117 ;src/hud.c:57: void hud_restore_background()
                            118 ;	---------------------------------
                            119 ; Function hud_restore_background
                            120 ; ---------------------------------
   776A                     121 _hud_restore_background::
                            122 ;src/hud.c:59: }
   776A C9            [10]  123 	ret
                            124 ;src/hud.c:61: void hud_draw()
                            125 ;	---------------------------------
                            126 ; Function hud_draw
                            127 ; ---------------------------------
   776B                     128 _hud_draw::
                            129 ;src/hud.c:63: }
   776B C9            [10]  130 	ret
                            131 ;src/hud.c:69: void hud_initialize_internal(u8 is_restart)
                            132 ;	---------------------------------
                            133 ; Function hud_initialize_internal
                            134 ; ---------------------------------
   776C                     135 _hud_initialize_internal::
   776C DD E5         [15]  136 	push	ix
   776E DD 21 00 00   [14]  137 	ld	ix,#0
   7772 DD 39         [15]  138 	add	ix,sp
   7774 F5            [11]  139 	push	af
                            140 ;src/hud.c:71: u8 initial_y = SCREEN_HEIGHT_ROWS - (((lives_left - 1) / 2) * 8) - 8;
   7775 21 14 88      [10]  141 	ld	hl,#_lives_left + 0
   7778 5E            [ 7]  142 	ld	e, (hl)
   7779 16 00         [ 7]  143 	ld	d, #0x00
   777B 6B            [ 4]  144 	ld	l, e
   777C 62            [ 4]  145 	ld	h, d
   777D 2B            [ 6]  146 	dec	hl
   777E 4D            [ 4]  147 	ld	c, l
   777F 44            [ 4]  148 	ld	b, h
   7780 CB 7C         [ 8]  149 	bit	7, h
   7782 28 02         [12]  150 	jr	Z,00107$
   7784 4B            [ 4]  151 	ld	c, e
   7785 42            [ 4]  152 	ld	b, d
   7786                     153 00107$:
   7786 CB 28         [ 8]  154 	sra	b
   7788 CB 19         [ 8]  155 	rr	c
   778A 79            [ 4]  156 	ld	a, c
   778B 07            [ 4]  157 	rlca
   778C 07            [ 4]  158 	rlca
   778D 07            [ 4]  159 	rlca
   778E E6 F8         [ 7]  160 	and	a, #0xf8
   7790 4F            [ 4]  161 	ld	c, a
   7791 3E C0         [ 7]  162 	ld	a, #0xc0
   7793 91            [ 4]  163 	sub	a, c
   7794 DD 77 FE      [19]  164 	ld	-2 (ix), a
                            165 ;src/hud.c:73: hud_initialize_static_text();
   7797 CD F5 77      [17]  166 	call	_hud_initialize_static_text
                            167 ;src/hud.c:74: hud_draw_score_with_added_last_zero(current_score, HUD_TOP + HUD_TEXT_SPACING);
   779A 3E 0B         [ 7]  168 	ld	a, #0x0b
   779C F5            [11]  169 	push	af
   779D 33            [ 6]  170 	inc	sp
   779E 2A 15 88      [16]  171 	ld	hl, (_current_score)
   77A1 E5            [11]  172 	push	hl
   77A2 CD 5C 78      [17]  173 	call	_hud_draw_score_with_added_last_zero
   77A5 F1            [10]  174 	pop	af
   77A6 33            [ 6]  175 	inc	sp
                            176 ;src/hud.c:76: hud_draw_score_with_added_last_zero(high_score, HUD_TOP + (HUD_TEXT_SPACING * 5) );
   77A7 3E 33         [ 7]  177 	ld	a, #0x33
   77A9 F5            [11]  178 	push	af
   77AA 33            [ 6]  179 	inc	sp
   77AB 2A 17 88      [16]  180 	ld	hl, (_high_score)
   77AE E5            [11]  181 	push	hl
   77AF CD 5C 78      [17]  182 	call	_hud_draw_score_with_added_last_zero
   77B2 F1            [10]  183 	pop	af
   77B3 33            [ 6]  184 	inc	sp
                            185 ;src/hud.c:79: for (u8 i = 0; i < lives_left; i++)
   77B4 0E 00         [ 7]  186 	ld	c, #0x00
   77B6                     187 00103$:
   77B6 21 14 88      [10]  188 	ld	hl, #_lives_left
   77B9 79            [ 4]  189 	ld	a, c
   77BA 96            [ 7]  190 	sub	a, (hl)
   77BB 30 33         [12]  191 	jr	NC,00105$
                            192 ;src/hud.c:81: u8 x = ((i & 1) == 0) ? HUD_LEFT : HUD_LEFT + (SP_LIFE_W + 1);
   77BD CB 41         [ 8]  193 	bit	0, c
   77BF 20 04         [12]  194 	jr	NZ,00108$
   77C1 06 44         [ 7]  195 	ld	b, #0x44
   77C3 18 02         [12]  196 	jr	00109$
   77C5                     197 00108$:
   77C5 06 4A         [ 7]  198 	ld	b, #0x4a
   77C7                     199 00109$:
                            200 ;src/hud.c:82: u8 y = initial_y + ((i / 2) * 8);
   77C7 79            [ 4]  201 	ld	a, c
   77C8 CB 3F         [ 8]  202 	srl	a
   77CA 07            [ 4]  203 	rlca
   77CB 07            [ 4]  204 	rlca
   77CC 07            [ 4]  205 	rlca
   77CD E6 F8         [ 7]  206 	and	a, #0xf8
   77CF 5F            [ 4]  207 	ld	e, a
   77D0 DD 7E FE      [19]  208 	ld	a, -2 (ix)
   77D3 83            [ 4]  209 	add	a, e
                            210 ;src/hud.c:84: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   77D4 C5            [11]  211 	push	bc
   77D5 F5            [11]  212 	push	af
   77D6 33            [ 6]  213 	inc	sp
   77D7 C5            [11]  214 	push	bc
   77D8 33            [ 6]  215 	inc	sp
   77D9 21 00 C0      [10]  216 	ld	hl, #0xc000
   77DC E5            [11]  217 	push	hl
   77DD CD C9 82      [17]  218 	call	_cpct_getScreenPtr
   77E0 11 05 06      [10]  219 	ld	de, #0x0605
   77E3 D5            [11]  220 	push	de
   77E4 E5            [11]  221 	push	hl
   77E5 21 48 5F      [10]  222 	ld	hl, #_sp_life
   77E8 E5            [11]  223 	push	hl
   77E9 CD 5E 7F      [17]  224 	call	_cpct_drawSprite
   77EC C1            [10]  225 	pop	bc
                            226 ;src/hud.c:79: for (u8 i = 0; i < lives_left; i++)
   77ED 0C            [ 4]  227 	inc	c
   77EE 18 C6         [12]  228 	jr	00103$
   77F0                     229 00105$:
   77F0 DD F9         [10]  230 	ld	sp, ix
   77F2 DD E1         [14]  231 	pop	ix
   77F4 C9            [10]  232 	ret
                            233 ;src/hud.c:89: void hud_initialize_static_text()
                            234 ;	---------------------------------
                            235 ; Function hud_initialize_static_text
                            236 ; ---------------------------------
   77F5                     237 _hud_initialize_static_text::
                            238 ;src/hud.c:92: u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, HUD_LEFT + 1, 1);
   77F5 21 45 01      [10]  239 	ld	hl, #0x0145
   77F8 E5            [11]  240 	push	hl
   77F9 21 00 C0      [10]  241 	ld	hl, #0xc000
   77FC E5            [11]  242 	push	hl
   77FD CD C9 82      [17]  243 	call	_cpct_getScreenPtr
   7800 4D            [ 4]  244 	ld	c, l
   7801 44            [ 4]  245 	ld	b, h
                            246 ;src/hud.c:93: cpct_drawSprite(sp_score, svmem, SP_SCORE_W, SP_SCORE_H);
   7802 21 0A 07      [10]  247 	ld	hl, #0x070a
   7805 E5            [11]  248 	push	hl
   7806 C5            [11]  249 	push	bc
   7807 21 02 5F      [10]  250 	ld	hl, #_sp_score
   780A E5            [11]  251 	push	hl
   780B CD 5E 7F      [17]  252 	call	_cpct_drawSprite
                            253 ;src/hud.c:96: svmem = cpct_getScreenPtr(CPCT_VMEM_START, HUD_LEFT + 2, 1 + (3 * HUD_TEXT_SPACING));
   780E 21 46 1F      [10]  254 	ld	hl, #0x1f46
   7811 E5            [11]  255 	push	hl
   7812 21 00 C0      [10]  256 	ld	hl, #0xc000
   7815 E5            [11]  257 	push	hl
   7816 CD C9 82      [17]  258 	call	_cpct_getScreenPtr
                            259 ;src/hud.c:97: cpct_drawSprite(sp_high, svmem, SP_HIGH_W, SP_HIGH_H);
   7819 01 84 5E      [10]  260 	ld	bc, #_sp_high+0
   781C 11 08 07      [10]  261 	ld	de, #0x0708
   781F D5            [11]  262 	push	de
   7820 E5            [11]  263 	push	hl
   7821 C5            [11]  264 	push	bc
   7822 CD 5E 7F      [17]  265 	call	_cpct_drawSprite
                            266 ;src/hud.c:100: svmem = cpct_getScreenPtr(CPCT_VMEM_START, HUD_LEFT + 1, 1 + (4 * HUD_TEXT_SPACING));
   7825 21 45 29      [10]  267 	ld	hl, #0x2945
   7828 E5            [11]  268 	push	hl
   7829 21 00 C0      [10]  269 	ld	hl, #0xc000
   782C E5            [11]  270 	push	hl
   782D CD C9 82      [17]  271 	call	_cpct_getScreenPtr
                            272 ;src/hud.c:101: cpct_drawSprite(sp_score, svmem, SP_SCORE_W, SP_SCORE_H);
   7830 01 0A 07      [10]  273 	ld	bc, #0x070a
   7833 C5            [11]  274 	push	bc
   7834 E5            [11]  275 	push	hl
   7835 21 02 5F      [10]  276 	ld	hl, #_sp_score
   7838 E5            [11]  277 	push	hl
   7839 CD 5E 7F      [17]  278 	call	_cpct_drawSprite
                            279 ;src/hud.c:104: svmem = cpct_getScreenPtr(CPCT_VMEM_START, HUD_LEFT + 1, 1 + (7 * HUD_TEXT_SPACING));
   783C 21 45 47      [10]  280 	ld	hl, #0x4745
   783F E5            [11]  281 	push	hl
   7840 21 00 C0      [10]  282 	ld	hl, #0xc000
   7843 E5            [11]  283 	push	hl
   7844 CD C9 82      [17]  284 	call	_cpct_getScreenPtr
                            285 ;src/hud.c:105: cpct_drawSprite(sp_level, svmem, SP_LEVEL_W, SP_LEVEL_H);
   7847 01 BC 5E      [10]  286 	ld	bc, #_sp_level+0
   784A 11 0A 07      [10]  287 	ld	de, #0x070a
   784D D5            [11]  288 	push	de
   784E E5            [11]  289 	push	hl
   784F C5            [11]  290 	push	bc
   7850 CD 5E 7F      [17]  291 	call	_cpct_drawSprite
                            292 ;src/hud.c:107: hud_draw_lives(1 + (8 * HUD_TEXT_SPACING));
   7853 3E 51         [ 7]  293 	ld	a, #0x51
   7855 F5            [11]  294 	push	af
   7856 33            [ 6]  295 	inc	sp
   7857 CD E3 78      [17]  296 	call	_hud_draw_lives
   785A 33            [ 6]  297 	inc	sp
   785B C9            [10]  298 	ret
                            299 ;src/hud.c:113: void hud_draw_score_with_added_last_zero(u16 score, u8 row)
                            300 ;	---------------------------------
                            301 ; Function hud_draw_score_with_added_last_zero
                            302 ; ---------------------------------
   785C                     303 _hud_draw_score_with_added_last_zero::
   785C DD E5         [15]  304 	push	ix
   785E DD 21 00 00   [14]  305 	ld	ix,#0
   7862 DD 39         [15]  306 	add	ix,sp
   7864 F5            [11]  307 	push	af
   7865 3B            [ 6]  308 	dec	sp
                            309 ;src/hud.c:116: u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, 80 - 2, row);
   7866 DD 56 06      [19]  310 	ld	d, 6 (ix)
   7869 1E 4E         [ 7]  311 	ld	e,#0x4e
   786B D5            [11]  312 	push	de
   786C 21 00 C0      [10]  313 	ld	hl, #0xc000
   786F E5            [11]  314 	push	hl
   7870 CD C9 82      [17]  315 	call	_cpct_getScreenPtr
   7873 33            [ 6]  316 	inc	sp
   7874 33            [ 6]  317 	inc	sp
                            318 ;src/hud.c:121: cpct_drawSprite(sp_font_00, svmem, SP_FONT_CHAR_W, SP_FONT_CHAR_H);
   7875 4D            [ 4]  319 	ld	c, l
   7876 44            [ 4]  320 	ld	b, h
   7877 C5            [11]  321 	push	bc
   7878 21 02 08      [10]  322 	ld	hl, #0x0802
   787B E5            [11]  323 	push	hl
   787C C5            [11]  324 	push	bc
   787D 21 F4 5B      [10]  325 	ld	hl, #_sp_font_00
   7880 E5            [11]  326 	push	hl
   7881 CD 5E 7F      [17]  327 	call	_cpct_drawSprite
                            328 ;src/hud.c:124: for (i = 0; i < 5; i++)
   7884 DD 36 FF 00   [19]  329 	ld	-1 (ix), #0x00
   7888                     330 00102$:
                            331 ;src/hud.c:126: u8 digit =  (score % 10);
   7888 21 0A 00      [10]  332 	ld	hl, #0x000a
   788B E5            [11]  333 	push	hl
   788C DD 6E 04      [19]  334 	ld	l,4 (ix)
   788F DD 66 05      [19]  335 	ld	h,5 (ix)
   7892 E5            [11]  336 	push	hl
   7893 CD 9E 80      [17]  337 	call	__moduint
   7896 F1            [10]  338 	pop	af
   7897 F1            [10]  339 	pop	af
   7898 4D            [ 4]  340 	ld	c, l
                            341 ;src/hud.c:128: cpct_drawSprite(digits[digit], (svmem - (2 * (i+1))), SP_FONT_CHAR_W, SP_FONT_CHAR_H);
   7899 DD 6E FF      [19]  342 	ld	l, -1 (ix)
   789C 26 00         [ 7]  343 	ld	h, #0x00
   789E 23            [ 6]  344 	inc	hl
   789F 29            [11]  345 	add	hl, hl
   78A0 DD 7E FD      [19]  346 	ld	a, -3 (ix)
   78A3 95            [ 4]  347 	sub	a, l
   78A4 5F            [ 4]  348 	ld	e, a
   78A5 DD 7E FE      [19]  349 	ld	a, -2 (ix)
   78A8 9C            [ 4]  350 	sbc	a, h
   78A9 57            [ 4]  351 	ld	d, a
   78AA 69            [ 4]  352 	ld	l, c
   78AB 26 00         [ 7]  353 	ld	h, #0x00
   78AD 29            [11]  354 	add	hl, hl
   78AE 01 1B 88      [10]  355 	ld	bc, #_digits
   78B1 09            [11]  356 	add	hl, bc
   78B2 4E            [ 7]  357 	ld	c, (hl)
   78B3 23            [ 6]  358 	inc	hl
   78B4 46            [ 7]  359 	ld	b, (hl)
   78B5 21 02 08      [10]  360 	ld	hl, #0x0802
   78B8 E5            [11]  361 	push	hl
   78B9 D5            [11]  362 	push	de
   78BA C5            [11]  363 	push	bc
   78BB CD 5E 7F      [17]  364 	call	_cpct_drawSprite
                            365 ;src/hud.c:129: score /= 10;
   78BE 21 0A 00      [10]  366 	ld	hl, #0x000a
   78C1 E5            [11]  367 	push	hl
   78C2 DD 6E 04      [19]  368 	ld	l,4 (ix)
   78C5 DD 66 05      [19]  369 	ld	h,5 (ix)
   78C8 E5            [11]  370 	push	hl
   78C9 CD 84 7E      [17]  371 	call	__divuint
   78CC F1            [10]  372 	pop	af
   78CD F1            [10]  373 	pop	af
   78CE DD 75 04      [19]  374 	ld	4 (ix), l
   78D1 DD 74 05      [19]  375 	ld	5 (ix), h
                            376 ;src/hud.c:124: for (i = 0; i < 5; i++)
   78D4 DD 34 FF      [23]  377 	inc	-1 (ix)
   78D7 DD 7E FF      [19]  378 	ld	a, -1 (ix)
   78DA D6 05         [ 7]  379 	sub	a, #0x05
   78DC 38 AA         [12]  380 	jr	C,00102$
   78DE DD F9         [10]  381 	ld	sp, ix
   78E0 DD E1         [14]  382 	pop	ix
   78E2 C9            [10]  383 	ret
                            384 ;src/hud.c:135: void hud_draw_lives(u8 row)
                            385 ;	---------------------------------
                            386 ; Function hud_draw_lives
                            387 ; ---------------------------------
   78E3                     388 _hud_draw_lives::
   78E3 DD E5         [15]  389 	push	ix
   78E5 DD 21 00 00   [14]  390 	ld	ix,#0
   78E9 DD 39         [15]  391 	add	ix,sp
   78EB F5            [11]  392 	push	af
   78EC 3B            [ 6]  393 	dec	sp
                            394 ;src/hud.c:137: u8 num = current_level_num + 1;
   78ED 3A 13 88      [13]  395 	ld	a,(#_current_level_num + 0)
   78F0 3C            [ 4]  396 	inc	a
   78F1 DD 77 FD      [19]  397 	ld	-3 (ix), a
                            398 ;src/hud.c:138: u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, 74, row);
   78F4 DD 56 04      [19]  399 	ld	d, 4 (ix)
   78F7 1E 4A         [ 7]  400 	ld	e,#0x4a
   78F9 D5            [11]  401 	push	de
   78FA 21 00 C0      [10]  402 	ld	hl, #0xc000
   78FD E5            [11]  403 	push	hl
   78FE CD C9 82      [17]  404 	call	_cpct_getScreenPtr
   7901 DD 75 FE      [19]  405 	ld	-2 (ix), l
   7904 DD 74 FF      [19]  406 	ld	-1 (ix), h
                            407 ;src/hud.c:141: u8 digit =  (num % 10);
   7907 3E 0A         [ 7]  408 	ld	a, #0x0a
   7909 F5            [11]  409 	push	af
   790A 33            [ 6]  410 	inc	sp
   790B DD 7E FD      [19]  411 	ld	a, -3 (ix)
   790E F5            [11]  412 	push	af
   790F 33            [ 6]  413 	inc	sp
   7910 CD 92 80      [17]  414 	call	__moduchar
   7913 F1            [10]  415 	pop	af
   7914 4D            [ 4]  416 	ld	c, l
                            417 ;src/hud.c:142: cpct_drawSprite(digits[digit], svmem , SP_FONT_CHAR_W, SP_FONT_CHAR_H);
   7915 DD 5E FE      [19]  418 	ld	e,-2 (ix)
   7918 DD 56 FF      [19]  419 	ld	d,-1 (ix)
   791B 69            [ 4]  420 	ld	l, c
   791C 26 00         [ 7]  421 	ld	h, #0x00
   791E 29            [11]  422 	add	hl, hl
   791F 01 1B 88      [10]  423 	ld	bc, #_digits
   7922 09            [11]  424 	add	hl, bc
   7923 4E            [ 7]  425 	ld	c, (hl)
   7924 23            [ 6]  426 	inc	hl
   7925 46            [ 7]  427 	ld	b, (hl)
   7926 21 02 08      [10]  428 	ld	hl, #0x0802
   7929 E5            [11]  429 	push	hl
   792A D5            [11]  430 	push	de
   792B C5            [11]  431 	push	bc
   792C CD 5E 7F      [17]  432 	call	_cpct_drawSprite
                            433 ;src/hud.c:144: digit =  ((num / 10) % 10);
   792F 3E 0A         [ 7]  434 	ld	a, #0x0a
   7931 F5            [11]  435 	push	af
   7932 33            [ 6]  436 	inc	sp
   7933 DD 7E FD      [19]  437 	ld	a, -3 (ix)
   7936 F5            [11]  438 	push	af
   7937 33            [ 6]  439 	inc	sp
   7938 CD 8C 7E      [17]  440 	call	__divuchar
   793B F1            [10]  441 	pop	af
   793C 45            [ 4]  442 	ld	b, l
   793D 3E 0A         [ 7]  443 	ld	a, #0x0a
   793F F5            [11]  444 	push	af
   7940 33            [ 6]  445 	inc	sp
   7941 C5            [11]  446 	push	bc
   7942 33            [ 6]  447 	inc	sp
   7943 CD 92 80      [17]  448 	call	__moduchar
   7946 F1            [10]  449 	pop	af
                            450 ;src/hud.c:145: cpct_drawSprite(digits[digit], svmem - 2 , SP_FONT_CHAR_W, SP_FONT_CHAR_H);
   7947 DD 5E FE      [19]  451 	ld	e, -2 (ix)
   794A DD 56 FF      [19]  452 	ld	d, -1 (ix)
   794D 1B            [ 6]  453 	dec	de
   794E 1B            [ 6]  454 	dec	de
   794F 26 00         [ 7]  455 	ld	h, #0x00
   7951 29            [11]  456 	add	hl, hl
   7952 01 1B 88      [10]  457 	ld	bc, #_digits
   7955 09            [11]  458 	add	hl, bc
   7956 4E            [ 7]  459 	ld	c, (hl)
   7957 23            [ 6]  460 	inc	hl
   7958 46            [ 7]  461 	ld	b, (hl)
   7959 21 02 08      [10]  462 	ld	hl, #0x0802
   795C E5            [11]  463 	push	hl
   795D D5            [11]  464 	push	de
   795E C5            [11]  465 	push	bc
   795F CD 5E 7F      [17]  466 	call	_cpct_drawSprite
   7962 DD F9         [10]  467 	ld	sp, ix
   7964 DD E1         [14]  468 	pop	ix
   7966 C9            [10]  469 	ret
                            470 	.area _CODE
                            471 	.area _INITIALIZER
                            472 	.area _CABS (ABS)
