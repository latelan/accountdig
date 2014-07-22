#!/bin/sh
#this shell imitate web browser request dsetination site for automatic landing page of dial-up 
#$1 is the first parameter stand for username,$2 is the second parameter stand for user passwd
#how to use: ./auto.sh "user" "userpwd"

user=$1
userpwd=$2
request_url=http://222.24.19.190:8080/portal/index_default.jsp
logurl=http://222.24.19.190:8080/portal
post_info="userName=$user&userPwd=$userpwd"

curl -s -c cookie.txt  -A Mozilla/5.0 -H "Accept-Language:zh-CN" $request_url &> /dev/null 
curl -s -b cookie.txt  -A Mozilla/5.0 -H "Accept-Language:zh-CN" -H "Referer:$request_url" -d $post_info "$logurl/pws?t=li" | grep heartBeatCyc >/dev/null
echo $?
