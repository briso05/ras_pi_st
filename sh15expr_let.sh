#!/bin/bash

clear
echo $(pwd) $0
echo ===============

kor=100
eng=90
math=80

total=`expr $kor + $eng + $math`

echo "total:$total"


total=$((kor+eng+math))
echo "total:$total"

#let "total=kor+eng+math"
let total=kor+eng+math
#you can use w/o double quotation

echo "total:$total"


su=10
echo $((++su))
echo $((++su))
echo $((++su))
echo $((++su))
echo $((++su))

su=100
echo $((su++))
echo $((su++))
echo $((su++))
echo $((su++))
echo $((su++))



x=33
y=44
echo $((x+y))

echo $(python3 -c "print($x+$y)")
echo $(python3 -c "print(sum([$x, $y]))")



exit 0
