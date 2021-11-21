#!/bin/bash

if [[ ! -e "$1" ]]
then
	echo "File not found in this directory."
	exit
fi

if [[ ! -d "$HOME/trash" ]]
then
	mkdir "$HOME/trash"
fi

COUNTER="$HOME/trash/.counter"
FULLWAY="$PWD/$1"

touch $COUNTER
let N=$(cat $COUNTER)+1

echo "$N" > $COUNTER

ln "$FULLWAY" "$HOME/trash/file-$N" && rm "$1" && echo "file-$N" "$FULLWAY" >> "$HOME/.trash.log"




