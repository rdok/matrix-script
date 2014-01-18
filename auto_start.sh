#!/bin/bash

while [ 1 ];
do
	if [ `xprintidle` -gt 13000 ];
	then
#		pid=`gnome-screensaver-command -q | head -n 1 | awk '{print $4}'`
./enter_matrix.sh
#		if [ "$pid" == "inactive" ];then
#		gnome-screensaver-command -l;
#		else
#			echo "gnome-screensaver was $pid";
#		fi
#	cmatrix -s
#./enter_full_matrix.sh bugged
	fi
	sleep 1
done
