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
   6B89                      56 _initializeCpc::
                             57 ;src/main.c:13: cpct_disableFirmware();
   6B89 CD 90 70      [17]   58 	call	_cpct_disableFirmware
                             59 ;src/main.c:15: cpct_setBorder(HW_BLACK);
   6B8C 21 10 14      [10]   60 	ld	hl, #0x1410
   6B8F E5            [11]   61 	push	hl
   6B90 CD E7 6D      [17]   62 	call	_cpct_setPALColour
                             63 ;src/main.c:19: cpct_setVideoMode(0);
   6B93 2E 00         [ 7]   64 	ld	l, #0x00
   6B95 CD 59 70      [17]   65 	call	_cpct_setVideoMode
                             66 ;src/main.c:21: cpct_setPalette((u8 *)g_palette, 16);
   6B98 21 10 00      [10]   67 	ld	hl, #0x0010
   6B9B E5            [11]   68 	push	hl
   6B9C 21 5F 60      [10]   69 	ld	hl, #_g_palette
   6B9F E5            [11]   70 	push	hl
   6BA0 CD 5A 6D      [17]   71 	call	_cpct_setPalette
   6BA3 C9            [10]   72 	ret
                             73 ;src/main.c:26: void main(void)
                             74 ;	---------------------------------
                             75 ; Function main
                             76 ; ---------------------------------
   6BA4                      77 _main::
                             78 ;src/main.c:29: initializeCpc();
   6BA4 CD 89 6B      [17]   79 	call	_initializeCpc
                             80 ;src/main.c:30: module_menu_initialize();
   6BA7 CD 18 6D      [17]   81 	call	_module_menu_initialize
                             82 ;src/main.c:31: module_game_initialize();
   6BAA CD 5E 6A      [17]   83 	call	_module_game_initialize
                             84 ;src/main.c:34: while (1) {
   6BAD                      85 00102$:
                             86 ;src/main.c:35: play_scene(&scene_menu);   
   6BAD 21 5D 75      [10]   87 	ld	hl, #_scene_menu
   6BB0 E5            [11]   88 	push	hl
   6BB1 CD BE 6B      [17]   89 	call	_play_scene
                             90 ;src/main.c:36: play_scene(&scene_game);   
   6BB4 21 4D 75      [10]   91 	ld	hl, #_scene_game
   6BB7 E3            [19]   92 	ex	(sp),hl
   6BB8 CD BE 6B      [17]   93 	call	_play_scene
   6BBB F1            [10]   94 	pop	af
   6BBC 18 EF         [12]   95 	jr	00102$
                             96 ;src/main.c:41: void play_scene(Scene *scene) {
                             97 ;	---------------------------------
                             98 ; Function play_scene
                             99 ; ---------------------------------
   6BBE                     100 _play_scene::
   6BBE DD E5         [15]  101 	push	ix
   6BC0 DD 21 00 00   [14]  102 	ld	ix,#0
   6BC4 DD 39         [15]  103 	add	ix,sp
   6BC6 F5            [11]  104 	push	af
                            105 ;src/main.c:44: scene->initialize();
   6BC7 DD 4E 04      [19]  106 	ld	c,4 (ix)
   6BCA DD 46 05      [19]  107 	ld	b,5 (ix)
   6BCD 69            [ 4]  108 	ld	l, c
   6BCE 60            [ 4]  109 	ld	h, b
   6BCF 5E            [ 7]  110 	ld	e, (hl)
   6BD0 23            [ 6]  111 	inc	hl
   6BD1 66            [ 7]  112 	ld	h, (hl)
   6BD2 C5            [11]  113 	push	bc
   6BD3 6B            [ 4]  114 	ld	l, e
   6BD4 CD 17 70      [17]  115 	call	___sdcc_call_hl
   6BD7 C1            [10]  116 	pop	bc
                            117 ;src/main.c:46: do
   6BD8 33            [ 6]  118 	inc	sp
   6BD9 33            [ 6]  119 	inc	sp
   6BDA C5            [11]  120 	push	bc
   6BDB                     121 00102$:
                            122 ;src/main.c:51: cpct_waitVSYNC();
   6BDB C5            [11]  123 	push	bc
   6BDC CD 51 70      [17]  124 	call	_cpct_waitVSYNC
   6BDF C1            [10]  125 	pop	bc
                            126 ;src/main.c:53: scene->draw();
   6BE0 E1            [10]  127 	pop	hl
   6BE1 E5            [11]  128 	push	hl
   6BE2 23            [ 6]  129 	inc	hl
   6BE3 23            [ 6]  130 	inc	hl
   6BE4 5E            [ 7]  131 	ld	e, (hl)
   6BE5 23            [ 6]  132 	inc	hl
   6BE6 66            [ 7]  133 	ld	h, (hl)
   6BE7 C5            [11]  134 	push	bc
   6BE8 6B            [ 4]  135 	ld	l, e
   6BE9 CD 17 70      [17]  136 	call	___sdcc_call_hl
   6BEC C1            [10]  137 	pop	bc
                            138 ;src/main.c:54: state = scene->update();
   6BED 69            [ 4]  139 	ld	l, c
   6BEE 60            [ 4]  140 	ld	h, b
   6BEF 11 04 00      [10]  141 	ld	de, #0x0004
   6BF2 19            [11]  142 	add	hl, de
   6BF3 5E            [ 7]  143 	ld	e, (hl)
   6BF4 23            [ 6]  144 	inc	hl
   6BF5 66            [ 7]  145 	ld	h, (hl)
   6BF6 C5            [11]  146 	push	bc
   6BF7 6B            [ 4]  147 	ld	l, e
   6BF8 CD 17 70      [17]  148 	call	___sdcc_call_hl
   6BFB C1            [10]  149 	pop	bc
                            150 ;src/main.c:59: for (i16 i=0; i< 7000; i++)
   6BFC 11 00 00      [10]  151 	ld	de, #0x0000
   6BFF                     152 00106$:
   6BFF 7B            [ 4]  153 	ld	a, e
   6C00 D6 58         [ 7]  154 	sub	a, #0x58
   6C02 7A            [ 4]  155 	ld	a, d
   6C03 17            [ 4]  156 	rla
   6C04 3F            [ 4]  157 	ccf
   6C05 1F            [ 4]  158 	rra
   6C06 DE 9B         [ 7]  159 	sbc	a, #0x9b
   6C08 30 03         [12]  160 	jr	NC,00103$
   6C0A 13            [ 6]  161 	inc	de
   6C0B 18 F2         [12]  162 	jr	00106$
   6C0D                     163 00103$:
                            164 ;src/main.c:66: } while (state == Continue);
   6C0D 7D            [ 4]  165 	ld	a, l
   6C0E B7            [ 4]  166 	or	a, a
   6C0F 28 CA         [12]  167 	jr	Z,00102$
   6C11 DD F9         [10]  168 	ld	sp, ix
   6C13 DD E1         [14]  169 	pop	ix
   6C15 C9            [10]  170 	ret
                            171 	.area _CODE
                            172 	.area _INITIALIZER
                            173 	.area _CABS (ABS)
