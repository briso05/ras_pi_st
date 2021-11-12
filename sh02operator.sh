#!/bin/bash

clear
echo $0
echo ===============

su1=10
su2=3

#inside $(()), you can obmit $ infront of variables
echo $(($su1+$su2))
echo $((su1+su2))
echo $((su1-su2))
echo $((su1*su2))
echo $((su1/su2))
echo $((su1%su2))

echo ==============

#10+3 - if you use expr-> you should space bwn variable and operator
expr $su1+$su2


#13
expr $su1 + $su2

#30  - if you divide -> add \ before * operator
expr $su1 \* $su2


echo ==============
#11+22
sum=11+22
echo $sum

#3 ways to use operator and substitue variable
#33
sum=$((11+22))
echo $sum

#33
sum=$(expr 11 + 22)
echo $sum

#33
sum=`expr 11 + 22`
echo $sum

echo ==============
let "sum = 111 + 222"
echo $sum

echo ==============
let "kor = 100"
let "eng = 99"
echo $kor, $eng

let "total = kor + eng"
echo $total

echo ==============
#BIT OPERATOR

#4 (delete under decimal point)
echo $((8>>1))
#16
echo $((8<<1))

echo ==============
#10 : 1010
#12 : 1100

#& 8 : 1000
echo $((10&12))

#| 14 : 1110
echo $((10|12))

#^ 6 : 0110
echo $((10^12))

echo ==============
#combined substitution operator

x=10
x+=100
#10100
echo $x

y=10
y=$((y+100))
#110
echo $y

z=10
let "z+=100"
#110
echo $z

echo ==============
exit 0
