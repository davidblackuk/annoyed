                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module blocks
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _background_debug_box_wc
                             12 	.globl _cpct_etm_drawTileBox2x4
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _blocks_remaining
                             15 	.globl _block_meta
                             16 	.globl _blocks_initialize
                             17 	.globl _blocks_draw
                             18 	.globl _blocks_restore_background
                             19 	.globl _blocks_bounce_ball
                             20 	.globl _is_ball_colliding_with_block
                             21 	.globl _get_metaData_at
                             22 	.globl _draw_current_blocks
                             23 	.globl _map_blocks_to_meta
                             24 	.globl _plant_tile_meta
                             25 ;--------------------------------------------------------
                             26 ; special function registers
                             27 ;--------------------------------------------------------
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _DATA
   83C6                      32 _block_meta::
   83C6                      33 	.ds 1092
   880A                      34 _blocks_remaining::
   880A                      35 	.ds 2
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
                             60 ;src/blocks.c:38: void blocks_initialize(u8 is_restart)
                             61 ;	---------------------------------
                             62 ; Function blocks_initialize
                             63 ; ---------------------------------
   7059                      64 _blocks_initialize::
                             65 ;src/blocks.c:40: if (!is_restart)
   7059 21 02 00      [10]   66 	ld	hl, #2+0
   705C 39            [11]   67 	add	hl, sp
   705D 7E            [ 7]   68 	ld	a, (hl)
   705E B7            [ 4]   69 	or	a, a
   705F C2 FD 72      [10]   70 	jp	NZ,_draw_current_blocks
                             71 ;src/blocks.c:43: map_blocks_to_meta();
   7062 CD 85 73      [17]   72 	call	_map_blocks_to_meta
                             73 ;src/blocks.c:48: draw_current_blocks();
   7065 C3 FD 72      [10]   74 	jp  _draw_current_blocks
                             75 ;src/blocks.c:51: void blocks_draw()
                             76 ;	---------------------------------
                             77 ; Function blocks_draw
                             78 ; ---------------------------------
   7068                      79 _blocks_draw::
                             80 ;src/blocks.c:53: }
   7068 C9            [10]   81 	ret
                             82 ;src/blocks.c:55: void blocks_restore_background()
                             83 ;	---------------------------------
                             84 ; Function blocks_restore_background
                             85 ; ---------------------------------
   7069                      86 _blocks_restore_background::
                             87 ;src/blocks.c:57: }
   7069 C9            [10]   88 	ret
                             89 ;src/blocks.c:59: BounceHits blocks_bounce_ball(Ball *ball, i16 at_x, i16 at_y)
                             90 ;	---------------------------------
                             91 ; Function blocks_bounce_ball
                             92 ; ---------------------------------
   706A                      93 _blocks_bounce_ball::
   706A DD E5         [15]   94 	push	ix
   706C DD 21 00 00   [14]   95 	ld	ix,#0
   7070 DD 39         [15]   96 	add	ix,sp
   7072 F5            [11]   97 	push	af
   7073 3B            [ 6]   98 	dec	sp
                             99 ;src/blocks.c:66: if (W_2_S_Y(at_y) < BRICKS_MAP_PIXEL_TOP_SCR ||
   7074 DD 7E 08      [19]  100 	ld	a, 8 (ix)
   7077 C6 08         [ 7]  101 	add	a, #0x08
   7079 DD 77 FE      [19]  102 	ld	-2 (ix), a
   707C DD 7E 09      [19]  103 	ld	a, 9 (ix)
   707F CE 00         [ 7]  104 	adc	a, #0x00
   7081 DD 77 FF      [19]  105 	ld	-1 (ix), a
   7084 DD 7E FE      [19]  106 	ld	a, -2 (ix)
   7087 D6 18         [ 7]  107 	sub	a, #0x18
   7089 DD 7E FF      [19]  108 	ld	a, -1 (ix)
   708C 17            [ 4]  109 	rla
   708D 3F            [ 4]  110 	ccf
   708E 1F            [ 4]  111 	rra
   708F DE 80         [ 7]  112 	sbc	a, #0x80
   7091 38 12         [12]  113 	jr	C,00101$
                            114 ;src/blocks.c:67: W_2_S_Y(at_y) > BRICKS_MAP_PIXEL_BOTTOM_SCR)
   7093 3E 88         [ 7]  115 	ld	a, #0x88
   7095 DD BE FE      [19]  116 	cp	a, -2 (ix)
   7098 3E 00         [ 7]  117 	ld	a, #0x00
   709A DD 9E FF      [19]  118 	sbc	a, -1 (ix)
   709D E2 A2 70      [10]  119 	jp	PO, 00124$
   70A0 EE 80         [ 7]  120 	xor	a, #0x80
   70A2                     121 00124$:
   70A2 F2 AA 70      [10]  122 	jp	P, 00102$
   70A5                     123 00101$:
                            124 ;src/blocks.c:69: return BOUNCE_NONE;
   70A5 2E 00         [ 7]  125 	ld	l, #0x00
   70A7 C3 00 72      [10]  126 	jp	00110$
   70AA                     127 00102$:
                            128 ;src/blocks.c:72: if (ball->dy < 0)
   70AA DD 7E 04      [19]  129 	ld	a, 4 (ix)
   70AD DD 77 FE      [19]  130 	ld	-2 (ix), a
   70B0 DD 7E 05      [19]  131 	ld	a, 5 (ix)
   70B3 DD 77 FF      [19]  132 	ld	-1 (ix), a
   70B6 DD 6E FE      [19]  133 	ld	l,-2 (ix)
   70B9 DD 66 FF      [19]  134 	ld	h,-1 (ix)
   70BC 11 0B 00      [10]  135 	ld	de, #0x000b
   70BF 19            [11]  136 	add	hl, de
   70C0 7E            [ 7]  137 	ld	a, (hl)
   70C1 23            [ 6]  138 	inc	hl
   70C2 66            [ 7]  139 	ld	h, (hl)
                            140 ;src/blocks.c:76: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y, BOUNCE_Y);
   70C3 DD 4E 06      [19]  141 	ld	c,6 (ix)
   70C6 DD 46 07      [19]  142 	ld	b,7 (ix)
   70C9 03            [ 6]  143 	inc	bc
   70CA 03            [ 6]  144 	inc	bc
   70CB 03            [ 6]  145 	inc	bc
                            146 ;src/blocks.c:81: bounces |= is_ball_colliding_with_block(ball, at_x, at_y + 6, BOUNCE_Y);
   70CC DD 7E 08      [19]  147 	ld	a, 8 (ix)
   70CF C6 06         [ 7]  148 	add	a, #0x06
   70D1 5F            [ 4]  149 	ld	e, a
   70D2 DD 7E 09      [19]  150 	ld	a, 9 (ix)
   70D5 CE 00         [ 7]  151 	adc	a, #0x00
   70D7 57            [ 4]  152 	ld	d, a
                            153 ;src/blocks.c:72: if (ball->dy < 0)
   70D8 CB 7C         [ 8]  154 	bit	7, h
   70DA 28 4E         [12]  155 	jr	Z,00105$
                            156 ;src/blocks.c:75: bounces |= is_ball_colliding_with_block(ball, at_x, at_y, BOUNCE_Y);
   70DC C5            [11]  157 	push	bc
   70DD D5            [11]  158 	push	de
   70DE 3E 02         [ 7]  159 	ld	a, #0x02
   70E0 F5            [11]  160 	push	af
   70E1 33            [ 6]  161 	inc	sp
   70E2 DD 6E 08      [19]  162 	ld	l,8 (ix)
   70E5 DD 66 09      [19]  163 	ld	h,9 (ix)
   70E8 E5            [11]  164 	push	hl
   70E9 DD 6E 06      [19]  165 	ld	l,6 (ix)
   70EC DD 66 07      [19]  166 	ld	h,7 (ix)
   70EF E5            [11]  167 	push	hl
   70F0 DD 6E FE      [19]  168 	ld	l,-2 (ix)
   70F3 DD 66 FF      [19]  169 	ld	h,-1 (ix)
   70F6 E5            [11]  170 	push	hl
   70F7 CD 05 72      [17]  171 	call	_is_ball_colliding_with_block
   70FA F1            [10]  172 	pop	af
   70FB F1            [10]  173 	pop	af
   70FC F1            [10]  174 	pop	af
   70FD 33            [ 6]  175 	inc	sp
   70FE D1            [10]  176 	pop	de
   70FF C1            [10]  177 	pop	bc
   7100 DD 75 FD      [19]  178 	ld	-3 (ix), l
                            179 ;src/blocks.c:76: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y, BOUNCE_Y);
   7103 C5            [11]  180 	push	bc
   7104 D5            [11]  181 	push	de
   7105 3E 02         [ 7]  182 	ld	a, #0x02
   7107 F5            [11]  183 	push	af
   7108 33            [ 6]  184 	inc	sp
   7109 DD 6E 08      [19]  185 	ld	l,8 (ix)
   710C DD 66 09      [19]  186 	ld	h,9 (ix)
   710F E5            [11]  187 	push	hl
   7110 C5            [11]  188 	push	bc
   7111 DD 6E 04      [19]  189 	ld	l,4 (ix)
   7114 DD 66 05      [19]  190 	ld	h,5 (ix)
   7117 E5            [11]  191 	push	hl
   7118 CD 05 72      [17]  192 	call	_is_ball_colliding_with_block
   711B F1            [10]  193 	pop	af
   711C F1            [10]  194 	pop	af
   711D F1            [10]  195 	pop	af
   711E 33            [ 6]  196 	inc	sp
   711F D1            [10]  197 	pop	de
   7120 C1            [10]  198 	pop	bc
   7121 DD 7E FD      [19]  199 	ld	a, -3 (ix)
   7124 B5            [ 4]  200 	or	a, l
   7125 DD 77 FD      [19]  201 	ld	-3 (ix), a
   7128 18 3D         [12]  202 	jr	00106$
   712A                     203 00105$:
                            204 ;src/blocks.c:81: bounces |= is_ball_colliding_with_block(ball, at_x, at_y + 6, BOUNCE_Y);
   712A C5            [11]  205 	push	bc
   712B D5            [11]  206 	push	de
   712C 3E 02         [ 7]  207 	ld	a, #0x02
   712E F5            [11]  208 	push	af
   712F 33            [ 6]  209 	inc	sp
   7130 D5            [11]  210 	push	de
   7131 DD 6E 06      [19]  211 	ld	l,6 (ix)
   7134 DD 66 07      [19]  212 	ld	h,7 (ix)
   7137 E5            [11]  213 	push	hl
   7138 DD 6E FE      [19]  214 	ld	l,-2 (ix)
   713B DD 66 FF      [19]  215 	ld	h,-1 (ix)
   713E E5            [11]  216 	push	hl
   713F CD 05 72      [17]  217 	call	_is_ball_colliding_with_block
   7142 F1            [10]  218 	pop	af
   7143 F1            [10]  219 	pop	af
   7144 F1            [10]  220 	pop	af
   7145 33            [ 6]  221 	inc	sp
   7146 D1            [10]  222 	pop	de
   7147 C1            [10]  223 	pop	bc
                            224 ;src/blocks.c:82: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y + 6, BOUNCE_Y);
   7148 E5            [11]  225 	push	hl
   7149 C5            [11]  226 	push	bc
   714A D5            [11]  227 	push	de
   714B 3E 02         [ 7]  228 	ld	a, #0x02
   714D F5            [11]  229 	push	af
   714E 33            [ 6]  230 	inc	sp
   714F D5            [11]  231 	push	de
   7150 C5            [11]  232 	push	bc
   7151 DD 6E 04      [19]  233 	ld	l,4 (ix)
   7154 DD 66 05      [19]  234 	ld	h,5 (ix)
   7157 E5            [11]  235 	push	hl
   7158 CD 05 72      [17]  236 	call	_is_ball_colliding_with_block
   715B F1            [10]  237 	pop	af
   715C F1            [10]  238 	pop	af
   715D F1            [10]  239 	pop	af
   715E 33            [ 6]  240 	inc	sp
   715F 7D            [ 4]  241 	ld	a, l
   7160 D1            [10]  242 	pop	de
   7161 C1            [10]  243 	pop	bc
   7162 E1            [10]  244 	pop	hl
   7163 B5            [ 4]  245 	or	a, l
   7164 DD 77 FD      [19]  246 	ld	-3 (ix), a
   7167                     247 00106$:
                            248 ;src/blocks.c:85: if (ball->dx < 0)
   7167 DD 6E FE      [19]  249 	ld	l,-2 (ix)
   716A DD 66 FF      [19]  250 	ld	h,-1 (ix)
   716D C5            [11]  251 	push	bc
   716E 01 09 00      [10]  252 	ld	bc, #0x0009
   7171 09            [11]  253 	add	hl, bc
   7172 C1            [10]  254 	pop	bc
   7173 7E            [ 7]  255 	ld	a, (hl)
   7174 23            [ 6]  256 	inc	hl
   7175 CB 7E         [12]  257 	bit	7, (hl)
   7177 28 49         [12]  258 	jr	Z,00108$
                            259 ;src/blocks.c:88: bounces |= is_ball_colliding_with_block(ball, at_x, at_y, BOUNCE_X);
   7179 D5            [11]  260 	push	de
   717A 3E 01         [ 7]  261 	ld	a, #0x01
   717C F5            [11]  262 	push	af
   717D 33            [ 6]  263 	inc	sp
   717E DD 6E 08      [19]  264 	ld	l,8 (ix)
   7181 DD 66 09      [19]  265 	ld	h,9 (ix)
   7184 E5            [11]  266 	push	hl
   7185 DD 6E 06      [19]  267 	ld	l,6 (ix)
   7188 DD 66 07      [19]  268 	ld	h,7 (ix)
   718B E5            [11]  269 	push	hl
   718C DD 6E 04      [19]  270 	ld	l,4 (ix)
   718F DD 66 05      [19]  271 	ld	h,5 (ix)
   7192 E5            [11]  272 	push	hl
   7193 CD 05 72      [17]  273 	call	_is_ball_colliding_with_block
   7196 F1            [10]  274 	pop	af
   7197 F1            [10]  275 	pop	af
   7198 F1            [10]  276 	pop	af
   7199 33            [ 6]  277 	inc	sp
   719A D1            [10]  278 	pop	de
   719B DD 7E FD      [19]  279 	ld	a, -3 (ix)
   719E B5            [ 4]  280 	or	a, l
   719F DD 77 FE      [19]  281 	ld	-2 (ix), a
                            282 ;src/blocks.c:89: bounces |= is_ball_colliding_with_block(ball, at_x, at_y + 6, BOUNCE_X);
   71A2 3E 01         [ 7]  283 	ld	a, #0x01
   71A4 F5            [11]  284 	push	af
   71A5 33            [ 6]  285 	inc	sp
   71A6 D5            [11]  286 	push	de
   71A7 DD 6E 06      [19]  287 	ld	l,6 (ix)
   71AA DD 66 07      [19]  288 	ld	h,7 (ix)
   71AD E5            [11]  289 	push	hl
   71AE DD 6E 04      [19]  290 	ld	l,4 (ix)
   71B1 DD 66 05      [19]  291 	ld	h,5 (ix)
   71B4 E5            [11]  292 	push	hl
   71B5 CD 05 72      [17]  293 	call	_is_ball_colliding_with_block
   71B8 F1            [10]  294 	pop	af
   71B9 F1            [10]  295 	pop	af
   71BA F1            [10]  296 	pop	af
   71BB 33            [ 6]  297 	inc	sp
   71BC DD 7E FE      [19]  298 	ld	a, -2 (ix)
   71BF B5            [ 4]  299 	or	a, l
   71C0 18 3D         [12]  300 	jr	00109$
   71C2                     301 00108$:
                            302 ;src/blocks.c:94: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y, BOUNCE_X);
   71C2 C5            [11]  303 	push	bc
   71C3 D5            [11]  304 	push	de
   71C4 3E 01         [ 7]  305 	ld	a, #0x01
   71C6 F5            [11]  306 	push	af
   71C7 33            [ 6]  307 	inc	sp
   71C8 DD 6E 08      [19]  308 	ld	l,8 (ix)
   71CB DD 66 09      [19]  309 	ld	h,9 (ix)
   71CE E5            [11]  310 	push	hl
   71CF C5            [11]  311 	push	bc
   71D0 DD 6E 04      [19]  312 	ld	l,4 (ix)
   71D3 DD 66 05      [19]  313 	ld	h,5 (ix)
   71D6 E5            [11]  314 	push	hl
   71D7 CD 05 72      [17]  315 	call	_is_ball_colliding_with_block
   71DA F1            [10]  316 	pop	af
   71DB F1            [10]  317 	pop	af
   71DC F1            [10]  318 	pop	af
   71DD 33            [ 6]  319 	inc	sp
   71DE D1            [10]  320 	pop	de
   71DF C1            [10]  321 	pop	bc
   71E0 DD 7E FD      [19]  322 	ld	a, -3 (ix)
   71E3 B5            [ 4]  323 	or	a, l
   71E4 DD 77 FE      [19]  324 	ld	-2 (ix), a
                            325 ;src/blocks.c:95: bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y + 6, BOUNCE_X);
   71E7 3E 01         [ 7]  326 	ld	a, #0x01
   71E9 F5            [11]  327 	push	af
   71EA 33            [ 6]  328 	inc	sp
   71EB D5            [11]  329 	push	de
   71EC C5            [11]  330 	push	bc
   71ED DD 6E 04      [19]  331 	ld	l,4 (ix)
   71F0 DD 66 05      [19]  332 	ld	h,5 (ix)
   71F3 E5            [11]  333 	push	hl
   71F4 CD 05 72      [17]  334 	call	_is_ball_colliding_with_block
   71F7 F1            [10]  335 	pop	af
   71F8 F1            [10]  336 	pop	af
   71F9 F1            [10]  337 	pop	af
   71FA 33            [ 6]  338 	inc	sp
   71FB DD 7E FE      [19]  339 	ld	a, -2 (ix)
   71FE B5            [ 4]  340 	or	a, l
   71FF                     341 00109$:
                            342 ;src/blocks.c:98: return bounces;
   71FF 6F            [ 4]  343 	ld	l, a
   7200                     344 00110$:
   7200 DD F9         [10]  345 	ld	sp, ix
   7202 DD E1         [14]  346 	pop	ix
   7204 C9            [10]  347 	ret
                            348 ;src/blocks.c:105: BounceHits is_ball_colliding_with_block(Ball *ball, i16 wx, i16 wy, BounceHits bounceType)
                            349 ;	---------------------------------
                            350 ; Function is_ball_colliding_with_block
                            351 ; ---------------------------------
   7205                     352 _is_ball_colliding_with_block::
   7205 DD E5         [15]  353 	push	ix
   7207 DD 21 00 00   [14]  354 	ld	ix,#0
   720B DD 39         [15]  355 	add	ix,sp
                            356 ;src/blocks.c:107: BounceHits bounces = BOUNCE_NONE;
   720D 0E 00         [ 7]  357 	ld	c, #0x00
                            358 ;src/blocks.c:110: meta = get_metaData_at(wx, wy);
   720F C5            [11]  359 	push	bc
   7210 DD 6E 08      [19]  360 	ld	l,8 (ix)
   7213 DD 66 09      [19]  361 	ld	h,9 (ix)
   7216 E5            [11]  362 	push	hl
   7217 DD 6E 06      [19]  363 	ld	l,6 (ix)
   721A DD 66 07      [19]  364 	ld	h,7 (ix)
   721D E5            [11]  365 	push	hl
   721E CD 75 72      [17]  366 	call	_get_metaData_at
   7221 F1            [10]  367 	pop	af
   7222 F1            [10]  368 	pop	af
   7223 EB            [ 4]  369 	ex	de,hl
   7224 C1            [10]  370 	pop	bc
                            371 ;src/blocks.c:111: if (meta)
   7225 7A            [ 4]  372 	ld	a, d
   7226 B3            [ 4]  373 	or	a,e
   7227 28 48         [12]  374 	jr	Z,00107$
                            375 ;src/blocks.c:113: if (meta->remaining_hits != INDESTRUCTABLE) {
   7229 6B            [ 4]  376 	ld	l, e
   722A 62            [ 4]  377 	ld	h, d
   722B 23            [ 6]  378 	inc	hl
   722C 23            [ 6]  379 	inc	hl
   722D 23            [ 6]  380 	inc	hl
   722E 4E            [ 7]  381 	ld	c, (hl)
   722F 79            [ 4]  382 	ld	a, c
   7230 3C            [ 4]  383 	inc	a
   7231 28 14         [12]  384 	jr	Z,00105$
                            385 ;src/blocks.c:114: if (meta->remaining_hits > 1) {
   7233 3E 01         [ 7]  386 	ld	a, #0x01
   7235 91            [ 4]  387 	sub	a, c
   7236 30 04         [12]  388 	jr	NC,00102$
                            389 ;src/blocks.c:115: meta->remaining_hits -= 1;
   7238 0D            [ 4]  390 	dec	c
   7239 71            [ 7]  391 	ld	(hl), c
   723A 18 0B         [12]  392 	jr	00105$
   723C                     393 00102$:
                            394 ;src/blocks.c:117: meta->remaining_hits = 0;
   723C 36 00         [10]  395 	ld	(hl), #0x00
                            396 ;src/blocks.c:118: meta->is_active = 0;
   723E AF            [ 4]  397 	xor	a, a
   723F 12            [ 7]  398 	ld	(de), a
                            399 ;src/blocks.c:119: blocks_remaining -= 1;
   7240 2A 0A 88      [16]  400 	ld	hl, (_blocks_remaining)
   7243 2B            [ 6]  401 	dec	hl
   7244 22 0A 88      [16]  402 	ld	(_blocks_remaining), hl
   7247                     403 00105$:
                            404 ;src/blocks.c:125: (meta->block_tile_y * TILE_H) + 24, 
   7247 D5            [11]  405 	push	de
   7248 FD E1         [14]  406 	pop	iy
   724A FD 6E 05      [19]  407 	ld	l, 5 (iy)
   724D 26 00         [ 7]  408 	ld	h, #0x00
   724F 29            [11]  409 	add	hl, hl
   7250 29            [11]  410 	add	hl, hl
   7251 01 18 00      [10]  411 	ld	bc,#0x0018
   7254 09            [11]  412 	add	hl,bc
   7255 4D            [ 4]  413 	ld	c, l
   7256 44            [ 4]  414 	ld	b, h
                            415 ;src/blocks.c:124: background_debug_box_wc((meta->block_tile_x) * TILE_W,
   7257 D5            [11]  416 	push	de
   7258 FD E1         [14]  417 	pop	iy
   725A FD 6E 04      [19]  418 	ld	l, 4 (iy)
   725D 26 00         [ 7]  419 	ld	h, #0x00
   725F 29            [11]  420 	add	hl, hl
   7260 11 03 06      [10]  421 	ld	de, #0x0603
   7263 D5            [11]  422 	push	de
   7264 C5            [11]  423 	push	bc
   7265 E5            [11]  424 	push	hl
   7266 CD E9 6A      [17]  425 	call	_background_debug_box_wc
   7269 21 06 00      [10]  426 	ld	hl, #6
   726C 39            [11]  427 	add	hl, sp
   726D F9            [ 6]  428 	ld	sp, hl
                            429 ;src/blocks.c:131: bounces = bounceType;
   726E DD 4E 0A      [19]  430 	ld	c, 10 (ix)
   7271                     431 00107$:
                            432 ;src/blocks.c:134: return bounces;
   7271 69            [ 4]  433 	ld	l, c
   7272 DD E1         [14]  434 	pop	ix
   7274 C9            [10]  435 	ret
                            436 ;src/blocks.c:137: BlockMeta *get_metaData_at(i16 wx, i16 wy)
                            437 ;	---------------------------------
                            438 ; Function get_metaData_at
                            439 ; ---------------------------------
   7275                     440 _get_metaData_at::
   7275 DD E5         [15]  441 	push	ix
   7277 DD 21 00 00   [14]  442 	ld	ix,#0
   727B DD 39         [15]  443 	add	ix,sp
                            444 ;src/blocks.c:145: tx = (wx / 2);
   727D DD 5E 04      [19]  445 	ld	e,4 (ix)
   7280 DD 56 05      [19]  446 	ld	d,5 (ix)
   7283 CB 7A         [ 8]  447 	bit	7, d
   7285 28 01         [12]  448 	jr	Z,00108$
   7287 13            [ 6]  449 	inc	de
   7288                     450 00108$:
   7288 CB 2A         [ 8]  451 	sra	d
   728A CB 1B         [ 8]  452 	rr	e
                            453 ;src/blocks.c:149: ty = ((wy) / 4) - 4;
   728C DD 4E 06      [19]  454 	ld	c,6 (ix)
   728F DD 46 07      [19]  455 	ld	b,7 (ix)
   7292 CB 78         [ 8]  456 	bit	7, b
   7294 28 03         [12]  457 	jr	Z,00109$
   7296 03            [ 6]  458 	inc	bc
   7297 03            [ 6]  459 	inc	bc
   7298 03            [ 6]  460 	inc	bc
   7299                     461 00109$:
   7299 CB 28         [ 8]  462 	sra	b
   729B CB 19         [ 8]  463 	rr	c
   729D CB 28         [ 8]  464 	sra	b
   729F CB 19         [ 8]  465 	rr	c
   72A1 79            [ 4]  466 	ld	a, c
   72A2 C6 FC         [ 7]  467 	add	a, #0xfc
   72A4 6F            [ 4]  468 	ld	l, a
   72A5 78            [ 4]  469 	ld	a, b
   72A6 CE FF         [ 7]  470 	adc	a, #0xff
   72A8 67            [ 4]  471 	ld	h, a
                            472 ;src/blocks.c:153: mx = tx / 2;
   72A9 4B            [ 4]  473 	ld	c, e
   72AA 42            [ 4]  474 	ld	b, d
   72AB CB 7A         [ 8]  475 	bit	7, d
   72AD 28 03         [12]  476 	jr	Z,00110$
   72AF 4B            [ 4]  477 	ld	c, e
   72B0 42            [ 4]  478 	ld	b, d
   72B1 03            [ 6]  479 	inc	bc
   72B2                     480 00110$:
   72B2 CB 28         [ 8]  481 	sra	b
   72B4 CB 19         [ 8]  482 	rr	c
                            483 ;src/blocks.c:154: my = ty / 2;
   72B6 5D            [ 4]  484 	ld	e, l
   72B7 54            [ 4]  485 	ld	d, h
   72B8 CB 7C         [ 8]  486 	bit	7, h
   72BA 28 02         [12]  487 	jr	Z,00111$
   72BC EB            [ 4]  488 	ex	de,hl
   72BD 13            [ 6]  489 	inc	de
   72BE                     490 00111$:
   72BE CB 2A         [ 8]  491 	sra	d
   72C0 CB 1B         [ 8]  492 	rr	e
                            493 ;src/blocks.c:158: if ((mx >= BLOCKS_MAP_W / 2) || (my >= BLOCKS_MAP_H / 2))
   72C2 79            [ 4]  494 	ld	a, c
   72C3 D6 0D         [ 7]  495 	sub	a, #0x0d
   72C5 78            [ 4]  496 	ld	a, b
   72C6 17            [ 4]  497 	rla
   72C7 3F            [ 4]  498 	ccf
   72C8 1F            [ 4]  499 	rra
   72C9 DE 80         [ 7]  500 	sbc	a, #0x80
   72CB 30 0B         [12]  501 	jr	NC,00101$
   72CD 7B            [ 4]  502 	ld	a, e
   72CE D6 0E         [ 7]  503 	sub	a, #0x0e
   72D0 7A            [ 4]  504 	ld	a, d
   72D1 17            [ 4]  505 	rla
   72D2 3F            [ 4]  506 	ccf
   72D3 1F            [ 4]  507 	rra
   72D4 DE 80         [ 7]  508 	sbc	a, #0x80
   72D6 38 05         [12]  509 	jr	C,00102$
   72D8                     510 00101$:
                            511 ;src/blocks.c:160: return BOUNCE_NONE;
   72D8 21 00 00      [10]  512 	ld	hl, #0x0000
   72DB 18 1D         [12]  513 	jr	00106$
   72DD                     514 00102$:
                            515 ;src/blocks.c:163: meta = &block_meta[mx][my];
   72DD 69            [ 4]  516 	ld	l, c
   72DE 60            [ 4]  517 	ld	h, b
   72DF 29            [11]  518 	add	hl, hl
   72E0 29            [11]  519 	add	hl, hl
   72E1 09            [11]  520 	add	hl, bc
   72E2 29            [11]  521 	add	hl, hl
   72E3 29            [11]  522 	add	hl, hl
   72E4 09            [11]  523 	add	hl, bc
   72E5 29            [11]  524 	add	hl, hl
   72E6 29            [11]  525 	add	hl, hl
   72E7 01 C6 83      [10]  526 	ld	bc,#_block_meta
   72EA 09            [11]  527 	add	hl,bc
   72EB 4D            [ 4]  528 	ld	c, l
   72EC 44            [ 4]  529 	ld	b, h
   72ED 6B            [ 4]  530 	ld	l, e
   72EE 62            [ 4]  531 	ld	h, d
   72EF 29            [11]  532 	add	hl, hl
   72F0 19            [11]  533 	add	hl, de
   72F1 29            [11]  534 	add	hl, hl
   72F2 09            [11]  535 	add	hl, bc
                            536 ;src/blocks.c:164: if (meta->is_active)
   72F3 7E            [ 7]  537 	ld	a, (hl)
   72F4 B7            [ 4]  538 	or	a, a
                            539 ;src/blocks.c:166: return meta;
   72F5 20 03         [12]  540 	jr	NZ,00106$
                            541 ;src/blocks.c:168: return NULL;
   72F7 21 00 00      [10]  542 	ld	hl, #0x0000
   72FA                     543 00106$:
   72FA DD E1         [14]  544 	pop	ix
   72FC C9            [10]  545 	ret
                            546 ;src/blocks.c:171: void draw_current_blocks()
                            547 ;	---------------------------------
                            548 ; Function draw_current_blocks
                            549 ; ---------------------------------
   72FD                     550 _draw_current_blocks::
   72FD DD E5         [15]  551 	push	ix
   72FF DD 21 00 00   [14]  552 	ld	ix,#0
   7303 DD 39         [15]  553 	add	ix,sp
   7305 F5            [11]  554 	push	af
   7306 3B            [ 6]  555 	dec	sp
                            556 ;src/blocks.c:173: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(0),
   7307 21 0C 18      [10]  557 	ld	hl, #0x180c
   730A E5            [11]  558 	push	hl
   730B 21 00 C0      [10]  559 	ld	hl, #0xc000
   730E E5            [11]  560 	push	hl
   730F CD C9 82      [17]  561 	call	_cpct_getScreenPtr
   7312 EB            [ 4]  562 	ex	de,hl
                            563 ;src/blocks.c:175: for (u8 y = 0; y < BLOCKS_MAP_H / 2; y++)
   7313 0E 00         [ 7]  564 	ld	c, #0x00
   7315                     565 00109$:
                            566 ;src/blocks.c:177: for (u8 x = 0; x < BLOCKS_MAP_W / 2; x++)
   7315 79            [ 4]  567 	ld	a,c
   7316 FE 0E         [ 7]  568 	cp	a,#0x0e
   7318 30 66         [12]  569 	jr	NC,00111$
   731A 87            [ 4]  570 	add	a, a
   731B DD 77 FE      [19]  571 	ld	-2 (ix), a
   731E 79            [ 4]  572 	ld	a, c
   731F 87            [ 4]  573 	add	a, a
   7320 81            [ 4]  574 	add	a, c
   7321 87            [ 4]  575 	add	a, a
   7322 DD 77 FF      [19]  576 	ld	-1 (ix), a
   7325 06 00         [ 7]  577 	ld	b, #0x00
   7327                     578 00106$:
   7327 78            [ 4]  579 	ld	a, b
   7328 D6 0D         [ 7]  580 	sub	a, #0x0d
   732A 30 51         [12]  581 	jr	NC,00110$
                            582 ;src/blocks.c:179: BlockMeta *meta = &block_meta[x][y];
   732C D5            [11]  583 	push	de
   732D 58            [ 4]  584 	ld	e,b
   732E 16 00         [ 7]  585 	ld	d,#0x00
   7330 6B            [ 4]  586 	ld	l, e
   7331 62            [ 4]  587 	ld	h, d
   7332 29            [11]  588 	add	hl, hl
   7333 29            [11]  589 	add	hl, hl
   7334 19            [11]  590 	add	hl, de
   7335 29            [11]  591 	add	hl, hl
   7336 29            [11]  592 	add	hl, hl
   7337 19            [11]  593 	add	hl, de
   7338 29            [11]  594 	add	hl, hl
   7339 29            [11]  595 	add	hl, hl
   733A D1            [10]  596 	pop	de
   733B 3E C6         [ 7]  597 	ld	a, #<(_block_meta)
   733D 85            [ 4]  598 	add	a, l
   733E 6F            [ 4]  599 	ld	l, a
   733F 3E 83         [ 7]  600 	ld	a, #>(_block_meta)
   7341 8C            [ 4]  601 	adc	a, h
   7342 67            [ 4]  602 	ld	h, a
   7343 7D            [ 4]  603 	ld	a, l
   7344 DD 86 FF      [19]  604 	add	a, -1 (ix)
   7347 6F            [ 4]  605 	ld	l, a
   7348 7C            [ 4]  606 	ld	a, h
   7349 CE 00         [ 7]  607 	adc	a, #0x00
   734B 67            [ 4]  608 	ld	h, a
                            609 ;src/blocks.c:181: if (meta->is_active)
   734C 7E            [ 7]  610 	ld	a, (hl)
   734D B7            [ 4]  611 	or	a, a
   734E 28 2A         [12]  612 	jr	Z,00107$
                            613 ;src/blocks.c:184: current_level->blocks_tilemap);
   7350 2A 19 88      [16]  614 	ld	hl, (_current_level)
   7353 23            [ 6]  615 	inc	hl
   7354 23            [ 6]  616 	inc	hl
   7355 7E            [ 7]  617 	ld	a, (hl)
   7356 23            [ 6]  618 	inc	hl
   7357 66            [ 7]  619 	ld	h, (hl)
   7358 6F            [ 4]  620 	ld	l, a
                            621 ;src/blocks.c:183: cpct_etm_drawTileBox2x4(x * 2, y * 2, 2, 2, BLOCKS_MAP_W, pvmem,
   7359 D5            [11]  622 	push	de
   735A FD E1         [14]  623 	pop	iy
   735C 78            [ 4]  624 	ld	a, b
   735D 87            [ 4]  625 	add	a, a
   735E DD 77 FD      [19]  626 	ld	-3 (ix), a
   7361 C5            [11]  627 	push	bc
   7362 D5            [11]  628 	push	de
   7363 E5            [11]  629 	push	hl
   7364 FD E5         [15]  630 	push	iy
   7366 21 02 1A      [10]  631 	ld	hl, #0x1a02
   7369 E5            [11]  632 	push	hl
   736A 3E 02         [ 7]  633 	ld	a, #0x02
   736C F5            [11]  634 	push	af
   736D 33            [ 6]  635 	inc	sp
   736E DD 66 FE      [19]  636 	ld	h, -2 (ix)
   7371 DD 6E FD      [19]  637 	ld	l, -3 (ix)
   7374 E5            [11]  638 	push	hl
   7375 CD 03 80      [17]  639 	call	_cpct_etm_drawTileBox2x4
   7378 D1            [10]  640 	pop	de
   7379 C1            [10]  641 	pop	bc
   737A                     642 00107$:
                            643 ;src/blocks.c:177: for (u8 x = 0; x < BLOCKS_MAP_W / 2; x++)
   737A 04            [ 4]  644 	inc	b
   737B 18 AA         [12]  645 	jr	00106$
   737D                     646 00110$:
                            647 ;src/blocks.c:175: for (u8 y = 0; y < BLOCKS_MAP_H / 2; y++)
   737D 0C            [ 4]  648 	inc	c
   737E 18 95         [12]  649 	jr	00109$
   7380                     650 00111$:
   7380 DD F9         [10]  651 	ld	sp, ix
   7382 DD E1         [14]  652 	pop	ix
   7384 C9            [10]  653 	ret
                            654 ;src/blocks.c:193: void map_blocks_to_meta()
                            655 ;	---------------------------------
                            656 ; Function map_blocks_to_meta
                            657 ; ---------------------------------
   7385                     658 _map_blocks_to_meta::
   7385 DD E5         [15]  659 	push	ix
   7387 DD 21 00 00   [14]  660 	ld	ix,#0
   738B DD 39         [15]  661 	add	ix,sp
   738D F5            [11]  662 	push	af
   738E F5            [11]  663 	push	af
   738F 3B            [ 6]  664 	dec	sp
                            665 ;src/blocks.c:195: blocks_remaining = 0;
   7390 21 00 00      [10]  666 	ld	hl, #0x0000
   7393 22 0A 88      [16]  667 	ld	(_blocks_remaining), hl
                            668 ;src/blocks.c:197: for (u8 y = 0; y < BLOCKS_MAP_H; y += 2)
   7396 DD 36 FC 00   [19]  669 	ld	-4 (ix), #0x00
   739A                     670 00119$:
   739A DD 7E FC      [19]  671 	ld	a, -4 (ix)
   739D D6 1C         [ 7]  672 	sub	a, #0x1c
   739F D2 51 75      [10]  673 	jp	NC, 00121$
                            674 ;src/blocks.c:199: for (u8 x = 0; x < BLOCKS_MAP_W; x += 2)
   73A2 DD 4E FC      [19]  675 	ld	c,-4 (ix)
   73A5 06 00         [ 7]  676 	ld	b,#0x00
   73A7 69            [ 4]  677 	ld	l, c
   73A8 60            [ 4]  678 	ld	h, b
   73A9 29            [11]  679 	add	hl, hl
   73AA 09            [11]  680 	add	hl, bc
   73AB 29            [11]  681 	add	hl, hl
   73AC 29            [11]  682 	add	hl, hl
   73AD 09            [11]  683 	add	hl, bc
   73AE 29            [11]  684 	add	hl, hl
   73AF DD 75 FE      [19]  685 	ld	-2 (ix), l
   73B2 DD 74 FF      [19]  686 	ld	-1 (ix), h
   73B5 DD 4E FC      [19]  687 	ld	c, -4 (ix)
   73B8 CB 39         [ 8]  688 	srl	c
   73BA 79            [ 4]  689 	ld	a, c
   73BB 87            [ 4]  690 	add	a, a
   73BC 81            [ 4]  691 	add	a, c
   73BD 87            [ 4]  692 	add	a, a
   73BE DD 77 FD      [19]  693 	ld	-3 (ix), a
   73C1 DD 36 FB 00   [19]  694 	ld	-5 (ix), #0x00
   73C5                     695 00116$:
   73C5 DD 7E FB      [19]  696 	ld	a, -5 (ix)
   73C8 D6 1A         [ 7]  697 	sub	a, #0x1a
   73CA D2 48 75      [10]  698 	jp	NC, 00120$
                            699 ;src/blocks.c:201: u8 tile = current_level->blocks_tilemap[(y * BLOCKS_MAP_W) + x];
   73CD 2A 19 88      [16]  700 	ld	hl, (_current_level)
   73D0 23            [ 6]  701 	inc	hl
   73D1 23            [ 6]  702 	inc	hl
   73D2 4E            [ 7]  703 	ld	c, (hl)
   73D3 23            [ 6]  704 	inc	hl
   73D4 46            [ 7]  705 	ld	b, (hl)
   73D5 DD 5E FB      [19]  706 	ld	e, -5 (ix)
   73D8 16 00         [ 7]  707 	ld	d, #0x00
   73DA DD 6E FE      [19]  708 	ld	l,-2 (ix)
   73DD DD 66 FF      [19]  709 	ld	h,-1 (ix)
   73E0 19            [11]  710 	add	hl, de
   73E1 09            [11]  711 	add	hl, bc
   73E2 7E            [ 7]  712 	ld	a, (hl)
                            713 ;src/blocks.c:202: switch (tile)
   73E3 B7            [ 4]  714 	or	a, a
   73E4 28 2C         [12]  715 	jr	Z,00101$
   73E6 FE 02         [ 7]  716 	cp	a, #0x02
   73E8 28 3F         [12]  717 	jr	Z,00102$
   73EA FE 04         [ 7]  718 	cp	a, #0x04
   73EC 28 53         [12]  719 	jr	Z,00103$
   73EE FE 06         [ 7]  720 	cp	a, #0x06
   73F0 28 67         [12]  721 	jr	Z,00104$
   73F2 FE 08         [ 7]  722 	cp	a, #0x08
   73F4 28 7B         [12]  723 	jr	Z,00105$
   73F6 FE 0A         [ 7]  724 	cp	a, #0x0a
   73F8 CA 89 74      [10]  725 	jp	Z,00106$
   73FB FE 0C         [ 7]  726 	cp	a, #0x0c
   73FD CA A1 74      [10]  727 	jp	Z,00107$
   7400 FE 0E         [ 7]  728 	cp	a, #0x0e
   7402 CA B9 74      [10]  729 	jp	Z,00108$
   7405 FE 10         [ 7]  730 	cp	a, #0x10
   7407 CA D0 74      [10]  731 	jp	Z,00109$
   740A D6 12         [ 7]  732 	sub	a, #0x12
   740C CA F3 74      [10]  733 	jp	Z,00110$
   740F C3 0A 75      [10]  734 	jp	00111$
                            735 ;src/blocks.c:204: case WHITE_BLOCK:
   7412                     736 00101$:
                            737 ;src/blocks.c:205: plant_tile_meta(x, y, WHITE_BLOCK, WHITE_SCORE, SINGLE_HIT_TO_REMOVE);
   7412 21 05 01      [10]  738 	ld	hl, #0x0105
   7415 E5            [11]  739 	push	hl
   7416 AF            [ 4]  740 	xor	a, a
   7417 F5            [11]  741 	push	af
   7418 33            [ 6]  742 	inc	sp
   7419 DD 66 FC      [19]  743 	ld	h, -4 (ix)
   741C DD 6E FB      [19]  744 	ld	l, -5 (ix)
   741F E5            [11]  745 	push	hl
   7420 CD 56 75      [17]  746 	call	_plant_tile_meta
   7423 F1            [10]  747 	pop	af
   7424 F1            [10]  748 	pop	af
   7425 33            [ 6]  749 	inc	sp
                            750 ;src/blocks.c:206: break;
   7426 C3 3F 75      [10]  751 	jp	00117$
                            752 ;src/blocks.c:207: case ORANGE_BLOCK:
   7429                     753 00102$:
                            754 ;src/blocks.c:208: plant_tile_meta(x, y, ORANGE_BLOCK, ORANGE_SCORE, SINGLE_HIT_TO_REMOVE);
   7429 21 06 01      [10]  755 	ld	hl, #0x0106
   742C E5            [11]  756 	push	hl
   742D 3E 02         [ 7]  757 	ld	a, #0x02
   742F F5            [11]  758 	push	af
   7430 33            [ 6]  759 	inc	sp
   7431 DD 66 FC      [19]  760 	ld	h, -4 (ix)
   7434 DD 6E FB      [19]  761 	ld	l, -5 (ix)
   7437 E5            [11]  762 	push	hl
   7438 CD 56 75      [17]  763 	call	_plant_tile_meta
   743B F1            [10]  764 	pop	af
   743C F1            [10]  765 	pop	af
   743D 33            [ 6]  766 	inc	sp
                            767 ;src/blocks.c:209: break;
   743E C3 3F 75      [10]  768 	jp	00117$
                            769 ;src/blocks.c:210: case CYAN_BLOCK:
   7441                     770 00103$:
                            771 ;src/blocks.c:211: plant_tile_meta(x, y, CYAN_BLOCK, CYAN_SCORE, SINGLE_HIT_TO_REMOVE);
   7441 21 07 01      [10]  772 	ld	hl, #0x0107
   7444 E5            [11]  773 	push	hl
   7445 3E 04         [ 7]  774 	ld	a, #0x04
   7447 F5            [11]  775 	push	af
   7448 33            [ 6]  776 	inc	sp
   7449 DD 66 FC      [19]  777 	ld	h, -4 (ix)
   744C DD 6E FB      [19]  778 	ld	l, -5 (ix)
   744F E5            [11]  779 	push	hl
   7450 CD 56 75      [17]  780 	call	_plant_tile_meta
   7453 F1            [10]  781 	pop	af
   7454 F1            [10]  782 	pop	af
   7455 33            [ 6]  783 	inc	sp
                            784 ;src/blocks.c:212: break;
   7456 C3 3F 75      [10]  785 	jp	00117$
                            786 ;src/blocks.c:213: case GREEN_BLOCK:
   7459                     787 00104$:
                            788 ;src/blocks.c:214: plant_tile_meta(x, y, GREEN_BLOCK, GREEN_SCORE, SINGLE_HIT_TO_REMOVE);
   7459 21 08 01      [10]  789 	ld	hl, #0x0108
   745C E5            [11]  790 	push	hl
   745D 3E 06         [ 7]  791 	ld	a, #0x06
   745F F5            [11]  792 	push	af
   7460 33            [ 6]  793 	inc	sp
   7461 DD 66 FC      [19]  794 	ld	h, -4 (ix)
   7464 DD 6E FB      [19]  795 	ld	l, -5 (ix)
   7467 E5            [11]  796 	push	hl
   7468 CD 56 75      [17]  797 	call	_plant_tile_meta
   746B F1            [10]  798 	pop	af
   746C F1            [10]  799 	pop	af
   746D 33            [ 6]  800 	inc	sp
                            801 ;src/blocks.c:215: break;
   746E C3 3F 75      [10]  802 	jp	00117$
                            803 ;src/blocks.c:216: case RED_BLOCK:
   7471                     804 00105$:
                            805 ;src/blocks.c:217: plant_tile_meta(x, y, RED_BLOCK, RED_SCORE, SINGLE_HIT_TO_REMOVE);
   7471 21 09 01      [10]  806 	ld	hl, #0x0109
   7474 E5            [11]  807 	push	hl
   7475 3E 08         [ 7]  808 	ld	a, #0x08
   7477 F5            [11]  809 	push	af
   7478 33            [ 6]  810 	inc	sp
   7479 DD 66 FC      [19]  811 	ld	h, -4 (ix)
   747C DD 6E FB      [19]  812 	ld	l, -5 (ix)
   747F E5            [11]  813 	push	hl
   7480 CD 56 75      [17]  814 	call	_plant_tile_meta
   7483 F1            [10]  815 	pop	af
   7484 F1            [10]  816 	pop	af
   7485 33            [ 6]  817 	inc	sp
                            818 ;src/blocks.c:218: break;
   7486 C3 3F 75      [10]  819 	jp	00117$
                            820 ;src/blocks.c:219: case BLUE_BLOCK:
   7489                     821 00106$:
                            822 ;src/blocks.c:220: plant_tile_meta(x, y, BLUE_BLOCK, BLUE_SCORE, SINGLE_HIT_TO_REMOVE);
   7489 21 0A 01      [10]  823 	ld	hl, #0x010a
   748C E5            [11]  824 	push	hl
   748D 3E 0A         [ 7]  825 	ld	a, #0x0a
   748F F5            [11]  826 	push	af
   7490 33            [ 6]  827 	inc	sp
   7491 DD 66 FC      [19]  828 	ld	h, -4 (ix)
   7494 DD 6E FB      [19]  829 	ld	l, -5 (ix)
   7497 E5            [11]  830 	push	hl
   7498 CD 56 75      [17]  831 	call	_plant_tile_meta
   749B F1            [10]  832 	pop	af
   749C F1            [10]  833 	pop	af
   749D 33            [ 6]  834 	inc	sp
                            835 ;src/blocks.c:221: break;
   749E C3 3F 75      [10]  836 	jp	00117$
                            837 ;src/blocks.c:222: case MAGENTA_BLOCK:
   74A1                     838 00107$:
                            839 ;src/blocks.c:223: plant_tile_meta(x, y, MAGENTA_BLOCK, MAGENTA_SCORE, SINGLE_HIT_TO_REMOVE);
   74A1 21 0B 01      [10]  840 	ld	hl, #0x010b
   74A4 E5            [11]  841 	push	hl
   74A5 3E 0C         [ 7]  842 	ld	a, #0x0c
   74A7 F5            [11]  843 	push	af
   74A8 33            [ 6]  844 	inc	sp
   74A9 DD 66 FC      [19]  845 	ld	h, -4 (ix)
   74AC DD 6E FB      [19]  846 	ld	l, -5 (ix)
   74AF E5            [11]  847 	push	hl
   74B0 CD 56 75      [17]  848 	call	_plant_tile_meta
   74B3 F1            [10]  849 	pop	af
   74B4 F1            [10]  850 	pop	af
   74B5 33            [ 6]  851 	inc	sp
                            852 ;src/blocks.c:224: break;
   74B6 C3 3F 75      [10]  853 	jp	00117$
                            854 ;src/blocks.c:225: case YELLOW_BLOCK:
   74B9                     855 00108$:
                            856 ;src/blocks.c:226: plant_tile_meta(x, y, YELLOW_BLOCK, YELLOW_SCORE, SINGLE_HIT_TO_REMOVE);
   74B9 21 0C 01      [10]  857 	ld	hl, #0x010c
   74BC E5            [11]  858 	push	hl
   74BD 3E 0E         [ 7]  859 	ld	a, #0x0e
   74BF F5            [11]  860 	push	af
   74C0 33            [ 6]  861 	inc	sp
   74C1 DD 66 FC      [19]  862 	ld	h, -4 (ix)
   74C4 DD 6E FB      [19]  863 	ld	l, -5 (ix)
   74C7 E5            [11]  864 	push	hl
   74C8 CD 56 75      [17]  865 	call	_plant_tile_meta
   74CB F1            [10]  866 	pop	af
   74CC F1            [10]  867 	pop	af
   74CD 33            [ 6]  868 	inc	sp
                            869 ;src/blocks.c:227: break;
   74CE 18 6F         [12]  870 	jr	00117$
                            871 ;src/blocks.c:228: case STEEL_BLOCK:
   74D0                     872 00109$:
                            873 ;src/blocks.c:231: current_level->steel_hits_to_destroy);
   74D0 2A 19 88      [16]  874 	ld	hl, (_current_level)
   74D3 11 05 00      [10]  875 	ld	de, #0x0005
   74D6 19            [11]  876 	add	hl, de
   74D7 56            [ 7]  877 	ld	d, (hl)
                            878 ;src/blocks.c:230: current_level->steel_score, 
   74D8 FD 2A 19 88   [20]  879 	ld	iy, (_current_level)
                            880 ;src/blocks.c:229: plant_tile_meta(x, y, STEEL_BLOCK, 
   74DC FD 5E 04      [19]  881 	ld	e, 4 (iy)
   74DF D5            [11]  882 	push	de
   74E0 3E 10         [ 7]  883 	ld	a, #0x10
   74E2 F5            [11]  884 	push	af
   74E3 33            [ 6]  885 	inc	sp
   74E4 DD 66 FC      [19]  886 	ld	h, -4 (ix)
   74E7 DD 6E FB      [19]  887 	ld	l, -5 (ix)
   74EA E5            [11]  888 	push	hl
   74EB CD 56 75      [17]  889 	call	_plant_tile_meta
   74EE F1            [10]  890 	pop	af
   74EF F1            [10]  891 	pop	af
   74F0 33            [ 6]  892 	inc	sp
                            893 ;src/blocks.c:232: break;
   74F1 18 4C         [12]  894 	jr	00117$
                            895 ;src/blocks.c:233: case GOLD_BLOCK:
   74F3                     896 00110$:
                            897 ;src/blocks.c:234: plant_tile_meta(x, y, GOLD_BLOCK, 0, INDESTRUCTABLE);
   74F3 21 00 FF      [10]  898 	ld	hl, #0xff00
   74F6 E5            [11]  899 	push	hl
   74F7 3E 12         [ 7]  900 	ld	a, #0x12
   74F9 F5            [11]  901 	push	af
   74FA 33            [ 6]  902 	inc	sp
   74FB DD 66 FC      [19]  903 	ld	h, -4 (ix)
   74FE DD 6E FB      [19]  904 	ld	l, -5 (ix)
   7501 E5            [11]  905 	push	hl
   7502 CD 56 75      [17]  906 	call	_plant_tile_meta
   7505 F1            [10]  907 	pop	af
   7506 F1            [10]  908 	pop	af
   7507 33            [ 6]  909 	inc	sp
                            910 ;src/blocks.c:235: break;
   7508 18 35         [12]  911 	jr	00117$
                            912 ;src/blocks.c:236: default:
   750A                     913 00111$:
                            914 ;src/blocks.c:238: block_meta[x / 2][y / 2].is_active = 0;
   750A DD 4E FB      [19]  915 	ld	c, -5 (ix)
   750D CB 39         [ 8]  916 	srl	c
   750F 06 00         [ 7]  917 	ld	b,#0x00
   7511 69            [ 4]  918 	ld	l, c
   7512 60            [ 4]  919 	ld	h, b
   7513 29            [11]  920 	add	hl, hl
   7514 29            [11]  921 	add	hl, hl
   7515 09            [11]  922 	add	hl, bc
   7516 29            [11]  923 	add	hl, hl
   7517 29            [11]  924 	add	hl, hl
   7518 09            [11]  925 	add	hl, bc
   7519 29            [11]  926 	add	hl, hl
   751A 29            [11]  927 	add	hl, hl
   751B 01 C6 83      [10]  928 	ld	bc,#_block_meta
   751E 09            [11]  929 	add	hl,bc
   751F 4D            [ 4]  930 	ld	c, l
   7520 44            [ 4]  931 	ld	b, h
   7521 DD 6E FD      [19]  932 	ld	l,-3 (ix)
   7524 26 00         [ 7]  933 	ld	h,#0x00
   7526 09            [11]  934 	add	hl, bc
   7527 36 00         [10]  935 	ld	(hl), #0x00
                            936 ;src/blocks.c:239: block_meta[x / 2][y / 2].score = 0;
   7529 DD 7E FD      [19]  937 	ld	a, -3 (ix)
   752C 81            [ 4]  938 	add	a, c
   752D 4F            [ 4]  939 	ld	c, a
   752E 3E 00         [ 7]  940 	ld	a, #0x00
   7530 88            [ 4]  941 	adc	a, b
   7531 47            [ 4]  942 	ld	b, a
   7532 59            [ 4]  943 	ld	e, c
   7533 50            [ 4]  944 	ld	d, b
   7534 13            [ 6]  945 	inc	de
   7535 13            [ 6]  946 	inc	de
   7536 AF            [ 4]  947 	xor	a, a
   7537 12            [ 7]  948 	ld	(de), a
                            949 ;src/blocks.c:240: block_meta[x / 2][y / 2].remaining_hits = 0;
   7538 03            [ 6]  950 	inc	bc
   7539 03            [ 6]  951 	inc	bc
   753A 03            [ 6]  952 	inc	bc
   753B 60            [ 4]  953 	ld	h, b
   753C 69            [ 4]  954 	ld	l, c
   753D 36 00         [10]  955 	ld	(hl), #0x00
                            956 ;src/blocks.c:243: }
   753F                     957 00117$:
                            958 ;src/blocks.c:199: for (u8 x = 0; x < BLOCKS_MAP_W; x += 2)
   753F DD 34 FB      [23]  959 	inc	-5 (ix)
   7542 DD 34 FB      [23]  960 	inc	-5 (ix)
   7545 C3 C5 73      [10]  961 	jp	00116$
   7548                     962 00120$:
                            963 ;src/blocks.c:197: for (u8 y = 0; y < BLOCKS_MAP_H; y += 2)
   7548 DD 34 FC      [23]  964 	inc	-4 (ix)
   754B DD 34 FC      [23]  965 	inc	-4 (ix)
   754E C3 9A 73      [10]  966 	jp	00119$
   7551                     967 00121$:
   7551 DD F9         [10]  968 	ld	sp, ix
   7553 DD E1         [14]  969 	pop	ix
   7555 C9            [10]  970 	ret
                            971 ;src/blocks.c:248: void plant_tile_meta(u8 map_x, u8 map_y, u8 tile_type, u8 score, u8 hits_to_destroy)
                            972 ;	---------------------------------
                            973 ; Function plant_tile_meta
                            974 ; ---------------------------------
   7556                     975 _plant_tile_meta::
   7556 DD E5         [15]  976 	push	ix
   7558 DD 21 00 00   [14]  977 	ld	ix,#0
   755C DD 39         [15]  978 	add	ix,sp
                            979 ;src/blocks.c:250: if (hits_to_destroy != INDESTRUCTABLE) {
   755E DD 7E 08      [19]  980 	ld	a, 8 (ix)
   7561 3C            [ 4]  981 	inc	a
   7562 28 0C         [12]  982 	jr	Z,00102$
                            983 ;src/blocks.c:251: blocks_remaining += 1;
   7564 FD 21 0A 88   [14]  984 	ld	iy, #_blocks_remaining
   7568 FD 34 00      [23]  985 	inc	0 (iy)
   756B 20 03         [12]  986 	jr	NZ,00110$
   756D FD 34 01      [23]  987 	inc	1 (iy)
   7570                     988 00110$:
   7570                     989 00102$:
                            990 ;src/blocks.c:254: block_meta[map_x / 2][map_y / 2].is_active = 1;
   7570 01 C6 83      [10]  991 	ld	bc, #_block_meta+0
   7573 DD 5E 04      [19]  992 	ld	e, 4 (ix)
   7576 CB 3B         [ 8]  993 	srl	e
   7578 16 00         [ 7]  994 	ld	d,#0x00
   757A 6B            [ 4]  995 	ld	l, e
   757B 62            [ 4]  996 	ld	h, d
   757C 29            [11]  997 	add	hl, hl
   757D 29            [11]  998 	add	hl, hl
   757E 19            [11]  999 	add	hl, de
   757F 29            [11] 1000 	add	hl, hl
   7580 29            [11] 1001 	add	hl, hl
   7581 19            [11] 1002 	add	hl, de
   7582 29            [11] 1003 	add	hl, hl
   7583 29            [11] 1004 	add	hl, hl
   7584 09            [11] 1005 	add	hl,bc
   7585 4D            [ 4] 1006 	ld	c, l
   7586 44            [ 4] 1007 	ld	b, h
   7587 DD 5E 05      [19] 1008 	ld	e, 5 (ix)
   758A CB 3B         [ 8] 1009 	srl	e
   758C 6B            [ 4] 1010 	ld	l, e
   758D 29            [11] 1011 	add	hl, hl
   758E 19            [11] 1012 	add	hl, de
   758F 29            [11] 1013 	add	hl, hl
   7590 7D            [ 4] 1014 	ld	a, l
   7591 81            [ 4] 1015 	add	a, c
   7592 4F            [ 4] 1016 	ld	c, a
   7593 3E 00         [ 7] 1017 	ld	a, #0x00
   7595 88            [ 4] 1018 	adc	a, b
   7596 47            [ 4] 1019 	ld	b, a
   7597 3E 01         [ 7] 1020 	ld	a, #0x01
   7599 02            [ 7] 1021 	ld	(bc), a
                           1022 ;src/blocks.c:255: block_meta[map_x / 2][map_y / 2].score = score;
   759A 59            [ 4] 1023 	ld	e, c
   759B 50            [ 4] 1024 	ld	d, b
   759C 13            [ 6] 1025 	inc	de
   759D 13            [ 6] 1026 	inc	de
   759E DD 7E 07      [19] 1027 	ld	a, 7 (ix)
   75A1 12            [ 7] 1028 	ld	(de), a
                           1029 ;src/blocks.c:256: block_meta[map_x / 2][map_y / 2].remaining_hits = hits_to_destroy;
   75A2 59            [ 4] 1030 	ld	e, c
   75A3 50            [ 4] 1031 	ld	d, b
   75A4 13            [ 6] 1032 	inc	de
   75A5 13            [ 6] 1033 	inc	de
   75A6 13            [ 6] 1034 	inc	de
   75A7 DD 7E 08      [19] 1035 	ld	a, 8 (ix)
   75AA 12            [ 7] 1036 	ld	(de), a
                           1037 ;src/blocks.c:257: block_meta[map_x / 2][map_y / 2].type = tile_type;
   75AB 59            [ 4] 1038 	ld	e, c
   75AC 50            [ 4] 1039 	ld	d, b
   75AD 13            [ 6] 1040 	inc	de
   75AE DD 7E 06      [19] 1041 	ld	a, 6 (ix)
   75B1 12            [ 7] 1042 	ld	(de), a
                           1043 ;src/blocks.c:258: block_meta[map_x / 2][map_y / 2].block_tile_x = map_x;
   75B2 21 04 00      [10] 1044 	ld	hl, #0x0004
   75B5 09            [11] 1045 	add	hl, bc
   75B6 DD 7E 04      [19] 1046 	ld	a, 4 (ix)
   75B9 77            [ 7] 1047 	ld	(hl), a
                           1048 ;src/blocks.c:259: block_meta[map_x / 2][map_y / 2].block_tile_y = map_y;
   75BA 21 05 00      [10] 1049 	ld	hl, #0x0005
   75BD 09            [11] 1050 	add	hl, bc
   75BE DD 7E 05      [19] 1051 	ld	a, 5 (ix)
   75C1 77            [ 7] 1052 	ld	(hl), a
   75C2 DD E1         [14] 1053 	pop	ix
   75C4 C9            [10] 1054 	ret
                           1055 	.area _CODE
                           1056 	.area _INITIALIZER
                           1057 	.area _CABS (ABS)
