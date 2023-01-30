-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 30, 2023 at 11:37 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flaskcrud`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `street` varchar(255) NOT NULL,
  `suite` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `lat` varchar(255) NOT NULL,
  `lng` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `userid`, `street`, `suite`, `city`, `zipcode`, `lat`, `lng`) VALUES
(1, 1, 'Kulas Light', 'Apt. 556', 'Gwenborough', '92998-3874', '-37.3159', '81.1496'),
(2, 2, 'Victor Plains', 'Suite 879', 'Wisokyburgh', '90566-7771', '-43.9509', '-34.4618'),
(3, 3, 'Douglas Extension', 'Suite 847', 'McKenziehaven', '59590-4157', '-68.6102', '-47.0653'),
(4, 4, 'Hoeger Mall', 'Apt. 692', 'South Elvis', '53919-4257', '29.4572', '-164.2990'),
(5, 5, 'Skiles Walks', 'Suite 351', 'Roscoeview', '33263', '-31.8129', '62.5342'),
(6, 6, 'Norberto Crossing', 'Apt. 950', 'South Christy', '23505-1337', '-71.4197', '71.7478'),
(7, 7, 'Rex Trail', 'Suite 280', 'Howemouth', '58804-1099', '24.8918', '21.8984'),
(8, 8, 'Ellsworth Summit', 'Suite 729', 'Aliyaview', '45169', '-14.3990', '-120.7677'),
(9, 9, 'Dayna Park', 'Suite 449', 'Bartholomebury', '76495-3109', '24.6463', '-168.8889'),
(10, 10, 'Kattie Turnpike', 'Suite 198', 'Lebsackbury', '31428-2261', '-38.2386', '57.2232'),
(11, 11, 'Techvivid Holdings 09 George Silundika Harare', 'Suite 700', 'Harare', '54545 868', '24.6463', '5665757');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `catchphrase` varchar(255) NOT NULL,
  `bs` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `userid`, `name`, `catchphrase`, `bs`) VALUES
(1, 1, 'Romaguera-Crona', 'Multi-layered client-server neural-net', 'harness real-time e-markets'),
(2, 2, 'Deckow-Crist', 'Proactive didactic contingency', 'synergize scalable supply-chains'),
(3, 3, 'Romaguera-Jacobson', 'Face to face bifurcated interface', 'e-enable strategic applications'),
(4, 4, 'Robel-Corkery', 'Multi-tiered zero tolerance productivity', 'transition cutting-edge web services'),
(5, 5, 'Keebler LLC', 'User-centric fault-tolerant solution', 'revolutionize end-to-end systems'),
(6, 6, 'Considine-Lockman', 'Synchronised bottom-line interface', 'e-enable innovative applications'),
(7, 7, 'Johns Group', 'Configurable multimedia task-force', 'generate enterprise e-tailers'),
(8, 8, 'Abernathy Group', 'Implemented secondary concept', 'e-enable extensible e-tailers'),
(9, 9, 'Yost and Sons', 'Switchable contextually-based project', 'aggregate real-time technologies'),
(10, 10, 'Hoeger LLC', 'Centralized empowering task-force', 'target end-to-end models'),
(11, 11, 'Ushlar Investments', 'Ashlas', 'e-enable extensible e-tailers');

-- --------------------------------------------------------

--
-- Table structure for table `credentials`
--

CREATE TABLE `credentials` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `account_state` varchar(10) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `credentials`
--

INSERT INTO `credentials` (`id`, `username`, `password`, `account_state`, `created_at`) VALUES
(1, 'admin@gmail.com', 'pswd', 'Active', '2023-01-30 13:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `personal`
--

CREATE TABLE `personal` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `personal`
--

INSERT INTO `personal` (`id`, `name`, `username`, `email`, `phone`, `website`, `date_created`) VALUES
(1, 'Leanne Graham', 'Bret', 'Sincere@april.biz', '1-770-736-8031 x56442', 'hildegard.org', '2023-01-30 15:56:13'),
(2, 'Ervin Howell', 'Antonette', 'Shanna@melissa.tv', '010-692-6593 x09125', 'anastasia.net', '2023-01-30 15:56:13'),
(3, 'Clementine Bauch', 'Samantha', 'Nathan@yesenia.net', '1-463-123-4447', 'ramiro.info', '2023-01-30 15:56:13'),
(4, 'Patricia Lebsack', 'Karianne', 'Julianne.OConner@kory.org', '493-170-9623 x156', 'kale.biz', '2023-01-30 15:56:13'),
(5, 'Chelsey Dietrich', 'Kamren', 'Lucio_Hettinger@annie.ca', '(254)954-1289', 'demarco.info', '2023-01-30 15:56:13'),
(6, 'Mrs. Dennis Schulist', 'Leopoldo_Corkery', 'Karley_Dach@jasper.info', '1-477-935-8478 x6430', 'ola.org', '2023-01-30 15:56:13'),
(7, 'Kurtis Weissnat', 'Elwyn.Skiles', 'Telly.Hoeger@billy.biz', '210.067.6132', 'elvis.io', '2023-01-30 15:56:13'),
(8, 'Nicholas Runolfsdottir V', 'Maxime_Nienow', 'Sherwood@rosamond.me', '586.493.6943 x140', 'jacynthe.com', '2023-01-30 15:56:13'),
(9, 'Glenna Reichert', 'Delphine', 'Chaim_McDermott@dana.io', '(775)976-6794 x41206', 'conrad.com', '2023-01-30 15:56:13'),
(10, 'Clementina DuBuque', 'Moriah.Stanton', 'Rey.Padberg@karina.biz', '024-648-3804', 'ambrose.net', '2023-01-30 15:56:13'),
(11, 'Kelvin Severino Mubatapasango', 'minks263', 'cccmubata@gmail.com', '0773228829', 'www.kevycode.co.zw', '2023-01-30 15:58:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credentials`
--
ALTER TABLE `credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `credentials`
--
ALTER TABLE `credentials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal`
--
ALTER TABLE `personal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
