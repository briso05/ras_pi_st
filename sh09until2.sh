#!/bin/bash

clear
echo $(pwd) $0
echo ===============

echo until

echo "argument size:" $#

#echo $1
#remove first arguement
#shift
#echo $1
#shift
#echo $1

sum=0
until [ $# = 0 ]
do
	echo $1
	#let "sum+=$1"
	sum=$((sum+$1))
	shift
	echo size:$#
done
echo sum:$sum






exit 0
