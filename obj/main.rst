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
                             52 ;src/main.c:15: void initializeCpc()
                             53 ;	---------------------------------
                             54 ; Function initializeCpc
                             55 ; ---------------------------------
   6746                      56 _initializeCpc::
                             57 ;src/main.c:19: cpct_disableFirmware();
   6746 CD 4F 6C      [17]   58 	call	_cpct_disableFirmware
                             59 ;src/main.c:21: cpct_setBorder(HW_BLACK);
   6749 21 10 14      [10]   60 	ld	hl, #0x1410
   674C E5            [11]   61 	push	hl
   674D CD A6 69      [17]   62 	call	_cpct_setPALColour
                             63 ;src/main.c:25: cpct_setVideoMode(0);
   6750 2E 00         [ 7]   64 	ld	l, #0x00
   6752 CD 18 6C      [17]   65 	call	_cpct_setVideoMode
                             66 ;src/main.c:27: cpct_setPalette((u8 *)g_palette, 16);
   6755 21 10 00      [10]   67 	ld	hl, #0x0010
   6758 E5            [11]   68 	push	hl
   6759 21 5F 60      [10]   69 	ld	hl, #_g_palette
   675C E5            [11]   70 	push	hl
   675D CD 19 69      [17]   71 	call	_cpct_setPalette
   6760 C9            [10]   72 	ret
                             73 ;src/main.c:32: void main(void)
                             74 ;	---------------------------------
                             75 ; Function main
                             76 ; ---------------------------------
   6761                      77 _main::
                             78 ;src/main.c:35: initializeCpc();
   6761 CD 46 67      [17]   79 	call	_initializeCpc
                             80 ;src/main.c:36: module_menu_initialize();
   6764 CD D7 68      [17]   81 	call	_module_menu_initialize
                             82 ;src/main.c:37: module_game_initialize();
   6767 CD 25 66      [17]   83 	call	_module_game_initialize
                             84 ;src/main.c:40: while (1) {
   676A                      85 00102$:
                             86 ;src/main.c:41: play_scene(&scene_menu);   
   676A 21 99 6D      [10]   87 	ld	hl, #_scene_menu
   676D E5            [11]   88 	push	hl
   676E CD 7B 67      [17]   89 	call	_play_scene
                             90 ;src/main.c:42: play_scene(&scene_game);   
   6771 21 89 6D      [10]   91 	ld	hl, #_scene_game
   6774 E3            [19]   92 	ex	(sp),hl
   6775 CD 7B 67      [17]   93 	call	_play_scene
   6778 F1            [10]   94 	pop	af
   6779 18 EF         [12]   95 	jr	00102$
                             96 ;src/main.c:47: void play_scene(Scene *scene) {
                             97 ;	---------------------------------
                             98 ; Function play_scene
                             99 ; ---------------------------------
   677B                     100 _play_scene::
   677B DD E5         [15]  101 	push	ix
   677D DD 21 00 00   [14]  102 	ld	ix,#0
   6781 DD 39         [15]  103 	add	ix,sp
                            104 ;src/main.c:50: scene->initialize();
   6783 DD 5E 04      [19]  105 	ld	e,4 (ix)
   6786 DD 56 05      [19]  106 	ld	d,5 (ix)
   6789 6B            [ 4]  107 	ld	l, e
   678A 62            [ 4]  108 	ld	h, d
   678B 4E            [ 7]  109 	ld	c, (hl)
   678C 23            [ 6]  110 	inc	hl
   678D 66            [ 7]  111 	ld	h, (hl)
   678E D5            [11]  112 	push	de
   678F 69            [ 4]  113 	ld	l, c
   6790 CD D6 6B      [17]  114 	call	___sdcc_call_hl
   6793 D1            [10]  115 	pop	de
                            116 ;src/main.c:52: do
   6794 4B            [ 4]  117 	ld	c, e
   6795 42            [ 4]  118 	ld	b, d
   6796                     119 00101$:
                            120 ;src/main.c:57: cpct_waitVSYNC();
   6796 C5            [11]  121 	push	bc
   6797 D5            [11]  122 	push	de
   6798 CD 10 6C      [17]  123 	call	_cpct_waitVSYNC
   679B D1            [10]  124 	pop	de
   679C C1            [10]  125 	pop	bc
                            126 ;src/main.c:59: scene->draw();
   679D 69            [ 4]  127 	ld	l, c
   679E 60            [ 4]  128 	ld	h, b
   679F 23            [ 6]  129 	inc	hl
   67A0 23            [ 6]  130 	inc	hl
   67A1 7E            [ 7]  131 	ld	a, (hl)
   67A2 23            [ 6]  132 	inc	hl
   67A3 66            [ 7]  133 	ld	h, (hl)
   67A4 6F            [ 4]  134 	ld	l, a
   67A5 C5            [11]  135 	push	bc
   67A6 D5            [11]  136 	push	de
   67A7 CD D6 6B      [17]  137 	call	___sdcc_call_hl
   67AA D1            [10]  138 	pop	de
   67AB C1            [10]  139 	pop	bc
                            140 ;src/main.c:60: state = scene->update();
   67AC 6B            [ 4]  141 	ld	l, e
   67AD 62            [ 4]  142 	ld	h, d
   67AE 23            [ 6]  143 	inc	hl
   67AF 23            [ 6]  144 	inc	hl
   67B0 23            [ 6]  145 	inc	hl
   67B1 23            [ 6]  146 	inc	hl
   67B2 7E            [ 7]  147 	ld	a, (hl)
   67B3 23            [ 6]  148 	inc	hl
   67B4 66            [ 7]  149 	ld	h, (hl)
   67B5 6F            [ 4]  150 	ld	l, a
   67B6 C5            [11]  151 	push	bc
   67B7 D5            [11]  152 	push	de
   67B8 CD D6 6B      [17]  153 	call	___sdcc_call_hl
   67BB D1            [10]  154 	pop	de
   67BC C1            [10]  155 	pop	bc
                            156 ;src/main.c:62: } while (state == Continue);
   67BD 7D            [ 4]  157 	ld	a, l
   67BE B7            [ 4]  158 	or	a, a
   67BF 28 D5         [12]  159 	jr	Z,00101$
   67C1 DD E1         [14]  160 	pop	ix
   67C3 C9            [10]  161 	ret
                            162 	.area _CODE
                            163 	.area _INITIALIZER
                            164 	.area _CABS (ABS)
