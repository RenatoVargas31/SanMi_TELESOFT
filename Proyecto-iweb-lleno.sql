-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto-iweb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `criticidadincidencia`
--

DROP TABLE IF EXISTS `criticidadincidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `criticidadincidencia` (
  `idCriticidadIncidencia` int NOT NULL AUTO_INCREMENT,
  `nameCriticidad` varchar(100) NOT NULL,
  PRIMARY KEY (`idCriticidadIncidencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criticidadincidencia`
--

LOCK TABLES `criticidadincidencia` WRITE;
/*!40000 ALTER TABLE `criticidadincidencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `criticidadincidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadoevento`
--

DROP TABLE IF EXISTS `estadoevento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadoevento` (
  `idEstadoEvento` int NOT NULL AUTO_INCREMENT,
  `nameEstado` varchar(100) NOT NULL,
  PRIMARY KEY (`idEstadoEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoevento`
--

LOCK TABLES `estadoevento` WRITE;
/*!40000 ALTER TABLE `estadoevento` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadoevento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadoincidencia`
--

DROP TABLE IF EXISTS `estadoincidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadoincidencia` (
  `idEstadoIncidencia` int NOT NULL,
  `nameEstado` varchar(100) NOT NULL,
  PRIMARY KEY (`idEstadoIncidencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoincidencia`
--

LOCK TABLES `estadoincidencia` WRITE;
/*!40000 ALTER TABLE `estadoincidencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadoincidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `idEventos` int NOT NULL AUTO_INCREMENT,
  `nombreEvento` varchar(100) NOT NULL,
  `fotosStart` longblob NOT NULL,
  `descriptionEvento` varchar(255) NOT NULL,
  `vacantesDisp` int NOT NULL,
  `lugarEvento` varchar(100) NOT NULL,
  `fechaEventoStart` date NOT NULL,
  `fechaEventoEnd` date NOT NULL,
  `horaEventoStart` time NOT NULL,
  `horaEventoEnd` time NOT NULL,
  `materialesEvento` varchar(255) DEFAULT NULL,
  `Profesores_idProfesores` int DEFAULT NULL,
  `fotosEnd` longblob,
  `TipoEvento_idTipoEvento` int NOT NULL,
  `FrecuenciaEvento_idFrecuenciaEvento` int NOT NULL,
  `EstadoEvento_idEstadoEvento` int NOT NULL,
  `asistenciaCoordi` tinyint DEFAULT NULL,
  `asistenciaLlegada` time DEFAULT NULL,
  `asistenciaSalida` time DEFAULT NULL,
  PRIMARY KEY (`idEventos`),
  KEY `fk_Eventos_Profesores1_idx` (`Profesores_idProfesores`),
  KEY `fk_Eventos_TipoEvento1_idx` (`TipoEvento_idTipoEvento`),
  KEY `fk_Eventos_FrecuenciaEvento1_idx` (`FrecuenciaEvento_idFrecuenciaEvento`),
  KEY `fk_Eventos_EstadoEvento1_idx` (`EstadoEvento_idEstadoEvento`),
  CONSTRAINT `fk_Eventos_EstadoEvento1` FOREIGN KEY (`EstadoEvento_idEstadoEvento`) REFERENCES `estadoevento` (`idEstadoEvento`),
  CONSTRAINT `fk_Eventos_FrecuenciaEvento1` FOREIGN KEY (`FrecuenciaEvento_idFrecuenciaEvento`) REFERENCES `frecuenciaevento` (`idFrecuenciaEvento`),
  CONSTRAINT `fk_Eventos_Profesores1` FOREIGN KEY (`Profesores_idProfesores`) REFERENCES `profesores` (`idProfesores`),
  CONSTRAINT `fk_Eventos_TipoEvento1` FOREIGN KEY (`TipoEvento_idTipoEvento`) REFERENCES `tipoevento` (`idTipoEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frecuenciaevento`
--

DROP TABLE IF EXISTS `frecuenciaevento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frecuenciaevento` (
  `idFrecuenciaEvento` int NOT NULL AUTO_INCREMENT,
  `frecuenciaTipo` varchar(100) NOT NULL,
  `day1` date NOT NULL,
  `day2` date DEFAULT NULL,
  PRIMARY KEY (`idFrecuenciaEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frecuenciaevento`
--

LOCK TABLES `frecuenciaevento` WRITE;
/*!40000 ALTER TABLE `frecuenciaevento` DISABLE KEYS */;
/*!40000 ALTER TABLE `frecuenciaevento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidencias`
--

DROP TABLE IF EXISTS `incidencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidencias` (
  `idIncidencias` int NOT NULL AUTO_INCREMENT,
  `nombreIncidencia` varchar(100) NOT NULL,
  `lugarExacto` varchar(100) NOT NULL,
  `referenciaIncidencia` varchar(255) NOT NULL,
  `fotoIncidencia` longblob NOT NULL,
  `victimaIncidencia` varchar(100) NOT NULL,
  `contactoIncidencia` int DEFAULT NULL,
  `requiereAmbulancia` tinyint DEFAULT NULL,
  `requierePolicia` tinyint DEFAULT NULL,
  `requiereBombero` tinyint DEFAULT NULL,
  `descriptionSolucion` varchar(225) DEFAULT NULL,
  `Serenazgos_idSerenazgos` int DEFAULT NULL,
  `personalAmbulancia_idpersonalAmbulancia` int DEFAULT NULL,
  `Usuarios_idUsuarios` int NOT NULL,
  `EstadoIncidencia_idEstadoIncidencia` int NOT NULL,
  `CriticidadIncidencia_idCriticidadIncidencia` int DEFAULT NULL,
  `TipoIncidencia_idTipoIncidencia` int NOT NULL,
  PRIMARY KEY (`idIncidencias`),
  KEY `fk_Incidencias_Serenazgos1_idx` (`Serenazgos_idSerenazgos`),
  KEY `fk_Incidencias_personalAmbulancia1_idx` (`personalAmbulancia_idpersonalAmbulancia`),
  KEY `fk_Incidencias_Usuarios1_idx` (`Usuarios_idUsuarios`),
  KEY `fk_Incidencias_EstadoIncidencia1_idx` (`EstadoIncidencia_idEstadoIncidencia`),
  KEY `fk_Incidencias_CriticidadIncidencia1_idx` (`CriticidadIncidencia_idCriticidadIncidencia`),
  KEY `fk_Incidencias_TipoIncidencia1_idx` (`TipoIncidencia_idTipoIncidencia`),
  CONSTRAINT `fk_Incidencias_CriticidadIncidencia1` FOREIGN KEY (`CriticidadIncidencia_idCriticidadIncidencia`) REFERENCES `criticidadincidencia` (`idCriticidadIncidencia`),
  CONSTRAINT `fk_Incidencias_EstadoIncidencia1` FOREIGN KEY (`EstadoIncidencia_idEstadoIncidencia`) REFERENCES `estadoincidencia` (`idEstadoIncidencia`),
  CONSTRAINT `fk_Incidencias_personalAmbulancia1` FOREIGN KEY (`personalAmbulancia_idpersonalAmbulancia`) REFERENCES `personalambulancia` (`idpersonalAmbulancia`),
  CONSTRAINT `fk_Incidencias_Serenazgos1` FOREIGN KEY (`Serenazgos_idSerenazgos`) REFERENCES `serenazgos` (`idSerenazgos`),
  CONSTRAINT `fk_Incidencias_TipoIncidencia1` FOREIGN KEY (`TipoIncidencia_idTipoIncidencia`) REFERENCES `tipoincidencia` (`idTipoIncidencia`),
  CONSTRAINT `fk_Incidencias_Usuarios1` FOREIGN KEY (`Usuarios_idUsuarios`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidencias`
--

LOCK TABLES `incidencias` WRITE;
/*!40000 ALTER TABLE `incidencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `incidencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalambulancia`
--

DROP TABLE IF EXISTS `personalambulancia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personalambulancia` (
  `idpersonalAmbulancia` int NOT NULL AUTO_INCREMENT,
  `nombrePersonal` varchar(100) NOT NULL,
  `apellidoPersonal` varchar(100) NOT NULL,
  `dniPersonal` varchar(8) NOT NULL,
  `turnoAmbulancia` varchar(100) NOT NULL,
  PRIMARY KEY (`idpersonalAmbulancia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalambulancia`
--

LOCK TABLES `personalambulancia` WRITE;
/*!40000 ALTER TABLE `personalambulancia` DISABLE KEYS */;
/*!40000 ALTER TABLE `personalambulancia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores` (
  `idProfesores` int NOT NULL AUTO_INCREMENT,
  `nombreProfesor` varchar(100) NOT NULL,
  `apellidoProfesor` varchar(100) NOT NULL,
  `dniProfesor` varchar(8) NOT NULL,
  `tipoProfesor` varchar(100) NOT NULL,
  `cursoProfesor` varchar(100) NOT NULL,
  PRIMARY KEY (`idProfesores`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,'Mariano','Salazar','31687543','Cultura','Historia'),(2,'Ana','Paz','31678954','Deporte','Karate'),(3,'Manuel ','Yarlequé','31784312','Cultura','PREM'),(4,'Alex','Brocca','32567489','Deporte','Atletismo');
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `idRoles` int NOT NULL AUTO_INCREMENT,
  `nameRol` varchar(100) NOT NULL,
  PRIMARY KEY (`idRoles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serenazgos`
--

DROP TABLE IF EXISTS `serenazgos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serenazgos` (
  `idSerenazgos` int NOT NULL AUTO_INCREMENT,
  `nombreSereno` varchar(100) NOT NULL,
  `apellidoSereno` varchar(100) NOT NULL,
  `dniSereno` varchar(8) NOT NULL,
  `turnoSereno` varchar(100) NOT NULL,
  `direccionSereno` varchar(100) NOT NULL,
  `telefonoSereno` varchar(9) NOT NULL,
  `TipoSereno_idTipoSereno` int NOT NULL,
  PRIMARY KEY (`idSerenazgos`),
  KEY `fk_Serenazgos_TipoSereno1_idx` (`TipoSereno_idTipoSereno`),
  CONSTRAINT `fk_Serenazgos_TipoSereno1` FOREIGN KEY (`TipoSereno_idTipoSereno`) REFERENCES `tiposereno` (`idTipoSereno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serenazgos`
--

LOCK TABLES `serenazgos` WRITE;
/*!40000 ALTER TABLE `serenazgos` DISABLE KEYS */;
/*!40000 ALTER TABLE `serenazgos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocoordinadora`
--

DROP TABLE IF EXISTS `tipocoordinadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipocoordinadora` (
  `idTipoCoordinadora` int NOT NULL AUTO_INCREMENT,
  `nameTipo` varchar(100) NOT NULL,
  PRIMARY KEY (`idTipoCoordinadora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocoordinadora`
--

LOCK TABLES `tipocoordinadora` WRITE;
/*!40000 ALTER TABLE `tipocoordinadora` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipocoordinadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoevento`
--

DROP TABLE IF EXISTS `tipoevento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoevento` (
  `idTipoEvento` int NOT NULL,
  `nameTipo` varchar(100) NOT NULL,
  PRIMARY KEY (`idTipoEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoevento`
--

LOCK TABLES `tipoevento` WRITE;
/*!40000 ALTER TABLE `tipoevento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoevento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoincidencia`
--

DROP TABLE IF EXISTS `tipoincidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoincidencia` (
  `idTipoIncidencia` int NOT NULL,
  `nameTipo` varchar(100) NOT NULL,
  PRIMARY KEY (`idTipoIncidencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoincidencia`
--

LOCK TABLES `tipoincidencia` WRITE;
/*!40000 ALTER TABLE `tipoincidencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoincidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposereno`
--

DROP TABLE IF EXISTS `tiposereno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposereno` (
  `idTipoSereno` int NOT NULL,
  `nameTipo` varchar(100) NOT NULL,
  PRIMARY KEY (`idTipoSereno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposereno`
--

LOCK TABLES `tiposereno` WRITE;
/*!40000 ALTER TABLE `tiposereno` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiposereno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urbanizacion`
--

DROP TABLE IF EXISTS `urbanizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `urbanizacion` (
  `idUrbanizacion` int NOT NULL AUTO_INCREMENT,
  `nameUrbanizacion` varchar(100) NOT NULL,
  PRIMARY KEY (`idUrbanizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urbanizacion`
--

LOCK TABLES `urbanizacion` WRITE;
/*!40000 ALTER TABLE `urbanizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `urbanizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuarios` int NOT NULL AUTO_INCREMENT,
  `Roles_idRoles` int NOT NULL,
  `correoUsuario` varchar(100) NOT NULL,
  `passwordUsuario` varchar(256) NOT NULL,
  `nombreUsuario` varchar(100) NOT NULL,
  `apellidoUsuario` varchar(100) NOT NULL,
  `dniUsuario` varchar(8) NOT NULL,
  `direccionUsuario` varchar(100) NOT NULL,
  `telefonoUsuario` varchar(9) NOT NULL,
  `Urbanizacion_idUrbanizacion` int NOT NULL,
  `activation_token` varchar(255) DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `nacimientoDate` date DEFAULT NULL,
  `TipoCoordinadora_idTipoCoordinadora` int DEFAULT NULL,
  `EstadoVecinoEvento_idEstadoVecinoEvento` int DEFAULT NULL,
  `is_bannedApp` tinyint NOT NULL DEFAULT '0',
  `motivo_bannedApp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idUsuarios`),
  KEY `fk_Usuarios_Roles_idx` (`Roles_idRoles`),
  KEY `fk_Usuarios_Urbanizacion1_idx` (`Urbanizacion_idUrbanizacion`),
  KEY `fk_Usuarios_TipoCoordinadora1_idx` (`TipoCoordinadora_idTipoCoordinadora`),
  CONSTRAINT `fk_Usuarios_Roles` FOREIGN KEY (`Roles_idRoles`) REFERENCES `roles` (`idRoles`),
  CONSTRAINT `fk_Usuarios_TipoCoordinadora1` FOREIGN KEY (`TipoCoordinadora_idTipoCoordinadora`) REFERENCES `tipocoordinadora` (`idTipoCoordinadora`),
  CONSTRAINT `fk_Usuarios_Urbanizacion1` FOREIGN KEY (`Urbanizacion_idUrbanizacion`) REFERENCES `urbanizacion` (`idUrbanizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_has_eventos`
--

DROP TABLE IF EXISTS `usuarios_has_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_has_eventos` (
  `usuarioEventoInscrito` int NOT NULL,
  `Usuarios_idUsuarios` int DEFAULT NULL,
  `Eventos_idEventos` int DEFAULT NULL,
  `is_bannedEvento` tinyint DEFAULT '0',
  `motivo_bannedEvento` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`usuarioEventoInscrito`),
  KEY `fk_Usuarios_has_Eventos_Eventos1_idx` (`Eventos_idEventos`),
  KEY `fk_Usuarios_has_Eventos_Usuarios1_idx` (`Usuarios_idUsuarios`),
  CONSTRAINT `fk_Usuarios_has_Eventos_Eventos1` FOREIGN KEY (`Eventos_idEventos`) REFERENCES `eventos` (`idEventos`),
  CONSTRAINT `fk_Usuarios_has_Eventos_Usuarios1` FOREIGN KEY (`Usuarios_idUsuarios`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_has_eventos`
--

LOCK TABLES `usuarios_has_eventos` WRITE;
/*!40000 ALTER TABLE `usuarios_has_eventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_has_eventos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-04 22:29:07
