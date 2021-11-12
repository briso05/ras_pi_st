#!/bin/bash

clear
echo $(pwd) $0
echo ===============

declare -a score
score=(yangssem 90 80 70)
score+=(kim 99 88 77)
score+=(lee 66 87 95)
score+=(park 99 98 99)
score+=(myung 40 55 65)
score+=(beak 88 85 89)

selectOne=$(yad --list --width 300 --height 500 --title "List Dialog" --column=NAME --column=KOR --column=ENG --column=MATH "${score[@]}") result=$?


if ((result == 0));then
	echo "OK"
	echo $selectOne
	name=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $1}')
	kor=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $2}')
	eng=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $3}')
	math=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $4}')
	echo name:$name
	echo kor:$kor
	echo eng:$eng
	echo math:$math
fi







exit 0
