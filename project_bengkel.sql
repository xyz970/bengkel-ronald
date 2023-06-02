-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 02, 2023 at 07:53 AM
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
  `model_id` int NOT NULL,
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

INSERT INTO `kendaraan` (`uuid`, `merk`, `model_id`, `nomor_rangka`, `user_id`, `tipe_mobil`, `tahun_produksi`, `warna`, `nopol`, `nomor_stnk`, `masa_stnk`, `created_at`, `updated_at`) VALUES
('523932ff-fa34-4da6-9a1c-4eec42f09986', 'Honda', 1, 'VXC09ZYU', 'fd73d715-1273-44b1-a1d5-f65f2c48cc7b', 'Civic Turbo Type R', 2022, 'Burning Red', 'P 0923 LK', '109723572190431', '2027-05-21', '2023-06-02 07:44:05', '2023-06-02 07:44:05');

-- --------------------------------------------------------

--
-- Table structure for table `model_mobil`
--

CREATE TABLE `model_mobil` (
  `id` int NOT NULL,
  `keterangan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `model_mobil`
--

INSERT INTO `model_mobil` (`id`, `keterangan`) VALUES
(1, 'Civic MT');

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
('fd73d715-1273-44b1-a1d5-f65f2c48cc7b', 'Muhammad Adi Saputro', '+6285748314069', 'true', '2023-06-02 07:36:10', 'muhammadxxz7@gmail.com', '2023-06-02 07:28:46', '$2y$10$B5QP7uNmCMC0inHYfoXwBOU3FkCMfg/RtexK3VXyxdAmSEEDeFB1W', 1, '2023-06-02 07:36:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `model_id` (`model_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `model_mobil`
--
ALTER TABLE `model_mobil`
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
  ADD KEY `id_kendaraan` (`id_kendaraan`),
  ADD KEY `service_advisor` (`service_advisor`);

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
-- AUTO_INCREMENT for table `model_mobil`
--
ALTER TABLE `model_mobil`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  ADD CONSTRAINT `FKkendaraan185624` FOREIGN KEY (`model_id`) REFERENCES `model_mobil` (`id`),
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
