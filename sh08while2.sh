#!/bin/bash

clear
echo $(pwd) $0
echo ===============
#while >> score >> End x

while :
do
	read -p "input kor:" kor
	echo $kor
	
	read -p "input eng:" eng
	echo $eng

	read -p "input math:" math
	echo $math
	
	total=$((kor+eng+math))
	avg=$((total/3))
	grade=""

	if ((avg>90));then
		grade="A"
	elif ((avg>80));then
		grade="B"
	elif ((avg>70));then
		grade="C"
	elif ((avg>60));then
		grade="D"
	else 
		grade="F"
	fi
	echo total:$total,avg:$avg,grade:$grade

	read -p "End input [xX];" txt
	case $txt in
		[xX])break;;
	esac
	echo $txt

done







exit 0
