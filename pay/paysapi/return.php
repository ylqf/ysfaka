<?php
require_once '../inc.php';


$data = $payDao->getReqdata($_GET);
//查询订单是否存在
$payDao->checkOrder($data['orderid']);

$payDao->res->redirect($payDao->urlbase . $payDao->req->server('HTTP_HOST') . '/chaka?oid=' .$data['orderid']);