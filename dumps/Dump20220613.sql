-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: xproddb
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
-- Table structure for table `cartitem`
--

DROP TABLE IF EXISTS `cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitem` (
  `idcart` int NOT NULL AUTO_INCREMENT,
  `idShopping` int DEFAULT NULL,
  `idProduct` int DEFAULT NULL,
  `qte` int DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `modified_at` date DEFAULT NULL,
  PRIMARY KEY (`idcart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitem`
--

LOCK TABLES `cartitem` WRITE;
/*!40000 ALTER TABLE `cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `IDCLIENT` int NOT NULL AUTO_INCREMENT,
  `PRENOM` varchar(400) NOT NULL,
  `NOM` varchar(400) NOT NULL,
  `ADRESSE` varchar(400) NOT NULL,
  `CODEPOSTALE` varchar(400) NOT NULL,
  `VILLE` varchar(400) NOT NULL,
  `PAYS` varchar(400) NOT NULL,
  `TEL` varchar(400) NOT NULL,
  `MOBILE` varchar(400) NOT NULL,
  `EMAIL` varchar(400) NOT NULL,
  PRIMARY KEY (`IDCLIENT`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'sarah','HADI','zilina','77000','chlef','France','0155','0610','sarah@tuto'),(2,'HADI','Naziha','zilina','77000','chlef','France','0155','sarah@tuto','0610'),(4,'mima','mima','chlef','99','chlef','france','55','aze@aze','0235468');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmdfour`
--

DROP TABLE IF EXISTS `cmdfour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cmdfour` (
  `idFour` int NOT NULL,
  `nomfour` varchar(245) DEFAULT NULL,
  `telfour` varchar(145) DEFAULT NULL,
  `DATECOMMANDE` date DEFAULT NULL,
  `QTE` varchar(45) DEFAULT NULL,
  `MONTANT` varchar(145) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmdfour`
--

LOCK TABLES `cmdfour` WRITE;
/*!40000 ALTER TABLE `cmdfour` DISABLE KEYS */;
INSERT INTO `cmdfour` VALUES (1,'06100','hadjer','2022-04-17','20.0','48.0'),(1,'hadjer','06100','2022-04-17','2.0','24.2');
/*!40000 ALTER TABLE `cmdfour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commandes` (
  `IDCLIENT` int NOT NULL,
  `NOMCLIENT` varchar(500) NOT NULL,
  `PRENOMCLIENT` varchar(400) NOT NULL,
  `DATECOMMANDE` date NOT NULL,
  `QTE` varchar(400) NOT NULL,
  `MONTANT` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commandes`
--

LOCK TABLES `commandes` WRITE;
/*!40000 ALTER TABLE `commandes` DISABLE KEYS */;
INSERT INTO `commandes` VALUES (1,'HADI','sarah','2022-03-03','2.0','26.4'),(2,'Naziha','HADI','2022-03-03','2.0','52.8'),(1,'HADI','sarah','2022-04-17','20.0','48.0'),(1,'HADI','sarah','2022-05-12','5.0','32.94');
/*!40000 ALTER TABLE `commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseurs`
--

DROP TABLE IF EXISTS `fournisseurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fournisseurs` (
  `IDFOURNISSEUR` int NOT NULL AUTO_INCREMENT,
  `RAISONSOCIAL` varchar(400) NOT NULL,
  `NOM` varchar(400) NOT NULL,
  `ADRESSE` varchar(500) NOT NULL,
  `CODEPOSTALE` varchar(100) NOT NULL,
  `VILLE` varchar(400) NOT NULL,
  `PAYS` varchar(400) NOT NULL,
  `TEL` varchar(100) NOT NULL,
  `FAX` varchar(100) NOT NULL,
  `EMAIL` varchar(400) NOT NULL,
  PRIMARY KEY (`IDFOURNISSEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseurs`
--

LOCK TABLES `fournisseurs` WRITE;
/*!40000 ALTER TABLE `fournisseurs` DISABLE KEYS */;
INSERT INTO `fournisseurs` VALUES (1,'airbus','hadjer','zilina','92000','nanterre','France','06100','54510','tuto@tuto.com'),(8,'air','hadje','zilina','92000','','','','',''),(12,'airbus','hadjerr','zilina','92000','nanterre','France','06100','5481','tuto@tuto.com'),(13,'GB','GH','CN','','','','','',''),(14,'SNDK','ABDOU','','','','','','',''),(15,'','hadjer','','','','','','','');
/*!40000 ALTER TABLE `fournisseurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messageu`
--

DROP TABLE IF EXISTS `messageu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messageu` (
  `idm` int NOT NULL AUTO_INCREMENT,
  `name` varchar(145) DEFAULT NULL,
  `email` varchar(145) DEFAULT NULL,
  `mobileNum` varchar(145) DEFAULT NULL,
  `objetmessage` varchar(145) DEFAULT NULL,
  `message` varchar(345) DEFAULT NULL,
  `date` varchar(145) DEFAULT NULL,
  `messageadmin` varchar(245) DEFAULT NULL,
  `dateadmin` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messageu`
--

LOCK TABLES `messageu` WRITE;
/*!40000 ALTER TABLE `messageu` DISABLE KEYS */;
/*!40000 ALTER TABLE `messageu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oldorders`
--

DROP TABLE IF EXISTS `oldorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oldorders` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `uid` int NOT NULL,
  `quantite` int NOT NULL,
  `date` varchar(45) NOT NULL,
  `prix` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `adress` varchar(145) DEFAULT NULL,
  `city` varchar(145) DEFAULT NULL,
  `state` varchar(145) DEFAULT NULL,
  `country` varchar(145) DEFAULT NULL,
  `mobileNum` bigint DEFAULT NULL,
  `deliveryDate` varchar(145) DEFAULT NULL,
  `paymentMethod` varchar(145) DEFAULT NULL,
  `transactionId` varchar(145) DEFAULT NULL,
  `status` varchar(145) DEFAULT NULL,
  `email` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oldorders`
--

LOCK TABLES `oldorders` WRITE;
/*!40000 ALTER TABLE `oldorders` DISABLE KEYS */;
INSERT INTO `oldorders` VALUES (1,2,42,1,'2022-04-27',105.97999999999999,105.97999999999999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'abdou@hotmail.com'),(2,4,42,1,'2022-04-27',105.97999999999999,105.97999999999999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'abdou@hotmail.com'),(3,2,42,1,'2022-04-27',79.99,79.99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'abdou@hotmail.com'),(4,2,0,1,'2022-04-27',79.99,79.99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,2,0,1,'2022-04-27',105.97999999999999,105.97999999999999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,4,0,1,'2022-04-27',105.97999999999999,105.97999999999999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,2,0,1,'2022-04-27',79.99,79.99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,2,0,2,'2022-04-27',159.98,159.98,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,2,0,1,'2022-04-27',79.99,79.99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,2,0,3,'2022-04-27',239.96999999999997,239.96999999999997,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,2,0,1,'2022-04-27',79.99,79.99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,2,0,1,'2022-05-14',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,4,0,3,'2022-05-14',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,1,44,1,'2022-05-14',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,2,0,1,'2022-05-21',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,1,0,1,'2022-05-21',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `oldorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idOrder` int DEFAULT NULL,
  `idProduct` int DEFAULT NULL,
  `qte` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idClient` int DEFAULT NULL,
  `total` double DEFAULT NULL,
  `adress` varchar(245) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `ville` varchar(145) DEFAULT NULL,
  `mobileNumer` varchar(145) DEFAULT NULL,
  `pays` varchar(145) DEFAULT NULL,
  `deleveryDate` varchar(145) DEFAULT NULL,
  `dateCommande` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,0,888,'j','j',NULL,NULL,'654564654','12/12/24',NULL),(2,0,960,'h','h',NULL,'34564564',NULL,'12/12/2022',NULL),(3,0,960,'j','j',NULL,'46465454',NULL,'12/12/2025',NULL),(4,0,959.92,'5454','545454',NULL,'2313211312',NULL,'12/12/2025',NULL),(5,48,959.92,'jj','g',NULL,'0612321421',NULL,'12/03/1986',NULL),(6,48,959.92,'uygu','iughui',NULL,'0621353656','ilhu','12/12/1985',NULL),(7,48,959.92,'liul','ibu',NULL,'0614556456','ih','10/12/2012',NULL),(8,48,959.92,'hkg','ugyuy',NULL,'0695891818','uyg','12/12/2022',NULL),(9,48,959.92,'iuhu','ulihui',NULL,'0614556456','klh','12/12/23',NULL),(10,48,959.92,'lhku','hbkjbj',NULL,'lihbui','iluhui','kjnbkl',NULL),(11,48,959.92,'kgkj','yugku',NULL,'ukgyu','ukg','kug',NULL),(12,48,959.92,'huli','gj',NULL,'lu','iluh','uil',NULL),(13,48,959.92,'iohojl','gghjk',NULL,'lkhj','lhui','ih',NULL),(14,48,959.92,'f','g',NULL,'05154554','g','12/12/1985',NULL),(15,48,959.92,'fFf','F',NULL,'454545454','F','12/12/1985',NULL),(16,47,229.95000000000002,'jhli','jhlui',NULL,'uuhl','ihi','mhi',NULL),(17,47,105.97999999999999,'huil','luhi',NULL,'pjoip','iop','oip',NULL),(18,47,139.98,'uoiuho','ihui',NULL,'pih','ihu','ihp',NULL),(19,47,105.97999999999999,'oijopi','ijom',NULL,'ij','ipjop','ij',NULL),(20,47,105.98,'hkjjk','jkuoi',NULL,'ip','jip','ip',NULL),(21,47,139.98,'zilina','azz',NULL,'0614556456','france','12/12/2025',NULL),(22,46,183.95,'liul','ibu',NULL,'0614556456','','12/03/1986',NULL),(23,46,219.97,'','',NULL,'','','',NULL),(24,47,641.9,'dsdz','df',NULL,'ef','zfe','ez',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference` varchar(500) NOT NULL,
  `designation` varchar(450) NOT NULL,
  `descriptif` varchar(800) NOT NULL,
  `prix` double NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `active` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Anna  Sac a main','aze','sac a main femme',59.99,'18..jpg.jpg','No'),(2,'NAF-NAF','azer','sac a main femme',79.99,'9..jpg.jpg','No'),(4,'Anna Field Sac ','azee','sac a dos femme',25.99,'7..jpg.jpg',NULL),(5,'saca main cuir','sac','sac a main femme',89.99,'11..jpg.jpg',NULL),(6,'sac-pochette','sac','sac a main femme',45.99,'sac-pochette-demi-lune-beige-femme-f-32536300885430202.jpg',NULL),(9,'sac cabas femme','sac caba','sac a main femme',45.99,'009_d555f9ec-ac53-42b7-8b03-a804a3156317.jpg',NULL),(13,'sac','','sac a main femme',80,'20..jpg.jpg','Oui'),(15,'sac en cuir','','sac a main femme',60,'1..jpg.png','Oui'),(16,'Sac Golden Goose','','sac Ã  main femme ',65,'2..jpg.jpg','Oui'),(17,' Karl lagerfeld ','','sac a main femme',69,'3..jpg.jpg','Oui'),(18,'Ligne Cosmo','','Sac portÃ© main 2 poignÃ©es en cuir de vachette',125,'4..jpg.jpg','Oui'),(19,'GÃ©mo sac','','sac en cuir',95,'5..jpg.jpg','Oui'),(20,'LILA Sac a main','aze','sac a main femme',80,'14..jpg.jpg','oui'),(21,'Anna Field Sac a dos','azert','sac a dos femme',55,'17..jpg.jpg','Yes');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produitaprov`
--

DROP TABLE IF EXISTS `produitaprov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produitaprov` (
  `idproduitAp` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(245) DEFAULT NULL,
  `designation` varchar(245) DEFAULT NULL,
  `descriptif` varchar(245) DEFAULT NULL,
  `prixUHT` double DEFAULT NULL,
  `qte` int DEFAULT NULL,
  `prixTHT` double DEFAULT NULL,
  PRIMARY KEY (`idproduitAp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produitaprov`
--

LOCK TABLES `produitaprov` WRITE;
/*!40000 ALTER TABLE `produitaprov` DISABLE KEYS */;
INSERT INTO `produitaprov` VALUES (1,'bag','bag femme','big bag',100,5,500);
/*!40000 ALTER TABLE `produitaprov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingsession`
--

DROP TABLE IF EXISTS `shoppingsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingsession` (
  `idpanier` int NOT NULL AUTO_INCREMENT,
  `iduser` int DEFAULT NULL,
  `totale` int DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `modified_at` date DEFAULT NULL,
  PRIMARY KEY (`idpanier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingsession`
--

LOCK TABLES `shoppingsession` WRITE;
/*!40000 ALTER TABLE `shoppingsession` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingsession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `IDUSER` int NOT NULL AUTO_INCREMENT,
  `username` varchar(400) NOT NULL,
  `password` varchar(400) NOT NULL,
  `email` varchar(400) DEFAULT NULL,
  `authorization` varchar(500) NOT NULL,
  `mobileNum` varchar(400) DEFAULT NULL,
  `securiteQuest` varchar(400) DEFAULT NULL,
  `answer` varchar(400) DEFAULT NULL,
  `adress` varchar(400) DEFAULT NULL,
  `city` varchar(400) DEFAULT NULL,
  `state` varchar(400) DEFAULT NULL,
  `cp` varchar(400) DEFAULT NULL,
  `contry` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`IDUSER`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Hadjer SAOULA TAKERNICHT','5248bd484849535451485653fc5153495453515057ea49ff53c53ecbdbbeef','hadjer@hotmail.com','Administrateur','0610221515','what was your first car ?','w','zilina','','','','france'),(2,'rida','55c52a56d4857ca51555450af5449e5357535048575251dc5054525752f56575249b','rida@hotmail.com','client','0621353656','what is the name of the town where you were born ?','chlef','chlef','','','','Algerie');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-13 21:10:37
