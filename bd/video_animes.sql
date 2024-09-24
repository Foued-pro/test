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
-- Table structure for table `animes`
--

DROP TABLE IF EXISTS `animes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animes` (
  `anime_id` int NOT NULL AUTO_INCREMENT,
  `titre_principal` varchar(255) NOT NULL,
  `date_de_sortie` date DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`anime_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animes`
--

LOCK TABLES `animes` WRITE;
/*!40000 ALTER TABLE `animes` DISABLE KEYS */;
INSERT INTO `animes` VALUES (1,'koukei',NULL,NULL),(2,'one piece',NULL,NULL),(3,'the cat returns',NULL,NULL),(4,'genius party beyond',NULL,NULL),(5,'neon genesis evangelion series',NULL,NULL),(6,'fullmetal alchemist',NULL,NULL),(7,'flcl',NULL,NULL),(8,'little witch academia',NULL,NULL),(9,'evangelion 3.0: you can (not) redo',NULL,NULL),(10,'suisei no gargantia',NULL,NULL),(11,'soul eater',NULL,NULL),(12,'magical idol pastel yumi',NULL,NULL),(13,'a better tomorrow',NULL,NULL),(14,'valvrave the liberator',NULL,NULL),(15,'seiken no blacksmith',NULL,NULL),(16,'sword of the stranger',NULL,NULL),(17,'ghost in the shell innocence',NULL,NULL),(18,'plawres sanshiro',NULL,NULL),(19,'bishoujo senshi sailor moon',NULL,NULL),(20,'skullgirls (video game)',NULL,NULL),(21,'gundam',NULL,NULL),(22,'avatar series',NULL,NULL),(23,'xam\'d lost memories',NULL,NULL),(24,'1000',NULL,NULL),(25,'lupin iii',NULL,NULL),(26,'tengen toppa gurren lagann: lagann-hen',NULL,NULL),(27,'neon genesis evangelion',NULL,NULL),(28,'azumanga daioh',NULL,NULL),(29,'guilty crown',NULL,NULL),(30,'nihonbashi koukashita r keikaku',NULL,NULL),(31,'motorcity',NULL,NULL),(32,'k (2012)',NULL,NULL),(33,'hunter x hunter',NULL,NULL),(34,'towa no quon',NULL,NULL),(35,'star driver',NULL,NULL),(36,'tiger & bunny',NULL,NULL),(37,'tekkaman blade',NULL,NULL),(38,'no.6',NULL,NULL),(39,'zetsuen no tempest',NULL,NULL),(40,'cowboy bebop',NULL,NULL),(41,'rahxephon',NULL,NULL),(42,'dennou coil',NULL,NULL),(43,'kara no kyoukai',NULL,NULL),(44,'k-on series',NULL,NULL),(45,'tengen toppa gurren lagann',NULL,NULL),(46,'naruto',NULL,NULL),(47,'chuunibyou demo koi ga shitai!',NULL,NULL),(48,'adam and dog',NULL,NULL),(49,'panty and stocking with garterbelt',NULL,NULL),(50,'kaiba',NULL,NULL),(51,'birth',NULL,NULL),(52,'kick heart',NULL,NULL);
/*!40000 ALTER TABLE `animes` ENABLE KEYS */;
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
