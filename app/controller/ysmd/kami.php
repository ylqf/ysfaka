<?php
namespace YS\app\controller\ysmd;

use YS\app\libs\Controller;
use YS\app\model\KamiModel;

class kami extends CheckAdmin
{
    public function index()
    {
        $gid = $this->req->get('gid')?$this->req->get('gid'):-1;//商品id
        $is_ste = isset($_GET['is_ste']) ? $this->req->get('is_ste') : -1 ;
        $kano = $this->req->get('kano') ;
        $cons = '';
        $consArr = [];
        if($gid > 0){
            $cons .= $cons ? ' and ' : '';
            $cons.= 'k.gid = ?';
            $consArr[] = $gid;
        }
        if($kano != ""){
            $cons .= $cons ? ' and ' : '';
            $cons.= 'k.kano = ?';
            $consArr[] = $kano;
        }
        if($is_ste >= 0){
            $cons .= $cons ? ' and ' : '';
            $cons.= 'k.is_ste = ?';
            $consArr[] = $is_ste;
        }
        $lists = [];
        $page = $this->req->get('p');
        $page = $page ? $page : 1;
        $pagesize = 20;
        $totalsize = $this->model()->from('kami k')->where(array('fields' => $cons, 'values' => $consArr))->count();
        if ($totalsize) {
            $totalpage = ceil($totalsize / $pagesize);
            $page = $page > $totalpage ? $totalpage : $page;
            $offset = ($page - 1) * $pagesize;
            $lists = $this->model()->select('k.*,g.gname')->from('kami k')->limit($pagesize)->left('goods g')->on('k.gid=g.id')->join()->offset($offset)->where(array('fields' => $cons, 'values' => $consArr))->orderby('k.ctime desc')->fetchAll();
        }
        $pagelist = $this->page->put(array('page' => $page, 'pagesize' => $pagesize, 'totalsize' => $totalsize, 'url' => '?gid='.$gid.'&is_ste='.$is_ste.'&kano='.$kano.'&p='));
        $class = $this->model()->select()->from('goods')->where(array('fields' => 'type = 0'))->fetchAll();
        $search =[
            'gid' => $gid,
            'kano' => $kano,
            'is_ste' => $is_ste
        ];
        $gclass = $this->model()->select()->from('gdclass')->fetchAll();

        $data = array('title' => '卡密列表', 'lists' => $lists, 'class' => $class,'gclass'=>$gclass, 'pagelist' => $pagelist, 'search' => $search);
        $this->put('kami.php', $data);

    }

    /**
     * 导入卡密
     */
    public function impka()
    {
        $data = $this->getReqdata($_POST);
        $goods = $this->model()->select()->from('goods')->where(array('fields' => 'id=?', 'values' => array($data['gid'])))->fetchRow();
        if (!$goods)$this->error('商品不存在');
        $kami = trim($data['kamicont']);
        if (!$kami) $this->error('请填写卡密');
        $ka_arr = explode("\r\n", $kami);
        $kamiList = [];
            //格式化数据
        foreach ($ka_arr as $key => $v) {
            $kamiList[$key]['gid'] = $goods['id'];
            $kamiList[$key]['ctime'] = time();
            if (strstr($v, '----')) {
                $cstr = explode('----', $v);
                $kamiList[$key]['kano'] = $cstr[0];
                $kamiList[$key]['kapwd'] = $cstr[1];
            } else {
                $kamiList[$key]['kano'] = $v;
            }
        }
        //去重
        if($data['checkm'] == 1){
            $kamiList = array_unique($kamiList, SORT_REGULAR);
        }
        if(!$kamiList)$this->error('导入失败，请检查卡密格式');
        $config = $this->setConfig;
        //拼接sql
        $sql = "INSERT INTO ".$config::db()['prefix']."kami(`gid`,`kano`,`kapwd`,`ctime`) VALUES";
        foreach ($kamiList as $v){
            $sql.="('".$v['gid']."','".$v['kano']."','".$v['kapwd']."','".$v['ctime']."'),";
        }
        $sql = trim($sql,',');
        $res = $this->model()->query($sql);
        if ($res) {
            //更新库存
            $kamdl = new KamiModel();
            $kamdl->kuc($goods['id'],$goods['kuc'],count($kamiList));
            $this->res->redirect($this->dir . 'kami');
        } else {
            $this->error('导入失败');

        }
    }

    public function del()
    {
        $id = $this->req->get('id');
        if ($id) {
            $kami = $this->model()->select()->from('kami')->where(array('fields' => 'id=?', 'values' => array($id)))->fetchRow();
            if ($this->model()->from('kami')->where(array('fields' => 'id = ?', 'values' => array($id)))->delete()) {
                if($kami && $kami['is_ste'] == 0){
                    //减去库存
                    $goods = $this->model()->select()->from('goods')->where(array('fields' => 'id=?', 'values' => array($kami['gid'])))->fetchRow();
                    $gdata['kuc'] = $goods['kuc'] - 1;
                    $this->model()->from('goods')->updateSet($gdata)->where(array('fields' => 'id = ?', 'values' => array($goods['id'])))->update();
                }
                echo json_encode(array('status' => 1));
                exit;
            }
        }
        echo json_encode(array('status' => 0));
        exit;
    }

}