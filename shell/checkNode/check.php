<?php

$data = [];
$data['action'] = 'output_checkServerListObj';
$data['outputPassCheck'] = '76897e4a094bcdb117d970ffac8a7ee2';

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, 'https://cdn.vapi.atomx.us/web.php');
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
curl_setopt($ch, CURLOPT_TIMEOUT, 60);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
$result = curl_exec($ch);
curl_close($ch);

$array = json_decode($result,true);
if ($array['code'] !=200){
  echo date('Y-m-d H:i:s')."\t"."not serverList".PHP_EOL;
  exit();
}
$serverList = $array['bean'];
$ipList = implode(PHP_EOL,$serverList);
file_put_contents(__DIR__.'/loadSync.server',$ipList);

exec(__DIR__.'/check.sh');

$fail = file_get_contents('/home/shell/checkNode/loadSync.server.fail');
$fail = explode(PHP_EOL,$fail);
$success = file_get_contents('/home/shell/checkNode/loadSync.server.success');
$success = explode(PHP_EOL,$success);

$failIp = $successIp = [];
foreach ($fail as $v){
    if (empty($v)){
        continue;
    }
//    list($ip,$group,$label) = explode(',',$v);
    $failIp[] = $v;
}
foreach ($success as $v){
    if (empty($v)){
        continue;
    }
//    list($ip,$group,$label) = explode(',',$v);
    $successIp[] = $v;
}
$data = [];
$data['action'] = 'output_nodeNcCheck';
$data['outputPassCheck'] = '76897e4a094bcdb117d970ffac8a7ee2';
$data['successIp'] = json_encode($successIp);

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, 'https://cdn.vapi.atomx.us/web.php');
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
curl_setopt($ch, CURLOPT_TIMEOUT, 60);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
$result = curl_exec($ch);
curl_close($ch);

echo date('Y-m-d H:i:s')."\t".$result.PHP_EOL;
