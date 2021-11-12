#!/bin/bash

clear
echo $(pwd) $0
echo ===============

echo "input 1 or 2"

select yn in "Yes" "No"
do
	case $yn in 
		Yes) echo "removed";;
		No) echo "Cancled";;
	esac
	exit
done







exit 0
