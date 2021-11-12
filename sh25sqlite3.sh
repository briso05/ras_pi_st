#!/bin/bash

clear
echo $(pwd) $0
echo ===============

#local database : sqlite3
#sudo apt install -y sqlite3

#to use : sqlite3 [file name]
#to exit : .exit
#to show database infomation : .databases
#to create table : create table if not exists test(num integer primary key autoincrement, name text not null,age integer)
#to drop table : drop table test;
#to see tables : .tables

fn_createTable(){
	echo fn_createTable...
	sqlite3 test.db ".databases"
	sqlite3 test.db "create table if not exists test(num integer primary key autoincrement, name text not null, age integer)"
	sqlite3 test.db ".tables"
	#sqlite3 test.db "drop table test"
	row_count=$(sqlite3 test.db "select count(*) from test")
	echo "row_count(before):" $row_count

	if ((row_count==0));then
		for i in `seq 0 9`
		do
			sqlite3 test.db "insert into test(name, age) values('kim$i', '1$i')"
		done
	fi
	row_count=$(sqlite3 test.db "select count(*) from test")
	echo "row_count(after):" $row_count
} #end fn_createTable()

#fn_createTable

echo ------------------------------------

fn_update(){
	echo --------------------------------
	echo fn_update...
	form=$(yad --form --width 300 --title "Update Form" --text "num : $1" --field "NAME" --field "AGE" "$2" "$3") result=$?
	if ((result == 0));then
		echo $form
		name=$(echo $form | awk 'BEGIN {FS="|"} {print $1}')
		age=$(echo $form | awk 'BEGIN {FS="|"} {print $2}')
		echo name:$name, age:$age

		sqlite3 test.db "update test set name='$name', age='$age' where num='$1'"
	fi

}

#get data

fn_selectAll() {
	echo --------------------------------
	echo fn_selectAll...
	txt_data=$(echo $(sqlite3 test.db "select * from test order by num desc"))
	echo $txt_data #columns are divided by |, rows are divided by space
	#echo ------------------------------------
	#echo ${txt_data[@]} #same as $txt_data
	#echo ------------------------------------
	#echo txt_data size : ${#txt_data} #number of text in txt_data
	#echo txt_data[@] : ${#txt_data[@]} #1
	#echo ------------------------------------
	
	IFS="| " read -ra rows <<< "$txt_data"
	#echo ${rows[@]} #all elements are divided by space
	#echo rows size : ${#rows[@]} #number of row * number of column
	#echo ------------------------------------
	
	selectOne=$(yad --list --width 300 --height 300 --title "List Dialog" --column=NUM --column=NAME --column=AGE "${rows[@]}" --button=OK --button=CANCEL --button=DELETE) result=$?
	echo selectAll event result : $result
	num=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $1}')
	name=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $2}')
	age=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $3}')
	echo num:$num name:$name age:$age

	if ((result == 0));then

		fn_update $num $name $age
		fn_selectAll
	elif ((result == 2)); then
		echo "DELETE"
		alert=$(yad --title "Remove??" --width 300) result=$?
		if ((result==0));then
			echo "DELETE OK"
			echo $num
			sqlite3 test.db "delete from test where num='$num'"	
		fi
		fn_selectAll
	fi
} #end fn_selectAll()

fn_selectAll

#mission >> fn_insert : yad form >> db insert

fn_insert(){
	echo --------------------------------
	echo fn_update...
	form=$(yad --form --width 300 --title "insert Form" --field "NAME" --field "AGE" "lee" "20") result=$?
	if ((result == 0));then
		echo $form
		name=$(echo $form | awk 'BEGIN {FS="|"} {print $1}')
		age=$(echo $form | awk 'BEGIN {FS="|"} {print $2}')
		echo name:$name, age:$age

		sqlite3 test.db "insert into test(name, age) values('$name', '$age')"
	fi

}

#fn_insert

#fn_selectAll




exit 0
