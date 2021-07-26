/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : rarus_task03-books

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 26/07/2021 17:20:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for authors
-- ----------------------------
DROP TABLE IF EXISTS `authors`;
CREATE TABLE `authors`  (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`author_id`) USING BTREE,
  INDEX `author_id`(`author_id`) USING BTREE,
  INDEX `first_name`(`first_name`) USING BTREE,
  INDEX `last_name`(`last_name`) USING BTREE,
  INDEX `first_name_2`(`first_name`, `last_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of authors
-- ----------------------------
BEGIN;
INSERT INTO `authors` VALUES (1, 'Антонов', 'Михаил'), (2, 'Гребнюков', 'Сергей'), (3, 'Панфилова', 'Зинаида');
COMMIT;

-- ----------------------------
-- Table structure for book_authors
-- ----------------------------
DROP TABLE IF EXISTS `book_authors`;
CREATE TABLE `book_authors`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NULL DEFAULT NULL,
  `author_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `ID`(`ID`) USING BTREE,
  INDEX `book_id`(`book_id`) USING BTREE,
  INDEX `author_id`(`author_id`) USING BTREE,
  CONSTRAINT `author_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of book_authors
-- ----------------------------
BEGIN;
INSERT INTO `book_authors` VALUES (1, 1, 2), (2, 1, 1), (3, 2, 1), (4, 3, 3);
COMMIT;

-- ----------------------------
-- Table structure for book_genres
-- ----------------------------
DROP TABLE IF EXISTS `book_genres`;
CREATE TABLE `book_genres`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NULL DEFAULT NULL,
  `genre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `ID`(`ID`) USING BTREE,
  INDEX `book_id`(`book_id`) USING BTREE,
  INDEX `genre`(`genre`) USING BTREE,
  CONSTRAINT `id_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of book_genres
-- ----------------------------
BEGIN;
INSERT INTO `book_genres` VALUES (1, 1, 'Фантастика'), (2, 1, 'Триллер'), (3, 2, 'Драма'), (4, 2, 'Фантастика'), (5, 3, 'Триллер');
COMMIT;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `page_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publish_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`) USING BTREE,
  INDEX `book_id`(`book_id`) USING BTREE,
  INDEX `ISBN`(`ISBN`) USING BTREE,
  INDEX `title`(`title`) USING BTREE,
  INDEX `page_count`(`page_count`) USING BTREE,
  INDEX `publish_date`(`publish_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of books
-- ----------------------------
BEGIN;
INSERT INTO `books` VALUES (1, '3196', 'Казначей', '191', '13.07.2018'), (2, '5185', 'Интерактив', '218', '10.03.2020'), (3, '7318', 'Грим', '73', '17.08.2021');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
