#!/bin/bash
> upnet_name_status.log
> veee_name_status.log
name1="zmingsa.com"
for i in `awk -F, '{if ($5=="ACTIVATED") print $1,$2}' upnet.txt|sed 's/ /,/g'`
do
    domain=`echo $i|awk -F, '{print $1}'`
    ip=`echo $i|awk -F, '{print $2}'`
    return=`curl --connect-timeout 10  -s  https://"$domain"."$name1"`
    echo -e "https://"$domain"."$name1"\t${ip}\t${return}" >> upnet_name_status.log
done
name2="ajsiwl.com"
for i in `awk -F, '{if ($5=="ACTIVATED") print $1,$2}' veee.txt|sed 's/ /,/g'`
do
    domain=`echo $i|awk -F, '{print $1}'`
    ip=`echo $i|awk -F, '{print $2}'`
    return=`curl --connect-timeout 10  -s  https://"$domain"."$name2"`
    echo -e "https://"$domain"."$name2"\t${ip}\t${return}" >> veee_name_status.log
done

sleep 60

for i in `awk -F, '{if ($5=="ACTIVATED") print $1,$2}' upnet.txt|sed 's/ /,/g'`
do
    domain=`echo $i|awk -F, '{print $1}'`
    ip=`echo $i|awk -F, '{print $2}'`
    return=`curl --connect-timeout 10  -s  https://"$domain"."$name1"`
    echo -e "https://"$domain"."$name1"\t${ip}\t${return}" >> upnet_name_status.log
done
for i in `awk -F, '{if ($5=="ACTIVATED") print $1,$2}' veee.txt|sed 's/ /,/g'`
do
    domain=`echo $i|awk -F, '{print $1}'`
    ip=`echo $i|awk -F, '{print $2}'`
    return=`curl --connect-timeout 10  -s  https://"$domain"."$name2"`
    echo -e "https://"$domain"."$name2"\t${ip}\t${return}" >> veee_name_status.log
done


> tele_bad_domain.log
echo -e "访问主机域名没有返回loading的机器：" >> tele_bad_domain.log
echo -e "报警主机: 国内中转管理机" >> tele_bad_domain.log
cat veee_name_status.log |grep -v loading >> tele_bad_domain.log
cat upnet_name_status.log |grep -v loading >> tele_bad_domain.log
tele_num=`cat tele_bad_domain.log|wc -l`
tele_mes=`cat tele_bad_domain.log`
if [ "$tele_num" -ge 3  ];then
    curl -X POST -i -k 'https://api.at0mx.com/output/sendTelegram?' --data-urlencode 'password=c958293a1173f5c3e7171dfe4cd68edf' --data-urlencode "text=${tele_mes}" --data-urlencode 'id=-262430313' &> /dev/null
fi

