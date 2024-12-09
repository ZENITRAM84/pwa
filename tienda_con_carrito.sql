-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-12-2024 a las 23:20:47
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_con_carrito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `fecha_agregada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id_carrito`, `id_usuario`, `id_producto`, `cantidad`, `precio`, `fecha_agregada`) VALUES
(15, 6, 25, 1, '180', '2024-11-19 19:07:30'),
(30, 18, 31, 1, '59', '2024-11-24 21:32:54'),
(33, 18, 30, 3, '179', '2024-12-02 21:36:04'),
(36, 7, 31, 6, '59', '2024-12-03 15:26:54'),
(41, 18, 32, 3, '199', '2024-12-08 21:23:53'),
(42, 18, 28, 1, '250', '2024-12-08 21:14:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritodetalle`
--

CREATE TABLE `carritodetalle` (
  `id_carrito_detalle` int(11) NOT NULL,
  `id_carrito` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`) VALUES
(1, 'Telefonia'),
(2, 'Accesorios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `img_producto`
--

CREATE TABLE `img_producto` (
  `id_image` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `img_producto`
--

INSERT INTO `img_producto` (`id_image`, `nombre`, `id_producto`) VALUES
(1, 'laptop.png', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `id_carrito` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `estado_pago` enum('Pendiente','Completado','Fallido') NOT NULL,
  `referencia_pago` varchar(100) NOT NULL,
  `total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(35) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `imagen_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `descripcion`, `precio`, `stock`, `id_categoria`, `imagen_url`) VALUES
(28, 'Audifonos Inalambricos', 'Audifonos para moviles', '250', 99, 2, 'img/audifonos.jpg'),
(29, 'Funda Iphone12', 'Funda para iphone12', '99', 99, 2, 'img/funda.jpg'),
(30, 'cargador tipo c', 'cargador para moviles tipo c', '179', 99, 2, 'img/tipo c.jpg'),
(31, 'Mouse', 'Mouse para pc', '59', 99, 2, 'img/mouse.jpg'),
(32, 'Teclado', 'Teclado para pc.', '199', 99, 2, 'img/teclado.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(35) NOT NULL,
  `email` varchar(60) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `email`, `clave`, `id_rol`) VALUES
(1, 'juan', 'decimo@hotmail.com', '$2y$', 0),
(2, 'juan', 'yennydzulortega@gmail.com', '$2y$', 0),
(3, 'angel', 'angelku001a@outlook.com', '$2y$', 0),
(4, 'fus', 'juanantoniom.chimartinez@gmail.com', '$2y$10$/M1QdaLUtJOs4S0ezPmVYeDb71i4kMtCqhV2MrMWgCQZTWFtZq9ay', 0),
(5, 'gus', 'gustavoisraelchimartinez@gmail.com', '$2y$10$jAsbDkRFuEUnXLIgQGKVDeDBvJlJZXK/Py4t3RUQ0hGZ/WnJAx5Fq', 0),
(6, 'mama', 'mama@gmail.com', '$2y$10$i3upWKX713HygPwyZsUee.CJsd7m0MdUKiZ5gkHDrGXHXaVesGCL.', 0),
(7, 'madielito', 'rufus@gmail.com', '$2y$10$Hs5RHk9l8Be6iHe/NWIZwe2hUn5XghFcwPP97foLpURUL19W9WoZy', 0),
(8, 'roger', 'roger@gmail.com', '$2y$10$ay1Rv.GDUWLwDYzitYweKOVzbqZNGMO9u5HqKOn6ToAw6AYb8H326', 0),
(9, 'roger', 'roger@gmail.com', '$2y$10$Eu7N7VO8q/AE/WT2EKOTMuO0/BkfscCjRfdP4r2i3vUaoUTazZEB6', 0),
(10, 'wil', 'wil@hotmail.com', '$2y$10$wtDei2JBv6Dgce.XhQTj3u5IkYfqtkGxcOaQUAWHnIAJV9pctwFpK', 0),
(11, 'angel', 'a@gmail.com', '$2y$10$V8XUj6PeDAXf6FvlWfrUgeF4pZRxEi77w24UYH9OD5cRY28Zb3AC2', 0),
(12, 'brenda', 'b@gmail.com', '$2y$10$Q76TMFwktehPkgPHl1aq1ueN2VISdBFj6OOBqEXJuSf/MeJALHEfW', 0),
(13, 'admin', 'ad@gmail.com', '$2y$10$HYtYJu9kUGSeVDPFRxWd9u0FpC9wweSypYj87epMk7IvrNZqT3qw6', 0),
(14, 'lol', 'lol@gmail.com', '$2y$10$CltsEP7eH/4jZGd7BoK3q.rHlStayqimri8Em.4THtKlcHCV5gtBm', 0),
(16, 'ceci', 'c@gmail.com', '$2y$10$cY3JWH9TgekCWHJ1aqTywOA5WID4x9zPZ7ucmLhna8eN3VFh.tPg2', 0),
(17, 'lol2', 'lol2@gmail.com', '$2y$10$JX06urQQPi5M1ah419X34.fygVCXNqWT44XI9WNqLcXK4dUj8tCW.', 0),
(18, 'ali', 'ali@gmail.com', '$2y$10$9/HKimgbcw7XBzj.QFGDte4oUyjbF8i8x7tTktrql3P4rxzJks.bS', 0),
(19, 'frida', 'ida@gmail.com', '$2y$10$S5DDn4RherVQvmCQGYg0SObiFlErZnAhYVgAxLWBstOJLdA3dBaLG', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `carritodetalle`
--
ALTER TABLE `carritodetalle`
  ADD PRIMARY KEY (`id_carrito_detalle`),
  ADD KEY `id_carrito` (`id_carrito`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `img_producto`
--
ALTER TABLE `img_producto`
  ADD PRIMARY KEY (`id_image`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_carrito` (`id_carrito`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `carritodetalle`
--
ALTER TABLE `carritodetalle`
  MODIFY `id_carrito_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `img_producto`
--
ALTER TABLE `img_producto`
  MODIFY `id_image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
