-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: warehousesdb
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'MAC'),(2,'ACER'),(3,'ASUS'),(4,'HP'),(5,'LENOVO'),(6,'SAMSUNG');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Ультрабук'),(2,'Ноутбук'),(3,'Планшет');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coming`
--

DROP TABLE IF EXISTS `coming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coming` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coming_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `com_product_id` int NOT NULL,
  `qty` decimal(10,3) NOT NULL DEFAULT '0.000',
  `com_warehouse_id` int NOT NULL,
  `com_supplier_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_com_product_idx` (`com_product_id`),
  KEY `FK_com_warehouse_idx` (`com_warehouse_id`),
  KEY `FK_com_supplier_idx` (`com_supplier_id`),
  CONSTRAINT `FK_product_com` FOREIGN KEY (`com_product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_supplier_com` FOREIGN KEY (`com_supplier_id`) REFERENCES `suppliers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_warehouse_com` FOREIGN KEY (`com_warehouse_id`) REFERENCES `warehouses` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coming`
--

LOCK TABLES `coming` WRITE;
/*!40000 ALTER TABLE `coming` DISABLE KEYS */;
INSERT INTO `coming` VALUES (1,'2022-02-05 09:45:49',1,150.000,1,NULL),(2,'2022-05-05 18:00:00',2,152.000,2,3),(3,'2022-04-05 18:00:00',3,162.000,3,NULL),(4,'2022-01-09 18:00:00',4,36.000,3,2),(5,'2022-01-14 18:00:00',5,45.000,2,1),(6,'2022-03-02 18:00:00',6,48.000,2,1),(7,'2022-04-09 18:00:00',9,56.000,1,3),(9,'2022-04-04 18:00:00',9,5.000,2,2),(10,'2022-07-05 18:00:00',9,6.000,2,1),(11,'2022-07-08 18:00:00',6,12.000,2,1),(12,'2022-05-05 18:00:00',9,15.000,3,2),(13,'2022-03-31 18:00:00',9,56.000,2,4);
/*!40000 ALTER TABLE `coming` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ex_product_id` int NOT NULL,
  `qty` decimal(10,3) NOT NULL DEFAULT '0.000',
  `ex_warehouse_id` int NOT NULL,
  `ex_supplier_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ex_product_idx` (`ex_product_id`),
  KEY `FK_ex_warehouse_idx` (`ex_warehouse_id`),
  KEY `FK_ex_supplier_idx` (`ex_supplier_id`),
  CONSTRAINT `FK_ex_product` FOREIGN KEY (`ex_product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ex_supplier` FOREIGN KEY (`ex_supplier_id`) REFERENCES `suppliers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ex_warehouse` FOREIGN KEY (`ex_warehouse_id`) REFERENCES `warehouses` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense`
--

LOCK TABLES `expense` WRITE;
/*!40000 ALTER TABLE `expense` DISABLE KEYS */;
INSERT INTO `expense` VALUES (1,'2022-06-02 18:00:00',1,152.000,1,3),(2,'2022-05-04 18:00:00',2,26.000,3,1),(3,'2022-09-05 18:00:00',3,26.000,3,NULL),(4,'2022-09-09 18:00:00',4,26.000,3,3),(5,'2022-05-04 18:00:00',2,15.000,2,2),(6,'2022-06-05 18:00:00',2,156.000,1,4);
/*!40000 ALTER TABLE `expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `brand_id` int DEFAULT NULL,
  `product` varchar(45) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_category_idx` (`category_id`),
  KEY `FK_brand_idx` (`brand_id`),
  CONSTRAINT `FK_brand` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,2,3,'Vivibook HDD 1T, 7200 rpm',''),(2,1,5,'Хромбук Lenovo Chromebook 300e',''),(3,1,2,'TravelMate NVD118',''),(4,1,3,'ASUS E140MA',''),(5,1,3,'Ultrabook ASUS VIVOBOOK L510',''),(6,1,4,'PAVILION x360',''),(7,2,5,'V14 Celeron',''),(8,2,2,'Extensa Ex2215',''),(9,2,5,'V15-82C3',''),(10,2,2,'V114-82 Celeron DC',''),(11,2,2,'A315 Intel DualCore',''),(12,2,4,'HP 240 G8',''),(13,2,1,'AirMac 15',''),(14,3,3,'Transformer Book T300',''),(15,3,6,'Surface Pro 8PV',''),(16,3,NULL,'Expenta',NULL),(17,2,NULL,'Bilbo',NULL),(18,2,NULL,'Bilbo',NULL),(19,2,NULL,'V15-82C3',''),(20,3,NULL,'Expert',NULL),(21,2,NULL,'Expert','ex'),(22,2,5,'expert',NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Inter.kg'),(2,'Notnik.kg'),(3,'Istore.kg'),(4,'Guangou');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `warehouse` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouses`
--

LOCK TABLES `warehouses` WRITE;
/*!40000 ALTER TABLE `warehouses` DISABLE KEYS */;
INSERT INTO `warehouses` VALUES (1,'Склад №1'),(2,'Склад №2'),(3,'Склад №3'),(4,'Склад №4');
/*!40000 ALTER TABLE `warehouses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-05 18:39:02
