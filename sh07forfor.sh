#!/bin/bash

clear
echo $(pwd) $0
echo ===============


#GUGUDAN

for i in `seq 2 9`
do
	for j in `seq 1 9`
	do
		printf "%d*%d=%-2d," $i $j `expr $i \* $j`
	done
	echo
done






exit 0
