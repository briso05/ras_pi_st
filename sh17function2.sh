#!/bin/bash

clear
echo $(pwd) $0
echo ===============


#testFn define call

testFn() {
	echo "testFn()...."
	echo $1
	echo $2
	echo $3
}

testFn 11 22 33

result=$(testFn 44 55 66)
echo $result


echo ===============

testSum(){
	echo $(($1+$2+$3))
}

result=$(testSum 11 22 33)
echo testSum result : $result

echo ===============

testSum2(){
	sum=0
	for i in `seq 1 $#`
	do
		let sum+=$1
		shift
	done
	echo $sum
}

result=$(testSum2 11 11 33 33)

echo testSum2 result : $result

echo ======================

testSum3(){
	local sum=0
	until (($#==0))
	do
		sum=$((sum+$1))
		shift
	done
	echo $sum
}

result=$(testSum3 11 22 33 44)
echo $result

exit 0
