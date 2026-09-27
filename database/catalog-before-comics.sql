-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: shoptruyen
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Truyện trinh thám'),(2,'Truyện viễn tưởng'),(3,'Truyện cổ tích');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,NULL,'static/images/phone/robot.png','Sữa GrowPLUS+ xanh hỗ trợ dinh dưỡng 900g',281000,10,0,1),(2,NULL,'static/images/phone/1.png','Sữa GrowPLUS+ xanh hỗ trợ dinh dưỡng 900g',281000,22,0,2),(3,NULL,'static/images/phone/2.png','Sữa GrowPLUS+ xanh hỗ trợ dinh dưỡng 900g',281000,22,0,1),(6,NULL,'static/images/phone/5.png','Sữa GrowPLUS+ xanh hỗ trợ dinh dưỡng 900g',281000,22,0,1),(7,NULL,'static/images/phone/6.png','Sữa GrowPLUS+ xanh hỗ trợ dinh dưỡng 900g',281000,22,0,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-27 14:04:47
