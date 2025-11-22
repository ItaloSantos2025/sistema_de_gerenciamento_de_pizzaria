CREATE DATABASE  IF NOT EXISTS `sistema_pizzaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sistema_pizzaria`;
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
-- Table structure for table `bebidas_cardapio`
--

DROP TABLE IF EXISTS `bebidas_cardapio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bebidas_cardapio` (
  `Cod_Bebida` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) DEFAULT NULL,
  `Preco` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Cod_Bebida`),
  UNIQUE KEY `Nome` (`Nome`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bebidas_cardapio`
--

LOCK TABLES `bebidas_cardapio` WRITE;
/*!40000 ALTER TABLE `bebidas_cardapio` DISABLE KEYS */;
INSERT INTO `bebidas_cardapio` VALUES (1,'Coca-Cola 2L',10.00),(2,'Guaraná 1L',7.00),(3,'Água com Gás',4.00),(4,'Suco de Laranja 1L',8.00);
/*!40000 ALTER TABLE `bebidas_cardapio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ceps`
--

DROP TABLE IF EXISTS `ceps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ceps` (
  `CEP` varchar(9) NOT NULL,
  `Logradouro` varchar(255) DEFAULT NULL,
  `Bairro` varchar(100) DEFAULT NULL,
  `Cidade` varchar(100) DEFAULT NULL,
  `Estado` char(2) DEFAULT NULL,
  PRIMARY KEY (`CEP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceps`
--

LOCK TABLES `ceps` WRITE;
/*!40000 ALTER TABLE `ceps` DISABLE KEYS */;
INSERT INTO `ceps` VALUES ('55600-000','Avenida Agamenon Magalhães','Centro','Vitória de Santo Antão','PE'),('55600-111','Rua das Flores','Centro','Vitória de Santo Antão','PE'),('55602-123','Rua da Matriz','Livramento','Vitória de Santo Antão','PE'),('55608-000','Avenida Mariana Amália','Universitário','Vitória de Santo Antão','PE'),('55612-000','Rua dos Prazeres','Lídia Queiroz','Vitória de Santo Antão','PE');
/*!40000 ALTER TABLE `ceps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `Cod_Cliente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) DEFAULT NULL,
  `CEP` varchar(9) DEFAULT NULL,
  `Numero` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Cod_Cliente`),
  KEY `CEP` (`CEP`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`CEP`) REFERENCES `ceps` (`CEP`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'João Silva','55600-111','10'),(2,'Maria Oliveira','55608-000','220'),(3,'Carlos Pereira','55612-000','305'),(4,'Ana Costa','55600-111','42'),(5,'Pedro Souza','55602-123','99'),(6,'Ana Beatriz','55608-000','150'),(7,'ClienteLote1','55600-000','S/N'),(8,'ClienteLote2','55600-000','S/N'),(9,'ClienteLote3','55600-000','S/N'),(10,'ClienteLote4','55600-000','S/N'),(11,'ClienteLote5','55600-000','S/N'),(12,'ClienteLote6','55600-000','S/N'),(13,'ClienteLote7','55600-000','S/N'),(14,'ClienteLote8','55600-000','S/N'),(15,'ClienteLote9','55600-000','S/N'),(16,'ClienteLote10','55600-000','S/N');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientes` (
  `Cod_Ingrediente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cod_Ingrediente`),
  UNIQUE KEY `Nome` (`Nome`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` VALUES (5,'Azeitona Preta'),(3,'Calabresa Fatiada'),(4,'Cebola'),(7,'Frango Desfiado'),(10,'Manjericão Fresco'),(9,'Milho'),(1,'Molho de Tomate'),(6,'Orégano'),(2,'Queijo Mussarela'),(8,'Requeijão Cremoso (Catupiry)');
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_bebidas`
--

DROP TABLE IF EXISTS `pedido_bebidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_bebidas` (
  `Cod_Pedido` int NOT NULL,
  `Cod_Bebida` int NOT NULL,
  `Quantidade` int DEFAULT NULL,
  `Preco_Venda` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Cod_Pedido`,`Cod_Bebida`),
  KEY `Cod_Bebida` (`Cod_Bebida`),
  CONSTRAINT `pedido_bebidas_ibfk_1` FOREIGN KEY (`Cod_Pedido`) REFERENCES `pedidos` (`Cod_Pedido`) ON DELETE CASCADE,
  CONSTRAINT `pedido_bebidas_ibfk_2` FOREIGN KEY (`Cod_Bebida`) REFERENCES `bebidas_cardapio` (`Cod_Bebida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_bebidas`
--

LOCK TABLES `pedido_bebidas` WRITE;
/*!40000 ALTER TABLE `pedido_bebidas` DISABLE KEYS */;
INSERT INTO `pedido_bebidas` VALUES (1,1,1,10.00),(3,2,2,14.00),(4,3,1,4.00),(5,4,1,8.00);
/*!40000 ALTER TABLE `pedido_bebidas` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `Cod_Pedido` int NOT NULL AUTO_INCREMENT,
  `Data_Hora` datetime DEFAULT CURRENT_TIMESTAMP,
  `Cod_Cliente` int DEFAULT NULL,
  `CNPJ_Pizzaria` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`Cod_Pedido`),
  KEY `Cod_Cliente` (`Cod_Cliente`),
  KEY `CNPJ_Pizzaria` (`CNPJ_Pizzaria`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`Cod_Cliente`) REFERENCES `clientes` (`Cod_Cliente`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`CNPJ_Pizzaria`) REFERENCES `pizzaria` (`CNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'2025-09-08 17:10:51',1,'11.111.111/0001-11'),(2,'2025-09-08 17:10:51',2,'22.222.222/0001-22'),(3,'2025-09-08 17:10:51',1,'22.222.222/0001-22'),(4,'2025-09-08 17:10:51',3,'11.111.111/0001-11'),(5,'2025-09-08 17:10:51',4,'11.111.111/0001-11');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_ingredientes`
--

DROP TABLE IF EXISTS `pizza_ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_ingredientes` (
  `Cod_Pizza` int NOT NULL,
  `Cod_Ingrediente` int NOT NULL,
  PRIMARY KEY (`Cod_Pizza`,`Cod_Ingrediente`),
  KEY `Cod_Ingrediente` (`Cod_Ingrediente`),
  CONSTRAINT `pizza_ingredientes_ibfk_1` FOREIGN KEY (`Cod_Pizza`) REFERENCES `pizzas_cardapio` (`Cod_Pizza`) ON DELETE CASCADE,
  CONSTRAINT `pizza_ingredientes_ibfk_2` FOREIGN KEY (`Cod_Ingrediente`) REFERENCES `ingredientes` (`Cod_Ingrediente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_ingredientes`
--

LOCK TABLES `pizza_ingredientes` WRITE;
/*!40000 ALTER TABLE `pizza_ingredientes` DISABLE KEYS */;
INSERT INTO `pizza_ingredientes` VALUES (1,1),(2,1),(3,1),(4,1),(1,2),(2,2),(3,2),(4,2),(1,3),(1,4),(4,4),(4,5),(1,6),(2,6),(3,6),(4,6),(2,7),(2,8),(3,10);
/*!40000 ALTER TABLE `pizza_ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzaria`
--

DROP TABLE IF EXISTS `pizzaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzaria` (
  `CNPJ` varchar(18) NOT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `CEP` varchar(9) DEFAULT NULL,
  `Numero` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CNPJ`),
  KEY `CEP` (`CEP`),
  CONSTRAINT `pizzaria_ibfk_1` FOREIGN KEY (`CEP`) REFERENCES `ceps` (`CEP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzaria`
--

LOCK TABLES `pizzaria` WRITE;
/*!40000 ALTER TABLE `pizzaria` DISABLE KEYS */;
INSERT INTO `pizzaria` VALUES ('11.111.111/0001-11','Pizza Express','55600-000','123'),('22.222.222/0001-22','Cantina da Mama','55602-123','456');
/*!40000 ALTER TABLE `pizzaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzas_cardapio`
--

DROP TABLE IF EXISTS `pizzas_cardapio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzas_cardapio` (
  `Cod_Pizza` int NOT NULL AUTO_INCREMENT,
  `Sabor` varchar(100) DEFAULT NULL,
  `Preco_Base` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Cod_Pizza`),
  UNIQUE KEY `Sabor` (`Sabor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzas_cardapio`
--

LOCK TABLES `pizzas_cardapio` WRITE;
/*!40000 ALTER TABLE `pizzas_cardapio` DISABLE KEYS */;
INSERT INTO `pizzas_cardapio` VALUES (1,'Calabresa',35.00),(2,'Frango com Catupiry',45.00),(3,'Marguerita',38.00),(4,'Portuguesa',42.00);
/*!40000 ALTER TABLE `pizzas_cardapio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone_cliente`
--

DROP TABLE IF EXISTS `telefone_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone_cliente` (
  `Cod_Cliente` int NOT NULL,
  `Telefone` varchar(20) NOT NULL,
  PRIMARY KEY (`Cod_Cliente`,`Telefone`),
  CONSTRAINT `telefone_cliente_ibfk_1` FOREIGN KEY (`Cod_Cliente`) REFERENCES `clientes` (`Cod_Cliente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone_cliente`
--

LOCK TABLES `telefone_cliente` WRITE;
/*!40000 ALTER TABLE `telefone_cliente` DISABLE KEYS */;
INSERT INTO `telefone_cliente` VALUES (1,'(81) 99999-1010'),(2,'(81) 98888-2020'),(3,'(81) 97777-3030'),(4,'(81) 95555-4041'),(4,'(81) 96666-4040'),(5,'(81) 94444-5050');
/*!40000 ALTER TABLE `telefone_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone_pizzaria`
--

DROP TABLE IF EXISTS `telefone_pizzaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone_pizzaria` (
  `CNPJ` varchar(18) NOT NULL,
  `Telefone` varchar(20) NOT NULL,
  PRIMARY KEY (`CNPJ`,`Telefone`),
  CONSTRAINT `telefone_pizzaria_ibfk_1` FOREIGN KEY (`CNPJ`) REFERENCES `pizzaria` (`CNPJ`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone_pizzaria`
--

LOCK TABLES `telefone_pizzaria` WRITE;
/*!40000 ALTER TABLE `telefone_pizzaria` DISABLE KEYS */;
INSERT INTO `telefone_pizzaria` VALUES ('11.111.111/0001-11','(81) 3523-1111'),('11.111.111/0001-11','(81) 98888-1111'),('22.222.222/0001-22','(81) 3523-2222');
/*!40000 ALTER TABLE `telefone_pizzaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_cardapio_pizzas`
--

DROP TABLE IF EXISTS `vw_cardapio_pizzas`;
/*!50001 DROP VIEW IF EXISTS `vw_cardapio_pizzas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_cardapio_pizzas` AS SELECT 
 1 AS `Cod_Pizza`,
 1 AS `Sabor`,
 1 AS `Preco_Base`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_igredientes_completo`
--

DROP TABLE IF EXISTS `vw_igredientes_completo`;
/*!50001 DROP VIEW IF EXISTS `vw_igredientes_completo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_igredientes_completo` AS SELECT 
 1 AS `Sabor da Pizza`,
 1 AS `Preço Base (R$)`,
 1 AS `Ingredientes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ingredientes_com_tamanho`
--

DROP TABLE IF EXISTS `vw_ingredientes_com_tamanho`;
/*!50001 DROP VIEW IF EXISTS `vw_ingredientes_com_tamanho`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ingredientes_com_tamanho` AS SELECT 
 1 AS `Código`,
 1 AS `Nome Minúsculo`,
 1 AS `Tamanho do Nome (Caracteres)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_pedidos_formatados_simples`
--

DROP TABLE IF EXISTS `vw_pedidos_formatados_simples`;
/*!50001 DROP VIEW IF EXISTS `vw_pedidos_formatados_simples`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_pedidos_formatados_simples` AS SELECT 
 1 AS `Código do Pedido`,
 1 AS `Data e Hora`,
 1 AS `Cliente Identificado`,
 1 AS `Pizzaria do Pedido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_telefones_pizzaria`
--

DROP TABLE IF EXISTS `vw_telefones_pizzaria`;
/*!50001 DROP VIEW IF EXISTS `vw_telefones_pizzaria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_telefones_pizzaria` AS SELECT 
 1 AS `Nome da Pizzaria`,
 1 AS `CNPJ`,
 1 AS `Telefone de Contato`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'sistema_pizzaria_normalizacao'
--

--
-- Dumping routines for database 'sistema_pizzaria_normalizacao'
--
/*!50003 DROP FUNCTION IF EXISTS `FN_Contar_Clientes_Por_CEP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_Contar_Clientes_Por_CEP`(
    p_CEP VARCHAR(9)
) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE v_Total_Clientes INT;

    SELECT COUNT(Cod_Cliente)
    INTO v_Total_Clientes
    FROM clientes
    WHERE CEP = p_CEP;

    RETURN v_Total_Clientes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_Nome_Pizzaria_Por_CNPJ` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_Nome_Pizzaria_Por_CNPJ`(
    p_CNPJ VARCHAR(18)
) RETURNS varchar(255) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE v_Nome VARCHAR(255);

    SELECT Nome
    INTO v_Nome
    FROM pizzaria
    WHERE CNPJ = p_CNPJ;

    RETURN COALESCE(v_Nome, 'Pizzaria Não Encontrada');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_Obter_Preco_Bebida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_Obter_Preco_Bebida`(
    p_Cod_Bebida INT
) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE v_Preco DECIMAL(10, 2);

    SELECT Preco
    INTO v_Preco
    FROM bebidas_cardapio
    WHERE Cod_Bebida = p_Cod_Bebida;

    RETURN COALESCE(v_Preco, 0.00);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AdicionarTaxaEntrega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarTaxaEntrega`(
    INOUT p_ValorTotal DECIMAL(10, 2) -- ENTRA com um valor, SAI com ele modificado
)
BEGIN
    -- Define a taxa de entrega fixa
    DECLARE v_TaxaFixa DECIMAL(10, 2);
    SET v_TaxaFixa = 5.00;

    -- Pega o valor que ENTROU (p_ValorTotal)
    -- Soma a taxa fixa nele
    -- E atualiza a MESMA variável (p_ValorTotal) para SAIR com o novo valor
    SET p_ValorTotal = p_ValorTotal + v_TaxaFixa;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CadastrarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CadastrarCliente`(
    IN p_Nome VARCHAR(255),
    IN p_CEP VARCHAR(9),
    IN p_Numero VARCHAR(10)
)
BEGIN
    -- Comando SQL que será executado
    INSERT INTO clientes (Nome, CEP, Numero)
    VALUES (p_Nome, p_CEP, p_Numero);

    -- Opcional: Retorna o ID do cliente que acabou de ser inserido
    SELECT LAST_INSERT_ID() AS Novo_Cod_Cliente;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ConsultarPrecoPizza` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ConsultarPrecoPizza`(
    IN p_NomeSabor VARCHAR(100),   -- Parâmetro de ENTRADA
    OUT p_Preco DECIMAL(10, 2)     -- Parâmetro de SAÍDA
)
BEGIN
    -- Busca o 'Preco_Base' na tabela 'pizzas_cardapio'
    -- Onde o 'Sabor' for igual ao nome que recebemos (p_NomeSabor)
    -- e armazena o resultado no parâmetro de saída (p_Preco)
    SELECT Preco_Base
    INTO p_Preco
    FROM pizzas_cardapio
    WHERE Sabor = p_NomeSabor;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ContarPizzasNoCardapio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ContarPizzasNoCardapio`(
    OUT p_Total_Sabores INT  -- O parâmetro de SAÍDA para guardar o número
)
BEGIN
    -- Conta o número total de linhas (sabores) na tabela 'pizzas_cardapio'
    -- e armazena o resultado no parâmetro de saída 'p_Total_Sabores'
    SELECT COUNT(*)
    INTO p_Total_Sabores
    FROM pizzas_cardapio;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InserirClientesEmLote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InserirClientesEmLote`(
    IN p_NomeBase VARCHAR(200) -- O único dado de entrada
)
BEGIN
    -- 1. Criamos um contador
    DECLARE v_contador INT;
    SET v_contador = 1;

    -- 2. Criamos um loop que vai rodar 10 vezes
    WHILE v_contador <= 10 DO

        -- 3. Dentro do loop, nós inserimos o cliente
        INSERT INTO clientes (Nome, CEP, Numero)
        VALUES (
            CONCAT(p_NomeBase, v_contador),  -- Ex: 'Cliente Teste' + '1' = 'Cliente Teste1'
            '55600-000',  -- Nosso "CEP Padrão" (precisa existir na tabela ceps)
            'S/N'         -- Nosso "Número Padrão" (Sem Número)
        );

        -- 4. Incrementamos o contador para o loop continuar
        SET v_contador = v_contador + 1;

    END WHILE;

    -- Opcional: Mostra uma mensagem de sucesso
    SELECT '10 clientes inseridos com sucesso!' AS Resultado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_cardapio_pizzas`
--

/*!50001 DROP VIEW IF EXISTS `vw_cardapio_pizzas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cardapio_pizzas` AS select `pizzas_cardapio`.`Cod_Pizza` AS `Cod_Pizza`,`pizzas_cardapio`.`Sabor` AS `Sabor`,`pizzas_cardapio`.`Preco_Base` AS `Preco_Base` from `pizzas_cardapio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_igredientes_completo`
--

/*!50001 DROP VIEW IF EXISTS `vw_igredientes_completo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_igredientes_completo` AS select `pc`.`Sabor` AS `Sabor da Pizza`,`pc`.`Preco_Base` AS `Preço Base (R$)`,group_concat(`i`.`Nome` order by `i`.`Nome` ASC separator ', ') AS `Ingredientes` from ((`pizzas_cardapio` `pc` join `pizza_ingredientes` `pi` on((`pc`.`Cod_Pizza` = `pi`.`Cod_Pizza`))) join `ingredientes` `i` on((`pi`.`Cod_Ingrediente` = `i`.`Cod_Ingrediente`))) group by `pc`.`Sabor`,`pc`.`Preco_Base` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ingredientes_com_tamanho`
--

/*!50001 DROP VIEW IF EXISTS `vw_ingredientes_com_tamanho`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ingredientes_com_tamanho` AS select `ingredientes`.`Cod_Ingrediente` AS `Código`,lower(`ingredientes`.`Nome`) AS `Nome Minúsculo`,length(`ingredientes`.`Nome`) AS `Tamanho do Nome (Caracteres)` from `ingredientes` order by 'Tamanho do Nome (Caracteres)' desc,`ingredientes`.`Nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_pedidos_formatados_simples`
--

/*!50001 DROP VIEW IF EXISTS `vw_pedidos_formatados_simples`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pedidos_formatados_simples` AS select `p`.`Cod_Pedido` AS `Código do Pedido`,date_format(`p`.`Data_Hora`,'%d/%m/%Y %H:%i') AS `Data e Hora`,concat(`c`.`Nome`,' (Cod:',`c`.`Cod_Cliente`,')') AS `Cliente Identificado`,`pz`.`Nome` AS `Pizzaria do Pedido` from ((`pedidos` `p` join `clientes` `c` on((`p`.`Cod_Cliente` = `c`.`Cod_Cliente`))) join `pizzaria` `pz` on((`p`.`CNPJ_Pizzaria` = `pz`.`CNPJ`))) order by `p`.`Cod_Pedido` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_telefones_pizzaria`
--

/*!50001 DROP VIEW IF EXISTS `vw_telefones_pizzaria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_telefones_pizzaria` AS select `pz`.`Nome` AS `Nome da Pizzaria`,`pz`.`CNPJ` AS `CNPJ`,`tp`.`Telefone` AS `Telefone de Contato` from (`pizzaria` `pz` join `telefone_pizzaria` `tp` on((`pz`.`CNPJ` = `tp`.`CNPJ`))) order by `pz`.`Nome`,`tp`.`Telefone` */;
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

-- Dump completed on 2025-11-21 16:30:28
