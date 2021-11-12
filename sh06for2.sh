#!/bin/bash

clear
echo $(pwd) $0
echo ===============

echo "for2"

for i in 11 22 33
do
	echo $i
done

echo ==============

for i in `seq 0 9`
do
	printf "%d" $i
done

echo
echo ==============

for i in $(ls)
do
	echo $i
done

echo ==============

for i in "kim" "lee" "han"
do
	echo $i
done

echo ==============
for i in "kim lee han"
do
	echo $i
done


echo ==============
for i in "(11 22 33)"
do
	echo $i
done
	
echo ==============
exit 0
