CREATE DATABASE  IF NOT EXISTS `thecoders`;
USE `thecoders`;
-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: db4free.net    Database: thecoders
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `TASK`
--

DROP TABLE IF EXISTS `TASK`;

 
CREATE TABLE `TASK` (
  `TASKID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  `CATEGORY` varchar(45) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `DUEDATE` varchar(45) DEFAULT NULL,
  `STATUS` varchar(45) DEFAULT NULL,
  `ASSIGNTO` varchar(45) DEFAULT NULL,
  `ASSIGNTEAM` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TASKID`)
) ENGINE=InnoDB AUTO_INCREMENT=14;

--
-- Dumping data for table `TASK`
--

LOCK TABLES `TASK` WRITE;
/*!40000 ALTER TABLE `TASK` DISABLE KEYS */;
INSERT INTO `TASK` VALUES (1,'FrontEnd Task','work',3,'2019-04-12 00:00:00','NEW','11','team3'),(2,'Backend Task1','work',1,'04/21/2019','NEW','10',''),(13,'test1','work',1,'04/22/2019','NEW','11','team2');
/*!40000 ALTER TABLE `TASK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEAM`
--

DROP TABLE IF EXISTS `TEAM`;

 
CREATE TABLE `TEAM` (
  `TeamID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TeamID`)
) ENGINE=InnoDB ;

--
-- Dumping data for table `TEAM`
--

LOCK TABLES `TEAM` WRITE;
/*!40000 ALTER TABLE `TEAM` DISABLE KEYS */;
/*!40000 ALTER TABLE `TEAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEAMS`
--

DROP TABLE IF EXISTS `TEAMS`;

 
CREATE TABLE `TEAMS` (
  `TEAMID` int(10) NOT NULL AUTO_INCREMENT,
  `TEAMNAME` varchar(500) DEFAULT NULL,
  `DESCRIPTION` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`TEAMID`)
) ENGINE=InnoDB AUTO_INCREMENT=10  ;

--
-- Dumping data for table `TEAMS`
--

LOCK TABLES `TEAMS` WRITE;
/*!40000 ALTER TABLE `TEAMS` DISABLE KEYS */;
INSERT INTO `TEAMS` VALUES (1,'Team1','Team1 description                                                '),(2,'Team1','Team1 description                                                '),(3,'team2','team2slkewkwew                                                '),(4,'team88','team88slkewkwew                                                '),(5,'team4','team4                                                '),(6,'elwew','elrer                                                '),(7,'dfgdte','ryrtyrtyr                                                '),(8,'sadfrere','dfdfsdf                                                '),(9,'erklweerjw','qqwrwlkrtjewrt                                                ');
/*!40000 ALTER TABLE `TEAMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEAMUSER`
--

DROP TABLE IF EXISTS `TEAMUSER`;

 
CREATE TABLE `TEAMUSER` (
  `TEAMID` int(11) NOT NULL,
  `USERID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TEAMID`)
) ENGINE=InnoDB;


--
-- Dumping data for table `TEAMUSER`
--

LOCK TABLES `TEAMUSER` WRITE;
/*!40000 ALTER TABLE `TEAMUSER` DISABLE KEYS */;
/*!40000 ALTER TABLE `TEAMUSER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;

 
CREATE TABLE `USER` (
  `USERID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `FULLNAME` varchar(50) DEFAULT NULL,
  `GENDER` varchar(50)  DEFAULT NULL,
  `STATE` varchar(50) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL,
  `STREET` varchar(50) DEFAULT NULL,
  `ZIPCODE` int(11) DEFAULT NULL,
  `BIRTHDATE` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `ROLE` varchar(10) NOT NULL,
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;


--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (2,'test','123','Viet Anh Phan',NULL,NULL,NULL,NULL,0,NULL,'phanvietanh90@gmail.com','manager'),(6,'test4','123',NULL,NULL,NULL,NULL,NULL,0,NULL,'phanvietanh90@gmail.com','guest'),(8,'h','123',NULL,NULL,NULL,NULL,NULL,0,NULL,'h@yahoo.com','manager'),(9,'adbu','123456','Abdul',NULL,'IOWA','Fairfield','',0,NULL,'','developer'),(10,'','','Viet Anh Phan',NULL,'Iowa','Fairfield','',0,NULL,'','developer'),(11,'developer','developer','Develeper',NULL,'','','',0,NULL,'','developer'),(12,'hisham','123','hisham',NULL,'IOWA','','',0,NULL,'','developer'),(13,'admin','admin','admin',NULL,'','','',0,NULL,'','admin');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;


-- Dump completed on 2019-04-22  9:44:02
