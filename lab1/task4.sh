#!/bin/bash

if [[ $HOME == $PWD ]]
then
echo $HOME
else
echo "FATAL ERROR!"
exit 1
fi
