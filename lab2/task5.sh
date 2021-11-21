#!/bin/bash

echo -n > out5.txt

IFS=$'\n'

last=0
sum=0
count=0
ppid=0
art=0

for line in $(cat out4.txt)
do
	ppid=$(echo $line | cut -d: -f2 | cut -d= -f2)
	art=$(echo $line | cut -d: -f3 | cut -d= -f2)

	if [[ "$last" -ne "$ppid" ]]
	then
		echo "Average_Running_Children_of_ParentID=" $last " is " $(bc<<<"scale=5;$sum/$count") >> out5.txt
		sum=0
		count=0
		last=$ppid
	fi
	sum=$(bc<<<"scale=5;$sum+$art")
	let count=$count+1
	echo $line >> out5.txt
done

echo "Average_Running_Children_ofParentID" $last " is " $(bc<<<"scale=5;$sum/$count") >> out5.txt
