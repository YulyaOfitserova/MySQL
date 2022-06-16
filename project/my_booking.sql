-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: my_booking
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hotels_id` int unsigned NOT NULL,
  `customers_id` int unsigned NOT NULL,
  `rooms_id` int unsigned NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_booking_customers1_idx` (`customers_id`),
  KEY `fk_booking_hotels1_idx` (`hotels_id`),
  KEY `fk_booking_rooms1_idx` (`rooms_id`),
  CONSTRAINT `fk_booking_customers1` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_booking_hotels1` FOREIGN KEY (`hotels_id`) REFERENCES `hotels` (`id`),
  CONSTRAINT `fk_booking_rooms1` FOREIGN KEY (`rooms_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,2,3,4,'2021-08-10 12:00:00','2021-08-15 12:00:00'),(2,2,4,5,'2021-08-10 12:00:00','2021-08-12 12:00:00'),(3,1,7,1,'2021-08-03 12:00:00','2021-08-15 12:00:00'),(4,1,8,2,'2021-08-22 12:00:00','2021-08-25 12:00:00'),(5,5,4,11,'2021-08-05 12:00:00','2021-08-21 12:00:00'),(6,3,5,8,'2021-08-03 12:00:00','2021-08-15 12:00:00');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_rules`
--

DROP TABLE IF EXISTS `booking_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_rules`
--

LOCK TABLES `booking_rules` WRITE;
/*!40000 ALTER TABLE `booking_rules` DISABLE KEYS */;
INSERT INTO `booking_rules` VALUES (1,'free cancellation',NULL),(2,'booking without credit card',NULL),(3,'without prepayment',NULL),(4,'payment is not refundable',NULL);
/*!40000 ALTER TABLE `booking_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conveniences_hotel`
--

DROP TABLE IF EXISTS `conveniences_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conveniences_hotel` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conveniences_hotel`
--

LOCK TABLES `conveniences_hotel` WRITE;
/*!40000 ALTER TABLE `conveniences_hotel` DISABLE KEYS */;
INSERT INTO `conveniences_hotel` VALUES (1,'Parking',NULL),(2,'Swimming pool',NULL),(3,'Free Wi-Fi',NULL),(4,'Spa',NULL),(5,'Pets allowed',NULL),(6,'Airport Transfers',NULL),(7,'Delivery of food and drinks to the room',NULL),(8,'non-smoking rooms',NULL),(9,'a restaurant',NULL);
/*!40000 ALTER TABLE `conveniences_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conveniences_in_hotel`
--

DROP TABLE IF EXISTS `conveniences_in_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conveniences_in_hotel` (
  `hotels_id` int unsigned NOT NULL,
  `conveniences_hotel_id` int unsigned NOT NULL,
  PRIMARY KEY (`hotels_id`,`conveniences_hotel_id`),
  KEY `FK_conv_hotel_idx` (`conveniences_hotel_id`) /*!80000 INVISIBLE */,
  KEY `FK_hotels` (`hotels_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `FK_conv_hotel` FOREIGN KEY (`conveniences_hotel_id`) REFERENCES `conveniences_hotel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_hotels` FOREIGN KEY (`hotels_id`) REFERENCES `hotels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conveniences_in_hotel`
--

LOCK TABLES `conveniences_in_hotel` WRITE;
/*!40000 ALTER TABLE `conveniences_in_hotel` DISABLE KEYS */;
INSERT INTO `conveniences_in_hotel` VALUES (1,3),(1,7),(2,1),(2,2),(2,3),(2,4),(2,7),(2,8),(2,9),(3,1),(3,3),(3,7),(3,8),(3,9),(4,3),(4,8),(5,1),(5,2),(5,3),(5,8),(6,3),(6,8),(6,9),(7,1),(7,3),(7,6),(8,3);
/*!40000 ALTER TABLE `conveniences_in_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conveniences_in_room`
--

DROP TABLE IF EXISTS `conveniences_in_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conveniences_in_room` (
  `rooms_id` int unsigned NOT NULL,
  `conveniences_room_id` int unsigned NOT NULL,
  PRIMARY KEY (`rooms_id`,`conveniences_room_id`),
  KEY `rooms_id_idx` (`rooms_id`) /*!80000 INVISIBLE */,
  KEY `conv_id_idx` (`conveniences_room_id`),
  CONSTRAINT `fk_conv_id` FOREIGN KEY (`conveniences_room_id`) REFERENCES `conveniences_room` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rooms_id` FOREIGN KEY (`rooms_id`) REFERENCES `rooms` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conveniences_in_room`
--

LOCK TABLES `conveniences_in_room` WRITE;
/*!40000 ALTER TABLE `conveniences_in_room` DISABLE KEYS */;
INSERT INTO `conveniences_in_room` VALUES (2,1),(3,1),(6,1),(10,1),(11,1),(13,1),(19,1),(20,1),(1,2),(2,2),(5,2),(6,2),(8,2),(13,2),(14,2),(16,2),(18,2),(19,2),(22,2),(3,3),(5,3),(7,3),(11,3),(13,3),(16,3),(20,3),(1,4),(3,4),(6,4),(7,4),(11,4),(15,4),(16,4),(18,4),(21,4),(2,5),(3,5),(4,5),(5,5),(8,5),(10,5),(11,5),(17,5),(19,5),(21,5),(22,5),(8,6),(17,6),(4,7),(6,7),(11,7),(15,7),(21,7);
/*!40000 ALTER TABLE `conveniences_in_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conveniences_room`
--

DROP TABLE IF EXISTS `conveniences_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conveniences_room` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conveniences_room`
--

LOCK TABLES `conveniences_room` WRITE;
/*!40000 ALTER TABLE `conveniences_room` DISABLE KEYS */;
INSERT INTO `conveniences_room` VALUES (1,'Kitchen',NULL),(2,'Bathroom',NULL),(3,'Air conditioning',NULL),(4,'Washing machine',NULL),(5,'TV',NULL),(6,'Balcony',NULL),(7,'View from the window',NULL);
/*!40000 ALTER TABLE `conveniences_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_codes`
--

DROP TABLE IF EXISTS `country_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_codes` (
  `country_code` int unsigned NOT NULL,
  `country_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `currency` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_codes`
--

LOCK TABLES `country_codes` WRITE;
/*!40000 ALTER TABLE `country_codes` DISABLE KEYS */;
INSERT INTO `country_codes` VALUES (36,'Australia','AUD'),(250,'France','EUR'),(643,'Russia','RUB'),(826,'United Kingdom','EUR'),(840,'United States','USD');
/*!40000 ALTER TABLE `country_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(45) COLLATE utf8_bin NOT NULL,
  `birthday_at` date NOT NULL,
  `email` varchar(245) COLLATE utf8_bin NOT NULL,
  `phone` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Michael','Hilll','1971-11-02','jwalker@example.org',79922767158),(2,'Shana','Parker','1971-01-30','kassandra.bartell@example.org',79516999184),(3,'Fiona','Veum','1999-10-22','schumm.bryon@example.net',79851339002),(4,'Rashad','Rippin','1991-04-18','katrine27@example.com',79785598814),(5,'Oscar','Harris','1988-07-31','mariam.denesik@example.net',79897902642),(6,'Vernon','Heathcote','1992-10-04','hudson.rey@example.net',79328955694),(7,'Terrell','Baumbach','1972-12-09','mabel28@example.com',79538019277),(8,'Yvette','Stark','1997-08-09','meggie89@example.net',79799597568);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feeding_types`
--

DROP TABLE IF EXISTS `feeding_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feeding_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feeding_types`
--

LOCK TABLES `feeding_types` WRITE;
/*!40000 ALTER TABLE `feeding_types` DISABLE KEYS */;
INSERT INTO `feeding_types` VALUES (1,'All inclusive',NULL),(2,'Self-catering',NULL),(3,'Breakfast included',NULL),(4,'Breakfast and lunch included',NULL),(5,'Breakfast and dinner included',NULL),(6,'Three meals a day',NULL),(7,'breakfast is paid separately',NULL);
/*!40000 ALTER TABLE `feeding_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locations_id` int unsigned NOT NULL,
  `stars` smallint DEFAULT NULL COMMENT '''0 - Not Rated | 1 - One Star | 2 - Two Stars | 3 - Three Stars |  4 - Four Stars | 5 - Five Stars''',
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `address` varchar(255) COLLATE utf8_bin NOT NULL,
  `hotel_photo` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hotels_locations1_idx` (`locations_id`),
  CONSTRAINT `fk_hotels_locations1` FOREIGN KEY (`locations_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,3,0,'Ред Брик Китай Город','Хохловский переулок 10, Стр 6, Басманный, Москва, Россия',''),(2,3,4,'Гостиница Измайлово Дельта','Измайловское шоссе 71, корпус 4 Г- Д, Измайлово, Москва, Россия',''),(3,4,3,'Отель на Римского-Корсакова','проспект Римского-Корсакова 45, Адмиралтейский район, Санкт-Петербург, Россия ',''),(4,4,0,'Комплекс Апартаментов Салют Плюс','Пулковское шоссе 14Е, Московский район, Санкт-Петербург, Россия ',''),(5,1,4,'Oaks Sydney Castlereagh Suites','317 Castlereagh Street, Сидней - деловой район, 2000 Сидней, Австралия ',''),(6,2,4,'The ReMIX Hotel','28 av Corentin Cariou, 19-й округ: Ля Вилетт, 75019 Париж, Франция ',''),(7,5,5,'SIAC Paddington Marble Arch 4','Park West Place, Вестминстер, Лондон, W2 2QL, Великобритания',''),(8,6,2,'Hotel St. James','109 West 45th Street, Нью-Йорк, NY 10036, США','');
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels_rating`
--

DROP TABLE IF EXISTS `hotels_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels_rating` (
  `hotels_id` int unsigned NOT NULL,
  `rating` decimal(3,2) unsigned DEFAULT NULL,
  KEY `fk_review_score_hotels1_idx` (`hotels_id`),
  CONSTRAINT `fk_review_score_hotels1` FOREIGN KEY (`hotels_id`) REFERENCES `hotels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels_rating`
--

LOCK TABLES `hotels_rating` WRITE;
/*!40000 ALTER TABLE `hotels_rating` DISABLE KEYS */;
INSERT INTO `hotels_rating` VALUES (1,8.50),(2,8.00),(3,6.50),(4,9.33),(5,8.67),(6,8.00),(7,7.67),(8,8.50);
/*!40000 ALTER TABLE `hotels_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `hotels_russia`
--

DROP TABLE IF EXISTS `hotels_russia`;
/*!50001 DROP VIEW IF EXISTS `hotels_russia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `hotels_russia` AS SELECT 
 1 AS `city_name`,
 1 AS `hotel_name`,
 1 AS `hotel_address`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_code` int unsigned NOT NULL COMMENT '''ISO code''',
  `city_name` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_locations_country_codes1_idx` (`country_code`) /*!80000 INVISIBLE */,
  CONSTRAINT `FK_country_code` FOREIGN KEY (`country_code`) REFERENCES `country_codes` (`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,36,'Sidney'),(2,250,'Paris'),(3,643,'Moscow'),(4,643,'St.Petersburg'),(5,826,'London'),(6,840,'New-York');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `min_price`
--

DROP TABLE IF EXISTS `min_price`;
/*!50001 DROP VIEW IF EXISTS `min_price`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `min_price` AS SELECT 
 1 AS `room_name`,
 1 AS `hotel_id`,
 1 AS `min_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `review_score`
--

DROP TABLE IF EXISTS `review_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_score` (
  `hotels_id` int unsigned NOT NULL,
  `score` int unsigned NOT NULL,
  KEY `fk_score_hotels_idx` (`hotels_id`),
  CONSTRAINT `fk_score_hotels` FOREIGN KEY (`hotels_id`) REFERENCES `hotels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_score`
--

LOCK TABLES `review_score` WRITE;
/*!40000 ALTER TABLE `review_score` DISABLE KEYS */;
INSERT INTO `review_score` VALUES (1,9),(1,8),(2,8),(2,9),(2,7),(3,7),(3,6),(4,9),(4,10),(4,9),(5,8),(5,9),(5,9),(6,8),(7,7),(7,8),(7,8),(8,8),(8,9);
/*!40000 ALTER TABLE `review_score` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `review_score_AFTER_INSERT` AFTER INSERT ON `review_score` FOR EACH ROW BEGIN
	UPDATE hotels_rating
    SET 
		rating = (SELECT AVG(score) FROM review_score
						WHERE review_score.hotels_id = hotels_rating.hotels_id)
	WHERE hotels_id = NEW.hotels_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `room_types`
--

DROP TABLE IF EXISTS `room_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_types`
--

LOCK TABLES `room_types` WRITE;
/*!40000 ALTER TABLE `room_types` DISABLE KEYS */;
INSERT INTO `room_types` VALUES (1,'Apartments',NULL),(2,'Hotels',NULL),(3,'Guest house',NULL),(4,'Hostels',NULL),(5,'Villa',NULL),(6,'Sanatorium',NULL);
/*!40000 ALTER TABLE `room_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `room_types_id` int unsigned NOT NULL,
  `hotels_id` int unsigned NOT NULL,
  `max_guests` smallint DEFAULT NULL,
  `smocking` bit(1) DEFAULT b'0' COMMENT '''0 - No Smocking | 1 - Smoke''',
  `feeding_types_id` int unsigned NOT NULL,
  `booking_rules_id` int unsigned NOT NULL,
  `daily_rate_RUB` decimal(20,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rooms_room_types1_idx` (`room_types_id`),
  KEY `fk_rooms_hotels1_idx` (`hotels_id`),
  KEY `fk_rooms_feeding_types1_idx` (`feeding_types_id`),
  KEY `fk_rooms_booking_rules1_idx` (`booking_rules_id`),
  CONSTRAINT `fk_rooms_booking_rules1` FOREIGN KEY (`booking_rules_id`) REFERENCES `booking_rules` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rooms_feeding_types1` FOREIGN KEY (`feeding_types_id`) REFERENCES `feeding_types` (`id`),
  CONSTRAINT `fk_rooms_hotels1` FOREIGN KEY (`hotels_id`) REFERENCES `hotels` (`id`),
  CONSTRAINT `fk_rooms_room_types1` FOREIGN KEY (`room_types_id`) REFERENCES `room_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'Полулюкс \"Дизайн\"',2,1,4,_binary '\0',3,1,8500.00),(2,'Бюджетный двухместный номер с 1 кроватью',2,1,2,_binary '',3,1,4200.00),(3,'Стандартный двухместный номер с 1 кроватью',2,1,2,_binary '',3,1,4700.00),(4,'Стандартный двухместный номер с 1 кроватью',2,2,3,_binary '\0',3,1,4550.00),(5,'Стандартный двухместный номер с 1 кроватью',2,2,3,_binary '\0',5,1,6100.00),(6,'Двухместный номер \"Премиум\"',2,2,3,_binary '\0',3,1,4750.00),(7,'Двухместный номер \"Премиум\"',2,2,3,_binary '\0',5,1,6350.00),(8,'Стандартный двухместный номер с 2 отдельными кроватями',2,3,3,_binary '\0',7,1,4550.00),(9,'Апартаменты с 1 спальней',1,4,3,_binary '',7,4,3200.00),(10,'Улучшенные номера с 2 спалнями',1,4,5,_binary '\0',7,4,4750.00),(11,'Апартаменты с 1 спальней',1,5,3,_binary '\0',7,4,9100.00),(12,'Апартаменты с 1 спальней',1,5,3,_binary '\0',7,1,9900.00),(13,'Апартаменты с 2 спальнями',1,5,4,_binary '\0',7,4,12200.00),(14,'Апартаменты с 2 спальнями',1,5,4,_binary '\0',7,1,13500.00),(15,'Номер \"Секстет\"',2,6,6,_binary '\0',7,4,19100.00),(16,'Номер \"Оркестр\"',2,6,7,_binary '\0',7,1,25350.00),(17,'Номер \"Поп-дуэт\"',2,6,2,_binary '',7,1,8400.00),(18,'Апартаменты с 2мя спальнями',1,7,3,_binary '\0',7,4,55000.00),(19,'Апартаменты с 2мя спальнями',1,7,4,_binary '',7,4,60000.00),(20,'Апартаменты с 2мя спальнями',1,7,5,_binary '\0',7,4,80000.00),(21,'Два двухместных номера с 1 двуспальной кроватью в каждом',2,7,3,_binary '\0',5,3,8400.00),(22,'Два двухместных номера с 1 двуспальной кроватью в каждом',2,7,2,_binary '\0',5,3,7400.00);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'my_booking'
--
/*!50003 DROP PROCEDURE IF EXISTS `bill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bill`(IN var_id INT)
BEGIN
	SELECT 
		b.id booking_id,
		b.customers_id,
		DATEDIFF(b.end_date, b.start_date) * r.daily_rate_RUB AS bill        
	FROM booking b LEFT JOIN rooms r ON r.id = b.rooms_id
    WHERE b.id = var_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `hotels_russia`
--

/*!50001 DROP VIEW IF EXISTS `hotels_russia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `hotels_russia` AS select `l`.`city_name` AS `city_name`,`h`.`name` AS `hotel_name`,`h`.`address` AS `hotel_address` from (`hotels` `h` left join `locations` `l` on((`l`.`id` = `h`.`locations_id`))) where (`l`.`country_code` = 643) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `min_price`
--

/*!50001 DROP VIEW IF EXISTS `min_price`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `min_price` AS select `r`.`name` AS `room_name`,`r`.`hotels_id` AS `hotel_id`,min(`r`.`daily_rate_RUB`) AS `min_price` from `rooms` `r` group by `hotel_id` having (`min_price` < 5000) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-04 14:16:49
