-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: pokedb
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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `IDUSER` int NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(400) NOT NULL,
  `EMAIL` varchar(500) NOT NULL,
  `PASSWORD` varchar(400) NOT NULL,
  `AUTHORIZATION` varchar(500) NOT NULL,
  `mobileNumber` varchar(145) DEFAULT NULL,
  `securityQuestion` varchar(45) DEFAULT NULL,
  `answer` varchar(245) DEFAULT NULL,
  `adress` varchar(245) DEFAULT NULL,
  `city` varchar(245) DEFAULT NULL,
  `cp` varchar(45) DEFAULT NULL,
  `state` varchar(245) DEFAULT NULL,
  `country` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`IDUSER`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (13,'Charles','','6ca338c0c421b8c90c8b968e98170ae2534193d4','Client',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'michel','michel@contact.com','4aaf3e8195d001e605b5aa18588ac2c79ab02562','Administrateur',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'Flavie','','eface6fd17b6ef95c49e94b5279249ac2ef73ef8','Administrateur',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'René','','cc810ec57249d0b800d1f73702bdc6c6b160150d','Client',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'anna','anna@contact.com','64ff7433085ed2fd9babae3820d397200c8a9833','client','0123456789','Quelle Ã©tait votre premiÃ¨re voiture?','audi','3 rue des bois','Paris','75014','Ile de France','France');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-13 20:41:51
