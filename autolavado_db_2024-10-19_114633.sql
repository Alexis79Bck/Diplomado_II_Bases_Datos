-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: autolavado_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `sexo` char(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_registro` date NOT NULL,
  `fecha_ultima_visita` date NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` text NOT NULL,
  `total_visita` int(11) NOT NULL,
  `total_visita_promo` int(11) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

--
-- Table structure for table `clientes_vehiculos`
--

DROP TABLE IF EXISTS `clientes_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes_vehiculos` (
  `cedula_cliente` varchar(10) NOT NULL,
  `placa_vehiculo` varchar(10) NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`cedula_cliente`,`placa_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes_vehiculos`
--

/*!40000 ALTER TABLE `clientes_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes_vehiculos` ENABLE KEYS */;

--
-- Table structure for table `conductores`
--

DROP TABLE IF EXISTS `conductores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conductores` (
  `cedula` varchar(10) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conductores`
--

/*!40000 ALTER TABLE `conductores` DISABLE KEYS */;
/*!40000 ALTER TABLE `conductores` ENABLE KEYS */;

--
-- Table structure for table `conductores_servicios_vehiculo`
--

DROP TABLE IF EXISTS `conductores_servicios_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conductores_servicios_vehiculo` (
  `cedula_conductor` varchar(10) NOT NULL,
  `placa_vehiculo` varchar(10) NOT NULL,
  `servicio_id` int(11) NOT NULL,
  `hora_entrada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hora_salida` timestamp NULL DEFAULT current_timestamp(),
  `condiciones_entrada_vehiculo` text NOT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`cedula_conductor`,`placa_vehiculo`,`servicio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conductores_servicios_vehiculo`
--

/*!40000 ALTER TABLE `conductores_servicios_vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `conductores_servicios_vehiculo` ENABLE KEYS */;

--
-- Table structure for table `conductores_vehiculos`
--

DROP TABLE IF EXISTS `conductores_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conductores_vehiculos` (
  `cedula_conductor` varchar(10) NOT NULL,
  `placa_vehiculo` varchar(10) NOT NULL,
  PRIMARY KEY (`cedula_conductor`,`placa_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conductores_vehiculos`
--

/*!40000 ALTER TABLE `conductores_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `conductores_vehiculos` ENABLE KEYS */;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `cedula` varchar(10) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `calificacion` tinyint(4) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;

--
-- Table structure for table `empleados_servicios`
--

DROP TABLE IF EXISTS `empleados_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados_servicios` (
  `cedula_empleado` varchar(10) NOT NULL,
  `servicio_id` int(11) NOT NULL,
  `calificacion` tinyint(4) NOT NULL,
  `cantidad_servicio_prestado` int(11) NOT NULL,
  PRIMARY KEY (`cedula_empleado`,`servicio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados_servicios`
--

/*!40000 ALTER TABLE `empleados_servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados_servicios` ENABLE KEYS */;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `duracion` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `descuento` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Lavado completo','Lavado exterior e interior del vehículo',60,30,8),(2,'Limpiar Prabrisas','Limpieza general del prabrisa frontal',15,21,5),(3,'Pulido de Carroceria completo','Pulido de la corroceria',60,45,10);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos` (
  `placa` varchar(10) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `color` varchar(30) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `observacion` text NOT NULL,
  PRIMARY KEY (`placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;

--
-- Dumping routines for database 'autolavado_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-19 11:46:58
