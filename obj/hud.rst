                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module hud
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _cpct_getScreenPtr
                             12 	.globl _cpct_drawSprite
                             13 	.globl _hud_initialize
                             14 	.globl _hud_continue_from_death
                             15 	.globl _hud_update
                             16 	.globl _hud_restore_background
                             17 	.globl _hud_draw
                             18 	.globl _hud_initialize_internal
                             19 ;--------------------------------------------------------
                             20 ; special function registers
                             21 ;--------------------------------------------------------
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _DATA
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _INITIALIZED
                             30 ;--------------------------------------------------------
                             31 ; absolute external ram data
                             32 ;--------------------------------------------------------
                             33 	.area _DABS (ABS)
                             34 ;--------------------------------------------------------
                             35 ; global & static initialisations
                             36 ;--------------------------------------------------------
                             37 	.area _HOME
                             38 	.area _GSINIT
                             39 	.area _GSFINAL
                             40 	.area _GSINIT
                             41 ;--------------------------------------------------------
                             42 ; Home
                             43 ;--------------------------------------------------------
                             44 	.area _HOME
                             45 	.area _HOME
                             46 ;--------------------------------------------------------
                             47 ; code
                             48 ;--------------------------------------------------------
                             49 	.area _CODE
                             50 ;src/hud.c:18: void hud_initialize()
                             51 ;	---------------------------------
                             52 ; Function hud_initialize
                             53 ; ---------------------------------
   73D8                      54 _hud_initialize::
                             55 ;src/hud.c:20: hud_initialize_internal(FALSE);
   73D8 AF            [ 4]   56 	xor	a, a
   73D9 F5            [11]   57 	push	af
   73DA 33            [ 6]   58 	inc	sp
   73DB CD EC 73      [17]   59 	call	_hud_initialize_internal
   73DE 33            [ 6]   60 	inc	sp
   73DF C9            [10]   61 	ret
                             62 ;src/hud.c:23: void hud_continue_from_death()
                             63 ;	---------------------------------
                             64 ; Function hud_continue_from_death
                             65 ; ---------------------------------
   73E0                      66 _hud_continue_from_death::
                             67 ;src/hud.c:25: hud_initialize_internal(TRUE);
   73E0 3E 01         [ 7]   68 	ld	a, #0x01
   73E2 F5            [11]   69 	push	af
   73E3 33            [ 6]   70 	inc	sp
   73E4 CD EC 73      [17]   71 	call	_hud_initialize_internal
   73E7 33            [ 6]   72 	inc	sp
   73E8 C9            [10]   73 	ret
                             74 ;src/hud.c:28: void hud_update()
                             75 ;	---------------------------------
                             76 ; Function hud_update
                             77 ; ---------------------------------
   73E9                      78 _hud_update::
                             79 ;src/hud.c:30: }
   73E9 C9            [10]   80 	ret
                             81 ;src/hud.c:32: void hud_restore_background()
                             82 ;	---------------------------------
                             83 ; Function hud_restore_background
                             84 ; ---------------------------------
   73EA                      85 _hud_restore_background::
                             86 ;src/hud.c:34: }
   73EA C9            [10]   87 	ret
                             88 ;src/hud.c:36: void hud_draw()
                             89 ;	---------------------------------
                             90 ; Function hud_draw
                             91 ; ---------------------------------
   73EB                      92 _hud_draw::
                             93 ;src/hud.c:38: }
   73EB C9            [10]   94 	ret
                             95 ;src/hud.c:44: void hud_initialize_internal(u8 is_restart)
                             96 ;	---------------------------------
                             97 ; Function hud_initialize_internal
                             98 ; ---------------------------------
   73EC                      99 _hud_initialize_internal::
   73EC DD E5         [15]  100 	push	ix
   73EE 3B            [ 6]  101 	dec	sp
                            102 ;src/hud.c:46: u8 initial_y = SCREEN_HEIGHT_ROWS - (((lives_left - 1) / 2) * 8) - 8; 
   73EF 21 6E 80      [10]  103 	ld	hl,#_lives_left + 0
   73F2 5E            [ 7]  104 	ld	e, (hl)
   73F3 16 00         [ 7]  105 	ld	d, #0x00
   73F5 6B            [ 4]  106 	ld	l, e
   73F6 62            [ 4]  107 	ld	h, d
   73F7 2B            [ 6]  108 	dec	hl
   73F8 4D            [ 4]  109 	ld	c, l
   73F9 44            [ 4]  110 	ld	b, h
   73FA CB 7C         [ 8]  111 	bit	7, h
   73FC 28 02         [12]  112 	jr	Z,00107$
   73FE 4B            [ 4]  113 	ld	c, e
   73FF 42            [ 4]  114 	ld	b, d
   7400                     115 00107$:
   7400 CB 28         [ 8]  116 	sra	b
   7402 CB 19         [ 8]  117 	rr	c
   7404 79            [ 4]  118 	ld	a, c
   7405 07            [ 4]  119 	rlca
   7406 07            [ 4]  120 	rlca
   7407 07            [ 4]  121 	rlca
   7408 E6 F8         [ 7]  122 	and	a, #0xf8
   740A 4F            [ 4]  123 	ld	c, a
   740B 3E C0         [ 7]  124 	ld	a, #0xc0
   740D 91            [ 4]  125 	sub	a, c
   740E 4F            [ 4]  126 	ld	c, a
                            127 ;src/hud.c:48: for (u8 i = 0; i < lives_left; i++)
   740F 06 00         [ 7]  128 	ld	b, #0x00
   7411                     129 00103$:
   7411 21 6E 80      [10]  130 	ld	hl, #_lives_left
   7414 78            [ 4]  131 	ld	a, b
   7415 96            [ 7]  132 	sub	a, (hl)
   7416 30 30         [12]  133 	jr	NC,00105$
                            134 ;src/hud.c:50: u8 x = ((i & 1) == 0) ? HUD_LEFT : HUD_LEFT + (SP_LIFE_W + 1);
   7418 CB 40         [ 8]  135 	bit	0, b
   741A 20 04         [12]  136 	jr	NZ,00108$
   741C 16 44         [ 7]  137 	ld	d, #0x44
   741E 18 02         [12]  138 	jr	00109$
   7420                     139 00108$:
   7420 16 4A         [ 7]  140 	ld	d, #0x4a
   7422                     141 00109$:
                            142 ;src/hud.c:51: u8 y = initial_y + ((i / 2) * 8);
   7422 78            [ 4]  143 	ld	a, b
   7423 CB 3F         [ 8]  144 	srl	a
   7425 07            [ 4]  145 	rlca
   7426 07            [ 4]  146 	rlca
   7427 07            [ 4]  147 	rlca
   7428 E6 F8         [ 7]  148 	and	a, #0xf8
   742A 5F            [ 4]  149 	ld	e, a
   742B 81            [ 4]  150 	add	a,c
                            151 ;src/hud.c:53: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   742C C5            [11]  152 	push	bc
   742D F5            [11]  153 	push	af
   742E 33            [ 6]  154 	inc	sp
   742F D5            [11]  155 	push	de
   7430 33            [ 6]  156 	inc	sp
   7431 21 00 C0      [10]  157 	ld	hl, #0xc000
   7434 E5            [11]  158 	push	hl
   7435 CD 48 7B      [17]  159 	call	_cpct_getScreenPtr
   7438 11 05 06      [10]  160 	ld	de, #0x0605
   743B D5            [11]  161 	push	de
   743C E5            [11]  162 	push	hl
   743D 21 F4 5B      [10]  163 	ld	hl, #_sp_life
   7440 E5            [11]  164 	push	hl
   7441 CD F7 77      [17]  165 	call	_cpct_drawSprite
   7444 C1            [10]  166 	pop	bc
                            167 ;src/hud.c:48: for (u8 i = 0; i < lives_left; i++)
   7445 04            [ 4]  168 	inc	b
   7446 18 C9         [12]  169 	jr	00103$
   7448                     170 00105$:
   7448 33            [ 6]  171 	inc	sp
   7449 DD E1         [14]  172 	pop	ix
   744B C9            [10]  173 	ret
                            174 	.area _CODE
                            175 	.area _INITIALIZER
                            176 	.area _CABS (ABS)
