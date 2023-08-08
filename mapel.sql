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

 Date: 08/08/2023 13:12:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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

SET FOREIGN_KEY_CHECKS = 1;
