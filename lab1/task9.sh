#!/bin/bash

#wc *.log -words
for NAME in $(find /var/log -name "*.log")
do
let K=$K+$(wc -l $NAME | awk '{print $1}')
done
echo $K
