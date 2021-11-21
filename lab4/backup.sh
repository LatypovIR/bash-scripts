#!/bin/bash

CURTIME=$(date '+%Y-%m-%d')

DIR=$(find ~/ -maxdepth 1 -type d | grep -E 'Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}$' | while read DIR
do
	BACKTIME=$(echo $DIR | awk -F'-' '{print $2"-"$3"-"$4}')
	A=$(date -d $CURTIME +%s)
	B=$(date -d $BACKTIME +%s)
	let DIFFTIME=($A-$B)/604800
	if [[ $DIFFTIME -le "0" ]]
	then
		echo $DIR
	fi
done | tail -n1)

if [[ -z "$DIR" ]]
then
	DIR="$HOME/Backup-$CURTIME"
	mkdir $DIR && (echo "Creating new directory: $DIR. Date is $CURTIME." >> $HOME/backup-report)
fi

find ~/source -maxdepth 1 -type f | while read FILE
do
	TO="$DIR/$(basename "$FILE")"
	if [[ ! -e "$TO" ]]
	then
		cp "$FILE" "$TO" && (echo "Copy file $FILE >> $TO Date $CURTIME." >> $HOME/backup-report)
	else
		S1=$(wc -c "$FILE" | awk '{ print $1 }')
		S2=$(wc -c "$TO" | awk '{ print $1 }')
		
		if [[ $S1 -ne $S2 ]]
		then
			mv "$TO" "$TO.$CURTIME" && (echo "Rename FILE $TO -> $TO.$CURTIME Date $CURTIME." >> $HOME/backup-report)
			cp "$FILE" "$TO" && (echo "Copy file $FILE. Date $CURTIME." >> $HOME/backup-report)
		fi
	fi
done
