
#!/bin/bash
  
> second_status.log
> second_tele.log


for  a in `cat second_check.txt|xargs|sed 's/,/\n/g'`;do nc -vz -w 7 $a 443 &>> second_status.log;done
wait

cat second_status.log |grep -v "succeeded"|awk '{print $4}' >> second_tele.log
data_info=`cat second_tele.log |xargs|sed 's/ /,/'g`
curl "http://make.edgeeee.com/Vps/banIp2?p=79a244366c2352df43beed7ae9c440bc&data=$data_info"

