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
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produits` (
  `IDPRODUIT` int NOT NULL AUTO_INCREMENT,
  `REF` varchar(255) DEFAULT NULL,
  `DESIGNATION` varchar(255) DEFAULT NULL,
  `DESCRIPTIF` varchar(255) DEFAULT NULL,
  `PRIXUHT` double DEFAULT NULL,
  `IMAGE` varchar(255) DEFAULT NULL,
  `ACTIVE` varchar(455) DEFAULT NULL,
  `NAME` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`IDPRODUIT`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits`
--

LOCK TABLES `produits` WRITE;
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
INSERT INTO `produits` VALUES (1,'1A','Langue','Améliorer votre niveau d’anglais',800,'bigstock-123731417.jpg','Yes','Anglais - Préparation TOEIC'),(2,'2B','Informatique','Entreprendre un projet de création d\'entreprise',1850,'4457.jpg','Yes','Création d\'entreprise'),(3,'3C','Informatique','Apprenez a developper ',169,'devweb.jpg','Yes','Développement web - Certification ICDL®'),(4,'4D','Informatique','Les clés du management pour évoluer de manager à leader',2500.99,'istockphoto-956073060-612x612','Yes','Excel 2016'),(5,'5E','informatique','Les notions essentielles du logiciel Excel',310,'devweb.jpg','Yes','Excel 2020'),(6,'6Z','Informatique','Développement web - Certification ICDL®',555.5,'bureautique.jpg','Yes','Indesign'),(7,'7U','Coatching','Devenir un bon manageur ',900,'Les-7-etapes-cles-pour-creer-son-entreprise-1024x535.jpg','Yes','Les clés du management pour évoluer de manager à leader'),(10,NULL,'GPS TomTom','',800,'SD','Yes','Excel 2019');
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

-- Dump completed on 2022-06-13 19:03:48
