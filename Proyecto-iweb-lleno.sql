CREATE DATABASE  IF NOT EXISTS `proyecto-iweb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proyecto-iweb`;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criticidadincidencia`
--

LOCK TABLES `criticidadincidencia` WRITE;
/*!40000 ALTER TABLE `criticidadincidencia` DISABLE KEYS */;
INSERT INTO `criticidadincidencia` VALUES (1,'Baja'),(2,'Media'),(3,'Alta');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoevento`
--

LOCK TABLES `estadoevento` WRITE;
/*!40000 ALTER TABLE `estadoevento` DISABLE KEYS */;
INSERT INTO `estadoevento` VALUES (1,'No iniciado'),(2,'Comenzado'),(3,'Terminado');
/*!40000 ALTER TABLE `estadoevento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadoincidencia`
--

DROP TABLE IF EXISTS `estadoincidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadoincidencia` (
  `idEstadoIncidencia` int NOT NULL AUTO_INCREMENT,
  `nameEstado` varchar(100) NOT NULL,
  PRIMARY KEY (`idEstadoIncidencia`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoincidencia`
--

LOCK TABLES `estadoincidencia` WRITE;
/*!40000 ALTER TABLE `estadoincidencia` DISABLE KEYS */;
INSERT INTO `estadoincidencia` VALUES (1,'Nueva'),(2,'En proceso'),(3,'Resuelta');
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
  `fotosStart` longblob DEFAULT NULL,
  `descriptionEvento` varchar(255) NOT NULL,
  `vacantesDisp` int NOT NULL,
  `lugarEvento` varchar(100) NOT NULL,
  `fechaEventoStart` date NOT NULL,
  `fechaEventoEnd` date NOT NULL,
  `horaEventoStart` time NOT NULL,
  `horaEventoEnd` time NOT NULL,
  `materialesEvento` varchar(255) DEFAULT NULL,
  `Profesores_idProfesores` int DEFAULT NULL,
  `fotosEnd` longblob DEFAULT NULL,
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
INSERT INTO `eventos` VALUES (
  1, 'Festival de la Música Peruana', 0x0101, 
  'El Festival de la Música Peruana es un evento que celebra y promueve la rica diversidad musical del Perú.', 
  100, 'San Miguel, Av. Universitaria 1800, Lima, Perú', '2024-10-25', 
  '2024-10-26', '08:00:00', '10:00:00', 'No hay', 2, 
  null, 1, 1, 1, true, '08:00:00', '10:00:00'
), (
  2, 'Deporte', 0x0101, 
  'El Festival de la Música Peruana es un evento que celebra y promueve la rica diversidad musical del Perú.', 
  100, 'San Miguel, Av. Universitaria 1800, Lima, Perú', '2024-10-25', 
  '2024-10-26', '08:00:00', '10:00:00', 'No hay', 2, 
  null, 2, 1, 1, true, '08:00:00', '10:00:00'
),(
  3, 'Festival de la Música Peruana', 0x0101, 
  'El Festival de la Música Peruana es un evento que celebra y promueve la rica diversidad musical del Perú.', 
  100, 'San Miguel, Av. Universitaria 1800, Lima, Perú', '2024-10-25', 
  '2024-10-26', '08:00:00', '10:00:00', 'No hay', 2, 
  null, 1, 1, 1, true, '08:00:00', '10:00:00'
),(
  4, 'Deporte 2', 0x0101, 
  'El Festival de la Música Peruana es un evento que celebra y promueve la rica diversidad musical del Perú.', 
  100, 'San Miguel, Av. Universitaria 1800, Lima, Perú', '2024-10-25', 
  '2024-10-26', '08:00:00', '10:00:00', 'No hay', 2, 
  null, 2, 1, 1, true, '08:00:00', '10:00:00'
),(
  5, 'Festival de la Música Peruana', 0x0101, 
  'El Festival de la Música Peruana es un evento que celebra y promueve la rica diversidad musical del Perú.', 
  100, 'San Miguel, Av. Universitaria 1800, Lima, Perú', '2024-10-25', 
  '2024-10-26', '08:00:00', '10:00:00', 'No hay', 2, 
  null, 1, 1, 1, true, '08:00:00', '10:00:00'
);

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
  `fotoIncidencia` longblob,
  `contactoIncidencia` varchar(9) NOT NULL,
  `requiereAmbulancia` tinyint DEFAULT NULL,
  `requierePolicia` tinyint DEFAULT NULL,
  `requiereBombero` tinyint DEFAULT NULL,
  `descriptionSolucion` varchar(225) DEFAULT NULL,
  `Serenazgos_idSerenazgos` int DEFAULT NULL,
  `personalAmbulancia_idpersonalAmbulancia` int DEFAULT NULL,
  `Usuarios_idUsuarios` int DEFAULT '1',
  `EstadoIncidencia_idEstadoIncidencia` int DEFAULT '1',
  `CriticidadIncidencia_idCriticidadIncidencia` int DEFAULT NULL,
  `TipoIncidencia_idTipoIncidencia` int DEFAULT NULL,
  `enabled` tinyint default 1,
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidencias`
--

LOCK TABLES `incidencias` WRITE;
/*!40000 ALTER TABLE `incidencias` DISABLE KEYS */;
INSERT INTO incidencias (nombreIncidencia, lugarExacto, referenciaIncidencia, requiereAmbulancia, requierePolicia, requiereBombero, contactoIncidencia) VALUES ('AS', 'AS', 'AS',0 ,0, 0, 942841110);
INSERT INTO incidencias (nombreIncidencia, lugarExacto, referenciaIncidencia, contactoIncidencia, Usuarios_idUsuarios, EstadoIncidencia_idEstadoIncidencia, CriticidadIncidencia_idCriticidadIncidencia) 
VALUES 
('Arresto en la calle 3', 'Las causarinas', 'Cerca al paradero Josias', '981084527', 4, 1, null),
('Robo en tienda', 'Avenida Principal 123', 'Frente a la plaza', '987654321', 2, 2, 3),
('Accidente vehicular', 'Esquina de Calle 5 y 6', 'Cerca al supermercado', '912345678', 5, 1, null),
('Incendio en vivienda', 'Calle Los Pinos 456', 'Al lado del parque', '923456789', 3, 3, 2),
('Vandalismo en escuela', 'Calle Los Cedros 789', 'Junto a la biblioteca', '934567890', 6, 2, 1),
('Emergencia médica', 'Pasaje Las Rosas 101', 'Frente al banco', '945678901', 7, 1, null),
('Perro perdido', 'Jirón Las Flores 202', 'Cerca de la panadería', '956789012', 1, 3, 1),
('Fuga de gas', 'Avenida Las Palmas 303', 'A una cuadra del parque', '967890123', 1, 1, null),
('Pelea callejera', 'Calle Las Acacias 404', 'Cerca del mercado', '978901234', 1, 2, 3),
('Ruido excesivo', 'Jirón Las Lomas 505', 'A dos cuadras de la iglesia', '989012345', 10, 3, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalambulancia`
--

LOCK TABLES `personalambulancia` WRITE;
/*!40000 ALTER TABLE `personalambulancia` DISABLE KEYS */;
INSERT INTO `personalambulancia` VALUES (1,'Rodrigo','Mendoza','75797761','mañana'),(2,'Sofía','Ramos','75687452','tarde'),(3,'Fernando','Gómez','76458932','noche'),(4,'Lucía','Fernández','74325896','mañana'),(5,'Daniel','López','75986214','tarde'),(6,'Isabel','Ruiz','76234198','noche'),(7,'Jorge','Hernández','74568932','mañana'),(8,'Ana','Martínez','75896321','tarde'),(9,'Carlos','Pérez','75123698','noche'),(10,'Marta','García','76325897','mañana');
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
  `isEnable` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`idProfesores`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,'Mariano','Salazar','31687543','Cultura','Historia',1),(2,'Ana','Paz','31678954','Deporte','Karate',1),(3,'Manuel ','Yarlequé','31784312','Cultura','PREM',1),(4,'Alex','Brocca','32567489','Deporte','Atletismo',1),(5,'Dina','Boluarte ','31678795','Cultura','Ética',1),(6,'Elena','Nito','34665889','Deporte','Esgrima',1),(7,'Angel','Bugataz','35675432','Cultura','Narración',1),(9,'Juan','Rodriguez','45678965','Cultura','Oratoria',1),(10,'Leonardo','Campos','56746532','Cultura','Lenguaje',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador'),(2,'SerenazgoDisp'),(3,'Coordinadora'),(4,'Vecino');
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
  `isEnable` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`idSerenazgos`),
  KEY `fk_Serenazgos_TipoSereno1_idx` (`TipoSereno_idTipoSereno`),
  CONSTRAINT `fk_Serenazgos_TipoSereno1` FOREIGN KEY (`TipoSereno_idTipoSereno`) REFERENCES `tiposereno` (`idTipoSereno`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serenazgos`
--

LOCK TABLES `serenazgos` WRITE;
/*!40000 ALTER TABLE `serenazgos` DISABLE KEYS */;
INSERT INTO `serenazgos` VALUES (1,'Luis','Perales','74857485','mañana','Diego Medina 130','942842110',2,1),(2,'Joaquin','Pozo','78543214','tarde','Diego Medina 110','942541110',1,1),(3,'María','González','75896321','noche','Avenida Lima 245','941236547',3,1),(4,'Carlos','Ramirez','76985412','mañana','Jirón Puno 315','943215789',4,1),(5,'Ana','Santos','75236485','tarde','Calle Bolívar 125','945623147',1,1),(6,'Pedro','Lopez','71258963','noche','Pasaje Grau 58','947856321',4,1),(7,'Lucía','Martinez','73489562','mañana','Avenida Perú 78','948756214',2,1),(8,'Juan','Vega','72986412','tarde','Calle Amazonas 12','946852147',1,1),(9,'Elena','Torres','74561238','noche','Jirón Cusco 89','944587123',3,1),(10,'Miguel','Díaz','73845612','mañana','Avenida Arequipa 145','942369741',2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocoordinadora`
--

LOCK TABLES `tipocoordinadora` WRITE;
/*!40000 ALTER TABLE `tipocoordinadora` DISABLE KEYS */;
INSERT INTO `tipocoordinadora` VALUES (1,'Cultura'),(2,'Deporte');
/*!40000 ALTER TABLE `tipocoordinadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoevento`
--

DROP TABLE IF EXISTS `tipoevento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoevento` (
  `idTipoEvento` int NOT NULL AUTO_INCREMENT,
  `nameTipo` varchar(100) NOT NULL,
  PRIMARY KEY (`idTipoEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoevento`
--

LOCK TABLES `tipoevento` WRITE;
/*!40000 ALTER TABLE `tipoevento` DISABLE KEYS */;
INSERT INTO `tipoevento` VALUES (1,'Cultura'),(2,'Deporte');
/*!40000 ALTER TABLE `tipoevento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoincidencia`
--

DROP TABLE IF EXISTS `tipoincidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoincidencia` (
  `idTipoIncidencia` int NOT NULL AUTO_INCREMENT,
  `nameTipo` varchar(100) NOT NULL,
  PRIMARY KEY (`idTipoIncidencia`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoincidencia`
--

LOCK TABLES `tipoincidencia` WRITE;
/*!40000 ALTER TABLE `tipoincidencia` DISABLE KEYS */;
INSERT INTO `tipoincidencia` VALUES (1,'Robo o hurto'),(2,'Vandalismo'),(3,'Violencia doméstica'),(4,'Desorden público'),(5,'Accidente de Tráfico'),(6,'Incendios'),(7,'Consumo de drogas y alcohol'),(8,'Problemas con animales'),(9,'Emergencias médicas'),(10,'Problemas de infraestructuras'),(11,'Violacion de normas comunitarias'),(12,'Conflictos vecinales'),(13,'Otros');
/*!40000 ALTER TABLE `tipoincidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposereno`
--

DROP TABLE IF EXISTS `tiposereno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposereno` (
  `idTipoSereno` int NOT NULL AUTO_INCREMENT,
  `nameTipo` varchar(100) NOT NULL,
  PRIMARY KEY (`idTipoSereno`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposereno`
--

LOCK TABLES `tiposereno` WRITE;
/*!40000 ALTER TABLE `tiposereno` DISABLE KEYS */;
INSERT INTO `tiposereno` VALUES (1,'Patrulla'),(2,'Moto'),(3,'En bici'),(4,'A pie');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urbanizacion`
--

LOCK TABLES `urbanizacion` WRITE;
/*!40000 ALTER TABLE `urbanizacion` DISABLE KEYS */;
INSERT INTO `urbanizacion` VALUES (1,'Maranga'),(2,'Pando'),(3,'Miramar'),(4,'San Miguelito'),(5,'Elio'),(6,'Bertolotto'),(7,'La Perla'),(8,'San Antonio'),(9,'Santa Patricia'),(10,'Residencial San Felipe'),(11,'Cueva'),(12,'Las Brisas'),(13,'Las Leyendas'),(14,'Parque de las Leyendas'),(15,'San José'),(16,'Los Cipreses');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,2,'jose.martinez@example.com','c822a0abf4ef0a5fc2a4c2010ed111e16af3ae95cee462a55e7877b8623ade36','Jose','Martinez','74857485','Calle Los Pinos 123','912345678',11,'newtoken12345',1,'1985-06-15',1,0,0,NULL),(2,3,'andrea.lopez@example.com','eaaa4a79c43019473cc37be32ede6ea36c962bdf821fafbecc573c6931f63ea7','Andrea','Lopez','78543214','Avenida Los Alamos 456','987654321',2,'newtoken67890',1,'1990-08-20',NULL,0,0,NULL),(3,3,'fernando.garcia@example.com','1867af3ecc8955deaced8d6369b017f7ab5fc12cff085fb10a25751477600db0','Fernando','Garcia','75896321','Jiron Las Flores 789','912345987',9,'newtoken24680',1,'1988-12-05',NULL,0,0,NULL),(4,1,'laura.perez@example.com','6d1fd6e67de771e4317846895425ec10f065b0a1cdc5c10f8b81bd05689d0e02','Laura','Perez','76985412','Avenida Los Cedros 101','987654123',8,'newtoken13579',1,'1982-03-22',NULL,0,0,NULL),(5,2,'manuel.ruiz@example.com','9c5e3f7dd450faac30fc5cd2bc743a1b9fdd329f36ab2889a13eb5ad9a3200c3','Manuel','Ruiz','75236485','Calle Las Rosas 202','912349876',14,'newtoken54321',1,'1995-11-10',2,0,0,NULL),(6,3,'monica.sanchez@example.com','e0a7bc9ea3d1854d87bab49f332636b0d3590a9c146eb0b1aec926afa0a1bc51','Monica','Sanchez','71258963','Pasaje Los Olivos 303','987652341',1,'newtoken67890',1,'1979-07-17',NULL,0,0,NULL),(7,3,'alejandro.fernandez@example.com','6ba0a21dde8cecfc27d22948a6ede7c3190e125c7558d51ed604dba43450d351','Alejandro','Fernandez','73489562','Avenida Las Palmas 404','912348765',1,'newtoken123456',1,'1993-05-30',1,0,0,NULL),(8,1,'valeria.gonzales@example.com','ee7231b5ae7b63a3699fbf86dfe9ab4030f4f849dd689f4fb020ee25cbc040b4','Valeria','Gonzales','72986412','Calle Las Acacias 505','987651234',4,'newtoken654321',1,'1986-09-25',NULL,0,0,NULL),(9,1,'adrian.torres@example.com','e334ef91424900886c5bb3978a11502874c3807da58b1a98e982a0a9336cf1c6','Adrian','Torres','74561238','Jiron Las Lomas 606','912347654',2,'newtoken789012',1,'1991-04-12',NULL,0,0,NULL),(10,2,'claudia.morales@example.com','3081f00316c1f1898f5210ea69322fb4c9c87228b8af01f7c1fbb375afce4ea6','Claudia','Morales','73845612','Avenida Los Jazmines 707','987654987',7,'newtoken098765',1,'1984-01-05',NULL,0,0,NULL);
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

-- Dump completed on 2024-06-16 16:13:58
