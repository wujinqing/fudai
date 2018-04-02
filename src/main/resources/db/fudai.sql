/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50146
Source Host           : localhost:3306
Source Database       : fudai

Target Server Type    : MYSQL
Target Server Version : 50146
File Encoding         : 65001

Date: 2018-04-02 18:10:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('16', '香槟金', '宇晖尊贵系列卫浴门', '900', 'YH-8226', '樘');
INSERT INTO `product` VALUES ('14', '木纹转印', '福代防盗门(标配21号拉手)', '1680', 'FD-918', '樘');
INSERT INTO `product` VALUES ('15', '印度孔雀木', '古斯特防盗门(惠氏智能锁)', '4100', 'GST-116', '樘');

-- ----------------------------
-- Table structure for sale_order
-- ----------------------------
DROP TABLE IF EXISTS `sale_order`;
CREATE TABLE `sale_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actual_price` varchar(255) DEFAULT NULL,
  `crt_dt` bigint(20) DEFAULT NULL,
  `customer_address` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_phone_number` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `deposit` varchar(255) DEFAULT NULL,
  `loans_price` varchar(255) DEFAULT NULL,
  `order_no` varchar(255) DEFAULT NULL,
  `original_price` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale_order
-- ----------------------------
INSERT INTO `sale_order` VALUES ('22', '5280', '0', '上海市', '吴晋清', '15021083134', '2018年03月27日', '1000', '3000', '2018032701', '5280');

-- ----------------------------
-- Table structure for sale_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `sale_order_detail`;
CREATE TABLE `sale_order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actual_price` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `order_no` varchar(255) DEFAULT NULL,
  `original_price` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbcu565mki7ihcophnc6jdw3dx` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale_order_detail
-- ----------------------------
INSERT INTO `sale_order_detail` VALUES ('4', '900', '1', '香槟金', '宇晖尊贵系列卫浴门', '2018032701', '900', '900', 'YH-8226', '樘', '22');
INSERT INTO `sale_order_detail` VALUES ('5', '2700', '3', '香槟金', '宇晖尊贵系列卫浴门', '2018032701', '2700', '900', 'YH-8226', '樘', '22');
INSERT INTO `sale_order_detail` VALUES ('6', '1680', '1', '木纹转印', '福代防盗门(标配21号拉手)', '2018032701', '1680', '1680', 'FD-918', '樘', '22');
