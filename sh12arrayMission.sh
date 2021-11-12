#!/bin/bash

clear
echo $(pwd) $0
echo ===============
#while >> score >> End x
#list=("11 22 33 66 22 F" "77 88 99 264 88 B")

declare -a list

idx=0
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
	#echo total:$total,avg:$avg,grade:$grade
	#st="$kor $eng $math $total $avg $grade"
	#echo $st
	
	st=($kor $eng $math $total $avg $grade)
	echo ${st[@]}
	
	#list[$((idx++))]=$st
	list[$((idx++))]=${st[@]}

	read -p "End input [xX];" txt
	case $txt in
		[xX])break;;
	esac
	echo $txt

done

echo ${list[@]}

for st in "${list[@]}"
do
	echo $st
done


exit 0
