-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-06-2023 a las 06:02:45
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbsgdback`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  `fechaCreacion` datetime NOT NULL,
  `fechaTermino` datetime DEFAULT NULL,
  `titular` tinyint(1) DEFAULT NULL,
  `estado` int(10) NOT NULL,
  `vigencia` tinyint(1) NOT NULL,
  `DEPENDENCIA_id` int(11) NOT NULL,
  `TIPO_CARGO_id` int(11) NOT NULL,
  `FUNCIONARIO_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dependencia`
--

CREATE TABLE `dependencia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  `timbre` varchar(100) DEFAULT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `estado` int(10) NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `TIPO_DEPENDENCIA_id` int(11) NOT NULL,
  `SECTOR_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionario`
--

CREATE TABLE `funcionario` (
  `id` int(11) NOT NULL,
  `run` int(10) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `firmaSimple` varchar(100) DEFAULT NULL,
  `estado` int(10) NOT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `genero` varchar(45) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `TIPO_CONTRATO_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `funcionario`
--

INSERT INTO `funcionario` (`id`, `run`, `nombres`, `apellidos`, `correo`, `firmaSimple`, `estado`, `fechaNacimiento`, `imagen`, `genero`, `telefono`, `TIPO_CONTRATO_id`) VALUES
(1, 18899777, 'Miguel Angel', 'Rojas Andrade', 'mrojas@municipal.cl', NULL, 1, NULL, NULL, 'M', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logeo`
--

CREATE TABLE `logeo` (
  `id` int(11) NOT NULL,
  `token` varchar(350) NOT NULL,
  `fechaLogin` datetime NOT NULL,
  `ipAddress` varchar(250) NOT NULL,
  `portOrigin` int(10) DEFAULT NULL,
  `nombreEquipo` varchar(255) DEFAULT NULL,
  `browser` varchar(250) DEFAULT NULL,
  `os` varchar(200) NOT NULL,
  `fechaLogout` datetime DEFAULT NULL,
  `USUARIO_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `logeo`
--

INSERT INTO `logeo` (`id`, `token`, `fechaLogin`, `ipAddress`, `portOrigin`, `nombreEquipo`, `browser`, `os`, `fechaLogout`, `USUARIO_id`) VALUES
(1, 'eyJhbGciOiJIUzM4NCIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2ODY2NTAxMjYsImlhdCI6MTY4NjYxNDEyNiwiaXNzIjoianVha2luZyIsInN1YiI6Im1yb2phcyIsInVzZXJJZCI6MX0.9DM4uUpMDzAWJvz_xXRzNA20B1bYmGRGd0D6YFp1DbAjgAiTjMwmhi0CJpMb8dql', '2023-06-12 23:55:26', '0:0:0:0:0:0:0:1', 59169, NULL, 'UnKnown, More-Info: PostmanRuntime/7.32.2', 'UnKnown, More-Info: PostmanRuntime/7.32.2', NULL, 1),
(2, 'eyJhbGciOiJIUzM4NCIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2ODY2NTAxNTcsImlhdCI6MTY4NjYxNDE1NywiaXNzIjoianVha2luZyIsInN1YiI6Im1yb2phcyIsInVzZXJJZCI6MX0.8v2h9PJeJYkpodhuYjkCnYYVUryexDh-0HVXCJ0LI29UHtvnoQQ1qMtTCm84ivTd', '2023-06-12 23:55:57', '0:0:0:0:0:0:0:1', 59169, NULL, 'UnKnown, More-Info: PostmanRuntime/7.32.2', 'UnKnown, More-Info: PostmanRuntime/7.32.2', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sector`
--

CREATE TABLE `sector` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `IP NAS` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cargo`
--

CREATE TABLE `tipo_cargo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_contrato`
--

CREATE TABLE `tipo_contrato` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_contrato`
--

INSERT INTO `tipo_contrato` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Planta', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_dependencia`
--

CREATE TABLE `tipo_dependencia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nick` varchar(200) NOT NULL,
  `password` varchar(255) NOT NULL,
  `estado` int(10) NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `FUNCIONARIO_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nick`, `password`, `estado`, `fechaCreacion`, `FUNCIONARIO_id`) VALUES
(1, 'mrojas', 'm+02yFlVdD6gDmtpsAfjrA==', 1, '2023-06-13 05:13:42', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `DEPENDENCIA_id` (`DEPENDENCIA_id`),
  ADD KEY `FUNCIONARIO_id` (`FUNCIONARIO_id`),
  ADD KEY `TIPO_CARGO_id` (`TIPO_CARGO_id`);

--
-- Indices de la tabla `dependencia`
--
ALTER TABLE `dependencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `TIPO_DEPENDENCIA_id` (`TIPO_DEPENDENCIA_id`),
  ADD KEY `SECTOR_id` (`SECTOR_id`);

--
-- Indices de la tabla `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `TIPO_CONTRATO_id` (`TIPO_CONTRATO_id`);

--
-- Indices de la tabla `logeo`
--
ALTER TABLE `logeo`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_cargo`
--
ALTER TABLE `tipo_cargo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_contrato`
--
ALTER TABLE `tipo_contrato`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_dependencia`
--
ALTER TABLE `tipo_dependencia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `FUNCIONARIO_id` (`FUNCIONARIO_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dependencia`
--
ALTER TABLE `dependencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `logeo`
--
ALTER TABLE `logeo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sector`
--
ALTER TABLE `sector`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_cargo`
--
ALTER TABLE `tipo_cargo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_contrato`
--
ALTER TABLE `tipo_contrato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD CONSTRAINT `cargo_ibfk_1` FOREIGN KEY (`DEPENDENCIA_id`) REFERENCES `dependencia` (`id`),
  ADD CONSTRAINT `cargo_ibfk_2` FOREIGN KEY (`FUNCIONARIO_id`) REFERENCES `funcionario` (`id`),
  ADD CONSTRAINT `cargo_ibfk_3` FOREIGN KEY (`TIPO_CARGO_id`) REFERENCES `tipo_cargo` (`id`);

--
-- Filtros para la tabla `dependencia`
--
ALTER TABLE `dependencia`
  ADD CONSTRAINT `dependencia_ibfk_1` FOREIGN KEY (`TIPO_DEPENDENCIA_id`) REFERENCES `tipo_dependencia` (`id`),
  ADD CONSTRAINT `dependencia_ibfk_2` FOREIGN KEY (`SECTOR_id`) REFERENCES `sector` (`id`);

--
-- Filtros para la tabla `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`TIPO_CONTRATO_id`) REFERENCES `tipo_contrato` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;