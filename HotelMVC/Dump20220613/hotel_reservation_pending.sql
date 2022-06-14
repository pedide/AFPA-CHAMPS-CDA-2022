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
-- Table structure for table `reservation_pending`
--

DROP TABLE IF EXISTS `reservation_pending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_pending` (
  `id_reservation` int NOT NULL AUTO_INCREMENT,
  `user_uid` int DEFAULT NULL,
  `room_idRoom` int DEFAULT NULL,
  `quantity_night` int DEFAULT NULL,
  `num_reservation` int DEFAULT NULL,
  `date_arrival` varchar(45) DEFAULT NULL,
  `date_departure` varchar(45) DEFAULT NULL,
  `reservation_date` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL,
  `lastname` varchar(90) DEFAULT NULL,
  `firstname` varchar(90) DEFAULT NULL,
  `mobile_number` varchar(45) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `cp` varchar(45) DEFAULT NULL,
  `city` varchar(90) DEFAULT NULL,
  `state` varchar(150) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `check_in_client_firstname` varchar(200) DEFAULT NULL,
  `check_in_client_lastname` varchar(200) DEFAULT NULL,
  `check_in_client_email` varchar(200) DEFAULT NULL,
  `check_in_client_mobileNumber` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_reservation`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_pending`
--

LOCK TABLES `reservation_pending` WRITE;
/*!40000 ALTER TABLE `reservation_pending` DISABLE KEYS */;
INSERT INTO `reservation_pending` VALUES (12,4,1,1,NULL,NULL,NULL,NULL,'420.0',NULL,'amelie@gmail.com','GARD','Amelie','0258796312','2 cour de la fontraine','75006','Paris','Region','France',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `reservation_pending` ENABLE KEYS */;
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
