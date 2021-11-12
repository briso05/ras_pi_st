#!/bin/bash

clear
echo $0
echo ===============

#mission ; kor, eng, math, total, avg, grade
#input kor, input eng, input math
#total, avg, grade echo

read -p "input kor score[0-100]:" kor
echo kor: $kor

read -p "input eng score[0-100]:" eng
echo eng: $eng

read -p "input math score[0-100]:" math
echo math: $math

total=$((kor+eng+math))
avg=$((total/3))
grade=""

if (( $avg > 90 )); then
	grade="A"
elif (( $avg > 80 )); then
	grade="B"
elif (( $avg > 70 )); then
	grade="C"
elif (( $avg > 60 )); then
	grade="D"
else
	grade="F"
fi

echo "total:$total, avg:$avg, grade:$grade"




exit 0
