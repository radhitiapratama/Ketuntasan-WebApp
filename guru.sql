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

 Date: 08/08/2023 08:58:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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

SET FOREIGN_KEY_CHECKS = 1;
