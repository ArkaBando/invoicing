-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2019 at 11:41 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoicing`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `HSN` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SAC_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`, `HSN`, `SAC_code`) VALUES
(1, 'Website Maintenance ', '998313', '111111'),
(2, 'Emailer', '', ''),
(3, 'Additional Emailers', NULL, NULL),
(4, 'Application Development', '', NULL),
(5, 'Website Maintenance & SEO', '998311', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `city_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` bigint(20) NOT NULL,
  `country_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`) VALUES
(1, 'USA'),
(2, 'INDIA'),
(3, 'Australia'),
(4, 'Newzealand');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` bigint(20) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_shortcode` varchar(100) DEFAULT NULL,
  `customer_address` varchar(500) DEFAULT NULL,
  `customer_state` varchar(100) DEFAULT NULL,
  `customer_contact_number` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `gstno` varchar(100) DEFAULT NULL,
  `panno` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_shortcode`, `customer_address`, `customer_state`, `customer_contact_number`, `email`, `comment`, `gstno`, `panno`) VALUES
(1, 'Reliance Nippon Life Asset Management Limited', 'RMF', 'Reliance Centre, 5th Floor South Wing, Off Western Express Highway, Santacruz (East),Mumbai 400055', 'MH', '', 'Aarti.Boridkar@relianceada.com', '', '27AAACR2668G1ZB', ''),
(2, 'Reliance Home Video &amp; Games - Division of Reliance Big Entertainment Pvt Ltd ', 'HVG', 'Grandeur,8th Floor, Veera Desai Road Extension,Oshiwara, Andheri (West),Mumbai - 400053, India.', 'MH', '', 'yogesh.koparde@reliancehvg.com', '', '27AAFCA6658L1Z6', ''),
(3, 'BNP Paribas Asset Management India Private Limited', 'BNP', 'BNP Paribas House, 1, North Maker Maxity, Bandra Kurla Complex Bandra (E)\r\nMumbai – 400 051', 'MH', '', 'tejas.despande@bnpparibas.in', '', '27AAECA5153B1Z4', 'AAECA5153B'),
(4, 'Reliance Health Insurance Limited', 'RHI', 'Reliance Center,2nd Floor,North Wing,Off Western Express Highway,Santacruz East,Mumbai-55', 'MH', '', '', '', ' 27AAICR2814E1ZJ', '');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` varchar(200) NOT NULL,
  `last_login_date` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`user_id`, `user_name`, `email`, `password`, `role`, `last_login_date`, `status`) VALUES
(1, 'admin', 'admin@demo.com', 'admin', 'Admin', '2018-05-09', 1),
(2, 'John', 'john@demo.com', 'john', 'Staff', '2018-05-09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ID` int(11) NOT NULL,
  `order_suffix` varchar(100) NOT NULL,
  `order_date` date NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `PO` varchar(100) DEFAULT NULL,
  `customer_name` varchar(250) NOT NULL,
  `customer_address` varchar(500) DEFAULT NULL,
  `customer_state` varchar(100) DEFAULT NULL,
  `seller` varchar(500) DEFAULT NULL,
  `order_amount` decimal(10,0) NOT NULL,
  `CGST` varchar(100) DEFAULT NULL,
  `qty` int(10) DEFAULT '1',
  `SGST` varchar(100) DEFAULT NULL,
  `IGST` varchar(100) NOT NULL,
  `transport_mode` varchar(100) DEFAULT NULL,
  `vehicle_no` varchar(100) DEFAULT NULL,
  `date_of_supply` date DEFAULT NULL,
  `place_of_supply` varchar(100) DEFAULT NULL,
  `reverse_charge` varchar(100) DEFAULT NULL,
  `order_status` varchar(100) NOT NULL,
  `comments` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ID`, `order_suffix`, `order_date`, `category`, `PO`, `customer_name`, `customer_address`, `customer_state`, `seller`, `order_amount`, `CGST`, `qty`, `SGST`, `IGST`, `transport_mode`, `vehicle_no`, `date_of_supply`, `place_of_supply`, `reverse_charge`, `order_status`, `comments`) VALUES
(39, 'RMF/19-20', '2019-04-12', '1', '5506001514', 'Reliance Nippon Life Asset Management Limited', 'Reliance Centre, 5th Floor South Wing, Off Western Express Highway, Santacruz (East),Mumbai 400055', 'Maharashtra', '1', '110000', '9', 1, '9', '', '', '', '0000-00-00', '', '', '1', 'Website April 2019'),
(40, 'RMF/19-20', '2019-04-12', '1', '5506001514', 'Reliance Nippon Life Asset Management Limited', 'Reliance Centre, 5th Floor South Wing, Off Western Express Highway, Santacruz (East),Mumbai 400055', 'Maharashtra', '1', '110000', '', 3, '', '18', 'Y', '8902', '2019-04-18', 'mumbai', 'N', '1', 'Website April 2019');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(250) NOT NULL,
  `state` varchar(50) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `gstno` varchar(100) NOT NULL,
  `panno` varchar(100) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `bankdetails` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `name`, `email`, `phone`, `address`, `state`, `fax`, `gstno`, `panno`, `logo`, `bankdetails`) VALUES
(1, 'CELEST TECHNOLOGIES LLP', 'billing@celesttechnologies.com', '', '101,Sai Indu Commercial Tower,LBS Marg ,Bhandup West ,Mumbai 400078', 'MH', '', '27AAJFC3253C1ZS', 'AAJFC3253C', 'http://localhost/Invoicing/script/uploads/1554454423_logoHD.png.png', 'Bank A/C:10190000073135					\r\nBank IFSC: BDBL0001564 (Bandhan Bank)					\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `tin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `name`, `code`, `tin`) VALUES
(5, 'Maharashtra', 'MH', 27);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
