#!praat
#
.sp_default = 1

# Initialization
call init_LanguageTargets
call CreatePinyinIPA
sgc.pinyinIPA = selected("Table") 

form Source directiory
	sentence Source MandarinSounds.tsv
	choice Speaker_is_a 1
		option Female
		option Male
	boolean Plot 1
endform
outFile$ = "targets.tsv"
.sp$ = "M"
.sp_default = 2
if speaker_is_a$ = "Female"
	.sp$ = "F"
	.sp_default = 1
endif

if not plot
	writeFileLine: outFile$, "Pinyin", tab$, "IPA", tab$, "Gender", tab$, "Nt", tab$, "F1", tab$, "F2", tab$, "F3", tab$, "t"
endif

if source$ <> ""
	.audioList = Read Table from tab-separated file: source$
	Randomize rows
endif

selectObject: .audioList
.numFiles = Get number of rows
for .f to .numFiles
	selectObject: .audioList
	.infile$ = Get value: .f, "Audio"
	.pinyin$ = Get value: .f, "Pinyin"
	.ipa$ = Get value: .f, "IPA"
	.sound = Read from file: .infile$
	
	if plot
		demo Erase all
		call set_up_Canvas
		call plot_vowel_triangle '.sp$'
	
		demo Black
		demo Text special: 50, "Centre", 110, "Bottom", "Helvetica", 24, "0", .pinyin$ + " /" + .ipa$ + "/"
		demoShow()
	endif
	
	@drawSourceVowelTarget: .audioList, .f, .sp$, .sound

	selectObject: .sound
	Remove
endfor
selectObject: .audioList
Remove


#################
#


# Set up Canvas
procedure set_up_Canvas
	demo Select outer viewport: 0, 100, 0, 100
	demo Select inner viewport: 20, 80, 20, 80
	demo Axes: 0, 100, 0, 100
	demo Solid line
	demo Black
	demo Line width: 1.0
endproc

# Stop the progam
procedure exitVowelTarget .message$
	select all
	if numberOfSelected() > 0
		Remove
	endif
	exitScript: .message$
endproc



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

# Not everyone add all the zeros for the neutral tones. Here we try to guess where
# they would belong.
procedure add_missing_neutral_tones .pinyin$
	# Missing neutral tones
	# Missing last tone
	.pinyin$ = replace_regex$(.pinyin$, "([^0-9])$", "\10", 0)
	# Easy cases V [^n]
	.pinyin$ = replace_regex$(.pinyin$, "([euioa]+)([^0-9neuioar])", "\10\2", 0)
	# Complex case V r V
	.pinyin$ = replace_regex$(.pinyin$, "([euioa]+)(r[euioa]+)", "\10\2", 0)
	# Complex case V r C
	.pinyin$ = replace_regex$(.pinyin$, "([euioa]+r)([^0-9euioa]+)", "\10\2", 0)
	# Vng cases
	.pinyin$ = replace_regex$(.pinyin$, "([euioa]+ng)([^0-9])", "\10\2", 0)
	# VnC cases C != g
	.pinyin$ = replace_regex$(.pinyin$, "([euioa]+n)([^0-9geuioa])", "\10\2", 0)
	# VnV cases -> Maximal onset
	.pinyin$ = replace_regex$(.pinyin$, "([euioa])(n[euioa])", "\10\2", 0)
endproc

include VowelTarget.praat
include SelectVowels.praat
include LanguageTargets.praat
include CreateIPAtargets.praat
