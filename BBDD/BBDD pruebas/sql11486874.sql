-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Servidor: sql11.freemysqlhosting.net
-- Tiempo de generación: 20-04-2022 a las 19:23:10
-- Versión del servidor: 5.5.62-0ubuntu0.14.04.1
-- Versión de PHP: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sql11486874`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Alquiler`
--

CREATE TABLE `Alquiler` (
  `ID_alquiler` int(11) NOT NULL,
  `ID_Cliente` int(11) NOT NULL,
  `ID_Empleado` int(11) NOT NULL,
  `Matricula` varchar(7) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Fecha_salida` date NOT NULL,
  `Fecha_entrada` date NOT NULL,
  `Telefono_cliente` varchar(9) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Observaciones` varchar(150) COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Coches`
--

CREATE TABLE `Coches` (
  `Numero_bastidor` varchar(17) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Marca` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Modelo` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Precio_alquiler` double(5,2) NOT NULL,
  `ID_Cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `ID` int(11) NOT NULL,
  `DNI` varchar(9) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Nombre` varchar(15) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Apellidos` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Telefono` varchar(9) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Correo_electronico` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Tipo` enum('Administrador','Estandar') COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Alquiler`
--
ALTER TABLE `Alquiler`
  ADD PRIMARY KEY (`ID_alquiler`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_Empleado` (`ID_Empleado`);

--
-- Indices de la tabla `Coches`
--
ALTER TABLE `Coches`
  ADD PRIMARY KEY (`Numero_bastidor`),
  ADD KEY `ID_Cliente` (`ID_Cliente`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD UNIQUE KEY `DNI` (`DNI`),
  ADD UNIQUE KEY `Correo_electronico` (`Correo_electronico`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Alquiler`
--
ALTER TABLE `Alquiler`
  MODIFY `ID_alquiler` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Coches`
--
ALTER TABLE `Coches`
  ADD CONSTRAINT `Coches_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `Alquiler` (`ID_Cliente`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD CONSTRAINT `Usuarios_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `Alquiler` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Usuarios_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `Alquiler` (`ID_Cliente`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
