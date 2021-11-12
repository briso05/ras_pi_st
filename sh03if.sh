#!/bin/bash

clear
echo $0
echo ===============

su1=10
su2=90

# true: 1, false: 0
echo $((su1==su2))



if ((su1<su2));then 
	echo aaaa
fi

echo ===============
#>: -gt, <: -lt, >= : -ge, <=: le, ==:eq
if [ "$su1" -lt  "$su2" ] ; then
	echo bbbb
fi

echo ===============

if ((su1==su2)); then
	echo cccc
else
	echo dddd
fi


echo ===============
if ((su1==8)); then
	echo $((su1*8))
elif ((su1==10)); then
	echo $((su1*10))
else
	echo 1000
fi

echo ===============
if ((su1==10)); then
	echo ten
	if ((su2==100)); then
		echo good
	else 
		echo not good
	fi
elif ((su1==8)); then
	echo eight
else
	echo bad
fi
echo ===============
exit 0
