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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idorders` int NOT NULL AUTO_INCREMENT,
  `idproducts` int DEFAULT NULL,
  `idusers` int DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `quantité` int DEFAULT NULL,
  `dateOrders` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `adresse` varchar(145) DEFAULT NULL,
  `ville` varchar(145) DEFAULT NULL,
  `cp` varchar(145) DEFAULT NULL,
  `pays` varchar(145) DEFAULT NULL,
  `mobileNumber` bigint DEFAULT NULL,
  `orderDate` varchar(145) DEFAULT NULL,
  `deliveryDate` varchar(145) DEFAULT NULL,
  `paymentMethod` varchar(145) DEFAULT NULL,
  `transactionId` varchar(145) DEFAULT NULL,
  `status` varchar(145) DEFAULT NULL,
  `email` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idorders`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (4,1,2,NULL,1,'2022-05-26',25,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ava@gmail.com'),(5,4,3,NULL,1,'2022-05-27',40,40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'oscar@gmail.com'),(6,1,3,NULL,1,'2022-05-27',25,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'oscar@gmail.com'),(7,1,2,NULL,1,'2022-05-28',55,55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ava@gmail.com'),(8,2,2,NULL,1,'2022-05-28',55,55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ava@gmail.com'),(9,3,2,NULL,2,'2022-05-29',50,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ava@gmail.com'),(10,1,2,NULL,1,'2022-05-30',25,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ava@gmail.com'),(11,4,2,NULL,2,'2022-05-31',115,115,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ava@gmail.com'),(12,5,2,NULL,1,'2022-05-31',115,115,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ava@gmail.com'),(13,1,2,NULL,1,'2022-06-02',55,55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ava@gmail.com'),(14,2,2,NULL,1,'2022-06-02',55,55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ava@gmail.com'),(15,1,2,NULL,1,'2022-06-07',25,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ava@gmail.com'),(16,1,2,NULL,1,'2022-06-09',25,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ava@gmail.com'),(17,1,2,NULL,1,'2022-06-09',140,140,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ava@gmail.com'),(18,2,2,NULL,3,'2022-06-09',140,140,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ava@gmail.com'),(19,3,2,NULL,1,'2022-06-09',140,140,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ava@gmail.com'),(20,1,2,NULL,1,'2022-06-13',11,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ava@gmail.com');
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

-- Dump completed on 2022-06-13 20:24:18
