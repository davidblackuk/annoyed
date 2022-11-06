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
                             15 	.globl _text_write_centered_string
                             16 	.globl _keys_update
                             17 	.globl _keys_initialize
                             18 	.globl _cpct_getScreenPtr
                             19 	.globl _cpct_drawSprite
                             20 	.globl _cpct_isAnyKeyPressed
                             21 	.globl _cpct_memset
                             22 	.globl _scene_menu
                             23 	.globl _write_text
                             24 ;--------------------------------------------------------
                             25 ; special function registers
                             26 ;--------------------------------------------------------
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DATA
   936D                      31 _scene_menu::
   936D                      32 	.ds 6
                             33 ;--------------------------------------------------------
                             34 ; ram data
                             35 ;--------------------------------------------------------
                             36 	.area _INITIALIZED
                             37 ;--------------------------------------------------------
                             38 ; absolute external ram data
                             39 ;--------------------------------------------------------
                             40 	.area _DABS (ABS)
                             41 ;--------------------------------------------------------
                             42 ; global & static initialisations
                             43 ;--------------------------------------------------------
                             44 	.area _HOME
                             45 	.area _GSINIT
                             46 	.area _GSFINAL
                             47 	.area _GSINIT
                             48 ;--------------------------------------------------------
                             49 ; Home
                             50 ;--------------------------------------------------------
                             51 	.area _HOME
                             52 	.area _HOME
                             53 ;--------------------------------------------------------
                             54 ; code
                             55 ;--------------------------------------------------------
                             56 	.area _CODE
                             57 ;src/menu.c:27: void menu_initialize()
                             58 ;	---------------------------------
                             59 ; Function menu_initialize
                             60 ; ---------------------------------
   86D8                      61 _menu_initialize::
                             62 ;src/menu.c:29: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, (SCREEN_WIDTH_BYTES - SP_LOGO_W) / 2, 0);
   86D8 21 0B 00      [10]   63 	ld	hl, #0x000b
   86DB E5            [11]   64 	push	hl
   86DC 21 00 C0      [10]   65 	ld	hl, #0xc000
   86DF E5            [11]   66 	push	hl
   86E0 CD FF 8D      [17]   67 	call	_cpct_getScreenPtr
                             68 ;src/menu.c:30: cpct_clearScreen(AN_PEN_BLACK);
   86E3 E5            [11]   69 	push	hl
   86E4 01 00 40      [10]   70 	ld	bc, #0x4000
   86E7 C5            [11]   71 	push	bc
   86E8 AF            [ 4]   72 	xor	a, a
   86E9 F5            [11]   73 	push	af
   86EA 33            [ 6]   74 	inc	sp
   86EB 01 00 C0      [10]   75 	ld	bc, #0xc000
   86EE C5            [11]   76 	push	bc
   86EF CD CB 8C      [17]   77 	call	_cpct_memset
   86F2 CD A8 84      [17]   78 	call	_keys_initialize
   86F5 E1            [10]   79 	pop	hl
                             80 ;src/menu.c:34: cpct_drawSprite(sp_logo, pvmem, SP_LOGO_W, SP_LOGO_H);
   86F6 01 2E 6A      [10]   81 	ld	bc, #_sp_logo+0
   86F9 11 39 2D      [10]   82 	ld	de, #0x2d39
   86FC D5            [11]   83 	push	de
   86FD E5            [11]   84 	push	hl
   86FE C5            [11]   85 	push	bc
   86FF CD 94 8A      [17]   86 	call	_cpct_drawSprite
                             87 ;src/menu.c:35: write_text();
   8702 CD 2A 87      [17]   88 	call	_write_text
   8705 C9            [10]   89 	ret
                             90 ;src/menu.c:38: void menu_draw()
                             91 ;	---------------------------------
                             92 ; Function menu_draw
                             93 ; ---------------------------------
   8706                      94 _menu_draw::
                             95 ;src/menu.c:40: }
   8706 C9            [10]   96 	ret
                             97 ;src/menu.c:42: SceneState menu_update()
                             98 ;	---------------------------------
                             99 ; Function menu_update
                            100 ; ---------------------------------
   8707                     101 _menu_update::
                            102 ;src/menu.c:44: keys_update();
   8707 CD C5 84      [17]  103 	call	_keys_update
                            104 ;src/menu.c:45: if (cpct_isAnyKeyPressed())
   870A CD 8D 8C      [17]  105 	call	_cpct_isAnyKeyPressed
   870D 7D            [ 4]  106 	ld	a, l
   870E B7            [ 4]  107 	or	a, a
   870F 28 03         [12]  108 	jr	Z,00102$
                            109 ;src/menu.c:47: return SceneComplete;
   8711 2E 01         [ 7]  110 	ld	l, #0x01
   8713 C9            [10]  111 	ret
   8714                     112 00102$:
                            113 ;src/menu.c:50: return Continue;
   8714 2E 00         [ 7]  114 	ld	l, #0x00
   8716 C9            [10]  115 	ret
                            116 ;src/menu.c:53: void module_menu_initialize()
                            117 ;	---------------------------------
                            118 ; Function module_menu_initialize
                            119 ; ---------------------------------
   8717                     120 _module_menu_initialize::
                            121 ;src/menu.c:55: scene_menu.initialize = menu_initialize;
   8717 21 D8 86      [10]  122 	ld	hl, #_menu_initialize
   871A 22 6D 93      [16]  123 	ld	(_scene_menu), hl
                            124 ;src/menu.c:56: scene_menu.update = menu_update;
   871D 21 07 87      [10]  125 	ld	hl, #_menu_update
   8720 22 71 93      [16]  126 	ld	((_scene_menu + 0x0004)), hl
                            127 ;src/menu.c:57: scene_menu.draw = menu_draw;
   8723 21 06 87      [10]  128 	ld	hl, #_menu_draw
   8726 22 6F 93      [16]  129 	ld	((_scene_menu + 0x0002)), hl
   8729 C9            [10]  130 	ret
                            131 ;src/menu.c:64: void write_text()
                            132 ;	---------------------------------
                            133 ; Function write_text
                            134 ; ---------------------------------
   872A                     135 _write_text::
                            136 ;src/menu.c:66: text_write_centered_string(64, "AFTER A SERIES OF FRANKLY BIZZARE EVENTS");
   872A 21 8C 87      [10]  137 	ld	hl, #___str_0
   872D E5            [11]  138 	push	hl
   872E 3E 40         [ 7]  139 	ld	a, #0x40
   8730 F5            [11]  140 	push	af
   8731 33            [ 6]  141 	inc	sp
   8732 CD 75 88      [17]  142 	call	_text_write_centered_string
                            143 ;src/menu.c:67: text_write_centered_string(76, "YOUR SPACESHIP IS IN TROUBLE.");
   8735 33            [ 6]  144 	inc	sp
   8736 21 B5 87      [10]  145 	ld	hl,#___str_1
   8739 E3            [19]  146 	ex	(sp),hl
   873A 3E 4C         [ 7]  147 	ld	a, #0x4c
   873C F5            [11]  148 	push	af
   873D 33            [ 6]  149 	inc	sp
   873E CD 75 88      [17]  150 	call	_text_write_centered_string
                            151 ;src/menu.c:69: text_write_centered_string(96, "INEXPLICABLY, TO SURVIVE, YOU NEED TO");
   8741 33            [ 6]  152 	inc	sp
   8742 21 D3 87      [10]  153 	ld	hl,#___str_2
   8745 E3            [19]  154 	ex	(sp),hl
   8746 3E 60         [ 7]  155 	ld	a, #0x60
   8748 F5            [11]  156 	push	af
   8749 33            [ 6]  157 	inc	sp
   874A CD 75 88      [17]  158 	call	_text_write_centered_string
                            159 ;src/menu.c:70: text_write_centered_string(108, "REMOVE BLOCKS FROM A WALL USING A BALL.");
   874D 33            [ 6]  160 	inc	sp
   874E 21 F9 87      [10]  161 	ld	hl,#___str_3
   8751 E3            [19]  162 	ex	(sp),hl
   8752 3E 6C         [ 7]  163 	ld	a, #0x6c
   8754 F5            [11]  164 	push	af
   8755 33            [ 6]  165 	inc	sp
   8756 CD 75 88      [17]  166 	call	_text_write_centered_string
                            167 ;src/menu.c:72: text_write_centered_string(132, "YEAH, WE KNOW...");
   8759 33            [ 6]  168 	inc	sp
   875A 21 21 88      [10]  169 	ld	hl,#___str_4
   875D E3            [19]  170 	ex	(sp),hl
   875E 3E 84         [ 7]  171 	ld	a, #0x84
   8760 F5            [11]  172 	push	af
   8761 33            [ 6]  173 	inc	sp
   8762 CD 75 88      [17]  174 	call	_text_write_centered_string
                            175 ;src/menu.c:74: text_write_centered_string(156, "WASD OR ARROW KEYS TO PLAY.");
   8765 33            [ 6]  176 	inc	sp
   8766 21 32 88      [10]  177 	ld	hl,#___str_5
   8769 E3            [19]  178 	ex	(sp),hl
   876A 3E 9C         [ 7]  179 	ld	a, #0x9c
   876C F5            [11]  180 	push	af
   876D 33            [ 6]  181 	inc	sp
   876E CD 75 88      [17]  182 	call	_text_write_centered_string
                            183 ;src/menu.c:75: text_write_centered_string(168, "UP TO SERVE");
   8771 33            [ 6]  184 	inc	sp
   8772 21 4E 88      [10]  185 	ld	hl,#___str_6
   8775 E3            [19]  186 	ex	(sp),hl
   8776 3E A8         [ 7]  187 	ld	a, #0xa8
   8778 F5            [11]  188 	push	af
   8779 33            [ 6]  189 	inc	sp
   877A CD 75 88      [17]  190 	call	_text_write_centered_string
                            191 ;src/menu.c:77: text_write_centered_string(200 - 8, "PRESS ANY OLD KEY TO START");
   877D 33            [ 6]  192 	inc	sp
   877E 21 5A 88      [10]  193 	ld	hl,#___str_7
   8781 E3            [19]  194 	ex	(sp),hl
   8782 3E C0         [ 7]  195 	ld	a, #0xc0
   8784 F5            [11]  196 	push	af
   8785 33            [ 6]  197 	inc	sp
   8786 CD 75 88      [17]  198 	call	_text_write_centered_string
   8789 F1            [10]  199 	pop	af
   878A 33            [ 6]  200 	inc	sp
   878B C9            [10]  201 	ret
   878C                     202 ___str_0:
   878C 41 46 54 45 52 20   203 	.ascii "AFTER A SERIES OF FRANKLY BIZZARE EVENTS"
        41 20 53 45 52 49
        45 53 20 4F 46 20
        46 52 41 4E 4B 4C
        59 20 42 49 5A 5A
        41 52 45 20 45 56
        45 4E 54 53
   87B4 00                  204 	.db 0x00
   87B5                     205 ___str_1:
   87B5 59 4F 55 52 20 53   206 	.ascii "YOUR SPACESHIP IS IN TROUBLE."
        50 41 43 45 53 48
        49 50 20 49 53 20
        49 4E 20 54 52 4F
        55 42 4C 45 2E
   87D2 00                  207 	.db 0x00
   87D3                     208 ___str_2:
   87D3 49 4E 45 58 50 4C   209 	.ascii "INEXPLICABLY, TO SURVIVE, YOU NEED TO"
        49 43 41 42 4C 59
        2C 20 54 4F 20 53
        55 52 56 49 56 45
        2C 20 59 4F 55 20
        4E 45 45 44 20 54
        4F
   87F8 00                  210 	.db 0x00
   87F9                     211 ___str_3:
   87F9 52 45 4D 4F 56 45   212 	.ascii "REMOVE BLOCKS FROM A WALL USING A BALL."
        20 42 4C 4F 43 4B
        53 20 46 52 4F 4D
        20 41 20 57 41 4C
        4C 20 55 53 49 4E
        47 20 41 20 42 41
        4C 4C 2E
   8820 00                  213 	.db 0x00
   8821                     214 ___str_4:
   8821 59 45 41 48 2C 20   215 	.ascii "YEAH, WE KNOW..."
        57 45 20 4B 4E 4F
        57 2E 2E 2E
   8831 00                  216 	.db 0x00
   8832                     217 ___str_5:
   8832 57 41 53 44 20 4F   218 	.ascii "WASD OR ARROW KEYS TO PLAY."
        52 20 41 52 52 4F
        57 20 4B 45 59 53
        20 54 4F 20 50 4C
        41 59 2E
   884D 00                  219 	.db 0x00
   884E                     220 ___str_6:
   884E 55 50 20 54 4F 20   221 	.ascii "UP TO SERVE"
        53 45 52 56 45
   8859 00                  222 	.db 0x00
   885A                     223 ___str_7:
   885A 50 52 45 53 53 20   224 	.ascii "PRESS ANY OLD KEY TO START"
        41 4E 59 20 4F 4C
        44 20 4B 45 59 20
        54 4F 20 53 54 41
        52 54
   8874 00                  225 	.db 0x00
                            226 	.area _CODE
                            227 	.area _INITIALIZER
                            228 	.area _CABS (ABS)
