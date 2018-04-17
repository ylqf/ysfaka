<?php require_once 'header.php' ?>


<div class="tpl-page-container tpl-page-header-fixed">


    <div class="tpl-left-nav tpl-left-nav-hover">
        <div class="tpl-left-nav-title">
            菜单
        </div>
        <div class="tpl-left-nav-list">
            <ul class="tpl-left-nav-menu">
                <li class="tpl-left-nav-item">
                    <a href="/" class="nav-link ">
                        <i class="am-icon-home"></i>
                        <span>自助下单</span>
                    </a>
                </li>
                <li class="tpl-left-nav-item">
                    <a href="/chaka" class="nav-link  active ">
                        <i class="am-icon-eye"></i>
                        <span>进度查询</span>
                    </a>
                </li>


            </ul>
        </div>
    </div>


    <div class="tpl-content-wrapper">
        <div class="tpl-content-page-title">
            订单查询
        </div>
        <ol class="am-breadcrumb">
            <li><a href="" class="am-icon-home">订单查询</a></li>

        </ol>
        <div class="tpl-content-scope">
            <div class="note note-info">
                <h3>注意：
                    <span class="close" data-close="note"></span>
                </h3>
                <p><span class="label label-default">待处理:</span> 表示付款成功等待管理员处理
                </p>
                <p><span class="label label-info">已处理:</span> 表示订单正在处理中
                </p>
                <p><span class="label label-success">已完成:</span> 表示订单已经完成
                </p>
                <p><span class="label label-danger">【处理失败】或者【发卡失败】</span> 表示订单异常，请联系管理员处理
                </p>
            </div>
        </div>



        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    <span class="am-icon-code"></span> 订单查询
                </div>
                <div class="tpl-portlet-input tpl-fz-ml">

                </div>


            </div>
            <div class="tpl-block">
                <div class="am-g">


                    <div class="am-u-sm-12 am-u-md-6">
                        <div class="am-btn-toolbar">

                        </div>
                    </div>

                        <div class="am-u-sm-12 am-u-md-3">
                            <div class="am-form-group">
                                <select id="otype" name="status" data-am-selected="{btnSize: 'sm'}">
                                    <option value="0">自动发卡</option>
                                    <option value="1">手工订单</option>
                                </select>
                            </div>

                        </div>



                        <div class="am-u-sm-12 am-u-md-3">
                            <div class="am-input-group am-input-group-sm">
                                <input type="text" id="account" name="account" value="" placeholder="充值账号搜索" required
                                       class="am-form-field">
                                <span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search" onclick="getOrders()"
                    type="button"></button>
          </span>
                            </div>
                        </div>

                </div>
                <div class="am-g">
                    <div class="am-u-sm-12">

                        <table class="am-table am-table-striped am-table-hover table-main">
                            <thead>
                            <tr>

                                <th class="table-id">订单id</th>
                                <th class="table-title">订单名称</th>
                                <th class="table-title">订单类型</th>
                                <th class="table-type">充值数量</th>
                                <th class="table-author">商品单价</th>
                                <th class="table-author">订单总价</th>
                                <th class="table-author">充值账号</th>
                                <th class="table-author">支付方式</th>
                                <th class="table-author">状态</th>
                                <th class="table-date am-hide-sm-only">下单时间</th>
                                <th class="table-set">操作</th>
                            </tr>
                            </thead>

                            <tbody id="ordcont">


                            </tbody>


                        </table>
                        <div class="am-cf">

                            <div class="am-fr">

                            </div>
                        </div>
                        <hr>


                    </div>

                </div>
            </div>
            <div class="tpl-alert"></div>
        </div>


    </div>


</div>


<?php require_once 'footer.php' ?>

