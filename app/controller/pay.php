<?php
namespace YS\app\controller;

use YS\app\libs\Controller;

class pay extends Controller
{
    /**
     * 支付方法
     */
    public function index()
    {
        $id = $this->req->get('id');
        $type = $this->req->get('type');
        $paycode = $this->req->get('paycode');
        //查询订单是否存在
        $order = $this->model()->select()->from('orders')->where(array('fields' => 'orderid=?', 'values' => array($id)))->fetchRow();
        if(!$order)exit('非法请求，已记录ip');
        $payconf = $this->model()->select()->from('acp')->where(array('fields' => 'code=?', 'values' => array($paycode)))->fetchRow();
        if(!$payconf)exit('平台未配置支付参数，请联系管理员');
        switch ($paycode){
            case 'blpay':
                $this->blpay($order,$payconf,$type);
                break;
        }
    }

    /**
     * 开始支付
     */
    private function blpay($order,$payconf,$type)
    {
        $url_base = strcasecmp($_SERVER['HTTPS'],"ON")==0?"https://":"http://";
        $this->req->server('HTTP_HOST');
        //组装支付参数
        $paydata = [
            'pid' => $payconf['userid'],
            'type' => $type,
            'out_trade_no' => $order['orderid'],
            'notify_url'   => $url_base.$_SERVER['HTTP_HOST'].'/pay/bl_notify',
            'return_url'   => $url_base.$_SERVER['HTTP_HOST'].'/pay/bl_preturn',
            'name'   => $order['oname'],
            'money'  => $order['cmoney'],
            'sign' =>$payconf['userkey'],
            'sign_type' =>'MD5'
        ];

        $para_filter = createLinkstring(argSort(paraFilter($paydata)));//除去待签名参数数组中的空值和签名参数
        $sgin = md5Sign($para_filter,$payconf['userkey']);
        $paydata['sign'] = $sgin;
        $canshu =createLinkstring($paydata);
        $this->res->redirect('http://pay.blyzf.cn/submit.php?'.$canshu);

    }

    public function bl_notify()
    {
        $data = $this->getReqdata($_GET);
        unset($data['s']);
        $payconf = $this->model()->select()->from('acp')->where(array('fields' => 'code=?', 'values' => array('blpay')))->fetchRow();
        //除去待签名参数数组中的空值和签名参数
        $para_filter = paraFilter($data);
        //对待签名参数数组排序
        $para_sort = argSort($para_filter);
        //把数组所有元素，按照“参数=参数值”的模式用“&”字符拼接成字符串
        $prestr = createLinkstring($para_sort);
        $isSgin = md5Verify($prestr, $data['sign'],$payconf['userkey']);
        if($isSgin){
            if($data['trade_status'] == 'TRADE_SUCCESS') {
                $res = $this->checkOrder($data['out_trade_no'],$data['type'],$data['trade_no']);
                if(!$res)exit('success');
                exit('success');
            }
            exit('success');
        }else{
            exit('error');
        }
    }

    public function bl_preturn()
    {
        $data = $this->getReqdata($_GET);
        unset($data['s']);
        $payconf = $this->model()->select()->from('acp')->where(array('fields' => 'code=?', 'values' => array('blpay')))->fetchRow();
        //除去待签名参数数组中的空值和签名参数
        $para_filter = paraFilter($data);
        //对待签名参数数组排序
        $para_sort = argSort($para_filter);
        //把数组所有元素，按照“参数=参数值”的模式用“&”字符拼接成字符串
        $prestr = createLinkstring($para_sort);
        $isSgin = md5Verify($prestr, $data['sign'],$payconf['userkey']);
        if($isSgin){
            if($data['trade_status'] == 'TRADE_SUCCESS') {
                $res = $this->checkOrder($data['out_trade_no'],$data['type'],$data['trade_no']);
                if(!$res)exit('订单更新失败，请联系管理员');
                exit('支付成功！^_^');
            }
            exit('支付成功！^_^');
        }else{
            exit('验证失败！T_T');
        }


    }

    /**
     * 更改订单状态
     */
    private function  checkOrder($orderid,$type,$blid)
    {

        //查询订单是否已更改
        $order = $this->model()->select()->from('orders')->where(array('fields' => 'orderid=? ', 'values' => array($orderid)))->fetchRow();
        if($order['status'] > 0) return true;
        $data['status'] = 1;
        $data['payid'] = $blid;
        $payarr = [
            'alipay' => '支付宝扫码',
            'wxpay' => '微信扫码',
            'qqpay' => '手Q扫码',
            'tenpay' => '财付通'
        ];
        $data['paytype'] = $payarr[$type];
        /**
         * 自动发卡 获取卡密到订单信息 然后去掉库存 改变卡密状态
         */
        if($order['otype'] == 0){
            $kami = $this->model()->select()->from('kami')->limit($order['onum'])->where(array('fields' => ' `gid` = '.$order['gid'].' AND `is_ste` = 0', 'values' => ''))->fetchAll();
            $info = '';
            $ids = '';
            if(!$kami){
                $data['status'] = 5;
            }else{
                $data['status'] = 3;
                foreach ($kami as $v){
                    $ids.= $v['id'].',';
                    $info .= '卡号： '.$v['kano'];
                    if($v['kapwd']){
                        $info.=' ---- 卡密： '.$v['kapwd']."<br/>";
                    }else{
                        $info.=' ---- 卡密： 无需卡密！<br/>';
                    }
                }
                $data['info'] = $info;
                //设置卡密过期
                $config = $this->setConfig;
                //拼接sql
                $sql = "UPDATE ".$config::db()['prefix']."kami SET `is_ste` = 1 WHERE `id` IN (".trim($ids,',').")";
                $res = $this->model()->query($sql);
                //减去库存
                $goods = $this->model()->select()->from('goods')->where(array('fields' => 'id=?', 'values' => array($order['gid'])))->fetchRow();
                $gdata['kuc'] = $goods['kuc']-$order['onum'];
                $this->model()->from('goods')->updateSet($gdata)->where(array('fields' => 'id = ?', 'values' => array($goods['id'])))->update();

            }
        }
        $status = $this->model()->from('orders')->updateSet($data)->where(array('fields' => 'orderid = ?', 'values' => array($orderid)))->update();
        if($status)
        {
            if($this->config['email_state'] == 1){
                $this->sendEmail($order['account'],$order,$data['info']);
            }

            return true;
        }else{
            return false;
        }


    }

    /**邮件发送
     * @param $email
     * @param $order
     */
    private function sendEmail($email,$order,$info = '')
    {
        //自动发卡通知
        if($order['otype'] == 0){
            $mailtpl = $this->model()->select()->from('mailtpl')->where(array('fields' => 'is_state=? and cname=?', 'values' => array(0, '卡密发送')))->fetchRow();
            $mdata = [
                'sitename' => $this->config['sitename'],
                'gname' => $order['oname'],
                'orid' => $order['orderid'],
                'ornum' => $order['onum'],
                'cmoney' => $order['cmoney'],
                'ctime' => date('Y-m-d H:i',$order['ctime']),
                'orderinfo' => $info,
                'url' => $this->config['siteurl']
            ];
            $newData = $this->res->replaceMailTpl($mailtpl, $mdata);
            $subject = array('title' => $newData['title'], 'email' => $email, 'content' => $newData['content']);
            $this->res->sendMail($subject, $this->config);
        }else{
            $mailtpl = $this->model()->select()->from('mailtpl')->where(array('fields' => 'is_state=? and cname=?', 'values' => array(0, '管理员通知')))->fetchRow();
            $mdata = [
                'sitename' => $this->config['sitename'],
                'gname' => $order['oname'],
                'orid' => $order['orderid'],
                'ornum' => $order['onum'],
                'cmoney' => $order['cmoney'],
                'ctime' => date('Y-m-d H:i',$order['ctime']),
                'url' => $this->config['siteurl']
            ];
            $newData = $this->res->replaceMailTpl($mailtpl, $mdata);
            $subject = array('title' => $newData['title'], 'email' => $this->config['email'], 'content' => $newData['content']);
            $this->res->sendMail($subject, $this->config);
        }


    }

}