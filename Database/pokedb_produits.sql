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
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produits` (
  `IDPRODUIT` int NOT NULL AUTO_INCREMENT,
  `REF` varchar(500) NOT NULL,
  `DESIGNATION` varchar(800) NOT NULL,
  `DESCRIPTIF` varchar(500) NOT NULL,
  `PRIXUHT` double NOT NULL,
  `IMAGE` varchar(450) DEFAULT NULL,
  `active` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDPRODUIT`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits`
--

LOCK TABLES `produits` WRITE;
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
INSERT INTO `produits` VALUES (1,'456de44','Booster','Pack contenant 10 cartes',5.99,'booster.jpg',NULL),(2,'458ed44','DuoPack','Pack contenant 2 boosters',12.99,'duopack.jpg',NULL),(3,'624fe51','TriPack','Pack contentant 3 boosters',17.99,'tripack.jpg',NULL),(4,'352ed3s','Coffret 1','Coffret contenant 4 boosters et cartes promos',24.99,'coffret1.jpg',NULL),(5,'454dz58','Coffret 2','Coffret contenant 4 boosters et jumbo promo',25.99,'coffret2.jpg',NULL),(8,'155ki45','MiniTin','Boite contenant 2 boosters',16.99,'minitin.jpg',NULL),(9,'254rf45','Pokeball','Pokeball contenant 2 boosters',14.99,'pokeball.jpg',NULL),(10,'474qd36','Elite Trainer Box','Boite contenant 8 booster et jetons',49.99,'etb.jpg',NULL),(12,'265ss25','Coffret premium','Coffret contenant 5 boosters et cartes promo',55.99,'coffretpremium.jpg',NULL),(13,'351ef25','Demi Display','VerreBoite contenant 18 boosters',85.99,'demidisplay.jpg',NULL),(14,'648fe24','Display','Boite contenant 36 boosters',169.99,'display.jpg',NULL),(15,'468sz63','Maxi Coffret','Coffret contenant 10 booster et cartes promo',79.99,'maxicoffret.jpg',NULL);
/*!40000 ALTER TABLE `produits` ENABLE KEYS */;
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
