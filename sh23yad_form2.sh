#!/bin/bash

clear
echo $(pwd) $0
echo ===============

form=$(yad --form --width 300 --title "Form" --field="Language:CB" --field="Golf:CHK" --field="BaseBall:CHK" --field "name" --field "tel" --field "ls -l:FL" "Java!Android!Linux" TRUE FALSE "yangssem" "02" "$(pwd)") result=$?

if ((result == 0)); then
	echo "OK"
	echo $form
	language=$(echo $form | awk 'BEGIN {FS="|"} {print $1}')
	golf=$(echo $form | awk 'BEGIN {FS="|"} {print $2}')
	baseball=$(echo $form | awk 'BEGIN {FS="|"} {print $3}')
	name=$(echo $form | awk 'BEGIN {FS="|"} {print $4}')
	tel=$(echo $form | awk 'BEGIN {FS="|"} {print $5}')
	filePath=$(echo $form | awk 'BEGIN {FS="|"} {print $6}')
	echo laguage:$language
	echo golf:$golf
	echo baseball:$baseball
	echo name:$name
	echo tel:$tel
	echo filePath:$filePath
fi







exit 0
