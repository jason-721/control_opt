ipaddr=`ip route get 8.8.8.8 | awk '{if (!f) f = NF-2; printf("%s ", $f); f--}'|awk '{print $1}'`
declare -A dic
dic=(
    [42.157.224.193]="dd-100M-8"
    [42.157.224.33]="qyd-100M-2"
    [42.157.224.155]="qyd-100M-1"
    [42.157.224.196]="ve-tr-5"
    [42.157.224.203]="dd-100M-1"
    [42.157.224.48]="ve-tr-4"
    [42.157.224.184]="dd-100M-2"
    [42.157.224.181]="dd-100M-3"
    [42.157.224.169]="dd-100M-4"
    [42.157.224.139]="ve-tr-1"
    [42.157.224.182]="dd-100M-5"
    [42.157.225.2]="dd-100M-6"
    [42.157.224.31]="ve-tr-3"
    [42.157.224.197]="dd-100M-7"
    [42.157.224.71]="ve-tr-2"
    [42.157.224.125]="up-tr-1"
    [42.157.224.204]="up-tr-3"
    [42.157.224.30]="up-tr-2"
    [192.168.0.198]="青岛200M-17"
    [192.168.0.197]="青岛200M-16"
    [192.168.0.196]="青岛200M-15"
    [103.216.154.44]="LL-100M-1"
    [45.113.201.235]="LL-100M-2"
    [45.113.201.226]="LL-100M-3"
    [192.168.0.199]="青岛200M-18"
    [103.216.154.37]="LL-100M-4"
    [103.216.154.23]="LL-100M-5"
    [172.104.44.172]="TEST"
    )

name=`echo ${dic["$ipaddr"]}`

service haproxy status &> /dev/null
num=`ps -ef|grep -v grep|grep haproxy|wc -l`

if [ $? -ne 0 -o $num -ne 2 ];then
    service haproxy restart &> /dev/null
    service haproxy status &> /dev/null
    num2=`ps -ef|grep -v grep|grep haproxy|wc -l`
    if [ $? -ne 0 -a $num2 -ne 2 ];then
	echo 0
    else
	echo 1
    fi
else
	echo 1
fi

