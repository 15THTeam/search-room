-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 04, 2017 at 08:57 AM
-- Server version: 5.7.18-log
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `search_room`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`username`, `password`, `role`) VALUES
('admin', '$2a$10$.45DviQ17rIW0Gr4BTIoROrzCfoB03tzZu8ho03.bDaQ9M72ZNk8i', 'ADMIN'),
('admin1', '$2a$10$e8RGGREV5hk.xe2hY1Buf.xnIo4hAdsFlOK3/gRoMvFi/q6Tc2E4O', 'ADMIN'),
('cus1', '$2a$10$vSx0aKfbItg64PIlLvq.Q.BZ/g.534jxt1tzWWpgMnDNBgXpksO.m', 'CUSTOMER'),
('cus2', '$2a$10$SbRmEZydAGum.Ir.5/Qk/unaQvqMh9wTRhL2i7LK/3cPhInF5qngG', 'CUSTOMER'),
('cus3', '$2a$10$I0e53sXVMPP4zwqK2tjiIesETQsIG7Y7FUX.cYKMmg49gr12jRPq6', 'CUSTOMER'),
('cus4', '$2a$10$pJ1ye3TVL35OQzZT0rrGSOmrPk5bA.0Lay6jd2sUY1sRAYwrCqqXm', 'CUSTOMER');

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`address_id`, `latitude`, `longitude`, `address`) VALUES
(11, '10.8125145', '106.7059565', '31, duong so 7, Chu Van An, Quan Binh Thanh, Ho Chi Minh'),
(12, '10.7964150', '106.6307710', '26/42 Tan Son Nhi, Tan Phu, Tan Son Nhi'),
(13, '10.7558577', '106.6206067', '93/15A Phung Ta Chu, Q. Binh Tan, Ho Chi Minh'),
(14, '10.7426107', '106.7231011', '104B Ly Phuc Man, Ly Phuc Man, quan 7, Ho Chi Minh'),
(15, '10.7597580', '106.7096481', 'Doan Van Bo, quan 4, Ho Chi Minh'),
(16, '10.7278069', '106.7077375', '14 My Toan 2, phuong Tan Phong, quan 7, Ho Chi Minh'),
(18, '20.9721713', '105.7576021', 'The Pride, To Huu'),
(21, NULL, NULL, '390/11, Cach Mang Thang 8, Phuong 11, Quan 3, Ho Chi Minh'),
(22, '21.0413581', '105.7783548', 'So 32/C1, Duong Doan Ke Thien, P Mai Dich, Cau Giay, Ha Noi'),
(26, '10.7765318', '106.6653559', '339/34a20 To Hien Thanh, Phuong 12, Quan 10 , Ho Chi Minh'),
(27, '10.8169609', '106.6838510', 'Ap Moi 1 , xa My Hanh Nam, Go Vap, Ho Chi Minh'),
(29, '10.8651439', '106.7537297', '56, Duong so 9, Khu Pho 3, Phuong Linh Trung, Quan Thu Duc, TP Ho Chi Minh'),
(30, '21.0202372', '105.8277848', 'So 96, De La Thanh, P. O Cho Dua, Q.Dong Da, Ha Noi'),
(31, '21.0445830', '105.7989926', 'so 2, ngo 59, Quan Hoa, Cau Giay, Ha Noi'),
(32, '20.9966879', '105.8181543', '17H, ngo 211/17, Khuong Trung, Thanh Xuan, Ha Noi'),
(33, '21.0202372', '105.8277848', '96 De La Thanh, O Cho Dua, Dong Da, Ha Noi'),
(47, '10.3759416', '105.4185406', 'Long Xuyen, An Giang');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `phone_number` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `fk_customers_accounts_idx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `full_name`, `phone_number`, `email`, `username`) VALUES
(1, 'cus2', '0912702105', 'cus2@gmail.com', 'cus2'),
(2, 'abc', '01233456777', 'abc@gmail.com', 'cus1'),
(3, 'abc', '01234567890', 'cus3@gmail.com', 'cus3'),
(4, 'cus4', '01476341234', 'cus4@gmail.com', 'cus4');

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
CREATE TABLE IF NOT EXISTS `resources` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `room_info_id` int(11) NOT NULL,
  PRIMARY KEY (`resource_id`),
  KEY `fk_resources_room_infos1_idx` (`room_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`resource_id`, `file_name`, `room_info_id`) VALUES
(5, 'cho-thue-phong-full-noi-that-chu-van-an-qbinh-thanh-nx0y0.jpg', 11),
(6, 'can-ho-mini.jpg', 12),
(7, 'img1.jpg', 13),
(8, 'tim-nu-o-ghep-phong-tro-cao-cap-quan-7.jpg', 14),
(9, 'cho-thue-phong-tro-hem-58-doan-van-bo-q-4.jpg', 15),
(10, 'cho-thue-phong-trong-khu-phu-my-hung.jpg', 16),
(12, 'cho-thue-chung-cu-the-pride.JPG', 18),
(15, 'cho-thue-nguyen-can-yen-tinh.jpg', 21),
(16, 'cho-thue-chung-cu-so-32c1.jpg', 22),
(20, 'tim-gap-1-nu-o-ghep.jpg', 26),
(21, 'nha-tro-moi-xay.jpg', 27),
(23, 'can-nam-o-ghep.jpg', 29),
(24, 'cho-thue-can-ho-mini-mat-pho.jpg', 30),
(25, 'cho-thue-phong-tro-khep-kin.jpg', 31),
(26, 'cho-thue-phong-tro-so-17h.jpg', 32),
(27, 'cho-thue-chung-cu-mini-chinh-chu.jpg', 33),
(38, '434813.jpg', 47);

-- --------------------------------------------------------

--
-- Table structure for table `room_infos`
--

DROP TABLE IF EXISTS `room_infos`;
CREATE TABLE IF NOT EXISTS `room_infos` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `area` float DEFAULT NULL,
  `price` decimal(13,0) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `available` bit(1) DEFAULT b'1',
  `address_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`info_id`),
  KEY `fk_room_infos_room_types1_idx` (`type_id`),
  KEY `fk_room_infos_addresses1_idx` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `room_infos`
--

INSERT INTO `room_infos` (`info_id`, `type_id`, `area`, `price`, `description`, `available`, `address_id`, `title`) VALUES
(11, 1, 30, '6000000', 'Cho de xe, internet, dieu hoa, may giat', b'1', 11, 'Cho thue can ho'),
(12, 2, 35, '5000000', 'Cho de xe, san phoi, thang may, internet', b'1', 12, 'Can ho mini'),
(13, 1, 20, '2800000', 'internet, co cho de xe', b'1', 13, 'Cho thue nha tro moi'),
(14, 2, 15, '900000', 'internet, truyen hinh cap, dieu hoa, may giat', b'1', 14, 'Phong tro cao cap quan 7'),
(15, 1, 20, '6000000', 'du tien nghi', b'1', 15, 'Cho thue phong tro hem 58 Doan Van Bo'),
(16, 2, 35, '7000000', 'Cho de xe, internet, dieu hoa', b'1', 16, 'Cho thue phong'),
(18, 2, 80, '6000000', 'Noi that san go, dieu hoa , nong lanh, tu bep, hut mui, bep hong ngoai,...', b'1', 18, 'Cho thue phong chung cu The Pride'),
(21, 2, 30, '4500000', 'Cho de xe, san phoi, binh nong lanh, truyen hinh cap, internet\r\n', b'1', 21, 'Cho thue nha nguyen can yen tinh'),
(22, 2, 40, '5000000', 'Cho de xe, thang may, dieu  hoa...', b'1', 22, 'Cho thue chung cu so 32/C1'),
(26, 2, 25, '1250000', 'San phoi, internet', b'1', 26, 'Tim nu o ghep'),
(27, 1, 15, '600000', 'Cho de xe, san phoi, internet', b'1', 27, 'Nha tro moi xay co gac lung'),
(29, 1, 39, '525000', 'Cho de xe, san phoi, internet, may giat, truyen hinh cap', b'1', 29, 'Can nam o ghep'),
(30, 2, 45, '5000000', 'Cho de xe, san phoi, dieu hoa, binh nong lanh', b'1', 30, 'Cho thue can ho mini mat pho'),
(31, 1, 25, '2000000', 'Phong tro tai vi tri thuan tien, gan nhieu truong dai hoc lon va khu cho', b'1', 31, 'Cho thue phong tro khep kin'),
(32, 2, 50, '3700000', 'Cho de xe, binh nong lanh, truyen hinh cap', b'1', 32, 'Cho thue phong tro so 17H'),
(33, 2, 40, '5000000', 'Cho de xe, san phoi, thang may', b'1', 33, 'Cho thue chung cu mini chinh chu'),
(47, 2, 12, '1000000', 'abc', b'1', 47, 'abc');

-- --------------------------------------------------------

--
-- Table structure for table `room_posts`
--

DROP TABLE IF EXISTS `room_posts`;
CREATE TABLE IF NOT EXISTS `room_posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_approved` bit(1) DEFAULT b'0',
  `approved_at` timestamp NULL DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `info_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `fk_room_posts_customers1_idx` (`customer_id`),
  KEY `fk_room_posts_room_infos1_idx` (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `room_posts`
--

INSERT INTO `room_posts` (`post_id`, `created_at`, `is_approved`, `approved_at`, `approved_by`, `customer_id`, `info_id`) VALUES
(7, '2017-11-17 03:35:46', b'1', NULL, NULL, 2, 11),
(8, '2017-11-09 09:10:36', b'1', NULL, NULL, 2, 12),
(9, '2017-11-09 09:10:31', b'1', NULL, NULL, 1, 13),
(10, '2017-10-24 07:56:03', b'1', NULL, NULL, 3, 14),
(11, '2017-10-24 07:56:04', b'1', NULL, NULL, 3, 15),
(12, '2017-10-24 07:56:06', b'1', NULL, NULL, 3, 16),
(14, '2017-10-24 07:55:59', b'1', NULL, NULL, 2, 18),
(17, '2017-10-24 07:55:57', b'1', NULL, NULL, 1, 21),
(18, '2017-10-24 07:55:58', b'1', NULL, NULL, 1, 22),
(22, '2017-10-24 07:56:01', b'1', NULL, NULL, 2, 26),
(23, '2017-10-24 08:06:02', b'1', NULL, NULL, 2, 27),
(25, '2017-11-06 08:10:35', b'0', NULL, NULL, 1, 29),
(26, '2017-11-06 08:42:24', b'0', NULL, NULL, 1, 30),
(27, '2017-11-06 11:59:31', b'0', NULL, NULL, 3, 31),
(28, '2017-11-06 12:10:42', b'1', NULL, NULL, 3, 32),
(29, '2017-11-12 12:47:13', b'0', NULL, NULL, 3, 33),
(43, '2017-12-04 08:56:14', b'1', NULL, NULL, 4, 47);

-- --------------------------------------------------------

--
-- Table structure for table `room_types`
--

DROP TABLE IF EXISTS `room_types`;
CREATE TABLE IF NOT EXISTS `room_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(70) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `room_types`
--

INSERT INTO `room_types` (`type_id`, `description`) VALUES
(1, 'Single room'),
(2, 'Multi room');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_customers_accounts` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `resources`
--
ALTER TABLE `resources`
  ADD CONSTRAINT `fk_resources_room_infos1` FOREIGN KEY (`room_info_id`) REFERENCES `room_infos` (`info_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `room_infos`
--
ALTER TABLE `room_infos`
  ADD CONSTRAINT `fk_room_infos_addresses1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_room_infos_room_types1` FOREIGN KEY (`type_id`) REFERENCES `room_types` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `room_posts`
--
ALTER TABLE `room_posts`
  ADD CONSTRAINT `fk_room_posts_customers1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_room_posts_room_infos1` FOREIGN KEY (`info_id`) REFERENCES `room_infos` (`info_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
