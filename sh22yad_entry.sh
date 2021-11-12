#!/bin/bash

clear
echo $(pwd) $0
echo ===============


languageFn(){
	language=$(yad --entry --title "Entry" --width 300 --text "Languege??:") result=$?

	echo $result

	if (( result == 0 )); then
		echo "OK"
		echo $language 
		case $language in
			linux|Linux|LINUX) echo "Linux....";;
			java|Java|JAVA) echo "Java....";;
			HTML|html|Html) echo "Html....";;
		esac
	else
		echo "Cancel"
	fi
}

#languageFn

#create score function : scoreFn
scoreFn() {
	score=$(yad --entry --title "Score" --width 300 --text "Input score $1 [0-100]:") result=$?
	if (( result == 0 ));then
		echo $score
	else
		echo "Cancel"
	fi
}

subjects=(kor eng math)
total=0
for subject in ${subjects[@]}
do
	score=$(scoreFn $subject)
	let total+=score
	echo $subject score:$score
done
echo total:$total
echo avg:$((total/3))

exit 0
