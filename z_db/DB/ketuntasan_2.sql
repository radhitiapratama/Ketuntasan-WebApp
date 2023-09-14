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

 Date: 13/09/2023 13:15:52
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `guru` VALUES (74, 75, 'iqbalroni122', 'Muchammad Iqbal Roni Saputra', '$2y$10$ZuVTglDb0GY6WNAo6VdhKO4EmmmJK1zpH6VJOyziITNV3jzfrr9cS', 2, 74, 1, '2023-09-12 21:03:13', '2023-09-13 13:12:57', 1, NULL);
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kelas_mapel
-- ----------------------------
INSERT INTO `kelas_mapel` VALUES (1, 3, 7, 12, 145, 1, 1, '2023-09-13 13:12:22', '2023-09-13 13:12:22', 1, NULL);
INSERT INTO `kelas_mapel` VALUES (2, 3, 7, 12, 48, 1, 1, '2023-09-13 13:12:22', '2023-09-13 13:12:22', 1, NULL);
INSERT INTO `kelas_mapel` VALUES (3, 3, 7, 12, 49, 1, 1, '2023-09-13 13:12:22', '2023-09-13 13:12:22', 1, NULL);
INSERT INTO `kelas_mapel` VALUES (4, 3, 7, 12, 29, 1, 1, '2023-09-13 13:12:22', '2023-09-13 13:12:22', 1, NULL);
INSERT INTO `kelas_mapel` VALUES (5, 3, 7, 12, 146, 1, 1, '2023-09-13 13:12:22', '2023-09-13 13:12:22', 1, NULL);
INSERT INTO `kelas_mapel` VALUES (6, 3, 7, 12, 139, 1, 1, '2023-09-13 13:12:22', '2023-09-13 13:12:22', 1, NULL);
INSERT INTO `kelas_mapel` VALUES (7, 3, 7, 12, 8, 1, 1, '2023-09-13 13:12:22', '2023-09-13 13:12:22', 1, NULL);
INSERT INTO `kelas_mapel` VALUES (8, 3, 7, 12, 12, 1, 1, '2023-09-13 13:12:22', '2023-09-13 13:12:22', 1, NULL);
INSERT INTO `kelas_mapel` VALUES (9, 3, 7, 12, 3, 1, 1, '2023-09-13 13:12:22', '2023-09-13 13:12:22', 1, NULL);
INSERT INTO `kelas_mapel` VALUES (10, 3, 7, 12, 138, 1, 1, '2023-09-13 13:12:22', '2023-09-13 13:12:22', 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 166 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of siswa
-- ----------------------------
INSERT INTO `siswa` VALUES (1, 93, 'adityafirmansyah847', 'ADITYA FIRMANSYAH', '$2y$10$LCtNoQqGsr4K6DSA7h0e0.Xh9CaL9AT7lxC0ULijUkL/xN1USIVH2', 1, 1, 1, 3, 1, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `siswa` VALUES (2, 94, 'alinizzantikadewi324', 'ALIN IZZANTIKA DEWI', '$2y$10$sj5aGiKfo.8Uq4bqJR4xkO.Z2ZrXlx3hyzvaWUu8htmuXehqvz4gG', 1, 1, 1, 3, 1, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `siswa` VALUES (3, 95, 'ameliaartalitaputri605', 'AMELIA ARTALITA PUTRI', '$2y$10$4lySf2YGyt6.RytG734oI.i32x0vU.fQfBodrumy10pHOT2f3Sx0a', 1, 1, 1, 3, 1, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `siswa` VALUES (4, 96, 'ameliarosidi590', 'AMELIA ROSIDI', '$2y$10$Uco8Xb/F72Sugmklyp10rOnaNqw87FecytEGQ//Oz.iWvmYnPIyBu', 1, 1, 1, 3, 1, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `siswa` VALUES (5, 97, 'anindyacantikakusumadewi8710', 'ANINDYA CANTIKA KUSUMA DEWI', '$2y$10$SAC4DmSMp30umx1XT9Ar9eQlZktt5iBiYlHcQmfJySk62Sjh/altu', 1, 1, 1, 3, 1, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `siswa` VALUES (6, 98, 'azoravarodisilafifah319', 'AZORA VARODISIL AFIFAH', '$2y$10$hLmsYoxFHqiLoxPkrTR5teVmhMOwQeRLYP0p7cIlld/M.Ml9SyBPy', 1, 1, 1, 3, 1, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `siswa` VALUES (7, 99, 'cyndifatiharizki408', 'CYNDI FATIHA RIZKI', '$2y$10$glg.x1EK8qFlBEsFsS8Y9.FZ9hMrw8BHypUL5F1WnjjUp7IiaeARO', 1, 1, 1, 3, 1, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `siswa` VALUES (8, 100, 'dewianggunparamitha645', 'DEWI ANGGUN PARAMITHA', '$2y$10$Krlea/JiaXdLAgrVqG2gIOJz4.2iHDLJHHDmJjb1OB.QiAFtjNI9y', 1, 1, 1, 3, 1, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `siswa` VALUES (9, 101, 'dwicahyaramadhan775', 'DWI CAHYA RAMADHAN', '$2y$10$27L2YXoN8ei.XrGx2q32.Onjv0ghqo4r3QXVanrIlUk.zsIdYYAwq', 1, 1, 1, 3, 1, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `siswa` VALUES (10, 102, 'ekanurulistiqomah562', 'EKA NURUL ISTIQOMAH', '$2y$10$ZQcv3AGdHXbb.CtMdDtMJ.x2rhdXf/XH45Nexk4NDf20UkhQRUn3a', 1, 1, 1, 3, 1, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `siswa` VALUES (11, 103, 'fransiskanadiaananda240', 'FRANSISKA NADIA ANANDA', '$2y$10$GqkLHpTpBxhyRSg8dKxWPO8ziwQedDdNZ4h7P7tHazBbly2ZQnXym', 1, 1, 1, 3, 1, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `siswa` VALUES (12, 104, 'hairulumam3210', 'HAIRUL UMAM', '$2y$10$vrzElM7/SPFSGo94L8gIG.E9tg6ZeUwjFBc9eQz1E0nyZsRDmgDLG', 1, 1, 1, 3, 1, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `siswa` VALUES (13, 105, 'kalinggaalodiakhairani543', 'KALINGGA ALODIA KHAIRANI', '$2y$10$XH.qjmyKT6Ml7sP9gqwSS.ZxmKGeIsCbc667Wde9UhIJ9ao4wJmeu', 1, 1, 1, 3, 1, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `siswa` VALUES (14, 106, 'keziadyramalvania250', 'KEZIA DYRA MALVANIA', '$2y$10$8sx8nXHAL9R.d74C5muR9OF7ElqcEApxjEWBZ4sKlLSt1hw9gU6RG', 1, 1, 1, 3, 1, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `siswa` VALUES (15, 107, 'khaulahrizkiarini179', 'KHAULAH RIZKI ARINI', '$2y$10$9cUn3xMssOyt7GbuH/9QXObj5TENCJn7rhxtoK.SGSaFJCcJKWfB2', 1, 1, 1, 3, 1, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `siswa` VALUES (16, 108, 'lutfianaazizah526', 'LUTFIANA AZIZAH', '$2y$10$IZ8NG8paiVQIC4.kiBZMD.HJLrRihYCf1ifJg3purf7UahM.q.ooW', 1, 1, 1, 3, 1, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `siswa` VALUES (17, 109, 'malikaemaelysia3210', 'MALIKA EMA ELYSIA', '$2y$10$tqDylo7K/M4QBGA244LZKuK6iuKLe7SN/KzgWEHp1rlomGTG.kHAO', 1, 1, 1, 3, 1, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `siswa` VALUES (18, 110, 'maulidinaaprilia574', 'MAULIDINA APRILIA', '$2y$10$IJHPMY/ELgokbfrDMtEr.OORQ8iEet0W5YeGidwF8wDuj6XsPxWpy', 1, 1, 1, 3, 1, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `siswa` VALUES (19, 111, 'muhammadzainalabdihusni450', 'MUHAMMAD ZAINAL ABDI HUSNI', '$2y$10$gkMTHaN2dp5KCSWsicID5u0HxL3VaTcVMDqVWQL8wftqfz8dMfDHi', 1, 1, 1, 3, 1, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `siswa` VALUES (20, 112, 'nabilaekasaphira736', 'NABILA EKA SAPHIRA', '$2y$10$7wmruj1gGVE00xZ..5U64ObFGMcHgYrZeYiqV1pR4YVgqSgsN8dyK', 1, 1, 1, 3, 1, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `siswa` VALUES (21, 113, 'novayuniaanggrainie399', 'NOVA YUNIA ANGGRAINIE', '$2y$10$mb1LiY4nbAQ0MseuWaKYj.dIrqpNuXzBhWpojNognN1Bhf4lXLDmS', 1, 1, 1, 3, 1, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `siswa` VALUES (22, 114, 'nurhasanah181', 'NUR HASANAH', '$2y$10$niUYNjbldOM1M4KPqt/xNuEvZVfs4.tOwtwXJOA0BhJe3iVs.ifZO', 1, 1, 1, 3, 1, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `siswa` VALUES (23, 115, 'ratihyuanitapermatasari315', 'RATIH YUANITA PERMATASARI', '$2y$10$R.QOo0OHVC6A43rppwmnlOg79PwO85/hvLrlpilaWBBA1FrBURYb2', 1, 1, 1, 3, 1, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `siswa` VALUES (24, 116, 'renoaditiyasaputra414', 'RENO ADITIYA SAPUTRA', '$2y$10$qmDRsgJlxJxvLYJNd5nGH.GniVDsFZEkAfMmumm1qLJlVprnzfFE6', 1, 1, 1, 3, 1, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `siswa` VALUES (25, 117, 'rikotriansaputra887', 'RIKO TRIAN SAPUTRA', '$2y$10$KgR3a63IMXb9SBlCOBaNaOYIMc70vQoffz0Ysmldt9VpfFJz5sRdW', 1, 1, 1, 3, 1, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `siswa` VALUES (26, 118, 'risyaadindaagustin946', 'RISYA ADINDA AGUSTIN', '$2y$10$y7soaSoaJ7r4mpkpdYtqA.bN05k5oTaY/Q0GhwemP8h.hGRf.FIkK', 1, 1, 1, 3, 1, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `siswa` VALUES (27, 119, 'seriltriwahyuni527', 'SERIL TRI WAHYUNI', '$2y$10$iF5iz.cTAyrUKb23Jx8OFe6Pgcm0UtVozARVnPZxK1vVWdKGMKPEC', 1, 1, 1, 3, 1, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `siswa` VALUES (28, 120, 'silvirawidayanti3510', 'SILVIRA WIDAYANTI', '$2y$10$82xYmjMrZxVozJ2JXejIs.raHo4.h1iEtFRWRC2rEMPtnPaIAmCEG', 1, 1, 1, 3, 1, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `siswa` VALUES (29, 121, 'sindinoveliaputri901', 'SINDI NOVELIA PUTRI', '$2y$10$YpySxhDSx9ZUgIVRnGkC9ecs2McATHbuLj/YPErl4izQgtVKF52Jy', 1, 1, 1, 3, 1, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `siswa` VALUES (30, 122, 'sitifarida515', 'SITI FARIDA', '$2y$10$d1yfCI71DcgciJFb5Z00xO9y80WtfYJ7emDPHLuvWwxS8UrXTzZze', 1, 1, 1, 3, 1, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `siswa` VALUES (31, 123, 'sitinursalsabila678', 'SITI NUR SALSABILA', '$2y$10$hjnNglEDBH6RejXQA4u3.u2Sg3TceaYSQaDvSWsP1fHSaRI1k0viO', 1, 1, 1, 3, 1, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `siswa` VALUES (32, 124, 'syahrinamaysasaabira9910', 'SYAHRINA MAYSA SAABIRA', '$2y$10$ILaUeBmiR2QzP/FtCDrR5ecB/zQC.cetYmVvch05xFDLNSGMaOPC6', 1, 1, 1, 3, 1, '2023-09-13 10:06:22', '2023-09-13 10:06:22', 1, NULL);
INSERT INTO `siswa` VALUES (33, 125, 'wiwinkurniasih8510', 'WIWIN KURNIASIH', '$2y$10$TuK6GZ1CDRr0ht2m77Ql/eRIloA2Ns9C8gucWuLXFkneyCP5JCDU2', 1, 1, 1, 3, 1, '2023-09-13 10:06:22', '2023-09-13 10:06:22', 1, NULL);
INSERT INTO `siswa` VALUES (34, 126, 'aidakurniarahmawati833', 'AIDA KURNIA RAHMAWATI', '$2y$10$k1Y5aT6AJEbSbZKTwoI1FeE2RW8PqYcsj3r1b.p.Jr6CAXjoUOSS2', 1, 1, 2, 3, 1, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `siswa` VALUES (35, 127, 'amandadinisaputri950', 'AMANDA DINI SAPUTRI', '$2y$10$ouzkei2xI9ehq8pJrTnCceI9wir31hT5HlBsOJzOAe.kfiq7WIwIS', 1, 1, 2, 3, 1, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `siswa` VALUES (36, 128, 'ameliarosdiananingsih969', 'AMELIA ROSDIANA NINGSIH', '$2y$10$BWyXa.iEJZNfI41dHDtBuOu8NVg9xR6wwLF8RY7sWrBuXnD6DbcpS', 1, 1, 2, 3, 1, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `siswa` VALUES (37, 129, 'andikapratamamaulanaismail740', 'ANDIKA PRATAMA MAULANA ISMAIL', '$2y$10$iK544iXDBrnF.OCyZhGeIe34A8nyM4H6CXSe29sQFJMEMnbYXPBV2', 1, 1, 2, 3, 1, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `siswa` VALUES (38, 130, 'anggiealifiakurnia879', 'ANGGIE ALIFIA KURNIA', '$2y$10$4UbYo8/FfRNpCUgeRzMcKO2EJ7TcSFGz3hg2t5dyLbHTHlQKXfXjC', 1, 1, 2, 3, 1, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `siswa` VALUES (39, 131, 'auliaandini230', 'AULIA ANDINI', '$2y$10$jz535j2f8w4Izu9VxHZQluj1WYIcrI1wOfYgpD6N15rqnINgtdvKK', 1, 1, 2, 3, 1, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `siswa` VALUES (40, 132, 'chelsiliadewiayukirana827', 'CHELSILIA DEWI AYU KIRANA', '$2y$10$506NI79ALlL/5vaXkU1bk.1i5yS8olWQziZidYnTS60KVQdzNRUcy', 1, 1, 2, 3, 1, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `siswa` VALUES (41, 133, 'delhicyetaargadyabrilyantine918', 'DELHICYETA ARGADYA BRILYANTINE', '$2y$10$8OvSbX1EfxvbFYn0yJtfq.a7BbITxksZfOCAa7ys71CVDq86TLopO', 1, 1, 2, 3, 1, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `siswa` VALUES (42, 134, 'dianafirdausiah567', 'DIANA FIRDAUSIAH', '$2y$10$4Q6GpxFVL0N7MymUZb6abeKsRQu1K9pCclI4ZznDpFDhctvVyw/WO', 1, 1, 2, 3, 1, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `siswa` VALUES (43, 135, 'fairuzsyifaragildewantari195', 'FAIRUZ SYIFA RAGIL DEWANTARI', '$2y$10$VTJj//F/ssi/ffwRnYNGW.OTNb4tSUBmFBwu37y.E2s5Jn4BF.n0S', 1, 1, 2, 3, 1, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `siswa` VALUES (44, 136, 'gatothendroprawiro599', 'GATOT HENDRO PRAWIRO', '$2y$10$4r08SK3M9HBrqiY8c4T1FOkyaHxQfm.iQAwyvXbL5CpWUOZWYSytO', 1, 1, 2, 3, 1, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `siswa` VALUES (45, 137, 'hilmahriski455', 'HILMAH RISKI', '$2y$10$boGvCMKJGj.J0j5JrLBfHe83hNga9nRV8xH4jV7YpYLP6tKR7IIVG', 1, 1, 2, 3, 1, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `siswa` VALUES (46, 138, 'keyshaputridaniela2210', 'KEYSHA PUTRI DANIELA', '$2y$10$pkN.z766XzTmamwq.VDnB.fvAZssTGzUNBnPc6uBnbAOG3uF3M7wy', 1, 1, 2, 3, 1, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `siswa` VALUES (47, 139, 'khairunnisak718', 'KHAIRUN NISAK', '$2y$10$H.m4bpqsnfMDeUi7yhomMOVGV4UVgxHBNAmYYoTFDwUSqOAYw9bFK', 1, 1, 2, 3, 1, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `siswa` VALUES (48, 140, 'latifahriskirahayu493', 'LATIFAH RISKI RAHAYU', '$2y$10$G46LSjGQxTCTz2oCjj1idedwMQyWW/SyjZBFK2GqzEnnw1TxsVtki', 1, 1, 2, 3, 1, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `siswa` VALUES (49, 141, 'maelizulfaturramadhanti292', 'MAELI ZULFATUR RAMADHANTI', '$2y$10$mgwtNkYthmP2csJfVTCgMOy72dnWQka9J8OpY3/eS7VkVeSEm99q6', 1, 1, 2, 3, 1, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `siswa` VALUES (50, 142, 'marlaoctaviola148', 'MARLA OCTA VIOLA', '$2y$10$NCXSnWd0GyAtM651q/tIlOmjI/nZ3L6Ht2bno7sQn64xjkRB3jPFS', 1, 1, 2, 3, 1, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `siswa` VALUES (51, 143, 'maulinaameliaputri305', 'MAULINA AMELIA PUTRI', '$2y$10$FumPu64.2s89GXx5HB5i5eL.fKzRXiVscz02oafJaOLyQganNhBkG', 1, 1, 2, 3, 1, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `siswa` VALUES (52, 144, 'muhammadadityawijaya279', 'MUHAMMAD ADITYA WIJAYA', '$2y$10$ogT9kXWt6apEsMWPFqEgJOr/6vbe.AGUCM9hRy8C5dy7Jz/JHjgoq', 1, 1, 2, 3, 1, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `siswa` VALUES (53, 145, 'nabilhusnulmurad300', 'NABIL HUSNUL MURAD', '$2y$10$Pi2UPjlCuD37lrDb3uzi2OBLU4aRX8D7I.eeEc6RnTgb3soKI6u7y', 1, 1, 2, 3, 1, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `siswa` VALUES (54, 146, 'natashazathifatulaini1002', 'NATASHA ZATHIFATUL AINI', '$2y$10$MzhZzS.7Oc8GAgXu5kOl.O1OrDsUgB9JcjXfitND909PeKxaxObby', 1, 1, 2, 3, 1, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `siswa` VALUES (55, 147, 'novitaayuwidyasanesty377', 'NOVITA AYU WIDYA SANESTY', '$2y$10$pBXW6bLw4jq75Dl3q.ZZ4u0oXhooLX5SYOOz9R6V30QRBJg7qE3Rm', 1, 1, 2, 3, 1, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `siswa` VALUES (56, 148, 'putrinovitasari931', 'PUTRI NOVITASARI', '$2y$10$wk33HVMf2xN2CkCeVRKew.VL4.1yzxGdS8AEQi1KpdxI3npV0CsI2', 1, 1, 2, 3, 1, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `siswa` VALUES (57, 149, 'rezaauliafebrianti309', 'REZA AULIA FEBRIANTI', '$2y$10$oiXlbVLwMA/t29StdeNU1OajetuXgqB6FQUsJUFekzP6l9syoABFO', 1, 1, 2, 3, 1, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `siswa` VALUES (58, 150, 'rhamadhanidwiriskygustiawan183', 'RHAMADHANI DWIRISKY GUSTIAWAN', '$2y$10$rjDHmDosiqvCLv/Nl8NjXekAgKWSsBJ/TJjwlTFXsMEjzvDzPfCYa', 1, 1, 2, 3, 1, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `siswa` VALUES (59, 151, 'sasykiranawidyaparamita918', 'SASY KIRANA WIDYAPARAMITA', '$2y$10$H.XQifb5FIoe8z57Gb/.1u6QpKa4eQSbrFzGq1gQF2fOeeWY0pZrW', 1, 1, 2, 3, 1, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `siswa` VALUES (60, 152, 'silviamaylaniputridewi722', 'SILVIA MAYLANI PUTRI DEWI', '$2y$10$b9p8ntVvGLqgk2dZJSWiMeLz6UeZuF3ZGiFc0ulEdlO8mn2cUz5VS', 1, 1, 2, 3, 1, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `siswa` VALUES (61, 153, 'silviyaocthaputrieffendhi718', 'SILVIYA OCTHA PUTRI EFFENDHI', '$2y$10$TXg.qphrCy0/z87M4aCOx.a7Gp45ffCHSx/ex4UZJ4E10m7Smzwp6', 1, 1, 2, 3, 1, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `siswa` VALUES (62, 154, 'sisiliaoktaria933', 'SISILIA OKTARIA', '$2y$10$81UPerpaih1ZcKKTLTqnie9tNsEnrbizYCcNlgsvWPyyTB/F2r52.', 1, 1, 2, 3, 1, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `siswa` VALUES (63, 155, 'sitiinaratuduja927', 'SITI INARATU DUJA', '$2y$10$PhY1kxaG1ME/mmE9zQBt8.wDAVRHNbBDxLjG3Q2DO14VXy5OxVD7m', 1, 1, 2, 3, 1, '2023-09-13 10:08:07', '2023-09-13 10:08:07', 1, NULL);
INSERT INTO `siswa` VALUES (64, 156, 'sittikarinasilfa893', 'SITTI KARINA SILFA', '$2y$10$TyqG2lY5YOBKfFil0Wq9/ebSQzSXsk6GqPbj2Lo55LdcfCVv7jfkW', 1, 1, 2, 3, 1, '2023-09-13 10:08:07', '2023-09-13 10:08:07', 1, NULL);
INSERT INTO `siswa` VALUES (65, 157, 'windadamaianti168', 'WINDA DAMAIANTI', '$2y$10$RhdqLgcf198o1KIk78WOb.BEdPB0ddDTCkHAV6gnxTHnaUxtwV1yu', 1, 1, 2, 3, 1, '2023-09-13 10:08:07', '2023-09-13 10:08:07', 1, NULL);
INSERT INTO `siswa` VALUES (66, 158, 'adindadwifebywidarto867', 'ADINDA DWI FEBY WIDARTO', '$2y$10$2kAIkwh/GO5/3Sf9I.GRrOLc24xNnzV5Cyz4zZ8JDsNY9JQnOhzeK', 1, 2, 3, 3, 1, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `siswa` VALUES (67, 159, 'ahmadridhosaputra659', 'AHMAD RIDHO SAPUTRA', '$2y$10$8eSo6FLwm398kkwgkeVADuwqD3gRZFvitk4LRQNqzgrXaRPbJ73TO', 1, 2, 3, 3, 1, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `siswa` VALUES (68, 160, 'aldakristin758', 'ALDA KRISTIN', '$2y$10$qAqjjLvGOkNJkNRplH9ciObT29cdy1FHrQgdkWsdd9lYYscBI7dOK', 1, 2, 3, 3, 1, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `siswa` VALUES (69, 161, 'anisaagustin100', 'ANISA AGUSTIN', '$2y$10$FeBDO/Ru2ox7gvxwXT5oNu7fdyXWsQBtDQWVv5BFXKXfmYZzIBs1a', 1, 2, 3, 3, 1, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `siswa` VALUES (70, 162, 'azizatunnabila629', 'AZIZATUN NABILA', '$2y$10$g7wipnkUJ5u9ImsRA6sdtO67y4PHXRUQqLx65kbPjT8/Rka.PfA2K', 1, 2, 3, 3, 1, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `siswa` VALUES (71, 163, 'chelsyaliciathimoty810', 'CHELSY ALICIA THIMOTY', '$2y$10$Nkty4/YyjyXcLfB5pg1Fae7BD1M9bdcdX9wltXu/VFw3BA.U125iW', 1, 2, 3, 3, 1, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `siswa` VALUES (72, 164, 'dewiayuveronica7910', 'DEWI AYU VERONICA', '$2y$10$hcWPNgPhZQZwxv32dCqTpeDaAuql.KXA7t50kjWDnQLiPi6oQtlPu', 1, 2, 3, 3, 1, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `siswa` VALUES (73, 165, 'dwiraniandini1008', 'DWI RANI ANDINI', '$2y$10$6oPAQhK1gLpV6m5WKskv8uo7BmhQLPbcW3SlpOq5mfx/0xRO1imAe', 1, 2, 3, 3, 1, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `siswa` VALUES (74, 166, 'gunawanferisusanto328', 'GUNAWAN FERI SUSANTO', '$2y$10$vh/x4vPSOPPVD3H9BV2azeJCs9VYboU0ooGALOEA/9iRb.yMtdBj2', 1, 2, 3, 3, 1, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `siswa` VALUES (75, 167, 'hairiaummah601', 'HAIRIA UMMAH', '$2y$10$3QsyufMgOwq18CvPlgzbvO2oDRNgonQdAEdHbz9b10JTm.wamUI1C', 1, 2, 3, 3, 1, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `siswa` VALUES (76, 168, 'huzaimahalifiaamrah440', 'HUZAIMAH ALIFIA AMRAH', '$2y$10$Khkl39W75OLv3fn3RaMFpeV3ub9alFNW7Gw/ZIhHWLKFfD3p3xnca', 1, 2, 3, 3, 1, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `siswa` VALUES (77, 169, 'jesicaselvianadewi140', 'JESICA SELVIANA DEWI', '$2y$10$0JeJNvhmEMrlKXt5kXGXSeUUEXGWgQZTWWKIjQDJnhSI6UqcdTv/2', 1, 2, 3, 3, 1, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `siswa` VALUES (78, 170, 'kharismaputrianggraini633', 'KHARISMA PUTRI ANGGRAINI', '$2y$10$LF5duMLRqub7dqveFbKUau6ZIJe/SrjNNgrikTJjUDaOkPgeak8c6', 1, 2, 3, 3, 1, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `siswa` VALUES (79, 171, 'mayadwiarisanty549', 'MAYA DWI ARISANTY', '$2y$10$b1GSad6zWi.v582EZwsfdeRWEMiWeHFUY.Z81kk4774W9vhMW5Qb.', 1, 2, 3, 3, 1, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `siswa` VALUES (80, 172, 'mohammadrafelianfirdaus743', 'MOHAMMAD RAFELIAN FIRDAUS', '$2y$10$Fda3jrSagSgif.cicCI46O1.v5fXi3o0e2TohyQh75BGNxsA30GTW', 1, 2, 3, 3, 1, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `siswa` VALUES (81, 173, 'muhammadardiansyahpratama585', 'MUHAMMAD ARDIANSYAH PRATAMA', '$2y$10$8iindYBUrDhbLvMfyBNkD.W6FV9OGF5L.GkfqupGuilC5v/pGVQ32', 1, 2, 3, 3, 1, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `siswa` VALUES (82, 174, 'muhammadifankhairulumam745', 'MUHAMMAD IFAN KHAIRUL UMAM', '$2y$10$drIr9FSJRSRBj3c2hIb8cOclRRZ8UMridrBGVxsGF5EJelvaefE66', 1, 2, 3, 3, 1, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `siswa` VALUES (83, 175, 'nadiaayupujiansyah180', 'NADIA AYU PUJIANSYAH', '$2y$10$b847y5IyeIE11yUt.oLbF.ZeLg6UAppLbzo4IqMOjU8b44CVYCjvy', 1, 2, 3, 3, 1, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `siswa` VALUES (84, 176, 'nadyacantikadamayanti174', 'NADYA CANTIKA DAMA YANTI', '$2y$10$.76gZsTG5ldKCXUMvOU8FOpy/VTWSW0Rdh4ISgVtvlVN80VwQXZRe', 1, 2, 3, 3, 1, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `siswa` VALUES (85, 177, 'najwafibriajannatiladni145', 'NAJWA FIBRIA JANNATIL ADNI', '$2y$10$HJ68D82vM2aPItqLuZkpqumWtKI4RcV5T.EXgPPnUpsYs/4vVP/u.', 1, 2, 3, 3, 1, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `siswa` VALUES (86, 178, 'nouraputriarilam183', 'NOURA PUTRI ARILAM', '$2y$10$zjTWc3jy3Irz3omgHvCojemDWyUjaDiT9sbI6V.qHDH4qTgne9r6m', 1, 2, 3, 3, 1, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `siswa` VALUES (87, 179, 'putriyofisalwaawlia642', 'PUTRI YOFI SALWA AWLIA', '$2y$10$BtadIVIXAzdmt6tqATlLN.VqUF.0IGMKyu2FH9g6olLBhNrU9A0lm', 1, 2, 3, 3, 1, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `siswa` VALUES (88, 180, 'rafisatussyarri567', 'RAFISATUS SYARRI', '$2y$10$tkg2qwFDbZearAewexyRNuoH7dt46IlpORsUdb9UoqD9PnTsD2Lxu', 1, 2, 3, 3, 1, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `siswa` VALUES (89, 181, 'raysaanindya555', 'RAYSA ANINDYA', '$2y$10$rGjB0rqallChco6M78FQ1eyz3iGQj.BxIOFg97DDBHHeLB3QXxd8K', 1, 2, 3, 3, 1, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `siswa` VALUES (90, 182, 'revatulhasanah534', 'REVATUL HASANAH', '$2y$10$aw4.9Yj/pOu4CGPzYG0q4.KBEU4KVY6S1j7cLmQffCKZbNLT5r176', 1, 2, 3, 3, 1, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `siswa` VALUES (91, 183, 'risqisilviana592', 'RISQI SILVIANA', '$2y$10$zCaJWAVzYCA6nPqYesKUnOWC4knBzhk.9.fiJaPEo3QSbGrO/vjea', 1, 2, 3, 3, 1, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `siswa` VALUES (92, 184, 'saadah722', 'SAADAH', '$2y$10$DATo/PJ3l/xtW9y2Iap.VOs7lMouXd5QavJVCTVjEuVHKyUMImjQG', 1, 2, 3, 3, 1, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `siswa` VALUES (93, 185, 'sahwasaqatittarra5610', 'SAHWA SAQA TITTARRA', '$2y$10$dHSwxbwQWplgv1FFbu8dY.1Rb8chcPpKYHNX8rpczua/6vJ9a3UT2', 1, 2, 3, 3, 1, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `siswa` VALUES (94, 186, 'salsabilaamenatalaura329', 'SALSABILA AME NATALAURA', '$2y$10$BGUTUNLZeTgnkqrmQEc2uumVj0uyjVFt1dYJW1PaGflQZYX5d.me6', 1, 2, 3, 3, 1, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `siswa` VALUES (95, 187, 'sitiratnamaisaroh911', 'SITI RATNA MAISAROH', '$2y$10$sIHQYqTqqd.2xkT0waaHTOt4CcSi9XBGqIN9Bwc1pgO60XDP1/8jy', 1, 2, 3, 3, 1, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `siswa` VALUES (96, 188, 'uunwulandari372', 'UUN WULANDARI', '$2y$10$1mmBDFovmiorwhIXZmpLqO8y/SJM/exun1pmcLM/ucn/6zRdiy.AG', 1, 2, 3, 3, 1, '2023-09-13 10:12:02', '2023-09-13 10:12:02', 1, NULL);
INSERT INTO `siswa` VALUES (97, 189, 'yasminauraputri743', 'YASMIN AURA PUTRI', '$2y$10$nswHMWUm/XvBAqSUL9fk/OCYgTScVmjdJ2Sppytm900Z77Xvjk792', 1, 2, 3, 3, 1, '2023-09-13 10:12:02', '2023-09-13 10:12:02', 1, NULL);
INSERT INTO `siswa` VALUES (98, 190, 'yumnailmiahfebriyanti931', 'YUMNA ILMIAH FEBRIYANTI', '$2y$10$e5IEm7dXEuKujL..JOuliObOwwZvJ6Go.fpHOONYJrsAxp3plJ5I2', 1, 2, 3, 3, 1, '2023-09-13 10:12:02', '2023-09-13 10:12:02', 1, NULL);
INSERT INTO `siswa` VALUES (99, 191, 'zahratullaeli822', 'ZAHRATUL LAELI', '$2y$10$eBz59aBPXsksmWPhVqL.1.ieNGtFwDDIs8/VptXQqzP4C1T5/paoe', 1, 2, 3, 3, 1, '2023-09-13 10:12:02', '2023-09-13 10:12:02', 1, NULL);
INSERT INTO `siswa` VALUES (100, 192, 'aisyahdivanadya758', 'AISYAH DIVA NADYA', '$2y$10$ZT2.E3Y8nP4MQNdIL10MBOCisb5I3a.s2vCgpUF0rxeh6lOLWnyDq', 1, 2, 4, 3, 1, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `siswa` VALUES (101, 193, 'alikaattabila365', 'ALIKA ATTABILA', '$2y$10$hJ3uBcb/PNvHNqkAPXVH6uxqV24O/sUvzKZm1jEkoQx/cnljCuL9u', 1, 2, 4, 3, 1, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `siswa` VALUES (102, 194, 'auliaputriangraini976', 'AULIA PUTRI ANGRAINI', '$2y$10$gDdsO/v3NyxpkxNdZwAfrO6XjoUug6cMerO5lLHV/fA4Zt8.uixi2', 1, 2, 4, 3, 1, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `siswa` VALUES (103, 195, 'berlianafadhiladwiwindarti923', 'BERLIANA FADHILA DWI WINDARTI', '$2y$10$WkhiTATbPMeDFGzpovu1lOGlVkT1kznBUfY4x.bjQA1fNMrnBW.bW', 1, 2, 4, 3, 1, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `siswa` VALUES (104, 196, 'delvinurulfransiska144', 'DELVI NURUL FRANSISKA', '$2y$10$7g.A4a9CBgSP3lvQI/wtCOu1dJBczsYZY.zQUrHQEC9ILbBRauaKu', 1, 2, 4, 3, 1, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `siswa` VALUES (105, 197, 'dwiputriramadhani462', 'DWI PUTRI RAMADHANI', '$2y$10$WNRFYXh6HgXbfvc.YVzd7.xCDGmzSlTSTPJxK6Umf4jYz8SoZILEu', 1, 2, 4, 3, 1, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `siswa` VALUES (106, 198, 'fadilatulnafiah472', 'FADILATUL NAFIAH', '$2y$10$h0xQ82TfvDX0erbFvwiusurhRnf89jJfmc8D4Xf3FgAt/3mEFnqhm', 1, 2, 4, 3, 1, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `siswa` VALUES (107, 199, 'fajarwahyunabilalsyah202', 'FAJAR WAHYU NABILALSYAH', '$2y$10$H.n71R3ngkaWH1MSdXFpO./MkQ.iCpQE2e0LdKxJZlV7X4l5ksjeG', 1, 2, 4, 3, 1, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `siswa` VALUES (108, 200, 'halimatuszuhriya392', 'HALIMATUS ZUHRIYA', '$2y$10$h1xMSYxNAkdIoWv/2yLc4OhLUE/jZk6yeJAQrPvgjOhHVAc30UxTO', 1, 2, 4, 3, 1, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `siswa` VALUES (109, 201, 'intanfauziyah343', 'INTAN FAUZIYAH', '$2y$10$DujITzUcPub5am2H6p2Cw.cTk5sbSa1ITv/bxwP7f20O78UUEd26i', 1, 2, 4, 3, 1, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `siswa` VALUES (110, 202, 'jhenissalsabilaramadany940', 'JHENIS SALSABILA RAMADANY', '$2y$10$zTgXFWa/FW6kEA7syko.YOdmUs21XmYqqBJLmBDfrKVx9gOOS8/Ym', 1, 2, 4, 3, 1, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `siswa` VALUES (111, 203, 'maulidaturrizqohizzaturrahmah250', 'MAULIDATUR RIZQOH IZZATURRAHMAH', '$2y$10$h4rnimZlpLa7cXMU/pJQ0uj/4jQwnuKtSma4KXxh5T8CzpAnIerzu', 1, 2, 4, 3, 1, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `siswa` VALUES (112, 204, 'mochammadthesarfebrian432', 'MOCHAMMAD THESAR FEBRIAN', '$2y$10$UVfhJ58AI/WdafwRaIclTOHU1vQ6hx5ntC711.QrQWTEYORvTZJPq', 1, 2, 4, 3, 1, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `siswa` VALUES (113, 205, 'muhammadalifahmi100', 'MUHAMMAD ALI FAHMI', '$2y$10$ut5vz.KPPkdw1VFnJIA9t.Vd94FGz/3uuRZueMvSIQRnapCT7t2pe', 1, 2, 4, 3, 1, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `siswa` VALUES (114, 206, 'muhammadfarhanhidayatullah895', 'MUHAMMAD FARHAN HIDAYATULLAH', '$2y$10$nfRJ/06viWbXthOKYPnHu.1YECfoM6GDtXkGEKY.5taPGLPU9Rn/C', 1, 2, 4, 3, 1, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `siswa` VALUES (115, 207, 'muhammadridhoillah561', 'MUHAMMAD RIDHO ILLAH', '$2y$10$moObOUCf1aa9y4fTsL0HQOSnl3rawWefU1AfTe7aIAZ/xlizyIcsW', 1, 2, 4, 3, 1, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `siswa` VALUES (116, 208, 'nabiladwinofiamaharani418', 'NABILA DWI NOFIA MAHARANI', '$2y$10$M1G5.kamdq03t82pWDpzPe8EEdjsjRL..11pEWe87Kghy4NHYaqm2', 1, 2, 4, 3, 1, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `siswa` VALUES (117, 209, 'nadinenoktawijaya717', 'NADINE NOKTA WIJAYA', '$2y$10$48mbvmnzuX7Y8Eul7WeL7.Rl8i9N8O/VqTZJ6XefxP3p4T11/V2OS', 1, 2, 4, 3, 1, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `siswa` VALUES (118, 210, 'nadyakaylakhayrunnisa316', 'NADYA KAYLA KHAYRUNNISA', '$2y$10$.RP2L0UB1bDoeJwSj5KnEOwaV4jAqnquXAaYEsY3obRKwO7Ayqr/K', 1, 2, 4, 3, 1, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `siswa` VALUES (119, 211, 'naylatulafroh467', 'NAYLATUL AFROH', '$2y$10$DvJSezRiEZ2l1iem5HPPjO25jT9PRY9L2CRw2Nyz8Kg23hU0G.Kza', 1, 2, 4, 3, 1, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `siswa` VALUES (120, 212, 'nurinnajmafajriah9410', 'NURIN NAJMA FAJRIAH', '$2y$10$QJNyh6cIOiGe.zOFra7jTewX/9vdzfK57Cpf/ndHKjkPB7DtSuLWu', 1, 2, 4, 3, 1, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `siswa` VALUES (121, 213, 'radyaclarisaoktariasafitri674', 'RADYA CLARISA OKTARIA SAFITRI', '$2y$10$TKcAYYDLzukUaN0TXZcT..StTMNtA9EihM6YYWTw3ZTDWEd0QY/ry', 1, 2, 4, 3, 1, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `siswa` VALUES (122, 214, 'revazahraefendi1000', 'REVA ZAHRA EFENDI', '$2y$10$0WhLVXzbKbn.KKhjtxMX3OORjK2Z/wFqkRF2/uRqPPcJ4WD8.4HgK', 1, 2, 4, 3, 1, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `siswa` VALUES (123, 215, 'rikizainurrahman114', 'RIKI ZAINUR RAHMAN', '$2y$10$ISWec12Vwuaji6Dzgk7LbOJ2dacex0Kg/E.GOcDqatUGJQj545qOW', 1, 2, 4, 3, 1, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `siswa` VALUES (124, 216, 'rimaniarputriherdanmi5310', 'RIMANIAR PUTRI HERDANMI', '$2y$10$mmYuhlJz838336V2UlJb5Ol0s1ZHlzaOv2JvmUJMtNaJf9TgoV.G2', 1, 2, 4, 3, 1, '2023-09-13 13:08:17', '2023-09-13 13:08:17', 1, NULL);
INSERT INTO `siswa` VALUES (125, 217, 'rofidatulhasanah360', 'ROFIDATUL HASANAH', '$2y$10$tZsdSCUoI9p92IL9u.1IveRJsnQA5gYUKQTn4onMIhQ5gbabTBsK6', 1, 2, 4, 3, 1, '2023-09-13 13:08:17', '2023-09-13 13:08:17', 1, NULL);
INSERT INTO `siswa` VALUES (126, 218, 'safinatunnafiah926', 'SAFINATUN NAFIAH', '$2y$10$fC2N30neh12VFINAC.Aur.x.2eDxKvIFUKKyQGXCAGqXFGNvPEdJq', 1, 2, 4, 3, 1, '2023-09-13 13:08:17', '2023-09-13 13:08:17', 1, NULL);
INSERT INTO `siswa` VALUES (127, 219, 'salsabilaainurrohmah238', 'SALSABILA AINUR ROHMAH', '$2y$10$f.NUMRgCa8L4vGMqo0Je4.vC/esWgzGklptHtYL6apnBiGUWP3Z2.', 1, 2, 4, 3, 1, '2023-09-13 13:08:17', '2023-09-13 13:08:17', 1, NULL);
INSERT INTO `siswa` VALUES (128, 220, 'serlyanandatasya663', 'SERLY ANANDA TASYA', '$2y$10$B3YqbmMF230Eayn6FXOYPuQyYvO.Is6yT5m857boWVMpxuk5vrn.m', 1, 2, 4, 3, 1, '2023-09-13 13:08:17', '2023-09-13 13:08:17', 1, NULL);
INSERT INTO `siswa` VALUES (129, 221, 'ustibungaulfiaini168', 'USTI BUNGA ULFI AINI', '$2y$10$VDG4IDWnYlZue7Wjg4PVD.518wZzsHdB4tF8BjWPcEos3arspSoWO', 1, 2, 4, 3, 1, '2023-09-13 13:08:17', '2023-09-13 13:08:17', 1, NULL);
INSERT INTO `siswa` VALUES (130, 222, 'viantikaainunsholehah584', 'VIANTIKA AINUN SHOLEHAH', '$2y$10$Q2jrxI5oJMv3mYdmIpiXTeELfuwgEqn3OdtbNAC3MBK6T7zFdIIlW', 1, 2, 4, 3, 1, '2023-09-13 13:08:17', '2023-09-13 13:08:17', 1, NULL);
INSERT INTO `siswa` VALUES (131, 223, 'yulitamegameilani778', 'YULITA MEGA MEILANI', '$2y$10$S1/y8lTe2JoFplZjIRoiaOeL8VOlGzEjQNsul5wPTbkc6VneD8C4q', 1, 2, 4, 3, 1, '2023-09-13 13:08:17', '2023-09-13 13:08:17', 1, NULL);
INSERT INTO `siswa` VALUES (132, 224, 'yusroamilinhikmah457', 'YUSRO AMILIN HIKMAH', '$2y$10$Lfya9eZUyspxC7JPsW.GMuyy.dg/wvwQTPnZF8ZHqCGYmwk/vzk9C', 1, 2, 4, 3, 1, '2023-09-13 13:08:17', '2023-09-13 13:08:17', 1, NULL);
INSERT INTO `siswa` VALUES (133, 225, 'abdialutfianti840', 'ABDIA LUTFIANTI', '$2y$10$vztkmyfmG27cEN6onr.TlOrWdbygvVg4k61rOp96Sq8QCqHwRr8di', 1, 3, 5, 3, 1, '2023-09-13 13:08:55', '2023-09-13 13:08:55', 1, NULL);
INSERT INTO `siswa` VALUES (134, 226, 'achmaddedekputrahardiansah251', 'ACHMAD DEDEK PUTRA HARDIANSAH', '$2y$10$WUVZHl68dP32seEyXbXcQubqDfrSYvojeFCXUd9WgxWVXsXsO8nlm', 1, 3, 5, 3, 1, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `siswa` VALUES (135, 227, 'aniwardayanti201', 'ANI WARDAYANTI', '$2y$10$1TuKA/cFcoyTTWA7PGoxruHEpo.Cf2lEN9gin2HiMe3f.8UIlKdoe', 1, 3, 5, 3, 1, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `siswa` VALUES (136, 228, 'aurelianatasyasalsabila225', 'AURELIA NATASYA SALSABILA', '$2y$10$M0TbegK8wUMBkBgpfQOLzOJk2fxqZ.8fwvdteuyQYjWpm.NfSGx5q', 1, 3, 5, 3, 1, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `siswa` VALUES (137, 229, 'carolinasulfahbernessa663', 'CAROLINA SULFAH BERNESSA', '$2y$10$is0QYqApbS/YAlAzo29oh.tNIj4T6BBZeVLsiNih7J4i2xlfix2sO', 1, 3, 5, 3, 1, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `siswa` VALUES (138, 230, 'cindyafauziyatulkamilah156', 'CINDYA FAUZIYATUL KAMILAH', '$2y$10$Dn2CGEORyBPJ6UhP969yIeacUzjK0KAMldVB7wSbTebRUvzeGmS/.', 1, 3, 5, 3, 1, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `siswa` VALUES (139, 231, 'deviannisaussholihah631', 'DEVI ANNISAUSSHOLIHAH', '$2y$10$NI4SYyzkX9MZiSIalRTEc.yGAbj9Tmd.jj3b9QgOWqbvqEM2Ka3Bu', 1, 3, 5, 3, 1, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `siswa` VALUES (140, 232, 'dewinurayu665', 'DEWI NUR AYU', '$2y$10$DMW1YlbgOFe31Dla54QTaOvOYXfVl8sVKIzU4Odo9X4fljsrLgEja', 1, 3, 5, 3, 1, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `siswa` VALUES (141, 233, 'evysusilowati723', 'EVY SUSILOWATI', '$2y$10$.rWVzwbSYSI1HJZDQaK9QOaQVES5p0j6h5OO38g6mH0AtLrZWvbxO', 1, 3, 5, 3, 1, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `siswa` VALUES (142, 234, 'fahriefendi189', 'FAHRI EFENDI', '$2y$10$wKrEsCS/8000q3v8L.hOXuVWd8dzdDVtY1SLv9gzkXTgYDmMsUr6K', 1, 3, 5, 3, 1, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `siswa` VALUES (143, 235, 'fatimahdiansafira291', 'FATIMAH DIAN SAFIRA', '$2y$10$DEYC.SD6nlyeESX3uH1NNO4lC7HDuXxbI21ctcBA2ab2nHZW.4Fky', 1, 3, 5, 3, 1, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `siswa` VALUES (144, 236, 'finarifhatun719', 'FINA RIFHATUN', '$2y$10$qQAwn96dsJEEHQi6fpRNte1gZWkerYdep4GnKXFMVCrhg2JoPayjK', 1, 3, 5, 3, 1, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `siswa` VALUES (145, 237, 'fitrinurfaisyah447', 'FITRI NUR FAISYAH', '$2y$10$abIbwE1mDFdxBCW2zFdGnuAfXlFdvJYSA67ClY05g92T8cxAzQ4Ia', 1, 3, 5, 3, 1, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `siswa` VALUES (146, 238, 'imildanofiandira376', 'IMILDA NOFI ANDIRA', '$2y$10$sQaimnenc9zFOlm9g5IoPue0VA91zn4WHS1XEtEXlIy0xTj2.STRS', 1, 3, 5, 3, 1, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `siswa` VALUES (147, 239, 'karinaeffendi363', 'KARINA EFFENDI', '$2y$10$0ebd4R/ledEttQv/1uTWPO4orw23B1tdb2yr5vm3rP0TzLxJGrCje', 1, 3, 5, 3, 1, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `siswa` VALUES (148, 240, 'kiranagaluhpratiwisantono343', 'KIRANA GALUH PRATIWI SANTONO', '$2y$10$Ao6VCRA.fGjQngf6uCN4TOcVUUR1jd/SFkZ2v9qJUHjUnon6rilV2', 1, 3, 5, 3, 1, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `siswa` VALUES (149, 241, 'kiraniajenglarasatisantono633', 'KIRANI AJENG LARASATI SANTONO', '$2y$10$TwzOOmfUCxLkVLsJMclDR.L0Y8sXnCpFAEBhTu3QPeWdV0FSO3k/u', 1, 3, 5, 3, 1, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `siswa` VALUES (150, 242, 'lisaamiliya690', 'LISA AMILIYA', '$2y$10$kgKnRSBKtcIKcVSm2VQN0erZ0NC0nBE4MYeWgeThfJiwTNnFCC7WG', 1, 3, 5, 3, 1, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `siswa` VALUES (151, 243, 'marchelaputriagustin1510', 'MARCHELA PUTRI AGUSTIN', '$2y$10$sVR54iYS55E7oNrJc4oaoeRgmGP.crVUMhEZcpGR1S3onokzmpuvK', 1, 3, 5, 3, 1, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `siswa` VALUES (152, 244, 'meryameliawidayanti949', 'MERY AMELIA WIDAYANTI', '$2y$10$Sj1rrTyhZhbIZvek0/muhOEdBGAYmqcHYCNkV/ZK70u12cRyhi4aK', 1, 3, 5, 3, 1, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `siswa` VALUES (153, 245, 'mykaylanajmilfirdausih608', 'MY KAYLA NAJMIL FIRDAUSIH', '$2y$10$Tb2YOSsJMegP7RG3DUgl0e1Z0goiahLMWn0wGbFS7f4w7miAkWwUy', 1, 3, 5, 3, 1, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `siswa` VALUES (154, 246, 'nabilacandradwianggraini463', 'NABILA CANDRA DWI ANGGRAINI', '$2y$10$WdV.PIkl3sCWe9vemzE/1OHJHItEV0m1yJZZjkstlC/beg2n8ZSWG', 1, 3, 5, 3, 1, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `siswa` VALUES (155, 247, 'nurrestiamelia2510', 'NUR RESTI AMELIA', '$2y$10$hshe4BOLhQQelmP.XhE1wuG9p1ckYDboce7/91eLrfkcCnihKS3sS', 1, 3, 5, 3, 1, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `siswa` VALUES (156, 248, 'okiramadani622', 'OKI RAMADANI', '$2y$10$9LgLS7K294o65IE3D2dNteB5/W3FFCiVyYAYe93iVg76oKtnP21tC', 1, 3, 5, 3, 1, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `siswa` VALUES (157, 249, 'riarahmadhaniagustin164', 'RIA RAHMADHANI AGUSTIN', '$2y$10$RCMAu.nogWQFDPkyXQgSTe43gZcS8XeK/PZrXiJTHJiU58S.zu01K', 1, 3, 5, 3, 1, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `siswa` VALUES (158, 250, 'safiraaprilliaputriazzahra679', 'SAFIRA APRILLIA PUTRI AZZAHRA', '$2y$10$8OrAjDqEp7VQGVvznYvN5eBytsB3fsbbrKj3vz77FA.jQPZcYowWe', 1, 3, 5, 3, 1, '2023-09-13 13:08:58', '2023-09-13 13:08:58', 1, NULL);
INSERT INTO `siswa` VALUES (159, 251, 'shintyadwivergita802', 'SHINTYA DWI VERGITA', '$2y$10$4RcAOVi5tp0/RlRRnxoaCeZyCn8HR0m7TA99bgYOOTF9EUwfwcxqC', 1, 3, 5, 3, 1, '2023-09-13 13:08:58', '2023-09-13 13:08:58', 1, NULL);
INSERT INTO `siswa` VALUES (160, 252, 'sintaamelia244', 'SINTA AMELIA', '$2y$10$wO0uLiTkusqXTcofW1ZgE.x8U9vehbyUkPS17GB8v96ZAVsufQv86', 1, 3, 5, 3, 1, '2023-09-13 13:08:58', '2023-09-13 13:08:58', 1, NULL);
INSERT INTO `siswa` VALUES (161, 253, 'sitifahria163', 'SITI FAHRIA', '$2y$10$p9zUrG5vUWX72lvX2tTieOULj.dur7rRU.DO1QNWZ6/Z7IIYFj99G', 1, 3, 5, 3, 1, '2023-09-13 13:08:58', '2023-09-13 13:08:58', 1, NULL);
INSERT INTO `siswa` VALUES (162, 254, 'sitinurhasanah239', 'SITI NUR HASANAH', '$2y$10$cyFuUionl/Qm2jvK8DF0LOWb.bn7CcbrZcvXOiFXKr6pxBJkKzkEO', 1, 3, 5, 3, 1, '2023-09-13 13:08:58', '2023-09-13 13:08:58', 1, NULL);
INSERT INTO `siswa` VALUES (163, 255, 'tiarasalshalaurabila747', 'TIARA SALSHA LAURA BILA', '$2y$10$dx9pY.K5WODKmy0TMIRvO.5M6ZJ0PmYM7QGVMOgeWG1mVPfkHZlQu', 1, 3, 5, 3, 1, '2023-09-13 13:08:58', '2023-09-13 13:08:58', 1, NULL);
INSERT INTO `siswa` VALUES (164, 256, 'wulanrobial738', 'WULAN ROBIAL', '$2y$10$m6V3naR7p8K9e6B8ReRQ1uC6.x6V0ZsT4nu/2HqQsWBM4byAL81xG', 1, 3, 5, 3, 1, '2023-09-13 13:08:58', '2023-09-13 13:08:58', 1, NULL);
INSERT INTO `siswa` VALUES (165, 257, 'yulytadellasabrinaekaputri315', 'YULYTA DELLA SABRINA EKA PUTRI', '$2y$10$NxXHUsRFKGLJtkqqdvUELepoH.xQHW3WtetIoQopNUyyQxqtokiaW', 1, 3, 5, 3, 1, '2023-09-13 13:08:58', '2023-09-13 13:08:58', 1, NULL);
INSERT INTO `siswa` VALUES (166, 258, 'abhistafarrelkaromahhibatullah713', 'ABHISTA FARREL KAROMAH HIBATULLAH', '$2y$10$a5dB.l24RKULPPmx2ljPhuRIQlaxrm8t5deu7yaIplqefdS6FGt7q', 3, 7, 12, 3, 1, '2023-09-13 13:15:06', '2023-09-13 13:15:06', 1, NULL);
INSERT INTO `siswa` VALUES (167, 259, 'ahmadabdillahfaza921', 'AHMAD ABDILLAH FAZA', '$2y$10$/rkfACF3Rmc/ynFSM/edI.hpuRnp3NwS8sJD0pxOUmdIQuv2LZToW', 3, 7, 12, 3, 1, '2023-09-13 13:15:06', '2023-09-13 13:15:06', 1, NULL);
INSERT INTO `siswa` VALUES (168, 260, 'alifzakylutfiansyah119', 'ALIF ZAKY LUTFIANSYAH', '$2y$10$KgcuhgXE9Um4MZPt9u78yOm2SKtndNyOOpeV0/bir6n.x9HP.6pUa', 3, 7, 12, 3, 1, '2023-09-13 13:15:06', '2023-09-13 13:15:06', 1, NULL);
INSERT INTO `siswa` VALUES (169, 261, 'arilbenisetiawan986', 'ARIL BENI SETIAWAN', '$2y$10$W5Vh4YG7506geAKD667CrOtxWRdjYCLA8hytHeZjCVtniCivKUmFm', 3, 7, 12, 3, 1, '2023-09-13 13:15:06', '2023-09-13 13:15:06', 1, NULL);
INSERT INTO `siswa` VALUES (170, 262, 'chelotasnimharyono859', 'CHELO TASNIM HARYONO', '$2y$10$RxHVPvqXDHcdm7wWT1rYxu.1l7ZfVej1r7c2hXdioJR9inzP482OW', 3, 7, 12, 3, 1, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `siswa` VALUES (171, 263, 'davafaranezar9410', 'DAVA FARANEZAR', '$2y$10$JpRMJBNwE2oxaodi/PHQ5uDqlGpgijIevcHvoGXNtJ6qbTyEZiG1m', 3, 7, 12, 3, 1, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `siswa` VALUES (172, 264, 'dimasregaadiwijaya408', 'DIMAS REGA ADIWIJAYA', '$2y$10$vXusEK54YaDXH6jXZ4vpUuAgT19aKellXCNpbmWLFh1Xcb0RWo6l6', 3, 7, 12, 3, 1, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `siswa` VALUES (173, 265, 'harismochammadishak392', 'HARIS MOCHAMMAD ISHAK', '$2y$10$2L./NCBwDTL87fXqocRxROnsT0GycME6Hqyp4I3kZLrtj7V/Fc2i6', 3, 7, 12, 3, 1, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `siswa` VALUES (174, 266, 'luqmanayawahidansutanto736', 'LUQMANAYA WAHIDAN SUTANTO', '$2y$10$RatrSSIuQR/Yow9sjBF5quzObz5m4Q4Q6bkkNRkJCbgEGC0sbR.4q', 3, 7, 12, 3, 1, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `siswa` VALUES (175, 267, 'mohammaddavilahakbar514', 'MOHAMMAD DAVILAH AKBAR', '$2y$10$NGvGilcECtY0ZiQN2z0VFO4576WI0Agd9122qiQWIvVU4j0IQWU3u', 3, 7, 12, 3, 1, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `siswa` VALUES (176, 268, 'mohammadrayhanzhidad839', 'MOHAMMAD RAYHAN ZHIDAD', '$2y$10$O4frfB.IBddwd3mebO1MZOCmYsBdheH8vtYLBroYo7Qu2gDSvfyMK', 3, 7, 12, 3, 1, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `siswa` VALUES (177, 269, 'muhammadgufron785', 'MUHAMMAD GUFRON', '$2y$10$dQ.xlBUV6To0BV.PU3tZBunvLYlIhIuylq5Yt7Vyv0D0gE6SH7n1e', 3, 7, 12, 3, 1, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `siswa` VALUES (178, 270, 'muhammadikrom727', 'MUHAMMAD IKROM', '$2y$10$NUq33MKu3Ot8RtP495dFce9/uYduDG/RXagi/PfcRBeY9s1swOduC', 3, 7, 12, 3, 1, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `siswa` VALUES (179, 271, 'muhammadirfanubaidillah804', 'MUHAMMAD IRFAN UBAIDILLAH', '$2y$10$Z2rDnmqfeMTila/Nw0lUOesvfHoqPPIUX6Cy3kcXJqHoynt2E4qFa', 3, 7, 12, 3, 1, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `siswa` VALUES (180, 272, 'muhammadmahrus182', 'MUHAMMAD MAHRUS', '$2y$10$4nIyunexRfi1rTSaDCOsLeWewPMlUaj45rQuyOM3aDOyfygrdeAPa', 3, 7, 12, 3, 1, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `siswa` VALUES (181, 273, 'putraadityaperkasa634', 'PUTRA ADITYA PERKASA', '$2y$10$vkmUusKQmCFyC6P4oPacreBRH2sgR613rrfEItDYRt2REMtg4fuY2', 3, 7, 12, 3, 1, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `siswa` VALUES (182, 274, 'radhitiapratamaeffendy356', 'RADHITIA PRATAMA EFFENDY', '$2y$10$0yvsEj3eW//P86ty5gpWBe24VwPT8WuwAtltVdz0kjVXIxXA6GpfS', 3, 7, 12, 3, 1, '2023-09-13 13:15:08', '2023-09-13 13:15:08', 1, NULL);
INSERT INTO `siswa` VALUES (183, 275, 'rayaghaniyyayuda221', 'RAYA GHANIYYA YUDA', '$2y$10$lfA3IyluZY5rAuLaL7Hb9OKFb8bp.olclXEH5y1OANABBIRPfqdh2', 3, 7, 12, 3, 1, '2023-09-13 13:15:08', '2023-09-13 13:15:08', 1, NULL);
INSERT INTO `siswa` VALUES (184, 276, 'riskiyantonoavis786', 'RISKI YANTONO AVIS', '$2y$10$z0H6QnyYwYdN8vAMpnd3u.hk0SjDathW2ix9nJuPETX/qYnGKgRq2', 3, 7, 12, 3, 1, '2023-09-13 13:15:08', '2023-09-13 13:15:08', 1, NULL);
INSERT INTO `siswa` VALUES (185, 277, 'rizky317', 'RIZKY', '$2y$10$Gom/yyYPqv9cOglzYBndp.DGzHksPW1Gk8B18svHSTdSizJXItXIe', 3, 7, 12, 3, 1, '2023-09-13 13:15:08', '2023-09-13 13:15:08', 1, NULL);
INSERT INTO `siswa` VALUES (186, 278, 'sitiqomariatulmaulidia974', 'SITI QOMARIATUL MAULIDIA', '$2y$10$zzP3n1q6PYgB2xLLP4SZROUNkAJ8HCJfkG7m5eGksW8aUyV5xbtFO', 3, 7, 12, 3, 1, '2023-09-13 13:15:08', '2023-09-13 13:15:08', 1, NULL);
INSERT INTO `siswa` VALUES (187, 279, 'tabinafaisapribadi463', 'TABINA FAISA PRIBADI', '$2y$10$1jZdx0n0VrlrLIbJn.Ej9eES30Uci1HP9G495M/ncv2WMyulvpQ3e', 3, 7, 12, 3, 1, '2023-09-13 13:15:08', '2023-09-13 13:15:08', 1, NULL);
INSERT INTO `siswa` VALUES (188, 280, 'teguhwichaksono449', 'TEGUH WICHAKSONO', '$2y$10$YDigz/9Ex8lQCpUKNuElQuDEymS28pzCX.wa2t/b2J.Udgi7Fc6ue', 3, 7, 12, 3, 1, '2023-09-13 13:15:08', '2023-09-13 13:15:08', 1, NULL);
INSERT INTO `siswa` VALUES (189, 281, 'wildanzakiamali384', 'WILDAN ZAKI AMALI', '$2y$10$QpYEeNiMp0qyGd.nH/guSut2nawXxmbkL0h5haGwzqPtC4KnpFWMm', 3, 7, 12, 3, 1, '2023-09-13 13:15:08', '2023-09-13 13:15:08', 1, NULL);
INSERT INTO `siswa` VALUES (190, 282, 'yuviarnuzulramadhani852', 'YUVIAR NUZUL RAMADHANI', '$2y$10$5GoRPiQdmLofwhxzhRZFduWLgWzC51cL6UwcmkSyxisU1WzC2abDG', 3, 7, 12, 3, 1, '2023-09-13 13:15:08', '2023-09-13 13:15:08', 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 258 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `users` VALUES (93, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `users` VALUES (94, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `users` VALUES (95, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `users` VALUES (96, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `users` VALUES (97, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `users` VALUES (98, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `users` VALUES (99, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `users` VALUES (100, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `users` VALUES (101, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `users` VALUES (102, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `users` VALUES (103, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `users` VALUES (104, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `users` VALUES (105, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `users` VALUES (106, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `users` VALUES (107, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `users` VALUES (108, '2023-09-13 10:06:20', '2023-09-13 10:06:20', 1, NULL);
INSERT INTO `users` VALUES (109, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `users` VALUES (110, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `users` VALUES (111, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `users` VALUES (112, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `users` VALUES (113, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `users` VALUES (114, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `users` VALUES (115, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `users` VALUES (116, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `users` VALUES (117, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `users` VALUES (118, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `users` VALUES (119, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `users` VALUES (120, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `users` VALUES (121, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `users` VALUES (122, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `users` VALUES (123, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `users` VALUES (124, '2023-09-13 10:06:21', '2023-09-13 10:06:21', 1, NULL);
INSERT INTO `users` VALUES (125, '2023-09-13 10:06:22', '2023-09-13 10:06:22', 1, NULL);
INSERT INTO `users` VALUES (126, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `users` VALUES (127, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `users` VALUES (128, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `users` VALUES (129, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `users` VALUES (130, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `users` VALUES (131, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `users` VALUES (132, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `users` VALUES (133, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `users` VALUES (134, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `users` VALUES (135, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `users` VALUES (136, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `users` VALUES (137, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `users` VALUES (138, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `users` VALUES (139, '2023-09-13 10:08:05', '2023-09-13 10:08:05', 1, NULL);
INSERT INTO `users` VALUES (140, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `users` VALUES (141, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `users` VALUES (142, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `users` VALUES (143, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `users` VALUES (144, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `users` VALUES (145, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `users` VALUES (146, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `users` VALUES (147, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `users` VALUES (148, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `users` VALUES (149, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `users` VALUES (150, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `users` VALUES (151, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `users` VALUES (152, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `users` VALUES (153, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `users` VALUES (154, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `users` VALUES (155, '2023-09-13 10:08:06', '2023-09-13 10:08:06', 1, NULL);
INSERT INTO `users` VALUES (156, '2023-09-13 10:08:07', '2023-09-13 10:08:07', 1, NULL);
INSERT INTO `users` VALUES (157, '2023-09-13 10:08:07', '2023-09-13 10:08:07', 1, NULL);
INSERT INTO `users` VALUES (158, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `users` VALUES (159, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `users` VALUES (160, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `users` VALUES (161, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `users` VALUES (162, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `users` VALUES (163, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `users` VALUES (164, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `users` VALUES (165, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `users` VALUES (166, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `users` VALUES (167, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `users` VALUES (168, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `users` VALUES (169, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `users` VALUES (170, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `users` VALUES (171, '2023-09-13 10:12:00', '2023-09-13 10:12:00', 1, NULL);
INSERT INTO `users` VALUES (172, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `users` VALUES (173, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `users` VALUES (174, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `users` VALUES (175, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `users` VALUES (176, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `users` VALUES (177, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `users` VALUES (178, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `users` VALUES (179, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `users` VALUES (180, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `users` VALUES (181, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `users` VALUES (182, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `users` VALUES (183, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `users` VALUES (184, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `users` VALUES (185, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `users` VALUES (186, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `users` VALUES (187, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `users` VALUES (188, '2023-09-13 10:12:01', '2023-09-13 10:12:01', 1, NULL);
INSERT INTO `users` VALUES (189, '2023-09-13 10:12:02', '2023-09-13 10:12:02', 1, NULL);
INSERT INTO `users` VALUES (190, '2023-09-13 10:12:02', '2023-09-13 10:12:02', 1, NULL);
INSERT INTO `users` VALUES (191, '2023-09-13 10:12:02', '2023-09-13 10:12:02', 1, NULL);
INSERT INTO `users` VALUES (192, '2023-09-13 13:08:14', '2023-09-13 13:08:14', 1, NULL);
INSERT INTO `users` VALUES (193, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `users` VALUES (194, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `users` VALUES (195, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `users` VALUES (196, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `users` VALUES (197, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `users` VALUES (198, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `users` VALUES (199, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `users` VALUES (200, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `users` VALUES (201, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `users` VALUES (202, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `users` VALUES (203, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `users` VALUES (204, '2023-09-13 13:08:15', '2023-09-13 13:08:15', 1, NULL);
INSERT INTO `users` VALUES (205, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `users` VALUES (206, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `users` VALUES (207, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `users` VALUES (208, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `users` VALUES (209, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `users` VALUES (210, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `users` VALUES (211, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `users` VALUES (212, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `users` VALUES (213, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `users` VALUES (214, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `users` VALUES (215, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `users` VALUES (216, '2023-09-13 13:08:16', '2023-09-13 13:08:16', 1, NULL);
INSERT INTO `users` VALUES (217, '2023-09-13 13:08:17', '2023-09-13 13:08:17', 1, NULL);
INSERT INTO `users` VALUES (218, '2023-09-13 13:08:17', '2023-09-13 13:08:17', 1, NULL);
INSERT INTO `users` VALUES (219, '2023-09-13 13:08:17', '2023-09-13 13:08:17', 1, NULL);
INSERT INTO `users` VALUES (220, '2023-09-13 13:08:17', '2023-09-13 13:08:17', 1, NULL);
INSERT INTO `users` VALUES (221, '2023-09-13 13:08:17', '2023-09-13 13:08:17', 1, NULL);
INSERT INTO `users` VALUES (222, '2023-09-13 13:08:17', '2023-09-13 13:08:17', 1, NULL);
INSERT INTO `users` VALUES (223, '2023-09-13 13:08:17', '2023-09-13 13:08:17', 1, NULL);
INSERT INTO `users` VALUES (224, '2023-09-13 13:08:17', '2023-09-13 13:08:17', 1, NULL);
INSERT INTO `users` VALUES (225, '2023-09-13 13:08:55', '2023-09-13 13:08:55', 1, NULL);
INSERT INTO `users` VALUES (226, '2023-09-13 13:08:55', '2023-09-13 13:08:55', 1, NULL);
INSERT INTO `users` VALUES (227, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `users` VALUES (228, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `users` VALUES (229, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `users` VALUES (230, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `users` VALUES (231, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `users` VALUES (232, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `users` VALUES (233, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `users` VALUES (234, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `users` VALUES (235, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `users` VALUES (236, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `users` VALUES (237, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `users` VALUES (238, '2023-09-13 13:08:56', '2023-09-13 13:08:56', 1, NULL);
INSERT INTO `users` VALUES (239, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `users` VALUES (240, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `users` VALUES (241, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `users` VALUES (242, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `users` VALUES (243, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `users` VALUES (244, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `users` VALUES (245, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `users` VALUES (246, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `users` VALUES (247, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `users` VALUES (248, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `users` VALUES (249, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `users` VALUES (250, '2023-09-13 13:08:57', '2023-09-13 13:08:57', 1, NULL);
INSERT INTO `users` VALUES (251, '2023-09-13 13:08:58', '2023-09-13 13:08:58', 1, NULL);
INSERT INTO `users` VALUES (252, '2023-09-13 13:08:58', '2023-09-13 13:08:58', 1, NULL);
INSERT INTO `users` VALUES (253, '2023-09-13 13:08:58', '2023-09-13 13:08:58', 1, NULL);
INSERT INTO `users` VALUES (254, '2023-09-13 13:08:58', '2023-09-13 13:08:58', 1, NULL);
INSERT INTO `users` VALUES (255, '2023-09-13 13:08:58', '2023-09-13 13:08:58', 1, NULL);
INSERT INTO `users` VALUES (256, '2023-09-13 13:08:58', '2023-09-13 13:08:58', 1, NULL);
INSERT INTO `users` VALUES (257, '2023-09-13 13:08:58', '2023-09-13 13:08:58', 1, NULL);
INSERT INTO `users` VALUES (258, '2023-09-13 13:15:06', '2023-09-13 13:15:06', 1, NULL);
INSERT INTO `users` VALUES (259, '2023-09-13 13:15:06', '2023-09-13 13:15:06', 1, NULL);
INSERT INTO `users` VALUES (260, '2023-09-13 13:15:06', '2023-09-13 13:15:06', 1, NULL);
INSERT INTO `users` VALUES (261, '2023-09-13 13:15:06', '2023-09-13 13:15:06', 1, NULL);
INSERT INTO `users` VALUES (262, '2023-09-13 13:15:06', '2023-09-13 13:15:06', 1, NULL);
INSERT INTO `users` VALUES (263, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `users` VALUES (264, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `users` VALUES (265, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `users` VALUES (266, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `users` VALUES (267, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `users` VALUES (268, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `users` VALUES (269, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `users` VALUES (270, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `users` VALUES (271, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `users` VALUES (272, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `users` VALUES (273, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `users` VALUES (274, '2023-09-13 13:15:07', '2023-09-13 13:15:07', 1, NULL);
INSERT INTO `users` VALUES (275, '2023-09-13 13:15:08', '2023-09-13 13:15:08', 1, NULL);
INSERT INTO `users` VALUES (276, '2023-09-13 13:15:08', '2023-09-13 13:15:08', 1, NULL);
INSERT INTO `users` VALUES (277, '2023-09-13 13:15:08', '2023-09-13 13:15:08', 1, NULL);
INSERT INTO `users` VALUES (278, '2023-09-13 13:15:08', '2023-09-13 13:15:08', 1, NULL);
INSERT INTO `users` VALUES (279, '2023-09-13 13:15:08', '2023-09-13 13:15:08', 1, NULL);
INSERT INTO `users` VALUES (280, '2023-09-13 13:15:08', '2023-09-13 13:15:08', 1, NULL);
INSERT INTO `users` VALUES (281, '2023-09-13 13:15:08', '2023-09-13 13:15:08', 1, NULL);
INSERT INTO `users` VALUES (282, '2023-09-13 13:15:08', '2023-09-13 13:15:08', 1, NULL);

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
