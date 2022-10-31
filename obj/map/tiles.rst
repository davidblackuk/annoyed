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
   5744                     164 _g_tileset:
   5744 34 58               165 	.dw _g_tiles_000
   5746 3C 58               166 	.dw _g_tiles_001
   5748 44 58               167 	.dw _g_tiles_002
   574A 4C 58               168 	.dw _g_tiles_003
   574C 54 58               169 	.dw _g_tiles_004
   574E 5C 58               170 	.dw _g_tiles_005
   5750 64 58               171 	.dw _g_tiles_006
   5752 6C 58               172 	.dw _g_tiles_007
   5754 74 58               173 	.dw _g_tiles_008
   5756 7C 58               174 	.dw _g_tiles_009
   5758 84 58               175 	.dw _g_tiles_010
   575A 8C 58               176 	.dw _g_tiles_011
   575C 94 58               177 	.dw _g_tiles_012
   575E 9C 58               178 	.dw _g_tiles_013
   5760 A4 58               179 	.dw _g_tiles_014
   5762 AC 58               180 	.dw _g_tiles_015
   5764 B4 58               181 	.dw _g_tiles_016
   5766 BC 58               182 	.dw _g_tiles_017
   5768 C4 58               183 	.dw _g_tiles_018
   576A CC 58               184 	.dw _g_tiles_019
   576C D4 58               185 	.dw _g_tiles_020
   576E DC 58               186 	.dw _g_tiles_021
   5770 E4 58               187 	.dw _g_tiles_022
   5772 EC 58               188 	.dw _g_tiles_023
   5774 F4 58               189 	.dw _g_tiles_024
   5776 FC 58               190 	.dw _g_tiles_025
   5778 04 59               191 	.dw _g_tiles_026
   577A 0C 59               192 	.dw _g_tiles_027
   577C 14 59               193 	.dw _g_tiles_028
   577E 1C 59               194 	.dw _g_tiles_029
   5780 24 59               195 	.dw _g_tiles_030
   5782 2C 59               196 	.dw _g_tiles_031
   5784 34 59               197 	.dw _g_tiles_032
   5786 3C 59               198 	.dw _g_tiles_033
   5788 44 59               199 	.dw _g_tiles_034
   578A 4C 59               200 	.dw _g_tiles_035
   578C 54 59               201 	.dw _g_tiles_036
   578E 5C 59               202 	.dw _g_tiles_037
   5790 64 59               203 	.dw _g_tiles_038
   5792 6C 59               204 	.dw _g_tiles_039
   5794 74 59               205 	.dw _g_tiles_040
   5796 7C 59               206 	.dw _g_tiles_041
   5798 84 59               207 	.dw _g_tiles_042
   579A 8C 59               208 	.dw _g_tiles_043
   579C 94 59               209 	.dw _g_tiles_044
   579E 9C 59               210 	.dw _g_tiles_045
   57A0 A4 59               211 	.dw _g_tiles_046
   57A2 AC 59               212 	.dw _g_tiles_047
   57A4 B4 59               213 	.dw _g_tiles_048
   57A6 BC 59               214 	.dw _g_tiles_049
   57A8 C4 59               215 	.dw _g_tiles_050
   57AA CC 59               216 	.dw _g_tiles_051
   57AC D4 59               217 	.dw _g_tiles_052
   57AE DC 59               218 	.dw _g_tiles_053
   57B0 E4 59               219 	.dw _g_tiles_054
   57B2 EC 59               220 	.dw _g_tiles_055
   57B4 F4 59               221 	.dw _g_tiles_056
   57B6 FC 59               222 	.dw _g_tiles_057
   57B8 04 5A               223 	.dw _g_tiles_058
   57BA 0C 5A               224 	.dw _g_tiles_059
   57BC 14 5A               225 	.dw _g_tiles_060
   57BE 1C 5A               226 	.dw _g_tiles_061
   57C0 24 5A               227 	.dw _g_tiles_062
   57C2 2C 5A               228 	.dw _g_tiles_063
   57C4 34 5A               229 	.dw _g_tiles_064
   57C6 3C 5A               230 	.dw _g_tiles_065
   57C8 44 5A               231 	.dw _g_tiles_066
   57CA 4C 5A               232 	.dw _g_tiles_067
   57CC 54 5A               233 	.dw _g_tiles_068
   57CE 5C 5A               234 	.dw _g_tiles_069
   57D0 64 5A               235 	.dw _g_tiles_070
   57D2 6C 5A               236 	.dw _g_tiles_071
   57D4 74 5A               237 	.dw _g_tiles_072
   57D6 7C 5A               238 	.dw _g_tiles_073
   57D8 84 5A               239 	.dw _g_tiles_074
   57DA 8C 5A               240 	.dw _g_tiles_075
   57DC 94 5A               241 	.dw _g_tiles_076
   57DE 9C 5A               242 	.dw _g_tiles_077
   57E0 A4 5A               243 	.dw _g_tiles_078
   57E2 AC 5A               244 	.dw _g_tiles_079
   57E4 B4 5A               245 	.dw _g_tiles_080
   57E6 BC 5A               246 	.dw _g_tiles_081
   57E8 C4 5A               247 	.dw _g_tiles_082
   57EA CC 5A               248 	.dw _g_tiles_083
   57EC D4 5A               249 	.dw _g_tiles_084
   57EE DC 5A               250 	.dw _g_tiles_085
   57F0 E4 5A               251 	.dw _g_tiles_086
   57F2 EC 5A               252 	.dw _g_tiles_087
   57F4 F4 5A               253 	.dw _g_tiles_088
   57F6 FC 5A               254 	.dw _g_tiles_089
   57F8 04 5B               255 	.dw _g_tiles_090
   57FA 0C 5B               256 	.dw _g_tiles_091
   57FC 14 5B               257 	.dw _g_tiles_092
   57FE 1C 5B               258 	.dw _g_tiles_093
   5800 24 5B               259 	.dw _g_tiles_094
   5802 2C 5B               260 	.dw _g_tiles_095
   5804 34 5B               261 	.dw _g_tiles_096
   5806 3C 5B               262 	.dw _g_tiles_097
   5808 44 5B               263 	.dw _g_tiles_098
   580A 4C 5B               264 	.dw _g_tiles_099
   580C 54 5B               265 	.dw _g_tiles_100
   580E 5C 5B               266 	.dw _g_tiles_101
   5810 64 5B               267 	.dw _g_tiles_102
   5812 6C 5B               268 	.dw _g_tiles_103
   5814 74 5B               269 	.dw _g_tiles_104
   5816 7C 5B               270 	.dw _g_tiles_105
   5818 84 5B               271 	.dw _g_tiles_106
   581A 8C 5B               272 	.dw _g_tiles_107
   581C 94 5B               273 	.dw _g_tiles_108
   581E 9C 5B               274 	.dw _g_tiles_109
   5820 A4 5B               275 	.dw _g_tiles_110
   5822 AC 5B               276 	.dw _g_tiles_111
   5824 B4 5B               277 	.dw _g_tiles_112
   5826 BC 5B               278 	.dw _g_tiles_113
   5828 C4 5B               279 	.dw _g_tiles_114
   582A CC 5B               280 	.dw _g_tiles_115
   582C D4 5B               281 	.dw _g_tiles_116
   582E DC 5B               282 	.dw _g_tiles_117
   5830 E4 5B               283 	.dw _g_tiles_118
   5832 EC 5B               284 	.dw _g_tiles_119
   5834                     285 _g_tiles_000:
   5834 C0                  286 	.db #0xc0	; 192
   5835 C0                  287 	.db #0xc0	; 192
   5836 C0                  288 	.db #0xc0	; 192
   5837 C0                  289 	.db #0xc0	; 192
   5838 C0                  290 	.db #0xc0	; 192
   5839 C0                  291 	.db #0xc0	; 192
   583A C0                  292 	.db #0xc0	; 192
   583B C0                  293 	.db #0xc0	; 192
   583C                     294 _g_tiles_001:
   583C C0                  295 	.db #0xc0	; 192
   583D 80                  296 	.db #0x80	; 128
   583E C0                  297 	.db #0xc0	; 192
   583F 80                  298 	.db #0x80	; 128
   5840 C0                  299 	.db #0xc0	; 192
   5841 80                  300 	.db #0x80	; 128
   5842 C0                  301 	.db #0xc0	; 192
   5843 80                  302 	.db #0x80	; 128
   5844                     303 _g_tiles_002:
   5844 0C                  304 	.db #0x0c	; 12
   5845 0C                  305 	.db #0x0c	; 12
   5846 0C                  306 	.db #0x0c	; 12
   5847 0C                  307 	.db #0x0c	; 12
   5848 0C                  308 	.db #0x0c	; 12
   5849 0C                  309 	.db #0x0c	; 12
   584A 0C                  310 	.db #0x0c	; 12
   584B 0C                  311 	.db #0x0c	; 12
   584C                     312 _g_tiles_003:
   584C 0C                  313 	.db #0x0c	; 12
   584D 08                  314 	.db #0x08	; 8
   584E 0C                  315 	.db #0x0c	; 12
   584F 08                  316 	.db #0x08	; 8
   5850 0C                  317 	.db #0x0c	; 12
   5851 08                  318 	.db #0x08	; 8
   5852 0C                  319 	.db #0x0c	; 12
   5853 08                  320 	.db #0x08	; 8
   5854                     321 _g_tiles_004:
   5854 CC                  322 	.db #0xcc	; 204
   5855 CC                  323 	.db #0xcc	; 204
   5856 CC                  324 	.db #0xcc	; 204
   5857 CC                  325 	.db #0xcc	; 204
   5858 CC                  326 	.db #0xcc	; 204
   5859 CC                  327 	.db #0xcc	; 204
   585A CC                  328 	.db #0xcc	; 204
   585B CC                  329 	.db #0xcc	; 204
   585C                     330 _g_tiles_005:
   585C CC                  331 	.db #0xcc	; 204
   585D 88                  332 	.db #0x88	; 136
   585E CC                  333 	.db #0xcc	; 204
   585F 88                  334 	.db #0x88	; 136
   5860 CC                  335 	.db #0xcc	; 204
   5861 88                  336 	.db #0x88	; 136
   5862 CC                  337 	.db #0xcc	; 204
   5863 88                  338 	.db #0x88	; 136
   5864                     339 _g_tiles_006:
   5864 30                  340 	.db #0x30	; 48	'0'
   5865 30                  341 	.db #0x30	; 48	'0'
   5866 30                  342 	.db #0x30	; 48	'0'
   5867 30                  343 	.db #0x30	; 48	'0'
   5868 30                  344 	.db #0x30	; 48	'0'
   5869 30                  345 	.db #0x30	; 48	'0'
   586A 30                  346 	.db #0x30	; 48	'0'
   586B 30                  347 	.db #0x30	; 48	'0'
   586C                     348 _g_tiles_007:
   586C 30                  349 	.db #0x30	; 48	'0'
   586D 20                  350 	.db #0x20	; 32
   586E 30                  351 	.db #0x30	; 48	'0'
   586F 20                  352 	.db #0x20	; 32
   5870 30                  353 	.db #0x30	; 48	'0'
   5871 20                  354 	.db #0x20	; 32
   5872 30                  355 	.db #0x30	; 48	'0'
   5873 20                  356 	.db #0x20	; 32
   5874                     357 _g_tiles_008:
   5874 F0                  358 	.db #0xf0	; 240
   5875 F0                  359 	.db #0xf0	; 240
   5876 F0                  360 	.db #0xf0	; 240
   5877 F0                  361 	.db #0xf0	; 240
   5878 F0                  362 	.db #0xf0	; 240
   5879 F0                  363 	.db #0xf0	; 240
   587A F0                  364 	.db #0xf0	; 240
   587B F0                  365 	.db #0xf0	; 240
   587C                     366 _g_tiles_009:
   587C F0                  367 	.db #0xf0	; 240
   587D A0                  368 	.db #0xa0	; 160
   587E F0                  369 	.db #0xf0	; 240
   587F A0                  370 	.db #0xa0	; 160
   5880 F0                  371 	.db #0xf0	; 240
   5881 A0                  372 	.db #0xa0	; 160
   5882 F0                  373 	.db #0xf0	; 240
   5883 A0                  374 	.db #0xa0	; 160
   5884                     375 _g_tiles_010:
   5884 3C                  376 	.db #0x3c	; 60
   5885 3C                  377 	.db #0x3c	; 60
   5886 3C                  378 	.db #0x3c	; 60
   5887 3C                  379 	.db #0x3c	; 60
   5888 3C                  380 	.db #0x3c	; 60
   5889 3C                  381 	.db #0x3c	; 60
   588A 3C                  382 	.db #0x3c	; 60
   588B 3C                  383 	.db #0x3c	; 60
   588C                     384 _g_tiles_011:
   588C 3C                  385 	.db #0x3c	; 60
   588D 28                  386 	.db #0x28	; 40
   588E 3C                  387 	.db #0x3c	; 60
   588F 28                  388 	.db #0x28	; 40
   5890 3C                  389 	.db #0x3c	; 60
   5891 28                  390 	.db #0x28	; 40
   5892 3C                  391 	.db #0x3c	; 60
   5893 28                  392 	.db #0x28	; 40
   5894                     393 _g_tiles_012:
   5894 FC                  394 	.db #0xfc	; 252
   5895 FC                  395 	.db #0xfc	; 252
   5896 FC                  396 	.db #0xfc	; 252
   5897 FC                  397 	.db #0xfc	; 252
   5898 FC                  398 	.db #0xfc	; 252
   5899 FC                  399 	.db #0xfc	; 252
   589A FC                  400 	.db #0xfc	; 252
   589B FC                  401 	.db #0xfc	; 252
   589C                     402 _g_tiles_013:
   589C FC                  403 	.db #0xfc	; 252
   589D A8                  404 	.db #0xa8	; 168
   589E FC                  405 	.db #0xfc	; 252
   589F A8                  406 	.db #0xa8	; 168
   58A0 FC                  407 	.db #0xfc	; 252
   58A1 A8                  408 	.db #0xa8	; 168
   58A2 FC                  409 	.db #0xfc	; 252
   58A3 A8                  410 	.db #0xa8	; 168
   58A4                     411 _g_tiles_014:
   58A4 03                  412 	.db #0x03	; 3
   58A5 03                  413 	.db #0x03	; 3
   58A6 03                  414 	.db #0x03	; 3
   58A7 03                  415 	.db #0x03	; 3
   58A8 03                  416 	.db #0x03	; 3
   58A9 03                  417 	.db #0x03	; 3
   58AA 03                  418 	.db #0x03	; 3
   58AB 03                  419 	.db #0x03	; 3
   58AC                     420 _g_tiles_015:
   58AC 03                  421 	.db #0x03	; 3
   58AD 02                  422 	.db #0x02	; 2
   58AE 03                  423 	.db #0x03	; 3
   58AF 02                  424 	.db #0x02	; 2
   58B0 03                  425 	.db #0x03	; 3
   58B1 02                  426 	.db #0x02	; 2
   58B2 03                  427 	.db #0x03	; 3
   58B3 02                  428 	.db #0x02	; 2
   58B4                     429 _g_tiles_016:
   58B4 C0                  430 	.db #0xc0	; 192
   58B5 C0                  431 	.db #0xc0	; 192
   58B6 C1                  432 	.db #0xc1	; 193
   58B7 C3                  433 	.db #0xc3	; 195
   58B8 C1                  434 	.db #0xc1	; 193
   58B9 C3                  435 	.db #0xc3	; 195
   58BA C1                  436 	.db #0xc1	; 193
   58BB C3                  437 	.db #0xc3	; 195
   58BC                     438 _g_tiles_017:
   58BC C0                  439 	.db #0xc0	; 192
   58BD 80                  440 	.db #0x80	; 128
   58BE C3                  441 	.db #0xc3	; 195
   58BF 82                  442 	.db #0x82	; 130
   58C0 C3                  443 	.db #0xc3	; 195
   58C1 82                  444 	.db #0x82	; 130
   58C2 C3                  445 	.db #0xc3	; 195
   58C3 82                  446 	.db #0x82	; 130
   58C4                     447 _g_tiles_018:
   58C4 03                  448 	.db #0x03	; 3
   58C5 03                  449 	.db #0x03	; 3
   58C6 13                  450 	.db #0x13	; 19
   58C7 33                  451 	.db #0x33	; 51	'3'
   58C8 13                  452 	.db #0x13	; 19
   58C9 33                  453 	.db #0x33	; 51	'3'
   58CA 13                  454 	.db #0x13	; 19
   58CB 33                  455 	.db #0x33	; 51	'3'
   58CC                     456 _g_tiles_019:
   58CC 03                  457 	.db #0x03	; 3
   58CD 02                  458 	.db #0x02	; 2
   58CE 33                  459 	.db #0x33	; 51	'3'
   58CF 22                  460 	.db #0x22	; 34
   58D0 33                  461 	.db #0x33	; 51	'3'
   58D1 22                  462 	.db #0x22	; 34
   58D2 33                  463 	.db #0x33	; 51	'3'
   58D3 22                  464 	.db #0x22	; 34
   58D4                     465 _g_tiles_020:
   58D4 C0                  466 	.db #0xc0	; 192
   58D5 C0                  467 	.db #0xc0	; 192
   58D6 C0                  468 	.db #0xc0	; 192
   58D7 C0                  469 	.db #0xc0	; 192
   58D8 C0                  470 	.db #0xc0	; 192
   58D9 C0                  471 	.db #0xc0	; 192
   58DA 00                  472 	.db #0x00	; 0
   58DB 00                  473 	.db #0x00	; 0
   58DC                     474 _g_tiles_021:
   58DC C0                  475 	.db #0xc0	; 192
   58DD 80                  476 	.db #0x80	; 128
   58DE C0                  477 	.db #0xc0	; 192
   58DF 80                  478 	.db #0x80	; 128
   58E0 C0                  479 	.db #0xc0	; 192
   58E1 80                  480 	.db #0x80	; 128
   58E2 00                  481 	.db #0x00	; 0
   58E3 00                  482 	.db #0x00	; 0
   58E4                     483 _g_tiles_022:
   58E4 0C                  484 	.db #0x0c	; 12
   58E5 0C                  485 	.db #0x0c	; 12
   58E6 0C                  486 	.db #0x0c	; 12
   58E7 0C                  487 	.db #0x0c	; 12
   58E8 0C                  488 	.db #0x0c	; 12
   58E9 0C                  489 	.db #0x0c	; 12
   58EA 00                  490 	.db #0x00	; 0
   58EB 00                  491 	.db #0x00	; 0
   58EC                     492 _g_tiles_023:
   58EC 0C                  493 	.db #0x0c	; 12
   58ED 08                  494 	.db #0x08	; 8
   58EE 0C                  495 	.db #0x0c	; 12
   58EF 08                  496 	.db #0x08	; 8
   58F0 0C                  497 	.db #0x0c	; 12
   58F1 08                  498 	.db #0x08	; 8
   58F2 00                  499 	.db #0x00	; 0
   58F3 00                  500 	.db #0x00	; 0
   58F4                     501 _g_tiles_024:
   58F4 CC                  502 	.db #0xcc	; 204
   58F5 CC                  503 	.db #0xcc	; 204
   58F6 CC                  504 	.db #0xcc	; 204
   58F7 CC                  505 	.db #0xcc	; 204
   58F8 CC                  506 	.db #0xcc	; 204
   58F9 CC                  507 	.db #0xcc	; 204
   58FA 00                  508 	.db #0x00	; 0
   58FB 00                  509 	.db #0x00	; 0
   58FC                     510 _g_tiles_025:
   58FC CC                  511 	.db #0xcc	; 204
   58FD 88                  512 	.db #0x88	; 136
   58FE CC                  513 	.db #0xcc	; 204
   58FF 88                  514 	.db #0x88	; 136
   5900 CC                  515 	.db #0xcc	; 204
   5901 88                  516 	.db #0x88	; 136
   5902 00                  517 	.db #0x00	; 0
   5903 00                  518 	.db #0x00	; 0
   5904                     519 _g_tiles_026:
   5904 30                  520 	.db #0x30	; 48	'0'
   5905 30                  521 	.db #0x30	; 48	'0'
   5906 30                  522 	.db #0x30	; 48	'0'
   5907 30                  523 	.db #0x30	; 48	'0'
   5908 30                  524 	.db #0x30	; 48	'0'
   5909 30                  525 	.db #0x30	; 48	'0'
   590A 00                  526 	.db #0x00	; 0
   590B 00                  527 	.db #0x00	; 0
   590C                     528 _g_tiles_027:
   590C 30                  529 	.db #0x30	; 48	'0'
   590D 20                  530 	.db #0x20	; 32
   590E 30                  531 	.db #0x30	; 48	'0'
   590F 20                  532 	.db #0x20	; 32
   5910 30                  533 	.db #0x30	; 48	'0'
   5911 20                  534 	.db #0x20	; 32
   5912 00                  535 	.db #0x00	; 0
   5913 00                  536 	.db #0x00	; 0
   5914                     537 _g_tiles_028:
   5914 F0                  538 	.db #0xf0	; 240
   5915 F0                  539 	.db #0xf0	; 240
   5916 F0                  540 	.db #0xf0	; 240
   5917 F0                  541 	.db #0xf0	; 240
   5918 F0                  542 	.db #0xf0	; 240
   5919 F0                  543 	.db #0xf0	; 240
   591A 00                  544 	.db #0x00	; 0
   591B 00                  545 	.db #0x00	; 0
   591C                     546 _g_tiles_029:
   591C F0                  547 	.db #0xf0	; 240
   591D A0                  548 	.db #0xa0	; 160
   591E F0                  549 	.db #0xf0	; 240
   591F A0                  550 	.db #0xa0	; 160
   5920 F0                  551 	.db #0xf0	; 240
   5921 A0                  552 	.db #0xa0	; 160
   5922 00                  553 	.db #0x00	; 0
   5923 00                  554 	.db #0x00	; 0
   5924                     555 _g_tiles_030:
   5924 3C                  556 	.db #0x3c	; 60
   5925 3C                  557 	.db #0x3c	; 60
   5926 3C                  558 	.db #0x3c	; 60
   5927 3C                  559 	.db #0x3c	; 60
   5928 3C                  560 	.db #0x3c	; 60
   5929 3C                  561 	.db #0x3c	; 60
   592A 00                  562 	.db #0x00	; 0
   592B 00                  563 	.db #0x00	; 0
   592C                     564 _g_tiles_031:
   592C 3C                  565 	.db #0x3c	; 60
   592D 28                  566 	.db #0x28	; 40
   592E 3C                  567 	.db #0x3c	; 60
   592F 28                  568 	.db #0x28	; 40
   5930 3C                  569 	.db #0x3c	; 60
   5931 28                  570 	.db #0x28	; 40
   5932 00                  571 	.db #0x00	; 0
   5933 00                  572 	.db #0x00	; 0
   5934                     573 _g_tiles_032:
   5934 FC                  574 	.db #0xfc	; 252
   5935 FC                  575 	.db #0xfc	; 252
   5936 FC                  576 	.db #0xfc	; 252
   5937 FC                  577 	.db #0xfc	; 252
   5938 FC                  578 	.db #0xfc	; 252
   5939 FC                  579 	.db #0xfc	; 252
   593A 00                  580 	.db #0x00	; 0
   593B 00                  581 	.db #0x00	; 0
   593C                     582 _g_tiles_033:
   593C FC                  583 	.db #0xfc	; 252
   593D A8                  584 	.db #0xa8	; 168
   593E FC                  585 	.db #0xfc	; 252
   593F A8                  586 	.db #0xa8	; 168
   5940 FC                  587 	.db #0xfc	; 252
   5941 A8                  588 	.db #0xa8	; 168
   5942 00                  589 	.db #0x00	; 0
   5943 00                  590 	.db #0x00	; 0
   5944                     591 _g_tiles_034:
   5944 03                  592 	.db #0x03	; 3
   5945 03                  593 	.db #0x03	; 3
   5946 03                  594 	.db #0x03	; 3
   5947 03                  595 	.db #0x03	; 3
   5948 03                  596 	.db #0x03	; 3
   5949 03                  597 	.db #0x03	; 3
   594A 00                  598 	.db #0x00	; 0
   594B 00                  599 	.db #0x00	; 0
   594C                     600 _g_tiles_035:
   594C 03                  601 	.db #0x03	; 3
   594D 02                  602 	.db #0x02	; 2
   594E 03                  603 	.db #0x03	; 3
   594F 02                  604 	.db #0x02	; 2
   5950 03                  605 	.db #0x03	; 3
   5951 02                  606 	.db #0x02	; 2
   5952 00                  607 	.db #0x00	; 0
   5953 00                  608 	.db #0x00	; 0
   5954                     609 _g_tiles_036:
   5954 C1                  610 	.db #0xc1	; 193
   5955 C3                  611 	.db #0xc3	; 195
   5956 C1                  612 	.db #0xc1	; 193
   5957 C3                  613 	.db #0xc3	; 195
   5958 C1                  614 	.db #0xc1	; 193
   5959 C3                  615 	.db #0xc3	; 195
   595A 80                  616 	.db #0x80	; 128
   595B 00                  617 	.db #0x00	; 0
   595C                     618 _g_tiles_037:
   595C C3                  619 	.db #0xc3	; 195
   595D 82                  620 	.db #0x82	; 130
   595E C3                  621 	.db #0xc3	; 195
   595F 82                  622 	.db #0x82	; 130
   5960 C3                  623 	.db #0xc3	; 195
   5961 82                  624 	.db #0x82	; 130
   5962 00                  625 	.db #0x00	; 0
   5963 00                  626 	.db #0x00	; 0
   5964                     627 _g_tiles_038:
   5964 13                  628 	.db #0x13	; 19
   5965 33                  629 	.db #0x33	; 51	'3'
   5966 13                  630 	.db #0x13	; 19
   5967 33                  631 	.db #0x33	; 51	'3'
   5968 13                  632 	.db #0x13	; 19
   5969 33                  633 	.db #0x33	; 51	'3'
   596A 02                  634 	.db #0x02	; 2
   596B 00                  635 	.db #0x00	; 0
   596C                     636 _g_tiles_039:
   596C 33                  637 	.db #0x33	; 51	'3'
   596D 22                  638 	.db #0x22	; 34
   596E 33                  639 	.db #0x33	; 51	'3'
   596F 22                  640 	.db #0x22	; 34
   5970 33                  641 	.db #0x33	; 51	'3'
   5971 22                  642 	.db #0x22	; 34
   5972 00                  643 	.db #0x00	; 0
   5973 00                  644 	.db #0x00	; 0
   5974                     645 _g_tiles_040:
   5974 00                  646 	.db #0x00	; 0
   5975 00                  647 	.db #0x00	; 0
   5976 05                  648 	.db #0x05	; 5
   5977 0F                  649 	.db #0x0f	; 15
   5978 05                  650 	.db #0x05	; 5
   5979 CF                  651 	.db #0xcf	; 207
   597A 05                  652 	.db #0x05	; 5
   597B 9E                  653 	.db #0x9e	; 158
   597C                     654 _g_tiles_041:
   597C 00                  655 	.db #0x00	; 0
   597D 00                  656 	.db #0x00	; 0
   597E 0F                  657 	.db #0x0f	; 15
   597F 0F                  658 	.db #0x0f	; 15
   5980 CF                  659 	.db #0xcf	; 207
   5981 CF                  660 	.db #0xcf	; 207
   5982 3C                  661 	.db #0x3c	; 60
   5983 3C                  662 	.db #0x3c	; 60
   5984                     663 _g_tiles_042:
   5984 00                  664 	.db #0x00	; 0
   5985 00                  665 	.db #0x00	; 0
   5986 0F                  666 	.db #0x0f	; 15
   5987 0F                  667 	.db #0x0f	; 15
   5988 CF                  668 	.db #0xcf	; 207
   5989 CF                  669 	.db #0xcf	; 207
   598A 3C                  670 	.db #0x3c	; 60
   598B 3C                  671 	.db #0x3c	; 60
   598C                     672 _g_tiles_043:
   598C 00                  673 	.db #0x00	; 0
   598D 00                  674 	.db #0x00	; 0
   598E 0F                  675 	.db #0x0f	; 15
   598F 0F                  676 	.db #0x0f	; 15
   5990 CF                  677 	.db #0xcf	; 207
   5991 CF                  678 	.db #0xcf	; 207
   5992 3C                  679 	.db #0x3c	; 60
   5993 3C                  680 	.db #0x3c	; 60
   5994                     681 _g_tiles_044:
   5994 00                  682 	.db #0x00	; 0
   5995 00                  683 	.db #0x00	; 0
   5996 0F                  684 	.db #0x0f	; 15
   5997 0A                  685 	.db #0x0a	; 10
   5998 CF                  686 	.db #0xcf	; 207
   5999 0A                  687 	.db #0x0a	; 10
   599A 6D                  688 	.db #0x6d	; 109	'm'
   599B 0A                  689 	.db #0x0a	; 10
   599C                     690 _g_tiles_045:
   599C 05                  691 	.db #0x05	; 5
   599D 9E                  692 	.db #0x9e	; 158
   599E 05                  693 	.db #0x05	; 5
   599F 9E                  694 	.db #0x9e	; 158
   59A0 05                  695 	.db #0x05	; 5
   59A1 9E                  696 	.db #0x9e	; 158
   59A2 05                  697 	.db #0x05	; 5
   59A3 9E                  698 	.db #0x9e	; 158
   59A4                     699 _g_tiles_046:
   59A4 6D                  700 	.db #0x6d	; 109	'm'
   59A5 0A                  701 	.db #0x0a	; 10
   59A6 6D                  702 	.db #0x6d	; 109	'm'
   59A7 0A                  703 	.db #0x0a	; 10
   59A8 6D                  704 	.db #0x6d	; 109	'm'
   59A9 0A                  705 	.db #0x0a	; 10
   59AA 6D                  706 	.db #0x6d	; 109	'm'
   59AB 0A                  707 	.db #0x0a	; 10
   59AC                     708 _g_tiles_047:
   59AC 68                  709 	.db #0x68	; 104	'h'
   59AD 94                  710 	.db #0x94	; 148
   59AE C0                  711 	.db #0xc0	; 192
   59AF 3C                  712 	.db #0x3c	; 60
   59B0 68                  713 	.db #0x68	; 104	'h'
   59B1 3C                  714 	.db #0x3c	; 60
   59B2 68                  715 	.db #0x68	; 104	'h'
   59B3 3C                  716 	.db #0x3c	; 60
   59B4                     717 _g_tiles_048:
   59B4 9F                  718 	.db #0x9f	; 159
   59B5 00                  719 	.db #0x00	; 0
   59B6 9F                  720 	.db #0x9f	; 159
   59B7 00                  721 	.db #0x00	; 0
   59B8 9F                  722 	.db #0x9f	; 159
   59B9 00                  723 	.db #0x00	; 0
   59BA 9F                  724 	.db #0x9f	; 159
   59BB 00                  725 	.db #0x00	; 0
   59BC                     726 _g_tiles_049:
   59BC 2D                  727 	.db #0x2d	; 45
   59BD 2D                  728 	.db #0x2d	; 45
   59BE 0F                  729 	.db #0x0f	; 15
   59BF 2D                  730 	.db #0x2d	; 45
   59C0 3C                  731 	.db #0x3c	; 60
   59C1 1E                  732 	.db #0x1e	; 30
   59C2 0F                  733 	.db #0x0f	; 15
   59C3 1E                  734 	.db #0x1e	; 30
   59C4                     735 _g_tiles_050:
   59C4 0F                  736 	.db #0x0f	; 15
   59C5 0F                  737 	.db #0x0f	; 15
   59C6 3C                  738 	.db #0x3c	; 60
   59C7 3C                  739 	.db #0x3c	; 60
   59C8 0F                  740 	.db #0x0f	; 15
   59C9 0F                  741 	.db #0x0f	; 15
   59CA 1E                  742 	.db #0x1e	; 30
   59CB 2D                  743 	.db #0x2d	; 45
   59CC                     744 _g_tiles_051:
   59CC 1E                  745 	.db #0x1e	; 30
   59CD 1E                  746 	.db #0x1e	; 30
   59CE 1E                  747 	.db #0x1e	; 30
   59CF 0F                  748 	.db #0x0f	; 15
   59D0 2D                  749 	.db #0x2d	; 45
   59D1 3C                  750 	.db #0x3c	; 60
   59D2 2D                  751 	.db #0x2d	; 45
   59D3 0F                  752 	.db #0x0f	; 15
   59D4                     753 _g_tiles_052:
   59D4 F0                  754 	.db #0xf0	; 240
   59D5 F0                  755 	.db #0xf0	; 240
   59D6 F1                  756 	.db #0xf1	; 241
   59D7 F3                  757 	.db #0xf3	; 243
   59D8 F0                  758 	.db #0xf0	; 240
   59D9 F0                  759 	.db #0xf0	; 240
   59DA F3                  760 	.db #0xf3	; 243
   59DB F3                  761 	.db #0xf3	; 243
   59DC                     762 _g_tiles_053:
   59DC F0                  763 	.db #0xf0	; 240
   59DD F2                  764 	.db #0xf2	; 242
   59DE F2                  765 	.db #0xf2	; 242
   59DF F2                  766 	.db #0xf2	; 242
   59E0 F0                  767 	.db #0xf0	; 240
   59E1 F2                  768 	.db #0xf2	; 242
   59E2 F3                  769 	.db #0xf3	; 243
   59E3 F2                  770 	.db #0xf2	; 242
   59E4                     771 _g_tiles_054:
   59E4 F3                  772 	.db #0xf3	; 243
   59E5 F0                  773 	.db #0xf0	; 240
   59E6 F3                  774 	.db #0xf3	; 243
   59E7 F1                  775 	.db #0xf1	; 241
   59E8 F3                  776 	.db #0xf3	; 243
   59E9 F1                  777 	.db #0xf1	; 241
   59EA F3                  778 	.db #0xf3	; 243
   59EB F1                  779 	.db #0xf1	; 241
   59EC                     780 _g_tiles_055:
   59EC 00                  781 	.db #0x00	; 0
   59ED 00                  782 	.db #0x00	; 0
   59EE 00                  783 	.db #0x00	; 0
   59EF 00                  784 	.db #0x00	; 0
   59F0 00                  785 	.db #0x00	; 0
   59F1 00                  786 	.db #0x00	; 0
   59F2 00                  787 	.db #0x00	; 0
   59F3 00                  788 	.db #0x00	; 0
   59F4                     789 _g_tiles_056:
   59F4 00                  790 	.db #0x00	; 0
   59F5 00                  791 	.db #0x00	; 0
   59F6 00                  792 	.db #0x00	; 0
   59F7 00                  793 	.db #0x00	; 0
   59F8 00                  794 	.db #0x00	; 0
   59F9 00                  795 	.db #0x00	; 0
   59FA 00                  796 	.db #0x00	; 0
   59FB 00                  797 	.db #0x00	; 0
   59FC                     798 _g_tiles_057:
   59FC 00                  799 	.db #0x00	; 0
   59FD 00                  800 	.db #0x00	; 0
   59FE 00                  801 	.db #0x00	; 0
   59FF 00                  802 	.db #0x00	; 0
   5A00 00                  803 	.db #0x00	; 0
   5A01 00                  804 	.db #0x00	; 0
   5A02 00                  805 	.db #0x00	; 0
   5A03 00                  806 	.db #0x00	; 0
   5A04                     807 _g_tiles_058:
   5A04 00                  808 	.db #0x00	; 0
   5A05 00                  809 	.db #0x00	; 0
   5A06 00                  810 	.db #0x00	; 0
   5A07 00                  811 	.db #0x00	; 0
   5A08 00                  812 	.db #0x00	; 0
   5A09 00                  813 	.db #0x00	; 0
   5A0A 00                  814 	.db #0x00	; 0
   5A0B 00                  815 	.db #0x00	; 0
   5A0C                     816 _g_tiles_059:
   5A0C 00                  817 	.db #0x00	; 0
   5A0D 00                  818 	.db #0x00	; 0
   5A0E 00                  819 	.db #0x00	; 0
   5A0F 00                  820 	.db #0x00	; 0
   5A10 00                  821 	.db #0x00	; 0
   5A11 00                  822 	.db #0x00	; 0
   5A12 00                  823 	.db #0x00	; 0
   5A13 00                  824 	.db #0x00	; 0
   5A14                     825 _g_tiles_060:
   5A14 05                  826 	.db #0x05	; 5
   5A15 9E                  827 	.db #0x9e	; 158
   5A16 05                  828 	.db #0x05	; 5
   5A17 9E                  829 	.db #0x9e	; 158
   5A18 05                  830 	.db #0x05	; 5
   5A19 9E                  831 	.db #0x9e	; 158
   5A1A 05                  832 	.db #0x05	; 5
   5A1B 9E                  833 	.db #0x9e	; 158
   5A1C                     834 _g_tiles_061:
   5A1C 3C                  835 	.db #0x3c	; 60
   5A1D 3C                  836 	.db #0x3c	; 60
   5A1E 6D                  837 	.db #0x6d	; 109	'm'
   5A1F CF                  838 	.db #0xcf	; 207
   5A20 6D                  839 	.db #0x6d	; 109	'm'
   5A21 0F                  840 	.db #0x0f	; 15
   5A22 6D                  841 	.db #0x6d	; 109	'm'
   5A23 0A                  842 	.db #0x0a	; 10
   5A24                     843 _g_tiles_062:
   5A24 3C                  844 	.db #0x3c	; 60
   5A25 3C                  845 	.db #0x3c	; 60
   5A26 CF                  846 	.db #0xcf	; 207
   5A27 CF                  847 	.db #0xcf	; 207
   5A28 0F                  848 	.db #0x0f	; 15
   5A29 0F                  849 	.db #0x0f	; 15
   5A2A 00                  850 	.db #0x00	; 0
   5A2B 00                  851 	.db #0x00	; 0
   5A2C                     852 _g_tiles_063:
   5A2C 3C                  853 	.db #0x3c	; 60
   5A2D 3C                  854 	.db #0x3c	; 60
   5A2E CF                  855 	.db #0xcf	; 207
   5A2F 9E                  856 	.db #0x9e	; 158
   5A30 0F                  857 	.db #0x0f	; 15
   5A31 9E                  858 	.db #0x9e	; 158
   5A32 05                  859 	.db #0x05	; 5
   5A33 9E                  860 	.db #0x9e	; 158
   5A34                     861 _g_tiles_064:
   5A34 6D                  862 	.db #0x6d	; 109	'm'
   5A35 0A                  863 	.db #0x0a	; 10
   5A36 6D                  864 	.db #0x6d	; 109	'm'
   5A37 0A                  865 	.db #0x0a	; 10
   5A38 6D                  866 	.db #0x6d	; 109	'm'
   5A39 0A                  867 	.db #0x0a	; 10
   5A3A 6D                  868 	.db #0x6d	; 109	'm'
   5A3B 0A                  869 	.db #0x0a	; 10
   5A3C                     870 _g_tiles_065:
   5A3C 05                  871 	.db #0x05	; 5
   5A3D 9E                  872 	.db #0x9e	; 158
   5A3E 05                  873 	.db #0x05	; 5
   5A3F CF                  874 	.db #0xcf	; 207
   5A40 05                  875 	.db #0x05	; 5
   5A41 0F                  876 	.db #0x0f	; 15
   5A42 00                  877 	.db #0x00	; 0
   5A43 00                  878 	.db #0x00	; 0
   5A44                     879 _g_tiles_066:
   5A44 6D                  880 	.db #0x6d	; 109	'm'
   5A45 0A                  881 	.db #0x0a	; 10
   5A46 CF                  882 	.db #0xcf	; 207
   5A47 0A                  883 	.db #0x0a	; 10
   5A48 0F                  884 	.db #0x0f	; 15
   5A49 0A                  885 	.db #0x0a	; 10
   5A4A 00                  886 	.db #0x00	; 0
   5A4B 00                  887 	.db #0x00	; 0
   5A4C                     888 _g_tiles_067:
   5A4C 68                  889 	.db #0x68	; 104	'h'
   5A4D 3C                  890 	.db #0x3c	; 60
   5A4E 05                  891 	.db #0x05	; 5
   5A4F CF                  892 	.db #0xcf	; 207
   5A50 68                  893 	.db #0x68	; 104	'h'
   5A51 3C                  894 	.db #0x3c	; 60
   5A52 05                  895 	.db #0x05	; 5
   5A53 CF                  896 	.db #0xcf	; 207
   5A54                     897 _g_tiles_068:
   5A54 9F                  898 	.db #0x9f	; 159
   5A55 00                  899 	.db #0x00	; 0
   5A56 8A                  900 	.db #0x8a	; 138
   5A57 00                  901 	.db #0x00	; 0
   5A58 9F                  902 	.db #0x9f	; 159
   5A59 00                  903 	.db #0x00	; 0
   5A5A 9F                  904 	.db #0x9f	; 159
   5A5B 00                  905 	.db #0x00	; 0
   5A5C                     906 _g_tiles_069:
   5A5C 0F                  907 	.db #0x0f	; 15
   5A5D 1E                  908 	.db #0x1e	; 30
   5A5E 3C                  909 	.db #0x3c	; 60
   5A5F 1E                  910 	.db #0x1e	; 30
   5A60 0F                  911 	.db #0x0f	; 15
   5A61 2D                  912 	.db #0x2d	; 45
   5A62 2D                  913 	.db #0x2d	; 45
   5A63 2D                  914 	.db #0x2d	; 45
   5A64                     915 _g_tiles_070:
   5A64 1E                  916 	.db #0x1e	; 30
   5A65 2D                  917 	.db #0x2d	; 45
   5A66 0F                  918 	.db #0x0f	; 15
   5A67 0F                  919 	.db #0x0f	; 15
   5A68 3C                  920 	.db #0x3c	; 60
   5A69 3C                  921 	.db #0x3c	; 60
   5A6A 0F                  922 	.db #0x0f	; 15
   5A6B 0F                  923 	.db #0x0f	; 15
   5A6C                     924 _g_tiles_071:
   5A6C 2D                  925 	.db #0x2d	; 45
   5A6D 0F                  926 	.db #0x0f	; 15
   5A6E 2D                  927 	.db #0x2d	; 45
   5A6F 3C                  928 	.db #0x3c	; 60
   5A70 1E                  929 	.db #0x1e	; 30
   5A71 0F                  930 	.db #0x0f	; 15
   5A72 1E                  931 	.db #0x1e	; 30
   5A73 1E                  932 	.db #0x1e	; 30
   5A74                     933 _g_tiles_072:
   5A74 F0                  934 	.db #0xf0	; 240
   5A75 F3                  935 	.db #0xf3	; 243
   5A76 F2                  936 	.db #0xf2	; 242
   5A77 F3                  937 	.db #0xf3	; 243
   5A78 F2                  938 	.db #0xf2	; 242
   5A79 F3                  939 	.db #0xf3	; 243
   5A7A F0                  940 	.db #0xf0	; 240
   5A7B F3                  941 	.db #0xf3	; 243
   5A7C                     942 _g_tiles_073:
   5A7C F0                  943 	.db #0xf0	; 240
   5A7D F0                  944 	.db #0xf0	; 240
   5A7E F1                  945 	.db #0xf1	; 241
   5A7F F3                  946 	.db #0xf3	; 243
   5A80 F1                  947 	.db #0xf1	; 241
   5A81 F3                  948 	.db #0xf3	; 243
   5A82 F1                  949 	.db #0xf1	; 241
   5A83 F2                  950 	.db #0xf2	; 242
   5A84                     951 _g_tiles_074:
   5A84 F3                  952 	.db #0xf3	; 243
   5A85 F0                  953 	.db #0xf0	; 240
   5A86 F3                  954 	.db #0xf3	; 243
   5A87 F3                  955 	.db #0xf3	; 243
   5A88 F3                  956 	.db #0xf3	; 243
   5A89 F3                  957 	.db #0xf3	; 243
   5A8A F0                  958 	.db #0xf0	; 240
   5A8B F0                  959 	.db #0xf0	; 240
   5A8C                     960 _g_tiles_075:
   5A8C 00                  961 	.db #0x00	; 0
   5A8D 00                  962 	.db #0x00	; 0
   5A8E 00                  963 	.db #0x00	; 0
   5A8F 00                  964 	.db #0x00	; 0
   5A90 00                  965 	.db #0x00	; 0
   5A91 00                  966 	.db #0x00	; 0
   5A92 00                  967 	.db #0x00	; 0
   5A93 00                  968 	.db #0x00	; 0
   5A94                     969 _g_tiles_076:
   5A94 00                  970 	.db #0x00	; 0
   5A95 00                  971 	.db #0x00	; 0
   5A96 00                  972 	.db #0x00	; 0
   5A97 00                  973 	.db #0x00	; 0
   5A98 00                  974 	.db #0x00	; 0
   5A99 00                  975 	.db #0x00	; 0
   5A9A 00                  976 	.db #0x00	; 0
   5A9B 00                  977 	.db #0x00	; 0
   5A9C                     978 _g_tiles_077:
   5A9C 00                  979 	.db #0x00	; 0
   5A9D 00                  980 	.db #0x00	; 0
   5A9E 00                  981 	.db #0x00	; 0
   5A9F 00                  982 	.db #0x00	; 0
   5AA0 00                  983 	.db #0x00	; 0
   5AA1 00                  984 	.db #0x00	; 0
   5AA2 00                  985 	.db #0x00	; 0
   5AA3 00                  986 	.db #0x00	; 0
   5AA4                     987 _g_tiles_078:
   5AA4 00                  988 	.db #0x00	; 0
   5AA5 00                  989 	.db #0x00	; 0
   5AA6 00                  990 	.db #0x00	; 0
   5AA7 00                  991 	.db #0x00	; 0
   5AA8 00                  992 	.db #0x00	; 0
   5AA9 00                  993 	.db #0x00	; 0
   5AAA 00                  994 	.db #0x00	; 0
   5AAB 00                  995 	.db #0x00	; 0
   5AAC                     996 _g_tiles_079:
   5AAC 00                  997 	.db #0x00	; 0
   5AAD 00                  998 	.db #0x00	; 0
   5AAE 00                  999 	.db #0x00	; 0
   5AAF 00                 1000 	.db #0x00	; 0
   5AB0 00                 1001 	.db #0x00	; 0
   5AB1 00                 1002 	.db #0x00	; 0
   5AB2 00                 1003 	.db #0x00	; 0
   5AB3 00                 1004 	.db #0x00	; 0
   5AB4                    1005 _g_tiles_080:
   5AB4 00                 1006 	.db #0x00	; 0
   5AB5 00                 1007 	.db #0x00	; 0
   5AB6 00                 1008 	.db #0x00	; 0
   5AB7 00                 1009 	.db #0x00	; 0
   5AB8 00                 1010 	.db #0x00	; 0
   5AB9 00                 1011 	.db #0x00	; 0
   5ABA 00                 1012 	.db #0x00	; 0
   5ABB 00                 1013 	.db #0x00	; 0
   5ABC                    1014 _g_tiles_081:
   5ABC 00                 1015 	.db #0x00	; 0
   5ABD 00                 1016 	.db #0x00	; 0
   5ABE 00                 1017 	.db #0x00	; 0
   5ABF 00                 1018 	.db #0x00	; 0
   5AC0 00                 1019 	.db #0x00	; 0
   5AC1 00                 1020 	.db #0x00	; 0
   5AC2 00                 1021 	.db #0x00	; 0
   5AC3 00                 1022 	.db #0x00	; 0
   5AC4                    1023 _g_tiles_082:
   5AC4 00                 1024 	.db #0x00	; 0
   5AC5 00                 1025 	.db #0x00	; 0
   5AC6 00                 1026 	.db #0x00	; 0
   5AC7 00                 1027 	.db #0x00	; 0
   5AC8 00                 1028 	.db #0x00	; 0
   5AC9 00                 1029 	.db #0x00	; 0
   5ACA 00                 1030 	.db #0x00	; 0
   5ACB 00                 1031 	.db #0x00	; 0
   5ACC                    1032 _g_tiles_083:
   5ACC 00                 1033 	.db #0x00	; 0
   5ACD 00                 1034 	.db #0x00	; 0
   5ACE 00                 1035 	.db #0x00	; 0
   5ACF 00                 1036 	.db #0x00	; 0
   5AD0 00                 1037 	.db #0x00	; 0
   5AD1 00                 1038 	.db #0x00	; 0
   5AD2 00                 1039 	.db #0x00	; 0
   5AD3 00                 1040 	.db #0x00	; 0
   5AD4                    1041 _g_tiles_084:
   5AD4 00                 1042 	.db #0x00	; 0
   5AD5 00                 1043 	.db #0x00	; 0
   5AD6 00                 1044 	.db #0x00	; 0
   5AD7 00                 1045 	.db #0x00	; 0
   5AD8 00                 1046 	.db #0x00	; 0
   5AD9 00                 1047 	.db #0x00	; 0
   5ADA 00                 1048 	.db #0x00	; 0
   5ADB 00                 1049 	.db #0x00	; 0
   5ADC                    1050 _g_tiles_085:
   5ADC 00                 1051 	.db #0x00	; 0
   5ADD 00                 1052 	.db #0x00	; 0
   5ADE 00                 1053 	.db #0x00	; 0
   5ADF 00                 1054 	.db #0x00	; 0
   5AE0 00                 1055 	.db #0x00	; 0
   5AE1 00                 1056 	.db #0x00	; 0
   5AE2 00                 1057 	.db #0x00	; 0
   5AE3 00                 1058 	.db #0x00	; 0
   5AE4                    1059 _g_tiles_086:
   5AE4 00                 1060 	.db #0x00	; 0
   5AE5 00                 1061 	.db #0x00	; 0
   5AE6 00                 1062 	.db #0x00	; 0
   5AE7 00                 1063 	.db #0x00	; 0
   5AE8 00                 1064 	.db #0x00	; 0
   5AE9 00                 1065 	.db #0x00	; 0
   5AEA 00                 1066 	.db #0x00	; 0
   5AEB 00                 1067 	.db #0x00	; 0
   5AEC                    1068 _g_tiles_087:
   5AEC 68                 1069 	.db #0x68	; 104	'h'
   5AED 3C                 1070 	.db #0x3c	; 60
   5AEE 05                 1071 	.db #0x05	; 5
   5AEF CF                 1072 	.db #0xcf	; 207
   5AF0 68                 1073 	.db #0x68	; 104	'h'
   5AF1 3C                 1074 	.db #0x3c	; 60
   5AF2 68                 1075 	.db #0x68	; 104	'h'
   5AF3 3C                 1076 	.db #0x3c	; 60
   5AF4                    1077 _g_tiles_088:
   5AF4 9F                 1078 	.db #0x9f	; 159
   5AF5 00                 1079 	.db #0x00	; 0
   5AF6 8A                 1080 	.db #0x8a	; 138
   5AF7 00                 1081 	.db #0x00	; 0
   5AF8 9F                 1082 	.db #0x9f	; 159
   5AF9 00                 1083 	.db #0x00	; 0
   5AFA 9F                 1084 	.db #0x9f	; 159
   5AFB 00                 1085 	.db #0x00	; 0
   5AFC                    1086 _g_tiles_089:
   5AFC 00                 1087 	.db #0x00	; 0
   5AFD 00                 1088 	.db #0x00	; 0
   5AFE 00                 1089 	.db #0x00	; 0
   5AFF 00                 1090 	.db #0x00	; 0
   5B00 00                 1091 	.db #0x00	; 0
   5B01 00                 1092 	.db #0x00	; 0
   5B02 00                 1093 	.db #0x00	; 0
   5B03 00                 1094 	.db #0x00	; 0
   5B04                    1095 _g_tiles_090:
   5B04 00                 1096 	.db #0x00	; 0
   5B05 00                 1097 	.db #0x00	; 0
   5B06 00                 1098 	.db #0x00	; 0
   5B07 00                 1099 	.db #0x00	; 0
   5B08 00                 1100 	.db #0x00	; 0
   5B09 00                 1101 	.db #0x00	; 0
   5B0A 00                 1102 	.db #0x00	; 0
   5B0B 00                 1103 	.db #0x00	; 0
   5B0C                    1104 _g_tiles_091:
   5B0C 00                 1105 	.db #0x00	; 0
   5B0D 00                 1106 	.db #0x00	; 0
   5B0E 00                 1107 	.db #0x00	; 0
   5B0F 00                 1108 	.db #0x00	; 0
   5B10 00                 1109 	.db #0x00	; 0
   5B11 00                 1110 	.db #0x00	; 0
   5B12 00                 1111 	.db #0x00	; 0
   5B13 00                 1112 	.db #0x00	; 0
   5B14                    1113 _g_tiles_092:
   5B14 00                 1114 	.db #0x00	; 0
   5B15 00                 1115 	.db #0x00	; 0
   5B16 00                 1116 	.db #0x00	; 0
   5B17 00                 1117 	.db #0x00	; 0
   5B18 00                 1118 	.db #0x00	; 0
   5B19 00                 1119 	.db #0x00	; 0
   5B1A 00                 1120 	.db #0x00	; 0
   5B1B 00                 1121 	.db #0x00	; 0
   5B1C                    1122 _g_tiles_093:
   5B1C 00                 1123 	.db #0x00	; 0
   5B1D 00                 1124 	.db #0x00	; 0
   5B1E 00                 1125 	.db #0x00	; 0
   5B1F 00                 1126 	.db #0x00	; 0
   5B20 00                 1127 	.db #0x00	; 0
   5B21 00                 1128 	.db #0x00	; 0
   5B22 00                 1129 	.db #0x00	; 0
   5B23 00                 1130 	.db #0x00	; 0
   5B24                    1131 _g_tiles_094:
   5B24 00                 1132 	.db #0x00	; 0
   5B25 00                 1133 	.db #0x00	; 0
   5B26 00                 1134 	.db #0x00	; 0
   5B27 00                 1135 	.db #0x00	; 0
   5B28 00                 1136 	.db #0x00	; 0
   5B29 00                 1137 	.db #0x00	; 0
   5B2A 00                 1138 	.db #0x00	; 0
   5B2B 00                 1139 	.db #0x00	; 0
   5B2C                    1140 _g_tiles_095:
   5B2C 00                 1141 	.db #0x00	; 0
   5B2D 00                 1142 	.db #0x00	; 0
   5B2E 00                 1143 	.db #0x00	; 0
   5B2F 00                 1144 	.db #0x00	; 0
   5B30 00                 1145 	.db #0x00	; 0
   5B31 00                 1146 	.db #0x00	; 0
   5B32 00                 1147 	.db #0x00	; 0
   5B33 00                 1148 	.db #0x00	; 0
   5B34                    1149 _g_tiles_096:
   5B34 F3                 1150 	.db #0xf3	; 243
   5B35 F3                 1151 	.db #0xf3	; 243
   5B36 F3                 1152 	.db #0xf3	; 243
   5B37 F3                 1153 	.db #0xf3	; 243
   5B38 F3                 1154 	.db #0xf3	; 243
   5B39 F3                 1155 	.db #0xf3	; 243
   5B3A F3                 1156 	.db #0xf3	; 243
   5B3B F3                 1157 	.db #0xf3	; 243
   5B3C                    1158 _g_tiles_097:
   5B3C 3F                 1159 	.db #0x3f	; 63
   5B3D 3F                 1160 	.db #0x3f	; 63
   5B3E 3F                 1161 	.db #0x3f	; 63
   5B3F 3F                 1162 	.db #0x3f	; 63
   5B40 3F                 1163 	.db #0x3f	; 63
   5B41 3F                 1164 	.db #0x3f	; 63
   5B42 3F                 1165 	.db #0x3f	; 63
   5B43 3F                 1166 	.db #0x3f	; 63
   5B44                    1167 _g_tiles_098:
   5B44 CF                 1168 	.db #0xcf	; 207
   5B45 CF                 1169 	.db #0xcf	; 207
   5B46 CF                 1170 	.db #0xcf	; 207
   5B47 CF                 1171 	.db #0xcf	; 207
   5B48 CF                 1172 	.db #0xcf	; 207
   5B49 CF                 1173 	.db #0xcf	; 207
   5B4A CF                 1174 	.db #0xcf	; 207
   5B4B CF                 1175 	.db #0xcf	; 207
   5B4C                    1176 _g_tiles_099:
   5B4C 0F                 1177 	.db #0x0f	; 15
   5B4D 0F                 1178 	.db #0x0f	; 15
   5B4E 0F                 1179 	.db #0x0f	; 15
   5B4F 0F                 1180 	.db #0x0f	; 15
   5B50 0F                 1181 	.db #0x0f	; 15
   5B51 0F                 1182 	.db #0x0f	; 15
   5B52 0F                 1183 	.db #0x0f	; 15
   5B53 0F                 1184 	.db #0x0f	; 15
   5B54                    1185 _g_tiles_100:
   5B54 00                 1186 	.db #0x00	; 0
   5B55 00                 1187 	.db #0x00	; 0
   5B56 00                 1188 	.db #0x00	; 0
   5B57 00                 1189 	.db #0x00	; 0
   5B58 00                 1190 	.db #0x00	; 0
   5B59 00                 1191 	.db #0x00	; 0
   5B5A 00                 1192 	.db #0x00	; 0
   5B5B 00                 1193 	.db #0x00	; 0
   5B5C                    1194 _g_tiles_101:
   5B5C 00                 1195 	.db #0x00	; 0
   5B5D 00                 1196 	.db #0x00	; 0
   5B5E 00                 1197 	.db #0x00	; 0
   5B5F 00                 1198 	.db #0x00	; 0
   5B60 00                 1199 	.db #0x00	; 0
   5B61 00                 1200 	.db #0x00	; 0
   5B62 00                 1201 	.db #0x00	; 0
   5B63 00                 1202 	.db #0x00	; 0
   5B64                    1203 _g_tiles_102:
   5B64 00                 1204 	.db #0x00	; 0
   5B65 00                 1205 	.db #0x00	; 0
   5B66 00                 1206 	.db #0x00	; 0
   5B67 00                 1207 	.db #0x00	; 0
   5B68 00                 1208 	.db #0x00	; 0
   5B69 00                 1209 	.db #0x00	; 0
   5B6A 00                 1210 	.db #0x00	; 0
   5B6B 00                 1211 	.db #0x00	; 0
   5B6C                    1212 _g_tiles_103:
   5B6C 00                 1213 	.db #0x00	; 0
   5B6D 00                 1214 	.db #0x00	; 0
   5B6E 00                 1215 	.db #0x00	; 0
   5B6F 00                 1216 	.db #0x00	; 0
   5B70 00                 1217 	.db #0x00	; 0
   5B71 00                 1218 	.db #0x00	; 0
   5B72 00                 1219 	.db #0x00	; 0
   5B73 00                 1220 	.db #0x00	; 0
   5B74                    1221 _g_tiles_104:
   5B74 00                 1222 	.db #0x00	; 0
   5B75 00                 1223 	.db #0x00	; 0
   5B76 00                 1224 	.db #0x00	; 0
   5B77 00                 1225 	.db #0x00	; 0
   5B78 00                 1226 	.db #0x00	; 0
   5B79 00                 1227 	.db #0x00	; 0
   5B7A 00                 1228 	.db #0x00	; 0
   5B7B 00                 1229 	.db #0x00	; 0
   5B7C                    1230 _g_tiles_105:
   5B7C 68                 1231 	.db #0x68	; 104	'h'
   5B7D 3C                 1232 	.db #0x3c	; 60
   5B7E 68                 1233 	.db #0x68	; 104	'h'
   5B7F 3C                 1234 	.db #0x3c	; 60
   5B80 68                 1235 	.db #0x68	; 104	'h'
   5B81 3C                 1236 	.db #0x3c	; 60
   5B82 68                 1237 	.db #0x68	; 104	'h'
   5B83 3C                 1238 	.db #0x3c	; 60
   5B84                    1239 _g_tiles_106:
   5B84 9F                 1240 	.db #0x9f	; 159
   5B85 00                 1241 	.db #0x00	; 0
   5B86 9F                 1242 	.db #0x9f	; 159
   5B87 00                 1243 	.db #0x00	; 0
   5B88 9F                 1244 	.db #0x9f	; 159
   5B89 00                 1245 	.db #0x00	; 0
   5B8A 9F                 1246 	.db #0x9f	; 159
   5B8B 00                 1247 	.db #0x00	; 0
   5B8C                    1248 _g_tiles_107:
   5B8C 68                 1249 	.db #0x68	; 104	'h'
   5B8D 3C                 1250 	.db #0x3c	; 60
   5B8E 68                 1251 	.db #0x68	; 104	'h'
   5B8F 3C                 1252 	.db #0x3c	; 60
   5B90 40                 1253 	.db #0x40	; 64
   5B91 6D                 1254 	.db #0x6d	; 109	'm'
   5B92 05                 1255 	.db #0x05	; 5
   5B93 45                 1256 	.db #0x45	; 69	'E'
   5B94                    1257 _g_tiles_108:
   5B94 9F                 1258 	.db #0x9f	; 159
   5B95 00                 1259 	.db #0x00	; 0
   5B96 9F                 1260 	.db #0x9f	; 159
   5B97 00                 1261 	.db #0x00	; 0
   5B98 9F                 1262 	.db #0x9f	; 159
   5B99 00                 1263 	.db #0x00	; 0
   5B9A 9F                 1264 	.db #0x9f	; 159
   5B9B 00                 1265 	.db #0x00	; 0
   5B9C                    1266 _g_tiles_109:
   5B9C 00                 1267 	.db #0x00	; 0
   5B9D 00                 1268 	.db #0x00	; 0
   5B9E 00                 1269 	.db #0x00	; 0
   5B9F 00                 1270 	.db #0x00	; 0
   5BA0 00                 1271 	.db #0x00	; 0
   5BA1 00                 1272 	.db #0x00	; 0
   5BA2 00                 1273 	.db #0x00	; 0
   5BA3 00                 1274 	.db #0x00	; 0
   5BA4                    1275 _g_tiles_110:
   5BA4 00                 1276 	.db #0x00	; 0
   5BA5 00                 1277 	.db #0x00	; 0
   5BA6 00                 1278 	.db #0x00	; 0
   5BA7 00                 1279 	.db #0x00	; 0
   5BA8 00                 1280 	.db #0x00	; 0
   5BA9 00                 1281 	.db #0x00	; 0
   5BAA 00                 1282 	.db #0x00	; 0
   5BAB 00                 1283 	.db #0x00	; 0
   5BAC                    1284 _g_tiles_111:
   5BAC 00                 1285 	.db #0x00	; 0
   5BAD 00                 1286 	.db #0x00	; 0
   5BAE 00                 1287 	.db #0x00	; 0
   5BAF 00                 1288 	.db #0x00	; 0
   5BB0 00                 1289 	.db #0x00	; 0
   5BB1 00                 1290 	.db #0x00	; 0
   5BB2 00                 1291 	.db #0x00	; 0
   5BB3 00                 1292 	.db #0x00	; 0
   5BB4                    1293 _g_tiles_112:
   5BB4 00                 1294 	.db #0x00	; 0
   5BB5 00                 1295 	.db #0x00	; 0
   5BB6 00                 1296 	.db #0x00	; 0
   5BB7 00                 1297 	.db #0x00	; 0
   5BB8 00                 1298 	.db #0x00	; 0
   5BB9 00                 1299 	.db #0x00	; 0
   5BBA 00                 1300 	.db #0x00	; 0
   5BBB 00                 1301 	.db #0x00	; 0
   5BBC                    1302 _g_tiles_113:
   5BBC 00                 1303 	.db #0x00	; 0
   5BBD 00                 1304 	.db #0x00	; 0
   5BBE 00                 1305 	.db #0x00	; 0
   5BBF 00                 1306 	.db #0x00	; 0
   5BC0 00                 1307 	.db #0x00	; 0
   5BC1 00                 1308 	.db #0x00	; 0
   5BC2 00                 1309 	.db #0x00	; 0
   5BC3 00                 1310 	.db #0x00	; 0
   5BC4                    1311 _g_tiles_114:
   5BC4 00                 1312 	.db #0x00	; 0
   5BC5 00                 1313 	.db #0x00	; 0
   5BC6 00                 1314 	.db #0x00	; 0
   5BC7 00                 1315 	.db #0x00	; 0
   5BC8 00                 1316 	.db #0x00	; 0
   5BC9 00                 1317 	.db #0x00	; 0
   5BCA 00                 1318 	.db #0x00	; 0
   5BCB 00                 1319 	.db #0x00	; 0
   5BCC                    1320 _g_tiles_115:
   5BCC 00                 1321 	.db #0x00	; 0
   5BCD 00                 1322 	.db #0x00	; 0
   5BCE 00                 1323 	.db #0x00	; 0
   5BCF 00                 1324 	.db #0x00	; 0
   5BD0 00                 1325 	.db #0x00	; 0
   5BD1 00                 1326 	.db #0x00	; 0
   5BD2 00                 1327 	.db #0x00	; 0
   5BD3 00                 1328 	.db #0x00	; 0
   5BD4                    1329 _g_tiles_116:
   5BD4 3F                 1330 	.db #0x3f	; 63
   5BD5 3F                 1331 	.db #0x3f	; 63
   5BD6 3F                 1332 	.db #0x3f	; 63
   5BD7 3F                 1333 	.db #0x3f	; 63
   5BD8 3F                 1334 	.db #0x3f	; 63
   5BD9 3F                 1335 	.db #0x3f	; 63
   5BDA 3F                 1336 	.db #0x3f	; 63
   5BDB 3F                 1337 	.db #0x3f	; 63
   5BDC                    1338 _g_tiles_117:
   5BDC F3                 1339 	.db #0xf3	; 243
   5BDD F3                 1340 	.db #0xf3	; 243
   5BDE F3                 1341 	.db #0xf3	; 243
   5BDF F3                 1342 	.db #0xf3	; 243
   5BE0 F3                 1343 	.db #0xf3	; 243
   5BE1 F3                 1344 	.db #0xf3	; 243
   5BE2 F3                 1345 	.db #0xf3	; 243
   5BE3 F3                 1346 	.db #0xf3	; 243
   5BE4                    1347 _g_tiles_118:
   5BE4 0F                 1348 	.db #0x0f	; 15
   5BE5 0F                 1349 	.db #0x0f	; 15
   5BE6 0F                 1350 	.db #0x0f	; 15
   5BE7 0F                 1351 	.db #0x0f	; 15
   5BE8 0F                 1352 	.db #0x0f	; 15
   5BE9 0F                 1353 	.db #0x0f	; 15
   5BEA 0F                 1354 	.db #0x0f	; 15
   5BEB 0F                 1355 	.db #0x0f	; 15
   5BEC                    1356 _g_tiles_119:
   5BEC CF                 1357 	.db #0xcf	; 207
   5BED CF                 1358 	.db #0xcf	; 207
   5BEE CF                 1359 	.db #0xcf	; 207
   5BEF CF                 1360 	.db #0xcf	; 207
   5BF0 CF                 1361 	.db #0xcf	; 207
   5BF1 CF                 1362 	.db #0xcf	; 207
   5BF2 CF                 1363 	.db #0xcf	; 207
   5BF3 CF                 1364 	.db #0xcf	; 207
                           1365 	.area _INITIALIZER
                           1366 	.area _CABS (ABS)
