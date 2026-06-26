-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema cloudhealthcare
--

CREATE DATABASE IF NOT EXISTS cloudhealthcare;
USE cloudhealthcare;

--
-- Definition of table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
CREATE TABLE `doctors` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `ustatus` varchar(45) NOT NULL,
  `regtime` varchar(45) NOT NULL,
  `lastlog` varchar(45) default '0',
  `vparam` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;


--
-- Definition of table `mdatarequest`
--

DROP TABLE IF EXISTS `mdatarequest`;
CREATE TABLE `mdatarequest` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `dname` varchar(45) NOT NULL,
  `did` varchar(45) NOT NULL,
  `dmail` varchar(45) NOT NULL,
  `pid` varchar(45) NOT NULL,
  `pname` varchar(45) NOT NULL,
  `reqstatus` varchar(45) NOT NULL,
  `reqtime` varchar(45) NOT NULL,
  `accesspol` varchar(45) NOT NULL,
  `dkey` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mdatarequest`
--

/*!40000 ALTER TABLE `mdatarequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdatarequest` ENABLE KEYS */;


--
-- Definition of table `medicalrecords`
--

DROP TABLE IF EXISTS `medicalrecords`;
CREATE TABLE `medicalrecords` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `pid` varchar(45) NOT NULL,
  `pname` varchar(45) NOT NULL,
  `pmail` varchar(45) NOT NULL,
  `pphone` varchar(45) NOT NULL,
  `blood` varchar(45) NOT NULL,
  `bp` varchar(45) NOT NULL,
  `btemp` varchar(45) NOT NULL,
  `pulserate` varchar(45) NOT NULL,
  `uploaddate` varchar(45) NOT NULL,
  `uptime` varchar(45) NOT NULL,
  `pmedications` longtext NOT NULL,
  `skey` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicalrecords`
--

/*!40000 ALTER TABLE `medicalrecords` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicalrecords` ENABLE KEYS */;


--
-- Definition of table `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE `patients` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `ustatus` varchar(45) NOT NULL,
  `regtime` varchar(45) NOT NULL,
  `lastlog` varchar(45) default '0',
  `vparam` longtext NOT NULL,
  `pid` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patients`
--

/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
