-- --------------------------------------------------------
-- Host:                         168.232.165.245
-- Versión del servidor:         8.0.28-0ubuntu0.20.04.3 - (Ubuntu)
-- SO del servidor:              Linux
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para inf0021
CREATE DATABASE IF NOT EXISTS `inf0021` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inf0021`;

-- Volcando estructura para tabla inf0021.Comuna
CREATE TABLE IF NOT EXISTS `Comuna` (
  `idComuna` int NOT NULL,
  `nombreCom` varchar(30) NOT NULL,
  `idRegion` int(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`idComuna`),
  KEY `idRegion` (`idRegion`),
  CONSTRAINT `FK_Comuna_Region` FOREIGN KEY (`idRegion`) REFERENCES `Region` (`idRegion`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla inf0021.Comuna: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Comuna` DISABLE KEYS */;
INSERT INTO `Comuna` (`idComuna`, `nombreCom`, `idRegion`) VALUES
	(101, 'Iquique', 01),
	(102, 'Pozo Almonte', 01),
	(201, 'Antofagasta', 02),
	(202, 'Calama', 02),
	(301, 'Copiapo', 03),
	(302, 'Chañaral', 03),
	(401, 'La Serena', 04),
	(402, 'Coquimbo', 04),
	(501, 'Valparaiso', 05),
	(502, 'Quillota', 05),
	(601, 'Rancagua', 06),
	(602, 'San Fernando', 06),
	(701, 'Talca', 07),
	(702, 'Curico', 07),
	(801, 'Concepcion', 08),
	(802, 'Los Angeles', 08),
	(901, 'Temuco', 09),
	(902, 'Villarrica', 09),
	(1001, 'Puerto Montt', 10),
	(1002, 'Ancud', 10),
	(1101, 'Coyhaique', 11),
	(1102, 'Puerto Aysen', 11),
	(1201, 'Punta Arenas', 12),
	(1202, 'Puerto Natales', 12),
	(1301, 'Santiago', 13),
	(1302, 'La Florida', 13),
	(1401, 'Valdivia', 14),
	(1402, 'Rio Bueno', 14),
	(1501, 'Arica', 15),
	(1502, 'Putre', 15),
	(1601, 'Chillan', 16),
	(1602, 'Bulnes', 16);
/*!40000 ALTER TABLE `Comuna` ENABLE KEYS */;

-- Volcando estructura para tabla inf0021.Especialidad
CREATE TABLE IF NOT EXISTS `Especialidad` (
  `idEspecialidad` int NOT NULL,
  `nombreEsp` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idEspecialidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla inf0021.Especialidad: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Especialidad` DISABLE KEYS */;
INSERT INTO `Especialidad` (`idEspecialidad`, `nombreEsp`) VALUES
	(1, 'Dermatologia'),
	(2, 'Geriatria'),
	(3, 'Neurologia'),
	(4, 'Oftalmologia'),
	(5, 'Pediatria'),
	(6, 'Psiquiatria'),
	(7, 'Traumatologia'),
	(8, 'Cardiologia'),
	(9, 'Medicina General');
/*!40000 ALTER TABLE `Especialidad` ENABLE KEYS */;

-- Volcando estructura para tabla inf0021.Paciente
CREATE TABLE IF NOT EXISTS `Paciente` (
  `idPaciente` int NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `nroSeguro` int DEFAULT NULL,
  `correo` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sexo` set('F','M') NOT NULL,
  `idComuna` int DEFAULT NULL,
  `direccion` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`idPaciente`),
  UNIQUE KEY `nroSeguro_UNIQUE` (`nroSeguro`),
  KEY `idComuna` (`idComuna`),
  CONSTRAINT `FK_Paciente_Comuna` FOREIGN KEY (`idComuna`) REFERENCES `Comuna` (`idComuna`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla inf0021.Paciente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Paciente` DISABLE KEYS */;
INSERT INTO `Paciente` (`idPaciente`, `nombre`, `apellido`, `fechaNacimiento`, `nroSeguro`, `correo`, `sexo`, `idComuna`, `direccion`) VALUES
	(3413527, 'Rodrigo', 'Saez', '1940-07-28', 847251054, '', 'M', 301, 'Santa Rosa 752'),
	(3809152, 'David', 'Acevedo', '1941-02-08', 740174926, NULL, 'M', 401, 'Lorca Prieto 304'),
	(4487682, 'Isabel', 'Alarcon', '1941-05-29', 742189452, NULL, 'F', 1301, 'Los Nogales 189'),
	(6428800, 'Monserrat', 'Flores', '1945-12-11', 863415368, 'Monflores@mail.com', 'F', 801, 'Arturo Prat 546'),
	(6753078, 'Esteban', 'Bustamante', '1946-03-18', 831528564, 'ebustamante@mail.com', 'M', 501, 'Baquedano 261'),
	(7360587, 'Franco', 'Moreno', '1948-09-01', 794328674, 'MorenoF@mail.com', 'M', 501, 'Balmaceda 1015'),
	(7661671, 'Maria', 'Torres', '1949-07-30', 765490143, '', 'F', 901, 'Gabriela Mistral 809'),
	(7818163, 'Ambar', 'Zuñiga', '1951-03-02', 791628421, 'AmbarZ@mail.com', 'F', 1201, 'Freire 76'),
	(7819500, 'Alejandro', 'Pino', '1951-03-16', 794518562, 'PinoA@mail.com', 'M', 1301, 'San Ramon 751'),
	(8361252, 'Julian', 'Sanhueza', '1951-08-14', 846153967, 'SanhuezaJ@mail.com', 'M', 1101, 'Los Maitenes 376'),
	(9766498, 'Nicolas', 'Bustos', '1960-06-18', 740152953, 'bustosNc@mail.com', 'M', 201, 'Caupolican 709'),
	(12480219, 'Emiliano', 'Acuña', '1972-04-14', 845105439, 'EmilianoA@mail.com', 'M', 601, NULL),
	(13222434, 'Rocio', 'Fernandez', '1972-09-16', 869121468, 'FernandezR@mail.com', 'F', 102, 'El Bosque 852'),
	(13313334, 'Daniela', 'Gomez', '1973-03-22', 764941832, 'gomezD@mail.com', 'F', 401, 'Los Sauces 307'),
	(16785498, 'Paz', 'Ramirez', '1982-05-31', 832517436, 'PazR@mail.com', 'F', 701, 'Almirante Latorre 301'),
	(18335889, 'Laura', 'Reyes', '1987-03-27', 749164936, 'LauraR@mail.com', 'F', 1501, 'Crucero 205'),
	(19478486, 'Isabel', 'Palacios', '1998-07-08', 746678123, 'IsaPalacios@mail.com', 'F', 501, 'America 89'),
	(19886397, 'Cristian', 'Ortega', '1992-07-16', 739174521, 'OrtegaC@mail.com', 'M', 1001, 'Av. Pereira 259'),
	(21000000, 'Marco', 'Palma', '2002-07-12', 1234567, 'Marco2002s@mail.com', 'M', 501, 'Matta 20');
/*!40000 ALTER TABLE `Paciente` ENABLE KEYS */;

-- Volcando estructura para tabla inf0021.Profesional
CREATE TABLE IF NOT EXISTS `Profesional` (
  `idProfesional` int NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `nacionalidad` varchar(15) NOT NULL,
  `idEspecialidad` int NOT NULL,
  `idSucursal` int NOT NULL,
  PRIMARY KEY (`idProfesional`),
  KEY `idEspecialidad` (`idEspecialidad`),
  KEY `idSucursal` (`idSucursal`),
  CONSTRAINT `FK_Profesional_Especialidad` FOREIGN KEY (`idEspecialidad`) REFERENCES `Especialidad` (`idEspecialidad`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Profesional_Sucursal` FOREIGN KEY (`idSucursal`) REFERENCES `Sucursal` (`idSucursal`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla inf0021.Profesional: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Profesional` DISABLE KEYS */;
INSERT INTO `Profesional` (`idProfesional`, `nombre`, `apellido`, `nacionalidad`, `idEspecialidad`, `idSucursal`) VALUES
	(4032908, 'Alex', 'Farias', 'Cubano', 2, 8555),
	(6218596, 'Samantha', 'Miranda', 'Cubana', 3, 9453),
	(6869116, 'Tomas', 'Leiva', 'Chileno', 8, 9621),
	(8514287, 'Felipe', 'Lagos', 'Chileno', 6, 1122),
	(9611327, 'Angel', 'Carvajal', 'Chileno', 4, 6719),
	(9651740, 'Alonso', 'Salinas', 'Chileno', 5, 2585),
	(9705541, 'Luciano', 'Palma', 'Chileno', 5, 5476),
	(10203224, 'Amparo', 'Nuñez', 'Chilena', 1, 7708),
	(11030618, 'Pablo', 'Navarrete', 'Chileno', 4, 1431),
	(11180059, 'Laura', 'Castillo', 'Chilena', 7, 2178),
	(14048515, 'Pia', 'Castro', 'Chilena', 6, 8260),
	(14345340, 'Dominique', 'Vasquez', 'Chilena', 1, 2123),
	(14913653, 'Matilde', 'Alvarez', 'Chilena', 7, 8587),
	(16817810, 'Vicente', 'Aravena', 'Chileno', 2, 1881),
	(17865028, 'Dante', 'Guerrero', 'Chileno', 9, 1189),
	(18082876, 'Jorge', 'Alvarado', 'Chileno', 3, 2108);
/*!40000 ALTER TABLE `Profesional` ENABLE KEYS */;

-- Volcando estructura para tabla inf0021.Region
CREATE TABLE IF NOT EXISTS `Region` (
  `idRegion` int(2) unsigned zerofill NOT NULL,
  `nombreReg` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idRegion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla inf0021.Region: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Region` DISABLE KEYS */;
INSERT INTO `Region` (`idRegion`, `nombreReg`) VALUES
	(01, 'Tarapaca'),
	(02, 'Antofagasta'),
	(03, 'Atacama'),
	(04, 'Coquimbo'),
	(05, 'Valparaiso'),
	(06, 'O\'Higgins'),
	(07, 'Maule'),
	(08, 'Biobio'),
	(09, 'Araucania'),
	(10, 'Los Lagos'),
	(11, 'Aysen'),
	(12, 'Magallanes'),
	(13, 'Metropolitana'),
	(14, 'Los Rios'),
	(15, 'Arica y Parinacota'),
	(16, 'Ñuble');
/*!40000 ALTER TABLE `Region` ENABLE KEYS */;

-- Volcando estructura para tabla inf0021.Reserva
CREATE TABLE IF NOT EXISTS `Reserva` (
  `idReserva` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `asistencia` set('No Asistio','Si Asistio','En Espera') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `idProfesional` int NOT NULL,
  `idPaciente` int NOT NULL,
  `idTipoCita` int NOT NULL,
  PRIMARY KEY (`idReserva`),
  KEY `idProfesional` (`idProfesional`),
  KEY `idPaciente` (`idPaciente`),
  KEY `idTipoCita` (`idTipoCita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla inf0021.Reserva: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Reserva` DISABLE KEYS */;
INSERT INTO `Reserva` (`idReserva`, `fecha`, `hora`, `asistencia`, `idProfesional`, `idPaciente`, `idTipoCita`) VALUES
	(20650, '2022-08-15', '15:30:00', 'En Espera', 14913653, 21000000, 9),
	(29750, '2022-08-15', '15:30:00', 'En Espera', 14913653, 19478486, 9),
	(35731, '2022-06-26', '16:15:47', 'En Espera', 14345340, 13313334, 1);
/*!40000 ALTER TABLE `Reserva` ENABLE KEYS */;

-- Volcando estructura para tabla inf0021.Sucursal
CREATE TABLE IF NOT EXISTS `Sucursal` (
  `idSucursal` int NOT NULL,
  `direccion` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telefono` char(8) NOT NULL,
  `idComuna` int NOT NULL,
  PRIMARY KEY (`idSucursal`),
  KEY `idComuna` (`idComuna`),
  CONSTRAINT `FK_Sucursal_Comuna` FOREIGN KEY (`idComuna`) REFERENCES `Comuna` (`idComuna`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla inf0021.Sucursal: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Sucursal` DISABLE KEYS */;
INSERT INTO `Sucursal` (`idSucursal`, `direccion`, `telefono`, `idComuna`) VALUES
	(1122, 'Av. España 1890', '385746', 1201),
	(1189, 'Martin Cermeño 463', '259361', 1401),
	(1431, 'Avenida Los Nogales 175', '526496', 701),
	(1848, 'Santa Elena 1675', '347593', 1301),
	(1881, 'Los Batallones 1573', '436286', 1601),
	(2108, 'San Ignacio 971', '616473', 1001),
	(2123, 'Gabriela Mistal 1955', '275437', 901),
	(2178, 'Balmaceda 1015', '384912', 401),
	(2585, 'Av. Salvador Allende 2903', '224156', 101),
	(5476, 'Av. Vicuña Mackenna 525', '332755', 501),
	(6719, 'Av. Granadero 3698', '465572', 201),
	(7708, 'Av. Washington 1926', '324057', 501),
	(8260, 'Carrera 1586', '439786', 301),
	(8555, 'Santa Teresa 1876', '346813', 1301),
	(8587, 'Juan Jimenez 404', '517438', 601),
	(9453, '18 de Septiembre 1315', '647398', 1501),
	(9621, 'Aguas Calientes 2350', '587649', 801),
	(9751, 'O\'Higgins 331', '668231', 1101);
/*!40000 ALTER TABLE `Sucursal` ENABLE KEYS */;

-- Volcando estructura para tabla inf0021.TipoCita
CREATE TABLE IF NOT EXISTS `TipoCita` (
  `idTipoCita` int NOT NULL,
  `nombreTipo` varchar(45) NOT NULL,
  `precio` double(10,0) NOT NULL,
  PRIMARY KEY (`idTipoCita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla inf0021.TipoCita: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `TipoCita` DISABLE KEYS */;
INSERT INTO `TipoCita` (`idTipoCita`, `nombreTipo`, `precio`) VALUES
	(1, 'Cita Dermatologia', 40000),
	(2, 'Cita Geriatria', 50000),
	(3, 'Cita Neurologia', 40000),
	(4, 'Cita Oftalmologia', 30000),
	(5, 'Cita Pediatria', 32000),
	(6, 'Cita Psiquiatria', 80000),
	(7, 'Cita Traumatologia', 35000),
	(8, 'Cita Cardiologia', 35000),
	(9, 'Cita Medicina General', 30000);
/*!40000 ALTER TABLE `TipoCita` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
