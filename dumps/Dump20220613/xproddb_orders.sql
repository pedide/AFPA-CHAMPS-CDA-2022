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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-13 21:08:59
