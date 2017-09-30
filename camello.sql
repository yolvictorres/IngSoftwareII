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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campo_laboral`
--

CREATE TABLE `campo_laboral` (
  `COD_C_LABORAL` int(11) NOT NULL,
  `NOM_C_LABORAL` text CHARACTER SET utf8 COLLATE utf8_spanish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

CREATE TABLE `postulados` (
  `COD_P_EMPRESA` int(11) NOT NULL,
  `COD_EMPRESA` int(11) NOT NULL,
  `COD_PERSONA` int(11) NOT NULL,
  `ESTADO_POSTULADO` int(11) NOT NULL,
  `ESTADO_NOTIFICACION` int(11) NOT NULL,
  `MENSAJE` text,
  `ESTADO_ENVIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `COD_EMPRESA` int(11) NOT NULL,
  `COD_C_LABORAL` int(11) DEFAULT NULL,
  `NOM_EMPRESA` text,
  `RUTA_LOGO` text,
  `CORREO` text,
  `CLAVE` text,
  `TELEFONO` text,
  `DESCRIPCION` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `empresa` (`COD_EMPRESA`, `COD_C_LABORAL`, `NOM_EMPRESA`, `RUTA_LOGO`, `CORREO`, `CLAVE`, `TELEFONO`, `DESCRIPCION`) VALUES
(111, NULL, 'Konrad Lorenz', 'images/img111.jpg', 'konrad@konrad.com', '123', 457676645, NULL),
(222, NULL, 'Microsoft', 'images/img222.jpg', 'microsoft@microsoft.com', '123', 567867645, NULL),
(333, NULL, 'Cafam', 'images/img333.jpg', 'cafam@cafam.com', '123', 86786546, NULL);


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intereses_laborales`
--

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
  `FECHA_NACIMIENTO` text,
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
(1, 'ian', 'Mendez', NULL, NULL, 'images/img1.jpg', 'ian@ian', '123', 78856898, 'documentos/doc1.pdf'),
(2, 'Diego', 'Schotborg', NULL, NULL, 'images/img2.jpg', 'diego@diego', '123', 1981525, 'documentos/doc2.pdf'),
(3, 'Yolvic', 'Torres', NULL, NULL, 'images/img3.jpg', 'yolvic@yolvic', '123', 89166629, 'documentos/doc3.pdf'),
(4, 'Jose Miguel', 'Bumbury', NULL, NULL, 'images/img4.jpg', 'miguel@gmail.com', '123', 4534344, NULL),
(5, 'Alejandra', 'Tinoco', NULL, NULL, 'images/img5.jpg', 'alej@gmail.com', '123', 4865578, NULL),
(6, 'Manuel', 'Muñoz', NULL, NULL, 'images/img6.jpg', 'manu@gmail.com', '123', 4867545, NULL),
(7, 'Jorge', 'Solano', NULL, NULL, 'images/img7.jpg', 'yoyo@gmail.com', '123', 7878786, NULL),
(8, 'Lina Maria', 'Cifuentes', NULL, NULL, 'images/img8.jpg', 'maria@gmail.com', '123', 4555786, NULL),
(9, 'Paola', 'Marquez', NULL, NULL, 'images/img9.jpg', 'pao@gmail.com', '123', 77567688, NULL),
(10, 'Roberto', 'Niño', NULL, NULL, 'images/img10.jpg', 'beto@gmail.com', '123', 5377845, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicar_empresa`
--

CREATE TABLE `publicar_empresa` (
  `COD_P_EMPRESA` int(11) NOT NULL,
  `COD_EMPRESA` int(11) DEFAULT NULL,
  `COD_CIUDAD` int(11) DEFAULT NULL,
  `COD_JORNADA` int(11) DEFAULT NULL,
  `COD_CARGO` int(11) DEFAULT NULL,
  `COD_SALARIO` int(11) DEFAULT NULL,
  `DETALLE_PUBLICACION` text,
  `EXPERIENCIA_REQUERIDA` text,
  `FECHA` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `camello`.`publicar_empresa` (`COD_P_EMPRESA`, `COD_EMPRESA`, `COD_CIUDAD`, `COD_JORNADA`, `COD_CARGO`, `COD_SALARIO`, `DETALLE_PUBLICACION`, `EXPERIENCIA_REQUERIDA`) VALUES
 ('453378386', '111', '5', '1', '1', '3', 'monitor de salas', 'ninguna'),
 ('737835324', '111', '1', '2', '3', '1', 'asistente tecnico', 'ninguna'),
 ('870475767', '222', '22', '3', '2', '5', 'programador', 'ninguna'),
 ('445278453', '222', '1', '2', '3', '2', 'asesor de redes', 'ninguna'),
 ('757866789', '333', '11', '1', '2', '3', 'callcenter', 'ninguna'),
 ('411457780', '333', '1', '2', '1', '4', 'cajero de minisuper', 'ninguna');
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

CREATE TABLE `cargo` (
  `COD_CARGO` int(11) NOT NULL,
  `NOM_CARGO` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `cargo` (`COD_CARGO`, `NOM_CARGO`) VALUES
(1, 'secretaria'),
(2, 'Administrador'),
(3, 'cajero'),
(4, 'profesor'),
(5, 'arquitecto');

CREATE TABLE `salario` (
  `COD_SALARIO` int(11) NOT NULL,
  `SALARIO` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `salario` (`COD_SALARIO`, `SALARIO`) VALUES
(1, 'A convenir'),
(2, 'Menos de $ 700.000'),
(3, 'Mas de $ 700.000'),
(4, 'Mas de $ 1.000.000'),
(5,'Mas de $ 1.500.000'),
(6,'Mas de $ 2.000.000'),
(7,'Mas de $ 2.500.000'),
(8,'Mas de $ 3.000.000'),
(9,'Mas de $ 3.500.000'),
(10,'Mas de $ 4.000.000');

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
ALTER TABLE `postulados`
  ADD PRIMARY KEY (`COD_P_EMPRESA`,`COD_PERSONA`),
  ADD KEY `POSTULADOS_PERSONA_FK` (`COD_PERSONA`),
  ADD KEY `POSTULADOS_PUBLICAR_EMPRESA_FK` (`COD_P_EMPRESA`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`COD_EMPRESA`),
  ADD KEY `EMPRESA_CAMPO_LABORAL_FK` (`COD_C_LABORAL`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`COD_CARGO`);

--
-- Indices de la tabla `salario`
--
ALTER TABLE `salario`
  ADD PRIMARY KEY (`COD_SALARIO`);
  
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
  ADD KEY `PUBLICAR_EMPRESA_JORNADA_FK` (`COD_JORNADA`),
  ADD KEY `PUBLICAR_EMPRESA_CARGO_FK`(`COD_CARGO`),
  ADD KEY `PUBLICAR_EMPRESA_SALRIO_FK`(`COD_SALARIO`);
  
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
ALTER TABLE `postulados`
  ADD CONSTRAINT `POSTULADOS_EMPRESA_FK` FOREIGN KEY (`COD_P_EMPRESA`) REFERENCES `publicar_empresa` (`COD_P_EMPRESA`),
  ADD CONSTRAINT `POSTULADOS_PERSONA_FK` FOREIGN KEY (`COD_PERSONA`) REFERENCES `persona` (`COD_PERSONA`);

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `EMPRESA_CAMPO_LABORAL_FK` FOREIGN KEY (`COD_C_LABORAL`) REFERENCES `campo_laboral` (`COD_C_LABORAL`);

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
  ADD CONSTRAINT `PUBLICAR_EMPRESA_JORNADA_FK` FOREIGN KEY (`COD_JORNADA`) REFERENCES `jornada` (`COD_JORNADA`),
  ADD CONSTRAINT `PUBLICAR_EMPRESA_CARGO_FK` FOREIGN KEY (`COD_CARGO`) REFERENCES `cargo` (`COD_CARGO`),
  ADD CONSTRAINT `PUBLICAR_EMPRESA_SALRIO_FK` FOREIGN KEY (`COD_SALARIO`) REFERENCES `salario` (`COD_SALARIO`);

--
-- Filtros para la tabla `publicar_persona`
--
ALTER TABLE `publicar_persona`
  ADD CONSTRAINT `PUBLICAR_PERSONA_CIUDAD_FK` FOREIGN KEY (`COD_CIUDAD`) REFERENCES `ciudad` (`COD_CIUDAD`),
  ADD CONSTRAINT `PUBLICAR_PERSONA_PERSONA_FK` FOREIGN KEY (`COD_PERSONA`) REFERENCES `persona` (`COD_PERSONA`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
