#!/bin/bash

for i in `cat bad_ip.txt`
do
	sed -i "/$i/d" ip.txt
done
