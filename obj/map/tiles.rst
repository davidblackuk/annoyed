                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module tiles
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _g_tiles_127
                             12 	.globl _g_tiles_126
                             13 	.globl _g_tiles_125
                             14 	.globl _g_tiles_124
                             15 	.globl _g_tiles_123
                             16 	.globl _g_tiles_122
                             17 	.globl _g_tiles_121
                             18 	.globl _g_tiles_120
                             19 	.globl _g_tiles_119
                             20 	.globl _g_tiles_118
                             21 	.globl _g_tiles_117
                             22 	.globl _g_tiles_116
                             23 	.globl _g_tiles_115
                             24 	.globl _g_tiles_114
                             25 	.globl _g_tiles_113
                             26 	.globl _g_tiles_112
                             27 	.globl _g_tiles_111
                             28 	.globl _g_tiles_110
                             29 	.globl _g_tiles_109
                             30 	.globl _g_tiles_108
                             31 	.globl _g_tiles_107
                             32 	.globl _g_tiles_106
                             33 	.globl _g_tiles_105
                             34 	.globl _g_tiles_104
                             35 	.globl _g_tiles_103
                             36 	.globl _g_tiles_102
                             37 	.globl _g_tiles_101
                             38 	.globl _g_tiles_100
                             39 	.globl _g_tiles_099
                             40 	.globl _g_tiles_098
                             41 	.globl _g_tiles_097
                             42 	.globl _g_tiles_096
                             43 	.globl _g_tiles_095
                             44 	.globl _g_tiles_094
                             45 	.globl _g_tiles_093
                             46 	.globl _g_tiles_092
                             47 	.globl _g_tiles_091
                             48 	.globl _g_tiles_090
                             49 	.globl _g_tiles_089
                             50 	.globl _g_tiles_088
                             51 	.globl _g_tiles_087
                             52 	.globl _g_tiles_086
                             53 	.globl _g_tiles_085
                             54 	.globl _g_tiles_084
                             55 	.globl _g_tiles_083
                             56 	.globl _g_tiles_082
                             57 	.globl _g_tiles_081
                             58 	.globl _g_tiles_080
                             59 	.globl _g_tiles_079
                             60 	.globl _g_tiles_078
                             61 	.globl _g_tiles_077
                             62 	.globl _g_tiles_076
                             63 	.globl _g_tiles_075
                             64 	.globl _g_tiles_074
                             65 	.globl _g_tiles_073
                             66 	.globl _g_tiles_072
                             67 	.globl _g_tiles_071
                             68 	.globl _g_tiles_070
                             69 	.globl _g_tiles_069
                             70 	.globl _g_tiles_068
                             71 	.globl _g_tiles_067
                             72 	.globl _g_tiles_066
                             73 	.globl _g_tiles_065
                             74 	.globl _g_tiles_064
                             75 	.globl _g_tiles_063
                             76 	.globl _g_tiles_062
                             77 	.globl _g_tiles_061
                             78 	.globl _g_tiles_060
                             79 	.globl _g_tiles_059
                             80 	.globl _g_tiles_058
                             81 	.globl _g_tiles_057
                             82 	.globl _g_tiles_056
                             83 	.globl _g_tiles_055
                             84 	.globl _g_tiles_054
                             85 	.globl _g_tiles_053
                             86 	.globl _g_tiles_052
                             87 	.globl _g_tiles_051
                             88 	.globl _g_tiles_050
                             89 	.globl _g_tiles_049
                             90 	.globl _g_tiles_048
                             91 	.globl _g_tiles_047
                             92 	.globl _g_tiles_046
                             93 	.globl _g_tiles_045
                             94 	.globl _g_tiles_044
                             95 	.globl _g_tiles_043
                             96 	.globl _g_tiles_042
                             97 	.globl _g_tiles_041
                             98 	.globl _g_tiles_040
                             99 	.globl _g_tiles_039
                            100 	.globl _g_tiles_038
                            101 	.globl _g_tiles_037
                            102 	.globl _g_tiles_036
                            103 	.globl _g_tiles_035
                            104 	.globl _g_tiles_034
                            105 	.globl _g_tiles_033
                            106 	.globl _g_tiles_032
                            107 	.globl _g_tiles_031
                            108 	.globl _g_tiles_030
                            109 	.globl _g_tiles_029
                            110 	.globl _g_tiles_028
                            111 	.globl _g_tiles_027
                            112 	.globl _g_tiles_026
                            113 	.globl _g_tiles_025
                            114 	.globl _g_tiles_024
                            115 	.globl _g_tiles_023
                            116 	.globl _g_tiles_022
                            117 	.globl _g_tiles_021
                            118 	.globl _g_tiles_020
                            119 	.globl _g_tiles_019
                            120 	.globl _g_tiles_018
                            121 	.globl _g_tiles_017
                            122 	.globl _g_tiles_016
                            123 	.globl _g_tiles_015
                            124 	.globl _g_tiles_014
                            125 	.globl _g_tiles_013
                            126 	.globl _g_tiles_012
                            127 	.globl _g_tiles_011
                            128 	.globl _g_tiles_010
                            129 	.globl _g_tiles_009
                            130 	.globl _g_tiles_008
                            131 	.globl _g_tiles_007
                            132 	.globl _g_tiles_006
                            133 	.globl _g_tiles_005
                            134 	.globl _g_tiles_004
                            135 	.globl _g_tiles_003
                            136 	.globl _g_tiles_002
                            137 	.globl _g_tiles_001
                            138 	.globl _g_tiles_000
                            139 	.globl _g_tileset
                            140 ;--------------------------------------------------------
                            141 ; special function registers
                            142 ;--------------------------------------------------------
                            143 ;--------------------------------------------------------
                            144 ; ram data
                            145 ;--------------------------------------------------------
                            146 	.area _DATA
                            147 ;--------------------------------------------------------
                            148 ; ram data
                            149 ;--------------------------------------------------------
                            150 	.area _INITIALIZED
                            151 ;--------------------------------------------------------
                            152 ; absolute external ram data
                            153 ;--------------------------------------------------------
                            154 	.area _DABS (ABS)
                            155 ;--------------------------------------------------------
                            156 ; global & static initialisations
                            157 ;--------------------------------------------------------
                            158 	.area _HOME
                            159 	.area _GSINIT
                            160 	.area _GSFINAL
                            161 	.area _GSINIT
                            162 ;--------------------------------------------------------
                            163 ; Home
                            164 ;--------------------------------------------------------
                            165 	.area _HOME
                            166 	.area _HOME
                            167 ;--------------------------------------------------------
                            168 ; code
                            169 ;--------------------------------------------------------
                            170 	.area _CODE
                            171 	.area _CODE
   4592                     172 _g_tileset:
   4592 92 46               173 	.dw _g_tiles_000
   4594 9A 46               174 	.dw _g_tiles_001
   4596 A2 46               175 	.dw _g_tiles_002
   4598 AA 46               176 	.dw _g_tiles_003
   459A B2 46               177 	.dw _g_tiles_004
   459C BA 46               178 	.dw _g_tiles_005
   459E C2 46               179 	.dw _g_tiles_006
   45A0 CA 46               180 	.dw _g_tiles_007
   45A2 D2 46               181 	.dw _g_tiles_008
   45A4 DA 46               182 	.dw _g_tiles_009
   45A6 E2 46               183 	.dw _g_tiles_010
   45A8 EA 46               184 	.dw _g_tiles_011
   45AA F2 46               185 	.dw _g_tiles_012
   45AC FA 46               186 	.dw _g_tiles_013
   45AE 02 47               187 	.dw _g_tiles_014
   45B0 0A 47               188 	.dw _g_tiles_015
   45B2 12 47               189 	.dw _g_tiles_016
   45B4 1A 47               190 	.dw _g_tiles_017
   45B6 22 47               191 	.dw _g_tiles_018
   45B8 2A 47               192 	.dw _g_tiles_019
   45BA 32 47               193 	.dw _g_tiles_020
   45BC 3A 47               194 	.dw _g_tiles_021
   45BE 42 47               195 	.dw _g_tiles_022
   45C0 4A 47               196 	.dw _g_tiles_023
   45C2 52 47               197 	.dw _g_tiles_024
   45C4 5A 47               198 	.dw _g_tiles_025
   45C6 62 47               199 	.dw _g_tiles_026
   45C8 6A 47               200 	.dw _g_tiles_027
   45CA 72 47               201 	.dw _g_tiles_028
   45CC 7A 47               202 	.dw _g_tiles_029
   45CE 82 47               203 	.dw _g_tiles_030
   45D0 8A 47               204 	.dw _g_tiles_031
   45D2 92 47               205 	.dw _g_tiles_032
   45D4 9A 47               206 	.dw _g_tiles_033
   45D6 A2 47               207 	.dw _g_tiles_034
   45D8 AA 47               208 	.dw _g_tiles_035
   45DA B2 47               209 	.dw _g_tiles_036
   45DC BA 47               210 	.dw _g_tiles_037
   45DE C2 47               211 	.dw _g_tiles_038
   45E0 CA 47               212 	.dw _g_tiles_039
   45E2 D2 47               213 	.dw _g_tiles_040
   45E4 DA 47               214 	.dw _g_tiles_041
   45E6 E2 47               215 	.dw _g_tiles_042
   45E8 EA 47               216 	.dw _g_tiles_043
   45EA F2 47               217 	.dw _g_tiles_044
   45EC FA 47               218 	.dw _g_tiles_045
   45EE 02 48               219 	.dw _g_tiles_046
   45F0 0A 48               220 	.dw _g_tiles_047
   45F2 12 48               221 	.dw _g_tiles_048
   45F4 1A 48               222 	.dw _g_tiles_049
   45F6 22 48               223 	.dw _g_tiles_050
   45F8 2A 48               224 	.dw _g_tiles_051
   45FA 32 48               225 	.dw _g_tiles_052
   45FC 3A 48               226 	.dw _g_tiles_053
   45FE 42 48               227 	.dw _g_tiles_054
   4600 4A 48               228 	.dw _g_tiles_055
   4602 52 48               229 	.dw _g_tiles_056
   4604 5A 48               230 	.dw _g_tiles_057
   4606 62 48               231 	.dw _g_tiles_058
   4608 6A 48               232 	.dw _g_tiles_059
   460A 72 48               233 	.dw _g_tiles_060
   460C 7A 48               234 	.dw _g_tiles_061
   460E 82 48               235 	.dw _g_tiles_062
   4610 8A 48               236 	.dw _g_tiles_063
   4612 92 48               237 	.dw _g_tiles_064
   4614 9A 48               238 	.dw _g_tiles_065
   4616 A2 48               239 	.dw _g_tiles_066
   4618 AA 48               240 	.dw _g_tiles_067
   461A B2 48               241 	.dw _g_tiles_068
   461C BA 48               242 	.dw _g_tiles_069
   461E C2 48               243 	.dw _g_tiles_070
   4620 CA 48               244 	.dw _g_tiles_071
   4622 D2 48               245 	.dw _g_tiles_072
   4624 DA 48               246 	.dw _g_tiles_073
   4626 E2 48               247 	.dw _g_tiles_074
   4628 EA 48               248 	.dw _g_tiles_075
   462A F2 48               249 	.dw _g_tiles_076
   462C FA 48               250 	.dw _g_tiles_077
   462E 02 49               251 	.dw _g_tiles_078
   4630 0A 49               252 	.dw _g_tiles_079
   4632 12 49               253 	.dw _g_tiles_080
   4634 1A 49               254 	.dw _g_tiles_081
   4636 22 49               255 	.dw _g_tiles_082
   4638 2A 49               256 	.dw _g_tiles_083
   463A 32 49               257 	.dw _g_tiles_084
   463C 3A 49               258 	.dw _g_tiles_085
   463E 42 49               259 	.dw _g_tiles_086
   4640 4A 49               260 	.dw _g_tiles_087
   4642 52 49               261 	.dw _g_tiles_088
   4644 5A 49               262 	.dw _g_tiles_089
   4646 62 49               263 	.dw _g_tiles_090
   4648 6A 49               264 	.dw _g_tiles_091
   464A 72 49               265 	.dw _g_tiles_092
   464C 7A 49               266 	.dw _g_tiles_093
   464E 82 49               267 	.dw _g_tiles_094
   4650 8A 49               268 	.dw _g_tiles_095
   4652 92 49               269 	.dw _g_tiles_096
   4654 9A 49               270 	.dw _g_tiles_097
   4656 A2 49               271 	.dw _g_tiles_098
   4658 AA 49               272 	.dw _g_tiles_099
   465A B2 49               273 	.dw _g_tiles_100
   465C BA 49               274 	.dw _g_tiles_101
   465E C2 49               275 	.dw _g_tiles_102
   4660 CA 49               276 	.dw _g_tiles_103
   4662 D2 49               277 	.dw _g_tiles_104
   4664 DA 49               278 	.dw _g_tiles_105
   4666 E2 49               279 	.dw _g_tiles_106
   4668 EA 49               280 	.dw _g_tiles_107
   466A F2 49               281 	.dw _g_tiles_108
   466C FA 49               282 	.dw _g_tiles_109
   466E 02 4A               283 	.dw _g_tiles_110
   4670 0A 4A               284 	.dw _g_tiles_111
   4672 12 4A               285 	.dw _g_tiles_112
   4674 1A 4A               286 	.dw _g_tiles_113
   4676 22 4A               287 	.dw _g_tiles_114
   4678 2A 4A               288 	.dw _g_tiles_115
   467A 32 4A               289 	.dw _g_tiles_116
   467C 3A 4A               290 	.dw _g_tiles_117
   467E 42 4A               291 	.dw _g_tiles_118
   4680 4A 4A               292 	.dw _g_tiles_119
   4682 52 4A               293 	.dw _g_tiles_120
   4684 5A 4A               294 	.dw _g_tiles_121
   4686 62 4A               295 	.dw _g_tiles_122
   4688 6A 4A               296 	.dw _g_tiles_123
   468A 72 4A               297 	.dw _g_tiles_124
   468C 7A 4A               298 	.dw _g_tiles_125
   468E 82 4A               299 	.dw _g_tiles_126
   4690 8A 4A               300 	.dw _g_tiles_127
   4692                     301 _g_tiles_000:
   4692 C0                  302 	.db #0xc0	; 192
   4693 C0                  303 	.db #0xc0	; 192
   4694 90                  304 	.db #0x90	; 144
   4695 30                  305 	.db #0x30	; 48	'0'
   4696 90                  306 	.db #0x90	; 144
   4697 30                  307 	.db #0x30	; 48	'0'
   4698 90                  308 	.db #0x90	; 144
   4699 30                  309 	.db #0x30	; 48	'0'
   469A                     310 _g_tiles_001:
   469A C0                  311 	.db #0xc0	; 192
   469B C0                  312 	.db #0xc0	; 192
   469C 30                  313 	.db #0x30	; 48	'0'
   469D 30                  314 	.db #0x30	; 48	'0'
   469E 30                  315 	.db #0x30	; 48	'0'
   469F 30                  316 	.db #0x30	; 48	'0'
   46A0 30                  317 	.db #0x30	; 48	'0'
   46A1 30                  318 	.db #0x30	; 48	'0'
   46A2                     319 _g_tiles_002:
   46A2 C0                  320 	.db #0xc0	; 192
   46A3 C0                  321 	.db #0xc0	; 192
   46A4 30                  322 	.db #0x30	; 48	'0'
   46A5 60                  323 	.db #0x60	; 96
   46A6 30                  324 	.db #0x30	; 48	'0'
   46A7 60                  325 	.db #0x60	; 96
   46A8 30                  326 	.db #0x30	; 48	'0'
   46A9 60                  327 	.db #0x60	; 96
   46AA                     328 _g_tiles_003:
   46AA C0                  329 	.db #0xc0	; 192
   46AB C0                  330 	.db #0xc0	; 192
   46AC 84                  331 	.db #0x84	; 132
   46AD 0C                  332 	.db #0x0c	; 12
   46AE 84                  333 	.db #0x84	; 132
   46AF 0C                  334 	.db #0x0c	; 12
   46B0 84                  335 	.db #0x84	; 132
   46B1 0C                  336 	.db #0x0c	; 12
   46B2                     337 _g_tiles_004:
   46B2 C0                  338 	.db #0xc0	; 192
   46B3 C0                  339 	.db #0xc0	; 192
   46B4 0C                  340 	.db #0x0c	; 12
   46B5 0C                  341 	.db #0x0c	; 12
   46B6 0C                  342 	.db #0x0c	; 12
   46B7 0C                  343 	.db #0x0c	; 12
   46B8 0C                  344 	.db #0x0c	; 12
   46B9 0C                  345 	.db #0x0c	; 12
   46BA                     346 _g_tiles_005:
   46BA C0                  347 	.db #0xc0	; 192
   46BB C0                  348 	.db #0xc0	; 192
   46BC 0C                  349 	.db #0x0c	; 12
   46BD 48                  350 	.db #0x48	; 72	'H'
   46BE 0C                  351 	.db #0x0c	; 12
   46BF 48                  352 	.db #0x48	; 72	'H'
   46C0 0C                  353 	.db #0x0c	; 12
   46C1 48                  354 	.db #0x48	; 72	'H'
   46C2                     355 _g_tiles_006:
   46C2 C0                  356 	.db #0xc0	; 192
   46C3 C0                  357 	.db #0xc0	; 192
   46C4 D1                  358 	.db #0xd1	; 209
   46C5 F3                  359 	.db #0xf3	; 243
   46C6 D1                  360 	.db #0xd1	; 209
   46C7 F3                  361 	.db #0xf3	; 243
   46C8 D1                  362 	.db #0xd1	; 209
   46C9 F3                  363 	.db #0xf3	; 243
   46CA                     364 _g_tiles_007:
   46CA C0                  365 	.db #0xc0	; 192
   46CB C0                  366 	.db #0xc0	; 192
   46CC F3                  367 	.db #0xf3	; 243
   46CD F3                  368 	.db #0xf3	; 243
   46CE F3                  369 	.db #0xf3	; 243
   46CF F3                  370 	.db #0xf3	; 243
   46D0 F3                  371 	.db #0xf3	; 243
   46D1 F3                  372 	.db #0xf3	; 243
   46D2                     373 _g_tiles_008:
   46D2 C0                  374 	.db #0xc0	; 192
   46D3 C0                  375 	.db #0xc0	; 192
   46D4 F3                  376 	.db #0xf3	; 243
   46D5 E2                  377 	.db #0xe2	; 226
   46D6 F3                  378 	.db #0xf3	; 243
   46D7 E2                  379 	.db #0xe2	; 226
   46D8 F3                  380 	.db #0xf3	; 243
   46D9 E2                  381 	.db #0xe2	; 226
   46DA                     382 _g_tiles_009:
   46DA C0                  383 	.db #0xc0	; 192
   46DB C0                  384 	.db #0xc0	; 192
   46DC C1                  385 	.db #0xc1	; 193
   46DD C3                  386 	.db #0xc3	; 195
   46DE C1                  387 	.db #0xc1	; 193
   46DF C3                  388 	.db #0xc3	; 195
   46E0 C1                  389 	.db #0xc1	; 193
   46E1 C3                  390 	.db #0xc3	; 195
   46E2                     391 _g_tiles_010:
   46E2 C0                  392 	.db #0xc0	; 192
   46E3 C0                  393 	.db #0xc0	; 192
   46E4 C3                  394 	.db #0xc3	; 195
   46E5 C3                  395 	.db #0xc3	; 195
   46E6 C3                  396 	.db #0xc3	; 195
   46E7 C3                  397 	.db #0xc3	; 195
   46E8 C3                  398 	.db #0xc3	; 195
   46E9 C3                  399 	.db #0xc3	; 195
   46EA                     400 _g_tiles_011:
   46EA C0                  401 	.db #0xc0	; 192
   46EB C0                  402 	.db #0xc0	; 192
   46EC C3                  403 	.db #0xc3	; 195
   46ED C2                  404 	.db #0xc2	; 194
   46EE C3                  405 	.db #0xc3	; 195
   46EF C2                  406 	.db #0xc2	; 194
   46F0 C3                  407 	.db #0xc3	; 195
   46F1 C2                  408 	.db #0xc2	; 194
   46F2                     409 _g_tiles_012:
   46F2 80                  410 	.db #0x80	; 128
   46F3 80                  411 	.db #0x80	; 128
   46F4 40                  412 	.db #0x40	; 64
   46F5 40                  413 	.db #0x40	; 64
   46F6 80                  414 	.db #0x80	; 128
   46F7 80                  415 	.db #0x80	; 128
   46F8 40                  416 	.db #0x40	; 64
   46F9 04                  417 	.db #0x04	; 4
   46FA                     418 _g_tiles_013:
   46FA 08                  419 	.db #0x08	; 8
   46FB 80                  420 	.db #0x80	; 128
   46FC 04                  421 	.db #0x04	; 4
   46FD 48                  422 	.db #0x48	; 72	'H'
   46FE 80                  423 	.db #0x80	; 128
   46FF 84                  424 	.db #0x84	; 132
   4700 68                  425 	.db #0x68	; 104	'h'
   4701 40                  426 	.db #0x40	; 64
   4702                     427 _g_tiles_014:
   4702 80                  428 	.db #0x80	; 128
   4703 84                  429 	.db #0x84	; 132
   4704 04                  430 	.db #0x04	; 4
   4705 48                  431 	.db #0x48	; 72	'H'
   4706 08                  432 	.db #0x08	; 8
   4707 80                  433 	.db #0x80	; 128
   4708 40                  434 	.db #0x40	; 64
   4709 40                  435 	.db #0x40	; 64
   470A                     436 _g_tiles_015:
   470A 80                  437 	.db #0x80	; 128
   470B 84                  438 	.db #0x84	; 132
   470C 40                  439 	.db #0x40	; 64
   470D 48                  440 	.db #0x48	; 72	'H'
   470E 84                  441 	.db #0x84	; 132
   470F 80                  442 	.db #0x80	; 128
   4710 48                  443 	.db #0x48	; 72	'H'
   4711 40                  444 	.db #0x40	; 64
   4712                     445 _g_tiles_016:
   4712 90                  446 	.db #0x90	; 144
   4713 30                  447 	.db #0x30	; 48	'0'
   4714 90                  448 	.db #0x90	; 144
   4715 30                  449 	.db #0x30	; 48	'0'
   4716 90                  450 	.db #0x90	; 144
   4717 30                  451 	.db #0x30	; 48	'0'
   4718 C0                  452 	.db #0xc0	; 192
   4719 C0                  453 	.db #0xc0	; 192
   471A                     454 _g_tiles_017:
   471A 30                  455 	.db #0x30	; 48	'0'
   471B 30                  456 	.db #0x30	; 48	'0'
   471C 30                  457 	.db #0x30	; 48	'0'
   471D 30                  458 	.db #0x30	; 48	'0'
   471E 30                  459 	.db #0x30	; 48	'0'
   471F 30                  460 	.db #0x30	; 48	'0'
   4720 C0                  461 	.db #0xc0	; 192
   4721 C0                  462 	.db #0xc0	; 192
   4722                     463 _g_tiles_018:
   4722 30                  464 	.db #0x30	; 48	'0'
   4723 60                  465 	.db #0x60	; 96
   4724 30                  466 	.db #0x30	; 48	'0'
   4725 60                  467 	.db #0x60	; 96
   4726 30                  468 	.db #0x30	; 48	'0'
   4727 60                  469 	.db #0x60	; 96
   4728 C0                  470 	.db #0xc0	; 192
   4729 C0                  471 	.db #0xc0	; 192
   472A                     472 _g_tiles_019:
   472A 84                  473 	.db #0x84	; 132
   472B 0C                  474 	.db #0x0c	; 12
   472C 84                  475 	.db #0x84	; 132
   472D 0C                  476 	.db #0x0c	; 12
   472E 84                  477 	.db #0x84	; 132
   472F 0C                  478 	.db #0x0c	; 12
   4730 C0                  479 	.db #0xc0	; 192
   4731 C0                  480 	.db #0xc0	; 192
   4732                     481 _g_tiles_020:
   4732 0C                  482 	.db #0x0c	; 12
   4733 0C                  483 	.db #0x0c	; 12
   4734 0C                  484 	.db #0x0c	; 12
   4735 0C                  485 	.db #0x0c	; 12
   4736 0C                  486 	.db #0x0c	; 12
   4737 0C                  487 	.db #0x0c	; 12
   4738 C0                  488 	.db #0xc0	; 192
   4739 C0                  489 	.db #0xc0	; 192
   473A                     490 _g_tiles_021:
   473A 0C                  491 	.db #0x0c	; 12
   473B 48                  492 	.db #0x48	; 72	'H'
   473C 0C                  493 	.db #0x0c	; 12
   473D 48                  494 	.db #0x48	; 72	'H'
   473E 0C                  495 	.db #0x0c	; 12
   473F 48                  496 	.db #0x48	; 72	'H'
   4740 C0                  497 	.db #0xc0	; 192
   4741 C0                  498 	.db #0xc0	; 192
   4742                     499 _g_tiles_022:
   4742 D1                  500 	.db #0xd1	; 209
   4743 F3                  501 	.db #0xf3	; 243
   4744 D1                  502 	.db #0xd1	; 209
   4745 F3                  503 	.db #0xf3	; 243
   4746 D1                  504 	.db #0xd1	; 209
   4747 F3                  505 	.db #0xf3	; 243
   4748 C0                  506 	.db #0xc0	; 192
   4749 C0                  507 	.db #0xc0	; 192
   474A                     508 _g_tiles_023:
   474A F3                  509 	.db #0xf3	; 243
   474B F3                  510 	.db #0xf3	; 243
   474C F3                  511 	.db #0xf3	; 243
   474D F3                  512 	.db #0xf3	; 243
   474E F3                  513 	.db #0xf3	; 243
   474F F3                  514 	.db #0xf3	; 243
   4750 C0                  515 	.db #0xc0	; 192
   4751 C0                  516 	.db #0xc0	; 192
   4752                     517 _g_tiles_024:
   4752 F3                  518 	.db #0xf3	; 243
   4753 E2                  519 	.db #0xe2	; 226
   4754 F3                  520 	.db #0xf3	; 243
   4755 E2                  521 	.db #0xe2	; 226
   4756 F3                  522 	.db #0xf3	; 243
   4757 E2                  523 	.db #0xe2	; 226
   4758 C0                  524 	.db #0xc0	; 192
   4759 C0                  525 	.db #0xc0	; 192
   475A                     526 _g_tiles_025:
   475A C1                  527 	.db #0xc1	; 193
   475B C3                  528 	.db #0xc3	; 195
   475C C1                  529 	.db #0xc1	; 193
   475D C3                  530 	.db #0xc3	; 195
   475E C1                  531 	.db #0xc1	; 193
   475F C3                  532 	.db #0xc3	; 195
   4760 C0                  533 	.db #0xc0	; 192
   4761 C0                  534 	.db #0xc0	; 192
   4762                     535 _g_tiles_026:
   4762 C3                  536 	.db #0xc3	; 195
   4763 C3                  537 	.db #0xc3	; 195
   4764 C3                  538 	.db #0xc3	; 195
   4765 C3                  539 	.db #0xc3	; 195
   4766 C3                  540 	.db #0xc3	; 195
   4767 C3                  541 	.db #0xc3	; 195
   4768 C0                  542 	.db #0xc0	; 192
   4769 C0                  543 	.db #0xc0	; 192
   476A                     544 _g_tiles_027:
   476A C3                  545 	.db #0xc3	; 195
   476B C2                  546 	.db #0xc2	; 194
   476C C3                  547 	.db #0xc3	; 195
   476D C2                  548 	.db #0xc2	; 194
   476E C3                  549 	.db #0xc3	; 195
   476F C2                  550 	.db #0xc2	; 194
   4770 C0                  551 	.db #0xc0	; 192
   4771 C0                  552 	.db #0xc0	; 192
   4772                     553 _g_tiles_028:
   4772 80                  554 	.db #0x80	; 128
   4773 08                  555 	.db #0x08	; 8
   4774 04                  556 	.db #0x04	; 4
   4775 40                  557 	.db #0x40	; 64
   4776 84                  558 	.db #0x84	; 132
   4777 80                  559 	.db #0x80	; 128
   4778 48                  560 	.db #0x48	; 72	'H'
   4779 40                  561 	.db #0x40	; 64
   477A                     562 _g_tiles_029:
   477A C0                  563 	.db #0xc0	; 192
   477B C0                  564 	.db #0xc0	; 192
   477C C0                  565 	.db #0xc0	; 192
   477D C0                  566 	.db #0xc0	; 192
   477E C0                  567 	.db #0xc0	; 192
   477F C0                  568 	.db #0xc0	; 192
   4780 C0                  569 	.db #0xc0	; 192
   4781 C0                  570 	.db #0xc0	; 192
   4782                     571 _g_tiles_030:
   4782 C0                  572 	.db #0xc0	; 192
   4783 C0                  573 	.db #0xc0	; 192
   4784 C0                  574 	.db #0xc0	; 192
   4785 C0                  575 	.db #0xc0	; 192
   4786 C0                  576 	.db #0xc0	; 192
   4787 C0                  577 	.db #0xc0	; 192
   4788 C0                  578 	.db #0xc0	; 192
   4789 C0                  579 	.db #0xc0	; 192
   478A                     580 _g_tiles_031:
   478A 80                  581 	.db #0x80	; 128
   478B 80                  582 	.db #0x80	; 128
   478C 40                  583 	.db #0x40	; 64
   478D 40                  584 	.db #0x40	; 64
   478E 80                  585 	.db #0x80	; 128
   478F 80                  586 	.db #0x80	; 128
   4790 40                  587 	.db #0x40	; 64
   4791 40                  588 	.db #0x40	; 64
   4792                     589 _g_tiles_032:
   4792 C0                  590 	.db #0xc0	; 192
   4793 C0                  591 	.db #0xc0	; 192
   4794 D5                  592 	.db #0xd5	; 213
   4795 FF                  593 	.db #0xff	; 255
   4796 D5                  594 	.db #0xd5	; 213
   4797 FF                  595 	.db #0xff	; 255
   4798 D5                  596 	.db #0xd5	; 213
   4799 FF                  597 	.db #0xff	; 255
   479A                     598 _g_tiles_033:
   479A C0                  599 	.db #0xc0	; 192
   479B C0                  600 	.db #0xc0	; 192
   479C FF                  601 	.db #0xff	; 255
   479D FF                  602 	.db #0xff	; 255
   479E FF                  603 	.db #0xff	; 255
   479F FF                  604 	.db #0xff	; 255
   47A0 FF                  605 	.db #0xff	; 255
   47A1 FF                  606 	.db #0xff	; 255
   47A2                     607 _g_tiles_034:
   47A2 C0                  608 	.db #0xc0	; 192
   47A3 C0                  609 	.db #0xc0	; 192
   47A4 FF                  610 	.db #0xff	; 255
   47A5 EA                  611 	.db #0xea	; 234
   47A6 FF                  612 	.db #0xff	; 255
   47A7 EA                  613 	.db #0xea	; 234
   47A8 FF                  614 	.db #0xff	; 255
   47A9 EA                  615 	.db #0xea	; 234
   47AA                     616 _g_tiles_035:
   47AA C0                  617 	.db #0xc0	; 192
   47AB C0                  618 	.db #0xc0	; 192
   47AC 84                  619 	.db #0x84	; 132
   47AD 0C                  620 	.db #0x0c	; 12
   47AE 84                  621 	.db #0x84	; 132
   47AF 0C                  622 	.db #0x0c	; 12
   47B0 84                  623 	.db #0x84	; 132
   47B1 0C                  624 	.db #0x0c	; 12
   47B2                     625 _g_tiles_036:
   47B2 C0                  626 	.db #0xc0	; 192
   47B3 C0                  627 	.db #0xc0	; 192
   47B4 0C                  628 	.db #0x0c	; 12
   47B5 0C                  629 	.db #0x0c	; 12
   47B6 0C                  630 	.db #0x0c	; 12
   47B7 0C                  631 	.db #0x0c	; 12
   47B8 0C                  632 	.db #0x0c	; 12
   47B9 0C                  633 	.db #0x0c	; 12
   47BA                     634 _g_tiles_037:
   47BA C0                  635 	.db #0xc0	; 192
   47BB C0                  636 	.db #0xc0	; 192
   47BC 0C                  637 	.db #0x0c	; 12
   47BD 48                  638 	.db #0x48	; 72	'H'
   47BE 0C                  639 	.db #0x0c	; 12
   47BF 48                  640 	.db #0x48	; 72	'H'
   47C0 0C                  641 	.db #0x0c	; 12
   47C1 48                  642 	.db #0x48	; 72	'H'
   47C2                     643 _g_tiles_038:
   47C2 FF                  644 	.db #0xff	; 255
   47C3 FF                  645 	.db #0xff	; 255
   47C4 AB                  646 	.db #0xab	; 171
   47C5 03                  647 	.db #0x03	; 3
   47C6 AB                  648 	.db #0xab	; 171
   47C7 03                  649 	.db #0x03	; 3
   47C8 AB                  650 	.db #0xab	; 171
   47C9 03                  651 	.db #0x03	; 3
   47CA                     652 _g_tiles_039:
   47CA FF                  653 	.db #0xff	; 255
   47CB FF                  654 	.db #0xff	; 255
   47CC 03                  655 	.db #0x03	; 3
   47CD 03                  656 	.db #0x03	; 3
   47CE 03                  657 	.db #0x03	; 3
   47CF 03                  658 	.db #0x03	; 3
   47D0 03                  659 	.db #0x03	; 3
   47D1 03                  660 	.db #0x03	; 3
   47D2                     661 _g_tiles_040:
   47D2 FF                  662 	.db #0xff	; 255
   47D3 EA                  663 	.db #0xea	; 234
   47D4 03                  664 	.db #0x03	; 3
   47D5 42                  665 	.db #0x42	; 66	'B'
   47D6 03                  666 	.db #0x03	; 3
   47D7 42                  667 	.db #0x42	; 66	'B'
   47D8 03                  668 	.db #0x03	; 3
   47D9 42                  669 	.db #0x42	; 66	'B'
   47DA                     670 _g_tiles_041:
   47DA C0                  671 	.db #0xc0	; 192
   47DB C0                  672 	.db #0xc0	; 192
   47DC C0                  673 	.db #0xc0	; 192
   47DD C0                  674 	.db #0xc0	; 192
   47DE C0                  675 	.db #0xc0	; 192
   47DF C0                  676 	.db #0xc0	; 192
   47E0 C0                  677 	.db #0xc0	; 192
   47E1 C0                  678 	.db #0xc0	; 192
   47E2                     679 _g_tiles_042:
   47E2 C0                  680 	.db #0xc0	; 192
   47E3 C0                  681 	.db #0xc0	; 192
   47E4 C0                  682 	.db #0xc0	; 192
   47E5 C0                  683 	.db #0xc0	; 192
   47E6 C0                  684 	.db #0xc0	; 192
   47E7 C0                  685 	.db #0xc0	; 192
   47E8 C0                  686 	.db #0xc0	; 192
   47E9 C0                  687 	.db #0xc0	; 192
   47EA                     688 _g_tiles_043:
   47EA C0                  689 	.db #0xc0	; 192
   47EB C0                  690 	.db #0xc0	; 192
   47EC C0                  691 	.db #0xc0	; 192
   47ED C0                  692 	.db #0xc0	; 192
   47EE C0                  693 	.db #0xc0	; 192
   47EF C0                  694 	.db #0xc0	; 192
   47F0 C0                  695 	.db #0xc0	; 192
   47F1 C0                  696 	.db #0xc0	; 192
   47F2                     697 _g_tiles_044:
   47F2 80                  698 	.db #0x80	; 128
   47F3 80                  699 	.db #0x80	; 128
   47F4 40                  700 	.db #0x40	; 64
   47F5 40                  701 	.db #0x40	; 64
   47F6 80                  702 	.db #0x80	; 128
   47F7 80                  703 	.db #0x80	; 128
   47F8 40                  704 	.db #0x40	; 64
   47F9 40                  705 	.db #0x40	; 64
   47FA                     706 _g_tiles_045:
   47FA C0                  707 	.db #0xc0	; 192
   47FB C0                  708 	.db #0xc0	; 192
   47FC C0                  709 	.db #0xc0	; 192
   47FD C0                  710 	.db #0xc0	; 192
   47FE C0                  711 	.db #0xc0	; 192
   47FF C0                  712 	.db #0xc0	; 192
   4800 C0                  713 	.db #0xc0	; 192
   4801 C0                  714 	.db #0xc0	; 192
   4802                     715 _g_tiles_046:
   4802 C0                  716 	.db #0xc0	; 192
   4803 C0                  717 	.db #0xc0	; 192
   4804 C0                  718 	.db #0xc0	; 192
   4805 C0                  719 	.db #0xc0	; 192
   4806 C0                  720 	.db #0xc0	; 192
   4807 C0                  721 	.db #0xc0	; 192
   4808 C0                  722 	.db #0xc0	; 192
   4809 C0                  723 	.db #0xc0	; 192
   480A                     724 _g_tiles_047:
   480A 80                  725 	.db #0x80	; 128
   480B 84                  726 	.db #0x84	; 132
   480C 40                  727 	.db #0x40	; 64
   480D 48                  728 	.db #0x48	; 72	'H'
   480E 80                  729 	.db #0x80	; 128
   480F 08                  730 	.db #0x08	; 8
   4810 04                  731 	.db #0x04	; 4
   4811 40                  732 	.db #0x40	; 64
   4812                     733 _g_tiles_048:
   4812 D5                  734 	.db #0xd5	; 213
   4813 FF                  735 	.db #0xff	; 255
   4814 D5                  736 	.db #0xd5	; 213
   4815 FF                  737 	.db #0xff	; 255
   4816 D5                  738 	.db #0xd5	; 213
   4817 FF                  739 	.db #0xff	; 255
   4818 C0                  740 	.db #0xc0	; 192
   4819 C0                  741 	.db #0xc0	; 192
   481A                     742 _g_tiles_049:
   481A FF                  743 	.db #0xff	; 255
   481B FF                  744 	.db #0xff	; 255
   481C FF                  745 	.db #0xff	; 255
   481D FF                  746 	.db #0xff	; 255
   481E FF                  747 	.db #0xff	; 255
   481F FF                  748 	.db #0xff	; 255
   4820 C0                  749 	.db #0xc0	; 192
   4821 C0                  750 	.db #0xc0	; 192
   4822                     751 _g_tiles_050:
   4822 FF                  752 	.db #0xff	; 255
   4823 EA                  753 	.db #0xea	; 234
   4824 FF                  754 	.db #0xff	; 255
   4825 EA                  755 	.db #0xea	; 234
   4826 FF                  756 	.db #0xff	; 255
   4827 EA                  757 	.db #0xea	; 234
   4828 C0                  758 	.db #0xc0	; 192
   4829 C0                  759 	.db #0xc0	; 192
   482A                     760 _g_tiles_051:
   482A 84                  761 	.db #0x84	; 132
   482B 0C                  762 	.db #0x0c	; 12
   482C 84                  763 	.db #0x84	; 132
   482D 0C                  764 	.db #0x0c	; 12
   482E 84                  765 	.db #0x84	; 132
   482F 0C                  766 	.db #0x0c	; 12
   4830 C0                  767 	.db #0xc0	; 192
   4831 C0                  768 	.db #0xc0	; 192
   4832                     769 _g_tiles_052:
   4832 0C                  770 	.db #0x0c	; 12
   4833 0C                  771 	.db #0x0c	; 12
   4834 0C                  772 	.db #0x0c	; 12
   4835 0C                  773 	.db #0x0c	; 12
   4836 0C                  774 	.db #0x0c	; 12
   4837 0C                  775 	.db #0x0c	; 12
   4838 C0                  776 	.db #0xc0	; 192
   4839 C0                  777 	.db #0xc0	; 192
   483A                     778 _g_tiles_053:
   483A 0C                  779 	.db #0x0c	; 12
   483B 48                  780 	.db #0x48	; 72	'H'
   483C 0C                  781 	.db #0x0c	; 12
   483D 48                  782 	.db #0x48	; 72	'H'
   483E 0C                  783 	.db #0x0c	; 12
   483F 48                  784 	.db #0x48	; 72	'H'
   4840 C0                  785 	.db #0xc0	; 192
   4841 C0                  786 	.db #0xc0	; 192
   4842                     787 _g_tiles_054:
   4842 AB                  788 	.db #0xab	; 171
   4843 03                  789 	.db #0x03	; 3
   4844 AB                  790 	.db #0xab	; 171
   4845 03                  791 	.db #0x03	; 3
   4846 AB                  792 	.db #0xab	; 171
   4847 03                  793 	.db #0x03	; 3
   4848 EA                  794 	.db #0xea	; 234
   4849 C0                  795 	.db #0xc0	; 192
   484A                     796 _g_tiles_055:
   484A 03                  797 	.db #0x03	; 3
   484B 03                  798 	.db #0x03	; 3
   484C 03                  799 	.db #0x03	; 3
   484D 03                  800 	.db #0x03	; 3
   484E 03                  801 	.db #0x03	; 3
   484F 03                  802 	.db #0x03	; 3
   4850 C0                  803 	.db #0xc0	; 192
   4851 C0                  804 	.db #0xc0	; 192
   4852                     805 _g_tiles_056:
   4852 03                  806 	.db #0x03	; 3
   4853 42                  807 	.db #0x42	; 66	'B'
   4854 03                  808 	.db #0x03	; 3
   4855 42                  809 	.db #0x42	; 66	'B'
   4856 03                  810 	.db #0x03	; 3
   4857 42                  811 	.db #0x42	; 66	'B'
   4858 C0                  812 	.db #0xc0	; 192
   4859 C0                  813 	.db #0xc0	; 192
   485A                     814 _g_tiles_057:
   485A C0                  815 	.db #0xc0	; 192
   485B C0                  816 	.db #0xc0	; 192
   485C C0                  817 	.db #0xc0	; 192
   485D C0                  818 	.db #0xc0	; 192
   485E C0                  819 	.db #0xc0	; 192
   485F C0                  820 	.db #0xc0	; 192
   4860 C0                  821 	.db #0xc0	; 192
   4861 C0                  822 	.db #0xc0	; 192
   4862                     823 _g_tiles_058:
   4862 C0                  824 	.db #0xc0	; 192
   4863 C0                  825 	.db #0xc0	; 192
   4864 C0                  826 	.db #0xc0	; 192
   4865 C0                  827 	.db #0xc0	; 192
   4866 C0                  828 	.db #0xc0	; 192
   4867 C0                  829 	.db #0xc0	; 192
   4868 C0                  830 	.db #0xc0	; 192
   4869 C0                  831 	.db #0xc0	; 192
   486A                     832 _g_tiles_059:
   486A C0                  833 	.db #0xc0	; 192
   486B C0                  834 	.db #0xc0	; 192
   486C C0                  835 	.db #0xc0	; 192
   486D C0                  836 	.db #0xc0	; 192
   486E C0                  837 	.db #0xc0	; 192
   486F C0                  838 	.db #0xc0	; 192
   4870 C0                  839 	.db #0xc0	; 192
   4871 C0                  840 	.db #0xc0	; 192
   4872                     841 _g_tiles_060:
   4872 80                  842 	.db #0x80	; 128
   4873 84                  843 	.db #0x84	; 132
   4874 40                  844 	.db #0x40	; 64
   4875 48                  845 	.db #0x48	; 72	'H'
   4876 84                  846 	.db #0x84	; 132
   4877 80                  847 	.db #0x80	; 128
   4878 48                  848 	.db #0x48	; 72	'H'
   4879 40                  849 	.db #0x40	; 64
   487A                     850 _g_tiles_061:
   487A 80                  851 	.db #0x80	; 128
   487B 80                  852 	.db #0x80	; 128
   487C 40                  853 	.db #0x40	; 64
   487D 04                  854 	.db #0x04	; 4
   487E 84                  855 	.db #0x84	; 132
   487F 08                  856 	.db #0x08	; 8
   4880 48                  857 	.db #0x48	; 72	'H'
   4881 40                  858 	.db #0x40	; 64
   4882                     859 _g_tiles_062:
   4882 80                  860 	.db #0x80	; 128
   4883 94                  861 	.db #0x94	; 148
   4884 48                  862 	.db #0x48	; 72	'H'
   4885 40                  863 	.db #0x40	; 64
   4886 84                  864 	.db #0x84	; 132
   4887 08                  865 	.db #0x08	; 8
   4888 40                  866 	.db #0x40	; 64
   4889 04                  867 	.db #0x04	; 4
   488A                     868 _g_tiles_063:
   488A 08                  869 	.db #0x08	; 8
   488B 80                  870 	.db #0x80	; 128
   488C 40                  871 	.db #0x40	; 64
   488D 40                  872 	.db #0x40	; 64
   488E 80                  873 	.db #0x80	; 128
   488F 80                  874 	.db #0x80	; 128
   4890 40                  875 	.db #0x40	; 64
   4891 40                  876 	.db #0x40	; 64
   4892                     877 _g_tiles_064:
   4892 C0                  878 	.db #0xc0	; 192
   4893 C0                  879 	.db #0xc0	; 192
   4894 C0                  880 	.db #0xc0	; 192
   4895 C0                  881 	.db #0xc0	; 192
   4896 C0                  882 	.db #0xc0	; 192
   4897 C0                  883 	.db #0xc0	; 192
   4898 C0                  884 	.db #0xc0	; 192
   4899 C0                  885 	.db #0xc0	; 192
   489A                     886 _g_tiles_065:
   489A C0                  887 	.db #0xc0	; 192
   489B C0                  888 	.db #0xc0	; 192
   489C C0                  889 	.db #0xc0	; 192
   489D C0                  890 	.db #0xc0	; 192
   489E C0                  891 	.db #0xc0	; 192
   489F C0                  892 	.db #0xc0	; 192
   48A0 C0                  893 	.db #0xc0	; 192
   48A1 C0                  894 	.db #0xc0	; 192
   48A2                     895 _g_tiles_066:
   48A2 C0                  896 	.db #0xc0	; 192
   48A3 C0                  897 	.db #0xc0	; 192
   48A4 C0                  898 	.db #0xc0	; 192
   48A5 C0                  899 	.db #0xc0	; 192
   48A6 C0                  900 	.db #0xc0	; 192
   48A7 C0                  901 	.db #0xc0	; 192
   48A8 C0                  902 	.db #0xc0	; 192
   48A9 C0                  903 	.db #0xc0	; 192
   48AA                     904 _g_tiles_067:
   48AA C0                  905 	.db #0xc0	; 192
   48AB C0                  906 	.db #0xc0	; 192
   48AC C0                  907 	.db #0xc0	; 192
   48AD C0                  908 	.db #0xc0	; 192
   48AE C0                  909 	.db #0xc0	; 192
   48AF C0                  910 	.db #0xc0	; 192
   48B0 C0                  911 	.db #0xc0	; 192
   48B1 C0                  912 	.db #0xc0	; 192
   48B2                     913 _g_tiles_068:
   48B2 C0                  914 	.db #0xc0	; 192
   48B3 C0                  915 	.db #0xc0	; 192
   48B4 C0                  916 	.db #0xc0	; 192
   48B5 C0                  917 	.db #0xc0	; 192
   48B6 C0                  918 	.db #0xc0	; 192
   48B7 C0                  919 	.db #0xc0	; 192
   48B8 C0                  920 	.db #0xc0	; 192
   48B9 C0                  921 	.db #0xc0	; 192
   48BA                     922 _g_tiles_069:
   48BA C0                  923 	.db #0xc0	; 192
   48BB C0                  924 	.db #0xc0	; 192
   48BC C0                  925 	.db #0xc0	; 192
   48BD C0                  926 	.db #0xc0	; 192
   48BE C0                  927 	.db #0xc0	; 192
   48BF C0                  928 	.db #0xc0	; 192
   48C0 C0                  929 	.db #0xc0	; 192
   48C1 C0                  930 	.db #0xc0	; 192
   48C2                     931 _g_tiles_070:
   48C2 00                  932 	.db #0x00	; 0
   48C3 00                  933 	.db #0x00	; 0
   48C4 00                  934 	.db #0x00	; 0
   48C5 00                  935 	.db #0x00	; 0
   48C6 00                  936 	.db #0x00	; 0
   48C7 00                  937 	.db #0x00	; 0
   48C8 00                  938 	.db #0x00	; 0
   48C9 14                  939 	.db #0x14	; 20
   48CA                     940 _g_tiles_071:
   48CA 28                  941 	.db #0x28	; 40
   48CB 00                  942 	.db #0x00	; 0
   48CC 14                  943 	.db #0x14	; 20
   48CD 28                  944 	.db #0x28	; 40
   48CE 00                  945 	.db #0x00	; 0
   48CF 14                  946 	.db #0x14	; 20
   48D0 28                  947 	.db #0x28	; 40
   48D1 00                  948 	.db #0x00	; 0
   48D2                     949 _g_tiles_072:
   48D2 00                  950 	.db #0x00	; 0
   48D3 14                  951 	.db #0x14	; 20
   48D4 14                  952 	.db #0x14	; 20
   48D5 28                  953 	.db #0x28	; 40
   48D6 28                  954 	.db #0x28	; 40
   48D7 00                  955 	.db #0x00	; 0
   48D8 00                  956 	.db #0x00	; 0
   48D9 00                  957 	.db #0x00	; 0
   48DA                     958 _g_tiles_073:
   48DA 00                  959 	.db #0x00	; 0
   48DB 14                  960 	.db #0x14	; 20
   48DC 00                  961 	.db #0x00	; 0
   48DD 28                  962 	.db #0x28	; 40
   48DE 14                  963 	.db #0x14	; 20
   48DF 00                  964 	.db #0x00	; 0
   48E0 28                  965 	.db #0x28	; 40
   48E1 00                  966 	.db #0x00	; 0
   48E2                     967 _g_tiles_074:
   48E2 80                  968 	.db #0x80	; 128
   48E3 1C                  969 	.db #0x1c	; 28
   48E4 80                  970 	.db #0x80	; 128
   48E5 1C                  971 	.db #0x1c	; 28
   48E6 80                  972 	.db #0x80	; 128
   48E7 1C                  973 	.db #0x1c	; 28
   48E8 80                  974 	.db #0x80	; 128
   48E9 1C                  975 	.db #0x1c	; 28
   48EA                     976 _g_tiles_075:
   48EA 2C                  977 	.db #0x2c	; 44
   48EB 40                  978 	.db #0x40	; 64
   48EC 2C                  979 	.db #0x2c	; 44
   48ED 40                  980 	.db #0x40	; 64
   48EE 2C                  981 	.db #0x2c	; 44
   48EF 40                  982 	.db #0x40	; 64
   48F0 2C                  983 	.db #0x2c	; 44
   48F1 40                  984 	.db #0x40	; 64
   48F2                     985 _g_tiles_076:
   48F2 C0                  986 	.db #0xc0	; 192
   48F3 C0                  987 	.db #0xc0	; 192
   48F4 C0                  988 	.db #0xc0	; 192
   48F5 C0                  989 	.db #0xc0	; 192
   48F6 C0                  990 	.db #0xc0	; 192
   48F7 C0                  991 	.db #0xc0	; 192
   48F8 C0                  992 	.db #0xc0	; 192
   48F9 C0                  993 	.db #0xc0	; 192
   48FA                     994 _g_tiles_077:
   48FA C0                  995 	.db #0xc0	; 192
   48FB C0                  996 	.db #0xc0	; 192
   48FC C0                  997 	.db #0xc0	; 192
   48FD C0                  998 	.db #0xc0	; 192
   48FE C0                  999 	.db #0xc0	; 192
   48FF C0                 1000 	.db #0xc0	; 192
   4900 C0                 1001 	.db #0xc0	; 192
   4901 C0                 1002 	.db #0xc0	; 192
   4902                    1003 _g_tiles_078:
   4902 C0                 1004 	.db #0xc0	; 192
   4903 C0                 1005 	.db #0xc0	; 192
   4904 C0                 1006 	.db #0xc0	; 192
   4905 C0                 1007 	.db #0xc0	; 192
   4906 C0                 1008 	.db #0xc0	; 192
   4907 C0                 1009 	.db #0xc0	; 192
   4908 C0                 1010 	.db #0xc0	; 192
   4909 C0                 1011 	.db #0xc0	; 192
   490A                    1012 _g_tiles_079:
   490A C0                 1013 	.db #0xc0	; 192
   490B C0                 1014 	.db #0xc0	; 192
   490C C0                 1015 	.db #0xc0	; 192
   490D C0                 1016 	.db #0xc0	; 192
   490E C0                 1017 	.db #0xc0	; 192
   490F C0                 1018 	.db #0xc0	; 192
   4910 C0                 1019 	.db #0xc0	; 192
   4911 C0                 1020 	.db #0xc0	; 192
   4912                    1021 _g_tiles_080:
   4912 C0                 1022 	.db #0xc0	; 192
   4913 C0                 1023 	.db #0xc0	; 192
   4914 C0                 1024 	.db #0xc0	; 192
   4915 C0                 1025 	.db #0xc0	; 192
   4916 C0                 1026 	.db #0xc0	; 192
   4917 C0                 1027 	.db #0xc0	; 192
   4918 C0                 1028 	.db #0xc0	; 192
   4919 C0                 1029 	.db #0xc0	; 192
   491A                    1030 _g_tiles_081:
   491A C0                 1031 	.db #0xc0	; 192
   491B C0                 1032 	.db #0xc0	; 192
   491C C0                 1033 	.db #0xc0	; 192
   491D C0                 1034 	.db #0xc0	; 192
   491E C0                 1035 	.db #0xc0	; 192
   491F C0                 1036 	.db #0xc0	; 192
   4920 C0                 1037 	.db #0xc0	; 192
   4921 C0                 1038 	.db #0xc0	; 192
   4922                    1039 _g_tiles_082:
   4922 C0                 1040 	.db #0xc0	; 192
   4923 C0                 1041 	.db #0xc0	; 192
   4924 C0                 1042 	.db #0xc0	; 192
   4925 C0                 1043 	.db #0xc0	; 192
   4926 C0                 1044 	.db #0xc0	; 192
   4927 C0                 1045 	.db #0xc0	; 192
   4928 C0                 1046 	.db #0xc0	; 192
   4929 C0                 1047 	.db #0xc0	; 192
   492A                    1048 _g_tiles_083:
   492A C0                 1049 	.db #0xc0	; 192
   492B C0                 1050 	.db #0xc0	; 192
   492C C0                 1051 	.db #0xc0	; 192
   492D C0                 1052 	.db #0xc0	; 192
   492E C0                 1053 	.db #0xc0	; 192
   492F C0                 1054 	.db #0xc0	; 192
   4930 C0                 1055 	.db #0xc0	; 192
   4931 C0                 1056 	.db #0xc0	; 192
   4932                    1057 _g_tiles_084:
   4932 C0                 1058 	.db #0xc0	; 192
   4933 C0                 1059 	.db #0xc0	; 192
   4934 C0                 1060 	.db #0xc0	; 192
   4935 C0                 1061 	.db #0xc0	; 192
   4936 C0                 1062 	.db #0xc0	; 192
   4937 C0                 1063 	.db #0xc0	; 192
   4938 C0                 1064 	.db #0xc0	; 192
   4939 C0                 1065 	.db #0xc0	; 192
   493A                    1066 _g_tiles_085:
   493A C0                 1067 	.db #0xc0	; 192
   493B C0                 1068 	.db #0xc0	; 192
   493C C0                 1069 	.db #0xc0	; 192
   493D C0                 1070 	.db #0xc0	; 192
   493E C0                 1071 	.db #0xc0	; 192
   493F C0                 1072 	.db #0xc0	; 192
   4940 C0                 1073 	.db #0xc0	; 192
   4941 C0                 1074 	.db #0xc0	; 192
   4942                    1075 _g_tiles_086:
   4942 00                 1076 	.db #0x00	; 0
   4943 28                 1077 	.db #0x28	; 40
   4944 14                 1078 	.db #0x14	; 20
   4945 00                 1079 	.db #0x00	; 0
   4946 14                 1080 	.db #0x14	; 20
   4947 00                 1081 	.db #0x00	; 0
   4948 28                 1082 	.db #0x28	; 40
   4949 00                 1083 	.db #0x00	; 0
   494A                    1084 _g_tiles_087:
   494A 14                 1085 	.db #0x14	; 20
   494B 00                 1086 	.db #0x00	; 0
   494C 00                 1087 	.db #0x00	; 0
   494D 28                 1088 	.db #0x28	; 40
   494E 00                 1089 	.db #0x00	; 0
   494F 28                 1090 	.db #0x28	; 40
   4950 00                 1091 	.db #0x00	; 0
   4951 14                 1092 	.db #0x14	; 20
   4952                    1093 _g_tiles_088:
   4952 00                 1094 	.db #0x00	; 0
   4953 14                 1095 	.db #0x14	; 20
   4954 00                 1096 	.db #0x00	; 0
   4955 28                 1097 	.db #0x28	; 40
   4956 14                 1098 	.db #0x14	; 20
   4957 00                 1099 	.db #0x00	; 0
   4958 00                 1100 	.db #0x00	; 0
   4959 00                 1101 	.db #0x00	; 0
   495A                    1102 _g_tiles_089:
   495A 00                 1103 	.db #0x00	; 0
   495B 00                 1104 	.db #0x00	; 0
   495C 00                 1105 	.db #0x00	; 0
   495D 00                 1106 	.db #0x00	; 0
   495E 00                 1107 	.db #0x00	; 0
   495F 00                 1108 	.db #0x00	; 0
   4960 00                 1109 	.db #0x00	; 0
   4961 00                 1110 	.db #0x00	; 0
   4962                    1111 _g_tiles_090:
   4962 C0                 1112 	.db #0xc0	; 192
   4963 C0                 1113 	.db #0xc0	; 192
   4964 C0                 1114 	.db #0xc0	; 192
   4965 C0                 1115 	.db #0xc0	; 192
   4966 C0                 1116 	.db #0xc0	; 192
   4967 C0                 1117 	.db #0xc0	; 192
   4968 C0                 1118 	.db #0xc0	; 192
   4969 C0                 1119 	.db #0xc0	; 192
   496A                    1120 _g_tiles_091:
   496A C0                 1121 	.db #0xc0	; 192
   496B C0                 1122 	.db #0xc0	; 192
   496C C0                 1123 	.db #0xc0	; 192
   496D C0                 1124 	.db #0xc0	; 192
   496E C0                 1125 	.db #0xc0	; 192
   496F C0                 1126 	.db #0xc0	; 192
   4970 C0                 1127 	.db #0xc0	; 192
   4971 C0                 1128 	.db #0xc0	; 192
   4972                    1129 _g_tiles_092:
   4972 C0                 1130 	.db #0xc0	; 192
   4973 C0                 1131 	.db #0xc0	; 192
   4974 C0                 1132 	.db #0xc0	; 192
   4975 C0                 1133 	.db #0xc0	; 192
   4976 C0                 1134 	.db #0xc0	; 192
   4977 C0                 1135 	.db #0xc0	; 192
   4978 C0                 1136 	.db #0xc0	; 192
   4979 C0                 1137 	.db #0xc0	; 192
   497A                    1138 _g_tiles_093:
   497A C0                 1139 	.db #0xc0	; 192
   497B C0                 1140 	.db #0xc0	; 192
   497C C0                 1141 	.db #0xc0	; 192
   497D C0                 1142 	.db #0xc0	; 192
   497E C0                 1143 	.db #0xc0	; 192
   497F C0                 1144 	.db #0xc0	; 192
   4980 C0                 1145 	.db #0xc0	; 192
   4981 C0                 1146 	.db #0xc0	; 192
   4982                    1147 _g_tiles_094:
   4982 C0                 1148 	.db #0xc0	; 192
   4983 C0                 1149 	.db #0xc0	; 192
   4984 C0                 1150 	.db #0xc0	; 192
   4985 C0                 1151 	.db #0xc0	; 192
   4986 C0                 1152 	.db #0xc0	; 192
   4987 C0                 1153 	.db #0xc0	; 192
   4988 C0                 1154 	.db #0xc0	; 192
   4989 C0                 1155 	.db #0xc0	; 192
   498A                    1156 _g_tiles_095:
   498A C0                 1157 	.db #0xc0	; 192
   498B C0                 1158 	.db #0xc0	; 192
   498C C0                 1159 	.db #0xc0	; 192
   498D C0                 1160 	.db #0xc0	; 192
   498E C0                 1161 	.db #0xc0	; 192
   498F C0                 1162 	.db #0xc0	; 192
   4990 C0                 1163 	.db #0xc0	; 192
   4991 C0                 1164 	.db #0xc0	; 192
   4992                    1165 _g_tiles_096:
   4992 C0                 1166 	.db #0xc0	; 192
   4993 C0                 1167 	.db #0xc0	; 192
   4994 80                 1168 	.db #0x80	; 128
   4995 00                 1169 	.db #0x00	; 0
   4996 80                 1170 	.db #0x80	; 128
   4997 0C                 1171 	.db #0x0c	; 12
   4998 80                 1172 	.db #0x80	; 128
   4999 1C                 1173 	.db #0x1c	; 28
   499A                    1174 _g_tiles_097:
   499A C0                 1175 	.db #0xc0	; 192
   499B C0                 1176 	.db #0xc0	; 192
   499C 00                 1177 	.db #0x00	; 0
   499D 00                 1178 	.db #0x00	; 0
   499E 0C                 1179 	.db #0x0c	; 12
   499F 0C                 1180 	.db #0x0c	; 12
   49A0 3C                 1181 	.db #0x3c	; 60
   49A1 3C                 1182 	.db #0x3c	; 60
   49A2                    1183 _g_tiles_098:
   49A2 C0                 1184 	.db #0xc0	; 192
   49A3 C0                 1185 	.db #0xc0	; 192
   49A4 00                 1186 	.db #0x00	; 0
   49A5 00                 1187 	.db #0x00	; 0
   49A6 0C                 1188 	.db #0x0c	; 12
   49A7 0C                 1189 	.db #0x0c	; 12
   49A8 3C                 1190 	.db #0x3c	; 60
   49A9 3C                 1191 	.db #0x3c	; 60
   49AA                    1192 _g_tiles_099:
   49AA C0                 1193 	.db #0xc0	; 192
   49AB C0                 1194 	.db #0xc0	; 192
   49AC C0                 1195 	.db #0xc0	; 192
   49AD C0                 1196 	.db #0xc0	; 192
   49AE C0                 1197 	.db #0xc0	; 192
   49AF C0                 1198 	.db #0xc0	; 192
   49B0 C0                 1199 	.db #0xc0	; 192
   49B1 C0                 1200 	.db #0xc0	; 192
   49B2                    1201 _g_tiles_100:
   49B2 C0                 1202 	.db #0xc0	; 192
   49B3 C0                 1203 	.db #0xc0	; 192
   49B4 00                 1204 	.db #0x00	; 0
   49B5 00                 1205 	.db #0x00	; 0
   49B6 0C                 1206 	.db #0x0c	; 12
   49B7 0C                 1207 	.db #0x0c	; 12
   49B8 3C                 1208 	.db #0x3c	; 60
   49B9 3C                 1209 	.db #0x3c	; 60
   49BA                    1210 _g_tiles_101:
   49BA C0                 1211 	.db #0xc0	; 192
   49BB C0                 1212 	.db #0xc0	; 192
   49BC 00                 1213 	.db #0x00	; 0
   49BD 40                 1214 	.db #0x40	; 64
   49BE 0C                 1215 	.db #0x0c	; 12
   49BF 40                 1216 	.db #0x40	; 64
   49C0 2C                 1217 	.db #0x2c	; 44
   49C1 40                 1218 	.db #0x40	; 64
   49C2                    1219 _g_tiles_102:
   49C2 00                 1220 	.db #0x00	; 0
   49C3 00                 1221 	.db #0x00	; 0
   49C4 00                 1222 	.db #0x00	; 0
   49C5 00                 1223 	.db #0x00	; 0
   49C6 00                 1224 	.db #0x00	; 0
   49C7 00                 1225 	.db #0x00	; 0
   49C8 00                 1226 	.db #0x00	; 0
   49C9 00                 1227 	.db #0x00	; 0
   49CA                    1228 _g_tiles_103:
   49CA 00                 1229 	.db #0x00	; 0
   49CB 00                 1230 	.db #0x00	; 0
   49CC 00                 1231 	.db #0x00	; 0
   49CD 28                 1232 	.db #0x28	; 40
   49CE 14                 1233 	.db #0x14	; 20
   49CF 00                 1234 	.db #0x00	; 0
   49D0 28                 1235 	.db #0x28	; 40
   49D1 00                 1236 	.db #0x00	; 0
   49D2                    1237 _g_tiles_104:
   49D2 28                 1238 	.db #0x28	; 40
   49D3 00                 1239 	.db #0x00	; 0
   49D4 14                 1240 	.db #0x14	; 20
   49D5 00                 1241 	.db #0x00	; 0
   49D6 14                 1242 	.db #0x14	; 20
   49D7 00                 1243 	.db #0x00	; 0
   49D8 00                 1244 	.db #0x00	; 0
   49D9 28                 1245 	.db #0x28	; 40
   49DA                    1246 _g_tiles_105:
   49DA 00                 1247 	.db #0x00	; 0
   49DB 14                 1248 	.db #0x14	; 20
   49DC 00                 1249 	.db #0x00	; 0
   49DD 28                 1250 	.db #0x28	; 40
   49DE 00                 1251 	.db #0x00	; 0
   49DF 28                 1252 	.db #0x28	; 40
   49E0 14                 1253 	.db #0x14	; 20
   49E1 00                 1254 	.db #0x00	; 0
   49E2                    1255 _g_tiles_106:
   49E2 C0                 1256 	.db #0xc0	; 192
   49E3 C0                 1257 	.db #0xc0	; 192
   49E4 C0                 1258 	.db #0xc0	; 192
   49E5 C0                 1259 	.db #0xc0	; 192
   49E6 C0                 1260 	.db #0xc0	; 192
   49E7 C0                 1261 	.db #0xc0	; 192
   49E8 C0                 1262 	.db #0xc0	; 192
   49E9 C0                 1263 	.db #0xc0	; 192
   49EA                    1264 _g_tiles_107:
   49EA C0                 1265 	.db #0xc0	; 192
   49EB C0                 1266 	.db #0xc0	; 192
   49EC C0                 1267 	.db #0xc0	; 192
   49ED C0                 1268 	.db #0xc0	; 192
   49EE C0                 1269 	.db #0xc0	; 192
   49EF C0                 1270 	.db #0xc0	; 192
   49F0 C0                 1271 	.db #0xc0	; 192
   49F1 C0                 1272 	.db #0xc0	; 192
   49F2                    1273 _g_tiles_108:
   49F2 C0                 1274 	.db #0xc0	; 192
   49F3 C0                 1275 	.db #0xc0	; 192
   49F4 C0                 1276 	.db #0xc0	; 192
   49F5 C0                 1277 	.db #0xc0	; 192
   49F6 C0                 1278 	.db #0xc0	; 192
   49F7 C0                 1279 	.db #0xc0	; 192
   49F8 C0                 1280 	.db #0xc0	; 192
   49F9 C0                 1281 	.db #0xc0	; 192
   49FA                    1282 _g_tiles_109:
   49FA C0                 1283 	.db #0xc0	; 192
   49FB C0                 1284 	.db #0xc0	; 192
   49FC C0                 1285 	.db #0xc0	; 192
   49FD C0                 1286 	.db #0xc0	; 192
   49FE C0                 1287 	.db #0xc0	; 192
   49FF C0                 1288 	.db #0xc0	; 192
   4A00 C0                 1289 	.db #0xc0	; 192
   4A01 C0                 1290 	.db #0xc0	; 192
   4A02                    1291 _g_tiles_110:
   4A02 C0                 1292 	.db #0xc0	; 192
   4A03 C0                 1293 	.db #0xc0	; 192
   4A04 C0                 1294 	.db #0xc0	; 192
   4A05 C0                 1295 	.db #0xc0	; 192
   4A06 C0                 1296 	.db #0xc0	; 192
   4A07 C0                 1297 	.db #0xc0	; 192
   4A08 C0                 1298 	.db #0xc0	; 192
   4A09 C0                 1299 	.db #0xc0	; 192
   4A0A                    1300 _g_tiles_111:
   4A0A C0                 1301 	.db #0xc0	; 192
   4A0B C0                 1302 	.db #0xc0	; 192
   4A0C C0                 1303 	.db #0xc0	; 192
   4A0D C0                 1304 	.db #0xc0	; 192
   4A0E C0                 1305 	.db #0xc0	; 192
   4A0F C0                 1306 	.db #0xc0	; 192
   4A10 C0                 1307 	.db #0xc0	; 192
   4A11 C0                 1308 	.db #0xc0	; 192
   4A12                    1309 _g_tiles_112:
   4A12 80                 1310 	.db #0x80	; 128
   4A13 1C                 1311 	.db #0x1c	; 28
   4A14 80                 1312 	.db #0x80	; 128
   4A15 1C                 1313 	.db #0x1c	; 28
   4A16 80                 1314 	.db #0x80	; 128
   4A17 1C                 1315 	.db #0x1c	; 28
   4A18 80                 1316 	.db #0x80	; 128
   4A19 1C                 1317 	.db #0x1c	; 28
   4A1A                    1318 _g_tiles_113:
   4A1A 3C                 1319 	.db #0x3c	; 60
   4A1B 3C                 1320 	.db #0x3c	; 60
   4A1C 2C                 1321 	.db #0x2c	; 44
   4A1D 0C                 1322 	.db #0x0c	; 12
   4A1E 2C                 1323 	.db #0x2c	; 44
   4A1F 00                 1324 	.db #0x00	; 0
   4A20 2C                 1325 	.db #0x2c	; 44
   4A21 40                 1326 	.db #0x40	; 64
   4A22                    1327 _g_tiles_114:
   4A22 3C                 1328 	.db #0x3c	; 60
   4A23 3C                 1329 	.db #0x3c	; 60
   4A24 0C                 1330 	.db #0x0c	; 12
   4A25 0C                 1331 	.db #0x0c	; 12
   4A26 00                 1332 	.db #0x00	; 0
   4A27 00                 1333 	.db #0x00	; 0
   4A28 C0                 1334 	.db #0xc0	; 192
   4A29 C0                 1335 	.db #0xc0	; 192
   4A2A                    1336 _g_tiles_115:
   4A2A C0                 1337 	.db #0xc0	; 192
   4A2B C0                 1338 	.db #0xc0	; 192
   4A2C C0                 1339 	.db #0xc0	; 192
   4A2D C0                 1340 	.db #0xc0	; 192
   4A2E C0                 1341 	.db #0xc0	; 192
   4A2F C0                 1342 	.db #0xc0	; 192
   4A30 C0                 1343 	.db #0xc0	; 192
   4A31 C0                 1344 	.db #0xc0	; 192
   4A32                    1345 _g_tiles_116:
   4A32 3C                 1346 	.db #0x3c	; 60
   4A33 3C                 1347 	.db #0x3c	; 60
   4A34 0C                 1348 	.db #0x0c	; 12
   4A35 1C                 1349 	.db #0x1c	; 28
   4A36 00                 1350 	.db #0x00	; 0
   4A37 1C                 1351 	.db #0x1c	; 28
   4A38 80                 1352 	.db #0x80	; 128
   4A39 1C                 1353 	.db #0x1c	; 28
   4A3A                    1354 _g_tiles_117:
   4A3A 2C                 1355 	.db #0x2c	; 44
   4A3B 40                 1356 	.db #0x40	; 64
   4A3C 2C                 1357 	.db #0x2c	; 44
   4A3D 40                 1358 	.db #0x40	; 64
   4A3E 2C                 1359 	.db #0x2c	; 44
   4A3F 40                 1360 	.db #0x40	; 64
   4A40 2C                 1361 	.db #0x2c	; 44
   4A41 40                 1362 	.db #0x40	; 64
   4A42                    1363 _g_tiles_118:
   4A42 00                 1364 	.db #0x00	; 0
   4A43 14                 1365 	.db #0x14	; 20
   4A44 00                 1366 	.db #0x00	; 0
   4A45 28                 1367 	.db #0x28	; 40
   4A46 14                 1368 	.db #0x14	; 20
   4A47 00                 1369 	.db #0x00	; 0
   4A48 28                 1370 	.db #0x28	; 40
   4A49 00                 1371 	.db #0x00	; 0
   4A4A                    1372 _g_tiles_119:
   4A4A 00                 1373 	.db #0x00	; 0
   4A4B 00                 1374 	.db #0x00	; 0
   4A4C 00                 1375 	.db #0x00	; 0
   4A4D 14                 1376 	.db #0x14	; 20
   4A4E 14                 1377 	.db #0x14	; 20
   4A4F 28                 1378 	.db #0x28	; 40
   4A50 28                 1379 	.db #0x28	; 40
   4A51 00                 1380 	.db #0x00	; 0
   4A52                    1381 _g_tiles_120:
   4A52 00                 1382 	.db #0x00	; 0
   4A53 14                 1383 	.db #0x14	; 20
   4A54 28                 1384 	.db #0x28	; 40
   4A55 00                 1385 	.db #0x00	; 0
   4A56 14                 1386 	.db #0x14	; 20
   4A57 28                 1387 	.db #0x28	; 40
   4A58 00                 1388 	.db #0x00	; 0
   4A59 14                 1389 	.db #0x14	; 20
   4A5A                    1390 _g_tiles_121:
   4A5A 28                 1391 	.db #0x28	; 40
   4A5B 00                 1392 	.db #0x00	; 0
   4A5C 00                 1393 	.db #0x00	; 0
   4A5D 00                 1394 	.db #0x00	; 0
   4A5E 00                 1395 	.db #0x00	; 0
   4A5F 00                 1396 	.db #0x00	; 0
   4A60 00                 1397 	.db #0x00	; 0
   4A61 00                 1398 	.db #0x00	; 0
   4A62                    1399 _g_tiles_122:
   4A62 80                 1400 	.db #0x80	; 128
   4A63 1C                 1401 	.db #0x1c	; 28
   4A64 80                 1402 	.db #0x80	; 128
   4A65 0C                 1403 	.db #0x0c	; 12
   4A66 80                 1404 	.db #0x80	; 128
   4A67 00                 1405 	.db #0x00	; 0
   4A68 C0                 1406 	.db #0xc0	; 192
   4A69 C0                 1407 	.db #0xc0	; 192
   4A6A                    1408 _g_tiles_123:
   4A6A 2C                 1409 	.db #0x2c	; 44
   4A6B 40                 1410 	.db #0x40	; 64
   4A6C 0C                 1411 	.db #0x0c	; 12
   4A6D 40                 1412 	.db #0x40	; 64
   4A6E 00                 1413 	.db #0x00	; 0
   4A6F 40                 1414 	.db #0x40	; 64
   4A70 C0                 1415 	.db #0xc0	; 192
   4A71 C0                 1416 	.db #0xc0	; 192
   4A72                    1417 _g_tiles_124:
   4A72 C0                 1418 	.db #0xc0	; 192
   4A73 C0                 1419 	.db #0xc0	; 192
   4A74 C0                 1420 	.db #0xc0	; 192
   4A75 C0                 1421 	.db #0xc0	; 192
   4A76 C0                 1422 	.db #0xc0	; 192
   4A77 C0                 1423 	.db #0xc0	; 192
   4A78 C0                 1424 	.db #0xc0	; 192
   4A79 C0                 1425 	.db #0xc0	; 192
   4A7A                    1426 _g_tiles_125:
   4A7A C0                 1427 	.db #0xc0	; 192
   4A7B C0                 1428 	.db #0xc0	; 192
   4A7C C0                 1429 	.db #0xc0	; 192
   4A7D C0                 1430 	.db #0xc0	; 192
   4A7E C0                 1431 	.db #0xc0	; 192
   4A7F C0                 1432 	.db #0xc0	; 192
   4A80 C0                 1433 	.db #0xc0	; 192
   4A81 C0                 1434 	.db #0xc0	; 192
   4A82                    1435 _g_tiles_126:
   4A82 C0                 1436 	.db #0xc0	; 192
   4A83 C0                 1437 	.db #0xc0	; 192
   4A84 C0                 1438 	.db #0xc0	; 192
   4A85 C0                 1439 	.db #0xc0	; 192
   4A86 C0                 1440 	.db #0xc0	; 192
   4A87 C0                 1441 	.db #0xc0	; 192
   4A88 C0                 1442 	.db #0xc0	; 192
   4A89 C0                 1443 	.db #0xc0	; 192
   4A8A                    1444 _g_tiles_127:
   4A8A C0                 1445 	.db #0xc0	; 192
   4A8B C0                 1446 	.db #0xc0	; 192
   4A8C C0                 1447 	.db #0xc0	; 192
   4A8D C0                 1448 	.db #0xc0	; 192
   4A8E C0                 1449 	.db #0xc0	; 192
   4A8F C0                 1450 	.db #0xc0	; 192
   4A90 C0                 1451 	.db #0xc0	; 192
   4A91 C0                 1452 	.db #0xc0	; 192
                           1453 	.area _INITIALIZER
                           1454 	.area _CABS (ABS)
