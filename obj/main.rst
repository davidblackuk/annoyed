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
                             13 	.globl _keys_update
                             14 	.globl _keys_initialize
                             15 	.globl _initializeBackground
                             16 	.globl _balls_draw
                             17 	.globl _balls_update
                             18 	.globl _balls_initialize
                             19 	.globl _bat_draw
                             20 	.globl _bat_restore_background
                             21 	.globl _bat_update
                             22 	.globl _bat_initialize
                             23 	.globl _cpct_setPALColour
                             24 	.globl _cpct_setPalette
                             25 	.globl _cpct_waitVSYNC
                             26 	.globl _cpct_setVideoMode
                             27 	.globl _cpct_disableFirmware
                             28 ;--------------------------------------------------------
                             29 ; special function registers
                             30 ;--------------------------------------------------------
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _DATA
                             35 ;--------------------------------------------------------
                             36 ; ram data
                             37 ;--------------------------------------------------------
                             38 	.area _INITIALIZED
                             39 ;--------------------------------------------------------
                             40 ; absolute external ram data
                             41 ;--------------------------------------------------------
                             42 	.area _DABS (ABS)
                             43 ;--------------------------------------------------------
                             44 ; global & static initialisations
                             45 ;--------------------------------------------------------
                             46 	.area _HOME
                             47 	.area _GSINIT
                             48 	.area _GSFINAL
                             49 	.area _GSINIT
                             50 ;--------------------------------------------------------
                             51 ; Home
                             52 ;--------------------------------------------------------
                             53 	.area _HOME
                             54 	.area _HOME
                             55 ;--------------------------------------------------------
                             56 ; code
                             57 ;--------------------------------------------------------
                             58 	.area _CODE
                             59 ;src/main.c:14: void initializeCpc() {
                             60 ;	---------------------------------
                             61 ; Function initializeCpc
                             62 ; ---------------------------------
   503A                      63 _initializeCpc::
                             64 ;src/main.c:17: cpct_disableFirmware();
   503A CD E5 52      [17]   65 	call	_cpct_disableFirmware
                             66 ;src/main.c:20: cpct_setVideoMode(0);
   503D 2E 00         [ 7]   67 	ld	l, #0x00
   503F CD D7 52      [17]   68 	call	_cpct_setVideoMode
                             69 ;src/main.c:22: cpct_setBorder(HW_BRIGHT_YELLOW);
   5042 21 10 0A      [10]   70 	ld	hl, #0x0a10
   5045 E5            [11]   71 	push	hl
   5046 CD 11 51      [17]   72 	call	_cpct_setPALColour
                             73 ;src/main.c:24: cpct_setPalette((u8*)g_palette, 16);
   5049 21 10 00      [10]   74 	ld	hl, #0x0010
   504C E5            [11]   75 	push	hl
   504D 21 D4 4A      [10]   76 	ld	hl, #_g_palette
   5050 E5            [11]   77 	push	hl
   5051 CD 84 50      [17]   78 	call	_cpct_setPalette
   5054 C9            [10]   79 	ret
                             80 ;src/main.c:28: void main(void) {
                             81 ;	---------------------------------
                             82 ; Function main
                             83 ; ---------------------------------
   5055                      84 _main::
                             85 ;src/main.c:30: initializeCpc();
   5055 CD 3A 50      [17]   86 	call	_initializeCpc
                             87 ;src/main.c:32: initializeBackground();
   5058 CD 1B 4B      [17]   88 	call	_initializeBackground
                             89 ;src/main.c:34: auto_initialize();
   505B CD E4 4A      [17]   90 	call	_auto_initialize
                             91 ;src/main.c:35: keys_initialize();
   505E CD FC 4F      [17]   92 	call	_keys_initialize
                             93 ;src/main.c:36: bat_initialize();
   5061 CD CD 4E      [17]   94 	call	_bat_initialize
                             95 ;src/main.c:37: balls_initialize();
   5064 CD CA 4B      [17]   96 	call	_balls_initialize
                             97 ;src/main.c:39: while (1) {
   5067                      98 00102$:
                             99 ;src/main.c:43: cpct_waitVSYNC();
   5067 CD CF 52      [17]  100 	call	_cpct_waitVSYNC
                            101 ;src/main.c:46: bat_restore_background();
   506A CD 29 4F      [17]  102 	call	_bat_restore_background
                            103 ;src/main.c:47: balls_restore_background();
   506D CD 66 4C      [17]  104 	call	_balls_restore_background
                            105 ;src/main.c:50: bat_draw();
   5070 CD 42 4F      [17]  106 	call	_bat_draw
                            107 ;src/main.c:51: balls_draw();
   5073 CD AA 4C      [17]  108 	call	_balls_draw
                            109 ;src/main.c:54: keys_update();
   5076 CD 0F 50      [17]  110 	call	_keys_update
                            111 ;src/main.c:55: auto_update();
   5079 CD E5 4A      [17]  112 	call	_auto_update
                            113 ;src/main.c:56: bat_update();
   507C CD E2 4E      [17]  114 	call	_bat_update
                            115 ;src/main.c:57: balls_update();
   507F CD 18 4C      [17]  116 	call	_balls_update
   5082 18 E3         [12]  117 	jr	00102$
                            118 	.area _CODE
                            119 	.area _INITIALIZER
                            120 	.area _CABS (ABS)
