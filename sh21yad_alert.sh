#!/bin/bash

clear
echo $(pwd) $0
echo ===============

#Install Library : Yet Another Dialog(YAD) - support gui
#sudo apt install -y yad

#alert=$(yad) result=$?
alert=$(yad --width 300 --title "Remove?") result=$?
echo $result

touch test.txt
ls
if ((result == 0)); then
	echo "OK"
	rm test.txt
	ls
else
	echo "Cancel"
fi

alert=$(yad --width 300 --title "Remove?" --button="send") result=$?
echo $result



exit 0
