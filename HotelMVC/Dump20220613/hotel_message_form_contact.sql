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
-- Table structure for table `message_form_contact`
--

DROP TABLE IF EXISTS `message_form_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_form_contact` (
  `id_message_form_contact` int NOT NULL AUTO_INCREMENT,
  `object` varchar(45) DEFAULT NULL,
  `message` varchar(1500) DEFAULT NULL,
  `firstname` varchar(75) DEFAULT NULL,
  `lastname` varchar(90) DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `receiver_id_user` int DEFAULT NULL,
  `sender_id_user` int DEFAULT NULL,
  PRIMARY KEY (`id_message_form_contact`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_form_contact`
--

LOCK TABLES `message_form_contact` WRITE;
/*!40000 ALTER TABLE `message_form_contact` DISABLE KEYS */;
INSERT INTO `message_form_contact` VALUES (1,'object','vbc','PRISKA','DELORME','priskadelorme@gmail.com','2022/06/05',24,12),(2,'object','Demande de facture pour ma réservation numero: 555665.','Lucien','BARRIERES','lucien.barrieres@gmail.com','2022/06/05',24,12),(3,'object','Demande de réservation.','Peter','PAN','peter.pan@gmail.com','2022/06/05',24,12),(4,'object','Demande d\'une facture avec TVA.','Luc','BESSON','luc.besson@gmail.com','2022/06/05',24,12),(5,'object','Demande de renseignement.','Barbara','POMME','barbara.pomme@gmail.com','2022/06/05',24,12);
/*!40000 ALTER TABLE `message_form_contact` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-13 23:44:19
