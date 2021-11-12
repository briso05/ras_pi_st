#!/bin/bash

clear
echo $(pwd) $0
echo ===============

echo array...

#1. indexed array

declare -a arr
echo $arr

arr[0]=11
arr[1]=22
arr[3]=33

echo "All items:" ${arr[@]}
echo "Size:" ${#arr[@]}

echo ${arr[@]}
echo ${arr[0]}
echo ${arr[1]}
echo ${arr[2]}
echo ${arr[3]}

arr2=(44 55 66)
echo ${arr2[@]}

arr3=([0]=111 [1]=222 [10]=1010)
echo "All items:" ${arr3[@]}
echo "Size:" ${#arr3[@]}

echo ================
#size:10, values:10,20,..,100, array name:sus -> for
declare -a sus

for i in `seq 0 9`
do	
	sus[i]=$(((1+i)*10))
done

echo sus:${sus[@]}
echo size:${#sus[@]}

for idx in ${!sus[@]}
do
	echo $idx ${sus[idx]}
done

echo ================
#kim1, ..., kim10

declare -a kims

for i in `seq 0 9`
do
	#kims[i]="kim$((1+i))"
	kims[i]=kim`expr 1 + $i`
done

echo kims:${kims[@]}
echo size:${#kims[@]}

for items in ${kims[@]}
do
	printf "%s, " $items
done
echo

echo ================
#sh01temp.txt

datas=$(cat sh10temp.txt)
echo $datas
echo "Datas length:"${#datas}

for word in ${datas[@]}
do
	echo $word
done
	






exit 0
