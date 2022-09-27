                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module background
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _restoreBackground
                             12 	.globl _initializeBackground
                             13 	.globl _cpct_etm_drawTilemap4x8_ag
                             14 	.globl _cpct_etm_setDrawTilemap4x8_ag
                             15 	.globl _cpct_etm_setTileset2x4
                             16 	.globl _cpct_etm_drawTileBox2x4
                             17 	.globl _cpct_getScreenPtr
                             18 	.globl _pvmem
                             19 ;--------------------------------------------------------
                             20 ; special function registers
                             21 ;--------------------------------------------------------
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _DATA
   4A3E                      26 _pvmem::
   4A3E                      27 	.ds 2
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
                             52 ;src/background/background.c:9: void initializeBackground()
                             53 ;	---------------------------------
                             54 ; Function initializeBackground
                             55 ; ---------------------------------
   46C9                      56 _initializeBackground::
                             57 ;src/background/background.c:12: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 8, 16);
   46C9 21 08 10      [10]   58 	ld	hl, #0x1008
   46CC E5            [11]   59 	push	hl
   46CD 21 00 C0      [10]   60 	ld	hl, #0xc000
   46D0 E5            [11]   61 	push	hl
   46D1 CD 28 4A      [17]   62 	call	_cpct_getScreenPtr
   46D4 22 3E 4A      [16]   63 	ld	(_pvmem), hl
                             64 ;src/background/background.c:16: cpct_etm_setDrawTilemap4x8_ag(g_tilemap_W, g_tilemap_H, g_tilemap_W, g_tiles_00);
   46D7 21 70 41      [10]   65 	ld	hl, #_g_tiles_00
   46DA E5            [11]   66 	push	hl
   46DB 21 10 00      [10]   67 	ld	hl, #0x0010
   46DE E5            [11]   68 	push	hl
   46DF 26 17         [ 7]   69 	ld	h, #0x17
   46E1 E5            [11]   70 	push	hl
   46E2 CD F8 49      [17]   71 	call	_cpct_etm_setDrawTilemap4x8_ag
                             72 ;src/background/background.c:20: cpct_etm_drawTilemap4x8_ag(pvmem, g_tilemap);
   46E5 01 00 40      [10]   73 	ld	bc, #_g_tilemap+0
   46E8 2A 3E 4A      [16]   74 	ld	hl, (_pvmem)
   46EB C5            [11]   75 	push	bc
   46EC E5            [11]   76 	push	hl
   46ED CD E0 48      [17]   77 	call	_cpct_etm_drawTilemap4x8_ag
                             78 ;src/background/background.c:22: cpct_etm_setTileset2x4(g_tiles_00);
   46F0 21 70 41      [10]   79 	ld	hl, #_g_tiles_00
   46F3 CD DC 48      [17]   80 	call	_cpct_etm_setTileset2x4
   46F6 C9            [10]   81 	ret
                             82 ;src/background/background.c:27: void restoreBackground(u8 tx, u8 ty, u8 twidth, u8 tHeight) {
                             83 ;	---------------------------------
                             84 ; Function restoreBackground
                             85 ; ---------------------------------
   46F7                      86 _restoreBackground::
                             87 ;src/background/background.c:30: cpct_etm_drawTileBox2x4(1, 1, 2, 2, g_tilemap_W, pvmem, g_tilemap);
   46F7 01 00 40      [10]   88 	ld	bc, #_g_tilemap+0
   46FA 2A 3E 4A      [16]   89 	ld	hl, (_pvmem)
   46FD C5            [11]   90 	push	bc
   46FE E5            [11]   91 	push	hl
   46FF 21 02 10      [10]   92 	ld	hl, #0x1002
   4702 E5            [11]   93 	push	hl
   4703 21 01 02      [10]   94 	ld	hl, #0x0201
   4706 E5            [11]   95 	push	hl
   4707 3E 01         [ 7]   96 	ld	a, #0x01
   4709 F5            [11]   97 	push	af
   470A 33            [ 6]   98 	inc	sp
   470B CD 4D 48      [17]   99 	call	_cpct_etm_drawTileBox2x4
   470E C9            [10]  100 	ret
                            101 	.area _CODE
                            102 	.area _INITIALIZER
                            103 	.area _CABS (ABS)
