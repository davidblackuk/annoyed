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
   882A                      31 _scene_menu::
   882A                      32 	.ds 6
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
   7B97                      61 _menu_initialize::
                             62 ;src/menu.c:29: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, (SCREEN_WIDTH_BYTES - SP_LOGO_W) / 2, 0);
   7B97 21 0B 00      [10]   63 	ld	hl, #0x000b
   7B9A E5            [11]   64 	push	hl
   7B9B 21 00 C0      [10]   65 	ld	hl, #0xc000
   7B9E E5            [11]   66 	push	hl
   7B9F CD BE 82      [17]   67 	call	_cpct_getScreenPtr
                             68 ;src/menu.c:30: cpct_clearScreen(AN_PEN_BLACK);
   7BA2 E5            [11]   69 	push	hl
   7BA3 01 00 40      [10]   70 	ld	bc, #0x4000
   7BA6 C5            [11]   71 	push	bc
   7BA7 AF            [ 4]   72 	xor	a, a
   7BA8 F5            [11]   73 	push	af
   7BA9 33            [ 6]   74 	inc	sp
   7BAA 01 00 C0      [10]   75 	ld	bc, #0xc000
   7BAD C5            [11]   76 	push	bc
   7BAE CD 8A 81      [17]   77 	call	_cpct_memset
   7BB1 CD 67 79      [17]   78 	call	_keys_initialize
   7BB4 E1            [10]   79 	pop	hl
                             80 ;src/menu.c:34: cpct_drawSprite(sp_logo, pvmem, SP_LOGO_W, SP_LOGO_H);
   7BB5 01 66 5F      [10]   81 	ld	bc, #_sp_logo+0
   7BB8 11 39 2D      [10]   82 	ld	de, #0x2d39
   7BBB D5            [11]   83 	push	de
   7BBC E5            [11]   84 	push	hl
   7BBD C5            [11]   85 	push	bc
   7BBE CD 53 7F      [17]   86 	call	_cpct_drawSprite
                             87 ;src/menu.c:35: write_text();
   7BC1 CD E9 7B      [17]   88 	call	_write_text
   7BC4 C9            [10]   89 	ret
                             90 ;src/menu.c:38: void menu_draw()
                             91 ;	---------------------------------
                             92 ; Function menu_draw
                             93 ; ---------------------------------
   7BC5                      94 _menu_draw::
                             95 ;src/menu.c:40: }
   7BC5 C9            [10]   96 	ret
                             97 ;src/menu.c:42: SceneState menu_update()
                             98 ;	---------------------------------
                             99 ; Function menu_update
                            100 ; ---------------------------------
   7BC6                     101 _menu_update::
                            102 ;src/menu.c:44: keys_update();
   7BC6 CD 84 79      [17]  103 	call	_keys_update
                            104 ;src/menu.c:45: if (cpct_isAnyKeyPressed())
   7BC9 CD 4C 81      [17]  105 	call	_cpct_isAnyKeyPressed
   7BCC 7D            [ 4]  106 	ld	a, l
   7BCD B7            [ 4]  107 	or	a, a
   7BCE 28 03         [12]  108 	jr	Z,00102$
                            109 ;src/menu.c:47: return SceneComplete;
   7BD0 2E 01         [ 7]  110 	ld	l, #0x01
   7BD2 C9            [10]  111 	ret
   7BD3                     112 00102$:
                            113 ;src/menu.c:50: return Continue;
   7BD3 2E 00         [ 7]  114 	ld	l, #0x00
   7BD5 C9            [10]  115 	ret
                            116 ;src/menu.c:53: void module_menu_initialize()
                            117 ;	---------------------------------
                            118 ; Function module_menu_initialize
                            119 ; ---------------------------------
   7BD6                     120 _module_menu_initialize::
                            121 ;src/menu.c:55: scene_menu.initialize = menu_initialize;
   7BD6 21 97 7B      [10]  122 	ld	hl, #_menu_initialize
   7BD9 22 2A 88      [16]  123 	ld	(_scene_menu), hl
                            124 ;src/menu.c:56: scene_menu.update = menu_update;
   7BDC 21 C6 7B      [10]  125 	ld	hl, #_menu_update
   7BDF 22 2E 88      [16]  126 	ld	((_scene_menu + 0x0004)), hl
                            127 ;src/menu.c:57: scene_menu.draw = menu_draw;
   7BE2 21 C5 7B      [10]  128 	ld	hl, #_menu_draw
   7BE5 22 2C 88      [16]  129 	ld	((_scene_menu + 0x0002)), hl
   7BE8 C9            [10]  130 	ret
                            131 ;src/menu.c:64: void write_text()
                            132 ;	---------------------------------
                            133 ; Function write_text
                            134 ; ---------------------------------
   7BE9                     135 _write_text::
                            136 ;src/menu.c:66: text_write_centered_string(64, "AFTER A SERIES OF FRANKLY BIZZARE EVENTS");
   7BE9 21 4B 7C      [10]  137 	ld	hl, #___str_0
   7BEC E5            [11]  138 	push	hl
   7BED 3E 40         [ 7]  139 	ld	a, #0x40
   7BEF F5            [11]  140 	push	af
   7BF0 33            [ 6]  141 	inc	sp
   7BF1 CD 34 7D      [17]  142 	call	_text_write_centered_string
                            143 ;src/menu.c:67: text_write_centered_string(76, "YOUR SPACESHIP IS IN TROUBLE.");
   7BF4 33            [ 6]  144 	inc	sp
   7BF5 21 74 7C      [10]  145 	ld	hl,#___str_1
   7BF8 E3            [19]  146 	ex	(sp),hl
   7BF9 3E 4C         [ 7]  147 	ld	a, #0x4c
   7BFB F5            [11]  148 	push	af
   7BFC 33            [ 6]  149 	inc	sp
   7BFD CD 34 7D      [17]  150 	call	_text_write_centered_string
                            151 ;src/menu.c:69: text_write_centered_string(96, "INEXPLICABLY, TO SURVIVE, YOU NEED TO");
   7C00 33            [ 6]  152 	inc	sp
   7C01 21 92 7C      [10]  153 	ld	hl,#___str_2
   7C04 E3            [19]  154 	ex	(sp),hl
   7C05 3E 60         [ 7]  155 	ld	a, #0x60
   7C07 F5            [11]  156 	push	af
   7C08 33            [ 6]  157 	inc	sp
   7C09 CD 34 7D      [17]  158 	call	_text_write_centered_string
                            159 ;src/menu.c:70: text_write_centered_string(108, "REMOVE BLOCKS FROM A WALL USING A BALL.");
   7C0C 33            [ 6]  160 	inc	sp
   7C0D 21 B8 7C      [10]  161 	ld	hl,#___str_3
   7C10 E3            [19]  162 	ex	(sp),hl
   7C11 3E 6C         [ 7]  163 	ld	a, #0x6c
   7C13 F5            [11]  164 	push	af
   7C14 33            [ 6]  165 	inc	sp
   7C15 CD 34 7D      [17]  166 	call	_text_write_centered_string
                            167 ;src/menu.c:72: text_write_centered_string(132, "YEAH, WE KNOW...");
   7C18 33            [ 6]  168 	inc	sp
   7C19 21 E0 7C      [10]  169 	ld	hl,#___str_4
   7C1C E3            [19]  170 	ex	(sp),hl
   7C1D 3E 84         [ 7]  171 	ld	a, #0x84
   7C1F F5            [11]  172 	push	af
   7C20 33            [ 6]  173 	inc	sp
   7C21 CD 34 7D      [17]  174 	call	_text_write_centered_string
                            175 ;src/menu.c:74: text_write_centered_string(156, "WASD OR ARROW KEYS TO PLAY.");
   7C24 33            [ 6]  176 	inc	sp
   7C25 21 F1 7C      [10]  177 	ld	hl,#___str_5
   7C28 E3            [19]  178 	ex	(sp),hl
   7C29 3E 9C         [ 7]  179 	ld	a, #0x9c
   7C2B F5            [11]  180 	push	af
   7C2C 33            [ 6]  181 	inc	sp
   7C2D CD 34 7D      [17]  182 	call	_text_write_centered_string
                            183 ;src/menu.c:75: text_write_centered_string(168, "UP TO SERVE");
   7C30 33            [ 6]  184 	inc	sp
   7C31 21 0D 7D      [10]  185 	ld	hl,#___str_6
   7C34 E3            [19]  186 	ex	(sp),hl
   7C35 3E A8         [ 7]  187 	ld	a, #0xa8
   7C37 F5            [11]  188 	push	af
   7C38 33            [ 6]  189 	inc	sp
   7C39 CD 34 7D      [17]  190 	call	_text_write_centered_string
                            191 ;src/menu.c:77: text_write_centered_string(200 - 8, "PRESS ANY OLD KEY TO START");
   7C3C 33            [ 6]  192 	inc	sp
   7C3D 21 19 7D      [10]  193 	ld	hl,#___str_7
   7C40 E3            [19]  194 	ex	(sp),hl
   7C41 3E C0         [ 7]  195 	ld	a, #0xc0
   7C43 F5            [11]  196 	push	af
   7C44 33            [ 6]  197 	inc	sp
   7C45 CD 34 7D      [17]  198 	call	_text_write_centered_string
   7C48 F1            [10]  199 	pop	af
   7C49 33            [ 6]  200 	inc	sp
   7C4A C9            [10]  201 	ret
   7C4B                     202 ___str_0:
   7C4B 41 46 54 45 52 20   203 	.ascii "AFTER A SERIES OF FRANKLY BIZZARE EVENTS"
        41 20 53 45 52 49
        45 53 20 4F 46 20
        46 52 41 4E 4B 4C
        59 20 42 49 5A 5A
        41 52 45 20 45 56
        45 4E 54 53
   7C73 00                  204 	.db 0x00
   7C74                     205 ___str_1:
   7C74 59 4F 55 52 20 53   206 	.ascii "YOUR SPACESHIP IS IN TROUBLE."
        50 41 43 45 53 48
        49 50 20 49 53 20
        49 4E 20 54 52 4F
        55 42 4C 45 2E
   7C91 00                  207 	.db 0x00
   7C92                     208 ___str_2:
   7C92 49 4E 45 58 50 4C   209 	.ascii "INEXPLICABLY, TO SURVIVE, YOU NEED TO"
        49 43 41 42 4C 59
        2C 20 54 4F 20 53
        55 52 56 49 56 45
        2C 20 59 4F 55 20
        4E 45 45 44 20 54
        4F
   7CB7 00                  210 	.db 0x00
   7CB8                     211 ___str_3:
   7CB8 52 45 4D 4F 56 45   212 	.ascii "REMOVE BLOCKS FROM A WALL USING A BALL."
        20 42 4C 4F 43 4B
        53 20 46 52 4F 4D
        20 41 20 57 41 4C
        4C 20 55 53 49 4E
        47 20 41 20 42 41
        4C 4C 2E
   7CDF 00                  213 	.db 0x00
   7CE0                     214 ___str_4:
   7CE0 59 45 41 48 2C 20   215 	.ascii "YEAH, WE KNOW..."
        57 45 20 4B 4E 4F
        57 2E 2E 2E
   7CF0 00                  216 	.db 0x00
   7CF1                     217 ___str_5:
   7CF1 57 41 53 44 20 4F   218 	.ascii "WASD OR ARROW KEYS TO PLAY."
        52 20 41 52 52 4F
        57 20 4B 45 59 53
        20 54 4F 20 50 4C
        41 59 2E
   7D0C 00                  219 	.db 0x00
   7D0D                     220 ___str_6:
   7D0D 55 50 20 54 4F 20   221 	.ascii "UP TO SERVE"
        53 45 52 56 45
   7D18 00                  222 	.db 0x00
   7D19                     223 ___str_7:
   7D19 50 52 45 53 53 20   224 	.ascii "PRESS ANY OLD KEY TO START"
        41 4E 59 20 4F 4C
        44 20 4B 45 59 20
        54 4F 20 53 54 41
        52 54
   7D33 00                  225 	.db 0x00
                            226 	.area _CODE
                            227 	.area _INITIALIZER
                            228 	.area _CABS (ABS)
