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
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `roomId` int NOT NULL AUTO_INCREMENT,
  `roomName` varchar(45) NOT NULL,
  `roomCategory` varchar(45) NOT NULL,
  `roomTitleDescription` varchar(125) DEFAULT NULL,
  `roomDescription` varchar(1000) DEFAULT NULL,
  `roomPrice` double NOT NULL,
  `roomImage` varchar(275) DEFAULT NULL,
  `roomQuantity` varchar(45) DEFAULT NULL,
  `roomIsActive` varchar(45) NOT NULL,
  PRIMARY KEY (`roomId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'CHAMBRE SUPERIEURE','chambre superieure','RAFFINEMENT AU LUXE DISCRET','Les chambres Supérieures du Bristol sont parmi les plus spacieuses de Paris dans leur catégorie, et probablement parmi les plus élégantes, Avec jusqu\'à 40m2 de raffinement au luxe discret.Habillées de boiseries aux couleurs poudrées, de matières nobles des plus belles maisons parisiennes, de meubles louis XV, de tissus aux camaïeux de bleus, de grège, de gris, ou de rose, elle sont baignées d’une lumière nturelle omniprésente.Aucune chambre ne se ressemble, mais toutes illustrent le mariage entre ce classicisme cher au Bristol Paris et un confort douillet parfaitement dans l’air du temps.Quant aux salles de bains aux murs pastels, elles sont équipées d’une douche séparée et d’une double vasque. ',420,'chambre-superieure-bureau.jpg','7','yes'),(2,'CHAMBRE DELUXE','chambre deluxe','POUR VIVRE PARIS EN PLUS GRAND','Les 45m² feutrés des chambres Deluxe résument le nouveau style du Bristol Paris : nuances douces, matières précieuses, élégance discrète. Ici les meubles Louis XV ou Louis XVI se marient aux tonalités poudrées des boiseries, aux dessus de lit en lin uni, aux couettes moelleuses ponctuées de coussins corail, gris bleu ou vert céladon. Pour accueillir une famille, ces magnifiques résumés du nouveau chic Français peuvent s’agrandir de plusieurs chambres communicantes, pour vivre Paris en plus grand. Quant aux salles de bains tout en lumière et en murs clairs, elles sont toutes équipées d’une douche séparée et d’une double vasque.',470,'chambre-dlx-lit2.jpg','6','yes'),(3,'CHAMBRE DELUXE VUE JARDIN','chambre deluxe vue jardin','ECRIN DE CALME ET DE NATURE','Déjà spacieuses, les chambres Deluxe vue jardin peuvent en plus s’agrandir de plusieurs chambres communicantes, pour accueillir une famille dans le plus grand confort. Si chacune est unique, toutes offrent des intérieurs lumineux aux tons pastel, décorés de meubles de style Louis XV et Louis XVI. Les vastes salles de bain sont équipées d’une douche séparée et d’une double vasque. Quant aux fenêtres, elles s’ouvrent sur le délicieux jardin intérieur, écrin de calme et de nature rare et précieux au cœur de Paris. ',500,'chambre-dlxg-lit.jpg','8','yes'),(4,'CHAMBRE PRESTIGE','chambre prestige','LE VRAI CHIC FRANÇAIS EST LÀ, LE CHARME AUSSI','Lorsque l’on pousse la porte d\'une chambre Prestige au Bristol Paris, on se laisse gagner par l’atmosphère douce, lumineuse et apaisante. Dans le coin salon, des fauteuils Louis XV sont revisités de tissus contemporains, tandis que le lit, immense, est recouvert d’une couette moelleuse blanche rehaussée de coussins à motifs. Le vrai chic Français est là, le charme aussi.Des lampes aux abat-jour crème aux pieds de bronze côtoient des commodes en bois de rose, des gravures à la plume originales ponctuent les boiseries au blanc cassé lumineux, bienvenue dans le style Bristol. Les chambres Prestige offrent des vues sur les paisibles cours intérieures du palace ou sur la rue du Faubourg Saint-Honoré. Leurs salles de bain sont toutes équipées d\'une douche séparée et d\'une double vasque.Chacune est unique. ',590,'chambre-prestige-lit.jpg','5','yes'),(5,'SUITE JUNIOR','suite Junior','DÉDIÉE AU BIEN ÊTRE ET AU CONFORT LE PLUS ABSOLU','Les Junior Suites du Bristol Paris offrent 55 m2 au luxe discret, tout en nuances pastels, en boiseries poudrées et en meubles de styles. Décorées d’œuvre d’art, de fauteuils Louis XV habillés de tissus jade, bleu ciel, corail ou blancs cassés, elles illustrent bien plus qu’un style : un esprit, dédié au bien être et au confort le plus absolu, jusque sur les immenses lits recouverts de couettes moelleuses et de coussins en tissus Frey, Canovas ou Colefax and Fowler. Dans ces élégants pied-à-terre Parisiens, la lumière fait partie des hôtes, le charme d’un palace unique aussi.  Les salles de bain possèdent deux vasques et une douche séparée. Les grandes fenêtres plongent sur nos calmes patios intérieurs ou les élégantes boutiques de la rue du Faubourg Saint-Honoré. Bienvenue chez vous.',700,'junior-suite-lit-salon.jpg','4','yes'),(6,'SUITE JUNIOR VUE JARDIN','suite Junior vue jardin','ATMOSPHÈRE DOUCE ET ÉLÉGANTE','Profitant de la même atmosphère douce et élégante que leurs sœurs jumelles les Junior Suites classiques, ces Suites offrent en plus une vue plongeante sur le jardin intérieur du Bristol Paris, écrin de verdure et de calme, rare et précieux au cœur de Paris. Leurs 55m² de meubles Louis XV, de boiseries claires et de tissus précieux aux camaïeux de grège, de bleus ou de rose, peuvent être agrandis grâce à une ouverture sur une chambre Deluxe.  ',750,'junior-suite-g-salon.jpg','8','yes');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-13 23:44:18
