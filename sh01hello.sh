#!/bin/bash

clear
echo $0
echo ===============

printf "aaaaaa\n"
printf "name:%s, age:%d\n" "kim" 33
printf "avg:%.2f\n" 3.145687

#path: pwd
echo path: pwd
echo path: $(pwd)

#./sh01hello 11 22 33
echo $1 $2 $3
echo $1+$2+$3
echo $(($1+$2+$3))


echo ===================
name="kim"
echo name
echo $name

su=100
echo $su

kor=99
eng=88
echo $kor+$eng
echo $(($kor+$eng))

echo ls 
echo $(ls)

arr="aaa bbb ccc"
echo $arr
echo ${arr[@]}
echo ${arr[0]}
#0 : aaa bbb ccc

#0 : aaa
#1 : bbb
arr=("aaa" "bbb" "ccc")
echo ${arr[@]}
echo ${arr[0]}
echo ${arr[1]}
echo ${arr[2]}


echo =================

sus=(11 22 33)
echo ${sus[@]}
echo ${sus[0]}
echo ${sus[1]}
echo ${sus[2]}

exit 0
