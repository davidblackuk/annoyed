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
   92B2                      31 _scene_menu::
   92B2                      32 	.ds 6
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
   861D                      61 _menu_initialize::
                             62 ;src/menu.c:29: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, (SCREEN_WIDTH_BYTES - SP_LOGO_W) / 2, 0);
   861D 21 0B 00      [10]   63 	ld	hl, #0x000b
   8620 E5            [11]   64 	push	hl
   8621 21 00 C0      [10]   65 	ld	hl, #0xc000
   8624 E5            [11]   66 	push	hl
   8625 CD 44 8D      [17]   67 	call	_cpct_getScreenPtr
                             68 ;src/menu.c:30: cpct_clearScreen(AN_PEN_BLACK);
   8628 E5            [11]   69 	push	hl
   8629 01 00 40      [10]   70 	ld	bc, #0x4000
   862C C5            [11]   71 	push	bc
   862D AF            [ 4]   72 	xor	a, a
   862E F5            [11]   73 	push	af
   862F 33            [ 6]   74 	inc	sp
   8630 01 00 C0      [10]   75 	ld	bc, #0xc000
   8633 C5            [11]   76 	push	bc
   8634 CD 10 8C      [17]   77 	call	_cpct_memset
   8637 CD ED 83      [17]   78 	call	_keys_initialize
   863A E1            [10]   79 	pop	hl
                             80 ;src/menu.c:34: cpct_drawSprite(sp_logo, pvmem, SP_LOGO_W, SP_LOGO_H);
   863B 01 2E 6A      [10]   81 	ld	bc, #_sp_logo+0
   863E 11 39 2D      [10]   82 	ld	de, #0x2d39
   8641 D5            [11]   83 	push	de
   8642 E5            [11]   84 	push	hl
   8643 C5            [11]   85 	push	bc
   8644 CD D9 89      [17]   86 	call	_cpct_drawSprite
                             87 ;src/menu.c:35: write_text();
   8647 CD 6F 86      [17]   88 	call	_write_text
   864A C9            [10]   89 	ret
                             90 ;src/menu.c:38: void menu_draw()
                             91 ;	---------------------------------
                             92 ; Function menu_draw
                             93 ; ---------------------------------
   864B                      94 _menu_draw::
                             95 ;src/menu.c:40: }
   864B C9            [10]   96 	ret
                             97 ;src/menu.c:42: SceneState menu_update()
                             98 ;	---------------------------------
                             99 ; Function menu_update
                            100 ; ---------------------------------
   864C                     101 _menu_update::
                            102 ;src/menu.c:44: keys_update();
   864C CD 0A 84      [17]  103 	call	_keys_update
                            104 ;src/menu.c:45: if (cpct_isAnyKeyPressed())
   864F CD D2 8B      [17]  105 	call	_cpct_isAnyKeyPressed
   8652 7D            [ 4]  106 	ld	a, l
   8653 B7            [ 4]  107 	or	a, a
   8654 28 03         [12]  108 	jr	Z,00102$
                            109 ;src/menu.c:47: return SceneComplete;
   8656 2E 01         [ 7]  110 	ld	l, #0x01
   8658 C9            [10]  111 	ret
   8659                     112 00102$:
                            113 ;src/menu.c:50: return Continue;
   8659 2E 00         [ 7]  114 	ld	l, #0x00
   865B C9            [10]  115 	ret
                            116 ;src/menu.c:53: void module_menu_initialize()
                            117 ;	---------------------------------
                            118 ; Function module_menu_initialize
                            119 ; ---------------------------------
   865C                     120 _module_menu_initialize::
                            121 ;src/menu.c:55: scene_menu.initialize = menu_initialize;
   865C 21 1D 86      [10]  122 	ld	hl, #_menu_initialize
   865F 22 B2 92      [16]  123 	ld	(_scene_menu), hl
                            124 ;src/menu.c:56: scene_menu.update = menu_update;
   8662 21 4C 86      [10]  125 	ld	hl, #_menu_update
   8665 22 B6 92      [16]  126 	ld	((_scene_menu + 0x0004)), hl
                            127 ;src/menu.c:57: scene_menu.draw = menu_draw;
   8668 21 4B 86      [10]  128 	ld	hl, #_menu_draw
   866B 22 B4 92      [16]  129 	ld	((_scene_menu + 0x0002)), hl
   866E C9            [10]  130 	ret
                            131 ;src/menu.c:64: void write_text()
                            132 ;	---------------------------------
                            133 ; Function write_text
                            134 ; ---------------------------------
   866F                     135 _write_text::
                            136 ;src/menu.c:66: text_write_centered_string(64, "AFTER A SERIES OF FRANKLY BIZZARE EVENTS");
   866F 21 D1 86      [10]  137 	ld	hl, #___str_0
   8672 E5            [11]  138 	push	hl
   8673 3E 40         [ 7]  139 	ld	a, #0x40
   8675 F5            [11]  140 	push	af
   8676 33            [ 6]  141 	inc	sp
   8677 CD BA 87      [17]  142 	call	_text_write_centered_string
                            143 ;src/menu.c:67: text_write_centered_string(76, "YOUR SPACESHIP IS IN TROUBLE.");
   867A 33            [ 6]  144 	inc	sp
   867B 21 FA 86      [10]  145 	ld	hl,#___str_1
   867E E3            [19]  146 	ex	(sp),hl
   867F 3E 4C         [ 7]  147 	ld	a, #0x4c
   8681 F5            [11]  148 	push	af
   8682 33            [ 6]  149 	inc	sp
   8683 CD BA 87      [17]  150 	call	_text_write_centered_string
                            151 ;src/menu.c:69: text_write_centered_string(96, "INEXPLICABLY, TO SURVIVE, YOU NEED TO");
   8686 33            [ 6]  152 	inc	sp
   8687 21 18 87      [10]  153 	ld	hl,#___str_2
   868A E3            [19]  154 	ex	(sp),hl
   868B 3E 60         [ 7]  155 	ld	a, #0x60
   868D F5            [11]  156 	push	af
   868E 33            [ 6]  157 	inc	sp
   868F CD BA 87      [17]  158 	call	_text_write_centered_string
                            159 ;src/menu.c:70: text_write_centered_string(108, "REMOVE BLOCKS FROM A WALL USING A BALL.");
   8692 33            [ 6]  160 	inc	sp
   8693 21 3E 87      [10]  161 	ld	hl,#___str_3
   8696 E3            [19]  162 	ex	(sp),hl
   8697 3E 6C         [ 7]  163 	ld	a, #0x6c
   8699 F5            [11]  164 	push	af
   869A 33            [ 6]  165 	inc	sp
   869B CD BA 87      [17]  166 	call	_text_write_centered_string
                            167 ;src/menu.c:72: text_write_centered_string(132, "YEAH, WE KNOW...");
   869E 33            [ 6]  168 	inc	sp
   869F 21 66 87      [10]  169 	ld	hl,#___str_4
   86A2 E3            [19]  170 	ex	(sp),hl
   86A3 3E 84         [ 7]  171 	ld	a, #0x84
   86A5 F5            [11]  172 	push	af
   86A6 33            [ 6]  173 	inc	sp
   86A7 CD BA 87      [17]  174 	call	_text_write_centered_string
                            175 ;src/menu.c:74: text_write_centered_string(156, "WASD OR ARROW KEYS TO PLAY.");
   86AA 33            [ 6]  176 	inc	sp
   86AB 21 77 87      [10]  177 	ld	hl,#___str_5
   86AE E3            [19]  178 	ex	(sp),hl
   86AF 3E 9C         [ 7]  179 	ld	a, #0x9c
   86B1 F5            [11]  180 	push	af
   86B2 33            [ 6]  181 	inc	sp
   86B3 CD BA 87      [17]  182 	call	_text_write_centered_string
                            183 ;src/menu.c:75: text_write_centered_string(168, "UP TO SERVE");
   86B6 33            [ 6]  184 	inc	sp
   86B7 21 93 87      [10]  185 	ld	hl,#___str_6
   86BA E3            [19]  186 	ex	(sp),hl
   86BB 3E A8         [ 7]  187 	ld	a, #0xa8
   86BD F5            [11]  188 	push	af
   86BE 33            [ 6]  189 	inc	sp
   86BF CD BA 87      [17]  190 	call	_text_write_centered_string
                            191 ;src/menu.c:77: text_write_centered_string(200 - 8, "PRESS ANY OLD KEY TO START");
   86C2 33            [ 6]  192 	inc	sp
   86C3 21 9F 87      [10]  193 	ld	hl,#___str_7
   86C6 E3            [19]  194 	ex	(sp),hl
   86C7 3E C0         [ 7]  195 	ld	a, #0xc0
   86C9 F5            [11]  196 	push	af
   86CA 33            [ 6]  197 	inc	sp
   86CB CD BA 87      [17]  198 	call	_text_write_centered_string
   86CE F1            [10]  199 	pop	af
   86CF 33            [ 6]  200 	inc	sp
   86D0 C9            [10]  201 	ret
   86D1                     202 ___str_0:
   86D1 41 46 54 45 52 20   203 	.ascii "AFTER A SERIES OF FRANKLY BIZZARE EVENTS"
        41 20 53 45 52 49
        45 53 20 4F 46 20
        46 52 41 4E 4B 4C
        59 20 42 49 5A 5A
        41 52 45 20 45 56
        45 4E 54 53
   86F9 00                  204 	.db 0x00
   86FA                     205 ___str_1:
   86FA 59 4F 55 52 20 53   206 	.ascii "YOUR SPACESHIP IS IN TROUBLE."
        50 41 43 45 53 48
        49 50 20 49 53 20
        49 4E 20 54 52 4F
        55 42 4C 45 2E
   8717 00                  207 	.db 0x00
   8718                     208 ___str_2:
   8718 49 4E 45 58 50 4C   209 	.ascii "INEXPLICABLY, TO SURVIVE, YOU NEED TO"
        49 43 41 42 4C 59
        2C 20 54 4F 20 53
        55 52 56 49 56 45
        2C 20 59 4F 55 20
        4E 45 45 44 20 54
        4F
   873D 00                  210 	.db 0x00
   873E                     211 ___str_3:
   873E 52 45 4D 4F 56 45   212 	.ascii "REMOVE BLOCKS FROM A WALL USING A BALL."
        20 42 4C 4F 43 4B
        53 20 46 52 4F 4D
        20 41 20 57 41 4C
        4C 20 55 53 49 4E
        47 20 41 20 42 41
        4C 4C 2E
   8765 00                  213 	.db 0x00
   8766                     214 ___str_4:
   8766 59 45 41 48 2C 20   215 	.ascii "YEAH, WE KNOW..."
        57 45 20 4B 4E 4F
        57 2E 2E 2E
   8776 00                  216 	.db 0x00
   8777                     217 ___str_5:
   8777 57 41 53 44 20 4F   218 	.ascii "WASD OR ARROW KEYS TO PLAY."
        52 20 41 52 52 4F
        57 20 4B 45 59 53
        20 54 4F 20 50 4C
        41 59 2E
   8792 00                  219 	.db 0x00
   8793                     220 ___str_6:
   8793 55 50 20 54 4F 20   221 	.ascii "UP TO SERVE"
        53 45 52 56 45
   879E 00                  222 	.db 0x00
   879F                     223 ___str_7:
   879F 50 52 45 53 53 20   224 	.ascii "PRESS ANY OLD KEY TO START"
        41 4E 59 20 4F 4C
        44 20 4B 45 59 20
        54 4F 20 53 54 41
        52 54
   87B9 00                  225 	.db 0x00
                            226 	.area _CODE
                            227 	.area _INITIALIZER
                            228 	.area _CABS (ABS)
