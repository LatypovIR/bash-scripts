#!/bin/bash

ARR=()

while true
do	
	ARR+=(1 2 3 4 5 6 7 8 9 0)
	if [[ "${#ARR[@]}" -ge "$1" ]]
   	 then
       	 break
   	 fi
done
