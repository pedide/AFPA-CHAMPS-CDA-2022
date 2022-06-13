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
-- Table structure for table `messagesuser`
--

DROP TABLE IF EXISTS `messagesuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messagesuser` (
  `idMessageUser` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `objetmessage` varchar(150) DEFAULT NULL,
  `message` varchar(400) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMessageUser`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messagesuser`
--

LOCK TABLES `messagesuser` WRITE;
/*!40000 ALTER TABLE `messagesuser` DISABLE KEYS */;
INSERT INTO `messagesuser` VALUES (1,'ava','ava','ava@gmail.com','Autres',NULL,'2022-03-12'),(2,'Oscar','oscar','oscar@gmail.com','Remboursement des articles','Je n\'en veux plus.','2022-03-15'),(3,'ava','ava','ava@gmail.com','Retourner des articles','Retour','2022-04-26 21:50:08'),(4,'ava','ava','ava@gmail.com','Modifier votre commande','Change adresse','2022-04-27'),(5,'oscar','oscar','oscar@gmail.com','Annuler votre commande','Ce n\'est pas mon article.','2022-05-21'),(6,'Service client','','admin@gmail.com','Autres','Nous sommes au regret d\'apprendre ça.','2022-05-21'),(7,'ava','Oscar','ava@gmail.com','Modifier votre commande','Je ne vois pas ma commande !','2022-05-31'),(31,'Camille','Camille ','camille@gmail.com','Modifier votre commande','Je souhaite changer la date de retrait. ','2022-06-12');
/*!40000 ALTER TABLE `messagesuser` ENABLE KEYS */;
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
