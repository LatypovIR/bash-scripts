#!/bin/bash

echo -n > top.log

while true
do
(top -o %MEM -b -n 1 > .top) && (head -n 12 .top >> top.log)
sleep 2s
done
