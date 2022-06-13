-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: xprod
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idLogin` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobileNumber` varchar(255) DEFAULT NULL,
  `adress` varchar(455) DEFAULT NULL,
  `city` varchar(145) DEFAULT NULL,
  `cp` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `state` varchar(450) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `authorization` varchar(255) DEFAULT NULL,
  `securityQuestion` varchar(255) DEFAULT NULL,
  `answer` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`idLogin`),
  UNIQUE KEY `idLogin_UNIQUE` (`idLogin`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'admin','admin@gmail.com','0102030404',NULL,NULL,NULL,NULL,NULL,'test','admin','What is the name of your first pet ?','lili'),(2,NULL,NULL,'paul@gmail.com','0102030405',NULL,NULL,NULL,NULL,NULL,'a027184a55211cd23e3f3094f1fdc728df5e0500','admin','What is the name of your first pet ?','p'),(4,NULL,NULL,'hedieh@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,'902b5c4e03922dc92612d5b000205b4242214d4b','admin',NULL,NULL),(5,'Axel','Axel','axel@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,'86057438fbc6889b91f258c30d1da4db8d71d7c8','admin',NULL,NULL),(6,NULL,NULL,'Priska@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,'48ca540b23a583228352816fdf03cc77eec83270','admin',NULL,NULL),(7,NULL,NULL,'najat@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,'2fa856490f44dbbe41fcbd6816053de9a0ea8287','client',NULL,NULL),(11,NULL,'amine','amine@gmail.com','0608090403','','','','',NULL,NULL,'',NULL,'5008'),(12,NULL,'Thibault','thibault@gmail.com','0203040506','','','','',NULL,'thibault','Client','What is the name of your first pet ?','ASADA'),(13,NULL,'Hadjer','hadjer@gmail.com','0102030405','','','','',NULL,'hadjer','Client','What is the name of your elementary school did you attend','Danton'),(20,NULL,'marine boblec','marine@gmail.com','0102030405','','','','',NULL,'99df988b77e60a1718e9e6fecdaf22552047be28','Client','What was your first car ?','208'),(21,NULL,'Emiliano','emiliano@gmail.com',NULL,'','','','',NULL,'7d2ca5444aa2ce3d1f05f3f6ca295939364be744','Client','What was your first car ?','bm'),(22,NULL,'Didier','didier@gmail.com','0102030405','','','','',NULL,'388ad1c312a488ee9e12998fe097f2258fa8d5ee','Client','What was your first car ?','audi'),(23,NULL,'vdvdv','dvdv@gmail.com','dv','','','','',NULL,'e5a56de09a9327374abecaa545d99079a1d73c87','Client','What was your first car ?','dvdv'),(24,NULL,'asss','emiliano@gmail.com','0102030405','','','','',NULL,'8e545e1c31f91f777c894b3bd2c2e7d7044cc9dd','Client','What is the name of your first pet ?','dad'),(26,'Milena','Celerier','Milena@gmail.com','0102030405','11 Rue Leon Blum','Torcy','77200','France',NULL,'6ff310f4566cd479893ed14990dc6f1791121df2','Client',NULL,NULL),(27,NULL,'imad','imad@gmail.com','0102030405','','','','','','97149319688178e090e20dd126d11fce2b3c9837','Client','What was your first car ?','BM'),(28,NULL,'marine','marine@gmail.com','0102030405','','','','','','1fd1b4516473c36c8fb30bbf7c4490fc20419a10','Client','What was your first car ?','208');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-13 19:03:48
