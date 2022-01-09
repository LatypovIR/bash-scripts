#!/bin/bash

N=$1
K=$2

I=0
while [[ "$I" -ne "$K" ]]
do
    ./newmem.bash "$N" &
    let I=$I+1
    sleep 1s
done
