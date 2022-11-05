                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module level
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _auto_update
                             12 	.globl _auto_initialize
                             13 	.globl _keys_update
                             14 	.globl _keys_initialize
                             15 	.globl _blocks_restore_background
                             16 	.globl _blocks_draw
                             17 	.globl _blocks_initialize
                             18 	.globl _background_initialize
                             19 	.globl _bat_draw
                             20 	.globl _bat_restore_background
                             21 	.globl _bat_update
                             22 	.globl _bat_initialize
                             23 	.globl _balls_get_first_active
                             24 	.globl _balls_draw
                             25 	.globl _balls_restore_background
                             26 	.globl _balls_update
                             27 	.globl _balls_initialize
                             28 	.globl _cpct_memset
                             29 	.globl _level_initialize
                             30 	.globl _level_continue_from_death
                             31 	.globl _level_draw
                             32 	.globl _level_update
                             33 	.globl _level_initialize_internal
                             34 ;--------------------------------------------------------
                             35 ; special function registers
                             36 ;--------------------------------------------------------
                             37 ;--------------------------------------------------------
                             38 ; ram data
                             39 ;--------------------------------------------------------
                             40 	.area _DATA
                             41 ;--------------------------------------------------------
                             42 ; ram data
                             43 ;--------------------------------------------------------
                             44 	.area _INITIALIZED
                             45 ;--------------------------------------------------------
                             46 ; absolute external ram data
                             47 ;--------------------------------------------------------
                             48 	.area _DABS (ABS)
                             49 ;--------------------------------------------------------
                             50 ; global & static initialisations
                             51 ;--------------------------------------------------------
                             52 	.area _HOME
                             53 	.area _GSINIT
                             54 	.area _GSFINAL
                             55 	.area _GSINIT
                             56 ;--------------------------------------------------------
                             57 ; Home
                             58 ;--------------------------------------------------------
                             59 	.area _HOME
                             60 	.area _HOME
                             61 ;--------------------------------------------------------
                             62 ; code
                             63 ;--------------------------------------------------------
                             64 	.area _CODE
                             65 ;src/level.c:27: void level_initialize()
                             66 ;	---------------------------------
                             67 ; Function level_initialize
                             68 ; ---------------------------------
   7A06                      69 _level_initialize::
                             70 ;src/level.c:29: level_initialize_internal(FALSE);
   7A06 AF            [ 4]   71 	xor	a, a
   7A07 F5            [11]   72 	push	af
   7A08 33            [ 6]   73 	inc	sp
   7A09 CD 78 7A      [17]   74 	call	_level_initialize_internal
   7A0C 33            [ 6]   75 	inc	sp
   7A0D C9            [10]   76 	ret
                             77 ;src/level.c:33: void level_continue_from_death()
                             78 ;	---------------------------------
                             79 ; Function level_continue_from_death
                             80 ; ---------------------------------
   7A0E                      81 _level_continue_from_death::
                             82 ;src/level.c:35: level_initialize_internal(TRUE);
   7A0E 3E 01         [ 7]   83 	ld	a, #0x01
   7A10 F5            [11]   84 	push	af
   7A11 33            [ 6]   85 	inc	sp
   7A12 CD 78 7A      [17]   86 	call	_level_initialize_internal
   7A15 33            [ 6]   87 	inc	sp
   7A16 C9            [10]   88 	ret
                             89 ;src/level.c:38: void level_draw()
                             90 ;	---------------------------------
                             91 ; Function level_draw
                             92 ; ---------------------------------
   7A17                      93 _level_draw::
                             94 ;src/level.c:41: bat_restore_background();
   7A17 CD 2B 6F      [17]   95 	call	_bat_restore_background
                             96 ;src/level.c:42: balls_restore_background();
   7A1A CD AB 6B      [17]   97 	call	_balls_restore_background
                             98 ;src/level.c:43: blocks_restore_background();
   7A1D CD 69 70      [17]   99 	call	_blocks_restore_background
                            100 ;src/level.c:46: blocks_draw();
   7A20 CD 68 70      [17]  101 	call	_blocks_draw
                            102 ;src/level.c:47: bat_draw();
   7A23 CD 4B 6F      [17]  103 	call	_bat_draw
                            104 ;src/level.c:48: balls_draw();
   7A26 C3 05 6C      [10]  105 	jp  _balls_draw
                            106 ;src/level.c:51: SceneState level_update()
                            107 ;	---------------------------------
                            108 ; Function level_update
                            109 ; ---------------------------------
   7A29                     110 _level_update::
   7A29 3B            [ 6]  111 	dec	sp
                            112 ;src/level.c:54: SceneState res = Continue;
   7A2A FD 21 00 00   [14]  113 	ld	iy, #0
   7A2E FD 39         [15]  114 	add	iy, sp
   7A30 FD 36 00 00   [19]  115 	ld	0 (iy), #0x00
                            116 ;src/level.c:56: do
   7A34                     117 00101$:
                            118 ;src/level.c:58: keys_update();
   7A34 CD 84 79      [17]  119 	call	_keys_update
                            120 ;src/level.c:59: } while (key_pause_is_pressed);
   7A37 3A 29 88      [13]  121 	ld	a,(#_key_pause_is_pressed + 0)
   7A3A B7            [ 4]  122 	or	a, a
   7A3B 20 F7         [12]  123 	jr	NZ,00101$
                            124 ;src/level.c:61: auto_update();
   7A3D CD 91 69      [17]  125 	call	_auto_update
                            126 ;src/level.c:62: bat_update();
   7A40 CD E9 6E      [17]  127 	call	_bat_update
                            128 ;src/level.c:63: balls_update();
   7A43 CD 78 6B      [17]  129 	call	_balls_update
                            130 ;src/level.c:66: if (balls_get_first_active() == NULL)
   7A46 CD 5A 6C      [17]  131 	call	_balls_get_first_active
   7A49 7C            [ 4]  132 	ld	a, h
   7A4A B5            [ 4]  133 	or	a,l
   7A4B 20 0A         [12]  134 	jr	NZ,00105$
                            135 ;src/level.c:68: res = LevelCompleteFail;
   7A4D FD 21 00 00   [14]  136 	ld	iy, #0
   7A51 FD 39         [15]  137 	add	iy, sp
   7A53 FD 36 00 02   [19]  138 	ld	0 (iy), #0x02
   7A57                     139 00105$:
                            140 ;src/level.c:70: if (blocks_remaining == 0)
   7A57 FD 21 FF 87   [14]  141 	ld	iy, #_blocks_remaining
   7A5B FD 7E 01      [19]  142 	ld	a, 1 (iy)
   7A5E FD B6 00      [19]  143 	or	a,0 (iy)
   7A61 20 0A         [12]  144 	jr	NZ,00107$
                            145 ;src/level.c:72: res = LevelCompleteSuccess;
   7A63 FD 21 00 00   [14]  146 	ld	iy, #0
   7A67 FD 39         [15]  147 	add	iy, sp
   7A69 FD 36 00 03   [19]  148 	ld	0 (iy), #0x03
   7A6D                     149 00107$:
                            150 ;src/level.c:75: return res;
   7A6D FD 21 00 00   [14]  151 	ld	iy, #0
   7A71 FD 39         [15]  152 	add	iy, sp
   7A73 FD 6E 00      [19]  153 	ld	l, 0 (iy)
   7A76 33            [ 6]  154 	inc	sp
   7A77 C9            [10]  155 	ret
                            156 ;src/level.c:82: void level_initialize_internal(u8 is_restart)
                            157 ;	---------------------------------
                            158 ; Function level_initialize_internal
                            159 ; ---------------------------------
   7A78                     160 _level_initialize_internal::
                            161 ;src/level.c:84: cpct_clearScreen(AN_PEN_BLACK);
   7A78 21 00 40      [10]  162 	ld	hl, #0x4000
   7A7B E5            [11]  163 	push	hl
   7A7C AF            [ 4]  164 	xor	a, a
   7A7D F5            [11]  165 	push	af
   7A7E 33            [ 6]  166 	inc	sp
   7A7F 26 C0         [ 7]  167 	ld	h, #0xc0
   7A81 E5            [11]  168 	push	hl
   7A82 CD 8A 81      [17]  169 	call	_cpct_memset
                            170 ;src/level.c:86: background_initialize();
   7A85 CD F8 69      [17]  171 	call	_background_initialize
                            172 ;src/level.c:87: blocks_initialize(is_restart);
   7A88 21 02 00      [10]  173 	ld	hl, #2+0
   7A8B 39            [11]  174 	add	hl, sp
   7A8C 7E            [ 7]  175 	ld	a, (hl)
   7A8D F5            [11]  176 	push	af
   7A8E 33            [ 6]  177 	inc	sp
   7A8F CD 59 70      [17]  178 	call	_blocks_initialize
   7A92 33            [ 6]  179 	inc	sp
                            180 ;src/level.c:88: auto_initialize();
   7A93 CD 8B 69      [17]  181 	call	_auto_initialize
                            182 ;src/level.c:90: keys_initialize();
   7A96 CD 67 79      [17]  183 	call	_keys_initialize
                            184 ;src/level.c:91: bat_initialize();
   7A99 CD D4 6E      [17]  185 	call	_bat_initialize
                            186 ;src/level.c:92: balls_initialize();
   7A9C CD 67 6B      [17]  187 	call	_balls_initialize
   7A9F C9            [10]  188 	ret
                            189 	.area _CODE
                            190 	.area _INITIALIZER
                            191 	.area _CABS (ABS)
