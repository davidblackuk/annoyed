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
   85E1                      56 _initializeCpc::
                             57 ;src/main.c:25: cpct_disableFirmware();
   85E1 CD E8 8C      [17]   58 	call	_cpct_disableFirmware
                             59 ;src/main.c:27: cpct_setBorder(HW_BLACK);
   85E4 21 10 14      [10]   60 	ld	hl, #0x1410
   85E7 E5            [11]   61 	push	hl
   85E8 CD 88 8A      [17]   62 	call	_cpct_setPALColour
                             63 ;src/main.c:31: cpct_setVideoMode(0);
   85EB 2E 00         [ 7]   64 	ld	l, #0x00
   85ED CD A2 8C      [17]   65 	call	_cpct_setVideoMode
                             66 ;src/main.c:33: cpct_setPalette((u8 *)g_palette, 16);
   85F0 21 10 00      [10]   67 	ld	hl, #0x0010
   85F3 E5            [11]   68 	push	hl
   85F4 21 43 74      [10]   69 	ld	hl, #_g_palette
   85F7 E5            [11]   70 	push	hl
   85F8 CD FB 89      [17]   71 	call	_cpct_setPalette
   85FB C9            [10]   72 	ret
                             73 ;src/main.c:36: void main(void)
                             74 ;	---------------------------------
                             75 ; Function main
                             76 ; ---------------------------------
   85FC                      77 _main::
                             78 ;src/main.c:38: high_score = 1000;
   85FC 21 E8 03      [10]   79 	ld	hl, #0x03e8
   85FF 22 4D 93      [16]   80 	ld	(_high_score), hl
                             81 ;src/main.c:39: initializeCpc();
   8602 CD E1 85      [17]   82 	call	_initializeCpc
                             83 ;src/main.c:40: module_menu_initialize();
   8605 CD 17 87      [17]   84 	call	_module_menu_initialize
                             85 ;src/main.c:41: module_game_initialize();
   8608 CD 0E 82      [17]   86 	call	_module_game_initialize
                             87 ;src/main.c:43: while (1)
   860B                      88 00102$:
                             89 ;src/main.c:45: play_scene(&scene_menu);
   860B 21 6D 93      [10]   90 	ld	hl, #_scene_menu
   860E E5            [11]   91 	push	hl
   860F CD 1C 86      [17]   92 	call	_play_scene
                             93 ;src/main.c:46: play_scene(&scene_game);
   8612 21 42 93      [10]   94 	ld	hl, #_scene_game
   8615 E3            [19]   95 	ex	(sp),hl
   8616 CD 1C 86      [17]   96 	call	_play_scene
   8619 F1            [10]   97 	pop	af
   861A 18 EF         [12]   98 	jr	00102$
                             99 ;src/main.c:54: void play_scene(Scene *scene)
                            100 ;	---------------------------------
                            101 ; Function play_scene
                            102 ; ---------------------------------
   861C                     103 _play_scene::
   861C DD E5         [15]  104 	push	ix
   861E DD 21 00 00   [14]  105 	ld	ix,#0
   8622 DD 39         [15]  106 	add	ix,sp
   8624 F5            [11]  107 	push	af
                            108 ;src/main.c:58: scene->initialize();
   8625 DD 4E 04      [19]  109 	ld	c,4 (ix)
   8628 DD 46 05      [19]  110 	ld	b,5 (ix)
   862B 69            [ 4]  111 	ld	l, c
   862C 60            [ 4]  112 	ld	h, b
   862D 5E            [ 7]  113 	ld	e, (hl)
   862E 23            [ 6]  114 	inc	hl
   862F 66            [ 7]  115 	ld	h, (hl)
   8630 C5            [11]  116 	push	bc
   8631 6B            [ 4]  117 	ld	l, e
   8632 CD 60 8C      [17]  118 	call	___sdcc_call_hl
   8635 C1            [10]  119 	pop	bc
                            120 ;src/main.c:60: do
   8636 33            [ 6]  121 	inc	sp
   8637 33            [ 6]  122 	inc	sp
   8638 C5            [11]  123 	push	bc
   8639                     124 00102$:
                            125 ;src/main.c:65: cpct_waitVSYNC();
   8639 C5            [11]  126 	push	bc
   863A CD 9A 8C      [17]  127 	call	_cpct_waitVSYNC
   863D C1            [10]  128 	pop	bc
                            129 ;src/main.c:67: scene->draw();
   863E E1            [10]  130 	pop	hl
   863F E5            [11]  131 	push	hl
   8640 23            [ 6]  132 	inc	hl
   8641 23            [ 6]  133 	inc	hl
   8642 5E            [ 7]  134 	ld	e, (hl)
   8643 23            [ 6]  135 	inc	hl
   8644 66            [ 7]  136 	ld	h, (hl)
   8645 C5            [11]  137 	push	bc
   8646 6B            [ 4]  138 	ld	l, e
   8647 CD 60 8C      [17]  139 	call	___sdcc_call_hl
   864A C1            [10]  140 	pop	bc
                            141 ;src/main.c:68: state = scene->update();
   864B 69            [ 4]  142 	ld	l, c
   864C 60            [ 4]  143 	ld	h, b
   864D 11 04 00      [10]  144 	ld	de, #0x0004
   8650 19            [11]  145 	add	hl, de
   8651 5E            [ 7]  146 	ld	e, (hl)
   8652 23            [ 6]  147 	inc	hl
   8653 66            [ 7]  148 	ld	h, (hl)
   8654 C5            [11]  149 	push	bc
   8655 6B            [ 4]  150 	ld	l, e
   8656 CD 60 8C      [17]  151 	call	___sdcc_call_hl
   8659 C1            [10]  152 	pop	bc
                            153 ;src/main.c:73: for (i16 i = 0; i < t; i++)
   865A 11 00 00      [10]  154 	ld	de, #0x0000
   865D                     155 00106$:
   865D 7B            [ 4]  156 	ld	a, e
   865E D6 05         [ 7]  157 	sub	a, #0x05
   8660 7A            [ 4]  158 	ld	a, d
   8661 17            [ 4]  159 	rla
   8662 3F            [ 4]  160 	ccf
   8663 1F            [ 4]  161 	rra
   8664 DE 80         [ 7]  162 	sbc	a, #0x80
   8666 30 03         [12]  163 	jr	NC,00103$
   8668 13            [ 6]  164 	inc	de
   8669 18 F2         [12]  165 	jr	00106$
   866B                     166 00103$:
                            167 ;src/main.c:79: } while (state == Continue);
   866B 7D            [ 4]  168 	ld	a, l
   866C B7            [ 4]  169 	or	a, a
   866D 28 CA         [12]  170 	jr	Z,00102$
   866F DD F9         [10]  171 	ld	sp, ix
   8671 DD E1         [14]  172 	pop	ix
   8673 C9            [10]  173 	ret
                            174 	.area _CODE
                            175 	.area _INITIALIZER
                            176 	.area _CABS (ABS)
