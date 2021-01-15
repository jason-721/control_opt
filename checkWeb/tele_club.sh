#!/bin/bash

> dead_club.log
echo -e "邀请域名报警！！！" >> dead_club.log
echo "报警主机: 国内中转机" >> dead_club.log

veee_ttt_club1="t-sfwer.club"
veee_ttt_club1_num=`cat record.json |jq '."t-sfwer.club"'`

veee_ttt_club2="t-wer2d.club"
veee_ttt_club2_num=`cat record.json |jq '."t-wer2d.club"'`

veee_ttt_club3="t-234ds.club"
veee_ttt_club3_num=`cat record.json |jq '."t-234ds.club"'`

veee_ttt_club4="t-okk2d.club"
veee_ttt_club4_num=`cat record.json |jq '."t-okk2d.club"'`

veee_ttt_club5="t-owoad.club"
veee_ttt_club5_num=`cat record.json |jq '."t-owoad.club"'`

veee_ttt_club6="t-2fsfa.club"
veee_ttt_club6_num=`cat record.json |jq '."t-2fsfa.club"'`

veee_ttt_club7="t-lowd2.club"
veee_ttt_club7_num=`cat record.json |jq '."t-lowd2.club"'`

veee_ttt_club8="t-woeio.club"
veee_ttt_club8_num=`cat record.json |jq '."t-woeio.club"'`

veee_ttt_club9="t-we00s.club"
veee_ttt_club9_num=`cat record.json |jq '."t-we00s.club"'`

veee_ttt_club10="t-wep23.club"
veee_ttt_club10_num=`cat record.json |jq '."t-wep23.club"'`

veee_lll_club1="l-owefs.club"
veee_lll_club1_num=`cat record.json |jq '."l-owefs.club"'`

veee_lll_club2="l-owe2d.club"
veee_lll_club2_num=`cat record.json |jq '."l-owe2d.club"'`

veee_lll_club3="l-cxvas.club"
veee_lll_club3_num=`cat record.json |jq '."l-cxvas.club"'`

veee_lll_club4="l-iwefs.club"
veee_lll_club4_num=`cat record.json |jq '."l-iwefs.club"'`

veee_lll_club5="l-sd2ew.club"
veee_lll_club5_num=`cat record.json |jq '."l-sd2ew.club"'`

veee_lll_club6="l-pwer2.club"
veee_lll_club6_num=`cat record.json |jq '."l-pwer2.club"'`

veee_lll_club7="l-werou.club"
veee_lll_club7_num=`cat record.json |jq '."l-werou.club"'`

veee_lll_club8="l-p2ewr.club"
veee_lll_club8_num=`cat record.json |jq '."l-p2ewr.club"'`

veee_lll_club9="l-ew2sa.club"
veee_lll_club9_num=`cat record.json |jq '."l-ew2sa.club"'`


upnet_ttt_club1="myup001.club"
upnet_ttt_club1_num=`cat record.json |jq '."myup001.clubv"'`

upnet_ttt_club2="myup002.club"
upnet_ttt_club2_num=`cat record.json |jq '."myup002.club"'`

upnet_ttt_club3="myup007.club"
upnet_ttt_club3_num=`cat record.json |jq '."myup007.club"'`

upnet_ttt_club4="myup080.club"
upnet_ttt_club4_num=`cat record.json |jq '."myup080.club"'`

upnet_ttt_club5="myup090.club"
upnet_ttt_club5_num=`cat record.json |jq '."myup090.club"'`

upnet_ttt_club6="myup258.club"
upnet_ttt_club6_num=`cat record.json |jq '."myup258.club"'`

upnet_ttt_club7="myup808.club"
upnet_ttt_club7_num=`cat record.json |jq '."myup808.club"'`

upnet_ttt_club8="myup923.club"
upnet_ttt_club8_num=`cat record.json |jq '."myup923.club"'`

upnet_ttt_club9="myup832.club"
upnet_ttt_club9_num=`cat record.json |jq '."myup832.club"'`

upnet_ttt_club10="myup252.club"
upnet_ttt_club10_num=`cat record.json |jq '."myup252.clubv"'`

upnet_lll_club1="f23e2.club"
upnet_lll_club1_num=`cat record.json |jq '."f23e2.club"'`

upnet_lll_club2="y2w3s.club"
upnet_lll_club2_num=`cat record.json |jq '."y2w3s.club"'`

upnet_lll_club3="awer2.club"
upnet_lll_club3_num=`cat record.json |jq '."awer2.clubv"'`

upnet_lll_club4="sw23s.club"
upnet_lll_club4_num=`cat record.json |jq '."sw23s.club"'`

upnet_lll_club5="cs2sa.club"
upnet_lll_club5_num=`cat record.json |jq '."cs2sa.club"'`

upnet_lll_club6="zsd2s.club"
upnet_lll_club6_num=`cat record.json |jq '."zsd2s.club"'`

upnet_lll_club7="msf2a.club"
upnet_lll_club7_num=`cat record.json |jq '."msf2a.club"'`

upnet_lll_club8="u2soy.club"
upnet_lll_club8_num=`cat record.json |jq '."u2soy.club"'`

upnet_lll_club9="et2ae.club"
upnet_lll_club9_num=`cat record.json |jq '."et2ae.club"'`

upnet_lll_club10="w20wi.club"
upnet_lll_club10_num=`cat record.json |jq '."w20wi.club"'`


case $veee_ttt_club1_num in
	"2")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club1 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club1 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $veee_ttt_club2_num in
	"2")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club2 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club2 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $veee_ttt_club3_num in
	"2")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club3 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club3 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $veee_ttt_club4_num in
	"2")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club4 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club4 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $veee_ttt_club5_num in
	"2")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club5 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club5 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $veee_ttt_club6_num in
	"2")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club6 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club6 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $veee_ttt_club7_num in
	"2")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club7 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club7 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $veee_ttt_club8_num in
	"2")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club8 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club8 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $veee_ttt_club9_num in
	"2")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club9 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club9 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $veee_ttt_club10_num in
	"2")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club10 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Veee-邀请跳转域名：$veee_ttt_club10 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $veee_lll_club1_num in
	"2")
		echo -e "Veee-邀请落地域名：$veee_lll_club1 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Veee-邀请落地域名：$veee_lll_club1 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $veee_lll_club2_num in
	"2")
		echo -e "Veee-邀请落地域名：$veee_lll_club2 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Veee-邀请落地域名：$veee_lll_club2 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac
case $veee_lll_club3_num in
	"2")
		echo -e "Veee-邀请落地域名：$veee_lll_club3 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Veee-邀请落地域名：$veee_lll_club3 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac
case $veee_lll_club4_num in
	"2")
		echo -e "Veee-邀请落地域名：$veee_lll_club4 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Veee-邀请落地域名：$veee_lll_club4 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac
case $veee_lll_club5_num in
	"2")
		echo -e "Veee-邀请落地域名：$veee_lll_club5 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Veee-邀请落地域名：$veee_lll_club5 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac
case $veee_lll_club6_num in
	"2")
		echo -e "Veee-邀请落地域名：$veee_lll_club6 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Veee-邀请落地域名：$veee_lll_club6 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac
case $veee_lll_club7_num in
	"2")
		echo -e "Veee-邀请落地域名：$veee_lll_club7 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Veee-邀请落地域名：$veee_lll_club7 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac
case $veee_lll_club8_num in
	"2")
		echo -e "Veee-邀请落地域名：$veee_lll_club8 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Veee-邀请落地域名：$veee_lll_club8 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac
case $veee_lll_club9_num in
	"2")
		echo -e "Veee-邀请落地域名：$veee_lll_club9 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Veee-邀请落地域名：$veee_lll_club9 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac



case $upnet_ttt_club1_num in
	"2")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club1 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club1 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $upnet_ttt_club2_num in
	"2")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club2 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club2 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $upnet_ttt_club3_num in
	"2")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club3 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club3 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $upnet_ttt_club4_num in
	"2")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club4 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club4 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $upnet_ttt_club5_num in
	"2")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club5 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club5 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $upnet_ttt_club6_num in
	"2")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club6 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club6 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $upnet_ttt_club7_num in
	"2")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club7 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club7 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $upnet_ttt_club8_num in
	"2")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club8 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club8 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $upnet_ttt_club9_num in
	"2")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club9 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club9 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $upnet_ttt_club10_num in
	"2")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club10 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请跳转域名：$upnet_ttt_club10 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $upnet_lll_club1_num in
	"2")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club1 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club1 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $upnet_lll_club2_num in
	"2")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club2 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club2 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $upnet_lll_club3_num in
	"2")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club3 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club3 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $upnet_lll_club4_num in
	"2")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club4 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club4 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $upnet_lll_club5_num in
	"2")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club5 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club5 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $upnet_lll_clu6_num in
	"2")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club6 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club6 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $upnet_lll_club7_num in
	"2")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club7 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club7 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $upnet_lll_club8_num in
	"2")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club8 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club8 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $upnet_lll_club9_num in
	"2")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club9 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club9 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac

case $upnet_lll_club10_num in
	"2")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club10 当前状态变成 [  2  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
    "1")
		echo -e "Upnet-邀请落地域名：$upnet_lll_club10 当前状态变成 [  1  ] ！注意观察，有被Ban的风险！" >> dead_club.log ;;
	*) ;;
esac
mes=`cat dead_club.log`
num=`cat dead_club.log|wc -l`
if [ $num -ge 3  ];then
        curl -X POST -i -k 'https://api.at0mx.com/output/sendTelegram?' --data-urlencode 'password=c958293a1173f5c3e7171dfe4cd68edf' --data-urlencode "text=$mes" --data-urlencode 'id=-262430313' &> /dev/null
fi

