                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module menu
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _module_menu_initialize
                             12 	.globl _menu_update
                             13 	.globl _menu_draw
                             14 	.globl _menu_initialize
                             15 	.globl _keys_update
                             16 	.globl _keys_initialize
                             17 	.globl _cpct_getScreenPtr
                             18 	.globl _cpct_drawStringM0
                             19 	.globl _cpct_setDrawCharM0
                             20 	.globl _cpct_drawSprite
                             21 	.globl _cpct_isAnyKeyPressed
                             22 	.globl _cpct_memset
                             23 	.globl _current_ink
                             24 	.globl _loop_counter
                             25 	.globl _scene_menu
                             26 	.globl _fg_pens
                             27 	.globl _menu_print_message
                             28 ;--------------------------------------------------------
                             29 ; special function registers
                             30 ;--------------------------------------------------------
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _DATA
   8079                      35 _scene_menu::
   8079                      36 	.ds 6
   807F                      37 _loop_counter::
   807F                      38 	.ds 1
   8080                      39 _current_ink::
   8080                      40 	.ds 1
                             41 ;--------------------------------------------------------
                             42 ; ram data
                             43 ;--------------------------------------------------------
                             44 	.area _INITIALIZED
                             45 ;--------------------------------------------------------
                             46 ; absolute external ram data
                             47 ;--------------------------------------------------------
                             48 	.area _DABS (ABS)
                             49 ;--------------------------------------------------------
                             50 ; global & static initialisations
                             51 ;--------------------------------------------------------
                             52 	.area _HOME
                             53 	.area _GSINIT
                             54 	.area _GSFINAL
                             55 	.area _GSINIT
                             56 ;--------------------------------------------------------
                             57 ; Home
                             58 ;--------------------------------------------------------
                             59 	.area _HOME
                             60 	.area _HOME
                             61 ;--------------------------------------------------------
                             62 ; code
                             63 ;--------------------------------------------------------
                             64 	.area _CODE
                             65 ;src/menu.c:23: void menu_initialize()
                             66 ;	---------------------------------
                             67 ; Function menu_initialize
                             68 ; ---------------------------------
   756F                      69 _menu_initialize::
                             70 ;src/menu.c:25: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, (SCREEN_WIDTH_BYTES - SP_LOGO_W) / 2, 16);
   756F 21 0B 10      [10]   71 	ld	hl, #0x100b
   7572 E5            [11]   72 	push	hl
   7573 21 00 C0      [10]   73 	ld	hl, #0xc000
   7576 E5            [11]   74 	push	hl
   7577 CD 48 7B      [17]   75 	call	_cpct_getScreenPtr
                             76 ;src/menu.c:26: cpct_clearScreen(AN_PEN_BLACK);
   757A E5            [11]   77 	push	hl
   757B 21 00 40      [10]   78 	ld	hl, #0x4000
   757E E5            [11]   79 	push	hl
   757F AF            [ 4]   80 	xor	a, a
   7580 F5            [11]   81 	push	af
   7581 33            [ 6]   82 	inc	sp
   7582 26 C0         [ 7]   83 	ld	h, #0xc0
   7584 E5            [11]   84 	push	hl
   7585 CD E8 79      [17]   85 	call	_cpct_memset
   7588 CD 4C 74      [17]   86 	call	_keys_initialize
   758B C1            [10]   87 	pop	bc
                             88 ;src/menu.c:30: loop_counter = 0;
   758C 21 7F 80      [10]   89 	ld	hl,#_loop_counter + 0
   758F 36 00         [10]   90 	ld	(hl), #0x00
                             91 ;src/menu.c:31: cpct_drawSprite(sp_logo, pvmem, SP_LOGO_W, SP_LOGO_H);
   7591 21 39 2D      [10]   92 	ld	hl, #0x2d39
   7594 E5            [11]   93 	push	hl
   7595 C5            [11]   94 	push	bc
   7596 21 12 5C      [10]   95 	ld	hl, #_sp_logo
   7599 E5            [11]   96 	push	hl
   759A CD F7 77      [17]   97 	call	_cpct_drawSprite
                             98 ;src/menu.c:35: menu_print_message(4, 90, AN_PEN_PASTEL_CYAN, "\xf2 or a: move left");
   759D 21 D6 75      [10]   99 	ld	hl, #___str_0
   75A0 E5            [11]  100 	push	hl
   75A1 21 5A 03      [10]  101 	ld	hl, #0x035a
   75A4 E5            [11]  102 	push	hl
   75A5 3E 04         [ 7]  103 	ld	a, #0x04
   75A7 F5            [11]  104 	push	af
   75A8 33            [ 6]  105 	inc	sp
   75A9 CD 91 76      [17]  106 	call	_menu_print_message
   75AC F1            [10]  107 	pop	af
                            108 ;src/menu.c:36: menu_print_message(4, 105, AN_PEN_PASTEL_MAGENTA, "\xf3 or d: move right");
   75AD 33            [ 6]  109 	inc	sp
   75AE 21 E8 75      [10]  110 	ld	hl,#___str_1
   75B1 E3            [19]  111 	ex	(sp),hl
   75B2 21 69 07      [10]  112 	ld	hl, #0x0769
   75B5 E5            [11]  113 	push	hl
   75B6 3E 04         [ 7]  114 	ld	a, #0x04
   75B8 F5            [11]  115 	push	af
   75B9 33            [ 6]  116 	inc	sp
   75BA CD 91 76      [17]  117 	call	_menu_print_message
   75BD F1            [10]  118 	pop	af
                            119 ;src/menu.c:37: menu_print_message(4, 120, AN_PEN_PASTEL_YELLOW, "\xf0 or w: serve");
   75BE 33            [ 6]  120 	inc	sp
   75BF 21 FB 75      [10]  121 	ld	hl,#___str_2
   75C2 E3            [19]  122 	ex	(sp),hl
   75C3 21 78 08      [10]  123 	ld	hl, #0x0878
   75C6 E5            [11]  124 	push	hl
   75C7 3E 04         [ 7]  125 	ld	a, #0x04
   75C9 F5            [11]  126 	push	af
   75CA 33            [ 6]  127 	inc	sp
   75CB CD 91 76      [17]  128 	call	_menu_print_message
   75CE F1            [10]  129 	pop	af
   75CF F1            [10]  130 	pop	af
   75D0 33            [ 6]  131 	inc	sp
   75D1 C9            [10]  132 	ret
   75D2                     133 _fg_pens:
   75D2 01                  134 	.db #0x01	; 1
   75D3 03                  135 	.db #0x03	; 3
   75D4 06                  136 	.db #0x06	; 6
   75D5 07                  137 	.db #0x07	; 7
   75D6                     138 ___str_0:
   75D6 F2                  139 	.db 0xf2
   75D7 20 6F 72 20 61 3A   140 	.ascii " or a: move left"
        20 6D 6F 76 65 20
        6C 65 66 74
   75E7 00                  141 	.db 0x00
   75E8                     142 ___str_1:
   75E8 F3                  143 	.db 0xf3
   75E9 20 6F 72 20 64 3A   144 	.ascii " or d: move right"
        20 6D 6F 76 65 20
        72 69 67 68 74
   75FA 00                  145 	.db 0x00
   75FB                     146 ___str_2:
   75FB F0                  147 	.db 0xf0
   75FC 20 6F 72 20 77 3A   148 	.ascii " or w: serve"
        20 73 65 72 76 65
   7608 00                  149 	.db 0x00
                            150 ;src/menu.c:40: void menu_draw()
                            151 ;	---------------------------------
                            152 ; Function menu_draw
                            153 ; ---------------------------------
   7609                     154 _menu_draw::
                            155 ;src/menu.c:42: void *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 14, SCREEN_HEIGHT_ROWS - 16);
   7609 21 0E B8      [10]  156 	ld	hl, #0xb80e
   760C E5            [11]  157 	push	hl
   760D 21 00 C0      [10]  158 	ld	hl, #0xc000
   7610 E5            [11]  159 	push	hl
   7611 CD 48 7B      [17]  160 	call	_cpct_getScreenPtr
   7614 4D            [ 4]  161 	ld	c, l
   7615 44            [ 4]  162 	ld	b, h
                            163 ;src/menu.c:44: cpct_setDrawCharM0(fg_pens[current_ink], 0);
   7616 FD 21 D2 75   [14]  164 	ld	iy, #_fg_pens
   761A ED 5B 80 80   [20]  165 	ld	de, (_current_ink)
   761E 16 00         [ 7]  166 	ld	d, #0x00
   7620 FD 19         [15]  167 	add	iy, de
   7622 FD 56 00      [19]  168 	ld	d, 0 (iy)
   7625 C5            [11]  169 	push	bc
   7626 AF            [ 4]  170 	xor	a, a
   7627 F5            [11]  171 	push	af
   7628 33            [ 6]  172 	inc	sp
   7629 D5            [11]  173 	push	de
   762A 33            [ 6]  174 	inc	sp
   762B CD E8 7A      [17]  175 	call	_cpct_setDrawCharM0
   762E 21 36 76      [10]  176 	ld	hl, #___str_3
   7631 E5            [11]  177 	push	hl
   7632 CD 59 77      [17]  178 	call	_cpct_drawStringM0
   7635 C9            [10]  179 	ret
   7636                     180 ___str_3:
   7636 50 72 65 73 73 20   181 	.ascii "Press any key"
        61 6E 79 20 6B 65
        79
   7643 00                  182 	.db 0x00
                            183 ;src/menu.c:48: SceneState menu_update()
                            184 ;	---------------------------------
                            185 ; Function menu_update
                            186 ; ---------------------------------
   7644                     187 _menu_update::
                            188 ;src/menu.c:50: keys_update();
   7644 CD 69 74      [17]  189 	call	_keys_update
                            190 ;src/menu.c:51: if (cpct_isAnyKeyPressed())
   7647 CD AA 79      [17]  191 	call	_cpct_isAnyKeyPressed
   764A 7D            [ 4]  192 	ld	a, l
   764B B7            [ 4]  193 	or	a, a
   764C 28 03         [12]  194 	jr	Z,00102$
                            195 ;src/menu.c:53: return SceneComplete;
   764E 2E 01         [ 7]  196 	ld	l, #0x01
   7650 C9            [10]  197 	ret
   7651                     198 00102$:
                            199 ;src/menu.c:56: loop_counter += 1;
   7651 FD 21 7F 80   [14]  200 	ld	iy, #_loop_counter
   7655 FD 34 00      [23]  201 	inc	0 (iy)
                            202 ;src/menu.c:57: if (loop_counter > COLOR_CYCLE_FREQ)
   7658 3E 0A         [ 7]  203 	ld	a, #0x0a
   765A FD 96 00      [19]  204 	sub	a, 0 (iy)
   765D 30 1C         [12]  205 	jr	NC,00104$
                            206 ;src/menu.c:59: loop_counter = 0;
   765F FD 36 00 00   [19]  207 	ld	0 (iy), #0x00
                            208 ;src/menu.c:60: current_ink = (current_ink + 1) % 4;
   7663 21 80 80      [10]  209 	ld	hl,#_current_ink + 0
   7666 4E            [ 7]  210 	ld	c, (hl)
   7667 06 00         [ 7]  211 	ld	b, #0x00
   7669 03            [ 6]  212 	inc	bc
   766A 21 04 00      [10]  213 	ld	hl, #0x0004
   766D E5            [11]  214 	push	hl
   766E C5            [11]  215 	push	bc
   766F CD DB 7A      [17]  216 	call	__modsint
   7672 F1            [10]  217 	pop	af
   7673 F1            [10]  218 	pop	af
   7674 FD 21 80 80   [14]  219 	ld	iy, #_current_ink
   7678 FD 75 00      [19]  220 	ld	0 (iy), l
   767B                     221 00104$:
                            222 ;src/menu.c:63: return Continue;
   767B 2E 00         [ 7]  223 	ld	l, #0x00
   767D C9            [10]  224 	ret
                            225 ;src/menu.c:66: void module_menu_initialize()
                            226 ;	---------------------------------
                            227 ; Function module_menu_initialize
                            228 ; ---------------------------------
   767E                     229 _module_menu_initialize::
                            230 ;src/menu.c:68: scene_menu.initialize = menu_initialize;
   767E 21 6F 75      [10]  231 	ld	hl, #_menu_initialize
   7681 22 79 80      [16]  232 	ld	(_scene_menu), hl
                            233 ;src/menu.c:69: scene_menu.update = menu_update;
   7684 21 44 76      [10]  234 	ld	hl, #_menu_update
   7687 22 7D 80      [16]  235 	ld	((_scene_menu + 0x0004)), hl
                            236 ;src/menu.c:70: scene_menu.draw = menu_draw;
   768A 21 09 76      [10]  237 	ld	hl, #_menu_draw
   768D 22 7B 80      [16]  238 	ld	((_scene_menu + 0x0002)), hl
   7690 C9            [10]  239 	ret
                            240 ;src/menu.c:73: void menu_print_message(u8 x, u8 y, u8 fg, char *message)
                            241 ;	---------------------------------
                            242 ; Function menu_print_message
                            243 ; ---------------------------------
   7691                     244 _menu_print_message::
                            245 ;src/menu.c:75: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   7691 21 03 00      [10]  246 	ld	hl, #3+0
   7694 39            [11]  247 	add	hl, sp
   7695 7E            [ 7]  248 	ld	a, (hl)
   7696 F5            [11]  249 	push	af
   7697 33            [ 6]  250 	inc	sp
   7698 21 03 00      [10]  251 	ld	hl, #3+0
   769B 39            [11]  252 	add	hl, sp
   769C 7E            [ 7]  253 	ld	a, (hl)
   769D F5            [11]  254 	push	af
   769E 33            [ 6]  255 	inc	sp
   769F 21 00 C0      [10]  256 	ld	hl, #0xc000
   76A2 E5            [11]  257 	push	hl
   76A3 CD 48 7B      [17]  258 	call	_cpct_getScreenPtr
                            259 ;src/menu.c:76: cpct_setDrawCharM0(fg, AN_PEN_BLACK);
   76A6 E5            [11]  260 	push	hl
   76A7 AF            [ 4]  261 	xor	a, a
   76A8 F5            [11]  262 	push	af
   76A9 33            [ 6]  263 	inc	sp
   76AA 21 07 00      [10]  264 	ld	hl, #7+0
   76AD 39            [11]  265 	add	hl, sp
   76AE 7E            [ 7]  266 	ld	a, (hl)
   76AF F5            [11]  267 	push	af
   76B0 33            [ 6]  268 	inc	sp
   76B1 CD E8 7A      [17]  269 	call	_cpct_setDrawCharM0
   76B4 21 07 00      [10]  270 	ld	hl, #7
   76B7 39            [11]  271 	add	hl, sp
   76B8 4E            [ 7]  272 	ld	c, (hl)
   76B9 23            [ 6]  273 	inc	hl
   76BA 46            [ 7]  274 	ld	b, (hl)
   76BB C5            [11]  275 	push	bc
   76BC CD 59 77      [17]  276 	call	_cpct_drawStringM0
   76BF C9            [10]  277 	ret
                            278 	.area _CODE
                            279 	.area _INITIALIZER
                            280 	.area _CABS (ABS)
