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
                             11 	.globl _g_tiles_119
                             12 	.globl _g_tiles_118
                             13 	.globl _g_tiles_117
                             14 	.globl _g_tiles_116
                             15 	.globl _g_tiles_115
                             16 	.globl _g_tiles_114
                             17 	.globl _g_tiles_113
                             18 	.globl _g_tiles_112
                             19 	.globl _g_tiles_111
                             20 	.globl _g_tiles_110
                             21 	.globl _g_tiles_109
                             22 	.globl _g_tiles_108
                             23 	.globl _g_tiles_107
                             24 	.globl _g_tiles_106
                             25 	.globl _g_tiles_105
                             26 	.globl _g_tiles_104
                             27 	.globl _g_tiles_103
                             28 	.globl _g_tiles_102
                             29 	.globl _g_tiles_101
                             30 	.globl _g_tiles_100
                             31 	.globl _g_tiles_099
                             32 	.globl _g_tiles_098
                             33 	.globl _g_tiles_097
                             34 	.globl _g_tiles_096
                             35 	.globl _g_tiles_095
                             36 	.globl _g_tiles_094
                             37 	.globl _g_tiles_093
                             38 	.globl _g_tiles_092
                             39 	.globl _g_tiles_091
                             40 	.globl _g_tiles_090
                             41 	.globl _g_tiles_089
                             42 	.globl _g_tiles_088
                             43 	.globl _g_tiles_087
                             44 	.globl _g_tiles_086
                             45 	.globl _g_tiles_085
                             46 	.globl _g_tiles_084
                             47 	.globl _g_tiles_083
                             48 	.globl _g_tiles_082
                             49 	.globl _g_tiles_081
                             50 	.globl _g_tiles_080
                             51 	.globl _g_tiles_079
                             52 	.globl _g_tiles_078
                             53 	.globl _g_tiles_077
                             54 	.globl _g_tiles_076
                             55 	.globl _g_tiles_075
                             56 	.globl _g_tiles_074
                             57 	.globl _g_tiles_073
                             58 	.globl _g_tiles_072
                             59 	.globl _g_tiles_071
                             60 	.globl _g_tiles_070
                             61 	.globl _g_tiles_069
                             62 	.globl _g_tiles_068
                             63 	.globl _g_tiles_067
                             64 	.globl _g_tiles_066
                             65 	.globl _g_tiles_065
                             66 	.globl _g_tiles_064
                             67 	.globl _g_tiles_063
                             68 	.globl _g_tiles_062
                             69 	.globl _g_tiles_061
                             70 	.globl _g_tiles_060
                             71 	.globl _g_tiles_059
                             72 	.globl _g_tiles_058
                             73 	.globl _g_tiles_057
                             74 	.globl _g_tiles_056
                             75 	.globl _g_tiles_055
                             76 	.globl _g_tiles_054
                             77 	.globl _g_tiles_053
                             78 	.globl _g_tiles_052
                             79 	.globl _g_tiles_051
                             80 	.globl _g_tiles_050
                             81 	.globl _g_tiles_049
                             82 	.globl _g_tiles_048
                             83 	.globl _g_tiles_047
                             84 	.globl _g_tiles_046
                             85 	.globl _g_tiles_045
                             86 	.globl _g_tiles_044
                             87 	.globl _g_tiles_043
                             88 	.globl _g_tiles_042
                             89 	.globl _g_tiles_041
                             90 	.globl _g_tiles_040
                             91 	.globl _g_tiles_039
                             92 	.globl _g_tiles_038
                             93 	.globl _g_tiles_037
                             94 	.globl _g_tiles_036
                             95 	.globl _g_tiles_035
                             96 	.globl _g_tiles_034
                             97 	.globl _g_tiles_033
                             98 	.globl _g_tiles_032
                             99 	.globl _g_tiles_031
                            100 	.globl _g_tiles_030
                            101 	.globl _g_tiles_029
                            102 	.globl _g_tiles_028
                            103 	.globl _g_tiles_027
                            104 	.globl _g_tiles_026
                            105 	.globl _g_tiles_025
                            106 	.globl _g_tiles_024
                            107 	.globl _g_tiles_023
                            108 	.globl _g_tiles_022
                            109 	.globl _g_tiles_021
                            110 	.globl _g_tiles_020
                            111 	.globl _g_tiles_019
                            112 	.globl _g_tiles_018
                            113 	.globl _g_tiles_017
                            114 	.globl _g_tiles_016
                            115 	.globl _g_tiles_015
                            116 	.globl _g_tiles_014
                            117 	.globl _g_tiles_013
                            118 	.globl _g_tiles_012
                            119 	.globl _g_tiles_011
                            120 	.globl _g_tiles_010
                            121 	.globl _g_tiles_009
                            122 	.globl _g_tiles_008
                            123 	.globl _g_tiles_007
                            124 	.globl _g_tiles_006
                            125 	.globl _g_tiles_005
                            126 	.globl _g_tiles_004
                            127 	.globl _g_tiles_003
                            128 	.globl _g_tiles_002
                            129 	.globl _g_tiles_001
                            130 	.globl _g_tiles_000
                            131 	.globl _g_tileset
                            132 ;--------------------------------------------------------
                            133 ; special function registers
                            134 ;--------------------------------------------------------
                            135 ;--------------------------------------------------------
                            136 ; ram data
                            137 ;--------------------------------------------------------
                            138 	.area _DATA
                            139 ;--------------------------------------------------------
                            140 ; ram data
                            141 ;--------------------------------------------------------
                            142 	.area _INITIALIZED
                            143 ;--------------------------------------------------------
                            144 ; absolute external ram data
                            145 ;--------------------------------------------------------
                            146 	.area _DABS (ABS)
                            147 ;--------------------------------------------------------
                            148 ; global & static initialisations
                            149 ;--------------------------------------------------------
                            150 	.area _HOME
                            151 	.area _GSINIT
                            152 	.area _GSFINAL
                            153 	.area _GSINIT
                            154 ;--------------------------------------------------------
                            155 ; Home
                            156 ;--------------------------------------------------------
                            157 	.area _HOME
                            158 	.area _HOME
                            159 ;--------------------------------------------------------
                            160 ; code
                            161 ;--------------------------------------------------------
                            162 	.area _CODE
                            163 	.area _CODE
   5168                     164 _g_tileset:
   5168 58 52               165 	.dw _g_tiles_000
   516A 60 52               166 	.dw _g_tiles_001
   516C 68 52               167 	.dw _g_tiles_002
   516E 70 52               168 	.dw _g_tiles_003
   5170 78 52               169 	.dw _g_tiles_004
   5172 80 52               170 	.dw _g_tiles_005
   5174 88 52               171 	.dw _g_tiles_006
   5176 90 52               172 	.dw _g_tiles_007
   5178 98 52               173 	.dw _g_tiles_008
   517A A0 52               174 	.dw _g_tiles_009
   517C A8 52               175 	.dw _g_tiles_010
   517E B0 52               176 	.dw _g_tiles_011
   5180 B8 52               177 	.dw _g_tiles_012
   5182 C0 52               178 	.dw _g_tiles_013
   5184 C8 52               179 	.dw _g_tiles_014
   5186 D0 52               180 	.dw _g_tiles_015
   5188 D8 52               181 	.dw _g_tiles_016
   518A E0 52               182 	.dw _g_tiles_017
   518C E8 52               183 	.dw _g_tiles_018
   518E F0 52               184 	.dw _g_tiles_019
   5190 F8 52               185 	.dw _g_tiles_020
   5192 00 53               186 	.dw _g_tiles_021
   5194 08 53               187 	.dw _g_tiles_022
   5196 10 53               188 	.dw _g_tiles_023
   5198 18 53               189 	.dw _g_tiles_024
   519A 20 53               190 	.dw _g_tiles_025
   519C 28 53               191 	.dw _g_tiles_026
   519E 30 53               192 	.dw _g_tiles_027
   51A0 38 53               193 	.dw _g_tiles_028
   51A2 40 53               194 	.dw _g_tiles_029
   51A4 48 53               195 	.dw _g_tiles_030
   51A6 50 53               196 	.dw _g_tiles_031
   51A8 58 53               197 	.dw _g_tiles_032
   51AA 60 53               198 	.dw _g_tiles_033
   51AC 68 53               199 	.dw _g_tiles_034
   51AE 70 53               200 	.dw _g_tiles_035
   51B0 78 53               201 	.dw _g_tiles_036
   51B2 80 53               202 	.dw _g_tiles_037
   51B4 88 53               203 	.dw _g_tiles_038
   51B6 90 53               204 	.dw _g_tiles_039
   51B8 98 53               205 	.dw _g_tiles_040
   51BA A0 53               206 	.dw _g_tiles_041
   51BC A8 53               207 	.dw _g_tiles_042
   51BE B0 53               208 	.dw _g_tiles_043
   51C0 B8 53               209 	.dw _g_tiles_044
   51C2 C0 53               210 	.dw _g_tiles_045
   51C4 C8 53               211 	.dw _g_tiles_046
   51C6 D0 53               212 	.dw _g_tiles_047
   51C8 D8 53               213 	.dw _g_tiles_048
   51CA E0 53               214 	.dw _g_tiles_049
   51CC E8 53               215 	.dw _g_tiles_050
   51CE F0 53               216 	.dw _g_tiles_051
   51D0 F8 53               217 	.dw _g_tiles_052
   51D2 00 54               218 	.dw _g_tiles_053
   51D4 08 54               219 	.dw _g_tiles_054
   51D6 10 54               220 	.dw _g_tiles_055
   51D8 18 54               221 	.dw _g_tiles_056
   51DA 20 54               222 	.dw _g_tiles_057
   51DC 28 54               223 	.dw _g_tiles_058
   51DE 30 54               224 	.dw _g_tiles_059
   51E0 38 54               225 	.dw _g_tiles_060
   51E2 40 54               226 	.dw _g_tiles_061
   51E4 48 54               227 	.dw _g_tiles_062
   51E6 50 54               228 	.dw _g_tiles_063
   51E8 58 54               229 	.dw _g_tiles_064
   51EA 60 54               230 	.dw _g_tiles_065
   51EC 68 54               231 	.dw _g_tiles_066
   51EE 70 54               232 	.dw _g_tiles_067
   51F0 78 54               233 	.dw _g_tiles_068
   51F2 80 54               234 	.dw _g_tiles_069
   51F4 88 54               235 	.dw _g_tiles_070
   51F6 90 54               236 	.dw _g_tiles_071
   51F8 98 54               237 	.dw _g_tiles_072
   51FA A0 54               238 	.dw _g_tiles_073
   51FC A8 54               239 	.dw _g_tiles_074
   51FE B0 54               240 	.dw _g_tiles_075
   5200 B8 54               241 	.dw _g_tiles_076
   5202 C0 54               242 	.dw _g_tiles_077
   5204 C8 54               243 	.dw _g_tiles_078
   5206 D0 54               244 	.dw _g_tiles_079
   5208 D8 54               245 	.dw _g_tiles_080
   520A E0 54               246 	.dw _g_tiles_081
   520C E8 54               247 	.dw _g_tiles_082
   520E F0 54               248 	.dw _g_tiles_083
   5210 F8 54               249 	.dw _g_tiles_084
   5212 00 55               250 	.dw _g_tiles_085
   5214 08 55               251 	.dw _g_tiles_086
   5216 10 55               252 	.dw _g_tiles_087
   5218 18 55               253 	.dw _g_tiles_088
   521A 20 55               254 	.dw _g_tiles_089
   521C 28 55               255 	.dw _g_tiles_090
   521E 30 55               256 	.dw _g_tiles_091
   5220 38 55               257 	.dw _g_tiles_092
   5222 40 55               258 	.dw _g_tiles_093
   5224 48 55               259 	.dw _g_tiles_094
   5226 50 55               260 	.dw _g_tiles_095
   5228 58 55               261 	.dw _g_tiles_096
   522A 60 55               262 	.dw _g_tiles_097
   522C 68 55               263 	.dw _g_tiles_098
   522E 70 55               264 	.dw _g_tiles_099
   5230 78 55               265 	.dw _g_tiles_100
   5232 80 55               266 	.dw _g_tiles_101
   5234 88 55               267 	.dw _g_tiles_102
   5236 90 55               268 	.dw _g_tiles_103
   5238 98 55               269 	.dw _g_tiles_104
   523A A0 55               270 	.dw _g_tiles_105
   523C A8 55               271 	.dw _g_tiles_106
   523E B0 55               272 	.dw _g_tiles_107
   5240 B8 55               273 	.dw _g_tiles_108
   5242 C0 55               274 	.dw _g_tiles_109
   5244 C8 55               275 	.dw _g_tiles_110
   5246 D0 55               276 	.dw _g_tiles_111
   5248 D8 55               277 	.dw _g_tiles_112
   524A E0 55               278 	.dw _g_tiles_113
   524C E8 55               279 	.dw _g_tiles_114
   524E F0 55               280 	.dw _g_tiles_115
   5250 F8 55               281 	.dw _g_tiles_116
   5252 00 56               282 	.dw _g_tiles_117
   5254 08 56               283 	.dw _g_tiles_118
   5256 10 56               284 	.dw _g_tiles_119
   5258                     285 _g_tiles_000:
   5258 C0                  286 	.db #0xc0	; 192
   5259 C0                  287 	.db #0xc0	; 192
   525A C0                  288 	.db #0xc0	; 192
   525B C0                  289 	.db #0xc0	; 192
   525C C0                  290 	.db #0xc0	; 192
   525D C0                  291 	.db #0xc0	; 192
   525E C0                  292 	.db #0xc0	; 192
   525F C0                  293 	.db #0xc0	; 192
   5260                     294 _g_tiles_001:
   5260 C0                  295 	.db #0xc0	; 192
   5261 80                  296 	.db #0x80	; 128
   5262 C0                  297 	.db #0xc0	; 192
   5263 80                  298 	.db #0x80	; 128
   5264 C0                  299 	.db #0xc0	; 192
   5265 80                  300 	.db #0x80	; 128
   5266 C0                  301 	.db #0xc0	; 192
   5267 80                  302 	.db #0x80	; 128
   5268                     303 _g_tiles_002:
   5268 0C                  304 	.db #0x0c	; 12
   5269 0C                  305 	.db #0x0c	; 12
   526A 0C                  306 	.db #0x0c	; 12
   526B 0C                  307 	.db #0x0c	; 12
   526C 0C                  308 	.db #0x0c	; 12
   526D 0C                  309 	.db #0x0c	; 12
   526E 0C                  310 	.db #0x0c	; 12
   526F 0C                  311 	.db #0x0c	; 12
   5270                     312 _g_tiles_003:
   5270 0C                  313 	.db #0x0c	; 12
   5271 08                  314 	.db #0x08	; 8
   5272 0C                  315 	.db #0x0c	; 12
   5273 08                  316 	.db #0x08	; 8
   5274 0C                  317 	.db #0x0c	; 12
   5275 08                  318 	.db #0x08	; 8
   5276 0C                  319 	.db #0x0c	; 12
   5277 08                  320 	.db #0x08	; 8
   5278                     321 _g_tiles_004:
   5278 CC                  322 	.db #0xcc	; 204
   5279 CC                  323 	.db #0xcc	; 204
   527A CC                  324 	.db #0xcc	; 204
   527B CC                  325 	.db #0xcc	; 204
   527C CC                  326 	.db #0xcc	; 204
   527D CC                  327 	.db #0xcc	; 204
   527E CC                  328 	.db #0xcc	; 204
   527F CC                  329 	.db #0xcc	; 204
   5280                     330 _g_tiles_005:
   5280 CC                  331 	.db #0xcc	; 204
   5281 88                  332 	.db #0x88	; 136
   5282 CC                  333 	.db #0xcc	; 204
   5283 88                  334 	.db #0x88	; 136
   5284 CC                  335 	.db #0xcc	; 204
   5285 88                  336 	.db #0x88	; 136
   5286 CC                  337 	.db #0xcc	; 204
   5287 88                  338 	.db #0x88	; 136
   5288                     339 _g_tiles_006:
   5288 30                  340 	.db #0x30	; 48	'0'
   5289 30                  341 	.db #0x30	; 48	'0'
   528A 30                  342 	.db #0x30	; 48	'0'
   528B 30                  343 	.db #0x30	; 48	'0'
   528C 30                  344 	.db #0x30	; 48	'0'
   528D 30                  345 	.db #0x30	; 48	'0'
   528E 30                  346 	.db #0x30	; 48	'0'
   528F 30                  347 	.db #0x30	; 48	'0'
   5290                     348 _g_tiles_007:
   5290 30                  349 	.db #0x30	; 48	'0'
   5291 20                  350 	.db #0x20	; 32
   5292 30                  351 	.db #0x30	; 48	'0'
   5293 20                  352 	.db #0x20	; 32
   5294 30                  353 	.db #0x30	; 48	'0'
   5295 20                  354 	.db #0x20	; 32
   5296 30                  355 	.db #0x30	; 48	'0'
   5297 20                  356 	.db #0x20	; 32
   5298                     357 _g_tiles_008:
   5298 F0                  358 	.db #0xf0	; 240
   5299 F0                  359 	.db #0xf0	; 240
   529A F0                  360 	.db #0xf0	; 240
   529B F0                  361 	.db #0xf0	; 240
   529C F0                  362 	.db #0xf0	; 240
   529D F0                  363 	.db #0xf0	; 240
   529E F0                  364 	.db #0xf0	; 240
   529F F0                  365 	.db #0xf0	; 240
   52A0                     366 _g_tiles_009:
   52A0 F0                  367 	.db #0xf0	; 240
   52A1 A0                  368 	.db #0xa0	; 160
   52A2 F0                  369 	.db #0xf0	; 240
   52A3 A0                  370 	.db #0xa0	; 160
   52A4 F0                  371 	.db #0xf0	; 240
   52A5 A0                  372 	.db #0xa0	; 160
   52A6 F0                  373 	.db #0xf0	; 240
   52A7 A0                  374 	.db #0xa0	; 160
   52A8                     375 _g_tiles_010:
   52A8 3C                  376 	.db #0x3c	; 60
   52A9 3C                  377 	.db #0x3c	; 60
   52AA 3C                  378 	.db #0x3c	; 60
   52AB 3C                  379 	.db #0x3c	; 60
   52AC 3C                  380 	.db #0x3c	; 60
   52AD 3C                  381 	.db #0x3c	; 60
   52AE 3C                  382 	.db #0x3c	; 60
   52AF 3C                  383 	.db #0x3c	; 60
   52B0                     384 _g_tiles_011:
   52B0 3C                  385 	.db #0x3c	; 60
   52B1 28                  386 	.db #0x28	; 40
   52B2 3C                  387 	.db #0x3c	; 60
   52B3 28                  388 	.db #0x28	; 40
   52B4 3C                  389 	.db #0x3c	; 60
   52B5 28                  390 	.db #0x28	; 40
   52B6 3C                  391 	.db #0x3c	; 60
   52B7 28                  392 	.db #0x28	; 40
   52B8                     393 _g_tiles_012:
   52B8 FC                  394 	.db #0xfc	; 252
   52B9 FC                  395 	.db #0xfc	; 252
   52BA FC                  396 	.db #0xfc	; 252
   52BB FC                  397 	.db #0xfc	; 252
   52BC FC                  398 	.db #0xfc	; 252
   52BD FC                  399 	.db #0xfc	; 252
   52BE FC                  400 	.db #0xfc	; 252
   52BF FC                  401 	.db #0xfc	; 252
   52C0                     402 _g_tiles_013:
   52C0 FC                  403 	.db #0xfc	; 252
   52C1 A8                  404 	.db #0xa8	; 168
   52C2 FC                  405 	.db #0xfc	; 252
   52C3 A8                  406 	.db #0xa8	; 168
   52C4 FC                  407 	.db #0xfc	; 252
   52C5 A8                  408 	.db #0xa8	; 168
   52C6 FC                  409 	.db #0xfc	; 252
   52C7 A8                  410 	.db #0xa8	; 168
   52C8                     411 _g_tiles_014:
   52C8 03                  412 	.db #0x03	; 3
   52C9 03                  413 	.db #0x03	; 3
   52CA 03                  414 	.db #0x03	; 3
   52CB 03                  415 	.db #0x03	; 3
   52CC 03                  416 	.db #0x03	; 3
   52CD 03                  417 	.db #0x03	; 3
   52CE 03                  418 	.db #0x03	; 3
   52CF 03                  419 	.db #0x03	; 3
   52D0                     420 _g_tiles_015:
   52D0 03                  421 	.db #0x03	; 3
   52D1 02                  422 	.db #0x02	; 2
   52D2 03                  423 	.db #0x03	; 3
   52D3 02                  424 	.db #0x02	; 2
   52D4 03                  425 	.db #0x03	; 3
   52D5 02                  426 	.db #0x02	; 2
   52D6 03                  427 	.db #0x03	; 3
   52D7 02                  428 	.db #0x02	; 2
   52D8                     429 _g_tiles_016:
   52D8 C0                  430 	.db #0xc0	; 192
   52D9 C0                  431 	.db #0xc0	; 192
   52DA C1                  432 	.db #0xc1	; 193
   52DB C3                  433 	.db #0xc3	; 195
   52DC C1                  434 	.db #0xc1	; 193
   52DD C3                  435 	.db #0xc3	; 195
   52DE C1                  436 	.db #0xc1	; 193
   52DF C3                  437 	.db #0xc3	; 195
   52E0                     438 _g_tiles_017:
   52E0 C0                  439 	.db #0xc0	; 192
   52E1 80                  440 	.db #0x80	; 128
   52E2 C3                  441 	.db #0xc3	; 195
   52E3 82                  442 	.db #0x82	; 130
   52E4 C3                  443 	.db #0xc3	; 195
   52E5 82                  444 	.db #0x82	; 130
   52E6 C3                  445 	.db #0xc3	; 195
   52E7 82                  446 	.db #0x82	; 130
   52E8                     447 _g_tiles_018:
   52E8 03                  448 	.db #0x03	; 3
   52E9 03                  449 	.db #0x03	; 3
   52EA 13                  450 	.db #0x13	; 19
   52EB 33                  451 	.db #0x33	; 51	'3'
   52EC 13                  452 	.db #0x13	; 19
   52ED 33                  453 	.db #0x33	; 51	'3'
   52EE 13                  454 	.db #0x13	; 19
   52EF 33                  455 	.db #0x33	; 51	'3'
   52F0                     456 _g_tiles_019:
   52F0 03                  457 	.db #0x03	; 3
   52F1 02                  458 	.db #0x02	; 2
   52F2 33                  459 	.db #0x33	; 51	'3'
   52F3 22                  460 	.db #0x22	; 34
   52F4 33                  461 	.db #0x33	; 51	'3'
   52F5 22                  462 	.db #0x22	; 34
   52F6 33                  463 	.db #0x33	; 51	'3'
   52F7 22                  464 	.db #0x22	; 34
   52F8                     465 _g_tiles_020:
   52F8 C0                  466 	.db #0xc0	; 192
   52F9 C0                  467 	.db #0xc0	; 192
   52FA C0                  468 	.db #0xc0	; 192
   52FB C0                  469 	.db #0xc0	; 192
   52FC C0                  470 	.db #0xc0	; 192
   52FD C0                  471 	.db #0xc0	; 192
   52FE 00                  472 	.db #0x00	; 0
   52FF 00                  473 	.db #0x00	; 0
   5300                     474 _g_tiles_021:
   5300 C0                  475 	.db #0xc0	; 192
   5301 80                  476 	.db #0x80	; 128
   5302 C0                  477 	.db #0xc0	; 192
   5303 80                  478 	.db #0x80	; 128
   5304 C0                  479 	.db #0xc0	; 192
   5305 80                  480 	.db #0x80	; 128
   5306 00                  481 	.db #0x00	; 0
   5307 00                  482 	.db #0x00	; 0
   5308                     483 _g_tiles_022:
   5308 0C                  484 	.db #0x0c	; 12
   5309 0C                  485 	.db #0x0c	; 12
   530A 0C                  486 	.db #0x0c	; 12
   530B 0C                  487 	.db #0x0c	; 12
   530C 0C                  488 	.db #0x0c	; 12
   530D 0C                  489 	.db #0x0c	; 12
   530E 00                  490 	.db #0x00	; 0
   530F 00                  491 	.db #0x00	; 0
   5310                     492 _g_tiles_023:
   5310 0C                  493 	.db #0x0c	; 12
   5311 08                  494 	.db #0x08	; 8
   5312 0C                  495 	.db #0x0c	; 12
   5313 08                  496 	.db #0x08	; 8
   5314 0C                  497 	.db #0x0c	; 12
   5315 08                  498 	.db #0x08	; 8
   5316 00                  499 	.db #0x00	; 0
   5317 00                  500 	.db #0x00	; 0
   5318                     501 _g_tiles_024:
   5318 CC                  502 	.db #0xcc	; 204
   5319 CC                  503 	.db #0xcc	; 204
   531A CC                  504 	.db #0xcc	; 204
   531B CC                  505 	.db #0xcc	; 204
   531C CC                  506 	.db #0xcc	; 204
   531D CC                  507 	.db #0xcc	; 204
   531E 00                  508 	.db #0x00	; 0
   531F 00                  509 	.db #0x00	; 0
   5320                     510 _g_tiles_025:
   5320 CC                  511 	.db #0xcc	; 204
   5321 88                  512 	.db #0x88	; 136
   5322 CC                  513 	.db #0xcc	; 204
   5323 88                  514 	.db #0x88	; 136
   5324 CC                  515 	.db #0xcc	; 204
   5325 88                  516 	.db #0x88	; 136
   5326 00                  517 	.db #0x00	; 0
   5327 00                  518 	.db #0x00	; 0
   5328                     519 _g_tiles_026:
   5328 30                  520 	.db #0x30	; 48	'0'
   5329 30                  521 	.db #0x30	; 48	'0'
   532A 30                  522 	.db #0x30	; 48	'0'
   532B 30                  523 	.db #0x30	; 48	'0'
   532C 30                  524 	.db #0x30	; 48	'0'
   532D 30                  525 	.db #0x30	; 48	'0'
   532E 00                  526 	.db #0x00	; 0
   532F 00                  527 	.db #0x00	; 0
   5330                     528 _g_tiles_027:
   5330 30                  529 	.db #0x30	; 48	'0'
   5331 20                  530 	.db #0x20	; 32
   5332 30                  531 	.db #0x30	; 48	'0'
   5333 20                  532 	.db #0x20	; 32
   5334 30                  533 	.db #0x30	; 48	'0'
   5335 20                  534 	.db #0x20	; 32
   5336 00                  535 	.db #0x00	; 0
   5337 00                  536 	.db #0x00	; 0
   5338                     537 _g_tiles_028:
   5338 F0                  538 	.db #0xf0	; 240
   5339 F0                  539 	.db #0xf0	; 240
   533A F0                  540 	.db #0xf0	; 240
   533B F0                  541 	.db #0xf0	; 240
   533C F0                  542 	.db #0xf0	; 240
   533D F0                  543 	.db #0xf0	; 240
   533E 00                  544 	.db #0x00	; 0
   533F 00                  545 	.db #0x00	; 0
   5340                     546 _g_tiles_029:
   5340 F0                  547 	.db #0xf0	; 240
   5341 A0                  548 	.db #0xa0	; 160
   5342 F0                  549 	.db #0xf0	; 240
   5343 A0                  550 	.db #0xa0	; 160
   5344 F0                  551 	.db #0xf0	; 240
   5345 A0                  552 	.db #0xa0	; 160
   5346 00                  553 	.db #0x00	; 0
   5347 00                  554 	.db #0x00	; 0
   5348                     555 _g_tiles_030:
   5348 3C                  556 	.db #0x3c	; 60
   5349 3C                  557 	.db #0x3c	; 60
   534A 3C                  558 	.db #0x3c	; 60
   534B 3C                  559 	.db #0x3c	; 60
   534C 3C                  560 	.db #0x3c	; 60
   534D 3C                  561 	.db #0x3c	; 60
   534E 00                  562 	.db #0x00	; 0
   534F 00                  563 	.db #0x00	; 0
   5350                     564 _g_tiles_031:
   5350 3C                  565 	.db #0x3c	; 60
   5351 28                  566 	.db #0x28	; 40
   5352 3C                  567 	.db #0x3c	; 60
   5353 28                  568 	.db #0x28	; 40
   5354 3C                  569 	.db #0x3c	; 60
   5355 28                  570 	.db #0x28	; 40
   5356 00                  571 	.db #0x00	; 0
   5357 00                  572 	.db #0x00	; 0
   5358                     573 _g_tiles_032:
   5358 FC                  574 	.db #0xfc	; 252
   5359 FC                  575 	.db #0xfc	; 252
   535A FC                  576 	.db #0xfc	; 252
   535B FC                  577 	.db #0xfc	; 252
   535C FC                  578 	.db #0xfc	; 252
   535D FC                  579 	.db #0xfc	; 252
   535E 00                  580 	.db #0x00	; 0
   535F 00                  581 	.db #0x00	; 0
   5360                     582 _g_tiles_033:
   5360 FC                  583 	.db #0xfc	; 252
   5361 A8                  584 	.db #0xa8	; 168
   5362 FC                  585 	.db #0xfc	; 252
   5363 A8                  586 	.db #0xa8	; 168
   5364 FC                  587 	.db #0xfc	; 252
   5365 A8                  588 	.db #0xa8	; 168
   5366 00                  589 	.db #0x00	; 0
   5367 00                  590 	.db #0x00	; 0
   5368                     591 _g_tiles_034:
   5368 03                  592 	.db #0x03	; 3
   5369 03                  593 	.db #0x03	; 3
   536A 03                  594 	.db #0x03	; 3
   536B 03                  595 	.db #0x03	; 3
   536C 03                  596 	.db #0x03	; 3
   536D 03                  597 	.db #0x03	; 3
   536E 00                  598 	.db #0x00	; 0
   536F 00                  599 	.db #0x00	; 0
   5370                     600 _g_tiles_035:
   5370 03                  601 	.db #0x03	; 3
   5371 02                  602 	.db #0x02	; 2
   5372 03                  603 	.db #0x03	; 3
   5373 02                  604 	.db #0x02	; 2
   5374 03                  605 	.db #0x03	; 3
   5375 02                  606 	.db #0x02	; 2
   5376 00                  607 	.db #0x00	; 0
   5377 00                  608 	.db #0x00	; 0
   5378                     609 _g_tiles_036:
   5378 C1                  610 	.db #0xc1	; 193
   5379 C3                  611 	.db #0xc3	; 195
   537A C1                  612 	.db #0xc1	; 193
   537B C3                  613 	.db #0xc3	; 195
   537C C1                  614 	.db #0xc1	; 193
   537D C3                  615 	.db #0xc3	; 195
   537E 80                  616 	.db #0x80	; 128
   537F 00                  617 	.db #0x00	; 0
   5380                     618 _g_tiles_037:
   5380 C3                  619 	.db #0xc3	; 195
   5381 82                  620 	.db #0x82	; 130
   5382 C3                  621 	.db #0xc3	; 195
   5383 82                  622 	.db #0x82	; 130
   5384 C3                  623 	.db #0xc3	; 195
   5385 82                  624 	.db #0x82	; 130
   5386 00                  625 	.db #0x00	; 0
   5387 00                  626 	.db #0x00	; 0
   5388                     627 _g_tiles_038:
   5388 13                  628 	.db #0x13	; 19
   5389 33                  629 	.db #0x33	; 51	'3'
   538A 13                  630 	.db #0x13	; 19
   538B 33                  631 	.db #0x33	; 51	'3'
   538C 13                  632 	.db #0x13	; 19
   538D 33                  633 	.db #0x33	; 51	'3'
   538E 02                  634 	.db #0x02	; 2
   538F 00                  635 	.db #0x00	; 0
   5390                     636 _g_tiles_039:
   5390 33                  637 	.db #0x33	; 51	'3'
   5391 22                  638 	.db #0x22	; 34
   5392 33                  639 	.db #0x33	; 51	'3'
   5393 22                  640 	.db #0x22	; 34
   5394 33                  641 	.db #0x33	; 51	'3'
   5395 22                  642 	.db #0x22	; 34
   5396 00                  643 	.db #0x00	; 0
   5397 00                  644 	.db #0x00	; 0
   5398                     645 _g_tiles_040:
   5398 00                  646 	.db #0x00	; 0
   5399 00                  647 	.db #0x00	; 0
   539A 05                  648 	.db #0x05	; 5
   539B 0F                  649 	.db #0x0f	; 15
   539C 05                  650 	.db #0x05	; 5
   539D CF                  651 	.db #0xcf	; 207
   539E 05                  652 	.db #0x05	; 5
   539F 9E                  653 	.db #0x9e	; 158
   53A0                     654 _g_tiles_041:
   53A0 00                  655 	.db #0x00	; 0
   53A1 00                  656 	.db #0x00	; 0
   53A2 0F                  657 	.db #0x0f	; 15
   53A3 0F                  658 	.db #0x0f	; 15
   53A4 CF                  659 	.db #0xcf	; 207
   53A5 CF                  660 	.db #0xcf	; 207
   53A6 3C                  661 	.db #0x3c	; 60
   53A7 3C                  662 	.db #0x3c	; 60
   53A8                     663 _g_tiles_042:
   53A8 00                  664 	.db #0x00	; 0
   53A9 00                  665 	.db #0x00	; 0
   53AA 0F                  666 	.db #0x0f	; 15
   53AB 0F                  667 	.db #0x0f	; 15
   53AC CF                  668 	.db #0xcf	; 207
   53AD CF                  669 	.db #0xcf	; 207
   53AE 3C                  670 	.db #0x3c	; 60
   53AF 3C                  671 	.db #0x3c	; 60
   53B0                     672 _g_tiles_043:
   53B0 00                  673 	.db #0x00	; 0
   53B1 00                  674 	.db #0x00	; 0
   53B2 0F                  675 	.db #0x0f	; 15
   53B3 0F                  676 	.db #0x0f	; 15
   53B4 CF                  677 	.db #0xcf	; 207
   53B5 CF                  678 	.db #0xcf	; 207
   53B6 3C                  679 	.db #0x3c	; 60
   53B7 3C                  680 	.db #0x3c	; 60
   53B8                     681 _g_tiles_044:
   53B8 00                  682 	.db #0x00	; 0
   53B9 00                  683 	.db #0x00	; 0
   53BA 0F                  684 	.db #0x0f	; 15
   53BB 0A                  685 	.db #0x0a	; 10
   53BC CF                  686 	.db #0xcf	; 207
   53BD 0A                  687 	.db #0x0a	; 10
   53BE 6D                  688 	.db #0x6d	; 109	'm'
   53BF 0A                  689 	.db #0x0a	; 10
   53C0                     690 _g_tiles_045:
   53C0 05                  691 	.db #0x05	; 5
   53C1 9E                  692 	.db #0x9e	; 158
   53C2 05                  693 	.db #0x05	; 5
   53C3 9E                  694 	.db #0x9e	; 158
   53C4 05                  695 	.db #0x05	; 5
   53C5 9E                  696 	.db #0x9e	; 158
   53C6 05                  697 	.db #0x05	; 5
   53C7 9E                  698 	.db #0x9e	; 158
   53C8                     699 _g_tiles_046:
   53C8 6D                  700 	.db #0x6d	; 109	'm'
   53C9 0A                  701 	.db #0x0a	; 10
   53CA 6D                  702 	.db #0x6d	; 109	'm'
   53CB 0A                  703 	.db #0x0a	; 10
   53CC 6D                  704 	.db #0x6d	; 109	'm'
   53CD 0A                  705 	.db #0x0a	; 10
   53CE 6D                  706 	.db #0x6d	; 109	'm'
   53CF 0A                  707 	.db #0x0a	; 10
   53D0                     708 _g_tiles_047:
   53D0 00                  709 	.db #0x00	; 0
   53D1 00                  710 	.db #0x00	; 0
   53D2 00                  711 	.db #0x00	; 0
   53D3 00                  712 	.db #0x00	; 0
   53D4 00                  713 	.db #0x00	; 0
   53D5 00                  714 	.db #0x00	; 0
   53D6 00                  715 	.db #0x00	; 0
   53D7 00                  716 	.db #0x00	; 0
   53D8                     717 _g_tiles_048:
   53D8 00                  718 	.db #0x00	; 0
   53D9 00                  719 	.db #0x00	; 0
   53DA 00                  720 	.db #0x00	; 0
   53DB 00                  721 	.db #0x00	; 0
   53DC 00                  722 	.db #0x00	; 0
   53DD 00                  723 	.db #0x00	; 0
   53DE 00                  724 	.db #0x00	; 0
   53DF 00                  725 	.db #0x00	; 0
   53E0                     726 _g_tiles_049:
   53E0 2D                  727 	.db #0x2d	; 45
   53E1 2D                  728 	.db #0x2d	; 45
   53E2 0F                  729 	.db #0x0f	; 15
   53E3 2D                  730 	.db #0x2d	; 45
   53E4 3C                  731 	.db #0x3c	; 60
   53E5 1E                  732 	.db #0x1e	; 30
   53E6 0F                  733 	.db #0x0f	; 15
   53E7 1E                  734 	.db #0x1e	; 30
   53E8                     735 _g_tiles_050:
   53E8 0F                  736 	.db #0x0f	; 15
   53E9 0F                  737 	.db #0x0f	; 15
   53EA 3C                  738 	.db #0x3c	; 60
   53EB 3C                  739 	.db #0x3c	; 60
   53EC 0F                  740 	.db #0x0f	; 15
   53ED 0F                  741 	.db #0x0f	; 15
   53EE 1E                  742 	.db #0x1e	; 30
   53EF 2D                  743 	.db #0x2d	; 45
   53F0                     744 _g_tiles_051:
   53F0 1E                  745 	.db #0x1e	; 30
   53F1 1E                  746 	.db #0x1e	; 30
   53F2 1E                  747 	.db #0x1e	; 30
   53F3 0F                  748 	.db #0x0f	; 15
   53F4 2D                  749 	.db #0x2d	; 45
   53F5 3C                  750 	.db #0x3c	; 60
   53F6 2D                  751 	.db #0x2d	; 45
   53F7 0F                  752 	.db #0x0f	; 15
   53F8                     753 _g_tiles_052:
   53F8 F0                  754 	.db #0xf0	; 240
   53F9 F0                  755 	.db #0xf0	; 240
   53FA F1                  756 	.db #0xf1	; 241
   53FB F3                  757 	.db #0xf3	; 243
   53FC F0                  758 	.db #0xf0	; 240
   53FD F0                  759 	.db #0xf0	; 240
   53FE F3                  760 	.db #0xf3	; 243
   53FF F3                  761 	.db #0xf3	; 243
   5400                     762 _g_tiles_053:
   5400 F0                  763 	.db #0xf0	; 240
   5401 F2                  764 	.db #0xf2	; 242
   5402 F2                  765 	.db #0xf2	; 242
   5403 F2                  766 	.db #0xf2	; 242
   5404 F0                  767 	.db #0xf0	; 240
   5405 F2                  768 	.db #0xf2	; 242
   5406 F3                  769 	.db #0xf3	; 243
   5407 F2                  770 	.db #0xf2	; 242
   5408                     771 _g_tiles_054:
   5408 F3                  772 	.db #0xf3	; 243
   5409 F0                  773 	.db #0xf0	; 240
   540A F3                  774 	.db #0xf3	; 243
   540B F1                  775 	.db #0xf1	; 241
   540C F3                  776 	.db #0xf3	; 243
   540D F1                  777 	.db #0xf1	; 241
   540E F3                  778 	.db #0xf3	; 243
   540F F1                  779 	.db #0xf1	; 241
   5410                     780 _g_tiles_055:
   5410 00                  781 	.db #0x00	; 0
   5411 00                  782 	.db #0x00	; 0
   5412 00                  783 	.db #0x00	; 0
   5413 00                  784 	.db #0x00	; 0
   5414 00                  785 	.db #0x00	; 0
   5415 00                  786 	.db #0x00	; 0
   5416 00                  787 	.db #0x00	; 0
   5417 00                  788 	.db #0x00	; 0
   5418                     789 _g_tiles_056:
   5418 00                  790 	.db #0x00	; 0
   5419 00                  791 	.db #0x00	; 0
   541A 00                  792 	.db #0x00	; 0
   541B 00                  793 	.db #0x00	; 0
   541C 00                  794 	.db #0x00	; 0
   541D 00                  795 	.db #0x00	; 0
   541E 00                  796 	.db #0x00	; 0
   541F 00                  797 	.db #0x00	; 0
   5420                     798 _g_tiles_057:
   5420 00                  799 	.db #0x00	; 0
   5421 00                  800 	.db #0x00	; 0
   5422 00                  801 	.db #0x00	; 0
   5423 00                  802 	.db #0x00	; 0
   5424 00                  803 	.db #0x00	; 0
   5425 00                  804 	.db #0x00	; 0
   5426 00                  805 	.db #0x00	; 0
   5427 00                  806 	.db #0x00	; 0
   5428                     807 _g_tiles_058:
   5428 00                  808 	.db #0x00	; 0
   5429 00                  809 	.db #0x00	; 0
   542A 00                  810 	.db #0x00	; 0
   542B 00                  811 	.db #0x00	; 0
   542C 00                  812 	.db #0x00	; 0
   542D 00                  813 	.db #0x00	; 0
   542E 00                  814 	.db #0x00	; 0
   542F 00                  815 	.db #0x00	; 0
   5430                     816 _g_tiles_059:
   5430 00                  817 	.db #0x00	; 0
   5431 00                  818 	.db #0x00	; 0
   5432 00                  819 	.db #0x00	; 0
   5433 00                  820 	.db #0x00	; 0
   5434 00                  821 	.db #0x00	; 0
   5435 00                  822 	.db #0x00	; 0
   5436 00                  823 	.db #0x00	; 0
   5437 00                  824 	.db #0x00	; 0
   5438                     825 _g_tiles_060:
   5438 05                  826 	.db #0x05	; 5
   5439 9E                  827 	.db #0x9e	; 158
   543A 05                  828 	.db #0x05	; 5
   543B 9E                  829 	.db #0x9e	; 158
   543C 05                  830 	.db #0x05	; 5
   543D 9E                  831 	.db #0x9e	; 158
   543E 05                  832 	.db #0x05	; 5
   543F 9E                  833 	.db #0x9e	; 158
   5440                     834 _g_tiles_061:
   5440 3C                  835 	.db #0x3c	; 60
   5441 3C                  836 	.db #0x3c	; 60
   5442 6D                  837 	.db #0x6d	; 109	'm'
   5443 CF                  838 	.db #0xcf	; 207
   5444 6D                  839 	.db #0x6d	; 109	'm'
   5445 0F                  840 	.db #0x0f	; 15
   5446 6D                  841 	.db #0x6d	; 109	'm'
   5447 0A                  842 	.db #0x0a	; 10
   5448                     843 _g_tiles_062:
   5448 3C                  844 	.db #0x3c	; 60
   5449 3C                  845 	.db #0x3c	; 60
   544A CF                  846 	.db #0xcf	; 207
   544B CF                  847 	.db #0xcf	; 207
   544C 0F                  848 	.db #0x0f	; 15
   544D 0F                  849 	.db #0x0f	; 15
   544E 00                  850 	.db #0x00	; 0
   544F 00                  851 	.db #0x00	; 0
   5450                     852 _g_tiles_063:
   5450 3C                  853 	.db #0x3c	; 60
   5451 3C                  854 	.db #0x3c	; 60
   5452 CF                  855 	.db #0xcf	; 207
   5453 9E                  856 	.db #0x9e	; 158
   5454 0F                  857 	.db #0x0f	; 15
   5455 9E                  858 	.db #0x9e	; 158
   5456 05                  859 	.db #0x05	; 5
   5457 9E                  860 	.db #0x9e	; 158
   5458                     861 _g_tiles_064:
   5458 6D                  862 	.db #0x6d	; 109	'm'
   5459 0A                  863 	.db #0x0a	; 10
   545A 6D                  864 	.db #0x6d	; 109	'm'
   545B 0A                  865 	.db #0x0a	; 10
   545C 6D                  866 	.db #0x6d	; 109	'm'
   545D 0A                  867 	.db #0x0a	; 10
   545E 6D                  868 	.db #0x6d	; 109	'm'
   545F 0A                  869 	.db #0x0a	; 10
   5460                     870 _g_tiles_065:
   5460 05                  871 	.db #0x05	; 5
   5461 9E                  872 	.db #0x9e	; 158
   5462 05                  873 	.db #0x05	; 5
   5463 CF                  874 	.db #0xcf	; 207
   5464 05                  875 	.db #0x05	; 5
   5465 0F                  876 	.db #0x0f	; 15
   5466 00                  877 	.db #0x00	; 0
   5467 00                  878 	.db #0x00	; 0
   5468                     879 _g_tiles_066:
   5468 6D                  880 	.db #0x6d	; 109	'm'
   5469 0A                  881 	.db #0x0a	; 10
   546A CF                  882 	.db #0xcf	; 207
   546B 0A                  883 	.db #0x0a	; 10
   546C 0F                  884 	.db #0x0f	; 15
   546D 0A                  885 	.db #0x0a	; 10
   546E 00                  886 	.db #0x00	; 0
   546F 00                  887 	.db #0x00	; 0
   5470                     888 _g_tiles_067:
   5470 00                  889 	.db #0x00	; 0
   5471 00                  890 	.db #0x00	; 0
   5472 00                  891 	.db #0x00	; 0
   5473 00                  892 	.db #0x00	; 0
   5474 00                  893 	.db #0x00	; 0
   5475 00                  894 	.db #0x00	; 0
   5476 00                  895 	.db #0x00	; 0
   5477 00                  896 	.db #0x00	; 0
   5478                     897 _g_tiles_068:
   5478 00                  898 	.db #0x00	; 0
   5479 00                  899 	.db #0x00	; 0
   547A 00                  900 	.db #0x00	; 0
   547B 00                  901 	.db #0x00	; 0
   547C 00                  902 	.db #0x00	; 0
   547D 00                  903 	.db #0x00	; 0
   547E 00                  904 	.db #0x00	; 0
   547F 00                  905 	.db #0x00	; 0
   5480                     906 _g_tiles_069:
   5480 0F                  907 	.db #0x0f	; 15
   5481 1E                  908 	.db #0x1e	; 30
   5482 3C                  909 	.db #0x3c	; 60
   5483 1E                  910 	.db #0x1e	; 30
   5484 0F                  911 	.db #0x0f	; 15
   5485 2D                  912 	.db #0x2d	; 45
   5486 2D                  913 	.db #0x2d	; 45
   5487 2D                  914 	.db #0x2d	; 45
   5488                     915 _g_tiles_070:
   5488 1E                  916 	.db #0x1e	; 30
   5489 2D                  917 	.db #0x2d	; 45
   548A 0F                  918 	.db #0x0f	; 15
   548B 0F                  919 	.db #0x0f	; 15
   548C 3C                  920 	.db #0x3c	; 60
   548D 3C                  921 	.db #0x3c	; 60
   548E 0F                  922 	.db #0x0f	; 15
   548F 0F                  923 	.db #0x0f	; 15
   5490                     924 _g_tiles_071:
   5490 2D                  925 	.db #0x2d	; 45
   5491 0F                  926 	.db #0x0f	; 15
   5492 2D                  927 	.db #0x2d	; 45
   5493 3C                  928 	.db #0x3c	; 60
   5494 1E                  929 	.db #0x1e	; 30
   5495 0F                  930 	.db #0x0f	; 15
   5496 1E                  931 	.db #0x1e	; 30
   5497 1E                  932 	.db #0x1e	; 30
   5498                     933 _g_tiles_072:
   5498 F0                  934 	.db #0xf0	; 240
   5499 F3                  935 	.db #0xf3	; 243
   549A F2                  936 	.db #0xf2	; 242
   549B F3                  937 	.db #0xf3	; 243
   549C F2                  938 	.db #0xf2	; 242
   549D F3                  939 	.db #0xf3	; 243
   549E F0                  940 	.db #0xf0	; 240
   549F F3                  941 	.db #0xf3	; 243
   54A0                     942 _g_tiles_073:
   54A0 F0                  943 	.db #0xf0	; 240
   54A1 F0                  944 	.db #0xf0	; 240
   54A2 F1                  945 	.db #0xf1	; 241
   54A3 F3                  946 	.db #0xf3	; 243
   54A4 F1                  947 	.db #0xf1	; 241
   54A5 F3                  948 	.db #0xf3	; 243
   54A6 F1                  949 	.db #0xf1	; 241
   54A7 F2                  950 	.db #0xf2	; 242
   54A8                     951 _g_tiles_074:
   54A8 F3                  952 	.db #0xf3	; 243
   54A9 F0                  953 	.db #0xf0	; 240
   54AA F3                  954 	.db #0xf3	; 243
   54AB F3                  955 	.db #0xf3	; 243
   54AC F3                  956 	.db #0xf3	; 243
   54AD F3                  957 	.db #0xf3	; 243
   54AE F0                  958 	.db #0xf0	; 240
   54AF F0                  959 	.db #0xf0	; 240
   54B0                     960 _g_tiles_075:
   54B0 00                  961 	.db #0x00	; 0
   54B1 00                  962 	.db #0x00	; 0
   54B2 00                  963 	.db #0x00	; 0
   54B3 00                  964 	.db #0x00	; 0
   54B4 00                  965 	.db #0x00	; 0
   54B5 00                  966 	.db #0x00	; 0
   54B6 00                  967 	.db #0x00	; 0
   54B7 00                  968 	.db #0x00	; 0
   54B8                     969 _g_tiles_076:
   54B8 00                  970 	.db #0x00	; 0
   54B9 00                  971 	.db #0x00	; 0
   54BA 00                  972 	.db #0x00	; 0
   54BB 00                  973 	.db #0x00	; 0
   54BC 00                  974 	.db #0x00	; 0
   54BD 00                  975 	.db #0x00	; 0
   54BE 00                  976 	.db #0x00	; 0
   54BF 00                  977 	.db #0x00	; 0
   54C0                     978 _g_tiles_077:
   54C0 00                  979 	.db #0x00	; 0
   54C1 00                  980 	.db #0x00	; 0
   54C2 00                  981 	.db #0x00	; 0
   54C3 00                  982 	.db #0x00	; 0
   54C4 00                  983 	.db #0x00	; 0
   54C5 00                  984 	.db #0x00	; 0
   54C6 00                  985 	.db #0x00	; 0
   54C7 00                  986 	.db #0x00	; 0
   54C8                     987 _g_tiles_078:
   54C8 00                  988 	.db #0x00	; 0
   54C9 00                  989 	.db #0x00	; 0
   54CA 00                  990 	.db #0x00	; 0
   54CB 00                  991 	.db #0x00	; 0
   54CC 00                  992 	.db #0x00	; 0
   54CD 00                  993 	.db #0x00	; 0
   54CE 00                  994 	.db #0x00	; 0
   54CF 00                  995 	.db #0x00	; 0
   54D0                     996 _g_tiles_079:
   54D0 00                  997 	.db #0x00	; 0
   54D1 00                  998 	.db #0x00	; 0
   54D2 00                  999 	.db #0x00	; 0
   54D3 00                 1000 	.db #0x00	; 0
   54D4 00                 1001 	.db #0x00	; 0
   54D5 00                 1002 	.db #0x00	; 0
   54D6 00                 1003 	.db #0x00	; 0
   54D7 00                 1004 	.db #0x00	; 0
   54D8                    1005 _g_tiles_080:
   54D8 00                 1006 	.db #0x00	; 0
   54D9 00                 1007 	.db #0x00	; 0
   54DA 00                 1008 	.db #0x00	; 0
   54DB 00                 1009 	.db #0x00	; 0
   54DC 00                 1010 	.db #0x00	; 0
   54DD 00                 1011 	.db #0x00	; 0
   54DE 00                 1012 	.db #0x00	; 0
   54DF 00                 1013 	.db #0x00	; 0
   54E0                    1014 _g_tiles_081:
   54E0 00                 1015 	.db #0x00	; 0
   54E1 00                 1016 	.db #0x00	; 0
   54E2 00                 1017 	.db #0x00	; 0
   54E3 00                 1018 	.db #0x00	; 0
   54E4 00                 1019 	.db #0x00	; 0
   54E5 00                 1020 	.db #0x00	; 0
   54E6 00                 1021 	.db #0x00	; 0
   54E7 00                 1022 	.db #0x00	; 0
   54E8                    1023 _g_tiles_082:
   54E8 00                 1024 	.db #0x00	; 0
   54E9 00                 1025 	.db #0x00	; 0
   54EA 00                 1026 	.db #0x00	; 0
   54EB 00                 1027 	.db #0x00	; 0
   54EC 00                 1028 	.db #0x00	; 0
   54ED 00                 1029 	.db #0x00	; 0
   54EE 00                 1030 	.db #0x00	; 0
   54EF 00                 1031 	.db #0x00	; 0
   54F0                    1032 _g_tiles_083:
   54F0 00                 1033 	.db #0x00	; 0
   54F1 00                 1034 	.db #0x00	; 0
   54F2 00                 1035 	.db #0x00	; 0
   54F3 00                 1036 	.db #0x00	; 0
   54F4 00                 1037 	.db #0x00	; 0
   54F5 00                 1038 	.db #0x00	; 0
   54F6 00                 1039 	.db #0x00	; 0
   54F7 00                 1040 	.db #0x00	; 0
   54F8                    1041 _g_tiles_084:
   54F8 00                 1042 	.db #0x00	; 0
   54F9 00                 1043 	.db #0x00	; 0
   54FA 00                 1044 	.db #0x00	; 0
   54FB 00                 1045 	.db #0x00	; 0
   54FC 00                 1046 	.db #0x00	; 0
   54FD 00                 1047 	.db #0x00	; 0
   54FE 00                 1048 	.db #0x00	; 0
   54FF 00                 1049 	.db #0x00	; 0
   5500                    1050 _g_tiles_085:
   5500 00                 1051 	.db #0x00	; 0
   5501 00                 1052 	.db #0x00	; 0
   5502 00                 1053 	.db #0x00	; 0
   5503 00                 1054 	.db #0x00	; 0
   5504 00                 1055 	.db #0x00	; 0
   5505 00                 1056 	.db #0x00	; 0
   5506 00                 1057 	.db #0x00	; 0
   5507 00                 1058 	.db #0x00	; 0
   5508                    1059 _g_tiles_086:
   5508 00                 1060 	.db #0x00	; 0
   5509 00                 1061 	.db #0x00	; 0
   550A 00                 1062 	.db #0x00	; 0
   550B 00                 1063 	.db #0x00	; 0
   550C 00                 1064 	.db #0x00	; 0
   550D 00                 1065 	.db #0x00	; 0
   550E 00                 1066 	.db #0x00	; 0
   550F 00                 1067 	.db #0x00	; 0
   5510                    1068 _g_tiles_087:
   5510 00                 1069 	.db #0x00	; 0
   5511 00                 1070 	.db #0x00	; 0
   5512 00                 1071 	.db #0x00	; 0
   5513 00                 1072 	.db #0x00	; 0
   5514 00                 1073 	.db #0x00	; 0
   5515 00                 1074 	.db #0x00	; 0
   5516 00                 1075 	.db #0x00	; 0
   5517 00                 1076 	.db #0x00	; 0
   5518                    1077 _g_tiles_088:
   5518 00                 1078 	.db #0x00	; 0
   5519 00                 1079 	.db #0x00	; 0
   551A 00                 1080 	.db #0x00	; 0
   551B 00                 1081 	.db #0x00	; 0
   551C 00                 1082 	.db #0x00	; 0
   551D 00                 1083 	.db #0x00	; 0
   551E 00                 1084 	.db #0x00	; 0
   551F 00                 1085 	.db #0x00	; 0
   5520                    1086 _g_tiles_089:
   5520 00                 1087 	.db #0x00	; 0
   5521 00                 1088 	.db #0x00	; 0
   5522 00                 1089 	.db #0x00	; 0
   5523 00                 1090 	.db #0x00	; 0
   5524 00                 1091 	.db #0x00	; 0
   5525 00                 1092 	.db #0x00	; 0
   5526 00                 1093 	.db #0x00	; 0
   5527 00                 1094 	.db #0x00	; 0
   5528                    1095 _g_tiles_090:
   5528 00                 1096 	.db #0x00	; 0
   5529 00                 1097 	.db #0x00	; 0
   552A 00                 1098 	.db #0x00	; 0
   552B 00                 1099 	.db #0x00	; 0
   552C 00                 1100 	.db #0x00	; 0
   552D 00                 1101 	.db #0x00	; 0
   552E 00                 1102 	.db #0x00	; 0
   552F 00                 1103 	.db #0x00	; 0
   5530                    1104 _g_tiles_091:
   5530 00                 1105 	.db #0x00	; 0
   5531 00                 1106 	.db #0x00	; 0
   5532 00                 1107 	.db #0x00	; 0
   5533 00                 1108 	.db #0x00	; 0
   5534 00                 1109 	.db #0x00	; 0
   5535 00                 1110 	.db #0x00	; 0
   5536 00                 1111 	.db #0x00	; 0
   5537 00                 1112 	.db #0x00	; 0
   5538                    1113 _g_tiles_092:
   5538 00                 1114 	.db #0x00	; 0
   5539 00                 1115 	.db #0x00	; 0
   553A 00                 1116 	.db #0x00	; 0
   553B 00                 1117 	.db #0x00	; 0
   553C 00                 1118 	.db #0x00	; 0
   553D 00                 1119 	.db #0x00	; 0
   553E 00                 1120 	.db #0x00	; 0
   553F 00                 1121 	.db #0x00	; 0
   5540                    1122 _g_tiles_093:
   5540 00                 1123 	.db #0x00	; 0
   5541 00                 1124 	.db #0x00	; 0
   5542 00                 1125 	.db #0x00	; 0
   5543 00                 1126 	.db #0x00	; 0
   5544 00                 1127 	.db #0x00	; 0
   5545 00                 1128 	.db #0x00	; 0
   5546 00                 1129 	.db #0x00	; 0
   5547 00                 1130 	.db #0x00	; 0
   5548                    1131 _g_tiles_094:
   5548 00                 1132 	.db #0x00	; 0
   5549 00                 1133 	.db #0x00	; 0
   554A 00                 1134 	.db #0x00	; 0
   554B 00                 1135 	.db #0x00	; 0
   554C 00                 1136 	.db #0x00	; 0
   554D 00                 1137 	.db #0x00	; 0
   554E 00                 1138 	.db #0x00	; 0
   554F 00                 1139 	.db #0x00	; 0
   5550                    1140 _g_tiles_095:
   5550 00                 1141 	.db #0x00	; 0
   5551 00                 1142 	.db #0x00	; 0
   5552 00                 1143 	.db #0x00	; 0
   5553 00                 1144 	.db #0x00	; 0
   5554 00                 1145 	.db #0x00	; 0
   5555 00                 1146 	.db #0x00	; 0
   5556 00                 1147 	.db #0x00	; 0
   5557 00                 1148 	.db #0x00	; 0
   5558                    1149 _g_tiles_096:
   5558 00                 1150 	.db #0x00	; 0
   5559 00                 1151 	.db #0x00	; 0
   555A 00                 1152 	.db #0x00	; 0
   555B 00                 1153 	.db #0x00	; 0
   555C 00                 1154 	.db #0x00	; 0
   555D 00                 1155 	.db #0x00	; 0
   555E 00                 1156 	.db #0x00	; 0
   555F 00                 1157 	.db #0x00	; 0
   5560                    1158 _g_tiles_097:
   5560 00                 1159 	.db #0x00	; 0
   5561 00                 1160 	.db #0x00	; 0
   5562 00                 1161 	.db #0x00	; 0
   5563 00                 1162 	.db #0x00	; 0
   5564 00                 1163 	.db #0x00	; 0
   5565 00                 1164 	.db #0x00	; 0
   5566 00                 1165 	.db #0x00	; 0
   5567 00                 1166 	.db #0x00	; 0
   5568                    1167 _g_tiles_098:
   5568 00                 1168 	.db #0x00	; 0
   5569 00                 1169 	.db #0x00	; 0
   556A 00                 1170 	.db #0x00	; 0
   556B 00                 1171 	.db #0x00	; 0
   556C 00                 1172 	.db #0x00	; 0
   556D 00                 1173 	.db #0x00	; 0
   556E 00                 1174 	.db #0x00	; 0
   556F 00                 1175 	.db #0x00	; 0
   5570                    1176 _g_tiles_099:
   5570 00                 1177 	.db #0x00	; 0
   5571 00                 1178 	.db #0x00	; 0
   5572 00                 1179 	.db #0x00	; 0
   5573 00                 1180 	.db #0x00	; 0
   5574 00                 1181 	.db #0x00	; 0
   5575 00                 1182 	.db #0x00	; 0
   5576 00                 1183 	.db #0x00	; 0
   5577 00                 1184 	.db #0x00	; 0
   5578                    1185 _g_tiles_100:
   5578 00                 1186 	.db #0x00	; 0
   5579 00                 1187 	.db #0x00	; 0
   557A 00                 1188 	.db #0x00	; 0
   557B 00                 1189 	.db #0x00	; 0
   557C 00                 1190 	.db #0x00	; 0
   557D 00                 1191 	.db #0x00	; 0
   557E 00                 1192 	.db #0x00	; 0
   557F 00                 1193 	.db #0x00	; 0
   5580                    1194 _g_tiles_101:
   5580 00                 1195 	.db #0x00	; 0
   5581 00                 1196 	.db #0x00	; 0
   5582 00                 1197 	.db #0x00	; 0
   5583 00                 1198 	.db #0x00	; 0
   5584 00                 1199 	.db #0x00	; 0
   5585 00                 1200 	.db #0x00	; 0
   5586 00                 1201 	.db #0x00	; 0
   5587 00                 1202 	.db #0x00	; 0
   5588                    1203 _g_tiles_102:
   5588 00                 1204 	.db #0x00	; 0
   5589 00                 1205 	.db #0x00	; 0
   558A 00                 1206 	.db #0x00	; 0
   558B 00                 1207 	.db #0x00	; 0
   558C 00                 1208 	.db #0x00	; 0
   558D 00                 1209 	.db #0x00	; 0
   558E 00                 1210 	.db #0x00	; 0
   558F 00                 1211 	.db #0x00	; 0
   5590                    1212 _g_tiles_103:
   5590 00                 1213 	.db #0x00	; 0
   5591 00                 1214 	.db #0x00	; 0
   5592 00                 1215 	.db #0x00	; 0
   5593 00                 1216 	.db #0x00	; 0
   5594 00                 1217 	.db #0x00	; 0
   5595 00                 1218 	.db #0x00	; 0
   5596 00                 1219 	.db #0x00	; 0
   5597 00                 1220 	.db #0x00	; 0
   5598                    1221 _g_tiles_104:
   5598 00                 1222 	.db #0x00	; 0
   5599 00                 1223 	.db #0x00	; 0
   559A 00                 1224 	.db #0x00	; 0
   559B 00                 1225 	.db #0x00	; 0
   559C 00                 1226 	.db #0x00	; 0
   559D 00                 1227 	.db #0x00	; 0
   559E 00                 1228 	.db #0x00	; 0
   559F 00                 1229 	.db #0x00	; 0
   55A0                    1230 _g_tiles_105:
   55A0 00                 1231 	.db #0x00	; 0
   55A1 00                 1232 	.db #0x00	; 0
   55A2 00                 1233 	.db #0x00	; 0
   55A3 00                 1234 	.db #0x00	; 0
   55A4 00                 1235 	.db #0x00	; 0
   55A5 00                 1236 	.db #0x00	; 0
   55A6 00                 1237 	.db #0x00	; 0
   55A7 00                 1238 	.db #0x00	; 0
   55A8                    1239 _g_tiles_106:
   55A8 00                 1240 	.db #0x00	; 0
   55A9 00                 1241 	.db #0x00	; 0
   55AA 00                 1242 	.db #0x00	; 0
   55AB 00                 1243 	.db #0x00	; 0
   55AC 00                 1244 	.db #0x00	; 0
   55AD 00                 1245 	.db #0x00	; 0
   55AE 00                 1246 	.db #0x00	; 0
   55AF 00                 1247 	.db #0x00	; 0
   55B0                    1248 _g_tiles_107:
   55B0 00                 1249 	.db #0x00	; 0
   55B1 00                 1250 	.db #0x00	; 0
   55B2 00                 1251 	.db #0x00	; 0
   55B3 00                 1252 	.db #0x00	; 0
   55B4 00                 1253 	.db #0x00	; 0
   55B5 00                 1254 	.db #0x00	; 0
   55B6 00                 1255 	.db #0x00	; 0
   55B7 00                 1256 	.db #0x00	; 0
   55B8                    1257 _g_tiles_108:
   55B8 00                 1258 	.db #0x00	; 0
   55B9 00                 1259 	.db #0x00	; 0
   55BA 00                 1260 	.db #0x00	; 0
   55BB 00                 1261 	.db #0x00	; 0
   55BC 00                 1262 	.db #0x00	; 0
   55BD 00                 1263 	.db #0x00	; 0
   55BE 00                 1264 	.db #0x00	; 0
   55BF 00                 1265 	.db #0x00	; 0
   55C0                    1266 _g_tiles_109:
   55C0 00                 1267 	.db #0x00	; 0
   55C1 00                 1268 	.db #0x00	; 0
   55C2 00                 1269 	.db #0x00	; 0
   55C3 00                 1270 	.db #0x00	; 0
   55C4 00                 1271 	.db #0x00	; 0
   55C5 00                 1272 	.db #0x00	; 0
   55C6 00                 1273 	.db #0x00	; 0
   55C7 00                 1274 	.db #0x00	; 0
   55C8                    1275 _g_tiles_110:
   55C8 00                 1276 	.db #0x00	; 0
   55C9 00                 1277 	.db #0x00	; 0
   55CA 00                 1278 	.db #0x00	; 0
   55CB 00                 1279 	.db #0x00	; 0
   55CC 00                 1280 	.db #0x00	; 0
   55CD 00                 1281 	.db #0x00	; 0
   55CE 00                 1282 	.db #0x00	; 0
   55CF 00                 1283 	.db #0x00	; 0
   55D0                    1284 _g_tiles_111:
   55D0 00                 1285 	.db #0x00	; 0
   55D1 00                 1286 	.db #0x00	; 0
   55D2 00                 1287 	.db #0x00	; 0
   55D3 00                 1288 	.db #0x00	; 0
   55D4 00                 1289 	.db #0x00	; 0
   55D5 00                 1290 	.db #0x00	; 0
   55D6 00                 1291 	.db #0x00	; 0
   55D7 00                 1292 	.db #0x00	; 0
   55D8                    1293 _g_tiles_112:
   55D8 00                 1294 	.db #0x00	; 0
   55D9 00                 1295 	.db #0x00	; 0
   55DA 00                 1296 	.db #0x00	; 0
   55DB 00                 1297 	.db #0x00	; 0
   55DC 00                 1298 	.db #0x00	; 0
   55DD 00                 1299 	.db #0x00	; 0
   55DE 00                 1300 	.db #0x00	; 0
   55DF 00                 1301 	.db #0x00	; 0
   55E0                    1302 _g_tiles_113:
   55E0 00                 1303 	.db #0x00	; 0
   55E1 00                 1304 	.db #0x00	; 0
   55E2 00                 1305 	.db #0x00	; 0
   55E3 00                 1306 	.db #0x00	; 0
   55E4 00                 1307 	.db #0x00	; 0
   55E5 00                 1308 	.db #0x00	; 0
   55E6 00                 1309 	.db #0x00	; 0
   55E7 00                 1310 	.db #0x00	; 0
   55E8                    1311 _g_tiles_114:
   55E8 00                 1312 	.db #0x00	; 0
   55E9 00                 1313 	.db #0x00	; 0
   55EA 00                 1314 	.db #0x00	; 0
   55EB 00                 1315 	.db #0x00	; 0
   55EC 00                 1316 	.db #0x00	; 0
   55ED 00                 1317 	.db #0x00	; 0
   55EE 00                 1318 	.db #0x00	; 0
   55EF 00                 1319 	.db #0x00	; 0
   55F0                    1320 _g_tiles_115:
   55F0 00                 1321 	.db #0x00	; 0
   55F1 00                 1322 	.db #0x00	; 0
   55F2 00                 1323 	.db #0x00	; 0
   55F3 00                 1324 	.db #0x00	; 0
   55F4 00                 1325 	.db #0x00	; 0
   55F5 00                 1326 	.db #0x00	; 0
   55F6 00                 1327 	.db #0x00	; 0
   55F7 00                 1328 	.db #0x00	; 0
   55F8                    1329 _g_tiles_116:
   55F8 00                 1330 	.db #0x00	; 0
   55F9 00                 1331 	.db #0x00	; 0
   55FA 00                 1332 	.db #0x00	; 0
   55FB 00                 1333 	.db #0x00	; 0
   55FC 00                 1334 	.db #0x00	; 0
   55FD 00                 1335 	.db #0x00	; 0
   55FE 00                 1336 	.db #0x00	; 0
   55FF 00                 1337 	.db #0x00	; 0
   5600                    1338 _g_tiles_117:
   5600 00                 1339 	.db #0x00	; 0
   5601 00                 1340 	.db #0x00	; 0
   5602 00                 1341 	.db #0x00	; 0
   5603 00                 1342 	.db #0x00	; 0
   5604 00                 1343 	.db #0x00	; 0
   5605 00                 1344 	.db #0x00	; 0
   5606 00                 1345 	.db #0x00	; 0
   5607 00                 1346 	.db #0x00	; 0
   5608                    1347 _g_tiles_118:
   5608 00                 1348 	.db #0x00	; 0
   5609 00                 1349 	.db #0x00	; 0
   560A 00                 1350 	.db #0x00	; 0
   560B 00                 1351 	.db #0x00	; 0
   560C 00                 1352 	.db #0x00	; 0
   560D 00                 1353 	.db #0x00	; 0
   560E 00                 1354 	.db #0x00	; 0
   560F 00                 1355 	.db #0x00	; 0
   5610                    1356 _g_tiles_119:
   5610 00                 1357 	.db #0x00	; 0
   5611 00                 1358 	.db #0x00	; 0
   5612 00                 1359 	.db #0x00	; 0
   5613 00                 1360 	.db #0x00	; 0
   5614 00                 1361 	.db #0x00	; 0
   5615 00                 1362 	.db #0x00	; 0
   5616 00                 1363 	.db #0x00	; 0
   5617 00                 1364 	.db #0x00	; 0
                           1365 	.area _INITIALIZER
                           1366 	.area _CABS (ABS)
