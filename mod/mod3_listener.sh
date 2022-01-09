#!/bin/bash

echo $$ > .pid

usr1()
{
	echo "KILL"
	exit
}

usr2()
{
	echo "QUIT"
	exit
}

term()
{
	echo "TERM"
	exit
}

trap 'usr1' USR1
trap 'usr2' USR2
trap 'term' SIGTERM

while true
do
	A=""
done
