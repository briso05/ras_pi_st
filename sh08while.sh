#!/bin/bash

clear
echo $(pwd) $0
echo ===============

echo while
# Infinite loop condition
#while true
#while ((10==10))
#while [ 5 == 5 ]
#while :

su=0

while ((su<10))
do
	echo $((su++))
done
echo ===============

su=0

while ((su<10))
do
	echo $((su++))
	#break
	if ((su==5));then
		break
	fi
done
echo ===============

su=0

while ((su<10))
do
	echo $((su++))
	if ((su==5));then
		continue
	fi
	echo aaa $su
done
echo ===============

while :
do 
	read -p "End input [xX]:" txt
	case $txt in 
		[xX])break;;
	esac	
	echo $txt

done

exit 0
