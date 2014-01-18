#!/bin/bash

dir_katak=${PWD} # assigns to a variable
dir_katak="${dir_katak}/lib/katakana.in"

# for each line in './katakana.in 
for i in `cat $dir_katak`
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
		# sed	: stream edito: basic text transformation on an input stream
		# -e	: add the script to the commands to be executed (causes the next string
		#+ to be interpreted as an editing instruction
		# (''): the quotes protext the RE characters from reinterpretation as special
		#+ characters by the script
		# ';'	: semicolon is a special character in sed, which means 'end of command'
		# 'x'	: exhanges the contents of the hold and pattern spaces
		# 'd'	: delete pattern space. start next cycle.
		# '{'	: culry brackets allow to group several commands so that they are executed
		#+ for the same address range.: grymoire.com/Uni/Sed.html#uh-35
		# '!'	: DO NOT contain
		#'h H': copy/append pattern space to hold space
		# '$'	: match the last line
		# 'd'	: delete pattern space. start next cycle.
		# 'b'	: branch to label; if label is ommited, branch to end of script
		# 'p'	: print the current patter space
		sed -e '1{$p;x;d;}' -e '/^NEW/!{H;$!d;x;s/\n//g;b;}' -e 'x;s/\n//g;${p;x;}' 
	} | {
			# substitue '.' with ' ' found in each input line from pipeline
			sed 's/\./ /g' 
	}
