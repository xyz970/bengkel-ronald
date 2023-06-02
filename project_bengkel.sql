-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 02, 2023 at 07:32 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_bengkel`
--

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `uuid` varchar(100) NOT NULL,
  `merk` varchar(30) NOT NULL,
  `model` varchar(50) NOT NULL,
  `nomor_rangka` varchar(50) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `tipe_mobil` varchar(50) NOT NULL,
  `tahun_produksi` year NOT NULL,
  `warna` varchar(70) NOT NULL,
  `nopol` varchar(30) NOT NULL,
  `nomor_stnk` varchar(30) DEFAULT NULL,
  `masa_stnk` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`uuid`, `merk`, `model`, `nomor_rangka`, `user_id`, `tipe_mobil`, `tahun_produksi`, `warna`, `nopol`, `nomor_stnk`, `masa_stnk`, `created_at`, `updated_at`) VALUES
('e8e500c5-6721-4f0d-9a0b-b30ead64ecb4', 'Honda', 'Civic MT', 'VXC09ZYU', '668644a3-3094-4016-85c3-ff83d9189d17', 'Civic Turbo Type R', 2022, 'Burning Red', 'P 0923 LK', '109723572190431', '2027-05-21', '2023-06-02 18:02:17', '2023-06-02 18:02:17');

-- --------------------------------------------------------

--
-- Table structure for table `merk`
--

CREATE TABLE `merk` (
  `id` int NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `id` varchar(100) NOT NULL,
  `kendaraan_id` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `detail_service` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `keluhan` text,
  `status` enum('pending','onprocess','done') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `keterangan` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `keterangan`) VALUES
(1, 'Customer'),
(2, 'Service Advisor');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `uuid` varchar(100) NOT NULL,
  `id_kendaraan` varchar(100) NOT NULL,
  `tipe_service` varchar(50) DEFAULT NULL,
  `service_advisor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tanggal` date DEFAULT NULL,
  `odometer` varchar(30) DEFAULT NULL,
  `detail` text,
  `part_pengganti` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`uuid`, `id_kendaraan`, `tipe_service`, `service_advisor`, `tanggal`, `odometer`, `detail`, `part_pengganti`, `created_at`, `updated_at`) VALUES
('f01e2c83-01f8-457b-8ffb-47f51d6de5fe', 'e8e500c5-6721-4f0d-9a0b-b30ead64ecb4', '8000KM', 'Adi', '2023-06-03', '10000KM', 'Pembersihan pada blok mesin', '-', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uuid` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_hp` varchar(16) DEFAULT NULL,
  `verified` enum('true','false') DEFAULT 'false',
  `verified_at` timestamp NULL DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role_id` int NOT NULL DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uuid`, `nama`, `no_hp`, `verified`, `verified_at`, `email`, `created_at`, `password`, `role_id`, `updated_at`) VALUES
('668644a3-3094-4016-85c3-ff83d9189d17', 'Muhammad Adi Saputro', '+6285748314069', 'true', '2023-06-02 17:46:23', 'muhammadxxz7@gmail.com', '2023-06-02 17:45:25', '$2y$10$GYFvBI8PhjZEWqRqQE61Q.9T71wYNl4a10u.WWNXWx5A6y3osBwSy', 1, '2023-06-02 17:46:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `model` (`model`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `tipe_mobil` (`tipe_mobil`);

--
-- Indexes for table `merk`
--
ALTER TABLE `merk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kendaraan_id` (`kendaraan_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `id_kendaraan` (`id_kendaraan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD CONSTRAINT `FKkendaraan280354` FOREIGN KEY (`user_id`) REFERENCES `users` (`uuid`);

--
-- Constraints for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `FKreservasi1255` FOREIGN KEY (`user_id`) REFERENCES `users` (`uuid`),
  ADD CONSTRAINT `FKreservasi901753` FOREIGN KEY (`kendaraan_id`) REFERENCES `kendaraan` (`uuid`);

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `FKservice611882` FOREIGN KEY (`id_kendaraan`) REFERENCES `kendaraan` (`uuid`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FKusers973872` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
