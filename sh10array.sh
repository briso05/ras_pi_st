#!/bin/bash

clear
echo $(pwd) $0
echo ===============

echo array...

#1. indexed array

declare -a arr
echo $arr

arr=(11 22 33)
echo first item: $arr
echo all items: ${arr[@]}
echo all items: ${arr[*]}
echo all index: ${!arr[@]}
echo arr size: ${#arr[@]}

echo ${arr[0]}
echo ${arr[1]}
echo ${arr[2]}

echo ===============
#for i in `seq 0 $((${#arr[@]}-1))`
for i in ${!arr[@]}
do	
	echo arr[$i]:${arr[i]}
done

echo ==============
for item in ${arr[@]}

do
	echo $item
done

echo ==============
for ((i=0;i<${#arr[@]};i++))
do
	echo arr[$i]:${arr[$i]}
done

echo ==============

names=("kim" "lee" "yang")
names=('kim' 'lee' 'yang')
names=(kim lee yang)

echo ${names[@]}
echo ${#names[@]}


echo ==============
for i in ${!names[@]}
do
	echo $i ${names[i]}
done

echo ==============
for name in ${names[@]}
do
	echo $name
done

echo ==============

names2="kim lee yang"

echo ${names2[@]}
echo size:${#names2[@]}

for name in ${names2[@]}
do
	echo ${name}
done

echo ==============

for file_name in $(ls)
do
	echo $file_name
done

echo ==============
#Remove All Array Datas
lst=(44 55 66)
echo ${lst[@]}

unset lst
#lst=()
echo ${lst[@]}

echo ==============

names3=("kim lee yang" "yangssem")

#use double quotation around array -> extract item by ""
for name in "${names3[@]}"
do	
	echo $name
done

echo ==============
strs=("hello kim" "lee" "yang")
for str in "${strs[@]}"
do
	echo $str
done


exit 0
