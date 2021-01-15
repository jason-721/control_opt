#!/bin/bash

> dead.log
echo -e "官网域名报警！！！" >> dead.log
echo "报警主机: 国内中转机" >> dead.log

veeevpn_com="veeevpn.com"
veeevpn_com_num=`cat record.json |jq '."veeevpn.com".num'`

veee_web="veee395.vip"
veee_web_num=`cat record.json |jq '."veee395.vip".num'`

upnet_web="upnet281.vip"
upnet_web_num=`cat record.json |jq '."upnet281.vip".num'`


m_upnet_web="m.upnet281.vip"
m_upnet_web_num=`cat record.json |jq '."m.upnet281.vip".num'`

case $veee_web_num in
	"2")
		echo -e "Veee-官网主域名：$veee_web 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead.log ;;
    "1")
		echo -e "Veee-官网主域名：$veee_web 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead.log ;;
	*) ;;
esac

case $upnet_web_num in
	"2")
		echo -e "Upnet-官网主域名：$upnet_web 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead.log ;;
    "1")
		echo -e "Upnet-官网主域名：$upnet_web 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead.log ;;
	*) ;;
esac

case $m_upnet_web_num in
	"2")
		echo -e "Upnet-手机端官网主域名：$m_upnet_web 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead.log ;;
    "1")
		echo -e "Upnet-手机端官网主域名：$m_upnet_web 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead.log ;;
	*) ;;
esac

case $veeevpn_com_num in
	"2")
		echo -e "Veee-官网百度入口：$veeevpn_com 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead.log ;;
    "1")
		echo -e "Veee-官网百度入口：$veeevpn_com 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead.log ;;
	*) ;;
esac

mes=`cat dead.log`
num=`cat dead.log|wc -l`
if [ $num -ge 3  ];then
        curl -X POST -i -k 'https://api.at0mx.com/output/sendTelegram?' --data-urlencode 'password=c958293a1173f5c3e7171dfe4cd68edf' --data-urlencode "text=$mes" --data-urlencode 'id=-347605828' &> /dev/null
fi
