#!/bin/bash

clear
echo $0
echo ===============

#read input : read
read -p "input score[0~100]:" su

echo $su

if ((su>90)); then
	echo "A"
elif ((su>80)); then
	echo "B"
elif ((su>70)); then
	echo "C"
elif ((su>60)); then
	echo "D"
else
	echo "F"
fi

echo ===============

exit 0
