-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: diable
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
  `iduser` int NOT NULL AUTO_INCREMENT,
  `username` varchar(400) DEFAULT NULL,
  `email` varchar(400) DEFAULT NULL,
  `mobileNumber` varchar(45) DEFAULT NULL,
  `password` varchar(400) DEFAULT NULL,
  `authorization` varchar(400) DEFAULT NULL,
  `securityQuestion` varchar(250) DEFAULT NULL,
  `answer` varchar(245) DEFAULT NULL,
  `adresse` varchar(400) DEFAULT NULL,
  `cp` varchar(45) DEFAULT NULL,
  `ville` varchar(200) DEFAULT NULL,
  `département` varchar(45) DEFAULT NULL,
  `pays` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Hedi','admin@gmail.com','0102030405','7c4a8d0`ca3762af61e5`520`43dc264`4f8`41b','Administrateur','Quel est le nom de votre 1er animal de compagnie?','chien','','','','',''),(2,'ava','ava@gmail.com','0102030405','7c4a8d0`ca3762af61e5`520`43dc264`4f8`41b','Client','Quel est le nom de votre 1er animal de compagnie?','chat','','','','',''),(3,'Oscar','oscar@gmail.com','0102030405','7c4a8d0`ca3762af61e5`520`43dc264`4f8`41b','Client','Quel est le nom de votre 1er animal de compagnie?','oiseau','','','','',''),(4,'Thomas','thomas@gmail.com','0102030405','7c4a8d0`ca3762af61e5`520`43dc264`4f8`41b','Client','Quelle est la marque de votre première voiture ?','porche','','','','',''),(5,'Pierre','pierre@gmail.com','0102030405','7c4a8d0`ca3762af61e5`520`43dc264`4f8`41b','Client','Dans quelle ville êtes-vous né ?','Paris','','','','',''),(7,'Camille','camille@gmail.com','0102030405','7c4a8d0`ca3762af61e5`520`43dc264`4f8`41b','Client','Quelle est votre couleur favorite ?','Rose','','','','','');
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

-- Dump completed on 2022-06-13 20:24:18
