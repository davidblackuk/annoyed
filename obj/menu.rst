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
   6D99                      34 _scene_menu::
   6D99                      35 	.ds 6
   6D9F                      36 _loop_counter::
   6D9F                      37 	.ds 1
   6DA0                      38 _current_ink::
   6DA0                      39 	.ds 1
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
   67C4                      68 _menu_initialize::
                             69 ;src/menu.c:25: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, (SCREEN_WIDTH_BYTES - SP_LOGO_W) / 2, 16);
   67C4 21 0B 10      [10]   70 	ld	hl, #0x100b
   67C7 E5            [11]   71 	push	hl
   67C8 21 00 C0      [10]   72 	ld	hl, #0xc000
   67CB E5            [11]   73 	push	hl
   67CC CD BF 6C      [17]   74 	call	_cpct_getScreenPtr
                             75 ;src/menu.c:27: keys_initialize();
   67CF E5            [11]   76 	push	hl
   67D0 CD 55 66      [17]   77 	call	_keys_initialize
   67D3 C1            [10]   78 	pop	bc
                             79 ;src/menu.c:29: loop_counter = 0;
   67D4 21 9F 6D      [10]   80 	ld	hl,#_loop_counter + 0
   67D7 36 00         [10]   81 	ld	(hl), #0x00
                             82 ;src/menu.c:30: cpct_drawSprite(sp_logo, pvmem, SP_LOGO_W, SP_LOGO_H);
   67D9 21 39 2D      [10]   83 	ld	hl, #0x2d39
   67DC E5            [11]   84 	push	hl
   67DD C5            [11]   85 	push	bc
   67DE 21 18 56      [10]   86 	ld	hl, #_sp_logo
   67E1 E5            [11]   87 	push	hl
   67E2 CD 50 6A      [17]   88 	call	_cpct_drawSprite
                             89 ;src/menu.c:34: menu_print_message(4, 90, AN_PEN_PASTEL_CYAN, "\xf2 or a: move left");
   67E5 21 1E 68      [10]   90 	ld	hl, #___str_0
   67E8 E5            [11]   91 	push	hl
   67E9 21 5A 03      [10]   92 	ld	hl, #0x035a
   67EC E5            [11]   93 	push	hl
   67ED 3E 04         [ 7]   94 	ld	a, #0x04
   67EF F5            [11]   95 	push	af
   67F0 33            [ 6]   96 	inc	sp
   67F1 CD EA 68      [17]   97 	call	_menu_print_message
   67F4 F1            [10]   98 	pop	af
                             99 ;src/menu.c:35: menu_print_message(4, 105, AN_PEN_PASTEL_MAGENTA, "\xf3 or d: move right");
   67F5 33            [ 6]  100 	inc	sp
   67F6 21 30 68      [10]  101 	ld	hl,#___str_1
   67F9 E3            [19]  102 	ex	(sp),hl
   67FA 21 69 07      [10]  103 	ld	hl, #0x0769
   67FD E5            [11]  104 	push	hl
   67FE 3E 04         [ 7]  105 	ld	a, #0x04
   6800 F5            [11]  106 	push	af
   6801 33            [ 6]  107 	inc	sp
   6802 CD EA 68      [17]  108 	call	_menu_print_message
   6805 F1            [10]  109 	pop	af
                            110 ;src/menu.c:36: menu_print_message(4, 120, AN_PEN_PASTEL_YELLOW, "\xf0 or w: serve");
   6806 33            [ 6]  111 	inc	sp
   6807 21 43 68      [10]  112 	ld	hl,#___str_2
   680A E3            [19]  113 	ex	(sp),hl
   680B 21 78 08      [10]  114 	ld	hl, #0x0878
   680E E5            [11]  115 	push	hl
   680F 3E 04         [ 7]  116 	ld	a, #0x04
   6811 F5            [11]  117 	push	af
   6812 33            [ 6]  118 	inc	sp
   6813 CD EA 68      [17]  119 	call	_menu_print_message
   6816 F1            [10]  120 	pop	af
   6817 F1            [10]  121 	pop	af
   6818 33            [ 6]  122 	inc	sp
   6819 C9            [10]  123 	ret
   681A                     124 _fg_pens:
   681A 01                  125 	.db #0x01	; 1
   681B 03                  126 	.db #0x03	; 3
   681C 06                  127 	.db #0x06	; 6
   681D 07                  128 	.db #0x07	; 7
   681E                     129 ___str_0:
   681E F2                  130 	.db 0xf2
   681F 20 6F 72 20 61 3A   131 	.ascii " or a: move left"
        20 6D 6F 76 65 20
        6C 65 66 74
   682F 00                  132 	.db 0x00
   6830                     133 ___str_1:
   6830 F3                  134 	.db 0xf3
   6831 20 6F 72 20 64 3A   135 	.ascii " or d: move right"
        20 6D 6F 76 65 20
        72 69 67 68 74
   6842 00                  136 	.db 0x00
   6843                     137 ___str_2:
   6843 F0                  138 	.db 0xf0
   6844 20 6F 72 20 77 3A   139 	.ascii " or w: serve"
        20 73 65 72 76 65
   6850 00                  140 	.db 0x00
                            141 ;src/menu.c:39: void menu_draw()
                            142 ;	---------------------------------
                            143 ; Function menu_draw
                            144 ; ---------------------------------
   6851                     145 _menu_draw::
                            146 ;src/menu.c:41: void *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 14, SCREEN_HEIGHT_ROWS - 16);
   6851 21 0E B8      [10]  147 	ld	hl, #0xb80e
   6854 E5            [11]  148 	push	hl
   6855 21 00 C0      [10]  149 	ld	hl, #0xc000
   6858 E5            [11]  150 	push	hl
   6859 CD BF 6C      [17]  151 	call	_cpct_getScreenPtr
   685C 4D            [ 4]  152 	ld	c, l
   685D 44            [ 4]  153 	ld	b, h
                            154 ;src/menu.c:43: cpct_setDrawCharM0(fg_pens[current_ink], 0);
   685E 11 1A 68      [10]  155 	ld	de, #_fg_pens+0
   6861 FD 21 A0 6D   [14]  156 	ld	iy, #_current_ink
   6865 FD 6E 00      [19]  157 	ld	l, 0 (iy)
   6868 FD 7E 00      [19]  158 	ld	a, 0 (iy)
   686B 17            [ 4]  159 	rla
   686C 9F            [ 4]  160 	sbc	a, a
   686D 67            [ 4]  161 	ld	h, a
   686E 19            [11]  162 	add	hl, de
   686F 56            [ 7]  163 	ld	d, (hl)
   6870 C5            [11]  164 	push	bc
   6871 AF            [ 4]  165 	xor	a, a
   6872 F5            [11]  166 	push	af
   6873 33            [ 6]  167 	inc	sp
   6874 D5            [11]  168 	push	de
   6875 33            [ 6]  169 	inc	sp
   6876 CD 9A 6C      [17]  170 	call	_cpct_setDrawCharM0
   6879 21 81 68      [10]  171 	ld	hl, #___str_3
   687C E5            [11]  172 	push	hl
   687D CD B2 69      [17]  173 	call	_cpct_drawStringM0
   6880 C9            [10]  174 	ret
   6881                     175 ___str_3:
   6881 50 72 65 73 73 20   176 	.ascii "Press any key"
        61 6E 79 20 6B 65
        79
   688E 00                  177 	.db 0x00
                            178 ;src/menu.c:47: SceneState menu_update()
                            179 ;	---------------------------------
                            180 ; Function menu_update
                            181 ; ---------------------------------
   688F                     182 _menu_update::
                            183 ;src/menu.c:49: keys_update();
   688F CD 72 66      [17]  184 	call	_keys_update
                            185 ;src/menu.c:50: if (cpct_isAnyKeyPressed())
   6892 CD 03 6C      [17]  186 	call	_cpct_isAnyKeyPressed
   6895 7D            [ 4]  187 	ld	a, l
   6896 B7            [ 4]  188 	or	a, a
   6897 28 03         [12]  189 	jr	Z,00102$
                            190 ;src/menu.c:52: return SceneComplete;
   6899 2E 01         [ 7]  191 	ld	l, #0x01
   689B C9            [10]  192 	ret
   689C                     193 00102$:
                            194 ;src/menu.c:55: loop_counter += 1;
   689C FD 21 9F 6D   [14]  195 	ld	iy, #_loop_counter
   68A0 FD 34 00      [23]  196 	inc	0 (iy)
                            197 ;src/menu.c:56: if (loop_counter > COLOR_CYCLE_FREQ)
   68A3 3E 0A         [ 7]  198 	ld	a, #0x0a
   68A5 FD 96 00      [19]  199 	sub	a, 0 (iy)
   68A8 E2 AD 68      [10]  200 	jp	PO, 00115$
   68AB EE 80         [ 7]  201 	xor	a, #0x80
   68AD                     202 00115$:
   68AD F2 D4 68      [10]  203 	jp	P, 00104$
                            204 ;src/menu.c:58: loop_counter = 0;
   68B0 21 9F 6D      [10]  205 	ld	hl,#_loop_counter + 0
   68B3 36 00         [10]  206 	ld	(hl), #0x00
                            207 ;src/menu.c:59: current_ink = (current_ink + 1) % 4;
   68B5 FD 21 A0 6D   [14]  208 	ld	iy, #_current_ink
   68B9 FD 4E 00      [19]  209 	ld	c, 0 (iy)
   68BC FD 7E 00      [19]  210 	ld	a, 0 (iy)
   68BF 17            [ 4]  211 	rla
   68C0 9F            [ 4]  212 	sbc	a, a
   68C1 47            [ 4]  213 	ld	b, a
   68C2 03            [ 6]  214 	inc	bc
   68C3 21 04 00      [10]  215 	ld	hl, #0x0004
   68C6 E5            [11]  216 	push	hl
   68C7 C5            [11]  217 	push	bc
   68C8 CD 8D 6C      [17]  218 	call	__modsint
   68CB F1            [10]  219 	pop	af
   68CC F1            [10]  220 	pop	af
   68CD FD 21 A0 6D   [14]  221 	ld	iy, #_current_ink
   68D1 FD 75 00      [19]  222 	ld	0 (iy), l
   68D4                     223 00104$:
                            224 ;src/menu.c:62: return Continue;
   68D4 2E 00         [ 7]  225 	ld	l, #0x00
   68D6 C9            [10]  226 	ret
                            227 ;src/menu.c:65: void module_menu_initialize()
                            228 ;	---------------------------------
                            229 ; Function module_menu_initialize
                            230 ; ---------------------------------
   68D7                     231 _module_menu_initialize::
                            232 ;src/menu.c:67: scene_menu.initialize = menu_initialize;
   68D7 21 C4 67      [10]  233 	ld	hl, #_menu_initialize
   68DA 22 99 6D      [16]  234 	ld	(_scene_menu), hl
                            235 ;src/menu.c:68: scene_menu.update = menu_update;
   68DD 21 8F 68      [10]  236 	ld	hl, #_menu_update
   68E0 22 9D 6D      [16]  237 	ld	((_scene_menu + 0x0004)), hl
                            238 ;src/menu.c:69: scene_menu.draw = menu_draw;
   68E3 21 51 68      [10]  239 	ld	hl, #_menu_draw
   68E6 22 9B 6D      [16]  240 	ld	((_scene_menu + 0x0002)), hl
   68E9 C9            [10]  241 	ret
                            242 ;src/menu.c:72: void menu_print_message(u8 x, u8 y, u8 fg, char *message)
                            243 ;	---------------------------------
                            244 ; Function menu_print_message
                            245 ; ---------------------------------
   68EA                     246 _menu_print_message::
                            247 ;src/menu.c:74: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   68EA 21 03 00      [10]  248 	ld	hl, #3+0
   68ED 39            [11]  249 	add	hl, sp
   68EE 7E            [ 7]  250 	ld	a, (hl)
   68EF F5            [11]  251 	push	af
   68F0 33            [ 6]  252 	inc	sp
   68F1 21 03 00      [10]  253 	ld	hl, #3+0
   68F4 39            [11]  254 	add	hl, sp
   68F5 7E            [ 7]  255 	ld	a, (hl)
   68F6 F5            [11]  256 	push	af
   68F7 33            [ 6]  257 	inc	sp
   68F8 21 00 C0      [10]  258 	ld	hl, #0xc000
   68FB E5            [11]  259 	push	hl
   68FC CD BF 6C      [17]  260 	call	_cpct_getScreenPtr
                            261 ;src/menu.c:75: cpct_setDrawCharM0(fg, AN_PEN_BLACK);
   68FF E5            [11]  262 	push	hl
   6900 AF            [ 4]  263 	xor	a, a
   6901 F5            [11]  264 	push	af
   6902 33            [ 6]  265 	inc	sp
   6903 21 07 00      [10]  266 	ld	hl, #7+0
   6906 39            [11]  267 	add	hl, sp
   6907 7E            [ 7]  268 	ld	a, (hl)
   6908 F5            [11]  269 	push	af
   6909 33            [ 6]  270 	inc	sp
   690A CD 9A 6C      [17]  271 	call	_cpct_setDrawCharM0
   690D 21 07 00      [10]  272 	ld	hl, #7
   6910 39            [11]  273 	add	hl, sp
   6911 4E            [ 7]  274 	ld	c, (hl)
   6912 23            [ 6]  275 	inc	hl
   6913 46            [ 7]  276 	ld	b, (hl)
   6914 C5            [11]  277 	push	bc
   6915 CD B2 69      [17]  278 	call	_cpct_drawStringM0
   6918 C9            [10]  279 	ret
                            280 	.area _CODE
                            281 	.area _INITIALIZER
                            282 	.area _CABS (ABS)
