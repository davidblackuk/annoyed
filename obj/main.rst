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
                             52 ;src/main.c:10: cpctm_createTransparentMaskTable(g_masktable, 0x0100, M0, 4);
                             53 ;	---------------------------------
                             54 ; Function dummy_cpct_transparentMaskTable4M0_container
                             55 ; ---------------------------------
   756F                      56 _dummy_cpct_transparentMaskTable4M0_container::
                             57 	.area _g_masktable_ (ABS) 
   0100                      58 	.org 0x0100 
   0100                      59 	 _g_masktable::
   0100 00 00 00 00 00 00    60 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0108 00 00 00 00 00 00    61 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 55 00 55 00 00 00    62 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0118 55 00 55 00 00 00    63 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 AA AA 00 00 AA AA    64 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0128 00 00 00 00 00 00    65 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 FF AA 55 00 AA AA    66 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0138 55 00 55 00 00 00    67 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 00 00 00 00 00 00    68 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00    69 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 00 00 00 00 00 00    70 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00    71 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 AA AA 00 00 AA AA    72 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00    73 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 AA AA 00 00 AA AA    74 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00    75 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 00 00 00 00 00 00    76 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 00 00 00 00 00 00    77 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 55 00 55 00 00 00    78 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 55 00 55 00 00 00    79 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 00 00 00 00 00 00    80 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 00 00 00 00 00 00    81 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 55 00 55 00 00 00    82 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 55 00 55 00 00 00    83 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00    84 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00    85 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00    86 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00    87 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00    88 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00    89 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00    90 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00    91 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                             92 	.area _CSEG (REL, CON) 
                             93 ;src/main.c:14: void initializeCpc()
                             94 ;	---------------------------------
                             95 ; Function initializeCpc
                             96 ; ---------------------------------
   8089                      97 _initializeCpc::
                             98 ;src/main.c:18: cpct_disableFirmware();
   8089 CD F6 79      [17]   99 	call	_cpct_disableFirmware
                            100 ;src/main.c:20: cpct_setBorder(HW_BLACK);
   808C 21 10 14      [10]  101 	ld	hl, #0x1410
   808F E5            [11]  102 	push	hl
   8090 CD 4D 77      [17]  103 	call	_cpct_setPALColour
                            104 ;src/main.c:21: cpct_setBorder(HW_WHITE);
   8093 21 10 00      [10]  105 	ld	hl, #0x0010
   8096 E5            [11]  106 	push	hl
   8097 CD 4D 77      [17]  107 	call	_cpct_setPALColour
                            108 ;src/main.c:25: cpct_setVideoMode(0);
   809A 2E 00         [ 7]  109 	ld	l, #0x00
   809C CD BF 79      [17]  110 	call	_cpct_setVideoMode
                            111 ;src/main.c:27: cpct_setPalette((u8 *)g_palette, 15);
   809F 21 0F 00      [10]  112 	ld	hl, #0x000f
   80A2 E5            [11]  113 	push	hl
   80A3 21 59 66      [10]  114 	ld	hl, #_g_palette
   80A6 E5            [11]  115 	push	hl
   80A7 CD C0 76      [17]  116 	call	_cpct_setPalette
   80AA C9            [10]  117 	ret
                            118 ;src/main.c:32: void main(void)
                            119 ;	---------------------------------
                            120 ; Function main
                            121 ; ---------------------------------
   80AB                     122 _main::
                            123 ;src/main.c:35: initializeCpc();
   80AB CD 89 80      [17]  124 	call	_initializeCpc
                            125 ;src/main.c:36: module_menu_initialize();
   80AE CD 7E 76      [17]  126 	call	_module_menu_initialize
                            127 ;src/main.c:37: module_game_initialize();
   80B1 CD A1 73      [17]  128 	call	_module_game_initialize
                            129 ;src/main.c:40: while (1) {
   80B4                     130 00102$:
                            131 ;src/main.c:41: play_scene(&scene_menu);   
   80B4 21 79 80      [10]  132 	ld	hl, #_scene_menu
   80B7 E5            [11]  133 	push	hl
   80B8 CD C5 80      [17]  134 	call	_play_scene
                            135 ;src/main.c:42: play_scene(&scene_game);   
   80BB 21 66 80      [10]  136 	ld	hl, #_scene_game
   80BE E3            [19]  137 	ex	(sp),hl
   80BF CD C5 80      [17]  138 	call	_play_scene
   80C2 F1            [10]  139 	pop	af
   80C3 18 EF         [12]  140 	jr	00102$
                            141 ;src/main.c:47: void play_scene(Scene *scene) {
                            142 ;	---------------------------------
                            143 ; Function play_scene
                            144 ; ---------------------------------
   80C5                     145 _play_scene::
   80C5 DD E5         [15]  146 	push	ix
   80C7 DD 21 00 00   [14]  147 	ld	ix,#0
   80CB DD 39         [15]  148 	add	ix,sp
   80CD F5            [11]  149 	push	af
                            150 ;src/main.c:50: scene->initialize();
   80CE DD 4E 04      [19]  151 	ld	c,4 (ix)
   80D1 DD 46 05      [19]  152 	ld	b,5 (ix)
   80D4 69            [ 4]  153 	ld	l, c
   80D5 60            [ 4]  154 	ld	h, b
   80D6 5E            [ 7]  155 	ld	e, (hl)
   80D7 23            [ 6]  156 	inc	hl
   80D8 66            [ 7]  157 	ld	h, (hl)
   80D9 C5            [11]  158 	push	bc
   80DA 6B            [ 4]  159 	ld	l, e
   80DB CD 7D 79      [17]  160 	call	___sdcc_call_hl
   80DE C1            [10]  161 	pop	bc
                            162 ;src/main.c:52: do
   80DF 33            [ 6]  163 	inc	sp
   80E0 33            [ 6]  164 	inc	sp
   80E1 C5            [11]  165 	push	bc
   80E2                     166 00102$:
                            167 ;src/main.c:57: cpct_waitVSYNC();
   80E2 C5            [11]  168 	push	bc
   80E3 CD B7 79      [17]  169 	call	_cpct_waitVSYNC
   80E6 C1            [10]  170 	pop	bc
                            171 ;src/main.c:59: scene->draw();
   80E7 E1            [10]  172 	pop	hl
   80E8 E5            [11]  173 	push	hl
   80E9 23            [ 6]  174 	inc	hl
   80EA 23            [ 6]  175 	inc	hl
   80EB 5E            [ 7]  176 	ld	e, (hl)
   80EC 23            [ 6]  177 	inc	hl
   80ED 66            [ 7]  178 	ld	h, (hl)
   80EE C5            [11]  179 	push	bc
   80EF 6B            [ 4]  180 	ld	l, e
   80F0 CD 7D 79      [17]  181 	call	___sdcc_call_hl
   80F3 C1            [10]  182 	pop	bc
                            183 ;src/main.c:60: state = scene->update();
   80F4 69            [ 4]  184 	ld	l, c
   80F5 60            [ 4]  185 	ld	h, b
   80F6 11 04 00      [10]  186 	ld	de, #0x0004
   80F9 19            [11]  187 	add	hl, de
   80FA 5E            [ 7]  188 	ld	e, (hl)
   80FB 23            [ 6]  189 	inc	hl
   80FC 66            [ 7]  190 	ld	h, (hl)
   80FD C5            [11]  191 	push	bc
   80FE 6B            [ 4]  192 	ld	l, e
   80FF CD 7D 79      [17]  193 	call	___sdcc_call_hl
   8102 C1            [10]  194 	pop	bc
                            195 ;src/main.c:66: for (i16 i=0; i< t; i++)
   8103 11 00 00      [10]  196 	ld	de, #0x0000
   8106                     197 00106$:
   8106 7B            [ 4]  198 	ld	a, e
   8107 D6 05         [ 7]  199 	sub	a, #0x05
   8109 7A            [ 4]  200 	ld	a, d
   810A 17            [ 4]  201 	rla
   810B 3F            [ 4]  202 	ccf
   810C 1F            [ 4]  203 	rra
   810D DE 80         [ 7]  204 	sbc	a, #0x80
   810F 30 03         [12]  205 	jr	NC,00103$
   8111 13            [ 6]  206 	inc	de
   8112 18 F2         [12]  207 	jr	00106$
   8114                     208 00103$:
                            209 ;src/main.c:73: } while (state == Continue);
   8114 7D            [ 4]  210 	ld	a, l
   8115 B7            [ 4]  211 	or	a, a
   8116 28 CA         [12]  212 	jr	Z,00102$
   8118 DD F9         [10]  213 	ld	sp, ix
   811A DD E1         [14]  214 	pop	ix
   811C C9            [10]  215 	ret
                            216 	.area _CODE
                            217 	.area _INITIALIZER
                            218 	.area _CABS (ABS)
