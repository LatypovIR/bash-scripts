#!/bin/bash

echo -n "Users in system: "
cat /etc/passwd | wc -l

cat /etc/passwd | awk -F: '{print $1}' | sort | while read US
do
	echo -n $US " : process count is "
	ps -eo user= | grep $US | wc -l
done
