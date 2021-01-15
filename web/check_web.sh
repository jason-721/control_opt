#!/bin/bash
  

> status.log
> dead.log
echo "官网报警！！！" >> dead.log
echo "报警主机: 国内中转机" >> dead.log

veee_web1="Veee官网正式,https://veee395.vip"
upnet_web1="Upnet官网正式,https://upnet281.vip"
down="下载正式,https://dl.sudojs.net"

veee_yaoqing1="Veee邀请正式,https://l-sf0ew.club"
veee_yaoqing2="Veee邀请备用,https://l-owefs.club"
upnet_yaoqing1="Upnet邀请正式,https://winmyyou.vip/none.html"
upnet_yaoqing2="Upnet邀请备用,https://winmyyou.vip/none.html"
for i in {$veee_web1,$upnet_web1,$down}
do
        {
        name=`echo $i|awk -F, '{print $1}'`
        url=`echo $i|awk -F, '{print $2}'`
        status=`curl --connect-timeout 10 -o /dev/null -s -w %{http_code}_%{time_total} $url`
        return_num=`curl https://veee383.vip 2>/dev/null |grep "弹窗"|wc -l`
        echo "$name"_"$url"_"$status" >> status.log
        } &
done
wait
sleep 1
sed -i '/^_ *$/d' status.log
#
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
        fi
done

veee_num=$(curl --connect-timeout 60  `echo $veee_web1|awk -F, '{print $2}'` 2>/dev/null | grep "下载图标" |wc -l)
upnet_num=$(curl --connect-timeout 60 `echo $upnet_web1|awk -F, '{print $2}'` 2>/dev/null | grep "谷歌" |wc -l)
down_num=$(curl --connect-timeout 60 `echo $down|awk -F, '{print $2}'` 2>/dev/null)
if [ $veee_num -ne 1 ];then
	echo -e "Veee官网---无法正常打开，请马上查看\n$url" >> dead.log
fi
if [ $upnet_num -ne 1 ];then
	echo -e "Upnet官网---无法正常打开，请马上查看\n$url" >> dead.log
fi
if [ "$down_num" != "111" ];then
	echo -e "下载官网---无法正常打开，请马上查看\n$url" >> dead.log
fi
mes=`cat dead.log`
num=`cat dead.log|wc -l`
if [ $num -ge 3  ];then
        curl -X POST -i -k 'https://api.at0mx.com/output/sendTelegram?' --data-urlencode 'password=c958293a1173f5c3e7171dfe4cd68edf' --data-urlencode "text=$mes" --data-urlencode 'id=-262430313' &> /dev/null
fi

