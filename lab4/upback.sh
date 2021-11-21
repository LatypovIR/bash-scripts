#!/bin/bash

DIR=$(find ~/ -maxdepth 1 -type d | grep -E 'Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}$' | sort | tail -n1)

if [[ -z "$DIR" ]]
then
	echo "Not found Backup directory."
	exit
fi

if [[ ! -d "$HOME/restore" ]]
then
	mkdir "$HOME/restore" && echo "Create dir $HOME/restore" || (echo "Can't create $HOME/restore" ; exit)
fi

find "$DIR" -maxdepth 1 -type f | grep -vE '.[0-9]{4}-[0-9]{2}-[0-9]{2}$' | while read FILE
do
	TO="$HOME/restore/$(basename "$FILE")"
	cp "$FILE" "$TO" && echo "Restore file $FILE >>> $TO"
done
