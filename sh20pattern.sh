#!/bin/bash

clear
echo $(pwd) $0
echo ===============

read -p "input date [ex:2021-11-10]:" date

echo "Date:"$date

pat_date="^[0-9]{4}-[0-9]{2}-[0-9]{2}$"

#[[  =~  ]]

if [[ $date =~ $pat_date ]];then
	echo "Good"
else
	echo "Bad"		
fi

echo ===========
#010-0000-0000 Good, Bad

read -p "input tel [ex:010-0000-0000]:" tel

echo "Tel:"$tel

pat_tel="^010-[0-9]{4}-[0-9]{4}$"

if [[ $tel =~ $pat_tel ]];then
	echo "Good"
else
	echo "Bad"
fi

exit 0
