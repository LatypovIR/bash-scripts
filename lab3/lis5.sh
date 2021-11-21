#!/bin/bash

echo "Start"
MOD=0
ACC=1
(tail -f pipe5) |
	while true; do
		read LINE
		case "$LINE" in
			"Quit")
				echo "exit"
				killall tail
				exit
				;;
			"+")
				echo "mod +"
				MOD=0
				;;
			"*")
				echo "mod *"
				MOD=1
				;;
			*)
				if [[ $LINE =~ [0-9]+ ]]
				then
					if [[ $MOD == 0 ]]
					then
						let ACC=$ACC+$LINE
					else
						let ACC=$ACC*$LINE
					fi
					echo $ACC
				else
				echo "Invalid input"
				fi
				;;
		esac
	done

