#!/bin/bash
  
code1="200"
code2="302"
code3="000"

> dead.log
echo -e "API源链接报警！" >> dead.log
echo -e "报警主机: 国内中转机" >> dead.log

for a in `cat status.log`
do
    name=`echo $a|awk -F_ '{print $1}'`
    url=`echo $a|awk -F_ '{print $2}'`
    code=`echo $a|awk -F_ '{print $3}'`
    tim=`echo $a|awk -F_ '{print $4}'|awk -F. '{print $1}'`
    if [[ $code == $code1 ]] || [[ $code == $code2 ]] ;then
	    sed -i "/$name/d" status.log
    elif [[ $code == $code3 ]]  && [[ $tim -lt 5  ]];then
	    sed -i "/$name/d" status.log
    fi
done


for a in `cat status.log`
do
    name=`echo $a|awk -F_ '{print $1}'`
    url=`echo $a|awk -F_ '{print $2}'`
    code=`echo $a|awk -F_ '{print $3}'`
    tim=`echo $a|awk -F_ '{print $4}'|awk -F. '{print $1}'`
    if [[ $code == $code ]] || [[ $name == $name ]] || [[ $url == $url ]];then
	echo -e "$name---$url is ERR!!! 状态码: $code  时间: $tim"  >> dead.log
    fi
done

mes=`cat dead.log|uniq`
num=`cat dead.log|uniq|wc -l`
if [ $num -ge 3  ];then
       curl -X POST -i -k 'https://api.at0mx.com/output/sendTelegram?' --data-urlencode 'password=c958293a1173f5c3e7171dfe4cd68edf' --data-urlencode "text=$mes" --data-urlencode 'id=-262430313' &> /dev/null
fi

> status.log

