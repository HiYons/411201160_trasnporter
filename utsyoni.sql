-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 09, 2023 at 06:45 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `utszakario`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(200) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `stok_barang` int(11) DEFAULT NULL,
  `harga_barang` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `kode_barang`, `nama_barang`, `deskripsi`, `stok_barang`, `harga_barang`, `created_at`, `updated_at`) VALUES
(1, 'A001', 'Xiaomi Redmi Note 10', 'Handphone', 100, 3000000, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'A001', 'Xiaomi Redmi Note 11', 'Handphone', 100, 4000000, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'A002', 'Test APi 3', 'Test Deskripsi', 100, 1000000, '2023-05-13 07:23:50', '2023-05-13 07:23:50'),
(6, 'A002', 'Test APi 3', 'Test Deskripsi', 100, 1000000, '2023-05-13 07:24:18', '2023-05-13 07:24:18');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `id` int(11) NOT NULL,
  `kode_lokasi` varchar(10) DEFAULT NULL,
  `nama_lokasi` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`id`, `kode_lokasi`, `nama_lokasi`, `created_at`, `updated_at`) VALUES
(2, 'L001', 'Cipinang', '2023-05-13 07:50:06', '2023-05-13 07:50:32'),
(3, 'L001', 'Cipinang Muara', '2023-05-20 03:54:03', '2023-05-20 03:54:03');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman`
--

CREATE TABLE `pengiriman` (
  `id` int(11) NOT NULL,
  `no_pengiriman` varchar(15) NOT NULL,
  `tanggal` date NOT NULL,
  `lokasi_id` int(11) DEFAULT NULL,
  `barang_id` int(11) DEFAULT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `harga_barang` int(11) DEFAULT NULL,
  `kurir_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pengiriman`
--

INSERT INTO `pengiriman` (`id`, `no_pengiriman`, `tanggal`, `lokasi_id`, `barang_id`, `jumlah_barang`, `harga_barang`, `kurir_id`, `created_at`, `updated_at`, `status`) VALUES
(2, '9619', '2022-01-01', 3, 1, 100, 100, 1, '2023-05-14 11:04:11', '2023-05-14 11:05:01', 1),
(3, '26120', '2022-01-01', 3, 1, 1000, 10000, 1, '2023-05-14 12:45:11', '2023-05-14 12:45:11', 0),
(4, '49214', '2022-01-01', 2, 2, 1020, 100, 1, '2023-05-14 12:45:19', '2023-05-14 12:45:19', 0),
(5, '11751', '2022-01-01', 2, 2, 1203, 100, 1, '2023-05-14 12:45:55', '2023-05-14 12:45:55', 0),
(6, '19969', '2022-01-01', 2, 2, 100, 10000, 1, '2023-05-20 03:55:52', '2023-05-20 03:55:52', 0),
(7, '22329', '2023-07-03', 2, 2, 1001, 10000, 1, '2023-07-08 09:17:00', '2023-07-08 09:17:00', 0),
(8, '1SI6165P', '2023-07-08', 3, 2, 112, 15000, 1, '2023-07-08 11:24:09', '2023-07-08 11:24:09', 0),
(9, '84181', '2023-07-08', 2, 2, 1001, 10000, 1, '2023-07-08 11:37:59', '2023-07-08 11:37:59', 0),
(10, '71407', '2023-07-08', 2, 2, 1001, 10000, 1, '2023-07-08 11:38:02', '2023-07-08 11:38:02', 0),
(11, '78457', '2023-07-08', 2, 2, 1001, 10000, 1, '2023-07-08 11:38:03', '2023-07-08 11:38:03', 0),
(12, '57089', '2023-07-08', 2, 2, 1001, 10000, 1, '2023-07-08 11:38:05', '2023-07-08 11:38:05', 0),
(14, 'YU9915R9', '2023-07-08', 3, 1, 12, 15000, 1, '2023-07-08 11:43:56', '2023-07-08 11:43:56', 0),
(15, 'DZX5065W', '2023-07-08', 3, 1, 121, 15000, 1, '2023-07-08 11:56:03', '2023-07-08 11:56:03', 0),
(16, '570891', '2023-07-08', 3, 1, 121, 15000, 1, '2023-07-08 11:57:10', '2023-07-08 11:57:10', 0),
(17, '5708912', '2023-07-08', 3, 2, 121, 15000, 2, '2023-07-08 11:57:58', '2023-07-08 11:57:58', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Zakario Lesrahmanto', '411201066@mahasiswa.undira.ac.id', NULL, '$2y$10$0dZxcQ0n/32C/v/.O2tpfuHTfrf0dgB.qHv6Q5b97U9g9fIjg9FX6', NULL, '2023-05-12 21:41:58', '2023-05-12 21:41:58'),
(2, 'Zakario Lesrahmanto', 'andrio.zaboy@gmail.com', NULL, '$2y$10$5Gq.yx4ChoVpLlbJF5in4uMHN2SqeDGBVrS2uBjwDbcwR2BavmEJK', NULL, '2023-07-08 01:25:11', '2023-07-08 01:25:11');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_pengiriman`
-- (See below for the actual view)
--
CREATE TABLE `view_pengiriman` (
`id` int(11)
,`id_barang` int(11)
,`nama_barang` varchar(200)
,`kode_barang` varchar(10)
,`nama_lokasi` varchar(255)
,`id_lokasi` int(11)
,`jumlah_barang` int(11)
,`harga_barang` int(11)
,`tanggal` date
,`created_at` datetime
,`no_pengiriman` varchar(15)
,`updated_at` datetime
,`nama_pengirim` varchar(255)
,`kurir_id` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Structure for view `view_pengiriman`
--
DROP TABLE IF EXISTS `view_pengiriman`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_pengiriman`  AS SELECT `pengiriman`.`id` AS `id`, `barang`.`id` AS `id_barang`, `barang`.`nama_barang` AS `nama_barang`, `barang`.`kode_barang` AS `kode_barang`, `lokasi`.`nama_lokasi` AS `nama_lokasi`, `lokasi`.`id` AS `id_lokasi`, `pengiriman`.`jumlah_barang` AS `jumlah_barang`, `pengiriman`.`harga_barang` AS `harga_barang`, `pengiriman`.`tanggal` AS `tanggal`, `pengiriman`.`created_at` AS `created_at`, `pengiriman`.`no_pengiriman` AS `no_pengiriman`, `pengiriman`.`updated_at` AS `updated_at`, `users`.`name` AS `nama_pengirim`, `users`.`id` AS `kurir_id` FROM (((`pengiriman` left join `barang` on(`pengiriman`.`barang_id` = `barang`.`id`)) left join `lokasi` on(`pengiriman`.`lokasi_id` = `lokasi`.`id`)) left join `users` on(`pengiriman`.`kurir_id` = `users`.`id`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pengiriman`
--
ALTER TABLE `pengiriman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
