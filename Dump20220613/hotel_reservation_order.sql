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
-- Table structure for table `reservation_order`
--

DROP TABLE IF EXISTS `reservation_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_order` (
  `id_reservation` int NOT NULL AUTO_INCREMENT,
  `user_uid` int DEFAULT NULL,
  `room_idRoom` int DEFAULT NULL,
  `quantity_night` int DEFAULT NULL,
  `num_reservation` int DEFAULT NULL,
  `date_arrival` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date_departure` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `reservation_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lastname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `firstname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mobile_number` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cp` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `city` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `state` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `country` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `check_in_client_firstname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `check_in_client_lastname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `check_in_client_email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `check_in_client_mobileNumber` varchar(200) COLLATE utf8mb4_0900_as_ci DEFAULT NULL,
  PRIMARY KEY (`id_reservation`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_order`
--

LOCK TABLES `reservation_order` WRITE;
/*!40000 ALTER TABLE `reservation_order` DISABLE KEYS */;
INSERT INTO `reservation_order` VALUES (1,2,1,1,NULL,NULL,NULL,NULL,420,0,'priskadelorme@gmail.com','DELORME','PRISKA','+33769893736','6 allee du pressoir','77164','Ferrieres-en-Brie','','France','PRISKA','DELORME','priskadelorme@gmail.com','+33769893736'),(2,2,1,1,NULL,NULL,NULL,NULL,420,420,'priskadelorme@gmail.com','DELORME','PRISKA','+33769893736','6 allÃ©e du pressoir','77164','FerriÃ¨res-en-Brie','','France','PRISKA','DELORME','priskadelorme@gmail.com','+33769893736'),(3,2,1,1,NULL,NULL,NULL,NULL,420,420,'priskadelorme@gmail.com','DELORME','PRISKA','+33769893736','6 allÃ©e du pressoir','77164','FerriÃ¨res-en-Brie','','France','PRISKA','DELORME','priskadelorme@gmail.com','+33769893736'),(4,2,1,1,NULL,NULL,NULL,NULL,420,5040,'priskadelorme@gmail.com','DELORME','PRISKA','+33769893736','6 allÃ©e du pressoir','77164','FerriÃ¨res-en-Brie','','France',NULL,NULL,NULL,NULL),(5,2,1,1,NULL,NULL,NULL,NULL,420,5040,'priskadelorme@gmail.com','DELORME','PRISKA','+33769893736','6 allÃ©e du pressoir','77164','FerriÃ¨res-en-Brie','','France',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `reservation_order` ENABLE KEYS */;
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
