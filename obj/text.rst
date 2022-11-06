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
                             47 ;src/text.c:19: void text_write_centered_string(u8 y, char *text)
                             48 ;	---------------------------------
                             49 ; Function text_write_centered_string
                             50 ; ---------------------------------
   87BA                      51 _text_write_centered_string::
                             52 ;src/text.c:21: u8 x = (SCREEN_WIDTH_BYTES - strlen(text) * SP_FONT_CHAR_W) / 2;
   87BA 21 03 00      [10]   53 	ld	hl, #3
   87BD 39            [11]   54 	add	hl, sp
   87BE 4E            [ 7]   55 	ld	c, (hl)
   87BF 23            [ 6]   56 	inc	hl
   87C0 46            [ 7]   57 	ld	b, (hl)
   87C1 C5            [11]   58 	push	bc
   87C2 CD 1E 8C      [17]   59 	call	_strlen
   87C5 F1            [10]   60 	pop	af
   87C6 29            [11]   61 	add	hl, hl
   87C7 4D            [ 4]   62 	ld	c, l
   87C8 44            [ 4]   63 	ld	b, h
   87C9 3E 50         [ 7]   64 	ld	a, #0x50
   87CB 91            [ 4]   65 	sub	a, c
   87CC 4F            [ 4]   66 	ld	c, a
   87CD 3E 00         [ 7]   67 	ld	a, #0x00
   87CF 98            [ 4]   68 	sbc	a, b
   87D0 47            [ 4]   69 	ld	b, a
   87D1 CB 38         [ 8]   70 	srl	b
   87D3 CB 19         [ 8]   71 	rr	c
   87D5 41            [ 4]   72 	ld	b, c
                             73 ;src/text.c:22: text_write_string(x, y, text);
   87D6 21 03 00      [10]   74 	ld	hl, #3
   87D9 39            [11]   75 	add	hl, sp
   87DA 7E            [ 7]   76 	ld	a, (hl)
   87DB 23            [ 6]   77 	inc	hl
   87DC 66            [ 7]   78 	ld	h, (hl)
   87DD 6F            [ 4]   79 	ld	l, a
   87DE E5            [11]   80 	push	hl
   87DF 21 04 00      [10]   81 	ld	hl, #4+0
   87E2 39            [11]   82 	add	hl, sp
   87E3 7E            [ 7]   83 	ld	a, (hl)
   87E4 F5            [11]   84 	push	af
   87E5 33            [ 6]   85 	inc	sp
   87E6 C5            [11]   86 	push	bc
   87E7 33            [ 6]   87 	inc	sp
   87E8 CD EE 87      [17]   88 	call	_text_write_string
   87EB F1            [10]   89 	pop	af
   87EC F1            [10]   90 	pop	af
   87ED C9            [10]   91 	ret
                             92 ;src/text.c:25: void text_write_string(u8 x, u8 y, char *text)
                             93 ;	---------------------------------
                             94 ; Function text_write_string
                             95 ; ---------------------------------
   87EE                      96 _text_write_string::
   87EE DD E5         [15]   97 	push	ix
   87F0 DD 21 00 00   [14]   98 	ld	ix,#0
   87F4 DD 39         [15]   99 	add	ix,sp
   87F6 21 F9 FF      [10]  100 	ld	hl, #-7
   87F9 39            [11]  101 	add	hl, sp
   87FA F9            [ 6]  102 	ld	sp, hl
                            103 ;src/text.c:27: u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   87FB DD 66 05      [19]  104 	ld	h, 5 (ix)
   87FE DD 6E 04      [19]  105 	ld	l, 4 (ix)
   8801 E5            [11]  106 	push	hl
   8802 21 00 C0      [10]  107 	ld	hl, #0xc000
   8805 E5            [11]  108 	push	hl
   8806 CD 44 8D      [17]  109 	call	_cpct_getScreenPtr
   8809 DD 75 FB      [19]  110 	ld	-5 (ix), l
   880C DD 74 FC      [19]  111 	ld	-4 (ix), h
                            112 ;src/text.c:31: while (*text)
   880F DD 7E 06      [19]  113 	ld	a, 6 (ix)
   8812 DD 77 FD      [19]  114 	ld	-3 (ix), a
   8815 DD 7E 07      [19]  115 	ld	a, 7 (ix)
   8818 DD 77 FE      [19]  116 	ld	-2 (ix), a
   881B                     117 00117$:
   881B DD 6E FD      [19]  118 	ld	l,-3 (ix)
   881E DD 66 FE      [19]  119 	ld	h,-2 (ix)
   8821 7E            [ 7]  120 	ld	a, (hl)
   8822 DD 77 FF      [19]  121 	ld	-1 (ix), a
   8825 B7            [ 4]  122 	or	a, a
   8826 CA FA 88      [10]  123 	jp	Z, 00120$
                            124 ;src/text.c:33: charsprite = 0;
   8829 21 00 00      [10]  125 	ld	hl, #0x0000
   882C E3            [19]  126 	ex	(sp), hl
                            127 ;src/text.c:36: index = (*text) - '0';
   882D DD 4E FF      [19]  128 	ld	c, -1 (ix)
                            129 ;src/text.c:34: if (*text >= '0' && *text <= '9')
   8830 DD 7E FF      [19]  130 	ld	a, -1 (ix)
   8833 D6 30         [ 7]  131 	sub	a, #0x30
   8835 38 1B         [12]  132 	jr	C,00112$
   8837 3E 39         [ 7]  133 	ld	a, #0x39
   8839 DD 96 FF      [19]  134 	sub	a, -1 (ix)
   883C 38 14         [12]  135 	jr	C,00112$
                            136 ;src/text.c:36: index = (*text) - '0';
   883E 79            [ 4]  137 	ld	a, c
   883F C6 D0         [ 7]  138 	add	a, #0xd0
   8841 6F            [ 4]  139 	ld	l, a
                            140 ;src/text.c:37: charsprite = sp_font_00 + (index * (SP_FONT_CHAR_W * SP_FONT_CHAR_H));
   8842 26 00         [ 7]  141 	ld	h, #0x00
   8844 29            [11]  142 	add	hl, hl
   8845 29            [11]  143 	add	hl, hl
   8846 29            [11]  144 	add	hl, hl
   8847 29            [11]  145 	add	hl, hl
   8848 11 80 67      [10]  146 	ld	de, #_sp_font_00
   884B 19            [11]  147 	add	hl, de
   884C 33            [ 6]  148 	inc	sp
   884D 33            [ 6]  149 	inc	sp
   884E E5            [11]  150 	push	hl
   884F C3 C8 88      [10]  151 	jp	00113$
   8852                     152 00112$:
                            153 ;src/text.c:39: else if (*text >= 'A' && *text <= 'Z')
   8852 DD 7E FF      [19]  154 	ld	a, -1 (ix)
   8855 D6 41         [ 7]  155 	sub	a, #0x41
   8857 38 1A         [12]  156 	jr	C,00108$
   8859 3E 5A         [ 7]  157 	ld	a, #0x5a
   885B DD 96 FF      [19]  158 	sub	a, -1 (ix)
   885E 38 13         [12]  159 	jr	C,00108$
                            160 ;src/text.c:41: index = (*text) - 'A';
   8860 79            [ 4]  161 	ld	a, c
   8861 C6 BF         [ 7]  162 	add	a, #0xbf
   8863 6F            [ 4]  163 	ld	l, a
                            164 ;src/text.c:42: charsprite = sp_font_10 + (index * (SP_FONT_CHAR_W * SP_FONT_CHAR_H));
   8864 26 00         [ 7]  165 	ld	h, #0x00
   8866 29            [11]  166 	add	hl, hl
   8867 29            [11]  167 	add	hl, hl
   8868 29            [11]  168 	add	hl, hl
   8869 29            [11]  169 	add	hl, hl
   886A 11 20 68      [10]  170 	ld	de, #_sp_font_10
   886D 19            [11]  171 	add	hl, de
   886E 33            [ 6]  172 	inc	sp
   886F 33            [ 6]  173 	inc	sp
   8870 E5            [11]  174 	push	hl
   8871 18 55         [12]  175 	jr	00113$
   8873                     176 00108$:
                            177 ;src/text.c:46: switch (*text)
   8873 DD 7E FF      [19]  178 	ld	a, -1 (ix)
   8876 D6 20         [ 7]  179 	sub	a, #0x20
   8878 28 32         [12]  180 	jr	Z,00103$
   887A DD 7E FF      [19]  181 	ld	a, -1 (ix)
   887D D6 2C         [ 7]  182 	sub	a, #0x2c
   887F 28 3F         [12]  183 	jr	Z,00105$
   8881 DD 7E FF      [19]  184 	ld	a, -1 (ix)
   8884 D6 2E         [ 7]  185 	sub	a, #0x2e
   8886 28 2E         [12]  186 	jr	Z,00104$
   8888 DD 7E FF      [19]  187 	ld	a, -1 (ix)
   888B D6 3A         [ 7]  188 	sub	a, #0x3a
   888D 28 09         [12]  189 	jr	Z,00101$
   888F DD 7E FF      [19]  190 	ld	a, -1 (ix)
   8892 D6 3F         [ 7]  191 	sub	a, #0x3f
   8894 28 0C         [12]  192 	jr	Z,00102$
   8896 18 30         [12]  193 	jr	00113$
                            194 ;src/text.c:48: case ':':
   8898                     195 00101$:
                            196 ;src/text.c:49: charsprite = sp_font_36;
   8898 DD 36 F9 C0   [19]  197 	ld	-7 (ix), #<(_sp_font_36)
   889C DD 36 FA 69   [19]  198 	ld	-6 (ix), #>(_sp_font_36)
                            199 ;src/text.c:50: break;
   88A0 18 26         [12]  200 	jr	00113$
                            201 ;src/text.c:51: case '?':
   88A2                     202 00102$:
                            203 ;src/text.c:52: charsprite = sp_font_37;
   88A2 DD 36 F9 D0   [19]  204 	ld	-7 (ix), #<(_sp_font_37)
   88A6 DD 36 FA 69   [19]  205 	ld	-6 (ix), #>(_sp_font_37)
                            206 ;src/text.c:53: break;
   88AA 18 1C         [12]  207 	jr	00113$
                            208 ;src/text.c:54: case ' ':
   88AC                     209 00103$:
                            210 ;src/text.c:55: charsprite = sp_font_38;
   88AC DD 36 F9 E0   [19]  211 	ld	-7 (ix), #<(_sp_font_38)
   88B0 DD 36 FA 69   [19]  212 	ld	-6 (ix), #>(_sp_font_38)
                            213 ;src/text.c:56: break;
   88B4 18 12         [12]  214 	jr	00113$
                            215 ;src/text.c:57: case '.':
   88B6                     216 00104$:
                            217 ;src/text.c:58: charsprite = sp_font_39;
   88B6 DD 36 F9 F0   [19]  218 	ld	-7 (ix), #<(_sp_font_39)
   88BA DD 36 FA 69   [19]  219 	ld	-6 (ix), #>(_sp_font_39)
                            220 ;src/text.c:59: break;
   88BE 18 08         [12]  221 	jr	00113$
                            222 ;src/text.c:60: case ',':
   88C0                     223 00105$:
                            224 ;src/text.c:61: charsprite = sp_font_40;
   88C0 DD 36 F9 00   [19]  225 	ld	-7 (ix), #<(_sp_font_40)
   88C4 DD 36 FA 6A   [19]  226 	ld	-6 (ix), #>(_sp_font_40)
                            227 ;src/text.c:63: }
   88C8                     228 00113$:
                            229 ;src/text.c:66: if (charsprite != 0)
   88C8 DD 7E FA      [19]  230 	ld	a, -6 (ix)
   88CB DD B6 F9      [19]  231 	or	a,-7 (ix)
   88CE 28 0F         [12]  232 	jr	Z,00116$
                            233 ;src/text.c:68: cpct_drawSprite(charsprite, svmem, SP_FONT_CHAR_W, SP_FONT_CHAR_H);
   88D0 D1            [10]  234 	pop	de
   88D1 C1            [10]  235 	pop	bc
   88D2 C5            [11]  236 	push	bc
   88D3 D5            [11]  237 	push	de
   88D4 D1            [10]  238 	pop	de
   88D5 D5            [11]  239 	push	de
   88D6 21 02 08      [10]  240 	ld	hl, #0x0802
   88D9 E5            [11]  241 	push	hl
   88DA C5            [11]  242 	push	bc
   88DB D5            [11]  243 	push	de
   88DC CD D9 89      [17]  244 	call	_cpct_drawSprite
   88DF                     245 00116$:
                            246 ;src/text.c:71: text++;
   88DF DD 34 FD      [23]  247 	inc	-3 (ix)
   88E2 20 03         [12]  248 	jr	NZ,00176$
   88E4 DD 34 FE      [23]  249 	inc	-2 (ix)
   88E7                     250 00176$:
                            251 ;src/text.c:72: svmem += 2;
   88E7 DD 7E FB      [19]  252 	ld	a, -5 (ix)
   88EA C6 02         [ 7]  253 	add	a, #0x02
   88EC DD 77 FB      [19]  254 	ld	-5 (ix), a
   88EF DD 7E FC      [19]  255 	ld	a, -4 (ix)
   88F2 CE 00         [ 7]  256 	adc	a, #0x00
   88F4 DD 77 FC      [19]  257 	ld	-4 (ix), a
   88F7 C3 1B 88      [10]  258 	jp	00117$
   88FA                     259 00120$:
   88FA DD F9         [10]  260 	ld	sp, ix
   88FC DD E1         [14]  261 	pop	ix
   88FE C9            [10]  262 	ret
                            263 	.area _CODE
                            264 	.area _INITIALIZER
                            265 	.area _CABS (ABS)
