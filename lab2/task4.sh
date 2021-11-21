#!/bin/bash

#ps -eo pid= | while read pid do 
ps -eo pid= | while read pid
do
	dir=/proc/$pid
	if [ ! -e $dir ]
	then
		continue
	fi
		
	ppid=$(cat /proc/$pid/status | grep -i ppid | awk '{print $NF}')
	runtime=$(cat /proc/$pid/sched | grep -i sum_exec_runtime | awk '{print $NF}')
	switches=$(cat /proc/$pid/sched | grep -i nr_switches | awk '{print $NF}')
	art=$(bc<<<"scale=5;$runtime/$switches")
	echo $pid $ppid $art
done | sort -g -k2 | awk '{print "ProcessID=" $1 " : Parent_ProcessID=" $2 " : Average_Running_Time=" $3}' > out4.txt


