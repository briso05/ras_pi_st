#!/bin/bash

clear
echo $(pwd) $0
echo ===============
#create testScore function
#call testScore 3
#while -> for :length 3

testScore() {
	declare -a list

	for ((i=0;i<3;i++))
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
	
		st=($kor $eng $math $total $avg $grade)
		echo ${st[@]}
	
		list[i]=${st[@]}
	
	done

	echo 
	for st in "${list[@]}"
	do
		echo $st	
	done
}

testScore 3

exit 0
