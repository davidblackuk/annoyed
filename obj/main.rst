                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _initializeCpc
                             13 	.globl _module_menu_initialize
                             14 	.globl _module_game_initialize
                             15 	.globl _cpct_setPALColour
                             16 	.globl _cpct_setPalette
                             17 	.globl _cpct_waitVSYNC
                             18 	.globl _cpct_setVideoMode
                             19 	.globl _cpct_disableFirmware
                             20 	.globl _play_scene
                             21 ;--------------------------------------------------------
                             22 ; special function registers
                             23 ;--------------------------------------------------------
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DATA
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _INITIALIZED
                             32 ;--------------------------------------------------------
                             33 ; absolute external ram data
                             34 ;--------------------------------------------------------
                             35 	.area _DABS (ABS)
                             36 ;--------------------------------------------------------
                             37 ; global & static initialisations
                             38 ;--------------------------------------------------------
                             39 	.area _HOME
                             40 	.area _GSINIT
                             41 	.area _GSFINAL
                             42 	.area _GSINIT
                             43 ;--------------------------------------------------------
                             44 ; Home
                             45 ;--------------------------------------------------------
                             46 	.area _HOME
                             47 	.area _HOME
                             48 ;--------------------------------------------------------
                             49 ; code
                             50 ;--------------------------------------------------------
                             51 	.area _CODE
                             52 ;src/main.c:21: void initializeCpc()
                             53 ;	---------------------------------
                             54 ; Function initializeCpc
                             55 ; ---------------------------------
   8526                      56 _initializeCpc::
                             57 ;src/main.c:25: cpct_disableFirmware();
   8526 CD 2D 8C      [17]   58 	call	_cpct_disableFirmware
                             59 ;src/main.c:27: cpct_setBorder(HW_BLACK);
   8529 21 10 14      [10]   60 	ld	hl, #0x1410
   852C E5            [11]   61 	push	hl
   852D CD CD 89      [17]   62 	call	_cpct_setPALColour
                             63 ;src/main.c:31: cpct_setVideoMode(0);
   8530 2E 00         [ 7]   64 	ld	l, #0x00
   8532 CD E7 8B      [17]   65 	call	_cpct_setVideoMode
                             66 ;src/main.c:33: cpct_setPalette((u8 *)g_palette, 16);
   8535 21 10 00      [10]   67 	ld	hl, #0x0010
   8538 E5            [11]   68 	push	hl
   8539 21 43 74      [10]   69 	ld	hl, #_g_palette
   853C E5            [11]   70 	push	hl
   853D CD 40 89      [17]   71 	call	_cpct_setPalette
   8540 C9            [10]   72 	ret
                             73 ;src/main.c:36: void main(void)
                             74 ;	---------------------------------
                             75 ; Function main
                             76 ; ---------------------------------
   8541                      77 _main::
                             78 ;src/main.c:38: high_score = 1000;
   8541 21 E8 03      [10]   79 	ld	hl, #0x03e8
   8544 22 92 92      [16]   80 	ld	(_high_score), hl
                             81 ;src/main.c:39: initializeCpc();
   8547 CD 26 85      [17]   82 	call	_initializeCpc
                             83 ;src/main.c:40: module_menu_initialize();
   854A CD 5C 86      [17]   84 	call	_module_menu_initialize
                             85 ;src/main.c:41: module_game_initialize();
   854D CD 53 81      [17]   86 	call	_module_game_initialize
                             87 ;src/main.c:43: while (1)
   8550                      88 00102$:
                             89 ;src/main.c:45: play_scene(&scene_menu);
   8550 21 B2 92      [10]   90 	ld	hl, #_scene_menu
   8553 E5            [11]   91 	push	hl
   8554 CD 61 85      [17]   92 	call	_play_scene
                             93 ;src/main.c:46: play_scene(&scene_game);
   8557 21 87 92      [10]   94 	ld	hl, #_scene_game
   855A E3            [19]   95 	ex	(sp),hl
   855B CD 61 85      [17]   96 	call	_play_scene
   855E F1            [10]   97 	pop	af
   855F 18 EF         [12]   98 	jr	00102$
                             99 ;src/main.c:54: void play_scene(Scene *scene)
                            100 ;	---------------------------------
                            101 ; Function play_scene
                            102 ; ---------------------------------
   8561                     103 _play_scene::
   8561 DD E5         [15]  104 	push	ix
   8563 DD 21 00 00   [14]  105 	ld	ix,#0
   8567 DD 39         [15]  106 	add	ix,sp
   8569 F5            [11]  107 	push	af
                            108 ;src/main.c:58: scene->initialize();
   856A DD 4E 04      [19]  109 	ld	c,4 (ix)
   856D DD 46 05      [19]  110 	ld	b,5 (ix)
   8570 69            [ 4]  111 	ld	l, c
   8571 60            [ 4]  112 	ld	h, b
   8572 5E            [ 7]  113 	ld	e, (hl)
   8573 23            [ 6]  114 	inc	hl
   8574 66            [ 7]  115 	ld	h, (hl)
   8575 C5            [11]  116 	push	bc
   8576 6B            [ 4]  117 	ld	l, e
   8577 CD A5 8B      [17]  118 	call	___sdcc_call_hl
   857A C1            [10]  119 	pop	bc
                            120 ;src/main.c:60: do
   857B 33            [ 6]  121 	inc	sp
   857C 33            [ 6]  122 	inc	sp
   857D C5            [11]  123 	push	bc
   857E                     124 00102$:
                            125 ;src/main.c:65: cpct_waitVSYNC();
   857E C5            [11]  126 	push	bc
   857F CD DF 8B      [17]  127 	call	_cpct_waitVSYNC
   8582 C1            [10]  128 	pop	bc
                            129 ;src/main.c:67: scene->draw();
   8583 E1            [10]  130 	pop	hl
   8584 E5            [11]  131 	push	hl
   8585 23            [ 6]  132 	inc	hl
   8586 23            [ 6]  133 	inc	hl
   8587 5E            [ 7]  134 	ld	e, (hl)
   8588 23            [ 6]  135 	inc	hl
   8589 66            [ 7]  136 	ld	h, (hl)
   858A C5            [11]  137 	push	bc
   858B 6B            [ 4]  138 	ld	l, e
   858C CD A5 8B      [17]  139 	call	___sdcc_call_hl
   858F C1            [10]  140 	pop	bc
                            141 ;src/main.c:68: state = scene->update();
   8590 69            [ 4]  142 	ld	l, c
   8591 60            [ 4]  143 	ld	h, b
   8592 11 04 00      [10]  144 	ld	de, #0x0004
   8595 19            [11]  145 	add	hl, de
   8596 5E            [ 7]  146 	ld	e, (hl)
   8597 23            [ 6]  147 	inc	hl
   8598 66            [ 7]  148 	ld	h, (hl)
   8599 C5            [11]  149 	push	bc
   859A 6B            [ 4]  150 	ld	l, e
   859B CD A5 8B      [17]  151 	call	___sdcc_call_hl
   859E C1            [10]  152 	pop	bc
                            153 ;src/main.c:73: for (i16 i = 0; i < t; i++)
   859F 11 00 00      [10]  154 	ld	de, #0x0000
   85A2                     155 00106$:
   85A2 7B            [ 4]  156 	ld	a, e
   85A3 D6 05         [ 7]  157 	sub	a, #0x05
   85A5 7A            [ 4]  158 	ld	a, d
   85A6 17            [ 4]  159 	rla
   85A7 3F            [ 4]  160 	ccf
   85A8 1F            [ 4]  161 	rra
   85A9 DE 80         [ 7]  162 	sbc	a, #0x80
   85AB 30 03         [12]  163 	jr	NC,00103$
   85AD 13            [ 6]  164 	inc	de
   85AE 18 F2         [12]  165 	jr	00106$
   85B0                     166 00103$:
                            167 ;src/main.c:79: } while (state == Continue);
   85B0 7D            [ 4]  168 	ld	a, l
   85B1 B7            [ 4]  169 	or	a, a
   85B2 28 CA         [12]  170 	jr	Z,00102$
   85B4 DD F9         [10]  171 	ld	sp, ix
   85B6 DD E1         [14]  172 	pop	ix
   85B8 C9            [10]  173 	ret
                            174 	.area _CODE
                            175 	.area _INITIALIZER
                            176 	.area _CABS (ABS)
