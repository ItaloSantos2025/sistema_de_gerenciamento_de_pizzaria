CREATE DATABASE  IF NOT EXISTS `sistema_pizzaria_normalizacao` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sistema_pizzaria_normalizacao`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_pizzaria_normalizacao
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `pedido_pizzas`
--

DROP TABLE IF EXISTS `pedido_pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_pizzas` (
  `Cod_Pedido` int NOT NULL,
  `Cod_Pizza` int NOT NULL,
  `Quantidade` int DEFAULT NULL,
  `Preco_Venda` decimal(10,2) DEFAULT NULL,
  `Borda` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cod_Pedido`,`Cod_Pizza`),
  KEY `Cod_Pizza` (`Cod_Pizza`),
  CONSTRAINT `pedido_pizzas_ibfk_1` FOREIGN KEY (`Cod_Pedido`) REFERENCES `pedidos` (`Cod_Pedido`) ON DELETE CASCADE,
  CONSTRAINT `pedido_pizzas_ibfk_2` FOREIGN KEY (`Cod_Pizza`) REFERENCES `pizzas_cardapio` (`Cod_Pizza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_pizzas`
--

LOCK TABLES `pedido_pizzas` WRITE;
/*!40000 ALTER TABLE `pedido_pizzas` DISABLE KEYS */;
INSERT INTO `pedido_pizzas` VALUES (1,1,1,35.00,'Tradicional'),(2,2,1,45.00,'Recheada'),(2,3,1,38.00,'Tradicional'),(3,1,2,70.00,'Recheada'),(4,4,1,42.00,'Tradicional');
/*!40000 ALTER TABLE `pedido_pizzas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-08 17:22:39
