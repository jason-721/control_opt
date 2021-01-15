#!/bin/bash
> invitation_status.log
> invitation_tele.log
echo -e "官网邀请域名状态报警" >> invitation_tele.log
check() {
for i in `cat invitation.txt`
do
    sys=`echo $i|awk -F, '{print $1}'`
    domain=`echo $i|awk -F, '{print $2}'`
    return=`curl --connect-timeout 10  -s  https://"$domain" 2> /dev/null|awk -F '"' '{print $2}'|sed '/^$/d'`
    status=`curl --connect-timeout 10 -o /dev/null -s -w %{http_code}_%{time_total} $return`
    echo -e "$sys,$domain,$return,$status" >> invitation_status.log
done
}

check
sleep 60
check
sleep 60
check


for a in `cat invitation_status.log`
do
	sys=`echo $a|awk -F, '{print $1}'`
	domain=`echo $a|awk -F, '{print $2}'`
	return=`echo $a|awk -F, '{print $3}'`
	status=`echo $a|awk -F, '{print $4}'`
	status2=`echo $a|awk -F, '{print $4}'|awk -F_ '{print $1}'`
	status3=`echo $a|awk -F, '{print $4}'|awk -F_ '{print $2}'`
	if [ $status2 -eq 200  ];then
		sed -i "/$domain/d" invitation_status.log
	fi
done

for b in `cat invitation_status.log`
do
	sys=`echo $b|awk -F, '{print $1}'`
	domain=`echo $b|awk -F, '{print $2}'`
	return=`echo $b|awk -F, '{print $3}'`
	status=`echo $b|awk -F, '{print $4}'`
	status2=`echo $b|awk -F, '{print $4}'|awk -F_ '{print $1}'`
	status3=`echo $b|awk -F, '{print $4}'|awk -F_ '{print $2}'`
	if [ -z $status -o -z $return  ];then
		echo -e "$sys\t$domain\t跳转域名错误" >> invitation_tele.log
	elif [ $status2 -ne 200 ]; then
		echo -e "$sys\t$domain\t状态码错误: $status2\t时间: $status3" >> invitation_tele.log
	elif [ `expr $status3 \< 1` -eq 0 ];then
		echo -e "$sys\t$domain\t状态码: $status2\t时间超时: $status3" >> invitation_tele.log
	fi
done

tele_mes2=`cat invitation_tele.log |sed -n 1p ; cat invitation_tele.log|grep -v "官网"|sort|uniq`
tele_mes2_num=`cat invitation_tele.log|wc -l`
if [ $tele_mes2_num -ge 2  ];then
	curl -X POST -i -k 'https://api.at0mx.com/output/sendTelegram?' --data-urlencode 'password=c958293a1173f5c3e7171dfe4cd68edf' --data-urlencode "text=${tele_mes2}" --data-urlencode 'id=-347605828' &> /dev/null
fi
