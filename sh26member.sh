#!/bin/bash

clear
echo $(pwd) $0
echo ===============

#using db : sqlite3
#db name : member.db
#table name : member
#columns : num(pk, seq), id, pw, name, tel
#GUI : yad-insert, update, delete, selectAll

fn_createTable() {
	echo fn_createTable...
	sqlite3 member.db ".databases"
	#sqlite3 member.db "drop table member"
	sqlite3 member.db "create table if not exists member(num integer primary key autoincrement, id text not null, pw text not null, name text not null, tel text)"
	sqlite3 member.db ".tables"

	row_count=$(sqlite3 member.db "select count(*) from member")
	echo "row_count(before):" $row_count

	if ((row_count==0));then
		for i in `seq 1 9`
		do
			sqlite3 member.db "insert into member(id, pw, name, tel) values('user00$i', 'hi00$i', 'kim00$i', '010-$i$i$i$i-0000')"
		done
	fi

	row_count=$(sqlite3 member.db "select count(*) from member")
	echo "row_count(after):" $row_count
} #end fn_createTable()

fn_createTable

#--------------------------------------------------------------
fn_insert(){
	echo fn_insert...
	form=$(yad --form --width 400 --title "Insert Member" --field "ID" --field "PW" --field "NAME" --field "TEL" "user010" "hi010" "kim010" "010-0000-0001") result=$?
	echo insert result : $result
	if ((result == 0));then
		echo "OK"
		id=$(echo $form | awk 'BEGIN {FS="|"} {print $1}')
		pw=$(echo $form | awk 'BEGIN {FS="|"} {print $2}')
		name=$(echo $form | awk 'BEGIN {FS="|"} {print $3}')
		tel=$(echo $form | awk 'BEGIN {FS="|"} {print $4}')
		echo $id $pw $name $tel
		sqlite3 member.db "insert into member(id, pw, name, tel) values('$id', '$pw', '$name', '$tel')"
	fi
}
#--------------------------------------------------------------
fn_update(){
	echo fn_update...
	form=$(yad --form --width 400 --title "Update Member" --text "NUM : $1" --field "ID" --field "PW" --field "NAME" --field "TEL" "$2" "$3" "$4" "$5") result=$?
	if ((result == 0));then
		echo $form
		id=$(echo $form | awk 'BEGIN {FS="|"} {print $1}')
		pw=$(echo $form | awk 'BEGIN {FS="|"} {print $2}')
		name=$(echo $form | awk 'BEGIN {FS="|"} {print $3}')
		tel=$(echo $form | awk 'BEGIN {FS="|"} {print $4}')
		echo $1 $id $pw $name $tel
		sqlite3 member.db "update member set id='$id', pw='$pw', name='$name', tel='$tel' where num='$1'"
	fi
}
#--------------------------------------------------------------
fn_selectAll(){
	echo fn_selectAll...
	txt_data=$(echo $(sqlite3 member.db "select * from member order by num desc"))
	echo $txt_data

	IFS="| " read -ra rows <<< "$txt_data"
	echo ${rows[@]}
	echo rows size: ${#rows[@]}

	echo -----------------------------------

	selectOne=$(yad --list --width 400 --height 400 --title "Member List" --column=NUM --column=ID --column=PW --column=NAME --column=TEL "${rows[@]}" --button="INSERT:1" --button="UPDATE:0" --button="DELETE:2" --button="EXIT:3") result=$?
	echo selectAll result : $result
	
	num=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $1}')
	id=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $2}')
	pw=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $3}')
	name=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $4}')
	tel=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $5}')
	echo $num $id $pw $name $tel

	if ((result == 1));then
		echo "INSERT"
		fn_insert
		fn_selectAll

	elif ((result == 0));then
		echo "UPDATE"
		fn_update $num $id $pw $name $tel
		fn_selectAll
	
	elif ((result == 2));then
		echo "DELETE"
		alert=$(yad --title "Remove??" --text "Are you really going to remove it?" --width 400) result=$?
		if ((result == 0));then
			echo "DELETE OK"
			sqlite3 member.db "delete from member where num='$num'"
		fi
		fn_selectAll

	fi
}

fn_selectAll

exit 0
