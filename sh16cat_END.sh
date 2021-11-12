#!/bin/bash

clear
echo $(pwd) $0
echo ===============

#cat sh10temp.txt

data=$(cat sh10temp.txt)
echo $data	

cat > sh16temp.txt<<END
HTML5,CSS3,JavaScript,JQuery,
Java,JSP/Servlet,Spring Framework
Mybatis,Oracle18c
Linux
Python
END



exit 0
