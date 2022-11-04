-- MariaDB dump 10.19  Distrib 10.6.10-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: railway
-- ------------------------------------------------------
-- Server version	10.6.10-MariaDB-1+b1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `railway`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `railway` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `railway`;

--
-- Table structure for table `AVAILABLE`
--

DROP TABLE IF EXISTS `AVAILABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AVAILABLE` (
  `train_no` varchar(10) DEFAULT NULL,
  `week_day` varchar(10) DEFAULT NULL,
  `seat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AVAILABLE`
--

LOCK TABLES `AVAILABLE` WRITE;
/*!40000 ALTER TABLE `AVAILABLE` DISABLE KEYS */;
INSERT INTO `AVAILABLE` VALUES ('12068','02456',120),('12381','0236',120),('12184','145',120),('14006','024',120),('12417','01234',120),('989898','135',80);
/*!40000 ALTER TABLE `AVAILABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEARCH`
--

DROP TABLE IF EXISTS `SEARCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEARCH` (
  `from_code` varchar(10) NOT NULL,
  `to_code` varchar(10) NOT NULL,
  `d_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEARCH`
--

LOCK TABLES `SEARCH` WRITE;
/*!40000 ALTER TABLE `SEARCH` DISABLE KEYS */;
/*!40000 ALTER TABLE `SEARCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STATION`
--

DROP TABLE IF EXISTS `STATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STATION` (
  `station_code` varchar(10) DEFAULT NULL,
  `train_no` varchar(10) DEFAULT NULL,
  `arrival_t` varchar(10) DEFAULT NULL,
  `departure_t` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STATION`
--

LOCK TABLES `STATION` WRITE;
/*!40000 ALTER TABLE `STATION` DISABLE KEYS */;
INSERT INTO `STATION` VALUES ('CNB','12303','08:00','08:10'),('CNB','12381','08:15','08:20'),('CNB','12184','19:10','19:20'),('CNB','22538','00:35','00:50'),('CNB','12108','20:40','20:50'),('CNB','14006','18:00','18:10'),('DHN','12417','08:00','08:10'),('DHN','12381','18:15','18:20'),('DHN','12184','09:10','09:20'),('DHN','22548','00:35','00:50'),('DHN','12168','20:40','20:50'),('DHN','14006','05:05','05:05'),('PNBE','12487','08:00','08:10'),('PNBE','12381','12:15','12:20'),('PNBE','12184','05:10','05:20'),('PNBE','20548','00:35','00:50'),('PNBE','12068','20:40','20:50'),('PNBE','14006','01:05','01:05'),('KRH','989898','06:20','08:00');
/*!40000 ALTER TABLE `STATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TICKET`
--

DROP TABLE IF EXISTS `TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TICKET` (
  `pnr` int(11) NOT NULL AUTO_INCREMENT,
  `from_code` varchar(10) NOT NULL,
  `to_code` varchar(10) NOT NULL,
  `d_date` date NOT NULL,
  `passenger_name` varchar(20) DEFAULT NULL,
  `seat_no` int(11) DEFAULT NULL,
  `train_no` varchar(10) NOT NULL,
  PRIMARY KEY (`pnr`)
) ENGINE=InnoDB AUTO_INCREMENT=10017 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TICKET`
--

LOCK TABLES `TICKET` WRITE;
/*!40000 ALTER TABLE `TICKET` DISABLE KEYS */;
INSERT INTO `TICKET` VALUES (10000,'CNB','DHN','2022-11-11','Driver',1,'12184'),(10001,'DHN','PNBE','2022-11-01','Gulshan Anand',1,'12381'),(10002,'DHN','PNBE','2022-11-01','Varun',2,'12381'),(10003,'DHN','PNBE','2022-11-01','Aviral',1,'14006'),(10004,'DHN','PNBE','2022-11-01','Avishek Kumar',2,'14006'),(10005,'DHN','PNBE','2022-11-15','Ravi',1,'14006'),(10006,'DHN','PNBE','2022-11-16','Rahul',1,'12381'),(10007,'PNBE','DHN','2022-11-04','Messi',1,'12184'),(10008,'PNBE','CNB','2022-11-05','Ronaldo',1,'12381'),(10009,'DHN','PNBE','2022-11-01','Kohli',3,'14006'),(10010,'PNBE','DHN','2022-11-01','Rohit',4,'14006'),(10011,'CNB','PNBE','2022-11-01','Dhoni',5,'14006'),(10012,'CNB','DHN','2022-11-04','Yuvraj Singh',2,'12184'),(10013,'CNB','DHN','2022-10-04','varun',1,'12381'),(10014,'CNB','DHN','2022-11-01','gulshan',3,'12381'),(10015,'CNB','DHN','2022-11-01','Priya',4,'12381'),(10016,'DHN','PNBE','2022-11-01','Gulshan Anand',5,'12381');
/*!40000 ALTER TABLE `TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER` (
  `user_name` varchar(20) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `phone_no` varchar(10) NOT NULL,
  `emailid` varchar(50) NOT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES ('A','IR12','IR12',19,'M','0023332123','abc@gmail.com','Amber'),('B','IR13','IR13',29,'M','0023332133','def@gmail.com','Jasper'),('C','IR14','IR14',39,'M','0023332143','ghi@gmail.com','Rosaline'),('aviral','aks@gmail.com1','1234',19,'male','100','aks@gmail.com1','house no'),('varun','varun@gmail.com','0987',25,'female','101','varun@gmail.com','stable'),('Admin','admin123@gmail.com','godpassword',42,'Male','9898989898','admin123@gmail.com','Delhi'),('sonam','sonam@gmail.com','123',20,'female','7543548154','sonam@gmail.com','Rosaline'),('Gulshan Anand','gulshan2052@gmail.com','123456',20,'Male','8797287249','gulshan2052@gmail.com','Patna');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-31 10:16:50
