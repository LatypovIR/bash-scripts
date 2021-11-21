#!/bin/bash

echo $$ > .pid

ACC=1
MODE=0

usr1()
{
	MODE=0
}

usr2()
{
	MODE=1
}

term()
{
	MODE=2
}

trap 'usr1' USR1
trap 'usr2' USR2
trap 'term' SIGTERM

while true; do
	case $MODE in
		0)
			let ACC=$ACC+2
			echo $ACC
			;;
		1)
			let ACC=$ACC*2
			echo $ACC
			;;
		2)
			echo "END"
			exit
			;;
	esac
	sleep 1
done
