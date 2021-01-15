API_1="老Veee-API反代(IOS3.2会用)_https://cdn.vapi.atomx.us/api.php"
API_2="老Veee-API源-回源1_https://napi.atomx.us/api.php"
API_3="老Veee-API源-回源2(CDN)_https://aws-sg-old-info.azureedge.net/api.php"
API_4="新Veee-API移动端反代-iOS-3.8+会用-安卓会用)_https://cdn.tapdb-dev.com:9527/output/test"
API_5="新Veee-API移动端反代-iOS-3.8+会用-安卓会用)_https://cdn.taptap123.com:9527/output/test"
API_6="新Veee桌面端API反代_https://cdn.kisslucky.com:9527/Output/test"
API_7="新API源-回源1_https://api.at0mx.com/output/test"
API_8="新API源-回源2(CDN)_https://new-api-source.azureedge.net/output/test"
API_9="upnet桌面端API反代_https://cdn.upppppp.com:9527/output/test"
API_10="upnet移动端API反代_https://cdn.upnetapi.com:9527/output/test"
API_11="共同API源_https://6137fe.com/output/test"
API_12="回源2_https://upnet-api-cdn.azureedge.net/output/test"
API_13="veee团队套餐_https://cdn.sqweli.vip:9527/output/test"
API_14="Upnet的API官网用_https://cdn.oisuan.com:9527/output/test"


for i in {$API_1,$API_2,$API_3,$API_4,$API_5,$API_6,$API_7,$API_8,$API_9,$API_10,$API_11,$API_12,$API_13,$API_14}
do
{
        API_name=`echo $i|awk -F_ '{print $1}'`
        API_url=`echo $i|awk -F_ '{print $2}'`
        status=`curl --connect-timeout 10 -m 10 -o /dev/null -s -w %{http_code}_%{time_total} $API_url`
        echo "$API_name"_"$API_url"_"$status" >> status.log
#       echo $API_name
#       echo $API_url
} &
done
wait
sleep 1
sed -i '/^_ *$/d' status.log

wait

num=`cat status.log |grep 共同API源|wc -l`
if [ $num -ge 3  ];then
	bash tele.sh
else
	exit 1
fi

