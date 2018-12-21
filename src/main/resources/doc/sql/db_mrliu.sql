/*
Navicat MySQL Data Transfer

Source Server         : 172.18.18.203
Source Server Version : 50723
Source Host           : 172.18.18.203:23306
Source Database       : db_mrliu

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-12-21 08:49:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for t_ckplayer_video
-- ----------------------------
DROP TABLE IF EXISTS `t_ckplayer_video`;
CREATE TABLE `t_ckplayer_video` (
  `id` int(11) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ckplayer_video
-- ----------------------------
INSERT INTO `t_ckplayer_video` VALUES ('1', 'http://img.ksbbs.com/asset/Mon_1703/05cacb4e02f9d9e.mp4', 'video/mp4', '中文标清', '0', '我的梦', '音乐MV', '就是一段音乐啊', null);
INSERT INTO `t_ckplayer_video` VALUES ('2', 'http://vjs.zencdn.net/v/oceans.mp4', 'video/mp4', '中文高清', '0', '动物世界', '视频', '就是小动物们', null);
INSERT INTO `t_ckplayer_video` VALUES ('3', 'http://img.ksbbs.com/asset/Mon_1703/eb048d7839442d0.mp4', 'video/mp4', '英文高清', '10', '我的梦', '音乐MV', '就是一段音乐啊', null);
INSERT INTO `t_ckplayer_video` VALUES ('4', 'http://img.ksbbs.com/asset/Mon_1703/d30e02a5626c066.mp4', 'video/mp4', '英文超清', '0', '我的梦', '音乐MV', '就是一段音乐啊', null);
INSERT INTO `t_ckplayer_video` VALUES ('5', 'https://media.w3.org/2010/05/sintel/trailer.mp4', 'video/mp4', '英文超清', '4', '动漫', '动漫', '动漫动漫', null);
INSERT INTO `t_ckplayer_video` VALUES ('6', 'http://www.w3school.com.cn/example/html5/mov_bbb.mp4', 'video/mp4', '英文超清', '0', '动漫', '动漫', '动漫', null);
INSERT INTO `t_ckplayer_video` VALUES ('8', 'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4', 'video/mp4', '中文高清', '0', '动漫', '动漫', '动漫', null);
INSERT INTO `t_ckplayer_video` VALUES ('9', 'http://img.ksbbs.com/asset/Mon_1605/0ec8cc80112a2d6.mp4', 'video/mp4', '中文高清', '1', '大圣归来', '从前的我', '西游记之《大圣归来》主题曲', null);
