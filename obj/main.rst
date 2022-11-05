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
                             52 ;src/main.c:9: void initializeCpc()
                             53 ;	---------------------------------
                             54 ; Function initializeCpc
                             55 ; ---------------------------------
   7AA0                      56 _initializeCpc::
                             57 ;src/main.c:13: cpct_disableFirmware();
   7AA0 CD B2 81      [17]   58 	call	_cpct_disableFirmware
                             59 ;src/main.c:15: cpct_setBorder(HW_BLACK);
   7AA3 21 10 14      [10]   60 	ld	hl, #0x1410
   7AA6 E5            [11]   61 	push	hl
   7AA7 CD 52 7F      [17]   62 	call	_cpct_setPALColour
                             63 ;src/main.c:16: cpct_setBorder(HW_WHITE);
   7AAA 21 10 00      [10]   64 	ld	hl, #0x0010
   7AAD E5            [11]   65 	push	hl
   7AAE CD 52 7F      [17]   66 	call	_cpct_setPALColour
                             67 ;src/main.c:19: cpct_setVideoMode(0);
   7AB1 2E 00         [ 7]   68 	ld	l, #0x00
   7AB3 CD 6C 81      [17]   69 	call	_cpct_setVideoMode
                             70 ;src/main.c:21: cpct_setPalette((u8 *)g_palette, 16);
   7AB6 21 10 00      [10]   71 	ld	hl, #0x0010
   7AB9 E5            [11]   72 	push	hl
   7ABA 21 7B 69      [10]   73 	ld	hl, #_g_palette
   7ABD E5            [11]   74 	push	hl
   7ABE CD C5 7E      [17]   75 	call	_cpct_setPalette
   7AC1 C9            [10]   76 	ret
                             77 ;src/main.c:24: void main(void)
                             78 ;	---------------------------------
                             79 ; Function main
                             80 ; ---------------------------------
   7AC2                      81 _main::
                             82 ;src/main.c:26: high_score = 1000;
   7AC2 21 E8 03      [10]   83 	ld	hl, #0x03e8
   7AC5 22 17 88      [16]   84 	ld	(_high_score), hl
                             85 ;src/main.c:27: initializeCpc();
   7AC8 CD A0 7A      [17]   86 	call	_initializeCpc
                             87 ;src/main.c:28: module_menu_initialize();
   7ACB CD 1C 7D      [17]   88 	call	_module_menu_initialize
                             89 ;src/main.c:29: module_game_initialize();
   7ACE CD E5 76      [17]   90 	call	_module_game_initialize
                             91 ;src/main.c:31: while (1)
   7AD1                      92 00102$:
                             93 ;src/main.c:33: play_scene(&scene_menu);
   7AD1 21 35 88      [10]   94 	ld	hl, #_scene_menu
   7AD4 E5            [11]   95 	push	hl
   7AD5 CD E2 7A      [17]   96 	call	_play_scene
                             97 ;src/main.c:34: play_scene(&scene_game);
   7AD8 21 0C 88      [10]   98 	ld	hl, #_scene_game
   7ADB E3            [19]   99 	ex	(sp),hl
   7ADC CD E2 7A      [17]  100 	call	_play_scene
   7ADF F1            [10]  101 	pop	af
   7AE0 18 EF         [12]  102 	jr	00102$
                            103 ;src/main.c:38: void play_scene(Scene *scene)
                            104 ;	---------------------------------
                            105 ; Function play_scene
                            106 ; ---------------------------------
   7AE2                     107 _play_scene::
   7AE2 DD E5         [15]  108 	push	ix
   7AE4 DD 21 00 00   [14]  109 	ld	ix,#0
   7AE8 DD 39         [15]  110 	add	ix,sp
   7AEA F5            [11]  111 	push	af
                            112 ;src/main.c:42: scene->initialize();
   7AEB DD 4E 04      [19]  113 	ld	c,4 (ix)
   7AEE DD 46 05      [19]  114 	ld	b,5 (ix)
   7AF1 69            [ 4]  115 	ld	l, c
   7AF2 60            [ 4]  116 	ld	h, b
   7AF3 5E            [ 7]  117 	ld	e, (hl)
   7AF4 23            [ 6]  118 	inc	hl
   7AF5 66            [ 7]  119 	ld	h, (hl)
   7AF6 C5            [11]  120 	push	bc
   7AF7 6B            [ 4]  121 	ld	l, e
   7AF8 CD 2A 81      [17]  122 	call	___sdcc_call_hl
   7AFB C1            [10]  123 	pop	bc
                            124 ;src/main.c:44: do
   7AFC 33            [ 6]  125 	inc	sp
   7AFD 33            [ 6]  126 	inc	sp
   7AFE C5            [11]  127 	push	bc
   7AFF                     128 00102$:
                            129 ;src/main.c:49: cpct_waitVSYNC();
   7AFF C5            [11]  130 	push	bc
   7B00 CD 64 81      [17]  131 	call	_cpct_waitVSYNC
   7B03 C1            [10]  132 	pop	bc
                            133 ;src/main.c:51: scene->draw();
   7B04 E1            [10]  134 	pop	hl
   7B05 E5            [11]  135 	push	hl
   7B06 23            [ 6]  136 	inc	hl
   7B07 23            [ 6]  137 	inc	hl
   7B08 5E            [ 7]  138 	ld	e, (hl)
   7B09 23            [ 6]  139 	inc	hl
   7B0A 66            [ 7]  140 	ld	h, (hl)
   7B0B C5            [11]  141 	push	bc
   7B0C 6B            [ 4]  142 	ld	l, e
   7B0D CD 2A 81      [17]  143 	call	___sdcc_call_hl
   7B10 C1            [10]  144 	pop	bc
                            145 ;src/main.c:52: state = scene->update();
   7B11 69            [ 4]  146 	ld	l, c
   7B12 60            [ 4]  147 	ld	h, b
   7B13 11 04 00      [10]  148 	ld	de, #0x0004
   7B16 19            [11]  149 	add	hl, de
   7B17 5E            [ 7]  150 	ld	e, (hl)
   7B18 23            [ 6]  151 	inc	hl
   7B19 66            [ 7]  152 	ld	h, (hl)
   7B1A C5            [11]  153 	push	bc
   7B1B 6B            [ 4]  154 	ld	l, e
   7B1C CD 2A 81      [17]  155 	call	___sdcc_call_hl
   7B1F C1            [10]  156 	pop	bc
                            157 ;src/main.c:57: for (i16 i = 0; i < t; i++)
   7B20 11 00 00      [10]  158 	ld	de, #0x0000
   7B23                     159 00106$:
   7B23 7B            [ 4]  160 	ld	a, e
   7B24 D6 05         [ 7]  161 	sub	a, #0x05
   7B26 7A            [ 4]  162 	ld	a, d
   7B27 17            [ 4]  163 	rla
   7B28 3F            [ 4]  164 	ccf
   7B29 1F            [ 4]  165 	rra
   7B2A DE 80         [ 7]  166 	sbc	a, #0x80
   7B2C 30 03         [12]  167 	jr	NC,00103$
   7B2E 13            [ 6]  168 	inc	de
   7B2F 18 F2         [12]  169 	jr	00106$
   7B31                     170 00103$:
                            171 ;src/main.c:63: } while (state == Continue);
   7B31 7D            [ 4]  172 	ld	a, l
   7B32 B7            [ 4]  173 	or	a, a
   7B33 28 CA         [12]  174 	jr	Z,00102$
   7B35 DD F9         [10]  175 	ld	sp, ix
   7B37 DD E1         [14]  176 	pop	ix
   7B39 C9            [10]  177 	ret
                            178 	.area _CODE
                            179 	.area _INITIALIZER
                            180 	.area _CABS (ABS)
