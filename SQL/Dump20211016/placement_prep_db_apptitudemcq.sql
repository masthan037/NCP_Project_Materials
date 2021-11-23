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
-- Table structure for table `apptitudemcq`
--

DROP TABLE IF EXISTS `apptitudemcq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apptitudemcq` (
  `mcqID` int NOT NULL AUTO_INCREMENT,
  `mcqQuestion` varchar(500) NOT NULL,
  `A` varchar(45) NOT NULL,
  `B` varchar(45) NOT NULL,
  `C` varchar(45) NOT NULL,
  `D` varchar(45) NOT NULL,
  `mcqAnswer` varchar(45) NOT NULL,
  PRIMARY KEY (`mcqID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apptitudemcq`
--

LOCK TABLES `apptitudemcq` WRITE;
/*!40000 ALTER TABLE `apptitudemcq` DISABLE KEYS */;
INSERT INTO `apptitudemcq` VALUES (1,'What is the fourth proportional of 0.006, 1.2 & 6/25?','36','48','4.8','3.6','48'),(2,'Two ants of length 1 cm and 1.2 cm crawl in opposite directions with average speeds of 2 and 3 mm per second respectively. How many seconds will they take to cross each other? ','4.4','2.8','0.4','1.5','4.4'),(3,'The index numbers of five commodities are 121, 123, 125, 126, 128 and the weights assigned to these are respectively 5, 11, 10, 8, 6. Then what is the weighted average index number?','123.8','124.2','124.6','125.2','124.6');
/*!40000 ALTER TABLE `apptitudemcq` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-23 17:18:16
