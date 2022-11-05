                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module text
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _strlen
                             12 	.globl _cpct_getScreenPtr
                             13 	.globl _cpct_drawSprite
                             14 	.globl _text_write_centered_string
                             15 	.globl _text_write_string
                             16 ;--------------------------------------------------------
                             17 ; special function registers
                             18 ;--------------------------------------------------------
                             19 ;--------------------------------------------------------
                             20 ; ram data
                             21 ;--------------------------------------------------------
                             22 	.area _DATA
                             23 ;--------------------------------------------------------
                             24 ; ram data
                             25 ;--------------------------------------------------------
                             26 	.area _INITIALIZED
                             27 ;--------------------------------------------------------
                             28 ; absolute external ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DABS (ABS)
                             31 ;--------------------------------------------------------
                             32 ; global & static initialisations
                             33 ;--------------------------------------------------------
                             34 	.area _HOME
                             35 	.area _GSINIT
                             36 	.area _GSFINAL
                             37 	.area _GSINIT
                             38 ;--------------------------------------------------------
                             39 ; Home
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _HOME
                             43 ;--------------------------------------------------------
                             44 ; code
                             45 ;--------------------------------------------------------
                             46 	.area _CODE
                             47 ;src/text.c:7: void text_write_centered_string(u8 y, char * text) {
                             48 ;	---------------------------------
                             49 ; Function text_write_centered_string
                             50 ; ---------------------------------
   7D3F                      51 _text_write_centered_string::
                             52 ;src/text.c:10: u8 x = (SCREEN_WIDTH_BYTES - strlen(text) * 2) / 2;
   7D3F 21 03 00      [10]   53 	ld	hl, #3
   7D42 39            [11]   54 	add	hl, sp
   7D43 4E            [ 7]   55 	ld	c, (hl)
   7D44 23            [ 6]   56 	inc	hl
   7D45 46            [ 7]   57 	ld	b, (hl)
   7D46 C5            [11]   58 	push	bc
   7D47 CD A3 81      [17]   59 	call	_strlen
   7D4A F1            [10]   60 	pop	af
   7D4B 29            [11]   61 	add	hl, hl
   7D4C 4D            [ 4]   62 	ld	c, l
   7D4D 44            [ 4]   63 	ld	b, h
   7D4E 3E 50         [ 7]   64 	ld	a, #0x50
   7D50 91            [ 4]   65 	sub	a, c
   7D51 4F            [ 4]   66 	ld	c, a
   7D52 3E 00         [ 7]   67 	ld	a, #0x00
   7D54 98            [ 4]   68 	sbc	a, b
   7D55 47            [ 4]   69 	ld	b, a
   7D56 CB 38         [ 8]   70 	srl	b
   7D58 CB 19         [ 8]   71 	rr	c
   7D5A 41            [ 4]   72 	ld	b, c
                             73 ;src/text.c:11: text_write_string(x, y, text);
   7D5B 21 03 00      [10]   74 	ld	hl, #3
   7D5E 39            [11]   75 	add	hl, sp
   7D5F 7E            [ 7]   76 	ld	a, (hl)
   7D60 23            [ 6]   77 	inc	hl
   7D61 66            [ 7]   78 	ld	h, (hl)
   7D62 6F            [ 4]   79 	ld	l, a
   7D63 E5            [11]   80 	push	hl
   7D64 21 04 00      [10]   81 	ld	hl, #4+0
   7D67 39            [11]   82 	add	hl, sp
   7D68 7E            [ 7]   83 	ld	a, (hl)
   7D69 F5            [11]   84 	push	af
   7D6A 33            [ 6]   85 	inc	sp
   7D6B C5            [11]   86 	push	bc
   7D6C 33            [ 6]   87 	inc	sp
   7D6D CD 73 7D      [17]   88 	call	_text_write_string
   7D70 F1            [10]   89 	pop	af
   7D71 F1            [10]   90 	pop	af
   7D72 C9            [10]   91 	ret
                             92 ;src/text.c:15: void text_write_string(u8 x, u8 y, char * text) {
                             93 ;	---------------------------------
                             94 ; Function text_write_string
                             95 ; ---------------------------------
   7D73                      96 _text_write_string::
   7D73 DD E5         [15]   97 	push	ix
   7D75 DD 21 00 00   [14]   98 	ld	ix,#0
   7D79 DD 39         [15]   99 	add	ix,sp
   7D7B 21 F9 FF      [10]  100 	ld	hl, #-7
   7D7E 39            [11]  101 	add	hl, sp
   7D7F F9            [ 6]  102 	ld	sp, hl
                            103 ;src/text.c:16: u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   7D80 DD 66 05      [19]  104 	ld	h, 5 (ix)
   7D83 DD 6E 04      [19]  105 	ld	l, 4 (ix)
   7D86 E5            [11]  106 	push	hl
   7D87 21 00 C0      [10]  107 	ld	hl, #0xc000
   7D8A E5            [11]  108 	push	hl
   7D8B CD C9 82      [17]  109 	call	_cpct_getScreenPtr
   7D8E DD 75 FD      [19]  110 	ld	-3 (ix), l
   7D91 DD 74 FE      [19]  111 	ld	-2 (ix), h
                            112 ;src/text.c:20: while (*text) {
   7D94 DD 7E 06      [19]  113 	ld	a, 6 (ix)
   7D97 DD 77 FB      [19]  114 	ld	-5 (ix), a
   7D9A DD 7E 07      [19]  115 	ld	a, 7 (ix)
   7D9D DD 77 FC      [19]  116 	ld	-4 (ix), a
   7DA0                     117 00125$:
   7DA0 DD 6E FB      [19]  118 	ld	l,-5 (ix)
   7DA3 DD 66 FC      [19]  119 	ld	h,-4 (ix)
   7DA6 7E            [ 7]  120 	ld	a, (hl)
   7DA7 DD 77 FF      [19]  121 	ld	-1 (ix), a
   7DAA B7            [ 4]  122 	or	a, a
   7DAB CA 7F 7E      [10]  123 	jp	Z, 00128$
                            124 ;src/text.c:21: charsprite = 0;
   7DAE 21 00 00      [10]  125 	ld	hl, #0x0000
   7DB1 E3            [19]  126 	ex	(sp), hl
                            127 ;src/text.c:23: index = (*text) - '0'; 
   7DB2 DD 4E FF      [19]  128 	ld	c, -1 (ix)
                            129 ;src/text.c:22: if (*text >= '0' && *text <= '9') {
   7DB5 DD 7E FF      [19]  130 	ld	a, -1 (ix)
   7DB8 D6 30         [ 7]  131 	sub	a, #0x30
   7DBA 38 1B         [12]  132 	jr	C,00120$
   7DBC 3E 39         [ 7]  133 	ld	a, #0x39
   7DBE DD 96 FF      [19]  134 	sub	a, -1 (ix)
   7DC1 38 14         [12]  135 	jr	C,00120$
                            136 ;src/text.c:23: index = (*text) - '0'; 
   7DC3 79            [ 4]  137 	ld	a, c
   7DC4 C6 D0         [ 7]  138 	add	a, #0xd0
   7DC6 6F            [ 4]  139 	ld	l, a
                            140 ;src/text.c:24: charsprite = sp_font_00 + (index * (SP_FONT_CHAR_W * SP_FONT_CHAR_H));           
   7DC7 26 00         [ 7]  141 	ld	h, #0x00
   7DC9 29            [11]  142 	add	hl, hl
   7DCA 29            [11]  143 	add	hl, hl
   7DCB 29            [11]  144 	add	hl, hl
   7DCC 29            [11]  145 	add	hl, hl
   7DCD 11 F4 5B      [10]  146 	ld	de, #_sp_font_00
   7DD0 19            [11]  147 	add	hl, de
   7DD1 33            [ 6]  148 	inc	sp
   7DD2 33            [ 6]  149 	inc	sp
   7DD3 E5            [11]  150 	push	hl
   7DD4 C3 4B 7E      [10]  151 	jp	00121$
   7DD7                     152 00120$:
                            153 ;src/text.c:25: } else if (*text >= 'A' && *text <= 'Z') {
   7DD7 DD 7E FF      [19]  154 	ld	a, -1 (ix)
   7DDA D6 41         [ 7]  155 	sub	a, #0x41
   7DDC 38 1A         [12]  156 	jr	C,00116$
   7DDE 3E 5A         [ 7]  157 	ld	a, #0x5a
   7DE0 DD 96 FF      [19]  158 	sub	a, -1 (ix)
   7DE3 38 13         [12]  159 	jr	C,00116$
                            160 ;src/text.c:26: index = (*text) - 'A'; 
   7DE5 79            [ 4]  161 	ld	a, c
   7DE6 C6 BF         [ 7]  162 	add	a, #0xbf
   7DE8 6F            [ 4]  163 	ld	l, a
                            164 ;src/text.c:27: charsprite = sp_font_10 + (index * (SP_FONT_CHAR_W * SP_FONT_CHAR_H));           
   7DE9 26 00         [ 7]  165 	ld	h, #0x00
   7DEB 29            [11]  166 	add	hl, hl
   7DEC 29            [11]  167 	add	hl, hl
   7DED 29            [11]  168 	add	hl, hl
   7DEE 29            [11]  169 	add	hl, hl
   7DEF 11 94 5C      [10]  170 	ld	de, #_sp_font_10
   7DF2 19            [11]  171 	add	hl, de
   7DF3 33            [ 6]  172 	inc	sp
   7DF4 33            [ 6]  173 	inc	sp
   7DF5 E5            [11]  174 	push	hl
   7DF6 18 53         [12]  175 	jr	00121$
   7DF8                     176 00116$:
                            177 ;src/text.c:29: } else if (*text == ':') {
   7DF8 DD 7E FF      [19]  178 	ld	a, -1 (ix)
   7DFB D6 3A         [ 7]  179 	sub	a, #0x3a
   7DFD 20 0A         [12]  180 	jr	NZ,00113$
                            181 ;src/text.c:30: charsprite = sp_font_36;                       
   7DFF DD 36 F9 34   [19]  182 	ld	-7 (ix), #<(_sp_font_36)
   7E03 DD 36 FA 5E   [19]  183 	ld	-6 (ix), #>(_sp_font_36)
   7E07 18 42         [12]  184 	jr	00121$
   7E09                     185 00113$:
                            186 ;src/text.c:31: } else if (*text == '?') {
   7E09 DD 7E FF      [19]  187 	ld	a, -1 (ix)
   7E0C D6 3F         [ 7]  188 	sub	a, #0x3f
   7E0E 20 0A         [12]  189 	jr	NZ,00110$
                            190 ;src/text.c:32: charsprite = sp_font_37;                       
   7E10 DD 36 F9 44   [19]  191 	ld	-7 (ix), #<(_sp_font_37)
   7E14 DD 36 FA 5E   [19]  192 	ld	-6 (ix), #>(_sp_font_37)
   7E18 18 31         [12]  193 	jr	00121$
   7E1A                     194 00110$:
                            195 ;src/text.c:33: } else if (*text == ' ') {
   7E1A DD 7E FF      [19]  196 	ld	a, -1 (ix)
   7E1D D6 20         [ 7]  197 	sub	a, #0x20
   7E1F 20 0A         [12]  198 	jr	NZ,00107$
                            199 ;src/text.c:34: charsprite = sp_font_38;                       
   7E21 DD 36 F9 54   [19]  200 	ld	-7 (ix), #<(_sp_font_38)
   7E25 DD 36 FA 5E   [19]  201 	ld	-6 (ix), #>(_sp_font_38)
   7E29 18 20         [12]  202 	jr	00121$
   7E2B                     203 00107$:
                            204 ;src/text.c:35: } else if (*text == '.') {
   7E2B DD 7E FF      [19]  205 	ld	a, -1 (ix)
   7E2E D6 2E         [ 7]  206 	sub	a, #0x2e
   7E30 20 0A         [12]  207 	jr	NZ,00104$
                            208 ;src/text.c:36: charsprite = sp_font_39;                       
   7E32 DD 36 F9 64   [19]  209 	ld	-7 (ix), #<(_sp_font_39)
   7E36 DD 36 FA 5E   [19]  210 	ld	-6 (ix), #>(_sp_font_39)
   7E3A 18 0F         [12]  211 	jr	00121$
   7E3C                     212 00104$:
                            213 ;src/text.c:37: } else if (*text == ',') {
   7E3C DD 7E FF      [19]  214 	ld	a, -1 (ix)
   7E3F D6 2C         [ 7]  215 	sub	a, #0x2c
   7E41 20 08         [12]  216 	jr	NZ,00121$
                            217 ;src/text.c:38: charsprite = sp_font_40;                       
   7E43 DD 36 F9 74   [19]  218 	ld	-7 (ix), #<(_sp_font_40)
   7E47 DD 36 FA 5E   [19]  219 	ld	-6 (ix), #>(_sp_font_40)
   7E4B                     220 00121$:
                            221 ;src/text.c:41: if (charsprite != 0) {
   7E4B DD 7E FA      [19]  222 	ld	a, -6 (ix)
   7E4E DD B6 F9      [19]  223 	or	a,-7 (ix)
   7E51 28 11         [12]  224 	jr	Z,00124$
                            225 ;src/text.c:42: cpct_drawSprite(charsprite, svmem , SP_FONT_CHAR_W, SP_FONT_CHAR_H);
   7E53 DD 4E FD      [19]  226 	ld	c,-3 (ix)
   7E56 DD 46 FE      [19]  227 	ld	b,-2 (ix)
   7E59 D1            [10]  228 	pop	de
   7E5A D5            [11]  229 	push	de
   7E5B 21 02 08      [10]  230 	ld	hl, #0x0802
   7E5E E5            [11]  231 	push	hl
   7E5F C5            [11]  232 	push	bc
   7E60 D5            [11]  233 	push	de
   7E61 CD 5E 7F      [17]  234 	call	_cpct_drawSprite
   7E64                     235 00124$:
                            236 ;src/text.c:45: text++;
   7E64 DD 34 FB      [23]  237 	inc	-5 (ix)
   7E67 20 03         [12]  238 	jr	NZ,00189$
   7E69 DD 34 FC      [23]  239 	inc	-4 (ix)
   7E6C                     240 00189$:
                            241 ;src/text.c:46: svmem += 2;
   7E6C DD 7E FD      [19]  242 	ld	a, -3 (ix)
   7E6F C6 02         [ 7]  243 	add	a, #0x02
   7E71 DD 77 FD      [19]  244 	ld	-3 (ix), a
   7E74 DD 7E FE      [19]  245 	ld	a, -2 (ix)
   7E77 CE 00         [ 7]  246 	adc	a, #0x00
   7E79 DD 77 FE      [19]  247 	ld	-2 (ix), a
   7E7C C3 A0 7D      [10]  248 	jp	00125$
   7E7F                     249 00128$:
   7E7F DD F9         [10]  250 	ld	sp, ix
   7E81 DD E1         [14]  251 	pop	ix
   7E83 C9            [10]  252 	ret
                            253 	.area _CODE
                            254 	.area _INITIALIZER
                            255 	.area _CABS (ABS)
