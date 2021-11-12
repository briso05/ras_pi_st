#!/bin/bash

clear
echo $(pwd) $0
echo ===============

form=$(yad --form --width 300 --title "Form" --field "name" --field "tel" "yangssem" "02") result=$?

if ((result == 0));then
	echo "OK"
	echo $form
	name=$(echo $form | awk 'BEGIN {FS="|"} {print $1}')
	tel=$(echo $form | awk 'BEGIN {FS="|"} {print $2}')
	echo name:$name
	echo tel:$tel
else
	echo "Cancel"
fi






exit 0
