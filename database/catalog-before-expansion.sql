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
INSERT INTO `category` VALUES (1,'Truyện phiêu lưu'),(2,'Truyện ninja'),(3,'Truyện cổ tích');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Tác giả: Eiichiro Oda. Tập mở đầu hành trình chinh phục biển cả của Luffy. Ảnh bìa minh họa bản tiếng Anh do VIZ phát hành.','static/images/comics/one-piece-1.jpg','One Piece - Tập 1',30000,10,0,1),(2,'Tác giả: Masashi Kishimoto. Cùng Naruto bắt đầu hành trình trở thành ninja. Ảnh bìa minh họa bản tiếng Anh do VIZ phát hành.','static/images/comics/naruto-1.jpg','Naruto - Tập 1',30000,22,0,2),(3,'Tác giả: Eiichiro Oda. Tiếp tục chuyến phiêu lưu cùng Luffy và những người bạn. Ảnh bìa minh họa bản tiếng Anh do VIZ phát hành.','static/images/comics/one-piece-2.jpg','One Piece - Tập 2',30000,22,0,1),(6,'Tác giả: Eiichiro Oda. Một tập tiếp theo dành cho tủ truyện One Piece của bạn. Ảnh bìa minh họa bản tiếng Anh do VIZ phát hành.','static/images/comics/one-piece-3.jpg','One Piece - Tập 3',30000,22,0,1),(7,'Tác giả: Eiichiro Oda. Theo chân băng hải tặc trong những cuộc gặp gỡ mới. Ảnh bìa minh họa bản tiếng Anh do VIZ phát hành.','static/images/comics/one-piece-4.jpg','One Piece - Tập 4',30000,22,0,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-27 14:46:22
