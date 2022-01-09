#!/bin/bash

FILE="report2.log"
ARR=()
I=0

while true
do	
	ARR+=(1 2 3 4 5 6 7 8 9 0)
	let I=I+1
	if [[ $(($I % 100000)) -eq 0 ]]
	then
		echo ${#ARR[@]} >> $FILE
	fi
done
