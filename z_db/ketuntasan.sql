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

 Date: 10/08/2023 23:27:31
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jurusan
-- ----------------------------
INSERT INTO `jurusan` VALUES (1, 'Manajemen Perkantoran', 1, '2023-08-10 21:00:07', '2023-08-10 21:00:07', NULL, NULL);
INSERT INTO `jurusan` VALUES (2, 'Akuntansi', 1, '2023-08-10 21:00:07', '2023-08-10 21:00:07', NULL, NULL);
INSERT INTO `jurusan` VALUES (3, 'Layanan Perbankan', 1, '2023-08-10 21:00:07', '2023-08-10 21:00:07', NULL, NULL);
INSERT INTO `jurusan` VALUES (4, 'Bisnis Digital', 1, '2023-08-10 21:00:07', '2023-08-10 21:00:07', NULL, NULL);
INSERT INTO `jurusan` VALUES (5, 'Teknik Komputer dan Jaringan', 1, '2023-08-10 21:00:07', '2023-08-10 21:00:07', NULL, NULL);
INSERT INTO `jurusan` VALUES (6, 'Desain Komunikasi Visual', 1, '2023-08-10 21:00:07', '2023-08-10 21:00:07', NULL, NULL);
INSERT INTO `jurusan` VALUES (7, 'Rekayasa Perangkat Lunak', 1, '2023-08-10 21:00:07', '2023-08-10 21:00:07', NULL, NULL);
INSERT INTO `jurusan` VALUES (8, 'Produksi dan Siaran Program Televisi', 1, '2023-08-10 21:00:07', '2023-08-10 21:00:07', NULL, NULL);
INSERT INTO `jurusan` VALUES (9, 'Otomatisasi dan Tata Kelola Perkantoran', 1, '2023-08-10 21:00:07', '2023-08-10 21:00:07', NULL, NULL);
INSERT INTO `jurusan` VALUES (10, 'Akuntansi dan Keuangan Lembaga', 1, '2023-08-10 21:00:07', '2023-08-10 21:00:07', NULL, NULL);
INSERT INTO `jurusan` VALUES (11, 'Perbankan dan Keuangan Mikro', 1, '2023-08-10 21:00:07', '2023-08-10 21:00:07', NULL, NULL);
INSERT INTO `jurusan` VALUES (12, 'Bisnis Daring dan Pemasaran', 1, '2023-08-10 21:00:07', '2023-08-10 21:00:07', NULL, NULL);
INSERT INTO `jurusan` VALUES (13, 'Multimedia', 1, '2023-08-10 21:00:07', '2023-08-10 21:00:07', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kelas
-- ----------------------------
INSERT INTO `kelas` VALUES (1, 1, 'MP 1', 1, '2023-08-10 21:00:49', '2023-08-10 21:00:49', NULL, NULL);
INSERT INTO `kelas` VALUES (2, 1, 'MP 2', 1, '2023-08-10 21:00:57', '2023-08-10 21:00:57', NULL, NULL);
INSERT INTO `kelas` VALUES (3, 2, 'AK 1', 1, '2023-08-10 21:01:06', '2023-08-10 21:01:06', NULL, NULL);
INSERT INTO `kelas` VALUES (4, 2, 'AK 2', 1, '2023-08-10 21:01:15', '2023-08-10 21:01:15', NULL, NULL);
INSERT INTO `kelas` VALUES (5, 3, 'LP 1', 1, '2023-08-10 21:01:32', '2023-08-10 21:01:32', NULL, NULL);
INSERT INTO `kelas` VALUES (6, 4, 'BD 1', 1, '2023-08-10 21:02:31', '2023-08-10 21:02:31', NULL, NULL);
INSERT INTO `kelas` VALUES (7, 4, 'BD 2', 1, '2023-08-10 21:02:38', '2023-08-10 21:02:38', NULL, NULL);
INSERT INTO `kelas` VALUES (8, 5, 'TKJ 1', 1, '2023-08-10 21:02:49', '2023-08-10 21:02:49', NULL, NULL);
INSERT INTO `kelas` VALUES (9, 5, 'TKJ 2', 1, '2023-08-10 21:02:59', '2023-08-10 21:02:59', NULL, NULL);
INSERT INTO `kelas` VALUES (10, 6, 'DKV 1', 1, '2023-08-10 21:03:10', '2023-08-10 21:03:10', NULL, NULL);
INSERT INTO `kelas` VALUES (11, 6, 'DKV 2', 1, '2023-08-10 21:03:18', '2023-08-10 21:03:18', NULL, NULL);
INSERT INTO `kelas` VALUES (12, 7, 'RPL 1', 1, '2023-08-10 21:03:38', '2023-08-10 21:03:38', NULL, NULL);
INSERT INTO `kelas` VALUES (13, 8, 'PSPTV 1', 1, '2023-08-10 21:03:58', '2023-08-10 21:03:58', NULL, NULL);
INSERT INTO `kelas` VALUES (14, 9, 'OTKP 1', 1, '2023-08-10 21:04:49', '2023-08-10 21:04:49', NULL, NULL);
INSERT INTO `kelas` VALUES (15, 9, 'OTKP 2', 1, '2023-08-10 21:04:58', '2023-08-10 21:04:58', NULL, NULL);
INSERT INTO `kelas` VALUES (16, 10, 'AKL 1', 1, '2023-08-10 21:05:08', '2023-08-10 21:05:08', NULL, NULL);
INSERT INTO `kelas` VALUES (17, 10, 'AKL 2', 1, '2023-08-10 21:05:17', '2023-08-10 21:05:17', NULL, NULL);
INSERT INTO `kelas` VALUES (18, 11, 'PKM 1', 1, '2023-08-10 21:05:31', '2023-08-10 21:05:31', NULL, NULL);
INSERT INTO `kelas` VALUES (19, 11, 'PKM 2', 1, '2023-08-10 21:05:42', '2023-08-10 21:05:42', NULL, NULL);
INSERT INTO `kelas` VALUES (20, 12, 'BDP 1', 1, '2023-08-10 21:05:53', '2023-08-10 21:05:53', NULL, NULL);
INSERT INTO `kelas` VALUES (21, 12, 'BDP 2', 1, '2023-08-10 21:06:01', '2023-08-10 21:06:01', NULL, NULL);
INSERT INTO `kelas` VALUES (22, 13, 'MM 1', 1, '2023-08-10 21:06:14', '2023-08-10 21:06:14', NULL, NULL);
INSERT INTO `kelas` VALUES (23, 13, 'MM 2', 1, '2023-08-10 21:06:23', '2023-08-10 21:06:23', NULL, NULL);
INSERT INTO `kelas` VALUES (24, 7, 'RPL 2', 1, '2023-08-10 21:06:33', '2023-08-10 21:06:33', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1322 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `users` VALUES (91, 'adindadwifebywidarto32304', 'ADINDA DWI FEBY WIDARTO', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (92, 'ahmadridhosaputra399710', 'AHMAD RIDHO SAPUTRA', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (93, 'aldakristin55727', 'ALDA KRISTIN', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (94, 'anisaagustin55943', 'ANISA AGUSTIN', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (95, 'azizatunnabila100676', 'AZIZATUN NABILA', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (96, 'chelsyaliciathimoty51721', 'CHELSY ALICIA THIMOTY', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (97, 'dewiayuveronica24196', 'DEWI AYU VERONICA', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (98, 'dwiraniandini936610', 'DWI RANI ANDINI', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (99, 'gunawanferisusanto62325', 'GUNAWAN FERI SUSANTO', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (100, 'hairiaummah755110', 'HAIRIA UMMAH', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (101, 'huzaimahalifiaamrah11452', 'HUZAIMAH ALIFIA AMRAH', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (102, 'jesicaselvianadewi396810', 'JESICA SELVIANA DEWI', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (103, 'kharismaputrianggraini973810', 'KHARISMA PUTRI ANGGRAINI', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (104, 'mayadwiarisanty13424', 'MAYA DWI ARISANTY', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (105, 'mohammadrafelianfirdaus50548', 'MOHAMMAD RAFELIAN FIRDAUS', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (106, 'muhammadardiansyahpratama51988', 'MUHAMMAD ARDIANSYAH PRATAMA', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (107, 'muhammadifankhairulumam96976', 'MUHAMMAD IFAN KHAIRUL UMAM', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (108, 'nadiaayupujiansyah89804', 'NADIA AYU PUJIANSYAH', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (109, 'nadyacantikadamayanti562810', 'NADYA CANTIKA DAMA YANTI', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (110, 'najwafibriajannatiladni20332', 'NAJWA FIBRIA JANNATIL ADNI', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (111, 'nouraputriarilam72688', 'NOURA PUTRI ARILAM', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (112, 'putriyofisalwaawlia76892', 'PUTRI YOFI SALWA AWLIA', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (113, 'rafisatussyarri100860', 'RAFISATUS SYARRI', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (114, 'raysaanindya96103', 'RAYSA ANINDYA', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (115, 'revatulhasanah71509', 'REVATUL HASANAH', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (116, 'risqisilviana65803', 'RISQI SILVIANA', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (117, 'saadah100586', 'SAADAH', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (118, 'sahwasaqatittarra66203', 'SAHWA SAQA TITTARRA', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (119, 'salsabilaamenatalaura93504', 'SALSABILA AME NATALAURA', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (120, 'sitiratnamaisaroh28767', 'SITI RATNA MAISAROH', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (121, 'uunwulandari34260', 'UUN WULANDARI', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (122, 'yasminauraputri1007610', 'YASMIN AURA PUTRI', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (123, 'yumnailmiahfebriyanti55626', 'YUMNA ILMIAH FEBRIYANTI', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (124, 'zahratullaeli49698', 'ZAHRATUL LAELI', NULL, NULL, '', 3, 1, 1, 2, 3, NULL, '2023-08-10 22:59:43', '2023-08-10 22:59:43', NULL, NULL);
INSERT INTO `users` VALUES (125, 'aisyahdivanadya89434', 'AISYAH DIVA NADYA', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (126, 'alikaattabila18277', 'ALIKA ATTABILA', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (127, 'auliaputriangraini56790', 'AULIA PUTRI ANGRAINI', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (128, 'berlianafadhiladwiwindarti37373', 'BERLIANA FADHILA DWI WINDARTI', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (129, 'delvinurulfransiska974510', 'DELVI NURUL FRANSISKA', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (130, 'dwiputriramadhani87254', 'DWI PUTRI RAMADHANI', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (131, 'fadilatulnafiah38371', 'FADILATUL NAFIAH', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (132, 'fajarwahyunabilalsyah24552', 'FAJAR WAHYU NABILALSYAH', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (133, 'halimatuszuhriya79946', 'HALIMATUS ZUHRIYA', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (134, 'intanfauziyah498910', 'INTAN FAUZIYAH', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (135, 'jhenissalsabilaramadany14206', 'JHENIS SALSABILA RAMADANY', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (136, 'maulidaturrizqohizzaturrahmah779210', 'MAULIDATUR RIZQOH IZZATURRAHMAH', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (137, 'mochammadthesarfebrian16912', 'MOCHAMMAD THESAR FEBRIAN', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (138, 'muhammadalifahmi81303', 'MUHAMMAD ALI FAHMI', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (139, 'muhammadfarhanhidayatullah98256', 'MUHAMMAD FARHAN HIDAYATULLAH', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (140, 'muhammadridhoillah426510', 'MUHAMMAD RIDHO ILLAH', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (141, 'nabiladwinofiamaharani993110', 'NABILA DWI NOFIA MAHARANI', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (142, 'nadinenoktawijaya22300', 'NADINE NOKTA WIJAYA', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (143, 'nadyakaylakhayrunnisa52631', 'NADYA KAYLA KHAYRUNNISA', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (144, 'naylatulafroh107310', 'NAYLATUL AFROH', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (145, 'nurinnajmafajriah46190', 'NURIN NAJMA FAJRIAH', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (146, 'radyaclarisaoktariasafitri86763', 'RADYA CLARISA OKTARIA SAFITRI', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (147, 'revazahraefendi97510', 'REVA ZAHRA EFENDI', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (148, 'rikizainurrahman97141', 'RIKI ZAINUR RAHMAN', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (149, 'rimaniarputriherdanmi68636', 'RIMANIAR PUTRI HERDANMI', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (150, 'rofidatulhasanah81379', 'ROFIDATUL HASANAH', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (151, 'safinatunnafiah31340', 'SAFINATUN NAFIAH', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (152, 'salsabilaainurrohmah49175', 'SALSABILA AINUR ROHMAH', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (153, 'serlyanandatasya66161', 'SERLY ANANDA TASYA', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (154, 'ustibungaulfiaini10403', 'USTI BUNGA ULFI AINI', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (155, 'viantikaainunsholehah706110', 'VIANTIKA AINUN SHOLEHAH', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (156, 'yulitamegameilani52222', 'YULITA MEGA MEILANI', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (157, 'yusroamilinhikmah64174', 'YUSRO AMILIN HIKMAH', NULL, NULL, '', 3, 1, 1, 2, 4, NULL, '2023-08-10 23:00:51', '2023-08-10 23:00:51', NULL, NULL);
INSERT INTO `users` VALUES (158, 'adeliaagustin53859', 'ADELIA AGUSTIN', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (159, 'ameliaqoriatuljannah86375', 'AMELIA QORIATUL JANNAH', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (160, 'andinirahmawati23316', 'ANDINI RAHMAWATI', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (161, 'andypratama68750', 'ANDY PRATAMA', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (162, 'budisatrio88649', 'BUDI SATRIO', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (163, 'dyaayusulistiorini46425', 'DYA AYU SULISTIORINI', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (164, 'fayadagustianriyadi68515', 'FAYAD AGUSTIAN RIYADI', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (165, 'fitriyunitanurfatimah1004810', 'FITRI YUNITA NURFATIMAH', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (166, 'holifahdindasari32981', 'HOLIFAH DINDA SARI', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (167, 'ihwan64251', 'IHWAN', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (168, 'intansulisyanilutfiyah11677', 'INTAN SULISYANI LUTFIYAH', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (169, 'mfarelpratamaputra32717', 'M FAREL PRATAMA PUTRA', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (170, 'melysaavitasari89166', 'MELYSA AVITA SARI', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (171, 'mochammadrizki70741', 'MOCHAMMAD RIZKI', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (172, 'mohammadfadlan32996', 'MOHAMMAD FADLAN', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (173, 'mohammadihzanbahtiar46585', 'MOHAMMAD IHZAN BAHTIAR', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (174, 'mohammadvigosaputra87244', 'MOHAMMAD VIGO SAPUTRA', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (175, 'muhammadarilprasetyo47825', 'MUHAMMAD ARIL PRASETYO', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (176, 'muhammadfaezal32376', 'MUHAMMAD FAEZAL', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (177, 'nabilatullailyfadilah19829', 'NABILATUL LAILY FADILAH', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (178, 'nafisatuhkamela79747', 'NAFISATUH KAMELA', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (179, 'novitajamilatulmahiroh12842', 'NOVITA JAMILATUL MAHIROH', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (180, 'putraaburizalalgifani57369', 'PUTRA ABU RIZAL ALGIFANI', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (181, 'putrinabilahuwaida301002', 'PUTRI NABILA HUWAIDA', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (182, 'revantriagussugiyanto42158', 'REVAN TRI AGUS SUGIYANTO', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (183, 'rikofathugunawan40764', 'RIKO FATHU GUNAWAN', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (184, 'robyatulameliaramadhani55112', 'ROBYATUL AMELIA RAMADHANI', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (185, 'rofi`ulkhoiri768610', 'ROFI`UL KHOIRI', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (186, 'sarifah42233', 'SARIFAH', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (187, 'setiawati95878', 'SETIAWATI', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (188, 'sittihorriyah57810', 'SITTI HORRIYAH', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (189, 'yufiatunhasanah37366', 'YUFIATUN HASANAH', NULL, NULL, '', 3, 1, 1, 4, 6, NULL, '2023-08-10 23:01:02', '2023-08-10 23:01:02', NULL, NULL);
INSERT INTO `users` VALUES (190, 'adindaayuistiqomah62568', 'ADINDA AYU ISTIQOMAH', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (191, 'anandamustikasari531510', 'ANANDA MUSTIKA SARI', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (192, 'bagasseptiawanramadhani1003510', 'BAGAS SEPTIAWAN RAMADHANI', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (193, 'chelseabungalestari49112', 'CHELSEA BUNGA LESTARI', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (194, 'dioardiansyah61524', 'DIO ARDIANSYAH', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (195, 'fitamitaagustin93749', 'FITA MITA AGUSTIN', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (196, 'friskaoktavia22228', 'FRISKA OKTAVIA', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (197, 'hairulumam89617', 'HAIRUL UMAM', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (198, 'intansulistiawati32417', 'INTAN SULISTIAWATI', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (199, 'ismailrahmadani32783', 'ISMAIL RAHMADANI', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (200, 'keyzanurmalindaputri77477', 'KEYZA NUR MALINDA PUTRI', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (201, 'miasalafiah86892', 'MIA SALAFIAH', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (202, 'mochammaddwiardiansyah26394', 'MOCHAMMAD DWI ARDIANSYAH', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (203, 'mochammadroyhanthoriq63955', 'MOCHAMMAD ROYHAN THORIQ', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (204, 'mohammadfarielardiansyah84119', 'MOHAMMAD FARIEL ARDIANSYAH', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (205, 'mohammadrezaiswiyanto74473', 'MOHAMMAD REZA ISWIYANTO', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (206, 'muhammadardiansyah69157', 'MUHAMMAD ARDIANSYAH', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (207, 'muhammaddhaniesaidilmuzammil60533', 'MUHAMMAD DHANIES AIDIL MUZAMMIL', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (208, 'muhammadrian19307', 'MUHAMMAD RIAN', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (209, 'nafindasyalwaazzahra31765', 'NAFINDA SYALWA AZZAHRA', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (210, 'novendakamiliawulandari438810', 'NOVENDA KAMILIA WULANDARI', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (211, 'nurifatinbariroh57468', 'NURIFATIN BARIROH', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (212, 'radityawahyunugraha14358', 'RADITYA WAHYU NUGRAHA', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (213, 'raodatululum23842', 'RAODATUL ULUM', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (214, 'ridhogunawan31799', 'RIDHO GUNAWAN', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (215, 'robbyirhamfanani71740', 'ROBBY IRHAM FANANI', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (216, 'safitriniaramadani956410', 'SAFITRI NIA RAMADANI', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (217, 'septiaayuanggraeni65564', 'SEPTIA AYU ANGGRAENI', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (218, 'shindymeilinda23401', 'SHINDY MEILINDA', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (219, 'wildafirdaussyarifah44575', 'WILDA FIRDAUS SYARIFAH', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (220, 'zainatulkiftiyah47923', 'ZAINATUL KIFTIYAH', NULL, NULL, '', 3, 1, 1, 4, 7, NULL, '2023-08-10 23:01:13', '2023-08-10 23:01:13', NULL, NULL);
INSERT INTO `users` VALUES (221, 'afidahhusniah36162', 'AFIDAH HUSNIAH', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (222, 'ameliaputridwiregita42698', 'AMELIA PUTRI DWI REGITA', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (223, 'ariefpratama22944', 'ARIEF PRATAMA', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (224, 'aryagunaphalosa16134', 'ARYAGUNA PHALOSA', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (225, 'cacanurdiansyahhendrasaputra98929', 'CACA NURDIANSYAH HENDRA SAPUTRA', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (226, 'davinadityaputrapratama55449', 'DAVIN ADITYA PUTRA PRATAMA', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (227, 'deftiraayumaharani314410', 'DEFTIRA AYU MAHARANI', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (228, 'devinazadhinejatianggraeni79132', 'DEVINA ZADHINE JATI ANGGRAENI', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (229, 'devitawindhinovarini85295', 'DEVITA WINDHI NOVARINI', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (230, 'dhionwibowo39421', 'DHION WIBOWO', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (231, 'divadwiyuliachristanti28309', 'DIVA DWI YULIA CHRISTANTI', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (232, 'dwiraniarta16369', 'DWI RANI ARTA', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (233, 'dylanirfansyah64553', 'DYLAN IRFANSYAH', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (234, 'faisalnurriefdarahmat158510', 'FAISAL NUR RIEFDA RAHMAT', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (235, 'firkiramadhan16958', 'FIRKI RAMADHAN', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (236, 'hengkyfirmansyah45669', 'HENGKY FIRMANSYAH', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (237, 'hidehitoshimojo18845', 'HIDEHITO SHIMOJO', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (238, 'hosen76963', 'HOSEN', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (239, 'imeldaalmareta16190', 'IMELDA ALMARETA', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (240, 'ja\'farashshadiq30371', 'JA\'FAR ASH SHADIQ', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (241, 'mohamadtegardwiputra58424', 'MOHAMAD TEGAR DWI PUTRA', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (242, 'mohammadrengkuhalam79369', 'MOHAMMAD RENGKUH ALAM', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (243, 'muhammaddanarhermawan86180', 'MUHAMMAD DANAR HERMAWAN', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (244, 'muhammadgalihnurilholid47885', 'MUHAMMAD GALIH NURIL HOLID', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (245, 'muhammadgianudzrisusanto804810', 'MUHAMMAD GIAN UDZRI SUSANTO', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (246, 'muhammadkafkabimarodiallah39220', 'MUHAMMAD KAFKA BIMA RODIALLAH', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (247, 'muhammadteguhmaulana84220', 'MUHAMMAD TEGUH MAULANA', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (248, 'nancypramestynadyaputri52893', 'NANCY PRAMESTY NADYA PUTRI', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (249, 'naylajauzafikriyah100559', 'NAYLA JAUZA FIKRIYAH', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (250, 'noviatulhasanah39428', 'NOVIATUL HASANAH', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (251, 'rafibahtiarhidayat22319', 'RAFI BAHTIAR HIDAYAT', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (252, 'sesymaulida55312', 'SESY MAULIDA', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (253, 'shafaaneirasalsabilla32570', 'SHAFA ANEIRA SALSABILLA', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (254, 'siratnurachmadbinero58879', 'SIRATNUR ACHMAD BINERO', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (255, 'wahyuramadhaniputra14138', 'WAHYU RAMADHANI PUTRA', NULL, NULL, '', 3, 1, 1, 6, 10, NULL, '2023-08-10 23:01:27', '2023-08-10 23:01:27', NULL, NULL);
INSERT INTO `users` VALUES (256, 'afinadimaulana26392', 'AFIN ADI MAULANA', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (257, 'ailsasaabirahshahnazasad55617', 'AILSA SAABIRAH SHAHNAZ ASAD', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (258, 'alfiahzahratussitah14608', 'ALFIAH ZAHRATUSSITAH', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (259, 'dendiwahyudi71978', 'DENDI WAHYUDI', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (260, 'dhanifirmansyah100493', 'DHANI FIRMANSYAH', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (261, 'dikisinarjayasaputra77650', 'DIKI SINARJAYA SAPUTRA', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (262, 'falihibatullah98219', 'FALIH IBATULLAH', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (263, 'haidar32913', 'HAIDAR', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (264, 'husenfadlullah84531', 'HUSEN FADLULLAH', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (265, 'jevonislamyraysendryan18968', 'JEVON ISLAMY RAYSENDRYAN', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (266, 'lindavitriani194610', 'LINDA VITRIANI', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (267, 'mfarelalfarisi76225', 'M FAREL AL FARISI', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (268, 'mhidayatullah69819', 'M HIDAYATULLAH', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (269, 'mahesaadanisatriapribadi47875', 'MAHESA ADANI SATRIA PRIBADI', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (270, 'muhamadriskiramadhoni87691', 'MUHAMAD RISKI RAMADHONI', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (271, 'muhammadfadilurrohman66815', 'MUHAMMAD FADILURROHMAN', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (272, 'muhammadfaldiirwansyah93703', 'MUHAMMAD FALDI IRWANSYAH', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (273, 'muhammadfarielaprilyanto82552', 'MUHAMMAD FARIEL APRILYANTO', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (274, 'muhammadgilangramadani514010', 'MUHAMMAD GILANG RAMADANI', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (275, 'muhammadtegarprayogi19629', 'MUHAMMAD TEGAR PRAYOGI', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (276, 'ninsiatunnurfadilah518710', 'NINSIATUN NUR FADILAH', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (277, 'novitasari80242', 'NOVITASARI', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (278, 'nuvalputrapratama69948', 'NUVAL PUTRA PRATAMA', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (279, 'putrimaylenikhoirunnisa44754', 'PUTRI MAYLENI KHOIRUNNISA', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (280, 'revaregyaraditarasyid114610', 'REVA REGYA RADITA RASYID', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (281, 'rivalinacintyadewi86593', 'RIVALINA CINTYA DEWI', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (282, 'rossaapriliancandra63279', 'ROSSA APRILIAN CANDRA', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (283, 'sabilatulislamiyah84268', 'SABILATUL ISLAMIYAH', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (284, 'siskawulandari76753', 'SISKA WULANDARI', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (285, 'sitiholimatussakdiyah65801', 'SITI HOLIMATUS SAKDIYAH', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (286, 'tegarjayaramadhan24795', 'TEGAR JAYA RAMADHAN', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (287, 'wildanpratamawahyudi67296', 'WILDAN PRATAMA WAHYUDI', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (288, 'yudhadwijuliantaruna66203', 'YUDHA DWI JULIAN TARUNA', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (289, 'zhameerbhazhamkhanali908910', 'ZHAMEER BHAZHAMKHAN ALI', NULL, NULL, '', 3, 1, 1, 6, 11, NULL, '2023-08-10 23:01:38', '2023-08-10 23:01:38', NULL, NULL);
INSERT INTO `users` VALUES (290, 'abeliamarthamulia735310', 'ABELIA MARTHA MULIA', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (291, 'afifahwidyanurzahidah66510', 'AFIFAH WIDYA NUR ZAHIDAH', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (292, 'ahmadgalangramadhan19135', 'AHMAD GALANG RAMADHAN', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (293, 'airinafebrianti98421', 'AIRINA FEBRIANTI', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (294, 'andreanggasetyawan66422', 'ANDRE ANGGA SETYAWAN', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (295, 'andreanprastya62330', 'ANDREAN PRASTYA', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (296, 'anindiaanggunwahyudi86576', 'ANINDIA ANGGUN WAHYUDI', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (297, 'annisazalifaairadinarfathani42584', 'ANNISA ZALIFA AIRA DINAR FATHANI', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (298, 'atikmuslihah44465', 'ATIK MUSLIHAH', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (299, 'destifebrianapurwiningsih61797', 'DESTI FEBRIANA PURWININGSIH', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (300, 'dianliakurniawati20547', 'DIAN LIA KURNIAWATI', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (301, 'dindaayu68676', 'DINDA AYU', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (302, 'dwisafitri25401', 'DWI SAFITRI', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (303, 'dynaanggraeniy80933', 'DYNA ANGGRAENIY', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (304, 'faniyunitaindriyanis63264', 'FANI YUNITA INDRIYANIS', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (305, 'hariroirmawati12809', 'HARIRO IRMAWATI', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (306, 'lalabungaistian589310', 'LALA BUNGA ISTIAN ', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (307, 'muhammadfaidi64892', 'MUHAMMAD FAIDI', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (308, 'naifahmaysaroh98296', 'NAIFAH MAYSAROH', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (309, 'natasyabungaaprilia95299', 'NATASYA BUNGA APRILIA', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (310, 'nikenmaulina54484', 'NIKEN MAULINA', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (311, 'nurquratulnabilaatiqoh48598', 'NUR QURATUL NABILA ATIQOH', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (312, 'renalitaalyanirinaputrimerry49341', 'RENALITA ALYA NIRINA PUTRI MERRY', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (313, 'renianggraeniekasaputri69249', 'RENI ANGGRAENI EKA SAPUTRI', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (314, 'rifanbimawirasatriaji28924', 'RIFAN BIMA WIRA SATRIAJI', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (315, 'salsabilaalifiaputri61294', 'SALSABILA ALIFIA PUTRI', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (316, 'sitiaisyatunnabillah75497', 'SITI AISYATUN NABILLAH', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (317, 'sitirahmatulkamila11850', 'SITI RAHMATUL KAMILA', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (318, 'sitirofiah35923', 'SITI ROFIAH', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (319, 'vavilatulhasanah52854', 'VAVILATUL HASANAH', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (320, 'vitaindahkartika22583', 'VITA INDAH KARTIKA', NULL, NULL, '', 3, 1, 2, 2, 3, NULL, '2023-08-10 23:01:50', '2023-08-10 23:01:50', NULL, NULL);
INSERT INTO `users` VALUES (321, 'adeliaayunaputri23763', 'ADELIA AYUNA PUTRI', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (322, 'adelinaekaapriliandani51731', 'ADELINA EKA APRILIANDANI', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (323, 'ahmadraffimaulana71860', 'AHMAD RAFFI MAULANA', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (324, 'ainunfirdausrahmatilla50904', 'AINUN FIRDAUS RAHMATILLA', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (325, 'anggunpuspitaariyanti94983', 'ANGGUN PUSPITA ARIYANTI', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (326, 'annisanadhira203110', 'ANNISA NADHIRA', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (327, 'ayutasyaniaputri72715', 'AYU TASYANIA PUTRI', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (328, 'darayanidinan46514', 'DARAYANI DINAN', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (329, 'destaadiyuliana85967', 'DESTA ADI YULIANA', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (330, 'dindahilyatulaulia40226', 'DINDA HILYATUL AULIA', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (331, 'dwioliviaainatulnadifah53536', 'DWI OLIVIA AINATUL NADIFAH', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (332, 'ekaseptyaanggraini59584', 'EKA SEPTYA ANGGRAINI', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (333, 'elminurfadilah811710', 'ELMI  NUR FADILAH', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (334, 'firnadialailatulfitriah74833', 'FIRNADIA LAILATUL FITRIAH', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (335, 'halimatussa\'diyah54956', 'HALIMATUS SA\'DIYAH', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (336, 'jenyputriandini319410', 'JENY PUTRI ANDINI', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (337, 'meisitafaizatulubko64221', 'MEISITA FAIZATUL UBKO', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (338, 'mochammadrifalaprilianto82760', 'MOCHAMMAD RIFAL APRILIANTO', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (339, 'nafilaagustin64391', 'NAFILA AGUSTIN', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (340, 'natassyaayupermatasari251010', 'NATASSYA AYU PERMATASARI', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (341, 'novitasari35408', 'NOVITA SARI', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (342, 'putridewirarasati57920', 'PUTRI DEWI RARASATI', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (343, 'rezaandryansyah75389', 'REZA ANDRYAN SYAH', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (344, 'riangriskymaulida40142', 'RIANG RISKY MAULIDA', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (345, 'robiatulhassanah58998', 'ROBIATUL HASSANAH', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (346, 'salsabilavernandaputrie782610', 'SALSABILA VERNANDA PUTRIE', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (347, 'sendipurnomo13135', 'SENDI PURNOMO', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (348, 'serlylinggawati53653', 'SERLY LINGGAWATI', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (349, 'sitiqomariah49456', 'SITI QOMARIAH', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (350, 'sitisa\'diyah38307', 'SITI SA\'DIYAH', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (351, 'srihandayani32374', 'SRI HANDAYANI', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (352, 'zafiradwiaprilia31241', 'ZAFIRA DWI APRILIA', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (353, 'zavatiarinditapriyani45641', 'ZAVATIA RINDITA PRIYANI', NULL, NULL, '', 3, 1, 2, 2, 4, NULL, '2023-08-10 23:02:02', '2023-08-10 23:02:02', NULL, NULL);
INSERT INTO `users` VALUES (354, 'achmadramadhany49438', 'ACHMAD RAMADHANY', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (355, 'afita24378', 'AFITA', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (356, 'amiliareginaputri11584', 'AMILIA REGINA PUTRI', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (357, 'arinauthoybah363110', 'ARINA UTHOYBAH', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (358, 'dewiintannuraini82771', 'DEWI INTAN NURAINI', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (359, 'ekanorpratiwi29907', 'EKA NOR PRATIWI', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (360, 'ellorasyafiransyah82151', 'ELLO RASYA FIRANSYAH', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (361, 'indahdesmitaramadhani37229', 'INDAH DESMITA RAMADHANI', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (362, 'jamilatuszahro715110', 'JAMILATUS ZAHRO', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (363, 'karin23796', 'KARIN', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (364, 'melyatuljaniyah67487', 'MELYATUL JANIYAH', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (365, 'mohrizalulamri36274', 'MOH. RIZALUL AMRI', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (366, 'mohammadifdanisamsulmu\'arif16589', 'MOHAMMAD IFDANI SAMSUL MU\'ARIF', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (367, 'mohammadprayogi63575', 'MOHAMMAD PRAYOGI', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (368, 'muhammadadifan46804', 'MUHAMMAD ADIFAN', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (369, 'muhammadfikrimardianto85123', 'MUHAMMAD FIKRI MARDIANTO', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (370, 'muhammadhairurrofiqi15649', 'MUHAMMAD HAIRUR ROFIQI', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (371, 'muhammadradhosaputra95501', 'MUHAMMAD RADHO SAPUTRA', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (372, 'muhammadzulhanhasan30501', 'MUHAMMAD ZULHAN HASAN', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (373, 'rafitaewiagustin32596', 'RAFITA EWI AGUSTIN', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (374, 'riskianaoktaviahaliza34177', 'RISKIANA OKTAVIA HALIZA', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (375, 'riskiatulhidayah761001', 'RISKIATUL HIDAYAH', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (376, 'sifaratulramadani32632', 'SIFARATUL RAMADANI', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (377, 'sintiacikanabawiyah62471', 'SINTIA CIKA NABAWIYAH', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (378, 'sitiamiliaputri16927', 'SITI AMILIA PUTRI', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (379, 'sitinabila49518', 'SITI NABILA', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (380, 'sitirokayahazzahro93609', 'SITI ROKAYAH AZZAHRO', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (381, 'vijayidirromadhan58941', 'VIJAYIDIR ROMADHAN', NULL, NULL, '', 3, 1, 2, 4, 6, NULL, '2023-08-10 23:02:14', '2023-08-10 23:02:14', NULL, NULL);
INSERT INTO `users` VALUES (382, 'adeliasafira34318', 'ADELIA SAFIRA', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:27', '2023-08-10 23:02:27', NULL, NULL);
INSERT INTO `users` VALUES (383, 'ahmadandika83470', 'AHMAD ANDIKA', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:27', '2023-08-10 23:02:27', NULL, NULL);
INSERT INTO `users` VALUES (384, 'ahmaddanisaputra67746', 'AHMAD DANI SAPUTRA', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:27', '2023-08-10 23:02:27', NULL, NULL);
INSERT INTO `users` VALUES (385, 'ahmadkholilanam79342', 'AHMAD KHOLIL ANAM', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:27', '2023-08-10 23:02:27', NULL, NULL);
INSERT INTO `users` VALUES (386, 'ahmatzainolwefi16312', 'AHMAT ZAINOL WEFI', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:27', '2023-08-10 23:02:27', NULL, NULL);
INSERT INTO `users` VALUES (387, 'anafitria28564', 'ANA FITRIA', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:27', '2023-08-10 23:02:27', NULL, NULL);
INSERT INTO `users` VALUES (388, 'anggaardiansyah597010', 'ANGGA ARDIANSYAH', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:27', '2023-08-10 23:02:27', NULL, NULL);
INSERT INTO `users` VALUES (389, 'anggaaulyzakaria22974', 'ANGGA AULY ZAKARIA', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:27', '2023-08-10 23:02:27', NULL, NULL);
INSERT INTO `users` VALUES (390, 'anggeraryprayoga100350', 'ANGGER ARY PRAYOGA', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:27', '2023-08-10 23:02:27', NULL, NULL);
INSERT INTO `users` VALUES (391, 'apreliaputrinurcahyadi22587', 'APRELIA PUTRI NUR CAHYADI', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (392, 'aridwikiananta14555', 'ARI DWIKI ANANTA', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (393, 'dhealovaadityaekaramadhan40779', 'DHEALOVA ADITYA EKA RAMADHAN', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (394, 'elsadwiistifiana36124', 'ELSA DWI ISTIFIANA', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (395, 'fadilatulmaulida35319', 'FADILATUL MAULIDA', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (396, 'faraduwialyati67528', 'FARA DUWI ALYATI', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (397, 'firnandajanuarisputri93567', 'FIRNANDA JANUARIS PUTRI', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (398, 'galuhdiyantipermatasari98695', 'GALUH DIYANTI PERMATASARI', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (399, 'holisaamalia51487', 'HOLISA AMALIA', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (400, 'iftitahleninggaekaputri78689', 'IFTITAH LENINGGA EKA PUTRI', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (401, 'iftitahussa\'adah906310', 'IFTITAHUSSA\'ADAH', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (402, 'kamilatulqomariyah92319', 'KAMILATUL QOMARIYAH', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (403, 'mohammadprayoga12353', 'MOHAMMAD PRAYOGA', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (404, 'mohammmadtegarandhikapratama35624', 'MOHAMMMAD TEGAR ANDHIKA PRATAMA', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (405, 'muhammadnailulchoeri91490', 'MUHAMMAD NAILUL CHOERI', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (406, 'muhammadzainurraziqin17855', 'MUHAMMAD ZAINURRAZIQIN', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (407, 'navinsafebiola12970', 'NAVINSA FEBIOLA', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (408, 'nurjiahindrianti71419', 'NURJIAH INDRIANTI', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (409, 'pipitnovitasari99994', 'PIPIT NOVITASARI', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (410, 'putriwulandari72233', 'PUTRI WULANDARI', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (411, 'rahadiafdalsyah78950', 'RAHADI AFDALSYAH', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (412, 'roniferdianto46113', 'RONI FERDIANTO', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (413, 'selaayulestari70630', 'SELA AYU LESTARI', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (414, 'sitiaisah22319', 'SITI AISAH', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (415, 'sittimudmaina278410', 'SITTI MUDMAINA', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (416, 'syaifulbahri73599', 'SYAIFUL BAHRI', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (417, 'teguhdwiramadhani26351', 'TEGUH DWI RAMADHANI', NULL, NULL, '', 3, 1, 2, 4, 7, NULL, '2023-08-10 23:02:28', '2023-08-10 23:02:28', NULL, NULL);
INSERT INTO `users` VALUES (418, 'achmadgalihadhyaksa18722', 'ACHMAD GALIH ADHYAKSA', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:40', '2023-08-10 23:02:40', NULL, NULL);
INSERT INTO `users` VALUES (419, 'adamalamsyahquldiby46147', 'ADAM ALAMSYAH QULDIBY', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:40', '2023-08-10 23:02:40', NULL, NULL);
INSERT INTO `users` VALUES (420, 'ahmaddjunaediharyanto11817', 'AHMAD DJUNAEDI HARYANTO', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:40', '2023-08-10 23:02:40', NULL, NULL);
INSERT INTO `users` VALUES (421, 'ahmadnurmuttaqien41660', 'AHMAD NUR MUTTAQIEN', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:40', '2023-08-10 23:02:40', NULL, NULL);
INSERT INTO `users` VALUES (422, 'akbarbudiprasetyo26529', 'AKBAR BUDI PRASETYO', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:40', '2023-08-10 23:02:40', NULL, NULL);
INSERT INTO `users` VALUES (423, 'alfyanannawaf43346', 'ALFYAN AN NAWAF', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:40', '2023-08-10 23:02:40', NULL, NULL);
INSERT INTO `users` VALUES (424, 'alifiamaylarifkisafira17658', 'ALIFIA MAYLA RIFKI SAFIRA', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:40', '2023-08-10 23:02:40', NULL, NULL);
INSERT INTO `users` VALUES (425, 'bayuarizonamukti62907', 'BAYU ARIZONA MUKTI', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:40', '2023-08-10 23:02:40', NULL, NULL);
INSERT INTO `users` VALUES (426, 'bulanadeltazaprilia25178', 'BULAN ADELTA ZAPRILIA', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:40', '2023-08-10 23:02:40', NULL, NULL);
INSERT INTO `users` VALUES (427, 'dafitokeshaenggarkusumo53573', 'DAFITO KESHA ENGGAR KUSUMO', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:40', '2023-08-10 23:02:40', NULL, NULL);
INSERT INTO `users` VALUES (428, 'davinihwanprayogi65886', 'DAVIN IHWAN PRAYOGI', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:40', '2023-08-10 23:02:40', NULL, NULL);
INSERT INTO `users` VALUES (429, 'dianaayu66248', 'DIANA AYU', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:40', '2023-08-10 23:02:40', NULL, NULL);
INSERT INTO `users` VALUES (430, 'dimasputraaditia13462', 'DIMAS PUTRA ADITIA', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:40', '2023-08-10 23:02:40', NULL, NULL);
INSERT INTO `users` VALUES (431, 'fauziahfarasafitri58218', 'FAUZIAH FARA SAFITRI ', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:40', '2023-08-10 23:02:40', NULL, NULL);
INSERT INTO `users` VALUES (432, 'jamila82283', 'JAMILA', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:40', '2023-08-10 23:02:40', NULL, NULL);
INSERT INTO `users` VALUES (433, 'jonifernando45175', 'JONI FERNANDO', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:40', '2023-08-10 23:02:40', NULL, NULL);
INSERT INTO `users` VALUES (434, 'justinmosesprayogo88577', 'JUSTIN MOSES PRAYOGO ', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:40', '2023-08-10 23:02:40', NULL, NULL);
INSERT INTO `users` VALUES (435, 'mohammaddayrobifabiantara73904', 'MOHAMMAD DAYROBI FABIANTARA', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:40', '2023-08-10 23:02:40', NULL, NULL);
INSERT INTO `users` VALUES (436, 'mohammadsamsularifin76144', 'MOHAMMAD SAMSUL ARIFIN', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:41', '2023-08-10 23:02:41', NULL, NULL);
INSERT INTO `users` VALUES (437, 'muhammadfaizalfahrezy50487', 'MUHAMMAD FAIZAL FAHREZY', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:41', '2023-08-10 23:02:41', NULL, NULL);
INSERT INTO `users` VALUES (438, 'muhammadkafkaauliya19137', 'MUHAMMAD KAFKA AULIYA', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:41', '2023-08-10 23:02:41', NULL, NULL);
INSERT INTO `users` VALUES (439, 'muhammadprayogawijaya85698', 'MUHAMMAD PRAYOGA WIJAYA', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:41', '2023-08-10 23:02:41', NULL, NULL);
INSERT INTO `users` VALUES (440, 'muhammadrifqimaulana365510', 'MUHAMMAD RIFQI MAULANA', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:41', '2023-08-10 23:02:41', NULL, NULL);
INSERT INTO `users` VALUES (441, 'satriorifkiandika49466', 'SATRIO RIFKI ANDIKA', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:41', '2023-08-10 23:02:41', NULL, NULL);
INSERT INTO `users` VALUES (442, 'septianbudiramadhan23145', 'SEPTIAN BUDI RAMADHAN', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:41', '2023-08-10 23:02:41', NULL, NULL);
INSERT INTO `users` VALUES (443, 'valenreksaadyanggara94869', 'VALEN REKSA ADY ANGGARA', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:41', '2023-08-10 23:02:41', NULL, NULL);
INSERT INTO `users` VALUES (444, 'verischasalsabillaraihanuun539110', 'VERISCHA SALSABILLA RAIHANUUN', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:41', '2023-08-10 23:02:41', NULL, NULL);
INSERT INTO `users` VALUES (445, 'yanuarielpancadarmawan86654', 'YANUARIEL PANCA DARMAWAN', NULL, NULL, '', 3, 1, 2, 6, 10, NULL, '2023-08-10 23:02:41', '2023-08-10 23:02:41', NULL, NULL);
INSERT INTO `users` VALUES (446, 'achmadiabdulmuis40416', 'ACHMADI ABDUL MUIS', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:51', '2023-08-10 23:02:51', NULL, NULL);
INSERT INTO `users` VALUES (447, 'ahmadfakhrimaulana100146', 'AHMAD FAKHRI MAULANA', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:51', '2023-08-10 23:02:51', NULL, NULL);
INSERT INTO `users` VALUES (448, 'ahmadfauzi86845', 'AHMAD FAUZI', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:51', '2023-08-10 23:02:51', NULL, NULL);
INSERT INTO `users` VALUES (449, 'ahmataldifaturullah10311', 'AHMAT ALDI FATURULLAH', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:51', '2023-08-10 23:02:51', NULL, NULL);
INSERT INTO `users` VALUES (450, 'ajmaljamil48630', 'AJMAL JAMIL', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (451, 'alvinnurrochman44721', 'ALVIN NUR ROCHMAN', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (452, 'anggitariofirdauzi19531', 'ANGGITARIO FIRDAUZI', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (453, 'dafamuktasimnawawi366710', 'DAFA MUKTASIM NAWAWI', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (454, 'daniario39127', 'DANI ARIO', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (455, 'elisatriandikadewi31991', 'ELISA TRIANDIKA DEWI', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (456, 'femilliaazzuhraputri94467', 'FEMILLIA AZZUHRA PUTRI', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (457, 'izaekapratiwi272410', 'IZA EKA PRATIWI', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (458, 'javaekabhimantara90126', 'JAVA EKA BHIMANTARA', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (459, 'mohamadrobitmaulanafalah53449', 'MOHAMAD ROBIT MAULANA FALAH', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (460, 'mohammadanzilatulpasharamadani27211', 'MOHAMMAD ANZILATUL PASHA RAMADANI', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (461, 'muhammadabdulwafi64672', 'MUHAMMAD ABDUL WAFI', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (462, 'muhammadafrizaabdillah85624', 'MUHAMMAD AFRIZA ABDILLAH', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (463, 'muhammadgatanfathorrozaki87962', 'MUHAMMAD GATAN FATHOR ROZAKI ', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (464, 'muhammadnurfadil37600', 'MUHAMMAD NUR FADIL', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (465, 'muhammadrendi14227', 'MUHAMMAD RENDI', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (466, 'muhammadsuwarno19309', 'MUHAMMAD SUWARNO', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (467, 'rendipranata48211', 'RENDI PRANATA', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (468, 'saefanaliazzarkasi16924', 'SAEFAN ALI AZZARKASI', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (469, 'syauqimubarok28906', 'SYAUQI MUBAROK', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (470, 'syechilhamsultanfahrezi81661', 'SYECH ILHAM SULTAN FAHREZI', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (471, 'ulfinadiaputri75608', 'ULFI NADIA PUTRI', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (472, 'urwahalwutsqa22216', 'URWAH AL WUTSQA', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (473, 'zakariazuhdiahmad86118', 'ZAKARIA ZUHDI AHMAD', NULL, NULL, '', 3, 1, 2, 6, 11, NULL, '2023-08-10 23:02:52', '2023-08-10 23:02:52', NULL, NULL);
INSERT INTO `users` VALUES (474, 'abduladnan12459', 'ABDUL ADNAN', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (475, 'alfisyarifatulhasanah63391', 'ALFI SYARIFATUL HASANAH', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (476, 'angguntrihartini43105', 'ANGGUN TRI HARTINI', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (477, 'anirahmawati481001', 'ANI RAHMAWATI', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (478, 'bungaheldaangelriska519810', 'BUNGA HELDA ANGEL RISKA', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (479, 'delaseptiarini63237', 'DELA SEPTIARINI', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (480, 'dianaputrimaharani31542', 'DIANA PUTRI MAHARANI', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (481, 'elvinafitrih20958', 'ELVINA FITRIH', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (482, 'fendimaulana85313', 'FENDI MAULANA', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (483, 'ginafitratulmuntazah13330', 'GINA FITRATUL MUNTAZAH', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (484, 'halimatussa\'diyah72148', 'HALIMATUS SA\'DIYAH', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (485, 'jamilatussyarifah42393', 'JAMILATUS SYARIFAH', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (486, 'khildarosida97852', 'KHILDA ROSIDA', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (487, 'maidaputrifatimatuzzahro13207', 'MAIDA PUTRI FATIMATUZZAHRO', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (488, 'muhammadafandipratama98892', 'MUHAMMAD AFANDI PRATAMA', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (489, 'muhammadramakalamullah69115', 'MUHAMMAD RAMA KALAMULLAH', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (490, 'nabilaagustinkhoirunika66627', 'NABILA AGUSTIN KHOIRUNIKA', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (491, 'najwanurhasanah67152', 'NAJWA NUR HASANAH', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (492, 'nicosetyawan79431', 'NICO SETYAWAN', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (493, 'noviaziqnafirdausy54642', 'NOVIA ZIQNA FIRDAUSY', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (494, 'ratihwindiyuniasie70968', 'RATIH WINDI YUNIASIE', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (495, 'rifkinurakbarjunaidi17748', 'RIFKI NUR AKBAR JUNAIDI', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (496, 'rismanurkhalisah58321', 'RISMA NUR KHALISAH', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (497, 'rizkiazizahsalsabila58733', 'RIZKI AZIZAH SALSABILA', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (498, 'salwahsabrina20480', 'SALWAH SABRINA', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (499, 'sitanurhalisah42188', 'SITA NURHALISAH', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (500, 'sitiindriyani90284', 'SITI INDRIYANI', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (501, 'suciromadiyahmakmur83140', 'SUCI ROMADIYAH MAKMUR', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (502, 'titaagustinaauliarahman83554', 'TITA AGUSTINA AULIA RAHMAN', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (503, 'vinaandini94453', 'VINA ANDINI', NULL, NULL, '', 3, 1, 3, 10, 16, NULL, '2023-08-10 23:03:04', '2023-08-10 23:03:04', NULL, NULL);
INSERT INTO `users` VALUES (504, 'agishoirunnisa18995', 'AGIS HOIRUN NISA', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (505, 'ahmadaburizalalgifari20922', 'AHMAD ABU RIZAL ALGIFARI', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (506, 'alfianuruzzyadah52264', 'ALFIA NURUZZ YADAH', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (507, 'angieseptianingtias97686', 'ANGIE SEPTIANING TIAS', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (508, 'arilnuraini34257', 'ARIL NURAINI', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (509, 'chairuneisafebitricahyani12444', 'CHAIRUNEISA FEBITRI CAHYANI', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (510, 'dheaamandasafitrimaulani37411', 'DHEA AMANDA SAFITRI MAULANI', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (511, 'dinydwiafdholullaily96250', 'DINY DWI AFDHOLUL LAILY', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (512, 'duwidarmawan41930', 'DUWI DARMAWAN', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (513, 'fifinnurulisnaini26955', 'FIFIN NURUL ISNAINI', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (514, 'gitaabelianajwa31198', 'GITA ABELIA NAJWA', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (515, 'hilyahfairusiyah51801', 'HILYAH FAIRUSIYAH', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (516, 'jihanzahirohwahyuni50433', 'JIHAN ZAHIROH WAHYUNI', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (517, 'lathifatulintan31693', 'LATHIFATUL INTAN', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (518, 'maisarohgaferlisafitriadani18152', 'MAISAROH GAFERLI SAFITRI ADANI', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (519, 'mohammadwafi71302', 'MOHAMMAD WAFI', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (520, 'muhammadazrielwahyuramadhan56590', 'MUHAMMAD AZRIEL WAHYU RAMADHAN', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (521, 'muhammadwildan46372', 'MUHAMMAD WILDAN', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (522, 'nadiahzehro10328', 'NADIAH ZEHRO', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (523, 'nindiwardahkamelia74227', 'NINDI WARDAH KAMELIA', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (524, 'nurulfadilahirfaniarahayu293410', 'NURUL FADILAH IRFANIA RAHAYU', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (525, 'pujiandayani85448', 'PUJI ANDAYANI', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (526, 'rahmatekaprasetiyo71993', 'RAHMAT EKA PRASETIYO', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (527, 'rindioktaviaramadhani85769', 'RINDI OKTAVIA RAMADHANI', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (528, 'rizkiamalia24724', 'RIZKI AMALIA', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (529, 'rossaridiadamayanti33459', 'ROSSA RIDIA DAMAYANTI', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (530, 'shelylatanzil38457', 'SHELY LATANZIL', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (531, 'sitiholifah68840', 'SITI HOLIFAH', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (532, 'sittinurfaisah48139', 'SITTI NUR FAISAH', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (533, 'tiaramutiahjuwitaputri653510', 'TIARA MUTIAH JUWITA PUTRI', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (534, 'zindadwiaprilia50146', 'ZINDA DWI APRILIA', NULL, NULL, '', 3, 1, 3, 10, 17, NULL, '2023-08-10 23:03:17', '2023-08-10 23:03:17', NULL, NULL);
INSERT INTO `users` VALUES (535, 'adityanovandykapratama24820', 'ADITYA NOVANDYKA PRATAMA', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (536, 'anandamuhammadhabibi24609', 'ANANDA MUHAMMAD HABIBI', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (537, 'andreramadana85420', 'ANDRE RAMADANA', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (538, 'aprilianovitasari869310', 'APRILIA NOVITA SARI', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (539, 'devianggraeni100520', 'DEVI ANGGRAENI', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (540, 'egasaptaardiansyah99204', 'EGA SAPTA ARDIANSYAH', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (541, 'fadiraalyasyakhbana19587', 'FADIRA ALYA SYAKHBANA', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (542, 'fatimahsyaharbhanu18252', 'FATIMAH SYAHAR BHANU', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (543, 'feraagustin90776', 'FERA AGUSTIN', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (544, 'firdaus76137', 'FIRDAUS', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (545, 'hestiannuraisyah53582', 'HESTIAN NUR AISYAH', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (546, 'mochammadnandaaditwinaputra63525', 'MOCHAMMAD NANDA ADIT WINA PUTRA', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (547, 'mohammadimron18184', 'MOHAMMAD IMRON', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (548, 'muhamadfaiz57524', 'MUHAMAD FAIZ', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (549, 'muhammadalvin929010', 'MUHAMMAD ALVIN', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (550, 'muhammadandreyanto341210', 'MUHAMMAD ANDREYANTO', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (551, 'putudimasfebrian57822', 'PUTU DIMAS FEBRIAN', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (552, 'renialfiah44852', 'RENI ALFIAH', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (553, 'rifansauqi71678', 'RIFAN SAUQI', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (554, 'sitinurazizah53512', 'SITI NUR AZIZAH', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (555, 'sultanmuhammadfaizalziatbahamalah46566', 'SULTAN MUHAMMAD FAIZAL ZIAT BAHAMALAH', NULL, NULL, '', 3, 1, 3, 12, 20, NULL, '2023-08-10 23:03:32', '2023-08-10 23:03:32', NULL, NULL);
INSERT INTO `users` VALUES (556, 'abdulharisardiansyah90422', 'ABDUL HARIS ARDIANSYAH', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (557, 'adindanurdiana88699', 'ADINDA NURDIANA', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (558, 'adityabantaraputra52345', 'ADITYA BANTARA PUTRA', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (559, 'benardiodwisaputra75523', 'BENARDIO DWI SAPUTRA', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (560, 'citraindrianingsih17293', 'CITRA INDRIANINGSIH', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (561, 'diditdiantoro52434', 'DIDIT DIANTORO', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (562, 'dwiindahseptiyana18850', 'DWI INDAH SEPTIYANA', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (563, 'ekakurniawanatmaja39455', 'EKA KURNIAWAN ATMAJA', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (564, 'eriswardhani16389', 'ERIS WARDHANI', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (565, 'falah13770', 'FALAH', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (566, 'hendrikabilaturrahman69445', 'HENDRIK ABILATURRAHMAN', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (567, 'muhammadfaizal32519', 'MUHAMMAD FAIZAL', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (568, 'muhammadimamwahyudi83567', 'MUHAMMAD IMAM WAHYUDI', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (569, 'muhammadjunaedi22411', 'MUHAMMAD JUNAEDI', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (570, 'muhammadsamsularifin95857', 'MUHAMMAD SAMSUL ARIFIN', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (571, 'muhammadsandiporwanto69874', 'MUHAMMAD SANDI PORWANTO', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (572, 'naylafakhirasetyawan45712', 'NAYLA FAKHIRA SETYAWAN', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (573, 'nurilazizah71861', 'NURIL AZIZAH', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (574, 'rahmankhoirpujanarko95332', 'RAHMAN KHOIR PUJANARKO', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (575, 'rezaagnesmonikaoktafiaramadhan76187', 'REZA AGNES MONIKA OKTAFIA RAMADHAN', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (576, 'tiaramayangsalsabila66853', 'TIARA MAYANG SALSABILA', NULL, NULL, '', 3, 1, 3, 12, 21, NULL, '2023-08-10 23:03:46', '2023-08-10 23:03:46', NULL, NULL);
INSERT INTO `users` VALUES (577, 'achmadnovalfirdaus51579', 'ACHMAD NOVAL FIRDAUS', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (578, 'adjiwijayanto32151', 'ADJI WIJAYANTO', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (579, 'ahmaddwizamroni87448', 'AHMAD DWI ZAMRONI', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (580, 'amirdwianggoro161110', 'AMIR DWI ANGGORO', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (581, 'chelceakamal32369', 'CHELCEA KAMAL', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (582, 'derialmahfut74871', 'DERI ALMAHFUT', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (583, 'elviaayuanadea73910', 'ELVIA AYU ANADEA', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (584, 'farelpratamaisma65744', 'FAREL PRATAMA ISMA', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (585, 'fernandohogihartono10881', 'FERNANDO HOGI HARTONO', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (586, 'hilmanfauzi17915', 'HILMAN FAUZI', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (587, 'indanalidianazulfa261001', 'INDANA LIDIA NAZULFA', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (588, 'karimahalhaura45473', 'KARIMAH ALHAURA', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (589, 'lailatulfitriah64885', 'LAILATUL FITRIAH', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (590, 'mochammadcandrasyahputra55594', 'MOCHAMMAD CANDRA SYAHPUTRA', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (591, 'mochammadnurfaizalnovimwiyono83165', 'MOCHAMMAD NURFAIZAL NOVIMWIYONO', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (592, 'muhammadbagusirfanwahyudi26677', 'MUHAMMAD BAGUS IRFAN WAHYUDI', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (593, 'muhammadfarhannurillah43223', 'MUHAMMAD FARHAN NURILLAH', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (594, 'muhammadfawaid99818', 'MUHAMMAD FAWAID', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (595, 'muhammadilhamirfani12609', 'MUHAMMAD ILHAM IRFANI', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (596, 'muhammadlutfiandika56323', 'MUHAMMAD LUTFI ANDIKA', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (597, 'muhammadnafisrabbani20507', 'MUHAMMAD NAFIS RABBANI', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (598, 'muhammadrassyabriliantara12920', 'MUHAMMAD RASSYA BRILIANTARA', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (599, 'muhammadrayhanalfirdaus45349', 'MUHAMMAD RAYHAN AL FIRDAUS', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (600, 'muhammadyusufcahyaadhynugroho100296', 'MUHAMMAD YUSUF CAHYA ADHY NUGROHO', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:05', '2023-08-10 23:04:05', NULL, NULL);
INSERT INTO `users` VALUES (601, 'muhammadzakyputranazrielio941002', 'MUHAMMAD ZAKY PUTRA NAZRIELIO', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:06', '2023-08-10 23:04:06', NULL, NULL);
INSERT INTO `users` VALUES (602, 'nadiaokvindaalvionita44910', 'NADIA OKVINDA ALVIONITA', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:06', '2023-08-10 23:04:06', NULL, NULL);
INSERT INTO `users` VALUES (603, 'prayudhaputraarifin85834', 'PRAYUDHA PUTRA ARIFIN', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:06', '2023-08-10 23:04:06', NULL, NULL);
INSERT INTO `users` VALUES (604, 'putriayu34795', 'PUTRI AYU', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:06', '2023-08-10 23:04:06', NULL, NULL);
INSERT INTO `users` VALUES (605, 'raniobeydianzahro67353', 'RANI OBEYDIAN ZAHRO', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:06', '2023-08-10 23:04:06', NULL, NULL);
INSERT INTO `users` VALUES (606, 'syukrontrimartino85632', 'SYUKRON TRI MARTINO', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:06', '2023-08-10 23:04:06', NULL, NULL);
INSERT INTO `users` VALUES (607, 'widhoainunriaqi58980', 'WIDHO AINUN RIAQI', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:06', '2023-08-10 23:04:06', NULL, NULL);
INSERT INTO `users` VALUES (608, 'winditanuramalia13919', 'WINDITA NUR AMALIA', NULL, NULL, '', 3, 1, 3, 13, 22, NULL, '2023-08-10 23:04:06', '2023-08-10 23:04:06', NULL, NULL);
INSERT INTO `users` VALUES (609, 'aangdimasfinadeang24244', 'AANG DIMAS FINADEANG', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:19', '2023-08-10 23:04:19', NULL, NULL);
INSERT INTO `users` VALUES (610, 'adrianrizaldikurniawan414710', 'ADRIAN RIZALDI KURNIAWAN', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:19', '2023-08-10 23:04:19', NULL, NULL);
INSERT INTO `users` VALUES (611, 'ainurrohmanpancapradana36977', 'AINUR ROHMAN PANCA PRADANA', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:19', '2023-08-10 23:04:19', NULL, NULL);
INSERT INTO `users` VALUES (612, 'ariensephansyah69427', 'ARIEN SEPHAN SYAH', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:19', '2023-08-10 23:04:19', NULL, NULL);
INSERT INTO `users` VALUES (613, 'bagoessiswoyo66397', 'BAGOES SISWOYO', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:19', '2023-08-10 23:04:19', NULL, NULL);
INSERT INTO `users` VALUES (614, 'beatricefourendithaleonynathania60481', 'BEATRICE FOURENDITHA LEONY NATHANIA', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (615, 'destyodwirahmawan632210', 'DESTYO DWI RAHMAWAN', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (616, 'dimazhasyimhidayat48638', 'DIMAZ HASYIM HIDAYAT', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (617, 'dirmaberlianfancisca35624', 'DIRMA BERLIAN FANCISCA', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (618, 'fadilagustiofirmansyah71199', 'FADIL AGUSTIO FIRMANSYAH', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (619, 'izzatulfadilah34378', 'IZZATUL FADILAH', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (620, 'jasminekhairunnisa73104', 'JASMINE KHAIRUNNISA', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (621, 'jovianturkyirfandi26626', 'JOVIAN TURKY IRFANDI', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (622, 'julfanaerzadwipratiwi63334', 'JULFANA ERZA DWI PRATIWI', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (623, 'mohammadfaizalkhofili11394', 'MOHAMMAD FAIZAL KHOFILI', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (624, 'mohammadmaulanafirmansyah78981', 'MOHAMMAD MAULANA FIRMANSYAH', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (625, 'muhammadabdulafif86452', 'MUHAMMAD ABDUL AFIF', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (626, 'muhammadarieffirmansyah43585', 'MUHAMMAD ARIEF FIRMANSYAH', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (627, 'muhammadharisumami252810', 'MUHAMMAD HARIS UMAMI', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (628, 'muhammadirsyadrabbani43878', 'MUHAMMAD IRSYAD RABBANI', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (629, 'muhammadshobri71780', 'MUHAMMAD SHOBRI', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (630, 'muhammadsukronmaulidi88303', 'MUHAMMAD SUKRON MAULIDI', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (631, 'muhammadyudayanto49280', 'MUHAMMAD YUDA YANTO', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (632, 'muhammadzaeinulhaqqi61245', 'MUHAMMAD ZAEINUL HAQQI', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (633, 'putragunawan571009', 'PUTRA GUNAWAN', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (634, 'ragilsaifurrosiqin54934', 'RAGIL SAIFUR ROSIQIN', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (635, 'siswoputraarikpratama708910', 'SISWO PUTRA ARIK PRATAMA', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (636, 'vionitasalsabilaindiraputri16828', 'VIONITA SALSABILA INDIRA PUTRI', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (637, 'zharakhalimatussakdiyah43853', 'ZHARA KHALIMATUS SAKDIYAH', NULL, NULL, '', 3, 1, 3, 13, 23, NULL, '2023-08-10 23:04:20', '2023-08-10 23:04:20', NULL, NULL);
INSERT INTO `users` VALUES (638, 'adeliaekapujianto68941', 'ADELIA EKA PUJIANTO', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (639, 'aisyahsulistianingsih401006', 'AISYAH SULISTIA NINGSIH', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (640, 'amandadwicahyaningwulandari38560', 'AMANDA DWI CAHYANING WULANDARI', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (641, 'anggyfaradina46530', 'ANGGY FARADINA', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (642, 'cantikadwiwardani94464', 'CANTIKA DWI WARDANI', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (643, 'chantikamayshinta80808', 'CHANTIKA MAY SHINTA', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (644, 'danangseptakurniawan57255', 'DANANG SEPTA KURNIAWAN', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (645, 'dwiratihekaseptiani92509', 'DWI RATIH EKA SEPTIANI', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (646, 'fenifilianaarif68379', 'FENI FILIANA ARIF', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (647, 'finaatikatungonita41930', 'FINA ATIKATUN GONITA', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (648, 'gitadwiandini72418', 'GITA DWI ANDINI', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (649, 'hairatunnisah382910', 'HAIRATUN NISAH', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (650, 'intanlailatussifanah37730', 'INTAN LAILATUS SIFANAH', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (651, 'istiana48743', 'ISTIANA', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (652, 'maulidearofiatuljannah33677', 'MAULIDEA ROFIATUL JANNAH', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (653, 'muhammadferdiyanto69559', 'MUHAMMAD FERDIYANTO', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (654, 'muhammadnukilalfarizi66730', 'MUHAMMAD NUKIL ALFARIZI', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (655, 'najwarosyidahzahrotulhayat20600', 'NAJWA ROSYIDAH ZAHROTUL HAYAT', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (656, 'noventiaayuraisyaputribaiturrahman864610', 'NOVENTIA AYU RAISYA PUTRI BAITURRAHMAN', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (657, 'putrikartikaselvriyanti24302', 'PUTRI KARTIKA SELVRIYANTI', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (658, 'rafirahmadfirmansyach86135', 'RAFI RAHMAD FIRMANSYACH', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (659, 'riana17376', 'RIANA', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:33', '2023-08-10 23:04:33', NULL, NULL);
INSERT INTO `users` VALUES (660, 'sariwiladatussalimah35946', 'SARI WILADATUS SALIMAH', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:34', '2023-08-10 23:04:34', NULL, NULL);
INSERT INTO `users` VALUES (661, 'sitiauliaashfahany13524', 'SITI AULIA ASHFAHANY', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:34', '2023-08-10 23:04:34', NULL, NULL);
INSERT INTO `users` VALUES (662, 'sitiramadatussavina41472', 'SITI RAMADATUS SAVINA', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:34', '2023-08-10 23:04:34', NULL, NULL);
INSERT INTO `users` VALUES (663, 'sutanadhifadiwangsa614710', 'SUTA NADHIF ADIWANGSA', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:34', '2023-08-10 23:04:34', NULL, NULL);
INSERT INTO `users` VALUES (664, 'syalsabilakhoirunnisa233010', 'SYALSABILA KHOIRUN NISA', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:34', '2023-08-10 23:04:34', NULL, NULL);
INSERT INTO `users` VALUES (665, 'vanesatriyacalista23420', 'VANESA TRIYA CALISTA', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:34', '2023-08-10 23:04:34', NULL, NULL);
INSERT INTO `users` VALUES (666, 'windaputriagustin79253', 'WINDA PUTRI AGUSTIN', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:34', '2023-08-10 23:04:34', NULL, NULL);
INSERT INTO `users` VALUES (667, 'yoepiedianpermadani59469', 'YOEPIE DIAN PERMADANI', NULL, NULL, '', 3, 1, 3, 9, 14, NULL, '2023-08-10 23:04:34', '2023-08-10 23:04:34', NULL, NULL);
INSERT INTO `users` VALUES (668, 'ainunazizah91856', 'AINUN AZIZAH', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (669, 'aliviaaisyahputri77301', 'ALIVIA AISYAH PUTRI', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (670, 'amandaputriwulandari48911', 'AMANDA PUTRI WULANDARI', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (671, 'anisyanuramiliya53733', 'ANISYA NUR AMILIYA', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (672, 'bondanwilisaputra87300', 'BONDAN WILI SAPUTRA', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (673, 'cantikamaharani23505', 'CANTIKA MAHARANI', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (674, 'dianapuspitasari37821', 'DIANA PUSPITA SARI', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (675, 'faradiladwiamelia462010', 'FARADILA DWI AMELIA', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (676, 'ferinoktaramadhani705710', 'FERIN OKTA RAMADHANI', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (677, 'giscapaulina66342', 'GISCA PAULINA', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (678, 'hafidatussolehah95294', 'HAFIDATUS SOLEHAH', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (679, 'hayatifirdaus60474', 'HAYATI FIRDAUS', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (680, 'intanwahyuprastya98246', 'INTAN WAHYU PRASTYA', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (681, 'itanurriskiyanti72264', 'ITA NUR RISKIYANTI', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (682, 'maulanaaprilia32852', 'MAULANA APRILIA', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (683, 'meirizairnaanggraeni61794', 'MEIRIZA IRNA ANGGRAENI', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (684, 'muhammadakbarrisqisantoso67733', 'MUHAMMAD AKBAR RISQI SANTOSO', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (685, 'muhammadnauvalalfaisal38721', 'MUHAMMAD NAUVAL ALFAISAL', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (686, 'noniktriaskartika85804', 'NONIK TRIAS KARTIKA', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (687, 'prasetyadwitugassaputra39595', 'PRASETYA DWI TUGAS SAPUTRA', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (688, 'putriekaningrizkysantoso75624', 'PUTRI EKANING RIZKY SANTOSO', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (689, 'renatadwilestari11906', 'RENATA DWI LESTARI', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (690, 'ricohairulanam99191', 'RICO HAIRUL ANAM', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (691, 'riskayuniartikazizah88336', 'RISKA YUNIARTIK AZIZAH', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (692, 'sherineaurelia388110', 'SHERINE AURELIA', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (693, 'sitimaysharoh51611', 'SITI MAYSHAROH', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (694, 'sitisofiyatulamaliyah44239', 'SITI SOFIYATUL AMALIYAH', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (695, 'syarifahsafiinatulmasruroh161210', 'SYARIFAH SAFIINATUL MASRUROH', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (696, 'wahyubudisantoso36120', 'WAHYU BUDI SANTOSO', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (697, 'wikamonika64106', 'WIKA MONIKA', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (698, 'windayuliasari679410', 'WINDA YULIA SARI', NULL, NULL, '', 3, 1, 3, 9, 15, NULL, '2023-08-10 23:04:49', '2023-08-10 23:04:49', NULL, NULL);
INSERT INTO `users` VALUES (699, 'ahmadsubastiarivandy59608', 'AHMAD SUBASTIAR IVANDY', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (700, 'aininorafriyanti31756', 'AINI NOR AFRIYANTI', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (701, 'aurayogioktavianti21925', 'AURA YOGI OKTAVIANTI', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (702, 'camiliafauziyah14202', 'CAMILIA FAUZIYAH', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (703, 'cindydwiramadhona10249', 'CINDY DWI RAMADHONA', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (704, 'dellanataliamargareta91991', 'DELLA NATALIA MARGARETA', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (705, 'dwiayukurniawan10209', 'DWI AYU KURNIAWAN', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (706, 'dwisaptaharnawi85327', 'DWI SAPTA HARNAWI', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (707, 'emiliainsankamilah92812', 'EMILIA INSAN KAMILAH', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (708, 'fitriandriyani79923', 'FITRI ANDRIYANI', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (709, 'grisnayaauliaherianto40561', 'GRISNAYA AULIA HERIANTO', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (710, 'ichaayudyafebianti71977', 'ICHA AYUDYA FEBIANTI', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (711, 'lailyazzahrosuprapti90647', 'LAILY AZZAHRO SUPRAPTI', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (712, 'masyaruhhusnolkhotimah73844', 'MASYARUH HUSNOL KHOTIMAH', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (713, 'muhammadafifandifirmansyah135810', 'MUHAMMAD AFIFANDI FIRMANSYAH', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (714, 'navizahadilaayu17844', 'NAVIZAH ADILA AYU', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (715, 'putrileginanabilasuheimy51365', 'PUTRI LEGINA NABILA SUHEIMY', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (716, 'renitawahyuniputri33889', 'RENITA WAHYUNI PUTRI', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (717, 'revaliaputriagustina34499', 'REVALIA PUTRI AGUSTINA', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (718, 'sifaniaseptiarini56624', 'SIFANIA SEPTIARINI', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (719, 'sulistiananingsih16605', 'SULISTIANA NINGSIH', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (720, 'valentinochristiangunawan22548', 'VALENTINO CHRISTIAN GUNAWAN', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (721, 'zalvazahriyachaniva549610', 'ZALVA ZAHRIYA CHANIVA', NULL, NULL, '', 3, 1, 3, 11, 18, NULL, '2023-08-10 23:05:04', '2023-08-10 23:05:04', NULL, NULL);
INSERT INTO `users` VALUES (722, 'afnurnadila69245', 'AFNUR NADILA', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (723, 'amaliyanursalsabillah45413', 'AMALIYA NUR SALSABILLAH', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (724, 'anggafirnando51164', 'ANGGA FIRNANDO', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (725, 'avidatulhoiroh77370', 'AVI DATUL HOIROH', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (726, 'chelseamargarethaoliviawulandari38962', 'CHELSEA MARGARETHA OLIVIA WULANDARI', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (727, 'deaputriaurezatulmaqfiroth85387', 'DEA PUTRI AUREZATUL MAQFIROTH', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (728, 'diniauliabahri94660', 'DINI AULIA BAHRI', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (729, 'dwiputriindahwahyuni45965', 'DWI PUTRI INDAH WAHYUNI', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (730, 'firdaseptiawati885310', 'FIRDA SEPTIAWATI', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (731, 'fitriyahshafarinaekaputri12218', 'FITRIYAH SHAFARINA EKA PUTRI', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (732, 'hilmiyanti877210', 'HILMIYANTI', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (733, 'karinatuddiniah50357', 'KARINATUD DINIAH', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (734, 'latifah60763', 'LATIFAH', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (735, 'merymaharaniagustin53880', 'MERY MAHARANI AGUSTIN', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (736, 'mohammadpurwadiansyah67932', 'MOHAMMAD PURWADIANSYAH', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (737, 'putriasih83823', 'PUTRI ASIH', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (738, 'qiqiamelia43840', 'QIQI AMELIA', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (739, 'reta26860', 'RETA', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (740, 'riandinitrisnawaty64800', 'RIANDINI TRISNAWATY', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (741, 'shyerolinemariettalesmana26135', 'SHYEROLINE MARIETTA LESMANA', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (742, 'sitinurhalisa72320', 'SITI NURHALISA', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (743, 'unsiatulmafruroh88218', 'UNSIATUL MAFRUROH', NULL, NULL, '', 3, 1, 3, 11, 19, NULL, '2023-08-10 23:05:24', '2023-08-10 23:05:24', NULL, NULL);
INSERT INTO `users` VALUES (744, 'adibmuhtarmusthofa92166', 'ADIB MUHTAR MUSTHOFA', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (745, 'ahmadfaizabdillah84257', 'AHMAD FAIZ ABDILLAH', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (746, 'alifilyasah73733', 'ALIF ILYASAH', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (747, 'aqiqohtussilvia64779', 'AQIQOHTUS SILVIA', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (748, 'ceciliajoanlimesa18364', 'CECILIA JOAN LIMESA', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (749, 'donitristanto34966', 'DONI TRISTANTO', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (750, 'ferdiansaharisandi12504', 'FERDIANSAH ARISANDI', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (751, 'lisanshidqihersykholidi63429', 'LISAN SHIDQI HERSY KHOLIDI', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (752, 'mochammadhusnulfawaid761810', 'MOCHAMMAD HUSNUL FAWAID', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (753, 'mohammadrizqonelhasani12544', 'MOHAMMAD RIZQON EL HASANI', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (754, 'mohammadtirtadeswantoro45961', 'MOHAMMAD TIRTA DESWANTORO', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (755, 'muhammaddliyaulhaq13829', 'MUHAMMAD DLIYAUL HAQ', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (756, 'muhammadimronmaulidin36708', 'MUHAMMAD IMRON MAULIDIN ', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (757, 'muhammadsaifulfari33943', 'MUHAMMAD SAIFUL FARI', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (758, 'muhammadzainulhaq29672', 'MUHAMMAD ZAINUL HAQ', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (759, 'nurulafifah44644', 'NURUL AFIFAH', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (760, 'nurulhidayah985510', 'NURUL HIDAYAH', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (761, 'sandirezasaputra17545', 'SANDI REZA SAPUTRA', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (762, 'siskadewikumalasari28645', 'SISKA DEWI KUMALA SARI', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (763, 'sittinurholisah854910', 'SITTI NURHOLISAH', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (764, 'soniaanggunsari23447', 'SONIA ANGGUN SARI', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (765, 'usamahroyhansholahuddinalayubi69411', 'USAMAH ROYHAN SHOLAHUDDIN AL AYUBI', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (766, 'verdiansyahyulianwahyusaputra67665', 'VERDIANSYAH YULIAN WAHYU SAPUTRA', NULL, NULL, '', 3, 1, 3, 8, 13, NULL, '2023-08-10 23:05:43', '2023-08-10 23:05:43', NULL, NULL);
INSERT INTO `users` VALUES (767, 'abhistafarrelkaromahhibatullah58201', 'ABHISTA FARREL KAROMAH HIBATULLAH', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (768, 'ahmadabdillahfaza60812', 'AHMAD ABDILLAH FAZA', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (769, 'alifzakylutfiansyah831810', 'ALIF ZAKY LUTFIANSYAH', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (770, 'arilbenisetiawan54919', 'ARIL BENI SETIAWAN', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (771, 'chelotasnimharyono88320', 'CHELO TASNIM HARYONO', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (772, 'davafaranezar78696', 'DAVA FARANEZAR', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (773, 'dimasregaadiwijaya28187', 'DIMAS REGA ADIWIJAYA', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (774, 'harismochammadishak67678', 'HARIS MOCHAMMAD ISHAK', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (775, 'luqmanayawahidansutanto201001', 'LUQMANAYA WAHIDAN SUTANTO', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (776, 'mohammaddavilahakbar40822', 'MOHAMMAD DAVILAH AKBAR', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (777, 'mohammadrayhanzhidad26299', 'MOHAMMAD RAYHAN ZHIDAD', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (778, 'muhammadgufron56455', 'MUHAMMAD GUFRON', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (779, 'muhammadikrom40889', 'MUHAMMAD IKROM', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (780, 'muhammadirfanubaidillah67287', 'MUHAMMAD IRFAN UBAIDILLAH', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (781, 'muhammadmahrus63771', 'MUHAMMAD MAHRUS', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (782, 'putraadityaperkasa61360', 'PUTRA ADITYA PERKASA', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (783, 'radhitiapratamaeffendy43697', 'RADHITIA PRATAMA EFFENDY', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (784, 'rayaghaniyyayuda77336', 'RAYA GHANIYYA YUDA', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (785, 'riskiyantonoavis32289', 'RISKI YANTONO AVIS', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (786, 'rizky495210', 'RIZKY', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (787, 'sitiqomariatulmaulidia59747', 'SITI QOMARIATUL MAULIDIA', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (788, 'tabinafaisapribadi38115', 'TABINA FAISA PRIBADI', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (789, 'teguhwichaksono80173', 'TEGUH WICHAKSONO', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (790, 'wildanzakiamali13133', 'WILDAN ZAKI AMALI', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (791, 'yuviarnuzulramadhani51295', 'YUVIAR NUZUL RAMADHANI', NULL, NULL, '', 3, 1, 3, 7, 12, NULL, '2023-08-10 23:06:31', '2023-08-10 23:06:31', NULL, NULL);
INSERT INTO `users` VALUES (792, 'achmadabdillah64803', 'ACHMAD ABDILLAH', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (793, 'aksinlabibussaid85281', 'AKSIN LABIBUS SAID', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (794, 'anantawidayani79867', 'ANANTA WIDAYANI', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (795, 'arifhidayatullah81388', 'ARIF HIDAYATULLAH', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (796, 'bimasatriapermana74144', 'BIMA SATRIA PERMANA', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (797, 'dafansyahgilangramadhan20435', 'DAFANSYAH GILANG RAMADHAN', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (798, 'dimasnuryadisaputra26367', 'DIMAS NURYADI SAPUTRA', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (799, 'galangsamudraefendi461002', 'GALANG SAMUDRA EFENDI', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (800, 'imammustaqim78357', 'IMAM MUSTAQIM', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (801, 'luqmanulhakim46194', 'LUQMANUL HAKIM', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (802, 'mohammadraditfirmanzah10542', 'MOHAMMAD RADIT FIRMANZAH', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (803, 'muhammadbagasrandiyanto95119', 'MUHAMMAD BAGAS RANDIYANTO', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (804, 'muhammadibnuaqil44126', 'MUHAMMAD IBNU AQIL', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (805, 'muhammadilmirizalwardanasafari30809', 'MUHAMMAD ILMI RIZAL WARDANA SAFARI', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (806, 'muhammadkabidghithraf59428', 'MUHAMMAD KABID GHITHRAF', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (807, 'muhammadzidaneputradeswanto81183', 'MUHAMMAD ZIDANE PUTRA DESWANTO', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (808, 'radhitaunullahassajid89688', 'RADHIT AUNULLAH ASSAJID', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (809, 'rafiaguslaksono26843', 'RAFI AGUS LAKSONO', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (810, 'renomujiorahman29711', 'RENO MUJIO RAHMAN', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (811, 'sitiraudatuljannah83332', 'SITI RAUDATUL JANNAH', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (812, 'sultanfachriaziz75987', 'SULTAN FACHRI AZIZ', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (813, 'wildanalaziz87160', 'WILDAN AL AZIZ', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (814, 'yoanrelouisalphanabiushaziranpermadi67774', 'YOANRE LOUIS ALPHANABIUS HAZIRAN PERMADI', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (815, 'zaskiaafrinakhaliq40665', 'ZASKIA AFRINA KHALIQ', NULL, NULL, '', 3, 1, 3, 7, 24, NULL, '2023-08-10 23:06:49', '2023-08-10 23:06:49', NULL, NULL);
INSERT INTO `users` VALUES (816, 'adimaskurniacandrasaputra181110', 'ADIMAS KURNIA CANDRA SAPUTRA', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (817, 'ahmadcandra27998', 'AHMAD CANDRA', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (818, 'arivaldiwagiyono88948', 'ARIVALDI WAGIYONO', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (819, 'dwiindahkusumaningtyas816910', 'DWI INDAH KUSUMANINGTYAS', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (820, 'dwirezaprasteo31603', 'DWI REZA PRASTEO', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (821, 'edokasyamulya52324', 'EDO KASYA MULYA', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (822, 'fadilfawazulhaq18272', 'FADIL FAWAZUL HAQ', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (823, 'farhanadityasaputra74965', 'FARHAN ADITYA SAPUTRA', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (824, 'firmanputraeffendi98758', 'FIRMAN PUTRA EFFENDI', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (825, 'gadislailiyahmaghfiroh45140', 'GADIS LAILIYAH MAGHFIROH', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (826, 'husnol44793', 'HUSNOL', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (827, 'januarekofirdausrahmatillahi97761', 'JANUAR EKO FIRDAUS RAHMAT ILLAHI', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (828, 'mochamadrifkyputraismie787410', 'MOCHAMAD RIFKY PUTRA ISMIE', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (829, 'mohammadalisalehbanahsan21879', 'MOHAMMAD ALI SALEH BANAHSAN', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (830, 'mohammadarafli14623', 'MOHAMMAD ARAFLI', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (831, 'mohammadfarelevendi61788', 'MOHAMMAD FAREL EVENDI', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (832, 'mohammadrendysyahputra365710', 'MOHAMMAD RENDY SYAHPUTRA', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (833, 'muhamadraflitrianto79691', 'MUHAMAD RAFLI TRIANTO', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (834, 'muhammadbagusprasetyo19497', 'MUHAMMAD BAGUS PRASETYO', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (835, 'muhammadezapandupermanabaidawi84320', 'MUHAMMAD EZA PANDU PERMANA BAIDAWI', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (836, 'muhammadlatifurhobir305710', 'MUHAMMAD LATIFUR HOBIR', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (837, 'muhammadnafronabdimaulana100382', 'MUHAMMAD NAFRON ABDI MAULANA', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (838, 'muhammadzakifarmadi65429', 'MUHAMMAD ZAKI FARMADI', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (839, 'rafaayupprasetyo539510', 'RAFA AYUP PRASETYO', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (840, 'rezanurhariyanto57497', 'REZA NUR HARIYANTO', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (841, 'ributdwiwahyudi15473', 'RIBUT DWI WAHYUDI', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (842, 'rikyriowirawan55520', 'RIKY RIO WIRAWAN', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (843, 'rofirahmadfirmansyach45771', 'ROFI RAHMAD FIRMANSYACH', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (844, 'valdopratama57433', 'VALDO PRATAMA', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (845, 'wahidfebriansyah58407', 'WAHID FEBRIANSYAH', NULL, NULL, '', 3, 1, 3, 5, 8, NULL, '2023-08-10 23:07:03', '2023-08-10 23:07:03', NULL, NULL);
INSERT INTO `users` VALUES (846, 'agilcandraghasmalkhair89884', 'AGIL CANDRA GHASMAL KHAIR', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:20', '2023-08-10 23:07:20', NULL, NULL);
INSERT INTO `users` VALUES (847, 'andikamaulanafirsam69767', 'ANDIKA MAULANA FIRSAM', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:20', '2023-08-10 23:07:20', NULL, NULL);
INSERT INTO `users` VALUES (848, 'dhimasanggaragustifernanda70207', 'DHIMAS ANGGARA GUSTI FERNANDA', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:20', '2023-08-10 23:07:20', NULL, NULL);
INSERT INTO `users` VALUES (849, 'dimasfadillahfajri73899', 'DIMAS FADILLAH FAJRI', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:20', '2023-08-10 23:07:20', NULL, NULL);
INSERT INTO `users` VALUES (850, 'dwikohadishamaulana38410', 'DWIKO HADISHA MAULANA', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:20', '2023-08-10 23:07:20', NULL, NULL);
INSERT INTO `users` VALUES (851, 'ekajulianto76110', 'EKA JULIANTO', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (852, 'fagillolaprihernando85683', 'FAGIL LOLA PRIHERNANDO', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (853, 'fendifebrian12153', 'FENDI FEBRIAN', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (854, 'firmanshah38975', 'FIRMANSHAH', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (855, 'galangresturamadhan40200', 'GALANG RESTU RAMADHAN', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (856, 'isfanfirmanda10872', 'ISFAN FIRMANDA', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (857, 'jizan34663', 'JIZAN', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (858, 'mochammadrizki86357', 'MOCHAMMAD RIZKI', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (859, 'mohammadalviandikahermawan59922', 'MOHAMMAD ALVIANDIKA HERMAWAN', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (860, 'mohammadariesmaulanaarsyadillah53916', 'MOHAMMAD ARIES MAULANA ARSYADILLAH', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (861, 'mohammadiqbal47888', 'MOHAMMAD IQBAL', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (862, 'mohammadzulfankamil66363', 'MOHAMMAD ZULFAN KAMIL', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (863, 'muhammadalihamdani86844', 'MUHAMMAD ALI HAMDANI', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (864, 'muhammadcahyobudiraharjo14493', 'MUHAMMAD CAHYO BUDI RAHARJO', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (865, 'muhammadfabiogustafo33671', 'MUHAMMAD FABIO GUSTAFO', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (866, 'muhammadmahboby869910', 'MUHAMMAD MAHBOBY', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (867, 'muhammadrevalyulianto214910', 'MUHAMMAD REVAL YULIANTO', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (868, 'nurhamsahkusuma79823', 'NUR HAMSAH KUSUMA', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (869, 'rafaerlanggaputracylo13438', 'RAFA ERLANGGA PUTRA CYLO', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (870, 'riantodianmaulana34110', 'RIANTO DIAN MAULANA', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (871, 'ridhofirmansyah61737', 'RIDHO FIRMANSYAH', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (872, 'riobayupratama59478', 'RIO BAYU PRATAMA', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (873, 'sofyanpranata29762', 'SOFYAN PRANATA', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (874, 'violaauliaramadhana37379', 'VIOLA AULIA RAMADHANA', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (875, 'wandiyono28341', 'WANDIYONO', NULL, NULL, '', 3, 1, 3, 5, 9, NULL, '2023-08-10 23:07:21', '2023-08-10 23:07:21', NULL, NULL);
INSERT INTO `users` VALUES (876, 'afifaqudsia22112', 'AFIFA QUDSIA', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:35', '2023-08-10 23:07:35', NULL, NULL);
INSERT INTO `users` VALUES (877, 'aidhaanasyasalfanindia84727', 'AIDHA ANASYA SALFANINDIA', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:35', '2023-08-10 23:07:35', NULL, NULL);
INSERT INTO `users` VALUES (878, 'anisanurramadhani83919', 'ANISA NUR RAMADHANI', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:35', '2023-08-10 23:07:35', NULL, NULL);
INSERT INTO `users` VALUES (879, 'celsiolivia69195', 'CELSI OLIVIA', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:35', '2023-08-10 23:07:35', NULL, NULL);
INSERT INTO `users` VALUES (880, 'dindasafitri16168', 'DINDA SAFITRI', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:35', '2023-08-10 23:07:35', NULL, NULL);
INSERT INTO `users` VALUES (881, 'dwiintanpermadani55590', 'DWI INTAN PERMADANI', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:35', '2023-08-10 23:07:35', NULL, NULL);
INSERT INTO `users` VALUES (882, 'faizahlailatuljamil65165', 'FAIZAH LAILATUL JAMIL', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:35', '2023-08-10 23:07:35', NULL, NULL);
INSERT INTO `users` VALUES (883, 'felantika40220', 'FELANTIKA', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:35', '2023-08-10 23:07:35', NULL, NULL);
INSERT INTO `users` VALUES (884, 'ferdifirdaus75664', 'FERDI FIRDAUS', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:35', '2023-08-10 23:07:35', NULL, NULL);
INSERT INTO `users` VALUES (885, 'hikmatulkhoiriyah74270', 'HIKMATUL KHOIRIYAH', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:35', '2023-08-10 23:07:35', NULL, NULL);
INSERT INTO `users` VALUES (886, 'imroatulalifah22582', 'IMROATUL ALIFAH', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:35', '2023-08-10 23:07:35', NULL, NULL);
INSERT INTO `users` VALUES (887, 'jesitanadiaputri55439', 'JESITA NADIA PUTRI', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:35', '2023-08-10 23:07:35', NULL, NULL);
INSERT INTO `users` VALUES (888, 'jihanbasyarahil16944', 'JIHAN BASYARAHIL', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:35', '2023-08-10 23:07:35', NULL, NULL);
INSERT INTO `users` VALUES (889, 'karimah14390', 'KARIMAH', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:35', '2023-08-10 23:07:35', NULL, NULL);
INSERT INTO `users` VALUES (890, 'muhammadnovalromadhan52405', 'MUHAMMAD NOVAL ROMADHAN', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:35', '2023-08-10 23:07:35', NULL, NULL);
INSERT INTO `users` VALUES (891, 'nailulilmama\'rifah85217', 'NAILUL ILMA MA\'RIFAH', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:35', '2023-08-10 23:07:35', NULL, NULL);
INSERT INTO `users` VALUES (892, 'nefridwijunianti87761', 'NEFRI DWI JUNIANTI', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:35', '2023-08-10 23:07:35', NULL, NULL);
INSERT INTO `users` VALUES (893, 'nindiafaisyasalsaprilia100739', 'NINDIA FAISYA SALSAPRILIA', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:35', '2023-08-10 23:07:35', NULL, NULL);
INSERT INTO `users` VALUES (894, 'novalialunanurazizah51246', 'NOVALIA LUNA NUR AZIZAH', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:36', '2023-08-10 23:07:36', NULL, NULL);
INSERT INTO `users` VALUES (895, 'pingkanayufarokah95956', 'PINGKAN AYU FAROKAH', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:36', '2023-08-10 23:07:36', NULL, NULL);
INSERT INTO `users` VALUES (896, 'putrianggraeny51366', 'PUTRI ANGGRAENY', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:36', '2023-08-10 23:07:36', NULL, NULL);
INSERT INTO `users` VALUES (897, 'safiradwiramadani26994', 'SAFIRA DWI RAMADANI', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:36', '2023-08-10 23:07:36', NULL, NULL);
INSERT INTO `users` VALUES (898, 'selfiadianagustin86919', 'SELFIA DIAN AGUSTIN', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:36', '2023-08-10 23:07:36', NULL, NULL);
INSERT INTO `users` VALUES (899, 'selvianurazizah56758', 'SELVIA NUR AZIZAH', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:36', '2023-08-10 23:07:36', NULL, NULL);
INSERT INTO `users` VALUES (900, 'suryosujono43368', 'SURYO SUJONO', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:36', '2023-08-10 23:07:36', NULL, NULL);
INSERT INTO `users` VALUES (901, 'tarasalsabillanaurakmaputri51452', 'TARA SALSABILLA NAURAKMA PUTRI', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:36', '2023-08-10 23:07:36', NULL, NULL);
INSERT INTO `users` VALUES (902, 'wasyilatulbariroh30785', 'WASYILATUL BARIROH', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:36', '2023-08-10 23:07:36', NULL, NULL);
INSERT INTO `users` VALUES (903, 'windynazaaprilia77619', 'WINDY NAZA APRILIA', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:36', '2023-08-10 23:07:36', NULL, NULL);
INSERT INTO `users` VALUES (904, 'zahraisandria40915', 'ZAHRA ISANDRIA', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:36', '2023-08-10 23:07:36', NULL, NULL);
INSERT INTO `users` VALUES (905, 'zulaykhagheizaazzahra93646', 'ZULAYKHA GHEIZA AZZAHRA', NULL, NULL, '', 3, 1, 2, 3, 5, NULL, '2023-08-10 23:07:36', '2023-08-10 23:07:36', NULL, NULL);
INSERT INTO `users` VALUES (906, 'anydwiyunitaputri99799', 'ANY DWI YUNITA PUTRI', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (907, 'citraulfiazahro32167', 'CITRA ULFIA ZAHRO', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (908, 'desiintananggraeni48937', 'DESI INTAN ANGGRAENI', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (909, 'diahlestariadiningsih13200', 'DIAH LESTARI ADININGSIH', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (910, 'dwifemmynuriladinda21212', 'DWI FEMMY NURIL ADINDA', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (911, 'faizmaulanaishaq81797', 'FAIZ MAULANA ISHAQ', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (912, 'itaaprilia25547', 'ITA APRILIA', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (913, 'jelitadwiseptianti48927', 'JELITA DWI SEPTIANTI', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (914, 'karinanuraini97744', 'KARINA NUR AINI', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (915, 'khalifahselaartanti65467', 'KHALIFAH SELA ARTANTI', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (916, 'lailatulmaghfiroh66994', 'LAILATUL MAGHFIROH', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (917, 'mochamadzainurridwan27486', 'MOCHAMAD ZAINUR RIDWAN', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (918, 'mochammadfarhanseptiansyah712610', 'MOCHAMMAD FARHAN SEPTIANSYAH', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (919, 'mohammadiqbalhibatullah10724', 'MOHAMMAD IQBAL HIBATULLAH', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (920, 'mudrikasalsabilah73431', 'MUDRIKA SALSABILAH', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (921, 'nashifahrosyadahfaiq17474', 'NASHIFAH ROSYADAH FAIQ', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (922, 'nidaputriaafiah56383', 'NIDA PUTRI AAFIAH', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (923, 'nurafnilailiyah59267', 'NURAFNI LAILIYAH', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (924, 'qanitahlailahhaadiahramadhani96761', 'QANITAH LAILAH HAADIAH RAMADHANI', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (925, 'raniahsahdamauizah84815', 'RANIAH SAHDA MAUIZAH', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (926, 'reginaputridwimardah62802', 'REGINA PUTRI DWI MARDAH', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (927, 'retaauliakartika83652', 'RETA AULIA KARTIKA', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (928, 'revacitraaprilia733310', 'REVA CITRA APRILIA', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (929, 'rianganissoraya81904', 'RIANG ANIS SORAYA', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (930, 'rinipratiwisahadatin49603', 'RINI PRATIWI SAHADATIN', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (931, 'salsabilarenatatantri36578', 'SALSABILA RENATA TANTRI', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (932, 'sitinuraini49338', 'SITI NURAINI', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (933, 'wendykurniadirliyantin81492', 'WENDY KURNIA DIRLIYANTIN', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (934, 'yenisintawati24336', 'YENI SINTA WATI', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (935, 'yunitawulansaridewi82193', 'YUNITA WULANSARI DEWI', NULL, NULL, '', 3, 1, 2, 1, 1, NULL, '2023-08-10 23:08:10', '2023-08-10 23:08:10', NULL, NULL);
INSERT INTO `users` VALUES (936, 'abdulwahabsahroni53353', 'ABDUL WAHAB SAHRONI', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (937, 'amirahqonita11441', 'AMIRAH QONITA', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (938, 'anadwiwahyuni609510', 'ANA DWI WAHYUNI', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (939, 'avriliadwinurazizah81544', 'AVRILIA DWI NUR AZIZAH', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (940, 'bellaaprilia59814', 'BELLA APRILIA', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (941, 'bintangrasyailhamiputrawidayana83169', 'BINTANG RASYA ILHAMI PUTRA WIDAYANA', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (942, 'candranurseptiansyah23374', 'CANDRA NUR SEPTIANSYAH', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (943, 'claudiaclaraartanovia70440', 'CLAUDIA CLARA ARTA NOVIA ', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (944, 'derylwidodo80866', 'DERYL WIDODO', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (945, 'dionagusprawoto42424', 'DION AGUS PRAWOTO', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (946, 'elisadiana70904', 'ELISA DIANA', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (947, 'fadilrhomadhona56385', 'FADIL RHOMADHONA', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (948, 'fitriyahlubis91850', 'FITRIYAH LUBIS', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (949, 'indrifitriyani12611', 'INDRI FITRIYANI', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (950, 'intansuciwardani71986', 'INTAN SUCI WARDANI', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (951, 'lasminingsih20971', 'LASMI NINGSIH', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (952, 'latfanhabibi98358', 'LATFAN HABIBI', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (953, 'lianurrahma57771', 'LIA NUR RAHMA', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (954, 'maharanilauranurazizah182810', 'MAHARANI LAURA NUR AZIZAH', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (955, 'meiliza728610', 'MEILIZA', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (956, 'mitaduwikartikasari65921', 'MITA DUWI KARTIKA SARI', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (957, 'mochammadabdurrohim10593', 'MOCHAMMAD ABDURROHIM', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (958, 'mochammadrizal26803', 'MOCHAMMAD RIZAL', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (959, 'muhammadnabil99112', 'MUHAMMAD NABIL', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (960, 'muhammadnurulsetiawan71310', 'MUHAMMAD NURUL SETIAWAN', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (961, 'muhammadriyadiimanullah35381', 'MUHAMMAD RIYADI IMANULLAH', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (962, 'naylarizkifarohah31122', 'NAYLA RIZKI FAROHAH', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (963, 'rajezaliyandriehabibie96338', 'RAJEZ ALIYANDRIE HABIBIE', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (964, 'rifkaamelia87845', 'RIFKA AMELIA', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (965, 'roviqotussa\'adah72694', 'ROVIQOTUS SA\'ADAH', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (966, 'yeniainurrohmah91278', 'YENI AINUR ROHMAH', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (967, 'zahrotussainiah43119', 'ZAHROTUS SAINIAH', NULL, NULL, '', 3, 1, 2, 1, 2, NULL, '2023-08-10 23:08:28', '2023-08-10 23:08:28', NULL, NULL);
INSERT INTO `users` VALUES (968, 'ahmadaburizalalgifari34680', 'AHMAD ABU RIZAL ALGIFARI', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:39', '2023-08-10 23:08:39', NULL, NULL);
INSERT INTO `users` VALUES (969, 'ahmadbaihakiistiandi25819', 'AHMAD BAIHAKI ISTIANDI', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:39', '2023-08-10 23:08:39', NULL, NULL);
INSERT INTO `users` VALUES (970, 'anasabyanpasha56191', 'ANAS ABYAN PASHA', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:39', '2023-08-10 23:08:39', NULL, NULL);
INSERT INTO `users` VALUES (971, 'angelnaisillaazima78995', 'ANGEL NAISILLA AZIMA', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:39', '2023-08-10 23:08:39', NULL, NULL);
INSERT INTO `users` VALUES (972, 'dimaserfandi23102', 'DIMAS ERFANDI', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:40', '2023-08-10 23:08:40', NULL, NULL);
INSERT INTO `users` VALUES (973, 'febriantofalantino97608', 'FEBRIANTO FALANTINO', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:40', '2023-08-10 23:08:40', NULL, NULL);
INSERT INTO `users` VALUES (974, 'hotipusman54116', 'HOTIP USMAN', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:40', '2023-08-10 23:08:40', NULL, NULL);
INSERT INTO `users` VALUES (975, 'maulidyaelzafiandatiar711000', 'MAULIDYA ELZA FIANDATIAR', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:40', '2023-08-10 23:08:40', NULL, NULL);
INSERT INTO `users` VALUES (976, 'mohammadfarisfauzanakbar22536', 'MOHAMMAD FARIS FAUZAN AKBAR', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:40', '2023-08-10 23:08:40', NULL, NULL);
INSERT INTO `users` VALUES (977, 'mohammadrendyprakoso40674', 'MOHAMMAD RENDY PRAKOSO', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:40', '2023-08-10 23:08:40', NULL, NULL);
INSERT INTO `users` VALUES (978, 'mohammadsofyanhalili57784', 'MOHAMMAD SOFYAN HALILI', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:40', '2023-08-10 23:08:40', NULL, NULL);
INSERT INTO `users` VALUES (979, 'muhammadanggaputrapratama66762', 'MUHAMMAD ANGGA PUTRA PRATAMA', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:40', '2023-08-10 23:08:40', NULL, NULL);
INSERT INTO `users` VALUES (980, 'muhammadmuslehromadoni86270', 'MUHAMMAD MUSLEH ROMADONI', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:40', '2023-08-10 23:08:40', NULL, NULL);
INSERT INTO `users` VALUES (981, 'muhammadnorrendra35505', 'MUHAMMAD NORRENDRA', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:40', '2023-08-10 23:08:40', NULL, NULL);
INSERT INTO `users` VALUES (982, 'muhammadrizki10469', 'MUHAMMAD RIZKI', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:40', '2023-08-10 23:08:40', NULL, NULL);
INSERT INTO `users` VALUES (983, 'muhammadshofarelihsan72579', 'MUHAMMAD SHOFAREL IHSAN', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:40', '2023-08-10 23:08:40', NULL, NULL);
INSERT INTO `users` VALUES (984, 'muhammadwiranto64969', 'MUHAMMAD WIRANTO', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:40', '2023-08-10 23:08:40', NULL, NULL);
INSERT INTO `users` VALUES (985, 'muhammadzackyfirdiansyah42977', 'MUHAMMAD ZACKY FIRDIANSYAH', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:40', '2023-08-10 23:08:40', NULL, NULL);
INSERT INTO `users` VALUES (986, 'nazwaalyaputri29222', 'NAZWA ALYA PUTRI', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:40', '2023-08-10 23:08:40', NULL, NULL);
INSERT INTO `users` VALUES (987, 'niaditarahayu97925', 'NIA DITA RAHAYU', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:40', '2023-08-10 23:08:40', NULL, NULL);
INSERT INTO `users` VALUES (988, 'shodiqmahmudi66629', 'SHODIQ MAHMUDI', NULL, NULL, '', 3, 1, 2, 8, 13, NULL, '2023-08-10 23:08:40', '2023-08-10 23:08:40', NULL, NULL);
INSERT INTO `users` VALUES (989, 'abdulmuslih89181', 'ABDUL MUSLIH', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (990, 'achmadfauzan87758', 'ACHMAD FAUZAN', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (991, 'adityaandrewputra64882', 'ADITYA ANDREW PUTRA', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (992, 'alfarezawildananghermawan58900', 'ALFAREZA WILDANANG HERMAWAN', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (993, 'angelinaameliaputri36250', 'ANGELINA AMELIA PUTRI', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (994, 'barepadhiyasta99197', 'BAREP ADHIYASTA', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (995, 'devalovadaniputra471003', 'DEVA LOVADANI PUTRA', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (996, 'falihrahmatullahpratama93269', 'FALIH RAHMATULLAH PRATAMA', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (997, 'fathirgatanalibi68703', 'FATHIR GATAN ALIBI', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (998, 'friyandanadavafirmansyah21728', 'FRIYANDANA DAVA FIRMANSYAH', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (999, 'gandiwibisono89801', 'GANDI WIBISONO', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (1000, 'gilangdharmatectona25411', 'GILANG DHARMA TECTONA', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (1001, 'harisrahmankurniawan20258', 'HARIS RAHMAN KURNIAWAN', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (1002, 'indrasaputra96288', 'INDRA SAPUTRA', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (1003, 'missiyhadiyantoro886510', 'MISSIY HADIYANTORO', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (1004, 'mohakhiffirmansyah29534', 'MOH. AKHIF FIRMANSYAH', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (1005, 'mohrifqinurarifillah15154', 'MOH. RIFQI NUR ARIFILLAH', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (1006, 'mohammadfanynasyithainulyakin52577', 'MOHAMMAD FANY NASYITH AINUL YAKIN', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (1007, 'mohammadilyashidayatullah57792', 'MOHAMMAD ILYAS HIDAYATULLAH', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (1008, 'muhammadadityainsanfadhila17661', 'MUHAMMAD ADITYA INSAN FADHILA', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:56', '2023-08-10 23:08:56', NULL, NULL);
INSERT INTO `users` VALUES (1009, 'muhammaddwifauzan88439', 'MUHAMMAD DWI FAUZAN', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:57', '2023-08-10 23:08:57', NULL, NULL);
INSERT INTO `users` VALUES (1010, 'muhammaddzakisyarif29346', 'MUHAMMAD DZAKI SYARIF', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:57', '2023-08-10 23:08:57', NULL, NULL);
INSERT INTO `users` VALUES (1011, 'muhammadfareldafisaputra26945', 'MUHAMMAD FAREL DAFI SAPUTRA', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:57', '2023-08-10 23:08:57', NULL, NULL);
INSERT INTO `users` VALUES (1012, 'muhammadirfanarrafi56697', 'MUHAMMAD IRFAN AR RAFI', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:57', '2023-08-10 23:08:57', NULL, NULL);
INSERT INTO `users` VALUES (1013, 'muhammadnofal29422', 'MUHAMMAD NOFAL', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:57', '2023-08-10 23:08:57', NULL, NULL);
INSERT INTO `users` VALUES (1014, 'muhammatlukmanulhakimzainulmustafa48653', 'MUHAMMAT LUKMANUL HAKIM ZAINUL MUSTAFA', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:57', '2023-08-10 23:08:57', NULL, NULL);
INSERT INTO `users` VALUES (1015, 'neruanggara335810', 'NERU ANGGARA', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:57', '2023-08-10 23:08:57', NULL, NULL);
INSERT INTO `users` VALUES (1016, 'nikitatiaradwimaulidia100503', 'NIKITA TIARA DWI MAULIDIA', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:57', '2023-08-10 23:08:57', NULL, NULL);
INSERT INTO `users` VALUES (1017, 'raflianfirdausmaulani18163', 'RAFLIAN FIRDAUS MAULANI', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:57', '2023-08-10 23:08:57', NULL, NULL);
INSERT INTO `users` VALUES (1018, 'razantegarafandi62621', 'RAZAN TEGAR AFANDI', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:57', '2023-08-10 23:08:57', NULL, NULL);
INSERT INTO `users` VALUES (1019, 'reskyarsyieal-danial59117', 'RESKY ARSYIE AL-DANIAL', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:57', '2023-08-10 23:08:57', NULL, NULL);
INSERT INTO `users` VALUES (1020, 'rizkymutiarafitri60904', 'RIZKY MUTIARA FITRI', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:57', '2023-08-10 23:08:57', NULL, NULL);
INSERT INTO `users` VALUES (1021, 'satriaalhanilafi55515', 'SATRIA ALHAN ILAFI', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:57', '2023-08-10 23:08:57', NULL, NULL);
INSERT INTO `users` VALUES (1022, 'syauqiuwaimirbahrumputra75445', 'SYAUQI UWAIMIR BAHRUM PUTRA', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:57', '2023-08-10 23:08:57', NULL, NULL);
INSERT INTO `users` VALUES (1023, 'totokpriantonoalramadani82775', 'TOTOK PRIANTONO AL RAMADANI', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:57', '2023-08-10 23:08:57', NULL, NULL);
INSERT INTO `users` VALUES (1024, 'willysuryoantaredha39652', 'WILLY SURYO ANTAREDHA', NULL, NULL, '', 3, 1, 2, 7, 12, NULL, '2023-08-10 23:08:57', '2023-08-10 23:08:57', NULL, NULL);
INSERT INTO `users` VALUES (1025, 'abdulgafur15999', 'ABDUL GAFUR', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1026, 'achmadfauzi76589', 'ACHMAD FAUZI', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1027, 'ahmaddhanifirmansyah11223', 'AHMAD DHANI FIRMANSYAH', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1028, 'ahmadkafabillah63307', 'AHMAD KAFABILLAH', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1029, 'ahmadsifaulqalbi97558', 'AHMAD SIFAUL QALBI', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1030, 'akbarilhamdani691004', 'AKBAR ILHAM DANI', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1031, 'alfitoilhammaulana64222', 'ALFITO ILHAM MAULANA', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1032, 'burhanudinzulfi70330', 'BURHANUDIN ZULFI', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1033, 'damarputrapratamabahtiar21483', 'DAMAR PUTRA PRATAMA BAHTIAR', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1034, 'davidaprilianalvis13517', 'DAVID APRILIAN ALVIS', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1035, 'dedyputrakurniawan97648', 'DEDY PUTRA KURNIAWAN', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1036, 'dikaramadhan78920', 'DIKA RAMADHAN', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1037, 'fikkrihnurrahmansyah97517', 'FIKKRIH NUR RAHMAN SYAH', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1038, 'firmanadiyaksahidayatullah46900', 'FIRMAN ADI YAKSA HIDAYATULLAH', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1039, 'hamdanilarifin72896', 'HAMDANIL ARIFIN', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1040, 'ibroryusronsugiharto25929', 'IBROR YUSRON SUGIHARTO', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1041, 'imamadiarroki42691', 'IMAM ADI ARROKI', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1042, 'lorenchristian53984', 'LOREN CHRISTIAN', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1043, 'maulidiyatrimaliyati20534', 'MAULIDIYA TRI MALIYATI', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1044, 'mochammadaldi51769', 'MOCHAMMAD ALDI', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1045, 'mochammadtirmidzi364010', 'MOCHAMMAD TIRMIDZI', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1046, 'mohammadrenohabibi27384', 'MOHAMMAD RENO HABIBI', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1047, 'muhammadaldoalfiyansyah16765', 'MUHAMMAD ALDO ALFIYANSYAH', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1048, 'muhammadalthafalfansyah69399', 'MUHAMMAD ALTHAF ALFANSYAH', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1049, 'muhammadghazyaljahfal20828', 'MUHAMMAD GHAZY AL JAHFAL', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1050, 'muhammadrezadayyanrismanto37350', 'MUHAMMAD REZA DAYYAN RISMANTO', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1051, 'muhammadtaufiqbalafif67857', 'MUHAMMAD TAUFIQ BALAFIF', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1052, 'muhammadwildantawagkal96249', 'MUHAMMAD WILDAN TAWAGKAL', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1053, 'muwafiqulhobir38399', 'MUWAFIQUL HOBIR', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1054, 'rokhiqilbudiwardiansyah73935', 'ROKHIQIL BUDI WARDIANSYAH', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1055, 'tegardwiabdilaziz27750', 'TEGAR DWI ABDIL AZIZ', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1056, 'vianditaoktameliaputri50336', 'VIANDITA OKTAMELIA PUTRI', NULL, NULL, '', 3, 1, 2, 5, 8, NULL, '2023-08-10 23:09:09', '2023-08-10 23:09:09', NULL, NULL);
INSERT INTO `users` VALUES (1057, 'ahmadrivaldicahyono44211', 'AHMAD RIVALDI CAHYONO', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1058, 'aldosaputra64432', 'ALDO SAPUTRA', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1059, 'amiruttawabhairussa\'i24350', 'AMIRUTTAWAB HAIRUSSA\'I', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1060, 'anggaismapratama70966', 'ANGGA ISMA PRATAMA', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1061, 'aqilakramburhanuddin421009', 'AQIL AKRAM BURHANUDDIN', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1062, 'bintangmaulana50827', 'BINTANG MAULANA', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1063, 'derylasrillahprayudha54828', 'DERYL ASRILLAH PRAYUDHA', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1064, 'ekazulvamunawaroh78807', 'EKA ZULVA MUNAWAROH', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1065, 'galangmaylindopribadi16480', 'GALANG MAYLINDO PRIBADI', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1066, 'irzaahmadabdillah11142', 'IRZA AHMAD ABDILLAH', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1067, 'maulanarafliapriandi74142', 'MAULANA RAFLI APRIANDI', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1068, 'mirzauchmalgani42811', 'MIRZA UCHMAL GANI', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1069, 'mochamadyazidrahmanfadhilah46268', 'MOCHAMAD YAZID RAHMAN FADHILAH', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1070, 'mochammadfarhanalfirdaus31762', 'MOCHAMMAD FARHAN ALFIRDAUS', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1071, 'mohammadfarelhaikalaviz991610', 'MOHAMMAD FAREL HAIKAL AVIZ', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1072, 'mohammadfirdaus63840', 'MOHAMMAD FIRDAUS', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1073, 'mohammadhelmisyarif41510', 'MOHAMMAD HELMI SYARIF', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1074, 'mohammadnovalalierfan18877', 'MOHAMMAD NOVAL ALI ERFAN', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1075, 'mohammadrozikyulianto54742', 'MOHAMMAD ROZIK YULIANTO', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1076, 'muchammadriorufaminjas138510', 'MUCHAMMAD RIO RUFAMINJAS', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1077, 'muhammadderbiandwiputra90834', 'MUHAMMAD DERBIAN DWI PUTRA', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1078, 'muhammadfebri42994', 'MUHAMMAD FEBRI', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1079, 'muhammadgibrilanwar85333', 'MUHAMMAD GIBRIL ANWAR', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1080, 'muhammadrafi85181', 'MUHAMMAD RAFI', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1081, 'mukhammadfarizfaidzin83477', 'MUKHAMMAD FARIZ FAIDZIN', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1082, 'nadakamilahamatulah16368', 'NADA KAMILAH AMATULAH', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1083, 'nicolafathorrosi34862', 'NICOLA FATHORROSI', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:21', '2023-08-10 23:09:21', NULL, NULL);
INSERT INTO `users` VALUES (1084, 'novalariyanto99205', 'NOVAL ARIYANTO', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:22', '2023-08-10 23:09:22', NULL, NULL);
INSERT INTO `users` VALUES (1085, 'nurullah67957', 'NURULLAH', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:22', '2023-08-10 23:09:22', NULL, NULL);
INSERT INTO `users` VALUES (1086, 'prasetiyoalfiandibudiono48140', 'PRASETIYO ALFIANDI BUDIONO', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:22', '2023-08-10 23:09:22', NULL, NULL);
INSERT INTO `users` VALUES (1087, 'sunnymuhlison90902', 'SUNNY MUHLISON', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:22', '2023-08-10 23:09:22', NULL, NULL);
INSERT INTO `users` VALUES (1088, 'syahrulmubaroq47155', 'SYAHRUL MUBAROQ', NULL, NULL, '', 3, 1, 2, 5, 9, NULL, '2023-08-10 23:09:22', '2023-08-10 23:09:22', NULL, NULL);
INSERT INTO `users` VALUES (1089, 'abdialutfianti84959', 'ABDIA LUTFIANTI', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1090, 'achmaddedekputrahardiansah12417', 'ACHMAD DEDEK PUTRA HARDIANSAH', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1091, 'aniwardayanti85218', 'ANI WARDAYANTI', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1092, 'aurelianatasyasalsabila98596', 'AURELIA NATASYA SALSABILA', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1093, 'carolinasulfahbernessa84955', 'CAROLINA SULFAH BERNESSA', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1094, 'cindyafauziyatulkamilah89596', 'CINDYA FAUZIYATUL KAMILAH', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1095, 'deviannisaussholihah25283', 'DEVI ANNISAUSSHOLIHAH', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1096, 'dewinurayu42793', 'DEWI NUR AYU', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1097, 'evysusilowati93814', 'EVY SUSILOWATI', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1098, 'fahriefendi44879', 'FAHRI EFENDI', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1099, 'fatimahdiansafira54106', 'FATIMAH DIAN SAFIRA', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1100, 'finarifhatun73811', 'FINA RIFHATUN', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1101, 'fitrinurfaisyah10464', 'FITRI NUR FAISYAH', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1102, 'imildanofiandira93186', 'IMILDA NOFI ANDIRA', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1103, 'karinaeffendi927510', 'KARINA EFFENDI', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1104, 'kiranagaluhpratiwisantono52596', 'KIRANA GALUH PRATIWI SANTONO', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1105, 'kiraniajenglarasatisantono78985', 'KIRANI AJENG LARASATI SANTONO', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1106, 'lisaamiliya57720', 'LISA AMILIYA', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1107, 'marchelaputriagustin27330', 'MARCHELA PUTRI AGUSTIN', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1108, 'meryameliawidayanti87250', 'MERY AMELIA WIDAYANTI', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1109, 'mykaylanajmilfirdausih86991', 'MY KAYLA NAJMIL FIRDAUSIH', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1110, 'nabilacandradwianggraini90623', 'NABILA CANDRA DWI ANGGRAINI', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1111, 'nurrestiamelia30574', 'NUR RESTI AMELIA', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1112, 'okiramadani47692', 'OKI RAMADANI', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1113, 'riarahmadhaniagustin432110', 'RIA RAHMADHANI AGUSTIN', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1114, 'safiraaprilliaputriazzahra36728', 'SAFIRA APRILLIA PUTRI AZZAHRA', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1115, 'shintyadwivergita61939', 'SHINTYA DWI VERGITA', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1116, 'sintaamelia82300', 'SINTA AMELIA', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1117, 'sitifahria21275', 'SITI FAHRIA', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1118, 'sitinurhasanah31516', 'SITI NUR HASANAH', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1119, 'tiarasalshalaurabila84289', 'TIARA SALSHA LAURA BILA', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1120, 'wulanrobial64811', 'WULAN ROBIAL', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1121, 'yulytadellasabrinaekaputri59959', 'YULYTA DELLA SABRINA EKA PUTRI', NULL, NULL, '', 3, 1, 1, 3, 5, NULL, '2023-08-10 23:09:42', '2023-08-10 23:09:42', NULL, NULL);
INSERT INTO `users` VALUES (1122, 'adityafirmansyah80916', 'ADITYA FIRMANSYAH', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1123, 'alinizzantikadewi95289', 'ALIN IZZANTIKA DEWI', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1124, 'ameliaartalitaputri66414', 'AMELIA ARTALITA PUTRI', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1125, 'ameliarosidi73300', 'AMELIA ROSIDI', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1126, 'anindyacantikakusumadewi57201', 'ANINDYA CANTIKA KUSUMA DEWI', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1127, 'azoravarodisilafifah20335', 'AZORA VARODISIL AFIFAH', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1128, 'cyndifatiharizki93730', 'CYNDI FATIHA RIZKI', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1129, 'dewianggunparamitha72636', 'DEWI ANGGUN PARAMITHA', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1130, 'dwicahyaramadhan12557', 'DWI CAHYA RAMADHAN', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1131, 'ekanurulistiqomah50463', 'EKA NURUL ISTIQOMAH', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1132, 'fransiskanadiaananda98593', 'FRANSISKA NADIA ANANDA', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1133, 'hairulumam981810', 'HAIRUL UMAM', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1134, 'kalinggaalodiakhairani82399', 'KALINGGA ALODIA KHAIRANI', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1135, 'keziadyramalvania46608', 'KEZIA DYRA MALVANIA', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1136, 'khaulahrizkiarini23599', 'KHAULAH RIZKI ARINI', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1137, 'lutfianaazizah47797', 'LUTFIANA AZIZAH', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1138, 'malikaemaelysia73505', 'MALIKA EMA ELYSIA', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1139, 'maulidinaaprilia32637', 'MAULIDINA APRILIA', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1140, 'muhammadzainalabdihusni738310', 'MUHAMMAD ZAINAL ABDI HUSNI', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1141, 'nabilaekasaphira29866', 'NABILA EKA SAPHIRA', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1142, 'novayuniaanggrainie35589', 'NOVA YUNIA ANGGRAINIE', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1143, 'nurhasanah261001', 'NUR HASANAH', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1144, 'ratihyuanitapermatasari82768', 'RATIH YUANITA PERMATASARI', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1145, 'renoaditiyasaputra63807', 'RENO ADITIYA SAPUTRA', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1146, 'rikotriansaputra128210', 'RIKO TRIAN SAPUTRA', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1147, 'risyaadindaagustin16285', 'RISYA ADINDA AGUSTIN', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1148, 'seriltriwahyuni55330', 'SERIL TRI WAHYUNI', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1149, 'silvirawidayanti19716', 'SILVIRA WIDAYANTI', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1150, 'sindinoveliaputri34475', 'SINDI NOVELIA PUTRI', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1151, 'sitifarida92419', 'SITI FARIDA', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1152, 'sitinursalsabila35785', 'SITI NUR SALSABILA', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1153, 'syahrinamaysasaabira94866', 'SYAHRINA MAYSA SAABIRA', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1154, 'wiwinkurniasih19969', 'WIWIN KURNIASIH', NULL, NULL, '', 3, 1, 1, 1, 1, NULL, '2023-08-10 23:09:54', '2023-08-10 23:09:54', NULL, NULL);
INSERT INTO `users` VALUES (1155, 'aidakurniarahmawati31830', 'AIDA KURNIA RAHMAWATI', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1156, 'amandadinisaputri83116', 'AMANDA DINI SAPUTRI', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1157, 'ameliarosdiananingsih49252', 'AMELIA ROSDIANA NINGSIH', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1158, 'andikapratamamaulanaismail194310', 'ANDIKA PRATAMA MAULANA ISMAIL', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1159, 'anggiealifiakurnia64361', 'ANGGIE ALIFIA KURNIA', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1160, 'auliaandini44428', 'AULIA ANDINI', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1161, 'chelsiliadewiayukirana73315', 'CHELSILIA DEWI AYU KIRANA', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1162, 'delhicyetaargadyabrilyantine79996', 'DELHICYETA ARGADYA BRILYANTINE', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1163, 'dianafirdausiah87657', 'DIANA FIRDAUSIAH', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1164, 'fairuzsyifaragildewantari67219', 'FAIRUZ SYIFA RAGIL DEWANTARI', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1165, 'gatothendroprawiro66795', 'GATOT HENDRO PRAWIRO', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1166, 'hilmahriski65886', 'HILMAH RISKI', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1167, 'keyshaputridaniela35437', 'KEYSHA PUTRI DANIELA', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1168, 'khairunnisak71382', 'KHAIRUN NISAK', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1169, 'latifahriskirahayu94163', 'LATIFAH RISKI RAHAYU', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1170, 'maelizulfaturramadhanti82612', 'MAELI ZULFATUR RAMADHANTI', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1171, 'marlaoctaviola80657', 'MARLA OCTA VIOLA', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1172, 'maulinaameliaputri24561', 'MAULINA AMELIA PUTRI', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1173, 'muhammadadityawijaya19353', 'MUHAMMAD ADITYA WIJAYA', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1174, 'nabilhusnulmurad29279', 'NABIL HUSNUL MURAD', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1175, 'natashazathifatulaini71933', 'NATASHA ZATHIFATUL AINI', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1176, 'novitaayuwidyasanesty25111', 'NOVITA AYU WIDYA SANESTY', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1177, 'putrinovitasari12352', 'PUTRI NOVITASARI', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1178, 'rezaauliafebrianti90357', 'REZA AULIA FEBRIANTI', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1179, 'rhamadhanidwiriskygustiawan64539', 'RHAMADHANI DWIRISKY GUSTIAWAN', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1180, 'sasykiranawidyaparamita13537', 'SASY KIRANA WIDYAPARAMITA', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1181, 'silviamaylaniputridewi47850', 'SILVIA MAYLANI PUTRI DEWI', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1182, 'silviyaocthaputrieffendhi33771', 'SILVIYA OCTHA PUTRI EFFENDHI', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1183, 'sisiliaoktaria62808', 'SISILIA OKTARIA', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1184, 'sitiinaratuduja52765', 'SITI INARATU DUJA', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1185, 'sittikarinasilfa63332', 'SITTI KARINA SILFA', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1186, 'windadamaianti63301', 'WINDA DAMAIANTI', NULL, NULL, '', 3, 1, 1, 1, 2, NULL, '2023-08-10 23:10:05', '2023-08-10 23:10:05', NULL, NULL);
INSERT INTO `users` VALUES (1187, 'abimanyu25676', 'ABIMANYU', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1188, 'achmadbasofiewibowo86156', 'ACHMAD BASOFIE WIBOWO', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1189, 'alinalainaabadiyah12495', 'ALIN ALAINA ABADIYAH', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1190, 'andikadwipermana342010', 'ANDIKA DWI PERMANA', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1191, 'andysatria38611', 'ANDY SATRIA', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1192, 'chikaputrikurniawan93792', 'CHIKA PUTRI KURNIAWAN', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1193, 'denimaulanarizki91355', 'DENI MAULANA RIZKI', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1194, 'dewioktafitri717110', 'DEWI OKTA FITRI', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1195, 'dewikafibrianti30740', 'DEWIKA FIBRIANTI', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1196, 'faidatulkarimah247610', 'FAIDATUL KARIMAH', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1197, 'farhanabdillah55108', 'FARHAN ABDILLAH', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1198, 'febriyanputrawijaya50421', 'FEBRIYAN PUTRA WIJAYA', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1199, 'fikaalifiaerfina95287', 'FIKA ALIFIA ERFINA', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1200, 'fitrikurniawati552710', 'FITRI KURNIAWATI', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1201, 'haikalrizkynovaldy47736', 'HAIKAL RIZKY NOVALDY', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1202, 'kevinrivaldiardiansyah29881', 'KEVIN RIVALDI ARDIANSYAH', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1203, 'khoirulanam954110', 'KHOIRUL ANAM', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1204, 'mstioputrawardana86839', 'M STIO PUTRA WARDANA', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1205, 'miyaoktafiya82761', 'MIYA OKTAFIYA', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1206, 'mochammadainnurramadhan45378', 'MOCHAMMAD AINNUR RAMADHAN', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1207, 'mohammadilhamrahmatullah91649', 'MOHAMMAD ILHAM RAHMATULLAH', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1208, 'muhammadarieframadhani54749', 'MUHAMMAD ARIEF RAMADHANI', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1209, 'muhammadfarchanalidris648510', 'MUHAMMAD FARCHAN AL IDRIS', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1210, 'muhammadfikrifirdaus26877', 'MUHAMMAD FIKRI FIRDAUS', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1211, 'muhammadguntur31680', 'MUHAMMAD GUNTUR', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1212, 'muhammadrifa79327', 'MUHAMMAD RIFA', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1213, 'muhammadrivanaffandy67720', 'MUHAMMAD RIVAN AFFANDY', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1214, 'muhammadwildanfardhani75481', 'MUHAMMAD WILDAN FARDHANI', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1215, 'nurulfikri21366', 'NURUL FIKRI', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:18', '2023-08-10 23:10:18', NULL, NULL);
INSERT INTO `users` VALUES (1216, 'rafinurulhidayah22961', 'RAFI NURUL HIDAYAH', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:19', '2023-08-10 23:10:19', NULL, NULL);
INSERT INTO `users` VALUES (1217, 'rivanmeisyahhikmal15189', 'RIVAN MEISYAH HIKMAL', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:19', '2023-08-10 23:10:19', NULL, NULL);
INSERT INTO `users` VALUES (1218, 'saedanicahyaherdiyanto46288', 'SAEDANI CAHYA HERDIYANTO', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:19', '2023-08-10 23:10:19', NULL, NULL);
INSERT INTO `users` VALUES (1219, 'sitinurfadilah40617', 'SITI NUR FADILAH', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:19', '2023-08-10 23:10:19', NULL, NULL);
INSERT INTO `users` VALUES (1220, 'syifasyulusyulizki478010', 'SYIFA SYULUSYUL IZKI', NULL, NULL, '', 3, 1, 1, 8, 13, NULL, '2023-08-10 23:10:19', '2023-08-10 23:10:19', NULL, NULL);
INSERT INTO `users` VALUES (1221, 'abhistaarmediobambangputrapratama865210', 'ABHISTA ARMEDIO BAMBANG PUTRA PRATAMA', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:31', '2023-08-10 23:10:31', NULL, NULL);
INSERT INTO `users` VALUES (1222, 'achmadaramaafianmaulana301005', 'ACHMADA RAMA AFIAN MAULANA', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:31', '2023-08-10 23:10:31', NULL, NULL);
INSERT INTO `users` VALUES (1223, 'ahzariafebrynauerella89445', 'AHZARIA FEBRYN AUERELLA', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:31', '2023-08-10 23:10:31', NULL, NULL);
INSERT INTO `users` VALUES (1224, 'aksalfadilah161210', 'AKSAL FADILAH', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:31', '2023-08-10 23:10:31', NULL, NULL);
INSERT INTO `users` VALUES (1225, 'al-zoraauliaputrahartono36818', 'AL-ZORA AULIA PUTRA HARTONO', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:31', '2023-08-10 23:10:31', NULL, NULL);
INSERT INTO `users` VALUES (1226, 'angguncitradewi22136', 'ANGGUN CITRA DEWI', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:31', '2023-08-10 23:10:31', NULL, NULL);
INSERT INTO `users` VALUES (1227, 'azzahrosafitri27871', 'AZZAHRO SAFITRI', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:31', '2023-08-10 23:10:31', NULL, NULL);
INSERT INTO `users` VALUES (1228, 'bimaanggaraputra60447', 'BIMA ANGGARA PUTRA', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:31', '2023-08-10 23:10:31', NULL, NULL);
INSERT INTO `users` VALUES (1229, 'bimofaisprakoso55387', 'BIMO FAIS PRAKOSO', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:31', '2023-08-10 23:10:31', NULL, NULL);
INSERT INTO `users` VALUES (1230, 'bintangagustianoeffendy44204', 'BINTANG AGUSTIANO EFFENDY', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:31', '2023-08-10 23:10:31', NULL, NULL);
INSERT INTO `users` VALUES (1231, 'bintangzulvianshori34647', 'BINTANG ZULVI ANSHORI', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1232, 'davaagistyan11118', 'DAVA AGISTYAN', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1233, 'dimasfebriansyah27345', 'DIMAS FEBRIANSYAH', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1234, 'fadlurrahmanafifizzuhaq91821', 'FADLURRAHMAN AFIF IZZUHAQ', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1235, 'faithrizqirismanto26197', 'FAITH RIZQI RISMANTO', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1236, 'firstymaylishaputri719210', 'FIRSTY MAYLISHA PUTRI', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1237, 'geniusislahprasasti87215', 'GENIUS ISLAH PRASASTI', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1238, 'josomontahaadityapratama52305', 'JOSO MONTAHA ADITYA PRATAMA', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1239, 'juliadonitasafitri52977', 'JULIA DONITA SAFITRI', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1240, 'kevindradhityawicaksono57767', 'KEVIND RADHITYA WICAKSONO', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1241, 'keyvanorifqiandriansyah11688', 'KEYVANO RIFQI ANDRIANSYAH', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1242, 'mochammadgibranjalalludinyusuf90834', 'MOCHAMMAD GIBRAN JALALLUDIN YUSUF', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1243, 'mohammadrivaldodwimaulana25884', 'MOHAMMAD RIVALDO DWI MAULANA', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1244, 'mohammadsaifulgalang56684', 'MOHAMMAD SAIFUL GALANG', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1245, 'muhammadirwansyah88535', 'MUHAMMAD IRWANSYAH', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1246, 'muhammadseptianurromadhon40195', 'MUHAMMAD SEPTIANUR ROMADHON', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1247, 'nicholaschristiandianto30331', 'NICHOLAS CHRISTIAN DIANTO', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1248, 'nouvalsyahputra38266', 'NOUVAL SYAHPUTRA', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1249, 'nuriskandarwijayaanugrah30503', 'NUR ISKANDAR WIJAYA ANUGRAH', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1250, 'reihanaditiya82103', 'REIHAN ADITIYA', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1251, 'rudisyauqiabdurrozaq41427', 'RUDI SYAUQI ABDUR ROZAQ', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1252, 'septailhamramadhani95940', 'SEPTA ILHAM RAMADHANI', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1253, 'wahyuariajidwiwardana19328', 'WAHYU ARI AJI DWI WARDANA', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1254, 'zackyzidane96643', 'ZACKY ZIDANE', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1255, 'zayyandavinpranaja64938', 'ZAYYAN DAVIN PRANAJA', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1256, 'zulvyakmalfirdaus76106', 'ZULVY AKMAL FIRDAUS', NULL, NULL, '', 3, 1, 1, 7, 12, NULL, '2023-08-10 23:10:32', '2023-08-10 23:10:32', NULL, NULL);
INSERT INTO `users` VALUES (1257, 'abualifalmalikimaulidani96455', 'ABU ALIF ALMALIKI MAULIDANI', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:42', '2023-08-10 23:10:42', NULL, NULL);
INSERT INTO `users` VALUES (1258, 'achmadfauziefendi32245', 'ACHMAD FAUZI EFENDI', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:42', '2023-08-10 23:10:42', NULL, NULL);
INSERT INTO `users` VALUES (1259, 'adityaramadhan11449', 'ADITYA RAMADHAN', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:42', '2023-08-10 23:10:42', NULL, NULL);
INSERT INTO `users` VALUES (1260, 'ahmaddhoni44509', 'AHMAD DHONI', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:42', '2023-08-10 23:10:42', NULL, NULL);
INSERT INTO `users` VALUES (1261, 'alainjameslay41867', 'ALAIN JAMES LAY', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:42', '2023-08-10 23:10:42', NULL, NULL);
INSERT INTO `users` VALUES (1262, 'alfinmaulana70991', 'ALFIN MAULANA', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:42', '2023-08-10 23:10:42', NULL, NULL);
INSERT INTO `users` VALUES (1263, 'andikaapriliansah36144', 'ANDIKA APRILIANSAH', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:42', '2023-08-10 23:10:42', NULL, NULL);
INSERT INTO `users` VALUES (1264, 'apriansyahmandalaputra70310', 'APRIANSYAH MANDALA PUTRA', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:42', '2023-08-10 23:10:42', NULL, NULL);
INSERT INTO `users` VALUES (1265, 'bagusrobianandika48661', 'BAGUS ROBI ANANDIKA', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:42', '2023-08-10 23:10:42', NULL, NULL);
INSERT INTO `users` VALUES (1266, 'chairilramadhaniprawijaya70555', 'CHAIRIL RAMADHANI PRAWIJAYA', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:42', '2023-08-10 23:10:42', NULL, NULL);
INSERT INTO `users` VALUES (1267, 'damaraufadzakypratama92313', 'DAMAR AUFADZAKY PRATAMA', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:42', '2023-08-10 23:10:42', NULL, NULL);
INSERT INTO `users` VALUES (1268, 'davinonuroktavianputra78427', 'DAVINO NUR OKTAVIAN PUTRA', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:42', '2023-08-10 23:10:42', NULL, NULL);
INSERT INTO `users` VALUES (1269, 'farhantaufiqurrachman48679', 'FARHAN TAUFIQURRACHMAN', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:43', '2023-08-10 23:10:43', NULL, NULL);
INSERT INTO `users` VALUES (1270, 'gitoramadani38800', 'GITO RAMADANI', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:43', '2023-08-10 23:10:43', NULL, NULL);
INSERT INTO `users` VALUES (1271, 'ivannurkarimullah511002', 'IVAN NUR KARIMULLAH', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:43', '2023-08-10 23:10:43', NULL, NULL);
INSERT INTO `users` VALUES (1272, 'kevinalfariziwijaya31398', 'KEVIN ALFARIZI WIJAYA', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:43', '2023-08-10 23:10:43', NULL, NULL);
INSERT INTO `users` VALUES (1273, 'marifsetiawan43450', 'M. ARIF SETIAWAN', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:43', '2023-08-10 23:10:43', NULL, NULL);
INSERT INTO `users` VALUES (1274, 'mohfahrurrosi39586', 'MOH FAHRUR ROSI', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:43', '2023-08-10 23:10:43', NULL, NULL);
INSERT INTO `users` VALUES (1275, 'muhammadabihamzah90740', 'MUHAMMAD ABI HAMZAH', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:43', '2023-08-10 23:10:43', NULL, NULL);
INSERT INTO `users` VALUES (1276, 'muhammadfadhilhafizmirza57605', 'MUHAMMAD FADHIL HAFIZ MIRZA', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:43', '2023-08-10 23:10:43', NULL, NULL);
INSERT INTO `users` VALUES (1277, 'muhammadheru94528', 'MUHAMMAD HERU', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:43', '2023-08-10 23:10:43', NULL, NULL);
INSERT INTO `users` VALUES (1278, 'muhammadilhamapriliosamsib62508', 'MUHAMMAD ILHAM APRILIO SAMSIB', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:43', '2023-08-10 23:10:43', NULL, NULL);
INSERT INTO `users` VALUES (1279, 'muhammadmaulanarasyidi57938', 'MUHAMMAD MAULANA RASYIDI', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:43', '2023-08-10 23:10:43', NULL, NULL);
INSERT INTO `users` VALUES (1280, 'muhammadricovirdianto56632', 'MUHAMMAD RICO VIRDIANTO', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:43', '2023-08-10 23:10:43', NULL, NULL);
INSERT INTO `users` VALUES (1281, 'mustofayoga394010', 'MUSTOFA YOGA', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:43', '2023-08-10 23:10:43', NULL, NULL);
INSERT INTO `users` VALUES (1282, 'ramadaniseptyrahmatwijaya62598', 'RAMA DANI SEPTY RAHMAT WIJAYA', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:43', '2023-08-10 23:10:43', NULL, NULL);
INSERT INTO `users` VALUES (1283, 'refiyanadhityafiransyah54124', 'REFIYAN ADHITYA FIRANSYAH', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:43', '2023-08-10 23:10:43', NULL, NULL);
INSERT INTO `users` VALUES (1284, 'rizalriyanto10756', 'RIZAL RIYANTO', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:43', '2023-08-10 23:10:43', NULL, NULL);
INSERT INTO `users` VALUES (1285, 'rizqidwisahranubaidillah60627', 'RIZQI DWI SAHRAN UBAIDILLAH', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:43', '2023-08-10 23:10:43', NULL, NULL);
INSERT INTO `users` VALUES (1286, 'sofyankurniasandi15866', 'SOFYAN KURNIA SANDI', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:43', '2023-08-10 23:10:43', NULL, NULL);
INSERT INTO `users` VALUES (1287, 'subhanbahtiarefendi81541', 'SUBHAN BAHTIAR EFENDI', NULL, NULL, '', 3, 1, 1, 5, 8, NULL, '2023-08-10 23:10:43', '2023-08-10 23:10:43', NULL, NULL);
INSERT INTO `users` VALUES (1288, 'achmadfaizalafandi16131', 'ACHMAD FAIZAL AFANDI', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1289, 'adityakurniawan23466', 'ADITYA KURNIAWAN', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1290, 'ahmaddavaramdhani49443', 'AHMAD DAVA RAMDHANI', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1291, 'ahmadmaulana88326', 'AHMAD MAULANA', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1292, 'alantrimaulana53939', 'ALAN TRI MAULANA', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1293, 'anandagilangsisramadhan402610', 'ANANDA GILANG SIS RAMADHAN', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1294, 'andikhabagussyahputra63286', 'ANDIKHA BAGUS SYAHPUTRA', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1295, 'arifrezekiahammullah60906', 'ARIF REZEKIA HAMMULLAH', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1296, 'bimaeqysetyawan90882', 'BIMA EQY SETYAWAN', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1297, 'christianfredericowaledjewa619310', 'CHRISTIAN FREDERICO WALE DJEWA', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1298, 'darmawansaputra21276', 'DARMAWAN SAPUTRA', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1299, 'diegosamirnasri79948', 'DIEGO SAMIR NASRI', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1300, 'ferdiansyahdwisaputra21604', 'FERDIANSYAH DWI SAPUTRA', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1301, 'iqbalainuddien17104', 'IQBAL AINUDDIEN', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1302, 'julianmosesdomingo79190', 'JULIAN MOSES DOMINGO', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1303, 'leodwiyanto28286', 'LEO DWIYANTO', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1304, 'mfajarardhiyansyah43349', 'M FAJAR ARDHIYANSYAH', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1305, 'mochammadandimaulana708010', 'MOCHAMMAD ANDI MAULANA', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1306, 'mohammadyazidfarhanarifin74338', 'MOHAMMAD YAZID FARHAN ARIFIN', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1307, 'muhammadarinhosnasaputra67533', 'MUHAMMAD ARIN HOSNA SAPUTRA', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1308, 'muhammadgilangfirmanmaulana84311', 'MUHAMMAD GILANG FIRMAN MAULANA', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1309, 'muhammadikbal824710', 'MUHAMMAD IKBAL', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1310, 'muhammadivanfahrozy86932', 'MUHAMMAD IVAN FAHROZY', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1311, 'muhammadyudafirmansyah89469', 'MUHAMMAD YUDA FIRMANSYAH', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1312, 'muhammadzainalabidin745910', 'MUHAMMAD ZAINAL ABIDIN', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1313, 'nandaarifsetyawan81975', 'NANDA ARIF SETYAWAN', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1314, 'rayhansultonsyaifullah54678', 'RAYHAN SULTON SYAIFULLAH', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:00', '2023-08-10 23:11:00', NULL, NULL);
INSERT INTO `users` VALUES (1315, 'reihansaputra75271', 'REIHAN SAPUTRA', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:01', '2023-08-10 23:11:01', NULL, NULL);
INSERT INTO `users` VALUES (1316, 'rizkidwiarhan94973', 'RIZKI DWI ARHAN', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:01', '2023-08-10 23:11:01', NULL, NULL);
INSERT INTO `users` VALUES (1317, 'septiandafafirdaus56311', 'SEPTIAN DAFA FIRDAUS', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:01', '2023-08-10 23:11:01', NULL, NULL);
INSERT INTO `users` VALUES (1318, 'stevanukenzawijaya21464', 'STEVANU KENZA WIJAYA', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:01', '2023-08-10 23:11:01', NULL, NULL);
INSERT INTO `users` VALUES (1319, 'wahyuwagiyanto27430', 'WAHYU WAGIYANTO', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:01', '2023-08-10 23:11:01', NULL, NULL);
INSERT INTO `users` VALUES (1320, 'wildanhamkadzulqarnain33109', 'WILDAN HAMKA DZULQARNAIN', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:01', '2023-08-10 23:11:01', NULL, NULL);
INSERT INTO `users` VALUES (1321, 'zavarelakbarwardanaputra33110', 'ZAVAREL AKBAR WARDANA PUTRA', NULL, NULL, '', 3, 1, 1, 5, 9, NULL, '2023-08-10 23:11:01', '2023-08-10 23:11:01', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wali_kelas
-- ----------------------------
INSERT INTO `wali_kelas` VALUES (1, 1, 1, 1, 5, 1, 1, '2023-08-10 23:14:01', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (2, 1, 1, 2, 47, 1, 1, '2023-08-10 23:14:19', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (3, 1, 2, 3, 13, 1, 1, '2023-08-10 23:14:32', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (4, 1, 2, 4, 56, 1, 1, '2023-08-10 23:14:45', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (5, 1, 3, 5, 57, 1, 1, '2023-08-10 23:15:03', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (6, 1, 4, 6, 62, 1, 1, '2023-08-10 23:15:21', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (7, 1, 4, 7, 64, 1, 1, '2023-08-10 23:15:39', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (8, 1, 5, 8, 41, 1, 1, '2023-08-10 23:15:52', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (9, 1, 5, 9, 20, 1, 1, '2023-08-10 23:16:08', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (10, 1, 6, 10, 70, 1, 1, '2023-08-10 23:16:20', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (11, 1, 6, 11, 27, 1, 1, '2023-08-10 23:16:34', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (12, 1, 7, 12, 9, 1, 1, '2023-08-10 23:16:55', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (13, 1, 8, 13, 16, 1, 1, '2023-08-10 23:17:12', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (14, 2, 1, 1, 46, 1, 1, '2023-08-10 23:17:26', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (15, 2, 1, 2, 21, 1, 1, '2023-08-10 23:17:40', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (16, 2, 2, 3, 54, 1, 1, '2023-08-10 23:18:02', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (17, 2, 2, 4, 6, 1, 1, '2023-08-10 23:18:22', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (18, 2, 3, 5, 59, 1, 1, '2023-08-10 23:18:35', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (19, 2, 4, 6, 11, 1, 1, '2023-08-10 23:18:51', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (20, 2, 4, 7, 32, 1, 1, '2023-08-10 23:19:04', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (21, 2, 5, 8, 76, 1, 1, '2023-08-10 23:19:16', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (22, 2, 5, 9, 79, 1, 1, '2023-08-10 23:19:34', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (23, 2, 6, 10, 35, 1, 1, '2023-08-10 23:19:48', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (24, 2, 6, 11, 8, 1, 1, '2023-08-10 23:20:00', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (25, 2, 7, 12, 24, 1, 1, '2023-08-10 23:20:12', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (26, 2, 8, 13, 83, 1, 1, '2023-08-10 23:20:27', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (27, 3, 9, 14, 48, 1, 1, '2023-08-10 23:20:39', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (28, 3, 9, 15, 34, 1, 1, '2023-08-10 23:20:49', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (29, 3, 10, 16, 33, 1, 1, '2023-08-10 23:21:02', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (30, 3, 10, 17, 50, 1, 1, '2023-08-10 23:21:14', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (31, 3, 11, 18, 53, 1, 1, '2023-08-10 23:21:41', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (32, 3, 11, 19, 55, 1, 1, '2023-08-10 23:21:50', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (33, 3, 12, 20, 63, 1, 1, '2023-08-10 23:22:03', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (34, 3, 12, 21, 61, 1, 1, '2023-08-10 23:22:13', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (35, 3, 5, 8, 78, 1, 1, '2023-08-10 23:22:31', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (36, 3, 5, 9, 14, 1, 1, '2023-08-10 23:22:48', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (37, 3, 13, 22, 68, 1, 1, '2023-08-10 23:23:00', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (38, 3, 13, 23, 69, 1, 1, '2023-08-10 23:23:15', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (39, 3, 7, 12, 72, 1, 1, '2023-08-10 23:23:24', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (40, 3, 7, 24, 23, 1, 1, '2023-08-10 23:23:32', NULL, NULL, NULL);
INSERT INTO `wali_kelas` VALUES (41, 3, 8, 13, 82, 1, 1, '2023-08-10 23:23:42', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
