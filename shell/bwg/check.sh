#!/bin/bash

for ip in $(cat list)
do
  nc -zv -w 10 $ip 22 2>&1
done
