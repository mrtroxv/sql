-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2022 at 09:07 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `swap_ar_uni`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `ID` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `EN_Name` varchar(255) NOT NULL,
  `AR_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `ID` int(11) NOT NULL,
  `EN_Name` varchar(255) NOT NULL,
  `AR_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

CREATE TABLE `offer` (
  `id` int(11) NOT NULL,
  `offer_date` date NOT NULL,
  `university_id` int(11) NOT NULL,
  `stu_id` int(11) NOT NULL,
  `requirement` varchar(255) NOT NULL,
  `work_description` varchar(255) NOT NULL,
  `work_type` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `Financial_support` varchar(255) NOT NULL,
  `offer_dead_line` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `representative`
--

CREATE TABLE `representative` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `university_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `fax` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student_e`
--

CREATE TABLE `student_e` (
  `ID` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `mid_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `university_id` int(11) NOT NULL,
  `collage` varchar(255) NOT NULL,
  `study_field` varchar(255) NOT NULL,
  `birth_place` varchar(255) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `passport_end_date` date NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `location` varchar(255) NOT NULL,
  `passport_id` int(11) NOT NULL,
  `Section` varchar(255) NOT NULL,
  `Scientific_level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `ID` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `EN_Name` varchar(255) NOT NULL,
  `AR_Name` varchar(255) NOT NULL,
  `Location_O` varchar(255) NOT NULL,
  `Study_business` varchar(255) NOT NULL,
  `work_day` varchar(255) NOT NULL,
  `hour_no_week` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `Fax` int(11) NOT NULL,
  `hour_no_day` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `university_id` (`university_id`),
  ADD KEY `stu_id` (`stu_id`);

--
-- Indexes for table `representative`
--
ALTER TABLE `representative`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `university_id` (`university_id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `student_e`
--
ALTER TABLE `student_e`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `city_id` (`city_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offer`
--
ALTER TABLE `offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `representative`
--
ALTER TABLE `representative`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_e`
--
ALTER TABLE `student_e`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `university`
--
ALTER TABLE `university`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `country`
--
ALTER TABLE `country`
  ADD CONSTRAINT `country_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `city` (`country_id`);

--
-- Constraints for table `offer`
--
ALTER TABLE `offer`
  ADD CONSTRAINT `offer_ibfk_1` FOREIGN KEY (`university_id`) REFERENCES `university` (`ID`),
  ADD CONSTRAINT `offer_ibfk_2` FOREIGN KEY (`stu_id`) REFERENCES `student_e` (`ID`);

--
-- Constraints for table `representative`
--
ALTER TABLE `representative`
  ADD CONSTRAINT `representative_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`ID`),
  ADD CONSTRAINT `representative_ibfk_2` FOREIGN KEY (`university_id`) REFERENCES `university` (`ID`),
  ADD CONSTRAINT `representative_ibfk_3` FOREIGN KEY (`city_id`) REFERENCES `city` (`ID`);

--
-- Constraints for table `student_e`
--
ALTER TABLE `student_e`
  ADD CONSTRAINT `student_e_ibfk_1` FOREIGN KEY (`university_id`) REFERENCES `university` (`ID`);

--
-- Constraints for table `university`
--
ALTER TABLE `university`
  ADD CONSTRAINT `university_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`ID`),
  ADD CONSTRAINT `university_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `country` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
