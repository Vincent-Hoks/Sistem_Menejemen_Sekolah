-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping data for table sistem_menejemen_sekolah.biaya_to_kelas: ~0 rows (approximately)

-- Dumping data for table sistem_menejemen_sekolah.cache: ~2 rows (approximately)
REPLACE INTO `cache` (`key`, `value`, `expiration`) VALUES
	('laravel-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6', 'i:2;', 1776426771),
	('laravel-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6:timer', 'i:1776426771;', 1776426771);

-- Dumping data for table sistem_menejemen_sekolah.cache_locks: ~0 rows (approximately)

-- Dumping data for table sistem_menejemen_sekolah.failed_jobs: ~0 rows (approximately)

-- Dumping data for table sistem_menejemen_sekolah.invoices: ~0 rows (approximately)

-- Dumping data for table sistem_menejemen_sekolah.jobs: ~0 rows (approximately)

-- Dumping data for table sistem_menejemen_sekolah.job_batches: ~0 rows (approximately)

-- Dumping data for table sistem_menejemen_sekolah.migrations: ~0 rows (approximately)
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, 'database_migration', 1),
	(2, '0001_01_01_000000_create_users_table', 2),
	(3, '0001_01_01_000001_create_cache_table', 3),
	(4, '2026_04_15_000000_add_timestamps_and_soft_deletes_to_m_metode_pembayaran_table', 4),
	(5, '0001_01_01_000002_create_jobs_table', 5),
	(6, '2026_04_17_000000_fix_m_jurusan_auto_increment', 5),
	(10, '2026_04_17_000001_fix_m_biaya_auto_increment', 6),
	(11, '2026_04_18_000001_add_timestamps_to_trx_spp', 7);

-- Dumping data for table sistem_menejemen_sekolah.m_biaya: ~8 rows (approximately)
REPLACE INTO `m_biaya` (`id_biaya`, `jenis_biaya`, `nominal`, `id_tingkat_kelas`, `created_at`, `updated_at`) VALUES
	(1, 'pendaftaran', 150000.00, 1, '2026-04-15 13:29:00', NULL),
	(2, 'pengembangan', 500000.00, 1, '2026-04-15 13:29:01', NULL),
	(3, 'seragam', 950000.00, 1, '2026-04-15 13:29:02', NULL),
	(4, 'daftar ulang kls x', 555000.00, 1, '2026-04-15 13:29:02', NULL),
	(5, 'praktikum', 1850000.00, 1, '2026-04-15 13:29:03', NULL),
	(6, 'prakerin', 800000.00, 2, '2026-04-15 13:29:03', NULL),
	(7, 'daftar ulang kls xi', 555000.00, 2, '2026-04-15 13:29:04', NULL),
	(8, 'daftar ulang kls xii', 555000.00, 3, '2026-04-15 13:29:05', NULL),
	(9, 'dana akhir tahun', 690000.00, 3, '2026-04-15 13:29:06', NULL),
	(10, 'Magang', 180000.00, 3, NULL, NULL);

-- Dumping data for table sistem_menejemen_sekolah.m_biaya_backup: ~10 rows (approximately)
REPLACE INTO `m_biaya_backup` (`id_biaya`, `jenis_biaya`, `nominal`, `id_tingkat_kelas`, `created_at`, `updated_at`) VALUES
	(0, 'Kas', 100000.00, 1, NULL, NULL),
	(1, 'pendaftaran', 150000.00, 1, '2026-04-15 13:29:00', NULL),
	(2, 'pengembangan', 500000.00, 1, '2026-04-15 13:29:01', NULL),
	(3, 'seragam', 950000.00, 1, '2026-04-15 13:29:02', NULL),
	(4, 'daftar ulang kls x', 555000.00, 1, '2026-04-15 13:29:02', NULL),
	(5, 'praktikum', 1850000.00, 1, '2026-04-15 13:29:03', NULL),
	(6, 'prakerin', 800000.00, 2, '2026-04-15 13:29:03', NULL),
	(7, 'daftar ulang kls xi', 555000.00, 2, '2026-04-15 13:29:04', NULL),
	(8, 'daftar ulang kls xii', 555000.00, 3, '2026-04-15 13:29:05', NULL),
	(9, 'dana akhir tahun', 690000.00, 3, '2026-04-15 13:29:06', NULL);

-- Dumping data for table sistem_menejemen_sekolah.m_jurusan: ~7 rows (approximately)
REPLACE INTO `m_jurusan` (`id_jurusan`, `jurusan`, `spp_pokok_jurusan`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'RPL', 300000, '2026-04-14 12:19:35', '2026-04-14 12:19:37', NULL),
	(2, 'DKV', 400000, '2026-04-14 12:19:58', NULL, NULL),
	(3, 'TKJ', 270000, '2026-04-14 12:19:58', NULL, NULL),
	(4, 'BIDI', 200000, '2026-04-14 12:19:59', NULL, NULL),
	(5, 'AKUTANSI', 230000, '2026-04-14 12:20:00', NULL, NULL),
	(6, 'Cyber', 240000, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(7, 'TKR', 340000, '2026-04-17 00:25:59', '2026-04-17 06:37:55', '2026-04-17 06:37:55'),
	(8, 'Tata Boga', 200000, '2026-04-17 02:13:43', '2026-04-17 06:37:39', '2026-04-17 06:37:39');

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
	(11, 'tes', '2026-04-15 07:35:20', '2026-04-15 07:35:46', '2026-04-15 07:35:46'),
	(12, 'Test2', '2026-04-17 02:14:14', '2026-04-17 02:14:14', NULL),
	(13, 'Test1', '2026-04-17 03:18:06', '2026-04-17 03:18:06', NULL);

-- Dumping data for table sistem_menejemen_sekolah.m_siswa: ~4 rows (approximately)
REPLACE INTO `m_siswa` (`id_siswa`, `nipd`, `nama_siswa`, `id_jurusan`, `id_tingkat_kelas`, `nama_ayah`, `nama_ibu`, `alamat`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(12, '232410100', 'Teddy', 4, 2, 'a', 'a', 'a', 'aktif', '2026-04-14 10:47:59', '2026-04-17 08:24:33', '2026-04-17 08:24:33'),
	(45, '10001', 'Andi', 1, 1, 'Ayah Andi', 'Ibu Andi', 'Alamat 1', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(46, '10002', 'Budi', 1, 1, 'Ayah Budi', 'Ibu Budi', 'Alamat 2', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(47, '10003', 'Cahyo', 1, 1, 'Ayah Cahyo', 'Ibu Cahyo', 'Alamat 3', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(48, '10004', 'Dimas', 1, 1, 'Ayah Dimas', 'Ibu Dimas', 'Alamat 4', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(49, '10005', 'Eko', 1, 1, 'Ayah Eko', 'Ibu Eko', 'Alamat 5', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(50, '10006', 'Fajar', 1, 1, 'Ayah Fajar', 'Ibu Fajar', 'Alamat 6', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(51, '10007', 'Galih', 1, 1, 'Ayah Galih', 'Ibu Galih', 'Alamat 7', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(52, '10008', 'Hadi', 1, 1, 'Ayah Hadi', 'Ibu Hadi', 'Alamat 8', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(53, '10009', 'Iqbal', 1, 1, 'Ayah Iqbal', 'Ibu Iqbal', 'Alamat 9', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(54, '10010', 'Joko', 1, 1, 'Ayah Joko', 'Ibu Joko', 'Alamat 10', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(55, '10011', 'Kevin', 1, 2, 'Ayah Kevin', 'Ibu Kevin', 'Alamat 11', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(56, '10012', 'Luthfi', 1, 2, 'Ayah Luthfi', 'Ibu Luthfi', 'Alamat 12', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(57, '10013', 'Miko', 1, 2, 'Ayah Miko', 'Ibu Miko', 'Alamat 13', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(58, '10014', 'Naufal', 1, 2, 'Ayah Naufal', 'Ibu Naufal', 'Alamat 14', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(59, '10015', 'Ozan', 1, 2, 'Ayah Ozan', 'Ibu Ozan', 'Alamat 15', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(60, '10016', 'Putra', 1, 2, 'Ayah Putra', 'Ibu Putra', 'Alamat 16', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(61, '10017', 'Rafi', 1, 2, 'Ayah Rafi', 'Ibu Rafi', 'Alamat 17', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(62, '10018', 'Satria', 1, 2, 'Ayah Satria', 'Ibu Satria', 'Alamat 18', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(63, '10019', 'Tegar', 1, 2, 'Ayah Tegar', 'Ibu Tegar', 'Alamat 19', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(64, '10020', 'Umar', 1, 2, 'Ayah Umar', 'Ibu Umar', 'Alamat 20', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(65, '10021', 'Vino', 1, 3, 'Ayah Vino', 'Ibu Vino', 'Alamat 21', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(66, '10022', 'Wahyu', 1, 3, 'Ayah Wahyu', 'Ibu Wahyu', 'Alamat 22', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(67, '10023', 'Yoga', 1, 3, 'Ayah Yoga', 'Ibu Yoga', 'Alamat 23', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(68, '10024', 'Zidan', 1, 3, 'Ayah Zidan', 'Ibu Zidan', 'Alamat 24', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(69, '10025', 'Arga', 1, 3, 'Ayah Arga', 'Ibu Arga', 'Alamat 25', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(70, '10026', 'Bagas', 1, 3, 'Ayah Bagas', 'Ibu Bagas', 'Alamat 26', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(71, '10027', 'Chandra', 1, 3, 'Ayah Chandra', 'Ibu Chandra', 'Alamat 27', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(72, '10028', 'Dion', 1, 3, 'Ayah Dion', 'Ibu Dion', 'Alamat 28', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(73, '10029', 'Erlangga', 1, 3, 'Ayah Erlangga', 'Ibu Erlangga', 'Alamat 29', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(74, '10030', 'Farel', 1, 3, 'Ayah Farel', 'Ibu Farel', 'Alamat 30', 'aktif', '2026-04-17 15:39:59', '2026-04-17 15:39:59', NULL),
	(75, '11001', 'Rizky', 3, 1, 'Ayah Rizky', 'Ibu Rizky', 'Alamat 1', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(76, '11002', 'Adit', 3, 1, 'Ayah Adit', 'Ibu Adit', 'Alamat 2', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(77, '11003', 'Farhan', 3, 1, 'Ayah Farhan', 'Ibu Farhan', 'Alamat 3', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(78, '11004', 'Yusuf', 3, 1, 'Ayah Yusuf', 'Ibu Yusuf', 'Alamat 4', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(79, '11005', 'Rangga', 3, 1, 'Ayah Rangga', 'Ibu Rangga', 'Alamat 5', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(80, '11006', 'Dani', 3, 1, 'Ayah Dani', 'Ibu Dani', 'Alamat 6', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(81, '11007', 'Bayu', 3, 1, 'Ayah Bayu', 'Ibu Bayu', 'Alamat 7', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(82, '11008', 'Rama', 3, 1, 'Ayah Rama', 'Ibu Rama', 'Alamat 8', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(83, '11009', 'Alif', 3, 1, 'Ayah Alif', 'Ibu Alif', 'Alamat 9', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(84, '11010', 'Reza', 3, 1, 'Ayah Reza', 'Ibu Reza', 'Alamat 10', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(85, '11011', 'Fauzan', 3, 2, 'Ayah Fauzan', 'Ibu Fauzan', 'Alamat 11', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(86, '11012', 'Ilham', 3, 2, 'Ayah Ilham', 'Ibu Ilham', 'Alamat 12', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(87, '11013', 'Akbar', 3, 2, 'Ayah Akbar', 'Ibu Akbar', 'Alamat 13', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(88, '11014', 'Dika', 3, 2, 'Ayah Dika', 'Ibu Dika', 'Alamat 14', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(89, '11015', 'Nanda', 3, 2, 'Ayah Nanda', 'Ibu Nanda', 'Alamat 15', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(90, '11016', 'Faris', 3, 2, 'Ayah Faris', 'Ibu Faris', 'Alamat 16', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(91, '11017', 'Iqra', 3, 2, 'Ayah Iqra', 'Ibu Iqra', 'Alamat 17', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(92, '11018', 'Arif', 3, 2, 'Ayah Arif', 'Ibu Arif', 'Alamat 18', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(93, '11019', 'Rizal', 3, 2, 'Ayah Rizal', 'Ibu Rizal', 'Alamat 19', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(94, '11020', 'Hendra', 3, 2, 'Ayah Hendra', 'Ibu Hendra', 'Alamat 20', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(95, '11021', 'Saputra', 3, 3, 'Ayah Saputra', 'Ibu Saputra', 'Alamat 21', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(96, '11022', 'Pratama', 3, 3, 'Ayah Pratama', 'Ibu Pratama', 'Alamat 22', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(97, '11023', 'Firmansyah', 3, 3, 'Ayah Firmansyah', 'Ibu Firmansyah', 'Alamat 23', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(98, '11024', 'Maulana', 3, 3, 'Ayah Maulana', 'Ibu Maulana', 'Alamat 24', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(99, '11025', 'Kurniawan', 3, 3, 'Ayah Kurniawan', 'Ibu Kurniawan', 'Alamat 25', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(100, '11026', 'Setiawan', 3, 3, 'Ayah Setiawan', 'Ibu Setiawan', 'Alamat 26', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(101, '11027', 'Wibowo', 3, 3, 'Ayah Wibowo', 'Ibu Wibowo', 'Alamat 27', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(102, '11028', 'Nugroho', 3, 3, 'Ayah Nugroho', 'Ibu Nugroho', 'Alamat 28', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(103, '11029', 'Santoso', 3, 3, 'Ayah Santoso', 'Ibu Santoso', 'Alamat 29', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(104, '11030', 'Hidayat', 3, 3, 'Ayah Hidayat', 'Ibu Hidayat', 'Alamat 30', 'aktif', '2026-04-17 15:41:27', '2026-04-17 15:41:27', NULL),
	(135, '12001', 'Adrian', 2, 1, 'Ayah Adrian', 'Ibu Adrian', 'Alamat 1', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(136, '12002', 'Bintang', 2, 1, 'Ayah Bintang', 'Ibu Bintang', 'Alamat 2', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(137, '12003', 'Cesar', 2, 1, 'Ayah Cesar', 'Ibu Cesar', 'Alamat 3', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(138, '12004', 'Darren', 2, 1, 'Ayah Darren', 'Ibu Darren', 'Alamat 4', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(139, '12005', 'Elvan', 2, 1, 'Ayah Elvan', 'Ibu Elvan', 'Alamat 5', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(140, '12006', 'Fabian', 2, 1, 'Ayah Fabian', 'Ibu Fabian', 'Alamat 6', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(141, '12007', 'Gerry', 2, 1, 'Ayah Gerry', 'Ibu Gerry', 'Alamat 7', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(142, '12008', 'Hansen', 2, 1, 'Ayah Hansen', 'Ibu Hansen', 'Alamat 8', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(143, '12009', 'Indra', 2, 1, 'Ayah Indra', 'Ibu Indra', 'Alamat 9', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(144, '12010', 'Jasper', 2, 1, 'Ayah Jasper', 'Ibu Jasper', 'Alamat 10', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(145, '12011', 'Kelvin', 2, 2, 'Ayah Kelvin', 'Ibu Kelvin', 'Alamat 11', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(146, '12012', 'Leonard', 2, 2, 'Ayah Leonard', 'Ibu Leonard', 'Alamat 12', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(147, '12013', 'Mario', 2, 2, 'Ayah Mario', 'Ibu Mario', 'Alamat 13', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(148, '12014', 'Nathan', 2, 2, 'Ayah Nathan', 'Ibu Nathan', 'Alamat 14', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(149, '12015', 'Oscar', 2, 2, 'Ayah Oscar', 'Ibu Oscar', 'Alamat 15', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(150, '12016', 'Patrick', 2, 2, 'Ayah Patrick', 'Ibu Patrick', 'Alamat 16', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(151, '12017', 'Quincy', 2, 2, 'Ayah Quincy', 'Ibu Quincy', 'Alamat 17', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(152, '12018', 'Randy', 2, 2, 'Ayah Randy', 'Ibu Randy', 'Alamat 18', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(153, '12019', 'Steven', 2, 2, 'Ayah Steven', 'Ibu Steven', 'Alamat 19', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(154, '12020', 'Thomas', 2, 2, 'Ayah Thomas', 'Ibu Thomas', 'Alamat 20', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(155, '12021', 'Ulysses', 2, 3, 'Ayah Ulysses', 'Ibu Ulysses', 'Alamat 21', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(156, '12022', 'Victor', 2, 3, 'Ayah Victor', 'Ibu Victor', 'Alamat 22', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(157, '12023', 'William', 2, 3, 'Ayah William', 'Ibu William', 'Alamat 23', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(158, '12024', 'Xavier', 2, 3, 'Ayah Xavier', 'Ibu Xavier', 'Alamat 24', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(159, '12025', 'Yordan', 2, 3, 'Ayah Yordan', 'Ibu Yordan', 'Alamat 25', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(160, '12026', 'Zaky', 2, 3, 'Ayah Zaky', 'Ibu Zaky', 'Alamat 26', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(161, '12027', 'Aurel', 2, 3, 'Ayah Aurel', 'Ibu Aurel', 'Alamat 27', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(162, '12028', 'Breno', 2, 3, 'Ayah Breno', 'Ibu Breno', 'Alamat 28', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(163, '12029', 'Cleo', 2, 3, 'Ayah Cleo', 'Ibu Cleo', 'Alamat 29', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(164, '12030', 'Dario', 2, 3, 'Ayah Dario', 'Ibu Dario', 'Alamat 30', 'aktif', '2026-04-17 15:43:04', '2026-04-17 15:43:04', NULL),
	(195, '13001', 'Aqil', 4, 1, 'Ayah Aqil', 'Ibu Aqil', 'Alamat 1', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(196, '13002', 'Bima', 4, 1, 'Ayah Bima', 'Ibu Bima', 'Alamat 2', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(197, '13003', 'Candra', 4, 1, 'Ayah Candra', 'Ibu Candra', 'Alamat 3', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(198, '13004', 'Denzel', 4, 1, 'Ayah Denzel', 'Ibu Denzel', 'Alamat 4', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(199, '13005', 'Eris', 4, 1, 'Ayah Eris', 'Ibu Eris', 'Alamat 5', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(200, '13006', 'Fathan', 4, 1, 'Ayah Fathan', 'Ibu Fathan', 'Alamat 6', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(201, '13007', 'Gavin', 4, 1, 'Ayah Gavin', 'Ibu Gavin', 'Alamat 7', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(202, '13008', 'Haikal', 4, 1, 'Ayah Haikal', 'Ibu Haikal', 'Alamat 8', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(203, '13009', 'Irfan', 4, 1, 'Ayah Irfan', 'Ibu Irfan', 'Alamat 9', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(204, '13010', 'Jibril', 4, 1, 'Ayah Jibril', 'Ibu Jibril', 'Alamat 10', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(205, '13011', 'Khalid', 4, 2, 'Ayah Khalid', 'Ibu Khalid', 'Alamat 11', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(206, '13012', 'Luqman', 4, 2, 'Ayah Luqman', 'Ibu Luqman', 'Alamat 12', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(207, '13013', 'Muzakki', 4, 2, 'Ayah Muzakki', 'Ibu Muzakki', 'Alamat 13', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(208, '13014', 'Nizam', 4, 2, 'Ayah Nizam', 'Ibu Nizam', 'Alamat 14', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(209, '13015', 'Omar', 4, 2, 'Ayah Omar', 'Ibu Omar', 'Alamat 15', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(210, '13016', 'Pasha', 4, 2, 'Ayah Pasha', 'Ibu Pasha', 'Alamat 16', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(211, '13017', 'Qomar', 4, 2, 'Ayah Qomar', 'Ibu Qomar', 'Alamat 17', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(212, '13018', 'Rasyid', 4, 2, 'Ayah Rasyid', 'Ibu Rasyid', 'Alamat 18', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(213, '13019', 'Syafiq', 4, 2, 'Ayah Syafiq', 'Ibu Syafiq', 'Alamat 19', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(214, '13020', 'Taufiq', 4, 2, 'Ayah Taufiq', 'Ibu Taufiq', 'Alamat 20', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(215, '13021', 'Ubaid', 4, 3, 'Ayah Ubaid', 'Ibu Ubaid', 'Alamat 21', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(216, '13022', 'Vicky', 4, 3, 'Ayah Vicky', 'Ibu Vicky', 'Alamat 22', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(217, '13023', 'Wildan', 4, 3, 'Ayah Wildan', 'Ibu Wildan', 'Alamat 23', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(218, '13024', 'Xander', 4, 3, 'Ayah Xander', 'Ibu Xander', 'Alamat 24', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(219, '13025', 'Yahya', 4, 3, 'Ayah Yahya', 'Ibu Yahya', 'Alamat 25', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(220, '13026', 'Zuhri', 4, 3, 'Ayah Zuhri', 'Ibu Zuhri', 'Alamat 26', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(221, '13027', 'Ardan', 4, 3, 'Ayah Ardan', 'Ibu Ardan', 'Alamat 27', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(222, '13028', 'Bagir', 4, 3, 'Ayah Bagir', 'Ibu Bagir', 'Alamat 28', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(223, '13029', 'Cahya', 4, 3, 'Ayah Cahya', 'Ibu Cahya', 'Alamat 29', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(224, '13030', 'Daffa', 4, 3, 'Ayah Daffa', 'Ibu Daffa', 'Alamat 30', 'aktif', '2026-04-17 15:44:22', '2026-04-17 15:44:22', NULL),
	(225, '14001', 'Alvin', 5, 1, 'Ayah Alvin', 'Ibu Alvin', 'Alamat 1', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(226, '14002', 'Benny', 5, 1, 'Ayah Benny', 'Ibu Benny', 'Alamat 2', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(227, '14003', 'Clifford', 5, 1, 'Ayah Clifford', 'Ibu Clifford', 'Alamat 3', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(228, '14004', 'Dennis', 5, 1, 'Ayah Dennis', 'Ibu Dennis', 'Alamat 4', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(229, '14005', 'Erick', 5, 1, 'Ayah Erick', 'Ibu Erick', 'Alamat 5', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(230, '14006', 'Felix', 5, 1, 'Ayah Felix', 'Ibu Felix', 'Alamat 6', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(231, '14007', 'Gordon', 5, 1, 'Ayah Gordon', 'Ibu Gordon', 'Alamat 7', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(232, '14008', 'Herman', 5, 1, 'Ayah Herman', 'Ibu Herman', 'Alamat 8', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(233, '14009', 'Ivan', 5, 1, 'Ayah Ivan', 'Ibu Ivan', 'Alamat 9', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(234, '14010', 'Jason', 5, 1, 'Ayah Jason', 'Ibu Jason', 'Alamat 10', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(235, '14011', 'Kenneth', 5, 2, 'Ayah Kenneth', 'Ibu Kenneth', 'Alamat 11', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(236, '14012', 'Leon', 5, 2, 'Ayah Leon', 'Ibu Leon', 'Alamat 12', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(237, '14013', 'Martin', 5, 2, 'Ayah Martin', 'Ibu Martin', 'Alamat 13', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(238, '14014', 'Nicholas', 5, 2, 'Ayah Nicholas', 'Ibu Nicholas', 'Alamat 14', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(239, '14015', 'Oliver', 5, 2, 'Ayah Oliver', 'Ibu Oliver', 'Alamat 15', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(240, '14016', 'Peter', 5, 2, 'Ayah Peter', 'Ibu Peter', 'Alamat 16', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(241, '14017', 'Quentin', 5, 2, 'Ayah Quentin', 'Ibu Quentin', 'Alamat 17', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(242, '14018', 'Raymond', 5, 2, 'Ayah Raymond', 'Ibu Raymond', 'Alamat 18', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(243, '14019', 'Samuel', 5, 2, 'Ayah Samuel', 'Ibu Samuel', 'Alamat 19', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(244, '14020', 'Timothy', 5, 2, 'Ayah Timothy', 'Ibu Timothy', 'Alamat 20', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(245, '14021', 'Umaro', 5, 3, 'Ayah Umaro', 'Ibu Umaro', 'Alamat 21', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(246, '14022', 'Valentino', 5, 3, 'Ayah Valentino', 'Ibu Valentino', 'Alamat 22', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(247, '14023', 'Willy', 5, 3, 'Ayah Willy', 'Ibu Willy', 'Alamat 23', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(248, '14024', 'Xeno', 5, 3, 'Ayah Xeno', 'Ibu Xeno', 'Alamat 24', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(249, '14025', 'Yusufian', 5, 3, 'Ayah Yusufian', 'Ibu Yusufian', 'Alamat 25', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(250, '14026', 'Zandro', 5, 3, 'Ayah Zandro', 'Ibu Zandro', 'Alamat 26', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(251, '14027', 'Aldric', 5, 3, 'Ayah Aldric', 'Ibu Aldric', 'Alamat 27', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(252, '14028', 'Brandon', 5, 3, 'Ayah Brandon', 'Ibu Brandon', 'Alamat 28', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(253, '14029', 'Cedric', 5, 3, 'Ayah Cedric', 'Ibu Cedric', 'Alamat 29', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL),
	(254, '14030', 'Dominic', 5, 3, 'Ayah Dominic', 'Ibu Dominic', 'Alamat 30', 'aktif', '2026-04-17 15:45:36', '2026-04-17 15:45:36', NULL);

-- Dumping data for table sistem_menejemen_sekolah.m_spp: ~21 rows (approximately)
REPLACE INTO `m_spp` (`id_spp`, `keterangan_spp`, `id_tingkat_kelas`, `id_jurusan`, `spp`) VALUES
	(1, 'X - RPL', 1, 1, 325000),
	(2, 'X - DKV', 1, 2, 350000),
	(3, 'X - TKJ', 1, 3, 300000),
	(4, 'X - BIDI', 1, 4, 200000),
	(5, 'X - AKUTANSI', 1, 5, 400000),
	(6, 'XI - RPL', 2, 1, 330000),
	(7, 'XI - DKV', 2, 2, 355000),
	(8, 'XI - TKJ', 2, 3, 305000),
	(9, 'XI - BIDI', 2, 4, 205000),
	(10, 'XI - AKUTANSI', 2, 5, 405000),
	(11, 'XII - RPL', 3, 1, 335000),
	(12, 'XII - DKV', 3, 2, 360000),
	(13, 'XII - TKJ', 3, 3, 320000),
	(14, 'XII - BIDI', 3, 4, 220000),
	(15, 'XII - AKUTANSI', 3, 5, 410000),
	(16, 'X - Cyber', 1, 6, 240000),
	(17, 'XI - Cyber', 2, 6, 245000),
	(18, 'XII - Cyber', 3, 6, 250000),
	(19, 'X - TKR', 1, 7, 340000),
	(20, 'XI - TKR', 2, 7, 345000),
	(21, 'XII - TKR', 3, 7, 350000);

-- Dumping data for table sistem_menejemen_sekolah.m_tingkat_kelas: ~3 rows (approximately)
REPLACE INTO `m_tingkat_kelas` (`id_tingkat_kelas`, `tingkat_kelas`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'X', '2026-04-14 12:20:25', NULL, NULL),
	(2, 'XI', '2026-04-14 12:20:26', NULL, NULL),
	(3, 'XII', '2026-04-14 12:20:26', NULL, NULL);

-- Dumping data for table sistem_menejemen_sekolah.password_reset_tokens: ~0 rows (approximately)

-- Dumping data for table sistem_menejemen_sekolah.sessions: ~0 rows (approximately)
REPLACE INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('EjLn4k8Z6hr3ljEV5kRYmA6rNEsu1u4Vj4t9danf', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiQ05aWHVoajJOTjFsY2pzc2hOSFVRTThMem5oM0RTMWR1TEF4MWFwOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wZW1iYXlhcmFucy80NS9kZXRhaWwiO3M6NToicm91dGUiO3M6NDM6ImZpbGFtZW50LmFkbWluLnJlc291cmNlcy5wZW1iYXlhcmFucy5kZXRhaWwiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiIyMDc1YTRlMjU2MDBlY2ZhYTBjOThjNzYzNWI1MzA3YTA2MjNmNmViYWJhNjI5YjY5MjllN2QzZWIxZGMxNDQ4IjtzOjY6InRhYmxlcyI7YToxMDp7czo0MDoiMGFjMmNiMmFjYjE3NzMwMTg4ZTdmNDg1YWNjMjU2ZGNfY29sdW1ucyI7YTozOntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTE6ImplbmlzX2JpYXlhIjtzOjU6ImxhYmVsIjtzOjExOiJKZW5pcyBiaWF5YSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6Nzoibm9taW5hbCI7czo1OiJsYWJlbCI7czo3OiJOb21pbmFsIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNjoiaWRfdGluZ2thdF9rZWxhcyI7czo1OiJsYWJlbCI7czoxMToiVW50dWsgS2VsYXMiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fXM6NDA6IjljMzI2OWZiYTE3ZDI5NjZjZTYwOTNjZTc0NmQ4OGMzX2NvbHVtbnMiO2E6NDp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJuYW1hX3Npc3dhIjtzOjU6ImxhYmVsIjtzOjEwOiJOYW1hIFNpc3dhIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxOToia2VsYXMudGluZ2thdF9rZWxhcyI7czo1OiJsYWJlbCI7czoxMzoiVGluZ2thdCBLZWxhcyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTU6Imp1cnVzYW4uanVydXNhbiI7czo1OiJsYWJlbCI7czo3OiJKdXJ1c2FuIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiQ3JlYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX1zOjQwOiJlMmI2NTM2ZGY1ZDg5MWExMDMwZTg0Nzk4MjczYmJlMF9jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo0OiJuaXBkIjtzOjU6ImxhYmVsIjtzOjQ6Ik5JUEQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJuYW1hX3Npc3dhIjtzOjU6ImxhYmVsIjtzOjEwOiJOYW1hIFNpc3dhIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxOToia2VsYXMudGluZ2thdF9rZWxhcyI7czo1OiJsYWJlbCI7czo1OiJLZWxhcyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTU6Imp1cnVzYW4uanVydXNhbiI7czo1OiJsYWJlbCI7czo3OiJKdXJ1c2FuIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX1zOjQwOiJhZjVmYTliZjExZGZkYjhhODQyYTM0YTU3ZTBjYzQyZV9jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMToiamVuaXNfYmlheWEiO3M6NToibGFiZWwiO3M6MTE6IkplbmlzIEJpYXlhIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo3OiJub21pbmFsIjtzOjU6ImxhYmVsIjtzOjc6Ik5vbWluYWwiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE2OiJub21pbmFsX3RlcmJheWFyIjtzOjU6ImxhYmVsIjtzOjE2OiJOb21pbmFsIFRlcmJheWFyIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo5OiJUdW5nZ2FrYW4iO3M6NToibGFiZWwiO3M6OToiVHVuZ2dha2FuIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX1zOjQwOiIxMGZlZTgxZDg3OWQ3MzI2NzU4NTM0MTU2YjI1N2QzM19jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMToiamVuaXNfYmlheWEiO3M6NToibGFiZWwiO3M6MTE6IkplbmlzIEJpYXlhIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo3OiJub21pbmFsIjtzOjU6ImxhYmVsIjtzOjc6Ik5vbWluYWwiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE2OiJub21pbmFsX3RlcmJheWFyIjtzOjU6ImxhYmVsIjtzOjE2OiJOb21pbmFsIFRlcmJheWFyIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo5OiJUdW5nZ2FrYW4iO3M6NToibGFiZWwiO3M6OToiVHVuZ2dha2FuIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX1zOjQwOiJkZGFkZTRhOWVlOTk0MDRiZmRjZDkzZGFiZTQ5YWQ0Nl9jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMToiamVuaXNfYmlheWEiO3M6NToibGFiZWwiO3M6MTE6IkplbmlzIEJpYXlhIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo3OiJub21pbmFsIjtzOjU6ImxhYmVsIjtzOjc6Ik5vbWluYWwiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE2OiJub21pbmFsX3RlcmJheWFyIjtzOjU6ImxhYmVsIjtzOjE2OiJOb21pbmFsIFRlcmJheWFyIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo5OiJUdW5nZ2FrYW4iO3M6NToibGFiZWwiO3M6OToiVHVuZ2dha2FuIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX1zOjQwOiJmZjc1NDI2M2M4OGNmYTg2NGJlZmY2MGNhYjk4ZTgxZl9jb2x1bW5zIjthOjU6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoia2V0ZXJhbmdhbl9zcHAiO3M6NToibGFiZWwiO3M6MTQ6IktldGVyYW5nYW4gU1BQIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czozOiJzcHAiO3M6NToibGFiZWwiO3M6MzoiU1BQIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNjoibm9taW5hbF90ZXJiYXlhciI7czo1OiJsYWJlbCI7czo4OiJUZXJiYXlhciI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTc6ImtldGVyYW5nYW5fc3RhdHVzIjtzOjU6ImxhYmVsIjtzOjEwOiJLZXRlcmFuZ2FuIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMToibGViaWhfYmF5YXIiO3M6NToibGFiZWwiO3M6MTE6IkxlYmloIEJheWFyIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX1zOjQwOiIxOTU0NThhYzVjYzg0Y2IzYmQwOTRjMDZjZTNkM2JlNl9jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo0OiJuaXBkIjtzOjU6ImxhYmVsIjtzOjQ6Ik5pcGQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJuYW1hX3Npc3dhIjtzOjU6ImxhYmVsIjtzOjEwOiJOYW1hIHNpc3dhIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNToianVydXNhbi5qdXJ1c2FuIjtzOjU6ImxhYmVsIjtzOjc6Ikp1cnVzYW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE5OiJrZWxhcy50aW5na2F0X2tlbGFzIjtzOjU6ImxhYmVsIjtzOjU6IktlbGFzIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX1zOjQwOiI5ZTgxMDcyOTJkZTg4OWJlMDAyMGQ3YmNmNTVkZTY1M19jb2x1bW5zIjthOjI6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo3OiJqdXJ1c2FuIjtzOjU6ImxhYmVsIjtzOjc6Ikp1cnVzYW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE3OiJzcHBfcG9rb2tfanVydXNhbiI7czo1OiJsYWJlbCI7czoxNzoiU1BQIFBva29rIEp1cnVzYW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fXM6NDA6ImNlNDU5MTNmYzM1NTNhOTM3YzI2MDNhNTczYThhNWI3X2NvbHVtbnMiO2E6MTp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE3OiJtZXRvZGVfcGVtYmF5YXJhbiI7czo1OiJsYWJlbCI7czoxNzoiTWV0b2RlIFBlbWJheWFyYW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fX1zOjg6ImZpbGFtZW50IjthOjA6e31zOjExOiJpbnZvaWNlX3VybCI7czo0MzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2ludm9pY2UvcGVtYmF5YXJhbi8xMCI7fQ==', 1776449376);

-- Dumping data for table sistem_menejemen_sekolah.trx_pembayaran: ~0 rows (approximately)
REPLACE INTO `trx_pembayaran` (`id_trx_pembayaran`, `id_biaya`, `id_siswa`, `id_metode_pembayaran`, `nominal`, `tanggal_bayar`, `created_at`, `updated_at`) VALUES
	(8, 4, 45, 1, 555000.00, '2026-04-17', '2026-04-17 09:46:52', '2026-04-17 09:46:52'),
	(9, 1, 45, 1, 150000.00, '2026-04-17', '2026-04-17 09:48:36', '2026-04-17 09:48:36'),
	(10, 2, 45, 1, 500000.00, '2026-04-17', '2026-04-17 09:50:27', '2026-04-17 09:50:27'),
	(11, 5, 45, 1, 500000.00, '2026-04-17', '2026-04-17 09:55:06', '2026-04-17 09:55:06'),
	(12, 5, 45, 1, 350000.00, '2026-04-17', '2026-04-17 10:03:51', '2026-04-17 10:03:51'),
	(13, 6, 55, 1, 200000.00, '2026-04-17', '2026-04-17 10:24:14', '2026-04-17 10:24:14'),
	(14, 5, 45, 1, 500000.00, '2026-04-17', '2026-04-17 10:56:13', '2026-04-17 10:56:13'),
	(15, 5, 45, 1, 250000.00, '2026-04-18', '2026-04-17 17:58:45', '2026-04-17 17:58:45'),
	(16, 5, 45, 1, 150000.00, '2026-04-18', '2026-04-17 18:04:46', '2026-04-17 18:04:46');

-- Dumping data for table sistem_menejemen_sekolah.trx_spp: ~0 rows (approximately)
REPLACE INTO `trx_spp` (`id_trx_spp`, `id_siswa`, `id_spp`, `id_metode_pembayaran`, `nominal_bayar`, `created_at`, `updated_at`) VALUES
	(7, 12, 9, NULL, 205000, NULL, NULL),
	(8, 12, 9, NULL, 210000, NULL, NULL),
	(9, 45, 1, NULL, 200000, NULL, NULL),
	(10, 45, 1, NULL, 200000, NULL, NULL),
	(11, 45, 1, 1, 200000, NULL, NULL),
	(12, 45, 1, 1, 200000, NULL, NULL),
	(13, 45, 1, 1, 200000, '2026-04-17 10:55:39', '2026-04-17 10:55:39'),
	(14, 45, 1, 1, 200000, '2026-04-17 17:59:12', '2026-04-17 17:59:12'),
	(15, 45, 1, 1, 200000, '2026-04-17 18:05:12', '2026-04-17 18:05:12'),
	(16, 45, 1, 1, 325000, '2026-04-17 18:09:10', '2026-04-17 18:09:10');

-- Dumping data for table sistem_menejemen_sekolah.users: ~1 rows (approximately)
REPLACE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$41PpMTuif1X2QUJu3JrAR.W28HxnNyGljOrI5360vSVBEaZ5y/V6S', NULL, '2026-04-14 05:43:34', '2026-04-14 05:43:34'),
	(2, 'Test User', 'test@example.com', '2026-04-17 10:15:48', '$2y$12$ee9E/cKuylqKFSPGX8ttV.6VMm9Ow4ENDZpFo9av0yBNGNp3bEnvS', 'tpOtX53YkR', '2026-04-17 10:15:48', '2026-04-17 10:15:48');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
