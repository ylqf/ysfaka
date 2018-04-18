<?php
require_once '../inc.php';


$data = $payDao->getReqdata($_POST);
$payconf = $payDao->checkAcp('paysapi');
//校验传入的参数是否格式正确，略


$temps = md5($data['orderid'] . $data['orderuid'] . $data['paysapi_id'] . $data['price'] . $data['realprice'] . $payconf['userkey']);

if ($temps != $key){
    exit('验证失败！T_T');
}else{

    $payarr=[1=>'微信',2=>'支付宝'];
    $uid = explode('-',$data['orderuid']);
    $res = $payDao->updateOrder($data['orderid'],$payarr[$uid[1]],$data['trade_no']);
    if(!$res)exit('success');



}