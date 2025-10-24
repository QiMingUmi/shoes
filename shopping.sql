/*
 Navicat Premium Data Transfer

 Source Server         : db_renting
 Source Server Type    : MySQL
 Source Server Version : 80043
 Source Host           : 127.0.0.1:3306
 Source Schema         : shopping

 Target Server Type    : MySQL
 Target Server Version : 80043
 File Encoding         : 65001

 Date: 22/09/2025 23:08:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `aid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `acount` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '账号',
  `apwd` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '密码',
  `a_pcid` int UNSIGNED NULL DEFAULT NULL COMMENT 'permission外键orm',
  `aremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  `permission_id` int UNSIGNED NOT NULL COMMENT 'permission外键',
  PRIMARY KEY (`aid`) USING BTREE,
  INDEX `FK_admins_pcid`(`a_pcid` ASC) USING BTREE,
  CONSTRAINT `FK_admins_pcid` FOREIGN KEY (`a_pcid`) REFERENCES `permission` (`perid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '后台用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (2, 'root', 'root', 1, '超级管理员', 1);
INSERT INTO `admins` VALUES (3, 'guanli1', 'admin', 1, '管理1', 1);
INSERT INTO `admins` VALUES (4, 'dingdan1', 'admin', 2, NULL, 2);
INSERT INTO `admins` VALUES (5, 'ads1', '111111', 3, '广告管理员', 3);
INSERT INTO `admins` VALUES (15, 'ads2', '222222', 2, NULL, 2);
INSERT INTO `admins` VALUES (19, 'dingdan2', '111111', 2, '管理订单', 2);
INSERT INTO `admins` VALUES (20, 'qixuan1', '111111', 4, '', 4);

-- ----------------------------
-- Table structure for ads
-- ----------------------------
DROP TABLE IF EXISTS `ads`;
CREATE TABLE `ads`  (
  `adid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `adcompany` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '公司名称',
  `adimage` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '广告图片',
  `adlink` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '广告链接',
  `adtime` datetime NOT NULL COMMENT '到期时间',
  `adincome` float NOT NULL DEFAULT 0 COMMENT '广告收入',
  `adremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  PRIMARY KEY (`adid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '广告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ads
-- ----------------------------
INSERT INTO `ads` VALUES (2, '阿迪达斯', '112380345017593.jpg', 'www.adidas.com', '2015-12-29 00:00:00', 0, NULL);
INSERT INTO `ads` VALUES (3, '李宁', '112582120492688.jpg', 'www.e-lining.com', '2015-12-28 00:00:00', 0, NULL);
INSERT INTO `ads` VALUES (4, 'Under Armour', '112714933177820.jpg', 'www.underarmour.com', '2015-12-31 00:00:00', 0, NULL);
INSERT INTO `ads` VALUES (5, '安踏', '24200124525488.jpg', 'www.anta.com', '2015-12-31 00:00:00', 50000000, '年费');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `bid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bname` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '品牌名称',
  `bsex` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL DEFAULT '男' COMMENT '男鞋女鞋',
  `bstate` int UNSIGNED NOT NULL COMMENT '是否上线品牌',
  `bremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '鞋品牌表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES (1, '耐克', '男', 0, '               	                 	  \r\n               	  \r\n               	  ');
INSERT INTO `brands` VALUES (2, '阿迪达斯', '', 0, '                                                                                                                                                                                无\r\n                                        \r\n                                        \r\n                                        \r\n                                        \r\n                                        ');
INSERT INTO `brands` VALUES (3, '匡威', '男', 0, NULL);
INSERT INTO `brands` VALUES (4, '李宁', '男', 0, NULL);
INSERT INTO `brands` VALUES (5, '鸿星尔克', '男', 0, NULL);
INSERT INTO `brands` VALUES (6, '彪马', '男', 0, NULL);
INSERT INTO `brands` VALUES (7, '美津浓', '', 0, NULL);
INSERT INTO `brands` VALUES (8, '361°', '男', 0, NULL);
INSERT INTO `brands` VALUES (9, '安踏', '女', 0, NULL);
INSERT INTO `brands` VALUES (10, '达芙妮', '女', 0, NULL);
INSERT INTO `brands` VALUES (11, '卡佛儿', '女', 0, NULL);
INSERT INTO `brands` VALUES (12, '千百度', '女', 0, NULL);
INSERT INTO `brands` VALUES (13, '巴迪', '', 0, '               	  hello            	  \r\n               	  \r\n               	  ');
INSERT INTO `brands` VALUES (14, '百丽', '女', 0, NULL);
INSERT INTO `brands` VALUES (15, '阿阿阿', '', 0, '                                                                                                                                    1111\r\n                                        \r\n                                        \r\n                                        ');
INSERT INTO `brands` VALUES (16, '大东', '女', 0, '女鞋');
INSERT INTO `brands` VALUES (17, 'aaa', '男', 0, NULL);
INSERT INTO `brands` VALUES (18, 'bbbbb', '男女', 1, NULL);

-- ----------------------------
-- Table structure for color
-- ----------------------------
DROP TABLE IF EXISTS `color`;
CREATE TABLE `color`  (
  `cid` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  `cstate` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of color
-- ----------------------------
INSERT INTO `color` VALUES (1, '红色', '这是红色', b'0');
INSERT INTO `color` VALUES (2, '橙色', NULL, b'0');
INSERT INTO `color` VALUES (3, '黄色', NULL, b'1');
INSERT INTO `color` VALUES (4, '绿色', NULL, b'1');
INSERT INTO `color` VALUES (5, '蓝色', NULL, b'1');
INSERT INTO `color` VALUES (6, '青色', NULL, b'0');
INSERT INTO `color` VALUES (7, '紫色', NULL, b'0');
INSERT INTO `color` VALUES (8, '黑色', NULL, b'0');
INSERT INTO `color` VALUES (9, '白色', NULL, b'0');
INSERT INTO `color` VALUES (10, '灰色', NULL, b'0');
INSERT INTO `color` VALUES (11, '多色', NULL, b'0');
INSERT INTO `color` VALUES (12, '粉色', NULL, b'0');
INSERT INTO `color` VALUES (13, '深灰色', NULL, b'0');
INSERT INTO `color` VALUES (14, '不不不', NULL, b'0');
INSERT INTO `color` VALUES (15, '吃吃吃', NULL, b'0');
INSERT INTO `color` VALUES (16, '多对多', NULL, b'0');
INSERT INTO `color` VALUES (17, '嗯嗯嗯', NULL, b'0');
INSERT INTO `color` VALUES (18, '发发发', NULL, b'0');
INSERT INTO `color` VALUES (19, '滚滚滚', '咕咕咕咕咕咕过', b'1');
INSERT INTO `color` VALUES (20, '哈哈哈', NULL, b'0');
INSERT INTO `color` VALUES (21, '柔柔弱弱', NULL, b'0');
INSERT INTO `color` VALUES (22, '凄凄切切', NULL, b'0');
INSERT INTO `color` VALUES (24, 'ttttt啊', NULL, b'0');
INSERT INTO `color` VALUES (25, '啊啊啊啊', NULL, b'0');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `cid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `c_uid` int UNSIGNED NULL DEFAULT NULL COMMENT 'users外键',
  `c_sid` int UNSIGNED NULL DEFAULT NULL COMMENT 'shoes外键',
  `sccomments` varchar(60) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '评论内容',
  `scscore` int UNSIGNED NOT NULL COMMENT '用户评分',
  `sctime` datetime NOT NULL COMMENT '评论时间',
  `scoid` int UNSIGNED NULL DEFAULT NULL COMMENT '从属订单号',
  `scremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  `user_id` int UNSIGNED NOT NULL COMMENT 'users外键orm',
  `shoe_id` int UNSIGNED NOT NULL COMMENT 'shoes外键orm',
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `FK_comments_uid`(`c_uid` ASC) USING BTREE,
  INDEX `FK_comments_sid`(`c_sid` ASC) USING BTREE,
  CONSTRAINT `FK_comments_sid` FOREIGN KEY (`c_sid`) REFERENCES `shoes` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_comments_uid` FOREIGN KEY (`c_uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '鞋评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, 1, 101, '非常好!', 3, '2015-01-25 00:00:00', NULL, NULL, 1, 101);
INSERT INTO `comments` VALUES (4, 1, 101, '产品很好，默认好评!jerry', 2, '2015-02-13 11:52:28', NULL, NULL, 1, 101);
INSERT INTO `comments` VALUES (5, 1, 101, '产品很4ed好评!', 1, '2015-02-17 12:28:29', NULL, NULL, 1, 101);
INSERT INTO `comments` VALUES (6, 1, 101, '产品很好，默认好评!', 3, '2015-03-30 15:44:51', NULL, NULL, 1, 101);
INSERT INTO `comments` VALUES (7, NULL, NULL, '产品很好，默认好评!', 5, '2021-07-28 20:56:58', NULL, '', 1, 101);
INSERT INTO `comments` VALUES (8, NULL, NULL, '产品很好，默认好评!', 5, '2021-07-28 21:04:25', NULL, '', 1, 101);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('00hhoyaxokn0pexj2ayhqpmcmm0tc64s', 'N2U4NjI2YjVjMzY0Njg4NTA1YmI3MjNlOTg0MzhmZTg3ZDZlM2Y1Njp7InZlcmlmeV9jb2RlIjoiYTVCQiIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJvcmRlcmV4cF9jdXJyZW50X3BhZ2UiOjEsImZsaW5rc19jdXJyZW50X3BhZ2UiOjEsImFkbWluc19jdXJyZW50X3BhZ2UiOjF9', '2022-03-22 15:10:07.216200');
INSERT INTO `django_session` VALUES ('0f3pdfmyeur62k6mf9uu8begxwws170n', 'Yzg0NTE1YmI1ZDc1NzE0YmRhODg5ZDQ4MTc1YzY3MmI1NjQxMmYyYzp7InZlcmlmeV9jb2RlIjoiM1pMMyIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJhZG1pbl9hY291bnQiOiJyb290IiwiYWRtaW5fYXB3ZCI6InJvb3QiLCJhZG1pbl9hcmVtYXJrcyI6Ilx1OGQ4NVx1N2VhN1x1N2JhMVx1NzQwNlx1NTQ1OCJ9', '2021-08-27 17:54:08.871600');
INSERT INTO `django_session` VALUES ('0vdpa35wjes3wmxbwwjhj10efwwexp04', 'OWE3MjA0ZTQzMGU0N2ZlNWNiODhiMjhkOWIxNjIzN2UzMWQyMDcyMzp7InNlY2tpbGxzX2N1cnJlbnRfcGFnZSI6Mn0=', '2021-09-04 22:57:14.225000');
INSERT INTO `django_session` VALUES ('241ggx7f803e2g1pmt0hddjg0njkwwu9', 'OTUyNWRiOGM4MWE2OWYwYWY0YzY4MTI2NjQ1ZGViZjc0YzA4OGM1Yzp7InZlcmlmeV9jb2RlIjoiZHJaYSIsInNlYXJjaF9tb2RlIjoic2VhcmNoX3Nob2VzX2J5X3R5cGVzIiwidHlwZXMiOiIyIiwic2hvZXNfY3VycmVudF9wYWdlIjo3LCJ1c2VyaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy51c2Vyc1wiLCBcInBrXCI6IDI2LCBcImZpZWxkc1wiOiB7XCJ1YWNjb3VudFwiOiBcIkNoYW9cIiwgXCJ1bmFtZVwiOiBcIkx1XCIsIFwidXRlbFwiOiBcIjEzODA4NjQyMjk4XCIsIFwidWdlbmRlclwiOiBcIlxcdTU5NzNcIiwgXCJ1cHdkXCI6IFwiNDQ0NDQ0XCIsIFwidWVtYWlsXCI6IFwiY2hhb2x1a0Bpc29mdHN0b25lLmNvbVwiLCBcInVyZWd0aW1lXCI6IFwiMjAyMS0wNy0yMFQxMDowMjowNVwiLCBcInVpbnRlZ3JhbFwiOiAyMDAuMCwgXCJ1aW5mb1wiOiBcIlwiLCBcInVwd2Rhc2tcIjogXCJcXHU2MGE4XFx1NmJjZFxcdTRlYjJcXHU3Njg0XFx1NTQwZFxcdTViNTdcIiwgXCJ1cHdkYW5zXCI6IFwiYmJiYlwiLCBcInVkZWxldGVcIjogMCwgXCJ1cmVtYXJrc1wiOiBcIlwifX1dIiwidXNlcmluZm9fdWlkIjoyNiwidXNlcmluZm9fdWFjY291bnQiOiJDaGFvIiwidXNlcmluZm9fdXB3ZCI6IjQ0NDQ0NCIsInVzZXJpbmZvX3VuYW1lIjoiTHUiLCJ1c2VyaW5mb191Z2VuZGVyIjoiXHU1OTczIiwidXNlcmluZm9fdXRlbCI6IjEzODA4NjQyMjk4IiwidXNlcmluZm9fdWVtYWlsIjoiY2hhb2x1a0Bpc29mdHN0b25lLmNvbSIsInVzZXJpbmZvX3VpbnRlZ3JhbCI6MjAwLjAsInVzZXJpbmZvX3VyZWd0aW1lIjoiMjAyMS0wNy0yMCAxMDowMjowNSIsInVzZXJpbmZvX3VpbmZvIjoiIiwidXNlcmluZm9fdXB3ZGFzayI6Ilx1NjBhOFx1NmJjZFx1NGViMlx1NzY4NFx1NTQwZFx1NWI1NyIsInVzZXJpbmZvX3Vwd2RhbnMiOiJiYmJiIiwiZnV6enkiOiIiLCJzZ2VuZGVyIjoiXHU3NTM3IiwicGFyYW1zIjp7InNjb2xvciI6IiIsImJyYW5kIjoiIiwidHlwZSI6IiIsInNpemUiOiIifSwic2l6ZV9jaG9vc2UiOiIiLCJicmFuZHNfY2hvb3NlIjoiIn0=', '2021-08-26 17:57:13.730400');
INSERT INTO `django_session` VALUES ('2ik1unq8o5g8s6vm9muw6s4sa3f8msn4', 'ZjZhODZkNzI0MTQxNWUxNmRhNmY1ZWY1YTkyMDVkZTIwMTZlMjE1Mjp7InZlcmlmeV9jb2RlIjoiNVRJcSIsInNpZCI6IjEwOCIsImNvbW1lbnRzX2N1cnJlbnRfcGFnZSI6MSwiaW5xdWlyeXNfY3VycmVudF9wYWdlIjoxfQ==', '2021-08-17 11:01:32.743804');
INSERT INTO `django_session` VALUES ('2vqutw83ews4lmbkbgh482gimdpem6fn', 'YzgzNzA1MWMwODllNGQxZjllZWRhNDc1ZDhjMTljMWUzNWY1YzdlYTp7InZlcmlmeV9jb2RlIjoiZkZyOSIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJzaG9lc19jdXJyZW50X3BhZ2UiOjQsInNlY2tpbGxzX2N1cnJlbnRfcGFnZSI6MSwidXNlcnNfY3VycmVudF9wYWdlIjoxLCJicmFuZHNfY3VycmVudF9wYWdlIjoxLCJ0eXBlc19jdXJyZW50X3BhZ2UiOjEsInNwc2hvZXNfY3VycmVudF9wYWdlIjoxfQ==', '2021-09-11 18:45:38.687000');
INSERT INTO `django_session` VALUES ('35fv0wavy5nzyhho70nou9k5s1r2jexj', 'MjYwNzY2YjQ1NWNlZWFjM2RmOWMyMWYwOGE0YThjNTY1YTI4NTM2Mzp7InZlcmlmeV9jb2RlIjoiNUZyZCIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJzZWNraWxsc19jdXJyZW50X3BhZ2UiOjEsImFkbWluc19jdXJyZW50X3BhZ2UiOjEsInBlcm1pc3Npb25zX2N1cnJlbnRfcGFnZSI6MSwiaW5xdWlyeXNfY3VycmVudF9wYWdlIjoxLCJjb21tZW50c19jdXJyZW50X3BhZ2UiOjEsImZsaW5rc19jdXJyZW50X3BhZ2UiOjEsImFkc19jdXJyZW50X3BhZ2UiOjEsInNob2Vza2lsbHNfY3VycmVudF9wYWdlIjoxLCJvcmRlcmV4cF9jdXJyZW50X3BhZ2UiOjEsIm9yZGVyc19jdXJyZW50X3BhZ2UiOjEsInNwY2lmeV9jdXJyZW50X3BhZ2UiOjEsInNob2VzX2N1cnJlbnRfcGFnZSI6MX0=', '2021-09-08 17:04:08.913800');
INSERT INTO `django_session` VALUES ('3pdf4itcpt9m328l9j8at1q0rsh3twnx', 'NDViMjNjYzAzZmE4MzgwMzBjMmZkN2VmMGZkNGIzYWM0MjY0OTY4Mzp7ImNhcnRfbG9naW4iOjF9', '2021-09-21 16:46:53.720000');
INSERT INTO `django_session` VALUES ('6csa89be8rtdntekoam6pcaiu9ajp3nj', 'NjhhMWU3ZTY1MWVmMWJiNjM5YTkzOGIzYzRhMjdmZjEwNzMwZDRhYTp7InZlcmlmeV9jb2RlIjoidm9reSJ9', '2021-08-20 10:26:40.537200');
INSERT INTO `django_session` VALUES ('6tbkozyaz73w66sj8pq9idtqrtmg0w3o', 'MDFlODU4OTA2MmI5MjUxMmJhMzFhNzNmMDU3Mjc0OWUyMmIwYWJjODp7InNpZCI6IjEwOCIsImlucXVpcnlzX2N1cnJlbnRfcGFnZSI6MSwiY29tbWVudHNfY3VycmVudF9wYWdlIjoxfQ==', '2021-08-17 11:27:37.770804');
INSERT INTO `django_session` VALUES ('7ezmc0ap4sfmhn0xvaxjzc6l2jqob6dp', 'NGRjYmIxMzcyMmMxN2ZlMDRjMmQyOGEwZDM0NTc4Mjk5NWQwZjZmYzp7InZlcmlmeV9jb2RlIjoiOWdhMCJ9', '2021-09-15 10:55:34.691400');
INSERT INTO `django_session` VALUES ('7y8kl8omljn1s407jrn2tcwqkg505ez2', 'NWE4NTVlOGUyMTQ5MWRlZmFlNjVlMWM2ZjRkZmM3Y2I3ZjAxNzAzZTp7InZlcmlmeV9jb2RlIjoic3d2ZSIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJvcmRlcnNfY3VycmVudF9wYWdlIjoxLCJpbnF1aXJ5c19jdXJyZW50X3BhZ2UiOjEsInNob2VzX2N1cnJlbnRfcGFnZSI6MX0=', '2021-09-09 18:02:07.907400');
INSERT INTO `django_session` VALUES ('9ks9xv1fjk8i3dieen87eq8btc6jrq0r', 'YTBiYTQwMzFiYzhmZDQ5NzQ4OWE5ZWQ0ZGYzNjcyZThmODQ3YjVlYjp7InZlcmlmeV9jb2RlIjoiN3RRNCIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJzaG9lc19jdXJyZW50X3BhZ2UiOjEsInNlY2tpbGxzX2N1cnJlbnRfcGFnZSI6MSwib3JkZXJzX2N1cnJlbnRfcGFnZSI6MSwiaW5xdWlyeXNfY3VycmVudF9wYWdlIjoxLCJ0eXBlc19jdXJyZW50X3BhZ2UiOjEsImJyYW5kc19jdXJyZW50X3BhZ2UiOjJ9', '2021-09-10 00:22:41.708600');
INSERT INTO `django_session` VALUES ('d5wtt80pk30i9d247z7h6a2447z3m8d5', 'YTNiZGMxZDk0N2RjNWU5NDg1ZWFmYzRlM2ZlNmI4NDNiZWU1NGNiNTp7InZlcmlmeV9jb2RlIjoiSktaTyIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJzaG9lc19jdXJyZW50X3BhZ2UiOjEsInNlY2tpbGxzX2N1cnJlbnRfcGFnZSI6MSwidXNlcnNfY3VycmVudF9wYWdlIjoxLCJvcmRlcnNfY3VycmVudF9wYWdlIjoxfQ==', '2021-09-26 22:54:49.228000');
INSERT INTO `django_session` VALUES ('e40ld1fb7s7i7mrnqz1s2qcky4scv76w', 'Mjk2MzZiNjFjMzNkYmM3ODgzMzFiNmJmMjNmODI5Mjg4ZjFkNWI0Njp7InNpZCI6IjEwOCIsImlucXVpcnlzX2N1cnJlbnRfcGFnZSI6MX0=', '2021-08-17 11:11:31.050804');
INSERT INTO `django_session` VALUES ('ep2cy0awulyxl8zowgikcdqnehvglklc', 'Njc1YzQ3MzdhNWIyNTBiYWI5MDBiZmIyMjkwNDBiZDIyZDg5MDJmODp7InZlcmlmeV9jb2RlIjoiT2V6ZCIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJzZWNraWxsc19jdXJyZW50X3BhZ2UiOjEsImZsaW5rc19jdXJyZW50X3BhZ2UiOjEsImlucXVpcnlzX2N1cnJlbnRfcGFnZSI6MSwic3BzaG9lc19jdXJyZW50X3BhZ2UiOjEsInNob2VzX2N1cnJlbnRfcGFnZSI6MX0=', '2021-09-10 18:00:15.319400');
INSERT INTO `django_session` VALUES ('eu0ufqcfc6jv96efhi3uexn11e9s0ylu', 'ZDkyMTBjZDc2NTYxMGFmY2JlNjljMWE3NDlhZjQ0NzRmMGQ4MzdlMjp7InZlcmlmeV9jb2RlIjoiNkFWYyIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5zX2N1cnJlbnRfcGFnZSI6MSwicGVybWlzc2lvbnNfY3VycmVudF9wYWdlIjoxLCJhZG1pbl9haWQiOjJ9', '2021-08-29 22:42:27.250000');
INSERT INTO `django_session` VALUES ('f4sylqc8dr8wk7e1auplhshn79shw97z', 'MWYxMDNlOTIxOGI5ZjY0YTlkM2MzMTQxY2Y0OTA3OTIyYzM0NzY0Njp7InZlcmlmeV9jb2RlIjoiWm9FNSIsInNpZCI6IjE0MyIsImNvbW1lbnRzX2N1cnJlbnRfcGFnZSI6MSwiY2FydF9sb2dpbiI6MX0=', '2021-09-21 16:09:30.443000');
INSERT INTO `django_session` VALUES ('fbmf6l322i6icnm2ekbbq1m9lq7joimq', 'M2YzZmJlZDAzMjRiNzBiYmIwYWI0ZmQ5YTYwOTUzZmViZTEzMDZkYTp7InNpZCI6IjEwOCIsImNvbW1lbnRzX2N1cnJlbnRfcGFnZSI6MSwiaW5xdWlyeXNfY3VycmVudF9wYWdlIjoxfQ==', '2021-08-17 13:35:51.868804');
INSERT INTO `django_session` VALUES ('hg852lp026l1zwoskzvmind2qh7htbvi', 'MzhkZmFlZjY1NTcwOTVhNTUyYTlhOTAzOTRjOTNlZTNmYzUwYTIzYzp7InNpZCI6IjEwOCIsImNvbW1lbnRzX2N1cnJlbnRfcGFnZSI6MX0=', '2021-08-17 11:17:38.242804');
INSERT INTO `django_session` VALUES ('hg9muqtgpy6fdghwukdbq09h7rtg640o', 'NWQ3MDNjZjJiOGFhMzk3ZThjMmQ1ODRkNDM5OGM3YWEwZTRhZDM1MTp7InZlcmlmeV9jb2RlIjoibE5mUyJ9', '2021-09-02 17:45:09.181200');
INSERT INTO `django_session` VALUES ('i8k7z32mufii05rdick3r9mmk9cdxhf8', 'NTcwYzRjMjhhMGFkNjlhNDkyYmI4NjVmODdlZmZhODkzNTUzNTg3Yzp7InZlcmlmeV9jb2RlIjoiaXdKSSJ9', '2022-01-18 11:28:09.365801');
INSERT INTO `django_session` VALUES ('j32y6j3cfntakld13vq3xas0qv74j77w', 'ZTM0ODc4ZGRmY2E0MzZhODU3ZmJkMDE5ZTEzNjk3NzkwZWIxODA2OTp7InZlcmlmeV9jb2RlIjoiaUpjeiIsInVzZXJpbmZvIjoiW3tcIm1vZGVsXCI6IFwibW9kZWxzLnVzZXJzXCIsIFwicGtcIjogMSwgXCJmaWVsZHNcIjoge1widWFjY291bnRcIjogXCJqYWtlXCIsIFwidW5hbWVcIjogXCJqYWtlXCIsIFwidXRlbFwiOiBcIjA1Mzc2NjU1NDQzXCIsIFwidWdlbmRlclwiOiBcIlxcdTc1MzdcIiwgXCJ1cHdkXCI6IFwiMTIzMTIzXCIsIFwidWVtYWlsXCI6IFwiamFrZUBxcS5jb21cIiwgXCJ1cmVndGltZVwiOiBcIjIwMTUtMDEtMDFUMDA6MDA6MDBcIiwgXCJ1aW50ZWdyYWxcIjogMzAwLjAsIFwidWluZm9cIjogbnVsbCwgXCJ1cHdkYXNrXCI6IFwiXCIsIFwidXB3ZGFuc1wiOiBcIlxcdTZkNGVcXHU1YjgxXCIsIFwidWRlbGV0ZVwiOiAwLCBcInVyZW1hcmtzXCI6IG51bGx9fV0iLCJ1c2VyaW5mb191aWQiOjEsInVzZXJpbmZvX3VhY2NvdW50IjoiamFrZSIsInVzZXJpbmZvX3Vwd2QiOiIxMjMxMjMiLCJ1c2VyaW5mb191bmFtZSI6Impha2UiLCJ1c2VyaW5mb191Z2VuZGVyIjoiXHU3NTM3IiwidXNlcmluZm9fdXRlbCI6IjA1Mzc2NjU1NDQzIiwidXNlcmluZm9fdWVtYWlsIjoiamFrZUBxcS5jb20iLCJ1c2VyaW5mb191aW50ZWdyYWwiOjMwMC4wLCJ1c2VyaW5mb191cmVndGltZSI6IjIwMTUtMDEtMDEgMDA6MDA6MDAiLCJ1c2VyaW5mb191aW5mbyI6bnVsbCwidXNlcmluZm9fdXB3ZGFzayI6IiIsInVzZXJpbmZvX3Vwd2RhbnMiOiJcdTZkNGVcdTViODEiLCJyZWNlaXZlc19jdXJyZW50X3BhZ2UiOjF9', '2021-09-21 22:15:48.817400');
INSERT INTO `django_session` VALUES ('jkvim5wy6zb85jxjj9wdn13618sdb5qy', 'NTBkZTJiNDI0NjIxOGY4ZmI3YTQ3MjQzMTc0N2I2NGJjNDI2NWRiMTp7InZlcmlmeV9jb2RlIjoicG9jMiIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJzaG9lc19jdXJyZW50X3BhZ2UiOjEsInNlY2tpbGxzX2N1cnJlbnRfcGFnZSI6MSwicGVybWlzc2lvbnNfY3VycmVudF9wYWdlIjoxLCJhZG1pbnNfY3VycmVudF9wYWdlIjoxfQ==', '2021-09-12 15:25:01.782000');
INSERT INTO `django_session` VALUES ('l1zvnn37hswo75hryoq6bjve8s7u8756', 'MjU5NzUyNWQxNmY4YTQ4MjQ3Yzk1ZDk3YTgxYThkYjA4MzMxMzZjNjp7InZlcmlmeV9jb2RlIjoicHRKZiIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJvcmRlcmV4cF9jdXJyZW50X3BhZ2UiOjEsImFkbWluc19jdXJyZW50X3BhZ2UiOjEsInVzZXJzX2N1cnJlbnRfcGFnZSI6MSwicGVybWlzc2lvbnNfY3VycmVudF9wYWdlIjoxfQ==', '2022-01-20 11:02:10.118800');
INSERT INTO `django_session` VALUES ('np8ezvjq1rdr9gj06g8q5r46wn8wduqp', 'NTQxZGFjYWI3NGUzODliMmU0MTE1ODEwZmQxYjc5YTFlMGQzZmJhYTp7InNob2VzX2N1cnJlbnRfcGFnZSI6MX0=', '2022-01-20 10:31:23.743800');
INSERT INTO `django_session` VALUES ('ofx5lh66urhk9tckc3dfoqpxgc0ym18a', 'MGMwMDhlOTJkMzFkOTM3MGFlN2ZhMmJhNDZlYjY2Yjg5Y2E3NjhlMjp7InZlcmlmeV9jb2RlIjoiazRrbyIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJpbnF1aXJ5c19jdXJyZW50X3BhZ2UiOjEsImZsaW5rc19jdXJyZW50X3BhZ2UiOjIsImFkc19jdXJyZW50X3BhZ2UiOjEsImNvbW1lbnRzX2N1cnJlbnRfcGFnZSI6MX0=', '2021-09-02 23:59:14.958800');
INSERT INTO `django_session` VALUES ('oiiylickhd44qrdca703g5zrzsvhfyg5', 'MzFlZWQzOGE0Mzk3ZmM0YmUzODhmMjczYjZmODNkNzhmZWI4MjU3ODp7InZlcmlmeV9jb2RlIjoiZXRtdyJ9', '2021-09-19 23:22:08.978000');
INSERT INTO `django_session` VALUES ('opdwa9w5jpguh8u4gwrhvn2nz9hle4f8', 'ZjliY2I5Yjc5YTdiMzgyZDk1NTU5OTdmM2E3MmExZGZlOWExYzVmZDp7InZlcmlmeV9jb2RlIjoic3lPWiIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJzZWNraWxsc19jdXJyZW50X3BhZ2UiOjF9', '2022-01-18 11:20:25.388801');
INSERT INTO `django_session` VALUES ('ptytqehqy3n5mhw6mod77k9zei7gu4k4', 'YjVhNWVjYmUxNzVjMWE1N2UyYTNkMDA5ZjRkOTU5MmZhNzI0YWM1NTp7InZlcmlmeV9jb2RlIjoiNkZMNCIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJzaG9lc19jdXJyZW50X3BhZ2UiOjEsInNlY2tpbGxzX2N1cnJlbnRfcGFnZSI6MSwic3BjaWZ5X2N1cnJlbnRfcGFnZSI6MSwidXNlcnNfY3VycmVudF9wYWdlIjoxLCJvcmRlcnNfY3VycmVudF9wYWdlIjo5LCJpbnF1aXJ5c19jdXJyZW50X3BhZ2UiOjEsIm9yZGVyZXhwX2N1cnJlbnRfcGFnZSI6MSwiZmxpbmtzX2N1cnJlbnRfcGFnZSI6MSwiY29tbWVudHNfY3VycmVudF9wYWdlIjoxLCJhZHNfY3VycmVudF9wYWdlIjoxLCJzaG9lc2tpbGxzX2N1cnJlbnRfcGFnZSI6MX0=', '2021-09-12 01:28:34.218999');
INSERT INTO `django_session` VALUES ('qd0jf899501obkfz2x3b6zdhbji9nx60', 'MWM0MzY1ZGJmODZlMGM5NDg4NjQ4YWZlZWY4ZTgxMDZlYWYwODJjNjp7InZlcmlmeV9jb2RlIjoibjljbSIsInNob2VzX2N1cnJlbnRfcGFnZSI6MSwiYnJhbmRzX2Nob29zZSI6IjEiLCJzZXhfY2hvb3NlIjoiXHU3NTM3In0=', '2022-01-21 10:06:08.323000');
INSERT INTO `django_session` VALUES ('rm9ggpgecilpptrfuax09arhs4lfcwni', 'M2YzZmJlZDAzMjRiNzBiYmIwYWI0ZmQ5YTYwOTUzZmViZTEzMDZkYTp7InNpZCI6IjEwOCIsImNvbW1lbnRzX2N1cnJlbnRfcGFnZSI6MSwiaW5xdWlyeXNfY3VycmVudF9wYWdlIjoxfQ==', '2021-08-17 11:36:30.782804');
INSERT INTO `django_session` VALUES ('rs5m76qlqdtep0o0rz2n6ouikjmghain', 'ZDU2M2M2NWExNjBhNDczNWE0MmI2ZGU2YzRjNDU4M2I5MjMyODZjYzp7InZlcmlmeV9jb2RlIjoiN281WSJ9', '2022-01-18 14:49:36.523801');
INSERT INTO `django_session` VALUES ('t0308coa2p45bm2zo0xgaved4jwnhwei', 'NzY1N2M2ZDA1MjlkNGRmZDk2MDBhMTI2OTA2YmU5ZjUzZTQ5N2JhMTp7InNpZCI6IjE0MyIsImNvbW1lbnRzX2N1cnJlbnRfcGFnZSI6MX0=', '2021-09-10 23:38:20.871000');
INSERT INTO `django_session` VALUES ('tt4nd0mw9m5f9mqfpfp30q9pf5rfwzpw', 'ZDNhOWJlZWQyZjI3MjA1MDI4ZWY4NGFhNzU2NjkyNjBmMTZkYjIwMjp7InZlcmlmeV9jb2RlIjoiOVJ4QyIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJhZG1pbnNfY3VycmVudF9wYWdlIjoxLCJwZXJtaXNzaW9uc19jdXJyZW50X3BhZ2UiOjF9', '2021-08-30 17:44:37.129000');
INSERT INTO `django_session` VALUES ('u9z060x3omdyjb15b1yionev4tphmn4f', 'NzM1YTYwZTc0ZDk3N2E3ZGFjNTdiMzk2Yzk4NmIxNDJmZGM1NjljZDp7ImJyYW5kc19jaG9vc2UiOiIxMCIsInNob2VzX2N1cnJlbnRfcGFnZSI6MSwic2lkIjoiMTQzIiwiY29tbWVudHNfY3VycmVudF9wYWdlIjoxLCJjYXJ0X2xvZ2luIjoxLCJ2ZXJpZnlfY29kZSI6IjFPOXYiLCJ1c2VyaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy51c2Vyc1wiLCBcInBrXCI6IDEsIFwiZmllbGRzXCI6IHtcInVhY2NvdW50XCI6IFwiamFrZVwiLCBcInVuYW1lXCI6IFwiamFrZVwiLCBcInV0ZWxcIjogXCIwNTM3NjY1NTQ0M1wiLCBcInVnZW5kZXJcIjogXCJcXHU3NTM3XCIsIFwidXB3ZFwiOiBcIjEyMzEyM1wiLCBcInVlbWFpbFwiOiBcImpha2VAcXEuY29tXCIsIFwidXJlZ3RpbWVcIjogXCIyMDE1LTAxLTAxVDAwOjAwOjAwXCIsIFwidWludGVncmFsXCI6IDMwMC4wLCBcInVpbmZvXCI6IG51bGwsIFwidXB3ZGFza1wiOiBcIlwiLCBcInVwd2RhbnNcIjogXCJcXHU2ZDRlXFx1NWI4MVwiLCBcInVkZWxldGVcIjogMCwgXCJ1cmVtYXJrc1wiOiBudWxsfX1dIiwidXNlcmluZm9fdWlkIjoxLCJ1c2VyaW5mb191YWNjb3VudCI6Impha2UiLCJ1c2VyaW5mb191cHdkIjoiMTIzMTIzIiwidXNlcmluZm9fdW5hbWUiOiJqYWtlIiwidXNlcmluZm9fdWdlbmRlciI6Ilx1NzUzNyIsInVzZXJpbmZvX3V0ZWwiOiIwNTM3NjY1NTQ0MyIsInVzZXJpbmZvX3VlbWFpbCI6Impha2VAcXEuY29tIiwidXNlcmluZm9fdWludGVncmFsIjozMDAuMCwidXNlcmluZm9fdXJlZ3RpbWUiOiIyMDE1LTAxLTAxIDAwOjAwOjAwIiwidXNlcmluZm9fdWluZm8iOm51bGwsInVzZXJpbmZvX3Vwd2Rhc2siOiIiLCJ1c2VyaW5mb191cHdkYW5zIjoiXHU2ZDRlXHU1YjgxIiwib3JkZXJ0eXBlIjoiNyIsIm9yZGVyX2N1cnJlbnRfcGFnZSI6MSwicmVjZWl2ZXNfY3VycmVudF9wYWdlIjoxLCJpbnF1aXJ5c19jdXJyZW50X3BhZ2UiOjEsInNleF9jaG9vc2UiOiJcdTU5NzMifQ==', '2022-01-19 11:37:24.850200');
INSERT INTO `django_session` VALUES ('ullqn97frgz15qtk3n3htkcd00bdui60', 'MDg5ZThmMDIxMDhhYTM2OGIwNDBjMTc2ZTlkMzkyZGY0YTk5ZmQ4Yjp7InNpZCI6IjE0MyIsImlucXVpcnlzX2N1cnJlbnRfcGFnZSI6MSwiY2FydF9sb2dpbiI6MSwidmVyaWZ5X2NvZGUiOiJCeFZ2IiwidXNlcmluZm8iOiJbe1wibW9kZWxcIjogXCJtb2RlbHMudXNlcnNcIiwgXCJwa1wiOiAyNiwgXCJmaWVsZHNcIjoge1widWFjY291bnRcIjogXCJDaGFvXCIsIFwidW5hbWVcIjogXCJMdVwiLCBcInV0ZWxcIjogXCIxMzgwODY0MjI5OFwiLCBcInVnZW5kZXJcIjogXCJcXHU1OTczXCIsIFwidXB3ZFwiOiBcIjQ0NDQ0NFwiLCBcInVlbWFpbFwiOiBcImNoYW9sdWtAaXNvZnRzdG9uZS5jb21cIiwgXCJ1cmVndGltZVwiOiBcIjIwMjEtMDctMjBUMTA6MDI6MDVcIiwgXCJ1aW50ZWdyYWxcIjogMjAwLjAsIFwidWluZm9cIjogXCJcIiwgXCJ1cHdkYXNrXCI6IFwiXFx1NjBhOFxcdTZiY2RcXHU0ZWIyXFx1NzY4NFxcdTU0MGRcXHU1YjU3XCIsIFwidXB3ZGFuc1wiOiBcImJiYmJcIiwgXCJ1ZGVsZXRlXCI6IDAsIFwidXJlbWFya3NcIjogXCJcIn19XSIsInVzZXJpbmZvX3VpZCI6MjYsInVzZXJpbmZvX3VhY2NvdW50IjoiQ2hhbyIsInVzZXJpbmZvX3Vwd2QiOiI0NDQ0NDQiLCJ1c2VyaW5mb191bmFtZSI6Ikx1IiwidXNlcmluZm9fdWdlbmRlciI6Ilx1NTk3MyIsInVzZXJpbmZvX3V0ZWwiOiIxMzgwODY0MjI5OCIsInVzZXJpbmZvX3VlbWFpbCI6ImNoYW9sdWtAaXNvZnRzdG9uZS5jb20iLCJ1c2VyaW5mb191aW50ZWdyYWwiOjIwMC4wLCJ1c2VyaW5mb191cmVndGltZSI6IjIwMjEtMDctMjAgMTA6MDI6MDUiLCJ1c2VyaW5mb191aW5mbyI6IiIsInVzZXJpbmZvX3Vwd2Rhc2siOiJcdTYwYThcdTZiY2RcdTRlYjJcdTc2ODRcdTU0MGRcdTViNTciLCJ1c2VyaW5mb191cHdkYW5zIjoiYmJiYiIsImNvbW1lbnRzX2N1cnJlbnRfcGFnZSI6MX0=', '2021-09-21 16:30:14.068000');
INSERT INTO `django_session` VALUES ('uqhkouq532h8inocr9m4qj6afmpa84zt', 'YmQ4YTMxZTlhYjdlOGE3NzUyMjUyNTI1YzA5NWYxMzBmYTIxZTYzNTp7InZlcmlmeV9jb2RlIjoiRnc4TiIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJzaG9lc19jdXJyZW50X3BhZ2UiOjQsInNlY2tpbGxzX2N1cnJlbnRfcGFnZSI6MSwicGVybWlzc2lvbnNfY3VycmVudF9wYWdlIjoxfQ==', '2021-09-09 00:11:51.647400');
INSERT INTO `django_session` VALUES ('v1012qp2kbkz75nq98miso0up3fuqrj2', 'YmVhNDliNWUxZGFkZjI0NTMwNmU5MjQwZDg2YTk5NDAxZGRkNmUxMjp7InZlcmlmeV9jb2RlIjoiMW5MeSIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJzaG9lc19jdXJyZW50X3BhZ2UiOjEsInNlY2tpbGxzX2N1cnJlbnRfcGFnZSI6MSwiYWRtaW5zX2N1cnJlbnRfcGFnZSI6MSwicGVybWlzc2lvbnNfY3VycmVudF9wYWdlIjoxfQ==', '2021-09-27 23:48:26.170400');
INSERT INTO `django_session` VALUES ('v8dyk0nbb3cn6fjk2z6a9vr28e01t4ze', 'ZDljYjExN2E5YzczOTQ3ODlkNDI3ZDAyMzQ5ZGJiMWJhMTRhZGRmODp7InZlcmlmeV9jb2RlIjoiYVhRaCIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJzZWNraWxsc19jdXJyZW50X3BhZ2UiOjEsInNob2Vza2lsbHNfY3VycmVudF9wYWdlIjoxLCJhZG1pbnNfY3VycmVudF9wYWdlIjoxLCJvcmRlcmV4cF9jdXJyZW50X3BhZ2UiOjEsImZsaW5rc19jdXJyZW50X3BhZ2UiOjEsImlucXVpcnlzX2N1cnJlbnRfcGFnZSI6MSwib3JkZXJzX2N1cnJlbnRfcGFnZSI6MSwic3BjaWZ5X2N1cnJlbnRfcGFnZSI6MX0=', '2021-09-05 23:27:23.828000');
INSERT INTO `django_session` VALUES ('w9n6ft4p3fbqegzkiq031ufbtfrurloy', 'NmVhMGMxNWNmMDRjMjk2NzUxYjI4YTk4NWQ4ZTUzM2JiOGZiNzJiNzp7InZlcmlmeV9jb2RlIjoiaUNGWiJ9', '2021-09-19 00:23:24.205400');
INSERT INTO `django_session` VALUES ('wglhjfmxpltfkdt89jkg83v6l38q371w', 'YTUyMTA4NmI5YmJkZTYzODc1NDllOWVlNjcyNjRlMGQyYWY4MzNlNjp7InZlcmlmeV9jb2RlIjoiSUx3WiIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJmbGlua3NfY3VycmVudF9wYWdlIjoxLCJpbnF1aXJ5c19jdXJyZW50X3BhZ2UiOjEsImFkbWluc19jdXJyZW50X3BhZ2UiOjF9', '2021-09-03 18:00:14.117000');
INSERT INTO `django_session` VALUES ('xs4etw6vi0vkdrkexjsib7ay75y6tcz5', 'MDUyN2Y2MDFmOTlmZmVjMjA5Y2MxNDMzODE4MzkxMDkyMzFmYTBlMTp7InZlcmlmeV9jb2RlIjoiV0dvdiIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJ1c2Vyc19jdXJyZW50X3BhZ2UiOjEsIm9yZGVyZXhwX2N1cnJlbnRfcGFnZSI6MSwic2Vja2lsbHNfY3VycmVudF9wYWdlIjoxLCJzaG9lc2tpbGxzX2N1cnJlbnRfcGFnZSI6MX0=', '2021-09-28 16:31:43.553400');
INSERT INTO `django_session` VALUES ('zxuw52s3p0emrab4gv0e4c2uj0c5rptw', 'MTY4NmNkYzFhM2VmNjc4NTI2M2JiY2ZmYjBlODUzZjgzOWE2NTc1Mjp7InZlcmlmeV9jb2RlIjoiUUdFZiIsImFkbWluaW5mbyI6Ilt7XCJtb2RlbFwiOiBcIm1vZGVscy5hZG1pbnNcIiwgXCJwa1wiOiAyLCBcImZpZWxkc1wiOiB7XCJhY291bnRcIjogXCJyb290XCIsIFwiYXB3ZFwiOiBcInJvb3RcIiwgXCJwZXJtaXNzaW9uXCI6IDEsIFwiYXJlbWFya3NcIjogXCJcXHU4ZDg1XFx1N2VhN1xcdTdiYTFcXHU3NDA2XFx1NTQ1OFwifX1dIiwiYWRtaW5fYWlkIjoyLCJhZG1pbnNfY3VycmVudF9wYWdlIjoxLCJwZXJtaXNzaW9uc19jdXJyZW50X3BhZ2UiOjEsImlucXVpcnlzX2N1cnJlbnRfcGFnZSI6MX0=', '2021-08-30 23:51:44.234600');

-- ----------------------------
-- Table structure for friend_links
-- ----------------------------
DROP TABLE IF EXISTS `friend_links`;
CREATE TABLE `friend_links`  (
  `flid` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `flname` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '链接名称',
  `flurl` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '链接url',
  `flimage` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '链接图片路径',
  `flremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  PRIMARY KEY (`flid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '友情链接' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of friend_links
-- ----------------------------
INSERT INTO `friend_links` VALUES (1, '淘宝网', 'http://www.taobao.com', '135467418853234.jpg', NULL);
INSERT INTO `friend_links` VALUES (2, '京东商城', 'http://www.jingdong.com', '135494705175657.jpg', NULL);
INSERT INTO `friend_links` VALUES (3, '好乐买', 'http://www.okbuy.com', '135518922265539.jpg', NULL);
INSERT INTO `friend_links` VALUES (4, '阿里巴巴', 'http://www.alibaba.com', '135538898469498.jpg', NULL);
INSERT INTO `friend_links` VALUES (5, '搜狐', 'http://www.sohu.com', '135554511483722.jpg', NULL);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单ID，主键自增',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID，关联用户表',
  `order_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `address_id` bigint NULL DEFAULT NULL COMMENT '地址ID，关联地址表',
  `receiver_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `receiver_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `delivery_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '配送方式',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品总金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠金额',
  `final_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '最终支付金额',
  `status` int NULL DEFAULT 0 COMMENT '订单状态：0-待付款，1-已付款，2-已发货，3-已收货，4-退货中，5-已退货，6-已取消',
  `create_time` datetime NULL DEFAULT NULL COMMENT '下单时间',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `ship_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `complete_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint NULL DEFAULT 0 COMMENT '逻辑删除标志（0：未删除，1：已删除）',
  `product_details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '商品详情(JSON格式，存储购物车数据)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (13, 37, '2025092221291437f3d370', 2, '启明', '19932839570', '262+2+092909', 'free', 769.00, 0.00, 769.00, 1, '2025-09-22 21:29:14', NULL, NULL, NULL, '2025-09-22 21:29:14', 0, '[{\"id\":23,\"name\":\"万里长征鞋\",\"spec\":\"颜色: 灰色, 尺码: 47.0\",\"price\":769,\"quantity\":1,\"image\":\"1.jpg\"}]');
INSERT INTO `order` VALUES (14, 37, '20250922215447a40bc14f', 1, '启明', '19932839570', '尚东绿洲3302', 'free', 1228.00, 0.00, 1228.00, 1, '2025-09-22 21:54:48', NULL, NULL, NULL, '2025-09-22 21:54:48', 0, '[{\"id\":23,\"name\":\"万里长征鞋\",\"spec\":\"颜色: 灰色, 尺码: 47.0\",\"price\":769,\"quantity\":1,\"image\":\"1.jpg\"},{\"id\":24,\"name\":\"匡威一代\",\"spec\":\"颜色: 红色, 尺码: 44.0\",\"price\":459,\"quantity\":1,\"image\":\"2.jpg\"}]');
INSERT INTO `order` VALUES (15, 37, '202509222204104eec85bf', 2, '启明', '19932839570', '262+2+092909', 'free', 1228.00, 0.00, 1228.00, 1, '2025-09-22 22:04:10', NULL, NULL, NULL, '2025-09-22 22:04:10', 0, '[{\"id\":23,\"name\":\"万里长征鞋\",\"spec\":\"颜色: 灰色, 尺码: 47.0\",\"price\":769,\"quantity\":1,\"image\":\"1.jpg\"},{\"id\":24,\"name\":\"匡威一代\",\"spec\":\"颜色: 红色, 尺码: 44.0\",\"price\":459,\"quantity\":1,\"image\":\"2.jpg\"}]');

-- ----------------------------
-- Table structure for order_backup
-- ----------------------------
DROP TABLE IF EXISTS `order_backup`;
CREATE TABLE `order_backup`  (
  `id` bigint NOT NULL DEFAULT 0 COMMENT '订单ID，主键自增',
  `user_id` bigint NOT NULL COMMENT '用户ID，关联用户表',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单编号',
  `address_id` bigint NOT NULL COMMENT '地址ID，关联地址表',
  `receiver_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收货人电话',
  `receiver_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收货地址',
  `delivery_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '配送方式',
  `total_amount` decimal(10, 2) NOT NULL COMMENT '商品总金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '优惠金额',
  `final_amount` decimal(10, 2) NOT NULL COMMENT '最终支付金额',
  `status` tinyint NULL DEFAULT 0 COMMENT '订单状态：0-待付款，1-已付款，2-已发货，3-已收货，4-退货中，5-已退货，6-已取消',
  `create_time` datetime NOT NULL COMMENT '下单时间',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `ship_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `complete_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除标志（0：未删除，1：已删除）'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_backup
-- ----------------------------
INSERT INTO `order_backup` VALUES (1, 37, '20250922164818082f4ca3', 2, '启明', '19932839570', '262+2+092909', 'free', 1079.00, 0.00, 1079.00, 1, '2025-09-22 16:48:19', NULL, NULL, NULL, '2025-09-22 16:48:19', 0);
INSERT INTO `order_backup` VALUES (2, 37, '202509221706291993d152', 1, '启明', '19932839570', '尚东绿洲3302', 'free', 3979.00, 0.00, 3979.00, 2, '2025-09-22 17:06:29', NULL, NULL, NULL, '2025-09-22 17:06:29', 0);

-- ----------------------------
-- Table structure for order_shoes
-- ----------------------------
DROP TABLE IF EXISTS `order_shoes`;
CREATE TABLE `order_shoes`  (
  `osid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `o_oid` int UNSIGNED NULL DEFAULT NULL COMMENT 'order外键',
  `o_sid` int UNSIGNED NULL DEFAULT NULL COMMENT 'shoes外键',
  `ossize` float NOT NULL DEFAULT 42 COMMENT '鞋尺寸',
  `osstate` int UNSIGNED NOT NULL COMMENT '鞋子样式',
  `osnum` int UNSIGNED NOT NULL DEFAULT 1 COMMENT '数量',
  `oremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  `order_id` int UNSIGNED NOT NULL COMMENT 'order外键orm',
  `shoe_id` int UNSIGNED NOT NULL COMMENT 'shoes外键orm',
  PRIMARY KEY (`osid`) USING BTREE,
  INDEX `FK_order_shoes_oid`(`o_oid` ASC) USING BTREE,
  INDEX `FK_order_shoes_sid`(`o_sid` ASC) USING BTREE,
  CONSTRAINT `FK_order_shoes_oid` FOREIGN KEY (`o_oid`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_order_shoes_sid` FOREIGN KEY (`o_sid`) REFERENCES `shoes` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '订单鞋详细' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_shoes
-- ----------------------------
INSERT INTO `order_shoes` VALUES (1, 1, 101, 36, 1, 2, NULL, 1, 101);
INSERT INTO `order_shoes` VALUES (2, 2, 101, 37, 1, 2, NULL, 2, 101);
INSERT INTO `order_shoes` VALUES (3, 7, 101, 36, 1, 2, NULL, 7, 101);
INSERT INTO `order_shoes` VALUES (4, 8, 102, 36, 4, 1, NULL, 8, 102);
INSERT INTO `order_shoes` VALUES (5, 9, 101, 37, 5, 2, NULL, 9, 101);
INSERT INTO `order_shoes` VALUES (6, 10, 107, 40, 4, 1, NULL, 10, 107);
INSERT INTO `order_shoes` VALUES (7, 11, 107, 40, 4, 1, NULL, 11, 107);
INSERT INTO `order_shoes` VALUES (8, 12, 107, 40, 3, 1, NULL, 12, 107);
INSERT INTO `order_shoes` VALUES (9, 13, 107, 40, 3, 1, NULL, 13, 107);
INSERT INTO `order_shoes` VALUES (10, 14, 107, 40, 3, 1, NULL, 14, 107);
INSERT INTO `order_shoes` VALUES (11, 16, 102, 36, 1, 1, NULL, 16, 102);
INSERT INTO `order_shoes` VALUES (12, 17, 106, 36, 3, 1, NULL, 17, 106);
INSERT INTO `order_shoes` VALUES (13, 18, 106, 36, 3, 1, NULL, 18, 106);
INSERT INTO `order_shoes` VALUES (15, 21, 103, 36, 1, 1, NULL, 21, 103);
INSERT INTO `order_shoes` VALUES (16, 22, 101, 44, 1, 1, NULL, 22, 101);
INSERT INTO `order_shoes` VALUES (17, 23, 101, 45, 1, 2, NULL, 23, 101);
INSERT INTO `order_shoes` VALUES (18, 24, 101, 45, 1, 1, NULL, 24, 101);
INSERT INTO `order_shoes` VALUES (19, 25, 101, 45, 1, 1, NULL, 25, 101);
INSERT INTO `order_shoes` VALUES (20, 26, 101, 44, 1, 1, NULL, 26, 101);
INSERT INTO `order_shoes` VALUES (21, 27, 101, 44, 1, 1, NULL, 27, 101);
INSERT INTO `order_shoes` VALUES (22, 28, 101, 45, 1, 1, NULL, 28, 101);
INSERT INTO `order_shoes` VALUES (23, 29, 102, 47, 1, 1, NULL, 29, 102);
INSERT INTO `order_shoes` VALUES (24, 30, 107, 40, 3, 1, NULL, 30, 107);
INSERT INTO `order_shoes` VALUES (25, 31, 107, 40, 3, 1, NULL, 31, 107);
INSERT INTO `order_shoes` VALUES (26, 32, 107, 40, 3, 1, NULL, 32, 107);
INSERT INTO `order_shoes` VALUES (27, 33, 106, 36, 3, 1, NULL, 33, 106);
INSERT INTO `order_shoes` VALUES (28, 36, 101, 44, 1, 1, NULL, 36, 101);
INSERT INTO `order_shoes` VALUES (29, 37, 108, 41, 1, 1, NULL, 37, 108);
INSERT INTO `order_shoes` VALUES (30, 38, 102, 37, 1, 1, NULL, 38, 102);
INSERT INTO `order_shoes` VALUES (31, 39, 114, 38, 1, 1, NULL, 39, 114);
INSERT INTO `order_shoes` VALUES (32, 40, 133, 42, 1, 1, NULL, 40, 133);
INSERT INTO `order_shoes` VALUES (33, 41, 103, 36, 1, 1, NULL, 41, 103);
INSERT INTO `order_shoes` VALUES (34, 43, 102, 47, 3, 1, NULL, 43, 102);
INSERT INTO `order_shoes` VALUES (41, 50, 108, 45, 0, 1, '', 50, 108);
INSERT INTO `order_shoes` VALUES (42, 51, 100, 36, 6, 1, '', 51, 100);
INSERT INTO `order_shoes` VALUES (43, 52, 102, 47, 6, 1, '', 52, 102);
INSERT INTO `order_shoes` VALUES (44, 54, 117, 43, 6, 1, '', 54, 117);
INSERT INTO `order_shoes` VALUES (45, 55, 101, 44, 0, 1, '', 55, 101);
INSERT INTO `order_shoes` VALUES (46, 56, 143, 36, 1, 1, '', 56, 143);
INSERT INTO `order_shoes` VALUES (47, 57, 101, 44, 1, 1, '', 57, 101);
INSERT INTO `order_shoes` VALUES (48, 1, 102, 36, 1, 2, NULL, 1, 102);
INSERT INTO `order_shoes` VALUES (49, 58, 100, 35, 1, 1, NULL, 58, 100);
INSERT INTO `order_shoes` VALUES (50, 59, 124, 79, 6, 5, NULL, 59, 124);
INSERT INTO `order_shoes` VALUES (51, 60, 110, 38, 1, 1, NULL, 60, 110);
INSERT INTO `order_shoes` VALUES (52, 60, 110, 39, 1, 1, NULL, 60, 110);
INSERT INTO `order_shoes` VALUES (53, 61, 124, 79, 1, 1, NULL, 61, 124);
INSERT INTO `order_shoes` VALUES (54, 61, 110, 39, 1, 1, NULL, 61, 110);
INSERT INTO `order_shoes` VALUES (55, 62, 124, 79, 1, 1, NULL, 62, 124);
INSERT INTO `order_shoes` VALUES (56, 63, 124, 79, 1, 1, NULL, 63, 124);
INSERT INTO `order_shoes` VALUES (57, 64, 102, 20, 5, 1, NULL, 64, 102);
INSERT INTO `order_shoes` VALUES (58, 65, 124, 79, 1, 1, NULL, 65, 124);
INSERT INTO `order_shoes` VALUES (59, 66, 109, 84, 2, 2, NULL, 66, 109);
INSERT INTO `order_shoes` VALUES (60, 67, 119, 98, 1, 1, NULL, 67, 119);

-- ----------------------------
-- Table structure for orderaddress
-- ----------------------------
DROP TABLE IF EXISTS `orderaddress`;
CREATE TABLE `orderaddress`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '地址编号，主键自增',
  `userid` bigint NOT NULL COMMENT '用户编号，关联用户表',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收货人姓名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系电话',
  `full_address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '完整收货地址',
  `is_default` tinyint NULL DEFAULT 0 COMMENT '是否默认地址（0：否，1：是）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NULL DEFAULT 0 COMMENT '逻辑删除标志（0：未删除，1：已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userid`(`userid` ASC) USING BTREE COMMENT '用户编号索引'
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户收货地址表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderaddress
-- ----------------------------
INSERT INTO `orderaddress` VALUES (1, 37, '启明', '19932839570', '尚东绿洲3302', 0, '2025-09-22 02:16:47', '2025-09-22 02:16:47', 0);
INSERT INTO `orderaddress` VALUES (2, 37, '启明', '19932839570', '262+2+092909', 0, '2025-09-22 03:52:56', '2025-09-22 04:07:05', 0);
INSERT INTO `orderaddress` VALUES (3, 33, '少爷', '15131645579', '019160安菲拉', 0, '2025-09-22 04:10:03', '2025-09-22 04:10:03', 0);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ouid` int UNSIGNED NULL DEFAULT NULL COMMENT 'users外键',
  `orecid` int UNSIGNED NULL DEFAULT NULL COMMENT 'receivers外键',
  `onum` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '订单编号',
  `ostate` int UNSIGNED NOT NULL COMMENT '订单状态',
  `ordertime` datetime NOT NULL COMMENT '下单时间',
  `ototal` float NOT NULL DEFAULT 0 COMMENT '总价',
  `oexpinfo` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '快递跟踪',
  `ointegral` float NOT NULL COMMENT '总积分',
  `onote` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  `user_id` int UNSIGNED NOT NULL COMMENT 'users外键orm',
  `receive_id` int UNSIGNED NOT NULL COMMENT 'receivers外键orm',
  PRIMARY KEY (`oid`) USING BTREE,
  INDEX `FK_orders_uid`(`ouid` ASC) USING BTREE,
  INDEX `FK_orders_recid`(`orecid` ASC) USING BTREE,
  CONSTRAINT `FK_orders_recid` FOREIGN KEY (`orecid`) REFERENCES `receives` (`recid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_orders_uid` FOREIGN KEY (`ouid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 1, 3, '1343983667564', 5, '2015-01-02 16:47:47', 1738, '产学研', 1600, 'gj', 1, 3);
INSERT INTO `orders` VALUES (2, 1, 1, '1344319058814', 4, '2015-01-06 13:57:38', 2637, '产学研', 2400, 'sss', 1, 1);
INSERT INTO `orders` VALUES (7, 1, 1, '1344321359202', 5, '2015-01-06 14:35:59', 1738, '产学研', 1600, '', 1, 1);
INSERT INTO `orders` VALUES (8, 1, 1, '1344321475480', 4, '2015-01-07 14:37:55', 899, '产学研', 800, '', 1, 1);
INSERT INTO `orders` VALUES (9, 1, 1, '1344343366775', 5, '2015-01-08 20:42:46', 1738, '产学研', 1600, 'aaaa', 1, 1);
INSERT INTO `orders` VALUES (10, 1, 1, '1344393170709', 4, '2015-01-14 10:32:50', 429, '产学研-秒杀', 300, 'ffff', 1, 1);
INSERT INTO `orders` VALUES (11, 1, 1, '1344393552637', 4, '2015-01-15 10:39:12', 429, '产学研-秒杀', 300, 'j', 1, 1);
INSERT INTO `orders` VALUES (12, 1, 1, '1344393845158', 7, '2015-01-16 10:44:05', 429, '产学研-秒杀,45, 56, ,40, 100, ,114.2,30.6,', 300, 'rrrr', 1, 1);
INSERT INTO `orders` VALUES (13, 1, 1, '1344394148402', 7, '2015-01-17 10:49:08', 429, '产学研-秒杀', 300, '45454', 1, 1);
INSERT INTO `orders` VALUES (14, 1, 1, '1344394681469', 7, '2015-02-04 10:58:01', 429, '产学研-秒杀', 300, 'j', 1, 1);
INSERT INTO `orders` VALUES (15, 1, 1, '1344583711704', 5, '2015-02-06 15:28:31', 1500, '产学研', 0, '', 1, 1);
INSERT INTO `orders` VALUES (16, 1, 1, '1344584359799', 5, '2015-02-10 15:39:19', 2399, '产学研,45, 56, ggg', 800, '', 1, 1);
INSERT INTO `orders` VALUES (17, 1, 1, '1344640472389', 7, '2015-02-11 07:14:32', 599, '产学研-秒杀', 200, 'ee', 1, 1);
INSERT INTO `orders` VALUES (18, 1, 1, '1344642658003', 7, '2015-02-13 07:50:58', 599, '产学研-秒杀', 200, '<p>\r\n	<span style=\"font-size:14px;\"><strong><span style=\"background-color:#b22222;\">hello</span></strong></span></p>\r\n', 1, 1);
INSERT INTO `orders` VALUES (19, 1, 1, '1344741031952', 5, '2015-02-20 11:10:31', 1500, '产学研,12, 34, gg', 0, '<p>\r\n	hello</p>\r\n', 1, 1);
INSERT INTO `orders` VALUES (21, 1, 1, '1349869273993', 1, '2015-02-26 19:41:13', 1299, '产学研-Android', 4800, NULL, 1, 1);
INSERT INTO `orders` VALUES (22, 10, 12, '1427118587901', 1, '2015-03-23 21:49:47', 869, '产学研', 4800, 'sadfsdaf', 10, 12);
INSERT INTO `orders` VALUES (23, 10, 12, '1427333871591', 1, '2015-03-26 09:37:51', 1738, '产学研', 9600, 'asdfasdf', 10, 12);
INSERT INTO `orders` VALUES (24, 10, 12, '1427334871738', 2, '2015-03-26 09:54:31', 869, '大学园', 4800, '11111111111111111111111', 10, 12);
INSERT INTO `orders` VALUES (25, 10, 12, '1427337527102', 1, '2015-03-26 10:38:47', 869, '大学园', 4800, '测试购买', 10, 12);
INSERT INTO `orders` VALUES (26, 1, 1, '1427337825361', 5, '2015-03-26 10:43:45', 869, '大学园', 4800, 'asdfasdfasd', 1, 1);
INSERT INTO `orders` VALUES (27, 1, 1, '1427338565158', 5, '2015-03-26 10:56:05', 869, '大学园', 4800, '10:55测试', 1, 1);
INSERT INTO `orders` VALUES (28, 1, 1, '1427338960114', 5, '2015-03-26 11:02:40', 869, '大学园', 4800, '测试鞋子售出次数', 1, 1);
INSERT INTO `orders` VALUES (29, 1, 1, '1427349585877', 5, '2015-03-26 13:59:45', 899, '大学园', 4800, '要求最好大一码', 1, 1);
INSERT INTO `orders` VALUES (30, 1, 1, '1427427374677', 7, '2015-03-27 11:36:14', 429, '大学园-秒杀', 300, '123123123', 1, 1);
INSERT INTO `orders` VALUES (31, 1, 1, '1427436313065', 7, '2015-03-27 14:05:13', 429, '大学园-秒杀', 300, '新的area', 1, 1);
INSERT INTO `orders` VALUES (32, 1, 1, '1427437720038', 7, '2015-03-27 14:28:40', 429, '大学园-秒杀', 300, '<p>\r\n	ckeditor编辑器</p>\r\n', 1, 1);
INSERT INTO `orders` VALUES (33, 1, 1, '1427441297964', 7, '2015-03-27 15:28:17', 599, '大学园-秒杀', 200, '<p>\r\n	建议送两双鞋垫</p>\r\n', 1, 1);
INSERT INTO `orders` VALUES (34, 1, 1, '1427612171641', 5, '2015-03-29 14:56:11', 1500, '大学园', 0, '<p>\r\n	定制鞋订单</p>\r\n', 1, 1);
INSERT INTO `orders` VALUES (35, 1, 1, '1427612322857', 5, '2015-03-29 14:58:42', 3000, '大学园', 0, '<p>\r\n	定制鞋测试1</p>\r\n', 1, 1);
INSERT INTO `orders` VALUES (36, 1, 1, '1427780293786', 5, '2015-03-31 13:38:13', 869, '大学园', 4800, '<p>\r\n	购买1</p>\r\n', 1, 1);
INSERT INTO `orders` VALUES (37, 1, 1, '1427780323062', 5, '2015-03-31 13:38:43', 639, '大学园', 3900, '<p>\r\n	购买2</p>\r\n', 1, 1);
INSERT INTO `orders` VALUES (38, 1, 1, '1427780355589', 5, '2015-03-31 13:39:15', 899, '大学园', 4800, '<p>\r\n	购买3</p>\r\n', 1, 1);
INSERT INTO `orders` VALUES (39, 1, 1, '1427780379013', 5, '2015-03-31 13:39:39', 254, '大学园', 1200, '<p>\r\n	购买4</p>\r\n', 1, 1);
INSERT INTO `orders` VALUES (40, 1, 1, '1427945727217', 5, '2015-04-02 11:35:27', 102, '大学园', 1500, '<p>\r\n	直接购买133</p>\r\n', 1, 1);
INSERT INTO `orders` VALUES (41, 1, 1, '1431508363891', 1, '2015-05-13 17:12:43', 1299, '大学园-Android', 9600, NULL, 1, 1);
INSERT INTO `orders` VALUES (42, 1, 1, '1431965207996', 6, '2015-05-19 00:06:47', 1500, '大学园', 0, '<p>\r\n	121</p>\r\n', 1, 1);
INSERT INTO `orders` VALUES (43, 1, 1, '1431965998590', 7, '2015-05-19 00:19:58', 899, '大学园-秒杀', 200, '<p>\r\n	1111</p>\r\n', 1, 1);
INSERT INTO `orders` VALUES (50, 1, 1, '1628496254', 1, '2021-08-09 16:04:14', 639, '大学园', 7800, '', 1, 1);
INSERT INTO `orders` VALUES (51, 1, 3, '1628650126', 6, '2021-08-11 10:48:47', 329, '大学园', 3600, '', 1, 3);
INSERT INTO `orders` VALUES (52, 1, 3, '1628660694', 6, '2021-08-11 13:44:55', 899, '大学园-秒杀', -200, '', 1, 3);
INSERT INTO `orders` VALUES (53, 1, 3, '1628666916', 6, '2021-08-11 15:28:37', 1500, '大学园', 0, '', 1, 3);
INSERT INTO `orders` VALUES (54, 1, 3, '1628685794', 6, '2021-08-11 20:43:14', 299, '大学园', 2400, '', 1, 3);
INSERT INTO `orders` VALUES (55, 26, 21, '1628693442', 0, '2021-08-11 22:50:43', 869, '大学园', 9600, '', 26, 21);
INSERT INTO `orders` VALUES (56, 1, 3, '1641279290', 2, '2022-01-04 14:54:50', 222, '大学园', 222, '', 1, 3);
INSERT INTO `orders` VALUES (57, 1, 3, '1641352868', 2, '2022-01-05 11:21:09', 869, '大学园', 2400, '', 1, 3);
INSERT INTO `orders` VALUES (58, 1, 1, '1646645900655', 1, '2022-03-07 17:38:20', 99, 'test', 99, NULL, 1, 1);
INSERT INTO `orders` VALUES (59, 1, 1, '1646812011143', 6, '2022-03-09 15:46:51', 640, 'sonline-test', 1500, NULL, 1, 1);
INSERT INTO `orders` VALUES (60, 1, 1, '1646816329023', 1, '2022-03-09 16:58:49', 99, 'test', 99, NULL, 1, 1);
INSERT INTO `orders` VALUES (61, 1, 3, '1646877733341', 1, '2022-03-10 10:02:13', 767, 'sonline-test', 2250, NULL, 1, 3);
INSERT INTO `orders` VALUES (62, 1, 12, '1646899997280', 1, '2022-03-10 16:13:17', 128, 'sonline-test', 300, NULL, 1, 12);
INSERT INTO `orders` VALUES (63, 1, 3, '1646963797712', 1, '2022-03-11 09:56:37', 128, 'sonline-test', 300, NULL, 1, 3);
INSERT INTO `orders` VALUES (64, 1, 3, '1646964358877', 5, '2022-03-11 10:05:58', 899, 'sonline-test', 2400, NULL, 1, 3);
INSERT INTO `orders` VALUES (65, 1, 21, '1646975407925', 1, '2022-03-11 13:10:07', 128, 'sonline-test', 300, NULL, 1, 21);
INSERT INTO `orders` VALUES (66, 1, 1, '1646981759792', 2, '2022-03-11 14:55:59', 658, 'sonline-test', 2400, NULL, 1, 1);
INSERT INTO `orders` VALUES (67, 1, 24, '1646985961464', 1, '2022-03-11 16:06:01', 156, 'sonline-test', 300, NULL, 1, 24);

-- ----------------------------
-- Table structure for percontent
-- ----------------------------
DROP TABLE IF EXISTS `percontent`;
CREATE TABLE `percontent`  (
  `pcid` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pc_perid` int UNSIGNED NULL DEFAULT NULL COMMENT 'permission外键',
  `pcitems` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT 'items',
  `pcmenu` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT 'menu',
  `pcurl` varchar(60) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '对应jsp页面',
  `pctnt` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT 'items说明',
  `pcremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  `permission_id` int UNSIGNED NOT NULL COMMENT 'permission外键orm',
  PRIMARY KEY (`pcid`) USING BTREE,
  INDEX `FK_percontent_perid`(`pc_perid` ASC) USING BTREE,
  CONSTRAINT `FK_percontent_perid` FOREIGN KEY (`pc_perid`) REFERENCES `permission` (`perid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '权限明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of percontent
-- ----------------------------
INSERT INTO `percontent` VALUES (1, 1, '用户管理', 'userManagement', 'showUsers', NULL, NULL, 1);
INSERT INTO `percontent` VALUES (2, 1, '商品管理', 'productManagement', 'ShowShoes', NULL, NULL, 1);
INSERT INTO `percontent` VALUES (3, 1, '订单管理', 'orderManagement', 'showOrders', NULL, NULL, 1);
INSERT INTO `percontent` VALUES (4, 1, '物流合作', 'logisticsCooperation', 'orderexp', NULL, NULL, 1);
INSERT INTO `percontent` VALUES (5, 1, '积分管理', 'pointsManagement', 'showAllSeckill', NULL, NULL, 1);
INSERT INTO `percontent` VALUES (6, 1, '交易报表', 'transactionReport', 'showPerformance', NULL, NULL, 1);
INSERT INTO `percontent` VALUES (7, 1, '企宣设置', 'corporateCommunications', 'showFlinks', NULL, NULL, 1);
INSERT INTO `percontent` VALUES (8, 1, '站内信息', 'siteInformation', 'mailto', NULL, NULL, 1);
INSERT INTO `percontent` VALUES (9, 1, '评价管理', 'evaluationManagement', 'Inquiry', NULL, NULL, 1);
INSERT INTO `percontent` VALUES (10, 1, '管理员账号', 'adminAccount', 'ShowAdmins', NULL, NULL, 1);
INSERT INTO `percontent` VALUES (11, 2, '订单管理', 'orderManagement', 'showOrders', NULL, NULL, 2);
INSERT INTO `percontent` VALUES (12, 3, '交易报表', 'transactionReport', 'showPerformance', NULL, NULL, 3);
INSERT INTO `percontent` VALUES (13, 3, '商品管理', 'productManagement', 'ShowShoes', NULL, NULL, 3);
INSERT INTO `percontent` VALUES (14, 4, '企宣设置', 'corporateCommunications', 'showFlinks', NULL, NULL, 4);
INSERT INTO `percontent` VALUES (15, 4, '站内信息', 'siteInformation', 'mailto', NULL, NULL, 4);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `perid` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pername` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '权限名称',
  `percont` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '权限说明',
  `peremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '权限备注',
  PRIMARY KEY (`perid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '权限信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '超级管理员', '全部权限', NULL);
INSERT INTO `permission` VALUES (2, '订单管理员', '后台普通用户', '');
INSERT INTO `permission` VALUES (3, '商品管理员', '后台普通用户', '管理商品和交易报表');
INSERT INTO `permission` VALUES (4, '企宣管理员', '管理企业宣传', '管理企宣和站内信息');

-- ----------------------------
-- Table structure for receives
-- ----------------------------
DROP TABLE IF EXISTS `receives`;
CREATE TABLE `receives`  (
  `recid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ruid` int UNSIGNED NULL DEFAULT NULL COMMENT 'users外键',
  `recprovince` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '收货省份',
  `reccity` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '收货城市',
  `recdistrict` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '收货地区',
  `recstreet` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '收货街道',
  `rectel` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '收货电话',
  `recpostcode` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `recmobile` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '收货手机',
  `recisdefault` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否默认',
  `recreceiver` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '收货人',
  `remarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  `user_id` int UNSIGNED NOT NULL COMMENT 'users外键orm',
  PRIMARY KEY (`recid`) USING BTREE,
  INDEX `FK_receives_uid`(`ruid` ASC) USING BTREE,
  CONSTRAINT `FK_receives_uid` FOREIGN KEY (`ruid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '收货地址表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of receives
-- ----------------------------
INSERT INTO `receives` VALUES (1, 1, '湖北省', '武汉市', '武昌区', '融侨华府', '022-58597981', '300163', '19990900909', b'0', '邹波', '', 1);
INSERT INTO `receives` VALUES (3, 1, '湖北省', '武汉市', '洪山区', '江汉路118号码头', '022-58597981', '300163', '19990900909', b'0', 'jackson', '', 1);
INSERT INTO `receives` VALUES (12, 10, '山东省', '济宁市', '市中区', '海川路大学园', '0538-32421321', '272000', '14654437678', b'0', '张三', NULL, 10);
INSERT INTO `receives` VALUES (21, 26, '湖北省', '武汉市', '江岸区', '北京市海淀区西北旺东路10号院东区16号楼', '098-7654321', '430000', '13808642298', b'1', 'Chao Lu', '', 26);
INSERT INTO `receives` VALUES (22, 1, '安徽省', '安庆市', '迎江区', '五马村', NULL, NULL, '19972110090', b'0', '邹波', NULL, 1);
INSERT INTO `receives` VALUES (24, 1, '广东省', '潮州市', '潮安县', '番禺职业技术学院', NULL, NULL, '19972110090', b'0', '邹波', NULL, 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `description` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色说明',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态  0-禁用 1-启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '董事长', '老大', 1);
INSERT INTO `role` VALUES (2, '护工', 'q', 1);
INSERT INTO `role` VALUES (3, '医生', 'doctor', 1);
INSERT INTO `role` VALUES (4, '厨师', '后勤', 1);
INSERT INTO `role` VALUES (5, '前台', '服务', 1);
INSERT INTO `role` VALUES (6, '管家', '牛马', 1);

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL COMMENT '用户id',
  `resource_id` int NOT NULL COMMENT '权限id',
  `type` tinyint NOT NULL COMMENT '权限类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3274 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES (1692, 4, 4, 1);
INSERT INTO `role_resource` VALUES (1693, 4, 10, 1);
INSERT INTO `role_resource` VALUES (1694, 4, 28, 1);
INSERT INTO `role_resource` VALUES (1695, 4, 30, 0);
INSERT INTO `role_resource` VALUES (1696, 4, 31, 0);
INSERT INTO `role_resource` VALUES (1697, 4, 32, 0);
INSERT INTO `role_resource` VALUES (1698, 4, 33, 0);
INSERT INTO `role_resource` VALUES (1699, 4, 34, 0);
INSERT INTO `role_resource` VALUES (1700, 4, 35, 0);
INSERT INTO `role_resource` VALUES (1701, 4, 36, 0);
INSERT INTO `role_resource` VALUES (1702, 5, 39, 1);
INSERT INTO `role_resource` VALUES (1703, 5, 40, 1);
INSERT INTO `role_resource` VALUES (1704, 5, 42, 1);
INSERT INTO `role_resource` VALUES (1705, 5, 44, 1);
INSERT INTO `role_resource` VALUES (1706, 5, 55, 1);
INSERT INTO `role_resource` VALUES (1707, 5, 56, 1);
INSERT INTO `role_resource` VALUES (1708, 5, 58, 1);
INSERT INTO `role_resource` VALUES (1709, 5, 41, 0);
INSERT INTO `role_resource` VALUES (1710, 5, 43, 0);
INSERT INTO `role_resource` VALUES (1711, 5, 45, 0);
INSERT INTO `role_resource` VALUES (1712, 5, 57, 0);
INSERT INTO `role_resource` VALUES (1713, 5, 59, 0);
INSERT INTO `role_resource` VALUES (2254, 2, 3, 1);
INSERT INTO `role_resource` VALUES (2255, 2, 5, 1);
INSERT INTO `role_resource` VALUES (2256, 2, 4, 1);
INSERT INTO `role_resource` VALUES (2257, 2, 10, 1);
INSERT INTO `role_resource` VALUES (2258, 2, 28, 1);
INSERT INTO `role_resource` VALUES (2259, 2, 85, 1);
INSERT INTO `role_resource` VALUES (2260, 2, 14, 0);
INSERT INTO `role_resource` VALUES (2261, 2, 20, 0);
INSERT INTO `role_resource` VALUES (2262, 2, 21, 0);
INSERT INTO `role_resource` VALUES (2263, 2, 30, 0);
INSERT INTO `role_resource` VALUES (2264, 2, 31, 0);
INSERT INTO `role_resource` VALUES (2265, 2, 32, 0);
INSERT INTO `role_resource` VALUES (2266, 2, 33, 0);
INSERT INTO `role_resource` VALUES (2267, 2, 34, 0);
INSERT INTO `role_resource` VALUES (2268, 2, 35, 0);
INSERT INTO `role_resource` VALUES (2269, 2, 36, 0);
INSERT INTO `role_resource` VALUES (2270, 2, 86, 0);
INSERT INTO `role_resource` VALUES (2271, 3, 3, 1);
INSERT INTO `role_resource` VALUES (2272, 3, 5, 1);
INSERT INTO `role_resource` VALUES (2273, 3, 6, 1);
INSERT INTO `role_resource` VALUES (2274, 3, 9, 1);
INSERT INTO `role_resource` VALUES (2275, 3, 55, 1);
INSERT INTO `role_resource` VALUES (2276, 3, 56, 1);
INSERT INTO `role_resource` VALUES (2277, 3, 58, 1);
INSERT INTO `role_resource` VALUES (2278, 3, 7, 0);
INSERT INTO `role_resource` VALUES (2279, 3, 14, 0);
INSERT INTO `role_resource` VALUES (2280, 3, 20, 0);
INSERT INTO `role_resource` VALUES (2281, 3, 21, 0);
INSERT INTO `role_resource` VALUES (2282, 3, 8, 0);
INSERT INTO `role_resource` VALUES (2283, 3, 15, 0);
INSERT INTO `role_resource` VALUES (2284, 3, 22, 0);
INSERT INTO `role_resource` VALUES (2285, 3, 23, 0);
INSERT INTO `role_resource` VALUES (2286, 3, 24, 0);
INSERT INTO `role_resource` VALUES (2287, 3, 25, 0);
INSERT INTO `role_resource` VALUES (2288, 3, 12, 0);
INSERT INTO `role_resource` VALUES (2289, 3, 13, 0);
INSERT INTO `role_resource` VALUES (2290, 3, 16, 0);
INSERT INTO `role_resource` VALUES (2291, 3, 26, 0);
INSERT INTO `role_resource` VALUES (2292, 3, 27, 0);
INSERT INTO `role_resource` VALUES (2293, 3, 57, 0);
INSERT INTO `role_resource` VALUES (2294, 3, 79, 0);
INSERT INTO `role_resource` VALUES (2295, 3, 80, 0);
INSERT INTO `role_resource` VALUES (2296, 3, 81, 0);
INSERT INTO `role_resource` VALUES (2297, 3, 59, 0);
INSERT INTO `role_resource` VALUES (2298, 3, 82, 0);
INSERT INTO `role_resource` VALUES (2299, 3, 83, 0);
INSERT INTO `role_resource` VALUES (2300, 3, 84, 0);
INSERT INTO `role_resource` VALUES (3244, 1, 3, 1);
INSERT INTO `role_resource` VALUES (3245, 1, 5, 1);
INSERT INTO `role_resource` VALUES (3246, 1, 6, 1);
INSERT INTO `role_resource` VALUES (3247, 1, 9, 1);
INSERT INTO `role_resource` VALUES (3248, 1, 107, 1);
INSERT INTO `role_resource` VALUES (3249, 1, 108, 1);
INSERT INTO `role_resource` VALUES (3250, 1, 116, 1);
INSERT INTO `role_resource` VALUES (3251, 1, 109, 1);
INSERT INTO `role_resource` VALUES (3252, 1, 115, 1);
INSERT INTO `role_resource` VALUES (3253, 1, 113, 1);
INSERT INTO `role_resource` VALUES (3254, 1, 114, 1);
INSERT INTO `role_resource` VALUES (3255, 1, 7, 0);
INSERT INTO `role_resource` VALUES (3256, 1, 14, 0);
INSERT INTO `role_resource` VALUES (3257, 1, 20, 0);
INSERT INTO `role_resource` VALUES (3258, 1, 21, 0);
INSERT INTO `role_resource` VALUES (3259, 1, 8, 0);
INSERT INTO `role_resource` VALUES (3260, 1, 15, 0);
INSERT INTO `role_resource` VALUES (3261, 1, 22, 0);
INSERT INTO `role_resource` VALUES (3262, 1, 23, 0);
INSERT INTO `role_resource` VALUES (3263, 1, 24, 0);
INSERT INTO `role_resource` VALUES (3264, 1, 25, 0);
INSERT INTO `role_resource` VALUES (3265, 1, 12, 0);
INSERT INTO `role_resource` VALUES (3266, 1, 13, 0);
INSERT INTO `role_resource` VALUES (3267, 1, 16, 0);
INSERT INTO `role_resource` VALUES (3268, 1, 26, 0);
INSERT INTO `role_resource` VALUES (3269, 1, 27, 0);
INSERT INTO `role_resource` VALUES (3270, 1, 117, 0);
INSERT INTO `role_resource` VALUES (3271, 1, 118, 0);
INSERT INTO `role_resource` VALUES (3272, 1, 119, 0);
INSERT INTO `role_resource` VALUES (3273, 1, 120, 0);

-- ----------------------------
-- Table structure for second_kills
-- ----------------------------
DROP TABLE IF EXISTS `second_kills`;
CREATE TABLE `second_kills`  (
  `skid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sk_sid` int UNSIGNED NULL DEFAULT NULL COMMENT 'shoes外键',
  `skintegral` float NOT NULL DEFAULT 0 COMMENT '消耗积分',
  `skamount` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '秒杀数量',
  `skstarttime` datetime NOT NULL COMMENT '秒杀开始时间',
  `skduration` datetime NOT NULL COMMENT '秒杀持续时间',
  `skisvalid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否过期',
  `sksize` int UNSIGNED NOT NULL COMMENT '秒杀尺码',
  `skremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  `shoe_id` int UNSIGNED NOT NULL COMMENT 'shoes外键orm',
  PRIMARY KEY (`skid`) USING BTREE,
  INDEX `FK_second_kills_sid`(`sk_sid` ASC) USING BTREE,
  CONSTRAINT `FK_second_kills_sid` FOREIGN KEY (`sk_sid`) REFERENCES `shoes` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '秒杀表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of second_kills
-- ----------------------------
INSERT INTO `second_kills` VALUES (1, 104, 100, 20, '2015-03-23 00:00:00', '2015-03-30 14:23:27', 0, 37, NULL, 104);
INSERT INTO `second_kills` VALUES (2, 105, 150, 15, '2015-03-23 11:18:48', '2015-03-30 11:18:48', 0, 39, NULL, 105);
INSERT INTO `second_kills` VALUES (3, 106, 200, 22, '2015-03-23 11:19:17', '2015-03-30 11:19:17', 0, 36, NULL, 106);
INSERT INTO `second_kills` VALUES (4, 107, 300, 2, '2015-04-01 11:19:52', '2015-04-05 11:19:52', 0, 40, NULL, 107);
INSERT INTO `second_kills` VALUES (5, 108, 150, 15, '2015-04-24 11:20:29', '2015-04-30 11:20:29', 0, 39, NULL, 108);
INSERT INTO `second_kills` VALUES (7, 134, 22, 26, '2015-05-01 10:00:00', '2015-05-03 10:06:00', 0, 35, NULL, 134);
INSERT INTO `second_kills` VALUES (8, 104, 100, 5, '2015-06-01 00:00:00', '2015-06-07 00:00:00', 1, 43, NULL, 104);
INSERT INTO `second_kills` VALUES (9, 102, 200, 4, '2021-08-01 00:00:00', '2021-08-20 00:00:00', 1, 47, NULL, 102);
INSERT INTO `second_kills` VALUES (10, NULL, 200, 5, '2021-08-10 00:00:00', '2021-09-20 00:00:00', 1, 37, '', 100);

-- ----------------------------
-- Table structure for shoe_photos
-- ----------------------------
DROP TABLE IF EXISTS `shoe_photos`;
CREATE TABLE `shoe_photos`  (
  `spid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sp_sid` int UNSIGNED NULL DEFAULT NULL COMMENT 'shoes外键',
  `spurl` varchar(200) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT 'url',
  `spremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  `shoe_id` int NOT NULL COMMENT 'shoes外键orm',
  PRIMARY KEY (`spid`) USING BTREE,
  INDEX `FK_shoe_photos_sid`(`sp_sid` ASC) USING BTREE,
  CONSTRAINT `FK_shoe_photos_sid` FOREIGN KEY (`sp_sid`) REFERENCES `shoes` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 249 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '鞋图片表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shoe_photos
-- ----------------------------
INSERT INTO `shoe_photos` VALUES (1, 100, '112862038024106.jpg', NULL, 100);
INSERT INTO `shoe_photos` VALUES (2, 100, '112873785472455.jpg', NULL, 100);
INSERT INTO `shoe_photos` VALUES (3, 100, '112885710475214.jpg', NULL, 100);
INSERT INTO `shoe_photos` VALUES (4, 100, '112904738274277.jpg', NULL, 100);
INSERT INTO `shoe_photos` VALUES (5, 100, '112916314986401.jpg', NULL, 100);
INSERT INTO `shoe_photos` VALUES (6, 100, '112931270071754.jpg', NULL, 100);
INSERT INTO `shoe_photos` VALUES (7, 101, '113651596339758.jpg', NULL, 101);
INSERT INTO `shoe_photos` VALUES (8, 101, '113670348072729.jpg', NULL, 101);
INSERT INTO `shoe_photos` VALUES (9, 101, '113695191191617.jpg', NULL, 101);
INSERT INTO `shoe_photos` VALUES (10, 101, '113708998878349.jpg', NULL, 101);
INSERT INTO `shoe_photos` VALUES (11, 101, '113720090425459.jpg', NULL, 101);
INSERT INTO `shoe_photos` VALUES (12, 101, '113739676871781.jpg', NULL, 101);
INSERT INTO `shoe_photos` VALUES (13, 102, '114096388212747.jpg', NULL, 102);
INSERT INTO `shoe_photos` VALUES (14, 102, '114111335097896.jpg', NULL, 102);
INSERT INTO `shoe_photos` VALUES (15, 102, '114151272874625.jpg', NULL, 102);
INSERT INTO `shoe_photos` VALUES (16, 102, '114167515281411.jpg', NULL, 102);
INSERT INTO `shoe_photos` VALUES (17, 102, '114187829521349.jpg', NULL, 102);
INSERT INTO `shoe_photos` VALUES (18, 102, '114216887415579.jpg', NULL, 102);
INSERT INTO `shoe_photos` VALUES (19, 102, '4370779067835.jpeg', NULL, 102);
INSERT INTO `shoe_photos` VALUES (20, 103, '114375924382288.jpg', NULL, 103);
INSERT INTO `shoe_photos` VALUES (21, 103, '114391413784433.jpg', NULL, 103);
INSERT INTO `shoe_photos` VALUES (22, 103, '114409579549914.jpg', NULL, 103);
INSERT INTO `shoe_photos` VALUES (23, 103, '114439793378488.jpg', NULL, 103);
INSERT INTO `shoe_photos` VALUES (24, 103, '114471216709944.jpg', NULL, 103);
INSERT INTO `shoe_photos` VALUES (25, 103, '114375924382288.jpg', NULL, 103);
INSERT INTO `shoe_photos` VALUES (26, 103, '114391413784433.jpg', NULL, 103);
INSERT INTO `shoe_photos` VALUES (27, 103, '114409579549914.jpg', NULL, 103);
INSERT INTO `shoe_photos` VALUES (28, 103, '114439793378488.jpg', NULL, 103);
INSERT INTO `shoe_photos` VALUES (29, 103, '114471216709944.jpg', NULL, 103);
INSERT INTO `shoe_photos` VALUES (30, 104, '121791015891684.jpg', NULL, 104);
INSERT INTO `shoe_photos` VALUES (31, 104, '121810420876675.jpg', NULL, 104);
INSERT INTO `shoe_photos` VALUES (32, 104, '121836631031597.jpg', NULL, 104);
INSERT INTO `shoe_photos` VALUES (33, 104, '121864042557922.jpg', NULL, 104);
INSERT INTO `shoe_photos` VALUES (34, 104, '121884578587222.jpg', NULL, 104);
INSERT INTO `shoe_photos` VALUES (35, 104, '121908283880213.jpg', NULL, 104);
INSERT INTO `shoe_photos` VALUES (36, 105, '122478546858329.jpg', NULL, 105);
INSERT INTO `shoe_photos` VALUES (37, 105, '122565654456921.jpg', NULL, 105);
INSERT INTO `shoe_photos` VALUES (38, 105, '122591107380407.jpg', NULL, 105);
INSERT INTO `shoe_photos` VALUES (39, 105, '122612562208046.jpg', NULL, 105);
INSERT INTO `shoe_photos` VALUES (40, 105, '122630931606950.jpg', NULL, 105);
INSERT INTO `shoe_photos` VALUES (41, 105, '122654641688259.jpg', NULL, 105);
INSERT INTO `shoe_photos` VALUES (42, 106, '122842762417849.jpg', NULL, 106);
INSERT INTO `shoe_photos` VALUES (43, 106, '122854593657853.jpg', NULL, 106);
INSERT INTO `shoe_photos` VALUES (44, 106, '122871659272617.jpg', NULL, 106);
INSERT INTO `shoe_photos` VALUES (45, 106, '122891946322507.jpg', NULL, 106);
INSERT INTO `shoe_photos` VALUES (46, 106, '122913347843650.jpg', NULL, 106);
INSERT INTO `shoe_photos` VALUES (47, 106, '122933444932805.jpg', NULL, 106);
INSERT INTO `shoe_photos` VALUES (48, 107, '122987518518135.jpg', NULL, 107);
INSERT INTO `shoe_photos` VALUES (49, 107, '123021000014526.jpg', NULL, 107);
INSERT INTO `shoe_photos` VALUES (50, 107, '123055538036258.jpg', NULL, 107);
INSERT INTO `shoe_photos` VALUES (51, 107, '123094626006936.jpg', NULL, 107);
INSERT INTO `shoe_photos` VALUES (52, 107, '123112657549772.jpg', NULL, 107);
INSERT INTO `shoe_photos` VALUES (53, 107, '123133032573693.jpg', NULL, 107);
INSERT INTO `shoe_photos` VALUES (54, 108, '123175733469197.jpg', NULL, 108);
INSERT INTO `shoe_photos` VALUES (55, 108, '123199474484606.jpg', NULL, 108);
INSERT INTO `shoe_photos` VALUES (56, 108, '123245454833784.jpg', NULL, 108);
INSERT INTO `shoe_photos` VALUES (57, 108, '123288467521710.jpg', NULL, 108);
INSERT INTO `shoe_photos` VALUES (58, 108, '123316426256130.jpg', NULL, 108);
INSERT INTO `shoe_photos` VALUES (59, 108, '123342612964496.jpg', NULL, 108);
INSERT INTO `shoe_photos` VALUES (60, 109, '123245713325576.jpg', NULL, 109);
INSERT INTO `shoe_photos` VALUES (61, 109, '123273379559413.jpg', NULL, 109);
INSERT INTO `shoe_photos` VALUES (62, 109, '123305721509018.jpg', NULL, 109);
INSERT INTO `shoe_photos` VALUES (63, 109, '123340191396671.jpg', NULL, 109);
INSERT INTO `shoe_photos` VALUES (64, 109, '989194475554.jpg', NULL, 109);
INSERT INTO `shoe_photos` VALUES (65, 109, '1018843393503.jpg', NULL, 109);
INSERT INTO `shoe_photos` VALUES (66, 110, '719303451695.jpg', NULL, 110);
INSERT INTO `shoe_photos` VALUES (67, 110, '743978477152.jpg', NULL, 110);
INSERT INTO `shoe_photos` VALUES (68, 110, '769386476772.jpg', NULL, 110);
INSERT INTO `shoe_photos` VALUES (69, 110, '787702185333.jpg', NULL, 110);
INSERT INTO `shoe_photos` VALUES (70, 110, '806332876385.jpg', NULL, 110);
INSERT INTO `shoe_photos` VALUES (71, 110, '828009896788.jpg', NULL, 110);
INSERT INTO `shoe_photos` VALUES (72, 111, '1068404219251.jpg', NULL, 111);
INSERT INTO `shoe_photos` VALUES (73, 111, '1082538616779.jpg', NULL, 111);
INSERT INTO `shoe_photos` VALUES (74, 111, '1105606153016.jpg', NULL, 111);
INSERT INTO `shoe_photos` VALUES (75, 111, '1132591140214.jpg', NULL, 111);
INSERT INTO `shoe_photos` VALUES (76, 111, '1155297134691.jpg', NULL, 111);
INSERT INTO `shoe_photos` VALUES (77, 111, '1176062732833.jpg', NULL, 111);
INSERT INTO `shoe_photos` VALUES (78, 112, '1071869867539.jpg', NULL, 112);
INSERT INTO `shoe_photos` VALUES (79, 112, '1098541208449.jpg', NULL, 112);
INSERT INTO `shoe_photos` VALUES (80, 112, '1131149665669.jpg', NULL, 112);
INSERT INTO `shoe_photos` VALUES (81, 112, '1167476711425.jpg', NULL, 112);
INSERT INTO `shoe_photos` VALUES (82, 112, '1212347500031.jpg', NULL, 112);
INSERT INTO `shoe_photos` VALUES (83, 112, '1241333657489.jpg', NULL, 112);
INSERT INTO `shoe_photos` VALUES (84, 113, '1230683102740.jpg', NULL, 113);
INSERT INTO `shoe_photos` VALUES (85, 113, '1262933641845.jpg', NULL, 113);
INSERT INTO `shoe_photos` VALUES (86, 113, '1299709630693.jpg', NULL, 113);
INSERT INTO `shoe_photos` VALUES (87, 113, '1336594081091.jpg', NULL, 113);
INSERT INTO `shoe_photos` VALUES (88, 113, '1377622314288.jpg', NULL, 113);
INSERT INTO `shoe_photos` VALUES (89, 113, '1432701590285.jpg', NULL, 113);
INSERT INTO `shoe_photos` VALUES (90, 114, '1358390055160.jpg', NULL, 114);
INSERT INTO `shoe_photos` VALUES (91, 114, '1383854261365.jpg', NULL, 114);
INSERT INTO `shoe_photos` VALUES (92, 114, '1411046633580.jpg', NULL, 114);
INSERT INTO `shoe_photos` VALUES (93, 114, '1437824068422.jpg', NULL, 114);
INSERT INTO `shoe_photos` VALUES (94, 114, '1467046626596.jpg', NULL, 114);
INSERT INTO `shoe_photos` VALUES (95, 114, '1495792131960.jpg', NULL, 114);
INSERT INTO `shoe_photos` VALUES (96, 115, '1512366453278.jpg', NULL, 115);
INSERT INTO `shoe_photos` VALUES (97, 115, '1535974072961.jpg', NULL, 115);
INSERT INTO `shoe_photos` VALUES (98, 115, '1570208357486.jpg', NULL, 115);
INSERT INTO `shoe_photos` VALUES (99, 115, '1602571282942.jpg', NULL, 115);
INSERT INTO `shoe_photos` VALUES (100, 115, '1674590341230.jpg', NULL, 115);
INSERT INTO `shoe_photos` VALUES (101, 115, '1704284307921.jpg', NULL, 115);
INSERT INTO `shoe_photos` VALUES (102, 116, '1596251424412.jpg', NULL, 116);
INSERT INTO `shoe_photos` VALUES (103, 116, '1740803700190.jpg', NULL, 116);
INSERT INTO `shoe_photos` VALUES (104, 116, '1769148852717.jpg', NULL, 116);
INSERT INTO `shoe_photos` VALUES (105, 116, '1813927199127.jpg', NULL, 116);
INSERT INTO `shoe_photos` VALUES (106, 116, '2147106865816.jpg', NULL, 116);
INSERT INTO `shoe_photos` VALUES (107, 116, '2179977933508.jpg', NULL, 116);
INSERT INTO `shoe_photos` VALUES (108, 117, '1692770405735.jpg', NULL, 117);
INSERT INTO `shoe_photos` VALUES (109, 117, '1706402785549.jpg', NULL, 117);
INSERT INTO `shoe_photos` VALUES (110, 117, '1735698569510.jpg', NULL, 117);
INSERT INTO `shoe_photos` VALUES (111, 117, '1761975459171.jpg', NULL, 117);
INSERT INTO `shoe_photos` VALUES (112, 117, '1787951077860.jpg', NULL, 117);
INSERT INTO `shoe_photos` VALUES (113, 117, '1810819563659.jpg', NULL, 117);
INSERT INTO `shoe_photos` VALUES (114, 118, '2151938974925.jpg', NULL, 118);
INSERT INTO `shoe_photos` VALUES (115, 118, '2172060696541.jpg', NULL, 118);
INSERT INTO `shoe_photos` VALUES (116, 118, '2204766534852.jpg', NULL, 118);
INSERT INTO `shoe_photos` VALUES (117, 118, '2238706112089.jpg', NULL, 118);
INSERT INTO `shoe_photos` VALUES (118, 118, '2270153204387.jpg', NULL, 118);
INSERT INTO `shoe_photos` VALUES (119, 118, '2343315457690.jpg', NULL, 118);
INSERT INTO `shoe_photos` VALUES (120, 119, '2282805304584.jpg', NULL, 119);
INSERT INTO `shoe_photos` VALUES (121, 119, '2421114964332.jpg', NULL, 119);
INSERT INTO `shoe_photos` VALUES (122, 119, '2453762450814.jpg', NULL, 119);
INSERT INTO `shoe_photos` VALUES (123, 119, '2481864090827.jpg', NULL, 119);
INSERT INTO `shoe_photos` VALUES (124, 119, '2511405632280.jpg', NULL, 119);
INSERT INTO `shoe_photos` VALUES (125, 119, '2547154376324.jpg', NULL, 119);
INSERT INTO `shoe_photos` VALUES (126, 120, '2637233467102.jpg', NULL, 120);
INSERT INTO `shoe_photos` VALUES (127, 120, '2655394758272.jpg', NULL, 120);
INSERT INTO `shoe_photos` VALUES (128, 120, '2684098654437.jpg', NULL, 120);
INSERT INTO `shoe_photos` VALUES (129, 120, '2933757515270.jpg', NULL, 120);
INSERT INTO `shoe_photos` VALUES (130, 120, '2967856275588.jpg', NULL, 120);
INSERT INTO `shoe_photos` VALUES (131, 120, '3019606341029.jpg', NULL, 120);
INSERT INTO `shoe_photos` VALUES (132, 121, '3074195253027.jpg', NULL, 121);
INSERT INTO `shoe_photos` VALUES (133, 121, '3110524402682.jpg', NULL, 121);
INSERT INTO `shoe_photos` VALUES (134, 121, '3139629480562.jpg', NULL, 121);
INSERT INTO `shoe_photos` VALUES (135, 121, '3168064883944.jpg', NULL, 121);
INSERT INTO `shoe_photos` VALUES (136, 121, '3216202617930.jpg', NULL, 121);
INSERT INTO `shoe_photos` VALUES (137, 121, '3244368808884.jpg', NULL, 121);
INSERT INTO `shoe_photos` VALUES (138, 122, '3174620055900.jpg', NULL, 122);
INSERT INTO `shoe_photos` VALUES (139, 122, '3261594593167.jpg', NULL, 122);
INSERT INTO `shoe_photos` VALUES (140, 122, '3285436667788.jpg', NULL, 122);
INSERT INTO `shoe_photos` VALUES (141, 122, '3313090089103.jpg', NULL, 122);
INSERT INTO `shoe_photos` VALUES (142, 122, '3336575019171.jpg', NULL, 122);
INSERT INTO `shoe_photos` VALUES (143, 122, '3365528559914.jpg', NULL, 122);
INSERT INTO `shoe_photos` VALUES (144, 123, '3833176590879.jpg', NULL, 123);
INSERT INTO `shoe_photos` VALUES (145, 123, '3881388666157.jpg', NULL, 123);
INSERT INTO `shoe_photos` VALUES (146, 123, '3919141174925.jpg', NULL, 123);
INSERT INTO `shoe_photos` VALUES (147, 123, '3960902100965.jpg', NULL, 123);
INSERT INTO `shoe_photos` VALUES (148, 123, '4000815675735.jpg', NULL, 123);
INSERT INTO `shoe_photos` VALUES (149, 123, '4053967899272.jpg', NULL, 123);
INSERT INTO `shoe_photos` VALUES (150, 124, '3475907683239.jpg', NULL, 124);
INSERT INTO `shoe_photos` VALUES (151, 124, '3496759660515.jpg', NULL, 124);
INSERT INTO `shoe_photos` VALUES (152, 124, '3522716058325.jpg', NULL, 124);
INSERT INTO `shoe_photos` VALUES (153, 124, '3555813204471.jpg', NULL, 124);
INSERT INTO `shoe_photos` VALUES (154, 124, '3582738302214.jpg', NULL, 124);
INSERT INTO `shoe_photos` VALUES (155, 124, '3613998577472.jpg', NULL, 124);
INSERT INTO `shoe_photos` VALUES (156, 125, '4102031068194.jpg', NULL, 125);
INSERT INTO `shoe_photos` VALUES (157, 125, '4424628533794.jpg', NULL, 125);
INSERT INTO `shoe_photos` VALUES (158, 125, '4471434528410.jpg', NULL, 125);
INSERT INTO `shoe_photos` VALUES (159, 125, '4505604273727.jpg', NULL, 125);
INSERT INTO `shoe_photos` VALUES (160, 125, '4543725512879.jpg', NULL, 125);
INSERT INTO `shoe_photos` VALUES (161, 125, '4583041251332.jpg', NULL, 125);
INSERT INTO `shoe_photos` VALUES (162, 126, '3636869156834.jpg', NULL, 126);
INSERT INTO `shoe_photos` VALUES (163, 126, '3663589308697.jpg', NULL, 126);
INSERT INTO `shoe_photos` VALUES (164, 126, '3692109077829.jpg', NULL, 126);
INSERT INTO `shoe_photos` VALUES (165, 126, '3730520539342.jpg', NULL, 126);
INSERT INTO `shoe_photos` VALUES (166, 126, '3758446941440.jpg', NULL, 126);
INSERT INTO `shoe_photos` VALUES (167, 126, '3810906974769.jpg', NULL, 126);
INSERT INTO `shoe_photos` VALUES (168, 127, '4862809412369.jpg', NULL, 127);
INSERT INTO `shoe_photos` VALUES (169, 127, '4897116046871.jpg', NULL, 127);
INSERT INTO `shoe_photos` VALUES (170, 127, '4933249825606.jpg', NULL, 127);
INSERT INTO `shoe_photos` VALUES (171, 127, '4973369974396.jpg', NULL, 127);
INSERT INTO `shoe_photos` VALUES (172, 127, '5015823173056.jpg', NULL, 127);
INSERT INTO `shoe_photos` VALUES (173, 127, '5052312484966.jpg', NULL, 127);
INSERT INTO `shoe_photos` VALUES (174, 128, '5160424886682.jpg', NULL, 128);
INSERT INTO `shoe_photos` VALUES (175, 128, '5202634262175.jpg', NULL, 128);
INSERT INTO `shoe_photos` VALUES (176, 128, '5245023903596.jpg', NULL, 128);
INSERT INTO `shoe_photos` VALUES (177, 128, '5287323483571.jpg', NULL, 128);
INSERT INTO `shoe_photos` VALUES (178, 128, '5317475517419.jpg', NULL, 128);
INSERT INTO `shoe_photos` VALUES (179, 128, '5352602774654.jpg', NULL, 128);
INSERT INTO `shoe_photos` VALUES (180, 129, '4670566552173.jpg', NULL, 129);
INSERT INTO `shoe_photos` VALUES (181, 129, '4696647655498.jpg', NULL, 129);
INSERT INTO `shoe_photos` VALUES (182, 129, '4722695421345.jpg', NULL, 129);
INSERT INTO `shoe_photos` VALUES (183, 129, '4751806033727.jpg', NULL, 129);
INSERT INTO `shoe_photos` VALUES (184, 129, '4779530479153.jpg', NULL, 129);
INSERT INTO `shoe_photos` VALUES (185, 129, '4815644036323.jpg', NULL, 129);
INSERT INTO `shoe_photos` VALUES (186, 130, '5391362959538.jpg', NULL, 130);
INSERT INTO `shoe_photos` VALUES (187, 130, '5421341209008.jpg', NULL, 130);
INSERT INTO `shoe_photos` VALUES (188, 130, '5451563374115.jpg', NULL, 130);
INSERT INTO `shoe_photos` VALUES (189, 130, '5484426824358.jpg', NULL, 130);
INSERT INTO `shoe_photos` VALUES (190, 130, '5664873335298.jpg', NULL, 130);
INSERT INTO `shoe_photos` VALUES (191, 130, '5694525905666.jpg', NULL, 130);
INSERT INTO `shoe_photos` VALUES (192, 131, '6019325999812.jpg', NULL, 131);
INSERT INTO `shoe_photos` VALUES (193, 131, '6056713181703.jpg', NULL, 131);
INSERT INTO `shoe_photos` VALUES (194, 131, '6117815687468.jpg', NULL, 131);
INSERT INTO `shoe_photos` VALUES (195, 131, '6173110559861.jpg', NULL, 131);
INSERT INTO `shoe_photos` VALUES (196, 131, '6217670092427.jpg', NULL, 131);
INSERT INTO `shoe_photos` VALUES (197, 131, '6295481574054.jpg', NULL, 131);
INSERT INTO `shoe_photos` VALUES (198, 132, '5728573724034.jpg', NULL, 132);
INSERT INTO `shoe_photos` VALUES (199, 132, '5860344618938.jpg', NULL, 132);
INSERT INTO `shoe_photos` VALUES (200, 132, '5884904044787.jpg', NULL, 132);
INSERT INTO `shoe_photos` VALUES (201, 132, '5914851151473.jpg', NULL, 132);
INSERT INTO `shoe_photos` VALUES (202, 132, '5942592488430.jpg', NULL, 132);
INSERT INTO `shoe_photos` VALUES (203, 132, '5976250985809.jpg', NULL, 132);
INSERT INTO `shoe_photos` VALUES (204, 133, '1735698569510.jpg', NULL, 133);
INSERT INTO `shoe_photos` VALUES (205, 133, '1761975459171.jpg', NULL, 133);
INSERT INTO `shoe_photos` VALUES (206, 133, '1787951077860.jpg', NULL, 133);
INSERT INTO `shoe_photos` VALUES (207, 133, '1810819563659.jpg', NULL, 133);
INSERT INTO `shoe_photos` VALUES (208, 134, '1810819563659.jpg', '', 134);
INSERT INTO `shoe_photos` VALUES (209, NULL, '1629958500464.jpg', '', 143);
INSERT INTO `shoe_photos` VALUES (212, NULL, '1629970454473.jpg', '', 143);
INSERT INTO `shoe_photos` VALUES (213, NULL, '1629970459280.jpg', '', 143);
INSERT INTO `shoe_photos` VALUES (214, NULL, '1629983327060.jpg', '', 148);
INSERT INTO `shoe_photos` VALUES (215, NULL, '1629983327072.jpg', '', 148);
INSERT INTO `shoe_photos` VALUES (216, NULL, '1629983327082.jpg', '', 148);
INSERT INTO `shoe_photos` VALUES (217, NULL, '1629983327089.jpg', '', 148);
INSERT INTO `shoe_photos` VALUES (218, NULL, '1630078609833.jpg', '', 143);
INSERT INTO `shoe_photos` VALUES (219, NULL, '1630078609836.jpg', '', 143);
INSERT INTO `shoe_photos` VALUES (220, NULL, '1630078609838.jpg', '', 143);
INSERT INTO `shoe_photos` VALUES (221, NULL, '1630078609841.jpg', '', 143);
INSERT INTO `shoe_photos` VALUES (222, NULL, '1630078609844.jpg', '', 143);
INSERT INTO `shoe_photos` VALUES (223, 153, '1644910345280.jpg', NULL, 153);
INSERT INTO `shoe_photos` VALUES (224, 153, '1644910345286.png', NULL, 153);
INSERT INTO `shoe_photos` VALUES (225, 153, '1644910345284.png', NULL, 153);
INSERT INTO `shoe_photos` VALUES (230, 158, '1645154522356.png', NULL, 158);
INSERT INTO `shoe_photos` VALUES (231, 158, '1645154522359.png', NULL, 158);
INSERT INTO `shoe_photos` VALUES (237, 160, '1645171274921.png', NULL, 160);
INSERT INTO `shoe_photos` VALUES (248, 160, '1645175078416.jpg', NULL, 160);

-- ----------------------------
-- Table structure for shoes
-- ----------------------------
DROP TABLE IF EXISTS `shoes`;
CREATE TABLE `shoes`  (
  `sid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `stid` int UNSIGNED NULL DEFAULT NULL COMMENT 'types外键',
  `sbid` int UNSIGNED NULL DEFAULT NULL COMMENT 'brands外键',
  `snum` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '鞋标号',
  `sname` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '鞋名称',
  `sprices` float NOT NULL DEFAULT 0 COMMENT '鞋子价格',
  `sdiscount` float(10, 0) UNSIGNED NULL DEFAULT 0 COMMENT '鞋子现价',
  `spubtime` datetime NOT NULL COMMENT '上市时间',
  `sproducer` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '生产厂商',
  `sgender` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL DEFAULT '男' COMMENT '性别属性',
  `scid` int NOT NULL COMMENT '鞋子颜色',
  `sinfo` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '内容简介',
  `stimessold` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '鞋销量',
  `simage` varchar(200) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '鞋子图片url',
  `sdetail` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '详细\r\n信息\r\n',
  `sintegral` float NULL DEFAULT NULL COMMENT '单件鞋总积分',
  `sdelete` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '鞋禁用标志',
  `sremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  `sandroidimg` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT 'androidImage',
  `type_id` int UNSIGNED NOT NULL COMMENT 'types外键orm',
  `brand_id` int UNSIGNED NOT NULL COMMENT 'brands外键orm',
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `FK_shoes_tid`(`stid` ASC) USING BTREE,
  INDEX `FK_shoes_bid`(`sbid` ASC) USING BTREE,
  CONSTRAINT `FK_shoes_bid` FOREIGN KEY (`sbid`) REFERENCES `brands` (`bid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_shoes_tid` FOREIGN KEY (`stid`) REFERENCES `types` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 161 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '鞋' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shoes
-- ----------------------------
INSERT INTO `shoes` VALUES (100, 5, 1, '16932620', '运动文化鞋', 499, 329, '2015-02-01 00:00:00', '中国大陆', '女', 8, '', 6, '1.jpg', '', 900, 0, NULL, NULL, 5, 1);
INSERT INTO `shoes` VALUES (101, 5, 2, '16922297', '经典篮球鞋', 1299, 869, '2015-01-01 00:00:00', '中国深圳', '女', 8, '', 10, '2.jpg', '', 2400, 0, NULL, 'a101', 5, 2);
INSERT INTO `shoes` VALUES (102, 3, 2, '16932184', '无敌格里芬', 1299, 899, '2015-02-01 00:00:00', '中国大陆', '男', 8, '99', 8, '1.jpg', 'gggg', 2400, 0, NULL, 'a102', 3, 2);
INSERT INTO `shoes` VALUES (103, 8, 14, '16922563', '小罗足球鞋', 1299, 899, '2014-12-16 00:00:00', '中国台湾', '男', 10, NULL, 12, '2.jpg', NULL, 2400, 0, NULL, 'a103', 8, 14);
INSERT INTO `shoes` VALUES (104, 7, 13, '16921925', '跑步文化鞋', 679, 499, '2014-11-19 00:00:00', '中国大陆', '女', 1, NULL, 5, '1.jpg', NULL, 1500, 0, NULL, 'a104', 7, 13);
INSERT INTO `shoes` VALUES (105, 6, 12, '16915114', '无敌跑步鞋', 599, 439, '2014-06-29 00:00:00', '中国香港', '女', 1, NULL, 4, '2.jpg', NULL, 1350, 0, NULL, 'a105', 6, 12);
INSERT INTO `shoes` VALUES (106, 5, 11, '16922017', '万里长征鞋', 769, 599, '2015-03-29 00:00:00', '中国香港', '男', 5, NULL, 5, '1.jpg', NULL, 1800, 0, NULL, 'a106', 5, 11);
INSERT INTO `shoes` VALUES (107, 4, 10, '16922611', '科比一代', 580, 429, '2015-01-01 00:00:00', '越南', '男', 4, NULL, 4, '2.jpg', NULL, 1740, 0, NULL, 'a107', 4, 10);
INSERT INTO `shoes` VALUES (108, 3, 9, '16922327', '纳达尔一代', 969, 639, '2015-04-03 00:00:00', '福建晋江', '女', 8, NULL, 8, '1.jpg', NULL, 1950, 0, NULL, 'a108', 3, 9);
INSERT INTO `shoes` VALUES (109, 2, 8, '16917937 ', '匡威一代', 459, 329, '1998-06-05 00:00:00', '中国大陆', '女', 11, NULL, 10, '2.jpg', NULL, 1200, 0, NULL, 'a109', 2, 8);
INSERT INTO `shoes` VALUES (110, 1, 7, '16920169', '李娜无敌', 939, 639, '2007-06-28 00:00:00', '中国大陆', '女', 9, NULL, 8, '1.jpg', NULL, 1950, 0, NULL, 'a110', 1, 7);
INSERT INTO `shoes` VALUES (111, 2, 6, '16916631', '易建联一代', 499, 378, '2009-08-29 00:00:00', '中国广州', '男', 5, NULL, 7, '2.jpg', NULL, 1200, 0, NULL, 'a111', 2, 6);
INSERT INTO `shoes` VALUES (112, 3, 5, '16922617', '勒布朗3代', 520, 335, '2004-05-27 00:00:00', '中国大陆', '女', 5, NULL, 11, '1.jpg', NULL, 900, 0, NULL, 'a112', 3, 5);
INSERT INTO `shoes` VALUES (113, 4, 4, '16918019', '无忧篮球鞋', 459, 329, '1990-01-08 00:00:00', '加拿大', '男', 2, NULL, 11, '2.jpg', NULL, 900, 0, NULL, 'a113', 4, 4);
INSERT INTO `shoes` VALUES (114, 5, 3, '16932004', '穆铁柱一代', 369, 254, '2007-08-29 00:00:00', '广州', '男', 5, NULL, 1, '1.jpg', NULL, 600, 0, NULL, 'a114', 5, 3);
INSERT INTO `shoes` VALUES (115, 6, 2, '16925427', 'SambaVulc II', 580, 409, '2009-04-28 00:00:00', '中国台湾', '男', 3, NULL, 0, '2.jpg', NULL, 1200, 0, NULL, 'a115', 6, 2);
INSERT INTO `shoes` VALUES (116, 7, 1, '16926057', '大浪淘沙', 469, 399, '1980-01-01 00:00:00', '美国', '女', 11, NULL, 0, '1.jpg', NULL, 1050, 0, NULL, 'a116', 7, 1);
INSERT INTO `shoes` VALUES (117, 8, 2, '16917505', '李宁网球鞋', 369, 299, '2008-08-29 00:00:00', '中国', '女', 1, '面料-合成革', 0, '2.jpg', NULL, 600, 0, NULL, 'a117', 8, 2);
INSERT INTO `shoes` VALUES (118, 7, 3, '16926079', 'adizero TRX FG', 1480, 1076, '2011-05-28 00:00:00', '海外', '男', 7, NULL, 0, '1.jpg', NULL, 3000, 0, NULL, 'a118', 7, 3);
INSERT INTO `shoes` VALUES (119, 6, 4, '16901386', 'G40336 F50 ', 339, 156, '2011-06-01 00:00:00', '中国', '女', 4, NULL, 1, '2.jpg', NULL, 300, 0, NULL, 'a119', 6, 4);
INSERT INTO `shoes` VALUES (120, 5, 6, '16925415', 'Falcon Elite M', 520, 384, '2011-07-01 00:00:00', '海外', '男', 11, NULL, 0, '1.jpg', NULL, 900, 0, NULL, 'a120', 5, 6);
INSERT INTO `shoes` VALUES (121, 4, 7, '16910793 ', 'Indoor_shoes', 218, 128, '2005-03-02 00:00:00', '海外', '男', 11, NULL, 0, '2.jpg', NULL, 300, 0, NULL, 'a121', 4, 7);
INSERT INTO `shoes` VALUES (122, 3, 8, '16897570', 'STAR PLAYER V118253', 365, 212, '2000-01-08 00:00:00', '东欧', '男', 1, NULL, 0, '1.jpg', NULL, 600, 0, NULL, NULL, 3, 8);
INSERT INTO `shoes` VALUES (123, 2, 9, '16926301', 'LA TRAINER W', 780, 538, '2011-08-01 00:00:00', '海外', '女', 11, NULL, 0, '2.jpg', NULL, 1500, 0, NULL, NULL, 2, 9);
INSERT INTO `shoes` VALUES (124, 1, 10, '16927440 ', 'Culture', 299, 128, '2009-03-30 00:00:00', '新加坡', '男', 1, NULL, 6, '1.jpg', NULL, 300, 0, NULL, NULL, 1, 10);
INSERT INTO `shoes` VALUES (125, 2, 11, '16913457', '坡跟夹趾凉拖', 299, 149, '2009-06-01 00:00:00', '中国大陆', '女', 3, NULL, 0, '2.jpg', NULL, 300, 0, NULL, NULL, 2, 11);
INSERT INTO `shoes` VALUES (126, 3, 2, '16929558 ', '金属珠凉拖', 498, 129, '1999-09-09 00:00:00', '南非', '女', 1, NULL, 0, '1.jpg', NULL, 900, 0, NULL, NULL, 3, 2);
INSERT INTO `shoes` VALUES (127, 4, 13, '16932060', 'Classic', 399, 262, '2009-08-01 00:00:00', '印度', '男', 2, NULL, 0, '2.jpg', NULL, 750, 0, NULL, NULL, 4, 13);
INSERT INTO `shoes` VALUES (128, 5, 14, '16917465', 'Classic Leisure', 439, 274, '2010-05-29 00:00:00', '老挝', '男', 1, NULL, 0, '1.jpg', NULL, 750, 0, NULL, NULL, 5, 14);
INSERT INTO `shoes` VALUES (129, 6, 13, '16923813', '浅口羊皮女鞋', 998, 599, '2002-04-25 00:00:00', '柬埔寨', '男', 1, NULL, 0, '2.jpg', NULL, 1500, 0, NULL, NULL, 6, 13);
INSERT INTO `shoes` VALUES (130, 7, 12, '16924867', 'HORNE MID', 649, 499, '2011-08-08 00:00:00', '冰岛', '男', 5, NULL, 0, '1.jpg', NULL, 1500, 0, NULL, NULL, 7, 12);
INSERT INTO `shoes` VALUES (131, 8, 11, '16922749', '燃烧的地球', 299, 199, '2011-08-01 00:00:00', '中国大陆', '男', 11, NULL, 0, '2.jpg', NULL, 300, 0, NULL, NULL, 8, 11);
INSERT INTO `shoes` VALUES (132, 7, 10, '16931660', '蛇纹皮凉鞋', 758, 189, '1999-03-28 00:00:00', '克罗地亚', '男', 7, NULL, 0, '1.jpg', NULL, 600, 0, NULL, NULL, 7, 10);
INSERT INTO `shoes` VALUES (133, 5, 2, '16929557', '羽毛球运动鞋', 378, 102, '2012-04-28 00:00:00', '杭州', '女', 8, NULL, 1, '2.jpg', NULL, 750, 0, NULL, NULL, 5, 2);
INSERT INTO `shoes` VALUES (134, 4, 2, '16929556', '拖鞋', 128, 103, '2012-04-28 00:00:00', '温州', '女', 4, NULL, 0, '1.jpg', NULL, 720, 0, NULL, NULL, 4, 2);
INSERT INTO `shoes` VALUES (137, 2, 2, '16299074.0', '阿阿阿', 111, 0, '2021-08-26 00:00:00', '阿迪', '男', 8, '', 0, '2.jpg', '', 100, 0, '', '', 2, 2);
INSERT INTO `shoes` VALUES (138, 1, 10, '16299078.0', '哦哦哦', 222, 0, '2021-08-26 00:00:00', '蒂芙尼', '女', 1, '', 0, '1.jpg', '', 200, 0, '', '', 1, 10);
INSERT INTO `shoes` VALUES (143, 1, 11, '16299667', '蒂芙尼1', 222, 222, '2021-05-03 00:00:00', '蒂芙尼1', '女', 10, '无1', 3, '2.jpg', '无1', 222, 0, '', '', 1, 11);
INSERT INTO `shoes` VALUES (148, 1, 1, '16299999', '耐克', 111, 111, '2020-01-01 00:00:00', '耐克', '女', 1, '无', 3, '1.jpg', '无', 111, 0, '', '', 1, 1);
INSERT INTO `shoes` VALUES (149, 2, 2, '16299074.0', '阿阿阿', 111, 0, '2021-08-28 00:00:00', '阿迪', '男', 9, '', 0, '2.jpg', '', 100, 0, '', '', 2, 2);
INSERT INTO `shoes` VALUES (150, 1, 10, '16299078.0', '哦哦哦', 222, 0, '2021-08-28 00:00:00', '蒂芙尼', '女', 1, '', 0, '1.jpg', '', 200, 0, '', '', 1, 10);
INSERT INTO `shoes` VALUES (151, 1, 1, '11111', '啊啊啊啊啊', 3, 2, '2022-02-15 00:00:00', '啊啊啊啊啊', '男', 6, NULL, 0, '2.jpg', NULL, 0, 0, NULL, NULL, 1, 1);
INSERT INTO `shoes` VALUES (152, 1, 1, '1111111', '吾问无为谓', 3, 2, '2022-02-14 00:00:00', '额鹅鹅鹅', '女', 6, NULL, 0, '1.jpg', NULL, 0, 0, NULL, NULL, 1, 1);
INSERT INTO `shoes` VALUES (153, 1, 2, '212221', '请求请求群群', 4, 3, '2022-02-01 00:00:00', '呃呃呃呃呃', '男', 2, NULL, 0, '2.jpg', NULL, 0, 0, NULL, NULL, 1, 2);
INSERT INTO `shoes` VALUES (154, 1, 1, '22222', 'aaaa', 3, 2, '2022-02-17 00:00:00', 'bbbbb', '女', 7, NULL, 0, '1.jpg', NULL, 0, 0, NULL, NULL, 1, 1);
INSERT INTO `shoes` VALUES (155, 1, 2, '333333', '嗷嗷嗷嗷', 4, 3, '2022-03-01 00:00:00', '啊啊啊啊啊', '男', 6, NULL, 0, '2.jpg', NULL, 0, 0, NULL, NULL, 1, 2);
INSERT INTO `shoes` VALUES (156, 1, 2, '111111', '222222', 3, 2, '2022-02-28 00:00:00', '额鹅鹅鹅', '男', 2, NULL, 0, '1.jpg', NULL, 0, 0, NULL, NULL, 1, 2);
INSERT INTO `shoes` VALUES (157, 1, 1, '666666', '呜呜呜呜', 4, 3, '2022-02-18 00:00:00', '啊啊啊啊啊', '男', 7, NULL, 0, '2.jpg', NULL, 0, 0, NULL, NULL, 1, 1);
INSERT INTO `shoes` VALUES (158, 2, 2, '77777', '请求请求群', 5, 4, '2022-02-22 00:00:00', '请求请求群', '男', 6, NULL, 0, '2.jpg', NULL, 0, 0, NULL, NULL, 2, 2);
INSERT INTO `shoes` VALUES (159, 1, 1, '241231', '凄凄切切1', 6, 4, '2022-02-09 00:00:00', '请求请求群111', '男', 7, '11111', 0, '2.jpg', '11111', 1111, 0, NULL, NULL, 1, 1);
INSERT INTO `shoes` VALUES (160, 1, 1, '2222', '请求请求群请求', 6, 4, '2022-02-08 00:00:00', '柔柔弱弱', '男', 7, NULL, 0, '1.jpg', NULL, 0, 0, NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for shoes_inquirys
-- ----------------------------
DROP TABLE IF EXISTS `shoes_inquirys`;
CREATE TABLE `shoes_inquirys`  (
  `sqid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sq_uid` int UNSIGNED NULL DEFAULT NULL COMMENT 'users外键',
  `sq_sid` int UNSIGNED NULL DEFAULT NULL COMMENT 'shoes外键',
  `sqquestion` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '咨询问题',
  `sqanswer` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '回复答案',
  `sqquestiontime` datetime NOT NULL COMMENT '咨询问题时间',
  `sqanswertime` datetime NULL DEFAULT NULL COMMENT '回复答案时间',
  `sqremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  `user_id` int UNSIGNED NOT NULL COMMENT 'users外键orm',
  `shoe_id` int UNSIGNED NOT NULL COMMENT 'shoes外键orm',
  PRIMARY KEY (`sqid`) USING BTREE,
  INDEX `FK_shoes_inquirys_uid`(`sq_uid` ASC) USING BTREE,
  INDEX `FK_shoes_inquirys_sid`(`sq_sid` ASC) USING BTREE,
  CONSTRAINT `FK_shoes_inquirys_sid` FOREIGN KEY (`sq_sid`) REFERENCES `shoes` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_shoes_inquirys_uid` FOREIGN KEY (`sq_uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '商品咨询表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shoes_inquirys
-- ----------------------------
INSERT INTO `shoes_inquirys` VALUES (1, 1, 101, 'hello shoes?', '非常经典', '2015-01-07 21:45:00', '2015-04-08 23:31:53', NULL, 1, 101);
INSERT INTO `shoes_inquirys` VALUES (2, 1, 101, '阿迪达斯?', 'yes!!', '2015-01-13 09:41:10', '2015-01-20 13:32:09', NULL, 1, 101);
INSERT INTO `shoes_inquirys` VALUES (3, 1, 101, '你好?', NULL, '2015-02-13 09:41:10', NULL, NULL, 1, 101);
INSERT INTO `shoes_inquirys` VALUES (4, 1, 101, '你好?', '辛苦！', '2015-02-14 19:33:46', '2015-02-22 09:11:13', NULL, 1, 101);
INSERT INTO `shoes_inquirys` VALUES (5, 1, 101, '鞋子很好?', NULL, '2015-03-14 19:40:07', NULL, NULL, 1, 101);
INSERT INTO `shoes_inquirys` VALUES (6, 1, 101, '这个鞋子有42码吗？', NULL, '2015-03-30 10:49:58', NULL, NULL, 1, 101);
INSERT INTO `shoes_inquirys` VALUES (7, 1, 103, '???????', NULL, '2015-06-09 10:16:02', NULL, NULL, 1, 103);
INSERT INTO `shoes_inquirys` VALUES (8, NULL, NULL, '嗷嗷嗷嗷', '啊啊啊啊啊啊啊', '2021-07-28 21:56:40', '2021-08-19 15:47:24', '', 1, 101);
INSERT INTO `shoes_inquirys` VALUES (9, NULL, NULL, '呃呃呃呃呃', '哦哦哦哦哦', '2021-08-19 15:58:40', '2021-08-19 15:59:05', '', 26, 101);
INSERT INTO `shoes_inquirys` VALUES (10, NULL, NULL, 'aaaaaa', 'bbbbb', '2022-01-06 10:17:15', '2022-01-06 10:17:29', '', 1, 108);

-- ----------------------------
-- Table structure for shoesizes
-- ----------------------------
DROP TABLE IF EXISTS `shoesizes`;
CREATE TABLE `shoesizes`  (
  `ssid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `s_sid` int UNSIGNED NULL DEFAULT NULL COMMENT 'shoes外键',
  `s_sizeid` int UNSIGNED NULL DEFAULT NULL COMMENT 'sizes外键',
  `sstate` int UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `ssremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  `scount` int UNSIGNED NOT NULL DEFAULT 1 COMMENT '该尺码鞋数量',
  `shoe_id` int UNSIGNED NOT NULL COMMENT 'shoes外键orm',
  `size_id` int UNSIGNED NOT NULL COMMENT 'sizes外键orm',
  PRIMARY KEY (`ssid`) USING BTREE,
  INDEX `FK_shoesizes_sid`(`s_sid` ASC) USING BTREE,
  INDEX `FK_shoesizes_size`(`s_sizeid` ASC) USING BTREE,
  CONSTRAINT `FK_shoesizes_sid` FOREIGN KEY (`s_sid`) REFERENCES `shoes` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_shoesizes_size` FOREIGN KEY (`s_sizeid`) REFERENCES `sizes` (`sizeid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '尺寸表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shoesizes
-- ----------------------------
INSERT INTO `shoesizes` VALUES (12, 101, 10, 1, NULL, 27, 101, 10);
INSERT INTO `shoesizes` VALUES (13, 101, 11, 1, NULL, 5, 101, 11);
INSERT INTO `shoesizes` VALUES (19, 102, 1, 1, NULL, 34, 102, 1);
INSERT INTO `shoesizes` VALUES (20, 102, 3, 1, NULL, 34, 102, 3);
INSERT INTO `shoesizes` VALUES (21, 102, 13, 1, NULL, 46, 102, 13);
INSERT INTO `shoesizes` VALUES (22, 134, 1, 1, NULL, 11, 134, 1);
INSERT INTO `shoesizes` VALUES (23, 134, 2, 1, NULL, 12, 134, 2);
INSERT INTO `shoesizes` VALUES (24, 114, 2, 1, NULL, 30, 114, 2);
INSERT INTO `shoesizes` VALUES (25, 114, 4, 1, NULL, 19, 114, 4);
INSERT INTO `shoesizes` VALUES (26, 114, 7, 1, NULL, 13, 114, 7);
INSERT INTO `shoesizes` VALUES (27, 113, 6, 1, NULL, 30, 113, 6);
INSERT INTO `shoesizes` VALUES (28, 113, 9, 1, NULL, 20, 113, 9);
INSERT INTO `shoesizes` VALUES (29, 108, 7, 1, NULL, 9, 108, 7);
INSERT INTO `shoesizes` VALUES (30, 108, 11, 1, NULL, 30, 108, 11);
INSERT INTO `shoesizes` VALUES (31, 107, 9, 1, NULL, 30, 107, 9);
INSERT INTO `shoesizes` VALUES (32, 107, 10, 1, NULL, 10, 107, 10);
INSERT INTO `shoesizes` VALUES (33, 106, 11, 1, NULL, 10, 106, 11);
INSERT INTO `shoesizes` VALUES (34, 106, 12, 1, NULL, 10, 106, 12);
INSERT INTO `shoesizes` VALUES (35, 117, 9, 1, NULL, 20, 117, 9);
INSERT INTO `shoesizes` VALUES (36, 117, 10, 1, NULL, 30, 117, 10);
INSERT INTO `shoesizes` VALUES (37, 133, 8, 1, NULL, 26, 133, 8);
INSERT INTO `shoesizes` VALUES (38, 110, 4, 1, NULL, 19, 110, 4);
INSERT INTO `shoesizes` VALUES (39, 110, 5, 1, NULL, 8, 110, 5);
INSERT INTO `shoesizes` VALUES (40, 110, 6, 1, NULL, 16, 110, 6);
INSERT INTO `shoesizes` VALUES (41, 100, 2, 1, NULL, 20, 100, 2);
INSERT INTO `shoesizes` VALUES (42, 100, 3, 1, NULL, 3, 100, 3);
INSERT INTO `shoesizes` VALUES (43, 103, 8, 1, NULL, 20, 103, 8);
INSERT INTO `shoesizes` VALUES (44, 103, 9, 1, NULL, 30, 103, 9);
INSERT INTO `shoesizes` VALUES (45, 103, 10, 1, NULL, 22, 103, 10);
INSERT INTO `shoesizes` VALUES (46, 104, 9, 1, NULL, 44, 104, 9);
INSERT INTO `shoesizes` VALUES (47, 104, 10, 1, NULL, 23, 104, 10);
INSERT INTO `shoesizes` VALUES (48, 105, 10, 1, NULL, 10, 105, 10);
INSERT INTO `shoesizes` VALUES (49, 105, 11, 1, NULL, 29, 105, 11);
INSERT INTO `shoesizes` VALUES (51, 143, 2, 1, '', 4, 143, 2);
INSERT INTO `shoesizes` VALUES (52, 148, 4, 1, '', 5, 148, 4);
INSERT INTO `shoesizes` VALUES (53, 143, 3, 1, '', 2, 143, 3);
INSERT INTO `shoesizes` VALUES (54, 153, 5, 0, NULL, 40, 153, 5);
INSERT INTO `shoesizes` VALUES (55, 153, 4, 0, NULL, 30, 153, 4);
INSERT INTO `shoesizes` VALUES (56, 153, 3, 0, NULL, 20, 153, 3);
INSERT INTO `shoesizes` VALUES (57, 153, 2, 0, NULL, 0, 153, 2);
INSERT INTO `shoesizes` VALUES (58, 154, 2, 0, NULL, 20, 154, 2);
INSERT INTO `shoesizes` VALUES (59, 154, 3, 1, NULL, 30, 154, 3);
INSERT INTO `shoesizes` VALUES (60, 154, 4, 0, NULL, 40, 154, 4);
INSERT INTO `shoesizes` VALUES (61, 155, 2, 0, NULL, 20, 155, 2);
INSERT INTO `shoesizes` VALUES (62, 155, 3, 0, NULL, 30, 155, 3);
INSERT INTO `shoesizes` VALUES (63, 156, 2, 0, NULL, 20, 156, 2);
INSERT INTO `shoesizes` VALUES (64, 156, 3, 0, NULL, 30, 156, 3);
INSERT INTO `shoesizes` VALUES (65, 157, 2, 0, NULL, 20, 157, 2);
INSERT INTO `shoesizes` VALUES (66, 157, 3, 0, NULL, 30, 157, 3);
INSERT INTO `shoesizes` VALUES (67, 157, 4, 0, NULL, 40, 157, 4);
INSERT INTO `shoesizes` VALUES (68, 158, 2, 0, NULL, 20, 158, 2);
INSERT INTO `shoesizes` VALUES (69, 158, 3, 1, NULL, 30, 158, 3);
INSERT INTO `shoesizes` VALUES (70, 158, 4, 0, NULL, 40, 158, 4);
INSERT INTO `shoesizes` VALUES (71, 159, 2, 0, NULL, 20, 159, 2);
INSERT INTO `shoesizes` VALUES (72, 159, 3, 1, NULL, 30, 159, 3);
INSERT INTO `shoesizes` VALUES (73, 159, 4, 0, NULL, 40, 159, 4);
INSERT INTO `shoesizes` VALUES (74, 159, 5, 0, NULL, 50, 159, 5);
INSERT INTO `shoesizes` VALUES (75, 160, 2, 0, NULL, 20, 160, 2);
INSERT INTO `shoesizes` VALUES (76, 160, 3, 0, NULL, 300, 160, 3);
INSERT INTO `shoesizes` VALUES (77, 160, 4, 0, NULL, 60, 160, 4);
INSERT INTO `shoesizes` VALUES (78, 160, 5, 0, NULL, 600, 160, 5);
INSERT INTO `shoesizes` VALUES (79, 124, 4, 0, NULL, 100, 124, 4);
INSERT INTO `shoesizes` VALUES (80, 138, 4, 0, NULL, 100, 138, 4);
INSERT INTO `shoesizes` VALUES (81, 150, 4, 0, NULL, 100, 150, 4);
INSERT INTO `shoesizes` VALUES (82, 151, 4, 0, NULL, 100, 151, 4);
INSERT INTO `shoesizes` VALUES (83, 152, 4, 0, NULL, 100, 152, 4);
INSERT INTO `shoesizes` VALUES (84, 109, 4, 0, NULL, 100, 109, 4);
INSERT INTO `shoesizes` VALUES (85, 111, 4, 0, NULL, 100, 111, 4);
INSERT INTO `shoesizes` VALUES (86, 123, 4, 0, NULL, 100, 123, 4);
INSERT INTO `shoesizes` VALUES (87, 125, 4, 0, NULL, 100, 125, 4);
INSERT INTO `shoesizes` VALUES (88, 137, 4, 0, NULL, 100, 137, 4);
INSERT INTO `shoesizes` VALUES (89, 149, 4, 0, NULL, 100, 149, 4);
INSERT INTO `shoesizes` VALUES (90, 112, 4, 0, NULL, 100, 112, 4);
INSERT INTO `shoesizes` VALUES (91, 122, 4, 0, NULL, 100, 122, 4);
INSERT INTO `shoesizes` VALUES (92, 126, 4, 0, NULL, 100, 126, 4);
INSERT INTO `shoesizes` VALUES (93, 121, 4, 0, NULL, 100, 121, 4);
INSERT INTO `shoesizes` VALUES (94, 127, 4, 0, NULL, 100, 127, 4);
INSERT INTO `shoesizes` VALUES (95, 120, 4, 0, NULL, 100, 120, 4);
INSERT INTO `shoesizes` VALUES (96, 128, 4, 0, NULL, 100, 128, 4);
INSERT INTO `shoesizes` VALUES (97, 115, 4, 0, NULL, 100, 115, 4);
INSERT INTO `shoesizes` VALUES (98, 119, 4, 0, NULL, 100, 119, 4);
INSERT INTO `shoesizes` VALUES (99, 129, 4, 0, NULL, 100, 129, 4);
INSERT INTO `shoesizes` VALUES (100, 116, 4, 0, NULL, 100, 116, 4);
INSERT INTO `shoesizes` VALUES (101, 118, 4, 0, NULL, 100, 118, 4);
INSERT INTO `shoesizes` VALUES (102, 130, 4, 0, NULL, 100, 130, 4);
INSERT INTO `shoesizes` VALUES (103, 132, 4, 0, NULL, 100, 132, 4);
INSERT INTO `shoesizes` VALUES (104, 131, 4, 0, NULL, 100, 131, 4);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int UNSIGNED NOT NULL COMMENT '用户ID',
  `shoe_id` int UNSIGNED NOT NULL COMMENT '鞋子ID',
  `shoesize_id` int UNSIGNED NOT NULL COMMENT '鞋子尺码ID(关联shoesizes表)',
  `color_id` int NOT NULL COMMENT '颜色ID(关联color表)',
  `quantity` int UNSIGNED NOT NULL DEFAULT 1 COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_shopping_cart_user_id`(`user_id` ASC) USING BTREE,
  INDEX `FK_shopping_cart_shoe_id`(`shoe_id` ASC) USING BTREE,
  INDEX `FK_shopping_cart_shoesize_id`(`shoesize_id` ASC) USING BTREE,
  INDEX `FK_shopping_cart_color_id`(`color_id` ASC) USING BTREE,
  CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`color_id`) REFERENCES `color` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shopping_cart_ibfk_2` FOREIGN KEY (`shoe_id`) REFERENCES `shoes` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shopping_cart_ibfk_3` FOREIGN KEY (`shoesize_id`) REFERENCES `shoesizes` (`ssid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shopping_cart_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '购物车' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (1, 1, 100, 12, 1, 6);
INSERT INTO `shopping_cart` VALUES (2, 1, 103, 20, 4, 4);
INSERT INTO `shopping_cart` VALUES (23, 37, 106, 21, 10, 1);
INSERT INTO `shopping_cart` VALUES (24, 37, 109, 12, 1, 1);

-- ----------------------------
-- Table structure for sizes
-- ----------------------------
DROP TABLE IF EXISTS `sizes`;
CREATE TABLE `sizes`  (
  `sizeid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sizenum` float NOT NULL COMMENT 'size',
  `sremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  `sstate` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`sizeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '鞋尺码' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sizes
-- ----------------------------
INSERT INTO `sizes` VALUES (1, 35, NULL, b'1');
INSERT INTO `sizes` VALUES (2, 36, NULL, b'0');
INSERT INTO `sizes` VALUES (3, 37, NULL, b'0');
INSERT INTO `sizes` VALUES (4, 38, NULL, b'0');
INSERT INTO `sizes` VALUES (5, 39, NULL, b'0');
INSERT INTO `sizes` VALUES (6, 40, NULL, b'0');
INSERT INTO `sizes` VALUES (7, 41, NULL, b'0');
INSERT INTO `sizes` VALUES (8, 42, NULL, b'0');
INSERT INTO `sizes` VALUES (9, 43, NULL, b'0');
INSERT INTO `sizes` VALUES (10, 44, NULL, b'0');
INSERT INTO `sizes` VALUES (11, 45, NULL, b'0');
INSERT INTO `sizes` VALUES (12, 46, NULL, b'0');
INSERT INTO `sizes` VALUES (13, 47, NULL, b'0');
INSERT INTO `sizes` VALUES (14, 48, NULL, b'0');
INSERT INTO `sizes` VALUES (18, 10, NULL, b'0');
INSERT INTO `sizes` VALUES (19, 14, NULL, b'0');
INSERT INTO `sizes` VALUES (20, 13.5, NULL, b'0');
INSERT INTO `sizes` VALUES (21, 23.5, NULL, b'0');
INSERT INTO `sizes` VALUES (22, 33, NULL, b'0');
INSERT INTO `sizes` VALUES (25, 11, NULL, b'0');
INSERT INTO `sizes` VALUES (26, 12, NULL, b'0');
INSERT INTO `sizes` VALUES (29, 14.5, NULL, b'0');
INSERT INTO `sizes` VALUES (30, 47.5, NULL, b'0');
INSERT INTO `sizes` VALUES (31, 48.5, NULL, b'0');
INSERT INTO `sizes` VALUES (32, 59, '太大了', b'0');
INSERT INTO `sizes` VALUES (33, 58, NULL, b'0');
INSERT INTO `sizes` VALUES (34, 57, NULL, b'0');
INSERT INTO `sizes` VALUES (35, 55, NULL, b'0');
INSERT INTO `sizes` VALUES (36, 54, NULL, b'0');
INSERT INTO `sizes` VALUES (37, 53, NULL, b'0');
INSERT INTO `sizes` VALUES (38, 52, NULL, b'0');
INSERT INTO `sizes` VALUES (39, 50, NULL, b'0');

-- ----------------------------
-- Table structure for spcify_results
-- ----------------------------
DROP TABLE IF EXISTS `spcify_results`;
CREATE TABLE `spcify_results`  (
  `sprid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sp_sid` int UNSIGNED NULL DEFAULT NULL COMMENT 'spdify_shoes外键',
  `sp_oid` int UNSIGNED NULL DEFAULT NULL COMMENT 'order外键',
  `sprscheme` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '定制方案',
  `sprsize` float NOT NULL COMMENT '结果尺寸',
  `sprnum` int UNSIGNED NOT NULL COMMENT '结果数量',
  `spremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  `spstate` int UNSIGNED NULL DEFAULT 1 COMMENT 'state',
  `spcify_shoe_id` int UNSIGNED NULL DEFAULT NULL COMMENT 'spdify_shoes外键orm',
  `order_id` int UNSIGNED NULL DEFAULT NULL COMMENT 'order外键orm',
  PRIMARY KEY (`sprid`) USING BTREE,
  INDEX `FK_spcify_results_oid`(`sp_oid` ASC) USING BTREE,
  INDEX `FK_spcify_results_sid`(`sp_sid` ASC) USING BTREE,
  CONSTRAINT `FK_spcify_results_oid` FOREIGN KEY (`sp_oid`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_spcify_results_sid` FOREIGN KEY (`sp_sid`) REFERENCES `spcify_shoes` (`spsid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '定制结果表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of spcify_results
-- ----------------------------
INSERT INTO `spcify_results` VALUES (1, 2, 15, '-1--87-', 43, 1, NULL, 3, 2, 15);
INSERT INTO `spcify_results` VALUES (2, 2, 16, '-1--396', 39, 1, '', 3, 2, 16);
INSERT INTO `spcify_results` VALUES (3, 2, 19, '-1-6-06', 36, 1, '<p>\r\n	hello</p>\r\n', 2, 2, 19);
INSERT INTO `spcify_results` VALUES (4, 2, 35, '0------', 40, 1, '<p>\r\n	定制鞋测试1</p>\r\n', 2, 2, 35);
INSERT INTO `spcify_results` VALUES (5, 2, 35, '1------', 35, 1, '<p>\r\n	定制鞋测试1</p>\r\n', 1, 2, 35);
INSERT INTO `spcify_results` VALUES (6, 2, 42, '10-56-7', 43, 1, '<p>\r\n	121</p>\r\n', 1, 2, 42);
INSERT INTO `spcify_results` VALUES (7, NULL, NULL, '-------', 36, 1, '', 0, 2, 53);

-- ----------------------------
-- Table structure for spcify_shoes
-- ----------------------------
DROP TABLE IF EXISTS `spcify_shoes`;
CREATE TABLE `spcify_shoes`  (
  `spsid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sp_tid` int UNSIGNED NULL DEFAULT NULL COMMENT 'types外键',
  `sp_bid` int UNSIGNED NULL DEFAULT NULL COMMENT 'brands外键',
  `spsseq` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '鞋编号',
  `spsname` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '定制鞋名称',
  `spsprices` float NOT NULL DEFAULT 0 COMMENT '价格',
  `spscontent` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '鞋子详细',
  `spspartnum` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '部件数量',
  `spspartinfo` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '部件信息',
  `spsgender` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL DEFAULT '男' COMMENT '鞋性别',
  `spscss` int UNSIGNED NULL DEFAULT NULL COMMENT '定制css',
  `spremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  `type_id` int UNSIGNED NOT NULL COMMENT 'types外键orm',
  `brand_id` int UNSIGNED NOT NULL COMMENT 'brands外键orm',
  PRIMARY KEY (`spsid`) USING BTREE,
  INDEX `FK_spcify_shoes_tid`(`sp_tid` ASC) USING BTREE,
  INDEX `FK_spcify_shoes_bid`(`sp_bid` ASC) USING BTREE,
  CONSTRAINT `FK_spcify_shoes_bid` FOREIGN KEY (`sp_bid`) REFERENCES `brands` (`bid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_spcify_shoes_tid` FOREIGN KEY (`sp_tid`) REFERENCES `types` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '定制鞋表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of spcify_shoes
-- ----------------------------
INSERT INTO `spcify_shoes` VALUES (2, 7, 14, '1314520520', 'chanel 至尊女鞋', 1500, '奢华无比', 7, '1:2:3:4:5:6:7-1:3:4-2:6:7-6:7', '女', 0, NULL, 7, 14);
INSERT INTO `spcify_shoes` VALUES (3, 4, 2, '111', 'adidas足球鞋', 880, '绿茵骄傲', 11, '1:2:3:4:5:6:7-1:3:4-2:6:7-6:7', '男', 0, NULL, 4, 2);
INSERT INTO `spcify_shoes` VALUES (4, 1, 3, '666', 'hhh', 888, 'jjj', 7, '88', '男', 77, NULL, 1, 3);
INSERT INTO `spcify_shoes` VALUES (5, 2, 8, '11', '百度一代', 360, '', 6, '33', '男', 6, NULL, 2, 8);
INSERT INTO `spcify_shoes` VALUES (6, NULL, NULL, '16763148', '鞋皇', 333, '啊啊啊', 4, '11111a', '男', 1111, '', 1, 1);

-- ----------------------------
-- Table structure for sps_sizes
-- ----------------------------
DROP TABLE IF EXISTS `sps_sizes`;
CREATE TABLE `sps_sizes`  (
  `spssid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sp_sid` int UNSIGNED NULL DEFAULT NULL COMMENT 'spcify_shoes外键',
  `sp_zid` int UNSIGNED NULL DEFAULT NULL COMMENT 'sizes外键',
  `spsstate` int UNSIGNED NOT NULL COMMENT '定制状态',
  `spremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  `spcify_shoe_id` int UNSIGNED NOT NULL COMMENT 'spcify_shoes外键orm',
  `size_id` int UNSIGNED NOT NULL COMMENT 'sizes外键orm',
  PRIMARY KEY (`spssid`) USING BTREE,
  INDEX `FK_sps_sizes_sid`(`sp_sid` ASC) USING BTREE,
  INDEX `FK_sps_sizes_zid`(`sp_zid` ASC) USING BTREE,
  CONSTRAINT `FK_sps_sizes_sid` FOREIGN KEY (`sp_sid`) REFERENCES `spcify_shoes` (`spsid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_sps_sizes_zid` FOREIGN KEY (`sp_zid`) REFERENCES `sizes` (`sizeid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '定制尺寸表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sps_sizes
-- ----------------------------
INSERT INTO `sps_sizes` VALUES (1, 2, 1, 1, NULL, 2, 1);
INSERT INTO `sps_sizes` VALUES (2, 2, 2, 1, NULL, 2, 2);
INSERT INTO `sps_sizes` VALUES (3, 2, 3, 1, NULL, 2, 3);
INSERT INTO `sps_sizes` VALUES (4, 2, 4, 1, NULL, 2, 4);
INSERT INTO `sps_sizes` VALUES (5, 2, 5, 1, NULL, 2, 5);
INSERT INTO `sps_sizes` VALUES (6, 2, 6, 1, NULL, 2, 6);
INSERT INTO `sps_sizes` VALUES (7, 2, 7, 1, NULL, 2, 7);
INSERT INTO `sps_sizes` VALUES (8, 2, 8, 1, NULL, 2, 8);
INSERT INTO `sps_sizes` VALUES (9, 2, 9, 1, NULL, 2, 9);
INSERT INTO `sps_sizes` VALUES (10, 2, 10, 1, NULL, 2, 10);
INSERT INTO `sps_sizes` VALUES (11, 3, 1, 1, NULL, 3, 1);
INSERT INTO `sps_sizes` VALUES (12, 3, 3, 1, NULL, 3, 3);
INSERT INTO `sps_sizes` VALUES (13, 4, 9, 1, NULL, 4, 9);
INSERT INTO `sps_sizes` VALUES (14, 4, 10, 1, NULL, 4, 10);
INSERT INTO `sps_sizes` VALUES (15, 4, 11, 1, NULL, 4, 11);
INSERT INTO `sps_sizes` VALUES (16, 5, 1, 1, NULL, 5, 1);
INSERT INTO `sps_sizes` VALUES (17, 5, 2, 1, NULL, 5, 2);
INSERT INTO `sps_sizes` VALUES (18, 5, 6, 1, NULL, 5, 6);
INSERT INTO `sps_sizes` VALUES (19, 5, 8, 1, NULL, 5, 8);
INSERT INTO `sps_sizes` VALUES (20, 5, 9, 1, NULL, 5, 9);
INSERT INTO `sps_sizes` VALUES (21, 5, 10, 1, NULL, 5, 10);
INSERT INTO `sps_sizes` VALUES (24, NULL, NULL, 1, '', 6, 4);
INSERT INTO `sps_sizes` VALUES (25, NULL, NULL, 1, '', 6, 6);

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限描述',
  `parent_id` int NOT NULL COMMENT '上级id',
  `front_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '前端地址',
  `back_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '后端地址',
  `level` tinyint NOT NULL COMMENT '当前层级',
  `type` tinyint NOT NULL COMMENT '1-目录 0-按钮',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES (3, '系统管理', '系统管理', 0, '/sys', '', 1, 1);
INSERT INTO `sys_resource` VALUES (4, '床位管理', '膳食管理', 0, '/meal', '', 1, 1);
INSERT INTO `sys_resource` VALUES (5, '用户列表', '', 3, '/user', '/user/list', 2, 1);
INSERT INTO `sys_resource` VALUES (6, '角色列表', '', 3, '/role', '/role/list', 2, 1);
INSERT INTO `sys_resource` VALUES (7, '添加用户', '', 5, '', '/user/add', 3, 0);
INSERT INTO `sys_resource` VALUES (8, '添加角色', '', 6, '', '/role/add,/role/check', 3, 0);
INSERT INTO `sys_resource` VALUES (9, '权限列表', '', 3, '/resource', '/sysResource/list', 2, 1);
INSERT INTO `sys_resource` VALUES (10, '床位列表', '膳食日历周表', 4, '/bed', '/bed/list', 2, 1);
INSERT INTO `sys_resource` VALUES (12, '修改权限', '', 9, '', '/sysResource/update,/sysResource/getById,/sysResource/check', 3, 0);
INSERT INTO `sys_resource` VALUES (13, '删除权限', '', 9, '', '/sysResource/del', 3, 0);
INSERT INTO `sys_resource` VALUES (14, '查询管理员', '', 5, '', '', 3, 0);
INSERT INTO `sys_resource` VALUES (15, '查询角色', '', 6, '', '', 3, 0);
INSERT INTO `sys_resource` VALUES (16, '查询权限', '', 9, '', '', 3, 0);
INSERT INTO `sys_resource` VALUES (20, '修改用户', '', 5, '', ' /user/update,/user/getById,/user/check', 3, 0);
INSERT INTO `sys_resource` VALUES (21, '删除用户', '', 5, '', '/user/del', 3, 0);
INSERT INTO `sys_resource` VALUES (22, '修改角色', '', 6, '', ' /role/update,/role/getById,/role/check', 3, 0);
INSERT INTO `sys_resource` VALUES (23, '删除角色', '', 6, '', '/role/del', 3, 0);
INSERT INTO `sys_resource` VALUES (24, '用户', '', 6, '', '/userRole/getUser,/userRole/save', 3, 0);
INSERT INTO `sys_resource` VALUES (25, '分配权限', '', 6, '', '/roleResource/getResource,/roleResource/save', 3, 0);
INSERT INTO `sys_resource` VALUES (26, '添加权限', '', 9, '', '/sysResource/add,/sysResource/check', 3, 0);
INSERT INTO `sys_resource` VALUES (27, '添加下级', '', 9, '', '/sysResource/add,/sysResource/check', 3, 0);
INSERT INTO `sys_resource` VALUES (28, '离床登记', '膳食管理', 4, '/outin', '/outin/list', 2, 1);
INSERT INTO `sys_resource` VALUES (30, '添加', '添加菜肴', 10, '', '/bed/add', 3, 0);
INSERT INTO `sys_resource` VALUES (31, '修改', '修改菜品信息', 10, '', '/bed/update,/bed/getById,/bed/check', 3, 0);
INSERT INTO `sys_resource` VALUES (32, '删除', '删除菜肴', 10, '', '/bed/del', 3, 0);
INSERT INTO `sys_resource` VALUES (33, '添加', '添加需要特别关注的客户信息', 28, '', '/outin/add', 3, 0);
INSERT INTO `sys_resource` VALUES (34, '修改', '修改客户信息', 28, '', '/outin/update,/outin/getById,/outin/check', 3, 0);
INSERT INTO `sys_resource` VALUES (35, '删除', '删除客户信息', 28, '', '/outin/del', 3, 0);
INSERT INTO `sys_resource` VALUES (36, '查询', '查询指定客户信息', 28, '', '', 3, 0);
INSERT INTO `sys_resource` VALUES (39, '客户管理', '管理客户登记', 0, '/registration', '', 1, 1);
INSERT INTO `sys_resource` VALUES (40, '入住登记', '客户入住登记', 39, '/checkIn', '/checkIn/list', 2, 1);
INSERT INTO `sys_resource` VALUES (41, '登记', '添加客户入住信息', 40, '', '/checkIn/add', 3, 0);
INSERT INTO `sys_resource` VALUES (42, '退住登记', '客户退住登记', 39, '/checkOut', '/checkOut/list', 2, 1);
INSERT INTO `sys_resource` VALUES (43, '添加', '添加退住人员', 42, '', '/checkOut/add', 3, 0);
INSERT INTO `sys_resource` VALUES (44, '外出登记', '客户外出登记', 39, '/goOut', '/goOut/list', 2, 1);
INSERT INTO `sys_resource` VALUES (45, '登记', '添加外出客户', 44, '', '/goOut/add', 3, 0);
INSERT INTO `sys_resource` VALUES (46, '护理模块', '护理模块', 0, '/nurse', '', 1, 1);
INSERT INTO `sys_resource` VALUES (49, '护理记录', '护理记录', 46, '/records', '/records/list', 2, 1);
INSERT INTO `sys_resource` VALUES (50, '搜索', '添加护理记录', 49, '', '', 3, 0);
INSERT INTO `sys_resource` VALUES (51, '护理级别', '护理级别', 46, '/level', '/level/list', 2, 1);
INSERT INTO `sys_resource` VALUES (52, '添加', '添加护理级别', 51, '', '/level/add', 3, 0);
INSERT INTO `sys_resource` VALUES (53, '护理内容', '护理内容', 46, '/content', '/content/list', 2, 1);
INSERT INTO `sys_resource` VALUES (54, '添加', '添加护理内容', 53, '', '/content/add', 3, 0);
INSERT INTO `sys_resource` VALUES (55, '膳食管理', '床位管理', 0, '/bedroom', '', 1, 1);
INSERT INTO `sys_resource` VALUES (56, '膳食日历', '床位列表', 55, '/dietarycalendar', '/dietarycalendar/list', 2, 1);
INSERT INTO `sys_resource` VALUES (57, '添加', '添加床位', 56, '', '/dietarycalendar/add', 3, 0);
INSERT INTO `sys_resource` VALUES (58, '膳食管理', '离床登记', 55, '/dietarymanagement', '/dietarymanagement/list', 2, 1);
INSERT INTO `sys_resource` VALUES (59, '添加', '添加', 58, '', '/dietarymanagement/add', 3, 0);
INSERT INTO `sys_resource` VALUES (66, '修改', '修改信息', 40, '', '/checkIn/update,/checkIn/getById,/checkIn/check', 3, 0);
INSERT INTO `sys_resource` VALUES (67, '删除', '删除信息', 40, '', '/checkIn', 3, 0);
INSERT INTO `sys_resource` VALUES (68, '修改', '', 42, '', '/checkOut/update,/checkOut/getById,/checkOut/check', 3, 0);
INSERT INTO `sys_resource` VALUES (69, '删除', '', 42, '', '/checkOut/del', 3, 0);
INSERT INTO `sys_resource` VALUES (70, '查询', '', 42, '', '', 3, 0);
INSERT INTO `sys_resource` VALUES (71, '查询', '', 40, '', '', 3, 0);
INSERT INTO `sys_resource` VALUES (72, '修改', '', 44, '', '/goOut/update,/goOut/getById,/goOut/check', 3, 0);
INSERT INTO `sys_resource` VALUES (74, '修改', '', 51, '', '/level/update,/level/getById,/level/check', 3, 0);
INSERT INTO `sys_resource` VALUES (75, '禁用', '', 51, '', '/level/del', 3, 0);
INSERT INTO `sys_resource` VALUES (76, '搜索', '', 51, '', '', 3, 0);
INSERT INTO `sys_resource` VALUES (77, '修改', '', 53, '', '/content/update,/content/getById,/content/check', 3, 0);
INSERT INTO `sys_resource` VALUES (78, '删除', '', 53, '', '/content/del', 3, 0);
INSERT INTO `sys_resource` VALUES (79, '修改', '', 56, '', '/dietarycalendar/update,/dietarycalendar/getById,/dietarycalendar/check', 3, 0);
INSERT INTO `sys_resource` VALUES (80, '删除', '', 56, '', '/dietarycalendar/del', 3, 0);
INSERT INTO `sys_resource` VALUES (82, '修改', '', 58, '', '/dietarymanagement/update,/dietarymanagement/getById,/dietarymanagement/check', 3, 0);
INSERT INTO `sys_resource` VALUES (83, '删除', '', 58, '', '/dietarymanagement/del', 3, 0);
INSERT INTO `sys_resource` VALUES (84, '搜索', '', 58, '', '', 3, 0);
INSERT INTO `sys_resource` VALUES (88, '健康管理', '健康管理', 0, '/health', '', 1, 1);
INSERT INTO `sys_resource` VALUES (89, '设置服务对象', '', 88, '/service', '/service/list', 2, 1);
INSERT INTO `sys_resource` VALUES (90, '服务关注', '', 88, '/focus', '/focus/list', 2, 1);
INSERT INTO `sys_resource` VALUES (91, '添加', '', 89, '', '/service/add', 3, 0);
INSERT INTO `sys_resource` VALUES (92, '添加', '', 90, '', '/focus/add', 3, 0);
INSERT INTO `sys_resource` VALUES (93, '搜索', '', 10, '', '', 3, 0);
INSERT INTO `sys_resource` VALUES (94, '膳食统计', '', 55, '/dietarystatistics', '', 2, 1);
INSERT INTO `sys_resource` VALUES (95, '搜索', '', 94, '', '', 3, 0);
INSERT INTO `sys_resource` VALUES (96, '生活提醒', '', 88, '/lifereminder', '/lifereminder/list', 2, 1);
INSERT INTO `sys_resource` VALUES (97, '添加', '', 96, '', '/lifereminder/add', 3, 0);
INSERT INTO `sys_resource` VALUES (98, '投诉反馈', '', 88, '/feedback', '/feedback/list', 2, 1);
INSERT INTO `sys_resource` VALUES (99, '添加', '', 98, '', '/feedback/add', 3, 0);
INSERT INTO `sys_resource` VALUES (100, '生活管理', '', 0, '/lifemanagement', '', 1, 1);
INSERT INTO `sys_resource` VALUES (101, '班车路线', '', 100, '/busroute', '/busrouts/list', 2, 1);
INSERT INTO `sys_resource` VALUES (102, '添加', '', 101, '', '/busroute/add', 3, 0);
INSERT INTO `sys_resource` VALUES (103, '天气情况', '', 100, '/weather', '/weather/list', 2, 1);
INSERT INTO `sys_resource` VALUES (104, '添加', '', 103, '', '/weather/add', 3, 0);
INSERT INTO `sys_resource` VALUES (107, '订单生成', '', 0, '/order', '', 1, 1);
INSERT INTO `sys_resource` VALUES (108, '提交订单', '提交订单', 107, '/order', '', 2, 1);
INSERT INTO `sys_resource` VALUES (109, '个人中心', '', 0, '/personal', '', 1, 1);
INSERT INTO `sys_resource` VALUES (113, '客服', '', 0, '/consult', '', 1, 1);
INSERT INTO `sys_resource` VALUES (114, '人工客服', '', 113, '/consult', '', 2, 1);
INSERT INTO `sys_resource` VALUES (115, '个人中心', '', 109, '/personal', '', 2, 1);
INSERT INTO `sys_resource` VALUES (116, '购物车', '', 107, '/shoppingcart', '', 2, 1);
INSERT INTO `sys_resource` VALUES (117, '添加地址', '', 108, '', '/order/add', 3, 0);
INSERT INTO `sys_resource` VALUES (118, '删除地址', '', 108, '', '/order/del', 3, 0);
INSERT INTO `sys_resource` VALUES (119, '更新地址', '', 108, '', '/order/update,/order/getById,/order/check', 3, 0);
INSERT INTO `sys_resource` VALUES (120, '默认地址', '', 108, '', '/order/getDefault,/order/setDefault', 3, 0);

-- ----------------------------
-- Table structure for types
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types`  (
  `tid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tname` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '类型名称',
  `tremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  `tdelete` bit(1) NOT NULL DEFAULT b'0' COMMENT '禁用标志',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '鞋类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of types
-- ----------------------------
INSERT INTO `types` VALUES (1, '高跟鞋', NULL, b'0');
INSERT INTO `types` VALUES (2, '篮球鞋', NULL, b'0');
INSERT INTO `types` VALUES (3, '网球鞋', NULL, b'0');
INSERT INTO `types` VALUES (4, '足球鞋', NULL, b'0');
INSERT INTO `types` VALUES (5, '跑步鞋', NULL, b'0');
INSERT INTO `types` VALUES (6, '板鞋', NULL, b'0');
INSERT INTO `types` VALUES (7, '凉鞋', '夏天凉鞋===', b'0');
INSERT INTO `types` VALUES (8, '拖鞋', NULL, b'1');
INSERT INTO `types` VALUES (9, '测试', '测试1', b'0');
INSERT INTO `types` VALUES (10, 'demo', '测试', b'0');
INSERT INTO `types` VALUES (11, 'test', '', b'0');
INSERT INTO `types` VALUES (12, '嗷嗷嗷嗷', NULL, b'0');
INSERT INTO `types` VALUES (13, '顶顶顶顶顶', NULL, b'0');
INSERT INTO `types` VALUES (14, '顶顶顶顶', NULL, b'0');
INSERT INTO `types` VALUES (15, '呃呃呃呃呃', NULL, b'0');
INSERT INTO `types` VALUES (16, '顶顶顶顶', NULL, b'0');
INSERT INTO `types` VALUES (17, '三生三世', NULL, b'0');
INSERT INTO `types` VALUES (19, '跳跳糖', NULL, b'0');
INSERT INTO `types` VALUES (20, '1', NULL, b'1');
INSERT INTO `types` VALUES (21, '123', NULL, b'1');
INSERT INTO `types` VALUES (22, '123', NULL, b'0');
INSERT INTO `types` VALUES (23, '2222', NULL, b'0');
INSERT INTO `types` VALUES (24, '请求请求群', NULL, b'0');
INSERT INTO `types` VALUES (25, '呜呜呜呜', NULL, b'0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `sex` tinyint NOT NULL COMMENT '性别',
  `birthday` date NOT NULL COMMENT '生日',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '员工类别',
  `worktime` date NULL DEFAULT NULL COMMENT '入职时间',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '人员状态 0-离职 1-在职',
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简介',
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号码',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电子邮箱',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '王八', 1, '2000-05-11', '董事长', '2025-06-23', 1, '好人', '13956564747', '151280@163.com', '123456');
INSERT INTO `user` VALUES (2, '双面龟', 0, '1991-02-07', '护工', '2025-06-23', 1, '好人', '13946567080', '8092233@163.com', '$2a$10$fPwFw4QQjm6sLPcuULlcou9W0LvX5yPtLnGA7u4WHjGH3ROEd1mce');
INSERT INTO `user` VALUES (3, '蔡澜', 0, '2020-03-04', '厨师', '2025-06-23', 1, '好人', '15179896060', '15123@163.com', '$2a$10$e2hCcPyjN8AbEIYzdi68SujreugJ3gtfJ/9/pklMUwXTpEr77DRna');
INSERT INTO `user` VALUES (4, '魔团团', 0, '2010-08-02', '医生', '2025-06-23', 1, '玩儿推', '15179897081', '1512233@163.com', '$2a$10$oVAvv.9fTok/T.GMh/NxwuOdqllyJkclSV9TrdSWvqdDuhFQ09QNW');
INSERT INTO `user` VALUES (20, '蒜头王八', 0, '2024-08-30', '管家', '2025-06-23', 1, '妙蛙种子，巴拉巴拉', '19932', '1316484@qq.com', '123456');
INSERT INTO `user` VALUES (22, '青蛙1号', 0, '2024-08-12', '管家', '2025-06-23', 1, '1', '15131645578', '2625493@qq.com', '$2a$10$o/7TD4CMET.GlCah..4QqOvTWT41HKBSlFQIcWbtzay20jyTwPCUy');
INSERT INTO `user` VALUES (23, '青蛙2号', 1, '2000-01-01', '前台', '2025-06-23', 1, 'zds', '15334674186', '114514@qq.com', '$2a$10$SJ/RdV7r1UR.rQ/aHy6OD.Kq8A9YQC.DUvkhx8Tg61lUB6VK1MLaq');
INSERT INTO `user` VALUES (24, '青蛙三号', 1, '2000-01-01', '护工', '2025-06-23', 1, 'ss', '15631111111', '111111@qq.com', '$2a$10$3lxnKjZeQNgqlFJ4Giiuk.PZcF0wDsSgzSibNe1nDcYpYGBNyKR2S');
INSERT INTO `user` VALUES (33, '启明', 1, '2025-06-12', '董事长', '2025-06-23', 1, NULL, '15131645579', '2897644958@qq.com', '$2a$10$KLFNKIPB5ESmZlZjWwOnJuEBknTusOaWbsY2mg5kyEIhq4vR3YxDK');
INSERT INTO `user` VALUES (35, '李', 1, '2025-06-13', '董事长', '2025-06-18', 1, '111', '13643147739', '2336218576@qq.com', '$2a$10$xZY8hNf4r6q4T9NDEUhjA.qh4a4mRKfGc4AzP2OPxz/V8VCjKq/mK');
INSERT INTO `user` VALUES (36, '梅菜扣肉', 1, '2000-01-01', '', '2000-01-01', 0, '1111', '15932297828', '2484246430@qq.com', '$2a$10$smd.qhtCoMfJkIA9OtNyju2s2MowzHsmevyIyou9jVKi56rchckBy');
INSERT INTO `user` VALUES (37, '启明', 0, '2020-09-16', '董事长', '2025-09-18', 1, NULL, '19932839570', '1316482334@qq.com', '$2a$10$1q.b5q1bafEjE9sB/B5zT.DVVeC8qhJdbKHXiiyMYRUlEGG60HtBy');
INSERT INTO `user` VALUES (38, '796631', 0, '2025-09-08', NULL, NULL, 1, NULL, '19932839571', '2108933462@qq.com', '$2a$10$q3XsF3nH6lOFFnErLDPPZO4m44/bEUWJxiYEXWmd5Bw299a5tfA7S');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户id',
  `role_id` int NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (36, 1, 3);
INSERT INTO `user_role` VALUES (37, 4, 3);
INSERT INTO `user_role` VALUES (38, 5, 3);
INSERT INTO `user_role` VALUES (80, 3, 4);
INSERT INTO `user_role` VALUES (82, 23, 5);
INSERT INTO `user_role` VALUES (83, 22, 6);
INSERT INTO `user_role` VALUES (91, 24, 2);
INSERT INTO `user_role` VALUES (92, 2, 2);
INSERT INTO `user_role` VALUES (93, 1, 2);
INSERT INTO `user_role` VALUES (101, 37, 1);
INSERT INTO `user_role` VALUES (102, 35, 1);
INSERT INTO `user_role` VALUES (103, 33, 1);
INSERT INTO `user_role` VALUES (104, 1, 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `uid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uaccount` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '用户账号',
  `uname` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '用户姓名',
  `utel` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '用户电话',
  `ugender` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL DEFAULT '男' COMMENT '用户性别',
  `upwd` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '用户密码',
  `uemail` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '用户email',
  `uregtime` datetime NULL DEFAULT NULL COMMENT '注册时间',
  `uintegral` float NULL DEFAULT 0 COMMENT '用户积分',
  `uinfo` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '个人简介',
  `upwdask` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '密保问题',
  `upwdans` varchar(45) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '密保答案',
  `udelete` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '禁用标志',
  `uremarks` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '备注',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '前台用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'rose', 'jake', '19980809090', '女', '123456', 'bozoua@qq.com', '2015-01-01 00:00:00', 11599, '', '周卓的爸爸是谁？', '邹波', 0, '');
INSERT INTO `users` VALUES (2, 'peter', 'pete', '13920615869', '男', '666666', 'peter@163.com', '2015-01-01 00:13:00', 800, NULL, '您父亲的名字', 'hello1', 0, NULL);
INSERT INTO `users` VALUES (4, 'rose', 'sss', '3444', '女', '345678', 'rose@163.com', '2015-01-03 00:00:00', 12, NULL, '', '附属设施', 0, NULL);
INSERT INTO `users` VALUES (5, 'peter1', 'p', '22', '男', '33', 'peter1@163.com', '2015-01-05 00:00:00', 0, NULL, '', '', 1, NULL);
INSERT INTO `users` VALUES (6, 'pet99', 'dd', '12', '女', '12', 'pet@163.com', '2015-01-07 00:00:00', 0, NULL, 'hello', 'ok', 1, NULL);
INSERT INTO `users` VALUES (8, 'uuu', 'hello', '13166666666', '男', '333333', 'uuu@163.com', '2015-01-09 15:00:13', 0, NULL, '', '', 0, NULL);
INSERT INTO `users` VALUES (9, 'AAAA', 'AAAA', '13166666666', '男', '333333', 'AAAA@163.com', '2015-01-10 16:00:13', 0, NULL, '', '', 0, NULL);
INSERT INTO `users` VALUES (10, 'zhangsan ', '张三', '13876543675', '男', '111111', 'zhangsan@163.com', '2015-01-22 10:43:38', 200, NULL, '您孩子的名字', '张四', 0, NULL);
INSERT INTO `users` VALUES (11, 'xxxx', 'xxxx', '13787654343', '女', '111111', 'xxxx@163.com', '2015-01-22 11:00:26', 200, NULL, '您孩子的名字', 'yyyy', 0, NULL);
INSERT INTO `users` VALUES (12, 'lisi', '李四', '15987654321', '男', '111111', 'lisi@163.com', '2015-01-22 12:54:51', 200, NULL, '您孩子的名字', '李五', 0, NULL);
INSERT INTO `users` VALUES (13, 'tiantian', '天天', '15654325789', '男', '123456', 'tiantian@163.com', '2015-03-19 21:34:16', 200, NULL, '您孩子的名字', 'guoguo', 0, NULL);
INSERT INTO `users` VALUES (14, 'kuaile1', '快乐', '18676543214', '男', '111111', 'kuaile@126.com', '2015-04-17 14:49:56', 200, NULL, '您配偶的名字', 'gaoxing1', 0, NULL);
INSERT INTO `users` VALUES (15, 'shuixian', '张兰', '13792359770', '女', '19820926', 'shuixian_926@163.com', '2015-05-25 14:31:08', 200, NULL, '您孩子的名字', '生日', 0, NULL);
INSERT INTO `users` VALUES (16, 'ceshi1', '测试2', '13765432345', '女', '111111', 'ceshi1@163.com', '2015-05-28 09:59:59', 300, NULL, '您孩子的名字', 'xx', 0, NULL);
INSERT INTO `users` VALUES (26, 'Chao', 'Lu', '13808642298', '女', '444444', 'chaoluk@isoftstone.com', '2021-07-20 10:02:05', 200, '', '您母亲的名字', 'bbbb', 0, '');
INSERT INTO `users` VALUES (34, 'Snail', '陆超', '13808642298', '男', '123123', 'chaoluk@isoftstone.com', '2021-08-10 11:39:56', 200, '', '您配偶的名字', '张三', 0, '');
INSERT INTO `users` VALUES (35, 'aaaa', 'aaaa', '05376655443', '男', '123456', 'jake@qq.com', '2015-01-01 00:00:00', 300, NULL, 'AAAAA', 'bbbbbb', 0, NULL);
INSERT INTO `users` VALUES (36, 'wangwu', '大刀王五', '19909090000', '男', '123456', '9090@qq.com', NULL, 0, NULL, NULL, NULL, 0, NULL);
INSERT INTO `users` VALUES (37, 'lisi', '李四', '19909090000', '男', '123456', '9090@qq.com', NULL, 0, NULL, NULL, NULL, 0, NULL);
INSERT INTO `users` VALUES (38, 'libai', '李白', '19908088080', '男', '123123', 'libai@qq.com', NULL, 0, NULL, NULL, NULL, 0, NULL);
INSERT INTO `users` VALUES (39, 'dianwei', '典韦', '9090', '男', '123123', 'dianwei@qq.com', '2022-03-01 16:48:41', 0, NULL, NULL, NULL, 0, NULL);
INSERT INTO `users` VALUES (40, 'ake', '金科', '8080', '女', '123123', 'jinke@qq.com', '2022-03-01 16:53:34', 0, NULL, NULL, NULL, 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
