#!/bin/bash
# starts script

clear

# find vertical center
vert_cent=$((`tput lines` / 2))
# find horizontel center
horzl_cent=$((`tput cols` / 2-10))

# change the foreground color of the terminal (cyan)
tput setf 6

# Position the cursor at row $vert_cent, colum horzl_cent and echo 
tput cup $vert_cent $horzl_cent && echo "entering the matrix"
# sleep for one second
sleep 1

tput cup $vert_cent $horzl_cent && echo "                   "
sleep 1
tput cup $vert_cent $horzl_cent && echo "entering the matrix"
sleep 1
tput cup $vert_cent $horzl_cent && echo "                   "
sleep 1

connect_mess="connecting"

# loop 13 times, and each .1 seconds add '.' to $connect_mess variable
for (( i=1; i<=13; i++ ))
do
	tput cup $vert_cent $horzl_cent && echo $connect_mess
	connect_mess="$connect_mess."
	sleep .1
done

# connected message
sleep 1
clear
tput cup $vert_cent $horzl_cent && echo "     CONNECTED     "
sleep 1
clear


# set terminal font color to green
tput setaf 2

#save number of total lines
tot_lines="$(tput lines)"
tot_columns="$(tput cols)"

for (( ; ; )) # infinite loop
do
	# generate a random number between 0 and 3; 
	max1=$((RANDOM%3))
	max=$(($tot_lines-$max1))

	# declare array variables and give; fill them with characters from matrix_char file
	# http://www.thegeekstuff.com/2010/05/bash-variables/
	declare -a char1
	char1=(`./lib/matrix_char.sh`)
	declare -a char2
	declare -a char3
	declare -a char4
	declare -a char5
	declare -a char6
	declare -a char7
	declare -a char8
	declare -a char9
	declare -a char10
	char2=(`./lib/matrix_char.sh`)
	char3=(`./lib/matrix_char.sh`)
	char4=(`./lib/matrix_char.sh`)
	char5=(`./lib/matrix_char.sh`)
	char6=(`./lib/matrix_char.sh`)
	char7=(`./lib/matrix_char.sh`)
	char8=(`./lib/matrix_char.sh`)
	char9=(`./lib/matrix_char.sh`)
	char10=(`./lib/matrix_char.sh`)

	# choose a random number between 0 and total lines of screen
	line=$((RANDOM%$tot_lines))
	line2=$((RANDOM%$tot_lines))
	line3=$((RANDOM%$tot_lines))
	line4=$((RANDOM%$tot_lines))
	line5=$((RANDOM%$tot_lines))
	line6=$((RANDOM%$tot_lines))
	line7=$((RANDOM%$tot_lines))
	line8=$((RANDOM%$tot_lines))
	line9=$((RANDOM%$tot_lines))
	line10=$((RANDOM%$tot_lines))

	#choose a random number between 0 and total columns of screen
	col=$((RANDOM%$tot_columns))
	col2=$((RANDOM%$tot_columns))
	col3=$((RANDOM%$tot_columns))
	col4=$((RANDOM%$tot_columns))
	col5=$((RANDOM%$tot_columns))
	col6=$((RANDOM%$tot_columns))
	col7=$((RANDOM%$tot_columns))
	col8=$((RANDOM%$tot_columns))
	col9=$((RANDOM%$tot_columns))
	col10=$((RANDOM%$tot_columns))

	while [ $line -lt $max ]
	do
		tput cup $line $col
		echo ${char1[${line}]}

		if [ $line2 -lt $max ]
		then
			tput cup $line2 $col2
			# echo from file $char2 line $l
			echo ${char2[${line}]}
		fi

		if [ $line3 -lt $max ]
		then
			tput cup $line3 $col3
			echo ${char3[${line}]}
		fi

		if [ $line4 -lt $max ]
		then
			tput cup $line4 $col4
			echo ${char4[${line}]}
		fi

		if [ $line5 -lt $max ]
		then
			tput cup $line5 $col5
			echo ${char5[${line}]}
		fi

		if [ $line6 -lt $max ]
		then
			tput cup $line6 $col6
			echo ${char6[${line}]}
		fi

		if [ $line7 -lt $max ]
		then
			tput cup $line7 $col7
			echo ${char7[${line}]}
		fi

		if [ $line8 -lt $max ]
		then
			tput cup $line8 $col8
			echo ${char8[${line}]}
		fi

		if [ $line9 -lt $max ]
		then
			tput cup $line9 $col9
			echo ${char9[${line}]}
		fi

		if [ $line10 -lt $max ]
		then
			tput cup $line10 $col10
			echo ${char10[${line}]}
		fi

		line=$(($line+1))
		line2=$(($line2+1))
		line3=$(($line3+1))
		line4=$(($line4+1))
		line5=$(($line5+1))
		line6=$(($line6+1))
		line7=$(($line7+1))
		line8=$(($line8+1))
		line9=$(($line9+1))
		line10=$(($line10+1))

	# end inner while
	done

# end outer for
done


