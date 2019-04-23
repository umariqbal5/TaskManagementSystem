-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 22, 2019 at 07:47 PM
-- Server version: 8.0.15
-- PHP Version: 7.2.15-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thecoders`
--

-- --------------------------------------------------------

--
-- Table structure for table `TASK`
--

CREATE TABLE `TASK` (
  `TASKID` int(11) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `CATEGORY` varchar(45) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `DUEDATE` varchar(45) DEFAULT NULL,
  `STATUS` varchar(45) DEFAULT NULL,
  `ASSIGNTO` varchar(45) DEFAULT NULL,
  `ASSIGNTEAM` varchar(45) DEFAULT NULL
);

--
-- Dumping data for table `TASK`
--

INSERT INTO `TASK` (`TASKID`, `NAME`, `CATEGORY`, `PRIORITY`, `DUEDATE`, `STATUS`, `ASSIGNTO`, `ASSIGNTEAM`) VALUES
(1, 'FrontEnd Task', 'work', 3, '05/09/2019', 'COMPLETED', '', 'team3'),
(2, 'Backend Task1', 'work', 1, '04/21/2019', 'COMPLETED', '10', ''),
(13, 'test1', 'work', 1, '04/22/2019', 'COMPLETED', '11', 'team2'),
(14, 'FrontEnd Task', 'work', 3, '05/03/2019', 'COMPLETED', '', 'team3');

-- --------------------------------------------------------

--
-- Table structure for table `TEAM`
--

CREATE TABLE `TEAM` (
  `TeamID` int(10) UNSIGNED NOT NULL,
  `NAME` varchar(45) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `TEAMS`
--

CREATE TABLE `TEAMS` (
  `TEAMID` int(10) NOT NULL,
  `TEAMNAME` varchar(500) DEFAULT NULL,
  `DESCRIPTION` varchar(5000) DEFAULT NULL
) ;

--
-- Dumping data for table `TEAMS`
--

INSERT INTO `TEAMS` (`TEAMID`, `TEAMNAME`, `DESCRIPTION`) VALUES
(1, 'Team1', 'Team1 description                                                '),
(2, 'Team1', 'Team1 description                                                '),
(5, 'team4', 'team4                                                '),
(7, 'dfgdte', 'ryrtyrtyr                                                '),
(9, 'erklweerjw', 'qqwrwlkrtjewrt                                                '),
(11, 'Team 10', 'Team 10                                                ');

-- --------------------------------------------------------

--
-- Table structure for table `TEAMUSER`
--

CREATE TABLE `TEAMUSER` (
  `TEAMID` int(11) NOT NULL,
  `USERID` int(11) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `USER`
--

CREATE TABLE `USER` (
  `USERID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `FULLNAME` varchar(50) DEFAULT NULL,
  `GENDER` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STATE` varchar(50) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL,
  `STREET` varchar(50) DEFAULT NULL,
  `ZIPCODE` int(11) DEFAULT NULL,
  `BIRTHDATE` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `ROLE` varchar(10) NOT NULL
) ;

--
-- Dumping data for table `USER`
--

INSERT INTO `USER` (`USERID`, `USERNAME`, `PASSWORD`, `FULLNAME`, `GENDER`, `STATE`, `CITY`, `STREET`, `ZIPCODE`, `BIRTHDATE`, `EMAIL`, `ROLE`) VALUES
(2, 'test', '123', 'Viet Anh Phan', NULL, NULL, NULL, NULL, 0, NULL, 'phanvietanh90@gmail.com', 'manager'),
(16, 'dlsdadsds', 'dlsdadsds', 'dsd', 'male', '', '', '', 0, NULL, '', 'developer'),
(18, 'admin', 'admin', 'admin', '', '', '', '', 0, NULL, '', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `TASK`
--
ALTER TABLE `TASK`
  ADD PRIMARY KEY (`TASKID`);

--
-- Indexes for table `TEAM`
--
ALTER TABLE `TEAM`
  ADD PRIMARY KEY (`TeamID`);

--
-- Indexes for table `TEAMS`
--
ALTER TABLE `TEAMS`
  ADD PRIMARY KEY (`TEAMID`);

--
-- Indexes for table `TEAMUSER`
--
ALTER TABLE `TEAMUSER`
  ADD PRIMARY KEY (`TEAMID`);

--
-- Indexes for table `USER`
--
ALTER TABLE `USER`
  ADD PRIMARY KEY (`USERID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `TASK`
--
ALTER TABLE `TASK`
  MODIFY `TASKID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `TEAM`
--
ALTER TABLE `TEAM`
  MODIFY `TeamID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `TEAMS`
--
ALTER TABLE `TEAMS`
  MODIFY `TEAMID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `USER`
--
ALTER TABLE `USER`
  MODIFY `USERID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
