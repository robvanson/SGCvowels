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
#
vowelTarget.printlog = 1

procedure plot_voweltriangle_and_target .wordList .wordNumber
	@initialize_table_collumns: .wordList, "Character$;Audio$;Gender$;IPA$;Gender$;F1$;F2$;F3$;", "-"
	selectObject: .wordList
	.pinyinnum$ = Get value: .wordNumber, "Pinyin"
	@numbers2pinyin: .pinyinnum$
	.pinyin$ = numbers2pinyin.pinyin$
	.char$ = Get value: .wordNumber, "Character"
	if .char$ = "-"
		.char$ = ""
	endif
	.ipa$ = Get value: .wordNumber, "IPA"
	.f1_targets$ = Get value: .wordNumber, "F1"
	.f2_targets$ = Get value: .wordNumber, "F2"
	.f3_targets$ = Get value: .wordNumber, "F3"
	.gendert$ = Get value: .wordNumber, "Gender"
	if .gendert$ = "-"
		.gendert$ = "F"
	endif
	if index(.f1_targets$, ";") <= 0 or .ipa$ = "" or .ipa$ = "-"
		@pinyin2ipa: .pinyinnum$
		if index(.f1_targets$, ";") <= 0
			.f1_targets$ = pinyin2ipa.f1$
			.f2_targets$ = pinyin2ipa.f2$
			.f3_targets$ = pinyin2ipa.f3$
		endif
		if .ipa$ = "" or .ipa$ = "-"
			.ipa$ = pinyin2ipa.ipa$
		endif
	endif
	# The triangle
	@plot_vowel_triangle: .gendert$
	# Target values given
	@plot_targets: "Green", .gendert$, .f1_targets$, .f2_targets$, .f3_targets$
endproc

procedure drawSourceVowelTarget .plot .wordList .wordNumber .sp$ .sound
	@initialize_table_collumns: .wordList, "Character$;Audio$;Gender$;IPA$;Gender$;F1$;F2$;F3$;", "-"
	selectObject: .wordList
	.pinyinnum$ = Get value: .wordNumber, "Pinyin"
	@numbers2pinyin: .pinyinnum$
	.pinyin$ = numbers2pinyin.pinyin$
	.char$ = Get value: .wordNumber, "Character"
	if .char$ = "-"
		.char$ = ""
	endif
	.ipa$ = Get value: .wordNumber, "IPA"
	.f1_targets$ = Get value: .wordNumber, "F1"
	.f2_targets$ = Get value: .wordNumber, "F2"
	.f3_targets$ = Get value: .wordNumber, "F3"
	if index(.f1_targets$, ";") <= 0
		.f1_targets$ = ""
	endif
	.gendert$ = Get value: .wordNumber, "Gender"
	if .gendert$ = "-"
		.gendert$ = "F"
	endif
	if index(.f1_targets$, ";") <= 0 or .ipa$ = "" or .ipa$ = "-"
		@pinyin2ipa: .pinyinnum$
		if index(.f1_targets$, ";") <= 0
			.f1_targets$ = pinyin2ipa.f1$
			.f2_targets$ = pinyin2ipa.f2$
			.f3_targets$ = pinyin2ipa.f3$
		endif
		if .ipa$ = "" or .ipa$ = "-"
			.ipa$ = pinyin2ipa.ipa$
		endif
	endif
	@plot_vowels: .plot, "Red", .sp$, .sound, .pinyin$, .ipa$, .gendert$, .f1_targets$, .f2_targets$, .f3_targets$
endproc
#####################################################################

procedure extract_first_vowel .ipa_string$
		.ipa_string$ = replace_regex$(.ipa_string$, "^[^'ipavowelsymbols$']+", "", 0)
		if startsWith(.ipa_string$, "i̪")
			.vowel$ = "i̪"
			.ipa_string$ = right$(.ipa_string$, length(.ipa_string$) - length("i̪"))
		else
			.vowel$ = replace_regex$(.ipa_string$, "^(['ipavowelsymbols$'](_center|_corner|[\.-:])?).*$", "\1", 0)
			.ipa_string$ = replace_regex$(.ipa_string$, "^(['ipavowelsymbols$'](_center|_corner|[\.-:])?)", "", 0)
		endif
		if .ipa_string$ <> "" and index_regex(.ipa_string$, "['ipavowelsymbols$']") <= 0
			.ipa_string$ = ""
		endif
endproc

procedure getTargets .lang$ .gender$ .ipa_string$
	# Remove non-vowel symbols
	.vowels$ = replace_regex$(.ipa_string$, "[^'ipavowelsymbols$']+", " ", 0)
	.vowels$ = replace_regex$(.vowels$, "^[ ]+", "", 0)
	.vowels$ = replace_regex$(.vowels$, "[ ]+$", "", 0)
	.vowels$ = replace_regex$(.vowels$, "[ ]+", " ", 0)

	# Split into individual vowels and clusters
	.vowels$ = replace_regex$(.vowels$, "(.)", "\1;", 0)
	.vowels$ = replace_regex$(.vowels$, "[;]+$", "", 0)

	# Get targets
	.f1$ = ""
	.f2$ = ""
	.f3$ = ""
	while .vowels$ <> ""
		@extract_next_vowel: .vowels$
		.segment$ = extract_next_vowel.segment$
		.vowels$ = extract_next_vowel.vowels$
		
		if index_regex(ipavowelsymbols$, .segment$)
			.f1$ = .f1$ + fixed$(languageTargets.phonemes [.lang$, .gender$, .segment$, "F1"],0)
			.f2$ = .f2$ + fixed$(languageTargets.phonemes [.lang$, .gender$, .segment$, "F2"],0)
			.f3$ = .f3$ + "-"
		elsif .segment$ = ";"
			.f1$ = .f1$ + ";"
			.f2$ = .f2$ + ";"
			.f3$ = .f3$ + ";"
		endif
	endwhile
endproc

procedure extract_first_vowelcluster .ipa_string$
		.ipa_string$ = replace_regex$(.ipa_string$, "^[^'ipavowelsymbols$']+", "", 0)
		.vowel$ = ""
		while index_regex(.ipa_string$, "^['ipavowelsymbols$']")
			.v$ = ""
			if startsWith(.ipa_string$, "i̪")
				.v$ = "i̪"
				.ipa_string$ = right$(.ipa_string$, length(.ipa_string$) - length("i̪"))
			else
				.v$ = replace_regex$(.ipa_string$, "^(['ipavowelsymbols$'](_center|_corner|[\.-:])?).*$", "\1", 0)
				.ipa_string$ = replace_regex$(.ipa_string$, "^(['ipavowelsymbols$'](_center|_corner|[\.-:])?)", "", 0)
			endif
			.vowel$ = .vowel$ + .v$
		endwhile
		if .ipa_string$ <> "" and index_regex(.ipa_string$, "['ipavowelsymbols$']") <= 0
			.ipa_string$ = ""
		endif
endproc

# Plot the vowels in a sound
procedure plot_vowels .plot, .color$ .sp$ .sound .pinyin$ .ipa$ .gendert$ .f1_targets$ .f2_targets$ .f3_targets$
	.startT = 0 
	call segment_syllables -25 4 0.3 1 .sound
	.syllableKernels = segment_syllables.textgridid
	
	# Calculate the formants
	selectObject: .sound
	if .sp$ = "M"
		.downSampled = Resample: 10000, 50
		.formants = noprogress To Formant (sl): 0, 5, 5000, 0.05, 50
	else
		.downSampled = Resample: 11000, 50
		.formants = noprogress To Formant (sl): 0, 5, 5500, 0.05, 50
	endif

	call select_vowel_target .sound .formants .syllableKernels
	.vowelTier = select_vowel_target.vowelTier
	.targetTier = select_vowel_target.targetTier

	if variableExists("sourceTextGrid") 
		if sourceTextGrid > 0
			selectObject: .syllableKernels
			Remove
			selectObject: sourceTextGrid
			.syllableKernels = Copy: "SourceTextGrid"
		elsif .plot
			selectObject: .sound
			plusObject: .syllableKernels
			Edit
			pause 'sourceTextGridName$'
			selectObject: .syllableKernels
			.numTiers = Get number of tiers
			for .t to .numTiers - 2
				Remove tier: .numTiers + 1 - .t
			endfor
			Save as short text file: sourceTextGridName$
		endif
	endif
	selectObject: .syllableKernels
	.numSyllables = Get number of points: .targetTier
	.startT = 0
	.targetnum = 0
	.numPhonTargets = 0
	.syllNum = 1
	.lastSyllable = 0
	.numChunks = 0
	.temp_f1_targets$ = .f1_targets$
	.temp_f2_targets$ = .f2_targets$
	.temp_f3_targets$ = .f3_targets$
	while .temp_f1_targets$ <> ""
		@extract_next_target: .temp_f1_targets$
		.f1 = extract_next_target.value
		.temp_f1_targets$ = extract_next_target.targets$
		@extract_next_target: .temp_f2_targets$
		.f2 = extract_next_target.value
		.temp_f2_targets$ = extract_next_target.targets$
		@extract_next_target: .temp_f3_targets$
		.f3 = extract_next_target.value
		.temp_f3_targets$ = extract_next_target.targets$
				
		# Catch syllable boundaries
		if .f1 > 0
			@get_closest_vowels: .sp$, .formants, .syllableKernels, 0, .gendert$, .f1, .f2
			.startT = get_closest_vowels.t
			.numVowelIntervals = get_closest_vowels.vowelNum
			if .numVowelIntervals > .numChunks
				.numChunks = .numVowelIntervals
			endif
			# Here we should add some kind of Dynamic Programming to select the best candidates
			if .numVowelIntervals > 0
				.targetnum += 1
				.numPhonTargets += 1

				# Store distances
				f1_table [.numPhonTargets, 1] = get_closest_vowels.f1_list [1]
				f2_table [.numPhonTargets, 1] = get_closest_vowels.f2_list [1]
				f3_table [.numPhonTargets, 1] = get_closest_vowels.f3_list [1]
				t_table [.numPhonTargets, 1] = get_closest_vowels.t_list [1]
				syllable [.numPhonTargets, 1] = .syllNum
				distance [.numPhonTargets, 1] = get_closest_vowels.distance_list [1]
				time [.numPhonTargets, 1] = get_closest_vowels.t_list [1]
				.lastSyllable = .syllNum
				
				for .i from 2 to .numVowelIntervals					
					# Store distances
					f1_table [.numPhonTargets, .i] = get_closest_vowels.f1_list [.i]
					f2_table [.numPhonTargets, .i] = get_closest_vowels.f2_list [.i]
					f3_table [.numPhonTargets, .i] = get_closest_vowels.f3_list [.i]
					t_table [.numPhonTargets, .i] = get_closest_vowels.t_list [.i]
					syllable [.numPhonTargets, .i] = .syllNum
					distance [.numPhonTargets, .i] = get_closest_vowels.distance_list [.i]
					time [.numPhonTargets, .i] = get_closest_vowels.t_list [.i]
					.lastSyllable = .syllNum
				endfor
			endif
		else
			# Syllable boundary
			.targetnum += 1
			.syllNum += 1
		endif
	endwhile

	# Get the best trace of targets
	if .numPhonTargets > 0 and .numChunks > 0
		@dptrack: .numPhonTargets, .numChunks
		@reorder_multi_targets: .sp$, .formants, .syllableKernels, .gendert$, .f1_targets$, .f2_targets$, .f3_targets$
	else
		appendInfoLine: "Error: '.pinyin$' /'.ipa$'/ No data." 
		appendInfoLine: "Number of phoneme targets - ",.numPhonTargets
		appendInfoLine: "Number of vowel segments found - ", .numChunks
		appendFileLine: outFile$, .pinyin$, tab$, .ipa$, tab$, .sp$, tab$, .targetnum, tab$, "-", tab$, "-", tab$, "-", tab$, "-"
	endif


	# Actually plot the vowels
	.radius = 1
	if .plot and .targetnum > 0
		if vowelTarget.f1_list [1] > 0
			@vowel2point: .sp$, vowelTarget.f1_list [1], vowelTarget.f2_list [1]
			.x = vowel2point.x
			.y = vowel2point.y
			demo Paint circle: .color$, .x, .y, .radius
			.radius *= 0.9
		endif
		demo Arrow size: 2
		demo '.color$'
		demo Dotted line
		.plotArrow = 1
		for .t from 2 to .targetnum
			.xlast = .x
			.ylast = .y
			if vowelTarget.f1_list [.t] > 0
				@vowel2point: .sp$, vowelTarget.f1_list [.t], vowelTarget.f2_list [.t]
				.x = vowel2point.x
				.y = vowel2point.y
				if .plotArrow
					demo Draw arrow: .xlast, .ylast, .x, .y
				else
					demoShow()
					demo Paint circle: .color$, .x, .y, .radius
					demo Paint circle: "White", .x, .y, .radius*(1-.radius)
					demoShow()
					.plotArrow = 1
					.radius *= 0.9
				endif
			else
				.plotArrow = 0
				.x = -1
				.y = -1
			endif
		endfor
		demoShow()
		demo Solid line
		demo Black
	elsif .targetnum > 0
		.f1values$ = ""
		.f2values$ = ""
		.f3values$ = ""
		.tvalues$ = ""
		for .t to .targetnum
			if vowelTarget.f1_list [.t] > 0
				.f1values$ = .f1values$ + fixed$(vowelTarget.f1_list [.t], 0) + ";"
				.f2values$ = .f2values$ + fixed$(vowelTarget.f2_list [.t], 0) + ";"
				.f3values$ = .f3values$ + fixed$(vowelTarget.f3_list [.t], 0) + ";"
				.tvalues$ = .tvalues$ + fixed$(vowelTarget.t_list [.t], 3) + ";"
			else
				.f1values$ = .f1values$ + " " + ";"
				.f2values$ = .f2values$ + " " + ";"
				.f3values$ = .f3values$ + " " + ";"
				.tvalues$ = .tvalues$ + " " + ";"
			endif
		endfor
		appendFileLine: outFile$, .pinyin$, tab$, .ipa$, tab$, .sp$, tab$, .targetnum, tab$, .f1values$, tab$, .f2values$, tab$, .f3values$, tab$, .tvalues$
	endif
	selectObject: .downSampled, .formants, .syllableKernels
	Remove
endproc

# Plot target values
procedure plot_targets .color$ .sp$ .f1_targets$ .f2_targets$ .f3_targets$
	.t = 0
	while index_regex(.f1_targets$, ";")
		.t += 1
		@extract_next_target: .f1_targets$
		.f1 = extract_next_target.value
		.f1_targets$ = extract_next_target.targets$
		@extract_next_target: .f2_targets$
		.f2 = extract_next_target.value
		.f2_targets$ = extract_next_target.targets$
		@extract_next_target: .f3_targets$
		.f3 = extract_next_target.value
		.f3_targets$ = extract_next_target.targets$
		f1_list [.t] = .f1
		f2_list [.t] = .f2
	endwhile
	.targetnum = .t
	.radius = 1
	if vowelTarget.f1_list [1] > 0
		@vowel2point: .sp$, vowelTarget.f1_list [1], vowelTarget.f2_list [1]
		.x = vowel2point.x
		.y = vowel2point.y
		demo Paint circle: .color$, .x, .y, .radius
		.radius *= 0.9
	endif
	demo Arrow size: 2
	demo '.color$'
	demo Dotted line
	.plotArrow = 1
	for .t from 2 to .targetnum
		.xlast = .x
		.ylast = .y
		if vowelTarget.f1_list [.t] > 0
			@vowel2point: .sp$, vowelTarget.f1_list [.t], vowelTarget.f2_list [.t]
			.x = vowel2point.x
			.y = vowel2point.y
			if .plotArrow
				demo Draw arrow: .xlast, .ylast, .x, .y
			else
				demoShow()
				demo Paint circle: .color$, .x, .y, .radius
				demo Paint circle: "White", .x, .y, .radius*(1-.radius)
				demoShow()
				.plotArrow = 1
				.radius *= 0.9
			endif
		else
			.plotArrow = 0
			.x = -1
			.y = -1
		endif
	endfor
	demoShow()
	demo Solid line
	demo Black
endproc

# Plot the standard vowels
procedure plot_standard_vowel .color$ .sp$ .targets$ .reduction
	while .targets$ <> ""
		@extract_first_vowel: .targets$
		.vowel$ = extract_first_vowel.vowel$
		.targets$ = extract_first_vowel.ipa_string$

		.f1 = languageTargets.phonemes ["ZH", .sp$, .vowel$, "F1"]
		.f2 = languageTargets.phonemes ["ZH", .sp$, .vowel$, "F2"]
		if .reduction
			.factor = 0.9^.reduction
			.f1 = .factor * (.f1 - languageTargets.phonemes ["ZH", .sp$, "ə", "F1"]) + languageTargets.phonemes ["ZH", .sp$, "ə", "F1"]
			.f2 = .factor * (.f2 - languageTargets.phonemes ["ZH", .sp$, "ə", "F2"]) + languageTargets.phonemes ["ZH", .sp$, "ə", "F2"]
		endif 
		.i = 1
		@vowel2point: .sp$, .f1, .f2
		.x [.i] = vowel2point.x
		.y [.i] = vowel2point.y
	endwhile
	
	demo Arrow size: 2
	demo Green
	demo Dotted line
	demo Paint circle: .color$, .x[1], .y[1], 1
	for .p from 2 to .i
		demo Draw arrow: .x[.p - 1], .y[.p - 1], .x[.p], .y[.p]
	endfor
	demoShow()
	demo Solid line
	demo Black
endproc

# Plot the vowel triangle
procedure plot_vowel_triangle .sp$
	# Draw vowel triangle
	.a_F1 = languageTargets.phonemes ["ZH", .sp$, "a_corner", "F1"]
	.a_F2 = languageTargets.phonemes ["ZH", .sp$, "a_corner", "F2"]

	.i_F1 = languageTargets.phonemes ["ZH", .sp$, "i_corner", "F1"]
	.i_F2 = languageTargets.phonemes ["ZH", .sp$, "i_corner", "F2"]

	.u_F1 = languageTargets.phonemes ["ZH", .sp$, "u_corner", "F1"]
	.u_F2 = languageTargets.phonemes ["ZH", .sp$, "u_corner", "F2"]
	
	demo Dashed line
	# u - i
	@vowel2point: .sp$, .u_F1, .u_F2
	.x1 = vowel2point.x
	.y1 = vowel2point.y
	demo Text special: .x1, "Left", .y1, "Bottom", "Helvetica", 20, "0", "/u/ 不"
	
	@vowel2point: .sp$, .i_F1, .i_F2
	.x2 = vowel2point.x
	.y2 = vowel2point.y
	demo Text special: .x2, "Right", .y2, "Bottom", "Helvetica", 20, "0", "必 /i/"
	demo Draw line: .x1, .y1, .x2, .y2
	
	# u - a
	@vowel2point: .sp$, .u_F1, .u_F2
	.x1 = vowel2point.x
	.y1 = vowel2point.y
	@vowel2point: .sp$, .a_F1, .a_F2
	.x2 = vowel2point.x
	.y2 = vowel2point.y
	demo Text special: .x2, "Centre", .y2, "Top", "Helvetica", 20, "0", "/a/ 巴"
	demo Draw line: .x1, .y1, .x2, .y2
	
	# i - a
	@vowel2point: .sp$, .i_F1, .i_F2
	.x1 = vowel2point.x
	.y1 = vowel2point.y
	@vowel2point: .sp$, .a_F1, .a_F2
	.x2 = vowel2point.x
	.y2 = vowel2point.y
	demo Draw line: .x1, .y1, .x2, .y2
	demoShow()
	
	# Other Pinyin vowels
	# /o/
	@write_vowel_label: .sp$, "o_side", "o"
	@write_vowel_label: .sp$, "e_side", "e"
	@write_vowel_label: .sp$, "y_side", "ü"

	demo Solid line
	demo Black
endproc

# Vowel Triangle labels
procedure write_vowel_label .sp$ .phoneme$ .label$
	.f1 = languageTargets.phonemes ["ZH", .sp$, .phoneme$, "F1"]
	.f2 = languageTargets.phonemes ["ZH", .sp$, .phoneme$, "F2"]
	@vowel2point: .sp$, .f1, .f2
	.x = vowel2point.x
	.y = vowel2point.y
	.xAlign$ = "Left"
	if .x < 50
		.xAlign$ = "Right"
	endif
	.yAlign$ = "Half"
	if .y > 90
		.yAlign$ = "Bottom"
	endif
	
	# Move out
	demo Colour... 0.6
	demo Text special: .x, "Left", .y, "Bottom", "Helvetica", 20, "0", .label$
	demo Black
endproc

# Convert IPA to formant targets
procedure calculate_targets .sp$ .pinyin$ .ipa$
	.f1_targets$ = ""
	.f2_targets$ = ""
	.f3_targets$ = ""
	while .ipa$ <> ""
		@extract_first_vowelcluster: .ipa$
		.vc$ = extract_first_vowelcluster.vowel$
		.ipa$ = extract_first_vowelcluster.ipa_string$
		while .vc$ <> ""
			@extract_first_vowel: .vc$
			.v$ = extract_first_vowel.vowel$
			.vc$ = extract_first_vowel.ipa_string$
			.f1 = languageTargets.phonemes ["ZH", .sp$, .v$, "F1"]
			.f2 = languageTargets.phonemes ["ZH", .sp$, .v$, "F2"]
			.f1_targets$ = .f1_targets$ + fixed$(.f1, 0) + ";"
			.f2_targets$ = .f2_targets$ + fixed$(.f2, 0) + ";"
		endwhile
		# Add syllable boundary marker
		.f1_targets$ = .f1_targets$ + " ;"
		.f2_targets$ = .f2_targets$ + " ;"
	endwhile
endproc

# Get next positive value from list "<value>;<value>;..." where " ;" represents a syllable boundary
procedure extract_next_vowel .vowels$
	.segment$ = replace_regex$(.vowels$, "^(.).*$", "\1", 0)
	.vowels$ = replace_regex$(.vowels$, "^(.)(.*)$", "\2", 0)
endproc

procedure extract_next_target .targets$
	.value = number(replace_regex$(.targets$, "^([^;]+);.*$", "\1", 0))
	if .value = undefined
		.value = -1
	endif
	.targets$ = replace_regex$(.targets$, "^([^;]*)(;|$)", "", 0)
endproc

procedure extract_target_i .targets$ .i
	.tmp$ = .targets$
	if .i > 1
		.prev = .i - 1
		.tmp$ = replace_regex$(.targets$, "^(\d+;){'.prev'}(.*)$", "\2", 0)
	endif
	.target$ = replace_regex$(.tmp$, "^(\d+)(;*.*)$", "\1", 0)
	.value = number(.target$)
	if .value = undefined
		.value = -1
	endif
endproc

procedure num_targets .targets$
	.t = 0
	.tmp$ = .targets$
	while .tmp$ <> ""
		if index(.tmp$, "^[^;]+;")
			.t += 1
			.tmp$ = replace_regex$(.tmp$, "^[^;]+;(.*)$", "\1", 0)
		elsif index(.tmp$, "^\d+$")
			.t += 1
			.tmp$ = ""
		else
			.tmp$ = ""
		endif
	endwhile
endif

# Convert the frequencies to coordinates
procedure vowel2point .sp$ .f1 .f2
	.spt1 = 12*log2(.f1)
	.spt2 = 12*log2(.f2)
	
	.a_St1 = 12*log2(languageTargets.phonemes ["ZH", .sp$, "a_corner", "F1"])
	.a_St2 = 12*log2(languageTargets.phonemes ["ZH", .sp$, "a_corner", "F2"])

	.i_St1 = 12*log2(languageTargets.phonemes ["ZH", .sp$, "i_corner", "F1"])
	.i_St2 = 12*log2(languageTargets.phonemes ["ZH", .sp$, "i_corner", "F2"])

	.u_St1 = 12*log2(languageTargets.phonemes ["ZH", .sp$, "u_corner", "F1"])
	.u_St2 = 12*log2(languageTargets.phonemes ["ZH", .sp$, "u_corner", "F2"])
	
	.dist_iu = sqrt((.i_St1 - .u_St1)^2 + (.i_St2 - .u_St2)^2)
	.theta = arcsin((.u_St1 - .i_St1)/.dist_iu)

	# First, with i_corner as (0, 0)
	.xp = ((.i_St2 - .spt2)/(.i_St2 - .u_St2))
	.yp = (.spt1 - min(.u_St1, .i_St1))/(.a_St1 - min(.u_St1, .i_St1))
	# Rotate around i_corner to make i-u axis horizontal
	.x = .xp * cos(.theta) + .yp * sin(.theta)
	.y = -1 * .xp * sin(.theta) + .yp * cos(.theta)
	
	# Reflect y-axis and make i_corner as (0, 1)
	.y = 1 - .y
	.yp = 1 - .yp
	
	# Scale to full screen
	.xp = 60*.xp + 20
	.yp = 60*.yp + 35
	.x = 60*.x + 20
	.y = 60*.y + 35
endproc

# Get a list of best targets with distances, one for each vowel segment found
# Use DTW to get the best match
procedure get_closest_vowels .sp$ .formants .textgrid .startT .gendert$ .f1_o .f2_o
	.f1 = 0
	.f2 = 0
	.t = 0
	.distance = 10000000
	
	# Convert to coordinates
	@vowel2point: .gendert$, .f1_o, .f2_o
	.st_o1 = vowel2point.x
	.st_o2 = vowel2point.y
	
	.t_end = .startT
	.vowelTier = 1
	.vowelNum = 0
	selectObject: .textgrid
	.numIntervals = Get number of intervals: .vowelTier
	for .i to .numIntervals
		selectObject: .textgrid
		.label$ = Get label of interval: .vowelTier, .i
		if .label$ = "Vowel"
			.vowelNum += 1
			.numDistance = 10000000
			.numF1 = -1
			.numF2 = -1
			.numF3 = -1
			.num_t = .startT
			selectObject: .textgrid
			.start = Get start time of interval: .vowelTier, .i
			.end = Get end time of interval: .vowelTier, .i
			selectObject: .formants
			if .t_end < .end
				.t = .start
				if .t_end > .start
					.t = .t_end
				endif
				while .t < .end
					.t += 0.005
					.ftmp1 = Get value at time: 1, .t, "Hertz", "Linear"
					.ftmp2 = Get value at time: 2, .t, "Hertz", "Linear"
					.ftmp3 = Get value at time: 3, .t, "Hertz", "Linear"
					# Make sure this is a valid vowel
					if .ftmp1 <> undefined and .ftmp2 <> undefined
						@vowel2point: .sp$, .ftmp1, .ftmp2
						.stmp1 = vowel2point.x
						.stmp2 = vowel2point.y
						.tmpdistsqr = (.st_o1 - .stmp1)^2 + (.st_o2 - .stmp2)^2
						# Global
						if .tmpdistsqr < .distance
							.distance = .tmpdistsqr
							.f1 = .ftmp1
							.f2 = .ftmp2
							.f3 = .ftmp3
							.t_end = .t
						endif
						# Local
						if .tmpdistsqr < .numDistance
							.numDistance = .tmpdistsqr
							.numF1 = .ftmp1
							.numF2 = .ftmp2
							.numF3 = .ftmp3
							.num_t = .t
						endif
					endif
				endwhile
			endif
			if .numF1 <> undefined and .numF2 <> undefined and .numDistance < 10000000
				.distance_list [.vowelNum] = sqrt(.numDistance)
				.f1_list [.vowelNum] = .numF1
				.f2_list [.vowelNum] = .numF2
				.f3_list [.vowelNum] = .numF3
				.t_list [.vowelNum] = .num_t
			else
				# No vowel found, remove
				.vowelNum -= 1
			endif
		endif
	endfor
	
	.distance = sqrt(.distance)
endproc

# Convert pinyin (numbers) to IPA and targers
procedure pinyin2ipa .pinyin$
	.f1$ = ""
	.f2$ = ""
	.f3$ = ""
	.t$ = ""
	.gender$ = "F"
	.ipa$ = ""
	
	.pinyin$ = replace$(.pinyin$, "uu", "v", 0)
	@add_missing_neutral_tones: .pinyin$
	.tmp$ = add_missing_neutral_tones.pinyin$
	
	while index_regex(.tmp$, "\S")
		.syll$ = replace_regex$(.tmp$, "^([^\d]+\d+)(.*$)", "\1", 0)
		.tmp$ = replace_regex$(.tmp$, "^([^\d]+\d+)", "", 0)
		if not index_regex(.tmp$, "\d")
			.tmp$ = ""
		endif
		selectObject: sgc.pinyinIPA
		.r = Search column: "Num", .syll$
		if .r > 0
			.current_ipa$ = Get value: .r, "IPA"
			.ipa$ = .ipa$ + .current_ipa$ + " "
			.gender$ = Get value: .r, "Gender"
			.current_F1$ = Get value: .r, "F1"
			.f1$ = .f1$ + .current_F1$ + " ;"
			.current_F2$ = Get value: .r, "F2"
			.f2$ = .f2$ + .current_F2$ + " ;"
			.current_F3$ = Get value: .r, "F3"
			.f3$ = .f3$ + .current_F3$ + " ;"
			.current_t$ = Get value: .r, "t"
			.t$ = .t$ + .current_t$ + " ;"
		else
			.current_ipa$ = replace_regex$(.syll$, "y[i]?", "ji", 0)
			.current_ipa$ = replace_regex$(.current_ipa$, "v", "y", 0)
			.current_ipa$ = replace_regex$(.current_ipa$, "\d", "", 0)
			@calculate_targets: .gender$, .syll$, .current_ipa$
			.f1$ = .f1$ + calculate_targets.f1_targets$ + " ;"
			.f2$ = .f2$ + calculate_targets.f2_targets$ + " ;"
			.f3$ = .f3$ + calculate_targets.f3_targets$ + " ;"
		endif
	endwhile
	.f1$ = replace_regex$(.f1$, "; ;$", ";", 0)
	.f2$ = replace_regex$(.f2$, "; ;$", ";", 0)
	.f3$ = replace_regex$(.f3$, "; ;$", ";", 0)
	.t$ = replace_regex$(.t$, "; ;$", ";", 0)
endproc

# 
# Determine COG as an intensity
#
# .cog_Matrix = Down to Matrix
# call calculateCOG .dt .soundid
# .cog_Tier = calculateCOG.cog_tier
# selectObject: .cog_Tier
# .numPoints = Get number of points
# for .i to .numPoints
# 	selectObject: .cog_Tier
# 	.cog = Get value at index: .i
# 	.t = Get time from index: .i
# 	selectObject: .intensity
# 	.c = Get frame number from time: .t
# 	if .c >= 0.5 and .c <= .maxFrame
# 		selectObject: .cog_Matrix
# 		Set value: 1, round(.c), .cog
# 	endif
# endfor
# selectObject: .cog_Matrix
# .cogIntensity = noprogress To Intensity

procedure calculateCOG .dt .sound
	selectObject: .sound
	.duration = Get total duration
	if .dt <= 0 or .dt > .sound
		.dt = 0.01
	endif
	
	# Create Spectrogram
	selectObject: .sound
	.spectrogram = noprogress To Spectrogram: 0.005, 8000, 0.002, 20, "Gaussian"
	.cog_tier = Create IntensityTier: "COG", 0.0, .duration
	
	.t = .dt / 2
	while .t < .duration
		selectObject: .spectrogram
		.spectrum = noprogress To Spectrum (slice): .t
		.cog_t = Get centre of gravity: 2
		selectObject: .cog_tier
		Add point: .t, .cog_t
		
		.t += .dt
		
		selectObject: .spectrum
		Remove
	endwhile
	
	selectObject: .spectrogram
	Remove
endproc

# Initialize missing columns. Column names ending with a $ are text
procedure initialize_table_collumns .table, .columns$, .initial_value$
	.columns$ = replace_regex$(.columns$, "^\W+", "", 0)
	selectObject: .table
	.numRows = Get number of rows
	while .columns$ <> ""
		.label$ = replace_regex$(.columns$, "^\W*(\w+)\W.*$", "\1", 0)
		.columns$ = replace_regex$(.columns$, "^\W*(\w+)", "", 0)
		.textType = startsWith(.columns$, "$")
		if not .textType and index_regex(.initial_value$, "[0-9]") <= 0
			.textType = 1
		endif
		.columns$ = replace_regex$(.columns$, "^\W+", "", 0)
		.col = Get column index: .label$
		if .col <= 0
			Append column: .label$
			for .r to .numRows
				if .textType
					Set string value: .r, .label$, .initial_value$
				else
					Set value: .r, .label$, '.initial_value$'
				endif
			endfor
		endif
	endwhile
endproc

# Dynamic Programming to track vowel targets
# First align syllables to chunks
# Then align targets to chunks
# Variables:
# .numTargets: Number of vowel targets
# .numChunks: Number of vowel chunks/segments
# Uses global variables:
# distances [target, chunk] 
# syllables [target, chunk]
# 
# Creates global lists:
# vowelTarget.t_list, vowelTarget.f1_list, vowelTarget.f2_list
vowelTarget.list_length = -1
procedure dptrack .numPhonTargets .numChunks

	# Fill syllables to chunks distance matrix
	.numSyllables = syllable [.numPhonTargets, .numChunks]
	# Initialise distance matrix
	for .s to .numSyllables
		for .c to .numChunks
			distanceSyllablesMin [.s, .c] = 10^6
			distanceSyllablesMean [.s, .c] = 0
			distanceSyllablesN [.s, .c] = 0
		endfor
	endfor
	
	for .t to .numPhonTargets
		for .c to .numChunks
			.dc = distance [.t, .c]
			.s = syllable [.t, .c]
			.time = time [.t, .c]
			# Minimum Distance
			if .dc < distanceSyllablesMin [.s, .c]
				distanceSyllablesMin [.s, .c] = .dc
			endif
			# Mean distance
			distanceSyllablesMean [.s, .c] += .dc
			distanceSyllablesN [.s, .c] += 1
		endfor
	endfor
	# Calculate average
	for .s to .numSyllables
		for .c to .numChunks
			if distanceSyllablesN [.s, .c] > 0
				distanceSyllablesMean [.s, .c] /= distanceSyllablesN [.s, .c]
			endif
		endfor
	endfor
	
	# Choose one of the following
	# Minimum distance
	if 0
		# Fill cost matrix
		# Minimum Distance
		.c_cost = 2
		.s_cost = 2
		.diagonal_cost = 1
		for .s to .numSyllables
			for .c to .numChunks
				.dc = distanceSyllablesMin [.s, .c]
				if .s > 1 or .c > 1
					if .s > 1
						.cPrevS = .costSyllMatrixMin [.s - 1, .c] + .dc * .s_cost
					else
						.cPrevS = 10^10
					endif
					if .c > 1
						.cPrevC = .costSyllMatrixMin [.s, .c - 1] + .dc * .c_cost
					else
						.cPrevC = 10^10
					endif
					if .s > 1 and .c > 1
						.cDiagonal = .costSyllMatrixMin [.s - 1, .c - 1] + .dc * .diagonal_cost
					else
						.cDiagonal = 10^10
					endif
					.minCost =  min(.cPrevS, .cPrevC, .cDiagonal)
					if .cPrevS = .minCost or .c <= 1
						.directionMatrixMin [.s, .c] = 1
					elsif .cPrevC = .minCost or .s <= 1
						.directionMatrixMin [.s, .c] = 2
					else
						.directionMatrixMin [.s, .c] = 3
					endif
				else
					.minCost = .dc
					.directionMatrixMin [1, 1] = 3
				endif
				.costSyllMatrixMin [.s, .c] = .minCost
			endfor
		endfor
	
		# Associate Syllables to Chunks
		# Minimum distance
		.s = .numSyllables
		.c = .numChunks
		while .s > 0 and .c > 0
			.syllableChunksMin [.c] = .s
			if .directionMatrixMin [.s, .c] = 1
				.s -= 1
			elsif .directionMatrixMin [.s, .c] = 2
				.c -= 1
			else
				.s -= 1
				.c -= 1
			endif
		endwhile
	
		# Associate Phonemes to Chunks
		# Determine targets
		# Minimum distance
		.lastSyll = -1
		.l = 1
		for .t to .numPhonTargets
			.minDistance = 10^6
			# If this is a new syllable, insert break
			.s = syllable [.t, 1]
			if .s > 1 and .s <> .lastSyll
				.lastSyll = .s
				vowelTarget.f1_list [.l] = -1
				vowelTarget.f2_list [.l] = -1
				vowelTarget.f3_list [.l] = -1
				vowelTarget.t_list [.l] = -1
				.l += 1			
			endif
			for .c to .numChunks
				if .s = .syllableChunksMin [.c]
					if distance [.t, .c] < .minDistance
						.minDistance = distance [.t, .c]
						vowelTarget.f1_list [.l] = f1_table[.t,.c]
						vowelTarget.f2_list [.l] = f2_table[.t,.c]
						vowelTarget.f3_list [.l] = f3_table[.t,.c]
						vowelTarget.t_list [.l] = t_table[.t,.c]
					endif
				endif
			endfor
			.l += 1
		endfor
		# Add closing syllable
		vowelTarget.f1_list [.l] = -1
		vowelTarget.f2_list [.l] = -1
		vowelTarget.f3_list [.l] = -1
		vowelTarget.t_list [.l] = -1
	else
		# Fill cost matrix
		# Mean Distance
		.c_cost = 2
		.s_cost = 2
		.diagonal_cost = 1
		for .s to .numSyllables
			for .c to .numChunks
				.dc = distanceSyllablesMean [.s, .c]
				if .s > 1 or .c > 1
					if .s > 1
						.cPrevS = .costSyllMatrixMean [.s - 1, .c] + .dc * .s_cost
					else
						.cPrevS = 10^10
					endif
					if .c > 1
						.cPrevC = .costSyllMatrixMean [.s, .c - 1] + .dc * .c_cost
					else
						.cPrevC = 10^10
					endif
					if .s > 1 and .c > 1
						.cDiagonal = .costSyllMatrixMean [.s - 1, .c - 1] + .dc * .diagonal_cost
					else
						.cDiagonal = 10^10
					endif
					.minCost =  min(.cPrevS, .cPrevC, .cDiagonal)
					if .cPrevS = .minCost or .c <= 1
						.directionMatrixMean [.s, .c] = 1
					elsif .cPrevC = .minCost or .s <= 1
						.directionMatrixMean [.s, .c] = 2
					else
						.directionMatrixMean [.s, .c] = 3
					endif
				else
					.minCost = .dc
					.directionMatrixMean [1, 1] = 3
				endif
				.costSyllMatrixMean [.s, .c] = .minCost
			endfor
		endfor
	
		# Associate Syllables to Chunks
		# Mean distance
		.s = .numSyllables
		.c = .numChunks
		while .s > 0 and .c > 0
			.syllableChunksMean [.c] = .s
			if .directionMatrixMean [.s, .c] = 1
				.s -= 1
			elsif .directionMatrixMean [.s, .c] = 2
				.c -= 1
			else
				.s -= 1
				.c -= 1
			endif
		endwhile

		# Associate Phonemes to Chunks
		# Determine targets
		# Mean distance
		.lastSyll = -1
		.l = 1
		for .t to .numPhonTargets
			.minDistance = 10^6
			# If this is a new syllable, insert break
			.s = syllable [.t, 1]
			if .s > 1 and .s <> .lastSyll
				.lastSyll = .s
				vowelTarget.f1_list [.l] = -1
				vowelTarget.f2_list [.l] = -1
				vowelTarget.f3_list [.l] = -1
				vowelTarget.t_list [.l] = -1
				.l += 1			
			endif
			for .c to .numChunks
				if .s = .syllableChunksMean [.c]
					if distance [.t, .c] < .minDistance
						.minDistance = distance [.t, .c]
						vowelTarget.f1_list [.l] = f1_table[.t,.c]
						vowelTarget.f2_list [.l] = f2_table[.t,.c]
						vowelTarget.f3_list [.l] = f3_table[.t,.c]
						vowelTarget.t_list [.l] = t_table[.t,.c]
					endif
				endif
			endfor
			.l += 1
		endfor
		.last = .l - 1
	endif
	vowelTarget.list_length = .last
endproc

# 
# The dptrack DP tracker does not correctly resolve multiple targets
# in the same chunk, e.g., diphtongs and triphthongs.
# This procedure will try to correct the targets if their time order 
# in the lists is different then in the original targets
# 
# Uses and changes global variables:
# vowelTarget.t_list, vowelTarget.f1_list, vowelTarget.f2_list
# 
# 
procedure reorder_multi_targets .sp$, .formants, .syllableKernels, .gendert$, .f1_targets$, .f2_targets$, .f3_targets$
		
	# If phonemes are ordered wrong, determine correct targets.
	# STILL HAS TO BE DONE!!!
	for .i from 2 to vowelTarget.list_length
		.t1 = vowelTarget.t_list [.i - 1]
		.t2 = vowelTarget.t_list [.i]
		if .t1 > 0 and .t2 > 0 and .t1 > .t2
			# Find chunks
			selectObject: .syllableKernels
			.numIntervals = Get number of intervals: 1
			# Remember, times are wrong!
			.interval1 = Get interval at time: 1, .t2
			.interval2 = Get interval at time: 1, .t1
			# Make sure the target is inside the Vowel chunks
			if .interval1 <> .interval2
				.lab$ = Get label of interval: 1, .interval1
				while .lab$ <> "Vowel" and .interval1 < .numIntervals
					.interval1 += 1
					.lab$ = Get label of interval: 1, .interval1
				endwhile
				.start = Get start time of interval: 1, .interval1
				.lab$ = Get label of interval: 1, .interval2
				while .lab$ <> "Vowel" and .interval2 > 1
					.interval2 -= 1
					.lab$ = Get label of interval: 1, .interval2
				endwhile
				.end = Get end time of interval: 1, .interval2
			else
				.start = Get start time of interval: 1, .interval1
				.end = Get end time of interval: 1, .interval1
			endif			
			
			# Add a new tier with only a single interval
			selectObject: .syllableKernels
			Insert interval tier: 1, "Vowel"
			Insert boundary: 1, .start
			Insert boundary: 1, .end
			Set interval text: 1, 2, "Vowel"
			
			# Get targets
			@extract_target_i: .f1_targets$, .i-1
			.f1_value [1] = extract_target_i.value
			@extract_target_i: .f2_targets$, .i-1
			.f2_value [1] = extract_target_i.value
			@extract_target_i: .f3_targets$, .i-1
			.f3_value [1] = extract_target_i.value
			
			@extract_target_i: .f1_targets$, .i
			.f1_value [2] = extract_target_i.value
			@extract_target_i: .f2_targets$, .i
			.f2_value [2] = extract_target_i.value
			@extract_target_i: .f3_targets$, .i
			.f3_value [2] = extract_target_i.value
			
			############################################################
			# 
			# Compare two orders of finding the two targets in the same
			# chunk:
			# 1) Find the closest approach to the first target, then
			#    find the second target after the first
			# 2) Find the closest approach to the second target, then
			#    find the first target *before* the second
			# 
			# Compare the combined squared distances. Take the smallest
			# 
			############################################################
			
			# STEP 1: Find the closest approach in the chunk
			
			# Front to back
			# Target 1
			@get_closest_vowels: .sp$, .formants, .syllableKernels, .start, .gendert$, .f1_value[1], .f2_value[1]
			.f2b_f1_list [1] = get_closest_vowels.f1_list [1]
			.f2b_f2_list [1] = get_closest_vowels.f2_list [1]
			.f2b_f3_list [1] = get_closest_vowels.f3_list [1]
			if get_closest_vowels.t_list [1] < .end - 0.01
				.f2b_t_list [1] = get_closest_vowels.t_list [1]
			else
				.f2b_t_list [1] = .end - 0.01
			endif
			.f2b_distance [1] = get_closest_vowels.distance_list [1]

			
			# Back to front
			# Target 2
			@get_closest_vowels: .sp$, .formants, .syllableKernels, .start, .gendert$, .f1_value[2], .f2_value[2]
			.b2f_f1_list [2] = get_closest_vowels.f1_list [1]
			.b2f_f2_list [2] = get_closest_vowels.f2_list [1]
			.b2f_f3_list [2] = get_closest_vowels.f3_list [1]
			if get_closest_vowels.t_list [1] > .start + 0.01
				.b2f_t_list [2] = get_closest_vowels.t_list [1]
			else
				.b2f_t_list [2] = .start + 0.01
			endif
			.b2f_distance [2] = get_closest_vowels.distance_list [1]

			# STEP 2: Find the closest approach in the remainder of the chunk
			
			# Change boundary
			# Front to back
			# Add a new tier with only a single interval

			selectObject: .syllableKernels
			Insert interval tier: 1, "Vowel"
			Insert boundary: 1, .f2b_t_list [1]
			Insert boundary: 1, .end
			Set interval text: 1, 2, "Vowel"

			# Target 2
			@get_closest_vowels: .sp$, .formants, .syllableKernels, .start, .gendert$, .f1_value[2], .f2_value[2]
			.f2b_f1_list [2] = get_closest_vowels.f1_list [1]
			.f2b_f2_list [2] = get_closest_vowels.f2_list [1]
			.f2b_f3_list [2] = get_closest_vowels.f3_list [1]
			.f2b_t_list [2] = get_closest_vowels.t_list [1]
			.f2b_distance [2] = get_closest_vowels.distance_list [1]
			# Remove temporary tier
			selectObject: .syllableKernels
			Remove tier: 1
			
			# Back to front
			# Add a new tier with only a single interval
			selectObject: .syllableKernels
			Insert interval tier: 1, "Vowel"
			Insert boundary: 1, .start
			Insert boundary: 1, .b2f_t_list [2]
			Set interval text: 1, 2, "Vowel"

			# Target 1
			@get_closest_vowels: .sp$, .formants, .syllableKernels, .start, .gendert$, .f1_value[1], .f2_value[1]
			.b2f_f1_list [1] = get_closest_vowels.f1_list [1]
			.b2f_f2_list [1] = get_closest_vowels.f2_list [1]
			.b2f_f3_list [1] = get_closest_vowels.f3_list [1]
			.b2f_t_list [1] = get_closest_vowels.t_list [1]
			.b2f_distance [1] = get_closest_vowels.distance_list [1]
			# Remove temporary tier
			selectObject: .syllableKernels
			Remove tier: 1

			# Compare and assign
			.f2b_distanceSQ = .f2b_distance [1] ** 2 + .f2b_distance [2] ** 2
			.b2f_distanceSQ = .b2f_distance [1] ** 2 + .b2f_distance [2] ** 2
			if  .f2b_distanceSQ <= .b2f_distanceSQ
				vowelTarget.f1_list [.i - 1] = .f2b_f1_list [1]
				vowelTarget.f2_list [.i - 1] = .f2b_f2_list [1]
				vowelTarget.f3_list [.i - 1] = .f2b_f3_list [1]
				vowelTarget.t_list [.i - 1] = .f2b_t_list [1]
				
				vowelTarget.f1_list [.i] = .f2b_f1_list [2]
				vowelTarget.f2_list [.i] = .f2b_f2_list [2]
				vowelTarget.f3_list [.i] = .f2b_f3_list [2]
				vowelTarget.t_list [.i] = .f2b_t_list [2]
			else
				vowelTarget.f1_list [.i - 1] = .b2f_f1_list [1]
				vowelTarget.f2_list [.i - 1] = .b2f_f2_list [1]
				vowelTarget.f3_list [.i - 1] = .b2f_f3_list [1]
				vowelTarget.t_list [.i - 1] = .b2f_t_list [1]
				
				vowelTarget.f1_list [.i] = .b2f_f1_list [2]
				vowelTarget.f2_list [.i] = .b2f_f2_list [2]
				vowelTarget.f3_list [.i] = .b2f_f3_list [2]
				vowelTarget.t_list [.i] = .b2f_t_list [2]
			endif
			# Remove temporary tier
			selectObject: .syllableKernels
			Remove tier: 1
		endif
	endfor
	
endproc
