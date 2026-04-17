-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.14.0.7170
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for sistem_menejemen_sekolah
CREATE DATABASE IF NOT EXISTS `sistem_menejemen_sekolah` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `sistem_menejemen_sekolah`;

-- Dumping structure for table sistem_menejemen_sekolah.biaya_to_kelas
CREATE TABLE IF NOT EXISTS `biaya_to_kelas` (
  `id_biaya_to_kelas` int(11) NOT NULL AUTO_INCREMENT,
  `id_biaya` int(11) DEFAULT NULL,
  `id_tingkat_kelas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_biaya_to_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table sistem_menejemen_sekolah.biaya_to_kelas: ~0 rows (approximately)

-- Dumping structure for table sistem_menejemen_sekolah.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistem_menejemen_sekolah.cache: ~2 rows (approximately)
REPLACE INTO `cache` (`key`, `value`, `expiration`) VALUES
	('laravel-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6', 'i:1;', 1776396552),
	('laravel-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6:timer', 'i:1776396552;', 1776396552);

-- Dumping structure for table sistem_menejemen_sekolah.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistem_menejemen_sekolah.cache_locks: ~0 rows (approximately)

-- Dumping structure for table sistem_menejemen_sekolah.m_biaya
CREATE TABLE IF NOT EXISTS `m_biaya` (
  `id_biaya` int(10) unsigned NOT NULL DEFAULT 0,
  `jenis_biaya` varchar(100) NOT NULL,
  `nominal` decimal(12,2) NOT NULL,
  `id_tingkat_kelas` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_biaya`) USING BTREE,
  KEY `FK_m_biaya_m_tingkat_kelas` (`id_tingkat_kelas`),
  CONSTRAINT `FK_m_biaya_m_tingkat_kelas` FOREIGN KEY (`id_tingkat_kelas`) REFERENCES `m_tingkat_kelas` (`id_tingkat_kelas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistem_menejemen_sekolah.m_biaya: ~9 rows (approximately)
REPLACE INTO `m_biaya` (`id_biaya`, `jenis_biaya`, `nominal`, `id_tingkat_kelas`, `created_at`, `updated_at`) VALUES
	(1, 'pendaftaran', 150000.00, 1, '2026-04-15 13:29:00', NULL),
	(2, 'pengembangan', 500000.00, 1, '2026-04-15 13:29:01', NULL),
	(3, 'seragam', 950000.00, 1, '2026-04-15 13:29:02', NULL),
	(4, 'daftar ulang kls x', 555000.00, 1, '2026-04-15 13:29:02', NULL),
	(5, 'praktikum', 1850000.00, 1, '2026-04-15 13:29:03', NULL),
	(6, 'prakerin', 800000.00, 2, '2026-04-15 13:29:03', NULL),
	(7, 'daftar ulang kls xi', 555000.00, 2, '2026-04-15 13:29:04', NULL),
	(8, 'daftar ulang kls xii', 555000.00, 3, '2026-04-15 13:29:05', NULL),
	(9, 'dana akhir tahun', 690000.00, 3, '2026-04-15 13:29:06', NULL);

-- Dumping structure for table sistem_menejemen_sekolah.m_jurusan
CREATE TABLE IF NOT EXISTS `m_jurusan` (
  `id_jurusan` int(10) NOT NULL DEFAULT 0,
  `jurusan` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_jurusan`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistem_menejemen_sekolah.m_jurusan: ~5 rows (approximately)
REPLACE INTO `m_jurusan` (`id_jurusan`, `jurusan`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'RPL', '2026-04-14 12:19:35', '2026-04-14 12:19:37', NULL),
	(2, 'DKV', '2026-04-14 12:19:58', NULL, NULL),
	(3, 'TKJ', '2026-04-14 12:19:58', NULL, NULL),
	(4, 'BIDI', '2026-04-14 12:19:59', NULL, NULL),
	(5, 'AKUTANSI', '2026-04-14 12:20:00', NULL, NULL);

-- Dumping structure for table sistem_menejemen_sekolah.m_metode_pembayaran
CREATE TABLE IF NOT EXISTS `m_metode_pembayaran` (
  `id_metode_pembayaran` int(11) NOT NULL AUTO_INCREMENT,
  `metode_pembayaran` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_metode_pembayaran`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table sistem_menejemen_sekolah.m_metode_pembayaran: ~11 rows (approximately)
REPLACE INTO `m_metode_pembayaran` (`id_metode_pembayaran`, `metode_pembayaran`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'tunai', NULL, NULL, NULL),
	(2, 'transfer', NULL, NULL, NULL),
	(3, 'virtual account', NULL, NULL, NULL),
	(4, 'qris', NULL, NULL, NULL),
	(5, NULL, '2026-04-14 10:26:07', '2026-04-14 23:21:25', '2026-04-14 23:21:25'),
	(6, NULL, '2026-04-14 23:21:33', '2026-04-14 23:29:28', '2026-04-14 23:29:28'),
	(7, NULL, '2026-04-14 23:29:15', '2026-04-14 23:29:32', '2026-04-14 23:29:32'),
	(8, 'asdg', '2026-04-14 23:31:00', '2026-04-14 23:31:08', '2026-04-14 23:31:08'),
	(9, 'crypto', '2026-04-14 23:36:23', '2026-04-14 23:36:23', NULL),
	(10, NULL, '2026-04-15 07:32:25', '2026-04-15 07:34:55', '2026-04-15 07:34:55'),
	(11, 'tes', '2026-04-15 07:35:20', '2026-04-15 07:35:46', '2026-04-15 07:35:46');

-- Dumping structure for table sistem_menejemen_sekolah.m_siswa
CREATE TABLE IF NOT EXISTS `m_siswa` (
  `id_siswa` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nipd` varchar(20) NOT NULL,
  `nama_siswa` varchar(150) NOT NULL,
  `id_jurusan` int(10) NOT NULL DEFAULT 0,
  `id_tingkat_kelas` int(10) NOT NULL DEFAULT 0,
  `nama_ayah` varchar(50) DEFAULT NULL,
  `nama_ibu` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `status` enum('aktif','alumni','keluar') NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_siswa`),
  UNIQUE KEY `m_siswa_nipd_unique` (`nipd`),
  KEY `m_siswa_id_jurusan_foreign` (`id_jurusan`) USING BTREE,
  KEY `m_siswa_id_kelas_foreign` (`id_tingkat_kelas`) USING BTREE,
  CONSTRAINT `FK_m_siswa_m_jurusan` FOREIGN KEY (`id_jurusan`) REFERENCES `m_jurusan` (`id_jurusan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_m_siswa_m_tingkat_kelas` FOREIGN KEY (`id_tingkat_kelas`) REFERENCES `m_tingkat_kelas` (`id_tingkat_kelas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistem_menejemen_sekolah.m_siswa: ~4 rows (approximately)
REPLACE INTO `m_siswa` (`id_siswa`, `nipd`, `nama_siswa`, `id_jurusan`, `id_tingkat_kelas`, `nama_ayah`, `nama_ibu`, `alamat`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(2, '23241001', 'vincents', 1, 1, 'rudi', 'ipeh', 'lumpang', 'aktif', '2026-04-14 13:18:25', '2026-04-15 07:47:03', NULL),
	(4, '23241002', 'dongo', 1, 1, 'ay', 'ay', 'ay', 'aktif', NULL, '2026-04-14 06:28:49', '2026-04-14 06:28:49'),
	(12, '232410100', 'Teddy', 4, 2, 'a', 'a', 'a', 'aktif', '2026-04-14 10:47:59', '2026-04-14 10:47:59', NULL),
	(13, '23241004', 'kim-minju', 4, 2, 'a', 's', 'a', 'aktif', '2026-04-14 23:36:46', '2026-04-14 23:36:46', NULL);

-- Dumping structure for table sistem_menejemen_sekolah.m_spp
CREATE TABLE IF NOT EXISTS `m_spp` (
  `id_spp` int(11) NOT NULL AUTO_INCREMENT,
  `id_tingkat_kelas` int(11) NOT NULL DEFAULT 0,
  `id_jurusan` int(11) NOT NULL DEFAULT 0,
  `spp` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_spp`),
  KEY `FK_m_spp_m_tingkat_kelas_2` (`id_tingkat_kelas`),
  KEY `FK_m_spp_m_jurusan` (`id_jurusan`),
  CONSTRAINT `FK_m_spp_m_jurusan` FOREIGN KEY (`id_jurusan`) REFERENCES `m_jurusan` (`id_jurusan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_m_spp_m_tingkat_kelas` FOREIGN KEY (`id_tingkat_kelas`) REFERENCES `m_tingkat_kelas` (`id_tingkat_kelas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table sistem_menejemen_sekolah.m_spp: ~15 rows (approximately)
REPLACE INTO `m_spp` (`id_spp`, `id_tingkat_kelas`, `id_jurusan`, `spp`) VALUES
	(1, 1, 1, 325000),
	(2, 1, 2, 350000),
	(3, 1, 3, 300000),
	(4, 1, 4, 200000),
	(5, 1, 5, 400000),
	(6, 2, 1, 330000),
	(7, 2, 2, 355000),
	(8, 2, 3, 305000),
	(9, 2, 4, 205000),
	(10, 2, 5, 405000),
	(11, 3, 1, 335000),
	(12, 3, 2, 360000),
	(13, 3, 3, 320000),
	(14, 3, 4, 220000),
	(15, 3, 5, 410000);

-- Dumping structure for table sistem_menejemen_sekolah.m_tingkat_kelas
CREATE TABLE IF NOT EXISTS `m_tingkat_kelas` (
  `id_tingkat_kelas` int(10) NOT NULL AUTO_INCREMENT,
  `tingkat_kelas` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_tingkat_kelas`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistem_menejemen_sekolah.m_tingkat_kelas: ~3 rows (approximately)
REPLACE INTO `m_tingkat_kelas` (`id_tingkat_kelas`, `tingkat_kelas`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'X', '2026-04-14 12:20:25', NULL, NULL),
	(2, 'XI', '2026-04-14 12:20:26', NULL, NULL),
	(3, 'XII', '2026-04-14 12:20:26', NULL, NULL);

-- Dumping structure for table sistem_menejemen_sekolah.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistem_menejemen_sekolah.migrations: ~4 rows (approximately)
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, 'database_migration', 1),
	(2, '0001_01_01_000000_create_users_table', 2),
	(3, '0001_01_01_000001_create_cache_table', 3),
	(4, '2026_04_15_000000_add_timestamps_and_soft_deletes_to_m_metode_pembayaran_table', 4);

-- Dumping structure for table sistem_menejemen_sekolah.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistem_menejemen_sekolah.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table sistem_menejemen_sekolah.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistem_menejemen_sekolah.sessions: ~2 rows (approximately)
REPLACE INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('4zWc96WwD0OSQiSl561R8nbtJJSnHYBno5RLge8v', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiemRUUzVYWjU0Sm5MVnJENHZ1TUt6UDJ0VTZuRVI5UzNETUFuT2lJNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wZW1iYXlhcmFucy8yL2RldGFpbCI7czo1OiJyb3V0ZSI7czo0MzoiZmlsYW1lbnQuYWRtaW4ucmVzb3VyY2VzLnBlbWJheWFyYW5zLmRldGFpbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiIzZjhmMTMyYzAzYjhlZTAzODk1NGEzNDAxOGJkMTQ5NDgwYjVlM2RlYTFhZmQ1NWEyNGY2NjVlMDNkNGUwYzg2IjtzOjY6InRhYmxlcyI7YTo4OntzOjQwOiI5YzMyNjlmYmExN2QyOTY2Y2U2MDkzY2U3NDZkODhjM19jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoibmFtYV9zaXN3YSI7czo1OiJsYWJlbCI7czoxMDoiTmFtYSBTaXN3YSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTk6ImtlbGFzLnRpbmdrYXRfa2VsYXMiO3M6NToibGFiZWwiO3M6MTM6IlRpbmdrYXQgS2VsYXMiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE1OiJqdXJ1c2FuLmp1cnVzYW4iO3M6NToibGFiZWwiO3M6NzoiSnVydXNhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IkNyZWF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO319czo0MDoiYWY1ZmE5YmYxMWRmZGI4YTg0MmEzNGE1N2UwY2M0MmVfY29sdW1ucyI7YTozOntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTE6ImplbmlzX2JpYXlhIjtzOjU6ImxhYmVsIjtzOjExOiJKZW5pcyBCaWF5YSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6Nzoibm9taW5hbCI7czo1OiJsYWJlbCI7czo3OiJOb21pbmFsIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMzoibm9taW5hbF9iYXlhciI7czo1OiJsYWJlbCI7czoxMzoiTm9taW5hbCBCYXlhciI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319czo0MDoiMTBmZWU4MWQ4NzlkNzMyNjc1ODUzNDE1NmIyNTdkMzNfY29sdW1ucyI7YTozOntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTE6ImplbmlzX2JpYXlhIjtzOjU6ImxhYmVsIjtzOjExOiJKZW5pcyBCaWF5YSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6Nzoibm9taW5hbCI7czo1OiJsYWJlbCI7czo3OiJOb21pbmFsIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMzoibm9taW5hbF9iYXlhciI7czo1OiJsYWJlbCI7czoxMzoiTm9taW5hbCBCYXlhciI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319czo0MDoiZGRhZGU0YTllZTk5NDA0YmZkY2Q5M2RhYmU0OWFkNDZfY29sdW1ucyI7YTozOntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTE6ImplbmlzX2JpYXlhIjtzOjU6ImxhYmVsIjtzOjExOiJKZW5pcyBCaWF5YSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6Nzoibm9taW5hbCI7czo1OiJsYWJlbCI7czo3OiJOb21pbmFsIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMzoibm9taW5hbF9iYXlhciI7czo1OiJsYWJlbCI7czoxMzoiTm9taW5hbCBCYXlhciI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319czo0MDoiMGFjMmNiMmFjYjE3NzMwMTg4ZTdmNDg1YWNjMjU2ZGNfY29sdW1ucyI7YTo1OntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTE6ImplbmlzX2JpYXlhIjtzOjU6ImxhYmVsIjtzOjExOiJKZW5pcyBiaWF5YSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6Nzoibm9taW5hbCI7czo1OiJsYWJlbCI7czo3OiJOb21pbmFsIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNjoiaWRfdGluZ2thdF9rZWxhcyI7czo1OiJsYWJlbCI7czoxMToiVW50dWsgS2VsYXMiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJDcmVhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aTo0O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJVcGRhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fXM6NDA6IjllODEwNzI5MmRlODg5YmUwMDIwZDdiY2Y1NWRlNjUzX2NvbHVtbnMiO2E6NDp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjc6Imp1cnVzYW4iO3M6NToibGFiZWwiO3M6NzoiSnVydXNhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IkNyZWF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6InVwZGF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IlVwZGF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImRlbGV0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IkRlbGV0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO319czo0MDoiY2U0NTkxM2ZjMzU1M2E5MzdjMjYwM2E1NzNhOGE1YjdfY29sdW1ucyI7YToxOntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTc6Im1ldG9kZV9wZW1iYXlhcmFuIjtzOjU6ImxhYmVsIjtzOjE3OiJNZXRvZGUgUGVtYmF5YXJhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319czo0MDoiMTk1NDU4YWM1Y2M4NGNiM2JkMDk0YzA2Y2UzZDNiZTZfY29sdW1ucyI7YTo0OntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NDoibmlwZCI7czo1OiJsYWJlbCI7czo0OiJOaXBkIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoibmFtYV9zaXN3YSI7czo1OiJsYWJlbCI7czoxMDoiTmFtYSBzaXN3YSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTU6Imp1cnVzYW4uanVydXNhbiI7czo1OiJsYWJlbCI7czo3OiJKdXJ1c2FuIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxOToia2VsYXMudGluZ2thdF9rZWxhcyI7czo1OiJsYWJlbCI7czo1OiJLZWxhcyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319fX0=', 1776359405),
	('RATbZZdSpuzhJQ6bXa0PJAptalbjoAOJ0Tqzjftb', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiMGhiM2o4VjF0UTFqQ05TdE5LZHZuc004Y3laWklwcDNwM0pOSmw3SSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjQ4OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vcGVtYmF5YXJhbnMvMi9kZXRhaWwiO3M6NToicm91dGUiO3M6NDM6ImZpbGFtZW50LmFkbWluLnJlc291cmNlcy5wZW1iYXlhcmFucy5kZXRhaWwiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiIxZjM5MGU4MDUwNmI5ZGEyOTUzZTMyZGNmNjBkYmRmNDc1ZTI3ZjBkMDBkNWZmYzUwODkyYmFlNTc1ODhlYjJmIjtzOjY6InRhYmxlcyI7YTo0OntzOjQwOiI5YzMyNjlmYmExN2QyOTY2Y2U2MDkzY2U3NDZkODhjM19jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoibmFtYV9zaXN3YSI7czo1OiJsYWJlbCI7czoxMDoiTmFtYSBTaXN3YSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTk6ImtlbGFzLnRpbmdrYXRfa2VsYXMiO3M6NToibGFiZWwiO3M6MTM6IlRpbmdrYXQgS2VsYXMiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE1OiJqdXJ1c2FuLmp1cnVzYW4iO3M6NToibGFiZWwiO3M6NzoiSnVydXNhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IkNyZWF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO319czo0MDoiYWY1ZmE5YmYxMWRmZGI4YTg0MmEzNGE1N2UwY2M0MmVfY29sdW1ucyI7YToyOntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTE6ImplbmlzX2JpYXlhIjtzOjU6ImxhYmVsIjtzOjExOiJKZW5pcyBCaWF5YSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6Nzoibm9taW5hbCI7czo1OiJsYWJlbCI7czo3OiJOb21pbmFsIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX1zOjQwOiIxMGZlZTgxZDg3OWQ3MzI2NzU4NTM0MTU2YjI1N2QzM19jb2x1bW5zIjthOjI6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMToiamVuaXNfYmlheWEiO3M6NToibGFiZWwiO3M6MTE6IkplbmlzIEJpYXlhIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo3OiJub21pbmFsIjtzOjU6ImxhYmVsIjtzOjc6Ik5vbWluYWwiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fXM6NDA6ImRkYWRlNGE5ZWU5OTQwNGJmZGNkOTNkYWJlNDlhZDQ2X2NvbHVtbnMiO2E6Mjp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjExOiJqZW5pc19iaWF5YSI7czo1OiJsYWJlbCI7czoxMToiSmVuaXMgQmlheWEiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjc6Im5vbWluYWwiO3M6NToibGFiZWwiO3M6NzoiTm9taW5hbCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319fX0=', 1776363842),
	('v5Q3RUWjzwp1nN1h7CCA323JWEuu4As1H0ybYlO0', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoieVhRSzY4bzBXTHZsb29SY2dpeFg2aU9RMzRxNGV1TzNqcTN5Yk9DaCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjQ5OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vcGVtYmF5YXJhbnMvMTIvZGV0YWlsIjtzOjU6InJvdXRlIjtzOjQzOiJmaWxhbWVudC5hZG1pbi5yZXNvdXJjZXMucGVtYmF5YXJhbnMuZGV0YWlsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiMWYzOTBlODA1MDZiOWRhMjk1M2UzMmRjZjYwZGJkZjQ3NWUyN2YwZDAwZDVmZmM1MDg5MmJhZTU3NTg4ZWIyZiI7czo2OiJ0YWJsZXMiO2E6NTp7czo0MDoiOWMzMjY5ZmJhMTdkMjk2NmNlNjA5M2NlNzQ2ZDg4YzNfY29sdW1ucyI7YTo0OntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6Im5hbWFfc2lzd2EiO3M6NToibGFiZWwiO3M6MTA6Ik5hbWEgU2lzd2EiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE5OiJrZWxhcy50aW5na2F0X2tlbGFzIjtzOjU6ImxhYmVsIjtzOjEzOiJUaW5na2F0IEtlbGFzIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNToianVydXNhbi5qdXJ1c2FuIjtzOjU6ImxhYmVsIjtzOjc6Ikp1cnVzYW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJDcmVhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fXM6NDA6ImFmNWZhOWJmMTFkZmRiOGE4NDJhMzRhNTdlMGNjNDJlX2NvbHVtbnMiO2E6NDp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjExOiJqZW5pc19iaWF5YSI7czo1OiJsYWJlbCI7czoxMToiSmVuaXMgQmlheWEiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjc6Im5vbWluYWwiO3M6NToibGFiZWwiO3M6NzoiTm9taW5hbCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTY6Im5vbWluYWxfdGVyYmF5YXIiO3M6NToibGFiZWwiO3M6MTY6Ik5vbWluYWwgVGVyYmF5YXIiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjk6IlR1bmdnYWthbiI7czo1OiJsYWJlbCI7czo5OiJUdW5nZ2FrYW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fXM6NDA6IjEwZmVlODFkODc5ZDczMjY3NTg1MzQxNTZiMjU3ZDMzX2NvbHVtbnMiO2E6NDp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjExOiJqZW5pc19iaWF5YSI7czo1OiJsYWJlbCI7czoxMToiSmVuaXMgQmlheWEiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjc6Im5vbWluYWwiO3M6NToibGFiZWwiO3M6NzoiTm9taW5hbCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTY6Im5vbWluYWxfdGVyYmF5YXIiO3M6NToibGFiZWwiO3M6MTY6Ik5vbWluYWwgVGVyYmF5YXIiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjk6IlR1bmdnYWthbiI7czo1OiJsYWJlbCI7czo5OiJUdW5nZ2FrYW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fXM6NDA6ImRkYWRlNGE5ZWU5OTQwNGJmZGNkOTNkYWJlNDlhZDQ2X2NvbHVtbnMiO2E6NDp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjExOiJqZW5pc19iaWF5YSI7czo1OiJsYWJlbCI7czoxMToiSmVuaXMgQmlheWEiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjc6Im5vbWluYWwiO3M6NToibGFiZWwiO3M6NzoiTm9taW5hbCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTY6Im5vbWluYWxfdGVyYmF5YXIiO3M6NToibGFiZWwiO3M6MTY6Ik5vbWluYWwgVGVyYmF5YXIiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjk6IlR1bmdnYWthbiI7czo1OiJsYWJlbCI7czo5OiJUdW5nZ2FrYW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fXM6NDA6IjllODEwNzI5MmRlODg5YmUwMDIwZDdiY2Y1NWRlNjUzX2NvbHVtbnMiO2E6NDp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjc6Imp1cnVzYW4iO3M6NToibGFiZWwiO3M6NzoiSnVydXNhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IkNyZWF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6InVwZGF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IlVwZGF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImRlbGV0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IkRlbGV0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO319fX0=', 1776400612);

-- Dumping structure for table sistem_menejemen_sekolah.trx_pembayaran
CREATE TABLE IF NOT EXISTS `trx_pembayaran` (
  `id_trx_pembayaran` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_biaya` int(10) unsigned NOT NULL DEFAULT 0,
  `id_siswa` bigint(20) unsigned NOT NULL,
  `id_metode_pembayaran` int(11) NOT NULL DEFAULT 0,
  `nominal` decimal(12,2) NOT NULL,
  `tanggal_bayar` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_trx_pembayaran`),
  KEY `trx_pembayaran_id_tagihan_foreign` (`id_biaya`) USING BTREE,
  KEY `FK_trx_pembayaran_m_siswa` (`id_siswa`),
  KEY `FK_trx_pembayaran_m_metode_pembayaran` (`id_metode_pembayaran`),
  CONSTRAINT `FK_trx_pembayaran_m_biaya` FOREIGN KEY (`id_biaya`) REFERENCES `m_biaya` (`id_biaya`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_trx_pembayaran_m_metode_pembayaran` FOREIGN KEY (`id_metode_pembayaran`) REFERENCES `m_metode_pembayaran` (`id_metode_pembayaran`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_trx_pembayaran_m_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `m_siswa` (`id_siswa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistem_menejemen_sekolah.trx_pembayaran: ~2 rows (approximately)
REPLACE INTO `trx_pembayaran` (`id_trx_pembayaran`, `id_biaya`, `id_siswa`, `id_metode_pembayaran`, `nominal`, `tanggal_bayar`, `created_at`, `updated_at`) VALUES
	(1, 1, 12, 1, 10000.00, '2026-04-16', NULL, '2026-04-15 20:10:18'),
	(3, 2, 12, 6, 50000.00, '0000-00-00', NULL, NULL);

-- Dumping structure for table sistem_menejemen_sekolah.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistem_menejemen_sekolah.users: ~1 rows (approximately)
REPLACE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$41PpMTuif1X2QUJu3JrAR.W28HxnNyGljOrI5360vSVBEaZ5y/V6S', NULL, '2026-04-14 05:43:34', '2026-04-14 05:43:34');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
