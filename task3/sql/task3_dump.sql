-- MySQL dump 10.13  Distrib 9.6.0, for Linux (x86_64)
--
-- Host: localhost    Database: college_club
-- ------------------------------------------------------
-- Server version	9.6.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'ec0ced3a-17b7-11f1-9ca2-0242ac110002:1-26';

--
-- Table structure for table `ClubMembership`
--

DROP TABLE IF EXISTS `ClubMembership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClubMembership` (
  `StudentID` int DEFAULT NULL,
  `StudentName` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `ClubName` varchar(50) DEFAULT NULL,
  `ClubRoom` varchar(10) DEFAULT NULL,
  `ClubMentor` varchar(50) DEFAULT NULL,
  `JoinDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClubMembership`
--

LOCK TABLES `ClubMembership` WRITE;
/*!40000 ALTER TABLE `ClubMembership` DISABLE KEYS */;
INSERT INTO `ClubMembership` VALUES (1,'Asha','asha@email.com','Music Club','R101','Mr. Raman','2024-01-10'),(2,'Bikash','bikash@email.com','Sports Club','R202','Ms. Sita','2024-01-12'),(1,'Asha','asha@email.com','Sports Club','R202','Ms. Sita','2024-01-15'),(3,'Nisha','nisha@email.com','Music Club','R101','Mr. Raman','2024-01-20'),(4,'Rohan','rohan@email.com','Drama Club','R303','Mr. Kiran','2024-01-18'),(5,'Suman','suman@email.com','Music Club','R101','Mr. Raman','2024-01-22'),(2,'Bikash','bikash@email.com','Drama Club','R303','Mr. Kiran','2024-01-25'),(6,'Pooja','pooja@email.com','Sports Club','R202','Ms. Sita','2024-01-27'),(3,'Nisha','nisha@email.com','Coding Club','Lab1','Mr. Anil','2024-01-28'),(7,'Aman','aman@email.com','Coding Club','Lab1','Mr. Anil','2024-01-30');
/*!40000 ALTER TABLE `ClubMembership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClubMembership_1NF`
--

DROP TABLE IF EXISTS `ClubMembership_1NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClubMembership_1NF` (
  `StudentID` int NOT NULL,
  `StudentName` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `ClubName` varchar(50) NOT NULL,
  `ClubRoom` varchar(10) DEFAULT NULL,
  `ClubMentor` varchar(50) DEFAULT NULL,
  `JoinDate` date DEFAULT NULL,
  PRIMARY KEY (`StudentID`,`ClubName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClubMembership_1NF`
--

LOCK TABLES `ClubMembership_1NF` WRITE;
/*!40000 ALTER TABLE `ClubMembership_1NF` DISABLE KEYS */;
INSERT INTO `ClubMembership_1NF` VALUES (1,'Asha','asha@email.com','Music Club','R101','Mr. Raman','2024-01-10'),(1,'Asha','asha@email.com','Sports Club','R202','Ms. Sita','2024-01-15'),(2,'Bikash','bikash@email.com','Drama Club','R303','Mr. Kiran','2024-01-25'),(2,'Bikash','bikash@email.com','Sports Club','R202','Ms. Sita','2024-01-12'),(3,'Nisha','nisha@email.com','Coding Club','Lab1','Mr. Anil','2024-01-28'),(3,'Nisha','nisha@email.com','Music Club','R101','Mr. Raman','2024-01-20'),(4,'Rohan','rohan@email.com','Drama Club','R303','Mr. Kiran','2024-01-18'),(5,'Suman','suman@email.com','Music Club','R101','Mr. Raman','2024-01-22'),(6,'Pooja','pooja@email.com','Sports Club','R202','Ms. Sita','2024-01-27'),(7,'Aman','aman@email.com','Coding Club','Lab1','Mr. Anil','2024-01-30');
/*!40000 ALTER TABLE `ClubMembership_1NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Club_2NF`
--

DROP TABLE IF EXISTS `Club_2NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Club_2NF` (
  `ClubName` varchar(50) NOT NULL,
  `ClubRoom` varchar(10) DEFAULT NULL,
  `ClubMentor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ClubName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Club_2NF`
--

LOCK TABLES `Club_2NF` WRITE;
/*!40000 ALTER TABLE `Club_2NF` DISABLE KEYS */;
INSERT INTO `Club_2NF` VALUES ('Coding Club','Lab1','Mr. Anil'),('Drama Club','R303','Mr. Kiran'),('Music Club','R101','Mr. Raman'),('Sports Club','R202','Ms. Sita');
/*!40000 ALTER TABLE `Club_2NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Club_3NF`
--

DROP TABLE IF EXISTS `Club_3NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Club_3NF` (
  `ClubID` varchar(5) NOT NULL,
  `ClubName` varchar(50) DEFAULT NULL,
  `ClubRoom` varchar(10) DEFAULT NULL,
  `ClubMentor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ClubID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Club_3NF`
--

LOCK TABLES `Club_3NF` WRITE;
/*!40000 ALTER TABLE `Club_3NF` DISABLE KEYS */;
INSERT INTO `Club_3NF` VALUES ('C01','Music Club','R101','Mr. Raman'),('C02','Sports Club','R202','Ms. Sita'),('C03','Drama Club','R303','Mr. Kiran'),('C04','Coding Club','Lab1','Mr. Anil'),('C05','Art Club','R404','Ms. Lata');
/*!40000 ALTER TABLE `Club_3NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Membership_2NF`
--

DROP TABLE IF EXISTS `Membership_2NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Membership_2NF` (
  `StudentID` int NOT NULL,
  `ClubName` varchar(50) NOT NULL,
  `JoinDate` date DEFAULT NULL,
  PRIMARY KEY (`StudentID`,`ClubName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Membership_2NF`
--

LOCK TABLES `Membership_2NF` WRITE;
/*!40000 ALTER TABLE `Membership_2NF` DISABLE KEYS */;
INSERT INTO `Membership_2NF` VALUES (1,'Music Club','2024-01-10'),(1,'Sports Club','2024-01-15'),(2,'Drama Club','2024-01-25'),(2,'Sports Club','2024-01-12'),(3,'Coding Club','2024-01-28'),(3,'Music Club','2024-01-20'),(4,'Drama Club','2024-01-18'),(5,'Music Club','2024-01-22'),(6,'Sports Club','2024-01-27'),(7,'Coding Club','2024-01-30');
/*!40000 ALTER TABLE `Membership_2NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Membership_3NF`
--

DROP TABLE IF EXISTS `Membership_3NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Membership_3NF` (
  `StudentID` int NOT NULL,
  `ClubID` varchar(5) NOT NULL,
  `JoinDate` date DEFAULT NULL,
  PRIMARY KEY (`StudentID`,`ClubID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Membership_3NF`
--

LOCK TABLES `Membership_3NF` WRITE;
/*!40000 ALTER TABLE `Membership_3NF` DISABLE KEYS */;
INSERT INTO `Membership_3NF` VALUES (1,'C01','2024-01-10'),(1,'C02','2024-01-15'),(2,'C02','2024-01-12'),(2,'C03','2024-01-25'),(3,'C01','2024-01-20'),(3,'C04','2024-01-28'),(4,'C03','2024-01-18'),(5,'C01','2024-01-22'),(6,'C02','2024-01-27'),(7,'C04','2024-01-30');
/*!40000 ALTER TABLE `Membership_3NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_2NF`
--

DROP TABLE IF EXISTS `Student_2NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Student_2NF` (
  `StudentID` int NOT NULL,
  `StudentName` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student_2NF`
--

LOCK TABLES `Student_2NF` WRITE;
/*!40000 ALTER TABLE `Student_2NF` DISABLE KEYS */;
INSERT INTO `Student_2NF` VALUES (1,'Asha','asha@email.com'),(2,'Bikash','bikash@email.com'),(3,'Nisha','nisha@email.com'),(4,'Rohan','rohan@email.com'),(5,'Suman','suman@email.com'),(6,'Pooja','pooja@email.com'),(7,'Aman','aman@email.com'),(8,'Priya','priya@email.com');
/*!40000 ALTER TABLE `Student_2NF` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-04 15:00:55
