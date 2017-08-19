#!praat
#
.sp_default = 1

#.espeak = Create SpeechSynthesizer: "Mandarin", "f3"

language$ = "ZH"
color$ ["a"] = "Red"
color$ ["i"] = "Green"
color$ ["u"] = "Blue"
color$ ["ə"] = "{0.8,0.8,0.8}"

ipavowelsymbols$ = "ɑɛIOoYaeiouyəæ"
# These should be Mandarin vowel formant values
#
# Male
phonemes ["ZH", "M", "i_corner", "F1"] = 250
phonemes ["ZH", "M", "i_corner", "F2"] = 2200
phonemes ["ZH", "M", "a_corner", "F1"] = 800
phonemes ["ZH", "M", "a_corner", "F2"] = 1300
phonemes ["ZH", "M", "u_corner", "F1"] = 280
phonemes ["ZH", "M", "u_corner", "F2"] = 600
# @_center is not fixed but derived from current corners
phonemes ["ZH", "M", "ə_center", "F1"] =(phonemes ["ZH", "M", "i_corner", "F1"]*phonemes ["ZH", "M", "u_corner", "F1"]*phonemes ["ZH", "M", "a_corner", "F1"])^(1/3)
phonemes ["ZH", "M", "ə_center", "F2"] = (phonemes ["ZH", "M", "i_corner", "F2"]*phonemes ["ZH", "M", "u_corner", "F2"]*phonemes ["ZH", "M", "a_corner", "F2"])^(1/3)

# Formant values according to 
# IFA corpus averages from FPA isolated vowels
# Using Split-Levinson algorithm
phonemes ["ZH", "M", "ɑ", "F1"] = 695.6000
phonemes ["ZH", "M", "ɑ", "F2"] = 1065.500
phonemes ["ZH", "M", "æ", "F1"] = 552.5000
phonemes ["ZH", "M", "æ", "F2"] = 1659.200
phonemes ["ZH", "M", "ɛ", "F1"] = 552.5000
phonemes ["ZH", "M", "ɛ", "F2"] = 1659.200
phonemes ["ZH", "M", "i.", "F1"] = 378.0909
phonemes ["ZH", "M", "i.", "F2"] = 1868.545
phonemes ["ZH", "M", "i̪", "F1"] = 378.0909
phonemes ["ZH", "M", "i̪", "F2"] = 1868.545
phonemes ["ZH", "M", "O", "F1"] = 482.9000
phonemes ["ZH", "M", "O", "F2"] = 725.800
phonemes ["ZH", "M", "o-", "F1"] = 417.7000
phonemes ["ZH", "M", "o-", "F2"] = 1455.100
phonemes ["ZH", "M", "Y:", "F1"] = 386.3000
phonemes ["ZH", "M", "Y:", "F2"] = 1492.400
phonemes ["ZH", "M", "a", "F1"] = 788.6000
phonemes ["ZH", "M", "a", "F2"] = 1290.600
phonemes ["ZH", "M", "e", "F1"] = 372.3000
phonemes ["ZH", "M", "e", "F2"] = 1959.700
phonemes ["ZH", "M", "i", "F1"] = 259.5556
phonemes ["ZH", "M", "i", "F2"] = 1971.889
phonemes ["ZH", "M", "o", "F1"] = 426.7000
phonemes ["ZH", "M", "o", "F2"] = 743.600
phonemes ["ZH", "M", "u", "F1"] = 287.5000
phonemes ["ZH", "M", "u", "F2"] = 666.500
phonemes ["ZH", "M", "y", "F1"] = 268.4000
phonemes ["ZH", "M", "y", "F2"] = 1581.400
# Guessed
phonemes ["ZH", "M", "ə", "F1"] = 417.7000
phonemes ["ZH", "M", "ə", "F2"] = 1455.100

# Female
phonemes ["ZH", "F", "i_corner", "F1"] = 285
phonemes ["ZH", "F", "i_corner", "F2"] = 2100
phonemes ["ZH", "F", "a_corner", "F1"] = 900
phonemes ["ZH", "F", "a_corner", "F2"] = 1435
phonemes ["ZH", "F", "u_corner", "F1"] = 370
phonemes ["ZH", "F", "u_corner", "F2"] = 650
# @_center is not fixed but derived from current corners
phonemes ["ZH", "F", "ə_center", "F1"] =(phonemes ["ZH", "F", "i_corner", "F1"]*phonemes ["ZH", "F", "u_corner", "F1"]*phonemes ["ZH", "F", "a_corner", "F1"])^(1/3)
phonemes ["ZH", "F", "ə_center", "F2"] = (phonemes ["ZH", "F", "i_corner", "F2"]*phonemes ["ZH", "F", "u_corner", "F2"]*phonemes ["ZH", "F", "a_corner", "F2"])^(1/3)

# Formant values according to 
# IFA corpus average from FPA isolated vowels
# Using Split-Levinson algorithm
phonemes ["ZH", "F", "ɑ", "F1"] = 817.7000
phonemes ["ZH", "F", "ɑ", "F2"] = 1197.300
phonemes ["ZH", "F", "æ", "F1"] = 667.9000
phonemes ["ZH", "F", "æ", "F2"] = 1748.500
phonemes ["ZH", "F", "ɛ", "F1"] = 667.9000
phonemes ["ZH", "F", "ɛ", "F2"] = 1748.500
phonemes ["ZH", "F", "i.", "F1"] = 429.2222
phonemes ["ZH", "F", "i.", "F2"] = 1937.333
phonemes ["ZH", "F", "i̪", "F1"] = 429.2222
phonemes ["ZH", "F", "i̪", "F2"] = 1937.333
phonemes ["ZH", "F", "O", "F1"] = 570.8000
phonemes ["ZH", "F", "O", "F2"] = 882.100
phonemes ["ZH", "F", "o-", "F1"] = 495.7000
phonemes ["ZH", "F", "o-", "F2"] = 1635.600
phonemes ["ZH", "F", "Y:", "F1"] = 431.1000
phonemes ["ZH", "F", "Y:", "F2"] = 1695.100
phonemes ["ZH", "F", "a", "F1"] = 853.6000
phonemes ["ZH", "F", "a", "F2"] = 1435.800
phonemes ["ZH", "F", "e", "F1"] = 429.9000
phonemes ["ZH", "F", "e", "F2"] = 1861.700
phonemes ["ZH", "F", "i", "F1"] = 294.3000
phonemes ["ZH", "F", "i", "F2"] = 1855.000
phonemes ["ZH", "F", "o", "F1"] = 527.5000
phonemes ["ZH", "F", "o", "F2"] = 894.100
phonemes ["ZH", "F", "u", "F1"] = 376.0000
phonemes ["ZH", "F", "u", "F2"] = 735.200
phonemes ["ZH", "F", "y", "F1"] = 321.2000
phonemes ["ZH", "F", "y", "F2"] = 1741.700
# Guessed
phonemes ["ZH", "F", "ə", "F1"] = 500.5
phonemes ["ZH", "F", "ə", "F2"] = 1706.6


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
	
	@plot_vowels: plot, "Red", .sp$, .sound, .pinyin$, .ipa$

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

# Plot the vowels in a sound
procedure plot_vowels .plot, .color$ .sp$ .sound .pinyin$ .targets$
	.ipa$ = .targets$
	.startT = 0 
	call segment_syllables -25 4 0.3 1 .sound
	.syllableKernels = segment_syllables.textgridid
	
	# Calculate the formants
	selectObject: .sound
	if .sp$ = "M"
		.downSampled = Resample: 10000, 50
		.formants = noprogress To Formant (sl): 0, 5, 5000, 0.025, 50
	else
		.downSampled = Resample: 11000, 50
		.formants = noprogress To Formant (sl): 0, 5, 5500, 0.025, 50
	endif

	call select_vowel_target .sound .formants .syllableKernels
	.vowelTier = select_vowel_target.vowelTier
	.targetTier = select_vowel_target.targetTier
	selectObject: .syllableKernels
	.numSyllables = Get number of points: .targetTier
	.startT = 0
	.targetnum = 0
	while index_regex(.targets$, "['ipavowelsymbols$']")
		.targets$ = replace_regex$(.targets$, "^[^'ipavowelsymbols$']+", "", 0)
		if startsWith(.targets$, "i̪")
			.v$ = "i̪"
			.targets$ = right$(.targets$, length(.targets$) - length("i̪"))
		else
			.v$ = replace_regex$(.targets$, "^(['ipavowelsymbols$'](_center|_corner|[\.-:])?).*$", "\1", 0)
			.targets$ = replace_regex$(.targets$, "^(['ipavowelsymbols$'](_center|_corner|[\.-:])?)", "", 0)
		endif
		.f1 = phonemes [language$, .sp$, .v$, "F1"]
		.f2 = phonemes [language$, .sp$, .v$, "F2"]
		@get_closest_vowels: .sp$, .formants, .syllableKernels, 0, .f1, .f2
		.startT = get_closest_vowels.t
		.numVowelIntervals = get_closest_vowels.vowelNum
		if .numVowelIntervals > 0
			.targetnum += 1
			# Get closest distance
			.minVowelDistance = get_closest_vowels.distance_list [1]
			.f1_list [.targetnum] = get_closest_vowels.f1_list [1]
			.f2_list [.targetnum] = get_closest_vowels.f2_list [1]
			.f3_list [.targetnum] = get_closest_vowels.f3_list [1]
			.t_list [.targetnum] = get_closest_vowels.t_list [1]
			for .i from 2 to .numVowelIntervals
				if .minVowelDistance > get_closest_vowels.distance_list [.i]
					.minVowelDistance = get_closest_vowels.distance_list [.i]
					.f1_list [.targetnum] = get_closest_vowels.f1_list [.i]
					.f2_list [.targetnum] = get_closest_vowels.f2_list [.i]
					.f3_list [.targetnum] = get_closest_vowels.f3_list [.i]
					.t_list [.targetnum] = get_closest_vowels.t_list [.i]
				endif
			endfor
		endif
	endwhile
	# Actually plot the vowels
	if .plot and .targetnum > 0
		@vowel2point: .sp$, .f1_list [1], .f2_list [1]
		.x = vowel2point.x
		.y = vowel2point.y
		demo Paint circle: .color$, .x, .y, 1
		demo Arrow size: 2
		demo '.color$'
		demo Dotted line
		for .t from 2 to .targetnum
			.xlast = .x
			.ylast = .y
			@vowel2point: .sp$, .f1_list [.t], .f2_list [.t]
			.x = vowel2point.x
			.y = vowel2point.y
			demo Draw arrow: .xlast, .ylast, .x, .y
		endfor
		demoShow()
		demo Black
	elsif .targetnum > 0
		.f1values$ = ""
		.f2values$ = ""
		.f3values$ = ""
		.tvalues$ = ""
		for .t to .targetnum
			.f1values$ = .f1values$ + fixed$(.f1_list [.t], 0) + ";"
			.f2values$ = .f2values$ + fixed$(.f2_list [.t], 0) + ";"
			.f3values$ = .f3values$ + fixed$(.f3_list [.t], 0) + ";"
			.tvalues$ = .tvalues$ + fixed$(.t_list [.t], 3) + ";"
		endfor
		appendFileLine: outFile$, .pinyin$, tab$, .ipa$, tab$, .sp$, tab$, .targetnum, tab$, .f1values$, tab$, .f2values$, tab$, .f3values$, tab$, .tvalues$
	endif
	selectObject: .downSampled, .formants, .syllableKernels
	Remove
endproc

# Plot the standard vowels
procedure plot_standard_vowel .color$ .sp$ .vowel$ .reduction
	.vowel$ = replace_regex$(.vowel$, "v", "y", 0)

	.i = 0
	while .vowel$ <> ""
		.i += 1
		.v$ = replace_regex$(.vowel$, "^\s*(\S[`]?).*$", "\1", 0)
		.f1 = phonemes [language$, .sp$, .v$, "F1"]
		.f2 = phonemes [language$, .sp$, .v$, "F2"]
		if .reduction
			.factor = 0.9^.reduction
			.f1 = .factor * (.f1 - phonemes [language$, .sp$, "ə", "F1"]) + phonemes [language$, .sp$, "ə", "F1"]
			.f2 = .factor * (.f2 - phonemes [language$, .sp$, "ə", "F2"]) + phonemes [language$, .sp$, "ə", "F2"]
		endif
		@vowel2point: .sp$, .f1, .f2
		.x [.i] = vowel2point.x
		.y [.i] = vowel2point.y
		.vowel$ = replace_regex$(.vowel$, "^\s*(\S[`]?)", "", 0)
	endwhile
	demo Arrow size: 2
	demo Green
	demo Dotted line
	demo Paint circle: .color$, .x[1], .y[1], 1
	for .p from 2 to .i
		demo Draw arrow: .x[.p - 1], .y[.p - 1], .x[.p], .y[.p]
	endfor
	demoShow()
	demo Black
endproc

# Plot the vowel triangle
procedure plot_vowel_triangle .sp$
	# Draw vowel triangle
	.a_F1 = phonemes [language$, .sp$, "a_corner", "F1"]
	.a_F2 = phonemes [language$, .sp$, "a_corner", "F2"]

	.i_F1 = phonemes [language$, .sp$, "i_corner", "F1"]
	.i_F2 = phonemes [language$, .sp$, "i_corner", "F2"]

	.u_F1 = phonemes [language$, .sp$, "u_corner", "F1"]
	.u_F2 = phonemes [language$, .sp$, "u_corner", "F2"]
	
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
endproc


# Stop the progam
procedure exitVowelTarget .message$
	select all
	if numberOfSelected() > 0
		Remove
	endif
	exitScript: .message$
endproc

# Convert the frequencies to coordinates
procedure vowel2point .sp$ .f1 .f2
	.spt1 = 12*log2(.f1)
	.spt2 = 12*log2(.f2)
	
	.a_St1 = 12*log2(phonemes [language$, .sp$, "a_corner", "F1"])
	.a_St2 = 12*log2(phonemes [language$, .sp$, "a_corner", "F2"])

	.i_St1 = 12*log2(phonemes [language$, .sp$, "i_corner", "F1"])
	.i_St2 = 12*log2(phonemes [language$, .sp$, "i_corner", "F2"])

	.u_St1 = 12*log2(phonemes [language$, .sp$, "u_corner", "F1"])
	.u_St2 = 12*log2(phonemes [language$, .sp$, "u_corner", "F2"])
	
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
	.xp *= 100
	.yp *= 100
	.x *= 100
	.y *= 100
endproc

# Get a list of best targets with distances, one for each vowel segment found
# Use DTW to get the best match
procedure get_closest_vowels .sp$ .formants .textgrid .startT .f1_o .f2_o
	.f1 = 0
	.f2 = 0
	.distance = 10000000
	
	# Convert to coordinates
	@vowel2point: .sp$, .f1_o, .f2_o
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

procedure select_vowel_target .sound .formants .textgrid
	.f1_Lowest = 250
	.f1_Highest = 1050
	selectObject: .textgrid
	.duration = Get total duration
	.firstTier$ = Get tier name: 1
	if .firstTier$ <> "Vowel"
		Insert point tier: 1, "VowelTarget"
		Insert interval tier: 1, "Vowel"
	endif
	.vowelTier = 1
	.targetTier = 2
	.peakTier = 3
	.valleyTier = 4
	.silencesTier = 5
	.vuvTier = 6

	selectObject: .sound
	.samplingFrequency = Get sampling frequency
	.intensity = Get intensity (dB)
	if .samplingFrequency = 10000
		.formantsBurg = noprogress To Formant (burg): 0, 5, 5000, 0.025, 50
	else
		.formantsBurg = noprogress To Formant (burg): 0, 5, 5500, 0.025, 50
	endif
	.totalNumFrames = Get number of frames
		
	# Nothing found, but there is sound. Try to find at least 1 vowel
	
	selectObject: .textgrid
	.numPeaks = Get number of points: .peakTier	
	if .numPeaks <= 0 and .intensity >= 45
		selectObject: .sound
		.t_max = Get time of maximum: 0, 0, "Sinc70"
		.pp = noprogress To PointProcess (periodic, cc): 75, 600
		.textGrid = noprogress To TextGrid (vuv): 0.02, 0.01
		.i = Get interval at time: 1, .t_max
		.label$ = Get label of interval: 1, .i
		.start = Get start time of interval: 1, .i
		.end = Get end time of interval: 1, .i
		if .label$ = "V"
			selectObject: .syllableKernels
			Insert point: .peakTier, .t_max, "P"
			Insert point: .valleyTier, .start, "V"
			Insert point: .valley, .end, "V"
		endif
	endif
	
	selectObject: .textgrid
	.numPeaks = Get number of points: .peakTier
	.numValleys = Get number of points: .valleyTier
	for .p to .numPeaks
		selectObject: .textgrid
		.tp = Get time of point: .peakTier, .p
		# Find boundaries
		# From valleys
		.tl = 0
		.vl = Get low index from time: .valleyTier, .tp
		if .vl > 0 and .vl < .numValleys
			.tl = Get time of point: .valleyTier, .vl
		endif
		.th = .duration
		.vh = Get high index from time: .valleyTier, .tp
		if .vh > 0 and .vh < .numValleys
			.th = Get time of point: .valleyTier, .vh
		endif
		# From silences
		.sl = Get interval at time: .silencesTier, .tl
		.label$ = Get label of interval: .silencesTier, .sl
		.tsl = .tl
		if .label$ = "silent"
			.tsl = Get end time of interval: .silencesTier, .sl
		endif
		if .tsl > .tl and .tsl < .tp
			.tl = .tsl
		endif
		.sh = Get interval at time: .silencesTier, .th
		.label$ = Get label of interval: .silencesTier, .sh
		.tsh = .th
		if .label$ = "silent"
			.tsh = Get start time of interval: .silencesTier, .sh
		endif
		if .tsh < .th and .tsh > .tp
			.th = .tsh
		endif
		
		# From vuv
		.vuvl = Get interval at time: .vuvTier, .tl
		.label$ = Get label of interval: .vuvTier, .vuvl
		.tvuvl = .tl
		if .label$ = "U"
			.tvuvl = Get end time of interval: .vuvTier, .vuvl
		endif
		if .tvuvl > .tl and .tvuvl < .tp
			.tl = .tvuvl
		endif
		.vuvh = Get interval at time: .vuvTier, .th
		.label$ = Get label of interval: .vuvTier, .vuvh
		.tvuvh = .th
		if .label$ = "U"
			.tvuvh = Get start time of interval: .vuvTier, .vuvh
		endif
		if .tvuvh < .th and .tvuvh > .tp
			.th = .tvuvh
		endif
		
		# From formants: 300 <= F1 <= 1000
		# F1 >= 300
		selectObject: .formants
		.dt = Get time step

		selectObject: .formants
		.f = Get value at time: 1, .tl, "Hertz", "Linear"
		selectObject: .formantsBurg
		.b = Get bandwidth at time: 1, .tl, "Hertz", "Linear"
		.iframe = Get frame number from time: .tl
		if .iframe > .totalNumFrames
			.iframe = .totalNumFrames
		elsif .iframe < 1
			.iframe = 1
		endif
		.nf = Get number of formants: .iframe
		while (.f < .f1_Lowest or .f > .f1_Highest or .b > 0.7 * .f or .nf < 4) and .tl + .dt < .th
			.tl += .dt
			selectObject: .formants
			.f = Get value at time: 1, .tl, "Hertz", "Linear"
			selectObject: .formantsBurg
			.b = Get bandwidth at time: 1, .tl, "Hertz", "Linear"
			.iframe = Get frame number from time: .tl	
			if .iframe > .totalNumFrames
				.iframe = .totalNumFrames
			elsif .iframe < 1
				.iframe = 1
			endif
			.nf = Get number of formants: .iframe		
		endwhile

		selectObject: .formants
		.f = Get value at time: 1, .th, "Hertz", "Linear"
		selectObject: .formantsBurg
		.b = Get bandwidth at time: 1, .th, "Hertz", "Linear"
		.iframe = Get frame number from time: .th
		if .iframe > .totalNumFrames
			.iframe = .totalNumFrames
		elsif .iframe < 1
			.iframe = 1
		endif
		.nf = Get number of formants: .iframe
		while (.f < .f1_Lowest or .f > .f1_Highest or .b > 0.7 * .f or .nf < 4) and .th - .dt > .tl
			.th -= .dt
			selectObject: .formants
			.f = Get value at time: 1, .th, "Hertz", "Linear"
			selectObject: .formantsBurg
			.b = Get bandwidth at time: 1, .th, "Hertz", "Linear"
			.iframe = Get frame number from time: .th
			if .iframe > .totalNumFrames
				.iframe = .totalNumFrames
			elsif .iframe < 1
				.iframe = 1
			endif
			.nf = Get number of formants: .iframe		
		endwhile
		
		# New points
		if .th - .tl > 0.01
			selectObject: .textgrid
			.numPoints = Get number of points: .targetTier
			.tmp = 0
			if .numPoints > 0
				.tmp = Get time of point: .targetTier, .numPoints
			endif
			if .tl <> .tmp
				#Insert point: .targetTier, .tl, "L"
			else
				.ptxt$ = Get label of point: .targetTier, .numPoints
				#Set point text: .targetTier, .numPoints, .ptxt$+"L"
			endif
			#Insert point: .targetTier, .th, "H"
			
			selectObject: .formants
			if .tp > .tl and .tp < .th
				.tt = .tp
			else
				.tt = (.tl+.th)/2
				.f1_median = Get quantile: 1, .tl, .th, "Hertz", 0.5 
				.f2_median = Get quantile: 2, .tl, .th, "Hertz", 0.5 
				if .f1_median > 400
					.tt = Get time of maximum: 1, .tl, .th, "Hertz", "Parabolic"
				elsif .f2_median > 1600
					.tt = Get time of maximum: 2, .tl, .th, "Hertz", "Parabolic"
				elsif .f2_median < 1100
					.tt = Get time of minimum: 2, .tl, .th, "Hertz", "Parabolic"
				endif
				
				if .tt < .tl + 0.01 or .tt > .th - 0.01
					.tt = (.tl+.th)/2
				endif
			endif
			
			# Insert Target
			selectObject: .textgrid
			.numPoints = Get number of points: .targetTier
			.tmp = 0
			if .numPoints > 0
				.tmp = Get time of point: .targetTier, .numPoints
			endif
			if .tt <> .tmp
				Insert point: .targetTier, .tt, "T"
			endif
			
			# Now find vowel interval from taget
			.ttl = .tt
			# Lower end
			selectObject: .formants
			.f = Get value at time: 1, .ttl, "Hertz", "Linear"
			selectObject: .formantsBurg
			.b = Get bandwidth at time: 1, .ttl, "Hertz", "Linear"
			.iframe = Get frame number from time: .th
			if .iframe > .totalNumFrames
				.iframe = .totalNumFrames
			elsif .iframe < 1
				.iframe = 1
			endif
			.nf = Get number of formants: .iframe		
			while (.f > 300 and .f < 1000 and .b < 0.9 * .f and .nf >= 4) and .ttl - .dt >= .tl
				.ttl -= .dt
				selectObject: .formants
				.f = Get value at time: 1, .ttl, "Hertz", "Linear"
				selectObject: .formantsBurg
				.b = Get bandwidth at time: 1, .ttl, "Hertz", "Linear"
				.iframe = Get frame number from time: .ttl
				if .iframe > .totalNumFrames
					.iframe = .totalNumFrames
				elsif .iframe < 1
					.iframe = 1
				endif
				.nf = Get number of formants: .iframe		
			endwhile
			# Make sure something has changed
			if .ttl > .tt - 0.01
				.ttl = .tl
			endif
			
			# Higher end
			.tth = .tp
			selectObject: .formants
			.f = Get value at time: 1, .tth, "Hertz", "Linear"
			selectObject: .formantsBurg
			.b = Get bandwidth at time: 1, .tth, "Hertz", "Linear"
			.iframe = Get frame number from time: .th
			if .iframe > .totalNumFrames
				.iframe = .totalNumFrames
			elsif .iframe < 1
				.iframe = 1
			endif
			.nf = Get number of formants: .iframe		
			while (.f > 300 and .f < 1000 and .b < 0.9 * .f and .nf >= 4) and .tth + .dt <= .th
				.tth += .dt
				selectObject: .formants
				.f = Get value at time: 1, .tth, "Hertz", "Linear"
				selectObject: .formantsBurg
				.b = Get bandwidth at time: 1, .tth, "Hertz", "Linear"
				.iframe = Get frame number from time: .tth
				if .iframe > .totalNumFrames
					.iframe = .totalNumFrames
				elsif .iframe < 1
					.iframe = 1
				endif
				.nf = Get number of formants: .iframe		
			endwhile
			# Make sure something has changed
			if .tth < .tt + 0.01
				.tth = .th
			endif
			
			# Insert interval
			selectObject: .textgrid
			.index = Get interval at time: .vowelTier, .ttl
			.start = Get start time of interval: .vowelTier, .index
			.end = Get end time of interval: .vowelTier, .index
			if .ttl <> .start and .ttl <> .end
				Insert boundary: .vowelTier, .ttl
			endif
			.index = Get interval at time: .vowelTier, .tth
			.start = Get start time of interval: .vowelTier, .index
			.end = Get end time of interval: .vowelTier, .index
			if .tth <> .start and .tth <> .end
				Insert boundary: .vowelTier, .tth
			endif
			.index = Get interval at time: .vowelTier, .tt
			.start = Get start time of interval: .vowelTier, .index
			.end = Get end time of interval: .vowelTier, .index
			# Last sanity checks on duration and intensity
			# A vowel is at least 20 ms long
			if .end - .start > 0.020
				selectObject: .sound
				.sd = Get standard deviation: 1, .start, .end
				# Is there enough sound to warrant a vowel? > -15dB
				if 20*log10(.sd/(2*10^-5)) - .intensity > -15
					selectObject: .textgrid
					Set interval text: .vowelTier, .index, "Vowel"
				endif
			endif
		endif
	endfor
	
	selectObject: .formantsBurg
	Remove
	
endproc


###########################################################################
#                                                                         #
#  Praat Script Syllable Nuclei                                           #
#  Copyright (C) 2017  R.J.J.H. van Son                                   #
#                                                                         #
#    This program is free software: you can redistribute it and/or modify #
#    it under the terms of the GNU General Public License as published by #
#    the Free Software Foundation, either version 2 of the License, or    #
#    (at your option) any later version.                                  #
#                                                                         #
#    This program is distributed in the hope that it will be useful,      #
#    but WITHOUT ANY WARRANTY; without even the implied warranty of       #
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        #
#    GNU General Public License for more details.                         #
#                                                                         #
#    You should have received a copy of the GNU General Public License    #
#    along with this program.  If not, see http://www.gnu.org/licenses/   #
#                                                                         #
###########################################################################
#
# Simplified summary of the script by Nivja de Jong and Ton Wempe         #
procedure segment_syllables .silence_threshold .minimum_dip_between_peaks .minimum_pause_duration .keep_Soundfiles_and_Textgrids .soundid
	# Get intensity
	selectObject: .soundid
	.intensity = noprogress To Intensity: 70, 0, "yes"
	.dt = Get time step
	.maxFrame = Get number of frames
	
	# Determine Peaks
	selectObject: .intensity
	.peaksInt = noprogress To IntensityTier (peaks)
	.peaksPoint = Down to PointProcess
	.peaksPointTier = Up to TextTier: "P"
	Rename: "Peaks"
	
	# Determine valleys
	selectObject: .intensity
	.valleyInt = noprogress To IntensityTier (valleys)
	.valleyPoint = Down to PointProcess
	.valleyPointTier = Up to TextTier: "V"
	Rename: "Valleys"
	
	selectObject: .peaksPointTier, .valleyPointTier
	.segmentTextGrid = Into TextGrid
	
	selectObject: .peaksPointTier, .valleyPointTier, .peaksInt, .peaksPoint, .valleyInt, .valleyPoint
	Remove
	
	# Select the sounding part
	selectObject: .intensity
	.silenceTextGrid = noprogress To TextGrid (silences): .silence_threshold, .minimum_pause_duration, 0.05, "silent", "sounding"
	
	# Determine voiced parts
	selectObject: .soundid
	.voicePP = noprogress To PointProcess (periodic, cc): 75, 600
	.vuvTextGrid = noprogress To TextGrid (vuv): 0.02, 0.01
	plusObject: .segmentTextGrid, .silenceTextGrid
	.textgridid = Merge
	
	selectObject: .vuvTextGrid, .silenceTextGrid, .segmentTextGrid, .voicePP
	Remove
	
	# Remove irrelevant peaks and valleys
	selectObject: .textgridid
	.numPeaks = Get number of points: 1
	for .i to .numPeaks
		.t = Get time of point: 1, .numPeaks + 1 - .i
		.s = Get interval at time: 3, .t
		.soundLabel$ = Get label of interval: 3, .s
		.v = Get interval at time: 4, .t
		.voiceLabel$ = Get label of interval: 4, .v
		if .soundLabel$ = "silent" or .voiceLabel$ = "U"
			Remove point: 1, .numPeaks + 1 - .i
		endif
	endfor
	
	# valleys
	selectObject: .textgridid
	.numValleys = Get number of points: 2
	.numPeaks = Get number of points: 1
	# No peaks, nothing to do
	if .numPeaks <= 0
		goto VALLEYREADY
	endif
	
	for .i from 2 to .numValleys
		selectObject: .textgridid
		.il = .numValleys + 1 - .i
		.ih = .numValleys + 2 - .i
		.tl = Get time of point: 2, .il
		.th = Get time of point: 2, .ih
		
		
		.ph = Get high index from time: 1, .tl
		.tph = 0
		if .ph > 0 and .ph <= .numPeaks
			.tph = Get time of point: 1, .ph
		endif
		# If there is no peak between the valleys remove the highest
		if .tph <= 0 or (.tph < .tl or .tph > .th)
			# If the area is silent for both valleys, keep the one closest to a peak
			.psl = Get interval at time: 3, .tl
			.psh = Get interval at time: 3, .th
			.psl_label$ = Get label of interval: 3, .psl
			.psh_label$ = Get label of interval: 3, .psh
			if .psl_label$ = "silent" and .psh_label$ = "silent"
				.plclosest = Get nearest index from time: 1, .tl
				if .plclosest <= 0
					.plclosest = 1
				endif
				if .plclosest > .numPeaks
					.plclosest = .numPeaks
				endif
				.tlclosest = Get time of point: 1, .plclosest
				.phclosest = Get nearest index from time: 1, .th
				if .phclosest <= 0
					.phclosest = 1
				endif
				if .phclosest > .numPeaks
					.phclosest = .numPeaks
				endif
				.thclosest = Get time of point: 1, .phclosest
				if abs(.tlclosest - .tl) > abs(.thclosest - .th)
					selectObject: .textgridid
					Remove point: 2, .il
				else
					selectObject: .textgridid
					Remove point: 2, .ih
				endif
			else
				# Else Compare valley depths
				selectObject: .intensity
				.intlow = Get value at time: .tl, "Cubic"
				.inthigh = Get value at time: .th, "Cubic"
				if .inthigh >= .intlow
					selectObject: .textgridid
					Remove point: 2, .ih
				else
					selectObject: .textgridid
					Remove point: 2, .il
				endif
			endif
		endif
	endfor

	# Remove superfluous valleys
	selectObject: .textgridid
	.numValleys = Get number of points: 2
	.numPeaks = Get number of points: 1
	for .i from 1 to .numValleys
		selectObject: .textgridid
		.iv = .numValleys + 1 - .i
		.tv = Get time of point: 2, .iv
		.ph = Get high index from time: 1, .tv
		if .ph > .numPeaks
			.ph = .numPeaks
		endif
		.tph = Get time of point: 1, .ph
		.pl = Get low index from time: 1, .tv
		if .pl <= 0
			.pl = 1
		endif
		.tpl = Get time of point: 1, .pl
		
		# Get intensities
		selectObject: .intensity
		.v_int = Get value at time: .tv, "Cubic"
		.pl_int = Get value at time: .tpl, "Cubic"
		.ph_int = Get value at time: .tph, "Cubic"
		# If there is no real dip, remove valey and lowest peak
		if min((.pl_int - .v_int), (.ph_int - .v_int)) < .minimum_dip_between_peaks
			selectObject: .textgridid
			Remove point: 2, .iv
			if .ph <> .pl
				if .pl_int < .ph_int
					Remove point: 1, .pl
				else
					Remove point: 1, .ph
				endif
			endif
			.numPeaks = Get number of points: 1
			if .numPeaks <= 0
				goto VALLEYREADY
			endif
		endif
	endfor
	label VALLEYREADY
	
	selectObject: .intensity
	Remove
	
	selectObject: .textgridid
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
