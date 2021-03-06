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

procedure init_LanguageTargets
	ipavowelsymbols$ = "ɑɛIOoYaeiouyəæ"
	
	###################################################################
	# 
	# Mandarin
	# 
	###################################################################
	
	# These should be Mandarin vowel formant values
	#
	# Male
	languageTargets.phonemes ["ZH", "M", "i_corner", "F1"] = 250
	languageTargets.phonemes ["ZH", "M", "i_corner", "F2"] = 2200
	languageTargets.phonemes ["ZH", "M", "a_corner", "F1"] = 800
	languageTargets.phonemes ["ZH", "M", "a_corner", "F2"] = 1300
	languageTargets.phonemes ["ZH", "M", "u_corner", "F1"] = 280
	languageTargets.phonemes ["ZH", "M", "u_corner", "F2"] = 600

	# @_center is not fixed but derived from current corners
	languageTargets.phonemes ["ZH", "M", "ə_center", "F1"] =(languageTargets.phonemes ["ZH", "M", "i_corner", "F1"]*languageTargets.phonemes ["ZH", "M", "u_corner", "F1"]*languageTargets.phonemes ["ZH", "M", "a_corner", "F1"])^(1/3)
	languageTargets.phonemes ["ZH", "M", "ə_center", "F2"] = (languageTargets.phonemes ["ZH", "M", "i_corner", "F2"]*languageTargets.phonemes ["ZH", "M", "u_corner", "F2"]*languageTargets.phonemes ["ZH", "M", "a_corner", "F2"])^(1/3)

	# Sides are not fixed but derived from current corners
	languageTargets.phonemes ["ZH", "M", "e_side", "F1"] =(languageTargets.phonemes ["ZH", "M", "i_corner", "F1"]*languageTargets.phonemes ["ZH", "M", "a_corner", "F1"])^(1/2)
	languageTargets.phonemes ["ZH", "M", "e_side", "F2"] =(languageTargets.phonemes ["ZH", "M", "i_corner", "F2"]^2*languageTargets.phonemes ["ZH", "M", "a_corner", "F2"])^(1/3)

	languageTargets.phonemes ["ZH", "M", "o_side", "F1"] =(languageTargets.phonemes ["ZH", "M", "u_corner", "F1"]*languageTargets.phonemes ["ZH", "M", "a_corner", "F1"])^(1/2)
	languageTargets.phonemes ["ZH", "M", "o_side", "F2"] =(languageTargets.phonemes ["ZH", "M", "a_corner", "F2"]*languageTargets.phonemes ["ZH", "M", "u_corner", "F2"]^2)^(1/3)

	languageTargets.phonemes ["ZH", "M", "y_side", "F1"] = languageTargets.phonemes ["ZH", "M", "i_corner", "F1"]
	languageTargets.phonemes ["ZH", "M", "y_side", "F2"] =(languageTargets.phonemes ["ZH", "M", "i_corner", "F2"]*languageTargets.phonemes ["ZH", "M", "a_corner", "F2"])^(1/2)
	
	# Formant values according to 
	# IFA corpus averages from FPA isolated vowels
	# Using Split-Levinson algorithm
	languageTargets.phonemes ["ZH", "M", "ɑ", "F1"] = 695.6000
	languageTargets.phonemes ["ZH", "M", "ɑ", "F2"] = 1065.500
	languageTargets.phonemes ["ZH", "M", "æ", "F1"] = 552.5000
	languageTargets.phonemes ["ZH", "M", "æ", "F2"] = 1659.200
	languageTargets.phonemes ["ZH", "M", "ɛ", "F1"] = 552.5000
	languageTargets.phonemes ["ZH", "M", "ɛ", "F2"] = 1659.200
	languageTargets.phonemes ["ZH", "M", "i.", "F1"] = 378.0909
	languageTargets.phonemes ["ZH", "M", "i.", "F2"] = 1868.545
	languageTargets.phonemes ["ZH", "M", "O", "F1"] = 482.9000
	languageTargets.phonemes ["ZH", "M", "O", "F2"] = 725.800
	languageTargets.phonemes ["ZH", "M", "o-", "F1"] = 417.7000
	languageTargets.phonemes ["ZH", "M", "o-", "F2"] = 1455.100
	languageTargets.phonemes ["ZH", "M", "Y:", "F1"] = 386.3000
	languageTargets.phonemes ["ZH", "M", "Y:", "F2"] = 1492.400
	languageTargets.phonemes ["ZH", "M", "a", "F1"] = 788.6000
	languageTargets.phonemes ["ZH", "M", "a", "F2"] = 1290.600
	languageTargets.phonemes ["ZH", "M", "e", "F1"] = 372.3000
	languageTargets.phonemes ["ZH", "M", "e", "F2"] = 1959.700
	languageTargets.phonemes ["ZH", "M", "i", "F1"] = 259.5556
	languageTargets.phonemes ["ZH", "M", "i", "F2"] = 1971.889
	languageTargets.phonemes ["ZH", "M", "o", "F1"] = 426.7000
	languageTargets.phonemes ["ZH", "M", "o", "F2"] = 743.600
	languageTargets.phonemes ["ZH", "M", "u", "F1"] = 287.5000
	languageTargets.phonemes ["ZH", "M", "u", "F2"] = 666.500
	languageTargets.phonemes ["ZH", "M", "y", "F1"] = 268.4000
	languageTargets.phonemes ["ZH", "M", "y", "F2"] = 1581.400
	# Guessed
	languageTargets.phonemes ["ZH", "M", "ə", "F1"] = 417.7000
	languageTargets.phonemes ["ZH", "M", "ə", "F2"] = 1455.100
	
	# Female
	languageTargets.phonemes ["ZH", "F", "i_corner", "F1"] = 285
	languageTargets.phonemes ["ZH", "F", "i_corner", "F2"] = 2100
	languageTargets.phonemes ["ZH", "F", "a_corner", "F1"] = 900
	languageTargets.phonemes ["ZH", "F", "a_corner", "F2"] = 1435
	languageTargets.phonemes ["ZH", "F", "u_corner", "F1"] = 370
	languageTargets.phonemes ["ZH", "F", "u_corner", "F2"] = 650

	# @_center is not fixed but derived from current corners
	languageTargets.phonemes ["ZH", "F", "ə_center", "F1"] =(languageTargets.phonemes ["ZH", "F", "i_corner", "F1"]*languageTargets.phonemes ["ZH", "F", "u_corner", "F1"]*languageTargets.phonemes ["ZH", "F", "a_corner", "F1"])^(1/3)
	languageTargets.phonemes ["ZH", "F", "ə_center", "F2"] = (languageTargets.phonemes ["ZH", "F", "i_corner", "F2"]*languageTargets.phonemes ["ZH", "F", "u_corner", "F2"]*languageTargets.phonemes ["ZH", "F", "a_corner", "F2"])^(1/3)

	# Sides are not fixed but derived from current corners
	languageTargets.phonemes ["ZH", "F", "e_side", "F1"] =(languageTargets.phonemes ["ZH", "F", "i_corner", "F1"]*languageTargets.phonemes ["ZH", "F", "a_corner", "F1"])^(1/2)
	languageTargets.phonemes ["ZH", "F", "e_side", "F2"] =1.1*(languageTargets.phonemes ["ZH", "F", "i_corner", "F2"]^2*languageTargets.phonemes ["ZH", "F", "a_corner", "F2"])^(1/3)

	languageTargets.phonemes ["ZH", "F", "o_side", "F1"] =(languageTargets.phonemes ["ZH", "F", "u_corner", "F1"]*languageTargets.phonemes ["ZH", "F", "a_corner", "F1"])^(1/2)
	languageTargets.phonemes ["ZH", "F", "o_side", "F2"] =(languageTargets.phonemes ["ZH", "F", "a_corner", "F2"]*languageTargets.phonemes ["ZH", "F", "u_corner", "F2"]^2)^(1/3)

	languageTargets.phonemes ["ZH", "F", "y_side", "F1"] = languageTargets.phonemes ["ZH", "F", "i_corner", "F1"]
	languageTargets.phonemes ["ZH", "F", "y_side", "F2"] =(languageTargets.phonemes ["ZH", "F", "i_corner", "F2"]*languageTargets.phonemes ["ZH", "F", "a_corner", "F2"])^(1/2)
	
	
	# Formant values according to 
	# IFA corpus average from FPA isolated vowels
	# Using Split-Levinson algorithm
	languageTargets.phonemes ["ZH", "F", "ɑ", "F1"] = 817.7000
	languageTargets.phonemes ["ZH", "F", "ɑ", "F2"] = 1197.300
	languageTargets.phonemes ["ZH", "F", "æ", "F1"] = 667.9000
	languageTargets.phonemes ["ZH", "F", "æ", "F2"] = 1748.500
	languageTargets.phonemes ["ZH", "F", "ɛ", "F1"] = 667.9000
	languageTargets.phonemes ["ZH", "F", "ɛ", "F2"] = 1748.500
	languageTargets.phonemes ["ZH", "F", "i.", "F1"] = 429.2222
	languageTargets.phonemes ["ZH", "F", "i.", "F2"] = 1937.333
	languageTargets.phonemes ["ZH", "F", "O", "F1"] = 570.8000
	languageTargets.phonemes ["ZH", "F", "O", "F2"] = 882.100
	languageTargets.phonemes ["ZH", "F", "o-", "F1"] = 495.7000
	languageTargets.phonemes ["ZH", "F", "o-", "F2"] = 1635.600
	languageTargets.phonemes ["ZH", "F", "Y:", "F1"] = 431.1000
	languageTargets.phonemes ["ZH", "F", "Y:", "F2"] = 1695.100
	languageTargets.phonemes ["ZH", "F", "a", "F1"] = 853.6000
	languageTargets.phonemes ["ZH", "F", "a", "F2"] = 1435.800
	languageTargets.phonemes ["ZH", "F", "e", "F1"] = 429.9000
	languageTargets.phonemes ["ZH", "F", "e", "F2"] = 1861.700
	languageTargets.phonemes ["ZH", "F", "i", "F1"] = 294.3000
	languageTargets.phonemes ["ZH", "F", "i", "F2"] = 1855.000
	languageTargets.phonemes ["ZH", "F", "o", "F1"] = 527.5000
	languageTargets.phonemes ["ZH", "F", "o", "F2"] = 894.100
	languageTargets.phonemes ["ZH", "F", "u", "F1"] = 376.0000
	languageTargets.phonemes ["ZH", "F", "u", "F2"] = 735.200
	languageTargets.phonemes ["ZH", "F", "y", "F1"] = 321.2000
	languageTargets.phonemes ["ZH", "F", "y", "F2"] = 1741.700
	# Guessed
	languageTargets.phonemes ["ZH", "F", "ə", "F1"] = 500.5
	languageTargets.phonemes ["ZH", "F", "ə", "F2"] = 1706.6

	ipavowelsymbols$ = "ɑɛIOoYaeiouyəæ"

	###################################################################
	# 
	# US English
	# 
	###################################################################
	
	# These should be US English vowel formant values
	#
	# Male
	languageTargets.phonemes ["EN-US", "M", "i_corner", "F1"] = 250
	languageTargets.phonemes ["EN-US", "M", "i_corner", "F2"] = 2200
	languageTargets.phonemes ["EN-US", "M", "a_corner", "F1"] = 800
	languageTargets.phonemes ["EN-US", "M", "a_corner", "F2"] = 1300
	languageTargets.phonemes ["EN-US", "M", "u_corner", "F1"] = 280
	languageTargets.phonemes ["EN-US", "M", "u_corner", "F2"] = 600

	# @_center is not fixed but derived from current corners
	languageTargets.phonemes ["EN-US", "M", "ə_center", "F1"] =(languageTargets.phonemes ["EN-US", "M", "i_corner", "F1"]*languageTargets.phonemes ["EN-US", "M", "u_corner", "F1"]*languageTargets.phonemes ["EN-US", "M", "a_corner", "F1"])^(1/3)
	languageTargets.phonemes ["EN-US", "M", "ə_center", "F2"] = (languageTargets.phonemes ["EN-US", "M", "i_corner", "F2"]*languageTargets.phonemes ["EN-US", "M", "u_corner", "F2"]*languageTargets.phonemes ["EN-US", "M", "a_corner", "F2"])^(1/3)

	# Sides are not fixed but derived from current corners
	languageTargets.phonemes ["EN-US", "M", "e_side", "F1"] =(languageTargets.phonemes ["EN-US", "M", "i_corner", "F1"]*languageTargets.phonemes ["EN-US", "M", "a_corner", "F1"])^(1/2)
	languageTargets.phonemes ["EN-US", "M", "e_side", "F2"] =(languageTargets.phonemes ["EN-US", "M", "i_corner", "F2"]^2*languageTargets.phonemes ["EN-US", "M", "a_corner", "F2"])^(1/3)

	languageTargets.phonemes ["EN-US", "M", "o_side", "F1"] =(languageTargets.phonemes ["EN-US", "M", "u_corner", "F1"]*languageTargets.phonemes ["EN-US", "M", "a_corner", "F1"])^(1/2)
	languageTargets.phonemes ["EN-US", "M", "o_side", "F2"] =(languageTargets.phonemes ["EN-US", "M", "a_corner", "F2"]*languageTargets.phonemes ["EN-US", "M", "u_corner", "F2"]^2)^(1/3)

	languageTargets.phonemes ["EN-US", "M", "y_side", "F1"] = languageTargets.phonemes ["EN-US", "M", "i_corner", "F1"]
	languageTargets.phonemes ["EN-US", "M", "y_side", "F2"] =(languageTargets.phonemes ["EN-US", "M", "i_corner", "F2"]*languageTargets.phonemes ["EN-US", "M", "a_corner", "F2"])^(1/2)
	
	# Formant values according to 
	# IFA corpus averages from FPA isolated vowels
	# Using Split-Levinson algorithm
	languageTargets.phonemes ["EN-US", "M", "ɑ", "F1"] = 695.6000
	languageTargets.phonemes ["EN-US", "M", "ɑ", "F2"] = 1065.500
	languageTargets.phonemes ["EN-US", "M", "æ", "F1"] = 552.5000
	languageTargets.phonemes ["EN-US", "M", "æ", "F2"] = 1659.200
	languageTargets.phonemes ["EN-US", "M", "ɛ", "F1"] = 552.5000
	languageTargets.phonemes ["EN-US", "M", "ɛ", "F2"] = 1659.200
	languageTargets.phonemes ["EN-US", "M", "i.", "F1"] = 378.0909
	languageTargets.phonemes ["EN-US", "M", "i.", "F2"] = 1868.545
	languageTargets.phonemes ["EN-US", "M", "O", "F1"] = 482.9000
	languageTargets.phonemes ["EN-US", "M", "O", "F2"] = 725.800
	languageTargets.phonemes ["EN-US", "M", "o-", "F1"] = 417.7000
	languageTargets.phonemes ["EN-US", "M", "o-", "F2"] = 1455.100
	languageTargets.phonemes ["EN-US", "M", "Y:", "F1"] = 386.3000
	languageTargets.phonemes ["EN-US", "M", "Y:", "F2"] = 1492.400
	languageTargets.phonemes ["EN-US", "M", "a", "F1"] = 788.6000
	languageTargets.phonemes ["EN-US", "M", "a", "F2"] = 1290.600
	languageTargets.phonemes ["EN-US", "M", "e", "F1"] = 372.3000
	languageTargets.phonemes ["EN-US", "M", "e", "F2"] = 1959.700
	languageTargets.phonemes ["EN-US", "M", "i", "F1"] = 259.5556
	languageTargets.phonemes ["EN-US", "M", "i", "F2"] = 1971.889
	languageTargets.phonemes ["EN-US", "M", "o", "F1"] = 426.7000
	languageTargets.phonemes ["EN-US", "M", "o", "F2"] = 743.600
	languageTargets.phonemes ["EN-US", "M", "u", "F1"] = 287.5000
	languageTargets.phonemes ["EN-US", "M", "u", "F2"] = 666.500
	languageTargets.phonemes ["EN-US", "M", "y", "F1"] = 268.4000
	languageTargets.phonemes ["EN-US", "M", "y", "F2"] = 1581.400
	# Guessed
	languageTargets.phonemes ["EN-US", "M", "ə", "F1"] = 417.7000
	languageTargets.phonemes ["EN-US", "M", "ə", "F2"] = 1455.100
	
	# Female
	languageTargets.phonemes ["EN-US", "F", "i_corner", "F1"] = 285
	languageTargets.phonemes ["EN-US", "F", "i_corner", "F2"] = 2100
	languageTargets.phonemes ["EN-US", "F", "a_corner", "F1"] = 900
	languageTargets.phonemes ["EN-US", "F", "a_corner", "F2"] = 1435
	languageTargets.phonemes ["EN-US", "F", "u_corner", "F1"] = 370
	languageTargets.phonemes ["EN-US", "F", "u_corner", "F2"] = 650

	# @_center is not fixed but derived from current corners
	languageTargets.phonemes ["EN-US", "F", "ə_center", "F1"] =(languageTargets.phonemes ["EN-US", "F", "i_corner", "F1"]*languageTargets.phonemes ["EN-US", "F", "u_corner", "F1"]*languageTargets.phonemes ["EN-US", "F", "a_corner", "F1"])^(1/3)
	languageTargets.phonemes ["EN-US", "F", "ə_center", "F2"] = (languageTargets.phonemes ["EN-US", "F", "i_corner", "F2"]*languageTargets.phonemes ["EN-US", "F", "u_corner", "F2"]*languageTargets.phonemes ["EN-US", "F", "a_corner", "F2"])^(1/3)

	# Sides are not fixed but derived from current corners
	languageTargets.phonemes ["EN-US", "F", "e_side", "F1"] =(languageTargets.phonemes ["EN-US", "F", "i_corner", "F1"]*languageTargets.phonemes ["EN-US", "F", "a_corner", "F1"])^(1/2)
	languageTargets.phonemes ["EN-US", "F", "e_side", "F2"] =1.1*(languageTargets.phonemes ["EN-US", "F", "i_corner", "F2"]^2*languageTargets.phonemes ["EN-US", "F", "a_corner", "F2"])^(1/3)

	languageTargets.phonemes ["EN-US", "F", "o_side", "F1"] =(languageTargets.phonemes ["EN-US", "F", "u_corner", "F1"]*languageTargets.phonemes ["EN-US", "F", "a_corner", "F1"])^(1/2)
	languageTargets.phonemes ["EN-US", "F", "o_side", "F2"] =(languageTargets.phonemes ["EN-US", "F", "a_corner", "F2"]*languageTargets.phonemes ["EN-US", "F", "u_corner", "F2"]^2)^(1/3)

	languageTargets.phonemes ["EN-US", "F", "y_side", "F1"] = languageTargets.phonemes ["EN-US", "F", "i_corner", "F1"]
	languageTargets.phonemes ["EN-US", "F", "y_side", "F2"] =(languageTargets.phonemes ["EN-US", "F", "i_corner", "F2"]*languageTargets.phonemes ["EN-US", "F", "a_corner", "F2"])^(1/2)
	
	
	# Formant values according to 
	# IFA corpus average from FPA isolated vowels
	# Using Split-Levinson algorithm
	languageTargets.phonemes ["EN-US", "F", "ɑ", "F1"] = 817.7000
	languageTargets.phonemes ["EN-US", "F", "ɑ", "F2"] = 1197.300
	languageTargets.phonemes ["EN-US", "F", "æ", "F1"] = 667.9000
	languageTargets.phonemes ["EN-US", "F", "æ", "F2"] = 1748.500
	languageTargets.phonemes ["EN-US", "F", "ɛ", "F1"] = 667.9000
	languageTargets.phonemes ["EN-US", "F", "ɛ", "F2"] = 1748.500
	languageTargets.phonemes ["EN-US", "F", "i.", "F1"] = 429.2222
	languageTargets.phonemes ["EN-US", "F", "i.", "F2"] = 1937.333
	languageTargets.phonemes ["EN-US", "F", "O", "F1"] = 570.8000
	languageTargets.phonemes ["EN-US", "F", "O", "F2"] = 882.100
	languageTargets.phonemes ["EN-US", "F", "o-", "F1"] = 495.7000
	languageTargets.phonemes ["EN-US", "F", "o-", "F2"] = 1635.600
	languageTargets.phonemes ["EN-US", "F", "Y:", "F1"] = 431.1000
	languageTargets.phonemes ["EN-US", "F", "Y:", "F2"] = 1695.100
	languageTargets.phonemes ["EN-US", "F", "a", "F1"] = 853.6000
	languageTargets.phonemes ["EN-US", "F", "a", "F2"] = 1435.800
	languageTargets.phonemes ["EN-US", "F", "e", "F1"] = 429.9000
	languageTargets.phonemes ["EN-US", "F", "e", "F2"] = 1861.700
	languageTargets.phonemes ["EN-US", "F", "i", "F1"] = 294.3000
	languageTargets.phonemes ["EN-US", "F", "i", "F2"] = 1855.000
	languageTargets.phonemes ["EN-US", "F", "o", "F1"] = 527.5000
	languageTargets.phonemes ["EN-US", "F", "o", "F2"] = 894.100
	languageTargets.phonemes ["EN-US", "F", "u", "F1"] = 376.0000
	languageTargets.phonemes ["EN-US", "F", "u", "F2"] = 735.200
	languageTargets.phonemes ["EN-US", "F", "y", "F1"] = 321.2000
	languageTargets.phonemes ["EN-US", "F", "y", "F2"] = 1741.700
	# Guessed
	languageTargets.phonemes ["EN-US", "F", "ə", "F1"] = 500.5
	languageTargets.phonemes ["EN-US", "F", "ə", "F2"] = 1706.6

endproc
