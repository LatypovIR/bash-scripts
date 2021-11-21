#!/bin/bash

read A
while [[ $A != "q" ]]
do
R=$R$A
read A
done
echo $R
