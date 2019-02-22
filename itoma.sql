-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2019 at 11:12 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itoma`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(10) NOT NULL,
  `number` varchar(20) NOT NULL,
  `year_made` date NOT NULL,
  `model` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `number`, `year_made`, `model`) VALUES
(1, 'JHT477', '2019-02-21', 'Avensis'),
(2, 'JHT420', '2019-02-18', 'Corolla'),
(3, 'JTT477', '2019-02-02', 'Cerato'),
(4, 'NPT147', '2019-02-24', 'Mondeo');

-- --------------------------------------------------------

--
-- Table structure for table `car_management`
--

CREATE TABLE `car_management` (
  `id` int(11) NOT NULL,
  `cars_id` int(11) NOT NULL,
  `segments_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_management`
--

INSERT INTO `car_management` (`id`, `cars_id`, `segments_id`, `user_id`, `date_from`, `date_to`) VALUES
(1, 3, 4, 2, '2019-02-03', '2019-02-28'),
(2, 4, 2, 3, '2019-02-11', '2019-02-28'),
(3, 1, 3, 1, '2019-02-17', '2019-02-22'),
(4, 2, 1, 4, '2019-02-04', '2019-02-23');

-- --------------------------------------------------------

--
-- Table structure for table `car_status`
--

CREATE TABLE `car_status` (
  `id` int(11) NOT NULL,
  `cars_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_status`
--

INSERT INTO `car_status` (`id`, `cars_id`, `status_id`, `date_from`, `date_to`) VALUES
(1, 1, 1, '2019-02-03', '2019-02-23'),
(2, 2, 3, '2019-02-04', '2019-02-22'),
(3, 3, 1, '2019-02-11', '2019-02-28'),
(4, 4, 1, '2019-02-03', '2019-02-05');

-- --------------------------------------------------------

--
-- Table structure for table `segments`
--

CREATE TABLE `segments` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `segments`
--

INSERT INTO `segments` (`id`, `name`) VALUES
(1, 'Nejauskas'),
(2, 'Jankauskas'),
(3, 'Petrusevicius'),
(4, 'Lukauskas'),
(5, 'Hendrijauskas');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `parent_id`) VALUES
(1, 'geras', 1),
(2, 'blogas', 2),
(3, 'patenkinamas', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `segment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `segment_id`) VALUES
(1, 'Tomas', 3),
(2, 'Tomas', 4),
(3, 'Lukas', 5),
(4, 'Kestas', 2),
(5, 'Justas', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_management`
--
ALTER TABLE `car_management`
  ADD PRIMARY KEY (`id`),
  ADD KEY `segments_id` (`segments_id`),
  ADD KEY `cars_id` (`cars_id`);

--
-- Indexes for table `car_status`
--
ALTER TABLE `car_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cars_id` (`cars_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `segments`
--
ALTER TABLE `segments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `segment_id` (`segment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `car_management`
--
ALTER TABLE `car_management`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `car_status`
--
ALTER TABLE `car_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `segments`
--
ALTER TABLE `segments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
