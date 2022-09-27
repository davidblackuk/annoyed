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
                             13 	.globl _initializeBackground
                             14 	.globl _initializeBat
                             15 	.globl _updateBat
                             16 	.globl _drawBat
                             17 	.globl _cpct_setPALColour
                             18 	.globl _cpct_setPalette
                             19 	.globl _cpct_waitVSYNC
                             20 	.globl _cpct_setVideoMode
                             21 	.globl _cpct_scanKeyboard_f
                             22 	.globl _cpct_disableFirmware
                             23 ;--------------------------------------------------------
                             24 ; special function registers
                             25 ;--------------------------------------------------------
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DATA
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _INITIALIZED
                             34 ;--------------------------------------------------------
                             35 ; absolute external ram data
                             36 ;--------------------------------------------------------
                             37 	.area _DABS (ABS)
                             38 ;--------------------------------------------------------
                             39 ; global & static initialisations
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _GSINIT
                             43 	.area _GSFINAL
                             44 	.area _GSINIT
                             45 ;--------------------------------------------------------
                             46 ; Home
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _HOME
                             50 ;--------------------------------------------------------
                             51 ; code
                             52 ;--------------------------------------------------------
                             53 	.area _CODE
                             54 ;src/main.c:12: void initializeCpc() {
                             55 ;	---------------------------------
                             56 ; Function initializeCpc
                             57 ; ---------------------------------
   45B0                      58 _initializeCpc::
                             59 ;src/main.c:15: cpct_disableFirmware();
   45B0 CD C6 49      [17]   60 	call	_cpct_disableFirmware
                             61 ;src/main.c:18: cpct_setVideoMode(0);
   45B3 2E 00         [ 7]   62 	ld	l, #0x00
   45B5 CD B8 49      [17]   63 	call	_cpct_setVideoMode
                             64 ;src/main.c:20: cpct_setBorder(HW_BRIGHT_YELLOW);
   45B8 21 10 0A      [10]   65 	ld	hl, #0x0a10
   45BB E5            [11]   66 	push	hl
   45BC CD 9C 47      [17]   67 	call	_cpct_setPALColour
                             68 ;src/main.c:22: cpct_setPalette(g_palette, 16);
   45BF 21 10 00      [10]   69 	ld	hl, #0x0010
   45C2 E5            [11]   70 	push	hl
   45C3 21 A0 45      [10]   71 	ld	hl, #_g_palette
   45C6 E5            [11]   72 	push	hl
   45C7 CD 1B 47      [17]   73 	call	_cpct_setPalette
   45CA C9            [10]   74 	ret
                             75 ;src/main.c:27: void main(void) {
                             76 ;	---------------------------------
                             77 ; Function main
                             78 ; ---------------------------------
   45CB                      79 _main::
                             80 ;src/main.c:29: initializeCpc();
   45CB CD B0 45      [17]   81 	call	_initializeCpc
                             82 ;src/main.c:31: initializeBackground();
   45CE CD C9 46      [17]   83 	call	_initializeBackground
                             84 ;src/main.c:32: initializeBat();
   45D1 CD E2 45      [17]   85 	call	_initializeBat
                             86 ;src/main.c:34: while (1) {
   45D4                      87 00102$:
                             88 ;src/main.c:37: cpct_scanKeyboard_f();
   45D4 CD 32 47      [17]   89 	call	_cpct_scanKeyboard_f
                             90 ;src/main.c:39: updateBat();
   45D7 CD F7 45      [17]   91 	call	_updateBat
                             92 ;src/main.c:40: drawBat();
   45DA CD 50 46      [17]   93 	call	_drawBat
                             94 ;src/main.c:42: cpct_waitVSYNC();
   45DD CD B0 49      [17]   95 	call	_cpct_waitVSYNC
   45E0 18 F2         [12]   96 	jr	00102$
                             97 	.area _CODE
                             98 	.area _INITIALIZER
                             99 	.area _CABS (ABS)
