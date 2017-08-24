#! praat
# 
# Practice Mandarin vowel pronunciation
#
# Copyright: R.J.J.H. van Son, 2017
# License: GNU GPL v2 or later
# email: r.j.j.h.vanson@gmail.com
# 
#     SGCvowels.praat: Praat script to practice vowel pronunciation 
#     
#     Copyright (C) 2017  R.J.J.H. van Son and the Netherlands Cancer Institute
# 
#     This program is free software; you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation; either version 2 of the License, or
#     (at your option) any later version.
# 
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with this program; if not, write to the Free Software
#     Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
# 
# 
# Debugging 
.testAudio = 1
# 
.input$ = "Microphone"
.samplingFrequency = 44100
.recordingTime = 4

# Initialization
call init_LanguageTargets
call CreatePinyinIPA
sgc.pinyinIPA = selected("Table") 

# Read wordlist
.wordList$ = chooseReadFile$: "Select word list"
.wordDir$ = ""
if .wordList$ <> "" and fileReadable(.wordList$) and index_regex(.wordList$, "(?i\.(tsv|Table))$")
	.words = Read Table from tab-separated file: .wordList$
	if .words <= 0
		exitVowelTarget Not a tab-separated-values table: '.wordList$'
	endif
	
	.wordsDir$ = replace_regex$(.wordList$, "([/\\:])[^/\\]+$", "\1", 0)
else
	pause Not a valid tab-separated-values wordlist table. Will use default
	.words = Create Table with column names: "table", 1, "Pinyin Character Audio IPA"
	Set string value: 1, "Pinyin", "xue2sheng1"
	Set string value: 1, "Character", "学生"
	Set string value: 1, "Audio", "-"
	Set string value: 1, "Ipa", "ye @"
endif
@initialize_table_collumns: .words, "Character$;Audio$;Gender$;IPA$;Gender$;F1$;F2$;F3$;", "-"
Randomize rows
selectObject: .words
.numWords = Get number of rows

# Run master loop
.continue = 1
beginPause: "Record a vowel"
	comment: "Click on ""Record"" and start speaking"
	choice: "You are a", 1
		option: "Female"
		option: "Male"
.clicked = endPause: "Stop", "Record", 2, 1
if .clicked = 1
	.continue = 0
	call exitVowelTarget Nothing to do
endif
.sp$ = "M"
if you_are_a$ = "Female"
	.sp$ = "F"
endif

.wordNumber = 1
while .continue
	# Draw vowel triangle
	demo Erase all
	call set_up_Canvas
	@plot_voweltriangle_and_target: .words, .wordNumber
	.pinyin$ = plot_voweltriangle_and_target.pinyin$
	.char$ = plot_voweltriangle_and_target.char$
	.ipa$ = plot_voweltriangle_and_target.ipa$
	.gendert$ = plot_voweltriangle_and_target.gendert$
	.f1_targets$ = plot_voweltriangle_and_target.f1_targets$
	.f2_targets$ = plot_voweltriangle_and_target.f2_targets$
	.f3_targets$ = plot_voweltriangle_and_target.f3_targets$
	
	# Locate audio
	selectObject: .words
	.audio$ = Get value: .wordNumber, "Audio"
	
	# Write Title
	demo Text special: 50, "Centre", 110, "Bottom", "Helvetica", 24, "0", .pinyin$+" "+.char$
		
	# Record sound
	if .testAudio and index_regex(.audio$, "\.(wav|mp3)$") and fileReadable(.audio$)
		.sound = Read from file: .audio$
	else
		demo Paint circle: "Red", -20, 120, 3
		demoShow()
		.sound = Record Sound (fixed time): .input$, 0.99, 0.5, "'.samplingFrequency'", .recordingTime
		demo Paint circle: "White", -20, 120, 4
		demoShow()
	endif
	.intensity = Get intensity (dB)
	if .intensity > 50
		@plot_vowels: 1, "Red", .sp$, .sound, .pinyin$, .ipa$, .gendert$, .f1_targets$, .f2_targets$, .f3_targets$
	endif
	
	selectObject: .sound
	Remove
	
	# Ready or not?
	beginPause: "Do you want to continue?"
		comment: "Click on ""Record"" and start speaking (or click ""Done"")"
	.clicked = endPause: "Done", "Record", 2, 1
	.continue = (.clicked = 2)
	
	.wordNumber += 1
	if .wordNumber > .numWords
		.wordNumber = 1
	endif
endwhile

selectObject: .words, sgc.pinyinIPA
Remove

#####################################################################

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

