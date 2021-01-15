#!/bin/bash

sed -i '/1.2.4.8/d' /etc/resolv.conf
sed -i '/223.5.5.5/d' /etc/resolv.conf
sed -i '/114.114.114.114/d' /etc/resolv.conf
sed -i '/8.8.8.8/d' /etc/resolv.conf
sed -i '/119.29.29.29/d' /etc/resolv.conf

sed -i "/nameserver/a\\nameserver 1.2.4.8" /etc/resolv.conf
sed -i "/1.2.4.8/a\\nameserver 223.5.5.5" /etc/resolv.conf
sed -i "/223.5.5.5/a\\nameserver 114.114.114.114" /etc/resolv.conf
sed -i "/114.114.114.114/a\\nameserver 8.8.8.8" /etc/resolv.conf
sed -i "/8.8.8.8/a\\nameserver 119.29.29.29" /etc/resolv.conf
num=`cat /etc/resolv.conf |grep nameserver|wc -l`
curl_status() {
	dig www.baidu.com +time=2 +tries=2 +short &> /dev/null && dig fan486.snhov1.com +time=2 +tries=2 +short &> /dev/null
	st=`echo $?`	
}



check() {
curl_status
if [ $st -eq 0  ];then
    echo 1
    exit 0
else
    sed -i 's/^nameserver/#nameserver/g' /etc/resolv.conf
fi
}


check
for i in `seq $num`
do
	name=`cat /etc/resolv.conf |grep nameserver|sed -n "${i}p"`
	new_name=`cat /etc/resolv.conf |grep nameserver|sed -n "${i}p"|sed 's/#//'`
	sed -i "s/$name/$new_name/" /etc/resolv.conf
    	check
done
curl_status
if [ $st -ne 0  ];then
	echo 0
fi

