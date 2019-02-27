/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50560
Source Host           : localhost:3306
Source Database       : qq_rbt

Target Server Type    : MYSQL
Target Server Version : 50560
File Encoding         : 65001

Date: 2019-02-25 21:35:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_quest
-- ----------------------------
DROP TABLE IF EXISTS `tb_quest`;
CREATE TABLE `tb_quest` (
  `qid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键(自增),问题ID',
  `from_uid` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '外键,提问者ID',
  `quest_content` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '问题内容',
  `is_QuestValid` bit(1) NOT NULL DEFAULT b'1' COMMENT '0-无效;默认为1-有效',
  `Post_date` datetime NOT NULL,
  PRIMARY KEY (`qid`),
  KEY `fk_quest_user` (`from_uid`),
  CONSTRAINT `fk_quest_user` FOREIGN KEY (`from_uid`) REFERENCES `tb_user` (`uid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
