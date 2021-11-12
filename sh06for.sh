#!/bin/bash

clear
echo $(pwd) $0
echo ===============

echo "for"

for((i=0;i<10;i++))
do
	#echo $i
	printf "%d" $i
done

echo
echo ==============


for((i=0;i<10;i++))
do
	if ((i%2 == 0));then
		echo $i
	fi
done






exit 0
