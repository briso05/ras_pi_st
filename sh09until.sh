#!/bin/bash

clear
echo $(pwd) $0
echo ===============

echo until
#It runs infinite loop when condition is false

key="x"

#until [ $key = "y" ]
until [ $key = "y" ]
do
	echo "end y"
	read key
done





exit 0
