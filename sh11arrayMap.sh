#!/bin/bash

clear
echo $(pwd) $0
echo ===============
#Associative Array

declare -A assArray
assArray[aa]="kim123456 kkk"
assArray[bb]=lee

#unset assArray
#assArray={}

echo value:${assArray[@]}
echo key:${!assArray[@]}
echo array size:${#assArray[@]}

echo ${assArray[aa]}
echo text length:${#assArray[aa]}


#tetx length : ${#var}
txt="Hello world"
echo ${#txt}



exit 0
