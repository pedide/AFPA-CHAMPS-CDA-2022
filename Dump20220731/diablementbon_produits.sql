-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: diablementbon
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
  `idproduit` bigint NOT NULL AUTO_INCREMENT,
  `descriptif` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `prixvente` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `averagestar` int DEFAULT NULL,
  PRIMARY KEY (`idproduit`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits`
--

LOCK TABLES `produits` WRITE;
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
INSERT INTO `produits` VALUES (1,'Un entremets aux fruits de la passion avec un coeur gelée passion et une base financier citron.','Entremet Mangue Passion','25','1MP','image/entremetManguePassion.jpg',1),(2,'Une genoise supperposee de mousse de chocolat noir, chocolat au lait et chocolat blan. Fondant, leger et cremeux ?!','Fôret Noire','30','2FN','image/foret-noire.jpg',1),(3,'Biscuit moelleux, confit de fraise et ses morceaux , ganache montée de fraise et une mousse intensément vanillée !','Fraisier','25','3F','image/fraisier.jpg',1),(4,'Cela ne vous â certainement pas échappé, les licornes sont très tendances en ce moment.','Gâteau Licorne','40','4GL','image/gateauLicorne.jpg',1),(5,'Le number cake peux se declinerr en Letter cake aussi. Un biscuit leger, une ganache au chocolat blanc et une decoration exquise !','Gâteau number cake','35','5NC','image/gateauNumberCacke.jpg',1),(6,'La tarte au citron est une tarte sucrée garnie de crème à base de citron. ','Tarte au Citron Meringuée','20','6TCM','image/tarteCitron.jpg',1),(7,'Particulièrement joli et gourmand, il aura beaucoup de succès auprès des petits et des plus grands.','Tarte Fruits Rouge','20','7FR','image/tarteFruitsRouge.jpg',1),(8,'Une genoise supperposee de mousse de chocolat noir, chocolat au lait et chocolat blan. Fondant, leger et cremeux ?!','troisChocolats.jpg','25.5','8C','image/troisChocolats.jpg',1);
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

-- Dump completed on 2022-07-31 23:24:14
