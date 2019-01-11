/*
Navicat MySQL Data Transfer

Source Server         : javaee
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : pure_music

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-10-25 11:14:10
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'root2018', '123', 'root2018');
INSERT INTO `admin` VALUES ('4', 'qwe', '123', '123');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of composer
-- ----------------------------
INSERT INTO `composer` VALUES ('1', '1', '1', '1', 'niubi', 'qwe', 'asdsa', 'asdasd', '123123');
INSERT INTO `composer` VALUES ('4', '马飞', '654', '64', '65', '564', '654', '654', '65');
INSERT INTO `composer` VALUES ('10', '马飞飞', '2', '2', '2', '2', '2', '2', '2');
INSERT INTO `composer` VALUES ('13', '121212121', '男', '654', null, '645', '564', '56', '654');
INSERT INTO `composer` VALUES ('14', '马飞飞飞', '女', '1231', '123123', '123123', '2131231', '1231', '12');
INSERT INTO `composer` VALUES ('15', '123123', '123', '123', '132123', '32131', '21323', '3223', '122');
INSERT INTO `composer` VALUES ('16', '312231', '男', '654', null, '645', '564', '56', '654');
INSERT INTO `composer` VALUES ('19', '増田俊郎', '男', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=', '增田俊郎（ますだ としろう）是日本电子乐器演奏者、作曲家和音乐监督，在“一世风靡SEPIA”，参加了铃木康博，小林明子，中山美穗，岛田歌穗等许多艺术家的录音工作。似乎还担任了该乐团巡演的舞台监督的工作。', '2018', '日本', '2018', '5000');
INSERT INTO `composer` VALUES ('20', '向晚丶', '', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=', '这年我二十有六，和现实仇深似海 被窝里丢了志气，人群里低头不语 在最值得去奋斗的年纪，从头到脚泛着对理想的崇拜 然后一头扎进洱海，被现实拍打着醒过来 读懂，人的渺小和本质的无奈 庆幸明白不算太晚，感激车站里尚有月台等待 晨起下过雨，心有一片海，细细品过一曲，也终于看开 懂得敬往事一杯酒，敬无所顾忌的少年时代，匆匆有过梦，虽些许遗憾。', '2018', '无', '2018', '3200');
INSERT INTO `composer` VALUES ('21', '六三四', '', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=', '早期火影BGM', '2018', '无', '2018', '4000');
INSERT INTO `composer` VALUES ('22', '高梨康治,刃-yaiba', '男', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=', '高梨康治,刃-yaiba', '2018', '日本', '2018', '600000');
INSERT INTO `composer` VALUES ('23', '高梨康治', '男', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=', '少年时期的高梨康治因酷爱重金属音乐而开始了吉他的练习。在当时，能像Ritchie Blackmore(Deep Purple、rainbow乐队的吉他手)那样无拘无束的活跃在舞台中是他唯一的梦想。不过成年后的他经过一番深思熟虑，最终还是转向了键盘演奏。 1983年4月，刚满20岁的高梨康治与清水保光、铃木顺一两位友人在琦玉县成立了重金属乐队“Hellen”，开始了他的地下乐队生涯。当时乐队主要在关东领域活动，一度与关西成立的重金属乐队“Terra Rosa”齐名，成为摇滚乐迷之间津津乐道的话题。', '1983', '日本', '2018', '800000');
INSERT INTO `composer` VALUES ('24', '雪桜草', '女', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=', '雪桜草とは、KeySoundレーベルの楽曲を中心にアレンジ活動をしている同人音楽サークルである。', '2018', '无', '2018', '50000');
INSERT INTO `composer` VALUES ('25', 'riya', '女', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=', 'Riya（りや、2月18日出生）是日本福冈县出身的女歌手。作品以演唱动漫歌曲为主。在短期大学的音乐科毕业后，因为倾慕新居昭乃，一边就职音乐键盘的讲师，一边与曾是同窗的myu组成“refio“的组合。与グループ空色絵本共同制作同人（M3）为中心的音乐。其后，与菊地创组成了“eufonius”。', '2004', '日本', '2月18日', '560000');
INSERT INTO `composer` VALUES ('26', 'Taylor Davis', '女', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=', '无', '2018', '无', '2018', '30000');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of song
-- ----------------------------
INSERT INTO `song` VALUES ('1', 'サクラのテーマ', '増田俊郎', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=c031adcd-868f-4afe-8402-a6a9517b42a3&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=a8322873-4b70-48d7-9e76-19f31187edc5&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.48858493224051114', '1:56', '2018', '0', '5', '19');
INSERT INTO `song` VALUES ('2', 'Gaara\'s theme', '増田俊郎', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=ac34c767-d506-45f0-9916-cea87432b42a&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=a8322873-4b70-48d7-9e76-19f31187edc5&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.48858493224051114', '1:59', '2018', '0', '3', '19');
INSERT INTO `song` VALUES ('3', '火影 - 宁次之死', '向晚丶', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=433b3bdd-1d55-4423-a195-eb3ac8d35c33&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=a8322873-4b70-48d7-9e76-19f31187edc5&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.48858493224051114', '3:13', '2018', '0', '3', '20');
INSERT INTO `song` VALUES ('4', '夕暮れ', '六三四', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=dce4911f-86d7-4eba-8f63-48cb6367c198&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=fe909390-c0dd-4415-96d8-996ce03e17c6&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.48510885619632704', '1:43', '2018', '0', '10', '21');
INSERT INTO `song` VALUES ('5', '孤独', '六三四', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=c913b2b0-0f05-4c00-8883-80463592b0fc&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=fe909390-c0dd-4415-96d8-996ce03e17c6&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.48510885619632704', '2:6', '2018', '0', '6', '21');
INSERT INTO `song` VALUES ('6', '朝', '六三四', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=3771bd7f-bef2-4c6a-9512-d16c3c6c7f06&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=fe909390-c0dd-4415-96d8-996ce03e17c6&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.48510885619632704', '1:35', '2018', '0', '11', '21');
INSERT INTO `song` VALUES ('7', '哀と愁', '六三四', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=19a8bbe5-a10c-4bbf-a25a-dcc946f0157e&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=fe909390-c0dd-4415-96d8-996ce03e17c6&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.48510885619632704', '2:59', '2018', '0', '3', '21');
INSERT INTO `song` VALUES ('8', '哀と悲', '六三四', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=59287cfe-05ce-4d49-ae3f-5948225c2bf5&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=fe909390-c0dd-4415-96d8-996ce03e17c6&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.48510885619632704', '2:55', '2018', '0', '3', '21');
INSERT INTO `song` VALUES ('9', 'ヒナタvsネジ', '六三四', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=a7297885-317f-4843-9f7a-68241e858dc6&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=fe909390-c0dd-4415-96d8-996ce03e17c6&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.48510885619632704', '3:13', '2018', '0', '6', '21');
INSERT INTO `song` VALUES ('10', '儀礼', '高梨康治,刃-yaiba', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=a11c142f-58c2-4d9d-b0ed-d2129496a568&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=ea5ab9b0-c432-47cf-8af4-76db494af0ba&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.4883429216142907', '2:14', '2018', '0', '8', '22');
INSERT INTO `song` VALUES ('11', '山霞', '高梨康治,刃-yaiba', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=5c5122d3-1a35-4f96-aa5e-51f91e4d4191&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=ea5ab9b0-c432-47cf-8af4-76db494af0ba&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.4883429216142907', '2:32', '2018', '0', '10', '22');
INSERT INTO `song` VALUES ('12', '千夜', '高梨康治,刃-yaiba', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=177993de-f2ff-47a7-af19-3aa32de83f1d&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=ea5ab9b0-c432-47cf-8af4-76db494af0ba&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.4883429216142907', '2:9', '2018', '0', '3', '22');
INSERT INTO `song` VALUES ('13', '彩霞', '高梨康治,刃-yaiba', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=e9ee4758-6edf-497c-beff-60ba42170dcb&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=ea5ab9b0-c432-47cf-8af4-76db494af0ba&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.4883429216142907', '2:14', '2018', '0', '3', '22');
INSERT INTO `song` VALUES ('14', '漂泊', '高梨康治,刃-yaiba', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=9dab13fc-4e0b-4c31-9af3-d28a0301920d&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=ea5ab9b0-c432-47cf-8af4-76db494af0ba&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.4883429216142907', '2:24', '2018', '0', '1', '22');
INSERT INTO `song` VALUES ('15', '落葉船', '高梨康治,刃-yaiba', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=a5f878b1-4e93-40dd-9994-a6af93d804db&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=ea5ab9b0-c432-47cf-8af4-76db494af0ba&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.4883429216142907', '2:10', '2018', '0', '3', '22');
INSERT INTO `song` VALUES ('16', '白映', '高梨康治,刃-yaiba', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=0b601553-ea51-4f77-bcef-3c8c539ad314&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=ea5ab9b0-c432-47cf-8af4-76db494af0ba&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.4883429216142907', '2:47', '2018', '0', '3', '22');
INSERT INTO `song` VALUES ('17', '白詰草', '高梨康治,刃-yaiba', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=6743fe7b-bdab-43e0-bd06-4d91795c403e&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=ea5ab9b0-c432-47cf-8af4-76db494af0ba&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.4883429216142907', '1:56', '2018', '0', '7', '22');
INSERT INTO `song` VALUES ('18', '镇魂歌', '高梨康治', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=b8d3df60-6b64-4fc4-b180-68717c6d9ac9&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8ef1aeac-121b-4a94-91ec-7201f5ef3d46&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.027973860202603174', '1:21', '2018', '0', '3', '23');
INSERT INTO `song` VALUES ('19', '月光譚', '高梨康治', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=9495da50-ef95-4c78-ae86-2c38541c0b6f&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8ef1aeac-121b-4a94-91ec-7201f5ef3d46&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.027973860202603174', '2:3', '2018', '0', '6', '23');
INSERT INTO `song` VALUES ('20', '失意', '高梨康治', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=03c759cf-ad08-466e-b63d-c0997ba5067d&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8ef1aeac-121b-4a94-91ec-7201f5ef3d46&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.027973860202603174', '2:0', '2018', '0', '1', '23');
INSERT INTO `song` VALUES ('21', '落日', '高梨康治', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=16bf6d1a-afa7-4c62-82df-e9fbcd0be82b&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8ef1aeac-121b-4a94-91ec-7201f5ef3d46&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.027973860202603174', '1:55', '2018', '0', '3', '23');
INSERT INTO `song` VALUES ('22', '柔らかな手', '高梨康治', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=e2971950-31fa-43a5-b3d8-96fd4d698873&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8ef1aeac-121b-4a94-91ec-7201f5ef3d46&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.027973860202603174', '3:15', '2018', '0', '4', '23');
INSERT INTO `song` VALUES ('23', '千軍万馬', '高梨康治', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=4575bc33-6607-48fe-acf0-b66e9dfad8fa&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8ef1aeac-121b-4a94-91ec-7201f5ef3d46&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.027973860202603174', '1:51', '2018', '0', '8', '23');
INSERT INTO `song` VALUES ('24', '空蝉', '高梨康治', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=037fae6f-e0df-4067-b082-7c56ca0c0932&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8ef1aeac-121b-4a94-91ec-7201f5ef3d46&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.027973860202603174', '2:55', '2018', '0', '6', '23');
INSERT INTO `song` VALUES ('25', '帰郷', '高梨康治', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=960ae670-7804-45f5-b97d-b526f65d88c9&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8ef1aeac-121b-4a94-91ec-7201f5ef3d46&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.027973860202603174', '1:50', '2018', '0', '5', '23');
INSERT INTO `song` VALUES ('26', '古今無双', '高梨康治', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=d165e53a-7197-4993-9c74-3a1b2318ba4b&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8ef1aeac-121b-4a94-91ec-7201f5ef3d46&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.027973860202603174', '1:37', '2018', '0', '5', '23');
INSERT INTO `song` VALUES ('27', '孤独', '高梨康治', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=16575b3f-427f-404f-a1d0-a297612b4f29&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8ef1aeac-121b-4a94-91ec-7201f5ef3d46&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.027973860202603174', '2:6', '2018', '0', '6', '23');
INSERT INTO `song` VALUES ('28', '父と母', '高梨康治', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=ba4a4f73-0b20-408d-83dd-2e013471056d&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8ef1aeac-121b-4a94-91ec-7201f5ef3d46&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.027973860202603174', '3:22', '2018', '0', '7', '23');
INSERT INTO `song` VALUES ('29', '道は続く', '高梨康治', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=caaab9d6-beaa-47a3-9f30-09b0a36d2f02&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8ef1aeac-121b-4a94-91ec-7201f5ef3d46&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.027973860202603174', '2:1', '2018', '0', '1', '23');
INSERT INTO `song` VALUES ('30', '带土的主旋律', '高梨康治', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=9dbb1efa-4bbc-4a6e-bc4a-02a38021727f&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8ef1aeac-121b-4a94-91ec-7201f5ef3d46&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.027973860202603174', '4:17', '2018', '0', '11', '23');
INSERT INTO `song` VALUES ('31', '悲壮', '高梨康治', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=92ca2701-753c-4ae4-bdee-cadfaa867671&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8ef1aeac-121b-4a94-91ec-7201f5ef3d46&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.027973860202603174', '2:30', '2018', '0', '3', '23');
INSERT INTO `song` VALUES ('32', '薄暮', '高梨康治', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=76def59c-186c-424e-b5b4-ea184f368a1a&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8ef1aeac-121b-4a94-91ec-7201f5ef3d46&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.027973860202603174', '1:40', '2018', '0', '3', '23');
INSERT INTO `song` VALUES ('33', '哀鴻遍野', '高梨康治', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=357f786e-9453-4f27-be9a-23d0c68b9737&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8ef1aeac-121b-4a94-91ec-7201f5ef3d46&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.027973860202603174', '2:1', '2018', '0', '3', '23');
INSERT INTO `song` VALUES ('34', 'Another Story', '雪桜草', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=d9aaa31b-6365-4ff3-ab37-5d6d68841e61&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=fff20092-c0a3-47c8-a763-6045b9a636f2&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.9833294691474654', '4:38', '2018', '0', '4', '24');
INSERT INTO `song` VALUES ('35', '渚 ~君と目指した高み、愿いが叶う场所~', '雪桜草', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=d3ecf72d-75ee-4cca-8732-2cc16a80f229&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=fff20092-c0a3-47c8-a763-6045b9a636f2&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.9833294691474654', '6:17', '2018', '0', '4', '24');
INSERT INTO `song` VALUES ('36', '海鳴り', 'riya', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=7b37139d-a246-47b6-99d9-13aa40c35949&checkPermission=true&support=wopi&fileId=6b48f5c9-4593-4b2d-abf1-31106da8994e&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8148b904-08bb-423a-994c-4fdecaa341ff&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.9654126157574519', '5:51', '2018', '0', '3', '25');
INSERT INTO `song` VALUES ('37', 'Sadness and Sorrow (Naruto)', 'Taylor Davis', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=b99a5a49-1353-42d1-ac35-465b3e8fc3bd&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=89ada99b-6fc2-4283-b8de-2ff9a09ae128&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.6917960330817112', '2:45', '2018', '0', '6', '26');
INSERT INTO `song` VALUES ('38', '五月雨', '高梨康治,刃-yaiba', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=04757ecb-20f3-428f-bfe0-ce46d1054a48&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=ea5ab9b0-c432-47cf-8af4-76db494af0ba&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.4883429216142907', '3:27', '2018', '0', '3', '22');
INSERT INTO `song` VALUES ('39', '紅蓮', '高梨康治,刃-yaiba', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=f886fbf9-bb2d-4ac5-980c-ef781b824f9b&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=ea5ab9b0-c432-47cf-8af4-76db494af0ba&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.4883429216142907', '3:53', '2018', '0', '6', '22');
INSERT INTO `song` VALUES ('40', 'オビトのテーマ', '高梨康治', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=56f61c8d-b288-413b-9164-560a86ad33d8&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8ef1aeac-121b-4a94-91ec-7201f5ef3d46&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.027973860202603174', '2:40', '2018', '0', '7', '23');
INSERT INTO `song` VALUES ('41', 'No Home', '高梨康治', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=1d6a6a67-638b-418d-a459-a5bf322c1d59&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8ef1aeac-121b-4a94-91ec-7201f5ef3d46&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.027973860202603174', '2:41', '2018', '0', '3', '23');
INSERT INTO `song` VALUES ('42', 'Clench My Fist', '高梨康治', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=92ac914c-d548-4c10-92d3-813fea6be62c&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=8ef1aeac-121b-4a94-91ec-7201f5ef3d46&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.027973860202603174', '3:10', '2018', '0', '3', '23');
INSERT INTO `song` VALUES ('43', '呜呼、师弟爱', '増田俊郎', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=4e8cecf5-7205-4569-aea3-3705a8e55f76&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=a8322873-4b70-48d7-9e76-19f31187edc5&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.48858493224051114', '3:15', '2018', '0', '10', '19');
INSERT INTO `song` VALUES ('44', '我爱罗的主旋律 - 八音盒', '増田俊郎', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=484fe5a3-3791-4497-b017-f6e3ee98b328&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=a8322873-4b70-48d7-9e76-19f31187edc5&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.48858493224051114', '1:44', '2018', '0', '3', '19');
INSERT INTO `song` VALUES ('45', 'ひとり', '増田俊郎', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=3eacce1a-724f-4436-8590-bf306c6fef2e&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=a8322873-4b70-48d7-9e76-19f31187edc5&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.48858493224051114', '1:43', '2018', '0', '5', '19');
INSERT INTO `song` VALUES ('46', 'ナルトとヒカル~火影と国王~', '増田俊郎', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=d4830405-bd1a-4655-a2f0-7d3bc181fae3&checkPermission=true&support=wopi&fileId=ab4d9006-f5ce-4ce4-98e2-e87b92b0b9e9&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=', 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=&checkPermission=true&support=wopi&fileId=a8322873-4b70-48d7-9e76-19f31187edc5&shareId=8db5d72e-d918-4622-a034-138d4e5e23f6%3Abingosoft&password=&_=0.48858493224051114', '2:11', '2018', '0', '5', '19');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('22', 'ASD21312', '1', '123232QA', '1', '1SDSD@232.COM', '1', '1', null);
INSERT INTO `user` VALUES ('23', '1DSADSD2123', '132', '21WEWEW1234', '1', '1231223@1231.COM', '额额', '非官方', null);
INSERT INTO `user` VALUES ('24', 'dfgh123', '啊啊啊', '1264723451', '的的的', 'sdf@werwerw.com', '水电费', '23', null);
INSERT INTO `user` VALUES ('25', 'dfgh12323', '啊啊啊', '1264723451', '的的的', 'sdf@werwerw.com', '水电费', '23', null);
INSERT INTO `user` VALUES ('26', 'dfgh123232', '啊啊啊', '1264723451', '的的的', 'sdf@werwerw.com', '水电费', '23', null);
INSERT INTO `user` VALUES ('27', 'dfgh1232322', '啊啊啊', '1264723451', '的的的', 'sdf@werwerw.com', '水电费', '23', null);
