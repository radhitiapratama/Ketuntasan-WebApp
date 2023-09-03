/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : ketuntasan

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 04/09/2023 04:46:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int NOT NULL,
  `status` int NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE,
  INDEX `admin_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `admin_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 1, 'superadmin', 'Super Admin', '$2y$10$Llb/8B6C1e6YPhCa4nRbVe5/19ZoP4eWSaxOTOpwaX/atO5q5f7by', 1, 1, '2023-09-04 04:21:19', '2023-09-04 04:21:19', 1, NULL);

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for guru
-- ----------------------------
DROP TABLE IF EXISTS `guru`;
CREATE TABLE `guru`  (
  `guru_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int NOT NULL,
  `kode_guru` int NOT NULL,
  `status` int NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`guru_id`) USING BTREE,
  INDEX `guru_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `guru_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of guru
-- ----------------------------
INSERT INTO `guru` VALUES (1, 2, 'malik213', 'Drs. Malik, M.Pd', '$2y$10$omWEN8xJ1InP8ylGRWoFQ.tMh7.htBG12NsQMMTLlvKjRcoO1F8Kq', 2, 1, 1, '2023-09-04 04:39:46', '2023-09-04 04:39:46', 1, NULL);
INSERT INTO `guru` VALUES (2, 3, 'ahmadhamam236', 'Ahmad Hamam Al Fadil, S.Ag', '$2y$10$qLbIYZOUDmnWq.IKLfNxFea3eBh4JBclZxRpJM3NAlfBT649jC2Tq', 2, 2, 1, '2023-09-04 04:39:46', '2023-09-04 04:39:46', 1, NULL);
INSERT INTO `guru` VALUES (3, 4, 'ahmadsalehudin836', 'Akhmad Salehudin, S.Ag', '$2y$10$NjNqvaVKDDsZFZVKKAa.O.HLzSbHz6yt2O.zyXawOvLZyfOnNKmMm', 2, 3, 1, '2023-09-04 04:39:46', '2023-09-04 04:39:46', 1, NULL);
INSERT INTO `guru` VALUES (4, 5, 'ghandy454', 'Moh. Ghandy Y, S.Pdi', '$2y$10$BI6OGIACTr3UqDkcU1yHbuL/Lwjs40H4BsSxlbjnH6eGzeFZswQBa', 2, 4, 1, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `guru` VALUES (5, 6, 'haimron235', 'Haimron, S. PdI', '$2y$10$j8DqRB1g/Hj2s0WgixVyyuSo4zJ.TgiqI1N1JH6M3t7uIo8Wo9xQO', 2, 5, 1, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `guru` VALUES (6, 7, 'abrori3547', 'Muhammad Abrori, S. PdI', '$2y$10$wrvWbzau.YVBm4hr.QBHlOCqSd9kC0/.5LYGIZyQ0RqprB3Mc/Bia', 2, 6, 1, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `guru` VALUES (7, 8, 'supriyadi4518', 'Drs. Supriyadi', '$2y$10$YLERz8W.YZZ.ESjVgUJIt.14N6Wx9HnnagTUhHyQhPiifqh2qrWZS', 2, 7, 1, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `guru` VALUES (8, 9, 'ridwan saidi3547', 'Mohammad Ridwan Saidi, S.Pd', '$2y$10$5NW4asPbGCCyXH19hr945OM/SDnxJlB9USXY2/5a76PVP5107EffW', 2, 8, 1, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `guru` VALUES (9, 10, 'heriwibowo135', 'Triana Heri Wibowo, S.Pd', '$2y$10$ED5ImZ1gB9lB7LsOcRKaHeKwcT30th3ty9BKTGxa/belCqCycqaXu', 2, 9, 1, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `guru` VALUES (10, 11, 'agusirantini551', 'Agus Iriantini, S.Pd', '$2y$10$4zCxU0eQIXY6.77xM9/jGuJVJLNULyDG6suz9rk3ktUnq0t0yNCfq', 2, 10, 1, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `guru` VALUES (11, 12, 'mrx123', 'MR X', '$2y$10$hPqfpzgNwd9EhDFvkqm/JO3ZxhrgluC5nVnMBB6/DM8UGj9ED0l4W', 2, 11, 1, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `guru` VALUES (12, 13, 'citrianilam231', 'Citria Nilam Asri C.W, S.Pd', '$2y$10$ZTw2a5SflM8QwDCdcNA/wuv4lj9Ij85AhML9oh8lm2S8rl2QRz2Q6', 2, 12, 1, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `guru` VALUES (13, 14, 'siswawardani989', 'Siswa Wardani, S. Pd', '$2y$10$2Ss04Ajv32FBhBpV.9YxXeRzVuR2ZSCMCQwpc4s.h2kchOtfWKM.q', 2, 13, 1, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `guru` VALUES (14, 15, 'sripurwati265', 'Sri Purwati, S. Pd', '$2y$10$zp5fbBrI05f32f7V1GRNd.UjsyChyvJhDk6jDtLl/9Fpmce/Ffucm', 2, 14, 1, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `guru` VALUES (15, 16, 'nuningevana108', 'Nuning Evana, S. Pd', '$2y$10$IcpNvv5S.f0mwC8EtGT72uvtZ0BiwJA7rbgw9DbgMWOUhjomU8izS', 2, 15, 1, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `guru` VALUES (16, 17, 'achmadmuzaki1545', 'Achmad Muzakki, S.Pd', '$2y$10$GHsfhSnXSQZynA6VY0JkEO41vQhfFZbdu8V/rBSYkq0Qj2S1527fq', 2, 16, 1, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `guru` VALUES (17, 18, 'meythasuryaningtari0980', 'Meytha Suryaningtari, S.Pd', '$2y$10$NZBw6ahtaIlnPInx56SvqOKgJOAhiPKv4MuIT376DANrGerIWF2Xy', 2, 17, 1, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `guru` VALUES (18, 19, 'didikcahyono1354', 'Drs. Didik Cahyono', '$2y$10$GSPPm8WaFBL43TpG2AczTeeWCRmmvrLL4jIJ/Kr8c5oJlUUzaVh5S', 2, 18, 1, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `guru` VALUES (19, 20, 'dwiarianto1364', 'Drs. Dwi Arianto,M.M', '$2y$10$z./5esLLqhSxYcBxb8K4X.XSYoT/TDUF2y2mcpIqTdZLIK6kgnI.a', 2, 19, 1, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `guru` VALUES (20, 21, 'achsoegianto231', 'Ach. Soegianto, S.Pd', '$2y$10$0YKZ2M.r.yYwK18n.cxe3eKJRpreGlu.DrQi.Yq5X3rciFWDrUxeO', 2, 20, 1, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `guru` VALUES (21, 22, 'deniputra1236', 'Deni Putra Pratama, S.Pd', '$2y$10$DJnYGk6JhGZXjy/cR53kL.9L2whbqMA3EGVdY6iNDN6Gm3fNT/2eC', 2, 21, 1, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `guru` VALUES (22, 23, 'nurkhaefialviah1457', 'Nurkhaefi Alviah, S.Pd', '$2y$10$.CB79yP4YCAc6H8qrIGms.UVjKCISs1R.lbtZyPi427K3jPz4Gfci', 2, 22, 1, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `guru` VALUES (23, 24, 'awhendro1368', 'AW Hendro P W, S.Sn', '$2y$10$b7pdjOtd.B2DJfn7DpB36uKniHFn9FearjR.LX9pS64KLUSh6KWp2', 2, 23, 1, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `guru` VALUES (24, 25, 'ditaageng942', 'Dita Ageng, S. Sn', '$2y$10$fko/Lhxgx0uvFtblfJIA4evDChaTBVvwjN1k2P4B/UZIA8TS/yh2S', 2, 24, 1, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `guru` VALUES (25, 26, 'prabandari1235', 'Prabandari B, S. Pd', '$2y$10$Arm1C9TgYL5G/o1wIJtXQeLQNOHNdv2dMexkyCVuT83i9dy8XzoTO', 2, 25, 1, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `guru` VALUES (26, 27, 'aguswahyudi198', 'Agus Wahyudi, SPd.', '$2y$10$aXhbelGd23y9VRNouTDU5udKrjnp7Hh5hNHBJJmL7c8iy38lcroYG', 2, 26, 1, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `guru` VALUES (27, 28, 'mohaksan1347', 'Mohamad Aksan, S.Pd', '$2y$10$yp.INquYUlhRiWsIt2xc4eiPjQxHyjG2eb3JS.ru1iRx2uVkE3/rm', 2, 27, 1, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `guru` VALUES (28, 29, 'mimiksuripmiyati2361', 'Mimik Suripmiyati, S. Pd', '$2y$10$Kuw8Sl9csYZ3Naio8wAcae6ktZmUACLTdYwc7z/K/4JBJ58aSfNzy', 2, 28, 1, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `guru` VALUES (29, 30, 'wiyono2371', 'Wiyono, S. Pd', '$2y$10$cdPm1cX0MT7/RrKUuEbFFO8IgK4H0sZqhB85yScxtjttyVPuR895y', 2, 29, 1, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `guru` VALUES (30, 31, 'hendrapramana2451', 'Hendra Pramana, S.Pd', '$2y$10$wLfOzBIk7FI7RBLE1Z1gqOIqUZEyMC3.DljV02Z.0e1pgCRiy.YNi', 2, 30, 1, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `guru` VALUES (31, 32, 'aizedjunaidi3461', 'Aized Junaidi, S.Pd', '$2y$10$TKTgN8rOORckUREfGB7JbummwhrLp9VLK/PA0oSqvNTS/rhLi1HOm', 2, 31, 1, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `guru` VALUES (32, 33, 'ruslanhasim4517', 'Ruslan Hasim, S.Pd', '$2y$10$MQpVfkmWvLt7whDH4RX6U.EKtZCb2vlUqxdr0dsV7ZYz4kXiS7Cly', 2, 32, 1, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `guru` VALUES (33, 34, 'ributpaidi1476', 'Ribut Paidi, S.Pd, GR', '$2y$10$GLCRjwKDmgibYu1CKCprPO7AHrt6ndjcQzkO.35LpO6vfx.ogMKES', 2, 33, 1, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `guru` VALUES (34, 35, 'dinitriana0193', 'Dini Triana A, S.Pd', '$2y$10$L9bCUjsDr/S76Pz5ST5GK.RUFrCKhAP0I.iCvvmTR0o7aDdLPjvU.', 2, 34, 1, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `guru` VALUES (35, 36, 'ikapujirahayu582', 'Ika Puji Rahayu, S. Pd', '$2y$10$AGxz1OfzH.JnzZY0icdNVuyAr8guZ2KdRHo1QFPtlXzx9LnvjI89y', 2, 35, 1, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `guru` VALUES (36, 37, 'ellyflorida2471', 'Elly Florida, S.S', '$2y$10$gJ0EXT472EaXDjycftTuoeleWyFilCWb7e2dVnrPetNbkGzuMlkBG', 2, 36, 1, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `guru` VALUES (37, 38, 'arifsubagyo990', 'Arif Subagyo, S.Pd', '$2y$10$XukYhw4i.iiJAfz3iUbtNetOoAhbjU4DfiekgyZJRBO04qKC0q5Lu', 2, 37, 1, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `guru` VALUES (38, 39, 'feny991', 'Dra. Feny', '$2y$10$wQXwxcxWd3u5d4tHI5fthO8BEuH8tOt2t41j4QOv76cRAPHiwaQz.', 2, 38, 1, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `guru` VALUES (39, 40, 'agungrosariyaelinda1928', 'Agung Rosariya Elinda, S.Pd', '$2y$10$h0S4vuH9dry9HH3LGVomoup1lCaMmwvVf3zmbMfFGK8Ti9XUdWVUC', 2, 39, 1, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `guru` VALUES (40, 41, 'hanifahhamzah241', 'Hanifah Hamzah, S. Kom', '$2y$10$ksFSOaYChyWXIwfkAzAqYeWhfBXkcO1KeNMsk5i3ia778Lm./MQCe', 2, 40, 1, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `guru` VALUES (41, 42, 'nanangkristanto234', 'Nanang Kristanto, S.E', '$2y$10$dSHq9ah1hrdd0BZCMgi/TeXMPuY8NpvSWSfofMmt/aZ.DRcn2vwIm', 2, 41, 1, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `guru` VALUES (42, 43, 'rofiatulfauziah245', 'Rofiatul Fauziah, M.Pd', '$2y$10$YJuKcMhspfVswvwU17g9bePEL39s6A.LrjR74WbMzH6wWf6NghHsm', 2, 42, 1, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `guru` VALUES (43, 44, 'yayuksulistyowati174', 'Dra. Yayuk Sulistyowati', '$2y$10$3In8Xl6fHuERD3MJzBLz1eDmxYBhOntlef6dwH5yBmAHTqDoJX97q', 2, 43, 1, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `guru` VALUES (44, 45, 'idhadarojatin245', 'Idha Darojatin, S.Pd', '$2y$10$.ZkH8k4MG9NeTGQbQ94Ruufu3mY5D8uvcT21wjxi/0r1QhjOLDvcO', 2, 44, 1, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `guru` VALUES (45, 46, 'mochyusuf112', 'Moch Yusuf, SE, GR', '$2y$10$63cGPfpu6DdPmugB6Gytk.fkFmHeav1kBCJCA2fxx4fsg/y3PJPHW', 2, 45, 1, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `guru` VALUES (46, 47, 'nurrakhmi497', 'Nur Rakhmi F, S. Pd', '$2y$10$S05YMbq2tOCT3b1gMgWCfOknwxwMPv3FYrMwktna01TvXi27ZMJuO', 2, 46, 1, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `guru` VALUES (47, 48, 'yettiagus1238', 'Yetti Agus K, S. Pd', '$2y$10$b6ZuC8Hgm4MrjZ9BtOZjnOULoaLx.iJTYo1V9uHGo1WH5blaIh4dy', 2, 47, 1, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `guru` VALUES (48, 49, 'lina412', 'Lina, S. Pd', '$2y$10$beHanYSgUrF43.b58BksU.s1uuEBc.jQZC3yuoGvkROfywLIyZ7F2', 2, 48, 1, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `guru` VALUES (49, 50, 'annikdwisudarwatik25', 'Annik Dwi Sudarwatik, S.Pd', '$2y$10$eGIIlfGwsq.EnMGgQ5/XSe8JvF.vrPClsvywbdKGmb9F4ZyqqmLni', 2, 49, 1, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `guru` VALUES (50, 51, 'cherienugraheni2124', 'Cherie Nugraheni, S. Pd', '$2y$10$PcdiVn98wNz65MmTXc2uwe8Mm6NZUk33OS9zJ.nLfXuyNSKRmN35.', 2, 50, 1, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `guru` VALUES (51, 52, 'srihastuti2084', 'Sri Hastuti, SE', '$2y$10$qVKhSXUiNs9fyOugNb215udutGrukZLG//7cJLrN4M46yZsf/kTLi', 2, 51, 1, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `guru` VALUES (52, 53, 'aningretno3508', 'Aning Retno S, SE, MM', '$2y$10$AZuQBQLaUdzClU1rmLQBfOtFOItWqy2NiUu0O7tHRGm6JO6ta7cxC', 2, 52, 1, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `guru` VALUES (53, 54, 'nanangdanirasidi009', 'Nanang Dani Rasidi, M. Pd', '$2y$10$mHkJXZ7jWaMW9EkWcpiluu/liysb/H2O4Ip7MD3dVNtGh.3MZHt.a', 2, 53, 1, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `guru` VALUES (54, 55, 'dwiandri456', 'Dwi Andri H, S. Pd', '$2y$10$2.Vdu9etuSUxlEQPgEeVM.HbeRGTpV4e0ohBGe9XYnoMKwkTcIKKy', 2, 54, 1, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `guru` VALUES (55, 56, 'ofridaningsih998', 'Ofridaningsih, S. Ab', '$2y$10$qZg2YX47HgQoQe5RIjk2/.6wHHP1115Zj9WrOfXh0/q4vAw3vlaB.', 2, 55, 1, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `guru` VALUES (56, 57, 'siticholifah14', 'Siti Cholifah,S.Pd', '$2y$10$pEWN4WsEoXSacrA4VkuRCOTX5D8sExXn4oYBpV1TFxpTuZPnUvxB6', 2, 56, 1, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `guru` VALUES (57, 58, 'zakiyahilmidarajah009', 'Zakiyah Ilmi Darajah, S.Pd', '$2y$10$JtI3cXTHNNssWZ2vaV3rsO7PZNy6eJmUoCc6YdBsb3moi5Z4VM5jK', 2, 57, 1, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `guru` VALUES (58, 59, 'sifaulmunawaroh456', 'Sifaul Munawaroh, S.Pd', '$2y$10$WcbuE4dTQ4y9gTAqbS.qLuYtwnzUDKw0T/BdUcukYm6erKCwd1hAS', 2, 58, 1, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `guru` VALUES (59, 60, 'abdirahman112', 'Abdi Rahman A, S.Pd', '$2y$10$NIfoV2TGawi80wdGI1YMCO/MolPeFlVcoXCjdUhhjCvu0.P.4PbYq', 2, 59, 1, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `guru` VALUES (60, 61, 'rufiindrianti887', 'Rufi Indrianti, S.Pd', '$2y$10$eEFwhgeDsG99ij66i16Kcuy3twLKiI/8PXZbLU08y1KZcSlBzbNvy', 2, 60, 1, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `guru` VALUES (61, 62, 'indahnurhayati001', 'Indah Nurhayati, S.Pd', '$2y$10$fKRVjEBf/b.LQqIHutwcdOuWgN8PwqYT76PsXRhRB6PAQ2idwUFBm', 2, 61, 1, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `guru` VALUES (62, 63, 'nurulfurqoniah126', 'Nurul Furqoniah, M.Pd', '$2y$10$mT8TA/9CLg1GzsznrFBxyej54ZwIAXUpSW82qFU06UXCLxwMXn6Ei', 2, 62, 1, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `guru` VALUES (63, 64, 'ennyyuraida134', 'Enny Yuraida, S.Pd', '$2y$10$QAyft5r2KFQ4kN.aARXDredyxSO9rgoR2hUB.4QJFvWIN7/BPgk6K', 2, 63, 1, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `guru` VALUES (64, 65, 'nettysriwiyanti298', 'Netty Sriwiyanti', '$2y$10$Pr3cTmnceKN2VOeBgeTgd.l.g5Y24bW6M3Kj9Gqhb4dd7kefOnsRO', 2, 64, 1, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `guru` VALUES (65, 66, 'lindaratnasari098', 'Linda Ratnasari, S.Pd', '$2y$10$Y0CFNg7i7qPPIZnOI/OHJucC/Sqbft.maEoM9SWKBpY9fStN.nFeO', 2, 65, 1, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `guru` VALUES (66, 67, 'ekowahyudianto092', 'Eko Wahyudianto, S.Pd', '$2y$10$L6U4xa5nZgq72yXpYL/7t.HBx4EATJC6siNanZDvE6aklGbvG4eMW', 2, 66, 1, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `guru` VALUES (67, 68, 'diankurniawan123', 'Dian Kurniawan, S.Sn', '$2y$10$zhMuwpCnjCHtCiJYGx5VA.WIksRyBmgPxXu0Z5k4cBWQOuyfj2xUK', 2, 67, 1, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `guru` VALUES (68, 69, 'nanangslamet245', 'Nanang Slamet , S. Sn', '$2y$10$Run9APB/apqsTWGdDuxtP.knvlnQ5WwsQlFfqpu5w/fjgJO3IUUx.', 2, 68, 1, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `guru` VALUES (69, 70, 'hendrosetyono990', 'Hendro Setyono, S.Kom', '$2y$10$95rLOWEDdJwsyCM6zF4pfO2AIPF.QJnp0C2KQCvZMruAv9ZmGsAOi', 2, 69, 1, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `guru` VALUES (70, 71, 'linggaadhipraja245', 'Lingga Adhi Praja, ST. MM', '$2y$10$EIdHlv/pcY6X1D.7oQuqY.19suvLBv2CNhodYpkFXNi3rKVH6YrVe', 2, 70, 1, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `guru` VALUES (71, 72, 'ricoarnanda998', 'Rico Arnanda, S.Ds', '$2y$10$4ucZTKV4XHkxUEBw2tvb/u.jOIH75QK7FDiA0wLsSt/Geoo5JV0ES', 2, 71, 1, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `guru` VALUES (72, 73, 'nutriyo445', 'Nutriyo, S.ST', '$2y$10$yZ6uhwyvVCDjKH8xrrOEP.75ctkrKPZe1PjBWB4PfjWF8O.heIVWG', 2, 72, 1, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `guru` VALUES (73, 74, 'hendrakurniawan991', 'Hendra Kurniawan, S.Pd', '$2y$10$roghVdo3cO6spvePMrsA3uBrOxMff0MzAqYjGH8X0vKg.TbNQEZdm', 2, 73, 1, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `guru` VALUES (74, 75, 'iqbalroni122', 'Muchammad Iqbal Roni_x000D_\nSaputra', '$2y$10$MGpNBMG0v3TA3ntL3fhZEOLB8Jasmv9Ir5O2AhjXRpcUWKkQq8OZe', 2, 74, 1, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `guru` VALUES (75, 76, 'abdurrosid991', 'Abdur Rosid, M.Pd', '$2y$10$tE1u2kwbDhJX.x1aEwr..ugUlZ0z2bjZiH7UJMqwl3VMyqaf11JQW', 2, 75, 1, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `guru` VALUES (76, 77, 'juniawansetianto992', 'Juniawan Setianto, S.Si', '$2y$10$GpP1U.05sMC4MK9BLcKrOuZOPNtBtQ7d7UIA/7CDeJVhEQnCtLunq', 2, 76, 1, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `guru` VALUES (77, 78, 'meilidaargitasari990', 'Meilida Argitasari, S.Pd', '$2y$10$u6VwCLVlVGOTK0AJaXA4Pebo3iXkDu9K2cqSWDu5SmGs0EL87pof6', 2, 77, 1, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `guru` VALUES (78, 79, 'mursid112', 'Mursid, S.Kom', '$2y$10$oUUItZbs.A9NipmdJL5Hre3m5ZTNC9jfoH6zglORAHkYiAUPZcPL.', 2, 78, 1, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `guru` VALUES (79, 80, 'sitimudrikatulumayrah11', 'Siti Mudtrikatul Umayrah, S.Pd', '$2y$10$Jg8scyrE0Om0gqKdC8EvHOHv0h64jD8s2XNUtToOyKqWoc0jCt2g.', 2, 79, 1, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `guru` VALUES (80, 81, 'rizqihendrian88', 'M. Rizqi Hendrian P, S.Kom', '$2y$10$ZF44awzZ8/sByCMYGyhCUe6omP7rZwLoNccgML3gK5rWntUWplTRy', 2, 80, 1, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `guru` VALUES (81, 82, 'suciyuniati99', 'Suci Yuniati, S. Sos', '$2y$10$EgrrAasEr.uKQtcQqXPZPupw1UqVYT.sR3JPdMo1s/XS4OxeZVxEO', 2, 81, 1, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `guru` VALUES (82, 83, 'ariffirmansyah90', 'Arif Firmansyah, ST, S. Sn', '$2y$10$FUyKwSp53c70EOY/bBpE8ulwxfEoft6wf0QeA5s0V8qB1LU7OeChu', 2, 82, 1, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `guru` VALUES (83, 84, 'pepiwicaksono88', 'Pepi Wicaksono, S.Sos', '$2y$10$PfHhbhOLTAzQGg5lzo4JWOYRycwNH32D6Lq7TlGEjJJTGEZEbKFFu', 2, 83, 1, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `guru` VALUES (84, 85, 'saleh1456', 'Muhammad Saleh, S.Sn', '$2y$10$4hZeVUdEzZN3/icFT1/yReTbbYnix8T1F/98e/xAIvLudRtERnmMa', 2, 84, 1, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `guru` VALUES (85, 86, 'sitihasanahbolkiah889', 'Siti Hasanah Bolkiah, S.Pd', '$2y$10$meiVWX285nDwLykFbqSAOukgg9ElkUCYa6jT9yK4yo1I4euHhwvz.', 2, 85, 1, '2023-09-04 04:39:54', '2023-09-04 04:39:54', 1, NULL);
INSERT INTO `guru` VALUES (86, 87, 'indhirohfitriandini992', 'Indhiroh Fitriandini, S.Pd', '$2y$10$9EZr2ARdkCACKFAALpOg4euuZpERKdf23YZCMquVX9587lbrrOfy2', 2, 86, 1, '2023-09-04 04:39:54', '2023-09-04 04:39:54', 1, NULL);
INSERT INTO `guru` VALUES (87, 88, 'bambangeko994', 'Bambang Eko Witjaksono, S.Pd', '$2y$10$i0hzxeKU6BS6HuPPe1kkS.4eM3iS6LdDQI9UV7n1X4iuKd/70WrZa', 2, 87, 1, '2023-09-04 04:39:54', '2023-09-04 04:39:54', 1, NULL);
INSERT INTO `guru` VALUES (88, 89, 'leysagiatrikirana88', 'Leysa Giatri Kirana, S.Psi', '$2y$10$nIlwXagxnb7ASRNcmC.fr.SF6hS56NpK4SlSVvJJSeRxqSL3i2Hju', 2, 88, 1, '2023-09-04 04:39:54', '2023-09-04 04:39:54', 1, NULL);
INSERT INTO `guru` VALUES (89, 90, 'vetywulandari575', 'Vety Wulandari, SPd', '$2y$10$fmpCLJg3C7OViiLEpTz3Ju5G09bxtLvPRwyR4rog7j16wAicJSAhm', 2, 89, 1, '2023-09-04 04:39:54', '2023-09-04 04:39:54', 1, NULL);
INSERT INTO `guru` VALUES (90, 91, 'dwiayuliandari889', 'Dwi Ayuliandari, S.Pd', '$2y$10$.Yw3fX0VZXwnef0pmLETXuuo/ceNkGByzHBxQL/aoEIyGcCYViRY6', 2, 90, 1, '2023-09-04 04:39:54', '2023-09-04 04:39:54', 1, NULL);
INSERT INTO `guru` VALUES (91, 92, 'arifdwifebrianto112', 'Arief Dwi Febrianto, S.Pd', '$2y$10$YpFr6jBi71ihsvtUKoXgOuXhBavImX2Bicb8fFOrt4XWX1aBYyGiG', 2, 91, 1, '2023-09-04 04:39:54', '2023-09-04 04:39:54', 1, NULL);

-- ----------------------------
-- Table structure for guru_mapel
-- ----------------------------
DROP TABLE IF EXISTS `guru_mapel`;
CREATE TABLE `guru_mapel`  (
  `guru_mapel_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `guru_id` bigint UNSIGNED NOT NULL,
  `mapel_id` bigint UNSIGNED NOT NULL,
  `kode_guru_mapel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`guru_mapel_id`) USING BTREE,
  INDEX `guru_mapel_guru_id_foreign`(`guru_id`) USING BTREE,
  INDEX `guru_mapel_mapel_id_foreign`(`mapel_id`) USING BTREE,
  CONSTRAINT `guru_mapel_guru_id_foreign` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`guru_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `guru_mapel_mapel_id_foreign` FOREIGN KEY (`mapel_id`) REFERENCES `mapel` (`mapel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of guru_mapel
-- ----------------------------

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
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`jurusan_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jurusan
-- ----------------------------
INSERT INTO `jurusan` VALUES (1, 'Manajemen Perkantoran', 1, '2023-09-04 04:43:42', '2023-09-04 04:43:42', 1, NULL);
INSERT INTO `jurusan` VALUES (2, 'Akuntansi', 1, '2023-09-04 04:43:42', '2023-09-04 04:43:42', 1, NULL);
INSERT INTO `jurusan` VALUES (3, 'Layanan Perbankan', 1, '2023-09-04 04:43:42', '2023-09-04 04:43:42', 1, NULL);
INSERT INTO `jurusan` VALUES (4, 'Bisnis Digital', 1, '2023-09-04 04:43:42', '2023-09-04 04:43:42', 1, NULL);
INSERT INTO `jurusan` VALUES (5, 'Teknik Komputer dan Jaringan', 1, '2023-09-04 04:43:42', '2023-09-04 04:43:42', 1, NULL);
INSERT INTO `jurusan` VALUES (6, 'Desain Komunikasi Visual', 1, '2023-09-04 04:43:42', '2023-09-04 04:43:42', 1, NULL);
INSERT INTO `jurusan` VALUES (7, 'Rekayasa Perangkat Lunak', 1, '2023-09-04 04:43:42', '2023-09-04 04:43:42', 1, NULL);
INSERT INTO `jurusan` VALUES (8, 'Produksi dan Siaran Program Televisi', 1, '2023-09-04 04:43:42', '2023-09-04 04:43:42', 1, NULL);
INSERT INTO `jurusan` VALUES (9, 'Otomatisasi dan Tata Kelola Perkantoran', 1, '2023-09-04 04:43:42', '2023-09-04 04:43:42', 1, NULL);
INSERT INTO `jurusan` VALUES (10, 'Akuntansi dan Keuangan Lembaga', 1, '2023-09-04 04:43:42', '2023-09-04 04:43:42', 1, NULL);
INSERT INTO `jurusan` VALUES (11, 'Perbankan dan Keuangan Mikro', 1, '2023-09-04 04:43:42', '2023-09-04 04:43:42', 1, NULL);
INSERT INTO `jurusan` VALUES (12, 'Bisnis Daring dan Pemasaran', 1, '2023-09-04 04:43:42', '2023-09-04 04:43:42', 1, NULL);
INSERT INTO `jurusan` VALUES (13, 'Multimedia', 1, '2023-09-04 04:43:42', '2023-09-04 04:43:42', 1, NULL);

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
  `created_by` int NULL DEFAULT NULL,
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
  `guru_mapel_id` bigint UNSIGNED NOT NULL,
  `tahun_ajaran_id` bigint UNSIGNED NOT NULL,
  `status` int NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`kelas_mapel_id`) USING BTREE,
  INDEX `kelas_mapel_jurusan_id_foreign`(`jurusan_id`) USING BTREE,
  INDEX `kelas_mapel_kelas_id_foreign`(`kelas_id`) USING BTREE,
  INDEX `kelas_mapel_guru_mapel_id_foreign`(`guru_mapel_id`) USING BTREE,
  INDEX `kelas_mapel_tahun_ajaran_id_foreign`(`tahun_ajaran_id`) USING BTREE,
  CONSTRAINT `kelas_mapel_guru_mapel_id_foreign` FOREIGN KEY (`guru_mapel_id`) REFERENCES `guru_mapel` (`guru_mapel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `kelas_mapel_jurusan_id_foreign` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusan` (`jurusan_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `kelas_mapel_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`kelas_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `kelas_mapel_tahun_ajaran_id_foreign` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajaran` (`tahun_ajaran_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
  `siswa_id` bigint UNSIGNED NOT NULL,
  `kelas_mapel_id` bigint UNSIGNED NOT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tgl_tuntas` timestamp NULL DEFAULT NULL,
  `tuntas` int NOT NULL DEFAULT 0,
  `tahun_ajaran_id` bigint UNSIGNED NOT NULL,
  `semester` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`ketuntasan_id`) USING BTREE,
  INDEX `ketuntasan_siswa_id_foreign`(`siswa_id`) USING BTREE,
  INDEX `ketuntasan_kelas_mapel_id_foreign`(`kelas_mapel_id`) USING BTREE,
  INDEX `ketuntasan_tahun_ajaran_id_foreign`(`tahun_ajaran_id`) USING BTREE,
  CONSTRAINT `ketuntasan_kelas_mapel_id_foreign` FOREIGN KEY (`kelas_mapel_id`) REFERENCES `kelas_mapel` (`kelas_mapel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ketuntasan_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`siswa_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ketuntasan_tahun_ajaran_id_foreign` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajaran` (`tahun_ajaran_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`mapel_id`) USING BTREE,
  UNIQUE INDEX `mapel_nama_mapel_unique`(`nama_mapel`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mapel
-- ----------------------------
INSERT INTO `mapel` VALUES (1, 'PAI dan Budi Pekerti', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (2, 'Pendidikan Pancasila', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (3, 'Mulok Bahasa Daerah Madura', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (4, 'Bahasa Indonesia', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (5, 'Mulok Bahasa Daerah Jawa', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (6, 'Penjas & OR', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (7, 'Sejarah Indonesia', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (8, 'Seni Budaya', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (9, 'Produk/Projek Kreatif dan Kewirausahaan', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (10, 'Sketsa dan Ilustrasi', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (11, 'Projek Ilmu Pengetahuan Alam dan Sosial', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (12, 'Matematika', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (13, 'Mapel Pilihan: Public Speaking', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (14, 'Bahasa Inggris', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (15, 'Informatika', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (16, 'Dasar-dasar Manajemen Perkantoran dan Layanan Bisnis', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (17, 'Teknologi kantor', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (18, 'Produk Kreatif dan Kewirausahaan', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (19, 'Pengelolaan administrasi umum', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (20, 'Otomatisasi Tata Kelola Kepegawaian', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (21, 'Ekonomi dan bisnis', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (22, 'Otomatisasi Tata Kelola Humas dan Keprotokolan', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (23, 'Otomatisasi Tata Kelola Keuangan', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (24, 'Komunikasi di tempat kerja', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (25, 'Pengelolaan kearsipan', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (26, 'Otomatisasi Tata Kelola Sarana dan Prasarana', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (27, 'Layanan Lembaga Perbankan dan Keuangan Mikro', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (28, 'Akuntansi Perbankan dan Keuangan Mikro', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (29, 'Administrasi Pajak', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (30, 'Projek/Produk Kreatif dan Kewirausahaan', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (31, 'Komputer Akuntansi', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (32, 'Akuntansi Keuangan', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (33, 'Ekonomi Bisnis dan Administrasi Umum', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (34, 'Perpajakan', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (35, 'Praktikum Akuntansi Lembaga/ Instansi Pemerintah', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (36, 'Dasar Akuntansi dan Perbankan', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (37, 'Akuntansi Perusahaan Dagang', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (38, 'Praktikum Akuntansi Perusahaan Jasa, Dagang dan Manufacture', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (39, 'Akuntansi Dasar', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (40, 'Aplikasi Pengolah Angka/Spreadsheet', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (41, 'Mapel Pilihan: Microsoft Class', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (42, 'Pemrograman Berorientasi Objek', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (43, 'Bisnis Online', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (44, 'Digital Branding', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (45, 'Projek Kreatif dan Kewirausahaan', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (46, 'Komunikasi bisnis', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (47, 'Pengelolaan Bisnis Ritel', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (48, 'Administrasi Transaksi', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (49, 'Marketing', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (50, 'Dasar-dasar: Perilaku Konsumen dan Pelayanan Penjualan', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (51, 'Penataan Produk', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (52, 'Digital on boarding', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (53, 'Dasar-dasar: Teknologi Pemasaran', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (54, 'Dasar Kreativitas', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (55, 'Prinsip Dasar Komunikasi', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (56, 'Perangkat Lunak Desain', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (57, 'Audio dan Video (K13)', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (58, 'Pemrograman Berbasis Teks, Grafis, dan Multimedia', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (59, 'Pemrograman Web dan Perangkat Bergerak', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (60, 'Desain Multimedia Interaktif (K13)', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (61, 'Mapel Pilihan: Animasi 2D', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (62, 'Dasar DKV', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (63, 'DKV 1', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (64, 'Pemrograman Perangkat Bergerak', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (65, 'Basis Data', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (66, 'Dasar-dasar: Pemrograman Berorientasi Obyek', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (67, 'Dasar-Dasar: Perkembangan Perangkat Lunak dan Pemrograman Prosedural', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (68, 'Pemrograman Web', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (69, 'Teknologi Layanan Jaringan (TLJ)', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (70, 'Perencanaan dan pengalamatan Jaringan (PPJ)', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (71, 'Administrasi Sistem Jaringan (ASJ)', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (72, 'Teknologi Komtel dan Budaya Industri (TKBI)', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (73, 'Teknologi Jaringan Kabel dan Nirkabel (TJKN)', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (74, 'Administrasi Infrastruktur Jaringan', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (75, 'Pemasangan dan Konfigurasi Perangkat Jaringan (PKPJ)', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (76, 'Jaringan Komtel Dasar (JKD)', 1, '2023-09-04 04:23:03', '2023-09-04 04:23:03', 1, NULL);
INSERT INTO `mapel` VALUES (77, 'Cloud Computing', 1, '2023-09-04 04:23:04', '2023-09-04 04:23:04', 1, NULL);
INSERT INTO `mapel` VALUES (78, 'Bisnis Teknik Komtel dan Kewirausahaan (BTKK)', 1, '2023-09-04 04:23:04', '2023-09-04 04:23:04', 1, NULL);
INSERT INTO `mapel` VALUES (79, 'Keamanan Jaringan (KJ)', 1, '2023-09-04 04:23:04', '2023-09-04 04:23:04', 1, NULL);
INSERT INTO `mapel` VALUES (80, 'Mapel Pilihan: Perakitan PC dan Laptop', 1, '2023-09-04 04:23:04', '2023-09-04 04:23:04', 1, NULL);
INSERT INTO `mapel` VALUES (81, 'Dasar-dasar: Produksi Media Audio-Visual dan Industri Kreatif', 1, '2023-09-04 04:23:04', '2023-09-04 04:23:04', 1, NULL);
INSERT INTO `mapel` VALUES (82, 'Produksi Konten Media Televisi', 1, '2023-09-04 04:23:04', '2023-09-04 04:23:04', 1, NULL);
INSERT INTO `mapel` VALUES (83, 'Manajemen Produksi,Penulisan naskah dan Penyutradaraan', 1, '2023-09-04 04:23:04', '2023-09-04 04:23:04', 1, NULL);
INSERT INTO `mapel` VALUES (84, 'Mapel Pilihan: Presenter', 1, '2023-09-04 04:23:04', '2023-09-04 04:23:04', 1, NULL);
INSERT INTO `mapel` VALUES (85, 'Dasar-dasar: Manajemen Produksi Media Digital, Industri Broadcasting dan Film', 1, '2023-09-04 04:23:04', '2023-09-04 04:23:04', 1, NULL);
INSERT INTO `mapel` VALUES (86, 'Dasar-dasar: Pengenalan Produksi Media Audio-Visual dan K3LH', 1, '2023-09-04 04:23:04', '2023-09-04 04:23:04', 1, NULL);
INSERT INTO `mapel` VALUES (87, 'Manajemen Produksi Media Online dan Televisi', 1, '2023-09-04 04:23:04', '2023-09-04 04:23:04', 1, NULL);
INSERT INTO `mapel` VALUES (88, 'Tata Artistik', 1, '2023-09-04 04:23:04', '2023-09-04 04:23:04', 1, NULL);
INSERT INTO `mapel` VALUES (89, 'Kamera, Pencahayaan, dan Tata Suara', 1, '2023-09-04 04:23:04', '2023-09-04 04:23:04', 1, NULL);
INSERT INTO `mapel` VALUES (90, 'Editing Audio dan Video', 1, '2023-09-04 04:23:04', '2023-09-04 04:23:04', 1, NULL);
INSERT INTO `mapel` VALUES (91, 'Produksi dan Pengolahan Audio-Visual Televisi', 1, '2023-09-04 04:23:04', '2023-09-04 04:23:04', 1, NULL);
INSERT INTO `mapel` VALUES (92, 'Mapel Pilihan: Fotografi dan Videografi', 1, '2023-09-04 04:23:04', '2023-09-04 04:23:04', 1, NULL);
INSERT INTO `mapel` VALUES (93, 'Bimbingan Konseling', 1, '2023-09-04 04:23:04', '2023-09-04 04:23:04', 1, NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2010_07_01_000001_create_tahun_ajaran', 1);
INSERT INTO `migrations` VALUES (2, '2010_07_01_032331_create_table_mapel', 1);
INSERT INTO `migrations` VALUES (3, '2010_07_01_032612_create_table_jurusan', 1);
INSERT INTO `migrations` VALUES (4, '2010_07_01_032704_create_table_kelas', 1);
INSERT INTO `migrations` VALUES (5, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (6, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (7, '2015_08_30_082221_create_table_guru', 1);
INSERT INTO `migrations` VALUES (8, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (9, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (10, '2023_07_26_081307_create_table_siswa', 1);
INSERT INTO `migrations` VALUES (11, '2023_07_27_033012_create_table_guru_mapel', 1);
INSERT INTO `migrations` VALUES (12, '2023_07_27_033409_create_kelas_mapel', 1);
INSERT INTO `migrations` VALUES (13, '2023_07_27_033912_create_ketuntasan', 1);
INSERT INTO `migrations` VALUES (14, '2023_07_27_053430_create_wali_kelas', 1);
INSERT INTO `migrations` VALUES (15, '2023_08_02_120432_create_batas_waktu', 1);
INSERT INTO `migrations` VALUES (16, '2023_08_30_082452_create_admin', 1);

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
-- Table structure for siswa
-- ----------------------------
DROP TABLE IF EXISTS `siswa`;
CREATE TABLE `siswa`  (
  `siswa_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tingkatan` int NOT NULL,
  `jurusan_id` bigint UNSIGNED NOT NULL,
  `kelas_id` bigint UNSIGNED NOT NULL,
  `role` int NOT NULL,
  `status` int NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`siswa_id`) USING BTREE,
  INDEX `siswa_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `siswa_jurusan_id_foreign`(`jurusan_id`) USING BTREE,
  INDEX `siswa_kelas_id_foreign`(`kelas_id`) USING BTREE,
  CONSTRAINT `siswa_jurusan_id_foreign` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusan` (`jurusan_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `siswa_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`kelas_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `siswa_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of siswa
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
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`tahun_ajaran_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tahun_ajaran
-- ----------------------------
INSERT INTO `tahun_ajaran` VALUES (1, '2023-2024', 1, 1, '2023-09-04 04:21:19', '2023-09-04 04:21:19', 1, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '2023-09-04 04:21:19', '2023-09-04 04:21:19', 1, NULL);
INSERT INTO `users` VALUES (2, '2023-09-04 04:39:46', '2023-09-04 04:39:46', 1, NULL);
INSERT INTO `users` VALUES (3, '2023-09-04 04:39:46', '2023-09-04 04:39:46', 1, NULL);
INSERT INTO `users` VALUES (4, '2023-09-04 04:39:46', '2023-09-04 04:39:46', 1, NULL);
INSERT INTO `users` VALUES (5, '2023-09-04 04:39:46', '2023-09-04 04:39:46', 1, NULL);
INSERT INTO `users` VALUES (6, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `users` VALUES (7, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `users` VALUES (8, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `users` VALUES (9, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `users` VALUES (10, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `users` VALUES (11, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `users` VALUES (12, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `users` VALUES (13, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `users` VALUES (14, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `users` VALUES (15, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `users` VALUES (16, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `users` VALUES (17, '2023-09-04 04:39:47', '2023-09-04 04:39:47', 1, NULL);
INSERT INTO `users` VALUES (18, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `users` VALUES (19, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `users` VALUES (20, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `users` VALUES (21, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `users` VALUES (22, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `users` VALUES (23, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `users` VALUES (24, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `users` VALUES (25, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `users` VALUES (26, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `users` VALUES (27, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `users` VALUES (28, '2023-09-04 04:39:48', '2023-09-04 04:39:48', 1, NULL);
INSERT INTO `users` VALUES (29, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `users` VALUES (30, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `users` VALUES (31, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `users` VALUES (32, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `users` VALUES (33, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `users` VALUES (34, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `users` VALUES (35, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `users` VALUES (36, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `users` VALUES (37, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `users` VALUES (38, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `users` VALUES (39, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `users` VALUES (40, '2023-09-04 04:39:49', '2023-09-04 04:39:49', 1, NULL);
INSERT INTO `users` VALUES (41, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `users` VALUES (42, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `users` VALUES (43, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `users` VALUES (44, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `users` VALUES (45, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `users` VALUES (46, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `users` VALUES (47, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `users` VALUES (48, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `users` VALUES (49, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `users` VALUES (50, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `users` VALUES (51, '2023-09-04 04:39:50', '2023-09-04 04:39:50', 1, NULL);
INSERT INTO `users` VALUES (52, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `users` VALUES (53, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `users` VALUES (54, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `users` VALUES (55, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `users` VALUES (56, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `users` VALUES (57, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `users` VALUES (58, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `users` VALUES (59, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `users` VALUES (60, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `users` VALUES (61, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `users` VALUES (62, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `users` VALUES (63, '2023-09-04 04:39:51', '2023-09-04 04:39:51', 1, NULL);
INSERT INTO `users` VALUES (64, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `users` VALUES (65, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `users` VALUES (66, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `users` VALUES (67, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `users` VALUES (68, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `users` VALUES (69, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `users` VALUES (70, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `users` VALUES (71, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `users` VALUES (72, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `users` VALUES (73, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `users` VALUES (74, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `users` VALUES (75, '2023-09-04 04:39:52', '2023-09-04 04:39:52', 1, NULL);
INSERT INTO `users` VALUES (76, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `users` VALUES (77, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `users` VALUES (78, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `users` VALUES (79, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `users` VALUES (80, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `users` VALUES (81, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `users` VALUES (82, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `users` VALUES (83, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `users` VALUES (84, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `users` VALUES (85, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `users` VALUES (86, '2023-09-04 04:39:53', '2023-09-04 04:39:53', 1, NULL);
INSERT INTO `users` VALUES (87, '2023-09-04 04:39:54', '2023-09-04 04:39:54', 1, NULL);
INSERT INTO `users` VALUES (88, '2023-09-04 04:39:54', '2023-09-04 04:39:54', 1, NULL);
INSERT INTO `users` VALUES (89, '2023-09-04 04:39:54', '2023-09-04 04:39:54', 1, NULL);
INSERT INTO `users` VALUES (90, '2023-09-04 04:39:54', '2023-09-04 04:39:54', 1, NULL);
INSERT INTO `users` VALUES (91, '2023-09-04 04:39:54', '2023-09-04 04:39:54', 1, NULL);
INSERT INTO `users` VALUES (92, '2023-09-04 04:39:54', '2023-09-04 04:39:54', 1, NULL);

-- ----------------------------
-- Table structure for wali_kelas
-- ----------------------------
DROP TABLE IF EXISTS `wali_kelas`;
CREATE TABLE `wali_kelas`  (
  `wali_kelas_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tingkatan` int NOT NULL,
  `jurusan_id` bigint UNSIGNED NOT NULL,
  `kelas_id` bigint UNSIGNED NOT NULL,
  `guru_id` bigint UNSIGNED NOT NULL,
  `tahun_ajaran_id` bigint UNSIGNED NOT NULL,
  `status` int NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`wali_kelas_id`) USING BTREE,
  INDEX `wali_kelas_jurusan_id_foreign`(`jurusan_id`) USING BTREE,
  INDEX `wali_kelas_kelas_id_foreign`(`kelas_id`) USING BTREE,
  INDEX `wali_kelas_guru_id_foreign`(`guru_id`) USING BTREE,
  INDEX `wali_kelas_tahun_ajaran_id_foreign`(`tahun_ajaran_id`) USING BTREE,
  CONSTRAINT `wali_kelas_guru_id_foreign` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`guru_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wali_kelas_jurusan_id_foreign` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusan` (`jurusan_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wali_kelas_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`kelas_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wali_kelas_tahun_ajaran_id_foreign` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajaran` (`tahun_ajaran_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wali_kelas
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
