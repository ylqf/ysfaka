/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : testfk

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-04-16 21:38:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ys_acp
-- ----------------------------
DROP TABLE IF EXISTS `ys_acp`;
CREATE TABLE `ys_acp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL DEFAULT '',
  `userid` varchar(20) NOT NULL,
  `userkey` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ys_acp
-- ----------------------------
INSERT INTO `ys_acp` VALUES ('37', 'blpay', 'bl云支付', '', '', '');

-- ----------------------------
-- Table structure for ys_admin
-- ----------------------------
DROP TABLE IF EXISTS `ys_admin`;
CREATE TABLE `ys_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adminname` varchar(20) NOT NULL,
  `adminpass` varchar(40) NOT NULL,
  `token` varchar(40) NOT NULL,
  `is_state` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `limits` text,
  `limit_ip` varchar(300) NOT NULL DEFAULT '',
  `is_limit_ip` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ys_admin
-- ----------------------------
INSERT INTO `ys_admin` VALUES ('1', 'admin', 'd5a1bdf9ce989fd6161063e94b92bdeacb94ed23', '4718737b9f2f6e2c225fe605d6c7234330e7e7e4', '0', '{\"limit_ip\":\"\",\"is_limit_ip\":\"0\",\"set\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\",\"mailtpl\":\"\\u90ae\\u4ef6\\u6a21\\u7248\",\"admins\":\"\\u7ba1\\u7406\\u5458\\u5217\\u8868\",\"pwd\":\"\\u4fee\\u6539\\u5bc6\\u7801\",\"logs\":\"\\u767b\\u5f55\\u65e5\\u5fd7\",\"cog\":\"\\u5bfc\\u822a\\u8bbe\\u7f6e\",\"orders\":\"\\u8ba2\\u5355\\u5217\\u8868\",\"gdclass\":\"\\u5546\\u54c1\\u5206\\u7c7b\",\"goods\":\"\\u5546\\u54c1\\u5217\\u8868\",\"kami\":\"\\u5361\\u5bc6\\u7ba1\\u7406\",\"acp\":\"\\u63a5\\u5165\\u4fe1\\u606f\"}', '', '0');

-- ----------------------------
-- Table structure for ys_adminlogs
-- ----------------------------
DROP TABLE IF EXISTS `ys_adminlogs`;
CREATE TABLE `ys_adminlogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adminid` int(10) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  `ip` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adminid` (`adminid`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ys_adminlogs
-- ----------------------------

-- ----------------------------
-- Table structure for ys_config
-- ----------------------------
DROP TABLE IF EXISTS `ys_config`;
CREATE TABLE `ys_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sitename` varchar(50) NOT NULL,
  `siteurl` varchar(50) NOT NULL,
  `siteinfo` varchar(50) NOT NULL DEFAULT '',
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(300) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `tel` varchar(12) NOT NULL DEFAULT '',
  `qq` varchar(12) NOT NULL DEFAULT '',
  `address` varchar(50) NOT NULL DEFAULT '',
  `icpcode` varchar(20) NOT NULL DEFAULT '',
  `stacode` varchar(500) NOT NULL DEFAULT '',
  `smtp_server` varchar(20) NOT NULL DEFAULT '',
  `smtp_email` varchar(50) NOT NULL DEFAULT '',
  `smtp_pwd` varchar(20) NOT NULL DEFAULT '',
  `tips` text,
  `ctime` varchar(100) DEFAULT NULL,
  `email_state` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ys_config
-- ----------------------------
INSERT INTO `ys_config` VALUES ('1', '云尚发卡系统', 'faka.com', '云尚发卡系统 安全稳定', '云尚发卡系统 安全稳定', '云尚发卡系统 安全稳定', '53331323@qq.com', '400-000-0000', '53331323', '云尚创想科技', '沪ICP备13008591号', '', '', '', '', '<h2>\r\n	<ul class=\"tpl-task-list tpl-task-remind\" style=\"box-sizing:border-box;margin:0px;padding:0px;list-style:none;color:#333333;font-family:&quot;font-size:18px;white-space:normal;background-color:#FFFFFF;\">\r\n		<li style=\"box-sizing:border-box;margin:0px 0px 7px;padding:10px !important;list-style:none;position:relative;border-bottom:1px solid #F4F6F9;height:auto !important;font-size:14px !important;line-height:22px !important;color:#82949A;\">\r\n			<div class=\"cosA\" style=\"box-sizing:border-box;margin-right:80px;\">\r\n				<span class=\"cosIco\" style=\"box-sizing:border-box;display:inline-block;width:24px;height:24px;vertical-align:middle;color:#FFFFFF;text-align:center;border-radius:3px;background-color:#36C6D3;\"><span class=\"am-icon-bell-o\" style=\"box-sizing:border-box;display:inline-block;\"></span></span>&nbsp;<span style=\"box-sizing:border-box;\">注意：本站为云尚发卡系统演示站，商品数据只做测试使用！</span>\r\n			</div>\r\n		</li>\r\n		<li style=\"box-sizing:border-box;margin:0px 0px 7px;padding:10px !important;list-style:none;position:relative;border-bottom:1px solid #F4F6F9;height:auto !important;font-size:14px !important;line-height:22px !important;color:#82949A;\">\r\n			<div class=\"cosA\" style=\"box-sizing:border-box;margin-right:80px;\">\r\n				<span class=\"cosIco label-danger\" style=\"box-sizing:border-box;background-color:#36C6D3;display:inline-block;width:24px;height:24px;vertical-align:middle;color:#FFFFFF;text-align:center;border-radius:3px;\"><span class=\"am-icon-bolt\" style=\"box-sizing:border-box;display:inline-block;\"></span></span>&nbsp;云尚发卡系统免授权使用，切勿上当受骗，系统开源没有任何加密！\r\n			</div>\r\n		</li>\r\n		<li style=\"box-sizing:border-box;margin:0px 0px 7px;padding:10px !important;list-style:none;position:relative;border-bottom:1px solid #F4F6F9;height:auto !important;font-size:14px !important;line-height:22px !important;color:#82949A;\">\r\n			<div class=\"cosA\" style=\"box-sizing:border-box;margin-right:80px;\">\r\n				<span class=\"cosIco label-info\" style=\"box-sizing:border-box;background-color:#36C6D3;display:inline-block;width:24px;height:24px;vertical-align:middle;color:#FFFFFF;text-align:center;border-radius:3px;\"><span class=\"am-icon-bullhorn\" style=\"box-sizing:border-box;display:inline-block;\"></span></span>&nbsp;防止不法分子在源码中加入后门请到云尚官网下载正版程序！\r\n			</div>\r\n		</li>\r\n		<li style=\"box-sizing:border-box;margin:0px 0px 7px;padding:10px !important;list-style:none;position:relative;border-bottom:1px solid #F4F6F9;height:auto !important;font-size:14px !important;line-height:22px !important;color:#82949A;background:#F4F6F9;\">\r\n			<div class=\"cosA\" style=\"box-sizing:border-box;margin-right:80px;\">\r\n				<span class=\"cosIco label-warning\" style=\"box-sizing:border-box;background-color:#36C6D3;display:inline-block;width:24px;height:24px;vertical-align:middle;color:#FFFFFF;text-align:center;border-radius:3px;\"><span class=\"am-icon-plus\" style=\"box-sizing:border-box;display:inline-block;\"></span></span>&nbsp;软件官网：<a href=\"http://www.yunscx.com\" target=\"_blank\">http://www.yunscx.com</a>&nbsp; &nbsp; 交流QQ群 ：<a target=\"_blank\" href=\"//shang.qq.com/wpa/qunwpa?idkey=633fb72ae5064407d2af35f9bc0502629ccd3d9cd5b64ea51a424b1276f0cb9b\"><img border=\"0\" src=\"//pub.idqqimg.com/wpa/images/group.png\" alt=\"云尚软件交流群\" title=\"云尚软件交流群\"></a>\r\n			</div>\r\n		</li>\r\n	</ul>\r\n</h2>', '2017-03-21', '0');

-- ----------------------------
-- Table structure for ys_gdclass
-- ----------------------------
DROP TABLE IF EXISTS `ys_gdclass`;
CREATE TABLE `ys_gdclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '分类名称',
  `ord` int(100) DEFAULT '0' COMMENT '商品排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ys_gdclass
-- ----------------------------
INSERT INTO `ys_gdclass` VALUES ('7', '测试手工商品分类', '0');
INSERT INTO `ys_gdclass` VALUES ('6', '测试自动发卡商品分类', '1');

-- ----------------------------
-- Table structure for ys_goods
-- ----------------------------
DROP TABLE IF EXISTS `ys_goods`;
CREATE TABLE `ys_goods` (
  `id` int(100) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `cid` int(100) NOT NULL COMMENT '分类id',
  `gname` varchar(255) NOT NULL COMMENT '商品名称',
  `gmoney` decimal(20,2) NOT NULL COMMENT '商品售价',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 自动发卡  1 手工订单',
  `checks` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许重复下单 1是  0否',
  `cont` text COMMENT '商品介绍',
  `onetle` varchar(255) DEFAULT NULL COMMENT '第一个输入框标题',
  `gdipt` varchar(255) DEFAULT NULL COMMENT '更多input qq密码 ,大区名称',
  `ord` int(100) DEFAULT '0' COMMENT '排序',
  `is_ste` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0下架 1上架',
  `kuc` int(100) NOT NULL DEFAULT '0' COMMENT '库存',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ys_goods
-- ----------------------------
INSERT INTO `ys_goods` VALUES ('13', '7', '手工商品1', '0.10', '1', '1', '<h3>\r\n	这里是商品详情\r\n</h3>\r\n<p>\r\n	后台可自定义\r\n</p>\r\n<p>\r\n	<img src=\"http://www.faka.com/view/editor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" /><img src=\"http://www.faka.com/view/editor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" style=\"white-space:normal;\" /><img src=\"http://www.faka.com/view/editor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" style=\"white-space:normal;\" /><img src=\"http://www.faka.com/view/editor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" style=\"white-space:normal;\" /><img src=\"http://www.faka.com/view/editor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" style=\"white-space:normal;\" /><img src=\"http://www.faka.com/view/editor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" style=\"white-space:normal;\" /> \r\n</p>', 'QQ号', '', '5', '1', '100');
INSERT INTO `ys_goods` VALUES ('14', '7', '手工商品多输入框1', '0.10', '1', '1', '<span style=\"white-space:nowrap;\">手工商品多输入框1</span>', 'QQ号', '密码', '4', '1', '100');
INSERT INTO `ys_goods` VALUES ('15', '7', '手工商品多输入框2', '0.10', '1', '1', '<span style=\"white-space:nowrap;\">手工商品多输入框2</span><img src=\"http://www.faka.com/view/editor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" />', 'QQ号', '密码,大区', '3', '1', '100');
INSERT INTO `ys_goods` VALUES ('16', '7', '手工商品多输入框3', '0.10', '1', '1', '<span style=\"white-space:nowrap;\">手工商品多输入框3</span>', 'QQ号', '密码,大区,id', '2', '1', '100');
INSERT INTO `ys_goods` VALUES ('17', '7', '手工商品多输入框且不允许重复下单', '0.10', '1', '0', '<h1>\r\n	<span style=\"white-space:nowrap;\">手工商品多输入框且不允许重复下单</span><br />\r\n</h1>', 'QQ号', 'ID,PASSWD,密码,大区', '1', '1', '100');
INSERT INTO `ys_goods` VALUES ('18', '6', '自动发卡商品', '0.10', '0', '1', '<p>\r\n	<span style=\"white-space:nowrap;\">自动发卡商品</span><img src=\"http://www.faka.com/view/editor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" /><img src=\"http://www.faka.com/view/editor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"/upload/image/20180416/20180416082402_34301.jpg\" alt=\"\" /> \r\n</p>', 'QQ号', '', '0', '1', '50');

-- ----------------------------
-- Table structure for ys_kami
-- ----------------------------
DROP TABLE IF EXISTS `ys_kami`;
CREATE TABLE `ys_kami` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `gid` int(100) NOT NULL COMMENT '商品id',
  `kano` varchar(255) NOT NULL COMMENT '卡号',
  `kapwd` varchar(255) DEFAULT NULL COMMENT '卡密',
  `is_ste` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:正常 1:已售',
  `ctime` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ys_kami
-- ----------------------------
INSERT INTO `ys_kami` VALUES ('153', '18', '123233', '444444', '1', '1523867081');
INSERT INTO `ys_kami` VALUES ('152', '18', '123321', '123321', '1', '1523867081');
INSERT INTO `ys_kami` VALUES ('151', '18', '123321', '123321', '1', '1523867081');
INSERT INTO `ys_kami` VALUES ('150', '18', '123233', '444444', '1', '1523867081');
INSERT INTO `ys_kami` VALUES ('154', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('155', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('156', '18', '123233', '444444', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('157', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('158', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('159', '18', '123233', '444444', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('160', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('161', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('162', '18', '123233', '444444', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('163', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('164', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('165', '18', '123233', '444444', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('166', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('167', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('168', '18', '123233', '444444', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('169', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('170', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('171', '18', '123233', '444444', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('172', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('173', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('174', '18', '123233', '444444', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('175', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('176', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('177', '18', '123233', '444444', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('178', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('179', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('180', '18', '123233', '444444', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('181', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('182', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('183', '18', '123233', '444444', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('184', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('185', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('186', '18', '123233', '444444', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('187', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('188', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('189', '18', '123233', '444444', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('190', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('191', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('192', '18', '123233', '444444', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('193', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('194', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('195', '18', '123233', '444444', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('196', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('197', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('198', '18', '123233', '444444', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('199', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('200', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('201', '18', '123233', '444444', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('202', '18', '123321', '123321', '0', '1523867081');
INSERT INTO `ys_kami` VALUES ('203', '18', '123321', '123321', '0', '1523867081');

-- ----------------------------
-- Table structure for ys_mailtpl
-- ----------------------------
DROP TABLE IF EXISTS `ys_mailtpl`;
CREATE TABLE `ys_mailtpl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text,
  `is_state` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cname` (`cname`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ys_mailtpl
-- ----------------------------
INSERT INTO `ys_mailtpl` VALUES ('3', '卡密发送', '您在{sitename}购买的商品已发货', '<p class=\"p1\">\r\n<span class=\"s1\">尊敬的用户您好：</span> \r\n</p>\r\n<p class=\"p1\">\r\n<span class=\"s1\">您在：【{sitename}】 购买的商品：{gname} 已发货。</span> \r\n</p>\r\n<p class=\"p1\">订单号：{orid}</p>\r\n<p class=\"p1\">数量：{ornum}</p>\r\n<p class=\"p1\">金额：{cmoney}</p>\r\n<p class=\"p1\">时间：{ctime}</p>\r\n---------------------------------------------------------------------------------------------------------------------------<br/>\r\n<p class=\"p1\"> \r\n<span class=\"s1\">{orderinfo}</span>\r\n</p> \r\n---------------------------------------------------------------------------------------------------------------------------<br/>\r\n\r\n感谢您的惠顾，祝您生活愉快！<br/>\r\n<p class=\"p1\">\r\n	<span class=\"s1\">来自 <span style=\"white-space:normal;\">{sitename} -{url}</span></span> \r\n</p>', '0', '1523789794');
INSERT INTO `ys_mailtpl` VALUES ('5', '管理员通知', '【{sitename}】新订单等待处理', '<p class=\"p1\">尊敬的管理员：</p>\r\n\r\n<p class=\"p1\">客户购买的商品：【{gname}】 已支付成功，请及时处理。</p>\r\n------------------------------------------<br/>\r\n<p class=\"p1\">订单号：{orid}</p>\r\n<p class=\"p1\">数量：{ornum}</p>\r\n<p class=\"p1\">金额：{cmoney}</p>\r\n<p class=\"p1\">时间：{ctime}</p>\r\n---------------------------------------------<br/>\r\n\r\n<p class=\"p1\">\r\n	<span class=\"s1\">来自 <span style=\"white-space:normal;\">{sitename} -{url}</span></span> \r\n</p>', '0', '1523790269');

-- ----------------------------
-- Table structure for ys_navcog
-- ----------------------------
DROP TABLE IF EXISTS `ys_navcog`;
CREATE TABLE `ys_navcog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ys_navcog
-- ----------------------------
INSERT INTO `ys_navcog` VALUES ('16', '{\"set\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\",\"admins\":\"\\u7ba1\\u7406\\u5458\\u5217\\u8868\",\"orders\":\"\\u8ba2\\u5355\\u5217\\u8868\"}');

-- ----------------------------
-- Table structure for ys_orders
-- ----------------------------
DROP TABLE IF EXISTS `ys_orders`;
CREATE TABLE `ys_orders` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(200) NOT NULL COMMENT '订单id',
  `oname` varchar(255) NOT NULL COMMENT '订单名称',
  `gid` int(100) NOT NULL COMMENT '商品id',
  `omoney` decimal(60,2) NOT NULL DEFAULT '0.00' COMMENT '商品单价',
  `cmoney` decimal(60,2) NOT NULL COMMENT '订单总价',
  `onum` int(100) NOT NULL COMMENT '订单数量',
  `chapwd` varchar(255) DEFAULT NULL COMMENT '查询密码',
  `account` varchar(255) NOT NULL COMMENT '充值账号',
  `otype` tinyint(1) NOT NULL COMMENT '订单类型 0自动发卡 1手工充值',
  `info` text COMMENT '充值详情',
  `payid` varchar(200) DEFAULT NULL COMMENT '第三方支付平台id',
  `paytype` varchar(255) DEFAULT NULL COMMENT '支付方式',
  `ctime` int(100) NOT NULL COMMENT '下单日期',
  `status` tinyint(1) NOT NULL COMMENT '0待付款 1待处理 2已处理 3已完成  4处理失败 5发卡失败',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ys_orders
-- ----------------------------
INSERT INTO `ys_orders` VALUES ('195', 'ys2018041616271791116', '手工商品1x1', '13', '0.10', '0.10', '1', null, '123321', '1', 'QQ号:123321', '2018041616271897678', '手Q扫码', '1523867237', '3');
INSERT INTO `ys_orders` VALUES ('196', 'ys2018041616302074378', '手工商品多输入框1x1', '14', '0.10', '0.10', '1', null, '123321', '1', 'QQ号:123321<br/> 密码:123321', '2018041616302182926', '手Q扫码', '1523867420', '3');
INSERT INTO `ys_orders` VALUES ('197', 'ys2018041616312044661', '手工商品多输入框2x1', '15', '0.10', '0.10', '1', null, '123321', '1', 'QQ号:123321<br/> 密码:123321<br/> 大区:123321', '2018041616312025841', '手Q扫码', '1523867480', '3');
INSERT INTO `ys_orders` VALUES ('198', 'ys2018041616334248193', '手工商品多输入框3x1', '16', '0.10', '0.10', '1', null, '123321', '1', 'QQ号:123321<br/> 密码:123<br/> 大区:123<br/> id:123', '2018041616334693637', '手Q扫码', '1523867622', '3');
INSERT INTO `ys_orders` VALUES ('199', 'ys2018041616345121266', '手工商品多输入框且不允许重复下单x1', '17', '0.10', '0.10', '1', null, '123321', '1', 'QQ号:123321<br/> ID:123321<br/> PASSWD:123321<br/> 密码:123321<br/> 大区:123321', '2018041616345379810', '手Q扫码', '1523867691', '3');
INSERT INTO `ys_orders` VALUES ('200', 'ys2018041616373794565', '自动发卡商品x3', '18', '0.10', '0.30', '3', 'zxc123', '53331323@qq.com', '0', '卡号： 123321 ---- 卡密： 123321<br/>卡号： 123321 ---- 卡密： 123321<br/>卡号： 123233 ---- 卡密： 444444<br/>', '2018041616373892665', '手Q扫码', '1523867857', '3');
