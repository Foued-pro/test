-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: video
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artistes`
--

DROP TABLE IF EXISTS `artistes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artistes` (
  `artiste_id` int NOT NULL AUTO_INCREMENT,
  `nom_principal` varchar(255) NOT NULL,
  `date_de_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`artiste_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artistes`
--

LOCK TABLES `artistes` WRITE;
/*!40000 ALTER TABLE `artistes` DISABLE KEYS */;
INSERT INTO `artistes` VALUES (1,'kei fujishima','2024-05-09 19:31:52'),(2,'namaita','2024-05-09 19:31:53'),(3,'tetsuya nishio','2024-05-09 19:31:54'),(4,'atsushi sekiguchi','2024-05-09 19:31:55'),(6,'tatsuyuki tanaka','2024-05-10 14:42:42'),(7,'toshiyuki inoue','2024-05-10 14:42:43'),(8,'mitsuo iso','2024-05-10 14:45:14'),(9,'satoru utsunomiya','2024-05-10 14:45:16'),(10,'yoh yoshinari','2024-05-10 14:45:17'),(11,'shuhei handa','2024-05-10 14:46:18'),(12,'yoshimichi kameda','2024-05-10 14:46:23'),(13,'yutaka nakamura','2024-05-10 14:46:31'),(14,'masami obari','2024-05-10 14:46:33'),(15,'bahi jd','2024-05-10 14:46:38'),(16,'artist unknown','2024-05-10 14:46:41'),(17,'hiroyuki okiura','2024-05-10 16:33:21'),(18,'hideki tamura','2024-05-10 16:33:34'),(19,'hiroyuki imaishi','2024-05-10 16:33:45'),(20,'jeffrey lai','2024-05-10 16:34:59'),(21,'ayumi kurashima','2024-05-10 16:35:10'),(22,'yasuo otsuka','2024-05-10 16:54:32'),(23,'satoshi yamaguchi','2024-05-10 16:54:40'),(24,'toshiyuki yahagi','2024-05-10 16:55:08'),(25,'ryosuke nishii','2024-05-10 16:55:09'),(26,'yasuyuki ebara','2024-05-10 16:55:10'),(27,'hidekazu shimamura','2024-05-10 16:55:11'),(28,'ben li','2024-05-10 16:55:30'),(29,'tsunenori saito','2024-05-10 16:56:13'),(30,'tetsuya takeuchi','2024-05-10 16:57:06'),(31,'takeshi honda','2024-05-10 16:57:22'),(32,'sushio','2024-05-10 16:57:27'),(33,'hiroyuki yamashita','2024-05-10 16:57:38'),(34,'james baxter','2024-05-10 16:57:45'),(35,'michio mihara','2024-05-10 16:58:08'),(36,'yoshinori kanada','2024-05-10 16:58:16'),(37,'masaaki yuasa','2024-05-11 20:32:43');
/*!40000 ALTER TABLE `artistes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-30 19:43:47
