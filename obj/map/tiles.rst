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
   62D0                     164 _g_tileset:
   62D0 C0 63               165 	.dw _g_tiles_000
   62D2 C8 63               166 	.dw _g_tiles_001
   62D4 D0 63               167 	.dw _g_tiles_002
   62D6 D8 63               168 	.dw _g_tiles_003
   62D8 E0 63               169 	.dw _g_tiles_004
   62DA E8 63               170 	.dw _g_tiles_005
   62DC F0 63               171 	.dw _g_tiles_006
   62DE F8 63               172 	.dw _g_tiles_007
   62E0 00 64               173 	.dw _g_tiles_008
   62E2 08 64               174 	.dw _g_tiles_009
   62E4 10 64               175 	.dw _g_tiles_010
   62E6 18 64               176 	.dw _g_tiles_011
   62E8 20 64               177 	.dw _g_tiles_012
   62EA 28 64               178 	.dw _g_tiles_013
   62EC 30 64               179 	.dw _g_tiles_014
   62EE 38 64               180 	.dw _g_tiles_015
   62F0 40 64               181 	.dw _g_tiles_016
   62F2 48 64               182 	.dw _g_tiles_017
   62F4 50 64               183 	.dw _g_tiles_018
   62F6 58 64               184 	.dw _g_tiles_019
   62F8 60 64               185 	.dw _g_tiles_020
   62FA 68 64               186 	.dw _g_tiles_021
   62FC 70 64               187 	.dw _g_tiles_022
   62FE 78 64               188 	.dw _g_tiles_023
   6300 80 64               189 	.dw _g_tiles_024
   6302 88 64               190 	.dw _g_tiles_025
   6304 90 64               191 	.dw _g_tiles_026
   6306 98 64               192 	.dw _g_tiles_027
   6308 A0 64               193 	.dw _g_tiles_028
   630A A8 64               194 	.dw _g_tiles_029
   630C B0 64               195 	.dw _g_tiles_030
   630E B8 64               196 	.dw _g_tiles_031
   6310 C0 64               197 	.dw _g_tiles_032
   6312 C8 64               198 	.dw _g_tiles_033
   6314 D0 64               199 	.dw _g_tiles_034
   6316 D8 64               200 	.dw _g_tiles_035
   6318 E0 64               201 	.dw _g_tiles_036
   631A E8 64               202 	.dw _g_tiles_037
   631C F0 64               203 	.dw _g_tiles_038
   631E F8 64               204 	.dw _g_tiles_039
   6320 00 65               205 	.dw _g_tiles_040
   6322 08 65               206 	.dw _g_tiles_041
   6324 10 65               207 	.dw _g_tiles_042
   6326 18 65               208 	.dw _g_tiles_043
   6328 20 65               209 	.dw _g_tiles_044
   632A 28 65               210 	.dw _g_tiles_045
   632C 30 65               211 	.dw _g_tiles_046
   632E 38 65               212 	.dw _g_tiles_047
   6330 40 65               213 	.dw _g_tiles_048
   6332 48 65               214 	.dw _g_tiles_049
   6334 50 65               215 	.dw _g_tiles_050
   6336 58 65               216 	.dw _g_tiles_051
   6338 60 65               217 	.dw _g_tiles_052
   633A 68 65               218 	.dw _g_tiles_053
   633C 70 65               219 	.dw _g_tiles_054
   633E 78 65               220 	.dw _g_tiles_055
   6340 80 65               221 	.dw _g_tiles_056
   6342 88 65               222 	.dw _g_tiles_057
   6344 90 65               223 	.dw _g_tiles_058
   6346 98 65               224 	.dw _g_tiles_059
   6348 A0 65               225 	.dw _g_tiles_060
   634A A8 65               226 	.dw _g_tiles_061
   634C B0 65               227 	.dw _g_tiles_062
   634E B8 65               228 	.dw _g_tiles_063
   6350 C0 65               229 	.dw _g_tiles_064
   6352 C8 65               230 	.dw _g_tiles_065
   6354 D0 65               231 	.dw _g_tiles_066
   6356 D8 65               232 	.dw _g_tiles_067
   6358 E0 65               233 	.dw _g_tiles_068
   635A E8 65               234 	.dw _g_tiles_069
   635C F0 65               235 	.dw _g_tiles_070
   635E F8 65               236 	.dw _g_tiles_071
   6360 00 66               237 	.dw _g_tiles_072
   6362 08 66               238 	.dw _g_tiles_073
   6364 10 66               239 	.dw _g_tiles_074
   6366 18 66               240 	.dw _g_tiles_075
   6368 20 66               241 	.dw _g_tiles_076
   636A 28 66               242 	.dw _g_tiles_077
   636C 30 66               243 	.dw _g_tiles_078
   636E 38 66               244 	.dw _g_tiles_079
   6370 40 66               245 	.dw _g_tiles_080
   6372 48 66               246 	.dw _g_tiles_081
   6374 50 66               247 	.dw _g_tiles_082
   6376 58 66               248 	.dw _g_tiles_083
   6378 60 66               249 	.dw _g_tiles_084
   637A 68 66               250 	.dw _g_tiles_085
   637C 70 66               251 	.dw _g_tiles_086
   637E 78 66               252 	.dw _g_tiles_087
   6380 80 66               253 	.dw _g_tiles_088
   6382 88 66               254 	.dw _g_tiles_089
   6384 90 66               255 	.dw _g_tiles_090
   6386 98 66               256 	.dw _g_tiles_091
   6388 A0 66               257 	.dw _g_tiles_092
   638A A8 66               258 	.dw _g_tiles_093
   638C B0 66               259 	.dw _g_tiles_094
   638E B8 66               260 	.dw _g_tiles_095
   6390 C0 66               261 	.dw _g_tiles_096
   6392 C8 66               262 	.dw _g_tiles_097
   6394 D0 66               263 	.dw _g_tiles_098
   6396 D8 66               264 	.dw _g_tiles_099
   6398 E0 66               265 	.dw _g_tiles_100
   639A E8 66               266 	.dw _g_tiles_101
   639C F0 66               267 	.dw _g_tiles_102
   639E F8 66               268 	.dw _g_tiles_103
   63A0 00 67               269 	.dw _g_tiles_104
   63A2 08 67               270 	.dw _g_tiles_105
   63A4 10 67               271 	.dw _g_tiles_106
   63A6 18 67               272 	.dw _g_tiles_107
   63A8 20 67               273 	.dw _g_tiles_108
   63AA 28 67               274 	.dw _g_tiles_109
   63AC 30 67               275 	.dw _g_tiles_110
   63AE 38 67               276 	.dw _g_tiles_111
   63B0 40 67               277 	.dw _g_tiles_112
   63B2 48 67               278 	.dw _g_tiles_113
   63B4 50 67               279 	.dw _g_tiles_114
   63B6 58 67               280 	.dw _g_tiles_115
   63B8 60 67               281 	.dw _g_tiles_116
   63BA 68 67               282 	.dw _g_tiles_117
   63BC 70 67               283 	.dw _g_tiles_118
   63BE 78 67               284 	.dw _g_tiles_119
   63C0                     285 _g_tiles_000:
   63C0 C0                  286 	.db #0xc0	; 192
   63C1 C0                  287 	.db #0xc0	; 192
   63C2 C0                  288 	.db #0xc0	; 192
   63C3 C0                  289 	.db #0xc0	; 192
   63C4 C0                  290 	.db #0xc0	; 192
   63C5 C0                  291 	.db #0xc0	; 192
   63C6 C0                  292 	.db #0xc0	; 192
   63C7 C0                  293 	.db #0xc0	; 192
   63C8                     294 _g_tiles_001:
   63C8 C0                  295 	.db #0xc0	; 192
   63C9 80                  296 	.db #0x80	; 128
   63CA C0                  297 	.db #0xc0	; 192
   63CB 80                  298 	.db #0x80	; 128
   63CC C0                  299 	.db #0xc0	; 192
   63CD 80                  300 	.db #0x80	; 128
   63CE C0                  301 	.db #0xc0	; 192
   63CF 80                  302 	.db #0x80	; 128
   63D0                     303 _g_tiles_002:
   63D0 0C                  304 	.db #0x0c	; 12
   63D1 0C                  305 	.db #0x0c	; 12
   63D2 0C                  306 	.db #0x0c	; 12
   63D3 0C                  307 	.db #0x0c	; 12
   63D4 0C                  308 	.db #0x0c	; 12
   63D5 0C                  309 	.db #0x0c	; 12
   63D6 0C                  310 	.db #0x0c	; 12
   63D7 0C                  311 	.db #0x0c	; 12
   63D8                     312 _g_tiles_003:
   63D8 0C                  313 	.db #0x0c	; 12
   63D9 08                  314 	.db #0x08	; 8
   63DA 0C                  315 	.db #0x0c	; 12
   63DB 08                  316 	.db #0x08	; 8
   63DC 0C                  317 	.db #0x0c	; 12
   63DD 08                  318 	.db #0x08	; 8
   63DE 0C                  319 	.db #0x0c	; 12
   63DF 08                  320 	.db #0x08	; 8
   63E0                     321 _g_tiles_004:
   63E0 CC                  322 	.db #0xcc	; 204
   63E1 CC                  323 	.db #0xcc	; 204
   63E2 CC                  324 	.db #0xcc	; 204
   63E3 CC                  325 	.db #0xcc	; 204
   63E4 CC                  326 	.db #0xcc	; 204
   63E5 CC                  327 	.db #0xcc	; 204
   63E6 CC                  328 	.db #0xcc	; 204
   63E7 CC                  329 	.db #0xcc	; 204
   63E8                     330 _g_tiles_005:
   63E8 CC                  331 	.db #0xcc	; 204
   63E9 88                  332 	.db #0x88	; 136
   63EA CC                  333 	.db #0xcc	; 204
   63EB 88                  334 	.db #0x88	; 136
   63EC CC                  335 	.db #0xcc	; 204
   63ED 88                  336 	.db #0x88	; 136
   63EE CC                  337 	.db #0xcc	; 204
   63EF 88                  338 	.db #0x88	; 136
   63F0                     339 _g_tiles_006:
   63F0 30                  340 	.db #0x30	; 48	'0'
   63F1 30                  341 	.db #0x30	; 48	'0'
   63F2 30                  342 	.db #0x30	; 48	'0'
   63F3 30                  343 	.db #0x30	; 48	'0'
   63F4 30                  344 	.db #0x30	; 48	'0'
   63F5 30                  345 	.db #0x30	; 48	'0'
   63F6 30                  346 	.db #0x30	; 48	'0'
   63F7 30                  347 	.db #0x30	; 48	'0'
   63F8                     348 _g_tiles_007:
   63F8 30                  349 	.db #0x30	; 48	'0'
   63F9 20                  350 	.db #0x20	; 32
   63FA 30                  351 	.db #0x30	; 48	'0'
   63FB 20                  352 	.db #0x20	; 32
   63FC 30                  353 	.db #0x30	; 48	'0'
   63FD 20                  354 	.db #0x20	; 32
   63FE 30                  355 	.db #0x30	; 48	'0'
   63FF 20                  356 	.db #0x20	; 32
   6400                     357 _g_tiles_008:
   6400 F0                  358 	.db #0xf0	; 240
   6401 F0                  359 	.db #0xf0	; 240
   6402 F0                  360 	.db #0xf0	; 240
   6403 F0                  361 	.db #0xf0	; 240
   6404 F0                  362 	.db #0xf0	; 240
   6405 F0                  363 	.db #0xf0	; 240
   6406 F0                  364 	.db #0xf0	; 240
   6407 F0                  365 	.db #0xf0	; 240
   6408                     366 _g_tiles_009:
   6408 F0                  367 	.db #0xf0	; 240
   6409 A0                  368 	.db #0xa0	; 160
   640A F0                  369 	.db #0xf0	; 240
   640B A0                  370 	.db #0xa0	; 160
   640C F0                  371 	.db #0xf0	; 240
   640D A0                  372 	.db #0xa0	; 160
   640E F0                  373 	.db #0xf0	; 240
   640F A0                  374 	.db #0xa0	; 160
   6410                     375 _g_tiles_010:
   6410 3C                  376 	.db #0x3c	; 60
   6411 3C                  377 	.db #0x3c	; 60
   6412 3C                  378 	.db #0x3c	; 60
   6413 3C                  379 	.db #0x3c	; 60
   6414 3C                  380 	.db #0x3c	; 60
   6415 3C                  381 	.db #0x3c	; 60
   6416 3C                  382 	.db #0x3c	; 60
   6417 3C                  383 	.db #0x3c	; 60
   6418                     384 _g_tiles_011:
   6418 3C                  385 	.db #0x3c	; 60
   6419 28                  386 	.db #0x28	; 40
   641A 3C                  387 	.db #0x3c	; 60
   641B 28                  388 	.db #0x28	; 40
   641C 3C                  389 	.db #0x3c	; 60
   641D 28                  390 	.db #0x28	; 40
   641E 3C                  391 	.db #0x3c	; 60
   641F 28                  392 	.db #0x28	; 40
   6420                     393 _g_tiles_012:
   6420 FC                  394 	.db #0xfc	; 252
   6421 FC                  395 	.db #0xfc	; 252
   6422 FC                  396 	.db #0xfc	; 252
   6423 FC                  397 	.db #0xfc	; 252
   6424 FC                  398 	.db #0xfc	; 252
   6425 FC                  399 	.db #0xfc	; 252
   6426 FC                  400 	.db #0xfc	; 252
   6427 FC                  401 	.db #0xfc	; 252
   6428                     402 _g_tiles_013:
   6428 FC                  403 	.db #0xfc	; 252
   6429 A8                  404 	.db #0xa8	; 168
   642A FC                  405 	.db #0xfc	; 252
   642B A8                  406 	.db #0xa8	; 168
   642C FC                  407 	.db #0xfc	; 252
   642D A8                  408 	.db #0xa8	; 168
   642E FC                  409 	.db #0xfc	; 252
   642F A8                  410 	.db #0xa8	; 168
   6430                     411 _g_tiles_014:
   6430 03                  412 	.db #0x03	; 3
   6431 03                  413 	.db #0x03	; 3
   6432 03                  414 	.db #0x03	; 3
   6433 03                  415 	.db #0x03	; 3
   6434 03                  416 	.db #0x03	; 3
   6435 03                  417 	.db #0x03	; 3
   6436 03                  418 	.db #0x03	; 3
   6437 03                  419 	.db #0x03	; 3
   6438                     420 _g_tiles_015:
   6438 03                  421 	.db #0x03	; 3
   6439 02                  422 	.db #0x02	; 2
   643A 03                  423 	.db #0x03	; 3
   643B 02                  424 	.db #0x02	; 2
   643C 03                  425 	.db #0x03	; 3
   643D 02                  426 	.db #0x02	; 2
   643E 03                  427 	.db #0x03	; 3
   643F 02                  428 	.db #0x02	; 2
   6440                     429 _g_tiles_016:
   6440 C0                  430 	.db #0xc0	; 192
   6441 C0                  431 	.db #0xc0	; 192
   6442 C1                  432 	.db #0xc1	; 193
   6443 C3                  433 	.db #0xc3	; 195
   6444 C1                  434 	.db #0xc1	; 193
   6445 C3                  435 	.db #0xc3	; 195
   6446 C1                  436 	.db #0xc1	; 193
   6447 C3                  437 	.db #0xc3	; 195
   6448                     438 _g_tiles_017:
   6448 C0                  439 	.db #0xc0	; 192
   6449 80                  440 	.db #0x80	; 128
   644A C3                  441 	.db #0xc3	; 195
   644B 82                  442 	.db #0x82	; 130
   644C C3                  443 	.db #0xc3	; 195
   644D 82                  444 	.db #0x82	; 130
   644E C3                  445 	.db #0xc3	; 195
   644F 82                  446 	.db #0x82	; 130
   6450                     447 _g_tiles_018:
   6450 03                  448 	.db #0x03	; 3
   6451 03                  449 	.db #0x03	; 3
   6452 13                  450 	.db #0x13	; 19
   6453 33                  451 	.db #0x33	; 51	'3'
   6454 13                  452 	.db #0x13	; 19
   6455 33                  453 	.db #0x33	; 51	'3'
   6456 13                  454 	.db #0x13	; 19
   6457 33                  455 	.db #0x33	; 51	'3'
   6458                     456 _g_tiles_019:
   6458 03                  457 	.db #0x03	; 3
   6459 02                  458 	.db #0x02	; 2
   645A 33                  459 	.db #0x33	; 51	'3'
   645B 22                  460 	.db #0x22	; 34
   645C 33                  461 	.db #0x33	; 51	'3'
   645D 22                  462 	.db #0x22	; 34
   645E 33                  463 	.db #0x33	; 51	'3'
   645F 22                  464 	.db #0x22	; 34
   6460                     465 _g_tiles_020:
   6460 C0                  466 	.db #0xc0	; 192
   6461 C0                  467 	.db #0xc0	; 192
   6462 C0                  468 	.db #0xc0	; 192
   6463 C0                  469 	.db #0xc0	; 192
   6464 C0                  470 	.db #0xc0	; 192
   6465 C0                  471 	.db #0xc0	; 192
   6466 00                  472 	.db #0x00	; 0
   6467 00                  473 	.db #0x00	; 0
   6468                     474 _g_tiles_021:
   6468 C0                  475 	.db #0xc0	; 192
   6469 80                  476 	.db #0x80	; 128
   646A C0                  477 	.db #0xc0	; 192
   646B 80                  478 	.db #0x80	; 128
   646C C0                  479 	.db #0xc0	; 192
   646D 80                  480 	.db #0x80	; 128
   646E 00                  481 	.db #0x00	; 0
   646F 00                  482 	.db #0x00	; 0
   6470                     483 _g_tiles_022:
   6470 0C                  484 	.db #0x0c	; 12
   6471 0C                  485 	.db #0x0c	; 12
   6472 0C                  486 	.db #0x0c	; 12
   6473 0C                  487 	.db #0x0c	; 12
   6474 0C                  488 	.db #0x0c	; 12
   6475 0C                  489 	.db #0x0c	; 12
   6476 00                  490 	.db #0x00	; 0
   6477 00                  491 	.db #0x00	; 0
   6478                     492 _g_tiles_023:
   6478 0C                  493 	.db #0x0c	; 12
   6479 08                  494 	.db #0x08	; 8
   647A 0C                  495 	.db #0x0c	; 12
   647B 08                  496 	.db #0x08	; 8
   647C 0C                  497 	.db #0x0c	; 12
   647D 08                  498 	.db #0x08	; 8
   647E 00                  499 	.db #0x00	; 0
   647F 00                  500 	.db #0x00	; 0
   6480                     501 _g_tiles_024:
   6480 CC                  502 	.db #0xcc	; 204
   6481 CC                  503 	.db #0xcc	; 204
   6482 CC                  504 	.db #0xcc	; 204
   6483 CC                  505 	.db #0xcc	; 204
   6484 CC                  506 	.db #0xcc	; 204
   6485 CC                  507 	.db #0xcc	; 204
   6486 00                  508 	.db #0x00	; 0
   6487 00                  509 	.db #0x00	; 0
   6488                     510 _g_tiles_025:
   6488 CC                  511 	.db #0xcc	; 204
   6489 88                  512 	.db #0x88	; 136
   648A CC                  513 	.db #0xcc	; 204
   648B 88                  514 	.db #0x88	; 136
   648C CC                  515 	.db #0xcc	; 204
   648D 88                  516 	.db #0x88	; 136
   648E 00                  517 	.db #0x00	; 0
   648F 00                  518 	.db #0x00	; 0
   6490                     519 _g_tiles_026:
   6490 30                  520 	.db #0x30	; 48	'0'
   6491 30                  521 	.db #0x30	; 48	'0'
   6492 30                  522 	.db #0x30	; 48	'0'
   6493 30                  523 	.db #0x30	; 48	'0'
   6494 30                  524 	.db #0x30	; 48	'0'
   6495 30                  525 	.db #0x30	; 48	'0'
   6496 00                  526 	.db #0x00	; 0
   6497 00                  527 	.db #0x00	; 0
   6498                     528 _g_tiles_027:
   6498 30                  529 	.db #0x30	; 48	'0'
   6499 20                  530 	.db #0x20	; 32
   649A 30                  531 	.db #0x30	; 48	'0'
   649B 20                  532 	.db #0x20	; 32
   649C 30                  533 	.db #0x30	; 48	'0'
   649D 20                  534 	.db #0x20	; 32
   649E 00                  535 	.db #0x00	; 0
   649F 00                  536 	.db #0x00	; 0
   64A0                     537 _g_tiles_028:
   64A0 F0                  538 	.db #0xf0	; 240
   64A1 F0                  539 	.db #0xf0	; 240
   64A2 F0                  540 	.db #0xf0	; 240
   64A3 F0                  541 	.db #0xf0	; 240
   64A4 F0                  542 	.db #0xf0	; 240
   64A5 F0                  543 	.db #0xf0	; 240
   64A6 00                  544 	.db #0x00	; 0
   64A7 00                  545 	.db #0x00	; 0
   64A8                     546 _g_tiles_029:
   64A8 F0                  547 	.db #0xf0	; 240
   64A9 A0                  548 	.db #0xa0	; 160
   64AA F0                  549 	.db #0xf0	; 240
   64AB A0                  550 	.db #0xa0	; 160
   64AC F0                  551 	.db #0xf0	; 240
   64AD A0                  552 	.db #0xa0	; 160
   64AE 00                  553 	.db #0x00	; 0
   64AF 00                  554 	.db #0x00	; 0
   64B0                     555 _g_tiles_030:
   64B0 3C                  556 	.db #0x3c	; 60
   64B1 3C                  557 	.db #0x3c	; 60
   64B2 3C                  558 	.db #0x3c	; 60
   64B3 3C                  559 	.db #0x3c	; 60
   64B4 3C                  560 	.db #0x3c	; 60
   64B5 3C                  561 	.db #0x3c	; 60
   64B6 00                  562 	.db #0x00	; 0
   64B7 00                  563 	.db #0x00	; 0
   64B8                     564 _g_tiles_031:
   64B8 3C                  565 	.db #0x3c	; 60
   64B9 28                  566 	.db #0x28	; 40
   64BA 3C                  567 	.db #0x3c	; 60
   64BB 28                  568 	.db #0x28	; 40
   64BC 3C                  569 	.db #0x3c	; 60
   64BD 28                  570 	.db #0x28	; 40
   64BE 00                  571 	.db #0x00	; 0
   64BF 00                  572 	.db #0x00	; 0
   64C0                     573 _g_tiles_032:
   64C0 FC                  574 	.db #0xfc	; 252
   64C1 FC                  575 	.db #0xfc	; 252
   64C2 FC                  576 	.db #0xfc	; 252
   64C3 FC                  577 	.db #0xfc	; 252
   64C4 FC                  578 	.db #0xfc	; 252
   64C5 FC                  579 	.db #0xfc	; 252
   64C6 00                  580 	.db #0x00	; 0
   64C7 00                  581 	.db #0x00	; 0
   64C8                     582 _g_tiles_033:
   64C8 FC                  583 	.db #0xfc	; 252
   64C9 A8                  584 	.db #0xa8	; 168
   64CA FC                  585 	.db #0xfc	; 252
   64CB A8                  586 	.db #0xa8	; 168
   64CC FC                  587 	.db #0xfc	; 252
   64CD A8                  588 	.db #0xa8	; 168
   64CE 00                  589 	.db #0x00	; 0
   64CF 00                  590 	.db #0x00	; 0
   64D0                     591 _g_tiles_034:
   64D0 03                  592 	.db #0x03	; 3
   64D1 03                  593 	.db #0x03	; 3
   64D2 03                  594 	.db #0x03	; 3
   64D3 03                  595 	.db #0x03	; 3
   64D4 03                  596 	.db #0x03	; 3
   64D5 03                  597 	.db #0x03	; 3
   64D6 00                  598 	.db #0x00	; 0
   64D7 00                  599 	.db #0x00	; 0
   64D8                     600 _g_tiles_035:
   64D8 03                  601 	.db #0x03	; 3
   64D9 02                  602 	.db #0x02	; 2
   64DA 03                  603 	.db #0x03	; 3
   64DB 02                  604 	.db #0x02	; 2
   64DC 03                  605 	.db #0x03	; 3
   64DD 02                  606 	.db #0x02	; 2
   64DE 00                  607 	.db #0x00	; 0
   64DF 00                  608 	.db #0x00	; 0
   64E0                     609 _g_tiles_036:
   64E0 C1                  610 	.db #0xc1	; 193
   64E1 C3                  611 	.db #0xc3	; 195
   64E2 C1                  612 	.db #0xc1	; 193
   64E3 C3                  613 	.db #0xc3	; 195
   64E4 C1                  614 	.db #0xc1	; 193
   64E5 C3                  615 	.db #0xc3	; 195
   64E6 00                  616 	.db #0x00	; 0
   64E7 00                  617 	.db #0x00	; 0
   64E8                     618 _g_tiles_037:
   64E8 C3                  619 	.db #0xc3	; 195
   64E9 82                  620 	.db #0x82	; 130
   64EA C3                  621 	.db #0xc3	; 195
   64EB 82                  622 	.db #0x82	; 130
   64EC C3                  623 	.db #0xc3	; 195
   64ED 82                  624 	.db #0x82	; 130
   64EE 00                  625 	.db #0x00	; 0
   64EF 00                  626 	.db #0x00	; 0
   64F0                     627 _g_tiles_038:
   64F0 13                  628 	.db #0x13	; 19
   64F1 33                  629 	.db #0x33	; 51	'3'
   64F2 13                  630 	.db #0x13	; 19
   64F3 33                  631 	.db #0x33	; 51	'3'
   64F4 13                  632 	.db #0x13	; 19
   64F5 33                  633 	.db #0x33	; 51	'3'
   64F6 00                  634 	.db #0x00	; 0
   64F7 00                  635 	.db #0x00	; 0
   64F8                     636 _g_tiles_039:
   64F8 33                  637 	.db #0x33	; 51	'3'
   64F9 22                  638 	.db #0x22	; 34
   64FA 33                  639 	.db #0x33	; 51	'3'
   64FB 22                  640 	.db #0x22	; 34
   64FC 33                  641 	.db #0x33	; 51	'3'
   64FD 22                  642 	.db #0x22	; 34
   64FE 00                  643 	.db #0x00	; 0
   64FF 00                  644 	.db #0x00	; 0
   6500                     645 _g_tiles_040:
   6500 00                  646 	.db #0x00	; 0
   6501 00                  647 	.db #0x00	; 0
   6502 05                  648 	.db #0x05	; 5
   6503 0F                  649 	.db #0x0f	; 15
   6504 05                  650 	.db #0x05	; 5
   6505 CF                  651 	.db #0xcf	; 207
   6506 05                  652 	.db #0x05	; 5
   6507 9E                  653 	.db #0x9e	; 158
   6508                     654 _g_tiles_041:
   6508 00                  655 	.db #0x00	; 0
   6509 00                  656 	.db #0x00	; 0
   650A 0F                  657 	.db #0x0f	; 15
   650B 0F                  658 	.db #0x0f	; 15
   650C CF                  659 	.db #0xcf	; 207
   650D CF                  660 	.db #0xcf	; 207
   650E 3C                  661 	.db #0x3c	; 60
   650F 3C                  662 	.db #0x3c	; 60
   6510                     663 _g_tiles_042:
   6510 00                  664 	.db #0x00	; 0
   6511 00                  665 	.db #0x00	; 0
   6512 0F                  666 	.db #0x0f	; 15
   6513 0F                  667 	.db #0x0f	; 15
   6514 CF                  668 	.db #0xcf	; 207
   6515 CF                  669 	.db #0xcf	; 207
   6516 3C                  670 	.db #0x3c	; 60
   6517 3C                  671 	.db #0x3c	; 60
   6518                     672 _g_tiles_043:
   6518 00                  673 	.db #0x00	; 0
   6519 00                  674 	.db #0x00	; 0
   651A 0F                  675 	.db #0x0f	; 15
   651B 0F                  676 	.db #0x0f	; 15
   651C CF                  677 	.db #0xcf	; 207
   651D CF                  678 	.db #0xcf	; 207
   651E 3C                  679 	.db #0x3c	; 60
   651F 3C                  680 	.db #0x3c	; 60
   6520                     681 _g_tiles_044:
   6520 00                  682 	.db #0x00	; 0
   6521 00                  683 	.db #0x00	; 0
   6522 0F                  684 	.db #0x0f	; 15
   6523 0A                  685 	.db #0x0a	; 10
   6524 CF                  686 	.db #0xcf	; 207
   6525 0A                  687 	.db #0x0a	; 10
   6526 6D                  688 	.db #0x6d	; 109	'm'
   6527 0A                  689 	.db #0x0a	; 10
   6528                     690 _g_tiles_045:
   6528 05                  691 	.db #0x05	; 5
   6529 9E                  692 	.db #0x9e	; 158
   652A 05                  693 	.db #0x05	; 5
   652B 9E                  694 	.db #0x9e	; 158
   652C 05                  695 	.db #0x05	; 5
   652D 9E                  696 	.db #0x9e	; 158
   652E 05                  697 	.db #0x05	; 5
   652F 9E                  698 	.db #0x9e	; 158
   6530                     699 _g_tiles_046:
   6530 6D                  700 	.db #0x6d	; 109	'm'
   6531 0A                  701 	.db #0x0a	; 10
   6532 6D                  702 	.db #0x6d	; 109	'm'
   6533 0A                  703 	.db #0x0a	; 10
   6534 6D                  704 	.db #0x6d	; 109	'm'
   6535 0A                  705 	.db #0x0a	; 10
   6536 6D                  706 	.db #0x6d	; 109	'm'
   6537 0A                  707 	.db #0x0a	; 10
   6538                     708 _g_tiles_047:
   6538 4F                  709 	.db #0x4f	; 79	'O'
   6539 68                  710 	.db #0x68	; 104	'h'
   653A 05                  711 	.db #0x05	; 5
   653B C0                  712 	.db #0xc0	; 192
   653C 4F                  713 	.db #0x4f	; 79	'O'
   653D 68                  714 	.db #0x68	; 104	'h'
   653E 4F                  715 	.db #0x4f	; 79	'O'
   653F 68                  716 	.db #0x68	; 104	'h'
   6540                     717 _g_tiles_048:
   6540 94                  718 	.db #0x94	; 148
   6541 8F                  719 	.db #0x8f	; 143
   6542 3C                  720 	.db #0x3c	; 60
   6543 8F                  721 	.db #0x8f	; 143
   6544 3C                  722 	.db #0x3c	; 60
   6545 8F                  723 	.db #0x8f	; 143
   6546 3C                  724 	.db #0x3c	; 60
   6547 8F                  725 	.db #0x8f	; 143
   6548                     726 _g_tiles_049:
   6548 2D                  727 	.db #0x2d	; 45
   6549 2D                  728 	.db #0x2d	; 45
   654A 0F                  729 	.db #0x0f	; 15
   654B 2D                  730 	.db #0x2d	; 45
   654C 3C                  731 	.db #0x3c	; 60
   654D 1E                  732 	.db #0x1e	; 30
   654E 0F                  733 	.db #0x0f	; 15
   654F 1E                  734 	.db #0x1e	; 30
   6550                     735 _g_tiles_050:
   6550 0F                  736 	.db #0x0f	; 15
   6551 0F                  737 	.db #0x0f	; 15
   6552 3C                  738 	.db #0x3c	; 60
   6553 3C                  739 	.db #0x3c	; 60
   6554 0F                  740 	.db #0x0f	; 15
   6555 0F                  741 	.db #0x0f	; 15
   6556 1E                  742 	.db #0x1e	; 30
   6557 2D                  743 	.db #0x2d	; 45
   6558                     744 _g_tiles_051:
   6558 1E                  745 	.db #0x1e	; 30
   6559 1E                  746 	.db #0x1e	; 30
   655A 1E                  747 	.db #0x1e	; 30
   655B 0F                  748 	.db #0x0f	; 15
   655C 2D                  749 	.db #0x2d	; 45
   655D 3C                  750 	.db #0x3c	; 60
   655E 2D                  751 	.db #0x2d	; 45
   655F 0F                  752 	.db #0x0f	; 15
   6560                     753 _g_tiles_052:
   6560 F0                  754 	.db #0xf0	; 240
   6561 F0                  755 	.db #0xf0	; 240
   6562 F1                  756 	.db #0xf1	; 241
   6563 F3                  757 	.db #0xf3	; 243
   6564 F0                  758 	.db #0xf0	; 240
   6565 F0                  759 	.db #0xf0	; 240
   6566 F3                  760 	.db #0xf3	; 243
   6567 F3                  761 	.db #0xf3	; 243
   6568                     762 _g_tiles_053:
   6568 F0                  763 	.db #0xf0	; 240
   6569 F2                  764 	.db #0xf2	; 242
   656A F2                  765 	.db #0xf2	; 242
   656B F2                  766 	.db #0xf2	; 242
   656C F0                  767 	.db #0xf0	; 240
   656D F2                  768 	.db #0xf2	; 242
   656E F3                  769 	.db #0xf3	; 243
   656F F2                  770 	.db #0xf2	; 242
   6570                     771 _g_tiles_054:
   6570 F3                  772 	.db #0xf3	; 243
   6571 F0                  773 	.db #0xf0	; 240
   6572 F3                  774 	.db #0xf3	; 243
   6573 F1                  775 	.db #0xf1	; 241
   6574 F3                  776 	.db #0xf3	; 243
   6575 F1                  777 	.db #0xf1	; 241
   6576 F3                  778 	.db #0xf3	; 243
   6577 F1                  779 	.db #0xf1	; 241
   6578                     780 _g_tiles_055:
   6578 CF                  781 	.db #0xcf	; 207
   6579 9E                  782 	.db #0x9e	; 158
   657A 6D                  783 	.db #0x6d	; 109	'm'
   657B 9E                  784 	.db #0x9e	; 158
   657C 9E                  785 	.db #0x9e	; 158
   657D CF                  786 	.db #0xcf	; 207
   657E CF                  787 	.db #0xcf	; 207
   657F 6D                  788 	.db #0x6d	; 109	'm'
   6580                     789 _g_tiles_056:
   6580 CF                  790 	.db #0xcf	; 207
   6581 CF                  791 	.db #0xcf	; 207
   6582 CF                  792 	.db #0xcf	; 207
   6583 CF                  793 	.db #0xcf	; 207
   6584 3C                  794 	.db #0x3c	; 60
   6585 3C                  795 	.db #0x3c	; 60
   6586 6D                  796 	.db #0x6d	; 109	'm'
   6587 9E                  797 	.db #0x9e	; 158
   6588                     798 _g_tiles_057:
   6588 6D                  799 	.db #0x6d	; 109	'm'
   6589 CF                  800 	.db #0xcf	; 207
   658A 6D                  801 	.db #0x6d	; 109	'm'
   658B 9E                  802 	.db #0x9e	; 158
   658C CF                  803 	.db #0xcf	; 207
   658D 6D                  804 	.db #0x6d	; 109	'm'
   658E 9E                  805 	.db #0x9e	; 158
   658F CF                  806 	.db #0xcf	; 207
   6590                     807 _g_tiles_058:
   6590 00                  808 	.db #0x00	; 0
   6591 00                  809 	.db #0x00	; 0
   6592 00                  810 	.db #0x00	; 0
   6593 00                  811 	.db #0x00	; 0
   6594 00                  812 	.db #0x00	; 0
   6595 00                  813 	.db #0x00	; 0
   6596 00                  814 	.db #0x00	; 0
   6597 00                  815 	.db #0x00	; 0
   6598                     816 _g_tiles_059:
   6598 00                  817 	.db #0x00	; 0
   6599 00                  818 	.db #0x00	; 0
   659A 00                  819 	.db #0x00	; 0
   659B 00                  820 	.db #0x00	; 0
   659C 00                  821 	.db #0x00	; 0
   659D 00                  822 	.db #0x00	; 0
   659E 00                  823 	.db #0x00	; 0
   659F 00                  824 	.db #0x00	; 0
   65A0                     825 _g_tiles_060:
   65A0 05                  826 	.db #0x05	; 5
   65A1 9E                  827 	.db #0x9e	; 158
   65A2 05                  828 	.db #0x05	; 5
   65A3 9E                  829 	.db #0x9e	; 158
   65A4 05                  830 	.db #0x05	; 5
   65A5 9E                  831 	.db #0x9e	; 158
   65A6 05                  832 	.db #0x05	; 5
   65A7 9E                  833 	.db #0x9e	; 158
   65A8                     834 _g_tiles_061:
   65A8 3C                  835 	.db #0x3c	; 60
   65A9 3C                  836 	.db #0x3c	; 60
   65AA 6D                  837 	.db #0x6d	; 109	'm'
   65AB CF                  838 	.db #0xcf	; 207
   65AC 6D                  839 	.db #0x6d	; 109	'm'
   65AD 0F                  840 	.db #0x0f	; 15
   65AE 6D                  841 	.db #0x6d	; 109	'm'
   65AF 0A                  842 	.db #0x0a	; 10
   65B0                     843 _g_tiles_062:
   65B0 3C                  844 	.db #0x3c	; 60
   65B1 3C                  845 	.db #0x3c	; 60
   65B2 CF                  846 	.db #0xcf	; 207
   65B3 CF                  847 	.db #0xcf	; 207
   65B4 0F                  848 	.db #0x0f	; 15
   65B5 0F                  849 	.db #0x0f	; 15
   65B6 00                  850 	.db #0x00	; 0
   65B7 00                  851 	.db #0x00	; 0
   65B8                     852 _g_tiles_063:
   65B8 3C                  853 	.db #0x3c	; 60
   65B9 3C                  854 	.db #0x3c	; 60
   65BA CF                  855 	.db #0xcf	; 207
   65BB 9E                  856 	.db #0x9e	; 158
   65BC 0F                  857 	.db #0x0f	; 15
   65BD 9E                  858 	.db #0x9e	; 158
   65BE 05                  859 	.db #0x05	; 5
   65BF 9E                  860 	.db #0x9e	; 158
   65C0                     861 _g_tiles_064:
   65C0 6D                  862 	.db #0x6d	; 109	'm'
   65C1 0A                  863 	.db #0x0a	; 10
   65C2 6D                  864 	.db #0x6d	; 109	'm'
   65C3 0A                  865 	.db #0x0a	; 10
   65C4 6D                  866 	.db #0x6d	; 109	'm'
   65C5 0A                  867 	.db #0x0a	; 10
   65C6 6D                  868 	.db #0x6d	; 109	'm'
   65C7 0A                  869 	.db #0x0a	; 10
   65C8                     870 _g_tiles_065:
   65C8 05                  871 	.db #0x05	; 5
   65C9 9E                  872 	.db #0x9e	; 158
   65CA 05                  873 	.db #0x05	; 5
   65CB CF                  874 	.db #0xcf	; 207
   65CC 05                  875 	.db #0x05	; 5
   65CD 0F                  876 	.db #0x0f	; 15
   65CE 00                  877 	.db #0x00	; 0
   65CF 00                  878 	.db #0x00	; 0
   65D0                     879 _g_tiles_066:
   65D0 6D                  880 	.db #0x6d	; 109	'm'
   65D1 0A                  881 	.db #0x0a	; 10
   65D2 CF                  882 	.db #0xcf	; 207
   65D3 0A                  883 	.db #0x0a	; 10
   65D4 0F                  884 	.db #0x0f	; 15
   65D5 0A                  885 	.db #0x0a	; 10
   65D6 00                  886 	.db #0x00	; 0
   65D7 00                  887 	.db #0x00	; 0
   65D8                     888 _g_tiles_067:
   65D8 4F                  889 	.db #0x4f	; 79	'O'
   65D9 68                  890 	.db #0x68	; 104	'h'
   65DA 05                  891 	.db #0x05	; 5
   65DB 0F                  892 	.db #0x0f	; 15
   65DC 4F                  893 	.db #0x4f	; 79	'O'
   65DD 68                  894 	.db #0x68	; 104	'h'
   65DE 05                  895 	.db #0x05	; 5
   65DF 0F                  896 	.db #0x0f	; 15
   65E0                     897 _g_tiles_068:
   65E0 3C                  898 	.db #0x3c	; 60
   65E1 8F                  899 	.db #0x8f	; 143
   65E2 CF                  900 	.db #0xcf	; 207
   65E3 8F                  901 	.db #0x8f	; 143
   65E4 3C                  902 	.db #0x3c	; 60
   65E5 8F                  903 	.db #0x8f	; 143
   65E6 CF                  904 	.db #0xcf	; 207
   65E7 8F                  905 	.db #0x8f	; 143
   65E8                     906 _g_tiles_069:
   65E8 0F                  907 	.db #0x0f	; 15
   65E9 1E                  908 	.db #0x1e	; 30
   65EA 3C                  909 	.db #0x3c	; 60
   65EB 1E                  910 	.db #0x1e	; 30
   65EC 0F                  911 	.db #0x0f	; 15
   65ED 2D                  912 	.db #0x2d	; 45
   65EE 2D                  913 	.db #0x2d	; 45
   65EF 2D                  914 	.db #0x2d	; 45
   65F0                     915 _g_tiles_070:
   65F0 1E                  916 	.db #0x1e	; 30
   65F1 2D                  917 	.db #0x2d	; 45
   65F2 0F                  918 	.db #0x0f	; 15
   65F3 0F                  919 	.db #0x0f	; 15
   65F4 3C                  920 	.db #0x3c	; 60
   65F5 3C                  921 	.db #0x3c	; 60
   65F6 0F                  922 	.db #0x0f	; 15
   65F7 0F                  923 	.db #0x0f	; 15
   65F8                     924 _g_tiles_071:
   65F8 2D                  925 	.db #0x2d	; 45
   65F9 0F                  926 	.db #0x0f	; 15
   65FA 2D                  927 	.db #0x2d	; 45
   65FB 3C                  928 	.db #0x3c	; 60
   65FC 1E                  929 	.db #0x1e	; 30
   65FD 0F                  930 	.db #0x0f	; 15
   65FE 1E                  931 	.db #0x1e	; 30
   65FF 1E                  932 	.db #0x1e	; 30
   6600                     933 _g_tiles_072:
   6600 F0                  934 	.db #0xf0	; 240
   6601 F3                  935 	.db #0xf3	; 243
   6602 F2                  936 	.db #0xf2	; 242
   6603 F3                  937 	.db #0xf3	; 243
   6604 F2                  938 	.db #0xf2	; 242
   6605 F3                  939 	.db #0xf3	; 243
   6606 F0                  940 	.db #0xf0	; 240
   6607 F3                  941 	.db #0xf3	; 243
   6608                     942 _g_tiles_073:
   6608 F0                  943 	.db #0xf0	; 240
   6609 F0                  944 	.db #0xf0	; 240
   660A F1                  945 	.db #0xf1	; 241
   660B F3                  946 	.db #0xf3	; 243
   660C F1                  947 	.db #0xf1	; 241
   660D F3                  948 	.db #0xf3	; 243
   660E F1                  949 	.db #0xf1	; 241
   660F F2                  950 	.db #0xf2	; 242
   6610                     951 _g_tiles_074:
   6610 F3                  952 	.db #0xf3	; 243
   6611 F0                  953 	.db #0xf0	; 240
   6612 F3                  954 	.db #0xf3	; 243
   6613 F3                  955 	.db #0xf3	; 243
   6614 F3                  956 	.db #0xf3	; 243
   6615 F3                  957 	.db #0xf3	; 243
   6616 F0                  958 	.db #0xf0	; 240
   6617 F0                  959 	.db #0xf0	; 240
   6618                     960 _g_tiles_075:
   6618 CF                  961 	.db #0xcf	; 207
   6619 6D                  962 	.db #0x6d	; 109	'm'
   661A 9E                  963 	.db #0x9e	; 158
   661B CF                  964 	.db #0xcf	; 207
   661C 6D                  965 	.db #0x6d	; 109	'm'
   661D 9E                  966 	.db #0x9e	; 158
   661E CF                  967 	.db #0xcf	; 207
   661F 9E                  968 	.db #0x9e	; 158
   6620                     969 _g_tiles_076:
   6620 6D                  970 	.db #0x6d	; 109	'm'
   6621 9E                  971 	.db #0x9e	; 158
   6622 3C                  972 	.db #0x3c	; 60
   6623 3C                  973 	.db #0x3c	; 60
   6624 CF                  974 	.db #0xcf	; 207
   6625 CF                  975 	.db #0xcf	; 207
   6626 CF                  976 	.db #0xcf	; 207
   6627 CF                  977 	.db #0xcf	; 207
   6628                     978 _g_tiles_077:
   6628 9E                  979 	.db #0x9e	; 158
   6629 CF                  980 	.db #0xcf	; 207
   662A CF                  981 	.db #0xcf	; 207
   662B 6D                  982 	.db #0x6d	; 109	'm'
   662C 6D                  983 	.db #0x6d	; 109	'm'
   662D 9E                  984 	.db #0x9e	; 158
   662E 6D                  985 	.db #0x6d	; 109	'm'
   662F CF                  986 	.db #0xcf	; 207
   6630                     987 _g_tiles_078:
   6630 00                  988 	.db #0x00	; 0
   6631 00                  989 	.db #0x00	; 0
   6632 00                  990 	.db #0x00	; 0
   6633 00                  991 	.db #0x00	; 0
   6634 00                  992 	.db #0x00	; 0
   6635 00                  993 	.db #0x00	; 0
   6636 00                  994 	.db #0x00	; 0
   6637 00                  995 	.db #0x00	; 0
   6638                     996 _g_tiles_079:
   6638 00                  997 	.db #0x00	; 0
   6639 00                  998 	.db #0x00	; 0
   663A 00                  999 	.db #0x00	; 0
   663B 00                 1000 	.db #0x00	; 0
   663C 00                 1001 	.db #0x00	; 0
   663D 00                 1002 	.db #0x00	; 0
   663E 00                 1003 	.db #0x00	; 0
   663F 00                 1004 	.db #0x00	; 0
   6640                    1005 _g_tiles_080:
   6640 00                 1006 	.db #0x00	; 0
   6641 00                 1007 	.db #0x00	; 0
   6642 00                 1008 	.db #0x00	; 0
   6643 00                 1009 	.db #0x00	; 0
   6644 00                 1010 	.db #0x00	; 0
   6645 00                 1011 	.db #0x00	; 0
   6646 00                 1012 	.db #0x00	; 0
   6647 00                 1013 	.db #0x00	; 0
   6648                    1014 _g_tiles_081:
   6648 00                 1015 	.db #0x00	; 0
   6649 00                 1016 	.db #0x00	; 0
   664A 00                 1017 	.db #0x00	; 0
   664B 00                 1018 	.db #0x00	; 0
   664C 00                 1019 	.db #0x00	; 0
   664D 00                 1020 	.db #0x00	; 0
   664E 00                 1021 	.db #0x00	; 0
   664F 00                 1022 	.db #0x00	; 0
   6650                    1023 _g_tiles_082:
   6650 00                 1024 	.db #0x00	; 0
   6651 00                 1025 	.db #0x00	; 0
   6652 00                 1026 	.db #0x00	; 0
   6653 00                 1027 	.db #0x00	; 0
   6654 00                 1028 	.db #0x00	; 0
   6655 00                 1029 	.db #0x00	; 0
   6656 00                 1030 	.db #0x00	; 0
   6657 00                 1031 	.db #0x00	; 0
   6658                    1032 _g_tiles_083:
   6658 00                 1033 	.db #0x00	; 0
   6659 00                 1034 	.db #0x00	; 0
   665A 00                 1035 	.db #0x00	; 0
   665B 00                 1036 	.db #0x00	; 0
   665C 00                 1037 	.db #0x00	; 0
   665D 00                 1038 	.db #0x00	; 0
   665E 00                 1039 	.db #0x00	; 0
   665F 00                 1040 	.db #0x00	; 0
   6660                    1041 _g_tiles_084:
   6660 00                 1042 	.db #0x00	; 0
   6661 00                 1043 	.db #0x00	; 0
   6662 00                 1044 	.db #0x00	; 0
   6663 00                 1045 	.db #0x00	; 0
   6664 00                 1046 	.db #0x00	; 0
   6665 00                 1047 	.db #0x00	; 0
   6666 00                 1048 	.db #0x00	; 0
   6667 00                 1049 	.db #0x00	; 0
   6668                    1050 _g_tiles_085:
   6668 0F                 1051 	.db #0x0f	; 15
   6669 0F                 1052 	.db #0x0f	; 15
   666A CF                 1053 	.db #0xcf	; 207
   666B CF                 1054 	.db #0xcf	; 207
   666C 3C                 1055 	.db #0x3c	; 60
   666D 3C                 1056 	.db #0x3c	; 60
   666E 94                 1057 	.db #0x94	; 148
   666F 3C                 1058 	.db #0x3c	; 60
   6670                    1059 _g_tiles_086:
   6670 0F                 1060 	.db #0x0f	; 15
   6671 0F                 1061 	.db #0x0f	; 15
   6672 CF                 1062 	.db #0xcf	; 207
   6673 CF                 1063 	.db #0xcf	; 207
   6674 9E                 1064 	.db #0x9e	; 158
   6675 CF                 1065 	.db #0xcf	; 207
   6676 9E                 1066 	.db #0x9e	; 158
   6677 28                 1067 	.db #0x28	; 40
   6678                    1068 _g_tiles_087:
   6678 4F                 1069 	.db #0x4f	; 79	'O'
   6679 68                 1070 	.db #0x68	; 104	'h'
   667A 05                 1071 	.db #0x05	; 5
   667B 0F                 1072 	.db #0x0f	; 15
   667C 4F                 1073 	.db #0x4f	; 79	'O'
   667D 68                 1074 	.db #0x68	; 104	'h'
   667E 4F                 1075 	.db #0x4f	; 79	'O'
   667F 68                 1076 	.db #0x68	; 104	'h'
   6680                    1077 _g_tiles_088:
   6680 3C                 1078 	.db #0x3c	; 60
   6681 8F                 1079 	.db #0x8f	; 143
   6682 CF                 1080 	.db #0xcf	; 207
   6683 8F                 1081 	.db #0x8f	; 143
   6684 3C                 1082 	.db #0x3c	; 60
   6685 8F                 1083 	.db #0x8f	; 143
   6686 3C                 1084 	.db #0x3c	; 60
   6687 8F                 1085 	.db #0x8f	; 143
   6688                    1086 _g_tiles_089:
   6688 00                 1087 	.db #0x00	; 0
   6689 00                 1088 	.db #0x00	; 0
   668A 00                 1089 	.db #0x00	; 0
   668B 00                 1090 	.db #0x00	; 0
   668C 00                 1091 	.db #0x00	; 0
   668D 00                 1092 	.db #0x00	; 0
   668E 00                 1093 	.db #0x00	; 0
   668F 00                 1094 	.db #0x00	; 0
   6690                    1095 _g_tiles_090:
   6690 00                 1096 	.db #0x00	; 0
   6691 00                 1097 	.db #0x00	; 0
   6692 00                 1098 	.db #0x00	; 0
   6693 00                 1099 	.db #0x00	; 0
   6694 00                 1100 	.db #0x00	; 0
   6695 00                 1101 	.db #0x00	; 0
   6696 00                 1102 	.db #0x00	; 0
   6697 00                 1103 	.db #0x00	; 0
   6698                    1104 _g_tiles_091:
   6698 00                 1105 	.db #0x00	; 0
   6699 00                 1106 	.db #0x00	; 0
   669A 00                 1107 	.db #0x00	; 0
   669B 00                 1108 	.db #0x00	; 0
   669C 00                 1109 	.db #0x00	; 0
   669D 00                 1110 	.db #0x00	; 0
   669E 00                 1111 	.db #0x00	; 0
   669F 00                 1112 	.db #0x00	; 0
   66A0                    1113 _g_tiles_092:
   66A0 00                 1114 	.db #0x00	; 0
   66A1 00                 1115 	.db #0x00	; 0
   66A2 00                 1116 	.db #0x00	; 0
   66A3 00                 1117 	.db #0x00	; 0
   66A4 00                 1118 	.db #0x00	; 0
   66A5 00                 1119 	.db #0x00	; 0
   66A6 00                 1120 	.db #0x00	; 0
   66A7 00                 1121 	.db #0x00	; 0
   66A8                    1122 _g_tiles_093:
   66A8 00                 1123 	.db #0x00	; 0
   66A9 00                 1124 	.db #0x00	; 0
   66AA 00                 1125 	.db #0x00	; 0
   66AB 00                 1126 	.db #0x00	; 0
   66AC 00                 1127 	.db #0x00	; 0
   66AD 00                 1128 	.db #0x00	; 0
   66AE 00                 1129 	.db #0x00	; 0
   66AF 00                 1130 	.db #0x00	; 0
   66B0                    1131 _g_tiles_094:
   66B0 00                 1132 	.db #0x00	; 0
   66B1 00                 1133 	.db #0x00	; 0
   66B2 00                 1134 	.db #0x00	; 0
   66B3 00                 1135 	.db #0x00	; 0
   66B4 00                 1136 	.db #0x00	; 0
   66B5 00                 1137 	.db #0x00	; 0
   66B6 00                 1138 	.db #0x00	; 0
   66B7 00                 1139 	.db #0x00	; 0
   66B8                    1140 _g_tiles_095:
   66B8 C0                 1141 	.db #0xc0	; 192
   66B9 C0                 1142 	.db #0xc0	; 192
   66BA C0                 1143 	.db #0xc0	; 192
   66BB C0                 1144 	.db #0xc0	; 192
   66BC C0                 1145 	.db #0xc0	; 192
   66BD C0                 1146 	.db #0xc0	; 192
   66BE C0                 1147 	.db #0xc0	; 192
   66BF C0                 1148 	.db #0xc0	; 192
   66C0                    1149 _g_tiles_096:
   66C0 F3                 1150 	.db #0xf3	; 243
   66C1 F3                 1151 	.db #0xf3	; 243
   66C2 F3                 1152 	.db #0xf3	; 243
   66C3 F3                 1153 	.db #0xf3	; 243
   66C4 F3                 1154 	.db #0xf3	; 243
   66C5 F3                 1155 	.db #0xf3	; 243
   66C6 F3                 1156 	.db #0xf3	; 243
   66C7 F3                 1157 	.db #0xf3	; 243
   66C8                    1158 _g_tiles_097:
   66C8 FF                 1159 	.db #0xff	; 255
   66C9 FF                 1160 	.db #0xff	; 255
   66CA FF                 1161 	.db #0xff	; 255
   66CB FF                 1162 	.db #0xff	; 255
   66CC FF                 1163 	.db #0xff	; 255
   66CD FF                 1164 	.db #0xff	; 255
   66CE FF                 1165 	.db #0xff	; 255
   66CF FF                 1166 	.db #0xff	; 255
   66D0                    1167 _g_tiles_098:
   66D0 CF                 1168 	.db #0xcf	; 207
   66D1 CF                 1169 	.db #0xcf	; 207
   66D2 CF                 1170 	.db #0xcf	; 207
   66D3 CF                 1171 	.db #0xcf	; 207
   66D4 CF                 1172 	.db #0xcf	; 207
   66D5 CF                 1173 	.db #0xcf	; 207
   66D6 CF                 1174 	.db #0xcf	; 207
   66D7 CF                 1175 	.db #0xcf	; 207
   66D8                    1176 _g_tiles_099:
   66D8 0F                 1177 	.db #0x0f	; 15
   66D9 0F                 1178 	.db #0x0f	; 15
   66DA 0F                 1179 	.db #0x0f	; 15
   66DB 0F                 1180 	.db #0x0f	; 15
   66DC 0F                 1181 	.db #0x0f	; 15
   66DD 0F                 1182 	.db #0x0f	; 15
   66DE 0F                 1183 	.db #0x0f	; 15
   66DF 0F                 1184 	.db #0x0f	; 15
   66E0                    1185 _g_tiles_100:
   66E0 00                 1186 	.db #0x00	; 0
   66E1 00                 1187 	.db #0x00	; 0
   66E2 00                 1188 	.db #0x00	; 0
   66E3 00                 1189 	.db #0x00	; 0
   66E4 00                 1190 	.db #0x00	; 0
   66E5 00                 1191 	.db #0x00	; 0
   66E6 00                 1192 	.db #0x00	; 0
   66E7 00                 1193 	.db #0x00	; 0
   66E8                    1194 _g_tiles_101:
   66E8 00                 1195 	.db #0x00	; 0
   66E9 00                 1196 	.db #0x00	; 0
   66EA 00                 1197 	.db #0x00	; 0
   66EB 00                 1198 	.db #0x00	; 0
   66EC 00                 1199 	.db #0x00	; 0
   66ED 00                 1200 	.db #0x00	; 0
   66EE 00                 1201 	.db #0x00	; 0
   66EF 00                 1202 	.db #0x00	; 0
   66F0                    1203 _g_tiles_102:
   66F0 00                 1204 	.db #0x00	; 0
   66F1 00                 1205 	.db #0x00	; 0
   66F2 00                 1206 	.db #0x00	; 0
   66F3 00                 1207 	.db #0x00	; 0
   66F4 00                 1208 	.db #0x00	; 0
   66F5 00                 1209 	.db #0x00	; 0
   66F6 00                 1210 	.db #0x00	; 0
   66F7 00                 1211 	.db #0x00	; 0
   66F8                    1212 _g_tiles_103:
   66F8 00                 1213 	.db #0x00	; 0
   66F9 00                 1214 	.db #0x00	; 0
   66FA 00                 1215 	.db #0x00	; 0
   66FB 00                 1216 	.db #0x00	; 0
   66FC 00                 1217 	.db #0x00	; 0
   66FD 00                 1218 	.db #0x00	; 0
   66FE 00                 1219 	.db #0x00	; 0
   66FF 00                 1220 	.db #0x00	; 0
   6700                    1221 _g_tiles_104:
   6700 00                 1222 	.db #0x00	; 0
   6701 00                 1223 	.db #0x00	; 0
   6702 00                 1224 	.db #0x00	; 0
   6703 00                 1225 	.db #0x00	; 0
   6704 00                 1226 	.db #0x00	; 0
   6705 00                 1227 	.db #0x00	; 0
   6706 00                 1228 	.db #0x00	; 0
   6707 00                 1229 	.db #0x00	; 0
   6708                    1230 _g_tiles_105:
   6708 C0                 1231 	.db #0xc0	; 192
   6709 C0                 1232 	.db #0xc0	; 192
   670A 68                 1233 	.db #0x68	; 104	'h'
   670B 3C                 1234 	.db #0x3c	; 60
   670C 8F                 1235 	.db #0x8f	; 143
   670D CF                 1236 	.db #0xcf	; 207
   670E 0A                 1237 	.db #0x0a	; 10
   670F 0F                 1238 	.db #0x0f	; 15
   6710                    1239 _g_tiles_106:
   6710 4A                 1240 	.db #0x4a	; 74	'J'
   6711 85                 1241 	.db #0x85	; 133
   6712 1E                 1242 	.db #0x1e	; 30
   6713 00                 1243 	.db #0x00	; 0
   6714 4F                 1244 	.db #0x4f	; 79	'O'
   6715 CF                 1245 	.db #0xcf	; 207
   6716 05                 1246 	.db #0x05	; 5
   6717 0F                 1247 	.db #0x0f	; 15
   6718                    1248 _g_tiles_107:
   6718 4F                 1249 	.db #0x4f	; 79	'O'
   6719 68                 1250 	.db #0x68	; 104	'h'
   671A 4F                 1251 	.db #0x4f	; 79	'O'
   671B 68                 1252 	.db #0x68	; 104	'h'
   671C 4F                 1253 	.db #0x4f	; 79	'O'
   671D 40                 1254 	.db #0x40	; 64
   671E 4F                 1255 	.db #0x4f	; 79	'O'
   671F 05                 1256 	.db #0x05	; 5
   6720                    1257 _g_tiles_108:
   6720 3C                 1258 	.db #0x3c	; 60
   6721 8F                 1259 	.db #0x8f	; 143
   6722 3C                 1260 	.db #0x3c	; 60
   6723 8F                 1261 	.db #0x8f	; 143
   6724 6D                 1262 	.db #0x6d	; 109	'm'
   6725 8F                 1263 	.db #0x8f	; 143
   6726 45                 1264 	.db #0x45	; 69	'E'
   6727 8F                 1265 	.db #0x8f	; 143
   6728                    1266 _g_tiles_109:
   6728 00                 1267 	.db #0x00	; 0
   6729 00                 1268 	.db #0x00	; 0
   672A 00                 1269 	.db #0x00	; 0
   672B 00                 1270 	.db #0x00	; 0
   672C 00                 1271 	.db #0x00	; 0
   672D 00                 1272 	.db #0x00	; 0
   672E 00                 1273 	.db #0x00	; 0
   672F 00                 1274 	.db #0x00	; 0
   6730                    1275 _g_tiles_110:
   6730 00                 1276 	.db #0x00	; 0
   6731 00                 1277 	.db #0x00	; 0
   6732 00                 1278 	.db #0x00	; 0
   6733 00                 1279 	.db #0x00	; 0
   6734 00                 1280 	.db #0x00	; 0
   6735 00                 1281 	.db #0x00	; 0
   6736 00                 1282 	.db #0x00	; 0
   6737 00                 1283 	.db #0x00	; 0
   6738                    1284 _g_tiles_111:
   6738 00                 1285 	.db #0x00	; 0
   6739 00                 1286 	.db #0x00	; 0
   673A 00                 1287 	.db #0x00	; 0
   673B 00                 1288 	.db #0x00	; 0
   673C 00                 1289 	.db #0x00	; 0
   673D 00                 1290 	.db #0x00	; 0
   673E 00                 1291 	.db #0x00	; 0
   673F 00                 1292 	.db #0x00	; 0
   6740                    1293 _g_tiles_112:
   6740 00                 1294 	.db #0x00	; 0
   6741 00                 1295 	.db #0x00	; 0
   6742 00                 1296 	.db #0x00	; 0
   6743 00                 1297 	.db #0x00	; 0
   6744 00                 1298 	.db #0x00	; 0
   6745 00                 1299 	.db #0x00	; 0
   6746 00                 1300 	.db #0x00	; 0
   6747 00                 1301 	.db #0x00	; 0
   6748                    1302 _g_tiles_113:
   6748 00                 1303 	.db #0x00	; 0
   6749 00                 1304 	.db #0x00	; 0
   674A 00                 1305 	.db #0x00	; 0
   674B 00                 1306 	.db #0x00	; 0
   674C 00                 1307 	.db #0x00	; 0
   674D 00                 1308 	.db #0x00	; 0
   674E 00                 1309 	.db #0x00	; 0
   674F 00                 1310 	.db #0x00	; 0
   6750                    1311 _g_tiles_114:
   6750 00                 1312 	.db #0x00	; 0
   6751 00                 1313 	.db #0x00	; 0
   6752 00                 1314 	.db #0x00	; 0
   6753 00                 1315 	.db #0x00	; 0
   6754 00                 1316 	.db #0x00	; 0
   6755 00                 1317 	.db #0x00	; 0
   6756 00                 1318 	.db #0x00	; 0
   6757 00                 1319 	.db #0x00	; 0
   6758                    1320 _g_tiles_115:
   6758 00                 1321 	.db #0x00	; 0
   6759 00                 1322 	.db #0x00	; 0
   675A 00                 1323 	.db #0x00	; 0
   675B 00                 1324 	.db #0x00	; 0
   675C 00                 1325 	.db #0x00	; 0
   675D 00                 1326 	.db #0x00	; 0
   675E 00                 1327 	.db #0x00	; 0
   675F 00                 1328 	.db #0x00	; 0
   6760                    1329 _g_tiles_116:
   6760 FF                 1330 	.db #0xff	; 255
   6761 FF                 1331 	.db #0xff	; 255
   6762 FF                 1332 	.db #0xff	; 255
   6763 FF                 1333 	.db #0xff	; 255
   6764 FF                 1334 	.db #0xff	; 255
   6765 FF                 1335 	.db #0xff	; 255
   6766 FF                 1336 	.db #0xff	; 255
   6767 FF                 1337 	.db #0xff	; 255
   6768                    1338 _g_tiles_117:
   6768 F3                 1339 	.db #0xf3	; 243
   6769 F3                 1340 	.db #0xf3	; 243
   676A F3                 1341 	.db #0xf3	; 243
   676B F3                 1342 	.db #0xf3	; 243
   676C F3                 1343 	.db #0xf3	; 243
   676D F3                 1344 	.db #0xf3	; 243
   676E F3                 1345 	.db #0xf3	; 243
   676F F3                 1346 	.db #0xf3	; 243
   6770                    1347 _g_tiles_118:
   6770 0F                 1348 	.db #0x0f	; 15
   6771 0F                 1349 	.db #0x0f	; 15
   6772 0F                 1350 	.db #0x0f	; 15
   6773 0F                 1351 	.db #0x0f	; 15
   6774 0F                 1352 	.db #0x0f	; 15
   6775 0F                 1353 	.db #0x0f	; 15
   6776 0F                 1354 	.db #0x0f	; 15
   6777 0F                 1355 	.db #0x0f	; 15
   6778                    1356 _g_tiles_119:
   6778 CF                 1357 	.db #0xcf	; 207
   6779 CF                 1358 	.db #0xcf	; 207
   677A CF                 1359 	.db #0xcf	; 207
   677B CF                 1360 	.db #0xcf	; 207
   677C CF                 1361 	.db #0xcf	; 207
   677D CF                 1362 	.db #0xcf	; 207
   677E CF                 1363 	.db #0xcf	; 207
   677F CF                 1364 	.db #0xcf	; 207
                           1365 	.area _INITIALIZER
                           1366 	.area _CABS (ABS)
