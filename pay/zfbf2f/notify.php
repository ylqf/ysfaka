<?php
require_once '../inc.php';

use \Musnow\AlipayF2F\Pay;

$data = $payDao->getReqdata($_POST);
$payconf = $payDao->checkAcp('zfbf2f');

$config = [
    'appId'         => $payconf['userid'],    //应用appid
    //应用私钥
    // ！！！注意：如果是文件方式，文件中只保留字符串，不要留下 -----BEGIN RSA PRIVATE KEY----- 这种标记
    'alipayPublicKey' => $payconf['email']
];

$alipay = new Pay($config);
/**
 * 验签
 */
if($alipay->rsaCheck($data)){
    if($data['trade_status'] == "TRADE_SUCCESS"){
        $payDao->updateOrder($data['out_trade_no'],'支付宝当面付',$data['trade_no']);
    }
    exit('success');

}else{
    exit('error');
}


