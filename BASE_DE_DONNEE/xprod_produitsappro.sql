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
-- Table structure for table `produitsappro`
--

DROP TABLE IF EXISTS `produitsappro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produitsappro` (
  `prixAchatUHT` double DEFAULT NULL,
  `Produits_idProduits` int NOT NULL,
  `lignecmd_commande_idCommande` int NOT NULL,
  PRIMARY KEY (`Produits_idProduits`),
  KEY `fk_ProduitsAppro_Produits1_idx` (`Produits_idProduits`),
  KEY `fk_produitsappro_lignecmd1_idx` (`lignecmd_commande_idCommande`),
  CONSTRAINT `fk_produitsappro_lignecmd1` FOREIGN KEY (`lignecmd_commande_idCommande`) REFERENCES `lignecmd` (`idLigneCommande`),
  CONSTRAINT `fk_ProduitsAppro_Produits1` FOREIGN KEY (`Produits_idProduits`) REFERENCES `produits` (`IDPRODUIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produitsappro`
--

LOCK TABLES `produitsappro` WRITE;
/*!40000 ALTER TABLE `produitsappro` DISABLE KEYS */;
INSERT INTO `produitsappro` VALUES (2700,1,1),(250,2,2);
/*!40000 ALTER TABLE `produitsappro` ENABLE KEYS */;
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
