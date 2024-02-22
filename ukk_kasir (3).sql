-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 17, 2024 at 09:47 AM
-- Server version: 10.3.39-MariaDB-0ubuntu0.20.04.2
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ukk_kasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `detailpenjualan`
--

CREATE TABLE `detailpenjualan` (
  `DetailID` int(11) NOT NULL,
  `PenjualanID` int(11) NOT NULL,
  `ProdukID` int(11) NOT NULL,
  `JumlahProduk` int(11) NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detailpenjualan`
--

INSERT INTO `detailpenjualan` (`DetailID`, `PenjualanID`, `ProdukID`, `JumlahProduk`, `Subtotal`) VALUES
(2, 7, 5, 14, 70000.00),
(5, 8, 6, 7, 14000.00),
(7, 7, 5, 6, 30000.00),
(8, 15, 10, 51, 76500.00),
(9, 18, 5, 2, 10000.00);

--
-- Triggers `detailpenjualan`
--
DELIMITER $$
CREATE TRIGGER `out_stok` AFTER INSERT ON `detailpenjualan` FOR EACH ROW BEGIN
UPDATE produk SET produk.Stok = produk.Stok - NEW.JumlahProduk WHERE produk.ProdukID = NEW.ProdukID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `PelangganID` varchar(20) NOT NULL,
  `NamaPelanggan` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `NomorTelepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`PelangganID`, `NamaPelanggan`, `Alamat`, `NomorTelepon`) VALUES
('0702042239', 'wafi', 'margomulyo', '087665576'),
('0702043048', 'wafi', 'margomulyo', '907856'),
('0702044220', 'wafi', 'margomulyo', '34566767'),
('0702045434', 'wafi', 'margomulyo', '34566767'),
('1202025420', 'Amel', 'desa margomulyo', '08986256752'),
('1702093754', 'putri', 'tuban', '3554656'),
('1801163457', 'Diah', 'Subang', '088866667777'),
('1801164943', 'Diah 1', '088866667890', '088866667890'),
('2901080443', 'asdasd', 'dasdas', 'adsads'),
('2901080621', '12', 'sdasd', '12312'),
('2901080735', 'rewwer', 'sdasd', '12312'),
('2901080800', 'rewwer', 'sdasd', '12312'),
('2901080822', 'wery', 'teman', '123'),
('3101010416', 'Habiba', 'Kerek', '085847730295'),
('3101010736', 'Fani', 'Dusun Sembungrejo', '085847730295'),
('3101011525', 'Anisa ', 'Dusun Sembungrejo', '085847730295'),
('31231233', 'NamaPelanggan', 'Alamat', '45645645');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `PenjualanID` int(11) NOT NULL,
  `TanggalPenjualan` date NOT NULL,
  `TotalHarga` decimal(10,2) NOT NULL DEFAULT 0.00,
  `PelangganID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`PenjualanID`, `TanggalPenjualan`, `TotalHarga`, `PelangganID`) VALUES
(7, '2024-01-18', 100000.00, '1801163457'),
(8, '2024-01-18', 14000.00, '1801164943'),
(10, '2024-01-29', 0.00, '2901080735'),
(11, '2024-01-29', 0.00, '2901080735'),
(12, '2024-01-29', 0.00, '2901080800'),
(13, '2024-01-29', 0.00, '2901080822'),
(15, '2024-01-31', 76500.00, '3101010416'),
(16, '2024-01-31', 0.00, '3101010736'),
(17, '2024-01-31', 0.00, '3101011525'),
(19, '2024-02-07', 0.00, '0702045434'),
(20, '2024-02-12', 0.00, '1202025420'),
(21, '2024-02-17', 0.00, '1702093754');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(255) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `level`) VALUES
(1, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(3, 'Petugas', 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', 2),
(4, 'Petugas 1', 'petugas1', 'b53fe7751b37e40ff34d012c7774d65f', 2);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `ProdukID` int(11) NOT NULL,
  `NamaProduk` varchar(255) NOT NULL,
  `Harga` decimal(10,2) NOT NULL,
  `Stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`ProdukID`, `NamaProduk`, `Harga`, `Stok`) VALUES
(5, 'Rinso', 5000.00, 1),
(6, 'Snack Ring', 2000.00, 180),
(7, 'Buku', 2000.00, 5),
(10, 'Sabun', 1500.00, 1),
(12, 'Roti', 5000.00, 150),
(13, 'Roti o', 15000.00, 160),
(14, 'pensil', 3000.00, 50);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  ADD PRIMARY KEY (`DetailID`),
  ADD KEY `PenjualanID` (`PenjualanID`),
  ADD KEY `ProdukID` (`ProdukID`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`PelangganID`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`PenjualanID`),
  ADD KEY `PelangganID` (`PelangganID`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`ProdukID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  MODIFY `DetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `PenjualanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `ProdukID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`PelangganID`) REFERENCES `pelanggan` (`PelangganID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
