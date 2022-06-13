-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: xproddb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference` varchar(500) NOT NULL,
  `designation` varchar(450) NOT NULL,
  `descriptif` varchar(800) NOT NULL,
  `prix` double NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `active` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Anna  Sac a main','aze','sac a main femme',59.99,'18..jpg.jpg','No'),(2,'NAF-NAF','azer','sac a main femme',79.99,'9..jpg.jpg','No'),(4,'Anna Field Sac ','azee','sac a dos femme',25.99,'7..jpg.jpg',NULL),(5,'saca main cuir','sac','sac a main femme',89.99,'11..jpg.jpg',NULL),(6,'sac-pochette','sac','sac a main femme',45.99,'sac-pochette-demi-lune-beige-femme-f-32536300885430202.jpg',NULL),(9,'sac cabas femme','sac caba','sac a main femme',45.99,'009_d555f9ec-ac53-42b7-8b03-a804a3156317.jpg',NULL),(13,'sac','','sac a main femme',80,'20..jpg.jpg','Oui'),(15,'sac en cuir','','sac a main femme',60,'1..jpg.png','Oui'),(16,'Sac Golden Goose','','sac Ã  main femme ',65,'2..jpg.jpg','Oui'),(17,' Karl lagerfeld ','','sac a main femme',69,'3..jpg.jpg','Oui'),(18,'Ligne Cosmo','','Sac portÃ© main 2 poignÃ©es en cuir de vachette',125,'4..jpg.jpg','Oui'),(19,'GÃ©mo sac','','sac en cuir',95,'5..jpg.jpg','Oui'),(20,'LILA Sac a main','aze','sac a main femme',80,'14..jpg.jpg','oui'),(21,'Anna Field Sac a dos','azert','sac a dos femme',55,'17..jpg.jpg','Yes');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-13 21:09:00
