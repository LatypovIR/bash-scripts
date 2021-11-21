#!/bin/bash

ps -eo pid= | while read pid
do
	dir=/proc/$pid
	if [ ! -e $dir ]
	then
		continue
	fi

	echo $pid $(cat /proc/$pid/statm | awk '{print $2}')
done | sort -g -k2 | tail -n1 | awk '{print "PID=" $1 " VMEM=" $2}'
