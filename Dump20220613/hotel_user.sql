-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel
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
  `userEmail` varchar(125) DEFAULT NULL,
  `userPassword` varchar(750) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `mobileNumber` varchar(45) DEFAULT NULL,
  `securityQuestion` varchar(150) DEFAULT NULL,
  `answer` varchar(80) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `cp` varchar(45) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `authorization` varchar(45) DEFAULT NULL,
  `firstname` varchar(90) DEFAULT NULL,
  `lastname` varchar(90) DEFAULT NULL,
  `company_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `userEmail_UNIQUE` (`userEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'mollydelart@gmail.com','52495649eecbd55a555353d4957fdf5551565655c5352565155cbecf5451fd','molly','0658987845','What was your first car','ferrari','8 place de verdun','75003','Paris','','FRANCE','client','Molly','DELART',NULL),(2,'emma.alba@gmail.com','efdb56f55f50fe57c5255e5152dfe49fb55c525749d48545156ec50d5654','Emma','0758963212','What was your first car','toyota','To be defined','To be defined','To be defined','To be defined','To be defined','client',NULL,NULL,NULL),(4,'amelie@gmail.com','504848ac5655d544955cdcea5252f53495056d55f55a525256bd56575752484953','Amelie','0875123695','What was your first car','toyota','','','','','','client','Amelie','GARD',NULL),(24,'lucien@gmail.com','52e504857e51a484949bf48e5448545550f56e55e555752545653c51c515550fdb','Lucien','065523147885','What was your first car','toyota','','','','','','administrateur','Lucien','BARRIERES',NULL);
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

-- Dump completed on 2022-06-13 23:44:18
