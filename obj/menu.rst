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
                             22 	.globl _current_ink
                             23 	.globl _loop_counter
                             24 	.globl _scene_menu
                             25 	.globl _fg_pens
                             26 	.globl _menu_print_message
                             27 ;--------------------------------------------------------
                             28 ; special function registers
                             29 ;--------------------------------------------------------
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _DATA
   755D                      34 _scene_menu::
   755D                      35 	.ds 6
   7563                      36 _loop_counter::
   7563                      37 	.ds 1
   7564                      38 _current_ink::
   7564                      39 	.ds 1
                             40 ;--------------------------------------------------------
                             41 ; ram data
                             42 ;--------------------------------------------------------
                             43 	.area _INITIALIZED
                             44 ;--------------------------------------------------------
                             45 ; absolute external ram data
                             46 ;--------------------------------------------------------
                             47 	.area _DABS (ABS)
                             48 ;--------------------------------------------------------
                             49 ; global & static initialisations
                             50 ;--------------------------------------------------------
                             51 	.area _HOME
                             52 	.area _GSINIT
                             53 	.area _GSFINAL
                             54 	.area _GSINIT
                             55 ;--------------------------------------------------------
                             56 ; Home
                             57 ;--------------------------------------------------------
                             58 	.area _HOME
                             59 	.area _HOME
                             60 ;--------------------------------------------------------
                             61 ; code
                             62 ;--------------------------------------------------------
                             63 	.area _CODE
                             64 ;src/menu.c:23: void menu_initialize()
                             65 ;	---------------------------------
                             66 ; Function menu_initialize
                             67 ; ---------------------------------
   6C16                      68 _menu_initialize::
                             69 ;src/menu.c:25: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, (SCREEN_WIDTH_BYTES - SP_LOGO_W) / 2, 16);
   6C16 21 0B 10      [10]   70 	ld	hl, #0x100b
   6C19 E5            [11]   71 	push	hl
   6C1A 21 00 C0      [10]   72 	ld	hl, #0xc000
   6C1D E5            [11]   73 	push	hl
   6C1E CD A7 71      [17]   74 	call	_cpct_getScreenPtr
                             75 ;src/menu.c:27: keys_initialize();
   6C21 E5            [11]   76 	push	hl
   6C22 CD 92 6A      [17]   77 	call	_keys_initialize
   6C25 C1            [10]   78 	pop	bc
                             79 ;src/menu.c:29: loop_counter = 0;
   6C26 21 63 75      [10]   80 	ld	hl,#_loop_counter + 0
   6C29 36 00         [10]   81 	ld	(hl), #0x00
                             82 ;src/menu.c:30: cpct_drawSprite(sp_logo, pvmem, SP_LOGO_W, SP_LOGO_H);
   6C2B 21 39 2D      [10]   83 	ld	hl, #0x2d39
   6C2E E5            [11]   84 	push	hl
   6C2F C5            [11]   85 	push	bc
   6C30 21 18 56      [10]   86 	ld	hl, #_sp_logo
   6C33 E5            [11]   87 	push	hl
   6C34 CD 91 6E      [17]   88 	call	_cpct_drawSprite
                             89 ;src/menu.c:34: menu_print_message(4, 90, AN_PEN_PASTEL_CYAN, "\xf2 or a: move left");
   6C37 21 70 6C      [10]   90 	ld	hl, #___str_0
   6C3A E5            [11]   91 	push	hl
   6C3B 21 5A 03      [10]   92 	ld	hl, #0x035a
   6C3E E5            [11]   93 	push	hl
   6C3F 3E 04         [ 7]   94 	ld	a, #0x04
   6C41 F5            [11]   95 	push	af
   6C42 33            [ 6]   96 	inc	sp
   6C43 CD 2B 6D      [17]   97 	call	_menu_print_message
   6C46 F1            [10]   98 	pop	af
                             99 ;src/menu.c:35: menu_print_message(4, 105, AN_PEN_PASTEL_MAGENTA, "\xf3 or d: move right");
   6C47 33            [ 6]  100 	inc	sp
   6C48 21 82 6C      [10]  101 	ld	hl,#___str_1
   6C4B E3            [19]  102 	ex	(sp),hl
   6C4C 21 69 07      [10]  103 	ld	hl, #0x0769
   6C4F E5            [11]  104 	push	hl
   6C50 3E 04         [ 7]  105 	ld	a, #0x04
   6C52 F5            [11]  106 	push	af
   6C53 33            [ 6]  107 	inc	sp
   6C54 CD 2B 6D      [17]  108 	call	_menu_print_message
   6C57 F1            [10]  109 	pop	af
                            110 ;src/menu.c:36: menu_print_message(4, 120, AN_PEN_PASTEL_YELLOW, "\xf0 or w: serve");
   6C58 33            [ 6]  111 	inc	sp
   6C59 21 95 6C      [10]  112 	ld	hl,#___str_2
   6C5C E3            [19]  113 	ex	(sp),hl
   6C5D 21 78 08      [10]  114 	ld	hl, #0x0878
   6C60 E5            [11]  115 	push	hl
   6C61 3E 04         [ 7]  116 	ld	a, #0x04
   6C63 F5            [11]  117 	push	af
   6C64 33            [ 6]  118 	inc	sp
   6C65 CD 2B 6D      [17]  119 	call	_menu_print_message
   6C68 F1            [10]  120 	pop	af
   6C69 F1            [10]  121 	pop	af
   6C6A 33            [ 6]  122 	inc	sp
   6C6B C9            [10]  123 	ret
   6C6C                     124 _fg_pens:
   6C6C 01                  125 	.db #0x01	; 1
   6C6D 03                  126 	.db #0x03	; 3
   6C6E 06                  127 	.db #0x06	; 6
   6C6F 07                  128 	.db #0x07	; 7
   6C70                     129 ___str_0:
   6C70 F2                  130 	.db 0xf2
   6C71 20 6F 72 20 61 3A   131 	.ascii " or a: move left"
        20 6D 6F 76 65 20
        6C 65 66 74
   6C81 00                  132 	.db 0x00
   6C82                     133 ___str_1:
   6C82 F3                  134 	.db 0xf3
   6C83 20 6F 72 20 64 3A   135 	.ascii " or d: move right"
        20 6D 6F 76 65 20
        72 69 67 68 74
   6C94 00                  136 	.db 0x00
   6C95                     137 ___str_2:
   6C95 F0                  138 	.db 0xf0
   6C96 20 6F 72 20 77 3A   139 	.ascii " or w: serve"
        20 73 65 72 76 65
   6CA2 00                  140 	.db 0x00
                            141 ;src/menu.c:39: void menu_draw()
                            142 ;	---------------------------------
                            143 ; Function menu_draw
                            144 ; ---------------------------------
   6CA3                     145 _menu_draw::
                            146 ;src/menu.c:41: void *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 14, SCREEN_HEIGHT_ROWS - 16);
   6CA3 21 0E B8      [10]  147 	ld	hl, #0xb80e
   6CA6 E5            [11]  148 	push	hl
   6CA7 21 00 C0      [10]  149 	ld	hl, #0xc000
   6CAA E5            [11]  150 	push	hl
   6CAB CD A7 71      [17]  151 	call	_cpct_getScreenPtr
   6CAE 4D            [ 4]  152 	ld	c, l
   6CAF 44            [ 4]  153 	ld	b, h
                            154 ;src/menu.c:43: cpct_setDrawCharM0(fg_pens[current_ink], 0);
   6CB0 FD 21 6C 6C   [14]  155 	ld	iy, #_fg_pens
   6CB4 ED 5B 64 75   [20]  156 	ld	de, (_current_ink)
   6CB8 16 00         [ 7]  157 	ld	d, #0x00
   6CBA FD 19         [15]  158 	add	iy, de
   6CBC FD 56 00      [19]  159 	ld	d, 0 (iy)
   6CBF C5            [11]  160 	push	bc
   6CC0 AF            [ 4]  161 	xor	a, a
   6CC1 F5            [11]  162 	push	af
   6CC2 33            [ 6]  163 	inc	sp
   6CC3 D5            [11]  164 	push	de
   6CC4 33            [ 6]  165 	inc	sp
   6CC5 CD 82 71      [17]  166 	call	_cpct_setDrawCharM0
   6CC8 21 D0 6C      [10]  167 	ld	hl, #___str_3
   6CCB E5            [11]  168 	push	hl
   6CCC CD F3 6D      [17]  169 	call	_cpct_drawStringM0
   6CCF C9            [10]  170 	ret
   6CD0                     171 ___str_3:
   6CD0 50 72 65 73 73 20   172 	.ascii "Press any key"
        61 6E 79 20 6B 65
        79
   6CDD 00                  173 	.db 0x00
                            174 ;src/menu.c:47: SceneState menu_update()
                            175 ;	---------------------------------
                            176 ; Function menu_update
                            177 ; ---------------------------------
   6CDE                     178 _menu_update::
                            179 ;src/menu.c:49: keys_update();
   6CDE CD AF 6A      [17]  180 	call	_keys_update
                            181 ;src/menu.c:50: if (cpct_isAnyKeyPressed())
   6CE1 CD 44 70      [17]  182 	call	_cpct_isAnyKeyPressed
   6CE4 7D            [ 4]  183 	ld	a, l
   6CE5 B7            [ 4]  184 	or	a, a
   6CE6 28 03         [12]  185 	jr	Z,00102$
                            186 ;src/menu.c:52: return SceneComplete;
   6CE8 2E 01         [ 7]  187 	ld	l, #0x01
   6CEA C9            [10]  188 	ret
   6CEB                     189 00102$:
                            190 ;src/menu.c:55: loop_counter += 1;
   6CEB FD 21 63 75   [14]  191 	ld	iy, #_loop_counter
   6CEF FD 34 00      [23]  192 	inc	0 (iy)
                            193 ;src/menu.c:56: if (loop_counter > COLOR_CYCLE_FREQ)
   6CF2 3E 0A         [ 7]  194 	ld	a, #0x0a
   6CF4 FD 96 00      [19]  195 	sub	a, 0 (iy)
   6CF7 30 1C         [12]  196 	jr	NC,00104$
                            197 ;src/menu.c:58: loop_counter = 0;
   6CF9 FD 36 00 00   [19]  198 	ld	0 (iy), #0x00
                            199 ;src/menu.c:59: current_ink = (current_ink + 1) % 4;
   6CFD 21 64 75      [10]  200 	ld	hl,#_current_ink + 0
   6D00 4E            [ 7]  201 	ld	c, (hl)
   6D01 06 00         [ 7]  202 	ld	b, #0x00
   6D03 03            [ 6]  203 	inc	bc
   6D04 21 04 00      [10]  204 	ld	hl, #0x0004
   6D07 E5            [11]  205 	push	hl
   6D08 C5            [11]  206 	push	bc
   6D09 CD 75 71      [17]  207 	call	__modsint
   6D0C F1            [10]  208 	pop	af
   6D0D F1            [10]  209 	pop	af
   6D0E FD 21 64 75   [14]  210 	ld	iy, #_current_ink
   6D12 FD 75 00      [19]  211 	ld	0 (iy), l
   6D15                     212 00104$:
                            213 ;src/menu.c:62: return Continue;
   6D15 2E 00         [ 7]  214 	ld	l, #0x00
   6D17 C9            [10]  215 	ret
                            216 ;src/menu.c:65: void module_menu_initialize()
                            217 ;	---------------------------------
                            218 ; Function module_menu_initialize
                            219 ; ---------------------------------
   6D18                     220 _module_menu_initialize::
                            221 ;src/menu.c:67: scene_menu.initialize = menu_initialize;
   6D18 21 16 6C      [10]  222 	ld	hl, #_menu_initialize
   6D1B 22 5D 75      [16]  223 	ld	(_scene_menu), hl
                            224 ;src/menu.c:68: scene_menu.update = menu_update;
   6D1E 21 DE 6C      [10]  225 	ld	hl, #_menu_update
   6D21 22 61 75      [16]  226 	ld	((_scene_menu + 0x0004)), hl
                            227 ;src/menu.c:69: scene_menu.draw = menu_draw;
   6D24 21 A3 6C      [10]  228 	ld	hl, #_menu_draw
   6D27 22 5F 75      [16]  229 	ld	((_scene_menu + 0x0002)), hl
   6D2A C9            [10]  230 	ret
                            231 ;src/menu.c:72: void menu_print_message(u8 x, u8 y, u8 fg, char *message)
                            232 ;	---------------------------------
                            233 ; Function menu_print_message
                            234 ; ---------------------------------
   6D2B                     235 _menu_print_message::
                            236 ;src/menu.c:74: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   6D2B 21 03 00      [10]  237 	ld	hl, #3+0
   6D2E 39            [11]  238 	add	hl, sp
   6D2F 7E            [ 7]  239 	ld	a, (hl)
   6D30 F5            [11]  240 	push	af
   6D31 33            [ 6]  241 	inc	sp
   6D32 21 03 00      [10]  242 	ld	hl, #3+0
   6D35 39            [11]  243 	add	hl, sp
   6D36 7E            [ 7]  244 	ld	a, (hl)
   6D37 F5            [11]  245 	push	af
   6D38 33            [ 6]  246 	inc	sp
   6D39 21 00 C0      [10]  247 	ld	hl, #0xc000
   6D3C E5            [11]  248 	push	hl
   6D3D CD A7 71      [17]  249 	call	_cpct_getScreenPtr
                            250 ;src/menu.c:75: cpct_setDrawCharM0(fg, AN_PEN_BLACK);
   6D40 E5            [11]  251 	push	hl
   6D41 AF            [ 4]  252 	xor	a, a
   6D42 F5            [11]  253 	push	af
   6D43 33            [ 6]  254 	inc	sp
   6D44 21 07 00      [10]  255 	ld	hl, #7+0
   6D47 39            [11]  256 	add	hl, sp
   6D48 7E            [ 7]  257 	ld	a, (hl)
   6D49 F5            [11]  258 	push	af
   6D4A 33            [ 6]  259 	inc	sp
   6D4B CD 82 71      [17]  260 	call	_cpct_setDrawCharM0
   6D4E 21 07 00      [10]  261 	ld	hl, #7
   6D51 39            [11]  262 	add	hl, sp
   6D52 4E            [ 7]  263 	ld	c, (hl)
   6D53 23            [ 6]  264 	inc	hl
   6D54 46            [ 7]  265 	ld	b, (hl)
   6D55 C5            [11]  266 	push	bc
   6D56 CD F3 6D      [17]  267 	call	_cpct_drawStringM0
   6D59 C9            [10]  268 	ret
                            269 	.area _CODE
                            270 	.area _INITIALIZER
                            271 	.area _CABS (ABS)
