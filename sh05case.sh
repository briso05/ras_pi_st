#!/bin/bash

clear
echo $(pwd) $0
echo ===============

echo "case"
echo "choose a,b,c,d"
echo "1)a"
echo "2)b"
echo "3)c"
echo "4)d"
read result

echo $result

case $result in
	1) echo "aaa";;
	2) echo "bbb";;
	3) echo "ccc";;
	4) echo "ddd";;
esac



exit 0
