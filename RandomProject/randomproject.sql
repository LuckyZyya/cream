/*
 Navicat Premium Data Transfer

 Source Server         : zy
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : randomproject

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 27/05/2021 15:16:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  INDEX `menuId`(`menuId`) USING BTREE,
  CONSTRAINT `authority_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `authority_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1281 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES (1230, 1, 1);
INSERT INTO `authority` VALUES (1232, 1, 17);
INSERT INTO `authority` VALUES (1233, 1, 18);
INSERT INTO `authority` VALUES (1234, 1, 19);
INSERT INTO `authority` VALUES (1235, 1, 20);
INSERT INTO `authority` VALUES (1237, 1, 21);
INSERT INTO `authority` VALUES (1238, 1, 22);
INSERT INTO `authority` VALUES (1239, 1, 23);
INSERT INTO `authority` VALUES (1240, 1, 35);
INSERT INTO `authority` VALUES (1241, 1, 36);
INSERT INTO `authority` VALUES (1244, 1, 24);
INSERT INTO `authority` VALUES (1245, 1, 25);
INSERT INTO `authority` VALUES (1246, 1, 26);
INSERT INTO `authority` VALUES (1251, 1, 37);
INSERT INTO `authority` VALUES (1252, 1, 38);
INSERT INTO `authority` VALUES (1253, 1, 39);
INSERT INTO `authority` VALUES (1254, 1, 40);
INSERT INTO `authority` VALUES (1255, 1, 41);
INSERT INTO `authority` VALUES (1256, 1, 42);
INSERT INTO `authority` VALUES (1257, 1, 43);
INSERT INTO `authority` VALUES (1258, 1, 44);
INSERT INTO `authority` VALUES (1259, 1, 45);
INSERT INTO `authority` VALUES (1260, 1, 46);
INSERT INTO `authority` VALUES (1261, 1, 67);
INSERT INTO `authority` VALUES (1262, 1, 47);
INSERT INTO `authority` VALUES (1263, 1, 48);
INSERT INTO `authority` VALUES (1264, 1, 49);
INSERT INTO `authority` VALUES (1265, 1, 50);
INSERT INTO `authority` VALUES (1266, 1, 51);
INSERT INTO `authority` VALUES (1267, 1, 64);
INSERT INTO `authority` VALUES (1268, 1, 52);
INSERT INTO `authority` VALUES (1269, 1, 53);
INSERT INTO `authority` VALUES (1270, 1, 54);
INSERT INTO `authority` VALUES (1271, 1, 55);
INSERT INTO `authority` VALUES (1272, 1, 56);
INSERT INTO `authority` VALUES (1273, 1, 57);
INSERT INTO `authority` VALUES (1274, 1, 58);
INSERT INTO `authority` VALUES (1275, 1, 60);
INSERT INTO `authority` VALUES (1276, 1, 61);
INSERT INTO `authority` VALUES (1277, 1, 62);
INSERT INTO `authority` VALUES (1278, 1, 63);
INSERT INTO `authority` VALUES (1279, 1, 65);
INSERT INTO `authority` VALUES (1280, 1, 66);

-- ----------------------------
-- Table structure for c3p0testtable
-- ----------------------------
DROP TABLE IF EXISTS `c3p0testtable`;
CREATE TABLE `c3p0testtable`  (
  `a` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subjectId` int(11) NOT NULL,
  `startTime` datetime(0) NOT NULL,
  `endTime` datetime(0) NOT NULL,
  `avaliableTime` int(8) NOT NULL,
  `questionNum` int(5) NOT NULL,
  `totalScore` int(5) NOT NULL,
  `passScore` int(5) NOT NULL,
  `singleQuestionNum` int(5) NOT NULL,
  `muiltQuestionNum` int(5) NOT NULL,
  `chargeQuestionNum` int(5) NOT NULL,
  `fillsQuestionNum` int(5) NOT NULL,
  `paperNum` int(5) NOT NULL DEFAULT 0,
  `examedNum` int(5) NOT NULL DEFAULT 0,
  `examDiffcult` int(5) DEFAULT NULL,
  `examDistribute` int(5) DEFAULT NULL,
  `passNum` int(5) NOT NULL,
  `createTime` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subjectId`(`subjectId`) USING BTREE,
  CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES (2, '软件工程期中考试', 1, '2021-01-01 00:00:00', '2021-04-03 00:00:00', 60, 7, 16, 5, 5, 1, 1, 0, 6, 5, -1, 0, 4, '2021-01-01 00:00:00');
INSERT INTO `exam` VALUES (3, '计算机基本知识小测验', 1, '2021-01-02 20:28:48', '2021-04-03 20:28:51', 2, 11, 28, 20, 4, 3, 4, 0, 2, 2, -1, 0, 0, '2021-01-01 00:00:00');
INSERT INTO `exam` VALUES (4, '软件工程课堂随机小测试', 1, '2021-01-03 11:45:00', '2021-04-04 11:12:02', 1, 2, 6, 2, 1, 1, 0, 0, 2, 2, -1, 0, 2, '2021-01-01 00:00:00');
INSERT INTO `exam` VALUES (5, '物理课堂测验', 6, '2021-01-04 16:48:31', '2021-04-04 16:48:34', 30, 3, 8, 4, 1, 1, 1, 0, 1, 1, -1, 0, 1, '2021-01-01 00:00:00');
INSERT INTO `exam` VALUES (6, '软件工程2018期末考试', 1, '2021-01-11 17:00:05', '2021-04-05 17:00:16', 60, 14, 36, 20, 6, 4, 4, 0, 0, 0, NULL, 0, 0, '2021-01-01 00:00:00');
INSERT INTO `exam` VALUES (7, '测试随机', 1, '2021-01-12 03:42:32', '2021-04-24 03:42:38', 10, 6, 18, 5, 2, 0, 2, 0, 1, 1, NULL, 0, 0, '2021-04-17 03:43:03');
INSERT INTO `exam` VALUES (8, '测试随机', 1, '2021-04-19 00:05:01', '2021-04-30 00:05:04', 10, 7, 20, 5, 2, 1, 2, 0, 1, 3, NULL, 0, 0, '2021-04-19 00:05:31');
INSERT INTO `exam` VALUES (9, '题型测试', 1, '2021-04-19 21:05:57', '2021-04-30 21:06:00', 10, 14, 42, 5, 3, 3, 3, 0, 1, 1, NULL, 0, 0, '2021-04-19 21:07:23');
INSERT INTO `exam` VALUES (10, 'tx', 1, '2021-04-19 22:26:37', '2021-04-20 22:26:39', 10, 10, 26, 5, 5, 3, 2, 0, 1, 3, NULL, 0, 1, '2021-04-19 22:26:51');
INSERT INTO `exam` VALUES (11, '测试填空', 1, '2021-04-20 10:40:11', '2021-04-23 10:40:14', 10, 10, 24, 5, 5, 2, 2, 1, 1, 11, NULL, 0, 1, '2021-04-20 10:40:29');
INSERT INTO `exam` VALUES (12, '填空', 1, '2021-04-20 18:56:24', '2021-04-28 18:56:26', 200, 10, 24, 5, 3, 2, 2, 3, 1, 1, NULL, 0, 1, '2021-04-20 18:57:04');
INSERT INTO `exam` VALUES (13, '填空3', 1, '2021-04-24 10:42:28', '2021-04-30 10:42:31', 200, 11, 28, 5, 3, 3, 2, 3, 1, 0, 0, NULL, 0, '2021-04-24 10:43:00');
INSERT INTO `exam` VALUES (14, '测试考试', 1, '2021-04-24 13:36:55', '2021-04-30 13:36:57', 300, 12, 28, 5, 5, 2, 2, 3, 1, 1, 0, NULL, 1, '2021-04-24 13:37:12');
INSERT INTO `exam` VALUES (15, '模拟考试', 1, '2021-04-24 17:14:26', '2021-04-30 17:14:28', 100, 9, 22, 5, 3, 2, 2, 2, 1, 0, 0, NULL, 0, '2021-04-24 17:14:41');
INSERT INTO `exam` VALUES (19, '测试难度', 1, '2021-04-24 21:55:04', '2021-04-30 21:55:06', 100, 9, 22, 5, 3, 2, 2, 2, 1, 0, 0, NULL, 0, '2021-04-24 21:57:57');
INSERT INTO `exam` VALUES (22, '小测试', 1, '2021-04-25 01:05:29', '2021-04-30 01:05:31', 100, 8, 20, 5, 2, 2, 2, 2, 1, 1, -1, NULL, 0, '2021-04-25 01:05:48');
INSERT INTO `exam` VALUES (23, '小测验', 1, '2021-04-22 03:48:32', '2021-04-30 03:48:37', 111, 11, 26, 2, 5, 2, 2, 2, 1, 0, -1, NULL, 0, '2021-04-26 03:49:05');
INSERT INTO `exam` VALUES (24, '测试考试的系统', 1, '2021-04-28 13:22:47', '2021-04-30 13:22:49', 1, 8, 20, 5, 2, 2, 2, 2, 0, 0, -1, NULL, 0, '2021-04-28 13:23:14');
INSERT INTO `exam` VALUES (25, '考试试题', 1, '2021-04-28 16:44:39', '2021-04-30 16:44:41', 5, 11, 28, 5, 3, 3, 3, 2, 0, 0, -1, NULL, 0, '2021-04-28 16:44:57');
INSERT INTO `exam` VALUES (26, '试题简单', 1, '2021-04-30 09:45:37', '2021-05-01 09:45:40', 100, 11, 26, 5, 5, 2, 2, 2, 1, 1, 0, NULL, 1, '2021-04-30 09:46:04');
INSERT INTO `exam` VALUES (27, '测试中等难度', 1, '2021-04-30 10:37:29', '2021-05-01 10:37:32', 100, 5, 12, 5, 2, 1, 1, 1, 1, 0, 1, NULL, 0, '2021-04-30 10:37:50');
INSERT INTO `exam` VALUES (28, 'hh', 1, '2021-05-01 15:05:47', '2021-05-02 15:05:50', 100, 8, 20, 5, 2, 2, 2, 2, 0, 0, -1, 0, 0, '2021-05-01 15:06:00');
INSERT INTO `exam` VALUES (36, '测试', 1, '2021-05-05 10:50:58', '2021-05-08 10:51:00', 10, 8, 20, 5, 2, 2, 2, 2, 2, 1, 0, 2, 0, '2021-05-05 10:51:22');
INSERT INTO `exam` VALUES (37, '测试难度', 1, '2021-05-12 15:35:22', '2021-05-14 15:35:24', 100, 8, 20, 60, 2, 2, 2, 2, 0, 0, -1, 1, 0, '2021-05-12 15:35:52');
INSERT INTO `exam` VALUES (38, '知识点', 1, '2021-05-12 15:35:22', '2021-05-22 15:35:24', 100, 9, 22, 60, 3, 2, 2, 2, 0, 0, -1, 1, 0, '2021-05-12 15:37:28');

-- ----------------------------
-- Table structure for exampaper
-- ----------------------------
DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE `exampaper`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0,
  `totalScore` int(5) NOT NULL DEFAULT 0,
  `score` int(5) NOT NULL DEFAULT 0,
  `startExamTime` datetime(0) DEFAULT NULL,
  `endExamTime` datetime(0) DEFAULT NULL,
  `useTime` int(8) DEFAULT NULL,
  `createTime` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `examId`(`examId`) USING BTREE,
  INDEX `studentId`(`studentId`) USING BTREE,
  CONSTRAINT `exampaper_ibfk_1` FOREIGN KEY (`examId`) REFERENCES `exam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exampaper_ibfk_2` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exampaper
-- ----------------------------
INSERT INTO `exampaper` VALUES (9, 2, 6, 1, 10, 6, '2021-01-04 11:04:02', '2021-01-04 11:07:11', 3, '2021-01-04 11:06:49');
INSERT INTO `exampaper` VALUES (10, 4, 6, 1, 6, 6, '2021-01-04 11:12:32', '2021-01-04 11:13:31', 5, '2021-01-04 11:12:32');
INSERT INTO `exampaper` VALUES (11, 3, 6, 1, 28, 4, '2021-01-04 13:25:22', '2021-01-04 13:26:30', 1, '2021-01-04 13:25:22');
INSERT INTO `exampaper` VALUES (12, 5, 8, 1, 8, 4, '2021-01-04 16:55:38', '2021-01-04 16:55:58', 5, '2021-01-04 16:55:38');
INSERT INTO `exampaper` VALUES (14, 2, 9, 1, 10, 8, '2021-01-04 18:20:37', '2021-01-04 18:20:56', 5, '2021-01-04 18:20:37');
INSERT INTO `exampaper` VALUES (15, 2, 10, 1, 10, 6, '2021-01-04 18:22:29', '2021-01-04 18:22:46', 3, '2021-01-04 18:22:29');
INSERT INTO `exampaper` VALUES (16, 2, 11, 1, 10, 2, '2021-01-04 18:24:07', '2021-01-04 18:24:19', 5, '2021-01-04 18:24:07');
INSERT INTO `exampaper` VALUES (17, 4, 11, 1, 6, 2, '2021-01-04 18:24:51', '2021-01-04 18:25:50', 3, '2021-01-04 18:24:51');
INSERT INTO `exampaper` VALUES (18, 3, 11, 1, 28, 6, '2021-01-04 18:26:25', '2021-01-04 18:26:44', 6, '2021-01-04 18:26:25');
INSERT INTO `exampaper` VALUES (19, 2, 13, 0, 16, 0, NULL, NULL, NULL, '2021-04-01 17:04:17');
INSERT INTO `exampaper` VALUES (20, 7, 2, 1, 12, 0, '2021-04-18 23:43:42', '2021-04-18 23:44:03', 0, '2021-04-17 16:21:06');
INSERT INTO `exampaper` VALUES (21, 8, 2, 1, 20, 0, '2021-04-19 21:00:34', '2021-04-19 21:00:47', 0, '2021-04-19 00:05:46');
INSERT INTO `exampaper` VALUES (22, 9, 2, 1, 42, 0, '2021-04-19 21:35:20', '2021-04-19 21:35:36', 0, '2021-04-19 21:35:20');
INSERT INTO `exampaper` VALUES (23, 10, 2, 1, 26, 6, '2021-04-20 09:05:16', '2021-04-20 09:05:40', 6, '2021-04-19 22:27:26');
INSERT INTO `exampaper` VALUES (24, 11, 2, 1, 24, 0, '2021-04-20 18:50:50', '2021-04-20 19:01:52', 8, '2021-04-20 10:40:49');
INSERT INTO `exampaper` VALUES (25, 12, 2, 1, 20, 6, '2021-04-24 19:05:54', '2021-04-24 19:06:27', 5, '2021-04-20 18:57:54');
INSERT INTO `exampaper` VALUES (26, 13, 2, 0, 28, 0, NULL, NULL, NULL, '2021-04-24 10:43:25');
INSERT INTO `exampaper` VALUES (27, 14, 2, 1, 28, 12, '2021-04-24 14:18:46', '2021-04-24 16:51:55', 153, '2021-04-24 13:37:28');
INSERT INTO `exampaper` VALUES (28, 15, 2, 0, 22, 0, NULL, NULL, NULL, '2021-04-24 17:14:55');
INSERT INTO `exampaper` VALUES (29, 19, 2, 0, 22, 0, NULL, NULL, NULL, '2021-04-24 22:00:08');
INSERT INTO `exampaper` VALUES (31, 22, 2, 1, 20, 4, '2021-04-25 01:00:16', '2021-04-25 01:07:42', 7, '2021-04-25 01:06:30');
INSERT INTO `exampaper` VALUES (32, 23, 2, 0, 26, 0, NULL, NULL, NULL, '2021-04-26 03:49:42');
INSERT INTO `exampaper` VALUES (33, 26, 2, 1, 26, 8, '2021-04-30 09:47:02', '2021-04-30 09:50:26', 3, '2021-04-30 09:47:01');
INSERT INTO `exampaper` VALUES (42, 36, 2, 1, 20, 4, '2021-05-09 09:00:20', '2021-05-09 09:00:34', 8, '2021-05-05 10:51:43');
INSERT INTO `exampaper` VALUES (43, 36, 4, 0, 20, 0, NULL, NULL, NULL, '2021-05-05 10:53:21');

-- ----------------------------
-- Table structure for exampaperanswer
-- ----------------------------
DROP TABLE IF EXISTS `exampaperanswer`;
CREATE TABLE `exampaperanswer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examId` int(11) NOT NULL,
  `examPaperId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `questionId` int(11) NOT NULL DEFAULT 0,
  `answer` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0',
  `isCorrect` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `examId`(`examPaperId`) USING BTREE,
  INDEX `studentId`(`studentId`) USING BTREE,
  INDEX `questionId`(`questionId`) USING BTREE,
  INDEX `examId_2`(`examId`) USING BTREE,
  CONSTRAINT `exampaperanswer_ibfk_1` FOREIGN KEY (`examPaperId`) REFERENCES `exampaper` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exampaperanswer_ibfk_2` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exampaperanswer_ibfk_3` FOREIGN KEY (`questionId`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exampaperanswer_ibfk_4` FOREIGN KEY (`examId`) REFERENCES `exam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 247 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exampaperanswer
-- ----------------------------
INSERT INTO `exampaperanswer` VALUES (21, 2, 9, 6, 2, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (22, 2, 9, 6, 6, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (23, 2, 9, 6, 1, 'ABCD', 1);
INSERT INTO `exampaperanswer` VALUES (24, 2, 9, 6, 5, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (25, 4, 10, 6, 6, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (26, 4, 10, 6, 1, 'ABCD', 1);
INSERT INTO `exampaperanswer` VALUES (27, 3, 11, 6, 16, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (28, 3, 11, 6, 6, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (29, 3, 11, 6, 14, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (30, 3, 11, 6, 2, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (31, 3, 11, 6, 21, 'ACD', 0);
INSERT INTO `exampaperanswer` VALUES (32, 3, 11, 6, 20, 'AB', 0);
INSERT INTO `exampaperanswer` VALUES (33, 3, 11, 6, 22, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (34, 3, 11, 6, 5, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (35, 3, 11, 6, 17, 'B', 1);
INSERT INTO `exampaperanswer` VALUES (36, 3, 11, 6, 18, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (37, 3, 11, 6, 19, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (38, 5, 12, 8, 29, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (39, 5, 12, 8, 28, 'BD', 1);
INSERT INTO `exampaperanswer` VALUES (40, 5, 12, 8, 30, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (50, 2, 14, 9, 14, 'D', 0);
INSERT INTO `exampaperanswer` VALUES (51, 2, 14, 9, 6, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (52, 2, 14, 9, 21, 'CD', 1);
INSERT INTO `exampaperanswer` VALUES (53, 2, 14, 9, 19, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (54, 2, 15, 10, 2, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (55, 2, 15, 10, 13, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (56, 2, 15, 10, 21, 'ABCD', 0);
INSERT INTO `exampaperanswer` VALUES (57, 2, 15, 10, 18, 'B', 1);
INSERT INTO `exampaperanswer` VALUES (58, 2, 16, 11, 2, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (59, 2, 16, 11, 16, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (60, 2, 16, 11, 1, 'D', 0);
INSERT INTO `exampaperanswer` VALUES (61, 2, 16, 11, 19, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (62, 4, 17, 11, 13, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (63, 4, 17, 11, 20, 'AC', 0);
INSERT INTO `exampaperanswer` VALUES (64, 3, 18, 11, 2, 'C', 0);
INSERT INTO `exampaperanswer` VALUES (65, 3, 18, 11, 6, 'C', 0);
INSERT INTO `exampaperanswer` VALUES (66, 3, 18, 11, 15, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (67, 3, 18, 11, 13, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (68, 3, 18, 11, 1, 'BC', 0);
INSERT INTO `exampaperanswer` VALUES (69, 3, 18, 11, 20, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (70, 3, 18, 11, 22, 'ABD', 0);
INSERT INTO `exampaperanswer` VALUES (71, 3, 18, 11, 5, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (72, 3, 18, 11, 17, 'B', 1);
INSERT INTO `exampaperanswer` VALUES (73, 3, 18, 11, 18, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (74, 3, 18, 11, 19, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (75, 2, 19, 13, 16, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (76, 2, 19, 13, 14, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (77, 2, 19, 13, 6, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (78, 2, 19, 13, 15, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (79, 2, 19, 13, 2, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (80, 2, 19, 13, 21, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (81, 2, 19, 13, 19, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (82, 7, 20, 2, 14, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (83, 7, 20, 2, 15, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (84, 7, 20, 2, 5, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (85, 7, 20, 2, 17, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (86, 8, 21, 2, 2, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (87, 8, 21, 2, 6, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (88, 8, 21, 2, 20, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (89, 8, 21, 2, 17, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (90, 8, 21, 2, 18, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (91, 8, 21, 2, 5, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (92, 9, 22, 2, 2, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (93, 9, 22, 2, 6, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (94, 9, 22, 2, 15, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (95, 9, 22, 2, 20, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (96, 9, 22, 2, 17, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (97, 9, 22, 2, 18, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (98, 10, 23, 2, 6, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (99, 10, 23, 2, 13, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (100, 10, 23, 2, 2, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (101, 10, 23, 2, 16, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (102, 10, 23, 2, 15, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (103, 10, 23, 2, 22, 'BCD', 0);
INSERT INTO `exampaperanswer` VALUES (104, 10, 23, 2, 21, 'AB', 0);
INSERT INTO `exampaperanswer` VALUES (105, 10, 23, 2, 20, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (106, 10, 23, 2, 18, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (107, 10, 23, 2, 5, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (118, 12, 25, 2, 2, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (119, 12, 25, 2, 13, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (120, 12, 25, 2, 14, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (121, 12, 25, 2, 22, 'AB', 0);
INSERT INTO `exampaperanswer` VALUES (122, 12, 25, 2, 20, 'AB', 0);
INSERT INTO `exampaperanswer` VALUES (123, 12, 25, 2, 5, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (124, 12, 25, 2, 17, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (125, 12, 25, 2, 33, 'timu', 0);
INSERT INTO `exampaperanswer` VALUES (126, 13, 26, 2, 2, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (127, 13, 26, 2, 6, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (128, 13, 26, 2, 15, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (129, 13, 26, 2, 20, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (130, 13, 26, 2, 17, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (131, 13, 26, 2, 18, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (132, 13, 26, 2, 33, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (133, 13, 26, 2, 35, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (134, 13, 26, 2, 36, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (135, 14, 27, 2, 2, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (136, 14, 27, 2, 6, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (137, 14, 27, 2, 15, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (138, 14, 27, 2, 20, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (139, 14, 27, 2, 17, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (140, 14, 27, 2, 18, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (141, 14, 27, 2, 36, '填空题目3', 1);
INSERT INTO `exampaperanswer` VALUES (142, 14, 27, 2, 34, '填空题目1', 1);
INSERT INTO `exampaperanswer` VALUES (143, 14, 27, 2, 35, '填空题目2', 1);
INSERT INTO `exampaperanswer` VALUES (144, 15, 28, 2, 2, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (145, 15, 28, 2, 6, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (146, 15, 28, 2, 15, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (147, 15, 28, 2, 20, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (148, 15, 28, 2, 17, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (149, 15, 28, 2, 18, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (150, 15, 28, 2, 33, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (151, 15, 28, 2, 36, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (152, 19, 29, 2, 2, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (153, 19, 29, 2, 6, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (154, 19, 29, 2, 15, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (155, 19, 29, 2, 20, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (156, 19, 29, 2, 17, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (157, 19, 29, 2, 18, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (158, 19, 29, 2, 34, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (159, 19, 29, 2, 33, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (160, 22, 31, 2, 15, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (161, 22, 31, 2, 16, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (162, 22, 31, 2, 1, 'AB', 0);
INSERT INTO `exampaperanswer` VALUES (163, 22, 31, 2, 21, 'BC', 0);
INSERT INTO `exampaperanswer` VALUES (164, 22, 31, 2, 18, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (165, 22, 31, 2, 5, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (166, 22, 31, 2, 36, '哈哈哈哈', 0);
INSERT INTO `exampaperanswer` VALUES (167, 22, 31, 2, 34, '111', 0);
INSERT INTO `exampaperanswer` VALUES (168, 23, 32, 2, 6, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (169, 23, 32, 2, 13, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (170, 23, 32, 2, 2, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (171, 23, 32, 2, 14, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (172, 23, 32, 2, 16, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (173, 23, 32, 2, 1, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (174, 23, 32, 2, 22, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (175, 23, 32, 2, 19, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (176, 23, 32, 2, 18, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (177, 23, 32, 2, 36, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (178, 23, 32, 2, 33, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (179, 26, 33, 2, 15, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (180, 26, 33, 2, 42, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (181, 26, 33, 2, 37, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (182, 26, 33, 2, 2, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (183, 26, 33, 2, 6, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (184, 26, 33, 2, 20, 'AB', 0);
INSERT INTO `exampaperanswer` VALUES (185, 26, 33, 2, 17, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (186, 26, 33, 2, 18, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (187, 26, 33, 2, 35, 'DDDD', 0);
INSERT INTO `exampaperanswer` VALUES (188, 26, 33, 2, 34, '十字花科', 1);
INSERT INTO `exampaperanswer` VALUES (235, 36, 42, 2, 98, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (236, 36, 42, 2, 103, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (237, 36, 42, 2, 125, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (238, 36, 42, 2, 93, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (239, 36, 42, 2, 147, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (240, 36, 42, 2, 135, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (241, 36, 43, 4, 98, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (242, 36, 43, 4, 103, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (243, 36, 43, 4, 125, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (244, 36, 43, 4, 93, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (245, 36, 43, 4, 147, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (246, 36, 43, 4, 135, NULL, 0);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createTime` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 370 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (116, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-14 17:00:32');
INSERT INTO `log` VALUES (117, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-14 17:01:53');
INSERT INTO `log` VALUES (118, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-14 17:02:16');
INSERT INTO `log` VALUES (119, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-14 20:19:21');
INSERT INTO `log` VALUES (120, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-14 22:12:39');
INSERT INTO `log` VALUES (121, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-14 22:45:57');
INSERT INTO `log` VALUES (122, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-14 22:58:12');
INSERT INTO `log` VALUES (123, '用户名为admin的用户登录时输入验证码错误!', '2021-04-14 23:31:17');
INSERT INTO `log` VALUES (124, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-14 23:31:26');
INSERT INTO `log` VALUES (125, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 00:37:15');
INSERT INTO `log` VALUES (126, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 00:46:36');
INSERT INTO `log` VALUES (127, '用户名为admin的用户登录时输入验证码错误!', '2021-04-15 01:34:04');
INSERT INTO `log` VALUES (128, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 01:34:11');
INSERT INTO `log` VALUES (129, '用户名为admin的用户登录时输入验证码错误!', '2021-04-15 14:44:42');
INSERT INTO `log` VALUES (130, '用户名为admin的用户登录时输入验证码错误!', '2021-04-15 14:44:52');
INSERT INTO `log` VALUES (131, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 14:45:00');
INSERT INTO `log` VALUES (132, '用户名为admin的用户登录时输入验证码错误!', '2021-04-15 16:32:37');
INSERT INTO `log` VALUES (133, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 16:32:46');
INSERT INTO `log` VALUES (134, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 16:40:42');
INSERT INTO `log` VALUES (135, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 16:41:24');
INSERT INTO `log` VALUES (136, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 16:57:52');
INSERT INTO `log` VALUES (137, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 17:40:58');
INSERT INTO `log` VALUES (138, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 17:51:22');
INSERT INTO `log` VALUES (139, '登录时，用户名为adin的用户不存在!', '2021-04-15 18:33:28');
INSERT INTO `log` VALUES (140, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 18:33:41');
INSERT INTO `log` VALUES (141, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 20:20:18');
INSERT INTO `log` VALUES (142, '用户名为admin的用户登录时输入验证码错误!', '2021-04-15 20:25:21');
INSERT INTO `log` VALUES (143, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 20:25:27');
INSERT INTO `log` VALUES (144, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 21:22:11');
INSERT INTO `log` VALUES (145, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 21:45:59');
INSERT INTO `log` VALUES (146, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 21:55:25');
INSERT INTO `log` VALUES (147, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 22:07:34');
INSERT INTO `log` VALUES (148, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 22:13:20');
INSERT INTO `log` VALUES (149, '用户名为admin的用户登录时输入密码错误!', '2021-04-15 22:25:59');
INSERT INTO `log` VALUES (150, '用户名为admin的用户登录时输入验证码错误!', '2021-04-15 22:26:05');
INSERT INTO `log` VALUES (151, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 22:26:14');
INSERT INTO `log` VALUES (152, '登录时，用户名为admi的用户不存在!', '2021-04-15 23:24:57');
INSERT INTO `log` VALUES (153, '用户名为admin的用户登录时输入验证码错误!', '2021-04-15 23:25:03');
INSERT INTO `log` VALUES (154, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 23:25:09');
INSERT INTO `log` VALUES (155, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 23:27:19');
INSERT INTO `log` VALUES (156, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-15 23:27:58');
INSERT INTO `log` VALUES (157, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 01:15:52');
INSERT INTO `log` VALUES (158, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 01:37:46');
INSERT INTO `log` VALUES (159, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 01:40:56');
INSERT INTO `log` VALUES (160, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 01:59:00');
INSERT INTO `log` VALUES (161, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 02:13:08');
INSERT INTO `log` VALUES (162, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 02:20:12');
INSERT INTO `log` VALUES (163, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 02:23:35');
INSERT INTO `log` VALUES (164, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 02:25:04');
INSERT INTO `log` VALUES (165, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 02:55:59');
INSERT INTO `log` VALUES (166, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 02:59:26');
INSERT INTO `log` VALUES (167, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 03:02:27');
INSERT INTO `log` VALUES (168, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 03:11:51');
INSERT INTO `log` VALUES (169, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 03:17:20');
INSERT INTO `log` VALUES (170, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 03:22:57');
INSERT INTO `log` VALUES (171, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 03:32:14');
INSERT INTO `log` VALUES (172, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 03:38:06');
INSERT INTO `log` VALUES (173, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 03:39:19');
INSERT INTO `log` VALUES (174, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 03:44:05');
INSERT INTO `log` VALUES (175, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 12:57:59');
INSERT INTO `log` VALUES (176, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 13:00:30');
INSERT INTO `log` VALUES (177, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 13:34:47');
INSERT INTO `log` VALUES (178, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 14:30:13');
INSERT INTO `log` VALUES (179, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 14:37:37');
INSERT INTO `log` VALUES (180, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 14:49:11');
INSERT INTO `log` VALUES (181, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 14:52:21');
INSERT INTO `log` VALUES (182, '用户名为admin的用户登录时输入验证码错误!', '2021-04-16 16:05:35');
INSERT INTO `log` VALUES (183, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 16:05:42');
INSERT INTO `log` VALUES (184, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 17:22:16');
INSERT INTO `log` VALUES (185, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 17:36:13');
INSERT INTO `log` VALUES (186, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 21:55:19');
INSERT INTO `log` VALUES (187, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 22:58:09');
INSERT INTO `log` VALUES (188, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 23:06:24');
INSERT INTO `log` VALUES (189, '用户名为admin的用户登录时输入验证码错误!', '2021-04-17 00:57:56');
INSERT INTO `log` VALUES (190, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-17 00:58:04');
INSERT INTO `log` VALUES (191, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-17 02:22:05');
INSERT INTO `log` VALUES (192, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-17 02:35:33');
INSERT INTO `log` VALUES (193, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-17 03:42:10');
INSERT INTO `log` VALUES (194, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-17 16:09:13');
INSERT INTO `log` VALUES (195, '哈哈哈哈哈哈哈哈好', '2021-04-17 16:10:58');
INSERT INTO `log` VALUES (196, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 00:40:56');
INSERT INTO `log` VALUES (197, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 01:03:53');
INSERT INTO `log` VALUES (198, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 14:30:20');
INSERT INTO `log` VALUES (199, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 15:44:39');
INSERT INTO `log` VALUES (200, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 16:22:11');
INSERT INTO `log` VALUES (201, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 16:42:05');
INSERT INTO `log` VALUES (202, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 16:50:06');
INSERT INTO `log` VALUES (203, '用户名为{20210401}，角色为{管理员}的用户登录成功!', '2021-04-18 17:07:05');
INSERT INTO `log` VALUES (204, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 17:08:57');
INSERT INTO `log` VALUES (205, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 18:09:54');
INSERT INTO `log` VALUES (206, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 21:37:17');
INSERT INTO `log` VALUES (207, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 21:38:17');
INSERT INTO `log` VALUES (208, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 22:16:42');
INSERT INTO `log` VALUES (209, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 22:21:02');
INSERT INTO `log` VALUES (210, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 22:22:00');
INSERT INTO `log` VALUES (211, '登录时，用户名为adimn的用户不存在!', '2021-04-18 22:24:12');
INSERT INTO `log` VALUES (212, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 22:24:29');
INSERT INTO `log` VALUES (213, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 22:24:57');
INSERT INTO `log` VALUES (214, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 22:25:27');
INSERT INTO `log` VALUES (215, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 22:28:14');
INSERT INTO `log` VALUES (216, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 23:19:00');
INSERT INTO `log` VALUES (217, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-18 23:33:57');
INSERT INTO `log` VALUES (218, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 00:04:30');
INSERT INTO `log` VALUES (219, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 21:05:14');
INSERT INTO `log` VALUES (220, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 22:13:28');
INSERT INTO `log` VALUES (221, '用户名为admin的用户登录时输入验证码错误!', '2021-04-19 22:22:08');
INSERT INTO `log` VALUES (222, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 22:22:17');
INSERT INTO `log` VALUES (223, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 22:24:14');
INSERT INTO `log` VALUES (224, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 22:26:25');
INSERT INTO `log` VALUES (225, '用户名为admin的用户登录时输入验证码错误!', '2021-04-20 09:24:07');
INSERT INTO `log` VALUES (226, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-20 09:24:12');
INSERT INTO `log` VALUES (227, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-20 10:21:40');
INSERT INTO `log` VALUES (228, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-20 10:29:43');
INSERT INTO `log` VALUES (229, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-20 10:35:13');
INSERT INTO `log` VALUES (230, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-20 10:39:46');
INSERT INTO `log` VALUES (231, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-20 14:59:08');
INSERT INTO `log` VALUES (232, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-20 18:55:55');
INSERT INTO `log` VALUES (233, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-20 20:26:39');
INSERT INTO `log` VALUES (234, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-20 20:53:06');
INSERT INTO `log` VALUES (235, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-20 21:00:21');
INSERT INTO `log` VALUES (236, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-20 21:06:10');
INSERT INTO `log` VALUES (237, '用户名为admin的用户登录时输入验证码错误!', '2021-04-20 21:18:19');
INSERT INTO `log` VALUES (238, '用户名为admin的用户登录时输入验证码错误!', '2021-04-20 21:18:28');
INSERT INTO `log` VALUES (239, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-20 21:18:35');
INSERT INTO `log` VALUES (240, '用户名为admin的用户登录时输入验证码错误!', '2021-04-20 21:38:35');
INSERT INTO `log` VALUES (241, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-20 21:38:43');
INSERT INTO `log` VALUES (242, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-20 21:39:20');
INSERT INTO `log` VALUES (243, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-20 21:41:27');
INSERT INTO `log` VALUES (244, '用户名为admin的用户登录时输入验证码错误!', '2021-04-20 21:47:14');
INSERT INTO `log` VALUES (245, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-20 21:47:22');
INSERT INTO `log` VALUES (246, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-21 12:12:40');
INSERT INTO `log` VALUES (247, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-23 20:45:03');
INSERT INTO `log` VALUES (248, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 10:12:46');
INSERT INTO `log` VALUES (249, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 10:20:40');
INSERT INTO `log` VALUES (250, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 10:41:30');
INSERT INTO `log` VALUES (251, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 13:36:38');
INSERT INTO `log` VALUES (252, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 17:00:38');
INSERT INTO `log` VALUES (253, '用户名为2021的用户登录时输入验证码错误!', '2021-04-24 17:12:24');
INSERT INTO `log` VALUES (254, '用户名为{2021}，角色为{testAccount}的用户登录成功!', '2021-04-24 17:12:34');
INSERT INTO `log` VALUES (255, '用户名为20210401的用户登录时输入验证码错误!', '2021-04-24 17:21:16');
INSERT INTO `log` VALUES (256, '用户名为{20210401}，角色为{超级管理员}的用户登录成功!', '2021-04-24 17:21:24');
INSERT INTO `log` VALUES (257, '用户名为{20210401}，角色为{普通用户}的用户登录成功!', '2021-04-24 17:22:10');
INSERT INTO `log` VALUES (258, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 17:39:46');
INSERT INTO `log` VALUES (259, '用户名为{20210401}，角色为{普通用户}的用户登录成功!', '2021-04-24 17:41:00');
INSERT INTO `log` VALUES (260, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 17:41:35');
INSERT INTO `log` VALUES (261, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 19:48:06');
INSERT INTO `log` VALUES (262, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 20:30:21');
INSERT INTO `log` VALUES (263, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 20:44:08');
INSERT INTO `log` VALUES (264, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 20:56:08');
INSERT INTO `log` VALUES (265, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 21:00:29');
INSERT INTO `log` VALUES (266, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 21:13:09');
INSERT INTO `log` VALUES (267, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 21:33:02');
INSERT INTO `log` VALUES (268, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 21:41:24');
INSERT INTO `log` VALUES (269, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 21:54:43');
INSERT INTO `log` VALUES (270, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 22:08:11');
INSERT INTO `log` VALUES (271, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 22:44:52');
INSERT INTO `log` VALUES (272, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 22:58:04');
INSERT INTO `log` VALUES (273, '用户名为admin的用户登录时输入验证码错误!', '2021-04-24 23:05:46');
INSERT INTO `log` VALUES (274, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 23:05:56');
INSERT INTO `log` VALUES (275, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 23:30:13');
INSERT INTO `log` VALUES (276, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 23:36:20');
INSERT INTO `log` VALUES (277, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 23:37:05');
INSERT INTO `log` VALUES (278, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 23:38:07');
INSERT INTO `log` VALUES (279, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 00:37:39');
INSERT INTO `log` VALUES (280, '用户名为admin的用户登录时输入验证码错误!', '2021-04-25 00:57:55');
INSERT INTO `log` VALUES (281, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 00:58:04');
INSERT INTO `log` VALUES (282, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 01:03:06');
INSERT INTO `log` VALUES (283, '用户名为admin的用户登录时输入验证码错误!', '2021-04-25 08:54:50');
INSERT INTO `log` VALUES (284, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 08:55:00');
INSERT INTO `log` VALUES (285, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 09:16:58');
INSERT INTO `log` VALUES (286, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 09:19:53');
INSERT INTO `log` VALUES (287, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 13:07:20');
INSERT INTO `log` VALUES (288, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 13:08:07');
INSERT INTO `log` VALUES (289, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 13:23:15');
INSERT INTO `log` VALUES (290, '用户名为admin的用户登录时输入验证码错误!', '2021-04-25 13:24:51');
INSERT INTO `log` VALUES (291, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 13:24:59');
INSERT INTO `log` VALUES (292, '用户名为admin的用户登录时输入验证码错误!', '2021-04-25 21:55:38');
INSERT INTO `log` VALUES (293, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 21:55:48');
INSERT INTO `log` VALUES (294, '用户名为admin的用户登录时输入验证码错误!', '2021-04-25 22:11:51');
INSERT INTO `log` VALUES (295, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 22:12:00');
INSERT INTO `log` VALUES (296, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 22:20:56');
INSERT INTO `log` VALUES (297, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 22:28:59');
INSERT INTO `log` VALUES (298, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 22:35:57');
INSERT INTO `log` VALUES (299, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 22:48:28');
INSERT INTO `log` VALUES (300, '用户名为admin的用户登录时输入验证码错误!', '2021-04-25 22:54:29');
INSERT INTO `log` VALUES (301, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 22:54:38');
INSERT INTO `log` VALUES (302, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 22:57:43');
INSERT INTO `log` VALUES (303, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 23:00:06');
INSERT INTO `log` VALUES (304, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-26 03:30:36');
INSERT INTO `log` VALUES (305, '用户名为admin的用户登录时输入验证码错误!', '2021-04-26 04:57:23');
INSERT INTO `log` VALUES (306, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-26 04:57:31');
INSERT INTO `log` VALUES (307, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-26 06:59:29');
INSERT INTO `log` VALUES (308, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-26 19:27:24');
INSERT INTO `log` VALUES (309, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-26 20:31:53');
INSERT INTO `log` VALUES (310, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-26 20:46:41');
INSERT INTO `log` VALUES (311, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-26 21:28:25');
INSERT INTO `log` VALUES (312, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-26 21:45:41');
INSERT INTO `log` VALUES (313, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-26 23:16:06');
INSERT INTO `log` VALUES (314, '用户名为admin的用户登录时输入验证码错误!', '2021-04-26 23:21:01');
INSERT INTO `log` VALUES (315, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-26 23:21:09');
INSERT INTO `log` VALUES (316, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-26 23:35:32');
INSERT INTO `log` VALUES (317, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-26 23:45:30');
INSERT INTO `log` VALUES (318, '用户名为admin的用户登录时输入验证码错误!', '2021-04-26 23:50:45');
INSERT INTO `log` VALUES (319, '用户名为admin的用户登录时输入验证码错误!', '2021-04-26 23:50:54');
INSERT INTO `log` VALUES (320, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-26 23:51:01');
INSERT INTO `log` VALUES (321, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-27 00:01:49');
INSERT INTO `log` VALUES (322, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-27 00:07:52');
INSERT INTO `log` VALUES (323, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-27 00:20:16');
INSERT INTO `log` VALUES (324, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 12:21:24');
INSERT INTO `log` VALUES (325, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 12:28:06');
INSERT INTO `log` VALUES (326, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 13:19:23');
INSERT INTO `log` VALUES (327, '用户名为公告管的用户登录时输入验证码错误!', '2021-04-28 14:08:07');
INSERT INTO `log` VALUES (328, '登录时，用户名为公告管的用户不存在!', '2021-04-28 14:08:14');
INSERT INTO `log` VALUES (329, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 14:19:21');
INSERT INTO `log` VALUES (330, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 14:20:12');
INSERT INTO `log` VALUES (331, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 16:31:29');
INSERT INTO `log` VALUES (332, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 16:42:30');
INSERT INTO `log` VALUES (333, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-30 09:45:02');
INSERT INTO `log` VALUES (334, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-30 10:37:04');
INSERT INTO `log` VALUES (335, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-30 14:34:31');
INSERT INTO `log` VALUES (336, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-30 14:40:08');
INSERT INTO `log` VALUES (337, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-30 15:31:53');
INSERT INTO `log` VALUES (338, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-01 10:21:57');
INSERT INTO `log` VALUES (339, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-01 10:35:16');
INSERT INTO `log` VALUES (340, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-01 10:49:30');
INSERT INTO `log` VALUES (341, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-01 10:53:40');
INSERT INTO `log` VALUES (342, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-01 10:56:15');
INSERT INTO `log` VALUES (343, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-01 14:47:17');
INSERT INTO `log` VALUES (344, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-01 14:58:19');
INSERT INTO `log` VALUES (345, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-01 15:05:36');
INSERT INTO `log` VALUES (346, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-02 15:07:24');
INSERT INTO `log` VALUES (347, '用户名为admin的用户登录时输入验证码错误!', '2021-05-02 15:14:53');
INSERT INTO `log` VALUES (348, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-02 15:14:59');
INSERT INTO `log` VALUES (349, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-02 15:26:00');
INSERT INTO `log` VALUES (350, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-02 15:28:29');
INSERT INTO `log` VALUES (351, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-02 15:37:09');
INSERT INTO `log` VALUES (352, '用户名为admin的用户登录时输入验证码错误!', '2021-05-04 21:58:02');
INSERT INTO `log` VALUES (353, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-04 21:58:09');
INSERT INTO `log` VALUES (354, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-04 22:49:39');
INSERT INTO `log` VALUES (355, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-04 23:00:29');
INSERT INTO `log` VALUES (356, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-04 23:08:30');
INSERT INTO `log` VALUES (357, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-04 23:43:33');
INSERT INTO `log` VALUES (358, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-05 08:52:25');
INSERT INTO `log` VALUES (359, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-05 10:03:22');
INSERT INTO `log` VALUES (360, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-05 10:50:33');
INSERT INTO `log` VALUES (361, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-05 18:03:11');
INSERT INTO `log` VALUES (362, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-08 13:52:36');
INSERT INTO `log` VALUES (363, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-08 13:58:12');
INSERT INTO `log` VALUES (364, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-09 09:38:16');
INSERT INTO `log` VALUES (365, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 12:29:59');
INSERT INTO `log` VALUES (366, '用户名为{admin}，的用户成功修改密码!', '2021-05-12 12:30:21');
INSERT INTO `log` VALUES (367, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 15:34:07');
INSERT INTO `log` VALUES (368, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-16 23:31:03');
INSERT INTO `log` VALUES (369, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-16 23:34:26');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL DEFAULT -1,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 0, '系统设置', '', 'icon-advancedsettings');
INSERT INTO `menu` VALUES (17, 5, '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES (18, 5, '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES (19, 5, '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES (20, 5, '添加按钮', 'openAddMenu()', 'icon-add');
INSERT INTO `menu` VALUES (21, 13, '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES (22, 13, '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES (23, 13, '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES (24, 15, '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES (25, 15, '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES (26, 15, '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES (35, 1, '修改密码', 'edit_password', 'icon-lock-edit');
INSERT INTO `menu` VALUES (36, 35, '修改密码', 'openAdd()', 'icon-lock-edit');
INSERT INTO `menu` VALUES (37, 0, '课程管理', '', 'icon-text-padding-left');
INSERT INTO `menu` VALUES (38, 37, '课程列表', '../admin/subject/list', 'icon-application-view-columns');
INSERT INTO `menu` VALUES (39, 38, '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES (40, 38, '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES (41, 38, '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES (42, 0, '学生管理', '', 'icon-users');
INSERT INTO `menu` VALUES (43, 42, '学生列表', '../admin/student/list', 'icon-vcard');
INSERT INTO `menu` VALUES (44, 43, '添加', 'openAdd()', 'icon-user-add');
INSERT INTO `menu` VALUES (45, 43, '编辑', 'openEdit()', 'icon-user-edit');
INSERT INTO `menu` VALUES (46, 43, '删除', 'remove()', 'icon-user-cross');
INSERT INTO `menu` VALUES (47, 0, '试题管理', '', 'icon-date');
INSERT INTO `menu` VALUES (48, 47, '试题列表', '../admin/question/list', 'icon-date-magnify');
INSERT INTO `menu` VALUES (49, 48, '添加', 'openAdd()', 'icon-date-add');
INSERT INTO `menu` VALUES (50, 48, '编辑', 'openEdit()', 'icon-date-edit');
INSERT INTO `menu` VALUES (51, 48, '删除', 'remove()', 'icon-date-delete');
INSERT INTO `menu` VALUES (52, 0, '组卷设置', '', 'icon-map');
INSERT INTO `menu` VALUES (53, 52, '组卷列表', '../admin/exam/list', 'icon-map-magnify');
INSERT INTO `menu` VALUES (54, 53, '添加', 'openAdd()', 'icon-map-add');
INSERT INTO `menu` VALUES (55, 53, '编辑', 'openEdit()', 'icon-map-edit');
INSERT INTO `menu` VALUES (56, 53, '删除', 'remove()', 'icon-map-delete');
INSERT INTO `menu` VALUES (57, 0, '试卷管理', '', 'icon-page-white-text');
INSERT INTO `menu` VALUES (58, 57, '试卷列表', '../admin/examPaper/list', 'icon-page-white-stack');
INSERT INTO `menu` VALUES (60, 58, '编辑', 'openEdit()', 'icon-page-white-edit');
INSERT INTO `menu` VALUES (61, 58, '删除', 'remove()', 'icon-page-white-delete');
INSERT INTO `menu` VALUES (62, 0, '考试管理', '', 'icon-building-edit');
INSERT INTO `menu` VALUES (63, 62, '考试列表', '../admin/examPaperAnswer/list', 'icon-building');
INSERT INTO `menu` VALUES (64, 48, '导入试题', 'openImport()', 'icon-note-go');
INSERT INTO `menu` VALUES (65, 0, '成绩统计', '', 'icon-text-letter-omega');
INSERT INTO `menu` VALUES (66, 65, '统计图表', '../admin/stats/exam_stats', 'icon-chart-line');
INSERT INTO `menu` VALUES (67, 43, '导入学生', 'openImport()', 'icon-application-osx-go');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` int(11) NOT NULL DEFAULT 1,
  `questionType` int(2) NOT NULL DEFAULT 0,
  `questionDiffcult` int(2) NOT NULL,
  `questionDistribute` int(2) NOT NULL,
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `score` int(3) NOT NULL,
  `optA` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `optB` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `optC` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `optD` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `answer` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createTime` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subjectId`(`subjectId`) USING BTREE,
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 154 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, 1, 1, 1, 1, '下列哪些是高级编程语言？', 4, 'java', 'C', 'C++', 'PHP', 'ABCD', '2021-01-01 18:31:37');
INSERT INTO `question` VALUES (2, 1, 0, 0, 2, '下列需要虚拟机中执行代码的是？', 2, 'Java代码', 'C代码', 'C++代码', 'PHP代码', 'A', '2021-01-22 22:10:05');
INSERT INTO `question` VALUES (5, 1, 2, 1, 3, '泛化针对类型而不针对实例，一个类可以继承另一个类，但一个对象不能继承另一个对象', 2, '正确', '错误', '', '', 'A', '2021-01-22 23:22:00');
INSERT INTO `question` VALUES (6, 1, 0, 0, 4, '下列哪个是百度官网地址？', 2, 'http://baidu.com', 'http://baidu1.com', 'http://baidu2.com', 'http://baidu3.com', 'A', '2021-01-25 21:26:31');
INSERT INTO `question` VALUES (13, 1, 0, 1, 5, 'Java是什么？', 2, '编程语言', '不知道', '一种吃的东西', '诗歌语言吧', 'A', '2021-02-04 13:05:18');
INSERT INTO `question` VALUES (14, 1, 0, 1, 0, '瀑布模型把软件生命周期划分为八个阶段：问题的定义、可行性研究、软件需求分析、系统总体设计、详细设计、编码、测试和运行、维护。八个阶段又可归纳为三个大的阶段：计划阶段、开发阶段和＿。', 2, '详细计划', '可行性分析', '运行阶段', '测试与排错', 'C', '2021-02-04 13:21:54');
INSERT INTO `question` VALUES (15, 1, 0, 0, 0, '在结构化的瀑布模型中，哪一个阶段定义的标准将成为软件测试年勺系统测试阶段的目标', 2, '需求分析阶段', '详细设计阶段', '概要设计阶段', '可行性研究阶段', 'A', '2021-02-04 13:21:54');
INSERT INTO `question` VALUES (16, 1, 0, 2, 0, '软件工程的出现主要是由于', 2, '程序设计方法学的影响', '其它工程科学的影响', '软件危机的出现', '计算机的发展', 'C', '2021-02-04 13:21:54');
INSERT INTO `question` VALUES (17, 1, 2, 0, 0, '开发软件就是编写程序。', 2, '正确', '错误', '', '', 'B', '2021-02-04 13:21:54');
INSERT INTO `question` VALUES (18, 1, 2, 0, 0, '系统测试的主要方法是白盒法，主要进行功能测试、性能测试、安全性测试及可靠性等测试。', 2, '正确', '错误', '', '', 'B', '2021-02-04 13:21:54');
INSERT INTO `question` VALUES (19, 1, 2, 2, 1, '生产高质量的软件产品是软件工程的首要目标。', 2, '正确', '错误', '', '', 'A', '2021-02-04 13:21:54');
INSERT INTO `question` VALUES (20, 1, 1, 0, 0, '计算机病毒有两大类，它们是()', 4, '感染可执行文件', '感染磁盘dos启动区', '文件型病毒', '感染磁盘分区引导区，系统引导型病毒', 'ACD', '2021-02-04 13:21:54');
INSERT INTO `question` VALUES (21, 1, 1, 1, 2, '指令系统中控制程序流程的指令通常有()', 4, '传送指令', '比较指令', '转移指令', '转移与返回指令', 'CD', '2021-02-04 13:21:54');
INSERT INTO `question` VALUES (22, 1, 1, 2, 0, '关于计算机的主要发展趋势,以下说法正确的是', 4, '为形成计算机网络,使一国乃至全世界的多台计算机能够共享信息', '为满足科研等领域的需要,向超高速巨型化发展', '向高速微型发展', '为节约耗电量,形成计算机网络', 'ABC', '2021-02-04 13:21:54');
INSERT INTO `question` VALUES (25, 5, 0, 0, 0, '被誉为中国现代数学祖师的是？', 2, '姜伯驹', '苏步青', '姜立夫', '杨振宁', 'C', '2021-02-04 16:35:57');
INSERT INTO `question` VALUES (26, 5, 1, 0, 3, '荣获1989年台湾当局颁发的景星奖章是（），中国的第一份数学刊物--《算学报》是由（）创办的。', 4, '黄庆澄', '柯召', '徐贤修', '华罗庚', 'AC', '2021-02-04 16:38:15');
INSERT INTO `question` VALUES (27, 5, 2, 0, 0, '1988年被英国国际传记中心收入《世界名人录》的是方德植？', 2, '正确', '错误', '', '', 'A', '2021-02-04 16:39:00');
INSERT INTO `question` VALUES (28, 6, 1, 0, 4, '以下物理学知识的相关叙述，其中正确的是', 4, '用透明的标准样板和单色光检查平面的平整度是利用了光的偏振', '变化的电场周围不一定产生变化的磁场', '交警通过发射超声波测量车速是利用了波的干涉原理', '狭义相对论认为，在惯性参照系中，光速与光源、观察者间的相对运动无关', 'BD', '2021-02-04 16:41:43');
INSERT INTO `question` VALUES (29, 6, 0, 0, 0, '许多物理学家的科学研究不仅促进了物理学的发展，而且推动了人类文明的进步。在对以下几位物理学家所做科学贡献的叙述中，正确的是', 2, '英国物理学家卡文迪许用实验的方法测出了引力常量G ', '牛顿通过计算首先发现了海王星和冥王星', '爱因斯坦建立了相对论，相对论物理学否定了经典物理学', '开普勒经过多年的天文观测和记录，提出了“日心说”的观点', 'A', '2021-02-04 16:43:14');
INSERT INTO `question` VALUES (30, 6, 2, 0, 1, '许多物体可以在不发生形变的条件下对物体施以弹力作用', 2, '正确', '错误', '', '', 'B', '2021-02-04 16:45:01');
INSERT INTO `question` VALUES (31, 7, 0, 0, 0, 'Your sister looks very ________.What\'s the matter with her?', 2, 'funny', 'weak', 'boring', 'relaxed', 'B', '2021-02-04 16:46:42');
INSERT INTO `question` VALUES (33, 1, 3, 0, 0, '成年人身上有_____块骨骼？', 2, '', '', '', '', '206', '2021-04-20 10:32:25');
INSERT INTO `question` VALUES (34, 1, 3, 0, 0, '白菜属于____________科', 2, '', '', '', '', '十字花科', '2021-04-24 10:13:30');
INSERT INTO `question` VALUES (35, 1, 3, 0, 0, '核酸由_______组成？', 2, '', '', '', '', 'DNA和RNA', '2021-04-24 10:13:59');
INSERT INTO `question` VALUES (36, 1, 3, 0, 0, '多莉羊 是在____时克隆出来的', 2, '', '', '', '', '90年代', '2021-04-24 10:14:23');
INSERT INTO `question` VALUES (37, 1, 0, 0, 0, 'Java所定义的版本中不包括：', 2, 'JAVA2 EE', 'JAVA2 Card', 'JAVA2 ME', 'JAVA2 HE', 'D', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (38, 1, 0, 1, 1, '地球的厚被是什么？', 2, '地壳', '大气圈', '岩石圈', '水圈', 'B', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (39, 1, 0, 0, 0, '鸟类的祖先是什么鸟？', 2, '翼龙', '始祖鸟', '候鸟', '鸵鸟', 'B', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (40, 1, 0, 2, 2, '最大的哺乳动物是什么？', 2, '扬子鳄', '中华鲟', '大白鲨', '蓝鲸', 'D', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (41, 1, 0, 1, 0, '跑得最快的鸟是：', 2, '环颈雉', '準', '鸵鸟', '企鹅', 'C', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (42, 1, 0, 0, 0, '最大的动物是：', 2, '白鲸', '蓝鲸', '大白鲨', '中华鲟', 'B', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (43, 1, 0, 2, 3, '海洋中最多的生物是：', 2, '光和生物', '浮游生物', '寄生生物', '腐生生物', 'B', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (44, 1, 0, 1, 0, '薄公英靠什么传播种子？', 2, '靠风力', '靠水', '靠动物', '靠人', 'A', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (45, 1, 0, 1, 4, '鸟类中最小的是：', 2, '麻雀', '金丝雀', '云雀', '蜂鸟', 'D', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (46, 1, 0, 1, 0, '人体内的水份约占体重的百分?', 2, '0', '0', '1', '1', 'C', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (47, 1, 0, 1, 0, '被称为菊月的月份是：', 2, '八月', '九月', '十月', '十一月', 'B', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (48, 1, 0, 1, 0, '玉米受潮后产生的致癌物质是：', 2, '黄曲霉毒素', '肉毒素', '青霉素', '红霉素', 'A', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (49, 1, 0, 1, 5, '绿色植物在生态系统中的地位是:', 2, '消费者', '分解者', '传递者', '生产者', 'D', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (50, 1, 0, 1, 5, '银杏属于什么种类水果？', 2, '复果', '坚果类', '聚合果', '蓇葖果', 'B', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (51, 1, 0, 1, 0, '下列属于我国特产的是:', 2, '荔枝', '柿子', '白果', '山药', 'B', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (52, 1, 0, 1, 0, '下列属于种子植物的是:', 2, '松', '柳树', '杉', '柏', 'B', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (53, 1, 0, 1, 0, '海带怎样一煮就烂?', 2, '加酒精', '加盐巴', '加醋', '加酱油', 'C', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (54, 1, 0, 1, 0, '高血压病人适合食用以下哪种食物？', 2, '南瓜', '芹菜', '番薯', '竹笋', 'B', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (55, 1, 0, 1, 1, '下列植物中，只能通过有性生殖繁育后代的是：', 2, '向日葵', '马铃薯', '仙人掌', '金鱼藻', 'A', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (56, 1, 0, 1, 0, '下列现象中，与动物的繁殖行为无关的是：', 2, '池边蛙群声声鸣', '蜂王雄蜂空中舞', '花丛蜜蜂翩翩舞', '蜻蜓点水款款飞', 'C', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (57, 1, 0, 1, 0, '下列与美丽的蝴蝶发育方式不同的昆虫是：', 2, '菜粉蝶', '螳螂', '家蚕', '蝇', 'B', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (58, 1, 0, 1, 0, '鸟类的生殖和发育比昆虫高等，主要表现在：', 2, '体内受精', '非变态发育', '卵生', '卵外有卵壳保护', 'D', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (59, 1, 0, 1, 0, '下列植物中，常用扦插繁殖的是：', 2, '甘薯和银杉', '葡萄和月季', '梨和苹果', '菊花和金鱼藻', 'B', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (60, 1, 0, 1, 1, '从孔雀自身的角度考虑，你认为孔雀开屏的目的是：', 2, '展示自己的美丽', '向人求食', '求偶', '孵卵', 'C', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (61, 1, 0, 1, 0, '下列不属于生命现象的是：', 2, '母鸡下蛋', '铁皮生锈', '雨后春笋', '葵花向阳', 'B', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (62, 1, 0, 1, 0, '在一个生态系统中，对各种生物数量起决定作用的是：', 2, '生产者', '消费者', '分解者', '食肉动物', 'A', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (63, 1, 0, 1, 0, '地球上最大的生态系统是：', 2, '生物圈', '陆地生态系统', '海洋生态系统', '草原生态系统', 'A', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (64, 1, 0, 1, 0, '在一个生态系统中最不稳定的成分是：', 2, '高大乔木', '低矮灌木', '细菌、真菌', '大型动物', 'D', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (65, 1, 0, 1, 1, '鱼必须生活在水中，离开水一段时间就会死亡。对此最恰当的解释是：', 2, '生物影响环境', '生物适应环境', '生物改变环境', '生物依赖环境', 'D', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (66, 1, 0, 1, 0, '在显微镜下观察写在纸片上的“b”字母时，物像是：', 2, 'b', 'd', 'p', 'q', 'D', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (67, 1, 1, 1, 0, '下面属于天然纤维的有', 4, '棉麻', '真丝', '冰丝', '天然彩棉', 'ABD', '2021-04-26 23:21:29');
INSERT INTO `question` VALUES (92, 1, 0, 0, 1, 'Java所定义的版本中不包括：', 2, 'JAVA2 EE', 'JAVA2 Card', 'JAVA2 ME', 'JAVA2 HE', 'D', '2021-05-02 15:37:23');
INSERT INTO `question` VALUES (93, 1, 2, 0, 2, '对食物中脂肪，蛋白质和糖类都能产生消化作用的是胰液', 2, '正确', '错误', '', '', 'A', '2021-05-02 15:37:23');
INSERT INTO `question` VALUES (94, 1, 1, 0, 3, '不是描述“一山不容二虎”的生物知识是：', 4, '种内斗争', '种间斗争', '捕食', '互助', 'BCD', '2021-05-02 15:37:23');
INSERT INTO `question` VALUES (95, 1, 3, 0, 4, '世界上最大的熊是______', 2, '', '', '', '', '棕熊', '2021-05-02 15:37:24');
INSERT INTO `question` VALUES (96, 1, 1, 2, 5, '什么被人们称其为“地球的肾”：', 2, '热带雨林', '湿地', '海洋', '陆地', 'AC', '2021-05-02 15:37:24');
INSERT INTO `question` VALUES (97, 1, 0, 0, 1, '我国明代医学家李时珍编写医学巨著是：', 2, '《齐民要术》', '《物种起源》', '《本草纲目》', '《扁鹊经》', 'C', '2021-05-02 15:37:24');
INSERT INTO `question` VALUES (98, 1, 0, 0, 2, '柑橘主要分布在南方，苹果主要分布在北方，造成这一分布差异的主要原因：', 2, '湿度', '阳光', '温度', '水分', 'C', '2021-05-02 15:37:24');
INSERT INTO `question` VALUES (99, 1, 0, 1, 3, '动物体内各种类型的细胞中，具有最高全能性的细胞是：', 2, '体细胞', '生殖细胞', '受精卵', '肝细胞', 'C', '2021-05-02 15:37:24');
INSERT INTO `question` VALUES (100, 1, 0, 0, 4, '由环境因素刺激动物所引起的最简单定向反应叫做：', 2, '向性运动', '感性运动', '趋性', '生物钟', 'A', '2021-05-02 15:37:24');
INSERT INTO `question` VALUES (101, 1, 0, 1, 5, '属于第一信号系统参与的反射活动是：', 2, '飞蛾扑火', '婴儿排尿', '鹦鹉学舌', '谈虎色变', 'C', '2021-05-02 15:37:24');
INSERT INTO `question` VALUES (102, 1, 0, 0, 1, '花生果是由下列哪一项发育而成的：', 2, '花冠和花托', '子房壁', '子房壁和胚珠', '花托和胚珠', 'C', '2021-05-02 15:37:24');
INSERT INTO `question` VALUES (103, 1, 0, 0, 2, '湖泊在下列哪种情况下，湖水中的含氧量最低:', 2, '白天末被污染', '夜间未被污染', '白天被污染', '夜间被污染', 'D', '2021-05-02 15:37:24');
INSERT INTO `question` VALUES (104, 1, 0, 1, 3, '有丝分裂中，姊妹染色单体着丝粒分开发生于：', 2, '前期', '中期', '后期', '末期', 'C', '2021-05-02 15:37:24');
INSERT INTO `question` VALUES (105, 1, 0, 0, 4, '热带雨林在中国主要分布在：', 2, '西双版纳', '海南岛', '台湾', '上述各项', 'A', '2021-05-02 15:37:24');
INSERT INTO `question` VALUES (106, 1, 0, 0, 5, '一种蝴蝶突然展开翅膀露出鲜艳的黑红环纹，这是什么行为：', 2, '拟态', '警戒色', '威吓', '逃避', 'B', '2021-05-02 15:37:24');
INSERT INTO `question` VALUES (107, 1, 3, 1, 1, '酸雨主要是由______引起的：', 2, '', '', '', '', 'NO,S02', '2021-05-02 15:37:24');
INSERT INTO `question` VALUES (108, 1, 0, 2, 2, '无法使蛋白质变性沉淀的因素有：', 2, '加入中性盐', '剧烈搅拌', '加入乙醇', '加热', 'A', '2021-05-02 15:37:24');
INSERT INTO `question` VALUES (109, 1, 0, 0, 3, '下列对叶绿素分子功能的叙述，不正确的是：', 2, '吸收光能', '传递光能', '储藏光能', '转化光能', 'C', '2021-05-02 15:37:24');
INSERT INTO `question` VALUES (110, 1, 0, 0, 4, '下列食物中，属于果实的是：', 2, '黄豆', '葵花籽', '花生仁', '蚕豆', 'B', '2021-05-02 15:37:24');
INSERT INTO `question` VALUES (111, 1, 0, 2, 5, '下列哪些病不是由病毒侵染直接引起的：', 2, '乙肝', '口蹄疫', '疯牛病', '禽流感', 'C', '2021-05-02 15:37:24');
INSERT INTO `question` VALUES (115, 1, 1, 0, 1, 'Java所定义的版本中包括：', 4, 'JAVA2 EE', 'JAVA2 Card', 'JAVA2 ME', 'JAVA2 HE', 'ABC', '2021-05-05 09:07:05');
INSERT INTO `question` VALUES (116, 1, 1, 0, 3, '下列对叶绿素分子功能的叙述，正确的是：', 4, '吸收光能', '传递光能', '储藏光能', '转化光能', 'ABD', '2021-05-05 09:07:05');
INSERT INTO `question` VALUES (117, 1, 1, 0, 4, '下列食物中，不属于果实的是：', 2, '黄豆', '葵花籽', '花生仁', '蚕豆', 'ACD', '2021-05-05 09:07:05');
INSERT INTO `question` VALUES (118, 1, 1, 2, 5, '下列哪些病是由病毒侵染直接引起的：', 2, '乙肝', '口蹄疫', '疯牛病', '禽流感', 'ABD', '2021-05-05 09:07:05');
INSERT INTO `question` VALUES (119, 1, 1, 0, 1, '需求规格说明书的作用应该包括：', 4, '软件设计的依据', '用户与开发人员对软件的理解', '软件验收的依据', '软件可行性研究', 'ABC', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (120, 1, 1, 1, 2, '结构化设计方法在软件开发中没有用于：', 4, '概要设计', '详细设计', '程序设计', '测试用例设计', 'BCD', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (121, 1, 1, 2, 3, '程序设计语言的技术特性应包括：', 4, '数据结构的描述性', '抽象类型的描述性', '数据库的易操作性', '软件的可移植性', 'ABC', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (122, 1, 1, 0, 4, '软件测试中，不是通过白盒法分析程序来设计测试用例的：', 4, '应用范围', '内部逻辑', '功能', '输入数据', 'ACD', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (123, 1, 1, 1, 5, '下列属于软件开发时期：', 4, '需求分析', '总体设计', '详细设计', '编码与测试', 'BCD', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (124, 1, 1, 2, 1, '下列属于黑盒测试的是：', 4, '等价类划分', '边界分析', '因果图', '语句测试', 'ABC', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (125, 1, 1, 0, 2, '下列不是造成软件危机的主要原因是：', 4, '用户使用不当', '硬件可靠性差', '缺乏好的开发方法和手段', '对软件的错误认识', 'ABD', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (126, 1, 1, 2, 4, '工具在软件详细设计过程中采用：', 4, '判定表 ', 'IPO图', 'PDL', 'DFD图', 'ABC', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (127, 1, 1, 0, 5, '下列属于数据字典组成部分的是：', 4, '数据项', '数据流 ', '数据文件', '数据库', 'ABC', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (128, 1, 1, 1, 3, '使大型软件生存出现危机主要表现在：', 4, '生产成本高', '需求增长难以满足', '进度难以控制', '质量难以保证', 'ABCD', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (129, 1, 3, 0, 1, '软件结构使用的图形工具，一般采用____图。', 2, '', '', '', '', 'ER', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (130, 1, 3, 1, 2, 'JSP方法是一种面向____的设计方法。', 2, '', '', '', '', '数据结构', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (131, 1, 3, 2, 5, '瀑布模型本质上是一种_____模型。', 2, '', '', '', '', '线性顺序', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (132, 1, 3, 0, 3, '软件质量必须在____加以保证。', 2, '', '', '', '', '设计与实现过程', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (133, 1, 3, 1, 4, '确认测试主要涉及的文档是_____。', 2, '', '', '', '', '需求规格说明书', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (134, 1, 3, 2, 1, '详细设计与概要设计衔接的图形工具是：', 2, '', '', '', '', 'SC图', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (135, 1, 3, 0, 2, '开发软件所需高成本和产品的低质量之间有着尖锐的矛盾，这种现象称做_____', 2, '', '', '', '', '软件危机', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (136, 1, 3, 1, 3, '螺旋模型是一种将瀑布模型和_____结合起来的软件开发模型', 2, '', '', '', '', '增量模型', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (137, 1, 3, 2, 4, '可行性研究是在_____之前。', 2, '', '', '', '', '系统开发', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (138, 1, 3, 0, 5, '软件工程的基本要素包括方法、工具和____', 2, '', '', '', '', '过程', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (139, 1, 3, 1, 1, '软件的_____设计又称为总体设计，其主要任务是建立软件系统的总体结构', 2, '', '', '', '', '概要', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (140, 1, 3, 2, 2, 'Jackson程序设计方法是一种面向______的设计方法。', 2, '', '', '', '', '数据结构', '2021-05-05 10:03:34');
INSERT INTO `question` VALUES (141, 1, 2, 0, 1, '软件的开发与运行经常受到硬件的限制和制约。', 2, '正确', '错误', '', '', 'A', '2021-05-05 10:03:35');
INSERT INTO `question` VALUES (142, 1, 2, 1, 2, '模块内的高内聚往往意味着模块间的松耦合。', 2, '正确', '错误', '', '', 'A', '2021-05-05 10:03:35');
INSERT INTO `question` VALUES (143, 1, 2, 2, 3, '软件的质量好坏主要由验收人员负责，其他开发人员不必关心。', 2, '正确', '错误', '', '', 'B', '2021-05-05 10:03:35');
INSERT INTO `question` VALUES (144, 1, 2, 0, 4, '判定覆盖不一定包含条件覆盖，条件覆盖也不一定包含判定覆盖。', 2, '正确', '错误', '', '', 'A', '2021-05-05 10:03:35');
INSERT INTO `question` VALUES (145, 1, 2, 1, 5, '应该尽量使用机器语言编写代码，提高程序运行效率，而减少高级语言的使用。(X)UML只能应用于软件系统模型的建立。', 2, '正确', '错误', '', '', 'B', '2021-05-05 10:03:35');
INSERT INTO `question` VALUES (146, 1, 2, 2, 1, '软件测试的目的是为了无一遗漏的找出所有的错误。', 2, '正确', '错误', '', '', 'B', '2021-05-05 10:03:35');
INSERT INTO `question` VALUES (147, 1, 2, 0, 2, '用户对软件需求的描述不精确，往往是产生软件危机的原因之一。', 2, '正确', '错误', '', '', 'A', '2021-05-05 10:03:35');
INSERT INTO `question` VALUES (148, 1, 2, 1, 3, '一个好的开发人员应具备的素质和能力包括善于与周围人员团结协作，建立良好的人际关系，善于听取别人的意见。', 2, '正确', '错误', '', '', 'A', '2021-05-05 10:03:35');
INSERT INTO `question` VALUES (149, 1, 2, 2, 4, '目前的绝大多数软件都不适合于快速原型技术。', 2, '正确', '错误', '', '', 'B', '2021-05-05 10:03:35');
INSERT INTO `question` VALUES (150, 1, 2, 0, 5, '面向数据的设计方法适用场合是具有明显的层次信息结构的应用如:企事业的信息管理系统;系统软件(如操作系统)等。', 2, '正确', '错误', '', '', 'A', '2021-05-05 10:03:35');
INSERT INTO `question` VALUES (151, 1, 2, 1, 1, '缺乏处理大型软件项目的经验。是产生软件危机的唯一原因。', 2, '正确', '错误', '', '', 'B', '2021-05-05 10:03:35');
INSERT INTO `question` VALUES (152, 1, 2, 2, 2, 'UML只能应用于软件系统模型的建立。', 2, '正确', '错误', '', '', 'B', '2021-05-05 10:03:35');
INSERT INTO `question` VALUES (153, 1, 2, 0, 3, '程序中注解越少越好。', 2, '正确', '错误', '', '', 'B', '2021-05-05 10:03:35');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '超级管理员拥有一切权限！');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` int(11) NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trueName` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ssex` int(2) NOT NULL,
  `classinfo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subjectId`(`subjectId`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (2, 1, '20170206181', '123456', 'zy', 0, 'A1712班');
INSERT INTO `student` VALUES (3, 5, '2017020000', '123456', '测试', 0, 'A1712班');
INSERT INTO `student` VALUES (4, 1, '20170206114', '123456', '张三', 0, 'A1811班');
INSERT INTO `student` VALUES (5, 7, '20210206181', '123456', '李四', 0, 'A2011班');
INSERT INTO `student` VALUES (6, 1, '20210402', '123456', '哈哈哈', 0, 'A2021班');
INSERT INTO `student` VALUES (8, 6, '20210101', '123456', '王五', 1, 'A1711班');
INSERT INTO `student` VALUES (9, 1, '20210305', '123', '赵柳', 0, 'A1713班');
INSERT INTO `student` VALUES (10, 1, '20210403', '123', '测试人员1', 0, 'A1731班');
INSERT INTO `student` VALUES (11, 1, '20210404', '123', '测试人员', 1, 'A1711班');
INSERT INTO `student` VALUES (13, 1, '20210405', '123456', '测试人员2', 0, 'A1711班');
INSERT INTO `student` VALUES (15, 1, '20160100675', '123456', '张颖', 1, 'A1711班');
INSERT INTO `student` VALUES (17, 1, '20170207181', 'Zy123456.', '测试人员4', 1, 'A2012班');
INSERT INTO `student` VALUES (18, 1, '20180206181', '123456', '测试注册', 0, 'A1811班');
INSERT INTO `student` VALUES (19, 5, '20170206111', '123456', '赵四', 0, 'A1711班');
INSERT INTO `student` VALUES (25, 1, '20170206123', 'y123456', '学生1', 1, 'A1712班');
INSERT INTO `student` VALUES (26, 1, '20170206124', 'y123456', '学生2', 0, 'A1712班');
INSERT INTO `student` VALUES (27, 1, '20170206125', 'y123456', '学生3', 1, 'A1712班');
INSERT INTO `student` VALUES (28, 1, '20170206126', 'y123456', '学生4', 0, 'A1712班');
INSERT INTO `student` VALUES (29, 1, '20170206127', 'y123456', '学生5', 1, 'A1712班');
INSERT INTO `student` VALUES (30, 1, '20210428181', 'Zy123456?', '测试姓名', 0, 'A1712班');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grade` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, '软件工程', '计算机与大数据科学学院');
INSERT INTO `subject` VALUES (5, '数学专业', '理学院');
INSERT INTO `subject` VALUES (6, '物理专业', '理学院');
INSERT INTO `subject` VALUES (7, '英语专业', '外国语学院');
INSERT INTO `subject` VALUES (8, '计算机科学与技术', '计算机与大数据科学学院');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleId` int(11) NOT NULL,
  `photo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` int(1) NOT NULL DEFAULT 0,
  `age` int(3) NOT NULL DEFAULT 0,
  `ugrade` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', 1, '/RandomProject/resources/upload/tx.jpg', 2, 1, '计算机与大数据科学');

SET FOREIGN_KEY_CHECKS = 1;
