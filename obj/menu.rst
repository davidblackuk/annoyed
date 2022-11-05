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
                             16 	.globl _text_write_string
                             17 	.globl _keys_update
                             18 	.globl _keys_initialize
                             19 	.globl _cpct_getScreenPtr
                             20 	.globl _cpct_drawSprite
                             21 	.globl _cpct_isAnyKeyPressed
                             22 	.globl _cpct_memset
                             23 	.globl _current_ink
                             24 	.globl _loop_counter
                             25 	.globl _scene_menu
                             26 ;--------------------------------------------------------
                             27 ; special function registers
                             28 ;--------------------------------------------------------
                             29 ;--------------------------------------------------------
                             30 ; ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DATA
   8835                      33 _scene_menu::
   8835                      34 	.ds 6
   883B                      35 _loop_counter::
   883B                      36 	.ds 1
   883C                      37 _current_ink::
   883C                      38 	.ds 1
                             39 ;--------------------------------------------------------
                             40 ; ram data
                             41 ;--------------------------------------------------------
                             42 	.area _INITIALIZED
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
                             63 ;src/menu.c:18: void menu_initialize()
                             64 ;	---------------------------------
                             65 ; Function menu_initialize
                             66 ; ---------------------------------
   7B9E                      67 _menu_initialize::
                             68 ;src/menu.c:20: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, (SCREEN_WIDTH_BYTES - SP_LOGO_W) / 2, 0);
   7B9E 21 0B 00      [10]   69 	ld	hl, #0x000b
   7BA1 E5            [11]   70 	push	hl
   7BA2 21 00 C0      [10]   71 	ld	hl, #0xc000
   7BA5 E5            [11]   72 	push	hl
   7BA6 CD C9 82      [17]   73 	call	_cpct_getScreenPtr
                             74 ;src/menu.c:21: cpct_clearScreen(AN_PEN_BLACK);
   7BA9 E5            [11]   75 	push	hl
   7BAA 21 00 40      [10]   76 	ld	hl, #0x4000
   7BAD E5            [11]   77 	push	hl
   7BAE AF            [ 4]   78 	xor	a, a
   7BAF F5            [11]   79 	push	af
   7BB0 33            [ 6]   80 	inc	sp
   7BB1 26 C0         [ 7]   81 	ld	h, #0xc0
   7BB3 E5            [11]   82 	push	hl
   7BB4 CD 95 81      [17]   83 	call	_cpct_memset
   7BB7 CD 67 79      [17]   84 	call	_keys_initialize
   7BBA C1            [10]   85 	pop	bc
                             86 ;src/menu.c:25: loop_counter = 0;
   7BBB 21 3B 88      [10]   87 	ld	hl,#_loop_counter + 0
   7BBE 36 00         [10]   88 	ld	(hl), #0x00
                             89 ;src/menu.c:26: cpct_drawSprite(sp_logo, pvmem, SP_LOGO_W, SP_LOGO_H);
   7BC0 21 39 2D      [10]   90 	ld	hl, #0x2d39
   7BC3 E5            [11]   91 	push	hl
   7BC4 C5            [11]   92 	push	bc
   7BC5 21 66 5F      [10]   93 	ld	hl, #_sp_logo
   7BC8 E5            [11]   94 	push	hl
   7BC9 CD 5E 7F      [17]   95 	call	_cpct_drawSprite
   7BCC C9            [10]   96 	ret
                             97 ;src/menu.c:31: void menu_draw()
                             98 ;	---------------------------------
                             99 ; Function menu_draw
                            100 ; ---------------------------------
   7BCD                     101 _menu_draw::
                            102 ;src/menu.c:33: text_write_string(0,64, "AFTER A SERIES OF FRANKLY BIZZARE EVENTS");
   7BCD 21 23 7C      [10]  103 	ld	hl, #___str_0
   7BD0 E5            [11]  104 	push	hl
   7BD1 21 00 40      [10]  105 	ld	hl, #0x4000
   7BD4 E5            [11]  106 	push	hl
   7BD5 CD 73 7D      [17]  107 	call	_text_write_string
   7BD8 F1            [10]  108 	pop	af
                            109 ;src/menu.c:34: text_write_string(0,76, "YOUR SPACESHIP IS IN TROUBLE.");
   7BD9 21 4C 7C      [10]  110 	ld	hl, #___str_1
   7BDC E3            [19]  111 	ex	(sp),hl
   7BDD 21 00 4C      [10]  112 	ld	hl, #0x4c00
   7BE0 E5            [11]  113 	push	hl
   7BE1 CD 73 7D      [17]  114 	call	_text_write_string
   7BE4 F1            [10]  115 	pop	af
                            116 ;src/menu.c:36: text_write_string(0,96, "INEXPLICABLY, TO SURVIVE, YOU NEED TO");
   7BE5 21 6A 7C      [10]  117 	ld	hl, #___str_2
   7BE8 E3            [19]  118 	ex	(sp),hl
   7BE9 21 00 60      [10]  119 	ld	hl, #0x6000
   7BEC E5            [11]  120 	push	hl
   7BED CD 73 7D      [17]  121 	call	_text_write_string
   7BF0 F1            [10]  122 	pop	af
                            123 ;src/menu.c:37: text_write_string(0,108, "REMOVE BLOCKS FROM A WALL USING A BALL.");
   7BF1 21 90 7C      [10]  124 	ld	hl, #___str_3
   7BF4 E3            [19]  125 	ex	(sp),hl
   7BF5 21 00 6C      [10]  126 	ld	hl, #0x6c00
   7BF8 E5            [11]  127 	push	hl
   7BF9 CD 73 7D      [17]  128 	call	_text_write_string
   7BFC F1            [10]  129 	pop	af
                            130 ;src/menu.c:40: text_write_string(0,132, "YEAH, WE KNOW...");
   7BFD 21 B8 7C      [10]  131 	ld	hl, #___str_4
   7C00 E3            [19]  132 	ex	(sp),hl
   7C01 21 00 84      [10]  133 	ld	hl, #0x8400
   7C04 E5            [11]  134 	push	hl
   7C05 CD 73 7D      [17]  135 	call	_text_write_string
   7C08 F1            [10]  136 	pop	af
                            137 ;src/menu.c:42: text_write_string(0,156, "WASD OR ARROW KEYS TO PLAY. UP TO SERVE");
   7C09 21 C9 7C      [10]  138 	ld	hl, #___str_5
   7C0C E3            [19]  139 	ex	(sp),hl
   7C0D 21 00 9C      [10]  140 	ld	hl, #0x9c00
   7C10 E5            [11]  141 	push	hl
   7C11 CD 73 7D      [17]  142 	call	_text_write_string
   7C14 F1            [10]  143 	pop	af
                            144 ;src/menu.c:44: text_write_centered_string(200-8, "PRESS ANY OLD KEY TO START");
   7C15 21 F1 7C      [10]  145 	ld	hl, #___str_6
   7C18 E3            [19]  146 	ex	(sp),hl
   7C19 3E C0         [ 7]  147 	ld	a, #0xc0
   7C1B F5            [11]  148 	push	af
   7C1C 33            [ 6]  149 	inc	sp
   7C1D CD 3F 7D      [17]  150 	call	_text_write_centered_string
   7C20 F1            [10]  151 	pop	af
   7C21 33            [ 6]  152 	inc	sp
   7C22 C9            [10]  153 	ret
   7C23                     154 ___str_0:
   7C23 41 46 54 45 52 20   155 	.ascii "AFTER A SERIES OF FRANKLY BIZZARE EVENTS"
        41 20 53 45 52 49
        45 53 20 4F 46 20
        46 52 41 4E 4B 4C
        59 20 42 49 5A 5A
        41 52 45 20 45 56
        45 4E 54 53
   7C4B 00                  156 	.db 0x00
   7C4C                     157 ___str_1:
   7C4C 59 4F 55 52 20 53   158 	.ascii "YOUR SPACESHIP IS IN TROUBLE."
        50 41 43 45 53 48
        49 50 20 49 53 20
        49 4E 20 54 52 4F
        55 42 4C 45 2E
   7C69 00                  159 	.db 0x00
   7C6A                     160 ___str_2:
   7C6A 49 4E 45 58 50 4C   161 	.ascii "INEXPLICABLY, TO SURVIVE, YOU NEED TO"
        49 43 41 42 4C 59
        2C 20 54 4F 20 53
        55 52 56 49 56 45
        2C 20 59 4F 55 20
        4E 45 45 44 20 54
        4F
   7C8F 00                  162 	.db 0x00
   7C90                     163 ___str_3:
   7C90 52 45 4D 4F 56 45   164 	.ascii "REMOVE BLOCKS FROM A WALL USING A BALL."
        20 42 4C 4F 43 4B
        53 20 46 52 4F 4D
        20 41 20 57 41 4C
        4C 20 55 53 49 4E
        47 20 41 20 42 41
        4C 4C 2E
   7CB7 00                  165 	.db 0x00
   7CB8                     166 ___str_4:
   7CB8 59 45 41 48 2C 20   167 	.ascii "YEAH, WE KNOW..."
        57 45 20 4B 4E 4F
        57 2E 2E 2E
   7CC8 00                  168 	.db 0x00
   7CC9                     169 ___str_5:
   7CC9 57 41 53 44 20 4F   170 	.ascii "WASD OR ARROW KEYS TO PLAY. UP TO SERVE"
        52 20 41 52 52 4F
        57 20 4B 45 59 53
        20 54 4F 20 50 4C
        41 59 2E 20 55 50
        20 54 4F 20 53 45
        52 56 45
   7CF0 00                  171 	.db 0x00
   7CF1                     172 ___str_6:
   7CF1 50 52 45 53 53 20   173 	.ascii "PRESS ANY OLD KEY TO START"
        41 4E 59 20 4F 4C
        44 20 4B 45 59 20
        54 4F 20 53 54 41
        52 54
   7D0B 00                  174 	.db 0x00
                            175 ;src/menu.c:48: SceneState menu_update()
                            176 ;	---------------------------------
                            177 ; Function menu_update
                            178 ; ---------------------------------
   7D0C                     179 _menu_update::
                            180 ;src/menu.c:50: keys_update();
   7D0C CD 84 79      [17]  181 	call	_keys_update
                            182 ;src/menu.c:51: if (cpct_isAnyKeyPressed())
   7D0F CD 57 81      [17]  183 	call	_cpct_isAnyKeyPressed
   7D12 7D            [ 4]  184 	ld	a, l
   7D13 B7            [ 4]  185 	or	a, a
   7D14 28 03         [12]  186 	jr	Z,00102$
                            187 ;src/menu.c:53: return SceneComplete;
   7D16 2E 01         [ 7]  188 	ld	l, #0x01
   7D18 C9            [10]  189 	ret
   7D19                     190 00102$:
                            191 ;src/menu.c:56: return Continue;
   7D19 2E 00         [ 7]  192 	ld	l, #0x00
   7D1B C9            [10]  193 	ret
                            194 ;src/menu.c:59: void module_menu_initialize()
                            195 ;	---------------------------------
                            196 ; Function module_menu_initialize
                            197 ; ---------------------------------
   7D1C                     198 _module_menu_initialize::
                            199 ;src/menu.c:61: scene_menu.initialize = menu_initialize;
   7D1C 21 9E 7B      [10]  200 	ld	hl, #_menu_initialize
   7D1F 22 35 88      [16]  201 	ld	(_scene_menu), hl
                            202 ;src/menu.c:62: scene_menu.update = menu_update;
   7D22 21 0C 7D      [10]  203 	ld	hl, #_menu_update
   7D25 22 39 88      [16]  204 	ld	((_scene_menu + 0x0004)), hl
                            205 ;src/menu.c:63: scene_menu.draw = menu_draw;
   7D28 21 CD 7B      [10]  206 	ld	hl, #_menu_draw
   7D2B 22 37 88      [16]  207 	ld	((_scene_menu + 0x0002)), hl
   7D2E C9            [10]  208 	ret
                            209 	.area _CODE
                            210 	.area _INITIALIZER
                            211 	.area _CABS (ABS)
