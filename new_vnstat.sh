#!/bin/bash
f_1=$1
f_2=$2
mon=`date +%m`
mon_us=`date|awk '{print $2}'`
last_mon=`date -d 'last month'|awk '{print $2}'`
day1=`date +%d -d "-1 days"`
day2=`date +%d -d "-2 days"`
day3=`date +%d -d "-3 days"`
day4=`date +%d -d "-4 days"`
day5=`date +%d -d "-5 days"`
day6=`date +%d -d "-6 days"`
day7=`date +%d -d "-7 days"`
today=`date +%m/%d`
yesterday=`date +%m/%d -d "-1 days"`
#ubuntu
u_vnstat() {
  apt-get update -yq &> /dev/null
  apt-get install net-tools -yq &> /dev/null
  apt-get install vnstat -yq &> /dev/null
  apt-get install bc -yq &> /dev/null

}

c_vnstat() {
  yum install net-tools -y -q &> /dev/null
  yum -y install epel-release &> /dev/null
  # yum -y update
  yum -y install vnstat -y &> /dev/null
  yum --enablerepo=epel install vnstat -y &> /dev/null
  yum -y install bc -y &> /dev/null
}

centos_vnstat() {
    vnstat &> /dev/null
    if [  $? != 0 ];then
        c_vnstat
        get_net
    else
        service vnstat restart &> /dev/null
        get_net
    fi
}

ubuntu_vnstat() {
    vnstat &> /dev/null
    if [  $? != 0 ];then
        u_vnstat
        get_net
    else
        service vnstat restart &> /dev/null
        get_net
    fi
}


count_net() {
  if [ ! -f  "/opt/1.log"  ];then
    touch /opt/1.log
  fi
  if [ ! -f  "/opt/vnstat.log"  ];then
    touch /opt/vnstat.log
  fi
  > /opt/1.log
  > /opt/vnstat.log

  vnstat -l -i $net >> /opt/1.log &
  sleep 1800
  pid=`ps -ef|grep -v grep |grep "vnstat -l -i"|awk '{print $2}'`
  kill -SIGINT $pid

  num1=`cat /opt/1.log |grep -A 4 "bytes"|grep average|awk '{print $2}'`
  num2=`cat /opt/1.log |grep -A 4 "bytes"|grep average|awk '{print $5}'`
  dw="Mbit/s"
  dw1=`cat /opt/1.log |grep -A 4 "bytes"|grep average|awk '{print $3}'`
  dw2=`cat /opt/1.log |grep -A 4 "bytes"|grep average|awk '{print $6}'`

  if [ $dw1 == $dw2 ];then
    total=`echo "$num1+$num2"|bc`
    echo -e "$ipaddr,last,$total,$dw1" >> /opt/vnstat.log
  elif [ $dw1 == $dw -a $dw2 != $dw   ];then
    echo -e "$ipaddr,last,$num1,$dw1" >> /opt/vnstat.log
  elif [ $dw1 != $dw -a $dw2 == $dw   ];then
    echo -e "$ipaddr,last,$num2,$dw2" >> /opt/vnstat.log
  fi
  wait
}

get_net() {
    net=`ip route get 8.8.8.8|grep 8.8.8.8|awk '{print $5}'`
    old_net=`cat /etc/vnstat.conf |grep Interface|awk '{print $2}'|awk -F '"' '{print $2}'`
    sed -i "/Interface/d" /etc/vnstat.conf ; sed -i "2i\Interface "$net"" /etc/vnstat.conf
    vnstat -m &> /dev/null
    case $f_1 in
      "today")
          total=`vnstat -d|grep "$today"|awk '{print $8,$9,$11,$12}'`
          echo "${ipaddr}_流量是_$total"
          ;;
      "yesterday")
          total=`vnstat -d|grep "$yesterday"|awk '{print $8,$9,$11,$12}'`
          echo "${ipaddr}_流量是_$total"
          ;;          
      "-w")
          total=`vnstat -w|grep "current"|awk '{print $9,$10}'`
          echo "${ipaddr}_流量是_$total"
          ;;
      "-m")
          total=`vnstat -m|grep $mon_us|awk '{print $9,$10}'`
          echo "${ipaddr}_流量是_$total"
          ;;
      "last_mon")
          total=`vnstat -m|grep $last_mon|awk '{print $9,$10}'`
          echo "${ipaddr}_流量是_$total"
          ;;
      "-l")
          count_net
          ;;
      "day7")
          day_7=`vnstat -d|egrep -w "$mon/$day7|$mon/$day6|$mon/$day5|$mon/$day4|$mon/$day3|$mon/$day2|$mon/$day1"|awk 'BEGIN{ORS=","} {print $8,$9}'|sed -e 's/.[^,]*$//'`
          echo -e "${ipaddr}_流量是_$day_7"
          ;;
      "day3")
          day_3=`vnstat -d|egrep -w "$mon/$day3|$mon/$day2|$mon/$day1"|awk 'BEGIN{ORS=","} {print $8,$9}'|sed -e 's/.[^,]*$//'`
          echo -e "${ipaddr}_流量是_$day_3"      
          ;;
      "day2")
          day_2=`vnstat -d|egrep -w "$mon/$day2|$mon/$day1"|awk 'BEGIN{ORS=","} {print $8,$9}'|sed -e 's/.[^,]*$//'`
          echo -e "${ipaddr}_流量是_$day_2"
          ;;   
      "day5")
          day_5=`vnstat -d|egrep -w "$mon/$day5|$mon/$day4|$mon/$day3|$mon/$day2|$mon/$day1"|awk 'BEGIN{ORS=","} {print $8,$9}'|sed -e 's/.[^,]*$//'`
          echo -e "${ipaddr}_流量是_$day_5"
          ;;               
      *)
          echo ""
          echo "请输入一下选项"
          echo " -d 月/日/年  例如：11/29/19 | -w | -m | -l | day7 | last_mon"
          echo ""
          exit 1
          ;;
      esac
  
  }

    # total=`vnstat -m|grep -A 2 total|awk 'NR==3 {print $9,$10}'`
    # net_num=`echo $total|awk '{print $1}'`
    # net_un=`echo $total|awk '{print $2}'`
    
    # echo "$ipaddr 流量是： $total"


P1=$(cat /etc/issue | grep -o "Ubuntu" | wc -l)
P2=$(cat /etc/issue | grep -o "Kernel" | wc -l)


if [ "$P1" -eq 1 ]; then
  SYS="ubuntu"
fi
if [ "$P2" -eq 1 ]; then
  SYS="centos"
fi
case $SYS in
"centos")
    ipaddr=`ip route get 8.8.8.8 | awk '{if (!f) f = NF; printf("%s ", $f); f--}'|awk '{print $1}'`
     yum -y install bc -y &> /dev/null
    centos_vnstat
  ;;
"ubuntu")
    ipaddr=`ip route get 8.8.8.8 | awk '{if (!f) f = NF-2; printf("%s ", $f); f--}'|awk '{print $1}'`
     apt-get install bc -yq &> /dev/null
    ubuntu_vnstat
  ;;
*)
    echo "script stop!!"
    exit 5
  ;;
esac