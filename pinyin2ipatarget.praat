#!praat
#
.pinyintargets$ = "PinyinIPA.Table"
.table = Read Table from tab-separated file: "Monosyllables.tsv"
.numRows = Get number of rows

writeFileLine: .pinyintargets$, "Num", tab$, "Pinyin", tab$, "IPA", tab$,  "Gender", tab$,  "Nt", tab$, "F1", tab$, "F2", tab$, "F3", tab$, "t"

for .r to .numRows
	selectObject: .table
	.pinyinnum$ = Get value: .r, "Pinyin"
	.pinyinnum$ = replace$(.pinyinnum$, "uu", "v", 0)
	call numbers2pinyin '.pinyinnum$'
	.pinyin$ = numbers2pinyin.pinyin$
	.ipa$ = Get value: .r, "IPA"
	.ipa$ = replace$(.ipa$, "ˈ", "", 0)
	.gender$ = Get value: .r, "Gender"
	.nt$ = Get value: .r, "Nt"
	.f1$ = Get value: .r, "F1"
	.f2$ = Get value: .r, "F2"
	.f3$ = Get value: .r, "F3"
	.t$ = Get value: .r, "t"
	appendFileLine: .pinyintargets$, .pinyinnum$ , tab$, .pinyin$ , tab$, .ipa$, tab$,  .gender$, tab$,  .nt$, tab$, .f1$, tab$, .f2$, tab$, .f3$, tab$, .t$
endfor


# Convert a pinyin representation with numbers to one with pinyin graph symbols
procedure numbers2pinyin .numberstext$
	.intermediatePinyin$ = .numberstext$
	# Convert uu to v to recover ü later
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "uu", "v", 0)
	# Add a `-quote between vowels
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "([aeuiov])([0-9])([aeuiov])", "\1\2'\3", 0)
	# Move numbers to the nucleus vowel
	# To the vowel
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "([aeuiov])([^aeuiov0-9]*)([0-9])", "\1\3\2", 0)
	# Either a/e
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "([ae])([aeuiov]*)([0-9])", "\1\3\2", 0)
	# Or the Oo in /ou/
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "(ou)([0-9])", "o\2u", 0)
	# or the second vowel
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "([uiov][aeuiov])([uiov])([0-9])", "\1\3\2", 0)
	
	# Convert all tones to special characters
	# Tone 1
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "a1", "ā", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "e1", "ē", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "u1", "ū", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "i1", "ī", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "o1", "ō", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "v1", "ǖ", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "1", "\\-^", 0)
	
	# Tone 2
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "v2", "ǘ", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "([iaeou])2", "\\\1'", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "2", "\\'^", 0)
	
	# Tone 3
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "a3", "ǎ", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "e3", "ě", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "u3", "ǔ", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "i3", "ǐ", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "o3", "ǒ", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "v3", "ǚ", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "3", "\\N^", 0)

	# Tone 4
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "v4", "ǜ", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "([iaeou])4", "\\\1`", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "4", "\\`^", 0)
	
	# Tone 0
	# Remove tone 0 symbol completely
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "0", "", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "a0", "å", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "e0", "e̊", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "u0", "ů", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "i0", "i̊", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "o0", "o̊", 0)
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "v0", "ü̊", 0)
	#.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "0", "\\0^", 0)
	
	# Pick best vowel symbols available in cases not caught before
	# Ugly clutch to get the 1, 3, 0 tone diacritics at least in the neighbourhood
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "i(\\[-N0]\^)", "i\\s{_ }\1", 0)
	# Insert u umlaut
	.intermediatePinyin$ = replace_regex$(.intermediatePinyin$, "v", "\\u\X22", 0)

	.pinyin$ = .intermediatePinyin$
endproc
