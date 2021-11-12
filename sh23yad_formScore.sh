#!/bin/bash

clear
echo $(pwd) $0
echo ===============

#name, kor, eng, math
#total,avg,grade echo

form=$(yad --form --width 300 --title "Score" --field "name" --field "kor" --field "eng" --field "math" "kim" "99" "88" "77") result=$?

if ((result == 0)); then
	echo "OK"
	echo $form
	name=$(echo $form | awk 'BEGIN {FS="|"} {print $1}')
	kor=$(echo $form | awk 'BEGIN {FS="|"} {print $2}')
	eng=$(echo $form | awk 'BEGIN {FS="|"} {print $3}')
	math=$(echo $form | awk 'BEGIN {FS="|"} {print $4}')
	total=$((kor+eng+math))
	avg=$((total/3))
	if ((avg >= 90)); then
		grade="A"
	elif ((avg >= 80)); then
		grade="B"
	elif ((avg >= 70)); then
		grade="C"
	elif ((avg >= 60)); then
		grade="D"
	else
		grade="F"
	fi
	echo name:$name
	echo kor:$kor, eng:$eng, math:$math
	echo total:$total, avg:$avg, grade:$grade
fi







exit 0
