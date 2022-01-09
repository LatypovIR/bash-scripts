#!/bin/bash

A=$(cat $1/* 2>/dev/null | tr -cs "[:alpha:]" "\n" | tr [:upper:] [:lower:] | grep -E "." | sort | uniq | wc -l)
B=$(cat $2/* 2>/dev/null | tr -cs "[:alpha:]" "\n" | tr [:upper:] [:lower:] | grep -E "." | sort | uniq | wc -l)

if [[ "$A" -gt "$B" ]]
then
	echo $1
else
	echo $2
fi

