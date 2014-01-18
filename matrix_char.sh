#!/bin/bash

# for each line in '~/matrix/katakana.in 
for i in `cat ~/matrix/katakana.in`
	# echo a random character with index from 0 to 
	do echo "$RANDOM .$i "
done |
	{
		# sort, -r: reverse; n: numeric sorting instead to alphabetic
		sort -rn
	} | {
		# awk: a programming lagnuage designed to process text-based data
		# prints the second file from the pipepline
		awk '{print $2}' 
	} | {
		# sed: stream edito: basic text transformation on an input stream
		# -e: add the script to the commands to be executed (causes the next string
		#+ to be interpreted as an editing instruction
		# the quotes ('') protext the RE characters from reinterpretation as special
		#+ characters by the script
		# semicolon ';' is a speical character in sed, which means 'end of command'
		sed -e '1{$p;x;d;}' -e '/^NEW/!{H;$!d;x;s/\n//g;b;}' -e 'x;s/\n//g;${p;x;}' 
	} | {
			# substitue '.' with ' ' found in each input line from pipeline
			sed 's/\./ /g' 
	}
