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

 Date: 14/09/2023 20:27:37
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 1, 'superadmin', 'Super Admin', '$2y$10$CwmYbH2.n8aY.IiCe./arOGiIHK7x22AQDeAwInqMpK.aht.JaEmS', 1, 1, '2023-09-12 21:02:03', '2023-09-12 21:02:03', 1, NULL);

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of guru
-- ----------------------------
INSERT INTO `guru` VALUES (1, 2, 'malik213', 'Drs. Malik, M.Pd', '$2y$10$JRgEBcdCcsvAvW.htWrhtu/bwcKzZMAqCZRGwKV6Ozjk9Jc7Xh0Cm', 2, 1, 1, '2023-09-12 21:03:09', '2023-09-12 21:03:09', 1, NULL);
INSERT INTO `guru` VALUES (2, 3, 'ahmadhamam236', 'Ahmad Hamam Al Fadil, S.Ag', '$2y$10$zOtVHC0isXPI4hVA5u/m3eAcTIxof.P8AXGy3/t6GeHDvVA9/kPQy', 2, 2, 1, '2023-09-12 21:03:09', '2023-09-12 21:03:09', 1, NULL);
INSERT INTO `guru` VALUES (3, 4, 'ahmadsalehudin836', 'Akhmad Salehudin, S.Ag', '$2y$10$Q0IqtwDYj4NXS9k/is9e9uPidFc4w8V.YuJ4Bcxz548K.QSOllTZ6', 2, 3, 1, '2023-09-12 21:03:09', '2023-09-12 21:03:09', 1, NULL);
INSERT INTO `guru` VALUES (4, 5, 'ghandy454', 'Moh. Ghandy Y, S.Pdi', '$2y$10$HDV.5rW05mNna59b0Cacpud8junbwv2JTlETEXXei.S4Ql0OZJHKC', 2, 4, 1, '2023-09-12 21:03:09', '2023-09-12 21:03:09', 1, NULL);
INSERT INTO `guru` VALUES (5, 6, 'haimron235', 'Haimron, S. PdI', '$2y$10$pkKGhsLYrHSgowvxy3rhI.F3ejCLHdReultfLOLaSwEGULOKf7E22', 2, 5, 1, '2023-09-12 21:03:09', '2023-09-12 21:03:09', 1, NULL);
INSERT INTO `guru` VALUES (6, 7, 'abrori3547', 'Muhammad Abrori, S. PdI', '$2y$10$J87LKIUXhmWTmQ2ssQX3aOQ5UDjdoTDER5xW2XO0s0yoyUVcaaVUu', 2, 6, 1, '2023-09-12 21:03:09', '2023-09-12 21:03:09', 1, NULL);
INSERT INTO `guru` VALUES (7, 8, 'supriyadi4518', 'Drs. Supriyadi', '$2y$10$PYokAvF72TvQG0CdjdNNX.1ZLbRPaAiYSXSydtM4em4WO/IZaeH7K', 2, 7, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (8, 9, 'ridwan saidi3547', 'Mohammad Ridwan Saidi, S.Pd', '$2y$10$nDbzd4r7qyCTTikusJa3I.om4jbHoueOcLHtyjgjZwLzpU/51RYJ2', 2, 8, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (9, 10, 'heriwibowo135', 'Triana Heri Wibowo, S.Pd', '$2y$10$N2C0n.ZWS/LjZvZiGbdXH.GKjQ/fUfxJRrLc4hzGQ.lfAzxk22M8C', 2, 9, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (10, 11, 'agusirantini551', 'Agus Iriantini, S.Pd', '$2y$10$RXInJkmzXdt7DVhwj5L4yug/uG7GM0bMTn8ypY5AaqpH5RjFCYJLG', 2, 10, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (11, 12, 'mrx123', 'MR X', '$2y$10$gyVt7qFmuco1KibkYU7n4OZHFfkUW.CBrJEAgB4zg4Ldl7/9oauvG', 2, 11, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (12, 13, 'citrianilam231', 'Citria Nilam Asri C.W, S.Pd', '$2y$10$S4MwGd8KKxo/H/qsKo/DB.1CatGdOZPowthFUHGuYeetuFtAcLH0m', 2, 12, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (13, 14, 'siswawardani989', 'Siswa Wardani, S. Pd', '$2y$10$47ThKUp/YNK.R23Gzc5xf.81HGZcFWWx.gjbAn./de.vhDCDBG8RG', 2, 13, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (14, 15, 'sripurwati265', 'Sri Purwati, S. Pd', '$2y$10$Bmzy0tItnCiQnk9eL.Pp..VxQl6mTlctLCzjwttPa9R3ZCthISOOW', 2, 14, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (15, 16, 'nuningevana108', 'Nuning Evana, S. Pd', '$2y$10$WopT9tJggDuzWwVsXCR6yeggZogJa9551CWaWm8R.EcwkYzKTVRFi', 2, 15, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (16, 17, 'achmadmuzaki1545', 'Achmad Muzakki, S.Pd', '$2y$10$9EzTaGMwiqaz9OjGkNBLgOdjP.5yRJZ2Czlk8qEMW.5gjz5XF.KCG', 2, 16, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (17, 18, 'meythasuryaningtari0980', 'Meytha Suryaningtari, S.Pd', '$2y$10$Lk20oeRjIZtjiTKn9Mi.ZedzPmPNOG8LX8HdgYD4Y1STBl9d17GAG', 2, 17, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (18, 19, 'didikcahyono1354', 'Drs. Didik Cahyono', '$2y$10$kvOWoUB9diNFQqLdTZAaGukUG/WmGBxM.VyBwh22pZRtHLbRjUl22', 2, 18, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (19, 20, 'dwiarianto1364', 'Drs. Dwi Arianto,M.M', '$2y$10$UYJKbfZxTHbEITNa/E7SVeBFVa8I/ZF1nRNnMk99Z2Uh8zEwNQM2G', 2, 19, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (20, 21, 'achsoegianto231', 'Ach. Soegianto, S.Pd', '$2y$10$i1lJ5srZetrBSow6mYBJDuyieuIlF0OtNAQ8ubgrjz7d24nxXl5Ga', 2, 20, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (21, 22, 'deniputra1236', 'Deni Putra Pratama, S.Pd', '$2y$10$Q5r5t9O2wP28xGpBPJ.X1.z/9PjV29anowFEJ/0vtWlR4bdOJr72e', 2, 21, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (22, 23, 'nurkhaefialviah1457', 'Nurkhaefi Alviah, S.Pd', '$2y$10$7zNXH2o2SrL/.Lhi2wHOzOMLvxRjwolc8p19arYGbLM8.JYlym1mC', 2, 22, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (23, 24, 'awhendro1368', 'AW Hendro P W, S.Sn', '$2y$10$gTCBt1NoEM/P2KpsB7tPAeEOQEyfWbSSJgNBPZlI7dn2e.z.tJDbe', 2, 23, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (24, 25, 'ditaageng942', 'Dita Ageng, S. Sn', '$2y$10$3GkZSxVlG55uQvHFIJL12umIRwCDkVGA5rouQdcBmGABLMcb1V4SS', 2, 24, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (25, 26, 'prabandari1235', 'Prabandari B, S. Pd', '$2y$10$AjZ54IjY3KY2riNxmrjRz.9OllpCkcPozRnfF/7Ltg0gurI.sl5cq', 2, 25, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (26, 27, 'aguswahyudi198', 'Agus Wahyudi, SPd.', '$2y$10$DqxbxV8yFwc6f0BapPr19ufqd1rjZ7pkucJBK/8oeVwv1i173E/CG', 2, 26, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (27, 28, 'mohaksan1347', 'Mohamad Aksan, S.Pd', '$2y$10$UuO/nRrSbjLTIoWsD7SKaeN4yukruhhF9EZSV42rqDqXb36zVPUkG', 2, 27, 1, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `guru` VALUES (28, 29, 'mimiksuripmiyati2361', 'Mimik Suripmiyati, S. Pd', '$2y$10$FlxGQ0SdYfbx4sb08DJo5u9IdRoXyULl3WRGFzU6aYVesN.8UMYgK', 2, 28, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (29, 30, 'wiyono2371', 'Wiyono, S. Pd', '$2y$10$N/pEbLlZq37RchqeSaIlRutP.5cMPWLUQ1X1U597iwJcSrZuguhnu', 2, 29, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (30, 31, 'hendrapramana2451', 'Hendra Pramana, S.Pd', '$2y$10$r/OlPdXLrIroiAHA7CSsM.P/NE0mVgT5w/i.XyzrORKsr0fUgp5Y.', 2, 30, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (31, 32, 'aizedjunaidi3461', 'Aized Junaidi, S.Pd', '$2y$10$vWuBZ.MTWBWgASL9r0OiNumq9o9C86qsNk1504oKcAa1vdTefxVFG', 2, 31, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (32, 33, 'ruslanhasim4517', 'Ruslan Hasim, S.Pd', '$2y$10$DRjpS8/s/If4DVkI/9/Bd./.Tm8p4PMXPInn.rDRn.0U7gkGpupWK', 2, 32, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (33, 34, 'ributpaidi1476', 'Ribut Paidi, S.Pd, GR', '$2y$10$VD01bX/9haso9C0Fpvr9fuLsyXnE8fQ6h0fb8QR0qqBPgwkESg8EO', 2, 33, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (34, 35, 'dinitriana0193', 'Dini Triana A, S.Pd', '$2y$10$8jXR/KPd6J1kQe6Cg2hAPe8hph5Aqdk3FkX58tX0.3E4eIQXeqEu2', 2, 34, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (35, 36, 'ikapujirahayu582', 'Ika Puji Rahayu, S. Pd', '$2y$10$O9a8PuwHr.rphw7HjaWlCulYzbqyr1/HKxRDAjXZV/xQSKHnPxqfS', 2, 35, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (36, 37, 'ellyflorida2471', 'Elly Florida, S.S', '$2y$10$1P2x0jSdyaHmH24wSTY67eepqeBm5csDe1KHmUC6iVjYZXP3IVk1C', 2, 36, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (37, 38, 'arifsubagyo990', 'Arif Subagyo, S.Pd', '$2y$10$wmF9HXUOPw1pkZeJpErrCOYj/mKjs7TOh.wG3I9LGmEQn7D7QPOsS', 2, 37, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (38, 39, 'feny991', 'Dra. Feny', '$2y$10$vRuJ8jGra.E69eTvlqbFOOGSuRn.bosFCczZcNtgO0buc3FyCiCKG', 2, 38, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (39, 40, 'agungrosariyaelinda1928', 'Agung Rosariya Elinda, S.Pd', '$2y$10$7bRkocemF8pkKjOxEI7yzetVE3h6Fi0zUjt9Bpn37.lBwJKatO2Em', 2, 39, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (40, 41, 'hanifahhamzah241', 'Hanifah Hamzah, S. Kom', '$2y$10$r3.5UiSX1L3nxZkp2lDPR.qXOe1SouXqJQ.a4z7g0HnVUZLIQUoSG', 2, 40, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (41, 42, 'nanangkristanto234', 'Nanang Kristanto, S.E', '$2y$10$eLUcKq02UAm/V4/TMfR7he6ZLw/T246n7NYi/Z0eYfbbXPZSUp7gi', 2, 41, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (42, 43, 'rofiatulfauziah245', 'Rofiatul Fauziah, M.Pd', '$2y$10$qn7HS2BxRCfSwbq/tRaYG.NJyCwLo6I6xQ143wFMo56JVzK6r7BOa', 2, 42, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (43, 44, 'yayuksulistyowati174', 'Dra. Yayuk Sulistyowati', '$2y$10$rtjW2u8143htyxPYZozazepAjOzZlEN5UVTr.H8Vsnsza0yqDGhN2', 2, 43, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (44, 45, 'idhadarojatin245', 'Idha Darojatin, S.Pd', '$2y$10$WMUe78yAavq1wdUhED5UkOvNVUzcxmEs9IVx995t9soKE8KlVOMO6', 2, 44, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (45, 46, 'mochyusuf112', 'Moch Yusuf, SE, GR', '$2y$10$peZ/zjC4W/ePjyKZ2ZxEXOxFa/ewOJtyOIhlue9K9eUg4YkNMguna', 2, 45, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (46, 47, 'nurrakhmi497', 'Nur Rakhmi F, S. Pd', '$2y$10$2ytmcOiwhlD5L.Li3AGLpeoLgVaLPJjQ2y3GQ2inU6V0hoP9KWbYK', 2, 46, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (47, 48, 'yettiagus1238', 'Yetti Agus K, S. Pd', '$2y$10$L4rbyNY.UFOk9tkLdw9ajuwxo2sJmNXwqg/i5Ci4qAvTFttGiiRQ.', 2, 47, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (48, 49, 'lina412', 'Lina, S. Pd', '$2y$10$dI9loSBx71rSuTrBj1wLG.iXvcJh/r2SmNs/X6gflNCYnyEq1yO16', 2, 48, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (49, 50, 'annikdwisudarwatik25', 'Annik Dwi Sudarwatik, S.Pd', '$2y$10$/t9djXOytzY6/tA2rmPjcOtX4tuHeXYV4DOHqFVxaGbKqGch7qlSq', 2, 49, 1, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `guru` VALUES (50, 51, 'cherienugraheni2124', 'Cherie Nugraheni, S. Pd', '$2y$10$3H1dek5smpj9XvV64J0uMOZKirqpv9xeOf2Nvfnrn/pmMyxW.0KdG', 2, 50, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (51, 52, 'srihastuti2084', 'Sri Hastuti, SE', '$2y$10$6V/ASeilhFUdI6XJU2EPdOfClT9W9jY1n07bZ3dp59NtpKsJ5eg6a', 2, 51, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (52, 53, 'aningretno3508', 'Aning Retno S, SE, MM', '$2y$10$lI6n3QQGZh4fJbrW4HQVtucOPXOJHZT.QBQVTdNAI.s2noY7H/iKS', 2, 52, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (53, 54, 'nanangdanirasidi009', 'Nanang Dani Rasidi, M. Pd', '$2y$10$Cv/Ze0FdJsnSgNUlrWQKP.MKHc0PP8JQ4S8qcdSKnzWN9MdtKq7pa', 2, 53, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (54, 55, 'dwiandri456', 'Dwi Andri H, S. Pd', '$2y$10$QkK0uVIwA/qeqfv/X5XtdukfOvFv9Ktb/hTGmfc3pulHqBq2N920i', 2, 54, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (55, 56, 'ofridaningsih998', 'Ofridaningsih, S. Ab', '$2y$10$85OlA5CDnnOn/6Qh6/LzmOwKDigoKkKQgNwTxwxK1Bb9cVfBzjMQ.', 2, 55, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (56, 57, 'siticholifah14', 'Siti Cholifah,S.Pd', '$2y$10$yJ2m.NPKCNZ.azU7cB1Ud.kR5VR6cYKxZXPQxLO6SKtut.Y27wR/a', 2, 56, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (57, 58, 'zakiyahilmidarajah009', 'Zakiyah Ilmi Darajah, S.Pd', '$2y$10$z4Nz0.ds6PXK4uvYDFKEV.Lp2cNipFPJ87X.VX59HszYAX9x12AZi', 2, 57, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (58, 59, 'sifaulmunawaroh456', 'Sifaul Munawaroh, S.Pd', '$2y$10$vPugBSLRMUPj5nPd5/CcvevqgGul63m6TPCGznJWdic3SQ2MYlD4K', 2, 58, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (59, 60, 'abdirahman112', 'Abdi Rahman A, S.Pd', '$2y$10$RmDRA21o4hSN/k7poAIKe.s7QBwRuxuDJDj9nOHeXqM88zf4yLZQq', 2, 59, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (60, 61, 'rufiindrianti887', 'Rufi Indrianti, S.Pd', '$2y$10$Emp8AN6dEABrGRvVTo00nOg8Q57prvl15s5X3w1cWzaqx99Ii5BRC', 2, 60, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (61, 62, 'indahnurhayati001', 'Indah Nurhayati, S.Pd', '$2y$10$hp4mmAw9mZV4uwtfCBfQ9uerdFvb9mjuikWayrJfoosppXwjo1a26', 2, 61, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (62, 63, 'nurulfurqoniah126', 'Nurul Furqoniah, M.Pd', '$2y$10$TGu16mVsMatYxa8cT9mpR.3pDn4SB49ukuTu3xj7zXk5v5gUByRdy', 2, 62, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (63, 64, 'ennyyuraida134', 'Enny Yuraida, S.Pd', '$2y$10$E5VzKJ1iIFOpG4mhwgSUWumqG9PSdk5vpwh2A5OJ4sDUbcoPnEyGC', 2, 63, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (64, 65, 'nettysriwiyanti298', 'Netty Sriwiyanti', '$2y$10$0g0Oh3exYobC7AFt.RvcH.lPLmPnns7Iohz523DQMWSJuJpxTa/1C', 2, 64, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (65, 66, 'lindaratnasari098', 'Linda Ratnasari, S.Pd', '$2y$10$0gr2YvBwjckYp6qsQpoy6uAjpLYa34W7SiXFa2KdzWtXq0Wd75oqa', 2, 65, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (66, 67, 'ekowahyudianto092', 'Eko Wahyudianto, S.Pd', '$2y$10$6rSW/SvYdkfvXyysQMgLkOnTX.c8lVike48LgYlzv35nNb2crvxny', 2, 66, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (67, 68, 'diankurniawan123', 'Dian Kurniawan, S.Sn', '$2y$10$ZnYmSnz8EdnA6NV3hu0JvuU9J3aezY650ntDPjIAAyFL1tuqGPClm', 2, 67, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (68, 69, 'nanangslamet245', 'Nanang Slamet , S. Sn', '$2y$10$JsDOgCkjQcbHRJ5fcAeqRuyJcdeCMdtP0gd9ZowhPtKwVJkL4IIfO', 2, 68, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (69, 70, 'hendrosetyono990', 'Hendro Setyono, S.Kom', '$2y$10$XKdZUW9AeebqDehx3iDvIOlpdUZDZXJ32.BurFh/tx0ehhY8b05Am', 2, 69, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (70, 71, 'linggaadhipraja245', 'Lingga Adhi Praja, ST. MM', '$2y$10$9oqIy1OyMfJePo1ujGCQFes2XwKSgPH1Df2A8oMnqRsxsJsLlVeL6', 2, 70, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (71, 72, 'ricoarnanda998', 'Rico Arnanda, S.Ds', '$2y$10$NOwYkGlKmsb0rEuk3No6SOOrpeb0MyUoJFJfto6jsKqle2D.RxMrO', 2, 71, 1, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `guru` VALUES (72, 73, 'nutriyo445', 'Nutriyo, S.ST', '$2y$10$Zpr6KKKQFRGcqJ33lZnH0u5RUU9Nvo7O8J1af1IUPfwfroSeA5Nnm', 2, 72, 1, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `guru` VALUES (73, 74, 'hendrakurniawan991', 'Hendra Kurniawan, S.Pd', '$2y$10$yM3DStgXMojTkTCZNo8PaO6OXlZEa0Boe0ujQbJPv50dO5ss27Rly', 2, 73, 1, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `guru` VALUES (74, 75, 'iqbalroni122', 'Muchammad Iqbal Roni Saputra', '$2y$10$ZuVTglDb0GY6WNAo6VdhKO4EmmmJK1zpH6VJOyziITNV3jzfrr9cS', 2, 74, 1, '2023-09-12 21:03:13', '2023-09-14 20:24:17', 1, NULL);
INSERT INTO `guru` VALUES (75, 76, 'abdurrosid991', 'Abdur Rosid, M.Pd', '$2y$10$r/HOM6bQ.sP.0NUPVSMZLu.k4iP4NoqGMwNX9YsVWMTXnYe2HXk/G', 2, 75, 1, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `guru` VALUES (76, 77, 'juniawansetianto992', 'Juniawan Setianto, S.Si', '$2y$10$t078ZpWWJlM9opGZQYQA7OxrhAsChoYJkd3q6uol5PBOAv5HHxNKy', 2, 76, 1, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `guru` VALUES (77, 78, 'meilidaargitasari990', 'Meilida Argitasari, S.Pd', '$2y$10$pt3jWY8lJWu.NLk7v0.Q8.lmm5Xau7w9/xapIf3v1cat9CtI3PSQm', 2, 77, 1, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `guru` VALUES (78, 79, 'mursid112', 'Mursid, S.Kom', '$2y$10$6jP2Op51kh0UgDM0ECD3OO//LDMZwFt39D0RSCWbur8EFW149t1Ye', 2, 78, 1, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `guru` VALUES (79, 80, 'sitimudrikatulumayrah11', 'Siti Mudtrikatul Umayrah, S.Pd', '$2y$10$dx5Vh25uot84tzbMtnaL7.cSDBq3vBcuRJxAu9ngtXWfDjiutC/H2', 2, 79, 1, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `guru` VALUES (80, 81, 'rizqihendrian88', 'M. Rizqi Hendrian P, S.Kom', '$2y$10$Wp4VSfvQm6zS/k3w4BRoM.4lGMneJSV3wxPVMyU9XtG5/TvVmCpu2', 2, 80, 1, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `guru` VALUES (81, 82, 'suciyuniati99', 'Suci Yuniati, S. Sos', '$2y$10$1yf61yLWZyLjDtxSC8Z.N.CZtGyO1mBZdfbI56Y7isY43jb3vbh4C', 2, 81, 1, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `guru` VALUES (82, 83, 'ariffirmansyah90', 'Arif Firmansyah, ST, S. Sn', '$2y$10$h7CVUnDzWLMU75zKsEfnze0KmPp0E5ZORgX4qlIpRzjxlFRNOx03C', 2, 82, 1, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `guru` VALUES (83, 84, 'pepiwicaksono88', 'Pepi Wicaksono, S.Sos', '$2y$10$Xc1JMPgwlYvLsSVoYzk4TeOZQxQhaFOWciWKDCybscqMfdjHhCkFK', 2, 83, 1, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `guru` VALUES (84, 85, 'saleh1456', 'Muhammad Saleh, S.Sn', '$2y$10$.CpWk1snd58I/hQVq9jj4uB12CkoOK9oQcSSFPVxD11t4hw8jZVFy', 2, 84, 1, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `guru` VALUES (85, 86, 'sitihasanahbolkiah889', 'Siti Hasanah Bolkiah, S.Pd', '$2y$10$UGXZLvx41Hte.48O87EXhOTsSjPYasZWrx67dJ4xXTZVSElLk1DaC', 2, 85, 1, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `guru` VALUES (86, 87, 'indhirohfitriandini992', 'Indhiroh Fitriandini, S.Pd', '$2y$10$/qtE5sOuk3QXd2BGF7kEQeJXigrOBADpwZb.XzeXW.d9dtOiA3sD.', 2, 86, 1, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `guru` VALUES (87, 88, 'bambangeko994', 'Bambang Eko Witjaksono, S.Pd', '$2y$10$l6HTt941cD7PK/p1FwLVJuGUlrawr3J8ZxhJBUm8ar/6CYelUk2M.', 2, 87, 1, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `guru` VALUES (88, 89, 'leysagiatrikirana88', 'Leysa Giatri Kirana, S.Psi', '$2y$10$YZ6ZFEc7OohFx/EYYKN4PuODzAoisVQxehiyMoJLko/5r/xW0xjwi', 2, 88, 1, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `guru` VALUES (89, 90, 'vetywulandari575', 'Vety Wulandari, SPd', '$2y$10$SIhFdqcgWJwYYS6ldjbhNO3egtYaz8ZONcugDqbJ3NZXz4cNJQ0ze', 2, 89, 1, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `guru` VALUES (90, 91, 'dwiayuliandari889', 'Dwi Ayuliandari, S.Pd', '$2y$10$LwaDZLQeaKal9MhvixInhunykJUl.t3TOaNC7BIcWZMFIE0iI77uW', 2, 90, 1, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `guru` VALUES (91, 92, 'arifdwifebrianto112', 'Arief Dwi Febrianto, S.Pd', '$2y$10$X1LnbtIkgokAKDtaH6Ivl.vtNlauAOgBRaR9ZuL6DflDmF9g.Lo7S', 2, 91, 1, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 185 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of guru_mapel
-- ----------------------------
INSERT INTO `guru_mapel` VALUES (1, 2, 1, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (2, 3, 1, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (3, 4, 1, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (4, 5, 1, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (5, 6, 1, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (6, 7, 2, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (7, 8, 2, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (8, 9, 2, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (9, 10, 2, '1', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (10, 10, 3, '2', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (11, 12, 4, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (12, 13, 4, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (13, 14, 4, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (14, 15, 4, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (15, 16, 4, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (16, 17, 4, '1', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (17, 17, 5, '2', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (18, 18, 6, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (19, 19, 6, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (20, 20, 6, '1', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (21, 20, 3, '2', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (22, 21, 7, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (23, 22, 7, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (24, 23, 8, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (25, 24, 8, '1', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (26, 24, 9, '2', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (27, 24, 10, '3', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (28, 24, 11, '4', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (29, 25, 12, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (30, 26, 12, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (31, 27, 12, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (32, 28, 12, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (33, 29, 12, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (34, 30, 12, '1', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (35, 30, 9, '2', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (36, 31, 12, '1', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (37, 31, 9, '2', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (38, 32, 13, '1', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (39, 32, 3, '2', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (40, 32, 12, '3', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (41, 33, 14, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (42, 34, 14, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (43, 35, 14, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (44, 36, 14, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (45, 37, 14, '1', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (46, 37, 5, '2', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (47, 38, 14, '1', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (48, 38, 5, '2', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (49, 39, 14, '1', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (50, 39, 5, '2', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (51, 40, 15, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (52, 41, 15, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (53, 42, 11, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (54, 43, 11, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (55, 44, 11, NULL, 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (56, 45, 16, '1', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (57, 45, 17, '2', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (58, 45, 18, '3', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (59, 46, 16, '1', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (60, 46, 19, '2', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (61, 46, 20, '3', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (62, 47, 16, '1', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (63, 47, 21, '2', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (64, 47, 18, '3', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (65, 47, 22, '4', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (66, 48, 23, '1', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (67, 48, 24, '2', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (68, 48, 16, '3', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (69, 49, 16, '1', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (70, 49, 25, '2', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (71, 49, 26, '3', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (72, 50, 27, '1', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (73, 50, 28, '2', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (74, 50, 29, '3', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (75, 50, 30, '4', 1, '2023-09-12 21:07:30', '2023-09-12 21:07:30', 1, NULL);
INSERT INTO `guru_mapel` VALUES (76, 51, 29, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (77, 51, 31, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (78, 51, 32, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (79, 52, 33, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (80, 52, 34, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (81, 52, 35, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (82, 53, 36, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (83, 53, 31, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (84, 54, 18, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (85, 54, 27, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (86, 55, 37, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (87, 55, 38, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (88, 56, 18, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (89, 56, 27, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (90, 57, 39, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (91, 57, 32, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (92, 57, 35, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (93, 58, 39, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (94, 58, 31, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (95, 58, 28, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (96, 59, 40, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (97, 59, 41, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (98, 59, 42, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (99, 60, 31, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (100, 60, 18, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (101, 60, 28, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (102, 60, 27, '4', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (103, 61, 43, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (104, 61, 44, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (105, 61, 45, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (106, 61, 33, '4', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (107, 62, 46, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (108, 62, 47, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (109, 62, 48, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (110, 63, 49, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (111, 63, 50, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (112, 63, 51, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (113, 64, 43, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (114, 64, 52, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (115, 64, 45, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (116, 64, 46, '4', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (117, 65, 18, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (118, 65, 53, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (119, 65, 33, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (120, 65, 49, '4', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (121, 65, 5, '5', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (122, 66, 9, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (123, 66, 5, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (124, 67, 54, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (125, 67, 55, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (126, 67, 56, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (127, 68, 10, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (128, 68, 57, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (129, 69, 58, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (130, 69, 59, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (131, 69, 60, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (132, 70, 61, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (133, 70, 9, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (134, 70, 60, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (135, 71, 62, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (136, 71, 63, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (137, 72, 64, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (138, 72, 65, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (139, 72, 42, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (140, 72, 66, '4', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (141, 73, 67, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (142, 73, 45, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (143, 73, 65, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (144, 73, 68, '4', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (145, 73, 18, '5', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (146, 74, 59, NULL, 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (147, 75, 69, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (148, 75, 70, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (149, 76, 71, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (150, 76, 70, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (151, 77, 72, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (152, 77, 73, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (153, 77, 45, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (154, 78, 74, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (155, 78, 75, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (156, 78, 76, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (157, 78, 77, '4', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (158, 79, 18, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (159, 79, 78, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (160, 79, 74, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (161, 80, 79, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (162, 80, 71, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (163, 80, 80, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (164, 81, 81, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (165, 81, 82, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (166, 81, 83, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (167, 81, 84, '4', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (168, 82, 9, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (169, 82, 85, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (170, 83, 86, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (171, 83, 87, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (172, 83, 88, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (173, 83, 89, '4', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (174, 84, 90, '1', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (175, 84, 91, '2', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (176, 84, 45, '3', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (177, 84, 92, '4', 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (178, 85, 93, NULL, 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (179, 86, 93, NULL, 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (180, 87, 93, NULL, 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (181, 88, 93, NULL, 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (182, 89, 93, NULL, 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (183, 90, 93, NULL, 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);
INSERT INTO `guru_mapel` VALUES (184, 91, 93, NULL, 1, '2023-09-12 21:07:34', '2023-09-12 21:07:34', 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jurusan
-- ----------------------------
INSERT INTO `jurusan` VALUES (1, 'Manajemen Perkantoran', 1, '2023-09-13 07:50:01', '2023-09-13 07:50:01', 1, NULL);
INSERT INTO `jurusan` VALUES (2, 'Akuntansi', 1, '2023-09-13 07:50:01', '2023-09-13 07:50:01', 1, NULL);
INSERT INTO `jurusan` VALUES (3, 'Layanan Perbankan', 1, '2023-09-13 07:50:01', '2023-09-13 07:50:01', 1, NULL);
INSERT INTO `jurusan` VALUES (4, 'Bisnis Digital', 1, '2023-09-13 07:50:01', '2023-09-13 07:50:01', 1, NULL);
INSERT INTO `jurusan` VALUES (5, 'Teknik Komputer dan Jaringan', 1, '2023-09-13 07:50:01', '2023-09-13 07:50:01', 1, NULL);
INSERT INTO `jurusan` VALUES (6, 'Desain Komunikasi Visual', 1, '2023-09-13 07:50:01', '2023-09-13 07:50:01', 1, NULL);
INSERT INTO `jurusan` VALUES (7, 'Rekayasa Perangkat Lunak', 1, '2023-09-13 07:50:01', '2023-09-13 07:50:01', 1, NULL);
INSERT INTO `jurusan` VALUES (8, 'Produksi dan Siaran Program Televisi', 1, '2023-09-13 07:50:01', '2023-09-13 07:50:01', 1, NULL);
INSERT INTO `jurusan` VALUES (9, 'Otomatisasi dan Tata Kelola Perkantoran', 1, '2023-09-13 07:50:01', '2023-09-13 07:50:01', 1, NULL);
INSERT INTO `jurusan` VALUES (10, 'Akuntansi dan Keuangan Lembaga', 1, '2023-09-13 07:50:01', '2023-09-13 07:50:01', 1, NULL);
INSERT INTO `jurusan` VALUES (11, 'Perbankan dan Keuangan Mikro', 1, '2023-09-13 07:50:01', '2023-09-13 07:50:01', 1, NULL);
INSERT INTO `jurusan` VALUES (12, 'Bisnis Daring dan Pemasaran', 1, '2023-09-13 07:50:01', '2023-09-13 07:50:01', 1, NULL);
INSERT INTO `jurusan` VALUES (13, 'Multimedia', 1, '2023-09-13 07:50:01', '2023-09-13 07:50:01', 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kelas
-- ----------------------------
INSERT INTO `kelas` VALUES (1, 1, 'MP 1', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (2, 1, 'MP 2', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (3, 2, 'AK 1', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (4, 2, 'AK 2', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (5, 3, 'LP 1', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (6, 4, 'BD 1', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (7, 4, 'BD 2', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (8, 5, 'TKJ 1', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (9, 5, 'TKJ 2', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (10, 6, 'DKV 1', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (11, 6, 'DKV 2', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (12, 7, 'RPL 1', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (13, 7, 'RPL 2', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (14, 8, 'PSPTV', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (15, 9, 'OTKP 1', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (16, 9, 'OTKP 2', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (17, 10, 'AKL 1', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (18, 10, 'AKL 2', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (19, 11, 'PKM 1', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (20, 11, 'PKM 2', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (21, 12, 'BDP 1', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (22, 12, 'BDP 2', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (23, 13, 'MM 1', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);
INSERT INTO `kelas` VALUES (24, 13, 'MM 2', 1, '2023-09-13 07:50:11', '2023-09-13 07:50:11', 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kelas_mapel
-- ----------------------------
INSERT INTO `kelas_mapel` VALUES (1, 3, 7, 12, 145, 1, 1, '2023-09-14 20:23:45', '2023-09-14 20:23:45', 1, NULL);
INSERT INTO `kelas_mapel` VALUES (2, 3, 7, 12, 48, 1, 1, '2023-09-14 20:23:45', '2023-09-14 20:23:45', 1, NULL);
INSERT INTO `kelas_mapel` VALUES (3, 3, 7, 12, 49, 1, 1, '2023-09-14 20:23:45', '2023-09-14 20:23:45', 1, NULL);
INSERT INTO `kelas_mapel` VALUES (4, 3, 7, 12, 29, 1, 1, '2023-09-14 20:23:45', '2023-09-14 20:23:45', 1, NULL);
INSERT INTO `kelas_mapel` VALUES (5, 3, 7, 12, 146, 1, 1, '2023-09-14 20:23:45', '2023-09-14 20:23:45', 1, NULL);
INSERT INTO `kelas_mapel` VALUES (6, 3, 7, 12, 139, 1, 1, '2023-09-14 20:23:45', '2023-09-14 20:23:45', 1, NULL);
INSERT INTO `kelas_mapel` VALUES (7, 3, 7, 12, 8, 1, 1, '2023-09-14 20:23:45', '2023-09-14 20:23:45', 1, NULL);
INSERT INTO `kelas_mapel` VALUES (8, 3, 7, 12, 12, 1, 1, '2023-09-14 20:23:45', '2023-09-14 20:23:45', 1, NULL);
INSERT INTO `kelas_mapel` VALUES (9, 3, 7, 12, 3, 1, 1, '2023-09-14 20:23:45', '2023-09-14 20:23:45', 1, NULL);
INSERT INTO `kelas_mapel` VALUES (10, 3, 7, 12, 138, 1, 1, '2023-09-14 20:23:45', '2023-09-14 20:23:45', 1, NULL);

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
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`mapel_id`) USING BTREE,
  UNIQUE INDEX `mapel_nama_mapel_unique`(`nama_mapel`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mapel
-- ----------------------------
INSERT INTO `mapel` VALUES (1, 'PAI dan Budi Pekerti', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (2, 'Pendidikan Pancasila', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (3, 'Mulok Bahasa Daerah Madura', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (4, 'Bahasa Indonesia', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (5, 'Mulok Bahasa Daerah Jawa', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (6, 'Penjas & OR', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (7, 'Sejarah Indonesia', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (8, 'Seni Budaya', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (9, 'Produk / Projek Kreatif dan Kewirausahaan', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (10, 'Sketsa dan Ilustrasi', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (11, 'Projek Ilmu Pengetahuan Alam dan Sosial', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (12, 'Matematika', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (13, 'Mapel Pilihan: Public Speaking', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (14, 'Bahasa Inggris', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (15, 'Informatika', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (16, 'Dasar-dasar Manajemen Perkantoran dan Layanan Bisnis', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (17, 'Teknologi kantor', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (18, 'Produk Kreatif dan Kewirausahaan', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (19, 'Pengelolaan administrasi umum', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (20, 'Otomatisasi Tata Kelola Kepegawaian', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (21, 'Ekonomi dan bisnis', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (22, 'Otomatisasi Tata Kelola Humas dan Keprotokolan', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (23, 'Otomatisasi Tata Kelola Keuangan', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (24, 'Komunikasi di tempat kerja', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (25, 'Pengelolaan kearsipan', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (26, 'Otomatisasi Tata Kelola Sarana dan Prasarana', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (27, 'Layanan Lembaga Perbankan dan Keuangan Mikro', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (28, 'Akuntansi Perbankan dan Keuangan Mikro', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (29, 'Administrasi Pajak', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (30, 'Projek/Produk Kreatif dan Kewirausahaan', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (31, 'Komputer Akuntansi', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (32, 'Akuntansi Keuangan', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (33, 'Ekonomi Bisnis dan Administrasi Umum', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (34, 'Perpajakan', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (35, 'Praktikum Akuntansi Lembaga / Instansi Pemerintah', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (36, 'Dasar Akuntansi dan Perbankan', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (37, 'Akuntansi Perusahaan Dagang', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (38, 'Praktikum Akuntansi Perusahaan Jasa, Dagang dan Manufacture', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (39, 'Akuntansi Dasar', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (40, 'Aplikasi Pengolah Angka / Spreadsheet', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (41, 'Mapel Pilihan: Microsoft Class', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (42, 'Pemrograman Berorientasi Objek', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (43, 'Bisnis Online', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (44, 'Digital Branding', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (45, 'Projek Kreatif dan Kewirausahaan', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (46, 'Komunikasi bisnis', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (47, 'Pengelolaan Bisnis Ritel', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (48, 'Administrasi Transaksi', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (49, 'Marketing', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (50, 'Dasar-dasar: Perilaku Konsumen dan Pelayanan Penjualan', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (51, 'Penataan Produk', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (52, 'Digital on boarding', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (53, 'Dasar-dasar: Teknologi Pemasaran', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (54, 'Dasar Kreativitas', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (55, 'Prinsip Dasar Komunikasi', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (56, 'Perangkat Lunak Desain', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (57, 'Audio dan Video (K13)', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (58, 'Pemrograman Berbasis Teks,Grafis, dan Multimedia', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (59, 'Pemrograman Web dan Perangkat Bergerak', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (60, 'Desain Multimedia Interaktif (K13)', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (61, 'Mapel Pilihan: Animasi 2D', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (62, 'Dasar DKV', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (63, 'DKV 1', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (64, 'Pemrograman Perangkat Bergerak', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (65, 'Basis Data', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (66, 'Dasar-dasar: Pemrograman Berorientasi Obyek', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (67, 'Dasar-Dasar: Perkembangan Perangkat Lunak dan Pemrograman Prosedural', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (68, 'Pemrograman Web', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (69, 'Teknologi Layanan Jaringan (TLJ)', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (70, 'Perencanaan dan pengalamatan Jaringan (PPJ)', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (71, 'Administrasi Sistem Jaringan (ASJ)', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (72, 'Teknologi Komtel dan Budaya Industri (TKBI)', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (73, 'Teknologi Jaringan Kabel dan Nirkabel (TJKN)', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (74, 'Administrasi Infrastruktur Jaringan', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (75, 'Pemasangan dan Konfigurasi Perangkat Jaringan (PKPJ)', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (76, 'Jaringan Komtel Dasar (JKD)', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (77, 'Cloud Computing', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (78, 'Bisnis Teknik Komtel dan_x000D_\nKewirausahaan (BTKK)', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (79, 'Keamanan Jaringan (KJ)', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (80, 'Mapel Pilihan: Perakitan PC dan Laptop', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (81, 'Dasar-dasar: Produksi Media Audio-Visual dan Industri Kreatif', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (82, 'Produksi Konten Media Televisi', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (83, 'Manajemen Produksi,Penulisan naskah dan Penyutradaraan', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (84, 'Mapel Pilihan: Presenter', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (85, 'Dasar-dasar: Manajemen Produksi Media Digital, Industri Broadcasting dan Film', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (86, 'Dasar-dasar: Pengenalan Produksi Media Audio-Visual dan K3LH', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (87, 'Manajemen Produksi Media Online dan Televisi', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (88, 'Tata Artistik', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (89, 'Kamera, Pencahayaan, dan Tata Suara', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (90, 'Editing Audio dan Video', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (91, 'Produksi dan Pengolahan Audio-Visual Televisi', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (92, 'Mapel Pilihan: Fotografi dan Videografi', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);
INSERT INTO `mapel` VALUES (93, 'Bimbingan Konseling', 1, '2023-09-12 21:02:52', '2023-09-12 21:02:52', 1, NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1204 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of siswa
-- ----------------------------
INSERT INTO `siswa` VALUES (1, 93, 'adityafirmansyah370', 'ADITYA FIRMANSYAH', '$2y$10$Ri5e29A4GfZekA11lm3BpuWIuiJurb6lJ6C5Kmf/QvvyRdY4n3GmC', 1, 1, 1, 3, 1, '2023-09-13 19:15:17', '2023-09-13 19:15:17', 1, NULL);
INSERT INTO `siswa` VALUES (2, 94, 'alinizzantikadewi906', 'ALIN IZZANTIKA DEWI', '$2y$10$mzY1b8F1nvPEGleoPSY9euq8BgB15fSrEzr9nUb6wZfcIgNqCGkgy', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (3, 95, 'ameliaartalitaputri964', 'AMELIA ARTALITA PUTRI', '$2y$10$P/ulWpNsXDlqZRpyMhurB.1wIU312F3PP2YT/2Zjnd0hP9aPmoY4.', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (4, 96, 'ameliarosidi213', 'AMELIA ROSIDI', '$2y$10$tpPMNfP1FLVmohauoVSEbucnySvcKt7mw2Z7mVVatYga9Eq/Sh3xy', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (5, 97, 'anindyacantikakusumadewi950', 'ANINDYA CANTIKA KUSUMA DEWI', '$2y$10$SDytvWkWoP1iJaLyR8CNg.hcoqUeIKA6plxflEUjtWopfM53H1R3i', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (6, 98, 'azoravarodisilafifah124', 'AZORA VARODISIL AFIFAH', '$2y$10$88VfLKxDBqm4OXkGeiElCOhkQO3q/bzcaXHrbuL3ohh.jG/D9lgtG', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (7, 99, 'cyndifatiharizki405', 'CYNDI FATIHA RIZKI', '$2y$10$GNHxNk78LvIkFCuIKQ9jfuhLOjdp596scAFbFj3l02mG/inESskGu', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (8, 100, 'dewianggunparamitha555', 'DEWI ANGGUN PARAMITHA', '$2y$10$cASZcAxWPkWwB6KgDucVY./TPIaZ20.KU3Yl.VrkCdWvljee9aIz2', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (9, 101, 'dwicahyaramadhan156', 'DWI CAHYA RAMADHAN', '$2y$10$ersTAHBAq/6Tt0DRzAiyee8KD4W/RVjkBFwQFInjN5SFejjtSNrOO', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (10, 102, 'ekanurulistiqomah474', 'EKA NURUL ISTIQOMAH', '$2y$10$72SK6aKT.NwLGL2L/Ye4xOexiw6tjHhOSvCV4QtyuuBeSVmI6s0K2', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (11, 103, 'fransiskanadiaananda265', 'FRANSISKA NADIA ANANDA', '$2y$10$z9RWlQHGrK7.Oq91u8Eu2OLB3UJGCpgM51z8pkA/BJA.52kNWL1G6', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (12, 104, 'hairulumam142', 'HAIRUL UMAM', '$2y$10$6/fgDTofYegQUYkneFzaTu/5mg3MSumfmsy1K3diymLmRd4o9HGUO', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (13, 105, 'kalinggaalodiakhairani442', 'KALINGGA ALODIA KHAIRANI', '$2y$10$ano0Xffu.N7ChVqP6pm3j.zqI3RW5FKCsOFEGKHRN0KYXo78J0kkO', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (14, 106, 'keziadyramalvania699', 'KEZIA DYRA MALVANIA', '$2y$10$LFUimilo1CS5w1Hepr4NEuCplqBWeXW69CfYcNUWSCVSVwNtU0dWS', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (15, 107, 'khaulahrizkiarini462', 'KHAULAH RIZKI ARINI', '$2y$10$g6GmWwWLdoDKldN5TJpgI.HcgVcfPUfw7u9JKJrtiiJuVKvrMNkOG', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (16, 108, 'lutfianaazizah584', 'LUTFIANA AZIZAH', '$2y$10$3tw2za6lBdckfVrO1G1K4e1IFUC5jSP77Y/VSsGXD/ehVtMYTWg4C', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (17, 109, 'malikaemaelysia770', 'MALIKA EMA ELYSIA', '$2y$10$HGVPVwwmjqaz.ilywuq/TO20ojiiPtfA1ov8neeE9adEBfh5c.L5i', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (18, 110, 'maulidinaaprilia148', 'MAULIDINA APRILIA', '$2y$10$bR0D3zCftiMPGg0BXoPaXuC8vi785YQXCCfmi5X9FRKZGbocVbERS', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (19, 111, 'muhammadzainalabdihusni470', 'MUHAMMAD ZAINAL ABDI HUSNI', '$2y$10$wVB/IB3teuQHuD/cGqWwR.ABp2r4eLnxKHCUduNeih3peheQ80D9C', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (20, 112, 'nabilaekasaphira4810', 'NABILA EKA SAPHIRA', '$2y$10$LpQ7GPtzaxBMZ/Gb2qsxEer0XaNSFXH5JWTSet76O8BhQHtql7Aea', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (21, 113, 'novayuniaanggrainie4210', 'NOVA YUNIA ANGGRAINIE', '$2y$10$7LHrJz/ltwVLZkEG.qaGKOMDnUu2Gm/j0VWlwb/MhkPrY4bxI0/YK', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (22, 114, 'nurhasanah864', 'NUR HASANAH', '$2y$10$cYjZM0W9CLqrJRKQOCPpQuYt8yIgixmHC1zCEs8gnzEpEj7P2F1h2', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (23, 115, 'ratihyuanitapermatasari923', 'RATIH YUANITA PERMATASARI', '$2y$10$mm6rVjvAo1em/qp0AnuDAugwYt3sm0m9cW5MprR/ctbZUuBWb05ce', 1, 1, 1, 3, 1, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `siswa` VALUES (24, 116, 'renoaditiyasaputra570', 'RENO ADITIYA SAPUTRA', '$2y$10$n1I0Io4lim18X.aIf7qi0e0qTAfHyhh/GoeZMAyyvX3NiO/kqLzRy', 1, 1, 1, 3, 1, '2023-09-13 19:15:19', '2023-09-13 19:15:19', 1, NULL);
INSERT INTO `siswa` VALUES (25, 117, 'rikotriansaputra896', 'RIKO TRIAN SAPUTRA', '$2y$10$RJ.M6DOZlVClV/Ss6WjdeuPWcSO1Il1RnQyZc9anfH4eUkGXv6.nG', 1, 1, 1, 3, 1, '2023-09-13 19:15:19', '2023-09-13 19:15:19', 1, NULL);
INSERT INTO `siswa` VALUES (26, 118, 'risyaadindaagustin174', 'RISYA ADINDA AGUSTIN', '$2y$10$1SsZ2Boa5SH1J.bwe/TvZ.9PIQMbt2eoqdASsTxS3NM0FcRDvC8lm', 1, 1, 1, 3, 1, '2023-09-13 19:15:19', '2023-09-13 19:15:19', 1, NULL);
INSERT INTO `siswa` VALUES (27, 119, 'seriltriwahyuni675', 'SERIL TRI WAHYUNI', '$2y$10$jWtdtPqKztdvX0PzQCQZJ.L3ANQsdHyNudjhb60T0M3p15lahCJM2', 1, 1, 1, 3, 1, '2023-09-13 19:15:19', '2023-09-13 19:15:19', 1, NULL);
INSERT INTO `siswa` VALUES (28, 120, 'silvirawidayanti132', 'SILVIRA WIDAYANTI', '$2y$10$ZdApGMaV0iPc.TBqphi0EuPxLc/bb4V8MxR4ymMfj0vudIlYkiuFm', 1, 1, 1, 3, 1, '2023-09-13 19:15:19', '2023-09-13 19:15:19', 1, NULL);
INSERT INTO `siswa` VALUES (29, 121, 'sindinoveliaputri163', 'SINDI NOVELIA PUTRI', '$2y$10$AexMoQAVb3TKeUjaSniSYO20ky977Ik4MjkaooXK7ORzY8Q/LOkoW', 1, 1, 1, 3, 1, '2023-09-13 19:15:19', '2023-09-13 19:15:19', 1, NULL);
INSERT INTO `siswa` VALUES (30, 122, 'sitifarida382', 'SITI FARIDA', '$2y$10$4NKlzj4wndPBGsTI8fY8BubcXQjrNZu8dUuNA6lG4zYvvPKtUzBEq', 1, 1, 1, 3, 1, '2023-09-13 19:15:19', '2023-09-13 19:15:19', 1, NULL);
INSERT INTO `siswa` VALUES (31, 123, 'sitinursalsabila378', 'SITI NUR SALSABILA', '$2y$10$N3MQHfFioom9UrxJSuu8d.9.qttBuZB0FLdX4nB4EQd4NwKynu/HK', 1, 1, 1, 3, 1, '2023-09-13 19:15:19', '2023-09-13 19:15:19', 1, NULL);
INSERT INTO `siswa` VALUES (32, 124, 'syahrinamaysasaabira847', 'SYAHRINA MAYSA SAABIRA', '$2y$10$Qmzmmayv.22MZGfiRsbZ0e8gSavnO4ZxfX/J/VEgYfYZoLqnPUwkC', 1, 1, 1, 3, 1, '2023-09-13 19:15:19', '2023-09-13 19:15:19', 1, NULL);
INSERT INTO `siswa` VALUES (33, 125, 'wiwinkurniasih713', 'WIWIN KURNIASIH', '$2y$10$6W1aoUFHc9SAVqQrTDkzC.tzyF4Cr3ops75NdWUy5tR85L8JXg9Pq', 1, 1, 1, 3, 1, '2023-09-13 19:15:19', '2023-09-13 19:15:19', 1, NULL);
INSERT INTO `siswa` VALUES (34, 126, 'aidakurniarahmawati554', 'AIDA KURNIA RAHMAWATI', '$2y$10$zZwj6HGtuaMZAomAEeSDzO5EfWsbwE3JaqVN7ys23mQyzAcVdRBDC', 1, 1, 2, 3, 1, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `siswa` VALUES (35, 127, 'amandadinisaputri3510', 'AMANDA DINI SAPUTRI', '$2y$10$Bk6JhonmkmsGkm3mB8QrQe5gHxyB6l.iL9EQmV/aH/Ah3/Jy4v4Re', 1, 1, 2, 3, 1, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `siswa` VALUES (36, 128, 'ameliarosdiananingsih690', 'AMELIA ROSDIANA NINGSIH', '$2y$10$lEBsjIKeL9tHhbh6z5b71OPxA17IlJvrNviD8ch.9qRfyeTcZB.6a', 1, 1, 2, 3, 1, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `siswa` VALUES (37, 129, 'andikapratamamaulanaismail6410', 'ANDIKA PRATAMA MAULANA ISMAIL', '$2y$10$iah/fpm8cfkDzMTVPyhjvO9K3ZBb/umix5pvC9cW8Kdg6x2H0u7.y', 1, 1, 2, 3, 1, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `siswa` VALUES (38, 130, 'anggiealifiakurnia101', 'ANGGIE ALIFIA KURNIA', '$2y$10$a.T2nM1O4bvRWfpEjKCw6esogrsiUPyc6fH7sWGPyf9lvoh6DUuqu', 1, 1, 2, 3, 1, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `siswa` VALUES (39, 131, 'auliaandini152', 'AULIA ANDINI', '$2y$10$7zuXf9byADHIyZcZKLMeG.Y/6AolhbSzLofTnlvJuYX0O7SO3m7gK', 1, 1, 2, 3, 1, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `siswa` VALUES (40, 132, 'chelsiliadewiayukirana523', 'CHELSILIA DEWI AYU KIRANA', '$2y$10$AY0CcujkQQHnVZAp2nSIdOzgbl8v3OySo7FjpNKJRd.gQLiJrXkxq', 1, 1, 2, 3, 1, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `siswa` VALUES (41, 133, 'delhicyetaargadyabrilyantine790', 'DELHICYETA ARGADYA BRILYANTINE', '$2y$10$Br63IkDYMml07YvKXyM70.dpmChmhj62WFYAo.FoJ9MFdP3yQrYB2', 1, 1, 2, 3, 1, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `siswa` VALUES (42, 134, 'dianafirdausiah894', 'DIANA FIRDAUSIAH', '$2y$10$YSXJciS47nAWKh52FJMBXu7qd96gcUXedB1xOFtMRylsZHzAGkf1G', 1, 1, 2, 3, 1, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `siswa` VALUES (43, 135, 'fairuzsyifaragildewantari690', 'FAIRUZ SYIFA RAGIL DEWANTARI', '$2y$10$.FVRDzwksWbW5nV5cM7lceuxmJhs/Z1cJUuhL6dYHmXXLzRvoK0v6', 1, 1, 2, 3, 1, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `siswa` VALUES (44, 136, 'gatothendroprawiro699', 'GATOT HENDRO PRAWIRO', '$2y$10$P.LAnf2IvaBG69F.kbm65.zcK9mBWYPGbCWQUHSp/t7HY8T5.V5uu', 1, 1, 2, 3, 1, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `siswa` VALUES (45, 137, 'hilmahriski668', 'HILMAH RISKI', '$2y$10$dvBS/E5Wzsl8yTa7JJ8wPuqy1uSWu/x4mS5Aj4LQI/01biG4PO1PO', 1, 1, 2, 3, 1, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `siswa` VALUES (46, 138, 'keyshaputridaniela148', 'KEYSHA PUTRI DANIELA', '$2y$10$EG8Y/gWJXVXB3zxSOPIXp.Y11EQLrVaGRodPq/fx/whBpoIQrMnIu', 1, 1, 2, 3, 1, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `siswa` VALUES (47, 139, 'khairunnisak393', 'KHAIRUN NISAK', '$2y$10$yLuhm/.KcK7GYTSNrAS8We.4FL6GyuP4lQ4s2GeyhGPdL5Uthz1.W', 1, 1, 2, 3, 1, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `siswa` VALUES (48, 140, 'latifahriskirahayu370', 'LATIFAH RISKI RAHAYU', '$2y$10$44QuXzL/3Q6z/jnk42aKD.19.tq6u8ej2Ha9ZEviIbE/vTsCM1O3S', 1, 1, 2, 3, 1, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `siswa` VALUES (49, 141, 'maelizulfaturramadhanti636', 'MAELI ZULFATUR RAMADHANTI', '$2y$10$zbNLM/5sYFTjmnQ.M129cuw4OUco.U3p1qEkPOjbh2NRBsDbyYF6K', 1, 1, 2, 3, 1, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `siswa` VALUES (50, 142, 'marlaoctaviola450', 'MARLA OCTA VIOLA', '$2y$10$FDjpN/nhdK0zwZG.R3rLhuf.KFGM7R9ICqiZQL7Wu616rH49bexbe', 1, 1, 2, 3, 1, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `siswa` VALUES (51, 143, 'maulinaameliaputri909', 'MAULINA AMELIA PUTRI', '$2y$10$bluqtDCYLuB5/1UawVsubORlSlHjz.2ndLmyZuat4/bw3SfMs/e8S', 1, 1, 2, 3, 1, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `siswa` VALUES (52, 144, 'muhammadadityawijaya172', 'MUHAMMAD ADITYA WIJAYA', '$2y$10$aZxOSX.WizPXA/FG0kSpvuhS/whaYVLRR9o31pLPDvYgxkAkrp14C', 1, 1, 2, 3, 1, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `siswa` VALUES (53, 145, 'nabilhusnulmurad233', 'NABIL HUSNUL MURAD', '$2y$10$KUnoOrnW.5X5OafI84snKO4ejVCSiy8ggNazi7EnBUy6CH2/rPi5O', 1, 1, 2, 3, 1, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `siswa` VALUES (54, 146, 'natashazathifatulaini434', 'NATASHA ZATHIFATUL AINI', '$2y$10$Lb/b0eabVS9ZltptCy.drukARV.F0c.F1gy9trGk4NG8xDvj./9iG', 1, 1, 2, 3, 1, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `siswa` VALUES (55, 147, 'novitaayuwidyasanesty606', 'NOVITA AYU WIDYA SANESTY', '$2y$10$yDdyh/On2bIsebDGb0LW1.vl8OrRKZwQzfgwaH/lYai.fBVhfImVq', 1, 1, 2, 3, 1, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `siswa` VALUES (56, 148, 'putrinovitasari534', 'PUTRI NOVITASARI', '$2y$10$TlwjLq1jCb1BJxIzVzd5ce2h1tmLLdWCkisx1OHg9lO8y6BT7537u', 1, 1, 2, 3, 1, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `siswa` VALUES (57, 149, 'rezaauliafebrianti748', 'REZA AULIA FEBRIANTI', '$2y$10$xp97BhXSzkVPIZj3Q9I2HOlc0mwEemLyWFZoNMOKpMkI076PIJq9S', 1, 1, 2, 3, 1, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `siswa` VALUES (58, 150, 'rhamadhanidwiriskygustiawan917', 'RHAMADHANI DWIRISKY GUSTIAWAN', '$2y$10$uYr77Zoqf0/RQidMqyDb8u90k9pAkTicvX88/2p87tH70akakwuqW', 1, 1, 2, 3, 1, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `siswa` VALUES (59, 151, 'sasykiranawidyaparamita186', 'SASY KIRANA WIDYAPARAMITA', '$2y$10$honGWLnao52LdLXdob4f3eg2V.FhWCdDhSdzk/NkzdkvJFmnar2NO', 1, 1, 2, 3, 1, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `siswa` VALUES (60, 152, 'silviamaylaniputridewi387', 'SILVIA MAYLANI PUTRI DEWI', '$2y$10$sBc6rMyXOTtGFyyRSBpQuet1egrI9YjZX6a3.fU3Krodqum9DsUWS', 1, 1, 2, 3, 1, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `siswa` VALUES (61, 153, 'silviyaocthaputrieffendhi307', 'SILVIYA OCTHA PUTRI EFFENDHI', '$2y$10$rv8Zbx4AUFFq3StQnP609.P3LUQ2pNsXsyKhJGiOkduQCeu7KwCRq', 1, 1, 2, 3, 1, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `siswa` VALUES (62, 154, 'sisiliaoktaria848', 'SISILIA OKTARIA', '$2y$10$SW7vYRo95sqj4BU.NZlvlOJiRRy9.YQRLKD4MoXDlPBYg84onCOUu', 1, 1, 2, 3, 1, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `siswa` VALUES (63, 155, 'sitiinaratuduja788', 'SITI INARATU DUJA', '$2y$10$e9aq77HIflbl/EkI076I/eUsTs7jQ6tW1oquHzr809Kdgjlws5ZwS', 1, 1, 2, 3, 1, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `siswa` VALUES (64, 156, 'sittikarinasilfa775', 'SITTI KARINA SILFA', '$2y$10$7HHSYRmZdAkyUUohym7NB.0xI3C5Pee5/mn/Xpke0LOcltpA7tMDa', 1, 1, 2, 3, 1, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `siswa` VALUES (65, 157, 'windadamaianti208', 'WINDA DAMAIANTI', '$2y$10$zTUcEn.vC461ELu8N0wsYemAip57wLpuLwsgUctCnj8phxJVkzXH6', 1, 1, 2, 3, 1, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `siswa` VALUES (66, 158, 'adindadwifebywidarto568', 'ADINDA DWI FEBY WIDARTO', '$2y$10$8w3hd2bBubrpBGU.3qZ7FeoAVwOPvcjtAVB0BcnqlgiTSj6NhmxfO', 1, 2, 3, 3, 1, '2023-09-13 19:15:38', '2023-09-13 19:15:38', 1, NULL);
INSERT INTO `siswa` VALUES (67, 159, 'ahmadridhosaputra772', 'AHMAD RIDHO SAPUTRA', '$2y$10$EC0i5ZbhfSdcmHytdaUUneRlqX2oegrep04suuyv1DherVeJEgeRK', 1, 2, 3, 3, 1, '2023-09-13 19:15:38', '2023-09-13 19:15:38', 1, NULL);
INSERT INTO `siswa` VALUES (68, 160, 'aldakristin492', 'ALDA KRISTIN', '$2y$10$YcvI7W0Co.jEGuNGOEBEIu3VDUysHCfX3cdkFWoa9Rph53e5pxQ.y', 1, 2, 3, 3, 1, '2023-09-13 19:15:38', '2023-09-13 19:15:38', 1, NULL);
INSERT INTO `siswa` VALUES (69, 161, 'anisaagustin931', 'ANISA AGUSTIN', '$2y$10$gXPea4eZF68jPOQ5u0T/Ru9grpV4iiM.ZIFv5j2i76rko5X65NUPi', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (70, 162, 'azizatunnabila855', 'AZIZATUN NABILA', '$2y$10$mvb8ryf4wHNda/JgrMq9yuzv.IIrKdbsxeGWWgdz9PCtCo7rhjO8.', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (71, 163, 'chelsyaliciathimoty689', 'CHELSY ALICIA THIMOTY', '$2y$10$6p.T0sV2QEFqJWi/jrBR/emKMOlo.OqvA9nq5ReygkETQAwibKk.i', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (72, 164, 'dewiayuveronica682', 'DEWI AYU VERONICA', '$2y$10$26cRHeaYSsS06FLTh5QpqO/XR4JszoRGe8ATyCVsMltolYV3o36xa', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (73, 165, 'dwiraniandini975', 'DWI RANI ANDINI', '$2y$10$I4E74z8SYMJevzUCVjm3jePTsSFC2rHctqwVb4X2jCMja5E84y.bO', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (74, 166, 'gunawanferisusanto275', 'GUNAWAN FERI SUSANTO', '$2y$10$XHWfcHmpL0AKK1HTwQw7dutQ/bCEHBganZuwROYte7Vn99j6n1ime', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (75, 167, 'hairiaummah671', 'HAIRIA UMMAH', '$2y$10$Y5FEYevv5lNf2b1pxbkKJeMdR4CVUjOk2pq8ad/5eRAEPDbrLNTK2', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (76, 168, 'huzaimahalifiaamrah853', 'HUZAIMAH ALIFIA AMRAH', '$2y$10$1acwpJ4jCFUtiyz6lfI9tOC902mii.iV3RfkdOpC6nEe3zDgBSlom', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (77, 169, 'jesicaselvianadewi575', 'JESICA SELVIANA DEWI', '$2y$10$CQSd8eQepuBkaf2wBkyCfesMReiC4SW8RdPGAVeZtUL7tppYaLM6W', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (78, 170, 'kharismaputrianggraini119', 'KHARISMA PUTRI ANGGRAINI', '$2y$10$FKb0A5zLVtKKoHSBp5ZlDesINUmwCb7tQbLZmHWg/REcRKFG5a5b2', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (79, 171, 'mayadwiarisanty826', 'MAYA DWI ARISANTY', '$2y$10$wcks/Q5aRfydj6WnHvYFQOalWjdHMsnxT7sDqYEl0EnLlreO7bS56', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (80, 172, 'mohammadrafelianfirdaus492', 'MOHAMMAD RAFELIAN FIRDAUS', '$2y$10$suLu2Obeaw4d3HpstWbmQOKyYaf81tfltDZgX5dt/kFEtzcWUkfBK', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (81, 173, 'muhammadardiansyahpratama768', 'MUHAMMAD ARDIANSYAH PRATAMA', '$2y$10$vbokLhAqgSd/l/.bAk3wueAZjZbcQk0mmnhg4XPDShwQQ7BPdl4TO', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (82, 174, 'muhammadifankhairulumam642', 'MUHAMMAD IFAN KHAIRUL UMAM', '$2y$10$AKaxp8twgdPfZ8MHPOLKzOJnkTp382BMXo8Vp5E2J3PD2LILfO1d2', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (83, 175, 'nadiaayupujiansyah215', 'NADIA AYU PUJIANSYAH', '$2y$10$b/2xOrR21maPM9n/Nsza7O7PO6r.stCTOYq6ZQ9aKf3NUcpzK2sdG', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (84, 176, 'nadyacantikadamayanti300', 'NADYA CANTIKA DAMA YANTI', '$2y$10$qca10JyyS5UAy75uyG48/eibmmvT1SeyUPsM/fM8NfcEPkeR/Ikhe', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (85, 177, 'najwafibriajannatiladni160', 'NAJWA FIBRIA JANNATIL ADNI', '$2y$10$6fZ/IWr3E4f5bz6cIGoOLe6Rc07Ot4mZ7uYQ4wfJw6e.sYz0MR9PO', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (86, 178, 'nouraputriarilam275', 'NOURA PUTRI ARILAM', '$2y$10$ZtRmfVPNKtlTppzp2eor/uAE4XdUPMVl5HNBxzTCjrSeqTJ4I1/ve', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (87, 179, 'putriyofisalwaawlia458', 'PUTRI YOFI SALWA AWLIA', '$2y$10$oPxGnSPDAYbSy6THb.z4SOUQUYZq9OkB/foTGmnB7xw8HgaDZRxz.', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (88, 180, 'rafisatussyarri2610', 'RAFISATUS SYARRI', '$2y$10$sW8yK8/4XNLHvUoVKxWi1ulQR8oF9td0IJXFbAzjgvjlPjQ5l5bg2', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (89, 181, 'raysaanindya992', 'RAYSA ANINDYA', '$2y$10$.LNcLzOB04VO3eqYDcAdMeuNOOkJ2pSy5dWsWxQLW1gcDhtqaiDU6', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (90, 182, 'revatulhasanah275', 'REVATUL HASANAH', '$2y$10$dQ5Hdu0D0pvDsMzUdA5GJ./nLdmyLeYY8bOuOGpZMzC2joORuU/lu', 1, 2, 3, 3, 1, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `siswa` VALUES (91, 183, 'risqisilviana231', 'RISQI SILVIANA', '$2y$10$/s2YClj2mjuA590twkzoC.jHgTPYsI0/4BYYGBmKhZEnReMsreR3a', 1, 2, 3, 3, 1, '2023-09-13 19:15:40', '2023-09-13 19:15:40', 1, NULL);
INSERT INTO `siswa` VALUES (92, 184, 'saadah627', 'SAADAH', '$2y$10$hap3Fymd2cnln/R.q0ckRueidPuyjPi9qBV7xIIvlzYV0ACVTMwmy', 1, 2, 3, 3, 1, '2023-09-13 19:15:40', '2023-09-13 19:15:40', 1, NULL);
INSERT INTO `siswa` VALUES (93, 185, 'sahwasaqatittarra861', 'SAHWA SAQA TITTARRA', '$2y$10$uz/jE/NOwQrsPK0.yqWZUOiBcQPQi3jlRjg3XvS7EDRC7m3SuwtO.', 1, 2, 3, 3, 1, '2023-09-13 19:15:40', '2023-09-13 19:15:40', 1, NULL);
INSERT INTO `siswa` VALUES (94, 186, 'salsabilaamenatalaura923', 'SALSABILA AME NATALAURA', '$2y$10$8zJ/GN5KaaUuG7NJW2.HauLGlffTIquOr7f27qfEQLMQrev0TPUke', 1, 2, 3, 3, 1, '2023-09-13 19:15:40', '2023-09-13 19:15:40', 1, NULL);
INSERT INTO `siswa` VALUES (95, 187, 'sitiratnamaisaroh869', 'SITI RATNA MAISAROH', '$2y$10$ZFfVNveuHfIVbQorTb/aMO9NldO.iiNYzOG31PZwmf2e2KLrsWTUK', 1, 2, 3, 3, 1, '2023-09-13 19:15:40', '2023-09-13 19:15:40', 1, NULL);
INSERT INTO `siswa` VALUES (96, 188, 'uunwulandari391', 'UUN WULANDARI', '$2y$10$cLKOMj8Cnfm4pGzB8QO0FeIBNoW6MwJLWSV0G3uv9mMB0cD9r2uM2', 1, 2, 3, 3, 1, '2023-09-13 19:15:40', '2023-09-13 19:15:40', 1, NULL);
INSERT INTO `siswa` VALUES (97, 189, 'yasminauraputri4910', 'YASMIN AURA PUTRI', '$2y$10$gUHavwkFr38ocWGNeOsJVOEUBJMW0qHSVWEGBLmYOH3r.ZsHHsT0C', 1, 2, 3, 3, 1, '2023-09-13 19:15:40', '2023-09-13 19:15:40', 1, NULL);
INSERT INTO `siswa` VALUES (98, 190, 'yumnailmiahfebriyanti649', 'YUMNA ILMIAH FEBRIYANTI', '$2y$10$GRUc2zUAg99srPGSknZ9temTBMH1/hxKUQZKSfz1C032/S8m/gW3u', 1, 2, 3, 3, 1, '2023-09-13 19:15:40', '2023-09-13 19:15:40', 1, NULL);
INSERT INTO `siswa` VALUES (99, 191, 'zahratullaeli987', 'ZAHRATUL LAELI', '$2y$10$tkAN48Wz3WwS5cNvrGKFQus34a55iSdZEdQBDLPB84L.VFtaO7h1m', 1, 2, 3, 3, 1, '2023-09-13 19:15:40', '2023-09-13 19:15:40', 1, NULL);
INSERT INTO `siswa` VALUES (100, 192, 'aisyahdivanadya710', 'AISYAH DIVA NADYA', '$2y$10$gaIdC5967q1daAW8tEXBf.Oj0SZmajREKas.dc9p1zMsSSm76jR7u', 1, 2, 4, 3, 1, '2023-09-13 19:15:43', '2023-09-13 19:15:43', 1, NULL);
INSERT INTO `siswa` VALUES (101, 193, 'alikaattabila504', 'ALIKA ATTABILA', '$2y$10$mmGsB1hzEyDlCNCuYiZDzecLc38.58n3FTmiuOOiTFShN5NMaiLpW', 1, 2, 4, 3, 1, '2023-09-13 19:15:43', '2023-09-13 19:15:43', 1, NULL);
INSERT INTO `siswa` VALUES (102, 194, 'auliaputriangraini151', 'AULIA PUTRI ANGRAINI', '$2y$10$rIlQPLgzfwB.Z2h5eY7AeuujLIXJgvBguW4qXP2mQPKhpZVRzhbo6', 1, 2, 4, 3, 1, '2023-09-13 19:15:43', '2023-09-13 19:15:43', 1, NULL);
INSERT INTO `siswa` VALUES (103, 195, 'berlianafadhiladwiwindarti1110', 'BERLIANA FADHILA DWI WINDARTI', '$2y$10$dxolaAqzp8MwMX.mUf18ketdEiOctMyh.JarhT5QRtz69F/45p2iC', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (104, 196, 'delvinurulfransiska694', 'DELVI NURUL FRANSISKA', '$2y$10$wVVPkmhwsh9BOhGR3qXMhuMiUI4h1T33BQdQNS5mIQmJoK8qpSyJG', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (105, 197, 'dwiputriramadhani720', 'DWI PUTRI RAMADHANI', '$2y$10$fpJG8pWLc1.o9vIeWiclyusgjIPQDiNm355jw5GjFm43OaqQ30HkC', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (106, 198, 'fadilatulnafiah906', 'FADILATUL NAFIAH', '$2y$10$XaTo7SWqpC2OJEIKjXozeuro5PJBIIryW9LW.iU/Fg4uL.OG8ON5G', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (107, 199, 'fajarwahyunabilalsyah679', 'FAJAR WAHYU NABILALSYAH', '$2y$10$p/C1CN/zvZEiDChAuMNwMe7HscclzfMXA6DTp82GbYEQGe/hunPA6', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (108, 200, 'halimatuszuhriya493', 'HALIMATUS ZUHRIYA', '$2y$10$pRdvZ19pfw/s4UOQGMXmqelRQDjl3VRF9URlAEMmMGD2dTRJ3JwJK', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (109, 201, 'intanfauziyah999', 'INTAN FAUZIYAH', '$2y$10$tN/m2H7rjCUCNJv7Rp2xWe74QABemsdf5R8AplJCaTi6i971bXou.', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (110, 202, 'jhenissalsabilaramadany124', 'JHENIS SALSABILA RAMADANY', '$2y$10$LMCC6NnPTGnYBeGV0o/FHuPM5VFWLYvGzzo3SfJIGeroiIqgJSUEa', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (111, 203, 'maulidaturrizqohizzaturrahmah366', 'MAULIDATUR RIZQOH IZZATURRAHMAH', '$2y$10$h313RD0fQmfqHx.rCnJ3re7lCzgDV7vHCIxKUpkG73uKOS45/NtkC', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (112, 204, 'mochammadthesarfebrian450', 'MOCHAMMAD THESAR FEBRIAN', '$2y$10$v3vDkVElVF6sUZbhZMJ8yuh5civiM6Ib9gJouD.YbejCKQTJh0e.6', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (113, 205, 'muhammadalifahmi107', 'MUHAMMAD ALI FAHMI', '$2y$10$nzas8sUw.dDKn.wN83VXdO0PPCf.cqQl1J0x7ouFKbKqqVdfUpkxG', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (114, 206, 'muhammadfarhanhidayatullah1000', 'MUHAMMAD FARHAN HIDAYATULLAH', '$2y$10$orYqjyRAE2gNOwlBd.GHfukeEMu2U59L1qbmZ0FzYTTbQE7c9LQYe', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (115, 207, 'muhammadridhoillah131', 'MUHAMMAD RIDHO ILLAH', '$2y$10$BXMG7mtgl8V7TpkcfY2.oOnlr5ZCqLkaWxhS8o2MbLltczsaLgzlG', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (116, 208, 'nabiladwinofiamaharani5210', 'NABILA DWI NOFIA MAHARANI', '$2y$10$8w0N0IYgbP2WWpkIqYt6ZOnqgeQgygreEj..xJ5XMW7ToFKIvsy..', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (117, 209, 'nadinenoktawijaya491', 'NADINE NOKTA WIJAYA', '$2y$10$GvsFEuAxqSweO7tRUukonuwIyp8QWHnwZXLBhQAO1/2ap920o/YWi', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (118, 210, 'nadyakaylakhayrunnisa243', 'NADYA KAYLA KHAYRUNNISA', '$2y$10$XfDmylbQY7DcSNSpJ1mlpO8ZRNjCYaYW8T29B5Ulptm2zYJjQjIVu', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (119, 211, 'naylatulafroh1410', 'NAYLATUL AFROH', '$2y$10$haMo0bf81ZylCqjQI8CNSeTyRJbJcU8xXaZK1.yxOMBHq.u8ijuIu', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (120, 212, 'nurinnajmafajriah428', 'NURIN NAJMA FAJRIAH', '$2y$10$kzzA1QSKHTk4NfJpoUhKPeecq/9KOs2OIjM89tkZe2fR.k5/vGG7O', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (121, 213, 'radyaclarisaoktariasafitri674', 'RADYA CLARISA OKTARIA SAFITRI', '$2y$10$ZjxMxazo5PiaQ.4vZJfyIuiSArf5yJKtB.rp1XPnAKqAmFT4W3hzq', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (122, 214, 'revazahraefendi340', 'REVA ZAHRA EFENDI', '$2y$10$1hVsw3GK/QldrmybjloSuOtIa7ZZH0G9PX49P5bY2xS3XTFHWL28W', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (123, 215, 'rikizainurrahman477', 'RIKI ZAINUR RAHMAN', '$2y$10$vN8VfcmhvTrSfCj0KTk7de2s/nRA9fk/a.X1iNjvHLjhhdGQgfywa', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (124, 216, 'rimaniarputriherdanmi654', 'RIMANIAR PUTRI HERDANMI', '$2y$10$8ocbr6q93Vqyl304tEiRJeNIq/rEkF09Lw48jfQU9TiM.W2W93JGG', 1, 2, 4, 3, 1, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `siswa` VALUES (125, 217, 'rofidatulhasanah571', 'ROFIDATUL HASANAH', '$2y$10$HaCuKdpCbpNjOkO6EFgEMe9GoPhVu36qPiyPcE9uobKtPrYR8ZjCK', 1, 2, 4, 3, 1, '2023-09-13 19:15:45', '2023-09-13 19:15:45', 1, NULL);
INSERT INTO `siswa` VALUES (126, 218, 'safinatunnafiah437', 'SAFINATUN NAFIAH', '$2y$10$qp/yVRT1RGsz2B1q94ijMO9XuQ..6kKluYVguEwl2A/saFzUhtfDW', 1, 2, 4, 3, 1, '2023-09-13 19:15:45', '2023-09-13 19:15:45', 1, NULL);
INSERT INTO `siswa` VALUES (127, 219, 'salsabilaainurrohmah458', 'SALSABILA AINUR ROHMAH', '$2y$10$/Hn/LEPSHcw6YXA25kOMsuL/PmRERZVM8Bk0BHevyJvoxsQbnkBmW', 1, 2, 4, 3, 1, '2023-09-13 19:15:45', '2023-09-13 19:15:45', 1, NULL);
INSERT INTO `siswa` VALUES (128, 220, 'serlyanandatasya477', 'SERLY ANANDA TASYA', '$2y$10$aMMDpQEQrD.19lveWFVT0u6TQG3SwcPY0jDyXSofhP9XotiFpfCOG', 1, 2, 4, 3, 1, '2023-09-13 19:15:45', '2023-09-13 19:15:45', 1, NULL);
INSERT INTO `siswa` VALUES (129, 221, 'ustibungaulfiaini7410', 'USTI BUNGA ULFI AINI', '$2y$10$ymQH/hGCCru05Ui5cevoBuxNYMBNsYZPVhEOu0.Vwxnh5DbVAbIGG', 1, 2, 4, 3, 1, '2023-09-13 19:15:45', '2023-09-13 19:15:45', 1, NULL);
INSERT INTO `siswa` VALUES (130, 222, 'viantikaainunsholehah941', 'VIANTIKA AINUN SHOLEHAH', '$2y$10$2oLx5EIsJ4Y9UKi789DELuqxaMBkhO5LNmLjxo0RF3hOOLLGCDuXO', 1, 2, 4, 3, 1, '2023-09-13 19:15:45', '2023-09-13 19:15:45', 1, NULL);
INSERT INTO `siswa` VALUES (131, 223, 'yulitamegameilani149', 'YULITA MEGA MEILANI', '$2y$10$hRN7wXBj4BkYpjgisk058.c0QxyCewNt5X7ThvF5SyBDOhvUpYVhG', 1, 2, 4, 3, 1, '2023-09-13 19:15:45', '2023-09-13 19:15:45', 1, NULL);
INSERT INTO `siswa` VALUES (132, 224, 'yusroamilinhikmah341', 'YUSRO AMILIN HIKMAH', '$2y$10$0QeQqD0cQOaZSzpVsYUO0Ok3kb48891oxasuZnCso2BPREWlY4Cje', 1, 2, 4, 3, 1, '2023-09-13 19:15:45', '2023-09-13 19:15:45', 1, NULL);
INSERT INTO `siswa` VALUES (133, 225, 'abdialutfianti813', 'ABDIA LUTFIANTI', '$2y$10$wR70QY9KcQQGQdIHytfnxer/eYUhjwiB/jAJtFzNbi2v34HJif/FW', 1, 3, 5, 3, 1, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `siswa` VALUES (134, 226, 'achmaddedekputrahardiansah251', 'ACHMAD DEDEK PUTRA HARDIANSAH', '$2y$10$QfKDG4Wkj7DoV8gnfRCXauGqDmB1rKnZ26eUfpudK5B41S0H.4UYi', 1, 3, 5, 3, 1, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `siswa` VALUES (135, 227, 'aniwardayanti521', 'ANI WARDAYANTI', '$2y$10$rcVBaONPn6Fh/mwkazaq9OGgfZT6Rh0iNRY8AkjegIiElGEBYhf6y', 1, 3, 5, 3, 1, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `siswa` VALUES (136, 228, 'aurelianatasyasalsabila887', 'AURELIA NATASYA SALSABILA', '$2y$10$vyEefnyyB2ol7JG502NoG..lUHEFXsTGSumDg83upyTGD0tG2c2Au', 1, 3, 5, 3, 1, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `siswa` VALUES (137, 229, 'carolinasulfahbernessa646', 'CAROLINA SULFAH BERNESSA', '$2y$10$uXuABLis3yScd1QvfTcVx.wsRj1rtr0iqNawSyeVzWfrTMaYB1ksq', 1, 3, 5, 3, 1, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `siswa` VALUES (138, 230, 'cindyafauziyatulkamilah465', 'CINDYA FAUZIYATUL KAMILAH', '$2y$10$mnx.mcyPoAblH3ZT43aPwuH2LJT5MylmgtX4t9i6LPu0a2RhLmHhy', 1, 3, 5, 3, 1, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `siswa` VALUES (139, 231, 'deviannisaussholihah942', 'DEVI ANNISAUSSHOLIHAH', '$2y$10$xBDDFUTYcWfv9u2rGlrfYO6.z1SbGmjn5tR5tGh89yir7ExqyZ.xy', 1, 3, 5, 3, 1, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `siswa` VALUES (140, 232, 'dewinurayu422', 'DEWI NUR AYU', '$2y$10$MNwvKP2f6ckO6o03cCULDO9qCqlpjOjQVyb2i7iYUSRrscqOyU1Zm', 1, 3, 5, 3, 1, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `siswa` VALUES (141, 233, 'evysusilowati171', 'EVY SUSILOWATI', '$2y$10$Gy8wx2.IQjWzkSjNgYyXe.amitbvbbmsLc/rFKMifjc0TiNVhpUFC', 1, 3, 5, 3, 1, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `siswa` VALUES (142, 234, 'fahriefendi201', 'FAHRI EFENDI', '$2y$10$v2Zeg7KPDnZZvs87UZdmtOXHuhXE3YBOZyjS52KWRzXqImjoQlbIm', 1, 3, 5, 3, 1, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `siswa` VALUES (143, 235, 'fatimahdiansafira487', 'FATIMAH DIAN SAFIRA', '$2y$10$2ab.xrOBxlrjgesQUDlSzujJYLn9sWH2oxD3fYE72K.equyp7B2my', 1, 3, 5, 3, 1, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `siswa` VALUES (144, 236, 'finarifhatun830', 'FINA RIFHATUN', '$2y$10$2bG5Wca1Hcemt4egpVYpdunN6PFm3BzxX5NMD7fSRH9cMluo44isa', 1, 3, 5, 3, 1, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `siswa` VALUES (145, 237, 'fitrinurfaisyah630', 'FITRI NUR FAISYAH', '$2y$10$.twMGWk6JYlKZPBEKJQdiudCuqk94vcXX1xjQWwEKnx2CuVlsUCy2', 1, 3, 5, 3, 1, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `siswa` VALUES (146, 238, 'imildanofiandira551', 'IMILDA NOFI ANDIRA', '$2y$10$2CB.fl/ux/XeCErn45gizumxiytr9e8LvFYQsqJHP5I07fYZL7Fpq', 1, 3, 5, 3, 1, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `siswa` VALUES (147, 239, 'karinaeffendi398', 'KARINA EFFENDI', '$2y$10$mm2ChK0pMqsDrWhUfGn/We/wSHRWZZPvzqK472lp6XieRFzNlFd/m', 1, 3, 5, 3, 1, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `siswa` VALUES (148, 240, 'kiranagaluhpratiwisantono872', 'KIRANA GALUH PRATIWI SANTONO', '$2y$10$HZ9yuUuiEPLr3wnuc.xs1e5/n7lekjwYK0WxI9kP1Fgb14jpl7j.a', 1, 3, 5, 3, 1, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `siswa` VALUES (149, 241, 'kiraniajenglarasatisantono291', 'KIRANI AJENG LARASATI SANTONO', '$2y$10$VhMAnLQVil5mwPnCwLCNV.Uf81DPMxG98EwCyO6yuU1UxFKZ4J3i2', 1, 3, 5, 3, 1, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `siswa` VALUES (150, 242, 'lisaamiliya872', 'LISA AMILIYA', '$2y$10$D97.FkE/E2DZW1J.otS0v.PXemod7A6CrUdkpsa3Q5TMxqV1YkMGa', 1, 3, 5, 3, 1, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `siswa` VALUES (151, 243, 'marchelaputriagustin519', 'MARCHELA PUTRI AGUSTIN', '$2y$10$XmKOiBA8NEiT7vMssB4lO.3S/UhHJzFLLmWHzjIwFlakqE.gp2Qk.', 1, 3, 5, 3, 1, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `siswa` VALUES (152, 244, 'meryameliawidayanti473', 'MERY AMELIA WIDAYANTI', '$2y$10$AJGgh6eudGMi9gDtO7gB9upzC/1YypSJrAnGCEwiAFeBp3bH8v4VS', 1, 3, 5, 3, 1, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `siswa` VALUES (153, 245, 'mykaylanajmilfirdausih157', 'MY KAYLA NAJMIL FIRDAUSIH', '$2y$10$NvD1RUAuZ4Gg5C1.FgNe/ewPWdFjIZcYOiYPRB1w.kHR/CPNf5ooy', 1, 3, 5, 3, 1, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `siswa` VALUES (154, 246, 'nabilacandradwianggraini547', 'NABILA CANDRA DWI ANGGRAINI', '$2y$10$MYIEYvQ5ZCqMiERQECap7.9Bq/ZvIf0a1UB2csBHppVzaV6Qt5pMW', 1, 3, 5, 3, 1, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `siswa` VALUES (155, 247, 'nurrestiamelia494', 'NUR RESTI AMELIA', '$2y$10$sZ22gF9KtXLGQp1uo62X2uQlSgT7vq4NuTrN3dQ02gGWKMbkQBWp6', 1, 3, 5, 3, 1, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `siswa` VALUES (156, 248, 'okiramadani426', 'OKI RAMADANI', '$2y$10$e8ErZ8J/UWMuGbLlaZxYR.77w4zMmaA8m2aRNmdFrzY9MxRCEhB7G', 1, 3, 5, 3, 1, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `siswa` VALUES (157, 249, 'riarahmadhaniagustin586', 'RIA RAHMADHANI AGUSTIN', '$2y$10$AGN.jVkvfrxTkgar1JytcOgISfPHtmvzLCVPDw77mQF7mR48V0CD2', 1, 3, 5, 3, 1, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `siswa` VALUES (158, 250, 'safiraaprilliaputriazzahra3210', 'SAFIRA APRILLIA PUTRI AZZAHRA', '$2y$10$PihbbygixAwBrh5TLY4x.eqyG8Hp4d.lnq2.eY/39cI3gwkPycE36', 1, 3, 5, 3, 1, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `siswa` VALUES (159, 251, 'shintyadwivergita831', 'SHINTYA DWI VERGITA', '$2y$10$DG1zjqBM0nteagpBT7LB6uNHlb1RssTZMV4frcpxXNRjB5qm9pdFi', 1, 3, 5, 3, 1, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `siswa` VALUES (160, 252, 'sintaamelia8110', 'SINTA AMELIA', '$2y$10$tR9UtqcfzxnV4eE95jemeevXtX6Xp5zGZU0BynN9k8AaTIsnn1Zpm', 1, 3, 5, 3, 1, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `siswa` VALUES (161, 253, 'sitifahria926', 'SITI FAHRIA', '$2y$10$RNnOvP1LhYKnZpg0eWZSuOkBvGMbrA7sd4kdGQKNTfmASKRmt/ca.', 1, 3, 5, 3, 1, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `siswa` VALUES (162, 254, 'sitinurhasanah821', 'SITI NUR HASANAH', '$2y$10$kzdSxolsVCUVABIxqU6vPOP5WiQwuz8eJSnbWENHTm9B1YMqMXA3.', 1, 3, 5, 3, 1, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `siswa` VALUES (163, 255, 'tiarasalshalaurabila232', 'TIARA SALSHA LAURA BILA', '$2y$10$uK8dokRW9bAkSmOhYRac6.4f81vHfNoJlFECExEJyxxJndfZszpOS', 1, 3, 5, 3, 1, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `siswa` VALUES (164, 256, 'wulanrobial298', 'WULAN ROBIAL', '$2y$10$GIYscC1hOYhc8UDP9dX4qO/kAS3bT7YB.oVjeOykHP7B8Js8nbKF.', 1, 3, 5, 3, 1, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `siswa` VALUES (165, 257, 'yulytadellasabrinaekaputri822', 'YULYTA DELLA SABRINA EKA PUTRI', '$2y$10$qlEOZp2ZGCGOVS2iErl/GeSnbaJe/KKZBF2LVXKt/hHADa/bTfewO', 1, 3, 5, 3, 1, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `siswa` VALUES (166, 258, 'adeliaagustin174', 'ADELIA AGUSTIN', '$2y$10$RKjwZbVjjwL5nNjhIpctRudU0Wk9jAp6gu8EF5ZJZlcBujeNZ4TK2', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (167, 259, 'ameliaqoriatuljannah4010', 'AMELIA QORIATUL JANNAH', '$2y$10$ES4CIvIYCk9G19Bo3dKkTuaC2K.kILQO/VkRFNYleXob0NEkzN9Qa', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (168, 260, 'andinirahmawati703', 'ANDINI RAHMAWATI', '$2y$10$6ruHmsf1Vhd0SWhnQZS9LeOJui7bBeVrCAK1EU8ABAwLqHT3KE1kq', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (169, 261, 'andypratama399', 'ANDY PRATAMA', '$2y$10$m4k4bG7om82hIBviUGGj8exnRI0FDcx53JoWbMQ37m2ymSCEgJM5q', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (170, 262, 'budisatrio386', 'BUDI SATRIO', '$2y$10$pKuQhPAUZt/qU68HWCtmpe2groIhVsmNScgGgvxle8ZtdaJixK50m', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (171, 263, 'dyaayusulistiorini505', 'DYA AYU SULISTIORINI', '$2y$10$GiNW/pOVI8KgVT5JIapsBuOdHY9XmS1w619Q5EJmNMO5jGxQu4OFq', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (172, 264, 'fayadagustianriyadi962', 'FAYAD AGUSTIAN RIYADI', '$2y$10$GdE1ig2ugHe7t7wHGPzFPe4BBwGqOiAyiKIukhlGts.jbByLOXXni', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (173, 265, 'fitriyunitanurfatimah770', 'FITRI YUNITA NURFATIMAH', '$2y$10$TTL/gISYQztqT1.OlOlph.QWBo76gAo4k74tv2EE4vxQofvDLPt.W', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (174, 266, 'holifahdindasari326', 'HOLIFAH DINDA SARI', '$2y$10$j.tOwlQy7ElnXg9lZheGBubc6CfLyLA8GLRCTub2n9cTlx14IfFfG', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (175, 267, 'ihwan773', 'IHWAN', '$2y$10$bfQhjgcSWlqD84y.8ZOukuTwSrUYNLSUTk1vukI01pxmWXHTEZiM6', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (176, 268, 'intansulisyanilutfiyah359', 'INTAN SULISYANI LUTFIYAH', '$2y$10$0d/6chp/Hd/DbViOqbx4UuOu32MB.r/NNrtcRmfmn4oBuLePZS41e', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (177, 269, 'mfarelpratamaputra261', 'M FAREL PRATAMA PUTRA', '$2y$10$dLQWwPk4PKmCeCHIIht3jO0MD8iMNREJdcgia2am2mUi6qEpenoLu', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (178, 270, 'melysaavitasari1510', 'MELYSA AVITA SARI', '$2y$10$OQsj8fxnv7HB61ou6nGzHukg1GRDWWdID8adDCldqNQUT4xH11TPS', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (179, 271, 'mochammadrizki776', 'MOCHAMMAD RIZKI', '$2y$10$r0JJbEpaZCOLsDTapttN7uO.85i3JUEOmLnJh0E7dAc3ZCiXVd5zy', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (180, 272, 'mohammadfadlan363', 'MOHAMMAD FADLAN', '$2y$10$man7DA1bPgN8aeds0hV8J.HoTtWQnWxlIb2XImjb95h.EcB5DK04e', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (181, 273, 'mohammadihzanbahtiar844', 'MOHAMMAD IHZAN BAHTIAR', '$2y$10$2WRq53Nw/qH/Okw1D.C6wuyLW3LuHuE1s/E5h3oky74hinLKewQO2', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (182, 274, 'mohammadvigosaputra455', 'MOHAMMAD VIGO SAPUTRA', '$2y$10$qZRQpUgyeRVMEJDqK60FFOvVjvZcPtT323MgcQeKFzM6fn0hq5sjK', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (183, 275, 'muhammadarilprasetyo3610', 'MUHAMMAD ARIL PRASETYO', '$2y$10$RC.GlyUSpwimE4r8Sg.avevJeFGqtwYjXp4DBRLZF.kKEwzHpFbEW', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (184, 276, 'muhammadfaezal923', 'MUHAMMAD FAEZAL', '$2y$10$HBVJmcYE8ztKDV7NrEuQaeuX7.AccjHRbNnrSM848DLU2TbA/KSFG', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (185, 277, 'nabilatullailyfadilah5110', 'NABILATUL LAILY FADILAH', '$2y$10$BcCOZRk0yK3MmwzE40Ud8ONCgPrBpFhZONTxuWLRFOurNTtFbvl12', 1, 4, 6, 3, 1, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `siswa` VALUES (186, 278, 'nafisatuhkamela884', 'NAFISATUH KAMELA', '$2y$10$TCVKP6gPmBVtA3QnU7NR/usXVlXjrKtlc1akoWhV.CMHateuOJR8.', 1, 4, 6, 3, 1, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `siswa` VALUES (187, 279, 'novitajamilatulmahiroh188', 'NOVITA JAMILATUL MAHIROH', '$2y$10$5qOn5/g5zQ/tEWtiuBhNH.ToqXmeyKI0BoGLUtlXHNn2nXL2fznbW', 1, 4, 6, 3, 1, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `siswa` VALUES (188, 280, 'putraaburizalalgifani455', 'PUTRA ABU RIZAL ALGIFANI', '$2y$10$nqsNFPpdm4PtCDkRfi/zLOX2PtEf68ERVMw1KDkCE7VMdeTbp2X/.', 1, 4, 6, 3, 1, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `siswa` VALUES (189, 281, 'putrinabilahuwaida513', 'PUTRI NABILA HUWAIDA', '$2y$10$cQlqLWSseA/GXhemFax72est7hwB3yosd5RBUb7c9wwfPio5Lu6di', 1, 4, 6, 3, 1, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `siswa` VALUES (190, 282, 'revantriagussugiyanto719', 'REVAN TRI AGUS SUGIYANTO', '$2y$10$D1dz/Ud/zMxTC3qDq45mkeBZGDX0T381hRGv8CoONRFIBFJsXWNBy', 1, 4, 6, 3, 1, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `siswa` VALUES (191, 283, 'rikofathugunawan317', 'RIKO FATHU GUNAWAN', '$2y$10$LRuxs1dsbtwviz7SC357a.v4LxqJoCe1o6M27ae3zWnEW76Pig3Dm', 1, 4, 6, 3, 1, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `siswa` VALUES (192, 284, 'robyatulameliaramadhani941', 'ROBYATUL AMELIA RAMADHANI', '$2y$10$YhCE28E0y1XFpmlNVW20Q.mbVLgFwxB7KS2/joo38YHmOTIamuLrG', 1, 4, 6, 3, 1, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `siswa` VALUES (193, 285, 'rofiulkhoiri570', 'ROFIUL KHOIRI', '$2y$10$g10VMviYHAPzvzIe6WGvpe97UEwJv8BTab9B0UqxNOP/aNbkdY8A2', 1, 4, 6, 3, 1, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `siswa` VALUES (194, 286, 'sarifah394', 'SARIFAH', '$2y$10$TX1pnFoXG58nzZR6NhcKZOVhRHOED1fW0oAgd8sy.m4emFmIu8aLO', 1, 4, 6, 3, 1, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `siswa` VALUES (195, 287, 'setiawati967', 'SETIAWATI', '$2y$10$Rvyid6E6WBFOg/cZUMjOB.EZCaIdgmpJvhYTr5sxtAX2qLTYgScBm', 1, 4, 6, 3, 1, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `siswa` VALUES (196, 288, 'sittihorriyah831', 'SITTI HORRIYAH', '$2y$10$pMKV0U504hgAkZjI.nmQZO6BapuN9T7dg/vWwapNmGqXCeLjSHLLu', 1, 4, 6, 3, 1, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `siswa` VALUES (197, 289, 'yufiatunhasanah559', 'YUFIATUN HASANAH', '$2y$10$rwJ/A8OZePN7cbIx6MbJKOcSSOnPzPYYdIUSF3Mjh9R760REBXdwy', 1, 4, 6, 3, 1, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `siswa` VALUES (198, 290, 'adindaayuistiqomah846', 'ADINDA AYU ISTIQOMAH', '$2y$10$Weau2vH7XcUezqJBZtiycuEwjsIADqfQzpNo8ZinD53m0zB8amKhi', 1, 4, 7, 3, 1, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `siswa` VALUES (199, 291, 'anandamustikasari540', 'ANANDA MUSTIKA SARI', '$2y$10$NsZmN5vK8dot1IZO5J3wou.6RxI/mYI.gSkagrKJW5KAGBU2ks17C', 1, 4, 7, 3, 1, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `siswa` VALUES (200, 292, 'bagasseptiawanramadhani552', 'BAGAS SEPTIAWAN RAMADHANI', '$2y$10$ETWmgO.T2q8dOLiPHHeFCuLzS1lPNg.VlP422tQGYlIGZX0zhR3iy', 1, 4, 7, 3, 1, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `siswa` VALUES (201, 293, 'chelseabungalestari532', 'CHELSEA BUNGA LESTARI', '$2y$10$2BTmNPxTNE7ieObaZmTgZOwcld24qUZBlrUgLeXoD4ElGOpmS6pUa', 1, 4, 7, 3, 1, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `siswa` VALUES (202, 294, 'dioardiansyah267', 'DIO ARDIANSYAH', '$2y$10$b0YZSHn6Njp0ldYaLXpod.GXDwrYbquosAiBz4t35iaetuQ1hRr0C', 1, 4, 7, 3, 1, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `siswa` VALUES (203, 295, 'fitamitaagustin819', 'FITA MITA AGUSTIN', '$2y$10$GdaxoErV12xNUbsbBGUY5eHb2MbR7L/o5sCLKq86n8.ITR/xRK5pG', 1, 4, 7, 3, 1, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `siswa` VALUES (204, 296, 'friskaoktavia200', 'FRISKA OKTAVIA', '$2y$10$ZX47f8ltfw6QyDLQ2T8j3edSybfgFkCTp7KYsmM0TQDEizS8J0Y6.', 1, 4, 7, 3, 1, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `siswa` VALUES (205, 297, 'hairulumam420', 'HAIRUL UMAM', '$2y$10$htQ1RrObFtuMP.yQjVwkhOsRM/2q29vIMAO0f/aIs3C0EC08tftqO', 1, 4, 7, 3, 1, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `siswa` VALUES (206, 298, 'intansulistiawati447', 'INTAN SULISTIAWATI', '$2y$10$gNTb61yv9vcT6JuZmmgIGe6h3QD2exs3yUsmx9Zf5VRSYgX34gzvO', 1, 4, 7, 3, 1, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `siswa` VALUES (207, 299, 'ismailrahmadani1610', 'ISMAIL RAHMADANI', '$2y$10$/4iheZdYSiDAvDSDMQNJ9e9blyOu54wHEj9o/VdXE3IF913laldO.', 1, 4, 7, 3, 1, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `siswa` VALUES (208, 300, 'keyzanurmalindaputri751', 'KEYZA NUR MALINDA PUTRI', '$2y$10$PqRkP1rruySWp.XyIHoP6OiI0EUJKba3g/cBUidjUT4xs2x6qkLw2', 1, 4, 7, 3, 1, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `siswa` VALUES (209, 301, 'miasalafiah950', 'MIA SALAFIAH', '$2y$10$UmNf.kLF/x.XA539LmLFVOZ595cclEUDMOymAZV/6dd1rPnLz8l.i', 1, 4, 7, 3, 1, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `siswa` VALUES (210, 302, 'mochammaddwiardiansyah465', 'MOCHAMMAD DWI ARDIANSYAH', '$2y$10$NIum6RQyJ6Ia4QuapKWOde89JqF0dW1RqLuuoUAtl81SZIWdVhyUC', 1, 4, 7, 3, 1, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `siswa` VALUES (211, 303, 'mochammadroyhanthoriq462', 'MOCHAMMAD ROYHAN THORIQ', '$2y$10$xldnOwVGhByttn5mhsoD6eeSYjeSmD.Ro59QkxI1./ORgiWPmxgce', 1, 4, 7, 3, 1, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `siswa` VALUES (212, 304, 'mohammadfarielardiansyah420', 'MOHAMMAD FARIEL ARDIANSYAH', '$2y$10$3jS00EOl6AlOIJngVxAG/eGKsKuDYH38y6Oxrlg4K9RxAoF3z/cU6', 1, 4, 7, 3, 1, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `siswa` VALUES (213, 305, 'mohammadrezaiswiyanto270', 'MOHAMMAD REZA ISWIYANTO', '$2y$10$X.nJnUasjkM4kVuGJTNvuOKb7.AT4xvB1UgHo8Og.bd.l1lYUoNN.', 1, 4, 7, 3, 1, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `siswa` VALUES (214, 306, 'muhammadardiansyah747', 'MUHAMMAD ARDIANSYAH', '$2y$10$OqKeDvF3BlgevVTp3cgNQuA.Qm7b5w7wrvsPZPtHqfKmLq/5yuvgS', 1, 4, 7, 3, 1, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `siswa` VALUES (215, 307, 'muhammaddhaniesaidilmuzammil674', 'MUHAMMAD DHANIES AIDIL MUZAMMIL', '$2y$10$LJ9JMcN7OA0IU./tMCrsruS23DY.Y4g6jbVvdDbuQK3vPUr5dle.y', 1, 4, 7, 3, 1, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `siswa` VALUES (216, 308, 'muhammadrian642', 'MUHAMMAD RIAN', '$2y$10$/otQPIC0aF.QT8LkJpJkKOLL/nyClZjnTuUTKOcUMhbJfmq63T0W2', 1, 4, 7, 3, 1, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `siswa` VALUES (217, 309, 'nafindasyalwaazzahra321', 'NAFINDA SYALWA AZZAHRA', '$2y$10$U4KHxNtLl8SXPYy9zN0U6ehjm70yWsCeNDbopr2obuZqLEGEEJ.O2', 1, 4, 7, 3, 1, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `siswa` VALUES (218, 310, 'novendakamiliawulandari158', 'NOVENDA KAMILIA WULANDARI', '$2y$10$osaqk2JWRJElSsjaW1wZCO98eqan1utOpLbUrhLjNh4k1./OU3koS', 1, 4, 7, 3, 1, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `siswa` VALUES (219, 311, 'nurifatinbariroh340', 'NURIFATIN BARIROH', '$2y$10$d/x6ZjvK.cn0BwoZpaFfceK1A9VNl.hmKelA3uNgsSGkkOg7eUVdS', 1, 4, 7, 3, 1, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `siswa` VALUES (220, 312, 'radityawahyunugraha715', 'RADITYA WAHYU NUGRAHA', '$2y$10$ybc2RAsfzwYbGQhUQZrq3.ZRKBCAjV28WM1E.aVAg/lMJJ4FBOwgy', 1, 4, 7, 3, 1, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `siswa` VALUES (221, 313, 'raodatululum187', 'RAODATUL ULUM', '$2y$10$Snm5j1KX6G0hZr1IfRIEpOhc5Je8EWcZYMo924isgK45SEfMXAuFy', 1, 4, 7, 3, 1, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `siswa` VALUES (222, 314, 'ridhogunawan761', 'RIDHO GUNAWAN', '$2y$10$6BXIk1S.RW1FEtv7o6qIc.CzXr7ke/419JgHogRj9IH0KsdaVua/O', 1, 4, 7, 3, 1, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `siswa` VALUES (223, 315, 'robbyirhamfanani857', 'ROBBY IRHAM FANANI', '$2y$10$Ta0ZOsw0djGc8blmyN9ABO41Wx3p5vgnHX0/evXHWMneFveJz/0ha', 1, 4, 7, 3, 1, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `siswa` VALUES (224, 316, 'safitriniaramadani465', 'SAFITRI NIA RAMADANI', '$2y$10$gZhdS3CtNvFr/Y.qhk/kleiGkBqDajxm8cR2Fif.9I/HmfgTvJEhG', 1, 4, 7, 3, 1, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `siswa` VALUES (225, 317, 'septiaayuanggraeni407', 'SEPTIA AYU ANGGRAENI', '$2y$10$3Ve80cqqi6rVjSNsbIuQruTD5A7K5g0O6gxo/AIP6MM0q38XW5m1q', 1, 4, 7, 3, 1, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `siswa` VALUES (226, 318, 'shindymeilinda521', 'SHINDY MEILINDA', '$2y$10$N5NnKXLLoGGiJDYV4tfiZ.b/8BVfIooHpPlGJw5VWB4Td7RILpjUO', 1, 4, 7, 3, 1, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `siswa` VALUES (227, 319, 'wildafirdaussyarifah364', 'WILDA FIRDAUS SYARIFAH', '$2y$10$NdeVH047653640HKflw6NOCLdgWNQG.r/jXn69vNpsG2DQDWqzs.S', 1, 4, 7, 3, 1, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `siswa` VALUES (228, 320, 'zainatulkiftiyah770', 'ZAINATUL KIFTIYAH', '$2y$10$x7JCqdxqI9M0xKuLIvfMSO2/Lpb8k76gcgkQsXDxlxLgZppr3Upzq', 1, 4, 7, 3, 1, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `siswa` VALUES (229, 321, 'abualifalmalikimaulidani4110', 'ABU ALIF ALMALIKI MAULIDANI', '$2y$10$sYUvh7W/tAvMVdjHONxXAOvhHgtj5JJGOpGdKpFamvasxn.9QiJwO', 1, 5, 8, 3, 1, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `siswa` VALUES (230, 322, 'achmadfauziefendi509', 'ACHMAD FAUZI EFENDI', '$2y$10$TzEfpRz3015InM81.VhpDuNIZQPzmg6I50R3A/Acl3giq7zyZZQe6', 1, 5, 8, 3, 1, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `siswa` VALUES (231, 323, 'adityaramadhan289', 'ADITYA RAMADHAN', '$2y$10$KliJ6d9tHXdUZC9JSuooGe0Lj.jChca2/zogQmWyprc.2Upt353CO', 1, 5, 8, 3, 1, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `siswa` VALUES (232, 324, 'ahmaddhoni799', 'AHMAD DHONI', '$2y$10$6QqX5J4CYkJl3XjtKrdygOe6TfN.JzX8q62LQjqznpLeSNOEiew7C', 1, 5, 8, 3, 1, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `siswa` VALUES (233, 325, 'alainjameslay796', 'ALAIN JAMES LAY', '$2y$10$VbQA3aYnlaJQl5ey55ZOquxT6cUBE.LHxUX/IMsWV9BMnGCP3vzHu', 1, 5, 8, 3, 1, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `siswa` VALUES (234, 326, 'alfinmaulana647', 'ALFIN MAULANA', '$2y$10$AUYAwss.d3DM7WmTzVjX1O.SrI6UVK2SXxU96vtVEl6wmsaUdZzhW', 1, 5, 8, 3, 1, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `siswa` VALUES (235, 327, 'andikaapriliansah767', 'ANDIKA APRILIANSAH', '$2y$10$VfgJQGFrZp6K2EdwS80w8eiqWPc1WXWfQYxzyXbXVaT2GkPeDARHy', 1, 5, 8, 3, 1, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `siswa` VALUES (236, 328, 'apriansyahmandalaputra521', 'APRIANSYAH MANDALA PUTRA', '$2y$10$SfhuoWNZa.BZvQZlJ8BifeNlyzoY0TX2KUJDbJEw4OpyItbogbm1K', 1, 5, 8, 3, 1, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `siswa` VALUES (237, 329, 'bagusrobianandika239', 'BAGUS ROBI ANANDIKA', '$2y$10$VOrVTUTQ6zF6sLFMsL.ASewtt466Rtn2vZz.cUMixdm/6CirRf6yK', 1, 5, 8, 3, 1, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `siswa` VALUES (238, 330, 'chairilramadhaniprawijaya424', 'CHAIRIL RAMADHANI PRAWIJAYA', '$2y$10$REG8BGPvWvXQnzgorXxlCerqiDNzZunIYCoNzjHDbbBEGIkqzkSSO', 1, 5, 8, 3, 1, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `siswa` VALUES (239, 331, 'damaraufadzakypratama577', 'DAMAR AUFADZAKY PRATAMA', '$2y$10$H.GE48weS8AQMCgWJicO2OinBRaG1UI0symUhtseUWYuYCO9dZO3O', 1, 5, 8, 3, 1, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `siswa` VALUES (240, 332, 'davinonuroktavianputra640', 'DAVINO NUR OKTAVIAN PUTRA', '$2y$10$Sa.Vad7eBpMo3NDvWK2RHu/IRAu53gBMM7JMJWMABeQ7pjz1qYzC.', 1, 5, 8, 3, 1, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `siswa` VALUES (241, 333, 'farhantaufiqurrachman134', 'FARHAN TAUFIQURRACHMAN', '$2y$10$lE2l5Jb2kVQJwgQ1aKZcPuFHTWwO8Xel5e9WSFDQ4Py0lfK7zWAR.', 1, 5, 8, 3, 1, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `siswa` VALUES (242, 334, 'gitoramadani8810', 'GITO RAMADANI', '$2y$10$2.zJytQQZw5wfbZAnUNHrOzgXWP4xLZEcngmUSI24/9Bc7KZw1wiS', 1, 5, 8, 3, 1, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `siswa` VALUES (243, 335, 'ivannurkarimullah774', 'IVAN NUR KARIMULLAH', '$2y$10$4qZkTCeKcrqqF43HdrQr5OVtLgI5Og3qEdHMjwutqr3CDdnRNpQ4K', 1, 5, 8, 3, 1, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `siswa` VALUES (244, 336, 'kevinalfariziwijaya960', 'KEVIN ALFARIZI WIJAYA', '$2y$10$PaypWFZsCDgVdkq7Jt/K8.dlaMb/UdIyZKno0SmClL2qbsaKUhkhi', 1, 5, 8, 3, 1, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `siswa` VALUES (245, 337, 'marifsetiawan618', 'M. ARIF SETIAWAN', '$2y$10$ycCs14y66Jbg1LP2H6EroOYKTyP19SdEexj9Gj4myRUTLZQSRDNby', 1, 5, 8, 3, 1, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `siswa` VALUES (246, 338, 'mohfahrurrosi880', 'MOH FAHRUR ROSI', '$2y$10$5.gGYkTLzJbjBhdGIBpKHeo5fp/haG/P2QAQpa8Bk8BPnfrJFfy.W', 1, 5, 8, 3, 1, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `siswa` VALUES (247, 339, 'muhammadabihamzah5510', 'MUHAMMAD ABI HAMZAH', '$2y$10$APRSCh6lXukI4xMjmXKMPujU41Jh0WUB1RDgUMGrJcPA0vyZ7pbD6', 1, 5, 8, 3, 1, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `siswa` VALUES (248, 340, 'muhammadfadhilhafizmirza618', 'MUHAMMAD FADHIL HAFIZ MIRZA', '$2y$10$t0hIWFooWC7pwwDj4q38Ierfg.PGOCh2L5BQjnqXyO3ZJtMo6q7Oq', 1, 5, 8, 3, 1, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `siswa` VALUES (249, 341, 'muhammadheru361', 'MUHAMMAD HERU', '$2y$10$2MqznED7ufeL8Mfl0EhOkObG61U0pPsckx7gZ99XotLIHynNJVhUW', 1, 5, 8, 3, 1, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `siswa` VALUES (250, 342, 'muhammadilhamapriliosamsib704', 'MUHAMMAD ILHAM APRILIO SAMSIB', '$2y$10$lMfeHptq6cOlkSzjl50q3eUQYBhlW6H9itlNOG2lDVH7w76Jsg.3O', 1, 5, 8, 3, 1, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `siswa` VALUES (251, 343, 'muhammadmaulanarasyidi910', 'MUHAMMAD MAULANA RASYIDI', '$2y$10$5dBHLiVTmmBgyyFa0sf3iebKBckxliR8Jmw2TOx37wf.mKWEuv5/S', 1, 5, 8, 3, 1, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `siswa` VALUES (252, 344, 'muhammadricovirdianto245', 'MUHAMMAD RICO VIRDIANTO', '$2y$10$/Sah6r1ApR2QG2Wk/qOGHO7UslrDqr9ks30zh3L7ilfgmmCkfKdo6', 1, 5, 8, 3, 1, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `siswa` VALUES (253, 345, 'mustofayoga590', 'MUSTOFA YOGA', '$2y$10$0TqSsFlnPebiAPv2ZnFMS.sYHSpyIrjayWKPKHC/e862cJm9HQRMG', 1, 5, 8, 3, 1, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `siswa` VALUES (254, 346, 'ramadaniseptyrahmatwijaya514', 'RAMA DANI SEPTY RAHMAT WIJAYA', '$2y$10$/XooqXt1x9It55rYb3bbYed82lfeRDnttyeBkdXWXrX6lAtgfHKnq', 1, 5, 8, 3, 1, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `siswa` VALUES (255, 347, 'refiyanadhityafiransyah767', 'REFIYAN ADHITYA FIRANSYAH', '$2y$10$LlhtYOqMZrpZlERhh7tkN.HnKRwmWffy3gVuUIu1rkPTiCUuCKcky', 1, 5, 8, 3, 1, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `siswa` VALUES (256, 348, 'rizalriyanto911', 'RIZAL RIYANTO', '$2y$10$poUPRaIrBf/7k1JS1eAZuekwvZ/BzpIUEDeF8VnqiGRC1JvP3mBrC', 1, 5, 8, 3, 1, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `siswa` VALUES (257, 349, 'rizqidwisahranubaidillah365', 'RIZQI DWI SAHRAN UBAIDILLAH', '$2y$10$vmUBk5C02NgtdkkTjQpe4ePGLDdHL2EW6Bhx1clwDyPfqMIfur8vK', 1, 5, 8, 3, 1, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `siswa` VALUES (258, 350, 'sofyankurniasandi881', 'SOFYAN KURNIA SANDI', '$2y$10$lAVqc0hjrGekfhBoSx1k4OyJWEO3CPbBkkHahmhuBeMBgAPRN2/Fq', 1, 5, 8, 3, 1, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `siswa` VALUES (259, 351, 'subhanbahtiarefendi141', 'SUBHAN BAHTIAR EFENDI', '$2y$10$T9drxXA07qukNLBChCZtF.49przQoaLhf0IXhhWSOkwGPikjfNZ.K', 1, 5, 8, 3, 1, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `siswa` VALUES (260, 352, 'achmadfaizalafandi8010', 'ACHMAD FAIZAL AFANDI', '$2y$10$/kaZx6rhMNy/Avfgo0C3DetMwXCxDNgq5sqkFRAuzhYzG0lR5EsKy', 1, 5, 9, 3, 1, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `siswa` VALUES (261, 353, 'adityakurniawan622', 'ADITYA KURNIAWAN', '$2y$10$wJvvDFg.UCEvubPWOthPvelZZbnrnBc7HIaEzdoxRt.cV1/hI2uOu', 1, 5, 9, 3, 1, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `siswa` VALUES (262, 354, 'ahmaddavaramdhani758', 'AHMAD DAVA RAMDHANI', '$2y$10$iQSQk/FiY9kw3KSZKHyXd.YlxSE.Wdkui8IMyMe2kk979Vmu4YCCi', 1, 5, 9, 3, 1, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `siswa` VALUES (263, 355, 'ahmadmaulana646', 'AHMAD MAULANA', '$2y$10$RxpjMn9phg0C9/H31iq4je4i9UBFnd7kHxBrtf54W.gC6mH8JesbO', 1, 5, 9, 3, 1, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `siswa` VALUES (264, 356, 'alantrimaulana835', 'ALAN TRI MAULANA', '$2y$10$r/TLwmfHKSQLBsGsuJO94ueh7dINxFpxYwujCsjvL7prkjvZAgz0S', 1, 5, 9, 3, 1, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `siswa` VALUES (265, 357, 'anandagilangsisramadhan235', 'ANANDA GILANG SIS RAMADHAN', '$2y$10$s1o.m9d7/8cAmtSINb8r8e6dFind7eL4SBFzkOv5MW5pn1nZEh25S', 1, 5, 9, 3, 1, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `siswa` VALUES (266, 358, 'andikhabagussyahputra969', 'ANDIKHA BAGUS SYAHPUTRA', '$2y$10$gTLA4Ki.G.HzEjC.EppcBetsxPQwI8sDRNc38MDa0uU5rlNnITrfe', 1, 5, 9, 3, 1, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `siswa` VALUES (267, 359, 'arifrezekiahammullah611', 'ARIF REZEKIA HAMMULLAH', '$2y$10$IAEAyzlchdHK5tHO27bV2u.FKyMA4GkQspv9CV7Lo20GrC3w0XlKi', 1, 5, 9, 3, 1, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `siswa` VALUES (268, 360, 'bimaeqysetyawan147', 'BIMA EQY SETYAWAN', '$2y$10$SEbzG0.GndV0Sqhvl8HCo.bZdMxnzZ072HM2yxvpPWtN4Kr5j80li', 1, 5, 9, 3, 1, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `siswa` VALUES (269, 361, 'christianfredericowaledjewa859', 'CHRISTIAN FREDERICO WALE DJEWA', '$2y$10$0bIfRx/5nDVUuyBDPun79..DAKuDM6Ipzj836ipzUb6LoeYt7FtKy', 1, 5, 9, 3, 1, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `siswa` VALUES (270, 362, 'darmawansaputra8510', 'DARMAWAN SAPUTRA', '$2y$10$L1LrTIy1ZQikBovdI42TuueDJHRPVEo4khx31mzzU/s84WbjKbqpe', 1, 5, 9, 3, 1, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `siswa` VALUES (271, 363, 'diegosamirnasri926', 'DIEGO SAMIR NASRI', '$2y$10$kbBTdXELtgulLx5RPde3AODVHdi4myhekBOaSkkNOYGYivmSOqUIS', 1, 5, 9, 3, 1, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `siswa` VALUES (272, 364, 'ferdiansyahdwisaputra758', 'FERDIANSYAH DWI SAPUTRA', '$2y$10$qnsGoE481Z/TcOEYaWw1heg6MSAAiGbsX/0LfJNctxwXPMq4YeAmu', 1, 5, 9, 3, 1, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `siswa` VALUES (273, 365, 'iqbalainuddien560', 'IQBAL AINUDDIEN', '$2y$10$2kLe53W8NlW/ECGm52DfI.eeCUvA2egrxh//Tr..8TnGqFl5cHUvy', 1, 5, 9, 3, 1, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `siswa` VALUES (274, 366, 'julianmosesdomingo203', 'JULIAN MOSES DOMINGO', '$2y$10$jGi2U.oVe7Hu9.rqdrc1E.CUnpGWEpLwYihQ.H9SZ4stnGCZa10Oi', 1, 5, 9, 3, 1, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `siswa` VALUES (275, 367, 'leodwiyanto246', 'LEO DWIYANTO', '$2y$10$FNjfryEliZkti8.k/7pLYuxgPzo0QMEXIRaTO0zu5tbId3CVHymU2', 1, 5, 9, 3, 1, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `siswa` VALUES (276, 368, 'mfajarardhiyansyah409', 'M FAJAR ARDHIYANSYAH', '$2y$10$sbPNcZO9Aj0diyQqLlL8D.ww50QKRrnsMCC9tGajzocMk/FzE7eLO', 1, 5, 9, 3, 1, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `siswa` VALUES (277, 369, 'mochammadandimaulana779', 'MOCHAMMAD ANDI MAULANA', '$2y$10$M7ukdGp/30Mdm7FeCjwox.0YyzKXTb5L46qF/8Yz53bB.zf4vDAiy', 1, 5, 9, 3, 1, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `siswa` VALUES (278, 370, 'mohammadyazidfarhanarifin345', 'MOHAMMAD YAZID FARHAN ARIFIN', '$2y$10$uMz9z/eVVcWgSLOqdbj0C.c9a3fcg.JTJwf3NDwoVLodlyDoaax2C', 1, 5, 9, 3, 1, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `siswa` VALUES (279, 371, 'muhammadarinhosnasaputra341', 'MUHAMMAD ARIN HOSNA SAPUTRA', '$2y$10$ng1UDGSdAC9SQc/kYMA.zeeKpgqJ7srt3ddKhWP7bltmDMJadh/R2', 1, 5, 9, 3, 1, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `siswa` VALUES (280, 372, 'muhammadgilangfirmanmaulana390', 'MUHAMMAD GILANG FIRMAN MAULANA', '$2y$10$ZKyf6LYEfmU90RY8RVhNCOL2z.AnXYZBMcvdLL3MJ8FO/hEhC.Oz2', 1, 5, 9, 3, 1, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `siswa` VALUES (281, 373, 'muhammadikbal493', 'MUHAMMAD IKBAL', '$2y$10$DpvsJ25pIPQKcxZMAtYhze9Wfjf4A7qkrm1fOV1FQKhWzDBkZB.HS', 1, 5, 9, 3, 1, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `siswa` VALUES (282, 374, 'muhammadivanfahrozy279', 'MUHAMMAD IVAN FAHROZY', '$2y$10$Dc/sax15Ev.JlsK/qGLJd.MFgtpXMEmET2U0mJe37wIswXE4tRgui', 1, 5, 9, 3, 1, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `siswa` VALUES (283, 375, 'muhammadyudafirmansyah176', 'MUHAMMAD YUDA FIRMANSYAH', '$2y$10$2wrd2N8dGhg21wqSQhwJrOQ99L7/JQbC3wAKqV7sgx3TMzrNYGSr2', 1, 5, 9, 3, 1, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `siswa` VALUES (284, 376, 'muhammadzainalabidin622', 'MUHAMMAD ZAINAL ABIDIN', '$2y$10$slpEUrF707N0Jboegenac.8lOtrBlazkCJloQRtyF.Q7NoXPxfF/6', 1, 5, 9, 3, 1, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `siswa` VALUES (285, 377, 'nandaarifsetyawan989', 'NANDA ARIF SETYAWAN', '$2y$10$hhsSoLNwJakYenkmAKjsOO31ORzfFlNW7yEh7IkBTDUu4svL/85OK', 1, 5, 9, 3, 1, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `siswa` VALUES (286, 378, 'rayhansultonsyaifullah249', 'RAYHAN SULTON SYAIFULLAH', '$2y$10$9XLZ/BlYZTKVmgGatXEByuV.lQgmogGduOBg.6kOUB2esOLf0gGQS', 1, 5, 9, 3, 1, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `siswa` VALUES (287, 379, 'reihansaputra6410', 'REIHAN SAPUTRA', '$2y$10$OdsDwOKsNzDxDZH93A/nV.LbM7uyIr6ex7ViWyoQHBDu92XoSp46u', 1, 5, 9, 3, 1, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `siswa` VALUES (288, 380, 'rizkidwiarhan515', 'RIZKI DWI ARHAN', '$2y$10$a2XcuGxoJkJpMCYYr/mX7u8XEKc/v6iu79a2nf2yOUzrbouXE7MeW', 1, 5, 9, 3, 1, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `siswa` VALUES (289, 381, 'septiandafafirdaus497', 'SEPTIAN DAFA FIRDAUS', '$2y$10$eAPuOKUTx8X/pcCmQrDrd.iJHL7qRG2JYhoJMGPLelZluJT/T4X.G', 1, 5, 9, 3, 1, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `siswa` VALUES (290, 382, 'stevanukenzawijaya599', 'STEVANU KENZA WIJAYA', '$2y$10$M5xeNHDJHf0pQTp9iDyuqOTJY.ibidWOZCOYNymjC9VYYZ8y5cbEO', 1, 5, 9, 3, 1, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `siswa` VALUES (291, 383, 'wahyuwagiyanto594', 'WAHYU WAGIYANTO', '$2y$10$0Ce/opqlDuEtyJ2aXJ4Zced5C0uhAlRwH/uA9kXaDmTUTL/SgHtmq', 1, 5, 9, 3, 1, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `siswa` VALUES (292, 384, 'wildanhamkadzulqarnain490', 'WILDAN HAMKA DZULQARNAIN', '$2y$10$HY5L.e0ExEQf03dkgpK5IOpc.NP5Quirk9B0ZNGoXDwPnjDK0BWrG', 1, 5, 9, 3, 1, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `siswa` VALUES (293, 385, 'zavarelakbarwardanaputra148', 'ZAVAREL AKBAR WARDANA PUTRA', '$2y$10$dcIZVXWT/zqoPbA43622tOekrwOxtv.6B39rPBBY23OcIBpqr5Xpq', 1, 5, 9, 3, 1, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `siswa` VALUES (294, 386, 'afidahhusniah437', 'AFIDAH HUSNIAH', '$2y$10$VOwMLdWNnBhN3ClGsWTwWuECorf/d3Wcstbr8KC4H7JAB.oNjnm7W', 1, 6, 10, 3, 1, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `siswa` VALUES (295, 387, 'ameliaputridwiregita219', 'AMELIA PUTRI DWI REGITA', '$2y$10$O8nPsDa0IqId3HylKXCSxe0fPB65vi7dlBEnswNM8cu1tjHirdENS', 1, 6, 10, 3, 1, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `siswa` VALUES (296, 388, 'ariefpratama708', 'ARIEF PRATAMA', '$2y$10$OVV9NoYS7y09laf5V9G93eIpBips2t82sTGCBW4MCbBhtIqh8FSQm', 1, 6, 10, 3, 1, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `siswa` VALUES (297, 389, 'aryagunaphalosa136', 'ARYAGUNA PHALOSA', '$2y$10$a030HmfHntk0NodmcGUSj.gLP4U3o5ENxIH06GxUW1LZQ2/rqhhCy', 1, 6, 10, 3, 1, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `siswa` VALUES (298, 390, 'cacanurdiansyahhendrasaputra276', 'CACA NURDIANSYAH HENDRA SAPUTRA', '$2y$10$PTLM2pPwDG1z0Fuc3cPGj.fu.91f8Z7gniLR/b4h.4wOo9rcwTbT.', 1, 6, 10, 3, 1, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `siswa` VALUES (299, 391, 'davinadityaputrapratama347', 'DAVIN ADITYA PUTRA PRATAMA', '$2y$10$iVHt8QRwDRLgUibaWk/DjuOWx6NRjouRmjjBQfPomI97mgWXvuxBm', 1, 6, 10, 3, 1, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `siswa` VALUES (300, 392, 'deftiraayumaharani697', 'DEFTIRA AYU MAHARANI', '$2y$10$lCg3CGWNGnCfjB4D1giEVu2dsOh7HejZRZmvuA8n01AsLHYIdBKEy', 1, 6, 10, 3, 1, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `siswa` VALUES (301, 393, 'devinazadhinejatianggraeni977', 'DEVINA ZADHINE JATI ANGGRAENI', '$2y$10$NgXarGphRJFSijBNWWE9UuhjhuoyyTTCFpYVsloubfeWCqETDLkN2', 1, 6, 10, 3, 1, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `siswa` VALUES (302, 394, 'devitawindhinovarini373', 'DEVITA WINDHI NOVARINI', '$2y$10$iAglHfQgk3ASsFPCUZvCMeGMxOOk4nJa2hA0wu4TSTRkfKXhV4vOu', 1, 6, 10, 3, 1, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `siswa` VALUES (303, 395, 'dhionwibowo651', 'DHION WIBOWO', '$2y$10$9kgNhttT.YADE.TpSXeLcuuoFkJrXnxWUw90/TzwEcH7eQZXT5h.W', 1, 6, 10, 3, 1, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `siswa` VALUES (304, 396, 'divadwiyuliachristanti877', 'DIVA DWI YULIA CHRISTANTI', '$2y$10$huhuInANxRo058DeQrub3.H4c10jIJyidMmW8.J3IxfHGJDFY7Q6K', 1, 6, 10, 3, 1, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `siswa` VALUES (305, 397, 'dwiraniarta442', 'DWI RANI ARTA', '$2y$10$DSoAZVMJRi4AmTf3AWIGBu67BFxXRSNJCJ1gG4dP0FA0N1avJIT/O', 1, 6, 10, 3, 1, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `siswa` VALUES (306, 398, 'dylanirfansyah476', 'DYLAN IRFANSYAH', '$2y$10$2zJjs8ZV4F1B7JwYG3Eqyervzk8k5.icU..7LKPAQdE7AyaZB3mS.', 1, 6, 10, 3, 1, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `siswa` VALUES (307, 399, 'faisalnurriefdarahmat5110', 'FAISAL NUR RIEFDA RAHMAT', '$2y$10$MjYVX0weWTxz7eG2W5.OfeWIFXGFd8qcLDN9WpWB1VK7Dvf076WDe', 1, 6, 10, 3, 1, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `siswa` VALUES (308, 400, 'firkiramadhan460', 'FIRKI RAMADHAN', '$2y$10$3lkBdz/usegekYZAS4IKwuICNvzwG2aLiA/WK7OG3ELdI.uVbqBAK', 1, 6, 10, 3, 1, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `siswa` VALUES (309, 401, 'hengkyfirmansyah836', 'HENGKY FIRMANSYAH', '$2y$10$VbQ70WU67O2QqfTlAkDmgOOPSHuaBKBDOnc1Uq9YFF05xmhFIrSAu', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (310, 402, 'hidehitoshimojo638', 'HIDEHITO SHIMOJO', '$2y$10$MMof5jN3S.d0/eYNEU9W..pqQ0kz48Z/VsoKlg2X6SEZUxGbYT3He', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (311, 403, 'hosen270', 'HOSEN', '$2y$10$F2LCg3M5AGF3ldqDzOhoXuuH1V//qNcRv9NyiccT0R./zG60IQGVS', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (312, 404, 'imeldaalmareta820', 'IMELDA ALMARETA', '$2y$10$BGmwBLPOfphmJK8MygXs2eaIkeubL2Ml/OeLQemX.LS62RWyIuGfO', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (313, 405, 'jafarashshadiq173', 'JAFAR ASH SHADIQ', '$2y$10$v9x6hcOpLdFZVsfofxYRWO.bpps2Y6f.e39Dv1XE8DTd8mSpG7gsu', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (314, 406, 'mohamadtegardwiputra920', 'MOHAMAD TEGAR DWI PUTRA', '$2y$10$4cck3IUnGSrVaFxo4JMJtea7/WfobiKXc1mf2EfDXqwjaRISKpCXu', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (315, 407, 'mohammadrengkuhalam324', 'MOHAMMAD RENGKUH ALAM', '$2y$10$3Dm8J2Tt8YVKZOy86ELsP.Jrl.urVwBuc02an37WRV6CPAJXpjkbe', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (316, 408, 'muhammaddanarhermawan959', 'MUHAMMAD DANAR HERMAWAN', '$2y$10$ss0I.aBW7RxHip51Ip5s/.8f9xtsIU61h0D04eVLAE50el85.GCXC', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (317, 409, 'muhammadgalihnurilholid371', 'MUHAMMAD GALIH NURIL HOLID', '$2y$10$mq3nOwzwkiNKqzr8L/2gX.AtCPziHTQKIyCugVDt/RfXTikcsRmE2', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (318, 410, 'muhammadgianudzrisusanto738', 'MUHAMMAD GIAN UDZRI SUSANTO', '$2y$10$RDwmxIJZDWc98vOWzv678.hM25U7mkkUcbKy7G/RSNqTEGGctA2tW', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (319, 411, 'muhammadkafkabimarodiallah154', 'MUHAMMAD KAFKA BIMA RODIALLAH', '$2y$10$Z/skcAOTj1EVQFvWujJq6uQKsGNKwRzZUuEVXwiU3i1hUbb9bmJF6', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (320, 412, 'muhammadteguhmaulana682', 'MUHAMMAD TEGUH MAULANA', '$2y$10$dDWDrzMWBSCjpTSitCPWS.zKQUQCBMDSHzKCNdET.sla45jhL8Ew2', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (321, 413, 'nancypramestynadyaputri369', 'NANCY PRAMESTY NADYA PUTRI', '$2y$10$b.ws7DVOk/xgiZaVIIn5deas0uDXbExHNR1qGlXy0hC.bFEI2MT/G', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (322, 414, 'naylajauzafikriyah655', 'NAYLA JAUZA FIKRIYAH', '$2y$10$9t5gDfn8W8ujzRCG3K9YR.s1KiMJaMOQkxwPUdSfrkVHwbd4iwuD6', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (323, 415, 'noviatulhasanah7310', 'NOVIATUL HASANAH', '$2y$10$4mNFhvcPOp7cPC26jiVM/e5z6YbdhCaQO1abun8yUktKscwwuYk7K', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (324, 416, 'rafibahtiarhidayat145', 'RAFI BAHTIAR HIDAYAT', '$2y$10$Zfy.5IwLukZST9w.7uZskO8p7rK3gjVtGN/OT3YWgo4mJU1ZV0JjO', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (325, 417, 'sesymaulida4610', 'SESY MAULIDA', '$2y$10$b8xMr9HfjgMk5sjFUhd4keFxcF5lSA1eAchhQpCXmtGqLBeEz3hG.', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (326, 418, 'shafaaneirasalsabilla289', 'SHAFA ANEIRA SALSABILLA', '$2y$10$BJjBZLkX7.nH.SXLrlRM9uT094ZVH36vPeY.0pGxM9aZ4yEW2Xf5O', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (327, 419, 'siratnurachmadbinero312', 'SIRATNUR ACHMAD BINERO', '$2y$10$m1ko0VzVE2yw26BVFI6XVu/DDWUtsx9NomofQzXvW/Zc9enTi/dBK', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (328, 420, 'wahyuramadhaniputra314', 'WAHYU RAMADHANI PUTRA', '$2y$10$kcJ68YbPHSQVJ0ppyOWPDumYI.GbXvmmpE3dTl569t6Nw/Bap8pSy', 1, 6, 10, 3, 1, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `siswa` VALUES (329, 421, 'afinadimaulana164', 'AFIN ADI MAULANA', '$2y$10$jyZs5jGTX2yjs9wJVk1MwOc1i2itkRotJc/RwCKj9y0wFv9itZMay', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (330, 422, 'ailsasaabirahshahnazasad328', 'AILSA SAABIRAH SHAHNAZ ASAD', '$2y$10$jaXTvYeqkjixDtesZY8VQ.Hctgf6yqcV/0/qjgORZdGCiUKesG5.i', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (331, 423, 'alfiahzahratussitah599', 'ALFIAH ZAHRATUSSITAH', '$2y$10$OOr/vv9zkh9qEJkyP/MqXe/CrDrHcO5x6y4qDeiHqeHrddckyQ61i', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (332, 424, 'dendiwahyudi459', 'DENDI WAHYUDI', '$2y$10$i3BxLf31YwYv.3h.BP/FxuJkiCMNaE2m8YR45UY3fs3IIJzDBJJsa', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (333, 425, 'dhanifirmansyah8610', 'DHANI FIRMANSYAH', '$2y$10$MxUcOvcNKd8M/NJHVgbrbOS0uWD7aoAM63q29CEjtzfhxidnz1evG', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (334, 426, 'dikisinarjayasaputra228', 'DIKI SINARJAYA SAPUTRA', '$2y$10$5yI1n3oJIxp7mtI9uUAMreub4DGYEOlzFXuzeHrmitfrlh4y5HNtK', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (335, 427, 'falihibatullah481', 'FALIH IBATULLAH', '$2y$10$CgxvkWw4IVeaxIwFkTfnieH80Qatv6CN3C1ojsFb0414g/YF7Qyji', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (336, 428, 'haidar150', 'HAIDAR', '$2y$10$5udzn4pu8LL5GS/r1vK3veGhlZo7L460YM9pQcauehxRhqINCrZcC', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (337, 429, 'husenfadlullah216', 'HUSEN FADLULLAH', '$2y$10$1yEnI.RmVJWwWkq69tTfUeJy9vlE3p470QuYMZUL.M9s8wVYGb8IK', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (338, 430, 'jevonislamyraysendryan523', 'JEVON ISLAMY RAYSENDRYAN', '$2y$10$BxLAPjQPOD7ZrErsvcJPR.Jw3eUqfSkQQe2Q/xpiUgoo7FpO23hjy', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (339, 431, 'lindavitriani652', 'LINDA VITRIANI', '$2y$10$iEnch3VPM/J0nLs01qjKFuA734E9N9W4L7Sj0csbI.BKcbwfzGSB6', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (340, 432, 'mfarelalfarisi901', 'M FAREL AL FARISI', '$2y$10$dw/fM4SA/Tu6AEPW2.qAfefzpQAiaJceDgvnQi4pSGV5CvuCAh5ri', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (341, 433, 'mhidayatullah1510', 'M HIDAYATULLAH', '$2y$10$yJwbiJVGvmOQ6U7MNb3Ud.X.DsprnieSUn.IBldoBsY7d2d2eY81m', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (342, 434, 'mahesaadanisatriapribadi1710', 'MAHESA ADANI SATRIA PRIBADI', '$2y$10$tC5MdptkR0JJ7lf9DGtncut09NpOs44qNbPL/JCN6.A043ZkK4UZO', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (343, 435, 'muhamadriskiramadhoni653', 'MUHAMAD RISKI RAMADHONI', '$2y$10$FOAr2kDYyqxtOCxt9FwGm.0cZTJ3qtKKiwzRWKwdJUgXX2c1hBIKO', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (344, 436, 'muhammadfadilurrohman1001', 'MUHAMMAD FADILURROHMAN', '$2y$10$E9lLT4Cbe.yo5IhOMVR.yOpbxtQGRRQVEYXUy4Q6x1SMwjPyHtbku', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (345, 437, 'muhammadfaldiirwansyah438', 'MUHAMMAD FALDI IRWANSYAH', '$2y$10$Jgmq/IoV1jN.EqRwPkcAEuJHtoPFBEb3bqvQ/mZVphf8Zaz77l1IC', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (346, 438, 'muhammadfarielaprilyanto6710', 'MUHAMMAD FARIEL APRILYANTO', '$2y$10$odbSctTaXIvMXYhq5Sy6zOLymlPNowdAdwliVOyvRCupDZq9lNily', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (347, 439, 'muhammadgilangramadani634', 'MUHAMMAD GILANG RAMADANI', '$2y$10$g.dnNh5xauRf0jp9/VgvbeV8Wu.NLi53XrOk.932eXirizEx11tnG', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (348, 440, 'muhammadtegarprayogi157', 'MUHAMMAD TEGAR PRAYOGI', '$2y$10$bVvT/jMV1SP4LzDK4bQfs.iW29Kag3iIe8rZnGISi1isqso5LFtSG', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (349, 441, 'ninsiatunnurfadilah191', 'NINSIATUN NUR FADILAH', '$2y$10$QgHg8BOjiifOw7nU3O9P2uNtnNQjg3vrWx2mdRNx9/muWgxtifwcy', 1, 6, 11, 3, 1, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `siswa` VALUES (350, 442, 'novitasari220', 'NOVITASARI', '$2y$10$WKjF2V3zPbgwI5MfOdAwquM.QWAnt1GvI4IaXIB7I98jaRUUfwgAa', 1, 6, 11, 3, 1, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `siswa` VALUES (351, 443, 'nuvalputrapratama284', 'NUVAL PUTRA PRATAMA', '$2y$10$eZYTLLbX/q41S9kgcMdgdOgcctMxW37VXyh.Mm4QY/AneHWjRRmFS', 1, 6, 11, 3, 1, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `siswa` VALUES (352, 444, 'putrimaylenikhoirunnisa975', 'PUTRI MAYLENI KHOIRUNNISA', '$2y$10$SeQ3UjL2Gf5Fx2e9Nat7IuYsS/x1EbEMrfnU7.EIf3VRFKavrVoGa', 1, 6, 11, 3, 1, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `siswa` VALUES (353, 445, 'revaregyaraditarasyid618', 'REVA REGYA RADITA RASYID', '$2y$10$b1l14gvnjt7n/hvhTGrLhuuUtBmhrCcPRR4fmXyYrzIbVXfKaoMHW', 1, 6, 11, 3, 1, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `siswa` VALUES (354, 446, 'rivalinacintyadewi966', 'RIVALINA CINTYA DEWI', '$2y$10$v4Vs4lsQufbE.GOylapla.M8CHFx2oCyoWo3arOnwyxFs2NlyLyEm', 1, 6, 11, 3, 1, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `siswa` VALUES (355, 447, 'rossaapriliancandra329', 'ROSSA APRILIAN CANDRA', '$2y$10$7TJVyG.JD5fP6ekuswFJ1OpXWD9iIqpKfKXJkT5Qx3TMM8TKKGlYi', 1, 6, 11, 3, 1, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `siswa` VALUES (356, 448, 'sabilatulislamiyah956', 'SABILATUL ISLAMIYAH', '$2y$10$obAt8RiARZITO32GfJV3A.tCTN35Yd7Vi4gHtgioSidqsPLgmrHMC', 1, 6, 11, 3, 1, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `siswa` VALUES (357, 449, 'siskawulandari2010', 'SISKA WULANDARI', '$2y$10$mEcWhDlLy6Hizs.pYWRblegHZnhKfsHcOtQGFR61vxXj0.QPEMvKm', 1, 6, 11, 3, 1, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `siswa` VALUES (358, 450, 'sitiholimatussakdiyah591', 'SITI HOLIMATUS SAKDIYAH', '$2y$10$6FXM1oRbzVqkpXBJoxNcwurnWO6BNGOoW43ttOe1JB16ITLzooOWa', 1, 6, 11, 3, 1, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `siswa` VALUES (359, 451, 'tegarjayaramadhan932', 'TEGAR JAYA RAMADHAN', '$2y$10$gLhOf50vPfYEZqsaIanyBO2my.XZYvVVR2gmt8KdgE8wa6qQN6L8S', 1, 6, 11, 3, 1, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `siswa` VALUES (360, 452, 'wildanpratamawahyudi185', 'WILDAN PRATAMA WAHYUDI', '$2y$10$uca.cPQww/bJTHs0DRytQuBLC.8mWnlJ7rXSpBqWMfM8H0FRDtRNC', 1, 6, 11, 3, 1, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `siswa` VALUES (361, 453, 'yudhadwijuliantaruna457', 'YUDHA DWI JULIAN TARUNA', '$2y$10$tLoO5p0shI3DgU.Km8jS/OJ.btYWhu.eRuDX2EzgQtJXgzQEn1Pka', 1, 6, 11, 3, 1, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `siswa` VALUES (362, 454, 'zhameerbhazhamkhanali571', 'ZHAMEER BHAZHAMKHAN ALI', '$2y$10$U8nWJStcxDMBzCOfTJ2XY.zn338zYjYqDnL/qFWshezbX0HPRomu.', 1, 6, 11, 3, 1, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `siswa` VALUES (363, 455, 'abhistaarmediobambangputrapratama155', 'ABHISTA ARMEDIO BAMBANG PUTRA PRATAMA', '$2y$10$kK1.K5fz20atkG2R8v8cyOdxSyvpmEUq1HdebwcYNpYantdNLJtz2', 1, 7, 12, 3, 1, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `siswa` VALUES (364, 456, 'achmadaramaafianmaulana821', 'ACHMADA RAMA AFIAN MAULANA', '$2y$10$dH7qFyeJDSeKIq5fRtS3XO37zNuOJ4va4aAi65cC8kyHvfJpvKIg6', 1, 7, 12, 3, 1, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `siswa` VALUES (365, 457, 'ahzariafebrynauerella312', 'AHZARIA FEBRYN AUERELLA', '$2y$10$eI30A5gQtu4aErDyTsfYw.p7gHFdGd/yWAdtmpqhfVmr2z/BVbkm6', 1, 7, 12, 3, 1, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `siswa` VALUES (366, 458, 'aksalfadilah733', 'AKSAL FADILAH', '$2y$10$Teq/DHrRTbVFEvdRajrm7u8G.3twCYHp1hcR1R5SlMofhk76F.hNS', 1, 7, 12, 3, 1, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `siswa` VALUES (367, 459, 'al-zoraauliaputrahartono470', 'AL-ZORA AULIA PUTRA HARTONO', '$2y$10$ct3IeGWkyU2jMk0NUBlN1OjHUnnrAIUAAE79uyAKNfTZ1TbOdTxme', 1, 7, 12, 3, 1, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `siswa` VALUES (368, 460, 'angguncitradewi1006', 'ANGGUN CITRA DEWI', '$2y$10$uuRiTsLEq7TFqIye2LkRBuCFO/WBnt/IydjbQD9G693mWU8V360.G', 1, 7, 12, 3, 1, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `siswa` VALUES (369, 461, 'azzahrosafitri680', 'AZZAHRO SAFITRI', '$2y$10$cEOzQ5/4YWoFFnrTHzvBfOXyYOzCbDHkwrNTtMBIFCW8hQ3M1oyHu', 1, 7, 12, 3, 1, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `siswa` VALUES (370, 462, 'bimaanggaraputra528', 'BIMA ANGGARA PUTRA', '$2y$10$rKAMDu4fRYmCpuNJv20Mlezpq8AqjSwBFddHJCNVxpuwoHnl2anjy', 1, 7, 12, 3, 1, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `siswa` VALUES (371, 463, 'bimofaisprakoso624', 'BIMO FAIS PRAKOSO', '$2y$10$MHVinOBC.u5cnQw5dpqhAO8Ua1y/HQzLYjM6TAYQc2aQcQ.qMouWa', 1, 7, 12, 3, 1, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `siswa` VALUES (372, 464, 'bintangagustianoeffendy378', 'BINTANG AGUSTIANO EFFENDY', '$2y$10$0JTPqoaFokLX7keai3R4pehVebzOMGe7T4eUJvcejU7MYdPfjbAvW', 1, 7, 12, 3, 1, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `siswa` VALUES (373, 465, 'bintangzulvianshori104', 'BINTANG ZULVI ANSHORI', '$2y$10$tWvX9QyblvFd8.OQacs60uICiKbu5iaxwldr17uVCjcIxQOSiGeRm', 1, 7, 12, 3, 1, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `siswa` VALUES (374, 466, 'davaagistyan173', 'DAVA AGISTYAN', '$2y$10$5iv0ZdqeYJqB/j3.YA5IHuw6xWp2w/u7DIwwvgP43oVIrllzn1gZm', 1, 7, 12, 3, 1, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `siswa` VALUES (375, 467, 'dimasfebriansyah269', 'DIMAS FEBRIANSYAH', '$2y$10$M6CQPpSI84tpnmxovlhBjeH0LlS3NaEObWUMGGX0YuSZvv0zPhuiy', 1, 7, 12, 3, 1, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `siswa` VALUES (376, 468, 'fadlurrahmanafifizzuhaq495', 'FADLURRAHMAN AFIF IZZUHAQ', '$2y$10$0YnILshz3pqxcHrYG3uPe.FCj8CSP1cqKmtqNJBNUc1B.YnhQdgwq', 1, 7, 12, 3, 1, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `siswa` VALUES (377, 469, 'faithrizqirismanto861', 'FAITH RIZQI RISMANTO', '$2y$10$eNfG2WltIQU/MiR8TkG/O.wS3j1SY7RIshn3snWpK0ZV1EI4aSLIe', 1, 7, 12, 3, 1, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `siswa` VALUES (378, 470, 'firstymaylishaputri895', 'FIRSTY MAYLISHA PUTRI', '$2y$10$DrXkXnSteuuhaImBKTPl8e7eCSYg49LGHKfx1luZbAW/OAFxaQy.u', 1, 7, 12, 3, 1, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `siswa` VALUES (379, 471, 'geniusislahprasasti465', 'GENIUS ISLAH PRASASTI', '$2y$10$pg90jqFM4CGR6JS2rKXsX.WMwETChsW7Ts2q0Hx7k.pLRVOLjnlDa', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (380, 472, 'josomontahaadityapratama108', 'JOSO MONTAHA ADITYA PRATAMA', '$2y$10$Rx8K5xLIWDY9Je.iBMruTe0SbE8eiyLQ3IKwlkXedClVh2TiUxLJm', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (381, 473, 'juliadonitasafitri204', 'JULIA DONITA SAFITRI', '$2y$10$xMqbnQL7ARm3tBNq3d2HyOQ1gXPxoAGjN9pQcPtByRTI6lHnfUsPG', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (382, 474, 'kevindradhityawicaksono278', 'KEVIND RADHITYA WICAKSONO', '$2y$10$XP6CERF87DGcpEH8vvqd/u0dBnYJV5k7wQspwmEk1Pu/krUvybAAK', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (383, 475, 'keyvanorifqiandriansyah554', 'KEYVANO RIFQI ANDRIANSYAH', '$2y$10$uz1ivfiQxvNLyFRDxiOMlOuY8e5l8A99SQKU6unKBO6fWl7wBah9a', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (384, 476, 'mochammadgibranjalalludinyusuf422', 'MOCHAMMAD GIBRAN JALALLUDIN YUSUF', '$2y$10$zr1hVsLtzGDjUDrWrMk7x.HukEgA9hYOhQMe8MWQfX.M1zwmwJ9li', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (385, 477, 'mohammadrivaldodwimaulana639', 'MOHAMMAD RIVALDO DWI MAULANA', '$2y$10$RQgOrttl59M7clF7buGefeseT28rV18nBZdUuHtQGloOuJiWsy8Je', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (386, 478, 'mohammadsaifulgalang109', 'MOHAMMAD SAIFUL GALANG', '$2y$10$1sMpFboG.SwxQ4sHA0eDQOFUX0Nx9d4WBv3byU2jMV94efjVehKmS', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (387, 479, 'muhammadirwansyah470', 'MUHAMMAD IRWANSYAH', '$2y$10$AuUifBdWU64dYgJYCYdVxuRu1IhXU9KqQK/Jvk3aVXyfL89twDbTO', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (388, 480, 'muhammadseptianurromadhon419', 'MUHAMMAD SEPTIANUR ROMADHON', '$2y$10$UXVY3t40cIOIv0YHlcJmOufgFuA5Pn4dupfwaIAIbPUkoYyUNcxWq', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (389, 481, 'nicholaschristiandianto825', 'NICHOLAS CHRISTIAN DIANTO', '$2y$10$GzRGtQNpgGMhdkLODLbAeOyClAkOwIsFEeB9RQSY1.FTUxCVQyqSC', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (390, 482, 'nouvalsyahputra647', 'NOUVAL SYAHPUTRA', '$2y$10$7pxd9dbHtTsVgUFgLcsTduWMJP06O95ejEUMn72zYgIbz7Mp0QTlK', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (391, 483, 'nuriskandarwijayaanugrah639', 'NUR ISKANDAR WIJAYA ANUGRAH', '$2y$10$MjS8rzxv89LlEpIr6FfiPup/3M0TypVsH4msk3g0mndfmaJhgnIie', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (392, 484, 'reihanaditiya141', 'REIHAN ADITIYA', '$2y$10$EOyBUVQ/.89qjjereiyb5Ond2O8NCl.fPQTVm1688xYIixwlaMbcW', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (393, 485, 'rudisyauqiabdurrozaq234', 'RUDI SYAUQI ABDUR ROZAQ', '$2y$10$C5t649N0.DQhFVf6zNzW0eYaOX/MYlilEhYxRLSCmUqqHK0YKZ5fS', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (394, 486, 'septailhamramadhani686', 'SEPTA ILHAM RAMADHANI', '$2y$10$P8zwLYTSuKh3Ye6PCnKXMeJTOWDUPWlfIvUFKrO6IdvUvwM.6iHKe', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (395, 487, 'wahyuariajidwiwardana155', 'WAHYU ARI AJI DWI WARDANA', '$2y$10$bW2Kj3pZiH3H9t12dDbrgu9a/xuiJIpHhEOHvOLSJxB6.CsGbqCK.', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (396, 488, 'zackyzidane523', 'ZACKY ZIDANE', '$2y$10$oXcdOH9EP3igv4V2FMwEDug94AxBfrOfpiF7UC9bO3j7TrRwMsy2e', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (397, 489, 'zayyandavinpranaja148', 'ZAYYAN DAVIN PRANAJA', '$2y$10$BVV7hXhtHvb5hd/zUbEZY.TaLMmHe6sOLhIckctDdIPXYWNSybUdi', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (398, 490, 'zulvyakmalfirdaus706', 'ZULVY AKMAL FIRDAUS', '$2y$10$9VsSXnSZ6dcGsiS9IuPMre1/oitfZ134jnIy0jnRAW2GoUDbje.Dy', 1, 7, 12, 3, 1, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `siswa` VALUES (399, 491, 'abimanyu724', 'ABIMANYU', '$2y$10$GtHyVzfXqKhhH99u2RE8AeKU7dxrK6Nbfft7wUusoyN/LMNn06owO', 1, 8, 14, 3, 1, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `siswa` VALUES (400, 492, 'achmadbasofiewibowo7810', 'ACHMAD BASOFIE WIBOWO', '$2y$10$Z5m9K/ifMnoIKA4OvUqtmuNP4VvbIYKePj/3.kxy3cuk2o7D4lGFm', 1, 8, 14, 3, 1, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `siswa` VALUES (401, 493, 'alinalainaabadiyah292', 'ALIN ALAINA ABADIYAH', '$2y$10$sgmGJqbqkOXHBlJWRdaQz.dcMU2eXJaDirPXIts9d9Kwa2/XKhYEG', 1, 8, 14, 3, 1, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `siswa` VALUES (402, 494, 'andikadwipermana372', 'ANDIKA DWI PERMANA', '$2y$10$Li93w85Zt02kGA7LL98kZObmnvtsaLPYvs/BLEVAnX4xnMjZCDNZW', 1, 8, 14, 3, 1, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `siswa` VALUES (403, 495, 'andysatria651', 'ANDY SATRIA', '$2y$10$0pZhX64DgYsv.MMTx.aLrOlm.wgJSM.Fi9kZu/DvlZNT7Zl60PCgS', 1, 8, 14, 3, 1, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `siswa` VALUES (404, 496, 'chikaputrikurniawan776', 'CHIKA PUTRI KURNIAWAN', '$2y$10$m9g7b3RdjGKOeEESZteZNeA3SIxW3aFhRHBfw/hF9BWjZLQaACVKy', 1, 8, 14, 3, 1, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `siswa` VALUES (405, 497, 'denimaulanarizki292', 'DENI MAULANA RIZKI', '$2y$10$Lk3jpjhk.H1iaGbqQN81T.9fcREBkRk1cIATAuw5ByzkQeVgiPEha', 1, 8, 14, 3, 1, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `siswa` VALUES (406, 498, 'dewioktafitri351', 'DEWI OKTA FITRI', '$2y$10$HlJ/NaXPY8YublM/l7N6PunNAqZhCBBJi3v4CdhXNGvIBEJODiZDi', 1, 8, 14, 3, 1, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `siswa` VALUES (407, 499, 'dewikafibrianti240', 'DEWIKA FIBRIANTI', '$2y$10$V9WvcU5azvy6tFV6W2eFNeLnr2capQgc9.MUzHZEoF.LS0DNdnYL.', 1, 8, 14, 3, 1, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `siswa` VALUES (408, 500, 'faidatulkarimah348', 'FAIDATUL KARIMAH', '$2y$10$/UutYzF7E0B5CazBscDCGOxVfj89nV0LpA1ndmKkl.pM4Gtsnl1hS', 1, 8, 14, 3, 1, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `siswa` VALUES (409, 501, 'farhanabdillah346', 'FARHAN ABDILLAH', '$2y$10$bKnQ24p1ccFtPymybFsOVOuMX6/qzD2mPLCZJM7hiLsbv/A/JbpZ.', 1, 8, 14, 3, 1, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `siswa` VALUES (410, 502, 'febriyanputrawijaya123', 'FEBRIYAN PUTRA WIJAYA', '$2y$10$1Etxef5jhswC4jDqjOvete4yxoEAB05UJtJ14tSuoDhN0fI6Q5hEi', 1, 8, 14, 3, 1, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `siswa` VALUES (411, 503, 'fikaalifiaerfina453', 'FIKA ALIFIA ERFINA', '$2y$10$sm5kj.658g6hNwCTGqeEieaVm2tnZQhi4BEjNizYvLmYnbbSJZ2Ie', 1, 8, 14, 3, 1, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `siswa` VALUES (412, 504, 'fitrikurniawati151', 'FITRI KURNIAWATI', '$2y$10$/Guvnw/HmFIsuUG4fCa2uOT.qShB.p8LjUkAYyaTCiiaawJbQb.h2', 1, 8, 14, 3, 1, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `siswa` VALUES (413, 505, 'haikalrizkynovaldy435', 'HAIKAL RIZKY NOVALDY', '$2y$10$Vr2JGkiI8PShivI5Eq5dCecRN9WRoomGdQQjHYfhk/jejQR.A7O0K', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (414, 506, 'kevinrivaldiardiansyah976', 'KEVIN RIVALDI ARDIANSYAH', '$2y$10$0o3/CsbvnlfWmtiuAweWLeSHVyUcJlF2PxBPAvl27XcovS7L7BC/O', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (415, 507, 'khoirulanam9710', 'KHOIRUL ANAM', '$2y$10$w/JLUDBp4GSwmYr4W85JB.wrhnnHGQAcGHxaIEzcDvCrysw8xctjW', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (416, 508, 'mstioputrawardana777', 'M STIO PUTRA WARDANA', '$2y$10$0gg9GeVmgSMxYwqCXrOxeesumeogFvvSaZb8VktOC7eB0OK.8soEq', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (417, 509, 'miyaoktafiya126', 'MIYA OKTAFIYA', '$2y$10$xyZXPl5/omE1vMMO2Cr0XuuZ5NZZ.aEehnWzqX8vWLc7CZqaWSR4y', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (418, 510, 'mochammadainnurramadhan421', 'MOCHAMMAD AINNUR RAMADHAN', '$2y$10$w.NpNRyuCTZlTUbr.1Wk8uEN9Rc8tP7QqOypfGNVVP4fswBbEBVTu', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (419, 511, 'mohammadilhamrahmatullah400', 'MOHAMMAD ILHAM RAHMATULLAH', '$2y$10$yKky6V0djc92H1yn9tV9O.jLg1wp4oPMlrngTfip492jTGaL5pmWy', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (420, 512, 'muhammadarieframadhani730', 'MUHAMMAD ARIEF RAMADHANI', '$2y$10$/du8wdyiOnDMX36ot2uDXua2KdFopTUORp8A5SKgqWqobCeqAKHcC', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (421, 513, 'muhammadfarchanalidris3410', 'MUHAMMAD FARCHAN AL IDRIS', '$2y$10$l2cgtDOMn6SqEpin5YVO9eMKb6SmXsobH6m5Opxit7pbLQU3WoYIe', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (422, 514, 'muhammadfikrifirdaus617', 'MUHAMMAD FIKRI FIRDAUS', '$2y$10$xI0rAbudSGaw44gtHhge/eea5U/fMKCI7/HlfucQ2853qWsOeKI76', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (423, 515, 'muhammadguntur8610', 'MUHAMMAD GUNTUR', '$2y$10$RYjRchqRcgjoRA1GT4ED4OhWgeCrYnXzYL0LIK75JFyASyR1TLGl6', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (424, 516, 'muhammadrifa857', 'MUHAMMAD RIFA', '$2y$10$OVGFYS2hjov.Oj1NfFZHLOKItuXJvoltVVK4ziXyXHf5gMRpGabu2', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (425, 517, 'muhammadrivanaffandy225', 'MUHAMMAD RIVAN AFFANDY', '$2y$10$nvEdvFPz/6QEE/ZWC.nVt.Dxpde54PfwR/835xhf9B8hjw7hogFRm', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (426, 518, 'muhammadwildanfardhani819', 'MUHAMMAD WILDAN FARDHANI', '$2y$10$JZrmfZAjqQ.B2tjRw1XLHO7CVdrb.b.ndxQ7AD27DkIMr0IjBSJX2', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (427, 519, 'nurulfikri308', 'NURUL FIKRI', '$2y$10$c1DHxmvuRDnqqr9Un7LJeu53DyTlvyxJpyww8JwWzqbS/GDW/MrHq', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (428, 520, 'rafinurulhidayah341', 'RAFI NURUL HIDAYAH', '$2y$10$7//gRZBYUxRjT01NpfNyL.gz/801z34w5dj0b5ZBr/YUKg0Qytiy2', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (429, 521, 'rivanmeisyahhikmal2410', 'RIVAN MEISYAH HIKMAL', '$2y$10$PrJITXtQIYvHLaJbyRHJtenkpKJagfRI1/MMHHtkm4dzuhnxeC8de', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (430, 522, 'saedanicahyaherdiyanto509', 'SAEDANI CAHYA HERDIYANTO', '$2y$10$ly02Mrn1bLXud6vbBv0cKeMspAMlSzDKTZiWZKlayGPRt2C59dgGi', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (431, 523, 'sitinurfadilah278', 'SITI NUR FADILAH', '$2y$10$lx44KB1XDZM4f1kErcM1V.M8JJp8ORYs81PQrYG0j23100dplFy5.', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (432, 524, 'syifasyulusyulizki8510', 'SYIFA SYULUSYUL IZKI', '$2y$10$SvcZiXS60/2p4lsFHMenvupuCO7wObvz7jAeIJ1LFm/WhNCsDFraW', 1, 8, 14, 3, 1, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `siswa` VALUES (433, 525, 'anydwiyunitaputri168', 'ANY DWI YUNITA PUTRI', '$2y$10$LOS8PJFOrtNGlGEvkJh4fedT2Wa6GrCMQQ1kIC/b/21n3KlaM4bmC', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (434, 526, 'citraulfiazahro445', 'CITRA ULFIA ZAHRO', '$2y$10$BSEGq65ux9wTu/DdcgfJ0OP/Dhw8qnl.Zt2vKKhSu36HqIIJ7v5x.', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (435, 527, 'desiintananggraeni681', 'DESI INTAN ANGGRAENI', '$2y$10$OyFi6jKkQ0SSHlN.bNcSouj2MlJw27H6SB3IxiPiP1DUJWJ/YfAQS', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (436, 528, 'diahlestariadiningsih864', 'DIAH LESTARI ADININGSIH', '$2y$10$0QnmdT2JZ8M00zw1RAtbrOFmnrsyTrrATBeYm/EaKn4ghHxGpnMNC', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (437, 529, 'dwifemmynuriladinda758', 'DWI FEMMY NURIL ADINDA', '$2y$10$xN81cTkWBAxkuO5d55ZdDuYZdnGhERafwyUpL/GkPyxp2u0H2g9ui', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (438, 530, 'faizmaulanaishaq693', 'FAIZ MAULANA ISHAQ', '$2y$10$yQp90s4mmJJ0znQ8MUve1.8slh1S1dQZUHOQEhGROmzbVt71wk55e', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (439, 531, 'itaaprilia311', 'ITA APRILIA', '$2y$10$.QoGzo1/KAhLlUdTtFIHHOk9fLNxtchZnY6u2ztqflxBOzeEJ2lHS', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (440, 532, 'jelitadwiseptianti471', 'JELITA DWI SEPTIANTI', '$2y$10$TRJUlHdRF3zq85SPXPCOOuhMrujs3hLfMaon11hM.RVUW5YDH1J3C', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (441, 533, 'karinanuraini157', 'KARINA NUR AINI', '$2y$10$23iPAIZqcfpkz9MKBc0gC.zKxzX1LAHksHTBE/PoiUaSvbFJgR6Ca', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (442, 534, 'khalifahselaartanti521', 'KHALIFAH SELA ARTANTI', '$2y$10$iT4z7ujFAgIc3iyyGQWwuezF.S5sZhya9yRqZ3zEGkLlFRUO3kDlu', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (443, 535, 'lailatulmaghfiroh540', 'LAILATUL MAGHFIROH', '$2y$10$umPLgCrUITlYGfmU0pCtpuf2ls/NM4lXvSszjSrEVb17D.mORjlBq', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (444, 536, 'mochamadzainurridwan793', 'MOCHAMAD ZAINUR RIDWAN', '$2y$10$UfxXbLsfTGHC1hvFQPSZceCpZMZt7MYfiNlpmlODJeCRQqno8l8GK', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (445, 537, 'mochammadfarhanseptiansyah230', 'MOCHAMMAD FARHAN SEPTIANSYAH', '$2y$10$lxSKswKXTYHoJFTKRgglGOELpf.39HC7EK3TcQqh6VIDC1o.GHoJi', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (446, 538, 'mohammadiqbalhibatullah601', 'MOHAMMAD IQBAL HIBATULLAH', '$2y$10$uPCEmP4mjW3i8PAoGgnk4eSZDB0ADrX.xNT1BkDrpdFmBuyLqEkvy', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (447, 539, 'mudrikasalsabilah736', 'MUDRIKA SALSABILAH', '$2y$10$qnKsvlZgJRreUuQFVcKn9O/gX55SqFRJklvFcow5apC7iWIdwl.e2', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (448, 540, 'nashifahrosyadahfaiq590', 'NASHIFAH ROSYADAH FAIQ', '$2y$10$Ullewva3ADW.W1FGKjaw2eCAYq6hdduVXOcslLt8FdWA9N9UjlXGG', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (449, 541, 'nidaputriaafiah878', 'NIDA PUTRI AAFIAH', '$2y$10$CA8Cs62PA.twbEKai6vEm./EeoyFHsy8BKoAfERLdENXxOE8VS5AG', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (450, 542, 'nurafnilailiyah944', 'NURAFNI LAILIYAH', '$2y$10$0.A.VWLnevIpxo8k9wlSQeRtSDZsLotH/pJBCXePn2eMcwu.Znd1.', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (451, 543, 'qanitahlailahhaadiahramadhani925', 'QANITAH LAILAH HAADIAH RAMADHANI', '$2y$10$RiW29xywMyGnXRVRX91WZ.SqtkZ6Pdp7B3BIiVihwfN781inI/h1u', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (452, 544, 'raniahsahdamauizah861', 'RANIAH SAHDA MAUIZAH', '$2y$10$E9oovgDDSK2UfPt2hf2Y.OW1HgadDxSb0fdJeHiFTz39A0NUBwoYy', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (453, 545, 'reginaputridwimardah246', 'REGINA PUTRI DWI MARDAH', '$2y$10$vuRazds8sJSlXU83mrvSd./r2ukh1qT8KFmZblJAOc.whEO6PnBUC', 2, 1, 1, 3, 1, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `siswa` VALUES (454, 546, 'retaauliakartika691', 'RETA AULIA KARTIKA', '$2y$10$LNr/HsprtVrr8Pb8RDHb7OIf2iurkKKelFjjqdLZGtHyFnhDz9cFi', 2, 1, 1, 3, 1, '2023-09-13 19:20:44', '2023-09-13 19:20:44', 1, NULL);
INSERT INTO `siswa` VALUES (455, 547, 'revacitraaprilia595', 'REVA CITRA APRILIA', '$2y$10$xjzXiCR9mn3LbuLfkVNYBuqnlFLUCF/rlO8gMKSx4.OCmpQU3.xc6', 2, 1, 1, 3, 1, '2023-09-13 19:20:44', '2023-09-13 19:20:44', 1, NULL);
INSERT INTO `siswa` VALUES (456, 548, 'rianganissoraya214', 'RIANG ANIS SORAYA', '$2y$10$hidG53lHMymUrVUPduvbQOPP5vqltFOfbbSCFY/p/OsqT3BLAlfqe', 2, 1, 1, 3, 1, '2023-09-13 19:20:44', '2023-09-13 19:20:44', 1, NULL);
INSERT INTO `siswa` VALUES (457, 549, 'rinipratiwisahadatin566', 'RINI PRATIWI SAHADATIN', '$2y$10$M3p2yKPtq4eH9KrHxbAHhecE7AMS8xmVScL4GbR6Zzd2fnMONcmj.', 2, 1, 1, 3, 1, '2023-09-13 19:20:44', '2023-09-13 19:20:44', 1, NULL);
INSERT INTO `siswa` VALUES (458, 550, 'salsabilarenatatantri286', 'SALSABILA RENATA TANTRI', '$2y$10$7fe8kQ6TaEEFPnMfHFrkIe3M1umPUmGQYtfGuZK67YPVKFsMrujc2', 2, 1, 1, 3, 1, '2023-09-13 19:20:44', '2023-09-13 19:20:44', 1, NULL);
INSERT INTO `siswa` VALUES (459, 551, 'sitinuraini440', 'SITI NURAINI', '$2y$10$kYd/kHbNa3uA2Q.3ebpkrOXvgjOA3QwhJ7XItA33oDB34i.wb2ifG', 2, 1, 1, 3, 1, '2023-09-13 19:20:44', '2023-09-13 19:20:44', 1, NULL);
INSERT INTO `siswa` VALUES (460, 552, 'wendykurniadirliyantin813', 'WENDY KURNIA DIRLIYANTIN', '$2y$10$BebnrLDJUCcTKex7IXNtseQg2p7PfYxxi9JZVGjsVxkJVsiAX7dri', 2, 1, 1, 3, 1, '2023-09-13 19:20:44', '2023-09-13 19:20:44', 1, NULL);
INSERT INTO `siswa` VALUES (461, 553, 'yenisintawati186', 'YENI SINTA WATI', '$2y$10$VJqm0MhiJ5WN9fU05DKOf.xP3nvXlTZ7oellWxOK9pyD.oTD690o.', 2, 1, 1, 3, 1, '2023-09-13 19:20:44', '2023-09-13 19:20:44', 1, NULL);
INSERT INTO `siswa` VALUES (462, 554, 'yunitawulansaridewi217', 'YUNITA WULANSARI DEWI', '$2y$10$r9sGzm3VxpaqTsFe0xcGme9hmW.AKJBWrI3Q.kgeUW39tKxch7gWK', 2, 1, 1, 3, 1, '2023-09-13 19:20:44', '2023-09-13 19:20:44', 1, NULL);
INSERT INTO `siswa` VALUES (463, 555, 'abdulwahabsahroni526', 'ABDUL WAHAB SAHRONI', '$2y$10$NheaxYjly/SW/5lF4haZx.VO1VoCe9Zwap/cIuaEMQg1POJUtLGB.', 2, 1, 2, 3, 1, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `siswa` VALUES (464, 556, 'amirahqonita538', 'AMIRAH QONITA', '$2y$10$Uw.H2z4z6v6VFJYSL09MG.QnKPgWKLqyLkxwd/AVlVYliD5hAOgqm', 2, 1, 2, 3, 1, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `siswa` VALUES (465, 557, 'anadwiwahyuni879', 'ANA DWI WAHYUNI', '$2y$10$IlYf34f01hIVZM8JwLj2MuMJFcRtTOzaC3bYAX3ZV1HbWy/ZLbczi', 2, 1, 2, 3, 1, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `siswa` VALUES (466, 558, 'avriliadwinurazizah188', 'AVRILIA DWI NUR AZIZAH', '$2y$10$EUgar3agQwpHNUlGRbAudOWvlupCnW2drF5l/oJ5spw58wF0t9j0.', 2, 1, 2, 3, 1, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `siswa` VALUES (467, 559, 'bellaaprilia862', 'BELLA APRILIA', '$2y$10$wREgs1JnBtv5Zoz6VtrfIe1kUfympISzYNNfXVnYmaA/W3ICy.1F.', 2, 1, 2, 3, 1, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `siswa` VALUES (468, 560, 'bintangrasyailhamiputrawidayana201', 'BINTANG RASYA ILHAMI PUTRA WIDAYANA', '$2y$10$3CA4MJAIcUhX9orel/AMDuNAysd6P/335Wna3QAYtG/yxFl1zEvem', 2, 1, 2, 3, 1, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `siswa` VALUES (469, 561, 'candranurseptiansyah822', 'CANDRA NUR SEPTIANSYAH', '$2y$10$2bH88Vmv0spk2n0Mf0BNAu5v77eTC1EgOGO42ESdpRkWuG8ATJCP2', 2, 1, 2, 3, 1, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `siswa` VALUES (470, 562, 'claudiaclaraartanovia692', 'CLAUDIA CLARA ARTA NOVIA ', '$2y$10$WEtNLA7rFZKFn13dxtSzzuExFaxAVh3UZ9vqiUmzQpEn6/gORscqW', 2, 1, 2, 3, 1, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `siswa` VALUES (471, 563, 'derylwidodo5010', 'DERYL WIDODO', '$2y$10$.26ahTlbK1NF59wgMYKMH.NH4CZbBZOOM9WTvO0yZsC1K/RS41Puq', 2, 1, 2, 3, 1, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `siswa` VALUES (472, 564, 'dionagusprawoto722', 'DION AGUS PRAWOTO', '$2y$10$Lv7/oe1UJ9LPZRd.k6v.AuvNud2EqhaXT9vLQwUBbSwSTpkbKGSfK', 2, 1, 2, 3, 1, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `siswa` VALUES (473, 565, 'elisadiana401', 'ELISA DIANA', '$2y$10$Gf.A.R0plFXlJMVOOtQOEeP4PQjRaCjdAmkdOHtC4FYWZjAR67l.K', 2, 1, 2, 3, 1, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `siswa` VALUES (474, 566, 'fadilrhomadhona679', 'FADIL RHOMADHONA', '$2y$10$5ODG6KdSKWTOnb54j.GZZesONoVilON4Ju2V9Qp8V6/PTzHC5Ycx.', 2, 1, 2, 3, 1, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `siswa` VALUES (475, 567, 'fitriyahlubis407', 'FITRIYAH LUBIS', '$2y$10$D0quCxMl.xq43RHHB6SGeOoyL5RMXLxwN6BKpmswVSW83hmkzWV36', 2, 1, 2, 3, 1, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `siswa` VALUES (476, 568, 'indrifitriyani647', 'INDRI FITRIYANI', '$2y$10$BaUn87zC.s/6YhXogyDj5u9pih6K0F.dM4OJFh9IuuafYORwKICy6', 2, 1, 2, 3, 1, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `siswa` VALUES (477, 569, 'intansuciwardani145', 'INTAN SUCI WARDANI', '$2y$10$qX577gJ3ObMBioLFvTx55eK66K6CRHD/hL0e4fbU8uxx2M2A3O2MS', 2, 1, 2, 3, 1, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `siswa` VALUES (478, 570, 'lasminingsih471', 'LASMI NINGSIH', '$2y$10$1O63yBpa3mk65ZF028EpRe0Pk/BQTn5bDN/qtHib.0SmtxAgv4tc6', 2, 1, 2, 3, 1, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `siswa` VALUES (479, 571, 'latfanhabibi306', 'LATFAN HABIBI', '$2y$10$/.5aoyxGLdYLvO0NQFfsO.AvUeBjtfLCpsHaMW0nQG6Bdn1C/9w6C', 2, 1, 2, 3, 1, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `siswa` VALUES (480, 572, 'lianurrahma285', 'LIA NUR RAHMA', '$2y$10$PfLYig/lvwSOPh5LIWpqfO93GFJNFrxoHl3OMPNY512Lpq2dWdo4S', 2, 1, 2, 3, 1, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `siswa` VALUES (481, 573, 'maharanilauranurazizah141', 'MAHARANI LAURA NUR AZIZAH', '$2y$10$VC8SjVk.GN0EJ6hnHFYTPeXXK1DGzI7r6TbkUbmU5oZn/u6Z9Lkg.', 2, 1, 2, 3, 1, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `siswa` VALUES (482, 574, 'meiliza718', 'MEILIZA', '$2y$10$vp6Gx8qjx9FUdLzaI79jreRo8MkoDHryDtHCYC5nZW7qUGZMD6tB2', 2, 1, 2, 3, 1, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `siswa` VALUES (483, 575, 'mitaduwikartikasari324', 'MITA DUWI KARTIKA SARI', '$2y$10$E51Um0/.yqLdmPYvSrqwY.ozHv/xFHwqgnK1kCaj9FdSXK25FCYmq', 2, 1, 2, 3, 1, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `siswa` VALUES (484, 576, 'mochammadabdurrohim146', 'MOCHAMMAD ABDURROHIM', '$2y$10$n1VpBXuQTQNbuhn8q3HBSubbT.JXTHE.TXMW7FtPjeR//Ivhh4tq6', 2, 1, 2, 3, 1, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `siswa` VALUES (485, 577, 'mochammadrizal508', 'MOCHAMMAD RIZAL', '$2y$10$AHpCx8vVoQiyk6BNVYwWperFYLq/xn8PXDpP9OnWgi24XpeaFf5g2', 2, 1, 2, 3, 1, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `siswa` VALUES (486, 578, 'muhammadnabil831', 'MUHAMMAD NABIL', '$2y$10$2WdnVDmJdTu55r7rOTRhvezR97N3UYgVtKTJ3S2u9tRoUh11mSU5G', 2, 1, 2, 3, 1, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `siswa` VALUES (487, 579, 'muhammadnurulsetiawan8910', 'MUHAMMAD NURUL SETIAWAN', '$2y$10$Pehyq9AEZm0Uggd3vNYN9etVbx5MAKU99r9RSHiOrXJThsRq4rPAe', 2, 1, 2, 3, 1, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `siswa` VALUES (488, 580, 'muhammadriyadiimanullah730', 'MUHAMMAD RIYADI IMANULLAH', '$2y$10$PD5lGFAhjNsABn/QwvoJVeoCqIJdrJQMyKbaUdlZlUms3JgJs1kw6', 2, 1, 2, 3, 1, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `siswa` VALUES (489, 581, 'naylarizkifarohah386', 'NAYLA RIZKI FAROHAH', '$2y$10$LcfLYFyyIzSR2K4ngsVvfeY.lUfR.BBoZAfs9J1P9YG5fGDf.0/32', 2, 1, 2, 3, 1, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `siswa` VALUES (490, 582, 'rajezaliyandriehabibie499', 'RAJEZ ALIYANDRIE HABIBIE', '$2y$10$4jjyXw3pav1Z45hBDpoYYegQxE8CinmvKAaNARM3XzBtCBwVTvun6', 2, 1, 2, 3, 1, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `siswa` VALUES (491, 583, 'rifkaamelia7810', 'RIFKA AMELIA', '$2y$10$5SXVbKRAd9sj/qAowGuSJ.srD72lnejMduTPl2vxLj9kYZHehWjrG', 2, 1, 2, 3, 1, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `siswa` VALUES (492, 584, 'roviqotussaadah483', 'ROVIQOTUS SAADAH', '$2y$10$UgmLXmAQxNM3eR3xUWUEFevF16kbORKYCj9rjpxHyLHUiQEFZcBvy', 2, 1, 2, 3, 1, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `siswa` VALUES (493, 585, 'yeniainurrohmah180', 'YENI AINUR ROHMAH', '$2y$10$pWlDbsgHDOA3DNabZX7Hyuy6W8ZkEvOOavzE/9LTDmpOSFkCrFMRe', 2, 1, 2, 3, 1, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `siswa` VALUES (494, 586, 'zahrotussainiah300', 'ZAHROTUS SAINIAH', '$2y$10$tAW/nhbIcfMEjfqavTicGOOVvMcb./na4gDq2sSVAv4m6NEOui/A.', 2, 1, 2, 3, 1, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `siswa` VALUES (495, 587, 'abeliamarthamulia188', 'ABELIA MARTHA MULIA', '$2y$10$RPx85bOYNVR7aGx/isK74ey.OW35jczeVWy1yX8ZsLQcTax4z.rXG', 2, 2, 3, 3, 1, '2023-09-13 19:22:53', '2023-09-13 19:22:53', 1, NULL);
INSERT INTO `siswa` VALUES (496, 588, 'afifahwidyanurzahidah859', 'AFIFAH WIDYA NUR ZAHIDAH', '$2y$10$ct7XRgVJtZLQYoxpyO6KOukxgSSN9pi5cDNobRIys4oBU.XFaePNm', 2, 2, 3, 3, 1, '2023-09-13 19:22:53', '2023-09-13 19:22:53', 1, NULL);
INSERT INTO `siswa` VALUES (497, 589, 'ahmadgalangramadhan154', 'AHMAD GALANG RAMADHAN', '$2y$10$j151hhpaReCdrGerkQrCFOW9.w2V9EqxxaymZ82Rf6MTBUzMauwpK', 2, 2, 3, 3, 1, '2023-09-13 19:22:53', '2023-09-13 19:22:53', 1, NULL);
INSERT INTO `siswa` VALUES (498, 590, 'airinafebrianti817', 'AIRINA FEBRIANTI', '$2y$10$UmLkQNtLSJfEHvGWRANs5Ofmq6hXHaQeqLv/h3G9L2MQQ32Q0h2Mi', 2, 2, 3, 3, 1, '2023-09-13 19:22:53', '2023-09-13 19:22:53', 1, NULL);
INSERT INTO `siswa` VALUES (499, 591, 'andreanggasetyawan126', 'ANDRE ANGGA SETYAWAN', '$2y$10$fjrAsAMOtjJdfOBRwstMsuQqYpO5mgcchYzJ2acbuXxVNUuVBo9dW', 2, 2, 3, 3, 1, '2023-09-13 19:22:53', '2023-09-13 19:22:53', 1, NULL);
INSERT INTO `siswa` VALUES (500, 592, 'andreanprastya512', 'ANDREAN PRASTYA', '$2y$10$wTozNYwVU/3BV2GysRK.k.UV0VJu.ObXY9mUZZTIeps1e1mzlEBg.', 2, 2, 3, 3, 1, '2023-09-13 19:22:53', '2023-09-13 19:22:53', 1, NULL);
INSERT INTO `siswa` VALUES (501, 593, 'anindiaanggunwahyudi478', 'ANINDIA ANGGUN WAHYUDI', '$2y$10$lVNti/l5.HE01bzHPHVGQ.TbuIfjimPKjtdh5oax5NGbtrn5BsdLi', 2, 2, 3, 3, 1, '2023-09-13 19:22:53', '2023-09-13 19:22:53', 1, NULL);
INSERT INTO `siswa` VALUES (502, 594, 'annisazalifaairadinarfathani944', 'ANNISA ZALIFA AIRA DINAR FATHANI', '$2y$10$X0cdOZzNuW4g6OBalADYpuxmHrY1nCMNwCLXF8W/53Kb7Ytj/iF3u', 2, 2, 3, 3, 1, '2023-09-13 19:22:53', '2023-09-13 19:22:53', 1, NULL);
INSERT INTO `siswa` VALUES (503, 595, 'atikmuslihah761', 'ATIK MUSLIHAH', '$2y$10$Y6hQ23JPn9ffEZBZAaVRNOSHwunUspzPRR3/02VCySeAg82jwp.26', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (504, 596, 'destifebrianapurwiningsih344', 'DESTI FEBRIANA PURWININGSIH', '$2y$10$xwPOauLoiuFngUgMlanwo.SJSZ7AoN62sprUulIIGGAFQvaLAaXam', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (505, 597, 'dianliakurniawati844', 'DIAN LIA KURNIAWATI', '$2y$10$Kb0cdpCFe1uW5gMiEDy0YuXZQGSuB4LN8aQUd/OV656IHxnqb6pjG', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (506, 598, 'dindaayu531', 'DINDA AYU', '$2y$10$Cev86d3hgpbuOAd159CL..nxsJUWdAFgLBvOdQ5JtdgKrZ0GU4tr2', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (507, 599, 'dwisafitri185', 'DWI SAFITRI', '$2y$10$W4lvJmDAAac/DQtXkZEUAuesK9dfmVoAazc7h3BO74EHEIKS16qOu', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (508, 600, 'dynaanggraeniy287', 'DYNA ANGGRAENIY', '$2y$10$Ue9x/vxeqTsEaMwKHOOcSuPj.wDAFxkOD.sT0jqjYzyy7CEmuMTIe', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (509, 601, 'faniyunitaindriyanis4910', 'FANI YUNITA INDRIYANIS', '$2y$10$iUwiFPoJY3PZ7DwgtJLigOMBc/rCGt.1U5K6zaU6NMheFcveKRk3i', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (510, 602, 'hariroirmawati572', 'HARIRO IRMAWATI', '$2y$10$Z8L4G75vn37Gvl7nx0UbO.UiG7QnVqqf0KISwkLSvHwUribwZwz3q', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (511, 603, 'lalabungaistian516', 'LALA BUNGA ISTIAN ', '$2y$10$S8aUouf9yjisW2qWwEsA9uKAHFs88SyjqwUWscAev3k0K3Z2xWyLi', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (512, 604, 'muhammadfaidi562', 'MUHAMMAD FAIDI', '$2y$10$EXm8i9L8h/IutQG1m3X1PeOQPP5RhqXjhdLgKsHd98NgrLoRV/s76', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (513, 605, 'naifahmaysaroh5210', 'NAIFAH MAYSAROH', '$2y$10$jvNSJF80bOs9HSDCoyjyguZnTgXBRBUeK.QbwVOa2aQhzX3SiyNCy', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (514, 606, 'natasyabungaaprilia834', 'NATASYA BUNGA APRILIA', '$2y$10$zvt/rwM1/Iu/vZGTwO56euIvIH1uM7gtkbKlYI9eaxMcD4R.IgOW2', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (515, 607, 'nikenmaulina363', 'NIKEN MAULINA', '$2y$10$x40o0bRjM./sHxbd7bLivu/jnUZKRPmoNo5Dph4p7exwDJoMAOESi', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (516, 608, 'nurquratulnabilaatiqoh433', 'NUR QURATUL NABILA ATIQOH', '$2y$10$q39eCsETO.f4k1h5GfHbCO8h5vd3k7o9ZR29T0TvRdDgDrsRhMz4W', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (517, 609, 'renalitaalyanirinaputrimerry377', 'RENALITA ALYA NIRINA PUTRI MERRY', '$2y$10$cbPATF2SYsy5S8HiQ7e89uwZPmOczU7tc7oJUL6jD1Rgej08OSWmS', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (518, 610, 'renianggraeniekasaputri475', 'RENI ANGGRAENI EKA SAPUTRI', '$2y$10$s4tICDgcbZjf0hyRXdWpTuqX9X1Q3HP2grAVo0KrOnANQHcB0n3OW', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (519, 611, 'rifanbimawirasatriaji437', 'RIFAN BIMA WIRA SATRIAJI', '$2y$10$tViqK4ggOS0LdOFnp6XZfeFhkGZSqucKP3M0g1eE74wmWwowgdc2O', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (520, 612, 'salsabilaalifiaputri126', 'SALSABILA ALIFIA PUTRI', '$2y$10$BfLJA7MBY7PevoVpkRssuen8Hd/44nuMHrtr/QR/1ZQ/VeTGqvgL6', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (521, 613, 'sitiaisyatunnabillah244', 'SITI AISYATUN NABILLAH', '$2y$10$ISOaQdOyOolMmqzbbY/gQ.8YFpPFz56J8e3GUVIVpHjZ1R10UMDau', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (522, 614, 'sitirahmatulkamila260', 'SITI RAHMATUL KAMILA', '$2y$10$aqwWA3j02HejvACf1jtiVeN/4cfEm7hk42p3dHJ/L.DYnBg3RWCpW', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (523, 615, 'sitirofiah9910', 'SITI ROFIAH', '$2y$10$nSiv9W87D/LWW6reRMOxQ.tLie0tIXNb4tsRhcA0dfxbaCxV1rpbO', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (524, 616, 'vavilatulhasanah541', 'VAVILATUL HASANAH', '$2y$10$ExUoyNucAlK8hsx3agfPP.hzyyA1pVhao/Qdp3IAPvw.AoEUj9.cO', 2, 2, 3, 3, 1, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `siswa` VALUES (525, 617, 'vitaindahkartika782', 'VITA INDAH KARTIKA', '$2y$10$WJcGyeneO8W8vD8ee6hAq.Hj5420W40t/Y5WR1ipe0ptqpFNvFAXu', 2, 2, 3, 3, 1, '2023-09-13 19:22:55', '2023-09-13 19:22:55', 1, NULL);
INSERT INTO `siswa` VALUES (526, 618, 'adeliaayunaputri757', 'ADELIA AYUNA PUTRI', '$2y$10$Yv.7Atz6EUTq0MgZpLsZ7OyyEzNNxAUygxsKmAZ3iUYNhNLcjSxdO', 2, 2, 4, 3, 1, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `siswa` VALUES (527, 619, 'adelinaekaapriliandani126', 'ADELINA EKA APRILIANDANI', '$2y$10$qu9Tf7t6N9kRUD0HmmaVwOqGgNI7zI0HTNNsp7Ems7AU5m1l6kEqq', 2, 2, 4, 3, 1, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `siswa` VALUES (528, 620, 'ahmadraffimaulana530', 'AHMAD RAFFI MAULANA', '$2y$10$OQAiaNqy0QbnJ68Z4ZiciOvnhah7rW4lDDZHk.jFN5iHVMs56CU0S', 2, 2, 4, 3, 1, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `siswa` VALUES (529, 621, 'ainunfirdausrahmatilla500', 'AINUN FIRDAUS RAHMATILLA', '$2y$10$GsIczvYcHoU1/864txNIEOdLqIQZF/1TZHJkokX7P4J9/Tl8khFUS', 2, 2, 4, 3, 1, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `siswa` VALUES (530, 622, 'anggunpuspitaariyanti200', 'ANGGUN PUSPITA ARIYANTI', '$2y$10$9iy0oP71VPHOLAafkBJSp.aTjHO0A1gAX6LSAn.XTmmpl05cuPqRi', 2, 2, 4, 3, 1, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `siswa` VALUES (531, 623, 'annisanadhira9110', 'ANNISA NADHIRA', '$2y$10$CZt2Ia6EvG5D.KLPzD8EN.IrCz83lJsnq0/6iuIIimpXw2wWDOqeG', 2, 2, 4, 3, 1, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `siswa` VALUES (532, 624, 'ayutasyaniaputri624', 'AYU TASYANIA PUTRI', '$2y$10$Ua9iWoFW/raf5YGKO0eNxeFFvGkkb49uaNMO/.xe6pFipfe1A/eZ2', 2, 2, 4, 3, 1, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `siswa` VALUES (533, 625, 'darayanidinan291', 'DARAYANI DINAN', '$2y$10$dRTjJFfcenKGD9x3F94v7eV/2FPixJ7zpM8q8Lvf/nfoYqzjEbvM2', 2, 2, 4, 3, 1, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `siswa` VALUES (534, 626, 'destaadiyuliana6810', 'DESTA ADI YULIANA', '$2y$10$ZPb117Z7ed9eqwRT26Zs0.GEeeOwVsIZFXAD.R2DVTPj8O7FTkZWG', 2, 2, 4, 3, 1, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `siswa` VALUES (535, 627, 'dindahilyatulaulia549', 'DINDA HILYATUL AULIA', '$2y$10$F82rH7u2ldV.3xZjqx3.QOQ8w5tlVzf6G98W7mIa7TOmLNdZ0Vv8e', 2, 2, 4, 3, 1, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `siswa` VALUES (536, 628, 'dwioliviaainatulnadifah106', 'DWI OLIVIA AINATUL NADIFAH', '$2y$10$t94j9uRBipyMccSXvyTKf.r.mifgnynu/b2kPT9RalVIRkM1SC1Qm', 2, 2, 4, 3, 1, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `siswa` VALUES (537, 629, 'ekaseptyaanggraini934', 'EKA SEPTYA ANGGRAINI', '$2y$10$iHctVo3wCkYBLOQ9Wd7Gz.OIPyItiHeLuAmHVR8tWeUaAjxuWVXz6', 2, 2, 4, 3, 1, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `siswa` VALUES (538, 630, 'elminurfadilah248', 'ELMI  NUR FADILAH', '$2y$10$Ui9Z.eMw53L6ekV4w/Ym4.YlHfclXhBJiUSr3KOCvW6I/.jpZdTs.', 2, 2, 4, 3, 1, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `siswa` VALUES (539, 631, 'firnadialailatulfitriah217', 'FIRNADIA LAILATUL FITRIAH', '$2y$10$5BT/d2jaiRAQXNg9SO4xy.thBpcy07MLC5KUP.jwE5EtYa9U8vPz6', 2, 2, 4, 3, 1, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `siswa` VALUES (540, 632, 'halimatussadiyah422', 'HALIMATUS SADIYAH', '$2y$10$HLZFI0m6nL/hATqUTpN3uOvoVQUaoopLnz6aK0uR8BcWof0RAkPT6', 2, 2, 4, 3, 1, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `siswa` VALUES (541, 633, 'jenyputriandini263', 'JENY PUTRI ANDINI', '$2y$10$xOhIyVYC11q6HL/Z2TYkQu5Ev4DRIHfDLcX9/J9W/btEku2lkX2Lq', 2, 2, 4, 3, 1, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `siswa` VALUES (542, 634, 'meisitafaizatulubko467', 'MEISITA FAIZATUL UBKO', '$2y$10$24a3hR/E6ax4E.NbJmGJCe0dI7/WgAgEfcdrJYtlyvN85homkmQZG', 2, 2, 4, 3, 1, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `siswa` VALUES (543, 635, 'mochammadrifalaprilianto502', 'MOCHAMMAD RIFAL APRILIANTO', '$2y$10$6d.xILwgFBv442lpuragIu/4qTaHii/ECetLxotemVwb3RCP79.jK', 2, 2, 4, 3, 1, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `siswa` VALUES (544, 636, 'nafilaagustin421', 'NAFILA AGUSTIN', '$2y$10$vtddvr4Kv3IGqxS/Pi9weecQ4XEhvE7wLbv.NxMG52wWX3oD/d0Sm', 2, 2, 4, 3, 1, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `siswa` VALUES (545, 637, 'natassyaayupermatasari8210', 'NATASSYA AYU PERMATASARI', '$2y$10$W/4Wrw3ayMfYXRtO/i6rWu8.2oSTHOKe2LXe8Tqt5SPfmtHIDQzOO', 2, 2, 4, 3, 1, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `siswa` VALUES (546, 638, 'novitasari911', 'NOVITA SARI', '$2y$10$C6Xap7UKmSvhpr1Leic19uYkzF0AXn.1YtJjYaJTivAAaxXvhRsc2', 2, 2, 4, 3, 1, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `siswa` VALUES (547, 639, 'putridewirarasati745', 'PUTRI DEWI RARASATI', '$2y$10$.WtubUFUEDsEFIjNm8iuwuVYYjkLLhpozXWNXJuNncBLadE6izE16', 2, 2, 4, 3, 1, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `siswa` VALUES (548, 640, 'rezaandryansyah406', 'REZA ANDRYAN SYAH', '$2y$10$61DKlL7XLNydoILU1T3KNu3/C/kZpZJF.7aU/7rPMi82CpmPEFYpi', 2, 2, 4, 3, 1, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `siswa` VALUES (549, 641, 'riangriskymaulida714', 'RIANG RISKY MAULIDA', '$2y$10$Eg9JsEdjOJL6BCzlEZNo7ezvJ3CSWnn.B2ClOldkH8BSuj5MdzJcm', 2, 2, 4, 3, 1, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `siswa` VALUES (550, 642, 'robiatulhassanah5410', 'ROBIATUL HASSANAH', '$2y$10$.zl3LXhUj34imlgumJy/yeKsxebYc3UK8uyV2R/1xuC/IftJH8cB.', 2, 2, 4, 3, 1, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `siswa` VALUES (551, 643, 'salsabilavernandaputrie529', 'SALSABILA VERNANDA PUTRIE', '$2y$10$XlRtoL2CShTTHmHMKMLsROVRIqZ3u77nueAwuzR//s9bI7qJEEzJ6', 2, 2, 4, 3, 1, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `siswa` VALUES (552, 644, 'sendipurnomo300', 'SENDI PURNOMO', '$2y$10$oBHF.3D29Md7SUe8G2Yeve/Md5gRkc29hzDWPIepwOCZM8ZdvQnWa', 2, 2, 4, 3, 1, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `siswa` VALUES (553, 645, 'serlylinggawati368', 'SERLY LINGGAWATI', '$2y$10$rta/HrOY8QoIbaVHVgxeR.nFml4Njnz15PT.0zb/9/eAs17qFpMGa', 2, 2, 4, 3, 1, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `siswa` VALUES (554, 646, 'sitiqomariah192', 'SITI QOMARIAH', '$2y$10$rqtSMZlA66gutn.iyKArP.0aM3NiTIwArpIABg0SAM.00XE14YDUC', 2, 2, 4, 3, 1, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `siswa` VALUES (555, 647, 'sitisadiyah824', 'SITI SADIYAH', '$2y$10$rsiVoDd7Q3Gjhk5WyO8ZJ.tpd6Kan.SbPotuBF/RTWIiUg37h/NDS', 2, 2, 4, 3, 1, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `siswa` VALUES (556, 648, 'srihandayani999', 'SRI HANDAYANI', '$2y$10$S7/B7Uohub4iCKB5Nv5qF.gA/n3JVMA0mWRqZziXFcYKfAQcpSRqK', 2, 2, 4, 3, 1, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `siswa` VALUES (557, 649, 'zafiradwiaprilia321', 'ZAFIRA DWI APRILIA', '$2y$10$r7lcO3Hc9Ia40.mePLd67OeFlTPjoei7I9YjbxuwStezviV0QEcDW', 2, 2, 4, 3, 1, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `siswa` VALUES (558, 650, 'zavatiarinditapriyani356', 'ZAVATIA RINDITA PRIYANI', '$2y$10$vL.I9gma.ZxJDYQ59WmvKOidRWPvQZy7mfixdChoFfq27EmiYezbu', 2, 2, 4, 3, 1, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `siswa` VALUES (559, 651, 'afifaqudsia9810', 'AFIFA QUDSIA', '$2y$10$P96t8WqDxRsNq/wq9.OthOcajYdevqTpNc.Efk3vB2AnkLtkVCuIG', 2, 3, 5, 3, 1, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `siswa` VALUES (560, 652, 'aidhaanasyasalfanindia234', 'AIDHA ANASYA SALFANINDIA', '$2y$10$pqxD0rjwOLZ7cAWLIdEy/ulVZUOkRF30nYUCD5ERFPfe.f83/jgqa', 2, 3, 5, 3, 1, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `siswa` VALUES (561, 653, 'anisanurramadhani304', 'ANISA NUR RAMADHANI', '$2y$10$F8B1MkFk9YD8WhtoOHg6uOV46cTbWNlKvBkK9Wx9ArWqcjBEZBQoO', 2, 3, 5, 3, 1, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `siswa` VALUES (562, 654, 'celsiolivia182', 'CELSI OLIVIA', '$2y$10$OYmRvTLvQuZ8e/RYDYCbbe5pdFqxHkFQjtin.MBW4nhc4r5APFGUC', 2, 3, 5, 3, 1, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `siswa` VALUES (563, 655, 'dindasafitri5110', 'DINDA SAFITRI', '$2y$10$LDfRq9XSKRmfqLd2l3L9FO8J5Ihc2XP.5C8fbuf5uZ2qssjU.tfbO', 2, 3, 5, 3, 1, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `siswa` VALUES (564, 656, 'dwiintanpermadani312', 'DWI INTAN PERMADANI', '$2y$10$qA57t.2HMihexUJAaKXKuuFooM8jzLrUe8n3mECdOg/1CgUPuqsSS', 2, 3, 5, 3, 1, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `siswa` VALUES (565, 657, 'faizahlailatuljamil156', 'FAIZAH LAILATUL JAMIL', '$2y$10$xEVBuo3.2RAHq6bPvsmyku4def7McbRWTFCW5vRDzDkdD4JVoHLSq', 2, 3, 5, 3, 1, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `siswa` VALUES (566, 658, 'felantika954', 'FELANTIKA', '$2y$10$m3e/Ly8r4gO.iXm0Mk4ubOqgBlzmoJsBDH1LhCfS9ze6dewRwpTTu', 2, 3, 5, 3, 1, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `siswa` VALUES (567, 659, 'ferdifirdaus108', 'FERDI FIRDAUS', '$2y$10$igafgBYO2bFrqsZrFmKsOeywajnkFLEXeyVFI1UZiNBDN96P79sVi', 2, 3, 5, 3, 1, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `siswa` VALUES (568, 660, 'hikmatulkhoiriyah909', 'HIKMATUL KHOIRIYAH', '$2y$10$TKJKmgeZoVAS38dL9PaEW.FmuXMfMNsNyTGYEj/9DE67KTCRL64Oe', 2, 3, 5, 3, 1, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `siswa` VALUES (569, 661, 'imroatulalifah255', 'IMROATUL ALIFAH', '$2y$10$XvhM1CkXtCbWp.XiaiV.P.in7cCVK9Tdj6Qdie3yALrRdgCOAWplS', 2, 3, 5, 3, 1, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `siswa` VALUES (570, 662, 'jesitanadiaputri8110', 'JESITA NADIA PUTRI', '$2y$10$pMhhISnoqQqRejDabqP11eyK7GzVaNiQzdfo1JQ/FJirwcZZ7jc0u', 2, 3, 5, 3, 1, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `siswa` VALUES (571, 663, 'jihanbasyarahil286', 'JIHAN BASYARAHIL', '$2y$10$2iQdjiHbqQ2uK9GibW/3/OxpOsP/an0uzXyaCopGuUenZjioq5Hkq', 2, 3, 5, 3, 1, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `siswa` VALUES (572, 664, 'karimah531', 'KARIMAH', '$2y$10$.WEF.34U9DBuuArwOZU2M.4OcEnXEiv43dh2qUcaQy82gn9YrY.Ei', 2, 3, 5, 3, 1, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `siswa` VALUES (573, 665, 'muhammadnovalromadhan610', 'MUHAMMAD NOVAL ROMADHAN', '$2y$10$MO4nWS4yDnIC47WmQEn.M.0z4.UZUsK9y0CyEG9hR.YSWWJv/whwe', 2, 3, 5, 3, 1, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `siswa` VALUES (574, 666, 'nailulilmamarifah302', 'NAILUL ILMA MARIFAH', '$2y$10$lyXZUjVkSOnahGQh46og9OZAu3KMwVqOg.cyiXj1UD0jYNI96JfyC', 2, 3, 5, 3, 1, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `siswa` VALUES (575, 667, 'nefridwijunianti938', 'NEFRI DWI JUNIANTI', '$2y$10$NWUHplrqPrjhJlK4KqWdAutKganqG6C28DJU/4G0RZuffmzZJZArW', 2, 3, 5, 3, 1, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `siswa` VALUES (576, 668, 'nindiafaisyasalsaprilia535', 'NINDIA FAISYA SALSAPRILIA', '$2y$10$Ghl0mvrhSf9qbty3eW5crebd2W0shhy4Bv2nOd2zkZRJF/8cH6uqC', 2, 3, 5, 3, 1, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `siswa` VALUES (577, 669, 'novalialunanurazizah3310', 'NOVALIA LUNA NUR AZIZAH', '$2y$10$13gdJi8bwWuQYD.shM7W9uEJ.bFDto79.cIEr5dov6M/HvNs0BCN.', 2, 3, 5, 3, 1, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `siswa` VALUES (578, 670, 'pingkanayufarokah499', 'PINGKAN AYU FAROKAH', '$2y$10$QwwV3MnXLNXgyl4h6dfamOTSYC9KCvjwgJaMbC4zylCgMWDRCc..u', 2, 3, 5, 3, 1, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `siswa` VALUES (579, 671, 'putrianggraeny655', 'PUTRI ANGGRAENY', '$2y$10$64buhVaYMR5z37qppsOq/uIQ3Tbc4anWOofgbbTpv1Xay/eECq6PS', 2, 3, 5, 3, 1, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `siswa` VALUES (580, 672, 'safiradwiramadani600', 'SAFIRA DWI RAMADANI', '$2y$10$coBJ6DogKXMLyBxNZPIA.e8U3BmQsGdD60u1VaFWgFrZ/6/4OaCBe', 2, 3, 5, 3, 1, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `siswa` VALUES (581, 673, 'selfiadianagustin672', 'SELFIA DIAN AGUSTIN', '$2y$10$7ywY1bAshiPVfgx9DVIMzuT0QupAsYGAnD0vAPkBCwtvSblYf4/eW', 2, 3, 5, 3, 1, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `siswa` VALUES (582, 674, 'selvianurazizah953', 'SELVIA NUR AZIZAH', '$2y$10$ILK3FdkGygUkByP7SNbaauqr6M39K.L7gaGduXoyEYejARjcdKxUe', 2, 3, 5, 3, 1, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `siswa` VALUES (583, 675, 'suryosujono942', 'SURYO SUJONO', '$2y$10$M1oNoRj8yPDGNfK35I3oWu6fyrnjhc5SSNnGRH74Nb1rqfAdA0JUq', 2, 3, 5, 3, 1, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `siswa` VALUES (584, 676, 'tarasalsabillanaurakmaputri171', 'TARA SALSABILLA NAURAKMA PUTRI', '$2y$10$HmoeM55b.9a1YkVjOvfq8u03mYzEey9vbyTjPkhvd4KdC5lveri7m', 2, 3, 5, 3, 1, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `siswa` VALUES (585, 677, 'wasyilatulbariroh202', 'WASYILATUL BARIROH', '$2y$10$TGHtRs04s8KiAFtV.FczFudqS6WKDuBIPJkd1Q3rXaGItJOgE20PW', 2, 3, 5, 3, 1, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `siswa` VALUES (586, 678, 'windynazaaprilia415', 'WINDY NAZA APRILIA', '$2y$10$mQRV73Ghj7hVYC8UY/NBxuaHgwXmVVPwFeKbCO1ltGM6lAQQietRm', 2, 3, 5, 3, 1, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `siswa` VALUES (587, 679, 'zahraisandria358', 'ZAHRA ISANDRIA', '$2y$10$sKo4GAebPSPQzbyuqVj2oeDcZqb2U01RWc/k9aDJqqwTGyy1LAWXG', 2, 3, 5, 3, 1, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `siswa` VALUES (588, 680, 'zulaykhagheizaazzahra590', 'ZULAYKHA GHEIZA AZZAHRA', '$2y$10$sZVUuAfd6v.htEAmojTzc.5d9Erhs.5JQCNlh28282niWzW9LwD.O', 2, 3, 5, 3, 1, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `siswa` VALUES (589, 681, 'achmadramadhany749', 'ACHMAD RAMADHANY', '$2y$10$gj59F7s1yJZH1WE1d4xnCOLnIKfzov2pn0EEGD24u0z46BLo9IZI2', 2, 4, 6, 3, 1, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `siswa` VALUES (590, 682, 'afita757', 'AFITA', '$2y$10$gmGl4rO.Eypa9T7nsJ6lT.lDxhh7VPCOuWEvvRf9h/iNOYYxmJNIO', 2, 4, 6, 3, 1, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `siswa` VALUES (591, 683, 'amiliareginaputri744', 'AMILIA REGINA PUTRI', '$2y$10$xPCV45mffCssRwkk3n9pm.PcGd92EObjKjBVO5evCAZWEtZt.9Ah2', 2, 4, 6, 3, 1, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `siswa` VALUES (592, 684, 'arinauthoybah690', 'ARINA UTHOYBAH', '$2y$10$FaRe8FavQGRKQVPVB1E7BuNak8VLmJafSTEDr7s2bAw3FEqafH7qC', 2, 4, 6, 3, 1, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `siswa` VALUES (593, 685, 'dewiintannuraini494', 'DEWI INTAN NURAINI', '$2y$10$3gr2quwyzqVo5GiMYAzAwOi2oc13ecPTO7EwnMbUy7Ex/2Yc/eEH.', 2, 4, 6, 3, 1, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `siswa` VALUES (594, 686, 'ekanorpratiwi527', 'EKA NOR PRATIWI', '$2y$10$8lx.xbnp6JHygSjwGMdJg.Vah.Cc/r.7K1GV9qPHZVmCEbyPvu5ge', 2, 4, 6, 3, 1, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `siswa` VALUES (595, 687, 'ellorasyafiransyah647', 'ELLO RASYA FIRANSYAH', '$2y$10$ooOurpKsd5BTuDc5dQtHkOlBq98GKul3aQ0i8an3YP7kGPQd5lJpm', 2, 4, 6, 3, 1, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `siswa` VALUES (596, 688, 'indahdesmitaramadhani257', 'INDAH DESMITA RAMADHANI', '$2y$10$lPnxrFW40Q.D2ur9hJwPS.uKaDsruGL0UCxgMJJ5BHPux/MikQIES', 2, 4, 6, 3, 1, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `siswa` VALUES (597, 689, 'jamilatuszahro225', 'JAMILATUS ZAHRO', '$2y$10$IUp9enlk1GzYdTpVTyVuOurk9haHSx/.GDuoX/XfBMyYJcSB0WiQC', 2, 4, 6, 3, 1, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `siswa` VALUES (598, 690, 'karin5410', 'KARIN', '$2y$10$JqOXQR0JJxjS4Hfx5Jz6y.2K9UMqdBqOOWQFqCJ/QWpTFPHUVkB/6', 2, 4, 6, 3, 1, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `siswa` VALUES (599, 691, 'melyatuljaniyah379', 'MELYATUL JANIYAH', '$2y$10$tCmSAXfI1egwSdqX59k5GuW6h.1LGb5eQwEo1Stm0fNBHZ9ipzTGi', 2, 4, 6, 3, 1, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `siswa` VALUES (600, 692, 'mohrizalulamri593', 'MOH. RIZALUL AMRI', '$2y$10$yD.go5nxjdducIQz/ZJjW.zzpioqomwdW5TCVQc4Phbv.rW45.ATO', 2, 4, 6, 3, 1, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `siswa` VALUES (601, 693, 'mohammadifdanisamsulmuarif290', 'MOHAMMAD IFDANI SAMSUL MUARIF', '$2y$10$byjdbyCw9gWO/bWO9XIsAeX7T8Hn/eTJy4tYztdNBvPfiFNtgMzpS', 2, 4, 6, 3, 1, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `siswa` VALUES (602, 694, 'mohammadprayogi5310', 'MOHAMMAD PRAYOGI', '$2y$10$KDlvdyr3dxlfKWMcvtykq.Wd1yB2jkIeX6QnNpUc/W5fM/6tAwGcq', 2, 4, 6, 3, 1, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `siswa` VALUES (603, 695, 'muhammadadifan803', 'MUHAMMAD ADIFAN', '$2y$10$43iHzF5ksXST1DTARTwPIuKLIj1svJ8CNOPcBtJxeSwo4DRPKIcee', 2, 4, 6, 3, 1, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `siswa` VALUES (604, 696, 'muhammadfikrimardianto844', 'MUHAMMAD FIKRI MARDIANTO', '$2y$10$gvWO2bcQZDSX2yM3aqmrp.lvbhhcmdM0w3ul.4Bpz/GbmIzZ41fnu', 2, 4, 6, 3, 1, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `siswa` VALUES (605, 697, 'muhammadhairurrofiqi585', 'MUHAMMAD HAIRUR ROFIQI', '$2y$10$oMQdGf8E0/5v.ayFMj2x..9j6tpM0Oar5jEiaaKW/O/MFh1NT.sdS', 2, 4, 6, 3, 1, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `siswa` VALUES (606, 698, 'muhammadradhosaputra749', 'MUHAMMAD RADHO SAPUTRA', '$2y$10$2dtVyH3HFJjJh.MKUIli9eNyPWH78JuTansZXUwdhqfaapOGGFKTO', 2, 4, 6, 3, 1, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `siswa` VALUES (607, 699, 'muhammadzulhanhasan946', 'MUHAMMAD ZULHAN HASAN', '$2y$10$ZEYbEpkNSlxsBc2mfz0b9eN1OILWaw7xd5iYAFMETYTVSdVZUNkJG', 2, 4, 6, 3, 1, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `siswa` VALUES (608, 700, 'rafitaewiagustin256', 'RAFITA EWI AGUSTIN', '$2y$10$72Xltz90r5Vlk6Iu1D6U3e/X39I/FUxx90MI1oLIsG7Mfetd/EU9O', 2, 4, 6, 3, 1, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `siswa` VALUES (609, 701, 'riskianaoktaviahaliza405', 'RISKIANA OKTAVIA HALIZA', '$2y$10$oauujN122vcwgQuFDVcSyuld8DXN24VevDhpmMP.FAnVYdzyEH0CC', 2, 4, 6, 3, 1, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `siswa` VALUES (610, 702, 'riskiatulhidayah535', 'RISKIATUL HIDAYAH', '$2y$10$vPUHJjgNfyN5zHpwk9UEg.LvNElHlXjx.JV/ucxiW1AJaE34pZbh6', 2, 4, 6, 3, 1, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `siswa` VALUES (611, 703, 'sifaratulramadani224', 'SIFARATUL RAMADANI', '$2y$10$DTkr93CzW9C6dyulb/KAf.c5rrlsFTthlxIS1QOcUlwJ6w9wfZZGa', 2, 4, 6, 3, 1, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `siswa` VALUES (612, 704, 'sintiacikanabawiyah251', 'SINTIA CIKA NABAWIYAH', '$2y$10$utRPBOxoVOtsrIT0ary9R.a8/82NnMdFdp7kOAauJFZj9/JPn06T2', 2, 4, 6, 3, 1, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `siswa` VALUES (613, 705, 'sitiamiliaputri997', 'SITI AMILIA PUTRI', '$2y$10$7TjomI.YCMWLRP.vhcZXnO9PQ94V3ZgXTn5kMBZQqET95eGAV4udi', 2, 4, 6, 3, 1, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `siswa` VALUES (614, 706, 'sitinabila8210', 'SITI NABILA', '$2y$10$5hez.deutZCUWypHipaYiubUBQVtuRl0LiCGuJQu5au35ISXX.2kq', 2, 4, 6, 3, 1, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `siswa` VALUES (615, 707, 'sitirokayahazzahro274', 'SITI ROKAYAH AZZAHRO', '$2y$10$OM44UpE/UsjjsFpMZp6js.rm.wdf/EODUxhK2E2JeQ8/Ei47GgjUy', 2, 4, 6, 3, 1, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `siswa` VALUES (616, 708, 'vijayidirromadhan461', 'VIJAYIDIR ROMADHAN', '$2y$10$m6CpQClw6ztAhFlJ8nU9ZudmavrwIPm3SyIZzekAvJ1jAvDKV6.YO', 2, 4, 6, 3, 1, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `siswa` VALUES (617, 709, 'adeliasafira748', 'ADELIA SAFIRA', '$2y$10$T77400aubSL.XgaJWwizvOaWWLVJ9W7Z5oou4C23xJVEYPzXllOxG', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (618, 710, 'ahmadandika453', 'AHMAD ANDIKA', '$2y$10$cIQBfM1j0.aHyFugpIKP5uBzZQzvYs37ggruQ63zTwdNF5PtfemUO', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (619, 711, 'ahmaddanisaputra569', 'AHMAD DANI SAPUTRA', '$2y$10$CfCrwO6uF8YlvRk3ggYl9ernC7Uic1C/zUadnywPl/4ETjtmQplD2', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (620, 712, 'ahmadkholilanam245', 'AHMAD KHOLIL ANAM', '$2y$10$ZeaITDrIVNERBvGzq8WBjuTnnM/zR7TCsx4wbO0baQG2YhYxt3Wq.', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (621, 713, 'ahmatzainolwefi918', 'AHMAT ZAINOL WEFI', '$2y$10$.3uwogSKnXB9gA64yGI99.PDPcvB7A6NGG1jY7M8iTzxlgqTB4CNS', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (622, 714, 'anafitria842', 'ANA FITRIA', '$2y$10$t7VJ3Ao3yNRbfsnwcb6rVOWW2sjPIkKYB3JFd0ffa0qjr8e/kCEjS', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (623, 715, 'anggaardiansyah357', 'ANGGA ARDIANSYAH', '$2y$10$2YWCZQGunix72dmZAx08RuHzevyCHG9EdcYWHs1XqNvQJRPMw2qf.', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (624, 716, 'anggaaulyzakaria818', 'ANGGA AULY ZAKARIA', '$2y$10$4dBAoF97mlqJLTDATIguS.4UGjTJEqzfo5/Ot4X7KmIZ41/84lptO', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (625, 717, 'anggeraryprayoga786', 'ANGGER ARY PRAYOGA', '$2y$10$5SKVKZENFsnaN/38jfL1p.6MP3/cTX92nuj4lmHj5wo6iqAffcLRy', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (626, 718, 'apreliaputrinurcahyadi10010', 'APRELIA PUTRI NUR CAHYADI', '$2y$10$bp6rAEX15xqIemJuzjQLQe9pbEd4Q1WAbQpW/t5Op4bOx.AvOWUsi', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (627, 719, 'aridwikiananta836', 'ARI DWIKI ANANTA', '$2y$10$PgPADwrxISWvbvJxBThgeuZ9kGPmlt/uD4iuOVZNb74ysqefDZjEq', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (628, 720, 'dhealovaadityaekaramadhan149', 'DHEALOVA ADITYA EKA RAMADHAN', '$2y$10$SABHjHq1yQfFkGEJ7Doh7Of.l9JZqs/NcFqFqC96BbSnSLs6k.JfG', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (629, 721, 'elsadwiistifiana6010', 'ELSA DWI ISTIFIANA', '$2y$10$0.dCrfDYzdAYgnqM3K1dquoPvEoM3SrffY.9ZahAer5OQx5bmYUJy', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (630, 722, 'fadilatulmaulida890', 'FADILATUL MAULIDA', '$2y$10$5dFbOYotCd50dPG6CYULgOCAxkfEsuEk2Zt62EtwefK5dCphjaXOW', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (631, 723, 'faraduwialyati585', 'FARA DUWI ALYATI', '$2y$10$W87FefL1PEIdlQ8hujD9bOdKizXmWdhNe6xGyOEbGKuQQczkwX.8i', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (632, 724, 'firnandajanuarisputri843', 'FIRNANDA JANUARIS PUTRI', '$2y$10$SvjJbiuOwTjgQm.D2z5Wb.pbr1NpOD4OLkBG9bTcaxJtW47j3MTDu', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (633, 725, 'galuhdiyantipermatasari893', 'GALUH DIYANTI PERMATASARI', '$2y$10$nqMDA6G90/YIhmcZHXg4juD5RV2njRKQy0AoW6v3t.5kpsA0PEgEi', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (634, 726, 'holisaamalia555', 'HOLISA AMALIA', '$2y$10$9CWgm1I2k4eZrbfav.xDUuPJVvrLGmiTf4WUkPE0fqG1roH4C81j6', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (635, 727, 'iftitahleninggaekaputri684', 'IFTITAH LENINGGA EKA PUTRI', '$2y$10$0BSvjjCA4zZ4uvJYYHG/R.jlyZFRvrQZ.TYzgbnZwkpJ516VgIFYa', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (636, 728, 'iftitahussaadah169', 'IFTITAHUSSAADAH', '$2y$10$3mNGNQ0/mSjaoRwIReap9OUrNnbEl.lsOPeU3VeJJD0HfIod2tWMi', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (637, 729, 'kamilatulqomariyah716', 'KAMILATUL QOMARIYAH', '$2y$10$3/C3INaUwft3vbv2rjYsfuwusjIRVEw9REUjYiFIB4/lz4RCd9BY6', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (638, 730, 'mohammadprayoga810', 'MOHAMMAD PRAYOGA', '$2y$10$WppgBNqtWj1g8UwvIc2ZDOn9ZYA33O82MKCt1cRdswDGlmNIpewVi', 2, 4, 7, 3, 1, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `siswa` VALUES (639, 731, 'mohammmadtegarandhikapratama923', 'MOHAMMMAD TEGAR ANDHIKA PRATAMA', '$2y$10$8.dl3ipn8A/YjRRWqDxXB.spudzab6aYMRnzfaI8N15BEDBOKqXUW', 2, 4, 7, 3, 1, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `siswa` VALUES (640, 732, 'muhammadnailulchoeri632', 'MUHAMMAD NAILUL CHOERI', '$2y$10$Ihm7ASl7//yYgX7uFYMDHu/.YsQo9CvFpwqnyIUM1Gj0ZKk0ZQjN2', 2, 4, 7, 3, 1, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `siswa` VALUES (641, 733, 'muhammadzainurraziqin5110', 'MUHAMMAD ZAINURRAZIQIN', '$2y$10$ixtExrJPyoXFOKEGaK0OFekwh7nAjqi0u.ORSnI.bxz1Tepj4tzku', 2, 4, 7, 3, 1, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `siswa` VALUES (642, 734, 'navinsafebiola577', 'NAVINSA FEBIOLA', '$2y$10$uFr8mjmZWAYgkhv/hGX55e7/btKNk0DeyKz/FtavNMJR0br/RDlES', 2, 4, 7, 3, 1, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `siswa` VALUES (643, 735, 'nurjiahindrianti420', 'NURJIAH INDRIANTI', '$2y$10$ia9RuIJ/EH6Dm33KJEsG0eTK1OqaHxogXk1RnShTqsQ.skInStfki', 2, 4, 7, 3, 1, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `siswa` VALUES (644, 736, 'pipitnovitasari765', 'PIPIT NOVITASARI', '$2y$10$oNxbR9ksDUgTvM.1y..yyujl0jLGT8KZnrCfD2VjyoS5ZW4AcVM.C', 2, 4, 7, 3, 1, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `siswa` VALUES (645, 737, 'putriwulandari781', 'PUTRI WULANDARI', '$2y$10$o74r0j24bS2it9xg3ACqAeAOXhBJgpwFUnR07dZB89EkFbgWRNnby', 2, 4, 7, 3, 1, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `siswa` VALUES (646, 738, 'rahadiafdalsyah327', 'RAHADI AFDALSYAH', '$2y$10$BmVQ25kAY85XSD.BCdXMJ.FvQh3uQmVgAYMXRfzmVZnmlMFXp397m', 2, 4, 7, 3, 1, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `siswa` VALUES (647, 739, 'roniferdianto826', 'RONI FERDIANTO', '$2y$10$fBQHeTp871V2gz9lNL6AbOQV/LnOP9pho2FTMeTcacl3vsmpyxAqa', 2, 4, 7, 3, 1, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `siswa` VALUES (648, 740, 'selaayulestari808', 'SELA AYU LESTARI', '$2y$10$dlQ1sOS/R08.cqqNdBiZnOuMy19/Do0dw3IZlPx0lZXfOvWmVhDvi', 2, 4, 7, 3, 1, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `siswa` VALUES (649, 741, 'sitiaisah227', 'SITI AISAH', '$2y$10$0a8SNLI8EZ7yHsbxYVKM1u1Q8G6pHhLMW2/ksfaDN2fdqCo289b6G', 2, 4, 7, 3, 1, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `siswa` VALUES (650, 742, 'sittimudmaina757', 'SITTI MUDMAINA', '$2y$10$ksVeYybYfg./5G8XR9EnZuWYg.ZFoYNwDT2FS8walaFk7W9dnIW.C', 2, 4, 7, 3, 1, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `siswa` VALUES (651, 743, 'syaifulbahri694', 'SYAIFUL BAHRI', '$2y$10$CLz7yi7gfkOpueWlwV1ySeMAvZTTlTC4PlAHXgtjeoeoGfob5peWm', 2, 4, 7, 3, 1, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `siswa` VALUES (652, 744, 'teguhdwiramadhani523', 'TEGUH DWI RAMADHANI', '$2y$10$pD6eMWjs1flyaR1cIEDEH.fVeR9LsZYTNMowScFqoH5UEQZZEnbcK', 2, 4, 7, 3, 1, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `siswa` VALUES (653, 745, 'abdulgafur276', 'ABDUL GAFUR', '$2y$10$xrIgAGdBBstobO5xL8UOROCQThtxSWwIt8tMlbGHQIVF/BWpUOate', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (654, 746, 'achmadfauzi628', 'ACHMAD FAUZI', '$2y$10$SP8Y2o0Iea1nOx4TDt31k.yRvU6ovRp0q/Pedz/IX1b0WKJp/jfsa', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (655, 747, 'ahmaddhanifirmansyah331', 'AHMAD DHANI FIRMANSYAH', '$2y$10$hP1g3KizSkRDCFL5GXxcNe7C4YQ.eoND7rAB3lMeTHNyRP3eZ.WAK', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (656, 748, 'ahmadkafabillah285', 'AHMAD KAFABILLAH', '$2y$10$IBLCWiu7dKzraZaY1LiCUuIW8qnB17JeUwefa7OIZQCnx7QSnRaNu', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (657, 749, 'ahmadsifaulqalbi376', 'AHMAD SIFAUL QALBI', '$2y$10$ktqaAnmEJI/r9fnlnYMEKOPnPCm5AzQKXeKMdANV.fg1YgAFXPuFe', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (658, 750, 'akbarilhamdani554', 'AKBAR ILHAM DANI', '$2y$10$HlgevDHDLreVghLIb.TP5.1P9SBxE9Al.palP2tOdJ3yCOtT.zsoC', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (659, 751, 'alfitoilhammaulana5510', 'ALFITO ILHAM MAULANA', '$2y$10$n/8oxNjqIciG3ll..9edbOQM/3U1DNg5hWOM18WtaajsnLzVysneq', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (660, 752, 'burhanudinzulfi4310', 'BURHANUDIN ZULFI', '$2y$10$NPUkpXdEL5CRp64yCJPUbOr/LOChJLeUAH3cHcAcglbvraCjBcjXi', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (661, 753, 'damarputrapratamabahtiar190', 'DAMAR PUTRA PRATAMA BAHTIAR', '$2y$10$ooxJ4CN6UVY1umO8LTe9/e8fLlNKdp4XKNupQjExfgB.xBplpTZbe', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (662, 754, 'davidaprilianalvis312', 'DAVID APRILIAN ALVIS', '$2y$10$CxF6ZVxD9sRPqoJKRZPn7.Um9dJpIuwEYeFvduo8ngG7lJtQG3VkS', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (663, 755, 'dedyputrakurniawan464', 'DEDY PUTRA KURNIAWAN', '$2y$10$6OXj.QUTyl7dtnOb0uPx3.IBr0N8eTI8AY4eJJUbvqabTfSSd7UFG', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (664, 756, 'dikaramadhan437', 'DIKA RAMADHAN', '$2y$10$vQPjsHyQoUQr7f4Wp60y/uYDkdhXyZ/CvIzoxCkUs/BOrK9o4q35m', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (665, 757, 'fikkrihnurrahmansyah106', 'FIKKRIH NUR RAHMAN SYAH', '$2y$10$M0z9RGljmLBJjyhmLBxai.4okptqMWeOvFZP/Z5/6DnxKwYfNaBQS', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (666, 758, 'firmanadiyaksahidayatullah610', 'FIRMAN ADI YAKSA HIDAYATULLAH', '$2y$10$GcsuQ3uXbEMQKRvTQGTgpueGNgb5HSGawdGGFTIaxmOglLgzb3JEK', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (667, 759, 'hamdanilarifin1010', 'HAMDANIL ARIFIN', '$2y$10$gkc.lkPCeoOmnPHpxuyn7.HjeHUb8lVDf4541zcccK1G60J.fA1ey', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (668, 760, 'ibroryusronsugiharto169', 'IBROR YUSRON SUGIHARTO', '$2y$10$8IItP/IFva9Ap8J36/Ho0./WAKODvFnS9PoW4VZ4MtWuWGLYgDvQO', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (669, 761, 'imamadiarroki5710', 'IMAM ADI ARROKI', '$2y$10$iwWHFBr/oe.hcaq8fRB.l.QkALdn7I1kmjzhYFVjJjZFF9jBnfA.6', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (670, 762, 'lorenchristian702', 'LOREN CHRISTIAN', '$2y$10$n7B.mj5ZCGWqdBdBbdoiPORYSgBgfKILgaNMGGbP3/lmTO.LstO1a', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (671, 763, 'maulidiyatrimaliyati152', 'MAULIDIYA TRI MALIYATI', '$2y$10$Zdg/w5lNLEPhG0CXoSJXl.QpLg7FwE9XJ.DgWdoXMtjrDEPA40Akq', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (672, 764, 'mochammadaldi637', 'MOCHAMMAD ALDI', '$2y$10$fHInzHu.OrZ0yYOWjLzU8.3K5gZdY.erHSgtCPgcdRyIj/qHahVxm', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (673, 765, 'mochammadtirmidzi782', 'MOCHAMMAD TIRMIDZI', '$2y$10$J.rONxxWrs/MK4mO0.bkvOpTa1GTQLACXYbWMjeJ4oN9I6QgRsDf2', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (674, 766, 'mohammadrenohabibi624', 'MOHAMMAD RENO HABIBI', '$2y$10$enEbjGC2AREZFEuSVHdRfO.PCsS6erQRIRNbMLdEaaI/ygf54.bDa', 2, 5, 8, 3, 1, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `siswa` VALUES (675, 767, 'muhammadaldoalfiyansyah360', 'MUHAMMAD ALDO ALFIYANSYAH', '$2y$10$apifMr5Qqj1lsW9bMpwy0./mM9Rsd/CTVINkStFsdAd8kj.OHz64u', 2, 5, 8, 3, 1, '2023-09-13 19:30:48', '2023-09-13 19:30:48', 1, NULL);
INSERT INTO `siswa` VALUES (676, 768, 'muhammadalthafalfansyah582', 'MUHAMMAD ALTHAF ALFANSYAH', '$2y$10$8hTVyojjL4k8CTWztCeflurCFtUyIuzjFRYMIuTsrsM7GlaQF46eC', 2, 5, 8, 3, 1, '2023-09-13 19:30:48', '2023-09-13 19:30:48', 1, NULL);
INSERT INTO `siswa` VALUES (677, 769, 'muhammadghazyaljahfal937', 'MUHAMMAD GHAZY AL JAHFAL', '$2y$10$EKu5OQLIBfXDF338xQSnYeR8XZ30pWfbo88lOSJtAZujdpMXMI.ta', 2, 5, 8, 3, 1, '2023-09-13 19:30:48', '2023-09-13 19:30:48', 1, NULL);
INSERT INTO `siswa` VALUES (678, 770, 'muhammadrezadayyanrismanto403', 'MUHAMMAD REZA DAYYAN RISMANTO', '$2y$10$EyBfnrL3stE0h52qpdNu.OGCDpuJGGuxiQ9sgng/3/u2Cu75Lwsua', 2, 5, 8, 3, 1, '2023-09-13 19:30:48', '2023-09-13 19:30:48', 1, NULL);
INSERT INTO `siswa` VALUES (679, 771, 'muhammadtaufiqbalafif736', 'MUHAMMAD TAUFIQ BALAFIF', '$2y$10$i5th98PByeJocC1ZmIYdVeqD3JJzc5A/1HENW1OU8CyAVtJsFmp2O', 2, 5, 8, 3, 1, '2023-09-13 19:30:48', '2023-09-13 19:30:48', 1, NULL);
INSERT INTO `siswa` VALUES (680, 772, 'muhammadwildantawagkal928', 'MUHAMMAD WILDAN TAWAGKAL', '$2y$10$vkZ0piyj30z2Dgf0ioS9qeRUbiCeeuXF7wLwXOD2B0JaXWBYA/rP.', 2, 5, 8, 3, 1, '2023-09-13 19:30:48', '2023-09-13 19:30:48', 1, NULL);
INSERT INTO `siswa` VALUES (681, 773, 'muwafiqulhobir127', 'MUWAFIQUL HOBIR', '$2y$10$xbyh5jC9mS3C4j6YkZMmR.mwU1X9vdYt/HBvHyTk.aalxw5Y80AKa', 2, 5, 8, 3, 1, '2023-09-13 19:30:48', '2023-09-13 19:30:48', 1, NULL);
INSERT INTO `siswa` VALUES (682, 774, 'rokhiqilbudiwardiansyah251', 'ROKHIQIL BUDI WARDIANSYAH', '$2y$10$ehBK78kcGbGSaE3zOSZcrOGZK1H1JTMWOArK6OSe6XkLOJ8zXHANa', 2, 5, 8, 3, 1, '2023-09-13 19:30:48', '2023-09-13 19:30:48', 1, NULL);
INSERT INTO `siswa` VALUES (683, 775, 'tegardwiabdilaziz810', 'TEGAR DWI ABDIL AZIZ', '$2y$10$6HXzDs6q65XumAp5n8EXBOpFiMzZFfMk2RFnr2kk9K6U14.uVn22m', 2, 5, 8, 3, 1, '2023-09-13 19:30:48', '2023-09-13 19:30:48', 1, NULL);
INSERT INTO `siswa` VALUES (684, 776, 'vianditaoktameliaputri941', 'VIANDITA OKTAMELIA PUTRI', '$2y$10$Kv4UDa/m4gkZcBQuthF9Peo71TRuxTugHK2l/.a6tKfT3FHGfFeOS', 2, 5, 8, 3, 1, '2023-09-13 19:30:48', '2023-09-13 19:30:48', 1, NULL);
INSERT INTO `siswa` VALUES (685, 777, 'ahmadrivaldicahyono891', 'AHMAD RIVALDI CAHYONO', '$2y$10$Rcg7W9bESpu7yf8GXFqbp.rhv0lAAwGjgDmcr9AY6v.LU5Y6Zahsy', 2, 5, 9, 3, 1, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `siswa` VALUES (686, 778, 'aldosaputra863', 'ALDO SAPUTRA', '$2y$10$EZ27VDNacDyRk0li/poeWetTr16Ak63DKoXouQyIXMdH5KZzftzh2', 2, 5, 9, 3, 1, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `siswa` VALUES (687, 779, 'amiruttawabhairussai847', 'AMIRUTTAWAB HAIRUSSAI', '$2y$10$ekhdu9ohse59dCXGMF7yvOQFLYVDBSA4tSsgE0eArTb4vHP.Fc7M.', 2, 5, 9, 3, 1, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `siswa` VALUES (688, 780, 'anggaismapratama156', 'ANGGA ISMA PRATAMA', '$2y$10$CMk8O9vlsEgx8mz/0ZDDYOE1i5.5D5umLOH1ui2srmDaCcOtGH.D6', 2, 5, 9, 3, 1, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `siswa` VALUES (689, 781, 'aqilakramburhanuddin471', 'AQIL AKRAM BURHANUDDIN', '$2y$10$QzueVD1gDVfKEo.BcgWnbeGycPpyhLh30XArRt9qRDRdJQyUkM.uS', 2, 5, 9, 3, 1, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `siswa` VALUES (690, 782, 'bintangmaulana607', 'BINTANG MAULANA', '$2y$10$hOwc8Pl8NJcQexOyMODdlOwa4g.YO5/StHIXbd6uhDYiNK2KaCfKK', 2, 5, 9, 3, 1, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `siswa` VALUES (691, 783, 'derylasrillahprayudha351', 'DERYL ASRILLAH PRAYUDHA', '$2y$10$9xX0M4k2q5tE50Tzy81ht.S5bhRyaiUHOKmaUGYwW2Gi/bVv17aDu', 2, 5, 9, 3, 1, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `siswa` VALUES (692, 784, 'ekazulvamunawaroh279', 'EKA ZULVA MUNAWAROH', '$2y$10$7UqQWx.dUCHpquQwFxgcyuZme8nzjxljeGlVPvomvqpXPAX8LfDYe', 2, 5, 9, 3, 1, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `siswa` VALUES (693, 785, 'galangmaylindopribadi117', 'GALANG MAYLINDO PRIBADI', '$2y$10$0PU049R/teZ8BSMdtfyuIO.yILQiU3pwi4hDAiVfK8ySREI7UQmti', 2, 5, 9, 3, 1, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `siswa` VALUES (694, 786, 'irzaahmadabdillah348', 'IRZA AHMAD ABDILLAH', '$2y$10$DZmG2SaMHpBZeQsZ4Ki9FuLPu8KChr6ZXyFhDKfdjOdOvkSqUj8yO', 2, 5, 9, 3, 1, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `siswa` VALUES (695, 787, 'maulanarafliapriandi931', 'MAULANA RAFLI APRIANDI', '$2y$10$8BdlsJh47GXYWdWvili3ieD09L9IVLbOgmJPRmYFvv38QCHCyFVOO', 2, 5, 9, 3, 1, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `siswa` VALUES (696, 788, 'mirzauchmalgani632', 'MIRZA UCHMAL GANI', '$2y$10$kQMsx5i7pXsmXAhHqJCMTekGcCw0ucDB0.Nv71P2n/ZY.wwZfCv3q', 2, 5, 9, 3, 1, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `siswa` VALUES (697, 789, 'mochamadyazidrahmanfadhilah902', 'MOCHAMAD YAZID RAHMAN FADHILAH', '$2y$10$4lGcivYJkMAZTHkq1u3PfuHGCXrRqlUX7bu/kb2635tWRbokSsUHS', 2, 5, 9, 3, 1, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `siswa` VALUES (698, 790, 'mochammadfarhanalfirdaus744', 'MOCHAMMAD FARHAN ALFIRDAUS', '$2y$10$xlphVtPh4e9SqjGBd6RoN.oBioIflXEXpim289hRk54r9LF0Um9Oi', 2, 5, 9, 3, 1, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `siswa` VALUES (699, 791, 'mohammadfarelhaikalaviz275', 'MOHAMMAD FAREL HAIKAL AVIZ', '$2y$10$fzbWyuAGKKxw6wxLY2nOjO8gsPheassfopJbQs2NO5Ts6XD6oRxui', 2, 5, 9, 3, 1, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `siswa` VALUES (700, 792, 'mohammadfirdaus300', 'MOHAMMAD FIRDAUS', '$2y$10$EiiJ19EjnIY41/8w2tolZOj/apLJ0vSbukd76zxw5RnhuFyWfH9zy', 2, 5, 9, 3, 1, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `siswa` VALUES (701, 793, 'mohammadhelmisyarif449', 'MOHAMMAD HELMI SYARIF', '$2y$10$hzW4nk5x1rKOSucN.2oIxuX9duq3zhmKV8DXBuheWkh40pf4LXQzK', 2, 5, 9, 3, 1, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `siswa` VALUES (702, 794, 'mohammadnovalalierfan304', 'MOHAMMAD NOVAL ALI ERFAN', '$2y$10$W7PlrHzzk38kIgH8fpOSL.KmRPa6LKt9d/NU2D8xkJO9mYHb37W/C', 2, 5, 9, 3, 1, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `siswa` VALUES (703, 795, 'mohammadrozikyulianto8410', 'MOHAMMAD ROZIK YULIANTO', '$2y$10$w2visqNMN1W/aeBG7mxKb.ubRDzIpDlyDnGzUlMv5KAS7/AEhP7Pe', 2, 5, 9, 3, 1, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `siswa` VALUES (704, 796, 'muchammadriorufaminjas969', 'MUCHAMMAD RIO RUFAMINJAS', '$2y$10$OSk111ocaifg8txyLEjyBuK8tREi7fIpih6Tc3Hk1OGDUy.TxgjvO', 2, 5, 9, 3, 1, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `siswa` VALUES (705, 797, 'muhammadderbiandwiputra786', 'MUHAMMAD DERBIAN DWI PUTRA', '$2y$10$xp2B4gl8En.wI2lOSws/0eoDMn5et5.6zanwV3wRcmmQIOyDZtByG', 2, 5, 9, 3, 1, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `siswa` VALUES (706, 798, 'muhammadfebri632', 'MUHAMMAD FEBRI', '$2y$10$0goQMpJSPnRTVSIaZlWrqeWl3FZ4tFz9x3piU4uycjKqmG5nRz3bu', 2, 5, 9, 3, 1, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `siswa` VALUES (707, 799, 'muhammadgibrilanwar5610', 'MUHAMMAD GIBRIL ANWAR', '$2y$10$w7pgYfc.beVMAmZxdik4mePCCTcmZ0PZvcqaQ21vjgvzOiKmVCMI2', 2, 5, 9, 3, 1, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `siswa` VALUES (708, 800, 'muhammadrafi658', 'MUHAMMAD RAFI', '$2y$10$sOasA8HffE3pRdioLCVBtOi2BYFFojOkxa7bTvfCoNUgCTGdzStSi', 2, 5, 9, 3, 1, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `siswa` VALUES (709, 801, 'mukhammadfarizfaidzin472', 'MUKHAMMAD FARIZ FAIDZIN', '$2y$10$LxDX3lCNNA2/M3eEkud8TugA4NuzYGay1NsmDdi54sfkIh6EsCHT2', 2, 5, 9, 3, 1, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `siswa` VALUES (710, 802, 'nadakamilahamatulah342', 'NADA KAMILAH AMATULAH', '$2y$10$MOyQNbKYW3N6C0J630k4ReKi/Uwf4oJhXnevL9y11qVzNEsCrV15a', 2, 5, 9, 3, 1, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `siswa` VALUES (711, 803, 'nicolafathorrosi432', 'NICOLA FATHORROSI', '$2y$10$55nGUTAvj6If3jeohR5j9uyV5DXJmvFB2vrQ7cOy5LmDXh4k8KBLa', 2, 5, 9, 3, 1, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `siswa` VALUES (712, 804, 'novalariyanto9910', 'NOVAL ARIYANTO', '$2y$10$4U9Egyh7hb4quJ7tP0mHjewBOcfwK1wq15jrJufPXBY7A.80X.The', 2, 5, 9, 3, 1, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `siswa` VALUES (713, 805, 'nurullah133', 'NURULLAH', '$2y$10$oyxLOb3SwprpxRow.fbm3.g9QmHqKIQT7ImbEQS7WGzgvQADhRVFC', 2, 5, 9, 3, 1, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `siswa` VALUES (714, 806, 'prasetiyoalfiandibudiono367', 'PRASETIYO ALFIANDI BUDIONO', '$2y$10$fxfl/f9.DWynb7UcLRMoXOMaSnqTb.om06KUNHpHTVHprvtqLBsnS', 2, 5, 9, 3, 1, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `siswa` VALUES (715, 807, 'sunnymuhlison9310', 'SUNNY MUHLISON', '$2y$10$ho8WrP10cDkBKZxUl5/diOz/46y86mvWTOGqjtOdsNCrxE/oSJfZO', 2, 5, 9, 3, 1, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `siswa` VALUES (716, 808, 'syahrulmubaroq1910', 'SYAHRUL MUBAROQ', '$2y$10$Ci4dX3nDDppZ/GCKNZcUx.gfMckldWxvCUjf7U0xwIXMABOIJSdEC', 2, 5, 9, 3, 1, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `siswa` VALUES (717, 809, 'achmadgalihadhyaksa414', 'ACHMAD GALIH ADHYAKSA', '$2y$10$FzOL9aMc8JemESWLcN7Yme8G/6NqITcLXn.zAAWT60tkWpSW5mqYm', 2, 6, 10, 3, 1, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `siswa` VALUES (718, 810, 'adamalamsyahquldiby228', 'ADAM ALAMSYAH QULDIBY', '$2y$10$tn3E1GuQCE3kjfC/yCLbX.bOVdLY0LrWXsSQzL4F51qb.8L7O9J8a', 2, 6, 10, 3, 1, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `siswa` VALUES (719, 811, 'ahmaddjunaediharyanto136', 'AHMAD DJUNAEDI HARYANTO', '$2y$10$fVbAZTRJyrR2gY3TFEHSn..c517m2uBQ7e35FQQyizLbsouBtShTK', 2, 6, 10, 3, 1, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `siswa` VALUES (720, 812, 'ahmadnurmuttaqien151', 'AHMAD NUR MUTTAQIEN', '$2y$10$R9ATH/S3.Wh9DVjX.HPyvezI87sJbIrzmp2kqQpXB69HyUiGkLz5S', 2, 6, 10, 3, 1, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `siswa` VALUES (721, 813, 'akbarbudiprasetyo581', 'AKBAR BUDI PRASETYO', '$2y$10$8dmWVoQNJHeXHf3iyGRT1..XeIBxKpKhP/w579AwggQPBsxdI3HF2', 2, 6, 10, 3, 1, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `siswa` VALUES (722, 814, 'alfyanannawaf845', 'ALFYAN AN NAWAF', '$2y$10$y3CNUmR4Zhii4feDmLbmf.M.UlbaZLgT/0XfFcvY8U3m9pi4w6n6K', 2, 6, 10, 3, 1, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `siswa` VALUES (723, 815, 'alifiamaylarifkisafira964', 'ALIFIA MAYLA RIFKI SAFIRA', '$2y$10$2VtlARItNb2BAOUmiKtDfu3RixBeZ0FTVS3eaR5YqDb62eVRa/eAm', 2, 6, 10, 3, 1, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `siswa` VALUES (724, 816, 'bayuarizonamukti468', 'BAYU ARIZONA MUKTI', '$2y$10$Ucv.Mgh/c92eHDuNmOYlUeFgU0diKBWWUOZSROlN0gp.IepLC8QpK', 2, 6, 10, 3, 1, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `siswa` VALUES (725, 817, 'bulanadeltazaprilia296', 'BULAN ADELTA ZAPRILIA', '$2y$10$yty55D832vIgmTRdt0Hb3OwcvajDLbMs1lx8ew22Ul05CjJI2GVdS', 2, 6, 10, 3, 1, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `siswa` VALUES (726, 818, 'dafitokeshaenggarkusumo1810', 'DAFITO KESHA ENGGAR KUSUMO', '$2y$10$CSrRVC1FC0UhO6b1hJxWoeZeYIN//IXkXBcpwSkfup8cAD4sjq.eG', 2, 6, 10, 3, 1, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `siswa` VALUES (727, 819, 'davinihwanprayogi458', 'DAVIN IHWAN PRAYOGI', '$2y$10$J3HPJM35sxYI9twAHcMRru.zsvv3ubizM4ITtAFxSBWPl5Tt/al9W', 2, 6, 10, 3, 1, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `siswa` VALUES (728, 820, 'dianaayu127', 'DIANA AYU', '$2y$10$FyMbJtNhSxY1HFE7WDAChuMwEdUDAEBO1RgqgaqJf.9szCfPhpaty', 2, 6, 10, 3, 1, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `siswa` VALUES (729, 821, 'dimasputraaditia739', 'DIMAS PUTRA ADITIA', '$2y$10$m9tglINakxffwfn4KB1APe1GSMnvcuc5x/xzfbQfnZXId/qBsMUQ.', 2, 6, 10, 3, 1, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `siswa` VALUES (730, 822, 'fauziahfarasafitri336', 'FAUZIAH FARA SAFITRI ', '$2y$10$mrp0rGlIu.srVQApbzxJJe9FOpraUJ8eXwGb3uS3g7.H5VpxQ71BG', 2, 6, 10, 3, 1, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `siswa` VALUES (731, 823, 'jamila153', 'JAMILA', '$2y$10$8yntrWQvyeWo4XWGtHuo3eu/lvp1Gl20O7xbK41VzZho3ujIiG7iG', 2, 6, 10, 3, 1, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `siswa` VALUES (732, 824, 'jonifernando349', 'JONI FERNANDO', '$2y$10$NXzWURoO0HPBAEakhttT7.KDJc83DsE65uh.AjxJnNs.t2VuNzdAK', 2, 6, 10, 3, 1, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `siswa` VALUES (733, 825, 'justinmosesprayogo688', 'JUSTIN MOSES PRAYOGO ', '$2y$10$PPtvQ28i35Y8WWgb5Jr37epmBO76uMLXBym.SUNlP2BuBWhkGXWH6', 2, 6, 10, 3, 1, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `siswa` VALUES (734, 826, 'mohammaddayrobifabiantara957', 'MOHAMMAD DAYROBI FABIANTARA', '$2y$10$xQCaZ7ccPJnOcqhGDk40KePif9Odljk.kvXDb65fjRrx16nnImk16', 2, 6, 10, 3, 1, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `siswa` VALUES (735, 827, 'mohammadsamsularifin756', 'MOHAMMAD SAMSUL ARIFIN', '$2y$10$ESJzUQcfhHoE51/wNNlGz.ox.RYenLyC/lSGUEyyHdIsbsjO5FnQ2', 2, 6, 10, 3, 1, '2023-09-13 19:32:58', '2023-09-13 19:32:58', 1, NULL);
INSERT INTO `siswa` VALUES (736, 828, 'muhammadfaizalfahrezy377', 'MUHAMMAD FAIZAL FAHREZY', '$2y$10$s.ZATno05IjuG8OqdvszfuD/WlA9BNXpGRVtsCT0JP7dvCdTqvFXO', 2, 6, 10, 3, 1, '2023-09-13 19:32:58', '2023-09-13 19:32:58', 1, NULL);
INSERT INTO `siswa` VALUES (737, 829, 'muhammadkafkaauliya3610', 'MUHAMMAD KAFKA AULIYA', '$2y$10$1DXBRSuugl.hJr/vwdHr2.5MgLYeJ3Z5.jPalYUru.UMlNpeBjLRO', 2, 6, 10, 3, 1, '2023-09-13 19:32:58', '2023-09-13 19:32:58', 1, NULL);
INSERT INTO `siswa` VALUES (738, 830, 'muhammadprayogawijaya429', 'MUHAMMAD PRAYOGA WIJAYA', '$2y$10$Ha3r2bUZaD/oCwyyFEzy2O5iXop3rYOXBtaSfQSpYQphQEY.nuEHa', 2, 6, 10, 3, 1, '2023-09-13 19:32:58', '2023-09-13 19:32:58', 1, NULL);
INSERT INTO `siswa` VALUES (739, 831, 'muhammadrifqimaulana682', 'MUHAMMAD RIFQI MAULANA', '$2y$10$fcD3khsQ4LfT47cwZjN02Om3Vy/qs4FpBE0eATmfi75.WkTInLnJK', 2, 6, 10, 3, 1, '2023-09-13 19:32:58', '2023-09-13 19:32:58', 1, NULL);
INSERT INTO `siswa` VALUES (740, 832, 'satriorifkiandika6710', 'SATRIO RIFKI ANDIKA', '$2y$10$jZ3iv4FKXsapSfNN2.ECdu8N6nFiyXsy.ACDk7v4.kyEoi7QSS2Ay', 2, 6, 10, 3, 1, '2023-09-13 19:32:58', '2023-09-13 19:32:58', 1, NULL);
INSERT INTO `siswa` VALUES (741, 833, 'septianbudiramadhan665', 'SEPTIAN BUDI RAMADHAN', '$2y$10$rbjHi/4csPHu1tWLlKCjwe5pbtBguk8Lp./fF8.Vt4p6vwztNedgm', 2, 6, 10, 3, 1, '2023-09-13 19:32:58', '2023-09-13 19:32:58', 1, NULL);
INSERT INTO `siswa` VALUES (742, 834, 'valenreksaadyanggara232', 'VALEN REKSA ADY ANGGARA', '$2y$10$7ko64Y3Cn5n/XGQWt0XQAuBqpNJbC3NBRW8NOgrmXoOyTkBmHUkgi', 2, 6, 10, 3, 1, '2023-09-13 19:32:58', '2023-09-13 19:32:58', 1, NULL);
INSERT INTO `siswa` VALUES (743, 835, 'verischasalsabillaraihanuun734', 'VERISCHA SALSABILLA RAIHANUUN', '$2y$10$8O05KCaY8688z60OI.KKwOufDIVkZI0MM8KxVJ1SAgDGPNzmCNbOS', 2, 6, 10, 3, 1, '2023-09-13 19:32:58', '2023-09-13 19:32:58', 1, NULL);
INSERT INTO `siswa` VALUES (744, 836, 'yanuarielpancadarmawan6110', 'YANUARIEL PANCA DARMAWAN', '$2y$10$zASD8EcccMafRxCHn9iJ.ecktqLEvpR9/IUYSqMHJLUbfPbaI5F4.', 2, 6, 10, 3, 1, '2023-09-13 19:32:58', '2023-09-13 19:32:58', 1, NULL);
INSERT INTO `siswa` VALUES (745, 837, 'abdulmuslih1002', 'ABDUL MUSLIH', '$2y$10$Li1CYG/5h6Pue3V.Wrkm8OXyty1r2Jxywj3QJIJQ3N8Wcn1HMEiNu', 2, 7, 12, 3, 1, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `siswa` VALUES (746, 838, 'achmadfauzan216', 'ACHMAD FAUZAN', '$2y$10$5.r4UU8qN2FUlTlRh0ppv.MnP5uc81VpN54Dunc.PQI7mtc.AIkTK', 2, 7, 12, 3, 1, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `siswa` VALUES (747, 839, 'adityaandrewputra728', 'ADITYA ANDREW PUTRA', '$2y$10$D/q2BreFBkxlsO2k49f.QuZZNSw21SiIqCeiJlFiEBqdBx5P6PTTi', 2, 7, 12, 3, 1, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `siswa` VALUES (748, 840, 'alfarezawildananghermawan715', 'ALFAREZA WILDANANG HERMAWAN', '$2y$10$ZsMSmJjoFB/7ecxUrLhZjeXGVgKqXp8LfhS.J2VD58tAwjGEf2DPi', 2, 7, 12, 3, 1, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `siswa` VALUES (749, 841, 'angelinaameliaputri561', 'ANGELINA AMELIA PUTRI', '$2y$10$uL4p273iOiJ9P10wtWspy.8uMQKT9ZnhuykvpteiONOP3y3ZzTh32', 2, 7, 12, 3, 1, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `siswa` VALUES (750, 842, 'barepadhiyasta463', 'BAREP ADHIYASTA', '$2y$10$dYg2EBbIfhHbiEJ8lmn6GOtwsW/3mpNmG.8Qz/GGkRWtldaA9Qoyu', 2, 7, 12, 3, 1, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `siswa` VALUES (751, 843, 'devalovadaniputra512', 'DEVA LOVADANI PUTRA', '$2y$10$HGoZKdiRoNtGXI/6/Vvmw.XUsQC1NoHP5jTIkf7YbXXab9gG/8gbS', 2, 7, 12, 3, 1, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `siswa` VALUES (752, 844, 'falihrahmatullahpratama276', 'FALIH RAHMATULLAH PRATAMA', '$2y$10$a9ZrS08IOcvvzC5rYstUHOJHftUyWXKzRfNWURz0WTyapdN6OBjtm', 2, 7, 12, 3, 1, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `siswa` VALUES (753, 845, 'fathirgatanalibi799', 'FATHIR GATAN ALIBI', '$2y$10$Xk316Q626Wdum.NTHrWVzObV8897rCTbTU0DSICeLnm/zNV5MzHVa', 2, 7, 12, 3, 1, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `siswa` VALUES (754, 846, 'friyandanadavafirmansyah281', 'FRIYANDANA DAVA FIRMANSYAH', '$2y$10$w3.W1TThJP37gAgaIIgofesfC9pheH4PJZnO.FjqsC7wRLe0dcp4S', 2, 7, 12, 3, 1, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `siswa` VALUES (755, 847, 'gandiwibisono4910', 'GANDI WIBISONO', '$2y$10$XfP05ST06u8T3NwyLL8In.r2jH.Vek6qeGTJdlJ4y2xQ9L7/HgKru', 2, 7, 12, 3, 1, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `siswa` VALUES (756, 848, 'gilangdharmatectona969', 'GILANG DHARMA TECTONA', '$2y$10$sQdHcYUbmbShvmaNufIUzu42HBghyLnXaWDsoN7JHV8FExIvuY.dW', 2, 7, 12, 3, 1, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `siswa` VALUES (757, 849, 'harisrahmankurniawan988', 'HARIS RAHMAN KURNIAWAN', '$2y$10$CffmKJYchGuFEE1QXlQCx.MUn61esZ/7hqup3t6k1fIFHquEtVAOu', 2, 7, 12, 3, 1, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `siswa` VALUES (758, 850, 'indrasaputra394', 'INDRA SAPUTRA', '$2y$10$9Taw/ZwBNgNVjzwBANuMWeEIGGtSmexm3QmQhvPk4aRBbDtAz89me', 2, 7, 12, 3, 1, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `siswa` VALUES (759, 851, 'missiyhadiyantoro537', 'MISSIY HADIYANTORO', '$2y$10$mjP6O1jCKwtOVI0jhhWJZenvgsKfxqJUxYS/ktUgxVq2FZvUmV0NW', 2, 7, 12, 3, 1, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `siswa` VALUES (760, 852, 'mohakhiffirmansyah360', 'MOH. AKHIF FIRMANSYAH', '$2y$10$yqhOQBLjsiD4aBdIQSXGeOAmPoJ88nzfnklATcxCoZ4EqQ3MvZEVm', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (761, 853, 'mohrifqinurarifillah943', 'MOH. RIFQI NUR ARIFILLAH', '$2y$10$5fPxx1QF6/xx4jTZRjxSfumIz9H.nQYQPrLSQaDRP4KG.f48vUcTW', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (762, 854, 'mohammadfanynasyithainulyakin409', 'MOHAMMAD FANY NASYITH AINUL YAKIN', '$2y$10$ZjoGNRlI/aWuI92DU8UzEufOFtIdFZk6HCHIWSJU.Ec4G.jsrwyJq', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (763, 855, 'mohammadilyashidayatullah9010', 'MOHAMMAD ILYAS HIDAYATULLAH', '$2y$10$tUn9.TbBZY5QyGC9ow53d.FjbSWlGtjaTDRmWnh7A75S05rTMgBTq', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (764, 856, 'muhammadadityainsanfadhila828', 'MUHAMMAD ADITYA INSAN FADHILA', '$2y$10$2Zw8j7yw5/yZAa19bWZpCOcrPLIyykIxOxdzZeoUeA53.J282WOKm', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (765, 857, 'muhammaddwifauzan506', 'MUHAMMAD DWI FAUZAN', '$2y$10$sQy7DfLx8qbUCueF9k.dDO2qd32AXtdqblnF4V5Bu65k.12kuzJoK', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (766, 858, 'muhammaddzakisyarif744', 'MUHAMMAD DZAKI SYARIF', '$2y$10$vvomn4apGc0bSXE/XzjKr.7zxhlGymk5C7txL3YpjhP9Q.Y6kOw1i', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (767, 859, 'muhammadfareldafisaputra754', 'MUHAMMAD FAREL DAFI SAPUTRA', '$2y$10$hKTCx0snCN5EavCv0z5H7.KXpgDlg088plqfknIeZTm7V5TGIUZMa', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (768, 860, 'muhammadirfanarrafi656', 'MUHAMMAD IRFAN AR RAFI', '$2y$10$EbSlorfhC7aNOh2/gzo3k.hBHxOXY1BenG1cN2hG5hg5X7uBmIL.6', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (769, 861, 'muhammadnofal278', 'MUHAMMAD NOFAL', '$2y$10$k7gymcgfOy5kyUMdfczUfOnhtFOJ9kuoOiEzSpqW1/lyScHmsUxNq', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (770, 862, 'muhammatlukmanulhakimzainulmustafa781', 'MUHAMMAT LUKMANUL HAKIM ZAINUL MUSTAFA', '$2y$10$WKNqLqnBwVnYwvCMegRp0O5LQpwslLbCPLPVVUzWUb3JGZwFcnsQO', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (771, 863, 'neruanggara782', 'NERU ANGGARA', '$2y$10$3lTBvohqqv1VFvbMxYM.tOc8HiTdiY9FO.nQjVHowDQt7eEiL/Bom', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (772, 864, 'nikitatiaradwimaulidia339', 'NIKITA TIARA DWI MAULIDIA', '$2y$10$sQlSe1qH.wH6lDzLgbRLKOsED7aw4UIxeErytthcwHRwovLCKFAUO', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (773, 865, 'raflianfirdausmaulani534', 'RAFLIAN FIRDAUS MAULANI', '$2y$10$e5Fv4CYdJyXLwsr3ZoTkXek4xZnV/x7q9NA6R1fP91Z0s364xWDVi', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (774, 866, 'razantegarafandi2810', 'RAZAN TEGAR AFANDI', '$2y$10$mronNM06ACAyP2y2erz2f.KEPZs4tHZrQgVfL6snOxeRWI8R8s7vS', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (775, 867, 'reskyarsyieal-danial654', 'RESKY ARSYIE AL-DANIAL', '$2y$10$xRXubtfgdpsJiA.4D2mvk.Dl6XsW0v1FxHOUBOqNPXhJ5s3wTJzTO', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (776, 868, 'rizkymutiarafitri677', 'RIZKY MUTIARA FITRI', '$2y$10$n3iqNXB/DOs9kzBe28NKjeNtrv3WJeGumsNHt5BmUFf0EBl/wYzm6', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (777, 869, 'satriaalhanilafi831', 'SATRIA ALHAN ILAFI', '$2y$10$MBouRFjHFCk74N4CZxelAu5OVDKRm7r8YIh5v5V8X/ynoyEcvYJni', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (778, 870, 'syauqiuwaimirbahrumputra982', 'SYAUQI UWAIMIR BAHRUM PUTRA', '$2y$10$QAyFaGOrZVGd3vwkvZUlWOGFpNGdPSMLJ9YgM4Np9QaLs8hMncSje', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (779, 871, 'totokpriantonoalramadani150', 'TOTOK PRIANTONO AL RAMADANI', '$2y$10$6HxsBhBhgwRA/BcPPM9Hxeuzv6TkmgXT3rFG9Ba5C.RbRRZcK7fcC', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (780, 872, 'willysuryoantaredha678', 'WILLY SURYO ANTAREDHA', '$2y$10$sdeY3HZN2Eo0s02u/v25cuIYIc2scJMeyf8C9lui0q0zu70Kzc6T6', 2, 7, 12, 3, 1, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `siswa` VALUES (781, 873, 'ahmadaburizalalgifari850', 'AHMAD ABU RIZAL ALGIFARI', '$2y$10$pyOriLqF.C2rvUirTkV1xubThtBliHFM5Q5K4DQjWL7W/mAFBpKLi', 2, 8, 14, 3, 1, '2023-09-13 19:36:08', '2023-09-13 19:36:08', 1, NULL);
INSERT INTO `siswa` VALUES (782, 874, 'ahmadbaihakiistiandi886', 'AHMAD BAIHAKI ISTIANDI', '$2y$10$mO9ApLqYB8ikqq6JE.o.fuR5WmICZuq7zYJwZaeouZiPdqCcXP8lK', 2, 8, 14, 3, 1, '2023-09-13 19:36:08', '2023-09-13 19:36:08', 1, NULL);
INSERT INTO `siswa` VALUES (783, 875, 'anasabyanpasha822', 'ANAS ABYAN PASHA', '$2y$10$yXvrv.3KCSlZZ7DnmafKYesrF6gxwl2M9mPa4nL5YvXI5VVq7cP26', 2, 8, 14, 3, 1, '2023-09-13 19:36:08', '2023-09-13 19:36:08', 1, NULL);
INSERT INTO `siswa` VALUES (784, 876, 'angelnaisillaazima390', 'ANGEL NAISILLA AZIMA', '$2y$10$U8XEx6efiGxxmnCBEWIoV.03TFvHj4unfW42QwRFkhT5s1UyH6gfO', 2, 8, 14, 3, 1, '2023-09-13 19:36:08', '2023-09-13 19:36:08', 1, NULL);
INSERT INTO `siswa` VALUES (785, 877, 'dimaserfandi200', 'DIMAS ERFANDI', '$2y$10$7mOcXUJ0ehP1IlAGzHPgreEHQmdnC8Uw8xQYBDhVG9YTjGCjUd3vO', 2, 8, 14, 3, 1, '2023-09-13 19:36:08', '2023-09-13 19:36:08', 1, NULL);
INSERT INTO `siswa` VALUES (786, 878, 'febriantofalantino920', 'FEBRIANTO FALANTINO', '$2y$10$sNR5l6ivWbrsFnXbjA5CmuPlg3GI3K9VzRyCKi70ps.5jxsK5sapm', 2, 8, 14, 3, 1, '2023-09-13 19:36:08', '2023-09-13 19:36:08', 1, NULL);
INSERT INTO `siswa` VALUES (787, 879, 'hotipusman311', 'HOTIP USMAN', '$2y$10$w98VLz7NZwVE8qaZClQISOFN2WWriuNG4jlGxyqVbJbhJwaEK6ZA.', 2, 8, 14, 3, 1, '2023-09-13 19:36:08', '2023-09-13 19:36:08', 1, NULL);
INSERT INTO `siswa` VALUES (788, 880, 'maulidyaelzafiandatiar964', 'MAULIDYA ELZA FIANDATIAR', '$2y$10$LYE1vXQlTN13/OU8pzIyk.h7pVRbofPLYGGev6LCTZxGuFEMLtj02', 2, 8, 14, 3, 1, '2023-09-13 19:36:08', '2023-09-13 19:36:08', 1, NULL);
INSERT INTO `siswa` VALUES (789, 881, 'mohammadfarisfauzanakbar973', 'MOHAMMAD FARIS FAUZAN AKBAR', '$2y$10$8pIxaXMHF/skCfK9VCGFu.CZtSjOauQQJcWvA.1W5zvKL515O0Tz6', 2, 8, 14, 3, 1, '2023-09-13 19:36:08', '2023-09-13 19:36:08', 1, NULL);
INSERT INTO `siswa` VALUES (790, 882, 'mohammadrendyprakoso8310', 'MOHAMMAD RENDY PRAKOSO', '$2y$10$tSkFFjnJBdxLB/FvA6.7QOKhuzFr5.0FnTbkxZZgVTuEJQuyDdsaC', 2, 8, 14, 3, 1, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `siswa` VALUES (791, 883, 'mohammadsofyanhalili979', 'MOHAMMAD SOFYAN HALILI', '$2y$10$oYJCm.Ho.UVlYpHr3GjX1ejIcWE1UdGLZ/OgyKIEWCzhawWYaOPwq', 2, 8, 14, 3, 1, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `siswa` VALUES (792, 884, 'muhammadanggaputrapratama139', 'MUHAMMAD ANGGA PUTRA PRATAMA', '$2y$10$QBTMIMwwYleoD6b7kafkB.VWRxXPDqXDFc5lx0J4uFBMUIkyjLMx6', 2, 8, 14, 3, 1, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `siswa` VALUES (793, 885, 'muhammadmuslehromadoni250', 'MUHAMMAD MUSLEH ROMADONI', '$2y$10$watzDhORAheqwAZD4V3yWOz14xJQSk6U1aiJGlY7ifW89VGf1ZbtO', 2, 8, 14, 3, 1, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `siswa` VALUES (794, 886, 'muhammadnorrendra383', 'MUHAMMAD NORRENDRA', '$2y$10$CrNaHr9Xy18sl1SP92q4wu0kV/ass653wsghF9qdDnhd0itoGT4eu', 2, 8, 14, 3, 1, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `siswa` VALUES (795, 887, 'muhammadrizki471', 'MUHAMMAD RIZKI', '$2y$10$yPtmHuabvE4ZIZR6d5WkR.L2fiKUhMdFGHvIj7YprW8d3uUil6qs2', 2, 8, 14, 3, 1, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `siswa` VALUES (796, 888, 'muhammadshofarelihsan823', 'MUHAMMAD SHOFAREL IHSAN', '$2y$10$xWgmcGfzzy77Xr36oww5t.FVVcPwtFnhaA1/Lmi5pEwC5w7fuIQjS', 2, 8, 14, 3, 1, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `siswa` VALUES (797, 889, 'muhammadwiranto983', 'MUHAMMAD WIRANTO', '$2y$10$4/pouh9rmioMebW5E/P0UuMC2GiTkwIigoF6UF.jA1O49QKuhqPQi', 2, 8, 14, 3, 1, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `siswa` VALUES (798, 890, 'muhammadzackyfirdiansyah905', 'MUHAMMAD ZACKY FIRDIANSYAH', '$2y$10$bwXZABB.bkIliFV8HBruauyA.v2nkF2oF5lS.vIvDQD2E/smGIJiu', 2, 8, 14, 3, 1, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `siswa` VALUES (799, 891, 'nazwaalyaputri621', 'NAZWA ALYA PUTRI', '$2y$10$8bDRRXt9VCTblqEIP6XH9euyFq3V2WG9NcWHgGrxVcVMkq51glAH2', 2, 8, 14, 3, 1, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `siswa` VALUES (800, 892, 'niaditarahayu905', 'NIA DITA RAHAYU', '$2y$10$IntXa/0rs/tqF8g8RdDmX.XP34At4ODN3UzPneyd1vyZcoraluOle', 2, 8, 14, 3, 1, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `siswa` VALUES (801, 893, 'shodiqmahmudi920', 'SHODIQ MAHMUDI', '$2y$10$8Prq.aVtxIGbHX5zgb5jdeAkDaeaygyqGP5coAEyyYcDx8UiF304i', 2, 8, 14, 3, 1, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `siswa` VALUES (802, 894, 'adeliaekapujianto322', 'ADELIA EKA PUJIANTO', '$2y$10$vjyrak4Zc2.vVN/KhQoFH.EpYXhXqoEc4OoFYwsVKJq1DiVGRv1F.', 3, 9, 15, 3, 1, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `siswa` VALUES (803, 895, 'aisyahsulistianingsih819', 'AISYAH SULISTIA NINGSIH', '$2y$10$/Y665WTYz/mNydcSuIGWROT4BOJLG6o5O.N3jYLt1yli0qCfmZt66', 3, 9, 15, 3, 1, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `siswa` VALUES (804, 896, 'amandadwicahyaningwulandari476', 'AMANDA DWI CAHYANING WULANDARI', '$2y$10$rMTFAYJuxvrvNlt/2azwAeAEEgdllBQdaqSJ/zc/8SSlBSM4Hmx6C', 3, 9, 15, 3, 1, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `siswa` VALUES (805, 897, 'anggyfaradina234', 'ANGGY FARADINA', '$2y$10$zBJIkE.TK/MQ7RFBNs4KcuJQIqTtliPrDy1O1eLMkosOdAFAaUcQa', 3, 9, 15, 3, 1, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `siswa` VALUES (806, 898, 'cantikadwiwardani2410', 'CANTIKA DWI WARDANI', '$2y$10$Lw3xaPWholMNc1RSlS60b.rZIKZka0TrADa9GiaF.ATp2.l9QJTLu', 3, 9, 15, 3, 1, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `siswa` VALUES (807, 899, 'chantikamayshinta622', 'CHANTIKA MAY SHINTA', '$2y$10$GOur6XIwVb5K1FTYIF4RiOKrASUSBWRJpDY87lZWhmpGmwCOotSEi', 3, 9, 15, 3, 1, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `siswa` VALUES (808, 900, 'danangseptakurniawan659', 'DANANG SEPTA KURNIAWAN', '$2y$10$tuj5nq8ifFB4AKGDQ5F4KOezQhYDfKuGkhLd7AwFnMWh0zKMiqs0q', 3, 9, 15, 3, 1, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `siswa` VALUES (809, 901, 'dwiratihekaseptiani699', 'DWI RATIH EKA SEPTIANI', '$2y$10$BAjAlgXTtw4XJ1Qso1fQa.rOWTx/5Z.QWZHD0ZhQouNI1W7dfJjh.', 3, 9, 15, 3, 1, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `siswa` VALUES (810, 902, 'fenifilianaarif1007', 'FENI FILIANA ARIF', '$2y$10$CuqSKlYnw36T9fZo2X2AyuHeUzeo2uDURtL/01mHpeplgCDfiVrh6', 3, 9, 15, 3, 1, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `siswa` VALUES (811, 903, 'finaatikatungonita295', 'FINA ATIKATUN GONITA', '$2y$10$qQPAvuR6Q/d.ytOWq.AWVuTVaeCbCJK8d96WuR6TjqHzbJaPg.Rxa', 3, 9, 15, 3, 1, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `siswa` VALUES (812, 904, 'gitadwiandini123', 'GITA DWI ANDINI', '$2y$10$VcHpKKM4jeFUcHR6yHOoCuORzu5RXaIbphIf3nU0smOs0.06HZjX2', 3, 9, 15, 3, 1, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `siswa` VALUES (813, 905, 'hairatunnisah986', 'HAIRATUN NISAH', '$2y$10$udLPj.pCwgSy7q0gB1k9rODMSZm73/RWmunygm9qGtEk49aNEf62G', 3, 9, 15, 3, 1, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `siswa` VALUES (814, 906, 'intanlailatussifanah985', 'INTAN LAILATUS SIFANAH', '$2y$10$sDV39.aRgZXe.XXbMiTuZOyPmvhaGJh1CvNF4MRVjo6KhGz2cdAJy', 3, 9, 15, 3, 1, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `siswa` VALUES (815, 907, 'istiana643', 'ISTIANA', '$2y$10$dbbONJ5dfMqLOvzuKIN.4.Baa.Fza3gTijbS.1rbqEGnly3.NE03S', 3, 9, 15, 3, 1, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `siswa` VALUES (816, 908, 'maulidearofiatuljannah533', 'MAULIDEA ROFIATUL JANNAH', '$2y$10$w/RPsltxq15QVE77ayQVjOaykuklRQXNt0lnr9IBDbjx50G9SAntu', 3, 9, 15, 3, 1, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `siswa` VALUES (817, 909, 'muhammadferdiyanto796', 'MUHAMMAD FERDIYANTO', '$2y$10$jHAAe9JVE0anJoOZoACULeqluvQBwnch7PUdnlEZnOZTe2jaGrVdK', 3, 9, 15, 3, 1, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `siswa` VALUES (818, 910, 'muhammadnukilalfarizi4410', 'MUHAMMAD NUKIL ALFARIZI', '$2y$10$v9Mp4uNBdlA9HQcuNFk/zOqnMoKjfzPhkCYDFAoTBIY35Asugbx/y', 3, 9, 15, 3, 1, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `siswa` VALUES (819, 911, 'najwarosyidahzahrotulhayat116', 'NAJWA ROSYIDAH ZAHROTUL HAYAT', '$2y$10$WVL2JCRYTt0eGeoG5f2LOeKOmTq2ej5QuzmZLY3B5Dpv2QhtNTHpS', 3, 9, 15, 3, 1, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `siswa` VALUES (820, 912, 'noventiaayuraisyaputribaiturrahman505', 'NOVENTIA AYU RAISYA PUTRI BAITURRAHMAN', '$2y$10$zdJk17w0l0Sk0Ix8PbBoou4R8L0tpbeuwOHIkqR1aV4/EUglokKpC', 3, 9, 15, 3, 1, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `siswa` VALUES (821, 913, 'putrikartikaselvriyanti193', 'PUTRI KARTIKA SELVRIYANTI', '$2y$10$932wSLEJWUm2xgO11eUFCumr1pXFEYqoHHYUoemPA30BHFM3iB0Ze', 3, 9, 15, 3, 1, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `siswa` VALUES (822, 914, 'rafirahmadfirmansyach224', 'RAFI RAHMAD FIRMANSYACH', '$2y$10$NWePdTqvmRyktHAHLtaImuMhd8TsnnXd6HeBiuThlAPkmDXt2Hdtq', 3, 9, 15, 3, 1, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `siswa` VALUES (823, 915, 'riana394', 'RIANA', '$2y$10$oxW7h0NeMs3IL5QEdfs72OLDSmQqPQh4YILOqPVGgw8dEBrOPi/wy', 3, 9, 15, 3, 1, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `siswa` VALUES (824, 916, 'sariwiladatussalimah591', 'SARI WILADATUS SALIMAH', '$2y$10$gGJvNy0nY5Gd.TvTxv.2vOiXEMWexAs45Vl97Qani9hwJ13WKj.uO', 3, 9, 15, 3, 1, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `siswa` VALUES (825, 917, 'sitiauliaashfahany3010', 'SITI AULIA ASHFAHANY', '$2y$10$7oIuuD12NSj9f9PV.9.V1uupEJtrOtRH2FMjcOwdD8foYrY3RYu7G', 3, 9, 15, 3, 1, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `siswa` VALUES (826, 918, 'sitiramadatussavina934', 'SITI RAMADATUS SAVINA', '$2y$10$hD05Za5MHgz94z69YxHVSOlxr9gu9XZ1cQQrokv.3TU0ywPw6MpsS', 3, 9, 15, 3, 1, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `siswa` VALUES (827, 919, 'sutanadhifadiwangsa177', 'SUTA NADHIF ADIWANGSA', '$2y$10$EZSRZay/tDZY3U3MrMyENeyF8vvl/QH0azp8zLDiLde4d.JtHZKA.', 3, 9, 15, 3, 1, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `siswa` VALUES (828, 920, 'syalsabilakhoirunnisa566', 'SYALSABILA KHOIRUN NISA', '$2y$10$WhE1jm0geSG./eFt28ogEO4QGMzF5bVe2WRy8BtHPI/ZeU.14029e', 3, 9, 15, 3, 1, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `siswa` VALUES (829, 921, 'vanesatriyacalista1000', 'VANESA TRIYA CALISTA', '$2y$10$07Ww7T03c2OA/9s/9TgS4OeGO5n1euli7v5zYJagaKVX98F2LYpH.', 3, 9, 15, 3, 1, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `siswa` VALUES (830, 922, 'windaputriagustin342', 'WINDA PUTRI AGUSTIN', '$2y$10$SE/4qS1mDd0n2dfvuePr..gnx1SZLXJQYZPutusc5v2AuN51ShbyK', 3, 9, 15, 3, 1, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `siswa` VALUES (831, 923, 'yoepiedianpermadani6510', 'YOEPIE DIAN PERMADANI', '$2y$10$cHXwNzZIjP/SR2QvdipbZezbxSnEHu3DbNqPQLv0SWnW8ZFovRTiS', 3, 9, 15, 3, 1, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `siswa` VALUES (832, 924, 'ainunazizah252', 'AINUN AZIZAH', '$2y$10$6uUy5ISq53ARFHKE1vIddezHDSEdY/MKWUyI9vDGU/oRm52yqnoNW', 3, 9, 16, 3, 1, '2023-09-13 19:38:26', '2023-09-13 19:38:26', 1, NULL);
INSERT INTO `siswa` VALUES (833, 925, 'aliviaaisyahputri672', 'ALIVIA AISYAH PUTRI', '$2y$10$jtMG/XJZlbduDwAMwbehE.k/RVXvP6Dl1vNgtl8TMbyFARC.Axana', 3, 9, 16, 3, 1, '2023-09-13 19:38:26', '2023-09-13 19:38:26', 1, NULL);
INSERT INTO `siswa` VALUES (834, 926, 'amandaputriwulandari836', 'AMANDA PUTRI WULANDARI', '$2y$10$AANAi65rPyOvpY1dGjj9fuDZhmfPRTMWPNGFVk.frATnDyHW2aRyu', 3, 9, 16, 3, 1, '2023-09-13 19:38:26', '2023-09-13 19:38:26', 1, NULL);
INSERT INTO `siswa` VALUES (835, 927, 'anisyanuramiliya957', 'ANISYA NUR AMILIYA', '$2y$10$Js7xoB3RxX.trFC9mrS4oe6Hh2yDJIPSjIi/gH9pi/tDDSimdQ./m', 3, 9, 16, 3, 1, '2023-09-13 19:38:26', '2023-09-13 19:38:26', 1, NULL);
INSERT INTO `siswa` VALUES (836, 928, 'bondanwilisaputra434', 'BONDAN WILI SAPUTRA', '$2y$10$R7pgG/XKdMqkijuUzl708ua5ieL6ZWmvW8yUVAif1ME5NnGTF8qt2', 3, 9, 16, 3, 1, '2023-09-13 19:38:26', '2023-09-13 19:38:26', 1, NULL);
INSERT INTO `siswa` VALUES (837, 929, 'cantikamaharani314', 'CANTIKA MAHARANI', '$2y$10$ENc6pqfg2EFppgMVPoAeQeOAC5FqtzcsjSA1h261vOLPqL6QoawNS', 3, 9, 16, 3, 1, '2023-09-13 19:38:26', '2023-09-13 19:38:26', 1, NULL);
INSERT INTO `siswa` VALUES (838, 930, 'dianapuspitasari152', 'DIANA PUSPITA SARI', '$2y$10$ecU48D1Im32hwXeHqyelX.QUs.trho0aw3NIOav.VStrsWgICoMK2', 3, 9, 16, 3, 1, '2023-09-13 19:38:26', '2023-09-13 19:38:26', 1, NULL);
INSERT INTO `siswa` VALUES (839, 931, 'faradiladwiamelia212', 'FARADILA DWI AMELIA', '$2y$10$N1Ap.NyxOJcPYmX7QnVBruho0gIlY46S9i7VQqplqBuHiKO1kF0X2', 3, 9, 16, 3, 1, '2023-09-13 19:38:26', '2023-09-13 19:38:26', 1, NULL);
INSERT INTO `siswa` VALUES (840, 932, 'ferinoktaramadhani533', 'FERIN OKTA RAMADHANI', '$2y$10$7ebkY.uX8ylVWhLNrhtSGOo9D5WUmnXJONgTy5MP6rByOVAEH5oqG', 3, 9, 16, 3, 1, '2023-09-13 19:38:26', '2023-09-13 19:38:26', 1, NULL);
INSERT INTO `siswa` VALUES (841, 933, 'giscapaulina582', 'GISCA PAULINA', '$2y$10$Q2DFvi965CrWcHFjMQ704.dce0uWjrb.b/SuJWS0L.2bq2E6EL7Am', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (842, 934, 'hafidatussolehah884', 'HAFIDATUS SOLEHAH', '$2y$10$Y1bJBkwJmqjqJiFUAQRumOgNh/L4TSevhBb9Gs8ZzU7rOOMTJSmM2', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (843, 935, 'hayatifirdaus338', 'HAYATI FIRDAUS', '$2y$10$munFcZ3Zhpp0ohnhXwzCROGVj99uCpm1cDNgMH/qpshMMt2g1aXl2', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (844, 936, 'intanwahyuprastya528', 'INTAN WAHYU PRASTYA', '$2y$10$UBgh7wSh4nZmmLagoKYeOO5d0v.r6KqLAGO3SyBofxYTUiMix32a2', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (845, 937, 'itanurriskiyanti302', 'ITA NUR RISKIYANTI', '$2y$10$865/lPVE70NNABZgOzU88.o8sLxmUhKVTZB4BDzgFktz941Vtxm3e', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (846, 938, 'maulanaaprilia583', 'MAULANA APRILIA', '$2y$10$WARB.ayOEDVRzNdPVk7JeO3jlSTBHPooKhHKyfWCQE2D35eJCbcTu', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (847, 939, 'meirizairnaanggraeni2510', 'MEIRIZA IRNA ANGGRAENI', '$2y$10$Foxuw8S5AZL7Hz9JJ4.WWO81V8i4/k1lBSMhMTPO7/UxrVNKjO58m', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (848, 940, 'muhammadakbarrisqisantoso888', 'MUHAMMAD AKBAR RISQI SANTOSO', '$2y$10$B5W5TMw9RpBEvmz.gOwRpODKhUtj/5LoyciNOrUjLhGczZFtrTnBO', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (849, 941, 'muhammadnauvalalfaisal403', 'MUHAMMAD NAUVAL ALFAISAL', '$2y$10$rRcRJYPuV8EOI6ZK3YXja.21HOd4OzE0wAPPNivd.j.pq.SXJ4wBK', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (850, 942, 'noniktriaskartika6410', 'NONIK TRIAS KARTIKA', '$2y$10$Lp/8Q7yAsDDHgT/sAdxc2eYJXG/PQJzdXpzTLLqLo.BAHno2Tj/Mq', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (851, 943, 'prasetyadwitugassaputra655', 'PRASETYA DWI TUGAS SAPUTRA', '$2y$10$My6YJgVqaxsH5kLZYoj1o.GZUZqoxhKqz3TsLDkVDuy88bMqDVJQK', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (852, 944, 'putriekaningrizkysantoso846', 'PUTRI EKANING RIZKY SANTOSO', '$2y$10$m25InvxvB1A8DIeZ45fxZOz/c4AiPLID7h6G9l8KWUDAOv2sS6AV2', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (853, 945, 'renatadwilestari233', 'RENATA DWI LESTARI', '$2y$10$eNuz4Tns2EXJCTd7pufPsuxNfrF7gVAvGahDDdeArpvLVeCXf41FW', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (854, 946, 'ricohairulanam9310', 'RICO HAIRUL ANAM', '$2y$10$vBLIRT5hMRM7VHi3.ZjWuuDqkNE4sFqC88p8BsW1c0kBXO2RD1JhS', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (855, 947, 'riskayuniartikazizah797', 'RISKA YUNIARTIK AZIZAH', '$2y$10$VMTqiShIZep9XVutpOj/TOOx4QRIvVsRqe.1Xl9c2Y6T0E/a6Xx3u', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (856, 948, 'sherineaurelia246', 'SHERINE AURELIA', '$2y$10$8ZLj0RNPsSjLWIrKCnOEJOciy4h4vbxJaBGsup.tNm3NHqraiy7uW', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (857, 949, 'sitimaysharoh312', 'SITI MAYSHAROH', '$2y$10$P1/YvTCrFsfA3l9MHEbxK.MRBnWtFOj7SbP.fATWQLNzIakcY7g8C', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (858, 950, 'sitisofiyatulamaliyah199', 'SITI SOFIYATUL AMALIYAH', '$2y$10$7wI4.7lg6MGvf9srX739HeLvD5ZPXmKNqW9B9Z3XWJHJiL3o2Gh9u', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (859, 951, 'syarifahsafiinatulmasruroh3110', 'SYARIFAH SAFIINATUL MASRUROH', '$2y$10$SD5Z5/6sYT9CFtfF0LANzOrFmTW0h9vAnjwOE.BroKlwRt/R/SU9i', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (860, 952, 'wahyubudisantoso902', 'WAHYU BUDI SANTOSO', '$2y$10$/o51uPClH8sEovAdlM/OWO9gujFRePGdLyqBazzXiS4lFOCgCRwm.', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (861, 953, 'wikamonika260', 'WIKA MONIKA', '$2y$10$jnsgWNzqWxloVdlsTi.2.e8Nt6sbU7qIBoJnntwdThq4Qqg8PkS1S', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (862, 954, 'windayuliasari324', 'WINDA YULIA SARI', '$2y$10$yi4EkCgR8uQnJUXgo3lW7Oqcrj2qfGysxE3agi6ZngpV6odu46phW', 3, 9, 16, 3, 1, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `siswa` VALUES (863, 955, 'abduladnan723', 'ABDUL ADNAN', '$2y$10$0Ofjs4Eq2qAwm.dyVHREoeL7fryudns/fg13y7RzjFtUyWKXr8gGq', 3, 10, 17, 3, 1, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `siswa` VALUES (864, 956, 'alfisyarifatulhasanah1810', 'ALFI SYARIFATUL HASANAH', '$2y$10$CSMUx3c9C9PkCVyx0gxaQewWxdU/o2rM2ha204ExYS/1.6laWEgTK', 3, 10, 17, 3, 1, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `siswa` VALUES (865, 957, 'angguntrihartini386', 'ANGGUN TRI HARTINI', '$2y$10$KJSGDVlNOPaDlIkWlgH6DeD5hJtTPBOfXu54fBXIfFo808qGzO7Nu', 3, 10, 17, 3, 1, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `siswa` VALUES (866, 958, 'anirahmawati6510', 'ANI RAHMAWATI', '$2y$10$1MZO7zyw6iK1xZmIwMGZa.cuPyO.9TSlEs/jhbkODgngJTk0Z2146', 3, 10, 17, 3, 1, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `siswa` VALUES (867, 959, 'bungaheldaangelriska514', 'BUNGA HELDA ANGEL RISKA', '$2y$10$S/Fv6RS6IwA3ZWVe8XV9jeBUFhaMIefZZnT3UN2ckQkrlgbyJAyW.', 3, 10, 17, 3, 1, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `siswa` VALUES (868, 960, 'delaseptiarini494', 'DELA SEPTIARINI', '$2y$10$8wiUuwZs7Fh1oGCJ3dHPguhM70chshSBJ1As.DcJUCJRBDqdrZnJO', 3, 10, 17, 3, 1, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `siswa` VALUES (869, 961, 'dianaputrimaharani478', 'DIANA PUTRI MAHARANI', '$2y$10$jwT/jw7C/S1r7tiEiMItbOBeAhi0jfVCcnl8FkVmTpltlfXTnfiMG', 3, 10, 17, 3, 1, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `siswa` VALUES (870, 962, 'elvinafitrih7010', 'ELVINA FITRIH', '$2y$10$McViqROzlwD6fwHtDzZXz.E30Gx2ub4HUEPpRsflFcs0atfMiCOX2', 3, 10, 17, 3, 1, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `siswa` VALUES (871, 963, 'fendimaulana600', 'FENDI MAULANA', '$2y$10$jd8RmBXckBHGAPuArTiwGuwumOafIHQ7FZgWxVOz2tTQ/FRDmUeOe', 3, 10, 17, 3, 1, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `siswa` VALUES (872, 964, 'ginafitratulmuntazah161', 'GINA FITRATUL MUNTAZAH', '$2y$10$mnQWinTJq6RYYjHsHljqeOVHIf3JaMPLs5P/nJF5u5kUcp9oZqswi', 3, 10, 17, 3, 1, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `siswa` VALUES (873, 965, 'halimatussadiyah840', 'HALIMATUS SADIYAH', '$2y$10$HQvf7zbL/osHGZtNoFYmpOUICk/Zu8n6pT2Xs2l6cyT/ZJp497WjC', 3, 10, 17, 3, 1, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `siswa` VALUES (874, 966, 'jamilatussyarifah135', 'JAMILATUS SYARIFAH', '$2y$10$5hbBZ/6sdt95whct4IjAZ.XgVtQ1e.yK.pESnwtXKXn8dBs/7vMay', 3, 10, 17, 3, 1, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `siswa` VALUES (875, 967, 'khildarosida225', 'KHILDA ROSIDA', '$2y$10$GyjjyBN.0sQfHxWYfUrcQOr3nN121IDAjz5vc4JKn3MshUJPk4Cte', 3, 10, 17, 3, 1, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `siswa` VALUES (876, 968, 'maidaputrifatimatuzzahro754', 'MAIDA PUTRI FATIMATUZZAHRO', '$2y$10$xZajZIsyO3Sw/wh1Ffx.De8Xve5UY8JNbNVMp7ZTHhfStjhYaaibu', 3, 10, 17, 3, 1, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `siswa` VALUES (877, 969, 'muhammadafandipratama260', 'MUHAMMAD AFANDI PRATAMA', '$2y$10$Nl..7x/iK933BhVRGfKdC.dypJrGyIVpkKsxne/KsJkRdqkovyRdu', 3, 10, 17, 3, 1, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `siswa` VALUES (878, 970, 'muhammadramakalamullah947', 'MUHAMMAD RAMA KALAMULLAH', '$2y$10$S.xpllxBT52miZfL/sZKGeK7Jy5cHEl8oKcA2kuCL1kOr1XeXSUSu', 3, 10, 17, 3, 1, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `siswa` VALUES (879, 971, 'nabilaagustinkhoirunika361', 'NABILA AGUSTIN KHOIRUNIKA', '$2y$10$6NNM3xDa5asM9VAgK9SfAukgBolf14EHzdQ/HdESLmR79xKGzy0iS', 3, 10, 17, 3, 1, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `siswa` VALUES (880, 972, 'najwanurhasanah283', 'NAJWA NUR HASANAH', '$2y$10$0j1NyLPf4hWZgrlPipqGx.1Q5fTQrwKW2AvJaJrysI2CrCvdPQ4mG', 3, 10, 17, 3, 1, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `siswa` VALUES (881, 973, 'nicosetyawan244', 'NICO SETYAWAN', '$2y$10$s/Ve.l.1yE5QU86eKHYXvu/B4aGpzCxLzRD5jzNCleKWgmZSxlKSq', 3, 10, 17, 3, 1, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `siswa` VALUES (882, 974, 'noviaziqnafirdausy893', 'NOVIA ZIQNA FIRDAUSY', '$2y$10$nV2jD6gONNJk397LjKZgRe5KtoS4lIlkAbBLkLq9UUOU3zTh2BgeK', 3, 10, 17, 3, 1, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `siswa` VALUES (883, 975, 'ratihwindiyuniasie220', 'RATIH WINDI YUNIASIE', '$2y$10$gsHmap/7Gk5KbpdkD6XRget023TX2mR/Zvs.30sdwKkyXzw80glly', 3, 10, 17, 3, 1, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `siswa` VALUES (884, 976, 'rifkinurakbarjunaidi706', 'RIFKI NUR AKBAR JUNAIDI', '$2y$10$5pO/hJCuSLcvxjiUoOYvk.JqxW5AruUGXgGiFaxKZ0QTmltt9o0bi', 3, 10, 17, 3, 1, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `siswa` VALUES (885, 977, 'rismanurkhalisah416', 'RISMA NUR KHALISAH', '$2y$10$4RGpm6cmGHyKIKMKFHWsFu147Mxxwv/rhyj8CX2A2t4jymcJxZgNO', 3, 10, 17, 3, 1, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `siswa` VALUES (886, 978, 'rizkiazizahsalsabila149', 'RIZKI AZIZAH SALSABILA', '$2y$10$dBT5zfLoDNP8rP5YmwMQV.eRUmdm7hPvGN.fb7megYWOVV0cCaSpS', 3, 10, 17, 3, 1, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `siswa` VALUES (887, 979, 'salwahsabrina622', 'SALWAH SABRINA', '$2y$10$aJt7yh9wGp7RBJsofxrZgOwdhvt3rIRCspvGkfoBAx2sxcyrc.w3G', 3, 10, 17, 3, 1, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `siswa` VALUES (888, 980, 'sitanurhalisah823', 'SITA NURHALISAH', '$2y$10$8Zmiartt.npnuwkP1.AIUORds.0YYAyOGbtaooK8NIm1kYkIkUjZW', 3, 10, 17, 3, 1, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `siswa` VALUES (889, 981, 'sitiindriyani775', 'SITI INDRIYANI', '$2y$10$/fpcJC2lB5DhTKW5wbUYS.iQmQg0bHEHBUdtS0ljLB2V5iE7FG5BG', 3, 10, 17, 3, 1, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `siswa` VALUES (890, 982, 'suciromadiyahmakmur764', 'SUCI ROMADIYAH MAKMUR', '$2y$10$yKgHFeP9kbv1apIvRtR8bOSUqUNH9fnKLXHE5mKaYTKGz7Mc0Z6be', 3, 10, 17, 3, 1, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `siswa` VALUES (891, 983, 'titaagustinaauliarahman3910', 'TITA AGUSTINA AULIA RAHMAN', '$2y$10$DnbYnCs46OZcjKDvxvqgG.XJFZ9nghz5K.nYJgOAuHlOKu4PTq.2a', 3, 10, 17, 3, 1, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `siswa` VALUES (892, 984, 'vinaandini752', 'VINA ANDINI', '$2y$10$/oDzft83wMUQ5lgSuLcIduJYBw/p9q4XLX3SuGqS0zr3BNQ7wJpYa', 3, 10, 17, 3, 1, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `siswa` VALUES (893, 985, 'agishoirunnisa861', 'AGIS HOIRUN NISA', '$2y$10$TYvac/Jx1bVrTTBLy6RNeuZ4.c.WDqSL0plM0xaBOxD.eSIBtMC2e', 3, 10, 18, 3, 1, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `siswa` VALUES (894, 986, 'ahmadaburizalalgifari970', 'AHMAD ABU RIZAL ALGIFARI', '$2y$10$eVz9WDxQMSwKE2WvmzIgb.JgcWGao4cjJVzhvEMa1wI.EwCLOLlaq', 3, 10, 18, 3, 1, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `siswa` VALUES (895, 987, 'alfianuruzzyadah2510', 'ALFIA NURUZZ YADAH', '$2y$10$utOrv0umXaO1SsDXr61SS.J/tdm2/1z353XxO7lQ8Al2akZRWkTP.', 3, 10, 18, 3, 1, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `siswa` VALUES (896, 988, 'angieseptianingtias244', 'ANGIE SEPTIANING TIAS', '$2y$10$fgfjUoLAvRh7Qv2./9KVj.YPRwmGxa.qMKJYd54K6gc/7xu0pRRBK', 3, 10, 18, 3, 1, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `siswa` VALUES (897, 989, 'arilnuraini168', 'ARIL NURAINI', '$2y$10$jv38J57Nn49.aoNRIYce3upATauvUCyQAdyJdQdyk6FTttiDqfKK.', 3, 10, 18, 3, 1, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `siswa` VALUES (898, 990, 'chairuneisafebitricahyani147', 'CHAIRUNEISA FEBITRI CAHYANI', '$2y$10$HvFPIGBd0L4ankJ6Jw5boun5/gmCaWEY08leXDaeQVXbWzN8k0b0S', 3, 10, 18, 3, 1, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `siswa` VALUES (899, 991, 'dheaamandasafitrimaulani620', 'DHEA AMANDA SAFITRI MAULANI', '$2y$10$0E0GbSnHmyPXMJ6PIWDP.eO/iPGTQsAGBhNRBERuMbyibhMTyXvf.', 3, 10, 18, 3, 1, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `siswa` VALUES (900, 992, 'dinydwiafdholullaily2710', 'DINY DWI AFDHOLUL LAILY', '$2y$10$nSmHG5XfJdsqhAqiv3QaoOGD2tkkXTJ0fZdoetqo1g/ei.jfnOvsu', 3, 10, 18, 3, 1, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `siswa` VALUES (901, 993, 'duwidarmawan6010', 'DUWI DARMAWAN', '$2y$10$EZEMTPa7iPghIxBRWS/mrO.irCVdZNhSg5SKWTmaZEIYzpxFkaWLi', 3, 10, 18, 3, 1, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `siswa` VALUES (902, 994, 'fifinnurulisnaini525', 'FIFIN NURUL ISNAINI', '$2y$10$v/CqWFjKX97VqtaM/jhUOe3KHoAGIOeh4yX7588qfX9/jxmwZbjLa', 3, 10, 18, 3, 1, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `siswa` VALUES (903, 995, 'gitaabelianajwa331', 'GITA ABELIA NAJWA', '$2y$10$RC1mMBXdCOPgtW7TGrvYl.llHymzCxtor8hJWIQpUDIdrJxOa6xxC', 3, 10, 18, 3, 1, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `siswa` VALUES (904, 996, 'hilyahfairusiyah922', 'HILYAH FAIRUSIYAH', '$2y$10$ZFyeeSZCZNuQ5t1fU9DftuXTsqxq6Jj8NezGvzoSHG36PGFT7w7Fq', 3, 10, 18, 3, 1, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `siswa` VALUES (905, 997, 'jihanzahirohwahyuni684', 'JIHAN ZAHIROH WAHYUNI', '$2y$10$fyigDV6U6cFOUlgIpJaAS.8uCpzfH238Q6VeExzKevmeiOjTuIyne', 3, 10, 18, 3, 1, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `siswa` VALUES (906, 998, 'lathifatulintan684', 'LATHIFATUL INTAN', '$2y$10$PlrqaAcC.3PrjpfaLWQHBuA/0ME7Ky74FBh12W6HeZ9ssmTUDjGLS', 3, 10, 18, 3, 1, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `siswa` VALUES (907, 999, 'maisarohgaferlisafitriadani809', 'MAISAROH GAFERLI SAFITRI ADANI', '$2y$10$CHmj5GpnQgFuwfaRQPKoqO75O3UUCgvryRcuO/0ErMY77W1krmQy2', 3, 10, 18, 3, 1, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `siswa` VALUES (908, 1000, 'mohammadwafi183', 'MOHAMMAD WAFI', '$2y$10$mn3CBW.BbuMzY75YS4xFuOSHfacfK8qhQrTM/eI8Ga/KJs6uCd46y', 3, 10, 18, 3, 1, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `siswa` VALUES (909, 1001, 'muhammadazrielwahyuramadhan4610', 'MUHAMMAD AZRIEL WAHYU RAMADHAN', '$2y$10$tbZfgwqO8yoRtkNL3ramlObOa2bDkzq9o/7mldW42mgeEKXLAE/Vi', 3, 10, 18, 3, 1, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `siswa` VALUES (910, 1002, 'muhammadwildan852', 'MUHAMMAD WILDAN', '$2y$10$BKjrEJw7G3JiXIniPNLNFOZkpZSB18x8k07K79ZNkoQBkhNc70su.', 3, 10, 18, 3, 1, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `siswa` VALUES (911, 1003, 'nadiahzehro967', 'NADIAH ZEHRO', '$2y$10$DytwM8Awu3NOaZE5fvcs3.yrKcHI23uJjLB7bSMzeAKvPNox/a8WO', 3, 10, 18, 3, 1, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `siswa` VALUES (912, 1004, 'nindiwardahkamelia191', 'NINDI WARDAH KAMELIA', '$2y$10$dTc.X5M4XMQ3POmcA2ICtO4pfIX3WxT7kkZBqlv4BgkD90vdsAGG2', 3, 10, 18, 3, 1, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `siswa` VALUES (913, 1005, 'nurulfadilahirfaniarahayu263', 'NURUL FADILAH IRFANIA RAHAYU', '$2y$10$ffoC0g0VAO/ZuOGgVs2iz.q9y90mANcTrh7lyZob80CBpUb1WGsW.', 3, 10, 18, 3, 1, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `siswa` VALUES (914, 1006, 'pujiandayani146', 'PUJI ANDAYANI', '$2y$10$n3Tw6GBeh3pWnK1.rRL.Fuwsjwah7JSIomI7ZhCp/vnqHE4.271fe', 3, 10, 18, 3, 1, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `siswa` VALUES (915, 1007, 'rahmatekaprasetiyo539', 'RAHMAT EKA PRASETIYO', '$2y$10$bqqkTaYXGXTC64Hzlq5oO.l.N09uyRkw8dHS0Lb9AsuLTyi95wmAm', 3, 10, 18, 3, 1, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `siswa` VALUES (916, 1008, 'rindioktaviaramadhani759', 'RINDI OKTAVIA RAMADHANI', '$2y$10$ES4zffYIeNiP7hV9laU1VO1Jr/7c.QdimAOKbGZS8cklENjuZN23y', 3, 10, 18, 3, 1, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `siswa` VALUES (917, 1009, 'rizkiamalia734', 'RIZKI AMALIA', '$2y$10$1SK/2yfkHCOMT3kntp6QYuduf47P.7Dxqh247mA3n7sOWDW2pgMUi', 3, 10, 18, 3, 1, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `siswa` VALUES (918, 1010, 'rossaridiadamayanti584', 'ROSSA RIDIA DAMAYANTI', '$2y$10$Cijh7/.nAD1fR/HVrz3qeOgnO4c1t8k2ML7eVPFlUUyyr1At6mmSG', 3, 10, 18, 3, 1, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `siswa` VALUES (919, 1011, 'shelylatanzil392', 'SHELY LATANZIL', '$2y$10$WbBrVBaf7NggDQm/znRZMOR3oGagJfI7HHpIMiKr.v5XQ70gHzePq', 3, 10, 18, 3, 1, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `siswa` VALUES (920, 1012, 'sitiholifah706', 'SITI HOLIFAH', '$2y$10$5lrrm.vIGPAlZwX0WhlStu.6lgmyqFKw5cYe1i7.lV4acpg1jKaba', 3, 10, 18, 3, 1, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `siswa` VALUES (921, 1013, 'sittinurfaisah630', 'SITTI NUR FAISAH', '$2y$10$wreMGg.5NTyLeWeLLz.w5e59dj/mMTT.rEKtjSYz8nD3uwiB0IckG', 3, 10, 18, 3, 1, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `siswa` VALUES (922, 1014, 'tiaramutiahjuwitaputri341', 'TIARA MUTIAH JUWITA PUTRI', '$2y$10$6/otOByhjb98BtaEMmcgjeSKVmfJ3J6lbwvEV5DwA6iIBDIswXJhK', 3, 10, 18, 3, 1, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `siswa` VALUES (923, 1015, 'zindadwiaprilia2110', 'ZINDA DWI APRILIA', '$2y$10$f.t02cp/dGBLa5WDlu3Wd.DCsl5.VcHvstxB4sYIDUKDbt7jS7TdS', 3, 10, 18, 3, 1, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `siswa` VALUES (924, 1016, 'ahmadsubastiarivandy241', 'AHMAD SUBASTIAR IVANDY', '$2y$10$nZ6TmhnU7n8ur5PD6jzJS.uVnFrws8PD.bSnxhf1RuUbQXetGJWaG', 3, 11, 19, 3, 1, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `siswa` VALUES (925, 1017, 'aininorafriyanti246', 'AINI NOR AFRIYANTI', '$2y$10$KaH76wFBVxap.aPiIpQMKeWnAG/coJqpn2p6RISe9wDfrP0YUGx5.', 3, 11, 19, 3, 1, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `siswa` VALUES (926, 1018, 'aurayogioktavianti265', 'AURA YOGI OKTAVIANTI', '$2y$10$fdxsqvBZ0.Xn848t5RYz8upnjTRnka1PHi9NG02PLA/8o5NzW4rBe', 3, 11, 19, 3, 1, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `siswa` VALUES (927, 1019, 'camiliafauziyah161', 'CAMILIA FAUZIYAH', '$2y$10$a0tA4GTa0EqPIJ0p5xCRIOsEnIUDlwegYUl2STw/0doNYbXfPmGtW', 3, 11, 19, 3, 1, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `siswa` VALUES (928, 1020, 'cindydwiramadhona655', 'CINDY DWI RAMADHONA', '$2y$10$Mqqjd5p8iAt2eJpUospCvennNsyHGx8rtxJfCS7aOE5xY9HMqVnxK', 3, 11, 19, 3, 1, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `siswa` VALUES (929, 1021, 'dellanataliamargareta934', 'DELLA NATALIA MARGARETA', '$2y$10$9FRIV0UzDcjNvJr8BZziQ.l32AvOyXRKTNZzIuUWzPzS09NTkR0c6', 3, 11, 19, 3, 1, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `siswa` VALUES (930, 1022, 'dwiayukurniawan480', 'DWI AYU KURNIAWAN', '$2y$10$a481dtC3Oe103JVdGGgqo.2iAFiWW9gqNFqJ9xf.IRhT1eW171eP6', 3, 11, 19, 3, 1, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `siswa` VALUES (931, 1023, 'dwisaptaharnawi390', 'DWI SAPTA HARNAWI', '$2y$10$TmN7DQCr7d4jnCgP20/MFujNc/ftJjjdCxH.QYtJeNBPeic.ULNze', 3, 11, 19, 3, 1, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `siswa` VALUES (932, 1024, 'emiliainsankamilah657', 'EMILIA INSAN KAMILAH', '$2y$10$8091Y1sMHlUCL48/NhB6hexUxtFllXMmFhhNepIVRQXooxRet4WEW', 3, 11, 19, 3, 1, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `siswa` VALUES (933, 1025, 'fitriandriyani547', 'FITRI ANDRIYANI', '$2y$10$hPc7P/6g9.MCddFC0ePZl.pqdkZfpU/iXFskW95cUuJs6dYvVLwPe', 3, 11, 19, 3, 1, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `siswa` VALUES (934, 1026, 'grisnayaauliaherianto7610', 'GRISNAYA AULIA HERIANTO', '$2y$10$0VT/T0FuABoAvTVcwC/W4uQ1KZo9o/XSkbcQXasrnwyVgn44VS.V6', 3, 11, 19, 3, 1, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `siswa` VALUES (935, 1027, 'ichaayudyafebianti485', 'ICHA AYUDYA FEBIANTI', '$2y$10$fMCwXlFcjRimqTugEKGWg.H1npSDX5DyAH7kxX6XO9vAO8gLamDqa', 3, 11, 19, 3, 1, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `siswa` VALUES (936, 1028, 'lailyazzahrosuprapti3810', 'LAILY AZZAHRO SUPRAPTI', '$2y$10$H7ZKaL8l5pJS8JG3Hej26OO0zY6.PG0qG8Xg0MvRHr.nEN.pFYPFS', 3, 11, 19, 3, 1, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `siswa` VALUES (937, 1029, 'masyaruhhusnolkhotimah909', 'MASYARUH HUSNOL KHOTIMAH', '$2y$10$36n4zDp4936aGcreb7lpmuRb4vDnu7HvamoJKIyFQYl6I8CvmBHRC', 3, 11, 19, 3, 1, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `siswa` VALUES (938, 1030, 'muhammadafifandifirmansyah291', 'MUHAMMAD AFIFANDI FIRMANSYAH', '$2y$10$xXHsQLaI2pzivT2Gb/zX3OKmiKAoBpAAsfQhXke3bFb.LDHMna5SC', 3, 11, 19, 3, 1, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `siswa` VALUES (939, 1031, 'navizahadilaayu905', 'NAVIZAH ADILA AYU', '$2y$10$AcrWSWkcVi3LavwpzQ2HKeFddEvC6UrWZOt1r5FiCOMOx7OPy1MnK', 3, 11, 19, 3, 1, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `siswa` VALUES (940, 1032, 'putrileginanabilasuheimy547', 'PUTRI LEGINA NABILA SUHEIMY', '$2y$10$p0J4H1kPhz/236.d2SPfLOg0sIk1qPXXAPYYXJ9pfkiwfFr3bPoU.', 3, 11, 19, 3, 1, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `siswa` VALUES (941, 1033, 'renitawahyuniputri335', 'RENITA WAHYUNI PUTRI', '$2y$10$m8Z/Q8of71SGl0Jg7/1Yr.yLFlGamD7J3YADJMgW7tHurvpQQTgGq', 3, 11, 19, 3, 1, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `siswa` VALUES (942, 1034, 'revaliaputriagustina605', 'REVALIA PUTRI AGUSTINA', '$2y$10$tmEqbEmnuHxGwMCP.rnHyuocpkkaBS880Od7vf02YYlXvU4vA0CdK', 3, 11, 19, 3, 1, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `siswa` VALUES (943, 1035, 'sifaniaseptiarini285', 'SIFANIA SEPTIARINI', '$2y$10$cEfEVZItF5kCCxCx8kSbN.Tad2LQlDvsm9jOSbiyKtCKi3ZXSahHq', 3, 11, 19, 3, 1, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `siswa` VALUES (944, 1036, 'sulistiananingsih127', 'SULISTIANA NINGSIH', '$2y$10$ygHy8RyCnRlDNBV.ujbkSOok.IBdDoeIfuhhQ2Wc1xSYllNFPnbgC', 3, 11, 19, 3, 1, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `siswa` VALUES (945, 1037, 'valentinochristiangunawan580', 'VALENTINO CHRISTIAN GUNAWAN', '$2y$10$3hWx7xbD/wZzh2lz/V1sA.Ya22IuskwJ/YcyEgn6O5i4NXnIq2o02', 3, 11, 19, 3, 1, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `siswa` VALUES (946, 1038, 'zalvazahriyachaniva729', 'ZALVA ZAHRIYA CHANIVA', '$2y$10$rGCRuLFb6gITNfvquXn.3eFdDr92bAr9O8zEWxbP9aomsWtYUcdIa', 3, 11, 19, 3, 1, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `siswa` VALUES (947, 1039, 'afnurnadila277', 'AFNUR NADILA', '$2y$10$jGvDY5NgZ4Yl97Brr9Gbfedo3lP1G0GYJuOr.YUq.MhCSYmRt36hm', 3, 11, 20, 3, 1, '2023-09-13 19:42:54', '2023-09-13 19:42:54', 1, NULL);
INSERT INTO `siswa` VALUES (948, 1040, 'amaliyanursalsabillah7410', 'AMALIYA NUR SALSABILLAH', '$2y$10$5k/w4yvwAzHjn1soVcqsj.4qukoyTti4vwe6srswWVprKwLekvEiG', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (949, 1041, 'anggafirnando537', 'ANGGA FIRNANDO', '$2y$10$DBDLM8ymkJu5BucNQBrjG.fQW3muHEEdpOT3Ll5T2vPPwab/HR8wW', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (950, 1042, 'avidatulhoiroh175', 'AVI DATUL HOIROH', '$2y$10$CgvICBHN5UckvZ78bt5sJuFxuJ3huVejvE2NQZZUVMeO2S0xDRmOi', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (951, 1043, 'chelseamargarethaoliviawulandari180', 'CHELSEA MARGARETHA OLIVIA WULANDARI', '$2y$10$XY7UVC6UwWarcKX96ryiZu9mIBp06y9.IQ4QAd5R1aoX3Zxgv6/O.', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (952, 1044, 'deaputriaurezatulmaqfiroth410', 'DEA PUTRI AUREZATUL MAQFIROTH', '$2y$10$GToESwbFV.qsrpjBM/7lfuVPp5K6JBK2Cjy5KLw1ULoE0fB5qbCmy', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (953, 1045, 'diniauliabahri922', 'DINI AULIA BAHRI', '$2y$10$4DVFoPwAW3Mkij3XCHXEceZ4i4qXSIRC0BZXhoy4kEkRjua93.YX2', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (954, 1046, 'dwiputriindahwahyuni767', 'DWI PUTRI INDAH WAHYUNI', '$2y$10$Ydjcz7CyNZk5UXcRCsMzkOhBf.FwobO8Nz5EE00pwiTrR.5QOrmH6', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (955, 1047, 'firdaseptiawati243', 'FIRDA SEPTIAWATI', '$2y$10$3Ug3.8Ck/OcvrofRcnjcJeqgvUzqUVfNImA5fbwZNqkFij0/iJb6m', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (956, 1048, 'fitriyahshafarinaekaputri868', 'FITRIYAH SHAFARINA EKA PUTRI', '$2y$10$PG1JBcH4WQ43LzpAF0VRR.v8Aadc9Kmhb.Ph86yNCh3tPtjuutiui', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (957, 1049, 'hilmiyanti818', 'HILMIYANTI', '$2y$10$kX0k8QwFMpgdA8lre3.rLe26sTMdOsue8uqJOIgXQLSjvhh6IHOai', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (958, 1050, 'karinatuddiniah661', 'KARINATUD DINIAH', '$2y$10$BEAvnG3EpUDlrTqjNTTzCO8W1od.X7fzKtTEfqcVN4NN9tBYiYniu', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (959, 1051, 'latifah408', 'LATIFAH', '$2y$10$wa/GD9FYWuFhZebWPUL4v.nEI.tpoq7jg8oSCosKhxaOT5PqMjC2e', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (960, 1052, 'merymaharaniagustin226', 'MERY MAHARANI AGUSTIN', '$2y$10$XPQ5AnrcqUXeajzWCORuGuOywWwh63xBYREqGelWhmZ1mUkgP5Voi', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (961, 1053, 'mohammadpurwadiansyah529', 'MOHAMMAD PURWADIANSYAH', '$2y$10$nmHvgeRZQw1WTBKeRgW8BuSHiiEs.HHX3BbhEBWv8iE6909H4cbW6', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (962, 1054, 'putriasih891', 'PUTRI ASIH', '$2y$10$ryqgBjD/rYJqlBbaYbzlq.pyQ4F6pBd2gWiwSGwnNnxk2tAMq8YFK', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (963, 1055, 'qiqiamelia489', 'QIQI AMELIA', '$2y$10$BglWVGnpP8skHLHsQIIUpOnu//yrp517tUYVGRpzkSBdaCOy0s8bi', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (964, 1056, 'reta847', 'RETA', '$2y$10$sF4kNHFaVa4WFqsvlG7uDOLWs7Np4HmGEriWoQWqOXsn3cqr2G.Ym', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (965, 1057, 'riandinitrisnawaty291', 'RIANDINI TRISNAWATY', '$2y$10$HkvvpLHvIG7EiGxGOxd7Q./y40m6ZOcxW2KjmeZt488qQdoYPyj3m', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (966, 1058, 'shyerolinemariettalesmana158', 'SHYEROLINE MARIETTA LESMANA', '$2y$10$RDxX15HkalXcOW1XV4.rS.nRlltBvtgM0K8D6iuGoqkrcjiHw2oqW', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (967, 1059, 'sitinurhalisa973', 'SITI NURHALISA', '$2y$10$mWOkB.4WhK2u.fDkggXb..3As/Q17d65dufSD557dxiDrNRnSmZve', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (968, 1060, 'unsiatulmafruroh972', 'UNSIATUL MAFRUROH', '$2y$10$rbuuaIXAOU0jMFu2GdMj0uWceS/.XHu3g09BHA82wR7xd0mj2glo.', 3, 11, 20, 3, 1, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `siswa` VALUES (969, 1061, 'adityanovandykapratama649', 'ADITYA NOVANDYKA PRATAMA', '$2y$10$w5e9sREVB4v4tRzGeN2TXeyoXX1SD6JqN2UMY8YgoVqEfXfZow44S', 3, 12, 21, 3, 1, '2023-09-13 19:44:02', '2023-09-13 19:44:02', 1, NULL);
INSERT INTO `siswa` VALUES (970, 1062, 'anandamuhammadhabibi197', 'ANANDA MUHAMMAD HABIBI', '$2y$10$t2vbqJ40Radzmb2.LpOyFOWJyYFtiWHZjahpDgkzIsmnX6zYon4mK', 3, 12, 21, 3, 1, '2023-09-13 19:44:02', '2023-09-13 19:44:02', 1, NULL);
INSERT INTO `siswa` VALUES (971, 1063, 'andreramadana7210', 'ANDRE RAMADANA', '$2y$10$xY1HBTHSZNsIBSijSMrxJ.7xiHhSEsbISbMAyt.5TxLcM6ylUnAFu', 3, 12, 21, 3, 1, '2023-09-13 19:44:02', '2023-09-13 19:44:02', 1, NULL);
INSERT INTO `siswa` VALUES (972, 1064, 'aprilianovitasari201', 'APRILIA NOVITA SARI', '$2y$10$xArVsf/zSr2zv5jymmNaWOO7GbswYIdfp21zIPxWFi4Zyar1Z4k2u', 3, 12, 21, 3, 1, '2023-09-13 19:44:02', '2023-09-13 19:44:02', 1, NULL);
INSERT INTO `siswa` VALUES (973, 1065, 'devianggraeni228', 'DEVI ANGGRAENI', '$2y$10$y0oUNGrDxDUyQJ.QZo.Wh.BTnIY7jjRib63qjCy0XHEntWWR.z9HC', 3, 12, 21, 3, 1, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `siswa` VALUES (974, 1066, 'egasaptaardiansyah973', 'EGA SAPTA ARDIANSYAH', '$2y$10$lvv5tsTlrVHbfDQW0O7iEOif2CoiIg51n6OrjXtYFdGkBBi8Eit9W', 3, 12, 21, 3, 1, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `siswa` VALUES (975, 1067, 'fadiraalyasyakhbana175', 'FADIRA ALYA SYAKHBANA', '$2y$10$3kCJS.dQ/Lfj0qQTQ/chp.500vtrNIkoFWOKiTyQ5dhZowxVTBxF6', 3, 12, 21, 3, 1, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `siswa` VALUES (976, 1068, 'fatimahsyaharbhanu490', 'FATIMAH SYAHAR BHANU', '$2y$10$ixcBHbc0c8bwlgjekWjyVe/FmsFuNqMrgIXBWc0CGu2RIi1AYPVHa', 3, 12, 21, 3, 1, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `siswa` VALUES (977, 1069, 'feraagustin1910', 'FERA AGUSTIN', '$2y$10$zEupEqOLF5FyN7YlZx07.u.fMwi1VCY9MFGiXTKGeiOXAdqU8O3f2', 3, 12, 21, 3, 1, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `siswa` VALUES (978, 1070, 'firdaus9110', 'FIRDAUS', '$2y$10$db/yZ7SdCYXB8FCpXZ3YhOPHCetpoMs.FlJtEAB10s1Q9cl7XNL8q', 3, 12, 21, 3, 1, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `siswa` VALUES (979, 1071, 'hestiannuraisyah1610', 'HESTIAN NUR AISYAH', '$2y$10$7bgClli/feshsh17.gtgt.mBeM55We.hCTxmTYEnTBHhILmgTdUIu', 3, 12, 21, 3, 1, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `siswa` VALUES (980, 1072, 'mochammadnandaaditwinaputra8810', 'MOCHAMMAD NANDA ADIT WINA PUTRA', '$2y$10$6arliEFCTeYf2lRdvipesufsnHGkwFSuJJb6wIMzdhgoCfX1i28ce', 3, 12, 21, 3, 1, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `siswa` VALUES (981, 1073, 'mohammadimron530', 'MOHAMMAD IMRON', '$2y$10$Rvq7Bj.mqd9icJAqcuIit.Jrx9sVhe7fBXBQtal.DYY1NRVwNMBAy', 3, 12, 21, 3, 1, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `siswa` VALUES (982, 1074, 'muhamadfaiz915', 'MUHAMAD FAIZ', '$2y$10$tupbuCaoYKYb8yjkCsQlweW5lvnHkQoN9z/OjyfCmVIQubIlAn1o.', 3, 12, 21, 3, 1, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `siswa` VALUES (983, 1075, 'muhammadalvin988', 'MUHAMMAD ALVIN', '$2y$10$zOUFQzFsLqEutS01H4R7fO5v9Uqf..HXCfdQlvyF0rGdEBvBRGawy', 3, 12, 21, 3, 1, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `siswa` VALUES (984, 1076, 'muhammadandreyanto571', 'MUHAMMAD ANDREYANTO', '$2y$10$.wM0meoeUSTCa8RAqhOnpOzO4cvCEz0EEJbWEeyU5l96otuc/8vsy', 3, 12, 21, 3, 1, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `siswa` VALUES (985, 1077, 'putudimasfebrian810', 'PUTU DIMAS FEBRIAN', '$2y$10$OswfwLR8/UvFLj85rPJeaucbHPalGgLsJccydDCUMHwkUvCItWGou', 3, 12, 21, 3, 1, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `siswa` VALUES (986, 1078, 'renialfiah219', 'RENI ALFIAH', '$2y$10$wm1ooFQOAt1Lhz1EigRCaOtaF5H4M/0sz4Kbkz4VUCjao5pnzYPpG', 3, 12, 21, 3, 1, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `siswa` VALUES (987, 1079, 'rifansauqi697', 'RIFAN SAUQI', '$2y$10$WFVtVOUGkSo89QPnA7XJ3ugM5F65aLrhYKX3ZY/qbi2TZZdVz4GUO', 3, 12, 21, 3, 1, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `siswa` VALUES (988, 1080, 'sitinurazizah828', 'SITI NUR AZIZAH', '$2y$10$0td0smbGZFboKUvFxUqwt.qBeizcCF.cRIcw8ut3no6TMcO2cmx3S', 3, 12, 21, 3, 1, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `siswa` VALUES (989, 1081, 'sultanmuhammadfaizalziatbahamalah446', 'SULTAN MUHAMMAD FAIZAL ZIAT BAHAMALAH', '$2y$10$bnrjUxjilfnDc2pKx9vW/OovdTWRmGc2eqwKczjCUtlIfxhLLgHRe', 3, 12, 21, 3, 1, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `siswa` VALUES (990, 1082, 'abdulharisardiansyah602', 'ABDUL HARIS ARDIANSYAH', '$2y$10$nJby3x1OvN63l6YI7TdDxe0a8lfK.y8fEATgopc6npfPTnymKXlza', 3, 12, 22, 3, 1, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `siswa` VALUES (991, 1083, 'adindanurdiana612', 'ADINDA NURDIANA', '$2y$10$kKkyeEBA6Xg0lyuxj9L6mOrJih8BewwKJjvDCO207EwiPDEXxWqoO', 3, 12, 22, 3, 1, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `siswa` VALUES (992, 1084, 'adityabantaraputra342', 'ADITYA BANTARA PUTRA', '$2y$10$VTkpEytWa86ScTWGMHXYRuBx0Scrfc5BhsBCrggZf8xOyie7cpiNi', 3, 12, 22, 3, 1, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `siswa` VALUES (993, 1085, 'benardiodwisaputra339', 'BENARDIO DWI SAPUTRA', '$2y$10$C.wDo6n1lFbbsVAGuYbgU.0c2Q97s.Jvwpikt6siwbuX26WMVEDRq', 3, 12, 22, 3, 1, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `siswa` VALUES (994, 1086, 'citraindrianingsih334', 'CITRA INDRIANINGSIH', '$2y$10$iFnNuT0SJ.FgJouAC6SVGuWdH9h6drHY6JRuqKij4/LMvIeMaeijO', 3, 12, 22, 3, 1, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `siswa` VALUES (995, 1087, 'diditdiantoro170', 'DIDIT DIANTORO', '$2y$10$PhNpRfGrrrDuQLaDsRHbru6AfA/ku8YMg7S3wQ5V0MyD.slWE22NG', 3, 12, 22, 3, 1, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `siswa` VALUES (996, 1088, 'dwiindahseptiyana426', 'DWI INDAH SEPTIYANA', '$2y$10$GqWXZTvvOxR3ZkKZaXb/Eu3FzkIvc9n6nSg/.IiQwMFf/K1KY2O3G', 3, 12, 22, 3, 1, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `siswa` VALUES (997, 1089, 'ekakurniawanatmaja977', 'EKA KURNIAWAN ATMAJA', '$2y$10$x0WJAU.xpE5gFrYrnB9iIOmxMEEK78ms59QLikhh2fXxm5W3f7elS', 3, 12, 22, 3, 1, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `siswa` VALUES (998, 1090, 'eriswardhani226', 'ERIS WARDHANI', '$2y$10$BR8sJBKWIb9r5bABAfjcteTGyo/6ifrNj286V3sIfqvCxPNHRfB8O', 3, 12, 22, 3, 1, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `siswa` VALUES (999, 1091, 'falah504', 'FALAH', '$2y$10$R552BDw0fGCzEkm3mDJebu/9qc6x3l51Ac5X9Ai4QKK/Jcl75kAly', 3, 12, 22, 3, 1, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `siswa` VALUES (1000, 1092, 'hendrikabilaturrahman426', 'HENDRIK ABILATURRAHMAN', '$2y$10$O1QJ4AVvGV9swv2Wj6tnkOIzRwtogDGkzTTvp9CC/j41kf7cF1TtW', 3, 12, 22, 3, 1, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `siswa` VALUES (1001, 1093, 'muhammadfaizal578', 'MUHAMMAD FAIZAL', '$2y$10$0TuYUnnIGLLc6Cf1ajh/I.aQt1C/V0EcKjoKZQt9bRN37gpqTdic6', 3, 12, 22, 3, 1, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `siswa` VALUES (1002, 1094, 'muhammadimamwahyudi885', 'MUHAMMAD IMAM WAHYUDI', '$2y$10$dK9qRdmJNEWcy74jLgjdv.dPohtFHkmPkfVNOPnAuKr6DKtHopIFW', 3, 12, 22, 3, 1, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `siswa` VALUES (1003, 1095, 'muhammadjunaedi169', 'MUHAMMAD JUNAEDI', '$2y$10$WsGNzTviSXGfhgE1.OMYGOnHA1H63WqjEk16vO9mkk1rpuBw86zdS', 3, 12, 22, 3, 1, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `siswa` VALUES (1004, 1096, 'muhammadsamsularifin311', 'MUHAMMAD SAMSUL ARIFIN', '$2y$10$4f4f8lx0UK9361M8gmzxoe6..y8rhdE6025OMBunJl11assJuysda', 3, 12, 22, 3, 1, '2023-09-13 19:44:57', '2023-09-13 19:44:57', 1, NULL);
INSERT INTO `siswa` VALUES (1005, 1097, 'muhammadsandiporwanto456', 'MUHAMMAD SANDI PORWANTO', '$2y$10$QYnD52YbxOHKoWT4wUxzJOJX5i1gBgzUWXXI7f.jv0J0o9tq6cHXC', 3, 12, 22, 3, 1, '2023-09-13 19:44:57', '2023-09-13 19:44:57', 1, NULL);
INSERT INTO `siswa` VALUES (1006, 1098, 'naylafakhirasetyawan362', 'NAYLA FAKHIRA SETYAWAN', '$2y$10$ZAcZ..JEL38lBQdNUhCCD.qgX1wKomyVC4r3HFRS8y17Tfs8ZmJ8y', 3, 12, 22, 3, 1, '2023-09-13 19:44:57', '2023-09-13 19:44:57', 1, NULL);
INSERT INTO `siswa` VALUES (1007, 1099, 'nurilazizah333', 'NURIL AZIZAH', '$2y$10$myLXpcoP0/d2GyLlnU8nIew8BHtI0sxHVnOOKRS6Ll6xBaC/VZoAG', 3, 12, 22, 3, 1, '2023-09-13 19:44:57', '2023-09-13 19:44:57', 1, NULL);
INSERT INTO `siswa` VALUES (1008, 1100, 'rahmankhoirpujanarko770', 'RAHMAN KHOIR PUJANARKO', '$2y$10$9U8azJVwETxNh7l4.esZTOvX1bFBteqUYPmrzocjlPSD6GQi0LsnW', 3, 12, 22, 3, 1, '2023-09-13 19:44:57', '2023-09-13 19:44:57', 1, NULL);
INSERT INTO `siswa` VALUES (1009, 1101, 'rezaagnesmonikaoktafiaramadhan799', 'REZA AGNES MONIKA OKTAFIA RAMADHAN', '$2y$10$wNtsRoLQyqECJYxbX/P2Qucb.HyiPL1LrL1R4tzGwYHM9T0kwJbv2', 3, 12, 22, 3, 1, '2023-09-13 19:44:57', '2023-09-13 19:44:57', 1, NULL);
INSERT INTO `siswa` VALUES (1010, 1102, 'tiaramayangsalsabila974', 'TIARA MAYANG SALSABILA', '$2y$10$yCcqG1EcWdUaPxtYiv87CuMvbpSGG8RDyB9IYN1T8nzuMCeFiEF0u', 3, 12, 22, 3, 1, '2023-09-13 19:44:57', '2023-09-13 19:44:57', 1, NULL);
INSERT INTO `siswa` VALUES (1011, 1103, 'adimaskurniacandrasaputra647', 'ADIMAS KURNIA CANDRA SAPUTRA', '$2y$10$Tse2zfQg2JvmObvr/B7d/.sOvYUIk8I0b.Wbqg2lvHCV9ak.J8EUS', 3, 5, 8, 3, 1, '2023-09-13 19:45:46', '2023-09-13 19:45:46', 1, NULL);
INSERT INTO `siswa` VALUES (1012, 1104, 'ahmadcandra944', 'AHMAD CANDRA', '$2y$10$60pWMG.FwGMvjJAyKoWA9ORQV4QMpER4bhIiOfQ.hX55mh8QiF8UC', 3, 5, 8, 3, 1, '2023-09-13 19:45:46', '2023-09-13 19:45:46', 1, NULL);
INSERT INTO `siswa` VALUES (1013, 1105, 'arivaldiwagiyono228', 'ARIVALDI WAGIYONO', '$2y$10$OrZplml4I3b4G1CHIBeDjOQFQ.WzGfXul2ukJIBoVXLg0BVEEGpCG', 3, 5, 8, 3, 1, '2023-09-13 19:45:46', '2023-09-13 19:45:46', 1, NULL);
INSERT INTO `siswa` VALUES (1014, 1106, 'dwiindahkusumaningtyas101', 'DWI INDAH KUSUMANINGTYAS', '$2y$10$XoB28xklqAMXWMjnaEO4CuyArNEn9YnoTcNokbX/TqVRAS2G5ROk2', 3, 5, 8, 3, 1, '2023-09-13 19:45:46', '2023-09-13 19:45:46', 1, NULL);
INSERT INTO `siswa` VALUES (1015, 1107, 'dwirezaprasteo319', 'DWI REZA PRASTEO', '$2y$10$qKWCPi7mqL9KIB.ujbid3O1CtFNRwytmcPG2Y0wg0N6Z1nyIJo7h6', 3, 5, 8, 3, 1, '2023-09-13 19:45:46', '2023-09-13 19:45:46', 1, NULL);
INSERT INTO `siswa` VALUES (1016, 1108, 'edokasyamulya714', 'EDO KASYA MULYA', '$2y$10$IjHyHCfXHgR/A8S7xEuji.WlIuIV64mC4KxHoKG8t/F/ECtMtdM3.', 3, 5, 8, 3, 1, '2023-09-13 19:45:46', '2023-09-13 19:45:46', 1, NULL);
INSERT INTO `siswa` VALUES (1017, 1109, 'fadilfawazulhaq124', 'FADIL FAWAZUL HAQ', '$2y$10$RaGiyGrOrxlYrIFWde9J1.AKrYK63DIxz5FLQ1.IIIh6IsAzyPoXK', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1018, 1110, 'farhanadityasaputra9010', 'FARHAN ADITYA SAPUTRA', '$2y$10$khVzhqHNnQ2MkfsA2wkZ0ue6WpU5ASY206cEIefr2ocMYuoFQXQ2O', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1019, 1111, 'firmanputraeffendi191', 'FIRMAN PUTRA EFFENDI', '$2y$10$s3sLKsX8MU5J7dAEbmiLE.jKon2K/vJWvCedl6nbG7iZJaMvk/wue', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1020, 1112, 'gadislailiyahmaghfiroh224', 'GADIS LAILIYAH MAGHFIROH', '$2y$10$xML8QKAk.obmE1GjtP9IE.xMj1T8ESfjEc3ghAynWqE8Dkars30W.', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1021, 1113, 'husnol108', 'HUSNOL', '$2y$10$5p3XhsGG8R9HtLzLRyqFF.sFjLtPB0WhSNVC.R4Ei8dxyiHNtBBg6', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1022, 1114, 'januarekofirdausrahmatillahi476', 'JANUAR EKO FIRDAUS RAHMAT ILLAHI', '$2y$10$riPsSdRA5LSCpzCzNH/2weGDi5uEKXHsYqOFC6XGuzsC.S85.VJFm', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1023, 1115, 'mochamadrifkyputraismie8510', 'MOCHAMAD RIFKY PUTRA ISMIE', '$2y$10$APWTmBUTo8f.PgZ4c8ekwOqtmxzD0XwFnMlMrg0jzxxh7F4pIgG/m', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1024, 1116, 'mohammadalisalehbanahsan667', 'MOHAMMAD ALI SALEH BANAHSAN', '$2y$10$L11Jr7ut9Kxd1lRkJORf3e6JkKo8jvqBXQIwXnoO5CeVlovKccI9i', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1025, 1117, 'mohammadarafli350', 'MOHAMMAD ARAFLI', '$2y$10$0Ojpy1YSIojlKWPYKwKZoO1oc1od9Ynpp03OtWszlZrk5pF8Vm9Ze', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1026, 1118, 'mohammadfarelevendi135', 'MOHAMMAD FAREL EVENDI', '$2y$10$Lr7BzMm7dIk8Ak3vcT.6C.gTCKj4UNy8rcyDsh80Wk6Mfi68jqMIq', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1027, 1119, 'mohammadrendysyahputra437', 'MOHAMMAD RENDY SYAHPUTRA', '$2y$10$7AbYIYhhc/m1QBT1CUca6OUWvypZ4iCzrptVXo6cxEQsMEj4byQ7e', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1028, 1120, 'muhamadraflitrianto515', 'MUHAMAD RAFLI TRIANTO', '$2y$10$h/jsQA8ump86WtP7DWJgE.d/G8G65e8YTfGkp.U725JDy/T47d.U2', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1029, 1121, 'muhammadbagusprasetyo972', 'MUHAMMAD BAGUS PRASETYO', '$2y$10$drKuRCFWZBtKCy/sRg.CW.YWyGy0dewJaDpeiJUEUl8VmaY0RA1lq', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1030, 1122, 'muhammadezapandupermanabaidawi965', 'MUHAMMAD EZA PANDU PERMANA BAIDAWI', '$2y$10$TkeqDsPprb23X4pmdxxwku3wSt4P6x0C4ceDIT8hTd9fkZXi/Hs0O', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1031, 1123, 'muhammadlatifurhobir911', 'MUHAMMAD LATIFUR HOBIR', '$2y$10$TXNj2e4ujW1TuuvLBVdps.4EOiMvhJvUCwl9kzz.jImJjLTE3TNEu', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1032, 1124, 'muhammadnafronabdimaulana438', 'MUHAMMAD NAFRON ABDI MAULANA', '$2y$10$MWIqiK5gwyUfvtHPv.2w1e5nmJ6SScxdzlIS6xcpVzMdPc5gO.e42', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1033, 1125, 'muhammadzakifarmadi146', 'MUHAMMAD ZAKI FARMADI', '$2y$10$FiBA8jL2nP6O3uTv0RyVM.x4BHRob4gv4wbafHe3POPmn3BT4Ln3C', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1034, 1126, 'rafaayupprasetyo294', 'RAFA AYUP PRASETYO', '$2y$10$k9diRCzu5Xm4qEoo1YqwVe5C35sd0/pILFxgADPuJPi.zP/nYvIx6', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1035, 1127, 'rezanurhariyanto7410', 'REZA NUR HARIYANTO', '$2y$10$jNzrLJ3SKMJvJAaR164oF.KMhtRsMUDrxCmmSX1HjnAZVndkZNU36', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1036, 1128, 'ributdwiwahyudi599', 'RIBUT DWI WAHYUDI', '$2y$10$oY8Np17x4D94vVyZThdi2eLXJk8shEaXaKJQqJ3B2w9/fBFBlZAKS', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1037, 1129, 'rikyriowirawan482', 'RIKY RIO WIRAWAN', '$2y$10$yMRSNbmjc/el1dlZ74KLDO8D/3MxDHDzyldRD9NXV15Dld09D31c6', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1038, 1130, 'rofirahmadfirmansyach702', 'ROFI RAHMAD FIRMANSYACH', '$2y$10$r.Fj4DQxMl6xse5z3oMV3OfbteZkef82GAxSn20F2f5Oxi21ebfaK', 3, 5, 8, 3, 1, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `siswa` VALUES (1039, 1131, 'valdopratama911', 'VALDO PRATAMA', '$2y$10$aF5pNCEYfc9dG5J4w/0P5OAwkcMDH.rUEFkVmaC6T6dv84cjgZwN2', 3, 5, 8, 3, 1, '2023-09-13 19:45:48', '2023-09-13 19:45:48', 1, NULL);
INSERT INTO `siswa` VALUES (1040, 1132, 'wahidfebriansyah713', 'WAHID FEBRIANSYAH', '$2y$10$OYKi7ic6d/uHVOsR/ORS.OqM4XeDbggpp9W9ohbwZ4HZOCS5zKEyC', 3, 5, 8, 3, 1, '2023-09-13 19:45:48', '2023-09-13 19:45:48', 1, NULL);
INSERT INTO `siswa` VALUES (1041, 1133, 'agilcandraghasmalkhair187', 'AGIL CANDRA GHASMAL KHAIR', '$2y$10$zSdTeXQ2ijtChkHyyy.hieP6NGE/k0G9optoqMtMcHyxFrlt8wCNG', 3, 5, 9, 3, 1, '2023-09-13 19:46:52', '2023-09-13 19:46:52', 1, NULL);
INSERT INTO `siswa` VALUES (1042, 1134, 'andikamaulanafirsam719', 'ANDIKA MAULANA FIRSAM', '$2y$10$YrUUVQeJ6ZwqI/vKcSJ9Q.MSOlKiI7jTJHhV4At2IjRtTF8SREQju', 3, 5, 9, 3, 1, '2023-09-13 19:46:52', '2023-09-13 19:46:52', 1, NULL);
INSERT INTO `siswa` VALUES (1043, 1135, 'dhimasanggaragustifernanda462', 'DHIMAS ANGGARA GUSTI FERNANDA', '$2y$10$ZbepytrENiPzbIYAQFZ.JetfPdRWBEkTMVyNpiUPw/1Vk/fSy8you', 3, 5, 9, 3, 1, '2023-09-13 19:46:52', '2023-09-13 19:46:52', 1, NULL);
INSERT INTO `siswa` VALUES (1044, 1136, 'dimasfadillahfajri151', 'DIMAS FADILLAH FAJRI', '$2y$10$BcBqyGPndFaa/9ByHQjg8erJJcdFLNFqIJv1Z0fLVBW.n9IAQJ29m', 3, 5, 9, 3, 1, '2023-09-13 19:46:52', '2023-09-13 19:46:52', 1, NULL);
INSERT INTO `siswa` VALUES (1045, 1137, 'dwikohadishamaulana570', 'DWIKO HADISHA MAULANA', '$2y$10$14WFUvaPeMa/mzEtfADjWOnvpzplLkH.LX7kqHC2HsKpnurKiFB0i', 3, 5, 9, 3, 1, '2023-09-13 19:46:52', '2023-09-13 19:46:52', 1, NULL);
INSERT INTO `siswa` VALUES (1046, 1138, 'ekajulianto1005', 'EKA JULIANTO', '$2y$10$aMtu9Q1oJi602iUdONj/mu8adTNTmMGJJQLEUtb79yVmYY0PeM8Pm', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1047, 1139, 'fagillolaprihernando531', 'FAGIL LOLA PRIHERNANDO', '$2y$10$1Cg6c0J/ajIUR/dhNJerD.cWHSp0uugNGQA2gR.iAT5VkOQh3y6BO', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1048, 1140, 'fendifebrian114', 'FENDI FEBRIAN', '$2y$10$dVx4jIYlkA2lr/xaILVUP.6w5kyBUApssnXwAaDCdoBZ.oAwSy84i', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1049, 1141, 'firmanshah843', 'FIRMANSHAH', '$2y$10$Gw/cwrpciuta2oTMWOHehONIHOQlUug7PX0efk/ulVKZbAVLZxLaG', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1050, 1142, 'galangresturamadhan10010', 'GALANG RESTU RAMADHAN', '$2y$10$sKYLxgMciKr4PQ5wYF1sfuQkjf07hxT3n4GE6kv3FHrh8dM9KCKNG', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1051, 1143, 'isfanfirmanda148', 'ISFAN FIRMANDA', '$2y$10$3mWXpIA4f.JN6zroz2nS0usGRGZb9kSeGeBFdh8CEo11pvtz0aKy6', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1052, 1144, 'jizan690', 'JIZAN', '$2y$10$MwW.Iy2glxyvzyNpLJDUuecro8Mg0CKXr2cxNn/YV79EsAd/rTqXi', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1053, 1145, 'mochammadrizki812', 'MOCHAMMAD RIZKI', '$2y$10$97kHWsp91kT6j1Lp4f6bb.q3HNPIXlSGLOjjhpAoFh8to2UPdjUx2', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1054, 1146, 'mohammadalviandikahermawan545', 'MOHAMMAD ALVIANDIKA HERMAWAN', '$2y$10$/jI0cHtFtUZQQrta35Si1ehalGEpODmt5du2Ifn.BZuBxCRs.5M0S', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1055, 1147, 'mohammadariesmaulanaarsyadillah316', 'MOHAMMAD ARIES MAULANA ARSYADILLAH', '$2y$10$Z03UW35VmEUYNkQHI.JYjOtccB99zYLM8VHHvj6/7fguxWlb9RTFW', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1056, 1148, 'mohammadiqbal362', 'MOHAMMAD IQBAL', '$2y$10$9SJXle361lMWT78NuAHky.p2u2ul85sr3Qhuy5y2nClgKwol.zaSG', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1057, 1149, 'mohammadzulfankamil906', 'MOHAMMAD ZULFAN KAMIL', '$2y$10$22D.4772pq8ZXKpdDtybjOo8fKpSaXxNRKXbYQJ9KblSJk/R45WVW', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1058, 1150, 'muhammadalihamdani351', 'MUHAMMAD ALI HAMDANI', '$2y$10$bKax1LB7OKLnziwFQt/PUu9zreJM5y1KHOxsGTzs1Wg8Gva3vrw7C', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1059, 1151, 'muhammadcahyobudiraharjo531', 'MUHAMMAD CAHYO BUDI RAHARJO', '$2y$10$sqnUQEeoUdVJ5Hgg0ILpn.fxckxxcloIOsLEcAEeDaUQADA3iDvZm', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1060, 1152, 'muhammadfabiogustafo691', 'MUHAMMAD FABIO GUSTAFO', '$2y$10$SoPgbK8wlNMBXTJZtid2eeTNJSNEIf8N8zkdeGwIH1bU3yMYp29AC', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1061, 1153, 'muhammadmahboby943', 'MUHAMMAD MAHBOBY', '$2y$10$DZz0iMcB6pyAJ5iDs1epvOVYmS1B/Bmg44hVCW6aoKxGrxXzjVnrm', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1062, 1154, 'muhammadrevalyulianto122', 'MUHAMMAD REVAL YULIANTO', '$2y$10$seShcoraVCBotJAHdVDwdOe2zZMbrW0AeDbaU1PkwzG34e1Zdiu8G', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1063, 1155, 'nurhamsahkusuma196', 'NUR HAMSAH KUSUMA', '$2y$10$JowN3imejqTpYV.VU3Lgeu71CAbEhd3m.cuRNdFP1aB6w/m/DkVya', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1064, 1156, 'rafaerlanggaputracylo761', 'RAFA ERLANGGA PUTRA CYLO', '$2y$10$YIAjMCnhQF9V.x/5qJy67.AXVFLJKdEunVWzL06UeBLDdZ5OJJWAW', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1065, 1157, 'riantodianmaulana780', 'RIANTO DIAN MAULANA', '$2y$10$HlON7sPGL5csAcX7evr4WuTb1MW6Ep.EXodYa5lKsM6rKhQkdi.Ai', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1066, 1158, 'ridhofirmansyah323', 'RIDHO FIRMANSYAH', '$2y$10$9QkTYFwzz5U5HUuSHb/snOkRoQYr7qay2o/0qfn6yfCHLLcvbla1i', 3, 5, 9, 3, 1, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `siswa` VALUES (1067, 1159, 'riobayupratama294', 'RIO BAYU PRATAMA', '$2y$10$9RTTEwWrV05KAzfNk9r1W.KWzRJRMC/I2qPKGnxal5VP6labhG.5y', 3, 5, 9, 3, 1, '2023-09-13 19:46:54', '2023-09-13 19:46:54', 1, NULL);
INSERT INTO `siswa` VALUES (1068, 1160, 'sofyanpranata876', 'SOFYAN PRANATA', '$2y$10$blJbtVzEUfTR2wolQ/hTxOLCrvQ3cObwdzr.LS/0hereBRBhdNyW6', 3, 5, 9, 3, 1, '2023-09-13 19:46:54', '2023-09-13 19:46:54', 1, NULL);
INSERT INTO `siswa` VALUES (1069, 1161, 'violaauliaramadhana409', 'VIOLA AULIA RAMADHANA', '$2y$10$VbQ6RiXaKU3BzQXtFozDFeInkD8RC5wHNA6V/5KtqCfWy/wmVwLbu', 3, 5, 9, 3, 1, '2023-09-13 19:46:54', '2023-09-13 19:46:54', 1, NULL);
INSERT INTO `siswa` VALUES (1070, 1162, 'wandiyono418', 'WANDIYONO', '$2y$10$9XfN8y0kyz.oPQTP8i.0KuHprrxYRwDKjNT5595135JvrAMGIC.jS', 3, 5, 9, 3, 1, '2023-09-13 19:46:54', '2023-09-13 19:46:54', 1, NULL);
INSERT INTO `siswa` VALUES (1071, 1163, 'achmadnovalfirdaus152', 'ACHMAD NOVAL FIRDAUS', '$2y$10$oRYxrTB2oC8Nc1QYaDv.NelsounKgXxf5BSps51DDKM45HheRuPhK', 3, 13, 23, 3, 1, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `siswa` VALUES (1072, 1164, 'adjiwijayanto311', 'ADJI WIJAYANTO', '$2y$10$i39oEL0fjw1YioyUj0JdQOG3mIPgxh9PVRRa/SztWWncVBUoO6xni', 3, 13, 23, 3, 1, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `siswa` VALUES (1073, 1165, 'ahmaddwizamroni937', 'AHMAD DWI ZAMRONI', '$2y$10$MCrIdJyL2oPN7DQEhAaYXe5W4Kt/JcZHdr11eCS29RWiAfX/rLOgq', 3, 13, 23, 3, 1, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `siswa` VALUES (1074, 1166, 'amirdwianggoro826', 'AMIR DWI ANGGORO', '$2y$10$nJ9nQNYXcJO3bCxjasv6buT5Pbyi2gB/tuVb/TE9yvLc4Xu7TmAKW', 3, 13, 23, 3, 1, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `siswa` VALUES (1075, 1167, 'chelceakamal929', 'CHELCEA KAMAL', '$2y$10$KOGFT9M0KNxZETg1mnJZ/e9UZ2emH/QGxwoz6SNNHXIBjyaCsUcwu', 3, 13, 23, 3, 1, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `siswa` VALUES (1076, 1168, 'derialmahfut664', 'DERI ALMAHFUT', '$2y$10$KeGaPcT0xutMhtuP/t6EHOxXME93fL7t4052y0bB6a0IBfRl8N.sG', 3, 13, 23, 3, 1, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `siswa` VALUES (1077, 1169, 'elviaayuanadea5310', 'ELVIA AYU ANADEA', '$2y$10$2H5etrbMqplZspogxf2dsujlFwHuivlHbPGTLWN2/qnNcfp6ROa1i', 3, 13, 23, 3, 1, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `siswa` VALUES (1078, 1170, 'farelpratamaisma122', 'FAREL PRATAMA ISMA', '$2y$10$sVbPMCKU12zn6TFQY2pzWOg.aIm.0FKHQc7yv/90myxXsxTnJCthe', 3, 13, 23, 3, 1, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `siswa` VALUES (1079, 1171, 'fernandohogihartono907', 'FERNANDO HOGI HARTONO', '$2y$10$euO8F0uvDl/pth70fQihPup6.Kn2gZnbk6mZI/VYsSoTuJo4z0Itu', 3, 13, 23, 3, 1, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `siswa` VALUES (1080, 1172, 'hilmanfauzi759', 'HILMAN FAUZI', '$2y$10$6UVgiYNbtK2cetF.i8MwJukUZGKyq52ZNsQ0LSiGMUk9R.YYVKktG', 3, 13, 23, 3, 1, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `siswa` VALUES (1081, 1173, 'indanalidianazulfa172', 'INDANA LIDIA NAZULFA', '$2y$10$/O5M6jKHZysyDEzPHKDFLee/.q11pbNgXxN6IhLCsokCZLhwrM.R2', 3, 13, 23, 3, 1, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `siswa` VALUES (1082, 1174, 'karimahalhaura795', 'KARIMAH ALHAURA', '$2y$10$lAPTKG9hzEfYXmyFkjOL4esk/gI.GmjCpyorHGkbWmKnE2uB9hg/q', 3, 13, 23, 3, 1, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `siswa` VALUES (1083, 1175, 'lailatulfitriah907', 'LAILATUL FITRIAH', '$2y$10$0k/P/XdKnDEZB9up5/Z1EuKXxysI.gNZxD8h1.NPFCzYUDfTUB7lC', 3, 13, 23, 3, 1, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `siswa` VALUES (1084, 1176, 'mochammadcandrasyahputra3910', 'MOCHAMMAD CANDRA SYAHPUTRA', '$2y$10$W0t.6VoBf8IvNybQ8hNt4.63pekfC/xXG/AWy6BoaEdVtJgOknnUG', 3, 13, 23, 3, 1, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `siswa` VALUES (1085, 1177, 'mochammadnurfaizalnovimwiyono914', 'MOCHAMMAD NURFAIZAL NOVIMWIYONO', '$2y$10$3NU8m9tam1saxcrXlf1k4uqDilr.EwlHnaYyE/uO5M0VaOu5mIHKi', 3, 13, 23, 3, 1, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `siswa` VALUES (1086, 1178, 'muhammadbagusirfanwahyudi781', 'MUHAMMAD BAGUS IRFAN WAHYUDI', '$2y$10$JH7lvgmW1jH59k67QXK3mekKO5lj8zQBVmNXTvMblRHmCX42CvLue', 3, 13, 23, 3, 1, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `siswa` VALUES (1087, 1179, 'muhammadfarhannurillah4510', 'MUHAMMAD FARHAN NURILLAH', '$2y$10$wB9u/cgfiLpWte.sfkr6n.vg0X5E/3UgZb.hRfG2XpY4ffQa9lLDa', 3, 13, 23, 3, 1, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `siswa` VALUES (1088, 1180, 'muhammadfawaid688', 'MUHAMMAD FAWAID', '$2y$10$VbcvBfoJKY875RuFrQ/DH.fuQ84nIPDIs9sfZwjIE7Q3b6fzwIBei', 3, 13, 23, 3, 1, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `siswa` VALUES (1089, 1181, 'muhammadilhamirfani481', 'MUHAMMAD ILHAM IRFANI', '$2y$10$xmTn8UPqnsgh5Fq/2u5sj.yO8aDjCkGQZh7sosai6YbR0mHr91Hb6', 3, 13, 23, 3, 1, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `siswa` VALUES (1090, 1182, 'muhammadlutfiandika717', 'MUHAMMAD LUTFI ANDIKA', '$2y$10$FGuRgD2mFHFjmkymHKEO7O1Glfch.uAYM48cB9iAC9U3qyBSJXOwe', 3, 13, 23, 3, 1, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `siswa` VALUES (1091, 1183, 'muhammadnafisrabbani694', 'MUHAMMAD NAFIS RABBANI', '$2y$10$3LEyk2RkuYJQBzan26ACgehD3TkVaULqfxX373qq5QTG3OS6gvCoC', 3, 13, 23, 3, 1, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `siswa` VALUES (1092, 1184, 'muhammadrassyabriliantara844', 'MUHAMMAD RASSYA BRILIANTARA', '$2y$10$FDy.BMJrst4HZ8bMV4ZLBOpAtnu5sPAgsFD79ICWQPco7fFl7hGbq', 3, 13, 23, 3, 1, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `siswa` VALUES (1093, 1185, 'muhammadrayhanalfirdaus376', 'MUHAMMAD RAYHAN AL FIRDAUS', '$2y$10$5ziLeGPeUCzrJULUXAOule5Y/XXWHJnWxELYg91cGTvye28ALZGCC', 3, 13, 23, 3, 1, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `siswa` VALUES (1094, 1186, 'muhammadyusufcahyaadhynugroho662', 'MUHAMMAD YUSUF CAHYA ADHY NUGROHO', '$2y$10$YxTDNOiI.UkCiwOACZ4U9eV7KU43B7lfJRyHbWIH.aV7BvrwgYptG', 3, 13, 23, 3, 1, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `siswa` VALUES (1095, 1187, 'muhammadzakyputranazrielio744', 'MUHAMMAD ZAKY PUTRA NAZRIELIO', '$2y$10$5c1ir4DdI8Z2r0o.u4eDNeXuuTgoBaPOPR3dwuxn7xRW4ghFYQMdi', 3, 13, 23, 3, 1, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `siswa` VALUES (1096, 1188, 'nadiaokvindaalvionita557', 'NADIA OKVINDA ALVIONITA', '$2y$10$oy7rqaDj./xd/kI2JtR2u.cASGhGSwfaeXUctcYxI9VxhYnmWXjqq', 3, 13, 23, 3, 1, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `siswa` VALUES (1097, 1189, 'prayudhaputraarifin770', 'PRAYUDHA PUTRA ARIFIN', '$2y$10$4nFIEt0LyK9edmf0Ip0c2OV5Aqatk88pvTCOn9YK99699gJTD.aq2', 3, 13, 23, 3, 1, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `siswa` VALUES (1098, 1190, 'putriayu969', 'PUTRI AYU', '$2y$10$xE2c0htndHjHQFV5ceH4KucE.kHKeDAJ/nbesD7lUw5pBuRybCJGK', 3, 13, 23, 3, 1, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `siswa` VALUES (1099, 1191, 'raniobeydianzahro1006', 'RANI OBEYDIAN ZAHRO', '$2y$10$mUExAjfAIO4gx39VNQlKiu24C/bdsiOXB6rgmgxnzZYvKT5.I0sW6', 3, 13, 23, 3, 1, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `siswa` VALUES (1100, 1192, 'syukrontrimartino447', 'SYUKRON TRI MARTINO', '$2y$10$cWRH0M603tDeySva2RmVtO6ckU6cCv2ugK.wQ9FM25W.8HVcPuqVO', 3, 13, 23, 3, 1, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `siswa` VALUES (1101, 1193, 'widhoainunriaqi2810', 'WIDHO AINUN RIAQI', '$2y$10$04YZ47VJRejmROSJTisv7e8iZUAwJzRt5Q16pC1wWMcKFj1YwkUiy', 3, 13, 23, 3, 1, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `siswa` VALUES (1102, 1194, 'winditanuramalia702', 'WINDITA NUR AMALIA', '$2y$10$V6syoMxFFGiDKIbKEow2/..AZNNoQ0u21TkFenOqTLkFhsYGv3vkW', 3, 13, 23, 3, 1, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `siswa` VALUES (1103, 1195, 'aangdimasfinadeang856', 'AANG DIMAS FINADEANG', '$2y$10$IPq9poaGbFcM5H1iTCg5S.BfG4ql0gSNnbv9/BQcIg1vpXOW59P/m', 3, 13, 24, 3, 1, '2023-09-13 19:48:52', '2023-09-13 19:48:52', 1, NULL);
INSERT INTO `siswa` VALUES (1104, 1196, 'adrianrizaldikurniawan522', 'ADRIAN RIZALDI KURNIAWAN', '$2y$10$aRctvPyw3JPbnhizGbxNTuNDc5NSVPjFly7LUuh3anzCfH.SgFklG', 3, 13, 24, 3, 1, '2023-09-13 19:48:52', '2023-09-13 19:48:52', 1, NULL);
INSERT INTO `siswa` VALUES (1105, 1197, 'ainurrohmanpancapradana903', 'AINUR ROHMAN PANCA PRADANA', '$2y$10$d23lm0Kd3a3tgxRymH0AaO/5X02yV0D07.FCBWc5s04dw5TAoz1m2', 3, 13, 24, 3, 1, '2023-09-13 19:48:52', '2023-09-13 19:48:52', 1, NULL);
INSERT INTO `siswa` VALUES (1106, 1198, 'ariensephansyah447', 'ARIEN SEPHAN SYAH', '$2y$10$TUEZCYpxD4D4IYOe6wzOlezj.QjHQoZ9E/GkuXLD/jNyl74dl9w3S', 3, 13, 24, 3, 1, '2023-09-13 19:48:52', '2023-09-13 19:48:52', 1, NULL);
INSERT INTO `siswa` VALUES (1107, 1199, 'bagoessiswoyo385', 'BAGOES SISWOYO', '$2y$10$tFVeHHL3YfyNvaNgxadFueePsc6oyiS6WBtLZ9C.eHQs3kxn7WQIa', 3, 13, 24, 3, 1, '2023-09-13 19:48:52', '2023-09-13 19:48:52', 1, NULL);
INSERT INTO `siswa` VALUES (1108, 1200, 'beatricefourendithaleonynathania534', 'BEATRICE FOURENDITHA LEONY NATHANIA', '$2y$10$Gr4maD0ex7jAVgeFFXa75.8gGLd7fWzb2lHq6XWC3QUvfh.FzzHIS', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1109, 1201, 'destyodwirahmawan617', 'DESTYO DWI RAHMAWAN', '$2y$10$9CYD6/YbrwVjXyAzob/kdu41zCNDRpZNApzAQnaZ8PGq73yT.hVue', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1110, 1202, 'dimazhasyimhidayat607', 'DIMAZ HASYIM HIDAYAT', '$2y$10$3638nxcPiktoBAQCuGgFyOJhEYXggNE1O8heo00VJAQIxpKKYJPBW', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1111, 1203, 'dirmaberlianfancisca360', 'DIRMA BERLIAN FANCISCA', '$2y$10$J0EseDWRUUMi5XGcAEtz.uOjcBx4dd9x1xH4274GmtRjiHJAzGuju', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1112, 1204, 'fadilagustiofirmansyah968', 'FADIL AGUSTIO FIRMANSYAH', '$2y$10$x34gehhtO7eUvxbJROgYb.ZnmMy6AY9nptqTBQcvKWAedYPoVyhYi', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1113, 1205, 'izzatulfadilah182', 'IZZATUL FADILAH', '$2y$10$80GzquNSZJ8f9p6v.4XmsuUk7imbfZlaG9O0nVuAZIaLyP0gX4BRi', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1114, 1206, 'jasminekhairunnisa969', 'JASMINE KHAIRUNNISA', '$2y$10$.zJhSpMg46iIQa8NWOtmpOtG7uW5XtQMXmrX6D.RdpuWMkMTg0nM.', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1115, 1207, 'jovianturkyirfandi164', 'JOVIAN TURKY IRFANDI', '$2y$10$TI2i.IfdHbXgmY35AtBxp.kKvQztNTc6nL9PhnkxL8OX1ojlkfrWS', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1116, 1208, 'julfanaerzadwipratiwi593', 'JULFANA ERZA DWI PRATIWI', '$2y$10$klU3v2oJqs9koZ0L9SgHB.GrupI6X9Jpld/3UzAOeJoFSEXRZ6Mo2', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1117, 1209, 'mohammadfaizalkhofili645', 'MOHAMMAD FAIZAL KHOFILI', '$2y$10$MerwkxEupcSPH.HN1vv3FOOC4aIZz1dZhsLx7i1I24NHhIp8TnbMi', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1118, 1210, 'mohammadmaulanafirmansyah414', 'MOHAMMAD MAULANA FIRMANSYAH', '$2y$10$rKMN0rAf5GxFSKOtDkpaB.WcQj2Y7ZAfpcXxw8qq8WtE9PznlByJO', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1119, 1211, 'muhammadabdulafif1000', 'MUHAMMAD ABDUL AFIF', '$2y$10$WS62dWYuVHoRUgO042klKuxqO6bEqt7bNTfaUK3VTd45XKORWCrTi', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1120, 1212, 'muhammadarieffirmansyah757', 'MUHAMMAD ARIEF FIRMANSYAH', '$2y$10$HOI45s5iiGEa3o2mbslDhOaRfIF.RBdSM.R0GhqW9aqoTvSisjz4m', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1121, 1213, 'muhammadharisumami908', 'MUHAMMAD HARIS UMAMI', '$2y$10$xE14xjEAvF4mXRGY8e6mM.v0XVPKv0ybneFJly8tbD4jwRWwNraXq', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1122, 1214, 'muhammadirsyadrabbani598', 'MUHAMMAD IRSYAD RABBANI', '$2y$10$pXxKvt/ovF.YaK3Ns/oLSuMkvlKn2crn2cT8FlyaKDvJCYcxRhbme', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1123, 1215, 'muhammadshobri576', 'MUHAMMAD SHOBRI', '$2y$10$VdzlkKVhnLP.HEus4VS3X.r1ttvIYXbr4bUgtGcof.XxJbyN7d5vi', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1124, 1216, 'muhammadsukronmaulidi209', 'MUHAMMAD SUKRON MAULIDI', '$2y$10$OTdb7SX7qt1nk1YEmn7rR.3whqzltJt0C2PI/hbcMYfOTVUcwM8Wm', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1125, 1217, 'muhammadyudayanto792', 'MUHAMMAD YUDA YANTO', '$2y$10$oWCAEtxo9xKEMo4ay5vQ/edQJWXlqHNeWymLYqfQGvoc86308bqfW', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1126, 1218, 'muhammadzaeinulhaqqi906', 'MUHAMMAD ZAEINUL HAQQI', '$2y$10$ksnu0/qqWSOsP8EcLVTFf.LBiJLKZrHWUfDT97Rtx3p/HTK9KfmMm', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1127, 1219, 'putragunawan487', 'PUTRA GUNAWAN', '$2y$10$pSjRoVa/CpzNMnfbyXf/1u71xMndwCCVT9db87YoBfZlVMP0/CLE.', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1128, 1220, 'ragilsaifurrosiqin435', 'RAGIL SAIFUR ROSIQIN', '$2y$10$q2YeQdcyVrkgvfr107RgqO2/ZrhPKaYZbHdGlRnNMjsJCB67HoesS', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1129, 1221, 'siswoputraarikpratama227', 'SISWO PUTRA ARIK PRATAMA', '$2y$10$kpcmn0nWm2JbcDhpcLvJaOfeYr/YCav5VIJnZpGozwVE6Dr1AofZK', 3, 13, 24, 3, 1, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `siswa` VALUES (1130, 1222, 'vionitasalsabilaindiraputri180', 'VIONITA SALSABILA INDIRA PUTRI', '$2y$10$fkGrqU6FqxumRkE5u3ttVuwOAv9u6RXjewmXkx8wUE2EoH7IYSQd2', 3, 13, 24, 3, 1, '2023-09-13 19:48:54', '2023-09-13 19:48:54', 1, NULL);
INSERT INTO `siswa` VALUES (1131, 1223, 'zharakhalimatussakdiyah611', 'ZHARA KHALIMATUS SAKDIYAH', '$2y$10$fhjOMfzTmpWDOqKjb9N6qef/WNTdE8bo5VHCG5wPJrUwAkau2p..W', 3, 13, 24, 3, 1, '2023-09-13 19:48:54', '2023-09-13 19:48:54', 1, NULL);
INSERT INTO `siswa` VALUES (1132, 1224, 'abhistafarrelkaromahhibatullah309', 'ABHISTA FARREL KAROMAH HIBATULLAH', '$2y$10$VCb7nq6YGbERBz.oAyIUyucAD7fMMAtu0H0ubG9FMEPF2K5SHP74W', 3, 7, 12, 3, 1, '2023-09-13 19:49:52', '2023-09-13 19:49:52', 1, NULL);
INSERT INTO `siswa` VALUES (1133, 1225, 'ahmadabdillahfaza369', 'AHMAD ABDILLAH FAZA', '$2y$10$sLkxbZglW0wC2hSyu8J7NuV6EV0yF0R652w8kTy7VbkBtD9Wj2qmm', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1134, 1226, 'alifzakylutfiansyah315', 'ALIF ZAKY LUTFIANSYAH', '$2y$10$b0t9q63gQYVxgJMyRdcCkuWKySXj6WfZhl10aprdq5DYKhG6pBCYi', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1135, 1227, 'arilbenisetiawan822', 'ARIL BENI SETIAWAN', '$2y$10$61o7P2sUpgQJOIr2qYibceCn/Ashvgw3yw7PNquZPJy5pmg349F76', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1136, 1228, 'chelotasnimharyono512', 'CHELO TASNIM HARYONO', '$2y$10$Foyn6/OIZ/nCAd7fr.o3iuJXgebg9nSfKZqenUZs2jGM3kAqoHeb6', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1137, 1229, 'davafaranezar881', 'DAVA FARANEZAR', '$2y$10$..BV7DT22WeX1qsSkx3/3eQttROI9Q1aXjUN2yqdCW3aAeCSRKLNS', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1138, 1230, 'dimasregaadiwijaya614', 'DIMAS REGA ADIWIJAYA', '$2y$10$77iOKZR2b8d0WL8Rv7uP5eWnjV.93WjdXfD2KQRDzg4Bdm/NA2UJK', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1139, 1231, 'harismochammadishak963', 'HARIS MOCHAMMAD ISHAK', '$2y$10$/YYW0HZnIAuvIgArSqunBOIW0w9IWy9kaBbLgKqJdkLkMy6Wg7ucO', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1140, 1232, 'luqmanayawahidansutanto684', 'LUQMANAYA WAHIDAN SUTANTO', '$2y$10$BzTNDm/lpxQH6q7T76C/5e5TCC1Cc.y7obx.KqwlaaMd0M6jbP83W', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1141, 1233, 'mohammaddavilahakbar815', 'MOHAMMAD DAVILAH AKBAR', '$2y$10$553afBk1PSGpDyI/vMrA2et2YFKBncyUBaHfi4X9LZ07ZXPawLIvW', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1142, 1234, 'mohammadrayhanzhidad877', 'MOHAMMAD RAYHAN ZHIDAD', '$2y$10$.mPHWXsYCvJeUgTM5wD3XOlrvrBYMV1wb6t4mO270xe4.nIqkZ0Ze', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1143, 1235, 'muhammadgufron259', 'MUHAMMAD GUFRON', '$2y$10$4HDfuZwzzfNnYX7/tcp6Hu6j9gdi0Pox5fkeAURy22wy5vmMQW5ce', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1144, 1236, 'muhammadikrom4510', 'MUHAMMAD IKROM', '$2y$10$gp1RUUvOqJ3be0qXBeWmle/56TuDETtci9No6ebTaN8CMFrY8VJLS', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1145, 1237, 'muhammadirfanubaidillah842', 'MUHAMMAD IRFAN UBAIDILLAH', '$2y$10$9XN3zuOGGfD.8oEFpbog0.1.17qHxOvBJeU0zlvIAL1NR5HZwhTDa', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1146, 1238, 'muhammadmahrus9410', 'MUHAMMAD MAHRUS', '$2y$10$.vYz/JEV/Etr/em3L7p05eOGEg0826lZ.rFdfpAbYcXwShhcuIPny', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1147, 1239, 'putraadityaperkasa775', 'PUTRA ADITYA PERKASA', '$2y$10$M7feSWz34PXNWZJqCd3rt.M1YuZeOkAnPd0QOKxI8bAhcy1BU7Us6', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1148, 1240, 'radhitiapratamaeffendy438', 'RADHITIA PRATAMA EFFENDY', '$2y$10$uSWDRc4oxSiYYe91vsLkcutjKPQogcDL5ovY3I4fLe.BxDxCNBWYy', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1149, 1241, 'rayaghaniyyayuda951', 'RAYA GHANIYYA YUDA', '$2y$10$QQvL1I.H1AX3ATqffsvHgOlonN.pK.y/XCYdQcGccS.v9zL6UQDW2', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1150, 1242, 'riskiyantonoavis282', 'RISKI YANTONO AVIS', '$2y$10$YDRQ1fZsoRDaAEZ0Jc1XNOuKs7qFWjfxI4pIv/Oy3ll.pG5uJH0OO', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1151, 1243, 'rizky995', 'RIZKY', '$2y$10$Wn12wu4wcqb0qfYuJxQqseR7rMUDfWeGixMhMYc8EB162Wf73ZHjO', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1152, 1244, 'sitiqomariatulmaulidia811', 'SITI QOMARIATUL MAULIDIA', '$2y$10$0n8swmtsZL3j2/3vHxNpnu53y8/vllFopfcbeilUm12.iLCCCnIbm', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1153, 1245, 'tabinafaisapribadi559', 'TABINA FAISA PRIBADI', '$2y$10$jpzSidl2kfzVL6O5pFFteemcj4MEW4Y3YyxyXoTmzni9gnCzOgMiy', 3, 7, 12, 3, 1, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `siswa` VALUES (1154, 1246, 'teguhwichaksono402', 'TEGUH WICHAKSONO', '$2y$10$MkrS/dfOgixD8UHWI/wZ5OEmbMi..DVdWsgyRON3RDHNYPOYk81j6', 3, 7, 12, 3, 1, '2023-09-13 19:49:54', '2023-09-13 19:49:54', 1, NULL);
INSERT INTO `siswa` VALUES (1155, 1247, 'wildanzakiamali799', 'WILDAN ZAKI AMALI', '$2y$10$yiNDZCTxkmVET.AtHMNs6eaRFCeqLYxLRlSO3/xsC/bQzM2HH1EQO', 3, 7, 12, 3, 1, '2023-09-13 19:49:54', '2023-09-13 19:49:54', 1, NULL);
INSERT INTO `siswa` VALUES (1156, 1248, 'yuviarnuzulramadhani810', 'YUVIAR NUZUL RAMADHANI', '$2y$10$M9MFEWwmfifFN5F7X.bo6.JdcfYbKwa2EkfS5aH7r5egRvQKiawR6', 3, 7, 12, 3, 1, '2023-09-13 19:49:54', '2023-09-13 19:49:54', 1, NULL);
INSERT INTO `siswa` VALUES (1157, 1249, 'achmadabdillah310', 'ACHMAD ABDILLAH', '$2y$10$fgQDNETmh5cqB6X7QicYFufraOqwXpvrxiE/OasM8qtUNABksoC9a', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1158, 1250, 'aksinlabibussaid483', 'AKSIN LABIBUS SAID', '$2y$10$qEfss5C8A9oJqqaK2NuafOI3xE1R7Y6h2O.PauDxTmMF5Gl98tJiC', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1159, 1251, 'anantawidayani181', 'ANANTA WIDAYANI', '$2y$10$r/bCuqTtVizw2P8puXeko.J.HcwSnFzGPTbyCPeam1dcLTsglfTMu', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1160, 1252, 'arifhidayatullah866', 'ARIF HIDAYATULLAH', '$2y$10$anEcWzBaO3lV.ebZi2kYhurP8IurMttGFivKg/e2rZI//UpX95WmG', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1161, 1253, 'bimasatriapermana424', 'BIMA SATRIA PERMANA', '$2y$10$BvLmDEQzwmFgpIE9VnFQYOd73lU4nRlrs7tq8wNNjKTRyc6UStknK', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1162, 1254, 'dafansyahgilangramadhan509', 'DAFANSYAH GILANG RAMADHAN', '$2y$10$l7ShxoLYpU.BOjK8xYToDOGuiMGlZXs2koj.b21LkNljcwOW/.2vW', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1163, 1255, 'dimasnuryadisaputra464', 'DIMAS NURYADI SAPUTRA', '$2y$10$DCDoESJzn1YymaDx9/4lKeEGvn0mSaK53QyK/3anxWY.UTkrnV9P6', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1164, 1256, 'galangsamudraefendi381', 'GALANG SAMUDRA EFENDI', '$2y$10$f3h.L1mxrWc.aZRMHPX9fOoHgOs3dSEzCA.uAHz90vCeNTn2V4S2m', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1165, 1257, 'imammustaqim133', 'IMAM MUSTAQIM', '$2y$10$Yy6Apc7m.28er3rlw25J6O8EsEeR4W.FFZybG70IKqm6FlAoDKWFG', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1166, 1258, 'luqmanulhakim438', 'LUQMANUL HAKIM', '$2y$10$GGHyxr0oTFwdhvWHnwd4eeX6k3gnYmCBAV4RRyqeIToKJgGs3xlOe', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1167, 1259, 'mohammadraditfirmanzah804', 'MOHAMMAD RADIT FIRMANZAH', '$2y$10$LzFQn0SDUCqw0S78JqZk4.Tooa6rEqBiHTezk7AA8K/IUAFIH5wNi', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1168, 1260, 'muhammadbagasrandiyanto546', 'MUHAMMAD BAGAS RANDIYANTO', '$2y$10$vyALFL.qCrdIdMooyOze..kqP7kMjesrMo.PJCDL1yBKn409Y43Ai', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1169, 1261, 'muhammadibnuaqil1002', 'MUHAMMAD IBNU AQIL', '$2y$10$V.7otpWkhjNlAhrDD0U2AOla67biTO01lIMVF18vesiazOWqopadi', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1170, 1262, 'muhammadilmirizalwardanasafari979', 'MUHAMMAD ILMI RIZAL WARDANA SAFARI', '$2y$10$zS9W7DQYriN7S3yZj6F1m.Q1/4yw3cLlACbR/ioatRJbFC/7uguui', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1171, 1263, 'muhammadkabidghithraf735', 'MUHAMMAD KABID GHITHRAF', '$2y$10$vg3NMMu.DrgkYGdMpxOyROs9t4xN7VIuY/rvLI/VwJHCE9zWFbgeu', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1172, 1264, 'muhammadzidaneputradeswanto552', 'MUHAMMAD ZIDANE PUTRA DESWANTO', '$2y$10$vDqosh9RHVZ.uv8QtllFaOdTag9rt09W1YvARtGYZUc3UqwRkoeNC', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1173, 1265, 'radhitaunullahassajid701', 'RADHIT AUNULLAH ASSAJID', '$2y$10$sK4ThAm2qwugH2S2udMLfOU62ubZjUm1zWcSwd7ECBNMXutGFhtom', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1174, 1266, 'rafiaguslaksono690', 'RAFI AGUS LAKSONO', '$2y$10$RhIUgxsjUJZu4SZ8Jmy5Ie.de6mCcf4gdIv6D0JZ3YoWq87u3IIfy', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1175, 1267, 'renomujiorahman534', 'RENO MUJIO RAHMAN', '$2y$10$eHdZos3qaXZgaM/V49MqbOZZYKd2ZAllUs2tyY/0nWeyWABDPX0mq', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1176, 1268, 'sitiraudatuljannah2610', 'SITI RAUDATUL JANNAH', '$2y$10$kukJ8zdK5vFsWYHQRBvHs.eDNER7I3q.ByVkzqhv7OVG204Ez9Jvm', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1177, 1269, 'sultanfachriaziz693', 'SULTAN FACHRI AZIZ', '$2y$10$E7qR9bCvpOSAp8v4ikeL..0Y9rWHMtNxrn82X2nlUPWsYBuKuHTwS', 3, 7, 13, 3, 1, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `siswa` VALUES (1178, 1270, 'wildanalaziz263', 'WILDAN AL AZIZ', '$2y$10$zdN3pnsY21Jl1daxzCJYq.ZQnJvwiG39I5.w2RoIMbdhpuyQcO4jS', 3, 7, 13, 3, 1, '2023-09-13 19:50:50', '2023-09-13 19:50:50', 1, NULL);
INSERT INTO `siswa` VALUES (1179, 1271, 'yoanrelouisalphanabiushaziranpermadi578', 'YOANRE LOUIS ALPHANABIUS HAZIRAN PERMADI', '$2y$10$9dqSpiZOJH73fOQsiiRSQ.08wsBARvgJp/fKGIYTLN4bgQFsHVS7G', 3, 7, 13, 3, 1, '2023-09-13 19:50:50', '2023-09-13 19:50:50', 1, NULL);
INSERT INTO `siswa` VALUES (1180, 1272, 'zaskiaafrinakhaliq374', 'ZASKIA AFRINA KHALIQ', '$2y$10$p41ezraesMURi0BXQecbh.XVMeVHMsEPt0IkgN1Dy2hbpXWfDqNHe', 3, 7, 13, 3, 1, '2023-09-13 19:50:50', '2023-09-13 19:50:50', 1, NULL);
INSERT INTO `siswa` VALUES (1181, 1273, 'adibmuhtarmusthofa472', 'ADIB MUHTAR MUSTHOFA', '$2y$10$0i9nH8y7bUjUe1OW1D/JQuQMPhsH9LcufIbJ/kfQjfmYuuPcEZVoq', 3, 8, 14, 3, 1, '2023-09-13 19:51:56', '2023-09-13 19:51:56', 1, NULL);
INSERT INTO `siswa` VALUES (1182, 1274, 'ahmadfaizabdillah783', 'AHMAD FAIZ ABDILLAH', '$2y$10$0pHScOMZ5hWpyjFvAlQjZO8iKYBl0vklW4ovAa/fBBhTIGhevp1NG', 3, 8, 14, 3, 1, '2023-09-13 19:51:56', '2023-09-13 19:51:56', 1, NULL);
INSERT INTO `siswa` VALUES (1183, 1275, 'alifilyasah589', 'ALIF ILYASAH', '$2y$10$B8ehzuEN7IKvnZSRqUds5eIU3vK02Fidj8xGIU7uc6PG93ccquF4K', 3, 8, 14, 3, 1, '2023-09-13 19:51:56', '2023-09-13 19:51:56', 1, NULL);
INSERT INTO `siswa` VALUES (1184, 1276, 'aqiqohtussilvia624', 'AQIQOHTUS SILVIA', '$2y$10$A6wVdTUKHbWn5cZrUDL8G.jTpaRc5EHcE9Cz78Gg8BNz5a0MBqrZC', 3, 8, 14, 3, 1, '2023-09-13 19:51:56', '2023-09-13 19:51:56', 1, NULL);
INSERT INTO `siswa` VALUES (1185, 1277, 'ceciliajoanlimesa152', 'CECILIA JOAN LIMESA', '$2y$10$bsgCMMx7lP89WtdCxlTbUOl9oOFFjqy/el5saayUqF4e5of3/gc/a', 3, 8, 14, 3, 1, '2023-09-13 19:51:56', '2023-09-13 19:51:56', 1, NULL);
INSERT INTO `siswa` VALUES (1186, 1278, 'donitristanto464', 'DONI TRISTANTO', '$2y$10$cNVs.uZ.7QL/D0rtMWspQew4nWNXvnS5PyggvgJm7Mg.H5V3NH9ZG', 3, 8, 14, 3, 1, '2023-09-13 19:51:56', '2023-09-13 19:51:56', 1, NULL);
INSERT INTO `siswa` VALUES (1187, 1279, 'ferdiansaharisandi616', 'FERDIANSAH ARISANDI', '$2y$10$4uDN35NhQaknj.EOFiuID.pYzbnLcBrCg6CD.jqWUYWfGrh94XSwq', 3, 8, 14, 3, 1, '2023-09-13 19:51:56', '2023-09-13 19:51:56', 1, NULL);
INSERT INTO `siswa` VALUES (1188, 1280, 'lisanshidqihersykholidi619', 'LISAN SHIDQI HERSY KHOLIDI', '$2y$10$RGX9IzczTbgzCYiHhL3Z1.r07fEmIVZ/BYaoU2Yj6ypFcvmXEIXre', 3, 8, 14, 3, 1, '2023-09-13 19:51:56', '2023-09-13 19:51:56', 1, NULL);
INSERT INTO `siswa` VALUES (1189, 1281, 'mochammadhusnulfawaid543', 'MOCHAMMAD HUSNUL FAWAID', '$2y$10$aO2Mi2/6nchO8vGXzJPmeulytUm9BhrbMMs2vOWDrfv9EnHO4djUO', 3, 8, 14, 3, 1, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `siswa` VALUES (1190, 1282, 'mohammadrizqonelhasani9210', 'MOHAMMAD RIZQON EL HASANI', '$2y$10$seCtS8sgo3xs76sokZ1GlOwTBaPcArn5O9UtnzukNDV6EUZMti6xi', 3, 8, 14, 3, 1, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `siswa` VALUES (1191, 1283, 'mohammadtirtadeswantoro754', 'MOHAMMAD TIRTA DESWANTORO', '$2y$10$J2zta6D5lKIOn8qAg/Pi.O52aG43GaMWtB.UOc6UK1dO1q7enolTC', 3, 8, 14, 3, 1, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `siswa` VALUES (1192, 1284, 'muhammaddliyaulhaq764', 'MUHAMMAD DLIYAUL HAQ', '$2y$10$R1FyR1c.lRFcdK6Oa6RnxOTlMJkjEpemUAL/PfmMga/mH43FIBEP.', 3, 8, 14, 3, 1, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `siswa` VALUES (1193, 1285, 'muhammadimronmaulidin249', 'MUHAMMAD IMRON MAULIDIN ', '$2y$10$gGi4yUCQxtzxulnKTbk0zuKfQh5Dhda9bd.j6b3dN3SHjFAu/IjFa', 3, 8, 14, 3, 1, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `siswa` VALUES (1194, 1286, 'muhammadsaifulfari339', 'MUHAMMAD SAIFUL FARI', '$2y$10$xBc3aABJbAXlF5uuJekXDeWYmpSk9.BTjYSleQDfr3iCo6dhmdZPi', 3, 8, 14, 3, 1, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `siswa` VALUES (1195, 1287, 'muhammadzainulhaq736', 'MUHAMMAD ZAINUL HAQ', '$2y$10$bDPf/BkH5721.VQAtgEWDulePEsWdZ6hV.iiW08enftZbnGzp1CpO', 3, 8, 14, 3, 1, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `siswa` VALUES (1196, 1288, 'nurulafifah705', 'NURUL AFIFAH', '$2y$10$ucPIfEuCwahDe98dpQo2.OHEjtsIPCBux3ZY5ldW7U8tuxJL0sIgq', 3, 8, 14, 3, 1, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `siswa` VALUES (1197, 1289, 'nurulhidayah614', 'NURUL HIDAYAH', '$2y$10$8Kys7Jg107TF67/fzAVM5.GQR5wcsHDaeRhsTumqSrfqesZLfCUHW', 3, 8, 14, 3, 1, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `siswa` VALUES (1198, 1290, 'sandirezasaputra576', 'SANDI REZA SAPUTRA', '$2y$10$FqxHtBU/PI5pr0LrNyNqEOc7g9AEMr17ZrH3bjOdgcEBSTS4c./Py', 3, 8, 14, 3, 1, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `siswa` VALUES (1199, 1291, 'siskadewikumalasari5010', 'SISKA DEWI KUMALA SARI', '$2y$10$Jxnf/OQqF2G2CNeppvAXOOELV2S7Lm82luKzV/QzZU7gxBLYsAcg2', 3, 8, 14, 3, 1, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `siswa` VALUES (1200, 1292, 'sittinurholisah958', 'SITTI NURHOLISAH', '$2y$10$KrO.nlm/6jThgYElsOIsvO0ruBlNv57NkVSpsFm5PhEs5nkvXtnXK', 3, 8, 14, 3, 1, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `siswa` VALUES (1201, 1293, 'soniaanggunsari742', 'SONIA ANGGUN SARI', '$2y$10$xU0NigprBwVApKnG8deuVup4rQP8/x3hUWbK.kLIE7yNbYFP/cSu6', 3, 8, 14, 3, 1, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `siswa` VALUES (1202, 1294, 'usamahroyhansholahuddinalayubi400', 'USAMAH ROYHAN SHOLAHUDDIN AL AYUBI', '$2y$10$OOpzIIcCQEXKZEYHPoluluxQW.dpCxtl3bQuvHJKxnSERBGwVTjF.', 3, 8, 14, 3, 1, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `siswa` VALUES (1203, 1295, 'verdiansyahyulianwahyusaputra266', 'VERDIANSYAH YULIAN WAHYU SAPUTRA', '$2y$10$5oErYU2IUIZ.RacnorMf2O9vt94RTt5VafDgTXSQYQOImQi1lOi/O', 3, 8, 14, 3, 1, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tahun_ajaran
-- ----------------------------
INSERT INTO `tahun_ajaran` VALUES (1, '2023-2024', 1, 1, '2023-09-12 21:02:03', '2023-09-12 21:02:03', 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1296 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '2023-09-12 21:02:03', '2023-09-12 21:02:03', 1, NULL);
INSERT INTO `users` VALUES (2, '2023-09-12 21:03:09', '2023-09-12 21:03:09', 1, NULL);
INSERT INTO `users` VALUES (3, '2023-09-12 21:03:09', '2023-09-12 21:03:09', 1, NULL);
INSERT INTO `users` VALUES (4, '2023-09-12 21:03:09', '2023-09-12 21:03:09', 1, NULL);
INSERT INTO `users` VALUES (5, '2023-09-12 21:03:09', '2023-09-12 21:03:09', 1, NULL);
INSERT INTO `users` VALUES (6, '2023-09-12 21:03:09', '2023-09-12 21:03:09', 1, NULL);
INSERT INTO `users` VALUES (7, '2023-09-12 21:03:09', '2023-09-12 21:03:09', 1, NULL);
INSERT INTO `users` VALUES (8, '2023-09-12 21:03:09', '2023-09-12 21:03:09', 1, NULL);
INSERT INTO `users` VALUES (9, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (10, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (11, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (12, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (13, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (14, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (15, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (16, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (17, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (18, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (19, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (20, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (21, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (22, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (23, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (24, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (25, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (26, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (27, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (28, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (29, '2023-09-12 21:03:10', '2023-09-12 21:03:10', 1, NULL);
INSERT INTO `users` VALUES (30, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (31, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (32, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (33, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (34, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (35, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (36, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (37, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (38, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (39, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (40, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (41, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (42, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (43, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (44, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (45, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (46, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (47, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (48, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (49, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (50, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (51, '2023-09-12 21:03:11', '2023-09-12 21:03:11', 1, NULL);
INSERT INTO `users` VALUES (52, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (53, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (54, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (55, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (56, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (57, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (58, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (59, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (60, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (61, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (62, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (63, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (64, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (65, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (66, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (67, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (68, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (69, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (70, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (71, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (72, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (73, '2023-09-12 21:03:12', '2023-09-12 21:03:12', 1, NULL);
INSERT INTO `users` VALUES (74, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `users` VALUES (75, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `users` VALUES (76, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `users` VALUES (77, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `users` VALUES (78, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `users` VALUES (79, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `users` VALUES (80, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `users` VALUES (81, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `users` VALUES (82, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `users` VALUES (83, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `users` VALUES (84, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `users` VALUES (85, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `users` VALUES (86, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `users` VALUES (87, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `users` VALUES (88, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `users` VALUES (89, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `users` VALUES (90, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `users` VALUES (91, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `users` VALUES (92, '2023-09-12 21:03:13', '2023-09-12 21:03:13', 1, NULL);
INSERT INTO `users` VALUES (93, '2023-09-13 19:15:17', '2023-09-13 19:15:17', 1, NULL);
INSERT INTO `users` VALUES (94, '2023-09-13 19:15:17', '2023-09-13 19:15:17', 1, NULL);
INSERT INTO `users` VALUES (95, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (96, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (97, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (98, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (99, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (100, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (101, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (102, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (103, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (104, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (105, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (106, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (107, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (108, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (109, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (110, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (111, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (112, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (113, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (114, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (115, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (116, '2023-09-13 19:15:18', '2023-09-13 19:15:18', 1, NULL);
INSERT INTO `users` VALUES (117, '2023-09-13 19:15:19', '2023-09-13 19:15:19', 1, NULL);
INSERT INTO `users` VALUES (118, '2023-09-13 19:15:19', '2023-09-13 19:15:19', 1, NULL);
INSERT INTO `users` VALUES (119, '2023-09-13 19:15:19', '2023-09-13 19:15:19', 1, NULL);
INSERT INTO `users` VALUES (120, '2023-09-13 19:15:19', '2023-09-13 19:15:19', 1, NULL);
INSERT INTO `users` VALUES (121, '2023-09-13 19:15:19', '2023-09-13 19:15:19', 1, NULL);
INSERT INTO `users` VALUES (122, '2023-09-13 19:15:19', '2023-09-13 19:15:19', 1, NULL);
INSERT INTO `users` VALUES (123, '2023-09-13 19:15:19', '2023-09-13 19:15:19', 1, NULL);
INSERT INTO `users` VALUES (124, '2023-09-13 19:15:19', '2023-09-13 19:15:19', 1, NULL);
INSERT INTO `users` VALUES (125, '2023-09-13 19:15:19', '2023-09-13 19:15:19', 1, NULL);
INSERT INTO `users` VALUES (126, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `users` VALUES (127, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `users` VALUES (128, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `users` VALUES (129, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `users` VALUES (130, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `users` VALUES (131, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `users` VALUES (132, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `users` VALUES (133, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `users` VALUES (134, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `users` VALUES (135, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `users` VALUES (136, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `users` VALUES (137, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `users` VALUES (138, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `users` VALUES (139, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `users` VALUES (140, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `users` VALUES (141, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `users` VALUES (142, '2023-09-13 19:15:26', '2023-09-13 19:15:26', 1, NULL);
INSERT INTO `users` VALUES (143, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `users` VALUES (144, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `users` VALUES (145, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `users` VALUES (146, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `users` VALUES (147, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `users` VALUES (148, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `users` VALUES (149, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `users` VALUES (150, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `users` VALUES (151, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `users` VALUES (152, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `users` VALUES (153, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `users` VALUES (154, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `users` VALUES (155, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `users` VALUES (156, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `users` VALUES (157, '2023-09-13 19:15:27', '2023-09-13 19:15:27', 1, NULL);
INSERT INTO `users` VALUES (158, '2023-09-13 19:15:38', '2023-09-13 19:15:38', 1, NULL);
INSERT INTO `users` VALUES (159, '2023-09-13 19:15:38', '2023-09-13 19:15:38', 1, NULL);
INSERT INTO `users` VALUES (160, '2023-09-13 19:15:38', '2023-09-13 19:15:38', 1, NULL);
INSERT INTO `users` VALUES (161, '2023-09-13 19:15:38', '2023-09-13 19:15:38', 1, NULL);
INSERT INTO `users` VALUES (162, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (163, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (164, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (165, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (166, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (167, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (168, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (169, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (170, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (171, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (172, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (173, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (174, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (175, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (176, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (177, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (178, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (179, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (180, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (181, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (182, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (183, '2023-09-13 19:15:39', '2023-09-13 19:15:39', 1, NULL);
INSERT INTO `users` VALUES (184, '2023-09-13 19:15:40', '2023-09-13 19:15:40', 1, NULL);
INSERT INTO `users` VALUES (185, '2023-09-13 19:15:40', '2023-09-13 19:15:40', 1, NULL);
INSERT INTO `users` VALUES (186, '2023-09-13 19:15:40', '2023-09-13 19:15:40', 1, NULL);
INSERT INTO `users` VALUES (187, '2023-09-13 19:15:40', '2023-09-13 19:15:40', 1, NULL);
INSERT INTO `users` VALUES (188, '2023-09-13 19:15:40', '2023-09-13 19:15:40', 1, NULL);
INSERT INTO `users` VALUES (189, '2023-09-13 19:15:40', '2023-09-13 19:15:40', 1, NULL);
INSERT INTO `users` VALUES (190, '2023-09-13 19:15:40', '2023-09-13 19:15:40', 1, NULL);
INSERT INTO `users` VALUES (191, '2023-09-13 19:15:40', '2023-09-13 19:15:40', 1, NULL);
INSERT INTO `users` VALUES (192, '2023-09-13 19:15:43', '2023-09-13 19:15:43', 1, NULL);
INSERT INTO `users` VALUES (193, '2023-09-13 19:15:43', '2023-09-13 19:15:43', 1, NULL);
INSERT INTO `users` VALUES (194, '2023-09-13 19:15:43', '2023-09-13 19:15:43', 1, NULL);
INSERT INTO `users` VALUES (195, '2023-09-13 19:15:43', '2023-09-13 19:15:43', 1, NULL);
INSERT INTO `users` VALUES (196, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (197, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (198, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (199, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (200, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (201, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (202, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (203, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (204, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (205, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (206, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (207, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (208, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (209, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (210, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (211, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (212, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (213, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (214, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (215, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (216, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (217, '2023-09-13 19:15:44', '2023-09-13 19:15:44', 1, NULL);
INSERT INTO `users` VALUES (218, '2023-09-13 19:15:45', '2023-09-13 19:15:45', 1, NULL);
INSERT INTO `users` VALUES (219, '2023-09-13 19:15:45', '2023-09-13 19:15:45', 1, NULL);
INSERT INTO `users` VALUES (220, '2023-09-13 19:15:45', '2023-09-13 19:15:45', 1, NULL);
INSERT INTO `users` VALUES (221, '2023-09-13 19:15:45', '2023-09-13 19:15:45', 1, NULL);
INSERT INTO `users` VALUES (222, '2023-09-13 19:15:45', '2023-09-13 19:15:45', 1, NULL);
INSERT INTO `users` VALUES (223, '2023-09-13 19:15:45', '2023-09-13 19:15:45', 1, NULL);
INSERT INTO `users` VALUES (224, '2023-09-13 19:15:45', '2023-09-13 19:15:45', 1, NULL);
INSERT INTO `users` VALUES (225, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `users` VALUES (226, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `users` VALUES (227, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `users` VALUES (228, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `users` VALUES (229, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `users` VALUES (230, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `users` VALUES (231, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `users` VALUES (232, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `users` VALUES (233, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `users` VALUES (234, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `users` VALUES (235, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `users` VALUES (236, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `users` VALUES (237, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `users` VALUES (238, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `users` VALUES (239, '2023-09-13 19:15:54', '2023-09-13 19:15:54', 1, NULL);
INSERT INTO `users` VALUES (240, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `users` VALUES (241, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `users` VALUES (242, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `users` VALUES (243, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `users` VALUES (244, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `users` VALUES (245, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `users` VALUES (246, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `users` VALUES (247, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `users` VALUES (248, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `users` VALUES (249, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `users` VALUES (250, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `users` VALUES (251, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `users` VALUES (252, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `users` VALUES (253, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `users` VALUES (254, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `users` VALUES (255, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `users` VALUES (256, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `users` VALUES (257, '2023-09-13 19:15:55', '2023-09-13 19:15:55', 1, NULL);
INSERT INTO `users` VALUES (258, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (259, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (260, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (261, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (262, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (263, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (264, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (265, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (266, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (267, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (268, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (269, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (270, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (271, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (272, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (273, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (274, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (275, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (276, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (277, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (278, '2023-09-13 19:16:06', '2023-09-13 19:16:06', 1, NULL);
INSERT INTO `users` VALUES (279, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `users` VALUES (280, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `users` VALUES (281, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `users` VALUES (282, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `users` VALUES (283, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `users` VALUES (284, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `users` VALUES (285, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `users` VALUES (286, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `users` VALUES (287, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `users` VALUES (288, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `users` VALUES (289, '2023-09-13 19:16:07', '2023-09-13 19:16:07', 1, NULL);
INSERT INTO `users` VALUES (290, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `users` VALUES (291, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `users` VALUES (292, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `users` VALUES (293, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `users` VALUES (294, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `users` VALUES (295, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `users` VALUES (296, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `users` VALUES (297, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `users` VALUES (298, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `users` VALUES (299, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `users` VALUES (300, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `users` VALUES (301, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `users` VALUES (302, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `users` VALUES (303, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `users` VALUES (304, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `users` VALUES (305, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `users` VALUES (306, '2023-09-13 19:16:11', '2023-09-13 19:16:11', 1, NULL);
INSERT INTO `users` VALUES (307, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `users` VALUES (308, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `users` VALUES (309, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `users` VALUES (310, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `users` VALUES (311, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `users` VALUES (312, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `users` VALUES (313, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `users` VALUES (314, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `users` VALUES (315, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `users` VALUES (316, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `users` VALUES (317, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `users` VALUES (318, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `users` VALUES (319, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `users` VALUES (320, '2023-09-13 19:16:12', '2023-09-13 19:16:12', 1, NULL);
INSERT INTO `users` VALUES (321, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `users` VALUES (322, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `users` VALUES (323, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `users` VALUES (324, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `users` VALUES (325, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `users` VALUES (326, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `users` VALUES (327, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `users` VALUES (328, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `users` VALUES (329, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `users` VALUES (330, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `users` VALUES (331, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `users` VALUES (332, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `users` VALUES (333, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `users` VALUES (334, '2023-09-13 19:16:22', '2023-09-13 19:16:22', 1, NULL);
INSERT INTO `users` VALUES (335, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `users` VALUES (336, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `users` VALUES (337, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `users` VALUES (338, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `users` VALUES (339, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `users` VALUES (340, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `users` VALUES (341, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `users` VALUES (342, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `users` VALUES (343, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `users` VALUES (344, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `users` VALUES (345, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `users` VALUES (346, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `users` VALUES (347, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `users` VALUES (348, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `users` VALUES (349, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `users` VALUES (350, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `users` VALUES (351, '2023-09-13 19:16:23', '2023-09-13 19:16:23', 1, NULL);
INSERT INTO `users` VALUES (352, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `users` VALUES (353, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `users` VALUES (354, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `users` VALUES (355, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `users` VALUES (356, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `users` VALUES (357, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `users` VALUES (358, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `users` VALUES (359, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `users` VALUES (360, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `users` VALUES (361, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `users` VALUES (362, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `users` VALUES (363, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `users` VALUES (364, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `users` VALUES (365, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `users` VALUES (366, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `users` VALUES (367, '2023-09-13 19:16:30', '2023-09-13 19:16:30', 1, NULL);
INSERT INTO `users` VALUES (368, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `users` VALUES (369, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `users` VALUES (370, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `users` VALUES (371, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `users` VALUES (372, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `users` VALUES (373, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `users` VALUES (374, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `users` VALUES (375, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `users` VALUES (376, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `users` VALUES (377, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `users` VALUES (378, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `users` VALUES (379, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `users` VALUES (380, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `users` VALUES (381, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `users` VALUES (382, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `users` VALUES (383, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `users` VALUES (384, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `users` VALUES (385, '2023-09-13 19:16:31', '2023-09-13 19:16:31', 1, NULL);
INSERT INTO `users` VALUES (386, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `users` VALUES (387, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `users` VALUES (388, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `users` VALUES (389, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `users` VALUES (390, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `users` VALUES (391, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `users` VALUES (392, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `users` VALUES (393, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `users` VALUES (394, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `users` VALUES (395, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `users` VALUES (396, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `users` VALUES (397, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `users` VALUES (398, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `users` VALUES (399, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `users` VALUES (400, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `users` VALUES (401, '2023-09-13 19:16:41', '2023-09-13 19:16:41', 1, NULL);
INSERT INTO `users` VALUES (402, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `users` VALUES (403, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `users` VALUES (404, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `users` VALUES (405, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `users` VALUES (406, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `users` VALUES (407, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `users` VALUES (408, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `users` VALUES (409, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `users` VALUES (410, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `users` VALUES (411, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `users` VALUES (412, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `users` VALUES (413, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `users` VALUES (414, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `users` VALUES (415, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `users` VALUES (416, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `users` VALUES (417, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `users` VALUES (418, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `users` VALUES (419, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `users` VALUES (420, '2023-09-13 19:16:42', '2023-09-13 19:16:42', 1, NULL);
INSERT INTO `users` VALUES (421, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (422, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (423, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (424, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (425, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (426, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (427, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (428, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (429, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (430, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (431, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (432, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (433, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (434, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (435, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (436, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (437, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (438, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (439, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (440, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (441, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (442, '2023-09-13 19:16:48', '2023-09-13 19:16:48', 1, NULL);
INSERT INTO `users` VALUES (443, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `users` VALUES (444, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `users` VALUES (445, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `users` VALUES (446, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `users` VALUES (447, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `users` VALUES (448, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `users` VALUES (449, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `users` VALUES (450, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `users` VALUES (451, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `users` VALUES (452, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `users` VALUES (453, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `users` VALUES (454, '2023-09-13 19:16:49', '2023-09-13 19:16:49', 1, NULL);
INSERT INTO `users` VALUES (455, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `users` VALUES (456, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `users` VALUES (457, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `users` VALUES (458, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `users` VALUES (459, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `users` VALUES (460, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `users` VALUES (461, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `users` VALUES (462, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `users` VALUES (463, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `users` VALUES (464, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `users` VALUES (465, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `users` VALUES (466, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `users` VALUES (467, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `users` VALUES (468, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `users` VALUES (469, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `users` VALUES (470, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `users` VALUES (471, '2023-09-13 19:16:59', '2023-09-13 19:16:59', 1, NULL);
INSERT INTO `users` VALUES (472, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `users` VALUES (473, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `users` VALUES (474, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `users` VALUES (475, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `users` VALUES (476, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `users` VALUES (477, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `users` VALUES (478, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `users` VALUES (479, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `users` VALUES (480, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `users` VALUES (481, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `users` VALUES (482, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `users` VALUES (483, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `users` VALUES (484, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `users` VALUES (485, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `users` VALUES (486, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `users` VALUES (487, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `users` VALUES (488, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `users` VALUES (489, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `users` VALUES (490, '2023-09-13 19:17:00', '2023-09-13 19:17:00', 1, NULL);
INSERT INTO `users` VALUES (491, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `users` VALUES (492, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `users` VALUES (493, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `users` VALUES (494, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `users` VALUES (495, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `users` VALUES (496, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `users` VALUES (497, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `users` VALUES (498, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `users` VALUES (499, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `users` VALUES (500, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `users` VALUES (501, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `users` VALUES (502, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `users` VALUES (503, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `users` VALUES (504, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `users` VALUES (505, '2023-09-13 19:17:11', '2023-09-13 19:17:11', 1, NULL);
INSERT INTO `users` VALUES (506, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `users` VALUES (507, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `users` VALUES (508, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `users` VALUES (509, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `users` VALUES (510, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `users` VALUES (511, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `users` VALUES (512, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `users` VALUES (513, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `users` VALUES (514, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `users` VALUES (515, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `users` VALUES (516, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `users` VALUES (517, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `users` VALUES (518, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `users` VALUES (519, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `users` VALUES (520, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `users` VALUES (521, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `users` VALUES (522, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `users` VALUES (523, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `users` VALUES (524, '2023-09-13 19:17:12', '2023-09-13 19:17:12', 1, NULL);
INSERT INTO `users` VALUES (525, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (526, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (527, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (528, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (529, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (530, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (531, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (532, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (533, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (534, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (535, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (536, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (537, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (538, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (539, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (540, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (541, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (542, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (543, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (544, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (545, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (546, '2023-09-13 19:20:43', '2023-09-13 19:20:43', 1, NULL);
INSERT INTO `users` VALUES (547, '2023-09-13 19:20:44', '2023-09-13 19:20:44', 1, NULL);
INSERT INTO `users` VALUES (548, '2023-09-13 19:20:44', '2023-09-13 19:20:44', 1, NULL);
INSERT INTO `users` VALUES (549, '2023-09-13 19:20:44', '2023-09-13 19:20:44', 1, NULL);
INSERT INTO `users` VALUES (550, '2023-09-13 19:20:44', '2023-09-13 19:20:44', 1, NULL);
INSERT INTO `users` VALUES (551, '2023-09-13 19:20:44', '2023-09-13 19:20:44', 1, NULL);
INSERT INTO `users` VALUES (552, '2023-09-13 19:20:44', '2023-09-13 19:20:44', 1, NULL);
INSERT INTO `users` VALUES (553, '2023-09-13 19:20:44', '2023-09-13 19:20:44', 1, NULL);
INSERT INTO `users` VALUES (554, '2023-09-13 19:20:44', '2023-09-13 19:20:44', 1, NULL);
INSERT INTO `users` VALUES (555, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `users` VALUES (556, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `users` VALUES (557, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `users` VALUES (558, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `users` VALUES (559, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `users` VALUES (560, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `users` VALUES (561, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `users` VALUES (562, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `users` VALUES (563, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `users` VALUES (564, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `users` VALUES (565, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `users` VALUES (566, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `users` VALUES (567, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `users` VALUES (568, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `users` VALUES (569, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `users` VALUES (570, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `users` VALUES (571, '2023-09-13 19:21:53', '2023-09-13 19:21:53', 1, NULL);
INSERT INTO `users` VALUES (572, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `users` VALUES (573, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `users` VALUES (574, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `users` VALUES (575, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `users` VALUES (576, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `users` VALUES (577, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `users` VALUES (578, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `users` VALUES (579, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `users` VALUES (580, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `users` VALUES (581, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `users` VALUES (582, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `users` VALUES (583, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `users` VALUES (584, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `users` VALUES (585, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `users` VALUES (586, '2023-09-13 19:21:54', '2023-09-13 19:21:54', 1, NULL);
INSERT INTO `users` VALUES (587, '2023-09-13 19:22:53', '2023-09-13 19:22:53', 1, NULL);
INSERT INTO `users` VALUES (588, '2023-09-13 19:22:53', '2023-09-13 19:22:53', 1, NULL);
INSERT INTO `users` VALUES (589, '2023-09-13 19:22:53', '2023-09-13 19:22:53', 1, NULL);
INSERT INTO `users` VALUES (590, '2023-09-13 19:22:53', '2023-09-13 19:22:53', 1, NULL);
INSERT INTO `users` VALUES (591, '2023-09-13 19:22:53', '2023-09-13 19:22:53', 1, NULL);
INSERT INTO `users` VALUES (592, '2023-09-13 19:22:53', '2023-09-13 19:22:53', 1, NULL);
INSERT INTO `users` VALUES (593, '2023-09-13 19:22:53', '2023-09-13 19:22:53', 1, NULL);
INSERT INTO `users` VALUES (594, '2023-09-13 19:22:53', '2023-09-13 19:22:53', 1, NULL);
INSERT INTO `users` VALUES (595, '2023-09-13 19:22:53', '2023-09-13 19:22:53', 1, NULL);
INSERT INTO `users` VALUES (596, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (597, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (598, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (599, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (600, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (601, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (602, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (603, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (604, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (605, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (606, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (607, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (608, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (609, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (610, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (611, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (612, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (613, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (614, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (615, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (616, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (617, '2023-09-13 19:22:54', '2023-09-13 19:22:54', 1, NULL);
INSERT INTO `users` VALUES (618, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `users` VALUES (619, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `users` VALUES (620, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `users` VALUES (621, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `users` VALUES (622, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `users` VALUES (623, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `users` VALUES (624, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `users` VALUES (625, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `users` VALUES (626, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `users` VALUES (627, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `users` VALUES (628, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `users` VALUES (629, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `users` VALUES (630, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `users` VALUES (631, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `users` VALUES (632, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `users` VALUES (633, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `users` VALUES (634, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `users` VALUES (635, '2023-09-13 19:24:29', '2023-09-13 19:24:29', 1, NULL);
INSERT INTO `users` VALUES (636, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `users` VALUES (637, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `users` VALUES (638, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `users` VALUES (639, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `users` VALUES (640, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `users` VALUES (641, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `users` VALUES (642, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `users` VALUES (643, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `users` VALUES (644, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `users` VALUES (645, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `users` VALUES (646, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `users` VALUES (647, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `users` VALUES (648, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `users` VALUES (649, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `users` VALUES (650, '2023-09-13 19:24:30', '2023-09-13 19:24:30', 1, NULL);
INSERT INTO `users` VALUES (651, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `users` VALUES (652, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `users` VALUES (653, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `users` VALUES (654, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `users` VALUES (655, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `users` VALUES (656, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `users` VALUES (657, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `users` VALUES (658, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `users` VALUES (659, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `users` VALUES (660, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `users` VALUES (661, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `users` VALUES (662, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `users` VALUES (663, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `users` VALUES (664, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `users` VALUES (665, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `users` VALUES (666, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `users` VALUES (667, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `users` VALUES (668, '2023-09-13 19:25:29', '2023-09-13 19:25:29', 1, NULL);
INSERT INTO `users` VALUES (669, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `users` VALUES (670, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `users` VALUES (671, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `users` VALUES (672, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `users` VALUES (673, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `users` VALUES (674, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `users` VALUES (675, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `users` VALUES (676, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `users` VALUES (677, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `users` VALUES (678, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `users` VALUES (679, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `users` VALUES (680, '2023-09-13 19:25:30', '2023-09-13 19:25:30', 1, NULL);
INSERT INTO `users` VALUES (681, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `users` VALUES (682, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `users` VALUES (683, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `users` VALUES (684, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `users` VALUES (685, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `users` VALUES (686, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `users` VALUES (687, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `users` VALUES (688, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `users` VALUES (689, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `users` VALUES (690, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `users` VALUES (691, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `users` VALUES (692, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `users` VALUES (693, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `users` VALUES (694, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `users` VALUES (695, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `users` VALUES (696, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `users` VALUES (697, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `users` VALUES (698, '2023-09-13 19:28:32', '2023-09-13 19:28:32', 1, NULL);
INSERT INTO `users` VALUES (699, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `users` VALUES (700, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `users` VALUES (701, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `users` VALUES (702, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `users` VALUES (703, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `users` VALUES (704, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `users` VALUES (705, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `users` VALUES (706, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `users` VALUES (707, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `users` VALUES (708, '2023-09-13 19:28:33', '2023-09-13 19:28:33', 1, NULL);
INSERT INTO `users` VALUES (709, '2023-09-13 19:29:38', '2023-09-13 19:29:38', 1, NULL);
INSERT INTO `users` VALUES (710, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (711, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (712, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (713, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (714, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (715, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (716, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (717, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (718, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (719, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (720, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (721, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (722, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (723, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (724, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (725, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (726, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (727, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (728, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (729, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (730, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (731, '2023-09-13 19:29:39', '2023-09-13 19:29:39', 1, NULL);
INSERT INTO `users` VALUES (732, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `users` VALUES (733, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `users` VALUES (734, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `users` VALUES (735, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `users` VALUES (736, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `users` VALUES (737, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `users` VALUES (738, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `users` VALUES (739, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `users` VALUES (740, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `users` VALUES (741, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `users` VALUES (742, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `users` VALUES (743, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `users` VALUES (744, '2023-09-13 19:29:40', '2023-09-13 19:29:40', 1, NULL);
INSERT INTO `users` VALUES (745, '2023-09-13 19:30:46', '2023-09-13 19:30:46', 1, NULL);
INSERT INTO `users` VALUES (746, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (747, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (748, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (749, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (750, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (751, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (752, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (753, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (754, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (755, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (756, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (757, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (758, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (759, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (760, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (761, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (762, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (763, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (764, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (765, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (766, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (767, '2023-09-13 19:30:47', '2023-09-13 19:30:47', 1, NULL);
INSERT INTO `users` VALUES (768, '2023-09-13 19:30:48', '2023-09-13 19:30:48', 1, NULL);
INSERT INTO `users` VALUES (769, '2023-09-13 19:30:48', '2023-09-13 19:30:48', 1, NULL);
INSERT INTO `users` VALUES (770, '2023-09-13 19:30:48', '2023-09-13 19:30:48', 1, NULL);
INSERT INTO `users` VALUES (771, '2023-09-13 19:30:48', '2023-09-13 19:30:48', 1, NULL);
INSERT INTO `users` VALUES (772, '2023-09-13 19:30:48', '2023-09-13 19:30:48', 1, NULL);
INSERT INTO `users` VALUES (773, '2023-09-13 19:30:48', '2023-09-13 19:30:48', 1, NULL);
INSERT INTO `users` VALUES (774, '2023-09-13 19:30:48', '2023-09-13 19:30:48', 1, NULL);
INSERT INTO `users` VALUES (775, '2023-09-13 19:30:48', '2023-09-13 19:30:48', 1, NULL);
INSERT INTO `users` VALUES (776, '2023-09-13 19:30:48', '2023-09-13 19:30:48', 1, NULL);
INSERT INTO `users` VALUES (777, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `users` VALUES (778, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `users` VALUES (779, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `users` VALUES (780, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `users` VALUES (781, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `users` VALUES (782, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `users` VALUES (783, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `users` VALUES (784, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `users` VALUES (785, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `users` VALUES (786, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `users` VALUES (787, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `users` VALUES (788, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `users` VALUES (789, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `users` VALUES (790, '2023-09-13 19:31:52', '2023-09-13 19:31:52', 1, NULL);
INSERT INTO `users` VALUES (791, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `users` VALUES (792, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `users` VALUES (793, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `users` VALUES (794, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `users` VALUES (795, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `users` VALUES (796, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `users` VALUES (797, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `users` VALUES (798, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `users` VALUES (799, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `users` VALUES (800, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `users` VALUES (801, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `users` VALUES (802, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `users` VALUES (803, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `users` VALUES (804, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `users` VALUES (805, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `users` VALUES (806, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `users` VALUES (807, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `users` VALUES (808, '2023-09-13 19:31:53', '2023-09-13 19:31:53', 1, NULL);
INSERT INTO `users` VALUES (809, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `users` VALUES (810, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `users` VALUES (811, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `users` VALUES (812, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `users` VALUES (813, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `users` VALUES (814, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `users` VALUES (815, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `users` VALUES (816, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `users` VALUES (817, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `users` VALUES (818, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `users` VALUES (819, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `users` VALUES (820, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `users` VALUES (821, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `users` VALUES (822, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `users` VALUES (823, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `users` VALUES (824, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `users` VALUES (825, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `users` VALUES (826, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `users` VALUES (827, '2023-09-13 19:32:57', '2023-09-13 19:32:57', 1, NULL);
INSERT INTO `users` VALUES (828, '2023-09-13 19:32:58', '2023-09-13 19:32:58', 1, NULL);
INSERT INTO `users` VALUES (829, '2023-09-13 19:32:58', '2023-09-13 19:32:58', 1, NULL);
INSERT INTO `users` VALUES (830, '2023-09-13 19:32:58', '2023-09-13 19:32:58', 1, NULL);
INSERT INTO `users` VALUES (831, '2023-09-13 19:32:58', '2023-09-13 19:32:58', 1, NULL);
INSERT INTO `users` VALUES (832, '2023-09-13 19:32:58', '2023-09-13 19:32:58', 1, NULL);
INSERT INTO `users` VALUES (833, '2023-09-13 19:32:58', '2023-09-13 19:32:58', 1, NULL);
INSERT INTO `users` VALUES (834, '2023-09-13 19:32:58', '2023-09-13 19:32:58', 1, NULL);
INSERT INTO `users` VALUES (835, '2023-09-13 19:32:58', '2023-09-13 19:32:58', 1, NULL);
INSERT INTO `users` VALUES (836, '2023-09-13 19:32:58', '2023-09-13 19:32:58', 1, NULL);
INSERT INTO `users` VALUES (837, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `users` VALUES (838, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `users` VALUES (839, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `users` VALUES (840, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `users` VALUES (841, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `users` VALUES (842, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `users` VALUES (843, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `users` VALUES (844, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `users` VALUES (845, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `users` VALUES (846, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `users` VALUES (847, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `users` VALUES (848, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `users` VALUES (849, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `users` VALUES (850, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `users` VALUES (851, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `users` VALUES (852, '2023-09-13 19:35:03', '2023-09-13 19:35:03', 1, NULL);
INSERT INTO `users` VALUES (853, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (854, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (855, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (856, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (857, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (858, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (859, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (860, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (861, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (862, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (863, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (864, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (865, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (866, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (867, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (868, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (869, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (870, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (871, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (872, '2023-09-13 19:35:04', '2023-09-13 19:35:04', 1, NULL);
INSERT INTO `users` VALUES (873, '2023-09-13 19:36:08', '2023-09-13 19:36:08', 1, NULL);
INSERT INTO `users` VALUES (874, '2023-09-13 19:36:08', '2023-09-13 19:36:08', 1, NULL);
INSERT INTO `users` VALUES (875, '2023-09-13 19:36:08', '2023-09-13 19:36:08', 1, NULL);
INSERT INTO `users` VALUES (876, '2023-09-13 19:36:08', '2023-09-13 19:36:08', 1, NULL);
INSERT INTO `users` VALUES (877, '2023-09-13 19:36:08', '2023-09-13 19:36:08', 1, NULL);
INSERT INTO `users` VALUES (878, '2023-09-13 19:36:08', '2023-09-13 19:36:08', 1, NULL);
INSERT INTO `users` VALUES (879, '2023-09-13 19:36:08', '2023-09-13 19:36:08', 1, NULL);
INSERT INTO `users` VALUES (880, '2023-09-13 19:36:08', '2023-09-13 19:36:08', 1, NULL);
INSERT INTO `users` VALUES (881, '2023-09-13 19:36:08', '2023-09-13 19:36:08', 1, NULL);
INSERT INTO `users` VALUES (882, '2023-09-13 19:36:08', '2023-09-13 19:36:08', 1, NULL);
INSERT INTO `users` VALUES (883, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `users` VALUES (884, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `users` VALUES (885, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `users` VALUES (886, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `users` VALUES (887, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `users` VALUES (888, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `users` VALUES (889, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `users` VALUES (890, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `users` VALUES (891, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `users` VALUES (892, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `users` VALUES (893, '2023-09-13 19:36:09', '2023-09-13 19:36:09', 1, NULL);
INSERT INTO `users` VALUES (894, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `users` VALUES (895, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `users` VALUES (896, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `users` VALUES (897, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `users` VALUES (898, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `users` VALUES (899, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `users` VALUES (900, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `users` VALUES (901, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `users` VALUES (902, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `users` VALUES (903, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `users` VALUES (904, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `users` VALUES (905, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `users` VALUES (906, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `users` VALUES (907, '2023-09-13 19:37:17', '2023-09-13 19:37:17', 1, NULL);
INSERT INTO `users` VALUES (908, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `users` VALUES (909, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `users` VALUES (910, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `users` VALUES (911, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `users` VALUES (912, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `users` VALUES (913, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `users` VALUES (914, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `users` VALUES (915, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `users` VALUES (916, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `users` VALUES (917, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `users` VALUES (918, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `users` VALUES (919, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `users` VALUES (920, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `users` VALUES (921, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `users` VALUES (922, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `users` VALUES (923, '2023-09-13 19:37:18', '2023-09-13 19:37:18', 1, NULL);
INSERT INTO `users` VALUES (924, '2023-09-13 19:38:26', '2023-09-13 19:38:26', 1, NULL);
INSERT INTO `users` VALUES (925, '2023-09-13 19:38:26', '2023-09-13 19:38:26', 1, NULL);
INSERT INTO `users` VALUES (926, '2023-09-13 19:38:26', '2023-09-13 19:38:26', 1, NULL);
INSERT INTO `users` VALUES (927, '2023-09-13 19:38:26', '2023-09-13 19:38:26', 1, NULL);
INSERT INTO `users` VALUES (928, '2023-09-13 19:38:26', '2023-09-13 19:38:26', 1, NULL);
INSERT INTO `users` VALUES (929, '2023-09-13 19:38:26', '2023-09-13 19:38:26', 1, NULL);
INSERT INTO `users` VALUES (930, '2023-09-13 19:38:26', '2023-09-13 19:38:26', 1, NULL);
INSERT INTO `users` VALUES (931, '2023-09-13 19:38:26', '2023-09-13 19:38:26', 1, NULL);
INSERT INTO `users` VALUES (932, '2023-09-13 19:38:26', '2023-09-13 19:38:26', 1, NULL);
INSERT INTO `users` VALUES (933, '2023-09-13 19:38:26', '2023-09-13 19:38:26', 1, NULL);
INSERT INTO `users` VALUES (934, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (935, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (936, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (937, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (938, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (939, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (940, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (941, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (942, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (943, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (944, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (945, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (946, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (947, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (948, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (949, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (950, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (951, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (952, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (953, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (954, '2023-09-13 19:38:27', '2023-09-13 19:38:27', 1, NULL);
INSERT INTO `users` VALUES (955, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `users` VALUES (956, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `users` VALUES (957, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `users` VALUES (958, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `users` VALUES (959, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `users` VALUES (960, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `users` VALUES (961, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `users` VALUES (962, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `users` VALUES (963, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `users` VALUES (964, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `users` VALUES (965, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `users` VALUES (966, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `users` VALUES (967, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `users` VALUES (968, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `users` VALUES (969, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `users` VALUES (970, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `users` VALUES (971, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `users` VALUES (972, '2023-09-13 19:39:42', '2023-09-13 19:39:42', 1, NULL);
INSERT INTO `users` VALUES (973, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `users` VALUES (974, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `users` VALUES (975, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `users` VALUES (976, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `users` VALUES (977, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `users` VALUES (978, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `users` VALUES (979, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `users` VALUES (980, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `users` VALUES (981, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `users` VALUES (982, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `users` VALUES (983, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `users` VALUES (984, '2023-09-13 19:39:43', '2023-09-13 19:39:43', 1, NULL);
INSERT INTO `users` VALUES (985, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `users` VALUES (986, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `users` VALUES (987, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `users` VALUES (988, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `users` VALUES (989, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `users` VALUES (990, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `users` VALUES (991, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `users` VALUES (992, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `users` VALUES (993, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `users` VALUES (994, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `users` VALUES (995, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `users` VALUES (996, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `users` VALUES (997, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `users` VALUES (998, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `users` VALUES (999, '2023-09-13 19:40:55', '2023-09-13 19:40:55', 1, NULL);
INSERT INTO `users` VALUES (1000, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `users` VALUES (1001, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `users` VALUES (1002, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `users` VALUES (1003, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `users` VALUES (1004, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `users` VALUES (1005, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `users` VALUES (1006, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `users` VALUES (1007, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `users` VALUES (1008, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `users` VALUES (1009, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `users` VALUES (1010, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `users` VALUES (1011, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `users` VALUES (1012, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `users` VALUES (1013, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `users` VALUES (1014, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `users` VALUES (1015, '2023-09-13 19:40:56', '2023-09-13 19:40:56', 1, NULL);
INSERT INTO `users` VALUES (1016, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `users` VALUES (1017, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `users` VALUES (1018, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `users` VALUES (1019, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `users` VALUES (1020, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `users` VALUES (1021, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `users` VALUES (1022, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `users` VALUES (1023, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `users` VALUES (1024, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `users` VALUES (1025, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `users` VALUES (1026, '2023-09-13 19:41:49', '2023-09-13 19:41:49', 1, NULL);
INSERT INTO `users` VALUES (1027, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `users` VALUES (1028, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `users` VALUES (1029, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `users` VALUES (1030, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `users` VALUES (1031, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `users` VALUES (1032, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `users` VALUES (1033, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `users` VALUES (1034, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `users` VALUES (1035, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `users` VALUES (1036, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `users` VALUES (1037, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `users` VALUES (1038, '2023-09-13 19:41:50', '2023-09-13 19:41:50', 1, NULL);
INSERT INTO `users` VALUES (1039, '2023-09-13 19:42:54', '2023-09-13 19:42:54', 1, NULL);
INSERT INTO `users` VALUES (1040, '2023-09-13 19:42:54', '2023-09-13 19:42:54', 1, NULL);
INSERT INTO `users` VALUES (1041, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1042, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1043, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1044, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1045, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1046, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1047, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1048, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1049, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1050, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1051, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1052, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1053, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1054, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1055, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1056, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1057, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1058, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1059, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1060, '2023-09-13 19:42:55', '2023-09-13 19:42:55', 1, NULL);
INSERT INTO `users` VALUES (1061, '2023-09-13 19:44:02', '2023-09-13 19:44:02', 1, NULL);
INSERT INTO `users` VALUES (1062, '2023-09-13 19:44:02', '2023-09-13 19:44:02', 1, NULL);
INSERT INTO `users` VALUES (1063, '2023-09-13 19:44:02', '2023-09-13 19:44:02', 1, NULL);
INSERT INTO `users` VALUES (1064, '2023-09-13 19:44:02', '2023-09-13 19:44:02', 1, NULL);
INSERT INTO `users` VALUES (1065, '2023-09-13 19:44:02', '2023-09-13 19:44:02', 1, NULL);
INSERT INTO `users` VALUES (1066, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `users` VALUES (1067, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `users` VALUES (1068, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `users` VALUES (1069, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `users` VALUES (1070, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `users` VALUES (1071, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `users` VALUES (1072, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `users` VALUES (1073, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `users` VALUES (1074, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `users` VALUES (1075, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `users` VALUES (1076, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `users` VALUES (1077, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `users` VALUES (1078, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `users` VALUES (1079, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `users` VALUES (1080, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `users` VALUES (1081, '2023-09-13 19:44:03', '2023-09-13 19:44:03', 1, NULL);
INSERT INTO `users` VALUES (1082, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `users` VALUES (1083, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `users` VALUES (1084, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `users` VALUES (1085, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `users` VALUES (1086, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `users` VALUES (1087, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `users` VALUES (1088, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `users` VALUES (1089, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `users` VALUES (1090, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `users` VALUES (1091, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `users` VALUES (1092, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `users` VALUES (1093, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `users` VALUES (1094, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `users` VALUES (1095, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `users` VALUES (1096, '2023-09-13 19:44:56', '2023-09-13 19:44:56', 1, NULL);
INSERT INTO `users` VALUES (1097, '2023-09-13 19:44:57', '2023-09-13 19:44:57', 1, NULL);
INSERT INTO `users` VALUES (1098, '2023-09-13 19:44:57', '2023-09-13 19:44:57', 1, NULL);
INSERT INTO `users` VALUES (1099, '2023-09-13 19:44:57', '2023-09-13 19:44:57', 1, NULL);
INSERT INTO `users` VALUES (1100, '2023-09-13 19:44:57', '2023-09-13 19:44:57', 1, NULL);
INSERT INTO `users` VALUES (1101, '2023-09-13 19:44:57', '2023-09-13 19:44:57', 1, NULL);
INSERT INTO `users` VALUES (1102, '2023-09-13 19:44:57', '2023-09-13 19:44:57', 1, NULL);
INSERT INTO `users` VALUES (1103, '2023-09-13 19:45:46', '2023-09-13 19:45:46', 1, NULL);
INSERT INTO `users` VALUES (1104, '2023-09-13 19:45:46', '2023-09-13 19:45:46', 1, NULL);
INSERT INTO `users` VALUES (1105, '2023-09-13 19:45:46', '2023-09-13 19:45:46', 1, NULL);
INSERT INTO `users` VALUES (1106, '2023-09-13 19:45:46', '2023-09-13 19:45:46', 1, NULL);
INSERT INTO `users` VALUES (1107, '2023-09-13 19:45:46', '2023-09-13 19:45:46', 1, NULL);
INSERT INTO `users` VALUES (1108, '2023-09-13 19:45:46', '2023-09-13 19:45:46', 1, NULL);
INSERT INTO `users` VALUES (1109, '2023-09-13 19:45:46', '2023-09-13 19:45:46', 1, NULL);
INSERT INTO `users` VALUES (1110, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1111, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1112, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1113, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1114, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1115, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1116, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1117, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1118, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1119, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1120, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1121, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1122, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1123, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1124, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1125, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1126, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1127, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1128, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1129, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1130, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1131, '2023-09-13 19:45:47', '2023-09-13 19:45:47', 1, NULL);
INSERT INTO `users` VALUES (1132, '2023-09-13 19:45:48', '2023-09-13 19:45:48', 1, NULL);
INSERT INTO `users` VALUES (1133, '2023-09-13 19:46:52', '2023-09-13 19:46:52', 1, NULL);
INSERT INTO `users` VALUES (1134, '2023-09-13 19:46:52', '2023-09-13 19:46:52', 1, NULL);
INSERT INTO `users` VALUES (1135, '2023-09-13 19:46:52', '2023-09-13 19:46:52', 1, NULL);
INSERT INTO `users` VALUES (1136, '2023-09-13 19:46:52', '2023-09-13 19:46:52', 1, NULL);
INSERT INTO `users` VALUES (1137, '2023-09-13 19:46:52', '2023-09-13 19:46:52', 1, NULL);
INSERT INTO `users` VALUES (1138, '2023-09-13 19:46:52', '2023-09-13 19:46:52', 1, NULL);
INSERT INTO `users` VALUES (1139, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1140, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1141, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1142, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1143, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1144, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1145, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1146, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1147, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1148, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1149, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1150, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1151, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1152, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1153, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1154, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1155, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1156, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1157, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1158, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1159, '2023-09-13 19:46:53', '2023-09-13 19:46:53', 1, NULL);
INSERT INTO `users` VALUES (1160, '2023-09-13 19:46:54', '2023-09-13 19:46:54', 1, NULL);
INSERT INTO `users` VALUES (1161, '2023-09-13 19:46:54', '2023-09-13 19:46:54', 1, NULL);
INSERT INTO `users` VALUES (1162, '2023-09-13 19:46:54', '2023-09-13 19:46:54', 1, NULL);
INSERT INTO `users` VALUES (1163, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `users` VALUES (1164, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `users` VALUES (1165, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `users` VALUES (1166, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `users` VALUES (1167, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `users` VALUES (1168, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `users` VALUES (1169, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `users` VALUES (1170, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `users` VALUES (1171, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `users` VALUES (1172, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `users` VALUES (1173, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `users` VALUES (1174, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `users` VALUES (1175, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `users` VALUES (1176, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `users` VALUES (1177, '2023-09-13 19:47:47', '2023-09-13 19:47:47', 1, NULL);
INSERT INTO `users` VALUES (1178, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `users` VALUES (1179, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `users` VALUES (1180, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `users` VALUES (1181, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `users` VALUES (1182, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `users` VALUES (1183, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `users` VALUES (1184, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `users` VALUES (1185, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `users` VALUES (1186, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `users` VALUES (1187, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `users` VALUES (1188, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `users` VALUES (1189, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `users` VALUES (1190, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `users` VALUES (1191, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `users` VALUES (1192, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `users` VALUES (1193, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `users` VALUES (1194, '2023-09-13 19:47:48', '2023-09-13 19:47:48', 1, NULL);
INSERT INTO `users` VALUES (1195, '2023-09-13 19:48:52', '2023-09-13 19:48:52', 1, NULL);
INSERT INTO `users` VALUES (1196, '2023-09-13 19:48:52', '2023-09-13 19:48:52', 1, NULL);
INSERT INTO `users` VALUES (1197, '2023-09-13 19:48:52', '2023-09-13 19:48:52', 1, NULL);
INSERT INTO `users` VALUES (1198, '2023-09-13 19:48:52', '2023-09-13 19:48:52', 1, NULL);
INSERT INTO `users` VALUES (1199, '2023-09-13 19:48:52', '2023-09-13 19:48:52', 1, NULL);
INSERT INTO `users` VALUES (1200, '2023-09-13 19:48:52', '2023-09-13 19:48:52', 1, NULL);
INSERT INTO `users` VALUES (1201, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1202, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1203, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1204, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1205, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1206, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1207, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1208, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1209, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1210, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1211, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1212, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1213, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1214, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1215, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1216, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1217, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1218, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1219, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1220, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1221, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1222, '2023-09-13 19:48:53', '2023-09-13 19:48:53', 1, NULL);
INSERT INTO `users` VALUES (1223, '2023-09-13 19:48:54', '2023-09-13 19:48:54', 1, NULL);
INSERT INTO `users` VALUES (1224, '2023-09-13 19:49:52', '2023-09-13 19:49:52', 1, NULL);
INSERT INTO `users` VALUES (1225, '2023-09-13 19:49:52', '2023-09-13 19:49:52', 1, NULL);
INSERT INTO `users` VALUES (1226, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1227, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1228, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1229, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1230, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1231, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1232, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1233, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1234, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1235, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1236, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1237, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1238, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1239, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1240, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1241, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1242, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1243, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1244, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1245, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1246, '2023-09-13 19:49:53', '2023-09-13 19:49:53', 1, NULL);
INSERT INTO `users` VALUES (1247, '2023-09-13 19:49:54', '2023-09-13 19:49:54', 1, NULL);
INSERT INTO `users` VALUES (1248, '2023-09-13 19:49:54', '2023-09-13 19:49:54', 1, NULL);
INSERT INTO `users` VALUES (1249, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1250, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1251, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1252, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1253, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1254, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1255, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1256, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1257, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1258, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1259, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1260, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1261, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1262, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1263, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1264, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1265, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1266, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1267, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1268, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1269, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1270, '2023-09-13 19:50:49', '2023-09-13 19:50:49', 1, NULL);
INSERT INTO `users` VALUES (1271, '2023-09-13 19:50:50', '2023-09-13 19:50:50', 1, NULL);
INSERT INTO `users` VALUES (1272, '2023-09-13 19:50:50', '2023-09-13 19:50:50', 1, NULL);
INSERT INTO `users` VALUES (1273, '2023-09-13 19:51:56', '2023-09-13 19:51:56', 1, NULL);
INSERT INTO `users` VALUES (1274, '2023-09-13 19:51:56', '2023-09-13 19:51:56', 1, NULL);
INSERT INTO `users` VALUES (1275, '2023-09-13 19:51:56', '2023-09-13 19:51:56', 1, NULL);
INSERT INTO `users` VALUES (1276, '2023-09-13 19:51:56', '2023-09-13 19:51:56', 1, NULL);
INSERT INTO `users` VALUES (1277, '2023-09-13 19:51:56', '2023-09-13 19:51:56', 1, NULL);
INSERT INTO `users` VALUES (1278, '2023-09-13 19:51:56', '2023-09-13 19:51:56', 1, NULL);
INSERT INTO `users` VALUES (1279, '2023-09-13 19:51:56', '2023-09-13 19:51:56', 1, NULL);
INSERT INTO `users` VALUES (1280, '2023-09-13 19:51:56', '2023-09-13 19:51:56', 1, NULL);
INSERT INTO `users` VALUES (1281, '2023-09-13 19:51:56', '2023-09-13 19:51:56', 1, NULL);
INSERT INTO `users` VALUES (1282, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `users` VALUES (1283, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `users` VALUES (1284, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `users` VALUES (1285, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `users` VALUES (1286, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `users` VALUES (1287, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `users` VALUES (1288, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `users` VALUES (1289, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `users` VALUES (1290, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `users` VALUES (1291, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `users` VALUES (1292, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `users` VALUES (1293, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `users` VALUES (1294, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);
INSERT INTO `users` VALUES (1295, '2023-09-13 19:51:57', '2023-09-13 19:51:57', 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wali_kelas
-- ----------------------------
INSERT INTO `wali_kelas` VALUES (1, 1, 1, 1, 5, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (2, 1, 1, 2, 48, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (3, 1, 2, 3, 14, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (4, 1, 2, 4, 57, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (5, 1, 3, 5, 58, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (6, 1, 4, 6, 63, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (7, 1, 4, 7, 65, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (8, 1, 5, 8, 42, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (9, 1, 5, 9, 21, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (10, 1, 6, 10, 71, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (11, 1, 6, 11, 28, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (12, 1, 7, 12, 9, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (13, 1, 8, 14, 17, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (14, 2, 1, 1, 47, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (15, 2, 1, 2, 22, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (16, 2, 2, 3, 55, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (17, 2, 2, 4, 6, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (18, 2, 3, 5, 60, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (19, 2, 4, 6, 12, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (20, 2, 4, 7, 33, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (21, 2, 5, 8, 77, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (22, 2, 5, 9, 80, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (23, 2, 6, 10, 36, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (24, 2, 6, 11, 8, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (25, 2, 7, 12, 25, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (26, 2, 8, 14, 84, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (27, 3, 9, 15, 49, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (28, 3, 9, 16, 35, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (29, 3, 10, 17, 34, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (30, 3, 10, 18, 51, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (31, 3, 11, 19, 54, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (32, 3, 11, 20, 56, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (33, 3, 12, 21, 64, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (34, 3, 12, 22, 62, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (35, 3, 5, 8, 79, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (36, 3, 5, 9, 15, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (37, 3, 13, 23, 69, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (38, 3, 13, 24, 70, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (39, 3, 7, 12, 73, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (40, 3, 7, 13, 24, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);
INSERT INTO `wali_kelas` VALUES (41, 3, 8, 14, 83, 1, 1, '2023-09-13 08:11:09', '2023-09-13 08:11:09', 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
