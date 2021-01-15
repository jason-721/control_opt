#!/bin/bash

time=`date +%Y-%m-%d" "%H:%M`
if [ ! -d "/opt/flow/" ];then
	mkdir /opt/flow/
fi
if [ ! -f "/opt/flow/flow.log"  ];then
	echo -e "${time}_0" >> /opt/flow/flow.log
fi
net=`sudo ip route get 8.8.8.8|grep 8.8.8.8|awk '{print $5}'`
flow=`sudo ifconfig $net|grep bytes|grep TX|awk '{print $5}'`
echo -e "${time}_${flow}" >> /opt/flow/flow.log
old_time=`tail -2 /opt/flow/flow.log|sed -n '1p'|awk -F_ '{print $1}'`
new_time=`tail -2 /opt/flow/flow.log|sed -n '2p'|awk -F_ '{print $1}'`
old_flow=`tail -2 /opt/flow/flow.log|sed -n '1p'|awk -F_ '{print $2}'`
new_flow=`tail -2 /opt/flow/flow.log|sed -n '2p'|awk -F_ '{print $2}'`
five_M_flow=`echo "$flow"/1024/1024|bc`
five_M_flow_2=`echo "($new_flow - $old_flow)/1024/1024"|bc`
echo -e "$old_time到$new_time之间，使用流量： $five_M_flow_2 M" >> /opt/flow/network.log
curl "https://t.edgeeee.com/server/api/traffic?pass=ds13dj5487ejf&tx="$five_M_flow"" &> /dev/null
