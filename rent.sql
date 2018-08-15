/*
Navicat MySQL Data Transfer

Source Server         : myconnection
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : rent

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-08-15 10:40:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` varchar(255) NOT NULL COMMENT '管理员id',
  `admin_name` varchar(255) NOT NULL COMMENT '管理员名字',
  `admin_pwd` varchar(255) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'lxx', '123');
INSERT INTO `admin` VALUES ('d5c796000db14f5f93c36f89aef7657e', '李小霞', '123');

-- ----------------------------
-- Table structure for `already_rent`
-- ----------------------------
DROP TABLE IF EXISTS `already_rent`;
CREATE TABLE `already_rent` (
  `house_id` varchar(255) NOT NULL COMMENT '房子id',
  `user_id` varchar(255) NOT NULL COMMENT '租客编号',
  `rent_time` date DEFAULT NULL COMMENT '出租时间',
  PRIMARY KEY (`house_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of already_rent
-- ----------------------------
INSERT INTO `already_rent` VALUES ('2fa7638519104eee8adaf576122fb1cc', '72bb2f392ade40e9b69123402d6dd445', '2018-08-09');
INSERT INTO `already_rent` VALUES ('3d60ff720cff4454a2174f31f48c6cf8', '72bb2f392ade40e9b69123402d6dd445', '2018-08-10');
INSERT INTO `already_rent` VALUES ('40e2d9e7fcb1400ba8ff4256d1d96cad', '72bb2f392ade40e9b69123402d6dd445', '2018-08-09');
INSERT INTO `already_rent` VALUES ('53eaee38aebe4b07b18ccbc65c1eda81', '2bdee764797c4c848198b29a1fd5ff5a', '2018-08-04');
INSERT INTO `already_rent` VALUES ('5cc7691720e943ee944af45d647f0895', '72bb2f392ade40e9b69123402d6dd445', '2018-08-04');

-- ----------------------------
-- Table structure for `house`
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `house_id` varchar(255) NOT NULL COMMENT '房屋id',
  `house_name` varchar(255) DEFAULT NULL COMMENT '小区名',
  `house_area` int(11) DEFAULT NULL COMMENT '房屋面积',
  `house_rent` double DEFAULT NULL COMMENT '租金',
  `house_province` varchar(255) DEFAULT NULL COMMENT '省',
  `house_city` varchar(255) DEFAULT NULL COMMENT '市',
  `house_detailaddr` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `house_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `house_status` int(1) DEFAULT NULL COMMENT '0未租；1已租',
  `house_type` varchar(255) DEFAULT NULL COMMENT '房屋类型',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户id',
  `publish_time` date DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`house_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES ('3849d89343dd4fa48f9cd8be59e4f38c', '国际村', '6', '1960', '广东省', '深圳市', '福田区 国际村（合租）', '季付；距地铁1号线(罗宝线）岗厦693米；三天不满意0违约金退租（业主直租、转租、换租、续租除外）', '0', '四室', '2bdee764797c4c848198b29a1fd5ff5a', '2018-08-04');
INSERT INTO `house` VALUES ('3d60ff720cff4454a2174f31f48c6cf8', '西瓜园区', '200', '2000', null, null, '', '', '1', '四室', '72bb2f392ade40e9b69123402d6dd445', '2018-08-10');
INSERT INTO `house` VALUES ('3d8ab4e29b2c40f59c56af9b96c7f2d6', '大冲城市花园', '160', '2850', '广东省', '深圳市', '南山区 科技园', '低楼层 (共39层)；距地铁1号线(罗宝线）高新园977米', '0', '四室', '9242047033604cef88d68b5ff340f449', '2018-08-04');
INSERT INTO `house` VALUES ('40e2d9e7fcb1400ba8ff4256d1d96cad', '喜福汇', '82', '2400', '广东省', '深圳市', '龙岗区 龙岗中心城', '房屋朝向：东南', '0', '三室', '0554609532654ef1b042c6b340316615', '2018-08-04');
INSERT INTO `house` VALUES ('53eaee38aebe4b07b18ccbc65c1eda81', '半岛城邦二期', '86', '11800', '广东省', '深圳市', '南山区 蛇口', '半岛城邦二期，精装三房，家具家电全齐，可直接拎包入住，交通便利、配套好、可享受海景资源。距地铁2号线(蛇口线)东角头469米.低楼层 (共23层)', '0', '三室', '9242047033604cef88d68b5ff340f449', '2018-08-04');
INSERT INTO `house` VALUES ('5cc7691720e943ee944af45d647f0895', '南联新村', '82', '2400', '广东省', '深圳市', '龙岗区 南联', '交通龙岗线龙城广场站,步行859米; ', '1', '两室', '2bdee764797c4c848198b29a1fd5ff5a', '2018-08-04');
INSERT INTO `house` VALUES ('67937ca67d2843c7b983de6cb675a481', '金桂苑', '200', '5000', '广东省', '广州市', '凤岗', '', '0', '四室', '72bb2f392ade40e9b69123402d6dd445', '2018-08-10');
INSERT INTO `house` VALUES ('6b664ab234e44b459fb779347e3b3efa', '龙湖春森彼岸', '70', '5600', '', '惠州市', '', '', '0', '一室一厅', 'd32c59dcb7824e038e1101043b7681bc', '2017-01-01');
INSERT INTO `house` VALUES ('8c7d5fb2b76a42dc8cc08d343585c3df', '诚佳小区', '200', '2000', '广东省', '深圳市', '方兴科技园', '', '1', '四室', '72bb2f392ade40e9b69123402d6dd445', '2018-08-09');
INSERT INTO `house` VALUES ('ed0d0bc0bfcb4c22a7c90d9573dc3897', '锦龙名苑', '85', '2800', '广东省', '深圳市', '龙岗区 南联', '交通龙岗线南联站,步行1096米；2008年建 1梯4户', '0', '两室', '2bdee764797c4c848198b29a1fd5ff5a', '2018-08-04');

-- ----------------------------
-- Table structure for `house_pic`
-- ----------------------------
DROP TABLE IF EXISTS `house_pic`;
CREATE TABLE `house_pic` (
  `pic_id` varchar(255) NOT NULL COMMENT '房屋图片id',
  `house_id` varchar(255) DEFAULT NULL COMMENT '房子id',
  `pic_path` varchar(255) DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`pic_id`),
  KEY `_idx` (`house_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house_pic
-- ----------------------------
INSERT INTO `house_pic` VALUES ('0c5db534c83048eb82b9479c52fc66a4', '3d60ff720cff4454a2174f31f48c6cf8', 'default.jpg');
INSERT INTO `house_pic` VALUES ('1c4b7490a76441709eca27a075d97346', 'ed0d0bc0bfcb4c22a7c90d9573dc3897', '胡斯麒\\ed0d0bc0bfcb4c22a7c90d9573dc3897\\11.jpg');
INSERT INTO `house_pic` VALUES ('1fc10abd47954b6e88f887d2b60dd0a3', '40e2d9e7fcb1400ba8ff4256d1d96cad', '李小霞\\40e2d9e7fcb1400ba8ff4256d1d96cad\\15.jpg');
INSERT INTO `house_pic` VALUES ('23127372b1a1498ab1ac2bad3a39b3d1', '53eaee38aebe4b07b18ccbc65c1eda81', '张力\\53eaee38aebe4b07b18ccbc65c1eda81\\18.jpg');
INSERT INTO `house_pic` VALUES ('29b3a23f12cb4e84bd099d610ae9392a', '2ea8572db30a4dff86f7c9a878258c1b', 'default.jpg');
INSERT INTO `house_pic` VALUES ('385bd65bd4f840dc9e1accc5f420188e', '2fa7638519104eee8adaf576122fb1cc', '胡斯麒\\2fa7638519104eee8adaf576122fb1cc\\2.jpg');
INSERT INTO `house_pic` VALUES ('3a3e536d930149319ced4e8c6cf670ea', '40e2d9e7fcb1400ba8ff4256d1d96cad', '李小霞\\40e2d9e7fcb1400ba8ff4256d1d96cad\\14.jpg');
INSERT INTO `house_pic` VALUES ('4261a881e3ac4e1daee8cd74da95118d', '8c7d5fb2b76a42dc8cc08d343585c3df', '熊珍珍\\8c7d5fb2b76a42dc8cc08d343585c3df\\2d98db2c-d958-4aed-a1ec-f44c09ab95bc.jpg');
INSERT INTO `house_pic` VALUES ('564ac7977de3434aa08fbf5623fd302a', '3849d89343dd4fa48f9cd8be59e4f38c', '胡斯麒\\3849d89343dd4fa48f9cd8be59e4f38c\\6.jpg');
INSERT INTO `house_pic` VALUES ('5bacea93e3d74f54b4c0742b85f7d0a2', '53eaee38aebe4b07b18ccbc65c1eda81', '张力\\53eaee38aebe4b07b18ccbc65c1eda81\\19.jpg');
INSERT INTO `house_pic` VALUES ('5d410d7577e14d16b4da179710f6522c', '3849d89343dd4fa48f9cd8be59e4f38c', '胡斯麒\\3849d89343dd4fa48f9cd8be59e4f38c\\5.jpg');
INSERT INTO `house_pic` VALUES ('5ecde195c72a43e38c801c39a9268e3b', '53eaee38aebe4b07b18ccbc65c1eda81', '张力\\53eaee38aebe4b07b18ccbc65c1eda81\\17.jpg');
INSERT INTO `house_pic` VALUES ('5ee04b640b9f419d90dfedf95ced52a6', '2fa7638519104eee8adaf576122fb1cc', '胡斯麒\\2fa7638519104eee8adaf576122fb1cc\\3.jpg');
INSERT INTO `house_pic` VALUES ('62062fc873c44d0786f3b290b4d5543f', '8c7d5fb2b76a42dc8cc08d343585c3df', '熊珍珍\\8c7d5fb2b76a42dc8cc08d343585c3df\\1.jpg');
INSERT INTO `house_pic` VALUES ('64303efdc5cd4a42ad469398aec89aa4', '8c7d5fb2b76a42dc8cc08d343585c3df', '熊珍珍\\8c7d5fb2b76a42dc8cc08d343585c3df\\3.jpg');
INSERT INTO `house_pic` VALUES ('669ab8a72d3d40c0a29bab35bea8eb56', '7689b10082694519bde5e4f218b781ba', 'default.jpg');
INSERT INTO `house_pic` VALUES ('6951cbfb4736421ca72c0a9e04433133', '2ea8572db30a4dff86f7c9a878258c1b', '李小霞\\2ea8572db30a4dff86f7c9a878258c1b\\g4.jpg');
INSERT INTO `house_pic` VALUES ('6da705fa6dbb4d40bc98a4ed3635d4ac', '8c7d5fb2b76a42dc8cc08d343585c3df', '熊珍珍\\8c7d5fb2b76a42dc8cc08d343585c3df\\2.jpg');
INSERT INTO `house_pic` VALUES ('6e517de2c6e949e19148758bc2fa5ae5', '53eaee38aebe4b07b18ccbc65c1eda81', '张力\\53eaee38aebe4b07b18ccbc65c1eda81\\20.png');
INSERT INTO `house_pic` VALUES ('726ae2d9198b4cdea031a8642a91174e', '3d8ab4e29b2c40f59c56af9b96c7f2d6', '张力\\3d8ab4e29b2c40f59c56af9b96c7f2d6\\24.jpg');
INSERT INTO `house_pic` VALUES ('72b74138e7d44a3c971674a6185e76d0', '591f22f0b40d4bea8242b3b589da00a9', '刘依\\591f22f0b40d4bea8242b3b589da00a9\\d13.jpg');
INSERT INTO `house_pic` VALUES ('7340e1a3c92e4eaab2af23f8d9ad516f', 'ac37718c3cf84674a605a5de0ee25755', '熊珍珍\\ac37718c3cf84674a605a5de0ee25755\\d13.jpg');
INSERT INTO `house_pic` VALUES ('7815a1ed9ac84153aa1d79568f9d6047', '40e2d9e7fcb1400ba8ff4256d1d96cad', '李小霞\\40e2d9e7fcb1400ba8ff4256d1d96cad\\12.jpg');
INSERT INTO `house_pic` VALUES ('7dd4c2f397f04c17bc6b4740b8417a57', '3d8ab4e29b2c40f59c56af9b96c7f2d6', '张力\\3d8ab4e29b2c40f59c56af9b96c7f2d6\\25.png');
INSERT INTO `house_pic` VALUES ('82cbdb77a16649fa8758eff839b131f4', '591f22f0b40d4bea8242b3b589da00a9', 'default.jpg');
INSERT INTO `house_pic` VALUES ('9264969f9da945ee868264dfa6f7729f', '2fa7638519104eee8adaf576122fb1cc', '胡斯麒\\2fa7638519104eee8adaf576122fb1cc\\1.jpg');
INSERT INTO `house_pic` VALUES ('9d9377e5e7854ad9889b734176f92c50', '3849d89343dd4fa48f9cd8be59e4f38c', '胡斯麒\\3849d89343dd4fa48f9cd8be59e4f38c\\4.jpg');
INSERT INTO `house_pic` VALUES ('a3713e74de604ab787c6525b5b380b86', '53eaee38aebe4b07b18ccbc65c1eda81', '张力\\53eaee38aebe4b07b18ccbc65c1eda81\\21.png');
INSERT INTO `house_pic` VALUES ('a3b165d7634747cfaef6f5c2acf4bdc4', 'ed0d0bc0bfcb4c22a7c90d9573dc3897', '胡斯麒\\ed0d0bc0bfcb4c22a7c90d9573dc3897\\9.jpg');
INSERT INTO `house_pic` VALUES ('afd19fcd3d4f4c17ba3c484c1068f135', '67937ca67d2843c7b983de6cb675a481', '林玉殒\\67937ca67d2843c7b983de6cb675a481\\1.jpg');
INSERT INTO `house_pic` VALUES ('b04695ce121c44988e1c330a78936033', 'ed0d0bc0bfcb4c22a7c90d9573dc3897', '胡斯麒\\ed0d0bc0bfcb4c22a7c90d9573dc3897\\8.jpg');
INSERT INTO `house_pic` VALUES ('b1b0e9312b01452f941cd4336b8b73e0', '67937ca67d2843c7b983de6cb675a481', '林玉殒\\67937ca67d2843c7b983de6cb675a481\\2.jpg');
INSERT INTO `house_pic` VALUES ('b31711dc3f894fa7846213899f51ff7a', 'ac37718c3cf84674a605a5de0ee25755', '熊珍珍\\ac37718c3cf84674a605a5de0ee25755\\d1.jpg');
INSERT INTO `house_pic` VALUES ('b7c5a9ce6e0043dfa273f1c48b704881', 'f8989f00f139477ba13cad04f8ab044b', 'default.jpg');
INSERT INTO `house_pic` VALUES ('bebcad133f8949cea4769b235b6863cb', 'ac37718c3cf84674a605a5de0ee25755', '熊珍珍\\ac37718c3cf84674a605a5de0ee25755\\b2.jpg');
INSERT INTO `house_pic` VALUES ('c0a03d09b7fd4c2aaa75b09208ce5a87', '53eaee38aebe4b07b18ccbc65c1eda81', '张力\\53eaee38aebe4b07b18ccbc65c1eda81\\20.jpg');
INSERT INTO `house_pic` VALUES ('cb2f33e37cf040349b660cce7f9db867', 'ed0d0bc0bfcb4c22a7c90d9573dc3897', '胡斯麒\\ed0d0bc0bfcb4c22a7c90d9573dc3897\\10.jpg');
INSERT INTO `house_pic` VALUES ('cd27c728822944178b90ad2764659361', '3d8ab4e29b2c40f59c56af9b96c7f2d6', '张力\\3d8ab4e29b2c40f59c56af9b96c7f2d6\\23.jpg');
INSERT INTO `house_pic` VALUES ('da6545b6ae594a13a9589f75a3b628b5', '67937ca67d2843c7b983de6cb675a481', '林玉殒\\67937ca67d2843c7b983de6cb675a481\\3.jpg');
INSERT INTO `house_pic` VALUES ('da94c9f6480443b4960cc1a55ce87fd0', '5cc7691720e943ee944af45d647f0895', '胡斯麒\\5cc7691720e943ee944af45d647f0895\\7.jpg');
INSERT INTO `house_pic` VALUES ('e444f43e4d3f448eb44e924893a03731', '40e2d9e7fcb1400ba8ff4256d1d96cad', '李小霞\\40e2d9e7fcb1400ba8ff4256d1d96cad\\16.jpg');
INSERT INTO `house_pic` VALUES ('ebc2f3dfd8fb4507a73b41088964eae6', '40e2d9e7fcb1400ba8ff4256d1d96cad', '李小霞\\40e2d9e7fcb1400ba8ff4256d1d96cad\\13.jpg');
INSERT INTO `house_pic` VALUES ('ed0bf9bbe8df49bab2f7b3a56e465f25', '3d8ab4e29b2c40f59c56af9b96c7f2d6', '张力\\3d8ab4e29b2c40f59c56af9b96c7f2d6\\22.jpg');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL COMMENT '用户id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户姓名',
  `user_pwd` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `user_phone` varchar(255) DEFAULT NULL COMMENT '用户电话',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0554609532654ef1b042c6b340316615', '李达域', '123', '13699503845');
INSERT INTO `user` VALUES ('2bdee764797c4c848198b29a1fd5ff5a', '胡群', '123', '17770046774');
INSERT INTO `user` VALUES ('72bb2f392ade40e9b69123402d6dd445', '林玉殒', '123', '13576063202');
INSERT INTO `user` VALUES ('9242047033604cef88d68b5ff340f449', '张力', '123', '13699874563');
INSERT INTO `user` VALUES ('d32c59dcb7824e038e1101043b7681bc', '张天宇', '123', '1507006049');
