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
                             13 	.globl _cpct_drawSpriteMaskedAlignedTable
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
   8081                      35 _batY::
   8081                      36 	.ds 1
   8082                      37 _batX::
   8082                      38 	.ds 1
   8083                      39 _oldBatX::
   8083                      40 	.ds 1
   8084                      41 _batW::
   8084                      42 	.ds 1
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
                             63 ;src/bat.c:35: void bat_initialize() {
                             64 ;	---------------------------------
                             65 ; Function bat_initialize
                             66 ; ---------------------------------
   6BE1                      67 _bat_initialize::
                             68 ;src/bat.c:36: batW = 8;
   6BE1 21 84 80      [10]   69 	ld	hl,#_batW + 0
   6BE4 36 08         [10]   70 	ld	(hl), #0x08
                             71 ;src/bat.c:37: batX = (PLAY_AREA_WIDTH- batW) / 2;
   6BE6 21 82 80      [10]   72 	ld	hl,#_batX + 0
   6BE9 36 16         [10]   73 	ld	(hl), #0x16
                             74 ;src/bat.c:38: batY = PLAY_AREA_HEIGHT - BAT_HEIGHT_PIXELS - BAT_BOTTOM_OFFSET_PIXELS;
   6BEB 21 81 80      [10]   75 	ld	hl,#_batY + 0
   6BEE 36 B0         [10]   76 	ld	(hl), #0xb0
                             77 ;src/bat.c:39: oldBatX = batX;
   6BF0 21 83 80      [10]   78 	ld	hl,#_oldBatX + 0
   6BF3 36 16         [10]   79 	ld	(hl), #0x16
   6BF5 C9            [10]   80 	ret
                             81 ;src/bat.c:43: void bat_update() {
                             82 ;	---------------------------------
                             83 ; Function bat_update
                             84 ; ---------------------------------
   6BF6                      85 _bat_update::
                             86 ;src/bat.c:46: oldBatX = batX;
   6BF6 21 82 80      [10]   87 	ld	hl,#_batX + 0
   6BF9 4E            [ 7]   88 	ld	c, (hl)
                             89 ;src/bat.c:44: if (key_left_is_pressed) {
   6BFA 3A 73 80      [13]   90 	ld	a,(#_key_left_is_pressed + 0)
   6BFD B7            [ 4]   91 	or	a, a
   6BFE 28 0E         [12]   92 	jr	Z,00108$
                             93 ;src/bat.c:45: if (batX > 0) {
   6C00 3A 82 80      [13]   94 	ld	a,(#_batX + 0)
   6C03 B7            [ 4]   95 	or	a, a
   6C04 C8            [11]   96 	ret	Z
                             97 ;src/bat.c:46: oldBatX = batX;
   6C05 21 83 80      [10]   98 	ld	hl,#_oldBatX + 0
   6C08 71            [ 7]   99 	ld	(hl), c
                            100 ;src/bat.c:47: batX--;
   6C09 21 82 80      [10]  101 	ld	hl, #_batX+0
   6C0C 35            [11]  102 	dec	(hl)
   6C0D C9            [10]  103 	ret
   6C0E                     104 00108$:
                            105 ;src/bat.c:49: } else if (key_right_is_pressed) {
   6C0E 3A 74 80      [13]  106 	ld	a,(#_key_right_is_pressed + 0)
   6C11 B7            [ 4]  107 	or	a, a
   6C12 C8            [11]  108 	ret	Z
                            109 ;src/bat.c:50: if (batX < PLAY_AREA_WIDTH - batW) {
   6C13 21 84 80      [10]  110 	ld	hl,#_batW + 0
   6C16 5E            [ 7]  111 	ld	e, (hl)
   6C17 16 00         [ 7]  112 	ld	d, #0x00
   6C19 3E 34         [ 7]  113 	ld	a, #0x34
   6C1B 93            [ 4]  114 	sub	a, e
   6C1C 47            [ 4]  115 	ld	b, a
   6C1D 3E 00         [ 7]  116 	ld	a, #0x00
   6C1F 9A            [ 4]  117 	sbc	a, d
   6C20 5F            [ 4]  118 	ld	e, a
   6C21 3A 82 80      [13]  119 	ld	a,(#_batX + 0)
   6C24 16 00         [ 7]  120 	ld	d, #0x00
   6C26 90            [ 4]  121 	sub	a, b
   6C27 7A            [ 4]  122 	ld	a, d
   6C28 9B            [ 4]  123 	sbc	a, e
   6C29 E2 2E 6C      [10]  124 	jp	PO, 00128$
   6C2C EE 80         [ 7]  125 	xor	a, #0x80
   6C2E                     126 00128$:
   6C2E F0            [11]  127 	ret	P
                            128 ;src/bat.c:51: oldBatX = batX;
   6C2F 21 83 80      [10]  129 	ld	hl,#_oldBatX + 0
   6C32 71            [ 7]  130 	ld	(hl), c
                            131 ;src/bat.c:52: batX++;
   6C33 21 82 80      [10]  132 	ld	hl, #_batX+0
   6C36 34            [11]  133 	inc	(hl)
   6C37 C9            [10]  134 	ret
                            135 ;src/bat.c:57: void bat_restore_background() {
                            136 ;	---------------------------------
                            137 ; Function bat_restore_background
                            138 ; ---------------------------------
   6C38                     139 _bat_restore_background::
                            140 ;src/bat.c:58: background_restore_world_coords(oldBatX, batY, batW, BAT_HEIGHT_PIXELS);
   6C38 21 81 80      [10]  141 	ld	hl,#_batY + 0
   6C3B 5E            [ 7]  142 	ld	e, (hl)
   6C3C 16 00         [ 7]  143 	ld	d, #0x00
   6C3E 21 83 80      [10]  144 	ld	hl,#_oldBatX + 0
   6C41 4E            [ 7]  145 	ld	c, (hl)
   6C42 06 00         [ 7]  146 	ld	b, #0x00
   6C44 3E 08         [ 7]  147 	ld	a, #0x08
   6C46 F5            [11]  148 	push	af
   6C47 33            [ 6]  149 	inc	sp
   6C48 3A 84 80      [13]  150 	ld	a, (_batW)
   6C4B F5            [11]  151 	push	af
   6C4C 33            [ 6]  152 	inc	sp
   6C4D D5            [11]  153 	push	de
   6C4E C5            [11]  154 	push	bc
   6C4F CD 3C 67      [17]  155 	call	_background_restore_world_coords
   6C52 21 06 00      [10]  156 	ld	hl, #6
   6C55 39            [11]  157 	add	hl, sp
   6C56 F9            [ 6]  158 	ld	sp, hl
   6C57 C9            [10]  159 	ret
                            160 ;src/bat.c:61: void bat_draw()
                            161 ;	---------------------------------
                            162 ; Function bat_draw
                            163 ; ---------------------------------
   6C58                     164 _bat_draw::
                            165 ;src/bat.c:65: svmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(batX), W_2_S_Y(batY));
   6C58 3A 81 80      [13]  166 	ld	a,(#_batY + 0)
   6C5B C6 08         [ 7]  167 	add	a, #0x08
   6C5D 57            [ 4]  168 	ld	d, a
   6C5E 3A 82 80      [13]  169 	ld	a,(#_batX + 0)
   6C61 C6 0C         [ 7]  170 	add	a, #0x0c
   6C63 5F            [ 4]  171 	ld	e,a
   6C64 D5            [11]  172 	push	de
   6C65 21 00 C0      [10]  173 	ld	hl, #0xc000
   6C68 E5            [11]  174 	push	hl
   6C69 CD 48 7B      [17]  175 	call	_cpct_getScreenPtr
   6C6C 4D            [ 4]  176 	ld	c, l
   6C6D 44            [ 4]  177 	ld	b, h
                            178 ;src/bat.c:68: SP_BAT_LEFT_H, g_masktable);
                            179 ;src/bat.c:67: cpct_drawSpriteMaskedAlignedTable(sp_bat_left, svmem, SP_BAT_LEFT_W, 
   6C6E 59            [ 4]  180 	ld	e, c
   6C6F 50            [ 4]  181 	ld	d, b
   6C70 C5            [11]  182 	push	bc
   6C71 21 00 01      [10]  183 	ld	hl, #_g_masktable
   6C74 E5            [11]  184 	push	hl
   6C75 21 02 08      [10]  185 	ld	hl, #0x0802
   6C78 E5            [11]  186 	push	hl
   6C79 D5            [11]  187 	push	de
   6C7A 21 49 66      [10]  188 	ld	hl, #_sp_bat_left
   6C7D E5            [11]  189 	push	hl
   6C7E CD 0D 7B      [17]  190 	call	_cpct_drawSpriteMaskedAlignedTable
   6C81 C1            [10]  191 	pop	bc
                            192 ;src/bat.c:70: cpct_drawSprite(sp_bat_mid, svmem + BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
   6C82 59            [ 4]  193 	ld	e, c
   6C83 50            [ 4]  194 	ld	d, b
   6C84 13            [ 6]  195 	inc	de
   6C85 13            [ 6]  196 	inc	de
   6C86 C5            [11]  197 	push	bc
   6C87 21 02 08      [10]  198 	ld	hl, #0x0802
   6C8A E5            [11]  199 	push	hl
   6C8B D5            [11]  200 	push	de
   6C8C 21 39 66      [10]  201 	ld	hl, #_sp_bat_mid
   6C8F E5            [11]  202 	push	hl
   6C90 CD F7 77      [17]  203 	call	_cpct_drawSprite
   6C93 C1            [10]  204 	pop	bc
                            205 ;src/bat.c:71: cpct_drawSprite(sp_bat_mid, svmem + 2*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
   6C94 21 04 00      [10]  206 	ld	hl, #0x0004
   6C97 09            [11]  207 	add	hl, bc
   6C98 C5            [11]  208 	push	bc
   6C99 11 02 08      [10]  209 	ld	de, #0x0802
   6C9C D5            [11]  210 	push	de
   6C9D E5            [11]  211 	push	hl
   6C9E 21 39 66      [10]  212 	ld	hl, #_sp_bat_mid
   6CA1 E5            [11]  213 	push	hl
   6CA2 CD F7 77      [17]  214 	call	_cpct_drawSprite
   6CA5 C1            [10]  215 	pop	bc
                            216 ;src/bat.c:74: SP_BAT_RIGHT_H, g_masktable);
   6CA6 11 00 01      [10]  217 	ld	de, #_g_masktable
                            218 ;src/bat.c:73: cpct_drawSpriteMaskedAlignedTable(sp_bat_right, svmem + 3*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_RIGHT_W, 
   6CA9 21 06 00      [10]  219 	ld	hl, #0x0006
   6CAC 09            [11]  220 	add	hl, bc
   6CAD 01 29 66      [10]  221 	ld	bc, #_sp_bat_right+0
   6CB0 D5            [11]  222 	push	de
   6CB1 11 02 08      [10]  223 	ld	de, #0x0802
   6CB4 D5            [11]  224 	push	de
   6CB5 E5            [11]  225 	push	hl
   6CB6 C5            [11]  226 	push	bc
   6CB7 CD 0D 7B      [17]  227 	call	_cpct_drawSpriteMaskedAlignedTable
   6CBA C9            [10]  228 	ret
                            229 ;src/bat.c:81: BounceHits bat_bounce_ball(Ball * ball, i16 at_x, i16 at_y) 
                            230 ;	---------------------------------
                            231 ; Function bat_bounce_ball
                            232 ; ---------------------------------
   6CBB                     233 _bat_bounce_ball::
   6CBB DD E5         [15]  234 	push	ix
   6CBD DD 21 00 00   [14]  235 	ld	ix,#0
   6CC1 DD 39         [15]  236 	add	ix,sp
   6CC3 F5            [11]  237 	push	af
   6CC4 F5            [11]  238 	push	af
   6CC5 3B            [ 6]  239 	dec	sp
                            240 ;src/bat.c:83: BounceHits bounces = BOUNCE_NONE;
   6CC6 DD 36 FB 00   [19]  241 	ld	-5 (ix), #0x00
                            242 ;src/bat.c:87: if (ball->dy > 0 &&
   6CCA DD 4E 04      [19]  243 	ld	c,4 (ix)
   6CCD DD 46 05      [19]  244 	ld	b,5 (ix)
   6CD0 69            [ 4]  245 	ld	l, c
   6CD1 60            [ 4]  246 	ld	h, b
   6CD2 11 0B 00      [10]  247 	ld	de, #0x000b
   6CD5 19            [11]  248 	add	hl, de
   6CD6 5E            [ 7]  249 	ld	e, (hl)
   6CD7 23            [ 6]  250 	inc	hl
   6CD8 56            [ 7]  251 	ld	d, (hl)
   6CD9 AF            [ 4]  252 	xor	a, a
   6CDA BB            [ 4]  253 	cp	a, e
   6CDB 9A            [ 4]  254 	sbc	a, d
   6CDC E2 E1 6C      [10]  255 	jp	PO, 00129$
   6CDF EE 80         [ 7]  256 	xor	a, #0x80
   6CE1                     257 00129$:
   6CE1 F2 66 6D      [10]  258 	jp	P, 00102$
                            259 ;src/bat.c:88: (ball->x + BALL_WIDTH > batX && ball->x < batX + batW) &&
   6CE4 69            [ 4]  260 	ld	l, c
   6CE5 60            [ 4]  261 	ld	h, b
   6CE6 23            [ 6]  262 	inc	hl
   6CE7 7E            [ 7]  263 	ld	a, (hl)
   6CE8 DD 77 FE      [19]  264 	ld	-2 (ix), a
   6CEB 23            [ 6]  265 	inc	hl
   6CEC 7E            [ 7]  266 	ld	a, (hl)
   6CED DD 77 FF      [19]  267 	ld	-1 (ix), a
   6CF0 DD 7E FE      [19]  268 	ld	a, -2 (ix)
   6CF3 C6 03         [ 7]  269 	add	a, #0x03
   6CF5 DD 77 FC      [19]  270 	ld	-4 (ix), a
   6CF8 DD 7E FF      [19]  271 	ld	a, -1 (ix)
   6CFB CE 00         [ 7]  272 	adc	a, #0x00
   6CFD DD 77 FD      [19]  273 	ld	-3 (ix), a
   6D00 21 82 80      [10]  274 	ld	hl,#_batX + 0
   6D03 5E            [ 7]  275 	ld	e, (hl)
   6D04 16 00         [ 7]  276 	ld	d, #0x00
   6D06 7B            [ 4]  277 	ld	a, e
   6D07 DD 96 FC      [19]  278 	sub	a, -4 (ix)
   6D0A 7A            [ 4]  279 	ld	a, d
   6D0B DD 9E FD      [19]  280 	sbc	a, -3 (ix)
   6D0E E2 13 6D      [10]  281 	jp	PO, 00130$
   6D11 EE 80         [ 7]  282 	xor	a, #0x80
   6D13                     283 00130$:
   6D13 F2 66 6D      [10]  284 	jp	P, 00102$
   6D16 FD 21 84 80   [14]  285 	ld	iy, #_batW
   6D1A FD 6E 00      [19]  286 	ld	l, 0 (iy)
   6D1D 26 00         [ 7]  287 	ld	h, #0x00
   6D1F 19            [11]  288 	add	hl, de
   6D20 DD 7E FE      [19]  289 	ld	a, -2 (ix)
   6D23 95            [ 4]  290 	sub	a, l
   6D24 DD 7E FF      [19]  291 	ld	a, -1 (ix)
   6D27 9C            [ 4]  292 	sbc	a, h
   6D28 E2 2D 6D      [10]  293 	jp	PO, 00131$
   6D2B EE 80         [ 7]  294 	xor	a, #0x80
   6D2D                     295 00131$:
   6D2D F2 66 6D      [10]  296 	jp	P, 00102$
                            297 ;src/bat.c:89: (ball->y + BALL_HEIGHT > batY && ball->y < batY + SP_BAT_LEFT_H))
   6D30 69            [ 4]  298 	ld	l, c
   6D31 60            [ 4]  299 	ld	h, b
   6D32 23            [ 6]  300 	inc	hl
   6D33 23            [ 6]  301 	inc	hl
   6D34 23            [ 6]  302 	inc	hl
   6D35 4E            [ 7]  303 	ld	c, (hl)
   6D36 23            [ 6]  304 	inc	hl
   6D37 46            [ 7]  305 	ld	b, (hl)
   6D38 21 06 00      [10]  306 	ld	hl, #0x0006
   6D3B 09            [11]  307 	add	hl,bc
   6D3C EB            [ 4]  308 	ex	de,hl
   6D3D FD 21 81 80   [14]  309 	ld	iy, #_batY
   6D41 FD 6E 00      [19]  310 	ld	l, 0 (iy)
   6D44 26 00         [ 7]  311 	ld	h, #0x00
   6D46 7D            [ 4]  312 	ld	a, l
   6D47 93            [ 4]  313 	sub	a, e
   6D48 7C            [ 4]  314 	ld	a, h
   6D49 9A            [ 4]  315 	sbc	a, d
   6D4A E2 4F 6D      [10]  316 	jp	PO, 00132$
   6D4D EE 80         [ 7]  317 	xor	a, #0x80
   6D4F                     318 00132$:
   6D4F F2 66 6D      [10]  319 	jp	P, 00102$
   6D52 11 08 00      [10]  320 	ld	de, #0x0008
   6D55 19            [11]  321 	add	hl, de
   6D56 79            [ 4]  322 	ld	a, c
   6D57 95            [ 4]  323 	sub	a, l
   6D58 78            [ 4]  324 	ld	a, b
   6D59 9C            [ 4]  325 	sbc	a, h
   6D5A E2 5F 6D      [10]  326 	jp	PO, 00133$
   6D5D EE 80         [ 7]  327 	xor	a, #0x80
   6D5F                     328 00133$:
   6D5F F2 66 6D      [10]  329 	jp	P, 00102$
                            330 ;src/bat.c:91: bounces |= BOUNCE_Y;        
   6D62 DD 36 FB 02   [19]  331 	ld	-5 (ix), #0x02
   6D66                     332 00102$:
                            333 ;src/bat.c:94: return bounces;
   6D66 DD 6E FB      [19]  334 	ld	l, -5 (ix)
   6D69 DD F9         [10]  335 	ld	sp, ix
   6D6B DD E1         [14]  336 	pop	ix
   6D6D C9            [10]  337 	ret
                            338 	.area _CODE
                            339 	.area _INITIALIZER
   8085                     340 __xinit__batY:
   8085 00                  341 	.db #0x00	; 0
   8086                     342 __xinit__batX:
   8086 00                  343 	.db #0x00	; 0
   8087                     344 __xinit__oldBatX:
   8087 00                  345 	.db #0x00	; 0
   8088                     346 __xinit__batW:
   8088 00                  347 	.db #0x00	; 0
                            348 	.area _CABS (ABS)
