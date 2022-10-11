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
   6BF1                      56 _initializeCpc::
                             57 ;src/main.c:13: cpct_disableFirmware();
   6BF1 CD F8 70      [17]   58 	call	_cpct_disableFirmware
                             59 ;src/main.c:15: cpct_setBorder(HW_BLACK);
   6BF4 21 10 14      [10]   60 	ld	hl, #0x1410
   6BF7 E5            [11]   61 	push	hl
   6BF8 CD 4F 6E      [17]   62 	call	_cpct_setPALColour
                             63 ;src/main.c:19: cpct_setVideoMode(0);
   6BFB 2E 00         [ 7]   64 	ld	l, #0x00
   6BFD CD C1 70      [17]   65 	call	_cpct_setVideoMode
                             66 ;src/main.c:21: cpct_setPalette((u8 *)g_palette, 16);
   6C00 21 10 00      [10]   67 	ld	hl, #0x0010
   6C03 E5            [11]   68 	push	hl
   6C04 21 5F 60      [10]   69 	ld	hl, #_g_palette
   6C07 E5            [11]   70 	push	hl
   6C08 CD C2 6D      [17]   71 	call	_cpct_setPalette
   6C0B C9            [10]   72 	ret
                             73 ;src/main.c:26: void main(void)
                             74 ;	---------------------------------
                             75 ; Function main
                             76 ; ---------------------------------
   6C0C                      77 _main::
                             78 ;src/main.c:29: initializeCpc();
   6C0C CD F1 6B      [17]   79 	call	_initializeCpc
                             80 ;src/main.c:30: module_menu_initialize();
   6C0F CD 80 6D      [17]   81 	call	_module_menu_initialize
                             82 ;src/main.c:31: module_game_initialize();
   6C12 CD C6 6A      [17]   83 	call	_module_game_initialize
                             84 ;src/main.c:34: while (1) {
   6C15                      85 00102$:
                             86 ;src/main.c:35: play_scene(&scene_menu);   
   6C15 21 C5 75      [10]   87 	ld	hl, #_scene_menu
   6C18 E5            [11]   88 	push	hl
   6C19 CD 26 6C      [17]   89 	call	_play_scene
                             90 ;src/main.c:36: play_scene(&scene_game);   
   6C1C 21 B5 75      [10]   91 	ld	hl, #_scene_game
   6C1F E3            [19]   92 	ex	(sp),hl
   6C20 CD 26 6C      [17]   93 	call	_play_scene
   6C23 F1            [10]   94 	pop	af
   6C24 18 EF         [12]   95 	jr	00102$
                             96 ;src/main.c:41: void play_scene(Scene *scene) {
                             97 ;	---------------------------------
                             98 ; Function play_scene
                             99 ; ---------------------------------
   6C26                     100 _play_scene::
   6C26 DD E5         [15]  101 	push	ix
   6C28 DD 21 00 00   [14]  102 	ld	ix,#0
   6C2C DD 39         [15]  103 	add	ix,sp
   6C2E F5            [11]  104 	push	af
                            105 ;src/main.c:44: scene->initialize();
   6C2F DD 4E 04      [19]  106 	ld	c,4 (ix)
   6C32 DD 46 05      [19]  107 	ld	b,5 (ix)
   6C35 69            [ 4]  108 	ld	l, c
   6C36 60            [ 4]  109 	ld	h, b
   6C37 5E            [ 7]  110 	ld	e, (hl)
   6C38 23            [ 6]  111 	inc	hl
   6C39 66            [ 7]  112 	ld	h, (hl)
   6C3A C5            [11]  113 	push	bc
   6C3B 6B            [ 4]  114 	ld	l, e
   6C3C CD 7F 70      [17]  115 	call	___sdcc_call_hl
   6C3F C1            [10]  116 	pop	bc
                            117 ;src/main.c:46: do
   6C40 33            [ 6]  118 	inc	sp
   6C41 33            [ 6]  119 	inc	sp
   6C42 C5            [11]  120 	push	bc
   6C43                     121 00102$:
                            122 ;src/main.c:51: cpct_waitVSYNC();
   6C43 C5            [11]  123 	push	bc
   6C44 CD B9 70      [17]  124 	call	_cpct_waitVSYNC
   6C47 C1            [10]  125 	pop	bc
                            126 ;src/main.c:53: scene->draw();
   6C48 E1            [10]  127 	pop	hl
   6C49 E5            [11]  128 	push	hl
   6C4A 23            [ 6]  129 	inc	hl
   6C4B 23            [ 6]  130 	inc	hl
   6C4C 5E            [ 7]  131 	ld	e, (hl)
   6C4D 23            [ 6]  132 	inc	hl
   6C4E 66            [ 7]  133 	ld	h, (hl)
   6C4F C5            [11]  134 	push	bc
   6C50 6B            [ 4]  135 	ld	l, e
   6C51 CD 7F 70      [17]  136 	call	___sdcc_call_hl
   6C54 C1            [10]  137 	pop	bc
                            138 ;src/main.c:54: state = scene->update();
   6C55 69            [ 4]  139 	ld	l, c
   6C56 60            [ 4]  140 	ld	h, b
   6C57 11 04 00      [10]  141 	ld	de, #0x0004
   6C5A 19            [11]  142 	add	hl, de
   6C5B 5E            [ 7]  143 	ld	e, (hl)
   6C5C 23            [ 6]  144 	inc	hl
   6C5D 66            [ 7]  145 	ld	h, (hl)
   6C5E C5            [11]  146 	push	bc
   6C5F 6B            [ 4]  147 	ld	l, e
   6C60 CD 7F 70      [17]  148 	call	___sdcc_call_hl
   6C63 C1            [10]  149 	pop	bc
                            150 ;src/main.c:59: for (i16 i=0; i< 2000; i++)
   6C64 11 00 00      [10]  151 	ld	de, #0x0000
   6C67                     152 00106$:
   6C67 7B            [ 4]  153 	ld	a, e
   6C68 D6 D0         [ 7]  154 	sub	a, #0xd0
   6C6A 7A            [ 4]  155 	ld	a, d
   6C6B 17            [ 4]  156 	rla
   6C6C 3F            [ 4]  157 	ccf
   6C6D 1F            [ 4]  158 	rra
   6C6E DE 87         [ 7]  159 	sbc	a, #0x87
   6C70 30 03         [12]  160 	jr	NC,00103$
   6C72 13            [ 6]  161 	inc	de
   6C73 18 F2         [12]  162 	jr	00106$
   6C75                     163 00103$:
                            164 ;src/main.c:66: } while (state == Continue);
   6C75 7D            [ 4]  165 	ld	a, l
   6C76 B7            [ 4]  166 	or	a, a
   6C77 28 CA         [12]  167 	jr	Z,00102$
   6C79 DD F9         [10]  168 	ld	sp, ix
   6C7B DD E1         [14]  169 	pop	ix
   6C7D C9            [10]  170 	ret
                            171 	.area _CODE
                            172 	.area _INITIALIZER
                            173 	.area _CABS (ABS)
