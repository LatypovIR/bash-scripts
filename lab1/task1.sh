#!/bin/bash

MAX=$1
if [[ $2 -ge $MAX ]]
then
MAX=$2
fi
if [[ $3 -ge $MAX ]]
then
MAX=$3
fi
echo $MAX
