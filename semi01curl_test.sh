#!/bin/bash

clear
echo $(pwd) $0
echo ==================
#curl http://[ipaddress]/semi/bean/list/name | jq '.'
#curl http://[ipaddress]/semi/loginOK -d member_type=user -d id=user1 -d pw=1111 -d status=null

fn_show_menu() {	
	menu=$(yad --geometry=500x100+300+200 --title "Menu" --text="Please click the menu you want to manage" --text-align=center  --button="Manage User:1" --button="Manage Seller:2" --button="Logout:3") result=$?
	if [[ $result -eq 1 ]]; then
		fn_user_selectAll
	elif [[ $result -eq 2 ]]; then
		echo seller
		fn_seller_selectAll
	elif [[ $result -eq 3 ]]; then
		echo logout

		alert_out=$(yad --geometry=200+350+250 --title="Alert" --text="Signed out successfully." --text-align=center --button="OK:1")
		fn_login
	fi
}

fn_user_selectAll() {
	echo --------------
	echo fn_user_selectAll.....
	len=$(curl http://[ip]/semi/user/selectAll | jq 'length')
	sub=`expr $len - 1`
	echo $sub
	
	rows=()
	
	for i in `seq 0 $sub`
	do
		echo $i
		row=$(curl http://[ip]/semi/user/selectAll | jq '.['$i'] | .user_num, .id, .pw, .name, .email, .reg_date, .status'|sed 's/\"//g')
		echo $row
		rows+=($row)
	done

	echo ${rows[@]}
	selectOne=$(yad --list --geometry=600x400+300+200 --title "User List" --column=num --column=id --column=pw --column=name --column=email --column=reg_date --column=status "${rows[@]}" --button="Status Update:0" --button="Back to Menu:1") result=$?

	echo selectAll event result: $result

	num=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $1}')
	id=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $2}')
	pw=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $3}')
	name=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $4}')
	email=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $5}')
	reg_date=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $6}')
	status=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $7}')

	echo $num, $id, $pw, $name, $email, $reg_date, $status
	if (( $result == 0 ));then
		fn_user_update $num $id $pw $name $email $reg_date $status
	elif (( $result == 1 ));then
		echo "back to menu"
		fn_show_menu
	fi
}


fn_user_update(){
	echo fn_user_update...
	
	form=""
	result=""
	
	if [[ "$7" == "deactive" ]];then
		form=$(yad --form --geometry=400+300+200 --title "Update User" --field="NUM:RO" --field="ID:RO" --field="PW:RO" --field="NAME:RO" --field="EMAIL:RO" --field="REG_DATE:RO" --field="STATUS:CB" "$1" "$2" "$3" "$4" "$5" "$6" "$7") result=$?

	else
		form=$(yad --form --geometry=400+300+200 --title "Update User" --field="NUM:RO" --field="ID:RO" --field="PW:RO" --field="NAME:RO" --field="EMAIL:RO" --field="REG_DATE:RO" --field="STATUS:CB" "$1" "$2" "$3" "$4" "$5" "$6" "$7\!DA\!tempDA\!active") result=$?
	fi
	
	
	echo update event result: $result
	if ((result == 0));then
		echo $form

		num=$(echo $form | awk 'BEGIN {FS="|"} {print $1}')
		id=$(echo $form | awk 'BEGIN {FS="|"} {print $2}')
		pw=$(echo $form | awk 'BEGIN {FS="|"} {print $3}')
		name=$(echo $form | awk 'BEGIN {FS="|"} {print $4}')
		email=$(echo $form | awk 'BEGIN {FS="|"} {print $5}')
		reg_date=$(echo $form | awk 'BEGIN {FS="|"} {print $6}')
		stat=$(echo $form | awk 'BEGIN {FS="|"} {print $7}')
	
		if [[ "$stat" == "$7" ]];then
			echo same
		elif [[ "$stat" == "DA" ]];then
			echo DA
			result=$(curl http://[ip]/semi/user/status/da -d user_num=$num)
			alert_suc1=$(yad --geometry=200+350+250 --title="Alert" --text="Updated successfully." --text-align=center --button="OK:1")
		elif [[ "$stat" == "tempDA" ]];then

			echo tempDA
			
			result=$(curl http://[ip]/semi/user/status/tmpda -d user_num=$num -d status=tmpDA)
			alert_suc2=$(yad --geometry=200+350+250 --title="Alert" --text="Updated successfully." --text-align=center --button="OK:1")
		elif [[ "$stat" == "active" ]];then
			echo active

			result=$(curl http://[ip]/semi/user/status/active -d user_num=$num)
			alert_suc3=$(yad --geometry=200+350+250 --title="Alert" --text="Updated successfully." --text-align=center --button="OK:1")
		fi

		echo $result
	fi
	fn_user_selectAll
}


fn_beans_selectAll() {
	echo --------------
	echo fn_bean_selectAll.....
	len=$(curl http://[ip]/semi/bean/list/$1 | jq 'length')
	sub=`expr $len - 1`
	echo $sub
	
	rows=()
	
	for i in `seq 0 $sub`
	do
		echo $i
		row=$(curl http://[ip]/semi/bean/list/$1 | jq '.['$i'] | .product_num, .product_name, .price, .count, .score, .status'|sed 's/\"//g')
		echo $row
		rows+=($row)
	done

	echo ${rows[@]}
	selectOne=$(yad --list --geometry=600x400+300+200 --title "Bean List" --column=num --column=name --column=price --column=count --column=score --column=status "${rows[@]}" --button="Status Update:0" --button="Back to Seller List:1") result=$?

	echo selectAll event result: $result

	num=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $1}')
	name=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $2}')
	price=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $3}')
	count=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $4}')
	score=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $5}')
	status=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $6}')

	echo $num, $name, $price, $count, $score, $status
	if (( $result == 0 ));then
		if [[ "$2" = "tmpDA" ]];then
			echo "alert warning"
			alert_warn1=$(yad --geometry=300+350+250 --title="Warning" --text="If you want to update status, please activate this seller" --button="OK:0")
			fn_beans_selectAll $1
		elif [[ "$2" = "deactive" ]];then
			echo "alert warning"
			alert_warn2=$(yad --geometry=300+350+250 --title="Warning" --text="Deactivated Seller: \nYou can't update status of beans of this seller" --button="OK:0")
			fn_beans_selectAll $1
		else
			echo "update"
			fn_beans_update $num $name $price $count $score $status $1 $2
		fi
	elif (( $result == 1 ));then
		echo "back to seller list"
		fn_seller_selectAll
	fi
}

fn_beans_update(){
	echo fn_beans_update...

	form=""
	result=""
	
	if [[ "$6" == "deactive" ]];then
		form=$(yad --form --geometry=400+300+200 --title "Update Bean" --field="NUM:RO" --field="NAME:RO" --field="PRICE:RO"  --field="COUNT:RO" --field="SCORE:RO" --field="STATUS:CB" "$1" "$2" "$3" "$4" "$5" "$6") result=$?
	else
		form=$(yad --form --geometry=400+300+200 --title "Update Bean" --field="NUM:RO" --field="NAME:RO" --field="PRICE:RO"  --field="COUNT:RO" --field="SCORE:RO" --field="STATUS:CB" "$1" "$2" "$3" "$4" "$5" "$6\!DA\!tempDA\!active") result=$?
	fi

	echo update event result: $result
	if ((result == 0));then
		echo $form

		num=$(echo $form | awk 'BEGIN {FS="|"} {print $1}')
		name=$(echo $form | awk 'BEGIN {FS="|"} {print $2}')
		price=$(echo $form | awk 'BEGIN {FS="|"} {print $3}')
		count=$(echo $form | awk 'BEGIN {FS="|"} {print $4}')
		score=$(echo $form | awk 'BEGIN {FS="|"} {print $5}')
		stat=$(echo $form | awk 'BEGIN {FS="|"} {print $6}')
		
			
		if [[ "$stat" == "$6" ]];then
			echo same
		elif [[ "$stat" == "DA" ]];then
			echo DA
			result=$(curl http://[ip]/semi/bean/status/da -d product_num=$num)
			alert_suc1=$(yad --geometry=200+350+250 --title="Alert" --text="Updated successfully." --text-align=center --button="OK:1")
		elif [[ "$stat" == "tempDA" ]];then

			echo tempDA
			
			result=$(curl http://[ip]/semi/bean/status/tmpda -d product_num=$num -d status=tmpDA)
			alert_suc2=$(yad --geometry=200+350+250 --title="Alert" --text="Updated successfully." --text-align=center --button="OK:1")
		elif [[ "$stat" == "active" ]];then
			echo active

			result=$(curl http://[ip]/semi/bean/status/active -d product_num=$num)
			alert_suc3=$(yad --geometry=200+350+250 --title="Alert" --text="Updated successfully." --text-align=center --button="OK:1")
		fi

		echo $result
	fi
	fn_beans_selectAll $7 $8
}

fn_seller_selectAll() {
	echo --------------
	echo fn_seller_selectAll.....
	len=$(curl http://[ip]/semi/seller/selectAll | jq 'length')
	sub=`expr $len - 1`
	echo $sub
	
	rows=()
	
	for i in `seq 0 $sub`
	do
		echo $i
		row=$(curl http://[ip]/semi/seller/selectAll | jq '.['$i'] | .seller_num, .id, .pw, .email, .reg_date, .status'|sed 's/\"//g')
		echo $row
		rows+=($row)
	done

	echo ${rows[@]}
	selectOne=$(yad --list --geometry=600x400+300+200 --title "Seller List" --column=num --column=id --column=pw --column=email --column=reg_date --column=status "${rows[@]}" --button="Status Update:0" --button="Manage Beans:2" --button="Back to Menu:1") result=$?

	echo selectAll event result: $result

	num=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $1}')
	id=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $2}')
	pw=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $3}')
	email=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $4}')
	reg_date=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $5}')
	status=$(echo $selectOne | awk 'BEGIN {FS="|"} {print $6}')

	echo $num, $id, $pw, $email, $reg_date, $status
	if (( $result == 0 ));then
		fn_seller_update $num $id $pw $email $reg_date $status
	elif (( $result == 1 ));then
		echo "back to menu"
		fn_show_menu
	elif (( $result == 2 )); then
		echo "manage beans"
		fn_beans_selectAll $num $status

	fi
}

fn_seller_update(){
	echo fn_seller_update...

	form=""
	result=""
	
	if [[ "$6" == "deactive" ]];then
		form=$(yad --form --geometry=400+300+200 --title "Update Seller" --field="NUM:RO" --field="ID:RO" --field="PW:RO"  --field="EMAIL:RO" --field="REG_DATE:RO" --field="STATUS:CB" "$1" "$2" "$3" "$4" "$5" "$6") result=$?
	else
		form=$(yad --form --geometry=400+300+200 --title "Update Seller" --field="NUM:RO" --field="ID:RO" --field="PW:RO"  --field="EMAIL:RO" --field="REG_DATE:RO" --field="STATUS:CB" "$1" "$2" "$3" "$4" "$5" "$6\!DA\!tempDA\!active") result=$?
	fi

	echo update event result: $result
	if ((result == 0));then
		echo $form

		num=$(echo $form | awk 'BEGIN {FS="|"} {print $1}')
		id=$(echo $form | awk 'BEGIN {FS="|"} {print $2}')
		pw=$(echo $form | awk 'BEGIN {FS="|"} {print $3}')
		email=$(echo $form | awk 'BEGIN {FS="|"} {print $4}')
		reg_date=$(echo $form | awk 'BEGIN {FS="|"} {print $5}')
		stat=$(echo $form | awk 'BEGIN {FS="|"} {print $6}')
		
			
		if [[ "$stat" == "$6" ]];then
			echo same
		elif [[ "$stat" == "DA" ]];then
			echo DA
			result=$(curl http://[ip]/semi/seller/status/da -d seller_num=$num)
			alert_suc1=$(yad --geometry=200+350+250 --title="Alert" --text="Updated successfully." --text-align=center --button="OK:1")
		elif [[ "$stat" == "tempDA" ]];then

			echo tempDA
			
			result=$(curl http://[ip]/semi/seller/status/tmpda -d seller_num=$num -d status=tmpDA)
			alert_suc2=$(yad --geometry=200+350+250 --title="Alert" --text="Updated successfully." --text-align=center --button="OK:1")
		elif [[ "$stat" == "active" ]];then
			echo active

			result=$(curl http://[ip]/semi/seller/status/active -d seller_num=$num)
			alert_suc3=$(yad --geometry=200+350+250 --title="Alert" --text="Updated successfully." --text-align=center --button="OK:1")
		fi

		echo $result
	fi
	fn_seller_selectAll
}

fn_login(){
	form=$(yad --form --geometry=300+300+200 --title "Bean Factory" --field="ID" --field="PW:H" "admin" "hi123456" --button="Login:0" --button="Exit:1") result=$?

	if (( $result == 0 ));then
		echo "OK"
		echo $form
		id=$(echo $form | awk 'BEGIN {FS="|"} {print $1}')
		pw=$(echo $form | awk 'BEGIN {FS="|"} {print $2}')
	
		flag=$(curl http://[ip]/semi/admin/login -d id=$id -d pw=$pw)
		echo flag:$flag
		echo id:$id
		echo pw:$pw
		if [[ "$flag" == "success" ]];then
			alert_suc=$(yad --geometry=200+350+250 --title="Alert" --text="Signed in successfully." --text-align=center --button="OK:1")
			fn_show_menu
		elif [[ "$flag" == "fail" ]];then
			echo login fail
			alert_fail=$(yad --geometry=200+350+250 --title="Alert" --text="Invalid id or password." --text-align=center --button="OK:1")
			fn_login
		fi

	else
		echo "Cancel"
	fi
}
#fn_show_menu
#fn_user_selectAll
fn_login
