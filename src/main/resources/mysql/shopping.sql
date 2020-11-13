/*
 Navicat Premium Data Transfer

 Source Server         : mysql8
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : shopping

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 13/11/2020 13:30:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for handle
-- ----------------------------
DROP TABLE IF EXISTS `handle`;
CREATE TABLE `handle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 1,
  `img` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_order` int(11) NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of handle
-- ----------------------------
INSERT INTO `handle` VALUES (1, '电子产品', 1, 1, NULL, 0, '2020-01-02 00:00:00', '2020-03-04 00:00:00');
INSERT INTO `handle` VALUES (2, '食品类', 2, 1, NULL, 0, '2020-01-02 00:00:00', '2020-03-01 00:00:00');
INSERT INTO `handle` VALUES (3, '服务类', 3, 1, NULL, 0, '2020-03-03 00:00:00', '2020-01-06 00:00:00');
INSERT INTO `handle` VALUES (4, '家电', 4, 1, NULL, 0, '2020-03-01 00:00:00', '2020-05-06 00:00:00');
INSERT INTO `handle` VALUES (6, '母婴', 6, 1, NULL, 0, '2020-01-03 00:00:00', '2020-05-06 00:00:00');
INSERT INTO `handle` VALUES (7, '儿童玩具', 7, 1, NULL, 0, '2020-01-02 00:00:00', '2020-03-05 00:00:00');
INSERT INTO `handle` VALUES (10, '电子产品', NULL, 1, '', 211, NULL, '2020-10-23 15:39:53');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle_id` int(11) NULL DEFAULT NULL COMMENT '属于哪个品类',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名',
  `subtitle` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `main_image` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主图',
  `sub_image` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附图',
  `detail` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '细节',
  `price` double(20, 2) NULL DEFAULT NULL COMMENT '价格',
  `stock` int(11) NULL DEFAULT NULL COMMENT '库存',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态 1有效0无效',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 1, '手机1', '手机1', 'preview.jpg', 'bg.png', '手机1111', 3700.00, 100, 100, '2020-03-04 00:00:00', '2020-10-24 14:23:18');
INSERT INTO `product` VALUES (2, 1, '电脑', '电脑', '图片', '图片', '电脑', 7200.00, 100, 1, '2020-03-04 00:00:00', '2020-03-05 00:00:00');
INSERT INTO `product` VALUES (3, 1, '手表', '手表', '图片', ' 图片', ' 手表', 1200.00, 100, 1, '2020-03-01 00:00:00', '2020-03-04 00:00:00');
INSERT INTO `product` VALUES (4, 1, '鼠标', ' 鼠标', ' 图片 ', ' 图片', ' 鼠标', 200.00, 200, 1, '2020-03-05 00:00:00', '2020-04-06 00:00:00');
INSERT INTO `product` VALUES (5, 3, '外套', ' 外套', '图片', ' 图片', ' 外套', 200.00, 200, 1, '2020-03-02 00:00:00', '2020-05-06 00:00:00');
INSERT INTO `product` VALUES (6, 2, ' 辣条', ' 辣条', '图片 ', '图片', ' 辣条', 10.00, 1000, 1, '2020-03-04 00:00:00', '2020-03-08 00:00:00');
INSERT INTO `product` VALUES (16, 2, 'f12', '辣条', '', '', '好吃不贵', 100.00, 123, 1, NULL, '2020-11-07 15:40:29');
INSERT INTO `product` VALUES (17, 10, 'test', 'test', 'test', 'test', 'test', 1000.00, 100, 1, '2020-10-24 14:36:08', '2020-10-24 14:36:08');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `answer` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` int(11) NULL DEFAULT NULL,
  `create_time` timestamp(0) NULL DEFAULT NULL,
  `update_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', '136946818@qq.com', '88888888', 'test', 'test', 1, '2020-10-22 00:00:00', '2020-10-27 13:29:58');
INSERT INTO `user` VALUES (3, 'admin1', '123', '136946818@qq.com', '88888888', 'test', 'test', 0, '2020-10-24 17:41:42', '2020-10-27 13:30:11');

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_district` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_address` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_zip` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES (1, 1, 'admin', '123456', '456456', '河北省', '石家庄市', ' 桥西区', ' 学院路6号', ' 0000', '2020-01-03 00:00:00', '2020-03-01 00:00:00');
INSERT INTO `user_address` VALUES (10, 3, '3', '654321', '654321', '3', '3', '3', '3', '3', NULL, NULL);
INSERT INTO `user_address` VALUES (11, 3, 'new', '20201027', '20201024', '天津', '天津', '武清区', '奥兰际德', '0000', '2020-10-27 13:35:18', NULL);

SET FOREIGN_KEY_CHECKS = 1;
