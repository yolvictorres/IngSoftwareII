-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-08-2017 a las 00:58:38
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `camello`
--
create schema camello;
use camello;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amigos`
--

CREATE TABLE `amigos` (
  `COD_PERSONA` int(11) NOT NULL,
  `COD_AMIGO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campo_laboral`
--

CREATE TABLE `campo_laboral` (
  `COD_C_LABORAL` int(11) NOT NULL,
  `NOM_C_LABORAL` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `COD_CIUDAD` int(11) NOT NULL,
  `COD_PAIS` int(11) DEFAULT NULL,
  `NOM_CIUDAD` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`COD_CIUDAD`, `COD_PAIS`, `NOM_CIUDAD`) VALUES
(1, 57, 'Bogotá'),
(5, 57, 'Cartagena'),
(11, 54, 'Buenos Aires'),
(13, 598, 'Montevideo'),
(21, 55, 'Río de Janeiro'),
(22, 591, 'La Paz'),
(33, 591, 'Santa Cruz'),
(40, 56, 'Santiago de Chile'),
(50, 51, 'Lima'),
(51, 55, 'Porto Alegre '),
(55, 51, 'Cusco'),
(69, 598, 'Salto'),
(132, 595, 'Luque'),
(154, 595, 'Asuncion'),
(216, 593, 'Guayaquil'),
(453, 56, 'Concepcion'),
(2944, 54, 'Bariloche'),
(14654, 593, 'Quito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `COD_EMPRESA` int(11) NOT NULL,
  `COD_PERSONA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `COD_EMPRESA` int(11) NOT NULL,
  `COD_C_LABORAL` int(11) DEFAULT NULL,
  `NOM_EMPRESA` text,
  `LOGO` blob,
  `RUTA_LOGO` text,
  `CORREO` text,
  `CLAVE` text,
  `TELEFONO` text,
  `DESCRIPCION` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intereses_laborales`
--

CREATE TABLE `intereses_laborales` (
  `COD_I_LABORAL` int(11) NOT NULL,
  `COD_PERSONA` int(11) DEFAULT NULL,
  `NOM_I_LABORAL` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornada`
--

CREATE TABLE `jornada` (
  `COD_JORNADA` int(11) NOT NULL,
  `NOM_JORNADA` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `jornada` (`COD_JORNADA`, `NOM_JORNADA`) VALUES
(1,'Jornada a tiempo completo'),
(2,'Jornada diurna'),
(3,'Jornada nocturna'),
(4,'Jornada parcial por horas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `COD_MENSAJE` int(11) NOT NULL,
  `COD_PERSONA` int(11) DEFAULT NULL,
  `COD_AMIGO` int(11) DEFAULT NULL,
  `MENSAJE` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `COD_PAIS` int(11) NOT NULL,
  `NOM_PAIS` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`COD_PAIS`, `NOM_PAIS`) VALUES
(51, 'Perú'),
(54, 'Argentina'),
(55, 'Brasil'),
(56, 'Chile'),
(57, 'Colombia'),
(591, 'Bolivia'),
(593, 'Ecuador'),
(595, 'Paraguay'),
(598, 'Uruguay');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `COD_PERSONA` int(11) NOT NULL,
  `NOMBRES` text,
  `APELLIDOS` text,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `FOTO` blob,
  `RUTA_FOTO` text,
  `CORREO` text,
  `CLAVE` text,
  `TELEFONO` text,
  `HOJA_DE_VIDA` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`COD_PERSONA`, `NOMBRES`, `APELLIDOS`, `FECHA_NACIMIENTO`, `FOTO`, `RUTA_FOTO`, `CORREO`, `CLAVE`, `TELEFONO`, `HOJA_DE_VIDA`) VALUES
(1, 'ian', 'Mendez', NULL, NULL, NULL, 'ian@ian', '123', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicar_empresa`
--

CREATE TABLE `publicar_empresa` (
  `COD_P_EMPRESA` int(11) NOT NULL,
  `COD_EMPRESA` int(11) DEFAULT NULL,
  `COD_CIUDAD` int(11) DEFAULT NULL,
  `COD_JORNADA` int(11) DEFAULT NULL,
  `DETALLE_PUBLICACION` text,
  `CARGO` text,
  `EXPERIENCIA_REQUERIDA` text,
  `FECHA` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicar_persona`
--

CREATE TABLE `publicar_persona` (
  `COD_P_PERSONA` int(11) NOT NULL,
  `COD_PERSONA` int(11) DEFAULT NULL,
  `COD_CIUDAD` int(11) DEFAULT NULL,
  `DETALLE_PUBLICACION` text,
  `FECHA` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `amigos`
--
ALTER TABLE `amigos`
  ADD PRIMARY KEY (`COD_PERSONA`,`COD_AMIGO`);

--
-- Indices de la tabla `campo_laboral`
--
ALTER TABLE `campo_laboral`
  ADD PRIMARY KEY (`COD_C_LABORAL`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`COD_CIUDAD`),
  ADD KEY `CIUDAD_PAIS_FK` (`COD_PAIS`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`COD_EMPRESA`,`COD_PERSONA`),
  ADD KEY `EMPLEADOS_PERSONA_FK` (`COD_PERSONA`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`COD_EMPRESA`),
  ADD KEY `EMPRESA_CAMPO_LABORAL_FK` (`COD_C_LABORAL`);

--
-- Indices de la tabla `intereses_laborales`
--
ALTER TABLE `intereses_laborales`
  ADD PRIMARY KEY (`COD_I_LABORAL`),
  ADD KEY `INTERESES_LABORALES_PERSONA_FK` (`COD_PERSONA`);

--
-- Indices de la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD PRIMARY KEY (`COD_JORNADA`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`COD_MENSAJE`),
  ADD KEY `MENSAJE_PERSONA_FK` (`COD_PERSONA`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`COD_PAIS`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`COD_PERSONA`);

--
-- Indices de la tabla `publicar_empresa`
--
ALTER TABLE `publicar_empresa`
  ADD PRIMARY KEY (`COD_P_EMPRESA`),
  ADD KEY `PUBLICAR_EMPRESA_EMPRESA_FK` (`COD_EMPRESA`),
  ADD KEY `PUBLICAR_EMPRESA_CIUDAD_FK` (`COD_CIUDAD`),
  ADD KEY `PUBLICAR_EMPRESA_JORNADA_FK` (`COD_JORNADA`);

--
-- Indices de la tabla `publicar_persona`
--
ALTER TABLE `publicar_persona`
  ADD PRIMARY KEY (`COD_P_PERSONA`),
  ADD KEY `PUBLICAR_PERSONA_PERSONA_FK` (`COD_PERSONA`),
  ADD KEY `PUBLICAR_PERSONA_CIUDAD_FK` (`COD_CIUDAD`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `amigos`
--
ALTER TABLE `amigos`
  ADD CONSTRAINT `AMIGOS_PERSONA_FK` FOREIGN KEY (`COD_PERSONA`) REFERENCES `persona` (`COD_PERSONA`);

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `CIUDAD_PAIS_FK` FOREIGN KEY (`COD_PAIS`) REFERENCES `pais` (`COD_PAIS`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `EMPLEADOS_EMPRESA_FK` FOREIGN KEY (`COD_EMPRESA`) REFERENCES `empresa` (`COD_EMPRESA`),
  ADD CONSTRAINT `EMPLEADOS_PERSONA_FK` FOREIGN KEY (`COD_PERSONA`) REFERENCES `persona` (`COD_PERSONA`);

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `EMPRESA_CAMPO_LABORAL_FK` FOREIGN KEY (`COD_C_LABORAL`) REFERENCES `campo_laboral` (`COD_C_LABORAL`);

--
-- Filtros para la tabla `intereses_laborales`
--
ALTER TABLE `intereses_laborales`
  ADD CONSTRAINT `INTERESES_LABORALES_PERSONA_FK` FOREIGN KEY (`COD_PERSONA`) REFERENCES `persona` (`COD_PERSONA`);

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `MENSAJE_PERSONA_FK` FOREIGN KEY (`COD_PERSONA`) REFERENCES `persona` (`COD_PERSONA`);

--
-- Filtros para la tabla `publicar_empresa`
--
ALTER TABLE `publicar_empresa`
  ADD CONSTRAINT `PUBLICAR_EMPRESA_CIUDAD_FK` FOREIGN KEY (`COD_CIUDAD`) REFERENCES `ciudad` (`COD_CIUDAD`),
  ADD CONSTRAINT `PUBLICAR_EMPRESA_EMPRESA_FK` FOREIGN KEY (`COD_EMPRESA`) REFERENCES `empresa` (`COD_EMPRESA`),
  ADD CONSTRAINT `PUBLICAR_EMPRESA_JORNADA_FK` FOREIGN KEY (`COD_JORNADA`) REFERENCES `jornada` (`COD_JORNADA`);

--
-- Filtros para la tabla `publicar_persona`
--
ALTER TABLE `publicar_persona`
  ADD CONSTRAINT `PUBLICAR_PERSONA_CIUDAD_FK` FOREIGN KEY (`COD_CIUDAD`) REFERENCES `ciudad` (`COD_CIUDAD`),
  ADD CONSTRAINT `PUBLICAR_PERSONA_PERSONA_FK` FOREIGN KEY (`COD_PERSONA`) REFERENCES `persona` (`COD_PERSONA`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
