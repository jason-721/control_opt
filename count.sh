#！/bin/bash


P1=$(cat /etc/issue | grep -o "Ubuntu" | wc -l)
P2=$(cat /etc/issue | grep -o "Kernel" | wc -l)

urlencode() {
	  local length="${#1}"
		    for (( i = 0; i < length; i++ )); do
				    local c="${1:i:1}"
						    case $c in
							      [a-zA-Z0-9.~_-]) printf "$c" ;;
	      *) printf "$c" | xxd -p -c1 | while read x;do printf "%%%s" "$x";done
			    esac
				done
}

if [ "$P1" -eq 1 ]; then
  SYS="ubuntu"
fi
if [ "$P2" -eq 1 ]; then
  SYS="centos"
fi
case $SYS in
"centos")
    ipaddr=`ip route get 8.8.8.8 | awk '{if (!f) f = NF; printf("%s ", $f); f--}'`
  ;;
"ubuntu")
    ipaddr=`ip route get 8.8.8.8 | awk '{if (!f) f = NF-2; printf("%s ", $f); f--}'`
  ;;
*)
    echo "script stop!!"
    exit 5
  ;;
esac

echo $ipaddr
net=`ip route get 8.8.8.8|grep 8.8.8.8|awk '{print $5}'`
RXnum=`ifconfig $net|grep bytes|grep "RX"|awk -F"(" '{print $2}'|awk -F")" '{print $1}'|awk '{print $1}'`
RXunit=`ifconfig $net|grep bytes|grep "RX"|awk -F"(" '{print $2}'|awk -F")" '{print $1}'|awk '{print $2}'`
TXnum=`ifconfig $net|grep bytes|grep "TX"|awk -F"(" '{print $2}'|awk -F")" '{print $1}'|awk '{print $1}'`
TXunit=`ifconfig $net|grep bytes|grep "TX"|awk -F"(" '{print $2}'|awk -F")" '{print $1}'|awk '{print $2}'`

if [ "$RXunit" == "$TXunit"  ] && [ "$RXunit" == "GB"  ];then
        total=$(echo "$RXnum+$TXnum" | bc)
        echo $total  > /opt/rate.log
elif [ "$RXunit" == "$TXunit"  ] && [ "$RXunit" == "MB"  ];then
        total=$(printf "%.2f" `echo "scale=3;($RXnum+$TXnum)/1024" | bc`)
        echo $total  > /opt/rate.log
elif [ "$RXunit" == "$TXunit"  ] && [ "$RXunit" == "KB"  ];then
        total=$(printf "%.2f" `echo "scale=3;($RXnum+$TXnum)/1024/1024" | bc`)
        echo $total  > /opt/rate.log

fi

tod=$total
ysd=`cat /opt/rate.log`

ysd_use=$(echo "$tod-$ysd" | bc)

all=10
free_use=$(echo "$all-$tod" | bc)

pre_use=`awk 'BEGIN{printf " %.2f\n",('$tod'/'$all')*100}'`
pre_free=`awk 'BEGIN{printf " %.2f\n",('$free_use'/'$all')*100}'`
echo "------------------------"
echo "昨天使用流量： $ysd_use GB"
echo -e "\e[32m已经使用流量： $pre_use %\e[0m"
echo "------------------------"
echo "剩余可用流量： $free_use GB"
echo -e "\e[31m剩余可用流量： $pre_free %\e[0m"
echo "------------------------"

in=`echo $pre_free|awk -F. '{print $1}'`
if [ "$in" -le "20"  ];then
curl -X POST -i -k 'https://api.at0mx.com/output/sendTelegram?' --data-urlencode 'password=c958293a1173f5c3e7171dfe4cd68edf' --data-urlencode "text=${ipaddr}\n剩余可用流量${pre_free}%" --data-urlencode 'id=-262430313'
fi	
