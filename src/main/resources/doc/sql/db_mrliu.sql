/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : db_movie

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2018-12-25 22:38:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xtcms_ad
-- ----------------------------
DROP TABLE IF EXISTS `xtcms_ad`;
CREATE TABLE `xtcms_ad` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `pic` varchar(255) NOT NULL,
  `catid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xtcms_ad
-- ----------------------------

-- ----------------------------
-- Table structure for xtcms_link
-- ----------------------------
DROP TABLE IF EXISTS `xtcms_link`;
CREATE TABLE `xtcms_link` (
  `l_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `l_name` varchar(64) NOT NULL DEFAULT '',
  `l_url` varchar(255) NOT NULL DEFAULT '',
  `l_logo` varchar(255) NOT NULL DEFAULT '',
  `l_type` tinyint(1) NOT NULL DEFAULT '0',
  `l_sort` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`l_id`),
  KEY `l_sort` (`l_sort`),
  KEY `l_type` (`l_type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xtcms_link
-- ----------------------------
INSERT INTO `xtcms_link` VALUES ('1', '百度', 'http://baidu.com', '/uploadfile/image/20170906/20170906150330_34645.jpg', '0', '0');

-- ----------------------------
-- Table structure for xtcms_manager
-- ----------------------------
DROP TABLE IF EXISTS `xtcms_manager`;
CREATE TABLE `xtcms_manager` (
  `m_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `m_name` varchar(32) NOT NULL DEFAULT '',
  `m_password` varchar(32) NOT NULL DEFAULT '',
  `m_levels` varchar(32) NOT NULL DEFAULT '',
  `m_random` varchar(32) NOT NULL DEFAULT '',
  `m_status` tinyint(1) NOT NULL DEFAULT '0',
  `m_logintime` int(10) NOT NULL DEFAULT '0',
  `m_loginip` int(10) NOT NULL DEFAULT '0',
  `m_loginnum` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`m_id`),
  KEY `m_status` (`m_status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xtcms_manager
-- ----------------------------
INSERT INTO `xtcms_manager` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'b,c,d,e,f,g,h,i,j', '897de67740645ef418d8915547298d4c', '1', '1503380295', '2130706433', '0');

-- ----------------------------
-- Table structure for xtcms_nav
-- ----------------------------
DROP TABLE IF EXISTS `xtcms_nav`;
CREATE TABLE `xtcms_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `n_name` varchar(255) DEFAULT NULL,
  `n_url` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xtcms_nav
-- ----------------------------
INSERT INTO `xtcms_nav` VALUES ('2', '优惠券', 'http://www.mallzhe.com', '0');
INSERT INTO `xtcms_nav` VALUES ('3', '源码获取', 'https://jq.qq.com/?_wv=1027&k=5fPCP8S', '2');

-- ----------------------------
-- Table structure for xtcms_note
-- ----------------------------
DROP TABLE IF EXISTS `xtcms_note`;
CREATE TABLE `xtcms_note` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `note_name` varchar(20) NOT NULL,
  `note_content` text NOT NULL,
  `inputdate` varchar(11) NOT NULL,
  `uip` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xtcms_note
-- ----------------------------

-- ----------------------------
-- Table structure for xtcms_slideshow
-- ----------------------------
DROP TABLE IF EXISTS `xtcms_slideshow`;
CREATE TABLE `xtcms_slideshow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(255) DEFAULT NULL,
  `s_parent` varchar(255) DEFAULT NULL,
  `s_order` int(11) DEFAULT NULL,
  `s_url` varchar(255) DEFAULT NULL,
  `s_picture` varchar(255) DEFAULT NULL,
  `s_content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xtcms_slideshow
-- ----------------------------
INSERT INTO `xtcms_slideshow` VALUES ('1', '大闹天竺', '1', '1', '/play.php?play=/m/faXoZhH3Qnj7SR.html', '/uploadfile/image/20171229/20171229151457_88988.jpg', null);
INSERT INTO `xtcms_slideshow` VALUES ('2', '红蔷薇', '1', '2', '/play.php?play=/tv/PLJpc07kTGTuNX.html', '/uploadfile/image/20171229/20171229151740_93759.jpg', null);

-- ----------------------------
-- Table structure for xtcms_system
-- ----------------------------
DROP TABLE IF EXISTS `xtcms_system`;
CREATE TABLE `xtcms_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(255) DEFAULT NULL,
  `s_domain` varchar(255) DEFAULT NULL,
  `s_seoname` varchar(255) DEFAULT NULL,
  `s_keywords` varchar(255) DEFAULT NULL,
  `s_description` varchar(255) DEFAULT NULL,
  `s_cache` varchar(255) DEFAULT NULL,
  `s_wei` varchar(255) DEFAULT NULL,
  `s_user` varchar(255) DEFAULT NULL,
  `s_slow` varchar(255) DEFAULT NULL,
  `s_logo` varchar(255) DEFAULT NULL,
  `s_weixin` varchar(255) DEFAULT NULL,
  `s_dashang` varchar(255) DEFAULT NULL,
  `s_mjk` varchar(255) DEFAULT NULL,
  `s_jiekou` text,
  `s_copyright` text,
  `s_changyan` text,
  `s_alipay` varchar(255) DEFAULT NULL,
  `s_appid` varchar(255) DEFAULT NULL,
  `s_appkey` varchar(255) DEFAULT NULL,
  `s_shoukuan` varchar(255) DEFAULT NULL,
  `s_qqun` varchar(255) DEFAULT NULL,
  `s_token` varchar(255) DEFAULT NULL,
  `s_shouquan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xtcms_system
-- ----------------------------
INSERT INTO `xtcms_system` VALUES ('1', '筱瞳影视', 'http://127.0.0.1:8808/', '筱瞳影视 - 在线免费高清电影！', '电影,视频大全,在线高清电影,付费电影,免费电影,电视剧,电影,在线观看,VIP高清电影直播', '筱瞳影视，是专门做电视剧,电影等在线播放服务，本页面提供电影的相关内容。', '0', '0', '0', '0', '/uploadfile/image/20171229/20171229152501_76014.png', '/uploadfile/image/20171229/20171229152702_86220.png', '/uploadfile/image/20171229/20171229153351_12348.png', 'http://17kyun.com/api.php?url=', 'http://www.0335haibo.com/tong.php?url=##http://player.jidiaose.com/supapi/iframe.php?v=##http://api.91exp.com/svip/?url=##https://api.flvsp.com/?url=##http://api.662820.com/xnflv/index.php?url=', '本站提供的最新电影和电视剧资源均系收集于各大视频网站,本站只提供web页面服务,并不提供影片资源存储,也不参与录制、上传<br />\r\n若本站收录的节目无意侵犯了贵司版权，请给网页底部邮箱地址来信,我们会及时处理和回复,谢谢。<br />\r\n管理员邮箱：admin#hez70.com <br />\r\n购买本站程序可联系QQ：4705486547\r\n<div style=\"display:none;\">\r\n<script>\r\nvar _hmt = _hmt || [];\r\n(function() {\r\n  var hm = document.createElement(\"script\");\r\n  hm.src = \"https://hm.baidu.com/hm.js?1b228034eab3f86498adfd4e9d337209\";\r\n  var s = document.getElementsByTagName(\"script\")[0]; \r\n  s.parentNode.insertBefore(hm, s);\r\n})();\r\n</script>\r\n</div>', '', '123', '1234', '12345', '', '', '1222', null);

-- ----------------------------
-- Table structure for xtcms_user
-- ----------------------------
DROP TABLE IF EXISTS `xtcms_user`;
CREATE TABLE `xtcms_user` (
  `u_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `u_qid` varchar(32) NOT NULL DEFAULT '',
  `u_name` varchar(32) NOT NULL DEFAULT '',
  `u_password` varchar(32) NOT NULL DEFAULT '',
  `u_qq` varchar(16) NOT NULL DEFAULT '',
  `u_email` varchar(32) NOT NULL DEFAULT '',
  `u_phone` varchar(16) NOT NULL DEFAULT '',
  `u_status` tinyint(1) NOT NULL DEFAULT '0',
  `u_flag` tinyint(1) NOT NULL DEFAULT '0',
  `u_question` varchar(255) NOT NULL DEFAULT '',
  `u_answer` varchar(255) NOT NULL DEFAULT '',
  `u_group` smallint(6) NOT NULL DEFAULT '0',
  `u_points` smallint(6) NOT NULL DEFAULT '0',
  `u_regtime` char(255) NOT NULL DEFAULT '0',
  `u_logintime` char(255) NOT NULL DEFAULT '0',
  `u_loginnum` smallint(6) NOT NULL DEFAULT '0',
  `u_extend` smallint(6) NOT NULL DEFAULT '0',
  `u_loginip` char(10) NOT NULL DEFAULT '0',
  `u_random` varchar(32) NOT NULL DEFAULT '',
  `u_fav` text,
  `u_plays` text,
  `u_downs` text,
  `u_start` int(10) NOT NULL DEFAULT '0',
  `u_end` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`u_id`),
  KEY `u_group` (`u_group`),
  KEY `u_status` (`u_status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xtcms_user
-- ----------------------------

-- ----------------------------
-- Table structure for xtcms_user_card
-- ----------------------------
DROP TABLE IF EXISTS `xtcms_user_card`;
CREATE TABLE `xtcms_user_card` (
  `c_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `c_number` varchar(16) NOT NULL DEFAULT '',
  `c_pass` varchar(8) NOT NULL DEFAULT '',
  `c_money` smallint(6) NOT NULL DEFAULT '0',
  `c_used` tinyint(1) NOT NULL DEFAULT '0',
  `c_sale` tinyint(1) NOT NULL DEFAULT '0',
  `c_user` varchar(255) DEFAULT '0',
  `c_addtime` int(10) NOT NULL DEFAULT '0',
  `c_usetime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`c_id`),
  KEY `c_used` (`c_used`),
  KEY `c_sale` (`c_sale`),
  KEY `c_user` (`c_user`),
  KEY `c_addtime` (`c_addtime`),
  KEY `c_usetime` (`c_usetime`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xtcms_user_card
-- ----------------------------
INSERT INTO `xtcms_user_card` VALUES ('52', '9FPuOZ0yYoE1', '', '100', '0', '0', '0', '1517219794', '0');
INSERT INTO `xtcms_user_card` VALUES ('53', 'ogxtk9auq57T', '', '100', '0', '0', '0', '1517219794', '0');
INSERT INTO `xtcms_user_card` VALUES ('54', 'uk3eZMLyGCD8', '', '100', '0', '0', '0', '1517219794', '0');
INSERT INTO `xtcms_user_card` VALUES ('55', 'All8kEnesi2H', '', '100', '0', '0', '0', '1517219794', '0');
INSERT INTO `xtcms_user_card` VALUES ('56', 'ZCICc6xLLh9w', '', '100', '0', '0', '0', '1517219794', '0');
INSERT INTO `xtcms_user_card` VALUES ('57', 'H8DswvTcMVNN', '', '100', '0', '0', '0', '1517219794', '0');
INSERT INTO `xtcms_user_card` VALUES ('58', 'nkaJ5veIPUTi', '', '100', '0', '0', '0', '1517219794', '0');
INSERT INTO `xtcms_user_card` VALUES ('59', 'sQX3amUI7t5k', '', '100', '0', '0', '0', '1517219794', '0');
INSERT INTO `xtcms_user_card` VALUES ('60', 'wi86HM9hr96Q', '', '100', '0', '0', '0', '1517219794', '0');
INSERT INTO `xtcms_user_card` VALUES ('61', 'q1iytReCVcoZ', '', '100', '0', '0', '0', '1517219794', '0');
INSERT INTO `xtcms_user_card` VALUES ('62', 'a16ymMGV5W4z', '', '100', '0', '0', '0', '1517219794', '0');
INSERT INTO `xtcms_user_card` VALUES ('63', 'ijfNa3DfWiNZ', '', '100', '0', '0', '0', '1517219794', '0');
INSERT INTO `xtcms_user_card` VALUES ('64', '78pps5symr92', '', '100', '0', '0', '0', '1517219794', '0');
INSERT INTO `xtcms_user_card` VALUES ('65', '5Xe0BdhQYr9X', '', '100', '0', '0', '0', '1517219794', '0');
INSERT INTO `xtcms_user_card` VALUES ('66', 't9bbjWYGapIP', '', '100', '0', '0', '0', '1517219794', '0');
INSERT INTO `xtcms_user_card` VALUES ('67', 'bX2nMUiLZfP3', '', '100', '0', '0', '0', '1517219794', '0');
INSERT INTO `xtcms_user_card` VALUES ('68', 'vzWYyJ0hiLg4', '', '100', '0', '0', '0', '1517219794', '0');
INSERT INTO `xtcms_user_card` VALUES ('69', '0p0RpomnRFfw', '', '100', '0', '0', '0', '1517219794', '0');
INSERT INTO `xtcms_user_card` VALUES ('70', 'lMciGYodAL8p', '', '100', '0', '0', '0', '1517219794', '0');

-- ----------------------------
-- Table structure for xtcms_user_group
-- ----------------------------
DROP TABLE IF EXISTS `xtcms_user_group`;
CREATE TABLE `xtcms_user_group` (
  `ug_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `ug_name` varchar(32) NOT NULL DEFAULT '',
  `ug_type` varchar(255) NOT NULL DEFAULT '',
  `ug_popedom` varchar(32) NOT NULL DEFAULT '',
  `ug_upgrade` smallint(6) NOT NULL DEFAULT '0',
  `ug_popvalue` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ug_id`),
  KEY `ug_upgrade` (`ug_upgrade`),
  KEY `ug_popvalue` (`ug_popvalue`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xtcms_user_group
-- ----------------------------
INSERT INTO `xtcms_user_group` VALUES ('1', '普通会员', '', '', '0', '1');
INSERT INTO `xtcms_user_group` VALUES ('2', '金牌会员', '', '', '100', '0');

-- ----------------------------
-- Table structure for xtcms_user_pay
-- ----------------------------
DROP TABLE IF EXISTS `xtcms_user_pay`;
CREATE TABLE `xtcms_user_pay` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_order` int(11) NOT NULL DEFAULT '0',
  `p_uid` mediumint(8) NOT NULL DEFAULT '0',
  `p_price` smallint(6) NOT NULL DEFAULT '0',
  `p_time` int(10) NOT NULL DEFAULT '0',
  `p_point` smallint(6) NOT NULL DEFAULT '0',
  `p_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`p_id`),
  KEY `p_order` (`p_order`),
  KEY `p_uid` (`p_uid`),
  KEY `p_status` (`p_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xtcms_user_pay
-- ----------------------------

-- ----------------------------
-- Table structure for xtcms_user_visit
-- ----------------------------
DROP TABLE IF EXISTS `xtcms_user_visit`;
CREATE TABLE `xtcms_user_visit` (
  `uv_id` int(11) NOT NULL AUTO_INCREMENT,
  `uv_uid` int(11) DEFAULT '0',
  `uv_ip` int(10) NOT NULL DEFAULT '0',
  `uv_ly` varchar(128) NOT NULL DEFAULT '',
  `uv_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uv_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xtcms_user_visit
-- ----------------------------

-- ----------------------------
-- Table structure for xtcms_vod
-- ----------------------------
DROP TABLE IF EXISTS `xtcms_vod`;
CREATE TABLE `xtcms_vod` (
  `d_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `d_name` varchar(255) NOT NULL DEFAULT '',
  `d_picture` varchar(255) NOT NULL DEFAULT '',
  `d_jifen` varchar(255) DEFAULT '',
  `d_user` varchar(11) DEFAULT '',
  `d_parent` char(11) NOT NULL DEFAULT '',
  `d_rec` varchar(255) DEFAULT '',
  `d_hot` varchar(255) DEFAULT '',
  `d_content` text,
  `d_seoname` varchar(255) DEFAULT NULL,
  `d_description` varchar(255) DEFAULT NULL,
  `d_keywords` varchar(255) DEFAULT NULL,
  `d_scontent` text,
  `d_zhuyan` varchar(255) DEFAULT NULL,
  `d_pingfen` varchar(255) DEFAULT NULL,
  `d_year` varchar(255) DEFAULT NULL,
  `d_siteid` varchar(20) NOT NULL,
  `d_vodid` int(11) NOT NULL,
  PRIMARY KEY (`d_id`),
  KEY `d_letter` (`d_user`),
  KEY `d_name` (`d_name`),
  KEY `d_enname` (`d_jifen`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xtcms_vod
-- ----------------------------

-- ----------------------------
-- Table structure for xtcms_vod_class
-- ----------------------------
DROP TABLE IF EXISTS `xtcms_vod_class`;
CREATE TABLE `xtcms_vod_class` (
  `c_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `c_name` varchar(64) NOT NULL DEFAULT '',
  `c_pid` smallint(6) NOT NULL DEFAULT '0',
  `c_sort` smallint(6) NOT NULL DEFAULT '0',
  `c_hide` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`c_id`),
  KEY `c_sort` (`c_sort`),
  KEY `c_pid` (`c_pid`),
  KEY `c_hide` (`c_hide`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xtcms_vod_class
-- ----------------------------
INSERT INTO `xtcms_vod_class` VALUES ('1', '电影尝鲜', '0', '1', '0');
INSERT INTO `xtcms_vod_class` VALUES ('2', '电影', '1', '2', '0');
