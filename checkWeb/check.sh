#!/bin/bash

>/opt/checkWeb/result.log
for d in $(cat /opt/checkWeb/url.list); do
  {
    if [ ! $d ]; then
      continue
    fi
    url=$(echo $d | cut -d "," -f1)
    domain=$(echo $d | cut -d "," -f2)
    if [ ! $domain ]; then
      domain=$url
    fi
    code=$(curl -I -m 15 --connect-timeout 15 -o /dev/null -s -w %{http_code} $url)
    ip=$(ping $domain -c 1 | sed '1{s/[^(]*(//;s/).*//;q}')
    echo -e "$url\t$code\t$ip"
    echo -e "$url,$code,$ip" >> /opt/checkWeb/result.log
  } &
done

wait

echo "over"
