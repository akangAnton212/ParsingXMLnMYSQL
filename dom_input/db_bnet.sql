-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2017 at 04:34 AM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_bnet`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `harga` double NOT NULL,
  PRIMARY KEY (`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode_barang`, `nama_barang`, `harga`) VALUES
('B001', 'Laptop Asus X45U', 5000000),
('B002', 'Laptop Toshiba ', 500000),
('B003', 'Laptop Axioo', 250000),
('B004', 'Iphone X', 1300000);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `nim` int(25) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `jurusan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `jenis_kelamin`, `jurusan`) VALUES
(1234, 'anton', 'Laki-Laki', 'Informatika Komputer'),
(150442, 'Jubadah', 'Perempuan', 'Administrasi Perkantoran'),
(150441, 'Komarudin S.Kom', 'Laki-Laki', 'Informatika Komputer'),
(324335, 'Akang', 'Laki-Laki', 'Akuntansi');

-- --------------------------------------------------------

--
-- Table structure for table `stok_master`
--

CREATE TABLE IF NOT EXISTS `stok_master` (
  `kode_barang` varchar(10) NOT NULL,
  `stok` int(11) NOT NULL,
  PRIMARY KEY (`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stok_master`
--

INSERT INTO `stok_master` (`kode_barang`, `stok`) VALUES
('BRG001', 3),
('BRG002', 5),
('BRG004', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbmahasiswa`
--

CREATE TABLE IF NOT EXISTS `tbmahasiswa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) NOT NULL,
  `nim` int(20) NOT NULL,
  `jurusan` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbmahasiswa`
--

INSERT INTO `tbmahasiswa` (`id`, `nama`, `nim`, `jurusan`) VALUES
(3, 'Anton Sujarwo', 150442, 'Informatika Komputer');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_masterbrg`
--
CREATE TABLE IF NOT EXISTS `v_masterbrg` (
`kode_barang` varchar(10)
,`nama_barang` varchar(20)
,`harga` double
,`stok` int(11)
);
-- --------------------------------------------------------

--
-- Structure for view `v_masterbrg`
--
DROP TABLE IF EXISTS `v_masterbrg`;

CREATE ALGORITHM=MERGE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_masterbrg` AS select `barang`.`kode_barang` AS `kode_barang`,`barang`.`nama_barang` AS `nama_barang`,`barang`.`harga` AS `harga`,`stok_master`.`stok` AS `stok` from (`barang` join `stok_master`) where (`stok_master`.`kode_barang` = `barang`.`kode_barang`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
