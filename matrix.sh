#!/bin/bash

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

for i in $(seq 1 200) ;
do
	max1=$((RANDOM%3))
	max=$(($tot_lines-$max1))

	# declare variables and give them attrbutes. -a: each name is an indexed array variable
	declare -a char1
	char1=(`~/matrix/matrix_char.sh`)
	declare -a char2
	declare -a char3
	declare -a char4
	declare -a char5
	declare -a char6
	declare -a char7
	declare -a char8
	declare -a char9
	declare -a char10
	char2=$char1
	char3=$char2
	char4=$char3
	char5=$char4
	char6=$char5
	char7=$char6
	char8=$char7
	char9=$char8
	char10=$char9

l=$((RANDOM%$tot_lines))
l2=$((RANDOM%$tot_lines))
l3=$((RANDOM%$tot_lines))
l4=$((RANDOM%$tot_lines))
l5=$((RANDOM%$tot_lines))
l6=$((RANDOM%$tot_lines))
l7=$((RANDOM%$tot_lines))
l8=$((RANDOM%$tot_lines))
l9=$((RANDOM%$tot_lines))
l10=$((RANDOM%$tot_lines))
c=$((RANDOM%$tot_columns))
c2=$((RANDOM%$tot_columns))
c3=$((RANDOM%$tot_columns))
c4=$((RANDOM%$tot_columns))
c5=$((RANDOM%$tot_columns))
c6=$((RANDOM%$tot_columns))
c7=$((RANDOM%$tot_columns))
c8=$((RANDOM%$tot_columns))
c9=$((RANDOM%$tot_columns))
c10=$((RANDOM%$tot_columns))

while [ $l -lt $max ] ; do
tput cup $l $c
echo ${char1[${l}]}
if [ $l2 -lt $max ] ; then
tput cup $l2 $c2
echo ${char2[${l}]}
fi
if [ $l3 -lt $max ] ; then
tput cup $l3 $c3
echo ${char3[${l}]}
fi
if [ $l4 -lt $max ] ; then
tput cup $l4 $c4
echo ${char4[${l}]}
fi
if [ $l5 -lt $max ] ; then
tput cup $l5 $c5
echo ${char5[${l}]}
fi
if [ $l6 -lt $max ] ; then
tput cup $l6 $c6
echo ${char6[${l}]}
fi
if [ $l7 -lt $max ] ; then
tput cup $l7 $c7
echo ${char7[${l}]}
fi
if [ $l8 -lt $max ] ; then
tput cup $l8 $c8
echo ${char8[${l}]}
fi
if [ $l9 -lt $max ] ; then
tput cup $l9 $c9
echo ${char9[${l}]}
fi
if [ $l10 -lt $max ] ; then
tput cup $l10 $c10
echo ${char10[${l}]}
fi


l=$(($l+1))
l2=$(($l2+1))
l3=$(($l3+1))
l4=$(($l4+1))
l5=$(($l5+1))
l6=$(($l6+1))
l7=$(($l7+1))
l8=$(($l8+1))
l9=$(($l9+1))
l10=$(($l10+1))
done
done


