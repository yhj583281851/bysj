/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : property

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2018-12-08 12:58:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_account` varchar(25) DEFAULT NULL COMMENT '用户账号',
  `user_password` varchar(25) DEFAULT NULL COMMENT '用户密码',
  `user_name` varchar(25) DEFAULT NULL COMMENT '用户姓名',
  `user_sex` varchar(10) DEFAULT NULL COMMENT '用户性别',
  `user_age` int(3) DEFAULT NULL COMMENT '用户年龄',
  `user_address` varchar(50) DEFAULT NULL COMMENT '用户住址',
  `user_phone` int(15) DEFAULT NULL COMMENT '用户电话',
  `user_type` int(2) DEFAULT '2' COMMENT '用户类型：0-管理员，1-住户，2-游客',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1231', '321', '马飞', '男', '12', '12栋304', '123123', '2');
INSERT INTO `user` VALUES ('2', '1231', '12312', '卢本伟', '男', '13', 'CTV', '123', '2');
INSERT INTO `user` VALUES ('3', '323', '22', '蛇哥', '男', '14', 'qq', '123', '2');
