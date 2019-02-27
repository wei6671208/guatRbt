/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50560
Source Host           : localhost:3306
Source Database       : qq_rbt

Target Server Type    : MYSQL
Target Server Version : 50560
File Encoding         : 65001

Date: 2019-02-25 21:35:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_ans
-- ----------------------------
DROP TABLE IF EXISTS `tb_ans`;
CREATE TABLE `tb_ans` (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键(自增),答案ID',
  `qid` int(11) NOT NULL COMMENT '外键,当前被答问题的ID',
  `uid` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '外键,回答问题的用户的QQ号码',
  `Ans_content` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '答案内容',
  `ans_date` datetime NOT NULL COMMENT '回答时间',
  `Is_accepted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否采纳,默认为0-未采纳',
  PRIMARY KEY (`aid`),
  KEY `fk_ans_quest` (`qid`),
  KEY `fk_ans_user` (`uid`),
  CONSTRAINT `fk_ans_quest` FOREIGN KEY (`qid`) REFERENCES `tb_quest` (`qid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ans_user` FOREIGN KEY (`uid`) REFERENCES `tb_user` (`uid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
