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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL,
  `authorities` tinyblob,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `is_not_locked` bit(1) NOT NULL,
  `join_date` datetime DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `last_login_date_display` datetime DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_image_url` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0	user:read','armand@gmail.com','Armand',_binary '',_binary '','2022-06-16 14:09:08','2022-07-31 16:02:43','2022-07-11 09:24:26','Bar','$2a$10$cIK914Q49RHBT.KKj5Z6deyJndUKI2L4MmlipV3WjOKmh6VGo1hpe','http://robohash.org/user/image/profilearmand@gmail.com','ROLE_ADMIN','4667096517','armand'),(4,_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0	user:read','david@gmail.com','David',_binary '',_binary '','2022-06-16 14:13:22',NULL,NULL,'Zam','$2a$10$8vFeA5rXGmzaF.az3tvd8.uZjlX8HrO/s33472IXvIFhl7m4Rjvla','http://robohash.org/user/image/profiledavidZam','ROLE_USER','7090765610','davidZam'),(6,_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0	user:read','hedi@gmail.com','Hedi',_binary '',_binary '','2022-06-30 13:22:46','2022-07-31 20:52:52','2022-07-31 20:40:11','Bardou','$2a$10$bSO.Q7mcgpvgIhHqTVV96.iE7JiorEzYaFWMDwzaLQTTLvQVxvNWW','http://robohash.org/user/image/profilehedi','ROLE_SUPER_ADMIN','7188452422','hedi'),(7,_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0	user:read','oscar@gmail.com','Oscar',_binary '',_binary '','2022-07-04 07:42:32','2022-07-06 08:07:59','2022-07-05 15:00:28','Bal','$2a$10$JU32frMjcQ7rWPjXSd9ksOOz922OOhRFUwk.rrRQKjWudBrCsg6kC','http://robohash.org/user/image/profileoscar','ROLE_USER','8473665375','oscar'),(8,_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0	user:read','lola@gmail.com','Lola',_binary '',_binary '','2022-07-04 13:07:22','2022-07-31 20:10:05','2022-07-31 20:07:09','Petit','$2a$10$dl5iqfuayzHQbtNdV8AvrOHUGsQ5.IXbE76IMQp7PMiETw0P4kW5G','http://robohash.org/user/image/profilePetit','ROLE_USER','8786754881','lola'),(9,_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0	user:read','tom@gmail.com','Tom',_binary '',_binary '','2022-07-04 13:21:52',NULL,NULL,'Grand','$2a$10$okXEKPXeswgwiENYjHvBG.C23PKHGpUiLJN/FwfRQ6c7JtJFBInFq','http://robohash.org/user/image/profiletom','ROLE_USER','7625671281','tom'),(10,_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0	user:read','sam@gmail.com','Sam',_binary '\0',_binary '','2022-07-11 12:05:33',NULL,NULL,'Ben','$2a$10$DQCl93lg./dh7HzlcpFEJubj2AfQJqvu6/SabP.xJMvmMjgllq0my','http://localhost:8085/user/image/profilesam','ROLE_USER','9684179966','sam'),(11,_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0	user:read','so@gmail.com','So',_binary '\0',_binary '','2022-07-11 12:06:59',NULL,NULL,'Jan','$2a$10$01WeBKqOmaTn.WpIZ2KvSegYZhMvsnzQ5ORKjn2vfqmKPJA0V4pSu','http://localhost:8085/user/image/profileso','ROLE_USER','3268500138','so'),(12,_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0	user:read','daniel@gmail.com','Dani',_binary '\0',_binary '','2022-07-11 12:10:33',NULL,NULL,'zam','$2a$10$NJKSG6RCZ1O7VkiE9s6g1OFdbcJ3D3mjE/576WKaKiIWhswxLbX6C','http://localhost:8085/user/image/profiledani','ROLE_USER','9667606612','dani'),(13,_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0	user:read','marie@gmail.com','Marie',_binary '',_binary '','2022-07-12 07:17:27',NULL,NULL,'Bar','$2a$10$Ij88poHZF./Drsf25FrmaeNaycDWh2ihub3ENrEzdwVg88E2Ad3Fu','http://localhost:8085/user/image/profilemarie','ROLE_USER','7296621918','marie'),(14,_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0	user:read','mej@gmail.com','Mej',_binary '\0',_binary '\0','2022-07-12 07:29:53',NULL,NULL,'Mej','$2a$10$0BHFk5odj5lcH3B6XmyP9OhIc.N5i.4eugO32LptftYDJjcB/Uage','http://localhost:8085/user/image/profilemej','ROLE_USER','9165519697','mej'),(19,_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0	user:read','elise@gmail.com','Elise',_binary '',_binary '','2022-07-29 09:36:26',NULL,NULL,'elise','$2a$10$1zyAv4kbFucVicLPdSNfauoUjlXNS1RHL//mIMpc9GygSY7HmHrJq','http://localhost:8085/user/image/profilelise','ROLE_USER','4732319811','lise');
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

-- Dump completed on 2022-07-31 23:24:13
