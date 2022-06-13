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
-- Table structure for table `produitsapprovisionnes_has_fournisseurs`
--

DROP TABLE IF EXISTS `produitsapprovisionnes_has_fournisseurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produitsapprovisionnes_has_fournisseurs` (
  `produitsapprovisionnes_produits_idProduit` int NOT NULL,
  `fournisseurs_idfournisseurs` int NOT NULL,
  `refExterneProduit` varchar(45) DEFAULT NULL,
  `prixApproUHTProduit` varchar(45) DEFAULT NULL,
  `produitsapprovisionnes_has_fournisseurscol` double DEFAULT NULL,
  PRIMARY KEY (`produitsapprovisionnes_produits_idProduit`,`fournisseurs_idfournisseurs`),
  KEY `fk_produitsapprovisionnes_has_fournisseurs_fournisseurs1_idx` (`fournisseurs_idfournisseurs`),
  KEY `fk_produitsapprovisionnes_has_fournisseurs_produitsapprovis_idx` (`produitsapprovisionnes_produits_idProduit`),
  CONSTRAINT `fk_produitsapprovisionnes_has_fournisseurs_fournisseurs1` FOREIGN KEY (`fournisseurs_idfournisseurs`) REFERENCES `fournisseurs` (`idFour`),
  CONSTRAINT `fk_produitsapprovisionnes_has_fournisseurs_produitsapprovisio1` FOREIGN KEY (`produitsapprovisionnes_produits_idProduit`) REFERENCES `produitsapprovisionnes` (`produits_idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produitsapprovisionnes_has_fournisseurs`
--

LOCK TABLES `produitsapprovisionnes_has_fournisseurs` WRITE;
/*!40000 ALTER TABLE `produitsapprovisionnes_has_fournisseurs` DISABLE KEYS */;
/*!40000 ALTER TABLE `produitsapprovisionnes_has_fournisseurs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-13 20:24:19
