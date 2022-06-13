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
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produits` (
  `idProduit` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(45) DEFAULT NULL,
  `designation` varchar(400) NOT NULL,
  `descriptif` varchar(400) NOT NULL,
  `prixUHT` double NOT NULL,
  `quantite` int DEFAULT NULL,
  `prixTHT` double DEFAULT NULL,
  `imageProduit` varchar(245) DEFAULT NULL,
  `active` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProduit`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits`
--

LOCK TABLES `produits` WRITE;
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
INSERT INTO `produits` VALUES (1,'1MP','Entremet Mangue Passion','Un entremets aux fruits de la passion avec un coeur gelée passion et une base financier citron.',11,NULL,NULL,'entremetManguePassion.jpg','Yes'),(2,'2FN','Fôret Noire','Une genoise supperposee de mousse de chocolat noir, chocolat au lait et chocolat blan. Fondant, leger et cremeux ?!',30,NULL,NULL,'foret-noire.jpg','Yes'),(3,'3F','Fraisier','Biscuit moelleux, confit de fraise et ses morceaux , ganache montée de fraise et une mousse intensément vanillée !',25,NULL,NULL,'fraisier.jpg','Yes'),(4,'4GL','Gâteau Licorne','Cela ne vous â certainement pas échappé, les licornes sont très tendances en ce moment.',40,NULL,NULL,'gateauLicorne.jpg','Yes'),(5,'5NC','Gâteau number cake','Le number cake peux se declinerr en Letter cake aussi. Un biscuit leger, une ganache au chocolat blanc et une decoration exquise !',35,NULL,NULL,'gateauNumberCacke.jpg','Yes'),(6,'6TCM','Tarte au Citron Meringuée','La tarte au citron est une tarte sucrée garnie de crème à base de citron. ',20,NULL,NULL,'tarteCitron.jpg','Yes'),(7,'7FR','Tarte Fruits Rouge','Particulièrement joli et gourmand, il aura beaucoup de succès auprès des petits et des plus grands.',20,NULL,NULL,'tarteFruitsRouge.jpg','Yes'),(8,'8C','Trois Chocolats','Une genoise supperposee de mousse de chocolat noir, chocolat au lait et chocolat blan. Fondant, leger et cremeux ?!',25.5,NULL,NULL,'troisChocolats.jpg','Yes');
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

-- Dump completed on 2022-06-13 20:24:18
