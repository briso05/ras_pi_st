#!/bin/bash

clear
echo $(pwd) $0
echo ===============

readonly NAME="yangssem"
name_product="kosta PC"

echo $NAME
echo $name_product


testFn(){
	echo "testFn()...1" $NAME
	echo "testFn()...2" $name_product
	name_product="My pc"
	echo "testFn()...3"
	kor=100
	echo "testFn()...4"
	local eng=99
	# when you declare variable as local, you can't use this variable outside function
	return
	# It means "back to where the function was called"
	echo "testFn()...5"
}

echo before call Fn:$name_product
echo before call Fn:$kor
echo before call Fn:$eng

#call function
testFn

echo after call Fn:$name_product
echo after call Fn:$kor
echo after call Fn:$eng



exit 0
