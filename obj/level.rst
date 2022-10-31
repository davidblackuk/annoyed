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
                             65 ;src/level.c:15: void level_initialize()
                             66 ;	---------------------------------
                             67 ; Function level_initialize
                             68 ; ---------------------------------
   74EB                      69 _level_initialize::
                             70 ;src/level.c:17: level_initialize_internal(FALSE);
   74EB AF            [ 4]   71 	xor	a, a
   74EC F5            [11]   72 	push	af
   74ED 33            [ 6]   73 	inc	sp
   74EE CD 47 75      [17]   74 	call	_level_initialize_internal
   74F1 33            [ 6]   75 	inc	sp
   74F2 C9            [10]   76 	ret
                             77 ;src/level.c:21: void level_continue_from_death() {
                             78 ;	---------------------------------
                             79 ; Function level_continue_from_death
                             80 ; ---------------------------------
   74F3                      81 _level_continue_from_death::
                             82 ;src/level.c:22: level_initialize_internal(TRUE);
   74F3 3E 01         [ 7]   83 	ld	a, #0x01
   74F5 F5            [11]   84 	push	af
   74F6 33            [ 6]   85 	inc	sp
   74F7 CD 47 75      [17]   86 	call	_level_initialize_internal
   74FA 33            [ 6]   87 	inc	sp
   74FB C9            [10]   88 	ret
                             89 ;src/level.c:26: void level_draw()
                             90 ;	---------------------------------
                             91 ; Function level_draw
                             92 ; ---------------------------------
   74FC                      93 _level_draw::
                             94 ;src/level.c:29: bat_restore_background();
   74FC CD 38 6C      [17]   95 	call	_bat_restore_background
                             96 ;src/level.c:30: balls_restore_background();
   74FF CD B2 68      [17]   97 	call	_balls_restore_background
                             98 ;src/level.c:31: blocks_restore_background();
   7502 CD 7E 6D      [17]   99 	call	_blocks_restore_background
                            100 ;src/level.c:34: blocks_draw();
   7505 CD 7D 6D      [17]  101 	call	_blocks_draw
                            102 ;src/level.c:35: bat_draw();
   7508 CD 58 6C      [17]  103 	call	_bat_draw
                            104 ;src/level.c:36: balls_draw();
   750B C3 0C 69      [10]  105 	jp  _balls_draw
                            106 ;src/level.c:39: SceneState level_update()
                            107 ;	---------------------------------
                            108 ; Function level_update
                            109 ; ---------------------------------
   750E                     110 _level_update::
   750E 3B            [ 6]  111 	dec	sp
                            112 ;src/level.c:42: SceneState res = Continue;
   750F FD 21 00 00   [14]  113 	ld	iy, #0
   7513 FD 39         [15]  114 	add	iy, sp
   7515 FD 36 00 00   [19]  115 	ld	0 (iy), #0x00
                            116 ;src/level.c:44: do
   7519                     117 00101$:
                            118 ;src/level.c:46: keys_update();
   7519 CD 69 74      [17]  119 	call	_keys_update
                            120 ;src/level.c:47: } while (key_pause_is_pressed);
   751C 3A 78 80      [13]  121 	ld	a,(#_key_pause_is_pressed + 0)
   751F B7            [ 4]  122 	or	a, a
   7520 20 F7         [12]  123 	jr	NZ,00101$
                            124 ;src/level.c:49: auto_update();
   7522 CD 6F 66      [17]  125 	call	_auto_update
                            126 ;src/level.c:50: bat_update();
   7525 CD F6 6B      [17]  127 	call	_bat_update
                            128 ;src/level.c:51: balls_update();
   7528 CD 7F 68      [17]  129 	call	_balls_update
                            130 ;src/level.c:54: if (balls_get_first_active() == NULL)
   752B CD 65 69      [17]  131 	call	_balls_get_first_active
   752E 7C            [ 4]  132 	ld	a, h
   752F B5            [ 4]  133 	or	a,l
   7530 20 0A         [12]  134 	jr	NZ,00105$
                            135 ;src/level.c:56: res = LevelCompleteFail;
   7532 FD 21 00 00   [14]  136 	ld	iy, #0
   7536 FD 39         [15]  137 	add	iy, sp
   7538 FD 36 00 02   [19]  138 	ld	0 (iy), #0x02
   753C                     139 00105$:
                            140 ;src/level.c:59: return res;
   753C FD 21 00 00   [14]  141 	ld	iy, #0
   7540 FD 39         [15]  142 	add	iy, sp
   7542 FD 6E 00      [19]  143 	ld	l, 0 (iy)
   7545 33            [ 6]  144 	inc	sp
   7546 C9            [10]  145 	ret
                            146 ;src/level.c:67: void level_initialize_internal(u8 is_restart)
                            147 ;	---------------------------------
                            148 ; Function level_initialize_internal
                            149 ; ---------------------------------
   7547                     150 _level_initialize_internal::
                            151 ;src/level.c:69: cpct_clearScreen(AN_PEN_BLACK);
   7547 21 00 40      [10]  152 	ld	hl, #0x4000
   754A E5            [11]  153 	push	hl
   754B AF            [ 4]  154 	xor	a, a
   754C F5            [11]  155 	push	af
   754D 33            [ 6]  156 	inc	sp
   754E 26 C0         [ 7]  157 	ld	h, #0xc0
   7550 E5            [11]  158 	push	hl
   7551 CD E8 79      [17]  159 	call	_cpct_memset
                            160 ;src/level.c:71: background_initialize();
   7554 CD D6 66      [17]  161 	call	_background_initialize
                            162 ;src/level.c:72: blocks_initialize(is_restart);
   7557 21 02 00      [10]  163 	ld	hl, #2+0
   755A 39            [11]  164 	add	hl, sp
   755B 7E            [ 7]  165 	ld	a, (hl)
   755C F5            [11]  166 	push	af
   755D 33            [ 6]  167 	inc	sp
   755E CD 6E 6D      [17]  168 	call	_blocks_initialize
   7561 33            [ 6]  169 	inc	sp
                            170 ;src/level.c:73: auto_initialize();
   7562 CD 69 66      [17]  171 	call	_auto_initialize
                            172 ;src/level.c:75: keys_initialize();
   7565 CD 4C 74      [17]  173 	call	_keys_initialize
                            174 ;src/level.c:76: bat_initialize();
   7568 CD E1 6B      [17]  175 	call	_bat_initialize
                            176 ;src/level.c:77: balls_initialize();
   756B CD 6E 68      [17]  177 	call	_balls_initialize
   756E C9            [10]  178 	ret
                            179 	.area _CODE
                            180 	.area _INITIALIZER
                            181 	.area _CABS (ABS)
