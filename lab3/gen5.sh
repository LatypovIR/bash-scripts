#!/bin/bash

while true; do
	read LINE
	echo "$LINE" > pipe5
	if [ "$LINE" == "Quit" ]
	then
		exit
	fi
done
