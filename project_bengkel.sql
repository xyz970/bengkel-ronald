-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 31, 2023 at 06:46 AM
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
  `merk` varchar(50) NOT NULL,
  `model` varchar(100) NOT NULL,
  `nomor_rangka` varchar(50) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `tipe_id` int NOT NULL,
  `tahun_produksi` year NOT NULL,
  `warna` varchar(70) NOT NULL,
  `nopol` varchar(30) NOT NULL,
  `nomor_stnk` varchar(30) DEFAULT NULL,
  `masa_stnk` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `id` varchar(100) NOT NULL,
  `kendaraan_id` varchar(100) NOT NULL,
  `detail_service` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `keluhan` text,
  `status` varchar(50) DEFAULT NULL,
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
  `tipe_service` int DEFAULT NULL,
  `service_advisor` varchar(100) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `odometer` varchar(30) DEFAULT NULL,
  `detail` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipe_mobil`
--

CREATE TABLE `tipe_mobil` (
  `id` int NOT NULL,
  `keterangan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uuid` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_hp` varchar(16) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role_id` int NOT NULL DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uuid`, `nama`, `no_hp`, `email`, `created_at`, `password`, `role_id`, `updated_at`) VALUES
('d7334c02-1480-4224-9d78-95b9c3228257', 'Muhammad Adi Saputro', '+6285748314069', 'adi123@gmail.com', '2023-05-31 06:35:30', '$2y$10$1I4eHr0VRCLYBYpSi2qVLuIp09iuF0IMUUGwg2DfL6PCDDfXDBB.u', 1, '2023-05-31 06:35:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `tipe_id` (`tipe_id`);

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kendaraan_id` (`kendaraan_id`);

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
  ADD KEY `id_kendaraan` (`id_kendaraan`),
  ADD KEY `service_advisor` (`service_advisor`);

--
-- Indexes for table `tipe_mobil`
--
ALTER TABLE `tipe_mobil`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `tipe_mobil`
--
ALTER TABLE `tipe_mobil`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD CONSTRAINT `FKkendaraan153261` FOREIGN KEY (`tipe_id`) REFERENCES `tipe_mobil` (`id`),
  ADD CONSTRAINT `FKkendaraan280354` FOREIGN KEY (`user_id`) REFERENCES `users` (`uuid`);

--
-- Constraints for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `FKreservasi901753` FOREIGN KEY (`kendaraan_id`) REFERENCES `kendaraan` (`uuid`);

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `FKservice300595` FOREIGN KEY (`service_advisor`) REFERENCES `users` (`uuid`),
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
