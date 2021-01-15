#!/bin/bash
  
while :
do
cd /opt/check_ip/
> veee_status.log
> ovse_status.log
> upnet_status.log
> tele.log
> tele2.log
for  a in `cat ucloud_veee.txt`;do nc -vz -w 7 $a 443 &>> veee_status.log ;done
for  b in `cat ucloud_upnet.txt`;do nc -vz -w 7 $b 443 &>> upnet_status.log ;done
for  c in `cat ucloud_ovse.txt`;do nc -vz -w 7 $c 443 &>> ovse_status.log ;done
cat veee_status.log |grep -v "succeeded"|grep -Eo  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" >> tele.log
cat upnet_status.log |grep -v "succeeded"|grep -Eo  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" >> tele.log
cat ovse_status.log |grep -v "succeeded"|grep -Eo  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" >> tele.log

data_info=`cat tele.log |xargs|sed 's/ /,/'g`
curl "http://make.edgeeee.com/Vps/banIp1?p=79a244366c2352df43beed7ae9c440bc&data=$data_info"
sleep 5

done
