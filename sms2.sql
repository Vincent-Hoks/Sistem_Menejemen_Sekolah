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
  PRIMARY KEY (`id_biaya_to_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table sistem_menejemen_sekolah.biaya_to_kelas: ~0 rows (approximately)
DELETE FROM `biaya_to_kelas`;

-- Dumping structure for table sistem_menejemen_sekolah.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistem_menejemen_sekolah.cache: ~0 rows (approximately)
DELETE FROM `cache`;

-- Dumping structure for table sistem_menejemen_sekolah.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistem_menejemen_sekolah.cache_locks: ~0 rows (approximately)
DELETE FROM `cache_locks`;

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

-- Dumping data for table sistem_menejemen_sekolah.m_biaya: ~10 rows (approximately)
DELETE FROM `m_biaya`;
INSERT INTO `m_biaya` (`id_biaya`, `jenis_biaya`, `nominal`, `id_tingkat_kelas`, `created_at`, `updated_at`) VALUES
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
  `id_jurusan` int(10) unsigned NOT NULL DEFAULT 0,
  `jurusan` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_jurusan`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistem_menejemen_sekolah.m_jurusan: ~5 rows (approximately)
DELETE FROM `m_jurusan`;
INSERT INTO `m_jurusan` (`id_jurusan`, `jurusan`, `created_at`, `updated_at`, `deleted_at`) VALUES
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
DELETE FROM `m_metode_pembayaran`;
INSERT INTO `m_metode_pembayaran` (`id_metode_pembayaran`, `metode_pembayaran`, `created_at`, `updated_at`, `deleted_at`) VALUES
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
  `id_jurusan` int(10) unsigned NOT NULL DEFAULT 0,
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
DELETE FROM `m_siswa`;
INSERT INTO `m_siswa` (`id_siswa`, `nipd`, `nama_siswa`, `id_jurusan`, `id_tingkat_kelas`, `nama_ayah`, `nama_ibu`, `alamat`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(2, '23241001', 'vincents', 1, 1, 'rudi', 'ipeh', 'lumpang', 'aktif', '2026-04-14 13:18:25', '2026-04-15 07:47:03', NULL),
	(4, '23241002', 'dongo', 1, 1, 'ay', 'ay', 'ay', 'aktif', NULL, '2026-04-14 06:28:49', '2026-04-14 06:28:49'),
	(12, '232410100', 'Teddy', 4, 2, 'a', 'a', 'a', 'aktif', '2026-04-14 10:47:59', '2026-04-14 10:47:59', NULL),
	(13, '23241004', 'kim-minju', 4, 2, 'a', 's', 'a', 'aktif', '2026-04-14 23:36:46', '2026-04-14 23:36:46', NULL);

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
DELETE FROM `m_tingkat_kelas`;
INSERT INTO `m_tingkat_kelas` (`id_tingkat_kelas`, `tingkat_kelas`, `created_at`, `updated_at`, `deleted_at`) VALUES
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

-- Dumping data for table sistem_menejemen_sekolah.migrations: ~2 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
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
DELETE FROM `password_reset_tokens`;

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

-- Dumping data for table sistem_menejemen_sekolah.sessions: ~1 rows (approximately)
DELETE FROM `sessions`;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('DYHHdjTISycwAk5HZOSly6tYDMs7uZl8VVqNN8sz', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoidGk2WXlEUFI5aHhFaGo3alQ4OHJzbUpKUHNlVjdrWVpzRzN1SFJZUSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjM0OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vYmlheWFzIjtzOjU6InJvdXRlIjtzOjM3OiJmaWxhbWVudC5hZG1pbi5yZXNvdXJjZXMuYmlheWFzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiM2Y4ZjEzMmMwM2I4ZWUwMzg5NTRhMzQwMThiZDE0OTQ4MGI1ZTNkZWExYWZkNTVhMjRmNjY1ZTAzZDRlMGM4NiI7czo2OiJ0YWJsZXMiO2E6Njp7czo0MDoiMGMxMjg1Y2JlMDM5ZWRiZmY2NjlmMjk0MGYxMWEzODVfY29sdW1ucyI7YTozOntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTg6InRpbmdrYXRLZWxhcy5rZWxhcyI7czo1OiJsYWJlbCI7czo1OiJLZWxhcyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MjI6ImJpYXlhLmtldGVyYW5nYW5fYmlheWEiO3M6NToibGFiZWwiO3M6NToiQmlheWEiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEzOiJiaWF5YS5ub21pbmFsIjtzOjU6ImxhYmVsIjtzOjc6Ik5vbWluYWwiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fXM6NDA6IjBhYzJjYjJhY2IxNzczMDE4OGU3ZjQ4NWFjYzI1NmRjX2NvbHVtbnMiO2E6NTp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjExOiJqZW5pc19iaWF5YSI7czo1OiJsYWJlbCI7czoxMToiSmVuaXMgYmlheWEiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjc6Im5vbWluYWwiO3M6NToibGFiZWwiO3M6NzoiTm9taW5hbCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTY6ImlkX3RpbmdrYXRfa2VsYXMiO3M6NToibGFiZWwiO3M6MTE6IlVudHVrIEtlbGFzIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiQ3JlYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiVXBkYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX1zOjQwOiI5ZTgxMDcyOTJkZTg4OWJlMDAyMGQ3YmNmNTVkZTY1M19jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo3OiJqdXJ1c2FuIjtzOjU6ImxhYmVsIjtzOjc6Ikp1cnVzYW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJDcmVhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJVcGRhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJkZWxldGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJEZWxldGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fXM6NDA6ImNlNDU5MTNmYzM1NTNhOTM3YzI2MDNhNTczYThhNWI3X2NvbHVtbnMiO2E6MTp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE3OiJtZXRvZGVfcGVtYmF5YXJhbiI7czo1OiJsYWJlbCI7czoxNzoiTWV0b2RlIFBlbWJheWFyYW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fXM6NDA6IjE5NTQ1OGFjNWNjODRjYjNiZDA5NGMwNmNlM2QzYmU2X2NvbHVtbnMiO2E6NDp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6Im5pcGQiO3M6NToibGFiZWwiO3M6NDoiTmlwZCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6Im5hbWFfc2lzd2EiO3M6NToibGFiZWwiO3M6MTA6Ik5hbWEgc2lzd2EiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE1OiJqdXJ1c2FuLmp1cnVzYW4iO3M6NToibGFiZWwiO3M6NzoiSnVydXNhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTk6ImtlbGFzLnRpbmdrYXRfa2VsYXMiO3M6NToibGFiZWwiO3M6NToiS2VsYXMiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fXM6NDA6IjljMzI2OWZiYTE3ZDI5NjZjZTYwOTNjZTc0NmQ4OGMzX2NvbHVtbnMiO2E6NDp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6Im5pcGQiO3M6NToibGFiZWwiO3M6NDoiTmlwZCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6Im5hbWFfc2lzd2EiO3M6NToibGFiZWwiO3M6MTA6Ik5hbWEgc2lzd2EiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE1OiJqdXJ1c2FuLmp1cnVzYW4iO3M6NToibGFiZWwiO3M6NzoiSnVydXNhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTk6ImtlbGFzLnRpbmdrYXRfa2VsYXMiO3M6NToibGFiZWwiO3M6NToiS2VsYXMiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fX1zOjg6ImZpbGFtZW50IjthOjA6e319', 1776265891);

-- Dumping structure for table sistem_menejemen_sekolah.t_tagihan
CREATE TABLE IF NOT EXISTS `t_tagihan` (
  `id_tagihan` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_siswa` bigint(20) unsigned NOT NULL,
  `id_biaya` bigint(20) unsigned NOT NULL,
  `bulan` tinyint(4) DEFAULT NULL,
  `tahun` year(4) NOT NULL,
  `jumlah_tagihan` decimal(12,2) NOT NULL,
  `tanggal_tagihan` date NOT NULL,
  `tanggal_jatuh_tempo` date DEFAULT NULL,
  `status_tagihan` enum('belum_bayar','sebagian','lunas') NOT NULL DEFAULT 'belum_bayar',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_tagihan`),
  KEY `t_tagihan_id_siswa_foreign` (`id_siswa`),
  KEY `t_tagihan_id_biaya_foreign` (`id_biaya`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistem_menejemen_sekolah.t_tagihan: ~0 rows (approximately)
DELETE FROM `t_tagihan`;

-- Dumping structure for table sistem_menejemen_sekolah.trx_pembayaran
CREATE TABLE IF NOT EXISTS `trx_pembayaran` (
  `id_trx_pembayaran` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_tagihan` bigint(20) unsigned NOT NULL,
  `id_siswa` bigint(20) unsigned NOT NULL,
  `id_metode_pembayaran` int(11) NOT NULL DEFAULT 0,
  `nominal` decimal(12,2) NOT NULL,
  `tanggal_bayar` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_trx_pembayaran`),
  KEY `trx_pembayaran_id_tagihan_foreign` (`id_tagihan`),
  KEY `trx_pembayaran_id_siswa_foreign` (`id_siswa`),
  KEY `FK_trx_pembayaran_m_metode_pembayaran` (`id_metode_pembayaran`),
  CONSTRAINT `FK_trx_pembayaran_m_metode_pembayaran` FOREIGN KEY (`id_metode_pembayaran`) REFERENCES `m_metode_pembayaran` (`id_metode_pembayaran`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `trx_pembayaran_id_siswa_foreign` FOREIGN KEY (`id_siswa`) REFERENCES `m_siswa` (`id_siswa`),
  CONSTRAINT `trx_pembayaran_id_tagihan_foreign` FOREIGN KEY (`id_tagihan`) REFERENCES `t_tagihan` (`id_tagihan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistem_menejemen_sekolah.trx_pembayaran: ~0 rows (approximately)
DELETE FROM `trx_pembayaran`;

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

-- Dumping data for table sistem_menejemen_sekolah.users: ~0 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$41PpMTuif1X2QUJu3JrAR.W28HxnNyGljOrI5360vSVBEaZ5y/V6S', NULL, '2026-04-14 05:43:34', '2026-04-14 05:43:34');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
