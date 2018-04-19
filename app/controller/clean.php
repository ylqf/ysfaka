<?php

namespace YS\app\controller;

use YS\app\libs\Controller;
use YS\app\Config;

class clean extends Controller
{

    public function index()
    {
        $db = Config::db();
        $token = $this->req->get('token');
        if($token != $db['serive_token'])exit('非法请求，已记录ip');

        //清理过期订单
        $ctime = (time() - 3600);
        $this->model()->from('orders')->where(array('fields' => 'ctime < ? AND status = 0', 'values' => array($ctime)))->delete();
        //查询有误库存告警 预留开发空间




    }



}