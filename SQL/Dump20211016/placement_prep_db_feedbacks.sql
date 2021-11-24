-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: placement_prep_db
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `SID` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `username` varchar(45) DEFAULT 'Guest User',
  `emailID` varchar(60) DEFAULT NULL,
  `thumbs` varchar(45) DEFAULT NULL,
  `heading` varchar(45) DEFAULT 'Good',
  `comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (12,'2021-10-14','Guest User','a@gmail.com','like','Good','Nice website'),(14,'2021-10-15','Guest User','a@gmail.com','like','Good','nice'),(22,'2021-10-21','Rohit','kgtanuvas@gmail.com','unlike','okay','less contents'),(25,'2021-10-24','Ram','ram@example.com','like','Awesome','Fantastic Website and well organized content'),(26,'2021-10-24','Kishan Kumar','kgtanuvas@gmail.com','like','fantastic','nice website with loads of useful content'),(27,'2021-10-24','Guest User','sam@gmail.com','unlike','Average','Good resources but seems to be few.'),(28,'2021-10-24','Guest User','ramesh@outlook.com','unlike','Average Content','Felt the website needs some more resources.'),(29,'2021-10-24','Sundar','sundar@gmail.com','like','Fantastic','Good Website with good resources and discussion support'),(30,'2021-10-24','Shekar','shekarss@gmail.com','like','Nice Website','Easy to understand and read with good discussion support.'),(32,'2021-10-25','Surya','surya@gmail.com','like','Very Useful Website','A good website with well-organized contents'),(33,'2021-10-25','Guest User','atinvento1@outlook.com','like','Good website','nice website with awesome content'),(34,'2021-11-01','rohit','a@gmail.com','like','Nice website','Good Doubt clearance support');
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-24 18:11:08
