#!/bin/bash

clear
echo $(pwd) $0
echo ===============
#create testScore function
#call testScore 3
#while -> for :length 3

testScore() {
	read -p "input kor:" kor
	read -p "input eng:" eng
	read -p "input math:" math
			
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

	st=($kor $eng $math $total $avg $grade)
	echo ${st[@]}
}

declare -a list

for i in `seq 0 2`
do
	echo $i
	list[i]=$(testScore) 
done

echo ${#list[@]}
for item in "${list[@]}"
do
	echo $item
done

exit 0
