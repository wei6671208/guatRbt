/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50560
Source Host           : localhost:3306
Source Database       : qq_rbt

Target Server Type    : MYSQL
Target Server Version : 50560
File Encoding         : 65001

Date: 2019-02-25 21:32:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `uid` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '主键,以QQ号码为值',
  `pwd` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '生成6位随机数作为pwd',
  `nick_name` varchar(40) CHARACTER SET utf8 NOT NULL COMMENT '用户昵称',
  `credits` int(11) NOT NULL DEFAULT '10' COMMENT '默认送10积分',
  `gid` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '外键,所属群',
  `is_freashman` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否第一次发信,默认值: 1',
  `is_UserValid` bit(1) NOT NULL DEFAULT b'1' COMMENT '账号是否有效:',
  PRIMARY KEY (`uid`),
  KEY `fk_user_group` (`gid`),
  CONSTRAINT `fk_user_group` FOREIGN KEY (`gid`) REFERENCES `tb_group` (`gid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
