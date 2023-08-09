/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100427
 Source Host           : localhost:3306
 Source Schema         : ketuntasan

 Target Server Type    : MySQL
 Target Server Version : 100427
 File Encoding         : 65001

 Date: 09/08/2023 18:54:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for batas_waktu
-- ----------------------------
DROP TABLE IF EXISTS `batas_waktu`;
CREATE TABLE `batas_waktu`  (
  `batas_waktu_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `start_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `end_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tahun_ajaran_id` bigint UNSIGNED NOT NULL,
  `status` int NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`batas_waktu_id`) USING BTREE,
  INDEX `batas_waktu_tahun_ajaran_id_foreign`(`tahun_ajaran_id`) USING BTREE,
  CONSTRAINT `batas_waktu_tahun_ajaran_id_foreign` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajaran` (`tahun_ajaran_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of batas_waktu
-- ----------------------------

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for guru_mapel
-- ----------------------------
DROP TABLE IF EXISTS `guru_mapel`;
CREATE TABLE `guru_mapel`  (
  `guru_mapel_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `mapel_id` bigint UNSIGNED NOT NULL,
  `status` int NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `creted_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`guru_mapel_id`) USING BTREE,
  INDEX `guru_mapel_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `guru_mapel_mapel_id_foreign`(`mapel_id`) USING BTREE,
  CONSTRAINT `guru_mapel_mapel_id_foreign` FOREIGN KEY (`mapel_id`) REFERENCES `mapel` (`mapel_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `guru_mapel_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 185 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of guru_mapel
-- ----------------------------
INSERT INTO `guru_mapel` VALUES (1, 2, 1, 1, '2023-08-08 08:59:09', '2023-08-08 08:59:09', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (2, 3, 1, 1, '2023-08-08 08:59:15', '2023-08-08 08:59:15', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (3, 4, 1, 1, '2023-08-08 08:59:29', '2023-08-08 08:59:29', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (4, 5, 1, 1, '2023-08-08 08:59:36', '2023-08-08 08:59:36', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (5, 6, 1, 1, '2023-08-08 08:59:42', '2023-08-08 08:59:42', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (6, 7, 2, 1, '2023-08-08 09:00:24', '2023-08-08 09:00:24', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (7, 8, 2, 1, '2023-08-08 09:00:33', '2023-08-08 09:00:33', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (8, 9, 2, 1, '2023-08-08 09:00:41', '2023-08-08 09:00:41', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (9, 10, 2, 1, '2023-08-08 09:00:58', '2023-08-08 09:00:58', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (10, 10, 3, 1, '2023-08-08 09:00:58', '2023-08-08 09:00:58', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (11, 11, 4, 1, '2023-08-08 09:01:20', '2023-08-08 09:01:20', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (12, 12, 4, 1, '2023-08-08 09:01:29', '2023-08-08 09:01:29', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (13, 13, 4, 1, '2023-08-08 09:01:43', '2023-08-08 09:01:43', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (14, 14, 4, 1, '2023-08-08 09:01:54', '2023-08-08 09:01:54', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (15, 15, 4, 1, '2023-08-08 09:02:03', '2023-08-08 09:02:03', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (16, 16, 4, 1, '2023-08-08 09:02:24', '2023-08-08 09:02:24', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (17, 16, 5, 1, '2023-08-08 09:02:24', '2023-08-08 09:02:24', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (18, 17, 6, 1, '2023-08-08 09:02:32', '2023-08-08 09:02:32', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (19, 18, 6, 1, '2023-08-08 09:02:43', '2023-08-08 09:02:43', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (20, 19, 6, 1, '2023-08-08 09:03:02', '2023-08-08 09:03:02', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (21, 19, 3, 1, '2023-08-08 09:03:02', '2023-08-08 09:03:02', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (22, 20, 7, 1, '2023-08-08 09:03:11', '2023-08-08 09:03:11', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (23, 21, 7, 1, '2023-08-08 09:03:19', '2023-08-08 09:03:19', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (24, 22, 8, 1, '2023-08-08 09:03:29', '2023-08-08 09:03:29', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (25, 23, 8, 1, '2023-08-08 09:06:05', '2023-08-08 09:06:05', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (26, 23, 9, 1, '2023-08-08 09:06:05', '2023-08-08 09:06:05', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (27, 23, 10, 1, '2023-08-08 09:06:05', '2023-08-08 09:06:05', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (28, 23, 11, 1, '2023-08-08 09:06:05', '2023-08-08 09:06:05', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (29, 24, 12, 1, '2023-08-08 09:06:15', '2023-08-08 09:06:15', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (30, 25, 12, 1, '2023-08-08 09:06:22', '2023-08-08 09:06:22', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (31, 26, 12, 1, '2023-08-08 09:06:32', '2023-08-08 09:06:32', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (32, 27, 12, 1, '2023-08-08 09:06:38', '2023-08-08 09:06:38', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (33, 28, 12, 1, '2023-08-08 09:06:45', '2023-08-08 09:06:45', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (34, 29, 12, 1, '2023-08-08 09:07:07', '2023-08-08 09:07:07', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (35, 29, 9, 1, '2023-08-08 09:07:07', '2023-08-08 09:07:07', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (36, 30, 12, 1, '2023-08-08 09:07:29', '2023-08-08 09:07:29', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (37, 30, 9, 1, '2023-08-08 09:07:29', '2023-08-08 09:07:29', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (38, 31, 13, 1, '2023-08-08 09:07:50', '2023-08-08 09:07:50', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (39, 31, 3, 1, '2023-08-08 09:07:50', '2023-08-08 09:07:50', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (40, 31, 12, 1, '2023-08-08 09:07:50', '2023-08-08 09:07:50', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (41, 32, 14, 1, '2023-08-08 09:08:00', '2023-08-08 09:08:00', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (42, 33, 14, 1, '2023-08-08 09:08:12', '2023-08-08 09:08:12', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (43, 34, 14, 1, '2023-08-08 09:08:29', '2023-08-08 09:08:29', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (44, 35, 14, 1, '2023-08-08 09:08:35', '2023-08-08 09:08:35', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (45, 36, 14, 1, '2023-08-08 09:08:53', '2023-08-08 09:08:53', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (46, 36, 5, 1, '2023-08-08 09:08:53', '2023-08-08 09:08:53', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (47, 37, 5, 1, '2023-08-08 09:09:09', '2023-08-08 09:09:09', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (48, 37, 14, 1, '2023-08-08 09:09:09', '2023-08-08 09:09:09', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (49, 38, 14, 1, '2023-08-08 09:09:22', '2023-08-08 09:09:22', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (50, 38, 5, 1, '2023-08-08 09:09:22', '2023-08-08 09:09:22', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (51, 39, 15, 1, '2023-08-08 09:09:33', '2023-08-08 09:09:33', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (52, 40, 15, 1, '2023-08-08 09:09:43', '2023-08-08 09:09:43', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (53, 41, 11, 1, '2023-08-08 09:10:06', '2023-08-08 09:10:06', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (54, 42, 11, 1, '2023-08-08 09:10:19', '2023-08-08 09:10:19', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (55, 43, 11, 1, '2023-08-08 09:10:30', '2023-08-08 09:10:30', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (56, 44, 16, 1, '2023-08-08 09:11:28', '2023-08-08 09:11:28', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (57, 44, 17, 1, '2023-08-08 09:11:28', '2023-08-08 09:11:28', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (58, 44, 18, 1, '2023-08-08 09:11:28', '2023-08-08 09:11:28', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (59, 45, 16, 1, '2023-08-08 09:11:54', '2023-08-08 09:11:54', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (60, 45, 19, 1, '2023-08-08 09:11:54', '2023-08-08 09:11:54', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (61, 45, 20, 1, '2023-08-08 09:11:54', '2023-08-08 09:11:54', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (62, 46, 16, 1, '2023-08-08 09:13:07', '2023-08-08 09:13:07', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (63, 46, 21, 1, '2023-08-08 09:13:07', '2023-08-08 09:13:07', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (64, 46, 18, 1, '2023-08-08 09:13:07', '2023-08-08 09:13:07', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (65, 46, 23, 1, '2023-08-08 09:13:07', '2023-08-08 09:13:07', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (66, 47, 24, 1, '2023-08-08 09:13:39', '2023-08-08 09:13:39', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (67, 47, 25, 1, '2023-08-08 09:13:39', '2023-08-08 09:13:39', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (68, 47, 16, 1, '2023-08-08 09:13:39', '2023-08-08 09:13:39', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (69, 48, 16, 1, '2023-08-08 09:14:14', '2023-08-08 09:14:14', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (70, 48, 26, 1, '2023-08-08 09:14:14', '2023-08-08 09:14:14', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (71, 48, 27, 1, '2023-08-08 09:14:14', '2023-08-08 09:14:14', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (72, 49, 28, 1, '2023-08-08 09:14:53', '2023-08-08 09:14:53', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (73, 49, 29, 1, '2023-08-08 09:14:53', '2023-08-08 09:14:53', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (74, 49, 30, 1, '2023-08-08 09:14:53', '2023-08-08 09:14:53', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (75, 49, 31, 1, '2023-08-08 09:14:53', '2023-08-08 09:14:53', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (76, 50, 30, 1, '2023-08-08 09:15:31', '2023-08-08 09:15:31', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (77, 50, 32, 1, '2023-08-08 09:15:31', '2023-08-08 09:15:31', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (78, 50, 33, 1, '2023-08-08 09:15:31', '2023-08-08 09:15:31', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (79, 51, 34, 1, '2023-08-08 09:15:56', '2023-08-08 09:15:56', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (80, 51, 35, 1, '2023-08-08 09:15:56', '2023-08-08 09:15:56', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (81, 51, 36, 1, '2023-08-08 09:15:56', '2023-08-08 09:15:56', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (82, 52, 37, 1, '2023-08-08 09:16:20', '2023-08-08 09:16:20', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (83, 52, 32, 1, '2023-08-08 09:16:20', '2023-08-08 09:16:20', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (84, 53, 18, 1, '2023-08-08 09:16:44', '2023-08-08 09:16:44', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (85, 53, 28, 1, '2023-08-08 09:16:44', '2023-08-08 09:16:44', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (86, 54, 38, 1, '2023-08-08 09:17:07', '2023-08-08 09:17:07', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (87, 54, 39, 1, '2023-08-08 09:17:07', '2023-08-08 09:17:07', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (88, 55, 18, 1, '2023-08-08 09:17:34', '2023-08-08 09:17:34', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (89, 55, 28, 1, '2023-08-08 09:17:34', '2023-08-08 09:17:34', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (90, 56, 40, 1, '2023-08-08 09:18:05', '2023-08-08 09:18:05', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (91, 56, 33, 1, '2023-08-08 09:18:05', '2023-08-08 09:18:05', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (92, 56, 36, 1, '2023-08-08 09:18:05', '2023-08-08 09:18:05', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (93, 57, 40, 1, '2023-08-08 09:18:39', '2023-08-08 09:18:39', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (94, 57, 32, 1, '2023-08-08 09:18:40', '2023-08-08 09:18:40', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (95, 57, 29, 1, '2023-08-08 09:18:40', '2023-08-08 09:18:40', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (96, 58, 41, 1, '2023-08-08 09:19:07', '2023-08-08 09:19:07', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (97, 58, 42, 1, '2023-08-08 09:19:07', '2023-08-08 09:19:07', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (98, 58, 43, 1, '2023-08-08 09:19:07', '2023-08-08 09:19:07', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (99, 59, 32, 1, '2023-08-08 09:19:59', '2023-08-08 09:19:59', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (100, 59, 18, 1, '2023-08-08 09:19:59', '2023-08-08 09:19:59', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (101, 59, 29, 1, '2023-08-08 09:19:59', '2023-08-08 09:19:59', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (102, 59, 28, 1, '2023-08-08 09:19:59', '2023-08-08 09:19:59', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (103, 60, 44, 1, '2023-08-08 09:20:54', '2023-08-08 09:20:54', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (104, 60, 45, 1, '2023-08-08 09:20:54', '2023-08-08 09:20:54', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (105, 60, 46, 1, '2023-08-08 09:20:54', '2023-08-08 09:20:54', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (106, 60, 34, 1, '2023-08-08 09:20:54', '2023-08-08 09:20:54', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (107, 61, 47, 1, '2023-08-08 09:21:24', '2023-08-08 09:21:24', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (108, 61, 48, 1, '2023-08-08 09:21:24', '2023-08-08 09:21:24', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (109, 61, 49, 1, '2023-08-08 09:21:24', '2023-08-08 09:21:24', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (110, 62, 50, 1, '2023-08-08 09:21:53', '2023-08-08 09:21:53', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (111, 62, 51, 1, '2023-08-08 09:21:53', '2023-08-08 09:21:53', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (112, 62, 52, 1, '2023-08-08 09:21:53', '2023-08-08 09:21:53', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (113, 63, 44, 1, '2023-08-08 09:23:04', '2023-08-08 09:23:04', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (114, 63, 53, 1, '2023-08-08 09:23:04', '2023-08-08 09:23:04', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (115, 63, 46, 1, '2023-08-08 09:23:04', '2023-08-08 09:23:04', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (116, 63, 47, 1, '2023-08-08 09:23:04', '2023-08-08 09:23:04', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (117, 64, 18, 1, '2023-08-08 09:23:58', '2023-08-08 09:23:58', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (118, 64, 54, 1, '2023-08-08 09:23:58', '2023-08-08 09:23:58', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (119, 64, 34, 1, '2023-08-08 09:23:58', '2023-08-08 09:23:58', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (120, 64, 50, 1, '2023-08-08 09:23:58', '2023-08-08 09:23:58', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (121, 64, 5, 1, '2023-08-08 09:23:58', '2023-08-08 09:23:58', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (122, 65, 9, 1, '2023-08-08 09:24:16', '2023-08-08 09:24:16', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (123, 65, 5, 1, '2023-08-08 09:24:16', '2023-08-08 09:24:16', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (124, 66, 55, 1, '2023-08-08 09:24:39', '2023-08-08 09:24:39', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (125, 66, 56, 1, '2023-08-08 09:24:39', '2023-08-08 09:24:39', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (126, 66, 57, 1, '2023-08-08 09:24:39', '2023-08-08 09:24:39', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (127, 67, 10, 1, '2023-08-08 09:24:58', '2023-08-08 09:24:58', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (128, 67, 58, 1, '2023-08-08 09:24:58', '2023-08-08 09:24:58', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (129, 68, 59, 1, '2023-08-08 09:25:32', '2023-08-08 09:25:32', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (130, 68, 60, 1, '2023-08-08 09:25:32', '2023-08-08 09:25:32', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (131, 68, 61, 1, '2023-08-08 09:25:32', '2023-08-08 09:25:32', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (132, 69, 62, 1, '2023-08-08 09:26:00', '2023-08-08 09:26:00', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (133, 69, 9, 1, '2023-08-08 09:26:00', '2023-08-08 09:26:00', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (134, 69, 61, 1, '2023-08-08 09:26:00', '2023-08-08 09:26:00', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (135, 70, 63, 1, '2023-08-08 09:26:19', '2023-08-08 09:26:19', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (136, 70, 64, 1, '2023-08-08 09:26:19', '2023-08-08 09:26:19', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (137, 71, 65, 1, '2023-08-08 09:27:08', '2023-08-08 09:27:08', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (138, 71, 66, 1, '2023-08-08 09:27:08', '2023-08-08 09:27:08', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (139, 71, 43, 1, '2023-08-08 09:27:08', '2023-08-08 09:27:08', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (140, 71, 67, 1, '2023-08-08 09:27:08', '2023-08-08 09:27:08', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (141, 72, 68, 1, '2023-08-08 09:28:11', '2023-08-08 09:28:11', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (142, 72, 46, 1, '2023-08-08 09:28:11', '2023-08-08 09:28:11', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (143, 72, 66, 1, '2023-08-08 09:28:11', '2023-08-08 09:28:11', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (144, 72, 69, 1, '2023-08-08 09:28:11', '2023-08-08 09:28:11', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (145, 72, 18, 1, '2023-08-08 09:28:11', '2023-08-08 09:28:11', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (146, 73, 60, 1, '2023-08-08 09:28:25', '2023-08-08 09:28:25', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (147, 74, 70, 1, '2023-08-08 09:28:46', '2023-08-08 09:28:46', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (148, 74, 71, 1, '2023-08-08 09:28:46', '2023-08-08 09:28:46', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (149, 75, 72, 1, '2023-08-08 09:29:00', '2023-08-08 09:29:00', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (150, 75, 71, 1, '2023-08-08 09:29:00', '2023-08-08 09:29:00', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (151, 76, 73, 1, '2023-08-08 09:29:23', '2023-08-08 09:29:23', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (152, 76, 74, 1, '2023-08-08 09:29:23', '2023-08-08 09:29:23', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (153, 76, 46, 1, '2023-08-08 09:29:23', '2023-08-08 09:29:23', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (154, 77, 75, 1, '2023-08-08 09:30:06', '2023-08-08 09:30:06', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (155, 77, 76, 1, '2023-08-08 09:30:06', '2023-08-08 09:30:06', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (156, 77, 77, 1, '2023-08-08 09:30:06', '2023-08-08 09:30:06', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (157, 77, 78, 1, '2023-08-08 09:30:06', '2023-08-08 09:30:06', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (158, 78, 18, 1, '2023-08-08 09:30:40', '2023-08-08 09:30:40', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (159, 78, 79, 1, '2023-08-08 09:30:40', '2023-08-08 09:30:40', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (160, 78, 75, 1, '2023-08-08 09:30:40', '2023-08-08 09:30:40', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (161, 79, 80, 1, '2023-08-08 09:31:03', '2023-08-08 09:31:03', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (162, 79, 72, 1, '2023-08-08 09:31:03', '2023-08-08 09:31:03', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (163, 79, 81, 1, '2023-08-08 09:31:03', '2023-08-08 09:31:03', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (164, 80, 82, 1, '2023-08-08 09:31:32', '2023-08-08 09:31:32', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (165, 80, 83, 1, '2023-08-08 09:31:32', '2023-08-08 09:31:32', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (166, 80, 84, 1, '2023-08-08 09:31:32', '2023-08-08 09:31:32', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (167, 80, 85, 1, '2023-08-08 09:31:32', '2023-08-08 09:31:32', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (168, 81, 9, 1, '2023-08-08 09:32:10', '2023-08-08 09:32:10', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (169, 81, 86, 1, '2023-08-08 09:32:10', '2023-08-08 09:32:10', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (170, 82, 87, 1, '2023-08-08 09:32:41', '2023-08-08 09:32:41', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (171, 82, 88, 1, '2023-08-08 09:32:41', '2023-08-08 09:32:41', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (172, 82, 89, 1, '2023-08-08 09:32:41', '2023-08-08 09:32:41', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (173, 82, 90, 1, '2023-08-08 09:32:41', '2023-08-08 09:32:41', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (174, 83, 91, 1, '2023-08-08 09:33:29', '2023-08-08 09:33:29', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (175, 83, 92, 1, '2023-08-08 09:33:29', '2023-08-08 09:33:29', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (176, 83, 46, 1, '2023-08-08 09:33:29', '2023-08-08 09:33:29', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (177, 83, 93, 1, '2023-08-08 09:33:29', '2023-08-08 09:33:29', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (178, 84, 94, 1, '2023-08-08 09:33:35', '2023-08-08 09:33:35', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (179, 85, 94, 1, '2023-08-08 09:33:44', '2023-08-08 09:33:44', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (180, 86, 94, 1, '2023-08-08 09:33:54', '2023-08-08 09:33:54', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (181, 87, 94, 1, '2023-08-08 09:34:02', '2023-08-08 09:34:02', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (182, 88, 94, 1, '2023-08-08 09:34:09', '2023-08-08 09:34:09', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (183, 89, 94, 1, '2023-08-08 09:34:18', '2023-08-08 09:34:18', NULL, NULL);
INSERT INTO `guru_mapel` VALUES (184, 90, 94, 1, '2023-08-08 09:34:27', '2023-08-08 09:34:27', NULL, NULL);

-- ----------------------------
-- Table structure for jurusan
-- ----------------------------
DROP TABLE IF EXISTS `jurusan`;
CREATE TABLE `jurusan`  (
  `jurusan_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_jurusan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `creted_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`jurusan_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jurusan
-- ----------------------------

-- ----------------------------
-- Table structure for kelas
-- ----------------------------
DROP TABLE IF EXISTS `kelas`;
CREATE TABLE `kelas`  (
  `kelas_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `jurusan_id` bigint UNSIGNED NOT NULL,
  `nama_kelas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `creted_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`kelas_id`) USING BTREE,
  INDEX `kelas_jurusan_id_foreign`(`jurusan_id`) USING BTREE,
  CONSTRAINT `kelas_jurusan_id_foreign` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusan` (`jurusan_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kelas
-- ----------------------------

-- ----------------------------
-- Table structure for kelas_mapel
-- ----------------------------
DROP TABLE IF EXISTS `kelas_mapel`;
CREATE TABLE `kelas_mapel`  (
  `kelas_mapel_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tingkatan` int NOT NULL,
  `jurusan_id` bigint UNSIGNED NOT NULL,
  `kelas_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `mapel_id` bigint UNSIGNED NOT NULL,
  `tahun_ajaran_id` bigint UNSIGNED NOT NULL,
  `status` int NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `creted_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`kelas_mapel_id`) USING BTREE,
  INDEX `kelas_mapel_jurusan_id_foreign`(`jurusan_id`) USING BTREE,
  INDEX `kelas_mapel_kelas_id_foreign`(`kelas_id`) USING BTREE,
  INDEX `kelas_mapel_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `kelas_mapel_mapel_id_foreign`(`mapel_id`) USING BTREE,
  INDEX `kelas_mapel_tahun_ajaran_id_foreign`(`tahun_ajaran_id`) USING BTREE,
  CONSTRAINT `kelas_mapel_jurusan_id_foreign` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusan` (`jurusan_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `kelas_mapel_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`kelas_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `kelas_mapel_mapel_id_foreign` FOREIGN KEY (`mapel_id`) REFERENCES `mapel` (`mapel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `kelas_mapel_tahun_ajaran_id_foreign` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajaran` (`tahun_ajaran_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `kelas_mapel_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kelas_mapel
-- ----------------------------

-- ----------------------------
-- Table structure for ketuntasan
-- ----------------------------
DROP TABLE IF EXISTS `ketuntasan`;
CREATE TABLE `ketuntasan`  (
  `ketuntasan_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `kelas_mapel_id` bigint UNSIGNED NOT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tgl_tuntas` timestamp NULL DEFAULT NULL,
  `tuntas` int NOT NULL DEFAULT 0,
  `tahun_ajaran_id` bigint UNSIGNED NOT NULL,
  `semester` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `creted_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`ketuntasan_id`) USING BTREE,
  INDEX `ketuntasan_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `ketuntasan_kelas_mapel_id_foreign`(`kelas_mapel_id`) USING BTREE,
  INDEX `ketuntasan_tahun_ajaran_id_foreign`(`tahun_ajaran_id`) USING BTREE,
  CONSTRAINT `ketuntasan_kelas_mapel_id_foreign` FOREIGN KEY (`kelas_mapel_id`) REFERENCES `kelas_mapel` (`kelas_mapel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ketuntasan_tahun_ajaran_id_foreign` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajaran` (`tahun_ajaran_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ketuntasan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ketuntasan
-- ----------------------------

-- ----------------------------
-- Table structure for mapel
-- ----------------------------
DROP TABLE IF EXISTS `mapel`;
CREATE TABLE `mapel`  (
  `mapel_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_mapel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `creted_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`mapel_id`) USING BTREE,
  UNIQUE INDEX `mapel_nama_mapel_unique`(`nama_mapel`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mapel
-- ----------------------------
INSERT INTO `mapel` VALUES (1, 'PAI dan Budi Pekerti', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (2, 'Pendidikan Pancasila', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (3, 'Mulok Bahasa Daerah Madura', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (4, 'Bahasa Indonesia', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (5, 'Mulok Bahasa Daerah Jawa', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (6, 'Penjas & OR', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (7, 'Sejarah Indonesia', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (8, 'Seni Budaya', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (9, 'Produk/Projek Kreatif dan Kewirausahaan', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (10, 'Sketsa dan Ilustrasi', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (11, 'Projek Ilmu Pengetahuan Alam dan Sosial', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (12, 'Matematika', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (13, 'Mapel Pilihan: Public Speaking', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (14, 'Bahasa Inggris', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (15, 'Informatika', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (16, 'Dasar-dasar Manajemen Perkantoran dan Layanan Bisnis', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (17, 'Teknologi kantor', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (18, 'Produk Kreatif dan Kewirausahaan', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (19, 'Pengelolaan administrasi umum', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (20, 'Otomatisasi Tata Kelola Kepegawaian', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (21, 'Ekonomi dan bisnis', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (22, 'Otomatisasi Tata Kelola Humas dan Keprotokolan', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (23, 'Otomatisasi Tata Kelola Keuangan', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (24, 'Komunikasi di tempat kerja', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (25, 'Pengelolaan kearsipan', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (26, 'Otomatisasi Tata Kelola Sarana dan Prasarana', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (27, 'Layanan Lembaga Perbankan dan Keuangan Mikro', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (28, 'Akuntansi Perbankan dan Keuangan Mikro', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (29, 'Administrasi Pajak', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (30, 'Projek/Produk Kreatif dan Kewirausahaan', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (31, 'Komputer Akuntansi', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (32, 'Akuntansi Keuangan', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (33, 'Ekonomi Bisnis dan Administrasi Umum', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (34, 'Perpajakan', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (35, 'Praktikum Akuntansi Lembaga/ Instansi Pemerintah', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (36, 'Dasar Akuntansi dan Perbankan', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (37, 'Akuntansi Perusahaan Dagang', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (38, 'Praktikum Akuntansi Perusahaan Jasa, Dagang dan Manufacture', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (39, 'Akuntansi Dasar', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (40, 'Aplikasi Pengolah Angka / Spreadsheet', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (41, 'Mapel Pilihan: Microsoft Class', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (42, 'Pemrograman Berorientasi Objek', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (43, 'Bisnis Online', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (44, 'Digital Branding', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (45, 'Projek Kreatif dan Kewirausahaan', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (46, 'Komunikasi bisnis', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (47, 'Pengelolaan Bisnis Ritel', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (48, 'Administrasi Transaksi', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (49, 'Marketing', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (50, 'Dasar-dasar: Perilaku Konsumen dan Pelayanan Penjualan', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (51, 'Penataan Produk', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (52, 'Digital on boarding', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (53, 'Dasar-dasar: Teknologi Pemasaran', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (54, 'Dasar Kreativitas', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (55, 'Prinsip Dasar Komunikasi', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (56, 'Perangkat Lunak Desain', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (57, 'Audio dan Video (K13)', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (58, 'Pemrograman Berbasis Teks,Grafis, dan Multimedia', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (59, 'Pemrograman Web dan Perangkat Bergerak', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (60, 'Desain Multimedia Interaktif (K13)', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (61, 'Mapel Pilihan: Animasi 2D', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (62, 'Dasar DKV', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (63, 'DKV 1', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (64, 'Pemrograman Perangkat Bergerak', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (65, 'Basis Data', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (66, 'Dasar-dasar: Pemrograman Berorientasi Obyek', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (67, 'Dasar-Dasar: Perkembangan Perangkat Lunak dan Pemrograman Prosedural', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (68, 'Pemrograman Web', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (69, 'Teknologi Layanan Jaringan (TLJ)', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (70, 'Perencanaan dan pengalamatan Jaringan (PPJ)', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (71, 'Administrasi Sistem Jaringan (ASJ)', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (72, 'Teknologi Komtel dan Budaya Industri (TKBI)', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (73, 'Teknologi Jaringan Kabel dan Nirkabel (TJKN)', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (74, 'Administrasi Infrastruktur Jaringan', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (75, 'Pemasangan dan Konfigurasi Perangkat Jaringan (PKPJ)', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (76, 'Jaringan Komtel Dasar (JKD)', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (77, 'Cloud Computing', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (78, 'Bisnis Teknik Komtel dan Kewirausahaan (BTKK)', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (79, 'Keamanan Jaringan (KJ)', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (80, 'Mapel Pilihan: Perakitan PC dan Laptop', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (81, 'Dasar-dasar: Produksi Media Audio-Visual dan Industri Kreatif', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (82, 'Produksi Konten Media Televisi', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (83, 'Manajemen Produksi,Penulisan naskah dan Penyutradaraan', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (84, 'Mapel Pilihan: Presenter', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (85, 'Dasar-dasar: Manajemen Produksi Media Digital, Industri Broadcasting dan Film', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (86, 'Dasar-dasar: Pengenalan Produksi Media Audio-Visual dan K3LH', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (87, 'Manajemen Produksi Media Online dan Televisi', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (88, 'Tata Artistik', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (89, 'Kamera, Pencahayaan, dan Tata Suara', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (90, 'Editing Audio dan Video', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (91, 'Produksi dan Pengolahan Audio-Visual Televisi', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (92, 'Mapel Pilihan: Fotografi dan Videografi', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);
INSERT INTO `mapel` VALUES (93, 'Bimbingan Konseling', 1, '2023-08-08 13:12:07', '2023-08-08 13:12:07', NULL, NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2010_07_01_000001_create_tahun_ajaran', 1);
INSERT INTO `migrations` VALUES (2, '2010_07_01_032331_create_table_mapel', 1);
INSERT INTO `migrations` VALUES (3, '2010_07_01_032612_create_table_jurusan', 1);
INSERT INTO `migrations` VALUES (4, '2010_07_01_032704_create_table_kelas', 1);
INSERT INTO `migrations` VALUES (5, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (6, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (7, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (8, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (9, '2023_07_27_033012_create_table_guru_mapel', 1);
INSERT INTO `migrations` VALUES (10, '2023_07_27_033409_create_kelas_mapel', 1);
INSERT INTO `migrations` VALUES (11, '2023_07_27_033912_create_ketuntasan', 1);
INSERT INTO `migrations` VALUES (12, '2023_07_27_053430_create_wali_kelas', 1);
INSERT INTO `migrations` VALUES (13, '2023_08_02_120432_create_batas_waktu', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for tahun_ajaran
-- ----------------------------
DROP TABLE IF EXISTS `tahun_ajaran`;
CREATE TABLE `tahun_ajaran`  (
  `tahun_ajaran_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tahun_ajaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_aktif` int NOT NULL DEFAULT 0,
  `superadmin_aktif` int NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `creted_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`tahun_ajaran_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tahun_ajaran
-- ----------------------------
INSERT INTO `tahun_ajaran` VALUES (1, '2023-2024', 1, 1, '2023-08-08 08:41:30', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  `tingkatan` int NULL DEFAULT NULL,
  `jurusan_id` bigint UNSIGNED NULL DEFAULT NULL,
  `kelas_id` bigint UNSIGNED NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `creted_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  INDEX `users_jurusan_id_foreign`(`jurusan_id`) USING BTREE,
  INDEX `users_kelas_id_foreign`(`kelas_id`) USING BTREE,
  CONSTRAINT `users_jurusan_id_foreign` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusan` (`jurusan_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`kelas_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'superadmin', 'superadmin', NULL, NULL, '$2y$10$iUhW1N.6s2CJ9VlohDDhH.GKOdWPs8tkOGjy3yy8oAC317yoODGjy', 1, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:41:30', '2023-08-08 08:41:30', NULL, NULL);
INSERT INTO `users` VALUES (2, 'ahmadhamam236', 'Ahmad Hamam Al Fadil, S.Ag', NULL, NULL, '$2y$10$imdLAq1ULJnNWQOJn32sHOL4iD4Xo8qJdzeB72vMXthDp6tp2Y9jy', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:30', '2023-08-08 08:54:30', NULL, NULL);
INSERT INTO `users` VALUES (3, 'ahmadsalehudin836', 'Akhmad Salehudin, S.Ag', NULL, NULL, '$2y$10$oCJ.8VNrBEo9osSfqSVJ4.O.pa6LnSQfMvNchBdXY51HfZNcL/uZS', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:30', '2023-08-08 08:54:30', NULL, NULL);
INSERT INTO `users` VALUES (4, 'ghandy454', 'Moh. Ghandy Y, S.Pdi', NULL, NULL, '$2y$10$zyL32wqLUhu6LN6TJ5Ow4eR9sW57DNH9OPtEVW7IDvYtmecnt8giy', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:30', '2023-08-08 08:54:30', NULL, NULL);
INSERT INTO `users` VALUES (5, 'haimron235', 'Haimron, S. PdI', NULL, NULL, '$2y$10$w4Yr8q.VOkA00iFTE2nyjOtIv7YcD1.zltf5qxBce2o3YMPAQ8jDW', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:30', '2023-08-08 08:54:30', NULL, NULL);
INSERT INTO `users` VALUES (6, 'abrori3547', 'Muhammad Abrori, S. PdI', NULL, NULL, '$2y$10$6vuHR9WeuA9iQSwS851XBeS5XBhJtdvHpdnBovpvKa1GKrBkGHyvO', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:30', '2023-08-08 08:54:30', NULL, NULL);
INSERT INTO `users` VALUES (7, 'supriyadi4518', 'Drs. Supriyadi', NULL, NULL, '$2y$10$TL4xt.4KrZYsdCYycQhu8uyispLHHFL4cBfOOJROzYxOSgxQMFNEe', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:30', '2023-08-08 08:54:30', NULL, NULL);
INSERT INTO `users` VALUES (8, 'ridwan saidi3547', 'Mohammad Ridwan Saidi, S.Pd', NULL, NULL, '$2y$10$WQAcCiZ7h2FLasjzoAv.lOwvxXP2jM7HeFy6y/IGeCpQwZpNPUZQa', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:30', '2023-08-08 08:54:30', NULL, NULL);
INSERT INTO `users` VALUES (9, 'heriwibowo135', 'Triana Heri Wibowo, S.Pd', NULL, NULL, '$2y$10$r83SJmj8tPCOkEX6pIiHlezr5lVdMQjqTgpSkuJkSauSarEiuGnXK', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:31', '2023-08-08 08:54:31', NULL, NULL);
INSERT INTO `users` VALUES (10, 'agusirantini551', 'Agus Iriantini, S.Pd', NULL, NULL, '$2y$10$zi9R0KH53AOsuUoIhvSrO.saYa8DZLiQ6I0Va9lyAKYTZs0grc/JG', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:31', '2023-08-08 08:54:31', NULL, NULL);
INSERT INTO `users` VALUES (11, 'citrianilam231', 'Citria Nilam Asri C.W, S.Pd', NULL, NULL, '$2y$10$R8fO3qcid5Ca17gfwCTEQelmR8IMeGQ1V7cHo0yaa25V55j2YMUM.', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:31', '2023-08-08 08:54:31', NULL, NULL);
INSERT INTO `users` VALUES (12, 'siswawardani989', 'Siswa Wardani, S. Pd', NULL, NULL, '$2y$10$CFf.jTU6TygazvD0xb7pg.M9Mv9CTzqlGb.VIAgPxb4TqmQ7Qx7NC', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:31', '2023-08-08 08:54:31', NULL, NULL);
INSERT INTO `users` VALUES (13, 'sripurwati265', 'Sri Purwati, S. Pd', NULL, NULL, '$2y$10$BiRe4gDpHpWxomLtBnsO7.p3GDn/T1WrCZZl5mC7xwfJvzFM9xF.6', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:31', '2023-08-08 08:54:31', NULL, NULL);
INSERT INTO `users` VALUES (14, 'nuningevana108', 'Nuning Evana, S. Pd', NULL, NULL, '$2y$10$McC2z3wbjxYV4L4os0E2Gu/b0BkXvf25p8BiGrkR/R/iFIoz/njwa', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:31', '2023-08-08 08:54:31', NULL, NULL);
INSERT INTO `users` VALUES (15, 'achmadmuzaki1545', 'Achmad Muzakki, S.Pd', NULL, NULL, '$2y$10$ZB.RBdbEpkdw25cgjrevSugtVjcBIWWroPg2cFfBURria1Lfbend6', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:31', '2023-08-08 08:54:31', NULL, NULL);
INSERT INTO `users` VALUES (16, 'meythasuryaningtari0980', 'Meytha Suryaningtari, S.Pd', NULL, NULL, '$2y$10$3VclZhXjM608pz86aPR0qu6JcvrafadJLuK379dGnXWz.fQyugXx.', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:32', '2023-08-08 08:54:32', NULL, NULL);
INSERT INTO `users` VALUES (17, 'didikcahyono1354', 'Drs. Didik Cahyono', NULL, NULL, '$2y$10$hX2A1HbArZnthMII3c.yi.sP89T0ZmKw./9EXnNWhlrgFVjBAJUQ2', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:32', '2023-08-08 08:54:32', NULL, NULL);
INSERT INTO `users` VALUES (18, 'dwiarianto1364', 'Drs. Dwi Arianto,M.M', NULL, NULL, '$2y$10$YrXSNVPa6SPWeTFyhLwm2.Ob/EMAexVTuX7Xs/5cWfveOwWCuiVp2', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:32', '2023-08-08 08:54:32', NULL, NULL);
INSERT INTO `users` VALUES (19, 'achsoegianto231', 'Ach. Soegianto, S.Pd', NULL, NULL, '$2y$10$.0.xq7e2/Pwlrrbq8Hwcl.XEVki3HMrRmh2pOfXQzsmQgH797fgrG', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:32', '2023-08-08 08:54:32', NULL, NULL);
INSERT INTO `users` VALUES (20, 'deniputra1236', 'Deni Putra Pratama, S.Pd', NULL, NULL, '$2y$10$KjF3VCXQCmMrOi3uDXYUbuflxPrqYDBm/7rmGhjLevhr.D1SFF4OO', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:32', '2023-08-08 08:54:32', NULL, NULL);
INSERT INTO `users` VALUES (21, 'nurkhaefialviah1457', 'Nurkhaefi Alviah, S.Pd', NULL, NULL, '$2y$10$ZJBgiqRpStNZn2dGjRqG8eFNTLgEmIViB.sKPHH1wXDof7yuCt3RO', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:32', '2023-08-08 08:54:32', NULL, NULL);
INSERT INTO `users` VALUES (22, 'awhendro1368', 'AW Hendro P W, S.Sn', NULL, NULL, '$2y$10$izeRLep1EArtPqDoV.x/.OHCbh.r1k5ZgJkEmcETYTPXV2WcT3IGW', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:32', '2023-08-08 08:54:32', NULL, NULL);
INSERT INTO `users` VALUES (23, 'ditaageng942', 'Dita Ageng, S. Sn', NULL, NULL, '$2y$10$2rHkfZoOOM1hgeRhsaaW3O.8OzpydItC2YBGZpfv.gffFSpGDQLwK', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:32', '2023-08-08 08:54:32', NULL, NULL);
INSERT INTO `users` VALUES (24, 'prabandari1235', 'Prabandari B, S. Pd', NULL, NULL, '$2y$10$.HjE7E1ka.ysV/N9rFso..g0dDI/ghKea2dnokgIGVG8v6ST/kosC', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:33', '2023-08-08 08:54:33', NULL, NULL);
INSERT INTO `users` VALUES (25, 'aguswahyudi198', 'Agus Wahyudi, SPd.', NULL, NULL, '$2y$10$cJARZaOVjaLyHXOSCt9w6u6mn9ROM7ZoG01b5AzgxPUEIFrnJCFca', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:33', '2023-08-08 08:54:33', NULL, NULL);
INSERT INTO `users` VALUES (26, 'mohaksan1347', 'Mohamad Aksan, S.Pd', NULL, NULL, '$2y$10$SijOaRLKHLl4BdqS2a/6vuE5IJkrU9/p5IxJf8RM9OU36v5W8FpKK', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:33', '2023-08-08 08:54:33', NULL, NULL);
INSERT INTO `users` VALUES (27, 'mimiksuripmiyati2361', 'Mimik Suripmiyati, S. Pd', NULL, NULL, '$2y$10$HDYx2tJrJuxb3W7betMmcO2E.l7b/OGKbdIw8utMJVP18xBaeQnR6', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:33', '2023-08-08 08:54:33', NULL, NULL);
INSERT INTO `users` VALUES (28, 'wiyono2371', 'Wiyono, S. Pd', NULL, NULL, '$2y$10$5MZ9lkPEX3OWHAlz/An7SOufazDorwtzrJnuOY0pojSVW4NlSEeJu', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:33', '2023-08-08 08:54:33', NULL, NULL);
INSERT INTO `users` VALUES (29, 'hendrapramana2451', 'Hendra Pramana, S.Pd', NULL, NULL, '$2y$10$fNZ51wIK1JoGEr4QUNQO1ugd0jALRivWwl3DaTI.Uk9zoIIquEYIy', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:33', '2023-08-08 08:54:33', NULL, NULL);
INSERT INTO `users` VALUES (30, 'aizedjunaidi3461', 'Aized Junaidi, S.Pd', NULL, NULL, '$2y$10$ozwPijyoygJKNlcgoajPJuE5ZtZHf.Oo6Y0KPG6xitpYMAytMlZ3W', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:33', '2023-08-08 08:54:33', NULL, NULL);
INSERT INTO `users` VALUES (31, 'ruslanhasim4517', 'Ruslan Hasim, S.Pd', NULL, NULL, '$2y$10$qPWIX19wAlf/KgbAa1VkIOAmEzTUos7FU.qNiCL0M86Sm1lVLo/LO', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:34', '2023-08-08 08:54:34', NULL, NULL);
INSERT INTO `users` VALUES (32, 'ributpaidi1476', 'Ribut Paidi, S.Pd, GR', NULL, NULL, '$2y$10$z5TbJfImzNLDEuKyPxUokuVz2KSYVLpaO0OM9CqtBADpFG6vSUnT6', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:34', '2023-08-08 08:54:34', NULL, NULL);
INSERT INTO `users` VALUES (33, 'dinitriana0193', 'Dini Triana A, S.Pd', NULL, NULL, '$2y$10$EdgkeCXfN27U9TugJzt4zOmMWCozy9AUXjzPT7gVFjr3ttLk2Dw9G', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:34', '2023-08-08 08:54:34', NULL, NULL);
INSERT INTO `users` VALUES (34, 'ikapujirahayu582', 'Ika Puji Rahayu, S. Pd', NULL, NULL, '$2y$10$3CryGrGtMidUQbctfRUqZ.1UJn/wg9CMDSAQFyGvnCyeMAgTIjS/q', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:34', '2023-08-08 08:54:34', NULL, NULL);
INSERT INTO `users` VALUES (35, 'ellyflorida2471', 'Elly Florida, S.S', NULL, NULL, '$2y$10$k75s7lMnbLBcDwf4FbfTYuE3av.9ziJtC3yLtdxbk.I.p33ltEEiC', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:34', '2023-08-08 08:54:34', NULL, NULL);
INSERT INTO `users` VALUES (36, 'arifsubagyo990', 'Arif Subagyo, S.Pd', NULL, NULL, '$2y$10$U9tD8ZoUK3VHkxSfEiCJV.vzhx6WSH.bSMPiHnEinHUGUUkKcZy6K', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:34', '2023-08-08 08:54:34', NULL, NULL);
INSERT INTO `users` VALUES (37, 'feny991', 'Dra. Feny', NULL, NULL, '$2y$10$d0sGid0.6ndhTCKaHbsu8O4bJs6Lz14TnMiaJGCWJ25EPIyh6oNTq', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:34', '2023-08-08 08:54:34', NULL, NULL);
INSERT INTO `users` VALUES (38, 'agungrosariyaelinda1928', 'Agung Rosariya Elinda, S.Pd', NULL, NULL, '$2y$10$Y.tzsXNjnOjZdpLDlvv1nOXGrvVL6MRkWoJAVUd3Enx1uFMZabASq', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:34', '2023-08-08 08:54:34', NULL, NULL);
INSERT INTO `users` VALUES (39, 'hanifahhamzah241', 'Hanifah Hamzah, S. Kom', NULL, NULL, '$2y$10$jNn5KPiKbZ91Te/fuLnaFuT5VYtIlolRE9xiPY/yJS5Si/zHhZR6a', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:35', '2023-08-08 08:54:35', NULL, NULL);
INSERT INTO `users` VALUES (40, 'nanangkristanto234', 'Nanang Kristanto, S.E', NULL, NULL, '$2y$10$wZNIpYuvY2VpJMG6P5YpOuA8p82EshcLwJgURhtAn0R.iOuWbmXAW', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:35', '2023-08-08 08:54:35', NULL, NULL);
INSERT INTO `users` VALUES (41, 'rofiatulfauziah245', 'Rofiatul Fauziah, M.Pd', NULL, NULL, '$2y$10$NzWQo40LUHYgqOdQ2MmEEeuJ7ZvME3RmkJcXBpD11H0wc8wVjjtKm', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:35', '2023-08-08 08:54:35', NULL, NULL);
INSERT INTO `users` VALUES (42, 'yayuksulistyowati174', 'Dra. Yayuk Sulistyowati', NULL, NULL, '$2y$10$pepBw.Hfykh.b/rTJxEEaO3M.h70I1Ja.m/WcweIk.yx2uyAPvabC', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:35', '2023-08-08 08:54:35', NULL, NULL);
INSERT INTO `users` VALUES (43, 'idhadarojatin245', 'Idha Darojatin, S.Pd', NULL, NULL, '$2y$10$tj5Vr7xudgiC4jneSTlpfO1I7AuIij6E6DNqVoi5GPzrPBKWTvc.e', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:35', '2023-08-08 08:54:35', NULL, NULL);
INSERT INTO `users` VALUES (44, 'mochyusuf112', 'Moch Yusuf, SE, GR', NULL, NULL, '$2y$10$fCnBjh/L1UzpvaSHyrYIveQAw.azJTATGE7L1UM.tiM6xf/YFFk6K', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:35', '2023-08-08 08:54:35', NULL, NULL);
INSERT INTO `users` VALUES (45, 'nurrakhmi497', 'Nur Rakhmi F, S. Pd', NULL, NULL, '$2y$10$mx1kQvk0fp3hhIGmWTgG2uXn1B56DFjwEPcnQ7up/l4rVlYZMOc92', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:35', '2023-08-08 08:54:35', NULL, NULL);
INSERT INTO `users` VALUES (46, 'yettiagus1238', 'Yetti Agus K, S. Pd', NULL, NULL, '$2y$10$6obdJ6Q7XLXTG.Lz4Spyiez4tQdEkHV3f80vj0YpYkAfCJ.RCYDg2', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:36', '2023-08-08 08:54:36', NULL, NULL);
INSERT INTO `users` VALUES (47, 'lina412', 'Lina, S. Pd', NULL, NULL, '$2y$10$fo7WjbV1JC1aEp6JT/7./OyuU3sbFagJFT9MEFa.t6Vef.lc3E/Qe', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:36', '2023-08-08 08:54:36', NULL, NULL);
INSERT INTO `users` VALUES (48, 'annikdwisudarwatik25', 'Annik Dwi Sudarwatik, S.Pd', NULL, NULL, '$2y$10$CGq.X35zWUJ6j2yh/3RppOLx1CZmqXzPGgbyXuwj4E4gMymwHO7Le', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:36', '2023-08-08 08:54:36', NULL, NULL);
INSERT INTO `users` VALUES (49, 'cherienugraheni2124', 'Cherie Nugraheni, S. Pd', NULL, NULL, '$2y$10$77paGYrl8/afsA9JM0Z33eHSuvK.ChYcN/HAQJf4n2OrOiBpW0hzS', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:36', '2023-08-08 08:54:36', NULL, NULL);
INSERT INTO `users` VALUES (50, 'srihastuti2084', 'Sri Hastuti, SE', NULL, NULL, '$2y$10$KB8NBjQAKhLiewXJlq86EOoxq6tBL4xb.dTml7F27YYwoDV8F918u', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:36', '2023-08-08 08:54:36', NULL, NULL);
INSERT INTO `users` VALUES (51, 'aningretno3508', 'Aning Retno S, SE, MM', NULL, NULL, '$2y$10$BOyfxicZPOyba6lKnjg5qOkxUa/2K2Pfirr/fWHzA53SGRUd2oeSu', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:36', '2023-08-08 08:54:36', NULL, NULL);
INSERT INTO `users` VALUES (52, 'nanangdanirasidi009', 'Nanang Dani Rasidi, M. Pd', NULL, NULL, '$2y$10$wY/EER/zbmkT61kMobaBCuV4fV3HfCB0QHrFex4tFX5Jhhrvtjba2', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:36', '2023-08-08 08:54:36', NULL, NULL);
INSERT INTO `users` VALUES (53, 'dwiandri456', 'Dwi Andri H, S. Pd', NULL, NULL, '$2y$10$PicJ5Edhm6Nl0.mW0J87nucXSrc1mKERM148qrZn3dT6ttkG5nx3q', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:37', '2023-08-08 08:54:37', NULL, NULL);
INSERT INTO `users` VALUES (54, 'ofridaningsih998', 'Ofridaningsih, S. Ab', NULL, NULL, '$2y$10$IbCe5PSdHUVQFBU8x7hd2eGAFK.TKOeyfJZcSLCyWQkuhBiClY5hG', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:37', '2023-08-08 08:54:37', NULL, NULL);
INSERT INTO `users` VALUES (55, 'siticholifah14', 'Siti Cholifah,S.Pd', NULL, NULL, '$2y$10$Q5bwTmA8/oQOo.0iXauh9.0vhOo3WUPmNoOw.2i27LQRZ7F7O6NXi', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:37', '2023-08-08 08:54:37', NULL, NULL);
INSERT INTO `users` VALUES (56, 'zakiyahilmidarajah009', 'Zakiyah Ilmi Darajah, S.Pd', NULL, NULL, '$2y$10$La5KbJwwXRj4aNL5jbt9HuCbAZJ9zM7KHyN0txBjkAut784NltSWy', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:37', '2023-08-08 08:54:37', NULL, NULL);
INSERT INTO `users` VALUES (57, 'sifaulmunawaroh456', 'Sifaul Munawaroh, S.Pd', NULL, NULL, '$2y$10$dAwdH26S2AYjQVRGcACIveIMbzj5K/a/7HjNdloK9yFrl/j6CJn66', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:37', '2023-08-08 08:54:37', NULL, NULL);
INSERT INTO `users` VALUES (58, 'abdirahman112', 'Abdi Rahman A, S.Pd', NULL, NULL, '$2y$10$5pntvuUEjMDQ9qzV83ghmOHz1rMdX.9lK.Lj450xjmdLF4N.YbxXS', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:37', '2023-08-08 08:54:37', NULL, NULL);
INSERT INTO `users` VALUES (59, 'rufiindrianti887', 'Rufi Indrianti, S.Pd', NULL, NULL, '$2y$10$NWVSmR7CVqLchr7rpaLOVOaTg2urbNPP4XUGeENp7bGBqZE5t.Jni', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:37', '2023-08-08 08:54:37', NULL, NULL);
INSERT INTO `users` VALUES (60, 'indahnurhayati001', 'Indah Nurhayati, S.Pd', NULL, NULL, '$2y$10$m3071rIG744N/w1KZ.I9KOVTcZCjQJOayq3cTM0gqwJp1EbhZE6xS', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:37', '2023-08-08 08:54:37', NULL, NULL);
INSERT INTO `users` VALUES (61, 'nurulfurqoniah126', 'Nurul Furqoniah, M.Pd', NULL, NULL, '$2y$10$T3q5em1IWseWG92CHmVwxu8aWvZ7P/6sFh9bYNsG7eyw9Kkn2gxsq', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:38', '2023-08-08 08:54:38', NULL, NULL);
INSERT INTO `users` VALUES (62, 'ennyyuraida134', 'Enny Yuraida, S.Pd', NULL, NULL, '$2y$10$vHmU7hPbnFMClGyw0bJnmuJcTVC/ZNFJsH6dwGBTU39FZL.ZKjQdm', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:38', '2023-08-08 08:54:38', NULL, NULL);
INSERT INTO `users` VALUES (63, 'nettysriwiyanti298', 'Netty Sriwiyanti', NULL, NULL, '$2y$10$yxEkmdTjfMgJM/7oMaPwjuOm0G7sEbk..bYrFYiVdEFRcD6Uc2wKi', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:38', '2023-08-08 08:54:38', NULL, NULL);
INSERT INTO `users` VALUES (64, 'lindaratnasari098', 'Linda Ratnasari, S.Pd', NULL, NULL, '$2y$10$NVOWFqatGnfHl0SYUyWK6.rQl7ioEPAItp6L29UCA2Bg5VKGp2fXy', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:38', '2023-08-08 08:54:38', NULL, NULL);
INSERT INTO `users` VALUES (65, 'ekowahyudianto092', 'Eko Wahyudianto, S.Pd', NULL, NULL, '$2y$10$JDjrqvsT0uIlaRZDEjAF9.DJkBjefU6BHuOP/0t78ld4ZTys7zWPW', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:38', '2023-08-08 08:54:38', NULL, NULL);
INSERT INTO `users` VALUES (66, 'diankurniawan123', 'Dian Kurniawan, S.Sn', NULL, NULL, '$2y$10$E2w6W/tSBbXEmiW66aNc5ulZcrAQb2IL3mK8LOOrKdtRrcKhfvd7W', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:38', '2023-08-08 08:54:38', NULL, NULL);
INSERT INTO `users` VALUES (67, 'nanangslamet245', 'Nanang Slamet , S. Sn', NULL, NULL, '$2y$10$V39qy8HTDd8UHZA/Wade.ealPhTTeGQNoyMb5JKsLY.9fGiqkhK06', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:38', '2023-08-08 08:54:38', NULL, NULL);
INSERT INTO `users` VALUES (68, 'hendrosetyono990', 'Hendro Setyono, S.Kom', NULL, NULL, '$2y$10$kSdwM3/E2U9hZ9v0aHH8DObITd0lrFslTaFwoUcFLNHY6qVMvIVUO', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:38', '2023-08-08 08:54:38', NULL, NULL);
INSERT INTO `users` VALUES (69, 'linggaadhipraja245', 'Lingga Adhi Praja, ST. MM', NULL, NULL, '$2y$10$3e86IjXfXSJLENw/oSuqF.frYgY5gQiNW8AS9r80rLd.mjpy39N0.', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:39', '2023-08-08 08:54:39', NULL, NULL);
INSERT INTO `users` VALUES (70, 'ricoarnanda998', 'Rico Arnanda, S.Ds', NULL, NULL, '$2y$10$x4jljqN2vozvXE0ZnyxnJ.9gEK3hDFuZzN3pKTUeDQQWZItxzVS8C', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:39', '2023-08-08 08:54:39', NULL, NULL);
INSERT INTO `users` VALUES (71, 'nutriyo445', 'Nutriyo, S.ST', NULL, NULL, '$2y$10$DbXiorXUOwfyfnEX/uzM7e/hYX3.1lm.lFhnBVquvWozyfXHYIHzO', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:39', '2023-08-08 08:54:39', NULL, NULL);
INSERT INTO `users` VALUES (72, 'hendrakurniawan991', 'Hendra Kurniawan, S.Pd', NULL, NULL, '$2y$10$VK14B6YHTzezoM8eInIULO8Hd1I1l8ueTM0zsh4cTwWVzR.Iy8NeS', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:39', '2023-08-08 08:54:39', NULL, NULL);
INSERT INTO `users` VALUES (73, 'iqbalroni122', 'Muchammad Iqbal Roni\nSaputra', NULL, NULL, '$2y$10$LTHlpKPD3hv6yzN4gjTieuQlEXTk4lu9.xFT2j4cZSBlSCGt8Kij2', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:39', '2023-08-08 08:54:39', NULL, NULL);
INSERT INTO `users` VALUES (74, 'abdurrosid991', 'Abdur Rosid, M.Pd', NULL, NULL, '$2y$10$9er/d/dPp3Ya.BoIcojLFOY/EthNiWJwrZBk8wophxDD5kHBdEaSm', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:39', '2023-08-08 08:54:39', NULL, NULL);
INSERT INTO `users` VALUES (75, 'juniawansetianto992', 'Juniawan Setianto, S.Si', NULL, NULL, '$2y$10$41nKXu6sKqY2EjWdtTRyv.g5bTy8uj2VzorSTtIPdT6vwO1mJJkFK', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:39', '2023-08-08 08:54:39', NULL, NULL);
INSERT INTO `users` VALUES (76, 'meilidaargitasari990', 'Meilida Argitasari, S.Pd', NULL, NULL, '$2y$10$PaASLSFHI8Js35Ruese3DOpj8fxUscCK88dqUUlky0rjdqxEvGR/6', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:40', '2023-08-08 08:54:40', NULL, NULL);
INSERT INTO `users` VALUES (77, 'mursid112', 'Mursid, S.Kom', NULL, NULL, '$2y$10$WDuYyK2TuzGKsT/1jtsHt.Zr4zWplXfO8MWqlU25YgtuscAD1Qs4a', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:40', '2023-08-08 08:54:40', NULL, NULL);
INSERT INTO `users` VALUES (78, 'sitimudrikatulumayrah11', 'Siti Mudtrikatul Umayrah, S.Pd', NULL, NULL, '$2y$10$m0SrDqxOCeWq5IHwDh.5EO8hcunZfhpb1jNG7XjX1i2aH.C9lR7tO', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:40', '2023-08-08 08:54:40', NULL, NULL);
INSERT INTO `users` VALUES (79, 'rizqihendrian88', 'M. Rizqi Hendrian P, S.Kom', NULL, NULL, '$2y$10$5lQLRZzuUHt4wei2Fp8Ab.acNwr9gXSDGeX85WrgZMTWDFlTQ2hM2', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:40', '2023-08-08 08:54:40', NULL, NULL);
INSERT INTO `users` VALUES (80, 'suciyuniati99', 'Suci Yuniati, S. Sos', NULL, NULL, '$2y$10$NEOHTeOQ9hvoBY1FoYs40ubfHKDZSw7nhneNAKqouZECxJRV8gA9m', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:40', '2023-08-08 08:54:40', NULL, NULL);
INSERT INTO `users` VALUES (81, 'ariffirmansyah90', 'Arif Firmansyah, ST, S. Sn', NULL, NULL, '$2y$10$XavGdP3wVHRaFcOJeD04repI5/4eItX/ni6ou1QvND7HjY5PAQo5C', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:40', '2023-08-08 08:54:40', NULL, NULL);
INSERT INTO `users` VALUES (82, 'pepiwicaksono88', 'Pepi Wicaksono, S.Sos', NULL, NULL, '$2y$10$IQMbOThtfo4W546fqYUIhuu9J4bHaxVzqfrUfty9aiekO/2N8t88q', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:40', '2023-08-08 08:54:40', NULL, NULL);
INSERT INTO `users` VALUES (83, 'saleh1456', 'Muhammad Saleh, S.Sn', NULL, NULL, '$2y$10$jAJ0HptI.ZJZ9LRsL2cgH.4/4YoAUmkc1OzJA.xGDmOQ/VJQooAV2', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:41', '2023-08-08 08:54:41', NULL, NULL);
INSERT INTO `users` VALUES (84, 'sitihasanahbolkiah889', 'Siti Hasanah Bolkiah, S.Pd', NULL, NULL, '$2y$10$IinraGMIiqy0rkKqYgF2mOgTm0qpiYy32VEGvsE26VK6bJSMoSF4a', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:41', '2023-08-08 08:54:41', NULL, NULL);
INSERT INTO `users` VALUES (85, 'indhirohfitriandini992', 'Indhiroh Fitriandini, S.Pd', NULL, NULL, '$2y$10$PSjKcEdkpRRaL3D/3Fb21ONVyDqJGdgbVn7FVyS7knD.Ri52wOTuO', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:41', '2023-08-08 08:54:41', NULL, NULL);
INSERT INTO `users` VALUES (86, 'bambangeko994', 'Bambang Eko Witjaksono, S.Pd', NULL, NULL, '$2y$10$zjCmrI/5PUyFZos7/6GaReB1/BDNBraUz9ldn8cbdyEq27A3.SJAe', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:41', '2023-08-08 08:54:41', NULL, NULL);
INSERT INTO `users` VALUES (87, 'leysagiatrikirana88', 'Leysa Giatri Kirana, S.Psi', NULL, NULL, '$2y$10$anT.sHv3XgyPFvkuPs.DouPlYpearabaqLnpvYdS/UhgPVF/n6rci', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:41', '2023-08-08 08:54:41', NULL, NULL);
INSERT INTO `users` VALUES (88, 'vetywulandari575', 'Vety Wulandari, SPd', NULL, NULL, '$2y$10$KxkP9302VZleHDHCXADj7ejDEJgBL90O.BVwbmnnRnlbdeiHN1iHO', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:41', '2023-08-08 08:54:41', NULL, NULL);
INSERT INTO `users` VALUES (89, 'dwiayuliandari889', 'Dwi Ayuliandari, S.Pd', NULL, NULL, '$2y$10$ZvP5p60m50MUjrNS3uMiPeH7acFUN.vXcHnS967uI.C/qZEsvXSPq', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:41', '2023-08-08 08:54:41', NULL, NULL);
INSERT INTO `users` VALUES (90, 'arifdwifebrianto112', 'Arief Dwi Febrianto, S.Pd', NULL, NULL, '$2y$10$HAvevkncglZVnJA5HrKM8eRuV09YDzTt7c5N4JD/Ly6HcHzLeyip6', 2, 1, NULL, NULL, NULL, NULL, '2023-08-08 08:54:41', '2023-08-08 08:54:41', NULL, NULL);

-- ----------------------------
-- Table structure for wali_kelas
-- ----------------------------
DROP TABLE IF EXISTS `wali_kelas`;
CREATE TABLE `wali_kelas`  (
  `wali_kelas_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tingkatan` int NOT NULL,
  `jurusan_id` bigint UNSIGNED NOT NULL,
  `kelas_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `tahun_ajaran_id` bigint UNSIGNED NOT NULL,
  `status` int NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `creted_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`wali_kelas_id`) USING BTREE,
  INDEX `wali_kelas_jurusan_id_foreign`(`jurusan_id`) USING BTREE,
  INDEX `wali_kelas_kelas_id_foreign`(`kelas_id`) USING BTREE,
  INDEX `wali_kelas_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `wali_kelas_tahun_ajaran_id_foreign`(`tahun_ajaran_id`) USING BTREE,
  CONSTRAINT `wali_kelas_jurusan_id_foreign` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusan` (`jurusan_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wali_kelas_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`kelas_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wali_kelas_tahun_ajaran_id_foreign` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajaran` (`tahun_ajaran_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wali_kelas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wali_kelas
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
