#!/bin/bash

clear
echo $(pwd) $0
echo ===============

#library install
#sudo apt install -y curl
#sudo apt install -y jq

writeFileFn(){
cat > sh19temp.txt << END
{
	"name":"kim",
	"vo":{
		"id":"admin"
		},
	"arr":[11,22,33]
}
END
}

#writeFileFn

curl http://192.168.0.18:8090/sh19json.txt
#curl http://192.168.0.18:8090/sh19json.txt > sh19json.txt

curl http://192.168.0.18:8090/sh19json.txt |jq '.'
echo ===========================================
curl http://192.168.0.18:8090/sh19json.txt |jq '.name'
echo ===========================================
curl http://192.168.0.18:8090/sh19json.txt |jq '.vo'
echo ===========================================
curl http://192.168.0.18:8090/sh19json.txt |jq '.vo.id'
echo ===========================================
curl http://192.168.0.18:8090/sh19json.txt |jq '.arr'
echo ===========================================
curl http://192.168.0.18:8090/sh19json.txt |jq '.arr[0]'
echo ===========================================

#jq '.' sh19json.txt
#{
#  "name": "kim2",
#  "vo": {
#    "id": "admin2"
#  },
#  "arr": [
#    11,
#    22,
#    33
#  ]
#}

#jq '.name' sh19json.txt
#"kim2"

#jq '.vo' sh19json.txt
#{
#  "id": "admin2"
#}

#jq '.vo.id' sh19json.txt
#"admin2"

#jq '.arr' sh19json.txt
#[
#  11,
#  22,
#  33
#]

#jq '.arr[0]' sh19json.txt
#11


#pi@raspberry:~/shellPro $ cat sh19json.txt |jq '.'
#pi@raspberry:~/shellPro $ cat sh19json.txt |jq '.name'
#pi@raspberry:~/shellPro $ cat sh19json.txt |jq '.vo.id'
#pi@raspberry:~/shellPro $ cat sh19json.txt |jq '.arr'
#pi@raspberry:~/shellPro $ cat sh19json.txt |jq '.arr[0]'


exit 0
