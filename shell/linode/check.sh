#!/bin/bash

> nodeID

echo "-------------------start----------------------"
for x in $(cat list)
do

  IP=$(echo $x|cut -d "," -f1);
  ID=$(echo $x|cut -d "," -f2);
  nc -zv -w 10 $IP 22 2>&1
  if [ $? -ne 0 ];then
   echo $ID >> nodeID
  fi
done
echo "-------------------end----------------------"
