#!/bin/bash

> url.log
> url_bad.log
echo "短链接报警！" >> url_bad.log
echo "报警主机: 国内中转机" >> url_bad.log
for i in `cat ip.txt`
do
	name=`echo $i|awk -F, '{print $1}'`
	ip=`echo $i|awk -F, '{print $2}'`
	status=`curl --connect-timeout 3 -o /dev/null -s -w %{http_code}_%{time_total} http://$ip:8081/hello`
	echo -e "${name}_${ip}_${status}" >> url.log
done
wait

for a in `cat url.log`
do
	name=`echo $a|awk -F_ '{print $1}'`
	ip=`echo $a|awk -F_ '{print $2}'`
	code=`echo $a|awk -F_ '{print $3}'`
	tim=`echo $a|awk -F_ '{print $4}'`

	if [ $code -ne 200  ];then
		echo -e "$name\t$ip\t短链接错误，状态码为： $code" >> url_bad.log
	fi
done

mes=`cat url_bad.log`
num=`cat url_bad.log|wc -l`
if [ $num -ge 3  ];then
		curl -X POST -i -k 'https://api.at0mx.com/output/sendTelegram?' --data-urlencode 'password=c958293a1173f5c3e7171dfe4cd68edf' --data-urlencode "text=$mes" --data-urlencode 'id=-262430313' &> /dev/null
fi



