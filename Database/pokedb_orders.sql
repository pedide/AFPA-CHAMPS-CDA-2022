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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idOrders` int NOT NULL AUTO_INCREMENT,
  `idProduct` int NOT NULL,
  `idUsers` int NOT NULL,
  `quantity` int NOT NULL,
  `dateOrders` varchar(145) COLLATE utf8mb4_general_ci NOT NULL,
  `price` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `adresse` varchar(145) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cp` varchar(145) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ville` varchar(145) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `departement` varchar(145) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pays` varchar(145) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mobile` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dateAchat` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dateLivraison` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `paiement` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_transaction` int DEFAULT NULL,
  `email` varchar(445) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idOrders`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,19,1,'2022-18-23',12.99,12.99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'anna@contact.com'),(2,1,19,1,'2022-26-02',5.99,5.99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'anna@contact.com'),(3,2,19,1,'2022-26-02',12.99,12.99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'anna@contact.com'),(4,1,19,1,'2022-08-13',5.99,5.99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'anna@contact.com'),(5,9,19,1,'2022-08-13',14.99,14.99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'anna@contact.com');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
