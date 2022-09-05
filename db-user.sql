-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 15, 2022 at 06:28 AM
-- Server version: 8.0.17
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qrcode`
--

-- --------------------------------------------------------

--
-- Table structure for table `db_user`
--

CREATE TABLE `db_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_lastname` varchar(50) NOT NULL,
  `user_username` varchar(25) NOT NULL,
  `user_password` varchar(25) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_access` int(1) NOT NULL,
  `user_qrgen` varchar(24) NOT NULL,
  `user_priority` int(1) NOT NULL,
  `user_qrimg` varchar(255) NOT NULL,
  `user_lastqr` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `db_user`
--

INSERT INTO `db_user` (`user_id`, `user_name`, `user_lastname`, `user_username`, `user_password`, `user_email`, `user_access`, `user_qrgen`, `user_priority`, `user_qrimg`, `user_lastqr`) VALUES
(1, 'Thaw', 'Watcha', 'admin', '1234', 'admin@mail.com', 1, '813434278950', 1, '813434278950.jpg', '2022-07-15 10:52:57'),
(2, 'Kitthaphob', 'Trichada', 'user', '1234', 'karnhot_notza@mail.com', 1, '584401539146710288747343', 1, '584401539146710288747343100654051429.jpg', '0000-00-00 00:00:00'),
(3, 'testuser', 'lastnamelah', 'user2', '1234', 'mail@mail.com', 0, '', 0, '', '0000-00-00 00:00:00'),
(4, 'oatkhai', 'oatleh', 'user1', '1234', 'testmail@mail.com', 0, '302694535544', 0, '302694535544.jpg', '2022-07-11 18:05:00'),
(5, 'wowza', 'wowwoza', 'test', '1234', 'test@mail.om', 0, '905229526001', 0, '905229526001.jpg', '2022-07-12 11:19:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `db_user`
--
ALTER TABLE `db_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `db_user`
--
ALTER TABLE `db_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
