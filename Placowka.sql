-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: placowka
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `absencje`
--

DROP TABLE IF EXISTS `absencje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absencje` (
  `ID_przyczyny` int NOT NULL,
  `ID_pracownika` int NOT NULL,
  `Data_od` date NOT NULL,
  `Data_do` date NOT NULL,
  KEY `ID_PA` (`ID_przyczyny`),
  KEY `ID_PRAC` (`ID_pracownika`),
  CONSTRAINT `absencje_ibfk_1` FOREIGN KEY (`ID_przyczyny`) REFERENCES `przyczyny_absencji` (`ID_przyczyny`),
  CONSTRAINT `absencje_ibfk_2` FOREIGN KEY (`ID_pracownika`) REFERENCES `pracownicy` (`ID_pracownika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absencje`
--

LOCK TABLES `absencje` WRITE;
/*!40000 ALTER TABLE `absencje` DISABLE KEYS */;
INSERT INTO `absencje` VALUES (2,10,'2023-01-23','2023-05-04'),(5,1,'2023-01-27','2023-02-06'),(1,1,'2023-01-27','2023-01-31');
/*!40000 ALTER TABLE `absencje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oddzialy`
--

DROP TABLE IF EXISTS `oddzialy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oddzialy` (
  `ID_oddzialu` int NOT NULL AUTO_INCREMENT,
  `Nazwa` varchar(100) NOT NULL,
  `ID_kierownika` int NOT NULL,
  PRIMARY KEY (`ID_oddzialu`),
  KEY `ID_KIERO` (`ID_kierownika`),
  CONSTRAINT `ID_KIERO` FOREIGN KEY (`ID_kierownika`) REFERENCES `pracownicy` (`ID_pracownika`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oddzialy`
--

LOCK TABLES `oddzialy` WRITE;
/*!40000 ALTER TABLE `oddzialy` DISABLE KEYS */;
INSERT INTO `oddzialy` VALUES (1,'Zarządzanie zasobami',15),(2,'Badania',7),(3,'Administracja',5),(4,'Sprzedaż',3);
/*!40000 ALTER TABLE `oddzialy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacjenci`
--

DROP TABLE IF EXISTS `pacjenci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacjenci` (
  `ID_pacjenta` int NOT NULL AUTO_INCREMENT,
  `Imie` varchar(50) NOT NULL,
  `Nazwisko` varchar(100) NOT NULL,
  `Pesel` char(11) NOT NULL,
  `Data_urodzenia` date NOT NULL,
  `Adres_zamieszkania` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_pacjenta`),
  UNIQUE KEY `UNIQUE_USER_` (`Imie`,`Nazwisko`,`Pesel`),
  CONSTRAINT `pesel_liczba` CHECK (((`Pesel` between 1 and 99999999999) and (char_length(`Pesel`) = 11) and (not((`Pesel` like _utf8mb4'% %')))))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacjenci`
--

LOCK TABLES `pacjenci` WRITE;
/*!40000 ALTER TABLE `pacjenci` DISABLE KEYS */;
INSERT INTO `pacjenci` VALUES (3,'Darek','Henrykowski','02134569301','1999-01-09','Ul.Koprowa 21, Katowice 44-402'),(4,'Arkadiusz','Termowski','34210956021','1995-04-11','Ul.Rostka Józefa 14, Katowice 44-405'),(5,'Robert','Kupica','12506934501','1993-07-15','Ul.Kleeberga Franciszka  28, Katowice 44-405'),(6,'Ola','Ziemman','56019450691','2004-09-15','Ul.1000-Lecia Al. 24, Katowice 44-411'),(7,'Andrzej','Kurański','12365478123','1960-11-01','Ul.Polna 13, Katowice 44-401'),(8,'Małgorzata','Paprończyk','65019460591','1970-05-05','Ul.Diamentowa 6, Katowice 44-404'),(9,'Rafał','Dart','12376457893','1981-09-10','Ul.Stalowa 29, Katowice 44-402'),(10,'Judyta','Szlachta','24560945869','1988-11-19','Ul.Syriusza 19, Katowice 44-402'),(11,'Anastazja','Piątek','15345673451','1995-10-25','Ul.Gagarina Jurija 11 , Katowice 44-444');
/*!40000 ALTER TABLE `pacjenci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pracownicy`
--

DROP TABLE IF EXISTS `pracownicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pracownicy` (
  `ID_pracownika` int NOT NULL AUTO_INCREMENT,
  `Imie` varchar(50) NOT NULL,
  `Nazwisko` varchar(100) NOT NULL,
  `Pesel` char(11) NOT NULL,
  `Data_urodzenia` date NOT NULL,
  `Adres_zamieszkania` varchar(200) NOT NULL,
  `Pensja` int NOT NULL,
  `ID_oddzialu` int NOT NULL,
  PRIMARY KEY (`ID_pracownika`),
  UNIQUE KEY `UNIQUE_USER` (`Imie`,`Nazwisko`,`Pesel`),
  KEY `FK_ODDZIAL` (`ID_oddzialu`),
  CONSTRAINT `pracownicy_ibfk_1` FOREIGN KEY (`ID_oddzialu`) REFERENCES `oddzialy` (`ID_oddzialu`),
  CONSTRAINT `pesel_liczba_` CHECK (((`Pesel` between 1 and 99999999999) and (char_length(`Pesel`) = 11) and (not((`Pesel` like _utf8mb4'% %')))))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pracownicy`
--

LOCK TABLES `pracownicy` WRITE;
/*!40000 ALTER TABLE `pracownicy` DISABLE KEYS */;
INSERT INTO `pracownicy` VALUES (1,'Janek','Kowalski','01234654901','1986-05-12','Ul.Działkowa 8, Katowice 40-421',4500,4),(2,'Kacper','Jonaszczyk','15460987451','1997-03-08','Ul.Brezy Tadeusza 3, Katowice 40-405',3800,1),(3,'Mateusz','Zimoń','45376818903','1994-09-09','Ul.Zwonowicka 35, Katowice 40-408',6000,4),(4,'Szymon','Kocoń','87468903214','1999-12-11','Ul.Chorzowska 28, Katowice 40-410',2900,1),(5,'Dawid','Kotarski','56723789431','1980-01-11','Ul.Olszyny 13, Katowice 40-412',8600,3),(6,'Jakub','Tasman','86590143901','1988-08-19','Ul.Grzegorzewskiej Marii 21, Katowice 40-415',3800,2),(7,'Alicja','Młynarska','96012356031','1993-07-10','Ul.Wróblewskiego Zygmunta  3, Katowice 40-420',9000,1),(8,'Martyna','Konopacka','65019467812','2000-05-15','Ul.Giedroycia Jerzego Rondo 3, Katowice 40-421',3500,3),(9,'Róża','Anders','85019458401','1976-04-15','Ul.Kacza 11, Katowice 40-425',5000,1),(10,'Julia','Niedziela','81050242315','1981-05-25','UL.Winiarska 9, Katowice 40-426',2600,3),(11,'Julia','Ćwiąkała','92101548732','1992-10-15','UL.Reja Mikołaja 5, Katowice 40-430',5400,2),(12,'Zofia','Pryk','91041516589','1991-04-15','UL.Witkowska 11, Katowice 40-431',4500,1),(13,'Magdalena','Dzwonkowska','92081612345','1992-08-16','UL.Skowronkowa 7, Katowice 40-405',5000,2),(14,'Karol','Krawczyk','82010112345','1982-01-04','UL.Gackowskiego Teofila 33, Katowice 40-407',3800,1),(15,'Józef','Wołecki','43471313842','1986-06-11','UL.Racławicka 7, Katowice 40-411',10000,4),(16,'Paulina','Wybicka','34560194012','1975-07-11','UL.Warszawska Al. 6, Katowice 40-415',4000,1);
/*!40000 ALTER TABLE `pracownicy` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CHECK_HOW` AFTER INSERT ON `pracownicy` FOR EACH ROW BEGIN

INSERT INTO pracownicy_archiwum (Event_date,Event_type,user_name,NEW_ID_pracownika,NEW_Imie,NEW_Nazwisko,NEW_Pesel
,NEW_Data_urodzenia,NEW_Adres_zamieszkania,NEW_pensja,NEW_ID_oddzialu)
VALUES (SYSDATE(),'INSERT', USER() ,NEW.ID_pracownika,NEW.Imie,NEW.Nazwisko,NEW.Pesel,NEW.Data_urodzenia
,NEW.Adres_zamieszkania,NEW.pensja,NEW.ID_oddzialu);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CHECK_HOW1` AFTER UPDATE ON `pracownicy` FOR EACH ROW BEGIN

INSERT INTO pracownicy_archiwum (Event_date,Event_type,user_name,OLD_ID_pracownika,OLD_Imie,OLD_Nazwisko,OLD_pesel,OLD_Data_urodzenia,OLD_Adres_zamieszkania,OLD_pensja,OLD_ID_oddzialu,NEW_ID_pracownika,NEW_Imie,NEW_Nazwisko,NEW_Pesel
,NEW_Data_urodzenia,NEW_Adres_zamieszkania,NEW_pensja,NEW_ID_oddzialu)
VALUES (SYSDATE(),'Update', USER(),OLD.ID_pracownika,OLD.Imie,OLD.Nazwisko,OLD.pesel,OLD.Data_urodzenia,OLD.Adres_zamieszkania,OLd.Pensja,OLD.ID_oddzialu ,NEW.ID_pracownika,NEW.Imie,NEW.Nazwisko,NEW.Pesel,NEW.Data_urodzenia
,NEW.Adres_zamieszkania,NEW.pensja ,NEW.ID_oddzialu);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CHECK_HOW2` AFTER DELETE ON `pracownicy` FOR EACH ROW BEGIN

INSERT INTO pracownicy_archiwum (Event_date,Event_type,user_name,OLD_ID_pracownika,OLD_Imie,OLD_Nazwisko,OLD_pesel,OLD_Data_urodzenia,OLD_Adres_zamieszkania,OLD_pensja,OLD_ID_oddzialu)
VALUES (SYSDATE(),'DELETE', USER(),OLD.ID_pracownika,OLD.Imie,OLD.Nazwisko,OLD.pesel,OLD.Data_urodzenia,OLD.Adres_zamieszkania,OLd.Pensja,OLD.ID_oddzialu);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pracownicy_archiwum`
--

DROP TABLE IF EXISTS `pracownicy_archiwum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pracownicy_archiwum` (
  `Event_date` datetime DEFAULT NULL,
  `Event_type` varchar(20) DEFAULT NULL,
  `User_name` varchar(50) DEFAULT NULL,
  `OLD_ID_pracownika` int DEFAULT NULL,
  `OLD_Imie` varchar(50) DEFAULT NULL,
  `OLD_Nazwisko` varchar(100) DEFAULT NULL,
  `OLD_Pesel` char(11) DEFAULT NULL,
  `OLD_Data_urodzenia` date DEFAULT NULL,
  `OLD_Adres_zamieszkania` varchar(200) DEFAULT NULL,
  `OLD_PENSJA` int DEFAULT NULL,
  `OLD_ID_oddzialu` int DEFAULT NULL,
  `NEW_ID_pracownika` int DEFAULT NULL,
  `NEW_Imie` varchar(50) DEFAULT NULL,
  `NEW_Nazwisko` varchar(100) DEFAULT NULL,
  `NEW_Pesel` char(11) DEFAULT NULL,
  `NEW_Data_urodzenia` date DEFAULT NULL,
  `NEW_Adres_zamieszkania` varchar(200) DEFAULT NULL,
  `NEW_pensja` int DEFAULT NULL,
  `NEW_ID_oddzialu` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pracownicy_archiwum`
--

LOCK TABLES `pracownicy_archiwum` WRITE;
/*!40000 ALTER TABLE `pracownicy_archiwum` DISABLE KEYS */;
INSERT INTO `pracownicy_archiwum` VALUES ('2023-01-30 16:31:57','DELETE','root@localhost',1,'Jan','Kowalski','01234654901','1986-05-12','Ul.Działkowa 8, Katowice 40-421',4500,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2023-01-30 16:31:57','DELETE','root@localhost',2,'Kacper','Jonaszczyk','15460987451','1997-03-08','Ul.Brezy Tadeusza 3, Katowice 40-405',3800,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2023-01-30 16:31:57','DELETE','root@localhost',3,'Mateusz','Zimoń','45376818903','1994-09-09','Ul.Zwonowicka 35, Katowice 40-408',6000,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2023-01-30 16:31:57','DELETE','root@localhost',4,'Szymon','Kocoń','87468903214','1999-12-11','Ul.Chorzowska 28, Katowice 40-410',2900,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2023-01-30 16:31:57','DELETE','root@localhost',5,'Dawid','Kotarski','56723789431','1980-01-11','Ul.Olszyny 13, Katowice 40-412',8600,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2023-01-30 16:31:57','DELETE','root@localhost',6,'Jakub','Tasman','86590143901','1988-08-19','Ul.Grzegorzewskiej Marii 21, Katowice 40-415',3800,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2023-01-30 16:31:57','DELETE','root@localhost',7,'Alicja','Młynarska','96012356031','1993-07-10','Ul.Wróblewskiego Zygmunta  3, Katowice 40-420',9000,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2023-01-30 16:31:57','DELETE','root@localhost',8,'Martyna','Konopacka','65019467812','2000-05-15','Ul.Giedroycia Jerzego Rondo 3, Katowice 40-421',3500,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2023-01-30 16:31:57','DELETE','root@localhost',9,'Róża','Anders','85019458401','1976-04-15','Ul.Kacza 11, Katowice 40-425',5000,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2023-01-30 16:31:57','DELETE','root@localhost',10,'Julia','Niedziela','81050242315','1981-05-25','UL.Winiarska 9, Katowice 40-426',2600,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2023-01-30 16:31:57','DELETE','root@localhost',11,'Julia','Ćwiąkała','92101548732','1992-10-15','UL.Reja Mikołaja 5, Katowice 40-430',5400,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2023-01-30 16:31:57','DELETE','root@localhost',12,'Zofia','Pryk','91041516589','1991-04-15','UL.Witkowska 11, Katowice 40-431',4500,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2023-01-30 16:31:57','DELETE','root@localhost',13,'Magdalena','Dzwonkowska','92081612345','1992-08-16','UL.Skowronkowa 7, Katowice 40-405',5000,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2023-01-30 16:31:57','DELETE','root@localhost',14,'Karol','Krawczyk','82010112345','1982-01-04','UL.Gackowskiego Teofila 33, Katowice 40-407',3800,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2023-01-30 16:31:57','DELETE','root@localhost',15,'Józef','Wołecki','43471313842','1986-06-11','UL.Racławicka 7, Katowice 40-411',10000,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2023-01-30 16:31:57','DELETE','root@localhost',16,'Paulina','Wybicka','34560194012','1975-07-11','UL.Warszawska Al. 6, Katowice 40-415',4000,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2023-01-30 16:32:00','INSERT','root@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Jan','Kowalski','01234654901','1986-05-12','Ul.Działkowa 8, Katowice 40-421',4500,4),('2023-01-30 16:32:00','INSERT','root@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'Kacper','Jonaszczyk','15460987451','1997-03-08','Ul.Brezy Tadeusza 3, Katowice 40-405',3800,1),('2023-01-30 16:32:00','INSERT','root@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'Mateusz','Zimoń','45376818903','1994-09-09','Ul.Zwonowicka 35, Katowice 40-408',6000,4),('2023-01-30 16:32:00','INSERT','root@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,'Szymon','Kocoń','87468903214','1999-12-11','Ul.Chorzowska 28, Katowice 40-410',2900,1),('2023-01-30 16:32:00','INSERT','root@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'Dawid','Kotarski','56723789431','1980-01-11','Ul.Olszyny 13, Katowice 40-412',8600,3),('2023-01-30 16:32:00','INSERT','root@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,'Jakub','Tasman','86590143901','1988-08-19','Ul.Grzegorzewskiej Marii 21, Katowice 40-415',3800,2),('2023-01-30 16:32:00','INSERT','root@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,'Alicja','Młynarska','96012356031','1993-07-10','Ul.Wróblewskiego Zygmunta  3, Katowice 40-420',9000,1),('2023-01-30 16:32:00','INSERT','root@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,'Martyna','Konopacka','65019467812','2000-05-15','Ul.Giedroycia Jerzego Rondo 3, Katowice 40-421',3500,3),('2023-01-30 16:32:00','INSERT','root@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,'Róża','Anders','85019458401','1976-04-15','Ul.Kacza 11, Katowice 40-425',5000,1),('2023-01-30 16:32:00','INSERT','root@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,'Julia','Niedziela','81050242315','1981-05-25','UL.Winiarska 9, Katowice 40-426',2600,3),('2023-01-30 16:32:00','INSERT','root@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,'Julia','Ćwiąkała','92101548732','1992-10-15','UL.Reja Mikołaja 5, Katowice 40-430',5400,2),('2023-01-30 16:32:00','INSERT','root@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,'Zofia','Pryk','91041516589','1991-04-15','UL.Witkowska 11, Katowice 40-431',4500,1),('2023-01-30 16:32:00','INSERT','root@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,'Magdalena','Dzwonkowska','92081612345','1992-08-16','UL.Skowronkowa 7, Katowice 40-405',5000,2),('2023-01-30 16:32:00','INSERT','root@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,'Karol','Krawczyk','82010112345','1982-01-04','UL.Gackowskiego Teofila 33, Katowice 40-407',3800,1),('2023-01-30 16:32:00','INSERT','root@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,'Józef','Wołecki','43471313842','1986-06-11','UL.Racławicka 7, Katowice 40-411',10000,4),('2023-01-30 16:32:00','INSERT','root@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,'Paulina','Wybicka','34560194012','1975-07-11','UL.Warszawska Al. 6, Katowice 40-415',4000,1),('2023-01-30 16:33:04','Update','root@localhost',1,'Jan','Kowalski','01234654901','1986-05-12','Ul.Działkowa 8, Katowice 40-421',4500,4,1,'Janek','Kowalski','01234654901','1986-05-12','Ul.Działkowa 8, Katowice 40-421',4500,4);
/*!40000 ALTER TABLE `pracownicy_archiwum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przyczyny_absencji`
--

DROP TABLE IF EXISTS `przyczyny_absencji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `przyczyny_absencji` (
  `ID_przyczyny` int NOT NULL AUTO_INCREMENT,
  `Nazwa_przyczyny` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_przyczyny`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przyczyny_absencji`
--

LOCK TABLES `przyczyny_absencji` WRITE;
/*!40000 ALTER TABLE `przyczyny_absencji` DISABLE KEYS */;
/*!40000 ALTER TABLE `przyczyny_absencji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uslugi`
--

DROP TABLE IF EXISTS `uslugi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uslugi` (
  `ID_uslugi` int NOT NULL AUTO_INCREMENT,
  `Nazwa` varchar(100) NOT NULL,
  `Cena` decimal(6,2) NOT NULL,
  `Koszt` decimal(6,2) NOT NULL,
  `Stawka_podatku` int NOT NULL,
  PRIMARY KEY (`ID_uslugi`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uslugi`
--

LOCK TABLES `uslugi` WRITE;
/*!40000 ALTER TABLE `uslugi` DISABLE KEYS */;
INSERT INTO `uslugi` VALUES (1,'Badanie krwi',100.00,50.00,8),(2,'Badanie moczu',110.00,50.00,8),(3,'Badanie immunologiczne',120.00,60.00,8),(4,'Badanie tarczycy',150.00,80.00,8),(5,'Wizyta',150.00,80.00,8);
/*!40000 ALTER TABLE `uslugi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uslugi_sprzedaz`
--

DROP TABLE IF EXISTS `uslugi_sprzedaz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uslugi_sprzedaz` (
  `ID_uslugi` int NOT NULL,
  `ID_pacjenta` int NOT NULL,
  `Data_sprzedazy` date DEFAULT NULL,
  `Dokument_sprzedazy` varchar(10) NOT NULL,
  KEY `ID_U` (`ID_uslugi`),
  KEY `FK_PACJ_USLUG` (`ID_pacjenta`),
  CONSTRAINT `uslugi_sprzedaz_ibfk_1` FOREIGN KEY (`ID_uslugi`) REFERENCES `uslugi` (`ID_uslugi`),
  CONSTRAINT `uslugi_sprzedaz_ibfk_2` FOREIGN KEY (`ID_pacjenta`) REFERENCES `pacjenci` (`ID_pacjenta`),
  CONSTRAINT `Dokument_sprawdz` CHECK ((`Dokument_sprzedazy` in (_utf8mb4'paragon',_utf8mb4'faktura')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uslugi_sprzedaz`
--

LOCK TABLES `uslugi_sprzedaz` WRITE;
/*!40000 ALTER TABLE `uslugi_sprzedaz` DISABLE KEYS */;
INSERT INTO `uslugi_sprzedaz` VALUES (5,2,'2023-01-30','faktura'),(5,5,'2023-01-31','paragon'),(5,4,'2023-01-31','paragon'),(5,7,'2023-01-31','paragon'),(1,7,'2023-01-31','faktura'),(2,3,'2023-01-31','faktura'),(4,5,'2023-01-31','paragon');
/*!40000 ALTER TABLE `uslugi_sprzedaz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wizyty`
--

DROP TABLE IF EXISTS `wizyty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wizyty` (
  `id_pacjenta` int NOT NULL,
  `id_pracownika` int NOT NULL,
  `id_oddzialu` int NOT NULL,
  `data_wizyty` datetime NOT NULL,
  KEY `pacjent` (`id_pacjenta`),
  KEY `pracownik` (`id_pracownika`),
  KEY `oddzial` (`id_oddzialu`),
  CONSTRAINT `wizyty_ibfk_1` FOREIGN KEY (`id_pacjenta`) REFERENCES `pacjenci` (`ID_pacjenta`),
  CONSTRAINT `wizyty_ibfk_2` FOREIGN KEY (`id_pracownika`) REFERENCES `pracownicy` (`ID_pracownika`),
  CONSTRAINT `wizyty_ibfk_3` FOREIGN KEY (`id_oddzialu`) REFERENCES `oddzialy` (`ID_oddzialu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wizyty`
--

LOCK TABLES `wizyty` WRITE;
/*!40000 ALTER TABLE `wizyty` DISABLE KEYS */;
INSERT INTO `wizyty` VALUES (7,6,1,'2023-01-31 09:00:00'),(2,6,1,'2023-01-03 08:00:00'),(5,9,1,'2023-01-03 08:30:00'),(4,13,1,'2023-01-03 10:30:00');
/*!40000 ALTER TABLE `wizyty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'placowka'
--

--
-- Dumping routines for database 'placowka'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-30 17:14:46
