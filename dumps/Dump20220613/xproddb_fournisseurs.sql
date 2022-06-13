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
-- Table structure for table `fournisseurs`
--

DROP TABLE IF EXISTS `fournisseurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fournisseurs` (
  `IDFOURNISSEUR` int NOT NULL AUTO_INCREMENT,
  `RAISONSOCIAL` varchar(400) NOT NULL,
  `NOM` varchar(400) NOT NULL,
  `ADRESSE` varchar(500) NOT NULL,
  `CODEPOSTALE` varchar(100) NOT NULL,
  `VILLE` varchar(400) NOT NULL,
  `PAYS` varchar(400) NOT NULL,
  `TEL` varchar(100) NOT NULL,
  `FAX` varchar(100) NOT NULL,
  `EMAIL` varchar(400) NOT NULL,
  PRIMARY KEY (`IDFOURNISSEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseurs`
--

LOCK TABLES `fournisseurs` WRITE;
/*!40000 ALTER TABLE `fournisseurs` DISABLE KEYS */;
INSERT INTO `fournisseurs` VALUES (1,'airbus','hadjer','zilina','92000','nanterre','France','06100','54510','tuto@tuto.com'),(8,'air','hadje','zilina','92000','','','','',''),(12,'airbus','hadjerr','zilina','92000','nanterre','France','06100','5481','tuto@tuto.com'),(13,'GB','GH','CN','','','','','',''),(14,'SNDK','ABDOU','','','','','','',''),(15,'','hadjer','','','','','','','');
/*!40000 ALTER TABLE `fournisseurs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-13 21:09:01
