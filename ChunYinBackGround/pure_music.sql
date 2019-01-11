/*
Navicat MySQL Data Transfer

Source Server         : cys
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : pure_music

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-10-23 16:58:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_account` varchar(50) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_password` varchar(50) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_id` int(4) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  KEY `class_name` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('3', '伤感');
INSERT INTO `class` VALUES ('8', '兴奋');
INSERT INTO `class` VALUES ('6', '孤独');
INSERT INTO `class` VALUES ('1', '安静');
INSERT INTO `class` VALUES ('9', '快乐');
INSERT INTO `class` VALUES ('10', '思念');
INSERT INTO `class` VALUES ('7', '感动');
INSERT INTO `class` VALUES ('5', '放松');
INSERT INTO `class` VALUES ('4', '治愈');
INSERT INTO `class` VALUES ('2', '浪漫');
INSERT INTO `class` VALUES ('11', '清新');

-- ----------------------------
-- Table structure for `composer`
-- ----------------------------
DROP TABLE IF EXISTS `composer`;
CREATE TABLE `composer` (
  `composer_id` int(12) NOT NULL AUTO_INCREMENT,
  `composer_name` varchar(50) NOT NULL,
  `composer_sex` varchar(4) DEFAULT NULL,
  `composer_image_url` varchar(500) DEFAULT NULL,
  `composer_introduction` text,
  `composer_departure_time` varchar(20) DEFAULT NULL,
  `composer_address` varchar(100) DEFAULT NULL,
  `composer_birthday` varchar(20) DEFAULT NULL,
  `composer_hits` int(20) DEFAULT NULL,
  PRIMARY KEY (`composer_id`),
  KEY `singer_name` (`composer_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of composer
-- ----------------------------

-- ----------------------------
-- Table structure for `sheet`
-- ----------------------------
DROP TABLE IF EXISTS `sheet`;
CREATE TABLE `sheet` (
  `sheet_id` int(12) NOT NULL AUTO_INCREMENT,
  `sheet_name` varchar(50) DEFAULT NULL,
  `sheet_image_url` varchar(500) DEFAULT NULL,
  `sheet_song_nums` int(10) DEFAULT '0',
  `sheet_list` text,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`sheet_id`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `sheet_id` (`sheet_id`),
  CONSTRAINT `sheet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sheet
-- ----------------------------

-- ----------------------------
-- Table structure for `sheet_comments`
-- ----------------------------
DROP TABLE IF EXISTS `sheet_comments`;
CREATE TABLE `sheet_comments` (
  `comment_id` int(8) NOT NULL AUTO_INCREMENT,
  `comment_content` text,
  `user_id` int(12) NOT NULL,
  `to_uid` int(12) DEFAULT NULL,
  `comment_time` varchar(20) DEFAULT NULL,
  `sheet_id` int(12) NOT NULL,
  PRIMARY KEY (`comment_id`,`user_id`,`sheet_id`),
  KEY `sheet_id` (`sheet_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sheet_comments_ibfk_2` FOREIGN KEY (`sheet_id`) REFERENCES `sheet` (`sheet_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sheet_comments_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sheet_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `song`
-- ----------------------------
DROP TABLE IF EXISTS `song`;
CREATE TABLE `song` (
  `song_id` int(12) NOT NULL AUTO_INCREMENT,
  `song_name` varchar(50) DEFAULT NULL,
  `composer_name` varchar(50) DEFAULT NULL,
  `song_url` varchar(500) DEFAULT NULL,
  `song_image_url` varchar(500) DEFAULT NULL,
  `song_time` varchar(20) DEFAULT NULL,
  `song_issue_date` varchar(20) DEFAULT NULL,
  `song_hits` int(20) DEFAULT '0',
  `class_id` int(4) DEFAULT NULL,
  `composer_id` int(12) DEFAULT NULL,
  PRIMARY KEY (`song_id`),
  KEY `class_id` (`class_id`),
  KEY `composer_id` (`composer_id`),
  CONSTRAINT `song_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `song_ibfk_2` FOREIGN KEY (`composer_id`) REFERENCES `composer` (`composer_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of song
-- ----------------------------
INSERT INTO `song` VALUES ('32', '海鳴り', 'riya', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=7b37139d-a246-47b6-99d9-13aa40c35949&checkPermission=true&support=wopi&fileId=6b48f5c9-4593-4b2d-abf1-31106da8994e&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'https://i.loli.net/2018/10/15/5bc44b5fd067e.png', null, null, null, null, null);

-- ----------------------------
-- Table structure for `song_comments`
-- ----------------------------
DROP TABLE IF EXISTS `song_comments`;
CREATE TABLE `song_comments` (
  `comment_id` int(8) NOT NULL AUTO_INCREMENT,
  `comment_content` text,
  `user_id` int(12) NOT NULL,
  `to_uid` int(12) DEFAULT NULL,
  `comment_time` varchar(20) DEFAULT NULL,
  `song_id` int(12) NOT NULL,
  PRIMARY KEY (`comment_id`,`user_id`,`song_id`),
  KEY `song_id` (`song_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `song_comments_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `song_comments_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of song_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(12) NOT NULL AUTO_INCREMENT,
  `user_account` varchar(20) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_password` varchar(20) NOT NULL,
  `user_sex` varchar(4) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_introduction` text,
  `user_phone` varchar(11) DEFAULT NULL,
  `sheet_id_list` text,
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'a001', '111', '123456', null, '704451646@qq.com', '1234598陈啊', null, null);
INSERT INTO `user` VALUES ('2', 'a002', '222', '123', null, '583281851@qq.com', null, null, null);
INSERT INTO `user` VALUES ('3', 'a003', '333', '123', null, '13537124851@163.com', null, null, null);
INSERT INTO `user` VALUES ('4', 'a004', '444', '123', null, null, null, null, null);
INSERT INTO `user` VALUES ('5', 'a005', '555', '123', null, null, null, null, null);
INSERT INTO `user` VALUES ('6', 'a006', '666', '123', null, null, null, null, null);
INSERT INTO `user` VALUES ('7', 'a007', '777', '123', null, null, null, null, null);
INSERT INTO `user` VALUES ('8', 'a008', '888', '123', null, null, null, null, null);
INSERT INTO `user` VALUES ('9', 'a009', '999', '123', null, null, null, null, null);
INSERT INTO `user` VALUES ('10', 'a000', '000', '123', null, null, null, null, null);
INSERT INTO `user` VALUES ('11', 'a001', '111', '123', null, null, null, null, null);
INSERT INTO `user` VALUES ('12', 'a002', '222', '123', null, null, null, null, null);
INSERT INTO `user` VALUES ('13', 'a003', '333', '123', null, null, null, null, null);
INSERT INTO `user` VALUES ('14', 'a004', '444', '123', null, null, null, null, null);
INSERT INTO `user` VALUES ('15', 'a005', '555', '123', null, null, null, null, null);
INSERT INTO `user` VALUES ('16', 'a006', '666', '123', null, null, null, null, null);
INSERT INTO `user` VALUES ('17', 'a007', '777', '123', null, null, null, null, null);
INSERT INTO `user` VALUES ('18', 'a008', '888', '123', null, null, null, null, null);
INSERT INTO `user` VALUES ('19', 'a009', '999', '123', null, null, null, null, null);
INSERT INTO `user` VALUES ('20', 'a000', '000', '123', null, null, null, null, null);
INSERT INTO `user` VALUES ('21', 'a111', '32123', '1123445', '1', '489918', '1561987191a56d1ad65wa1da', '1231324', null);
