#!/bin/bash


> status.log
> dead.log
echo "网站网页可用性报警！！！" >> dead.log
echo "报警主机: 国内中转机" >> dead.log

for i in `cat list.txt`
do
	{
	url="https://$i"
        status=`curl --connect-timeout 10 -o /dev/null -s -w %{http_code}_%{time_total} $url`
        echo -e "${url}_${status}" >> status.log
	} &
done
wait
sleep 1
sed -i '/^_ *$/d' status.log

exit 
code1="200"
code2="302"
code3="000"
for a in `cat status.log`
do
        name=`echo $a|awk -F_ '{print $1}'`
        url=`echo $a|awk -F_ '{print $2}'`
        code=`echo $a|awk -F_ '{print $3}'`
        tim=`echo $a|awk -F_ '{print $4}'|awk -F. '{print $1}'`
		if [[ $code != $code1 ]] && [[ $code != $code2 ]] && [[ $code != $code3 ]];then
                echo -e "$name---$url is ERR!!! 状态码:$code 超时时间:$tim"  >> dead.log
#		elif [ $tim -ge 9  ];then
#				echo -e "$name---$url is ERR!!! 状态码:$code 超时时间:$tim"  >> dead.log

        fi
done

mes=`cat dead.log`
num=`cat dead.log|wc -l`
if [ $num -ge 3  ];then
        curl -X POST -i -k 'https://api.at0mx.com/output/sendTelegram?' --data-urlencode 'password=c958293a1173f5c3e7171dfe4cd68edf' --data-urlencode "text=$mes" --data-urlencode 'id=-262430313' &> /dev/null
fi
