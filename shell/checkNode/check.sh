#!/bin/bash

cd /home/shell/checkNode/

> loadSync.server.success
> loadSync.server.fail
#> loadSync.server.success2
#> loadSync.server.fail2


#curl https://cdn.vapi.atomx.us/web.php?action=output_checkServerList\&p=32183214 > loadSync.server

for x in $(cat loadSync.server)
do
        {
        IP=$(echo $x|cut -d "," -f1);
	#echo $IP
        #P=`nc -zv -w 20 $IP 22 2>&1`
	nc -z -w 5 $IP 11022 >/dev/null 2>&1
        #E=$(echo $P |awk '{print $7}');
        #echo $P $E;
        #if [ $E = "succeeded!" ];then
	#echo $?
	if [ $? -eq 0 ];then
                echo "test $IP Success";
                echo $IP >> loadSync.server.success
        else
                echo "test $IP Fail";
                echo $IP >> loadSync.server.fail
        fi
        }&
done

wait
#sleep 25

#for x in $(cat loadSync.server.success)
#do
#        {
#        IP=$(echo $x|cut -d "," -f1);
#        #echo $IP
#        P=`nc -zv -w 20 $IP 22 2>&1`
#        #nc -z -w 10 $IP 22 >/dev/null 2>&1
#        E=$(echo $P |awk '{print $7}');
#        echo $P $E;
#        if [ $E = "succeeded!" ];then
#	#echo $?
#        #if [ $? -eq 0 ];then
#	        echo "test $IP Success";
#                echo $IP >> loadSync.server.success2
#        else
#                echo "test $IP Fail";
#                echo $IP >> loadSync.server.fail2
#        fi
#        }&
#done

#sleep 15

echo "over"
