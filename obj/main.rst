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
   7AA0                      56 _initializeCpc::
                             57 ;src/main.c:25: cpct_disableFirmware();
   7AA0 CD A7 81      [17]   58 	call	_cpct_disableFirmware
                             59 ;src/main.c:27: cpct_setBorder(HW_BLACK);
   7AA3 21 10 14      [10]   60 	ld	hl, #0x1410
   7AA6 E5            [11]   61 	push	hl
   7AA7 CD 47 7F      [17]   62 	call	_cpct_setPALColour
                             63 ;src/main.c:31: cpct_setVideoMode(0);
   7AAA 2E 00         [ 7]   64 	ld	l, #0x00
   7AAC CD 61 81      [17]   65 	call	_cpct_setVideoMode
                             66 ;src/main.c:33: cpct_setPalette((u8 *)g_palette, 16);
   7AAF 21 10 00      [10]   67 	ld	hl, #0x0010
   7AB2 E5            [11]   68 	push	hl
   7AB3 21 7B 69      [10]   69 	ld	hl, #_g_palette
   7AB6 E5            [11]   70 	push	hl
   7AB7 CD BA 7E      [17]   71 	call	_cpct_setPalette
   7ABA C9            [10]   72 	ret
                             73 ;src/main.c:36: void main(void)
                             74 ;	---------------------------------
                             75 ; Function main
                             76 ; ---------------------------------
   7ABB                      77 _main::
                             78 ;src/main.c:38: high_score = 1000;
   7ABB 21 E8 03      [10]   79 	ld	hl, #0x03e8
   7ABE 22 0C 88      [16]   80 	ld	(_high_score), hl
                             81 ;src/main.c:39: initializeCpc();
   7AC1 CD A0 7A      [17]   82 	call	_initializeCpc
                             83 ;src/main.c:40: module_menu_initialize();
   7AC4 CD D6 7B      [17]   84 	call	_module_menu_initialize
                             85 ;src/main.c:41: module_game_initialize();
   7AC7 CD E5 76      [17]   86 	call	_module_game_initialize
                             87 ;src/main.c:43: while (1)
   7ACA                      88 00102$:
                             89 ;src/main.c:45: play_scene(&scene_menu);
   7ACA 21 2A 88      [10]   90 	ld	hl, #_scene_menu
   7ACD E5            [11]   91 	push	hl
   7ACE CD DB 7A      [17]   92 	call	_play_scene
                             93 ;src/main.c:46: play_scene(&scene_game);
   7AD1 21 01 88      [10]   94 	ld	hl, #_scene_game
   7AD4 E3            [19]   95 	ex	(sp),hl
   7AD5 CD DB 7A      [17]   96 	call	_play_scene
   7AD8 F1            [10]   97 	pop	af
   7AD9 18 EF         [12]   98 	jr	00102$
                             99 ;src/main.c:54: void play_scene(Scene *scene)
                            100 ;	---------------------------------
                            101 ; Function play_scene
                            102 ; ---------------------------------
   7ADB                     103 _play_scene::
   7ADB DD E5         [15]  104 	push	ix
   7ADD DD 21 00 00   [14]  105 	ld	ix,#0
   7AE1 DD 39         [15]  106 	add	ix,sp
   7AE3 F5            [11]  107 	push	af
                            108 ;src/main.c:58: scene->initialize();
   7AE4 DD 4E 04      [19]  109 	ld	c,4 (ix)
   7AE7 DD 46 05      [19]  110 	ld	b,5 (ix)
   7AEA 69            [ 4]  111 	ld	l, c
   7AEB 60            [ 4]  112 	ld	h, b
   7AEC 5E            [ 7]  113 	ld	e, (hl)
   7AED 23            [ 6]  114 	inc	hl
   7AEE 66            [ 7]  115 	ld	h, (hl)
   7AEF C5            [11]  116 	push	bc
   7AF0 6B            [ 4]  117 	ld	l, e
   7AF1 CD 1F 81      [17]  118 	call	___sdcc_call_hl
   7AF4 C1            [10]  119 	pop	bc
                            120 ;src/main.c:60: do
   7AF5 33            [ 6]  121 	inc	sp
   7AF6 33            [ 6]  122 	inc	sp
   7AF7 C5            [11]  123 	push	bc
   7AF8                     124 00102$:
                            125 ;src/main.c:65: cpct_waitVSYNC();
   7AF8 C5            [11]  126 	push	bc
   7AF9 CD 59 81      [17]  127 	call	_cpct_waitVSYNC
   7AFC C1            [10]  128 	pop	bc
                            129 ;src/main.c:67: scene->draw();
   7AFD E1            [10]  130 	pop	hl
   7AFE E5            [11]  131 	push	hl
   7AFF 23            [ 6]  132 	inc	hl
   7B00 23            [ 6]  133 	inc	hl
   7B01 5E            [ 7]  134 	ld	e, (hl)
   7B02 23            [ 6]  135 	inc	hl
   7B03 66            [ 7]  136 	ld	h, (hl)
   7B04 C5            [11]  137 	push	bc
   7B05 6B            [ 4]  138 	ld	l, e
   7B06 CD 1F 81      [17]  139 	call	___sdcc_call_hl
   7B09 C1            [10]  140 	pop	bc
                            141 ;src/main.c:68: state = scene->update();
   7B0A 69            [ 4]  142 	ld	l, c
   7B0B 60            [ 4]  143 	ld	h, b
   7B0C 11 04 00      [10]  144 	ld	de, #0x0004
   7B0F 19            [11]  145 	add	hl, de
   7B10 5E            [ 7]  146 	ld	e, (hl)
   7B11 23            [ 6]  147 	inc	hl
   7B12 66            [ 7]  148 	ld	h, (hl)
   7B13 C5            [11]  149 	push	bc
   7B14 6B            [ 4]  150 	ld	l, e
   7B15 CD 1F 81      [17]  151 	call	___sdcc_call_hl
   7B18 C1            [10]  152 	pop	bc
                            153 ;src/main.c:73: for (i16 i = 0; i < t; i++)
   7B19 11 00 00      [10]  154 	ld	de, #0x0000
   7B1C                     155 00106$:
   7B1C 7B            [ 4]  156 	ld	a, e
   7B1D D6 05         [ 7]  157 	sub	a, #0x05
   7B1F 7A            [ 4]  158 	ld	a, d
   7B20 17            [ 4]  159 	rla
   7B21 3F            [ 4]  160 	ccf
   7B22 1F            [ 4]  161 	rra
   7B23 DE 80         [ 7]  162 	sbc	a, #0x80
   7B25 30 03         [12]  163 	jr	NC,00103$
   7B27 13            [ 6]  164 	inc	de
   7B28 18 F2         [12]  165 	jr	00106$
   7B2A                     166 00103$:
                            167 ;src/main.c:79: } while (state == Continue);
   7B2A 7D            [ 4]  168 	ld	a, l
   7B2B B7            [ 4]  169 	or	a, a
   7B2C 28 CA         [12]  170 	jr	Z,00102$
   7B2E DD F9         [10]  171 	ld	sp, ix
   7B30 DD E1         [14]  172 	pop	ix
   7B32 C9            [10]  173 	ret
                            174 	.area _CODE
                            175 	.area _INITIALIZER
                            176 	.area _CABS (ABS)
