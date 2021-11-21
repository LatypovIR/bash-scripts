#!/bin/bash

IFS=$'\n'
for LINE in $(cat $HOME/.trash.log | grep "/$1$") 
do
	IFS=$' '
	read LINK FILE <<< "$LINE"
	echo "$FILE"
	S=""
	while [ -z $S ] 
	do
		read -p "Untrash this file? [Y/N]: " S
		if [[ "$S" != [YyNn]* ]] 
		then
			S=""
		fi
	done
	if [[ "$S" == [Yy]* ]]
	then
		if [[ ! -d "$(dirname "$FILE")" ]]
		then
			echo "Directory not found, saving file in $HOME"
			FILE="$HOME/$1"
		fi
		
		if [[ -e "$FILE" ]]
		then
			echo "File already had in this directory, enter new name"
			read -r NAME
		else
			NAME="$1"
		fi
		echo "$LINK" "$(dirname "$FILE")/$NAME"
		IFS=$'\n'	
		ln "$HOME/trash/$LINK" "$(dirname "$FILE")/$NAME" && rm "$HOME/trash/$LINK" && sed -i "/^$LINK /d" "$HOME/.trash.log"
	fi
done

