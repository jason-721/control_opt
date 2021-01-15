<?php
$maxTimes = 5;
$minTimes = 0;


exec('bash ' . __DIR__ . '/check.sh');

$result = file_get_contents(__DIR__ . '/result.log');
$result = explode(PHP_EOL, $result);

$record = file_get_contents(__DIR__ . '/record.json');
$record = json_decode($record, true);

$codeState = ['200' => 'live', '302' => 'live', '000' => 'dead', '403' => 'dead', '404' => 'dead'];
$webIp = ['52.175.22.25', '143.92.53.182', '52.221.30.176', '52.74.201.222', '143.92.48.228', '69.171.64.63', '23.98.32.113', '143.92.48.231', '154.204.28.68', '154.204.28.112', '69.171.65.73', '69.171.64.85', '69.171.66.63', '65.49.144.34', '54.255.136.249', '112.213.122.21', '120.79.176.245', '156.251.163.106', '65.49.145.114', '89.208.242.33', '67.230.168.124', '52.77.203.102', '52.76.31.253', '118.107.42.233', '69.171.67.225', '89.208.244.121', '54.169.172.59', '18.140.53.131', '172.105.119.141', '139.162.59.242', '172.247.127.114', '156.251.162.151','103.1.153.236','43.251.159.191','43.251.159.77','14.29.126.109'];

foreach ($result as $v) {
    if (empty($v)) {
        continue;
    }
    list($domain, $code, $ip) = explode(',', $v);
    if (empty($record[$domain])) {
        $record[$domain] = ['num' => floor($maxTimes / 2), 'code' => '--', 'send' => false];
    }
    $status = $codeState[$code] ? $codeState[$code] : $code;
    if (!in_array($ip, $webIp)) {
        $status = $codeState['000'];
    }

    if ($status == 'live') {
        $record[$domain]['num']++;
    } else {
        $record[$domain]['num']--;
    }

    if ($record[$domain]['num'] < $minTimes) {
        $record[$domain]['num'] = $minTimes;
        $record[$domain]['code'] = 'dead';
    } elseif ($record[$domain]['num'] > $maxTimes) {
        $record[$domain]['num'] = $maxTimes;
        $record[$domain]['code'] = 'live';
    }
}

$dead = $live = [];
foreach ($record as $k => $v) {
    if (isset($v['send']) and $v['send'] == $v['code']) {
        continue;
    }
    if ($v['num'] != $maxTimes and $v['num'] != $minTimes) {
        continue;
    }
    if ($v['code'] == 'live') {
        $live[] = $k;
    } elseif ($v['code'] == 'dead') {
        $dead[] = $k;
    }
    $record[$k]['send'] = $v['code'];
}

if ($live or $dead) {
    $t = date('Y-m-d H:i:s') . PHP_EOL;
    if ($live) {
        $t .= 'live List' . PHP_EOL;
        $t .= implode(' , ', $live) . PHP_EOL;
    }
    if ($dead) {
        $t .= 'dead List' . PHP_EOL;
        $t .= implode(' , ', $dead) . PHP_EOL;
    }

    $param = [];
    $param['action'] = 'output_sendTelegram';
    $param['password'] = 'c958293a1173f5c3e7171dfe4cd68edf';
    $param['text'] = $t;

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, 'https://cdn.vapi.atomx.us/web.php');
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $param);
    curl_setopt($ch, CURLOPT_TIMEOUT, 60);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    $result = curl_exec($ch);
    curl_close($ch);
}

$recordTxt = json_encode($record, JSON_UNESCAPED_UNICODE + JSON_UNESCAPED_SLASHES);
file_put_contents(__DIR__ . '/record.json', $recordTxt);
