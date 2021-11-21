#!/bin/bash

list=$(ps -u $USER -eo pid=,command=)

echo "$list" | wc -l > out1.txt
echo "$list" | awk '{printf $1 ":"; $1=""; print $0}' >> out1.txt
