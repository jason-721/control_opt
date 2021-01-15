#!/bin/bash
check_nc(){
port1=22
> tele.log
> tele2.log
> status.log
echo -e "功能机器国内22端口报警！！！" >> tele.log
echo -e "报警主机：国内中转机" >> tele.log
echo -e "功能机器国内22端口报警！！！" >> tele2.log
echo -e "报警主机：国内中转机" >> tele2.log

for i in `cat ip.txt|grep -v "#"`
do
name=`echo $i|awk -F, '{print $1}'`
ip=`echo $i|awk -F, '{print $2}'`
	nc -vz -w 10 $ip $port1 &>> status.log
done
}

check_nc

time_out=`cat status.log|grep "timed out"|wc -l`
if [ $time_out -ge 1  ];then
	check_nc
	check_nc
	check_nc
fi
wait

sed -i 's/ /,/g' /opt/proxy_ip_port/status.log
wait

err=`cat status.log|grep "failed"|wc -l`
if [ $err -ge 1 ];then
sed -i '/succeeded/d' status.log
    while read line
    do
        ip=`echo $line|grep failed|awk '{print $4}'|sort|uniq`
        port=`echo $line|grep failed|awk '{print $6}'|sort|uniq`
        for b in `echo $ip`
        do
            name=`cat ip.txt|grep "$b"|awk '{print $1}'`
        done
        echo -e "$name --- ${ip}\t端口：${port}\t状态: failed" >> tele2.log
    done <status.log

fi
tim=`cat status.log|grep "timed"|wc -l`
if [ $tim -ge 1 ];then
sed -i '/succeeded/d' status.log
    while read line
    do
        ip=`echo $line|grep timed|awk '{print $4}'|sort|uniq`
        port=`echo $line|grep timed|awk '{print $6}'|sort|uniq`
        for b in `echo $ip`
        do
            name=`cat ip.txt|grep "$b"|awk '{print $1}'`
        done
        echo -e "$name --- ${ip}\t端口：${port}\t状态: timed_out" >> tele2.log
    done <status.log

fi

num=`cat tele.log|wc -l`
tele=`cat tele.log`
if [ $num -ge 3  ];then
	curl -X POST -i -k 'https://api.at0mx.com/output/sendTelegram?' --data-urlencode 'password=c958293a1173f5c3e7171dfe4cd68edf' --data-urlencode "text=${tele}" --data-urlencode 'id=-347605828' &> /dev/null	
fi
num=`cat tele2.log|wc -l`
tele=`cat tele2.log`
if [ $num -ge 3  ];then
	curl -X POST -i -k 'https://api.at0mx.com/output/sendTelegram?' --data-urlencode 'password=c958293a1173f5c3e7171dfe4cd68edf' --data-urlencode "text=${tele}" --data-urlencode 'id=-262430313' &> /dev/null	
fi
