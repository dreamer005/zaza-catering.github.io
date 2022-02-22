/*
 Navicat Premium Data Transfer

 Source Server         : MySQL Sample
 Source Server Type    : MySQL
 Source Server Version : 100411
 Source Host           : localhost:3306
 Source Schema         : tokoku

 Target Server Type    : MySQL
 Target Server Version : 100411
 File Encoding         : 65001

 Date: 20/06/2021 13:06:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alamat_pengiriman
-- ----------------------------
DROP TABLE IF EXISTS `alamat_pengiriman`;
CREATE TABLE `alamat_pengiriman`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_penerima` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_tlp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provinsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kecamatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelurahan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kodepos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `alamat_pengiriman_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `alamat_pengiriman_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alamat_pengiriman
-- ----------------------------
INSERT INTO `alamat_pengiriman` VALUES (1, 1, 'utama', 'Satrio', '085877747277', 'Sokaraja', 'Jawa Tengah', 'Banyumas', 'Sokaraja', 'Karang Rau', '53181', '2021-06-15 12:22:44', '2021-06-15 12:22:44');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `no_invoice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_cart` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_pembayaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_pengiriman` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_resi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ekspedisi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `subtotal` double(12, 2) NOT NULL DEFAULT 0,
  `ongkir` double(12, 2) NOT NULL DEFAULT 0,
  `diskon` double(12, 2) NOT NULL DEFAULT 0,
  `total` double(12, 2) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `cart_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 1, 'INV 001', 'checkout', 'belum', 'belum', NULL, NULL, 10000.00, 0.00, 0.00, 10000.00, '2021-06-15 12:12:17', '2021-06-15 12:22:56');
INSERT INTO `cart` VALUES (2, 1, 'INV 002', 'checkout', 'belum', 'belum', NULL, NULL, 20000.00, 0.00, 0.00, 20000.00, '2021-06-20 03:08:48', '2021-06-20 03:09:39');

-- ----------------------------
-- Table structure for cart_detail
-- ----------------------------
DROP TABLE IF EXISTS `cart_detail`;
CREATE TABLE `cart_detail`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `produk_id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED NOT NULL,
  `qty` double(12, 2) NOT NULL DEFAULT 0,
  `harga` double(12, 2) NOT NULL DEFAULT 0,
  `diskon` double(12, 2) NOT NULL DEFAULT 0,
  `subtotal` double(12, 2) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_detail_cart_id_foreign`(`cart_id`) USING BTREE,
  INDEX `cart_detail_produk_id_foreign`(`produk_id`) USING BTREE,
  CONSTRAINT `cart_detail_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cart_detail_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_detail
-- ----------------------------
INSERT INTO `cart_detail` VALUES (1, 1, 1, 1.00, 10000.00, 0.00, 10000.00, '2021-06-15 12:12:17', '2021-06-15 12:12:17');
INSERT INTO `cart_detail` VALUES (2, 5, 2, 1.00, 10000.00, 0.00, 10000.00, '2021-06-20 03:08:48', '2021-06-20 03:08:48');
INSERT INTO `cart_detail` VALUES (3, 4, 2, 1.00, 10000.00, 0.00, 10000.00, '2021-06-20 03:09:20', '2021-06-20 03:09:20');

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `images_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `images_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES (2, 1, 'files/e8FYgv6Cth7eR0B9fetdO4d5dyoV7RSjyq55jt01.jpg', '2021-06-20 02:00:51', '2021-06-20 02:00:51');
INSERT INTO `images` VALUES (3, 1, 'files/0kPCoePrhOGpZxsrBTW8A2XxaGCE6k7FtpamaZpG.jpg', '2021-06-20 02:04:02', '2021-06-20 02:04:02');
INSERT INTO `images` VALUES (4, 1, 'files/kLJP2LPtm3jzt0UwiwBlsqZtlIcAcmudpWWoUCfZ.jpg', '2021-06-20 02:05:46', '2021-06-20 02:05:46');
INSERT INTO `images` VALUES (5, 1, 'files/yB4lcV2i6fdCuCZUymDNwgBqSj30njsgcHbiBFca.jpg', '2021-06-20 02:07:18', '2021-06-20 02:07:18');

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug_kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi_kategori` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `kategori_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `kategori_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kategori
-- ----------------------------
INSERT INTO `kategori` VALUES (2, 'KATE-01', 'Ingredients', 'Ingredients', 'Bahan untuk membuat SayBakery versimu', 'publish', NULL, 1, '2021-06-15 08:54:13', '2021-06-20 02:59:04');
INSERT INTO `kategori` VALUES (3, 'KATE-02', 'Cookies', 'cookies', 'Cemilan untuk waktu senggangmu dari SayCookies', 'publish', NULL, 1, '2021-06-20 02:58:49', '2021-06-20 02:58:49');
INSERT INTO `kategori` VALUES (4, 'KATE-03', 'Bread', 'bread', 'Selalu sedia SayBread untuk mengisi perut kosongmu', 'publish', NULL, 1, '2021-06-20 03:00:02', '2021-06-20 03:00:02');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (6, '2014_10_12_100000_create_password_resets_table', 2);
INSERT INTO `migrations` VALUES (7, '2021_06_15_011813_create_kategoris_table', 2);
INSERT INTO `migrations` VALUES (8, '2021_06_15_014840_create_images_table', 3);
INSERT INTO `migrations` VALUES (9, '2021_06_15_094814_create_produk_images_table', 4);
INSERT INTO `migrations` VALUES (10, '2021_06_15_095643_create_slideshows_table', 5);
INSERT INTO `migrations` VALUES (11, '2021_06_15_102033_create_produk_promos_table', 6);
INSERT INTO `migrations` VALUES (12, '2021_06_15_104727_create_wishlists_table', 7);
INSERT INTO `migrations` VALUES (13, '2021_06_15_114527_create_carts_table', 8);
INSERT INTO `migrations` VALUES (14, '2021_06_15_114712_create_cart_details_table', 8);
INSERT INTO `migrations` VALUES (15, '2021_06_15_115202_create_alamat_pengirimen_table', 8);
INSERT INTO `migrations` VALUES (16, '2021_06_15_115633_create_orders_table', 8);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cart_id` int(10) UNSIGNED NOT NULL,
  `nama_penerima` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_tlp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provinsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kecamatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelurahan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kodepos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_cart_id_foreign`(`cart_id`) USING BTREE,
  CONSTRAINT `order_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 1, 'Satrio', '085877747277', 'Sokaraja', 'Jawa Tengah', 'Banyumas', 'Sokaraja', 'Karang Rau', '53181', '2021-06-15 12:22:56', '2021-06-15 12:22:56');
INSERT INTO `order` VALUES (2, 2, 'Satrio', '085877747277', 'Sokaraja', 'Jawa Tengah', 'Banyumas', 'Sokaraja', 'Karang Rau', '53181', '2021-06-20 03:09:39', '2021-06-20 03:09:39');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for produk
-- ----------------------------
DROP TABLE IF EXISTS `produk`;
CREATE TABLE `produk`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kategori_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `kode_produk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_produk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug_produk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi_produk` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `qty` double(12, 2) NOT NULL DEFAULT 0,
  `satuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` double(12, 2) NOT NULL DEFAULT 0,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `produk_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `produk_kategori_id_foreign`(`kategori_id`) USING BTREE,
  CONSTRAINT `produk_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `produk_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of produk
-- ----------------------------
INSERT INTO `produk` VALUES (1, 2, 1, '001', 'Tepung Terigu', 'Tepung Terigu', 'Tepung terigu untuk membuat SayBread versimu dari SayIngedrients', NULL, 10.00, 'Kilogram', 10000.00, 'publish', '2021-06-15 09:13:03', '2021-06-20 03:06:50');
INSERT INTO `produk` VALUES (2, 2, 1, '002', 'Telur', 'telur', 'Telur Ayam 1 Lusin untuk membuat SayBread versimu dari SayIngedrients', NULL, 10.00, 'Lusin', 20000.00, 'publish', '2021-06-20 02:56:38', '2021-06-20 03:07:09');
INSERT INTO `produk` VALUES (3, 3, 1, '003', 'Donat', 'donat', '12 Varian donat dari SayCookies', NULL, 10.00, 'Lusin', 45000.00, 'publish', '2021-06-20 03:01:39', '2021-06-20 03:05:13');
INSERT INTO `produk` VALUES (4, 4, 1, '004', 'Roti Sosis', 'roti-sosis', 'Roti dengan isian sosis dilengkapi dengan saus spesial dari SayBread', NULL, 10.00, 'Kemasan', 10000.00, 'publish', '2021-06-20 03:03:30', '2021-06-20 03:03:30');
INSERT INTO `produk` VALUES (5, 4, 1, '005', 'Roti Coklat', 'roti-coklat', 'Roti dengan isian coklat spesial dari SayBread', NULL, 10.00, 'Kemasan', 10000.00, 'publish', '2021-06-20 03:04:22', '2021-06-20 03:04:22');

-- ----------------------------
-- Table structure for produk_images
-- ----------------------------
DROP TABLE IF EXISTS `produk_images`;
CREATE TABLE `produk_images`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `produk_id` int(10) UNSIGNED NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `produk_images_produk_id_foreign`(`produk_id`) USING BTREE,
  CONSTRAINT `produk_images_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for produk_promo
-- ----------------------------
DROP TABLE IF EXISTS `produk_promo`;
CREATE TABLE `produk_promo`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `produk_id` int(10) UNSIGNED NOT NULL,
  `harga_awal` decimal(16, 2) NOT NULL DEFAULT 0,
  `harga_akhir` decimal(16, 2) NOT NULL DEFAULT 0,
  `diskon_persen` int(11) NOT NULL DEFAULT 0,
  `diskon_nominal` decimal(16, 2) NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `produk_promo_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `produk_promo_produk_id_foreign`(`produk_id`) USING BTREE,
  CONSTRAINT `produk_promo_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `produk_promo_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of produk_promo
-- ----------------------------
INSERT INTO `produk_promo` VALUES (1, 1, 10000.00, 9000.00, 10, 1000.00, 1, '2021-06-15 12:26:38', '2021-06-15 12:26:38');

-- ----------------------------
-- Table structure for slideshow
-- ----------------------------
DROP TABLE IF EXISTS `slideshow`;
CREATE TABLE `slideshow`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `caption_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `slideshow_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `slideshow_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of slideshow
-- ----------------------------
INSERT INTO `slideshow` VALUES (2, 'files/0kPCoePrhOGpZxsrBTW8A2XxaGCE6k7FtpamaZpG.jpg', 'Bread', 'Hindari perut kosong dengan sedia SayBread setiap saat', 1, '2021-06-20 02:04:02', '2021-06-20 02:04:02');
INSERT INTO `slideshow` VALUES (3, 'files/kLJP2LPtm3jzt0UwiwBlsqZtlIcAcmudpWWoUCfZ.jpg', 'Kue', 'Lengkapi senggangmu dengan SayCookies sekarang juga!', 1, '2021-06-20 02:05:46', '2021-06-20 02:05:46');
INSERT INTO `slideshow` VALUES (4, 'files/yB4lcV2i6fdCuCZUymDNwgBqSj30njsgcHbiBFca.jpg', 'Bahan', 'Buat sendiri SayBakery versimu dengan SayIngedrients', 1, '2021-06-20 02:07:18', '2021-06-20 02:07:18');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Rio', 's.lintang10@gmail.com', NULL, '$2y$10$.kSSYqzW4fS5skz4MLR/XO3trW.W8X27hUvhkIPapWr6Eah2Vw5Mu', '085877747277', NULL, 'member', NULL, 'aktif', NULL, '2021-06-15 02:02:41', '2021-06-15 02:02:41');

-- ----------------------------
-- Table structure for wishlist
-- ----------------------------
DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `produk_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wishlist_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `wishlist_produk_id_foreign`(`produk_id`) USING BTREE,
  CONSTRAINT `wishlist_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wishlist_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wishlist
-- ----------------------------
INSERT INTO `wishlist` VALUES (1, 1, 1, '2021-06-15 10:57:37', '2021-06-15 10:57:37');

SET FOREIGN_KEY_CHECKS = 1;
