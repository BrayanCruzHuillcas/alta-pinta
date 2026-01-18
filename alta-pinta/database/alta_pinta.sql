-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-01-2026 a las 19:21:05
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alta_pinta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` bigint(20) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `creado_en` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `cliente_id`, `creado_en`) VALUES
(11, 8, '2026-01-05 18:37:55'),
(12, 9, '2026-01-10 19:52:35'),
(13, 10, '2026-01-11 07:51:46'),
(14, 11, '2026-01-11 08:48:32'),
(15, 12, '2026-01-16 08:01:20'),
(16, 13, '2026-01-16 22:16:22'),
(17, 14, '2026-01-17 00:10:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_item`
--

CREATE TABLE `carrito_item` (
  `id` bigint(20) NOT NULL,
  `carrito_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito_item`
--

INSERT INTO `carrito_item` (`id`, `carrito_id`, `producto_id`, `cantidad`) VALUES
(69, 15, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(3, 'Bebé'),
(1, 'Mujer'),
(4, 'Niños'),
(2, 'Varón');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `correo` varchar(255) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `dni` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `verificado` tinyint(1) NOT NULL DEFAULT 0,
  `token_verificacion` varchar(255) DEFAULT NULL,
  `token_expira` datetime DEFAULT NULL,
  `rol` varchar(20) DEFAULT NULL,
  `token_reset_password` varchar(255) DEFAULT NULL,
  `token_reset_expira` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `correo`, `direccion`, `dni`, `password`, `verificado`, `token_verificacion`, `token_expira`, `rol`, `token_reset_password`, `token_reset_expira`) VALUES
(8, 'Brayan Cruz Huillcas', '211170@unamba.edu.pe', 'Av. los fieles ', '71310651', '$2a$10$.Vd.88YlxmbhHeVJN6rrYujD.Nkm2ipp.sMX1ELhzLweV255nnHUO', 1, NULL, NULL, 'USER', NULL, NULL),
(9, 'Nikol Cruz', 'nikoldcruzh952@gmail.com', 'Av. los fieles ', '60203055', '$2a$10$AnseQ15A2z9R6FY9YST9men8fF94J04BCp44XBl6rWhAW6wSsAXea', 1, NULL, NULL, 'USER', NULL, NULL),
(10, 'Alta Pinta', 'altapintaunamba@gmail.com', 'Abancay', '99999999', '$2a$10$FtVR8Q3DIkuLByK4W44qDOk8.R.AweEm.YR/.QMQvAAjxfVQe2vEC', 1, NULL, NULL, 'ADMIN', NULL, NULL),
(11, 'Brayan Cruz Huillcas', 'cruzhuillcasbrayan@gmail.com', 'Av. los Serruchos', '66666666', '$2a$10$dvStM4XFmzBRfXKnYmUiOeGs7EPiaSvx9.sTvB9kQmAokQ.nQN4vS', 1, NULL, NULL, 'USER', NULL, NULL),
(12, 'Cristhian Yercy', 'yucaesc@gmail.com', 'Usnomocco', '11111111', '$2a$10$tEPAcZdNIAQLINLx./0GYuRzdHBYlHTqTl.4PjW7BF3.r1U1jWsPS', 1, NULL, NULL, 'USER', NULL, NULL),
(13, 'Danyra La mejor ', 'dcontreras@unamba.edu.pe', '.', '75452691', '$2a$10$uT5fPPOKOyx/MrzZnoRwbuJ3HLxxJSTofmz.rEE3nNP3wilQ20NDC', 1, NULL, NULL, 'USER', NULL, NULL),
(14, 'Danyra Contreras Meza', 'dacome.1294@gmail.com', 'Abancay', '73961630', '$2a$10$8rWLl91y5SiuFFvRSBTX3O8Q3a/YtUDdwMsVcwk6IC4n5SoKERrTS', 1, NULL, NULL, 'USER', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta_tienda`
--

CREATE TABLE `cuenta_tienda` (
  `id` bigint(20) NOT NULL,
  `saldo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuenta_tienda`
--

INSERT INTO `cuenta_tienda` (`id`, `saldo`) VALUES
(1, 6061.84);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `id` bigint(20) NOT NULL,
  `costo` double DEFAULT NULL,
  `lugar` varchar(255) DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `envio`
--

INSERT INTO `envio` (`id`, `costo`, `lugar`, `cliente_id`) VALUES
(1, 17.5, 'Amazonas', NULL),
(2, 17.5, 'Áncash', NULL),
(3, 24, 'Arequipa', NULL),
(4, 17.5, 'Ayacucho', NULL),
(5, 24, 'Cajamarca', NULL),
(6, 12, 'Callao', NULL),
(7, 21, 'Cusco', NULL),
(8, 24, 'Huancavelica', NULL),
(9, 17.5, 'Huánuco', NULL),
(10, 17.5, 'Ica', NULL),
(11, 17.5, 'Junín', NULL),
(12, 12, 'La Libertad', NULL),
(13, 17.5, 'Lambayeque', NULL),
(14, 12, 'Lima', NULL),
(15, 30, 'Loreto', NULL),
(16, 21, 'Madre de Dios', NULL),
(17, 30, 'Moquegua', NULL),
(18, 17.5, 'Pasco', NULL),
(19, 24, 'Piura', NULL),
(20, 24, 'Puno', NULL),
(21, 17.5, 'San Martín', NULL),
(22, 21, 'Tacna', NULL),
(23, 24, 'Tumbes', NULL),
(24, 17.5, 'Ucayali', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` bigint(20) NOT NULL,
  `envio` double NOT NULL,
  `fecha` datetime(6) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `subtotal` double NOT NULL,
  `total` double NOT NULL,
  `url_pdf` varchar(255) DEFAULT NULL,
  `pedido_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `envio`, `fecha`, `numero`, `subtotal`, `total`, `url_pdf`, `pedido_id`) VALUES
(1, 0, '2026-01-11 03:29:43.000000', 'FAC-1768102183736', 239.85000000000002, 239.85000000000002, 'facturas/FAC-6.pdf', 6),
(2, 17.5, '2026-01-11 08:49:41.000000', 'FAC-1768121381536', 279.8, 297.3, 'facturas/FAC-7.pdf', 7),
(3, 0, '2026-01-11 08:51:17.000000', 'FAC-1768121477614', 89.9, 89.9, 'facturas/FAC-8.pdf', 8),
(4, 17.5, '2026-01-11 08:53:33.000000', 'FAC-1768121613103', 74, 91.5, 'facturas/FAC-9.pdf', 9),
(5, 17.5, '2026-01-15 15:19:12.000000', 'FAC-1768490352298', 219, 236.5, 'facturas/FAC-10.pdf', 10),
(6, 0, '2026-01-16 08:14:20.000000', 'FAC-1768551260831', 89.9, 89.9, 'facturas/FAC-11.pdf', 11),
(7, 0, '2026-01-16 22:17:36.000000', 'FAC-1768601856159', 138, 138, 'facturas/FAC-12.pdf', 12),
(8, 21, '2026-01-17 00:17:05.000000', 'FAC-1768609025259', 443.48, 464.48, 'facturas/FAC-13.pdf', 13),
(9, 30, '2026-01-18 16:29:00.000000', 'FAC-1768753740966', 712.37, 742.37, 'facturas/FAC-14.pdf', 14),
(10, 30, '2026-01-18 17:07:23.000000', 'FAC-1768756043848', 1453.74, 1483.74, 'facturas/FAC-15.pdf', 15),
(11, 21, '2026-01-18 17:11:35.000000', 'FAC-1768756295144', 1698.1999999999998, 1719.1999999999998, 'facturas/FAC-16.pdf', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favorito`
--

CREATE TABLE `favorito` (
  `id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `favorito`
--

INSERT INTO `favorito` (`id`, `usuario_id`, `producto_id`, `created_at`) VALUES
(21, 8, 3, '2025-12-27 22:16:22'),
(24, 9, 3, '2026-01-11 00:52:29'),
(26, 11, 39, '2026-01-11 13:53:14'),
(28, 12, 156, '2026-01-16 12:59:15'),
(29, 12, 1, '2026-01-16 12:59:21'),
(30, 12, 3, '2026-01-16 12:59:23'),
(32, 14, 1, '2026-01-17 05:10:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `monto` double DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `tarjeta_numero` varchar(16) DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `pedido_id` bigint(20) DEFAULT NULL,
  `tarjeta_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` bigint(20) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `total` double DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `costo_envio` double DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `envio_id` bigint(20) DEFAULT NULL,
  `tipo_envio` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `cliente_id`, `total`, `estado`, `costo_envio`, `fecha`, `envio_id`, `tipo_envio`) VALUES
(1, 8, 199.4, 'PENDIENTE', NULL, '2026-01-10 18:56:31', NULL, NULL),
(2, 8, 89.9, 'EN DESTINO', NULL, '2026-01-10 19:15:56', NULL, NULL),
(3, 8, 89.9, 'ENTREGADO', NULL, '2026-01-10 19:24:45', NULL, NULL),
(4, 8, 199.4, 'EN DESTINO', NULL, '2026-01-10 19:41:12', NULL, NULL),
(5, 9, 89.9, 'EN DESTINO', NULL, '2026-01-10 19:53:19', NULL, NULL),
(6, 8, 239.85000000000002, 'EN TRANSITO', NULL, '2026-01-11 03:29:43', NULL, NULL),
(7, 11, 297.3, 'ENVIADO', NULL, '2026-01-11 08:49:41', 1, NULL),
(8, 11, 89.9, 'PAGADO', NULL, '2026-01-11 08:51:17', NULL, NULL),
(9, 11, 91.5, 'ENVIADO', NULL, '2026-01-11 08:53:33', 1, NULL),
(10, 8, 236.5, 'PAGADO', NULL, '2026-01-15 15:19:12', 18, NULL),
(11, 8, 89.9, 'ENVIADO', NULL, '2026-01-16 08:14:20', NULL, NULL),
(12, 13, 138, 'PAGADO', NULL, '2026-01-16 22:17:36', NULL, NULL),
(13, 14, 464.48, 'ENVIADO', NULL, '2026-01-17 00:17:05', 7, NULL),
(14, 8, 742.37, 'PAGADO', NULL, '2026-01-18 16:29:00', 15, NULL),
(15, 8, 1483.74, 'PAGADO', NULL, '2026-01-18 17:07:23', 17, NULL),
(16, 14, 1719.1999999999998, 'PAGADO', NULL, '2026-01-18 17:11:35', 7, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_detalle`
--

CREATE TABLE `pedido_detalle` (
  `id` bigint(20) NOT NULL,
  `pedido_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido_detalle`
--

INSERT INTO `pedido_detalle` (`id`, `pedido_id`, `producto_id`, `cantidad`, `precio_unitario`) VALUES
(1, 1, 1, 1, 109.5),
(2, 1, 2, 1, 89.9),
(3, 2, 2, 1, 89.9),
(4, 3, 2, 1, 89.9),
(5, 4, 2, 1, 89.9),
(6, 4, 1, 1, 109.5),
(7, 5, 2, 1, 89.9),
(8, 6, 156, 3, 79.95),
(9, 7, 155, 4, 69.95),
(10, 8, 2, 1, 89.9),
(11, 9, 38, 1, 74),
(12, 10, 1, 2, 109.5),
(13, 11, 2, 1, 89.9),
(14, 12, 43, 2, 69),
(15, 13, 2, 4, 89.9),
(16, 13, 78, 3, 27.96),
(17, 14, 5, 1, 59.95),
(18, 14, 78, 1, 27.96),
(19, 14, 80, 1, 27.96),
(20, 14, 35, 1, 249),
(21, 14, 42, 1, 69),
(22, 14, 40, 1, 149),
(23, 14, 48, 1, 129.5),
(24, 15, 37, 1, 249),
(25, 15, 36, 1, 186),
(26, 15, 35, 1, 249),
(27, 15, 34, 1, 249),
(28, 15, 45, 1, 125.94),
(29, 15, 49, 3, 94.95),
(30, 15, 47, 1, 109.95),
(31, 16, 2, 6, 89.9),
(32, 16, 70, 5, 67.96),
(33, 16, 69, 4, 59.96),
(34, 16, 83, 4, 32.95),
(35, 16, 82, 4, 27.96),
(36, 16, 81, 4, 27.96),
(37, 16, 80, 8, 27.96);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `imagen_url` longtext DEFAULT NULL,
  `categoria_id` bigint(20) DEFAULT NULL,
  `tipo_prenda_id` bigint(20) DEFAULT NULL,
  `talla_id` bigint(20) DEFAULT NULL,
  `precio` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `stock`, `imagen_url`, `categoria_id`, `tipo_prenda_id`, `talla_id`, `precio`) VALUES
(1, 'Pantalón cargo holgado', 'Pantalón cargo en lona de algodón. Modelo de talle bajo con elástico revestido a los lados y detrás, y cierre con botón a presión. Bolsillos laterales en diagonal, ambos con minibolsillo adicional con solapa adelante. ', 105, 'https://hmperu.vtexassets.com/unsafe/768x0/center/middle/https%3A%2F%2Fhmperu.vtexassets.com%2Farquivos%2Fids%2F5910599%2FPantalon-cargo-holgado---Negro---H-M-PE.jpg%3Fv%3D638873915497530000', 1, 4, 3, 109.5),
(2, 'Pantalón cargo Slim', 'Pantalón entallado en twill de algodón con cintura de talle alto y cierre con botón. Bolsillos laterales con cierre y bolsillos decorativos con solapa en las piernas y detrás. Pierna tobillera de corte ceñido con costura visible adelante.', 72, 'https://hmperu.vtexassets.com/unsafe/768x0/center/middle/https%3A%2F%2Fhmperu.vtexassets.com%2Farquivos%2Fids%2F5897595%2FPantalon-cargo-Slim---Verde-caqui-oscuro---H-M-PE.jpg%3Fv%3D638870466676500000', 1, 4, 5, 89.9),
(3, 'Pantalón cargo de algodón', 'Pantalón cargo en algodón suave con bolsillos parche adelante y en las piernas. Modelo de talle alto con cierre con botón y piernas rectas con pliegue en las rodillas para dar volumen.', 123, 'https://hmperu.vtexassets.com/unsafe/768x0/center/middle/https%3A%2F%2Fhmperu.vtexassets.com%2Farquivos%2Fids%2F6166964%2FPantalon-cargo-de-algodon---Beige-claro---H-M-PE.jpg%3Fv%3D638956005592170000', 1, 4, 1, 85.9),
(4, 'Pantalón denim cargo', 'Pantalón en denim de algodón con piernas amplias. Cierre con botón, bolsillos laterales en diagonal y bolsillos traseros abiertos. Dos bolsillos de fuelle con solapa en cada pierna.', 19, 'https://hmperu.vtexassets.com/unsafe/768x0/center/middle/https%3A%2F%2Fhmperu.vtexassets.com%2Farquivos%2Fids%2F5983947%2FPantalon-denim-cargo---Negro---H-M-PE.jpg%3Fv%3D638898114809770000', 1, 4, 9, 109),
(5, 'Pantalón en mezcla de lino', 'Pantalón en tejido vaporoso de mezcla de lino y algodón con piernas rectas. Modelo de corte relajado con cintura elástica, cordón de ajuste y bolsillos parche delante y detrás', 77, 'https://hmperu.vtexassets.com/unsafe/768x0/center/middle/https%3A%2F%2Fhmperu.vtexassets.com%2Farquivos%2Fids%2F5532272%2FPantalon-en-mezcla-de-lino---Beige-claro---H-M-PE.jpg%3Fv%3D638846563919570000', 4, 4, 9, 59.95),
(6, 'Loose Fit Wide Leg Jeans', 'Jean en denim de algodón con piernas acampanadas y corte holgado en cadera y muslo. Modelo con elástico ajustable en la parte posterior de la pretina, cierre con botón, bolsillos delanteros con solapa y botón a presión, y bolsillos traseros abiertos.', 98, 'https://hmperu.vtexassets.com/unsafe/768x0/center/middle/https%3A%2F%2Fhmperu.vtexassets.com%2Farquivos%2Fids%2F5655309%2FLoose-Fit-Wide-Leg-Jeans---Azul-denim-claro---H-M-PE.jpg%3Fv%3D638852735284630000', 4, 4, 2, 99.95),
(7, 'Casaca Crop Fit Alfred', 'Casaca c/cierre\nLleva capucha\nBolsillos funcionales \nMaterial: Tela paño', 56, 'https://now.com.pe/cdn/shop/files/ECOMNOWL8SOFI-199_1512x.jpg?v=1764975777', 1, 6, 3, 299.9),
(8, 'Casaca Boxy Fit Hedberg', 'Casaca con cierre \nPuños ajustados en mangas\nBolsillos con vista contraste en delantero inferior \nCapucha en color contraste \nMaterial: Tela drill', 89, 'https://now.com.pe/cdn/shop/files/NOWECOMLUMA-524_1512x.jpg?v=1764974176', 1, 6, 4, 199.9),
(9, 'Casaca Tueson', 'Casaca oversize cuello camisero\nPuños de manga y cuerpo en rip contraste \nBolsillos laterales internos \nBolsillos con tapa al costado \nMaterial: Tela dril', 78, 'https://now.com.pe/cdn/shop/files/2daparte-643_1512x.jpg?v=1764971979', 1, 6, 1, 134.5),
(10, 'Chompa Carry', 'Chompa cuello redondo\nFit oversize\nTejido \nMaterial: Acrilico con viscosa', 67, 'https://now.com.pe/cdn/shop/files/ECOML5ADRI-134_460x.jpg?v=1764974572', 1, 7, 6, 139.9),
(11, 'Chompa Crop Fit Calaf', 'Chompa cuello redondo\nFit oversize\nTejido \nMaterial: Acrilico con viscosa', 90, 'https://now.com.pe/cdn/shop/files/ECOML5ADRI-585_1512x.jpg?v=1764974587', 1, 7, 3, 55),
(12, 'Chompa Crop Fit Jane', 'Chompa cuello redondo\nFit oversize\nTejido \nMaterial: Acrilico con viscosa', 45, 'https://now.com.pe/cdn/shop/files/ECOMSOFIALEKSINAL2VERANO-293_460x.jpg?v=1764977156', 1, 7, 6, 119.9),
(13, 'Maxi Falda Dreyer', 'Falda maxi\nPliegues desde el faldón hasta la rodilla\nMaterial: Tela gasa indu', 13, 'https://now.com.pe/cdn/shop/files/ECOMPV2026DARIA22OCT-360_460x.jpg?v=1764976309', 1, 8, 3, 129.9),
(14, 'Mini Falda Denim Jazz', 'Minifalda Denim corta \nMaterial: Tela denim', 89, 'https://now.com.pe/cdn/shop/files/ECOMSOFIALEKSINAL2VERANO-424_460x.jpg?v=1764977215', 1, 8, 1, 149.9),
(15, 'Falda Denim York Pank', 'Falda denim\nBotón en pretina \nMaterial: Tela denim', 54, 'https://now.com.pe/cdn/shop/files/NOWECOMLUMA-556_460x.jpg?v=1764973915', 1, 8, 3, 105),
(17, 'Polera Regular Fit Cranmer', 'Polera con capucha \nEfecto lavado acid\nEstampado tacto cero \nMaterial: Tela fresh terry ', 90, 'https://now.com.pe/cdn/shop/files/ECOMPV2026DARIA22OCT-567_460x.jpg?v=1764976643', 1, 1, 7, 159.9),
(18, 'Polera Regular Fit Amat', 'Polera con capucha \nHombro caido \nBolsillo canguro\nEfecto lavado acid\nEstampado tacto cero \nMaterial: Tela fresh terry ', 87, 'https://now.com.pe/cdn/shop/files/DSC6334_1512x.jpg?v=1764976176', 1, 1, 7, 139.9),
(19, 'Polera Boxy Fit Snow', '- Material: 100% algodón Premium\n- 450 GMS - que genera un peso superior, caida y armado perfecto.\n- Hoodie prelavado textura extra suave\n- Con Capucha con doble recubierto\n- Estampado en Pecho técnica Discharge.\n- Estampado en Espalda técnica Discharge.\n', 86, 'https://now.com.pe/cdn/shop/files/DSC2119_1512x.jpg?v=1764974864', 1, 1, 6, 239.9),
(20, 'Polo Regular Fit Milfs', 'Polo Regular fit \nEstampado tacto cero \nEtiqueta estampada  \nMaterial: Jersey', 23, 'https://now.com.pe/cdn/shop/files/ECOMSOFIALEKSINAL2VERANO-301_460x.jpg?v=1764976994', 1, 2, 2, 89.9),
(21, 'Polo Baby Tee Owen', 'Polo cuello redondo\nMaterial: JTela rip', 12, 'https://now.com.pe/cdn/shop/files/ECOMSOFIALEKSINAL2VERANO-188_460x.jpg?v=1764976968', 1, 2, 1, 59.9),
(22, 'Polo Croptop Kyle', 'Polo croptop\nMaterial: Acrilico c/viscosa ', 34, 'https://now.com.pe/cdn/shop/files/ECOMSOFIALEKSINAL2VERANO-283_460x.jpg?v=1764977169', 1, 2, 6, 89.9),
(23, 'Polo Camisero Burnett', 'Top tejido\nListado\nCuello camisero\nMaterial: Acrílico con viscosa', 32, 'https://now.com.pe/cdn/shop/files/ECOMPV2026DARIA22OCT-335_1512x.jpg?v=1764976596', 1, 2, 5, 99.9),
(24, 'Short Denim Hawai', 'Short corto \nEfecto basta deshilada\nEfectos destroyer \nDetalles de foil plata en delantero \nMaterial: Denim\nComposición: 81% polyester 14% viscosa y 5% spandex', 54, 'https://now.com.pe/cdn/shop/files/EC-9-12CRUDOS-MASHA-473a_460x.jpg?v=1764971638', 1, 3, 5, 75),
(25, 'Short Slim Fit Blida', 'Short denim\nBolsillos delanteros y posteriores.\nPresillas en cintura para uso opcional de correa.\nMaterial: Tela Drill', 9, 'https://now.com.pe/cdn/shop/files/ECOMMERCELUCIA18-2ALTAS-469_460x.jpg?v=1764972615', 1, 3, 4, 119.9),
(26, 'Falda Short Lovisa', 'Falda short \nCruce en faldón delantero \nBotón en pretina \nMaterial: Tela drill', 51, 'https://now.com.pe/cdn/shop/files/2daparte-554_1512x.jpg?v=1764971945', 1, 3, 8, 139.9),
(27, 'Short Goetz', 'Short con bolsillos clásicos en delantero \nGareta y botón metálico funcional.\nPresillas en cintura para uso opcional de correa.\nPinzas en posterior.\nMaterial: Tela Drill', 23, 'https://now.com.pe/cdn/shop/files/ECOMMERCEMEZCLADO-ANA-691-43_1512x.jpg?v=1764970367', 1, 3, 4, 139.9),
(28, 'Maxi Vestido Rosie', 'Maxi vestido\nVestido de tiras \nTela verna', 23, 'https://now.com.pe/cdn/shop/files/ECOMSOFIALEKSINAL2VERANO-039_460x.jpg?v=1764977007', 1, 5, 5, 159.9),
(29, 'Maxi Vestido Lucien', 'Maxi vestido\nVestido de tiras \nTela verna', 14, 'https://now.com.pe/cdn/shop/files/ECOMSOFIALEKSINAL2VERANO-062_1512x.jpg?v=1764977052', 1, 5, 7, 169.9),
(30, 'Maxi Vestido Race', 'Maxi vestido\nVestido de tiras \nTela gasa estampada', 23, 'https://now.com.pe/cdn/shop/files/ECOMPV2026DARIA22OCT-423_460x.jpg?v=1764976398', 1, 5, 6, 179.9),
(31, 'Maxi Vestido Offman', 'Maxi vestido\nVestido manga larga\nTela mesh', 34, 'https://now.com.pe/cdn/shop/files/ECOMPV2026DARIA22OCT-449_1512x.jpg?v=1764976276', 1, 5, 3, 159.9),
(32, 'Mini Vestido Merly', 'Lavar con agua fría.\nNo usar blanqueador ni retorcer.\nSecar a la sombra.\nPlancha tibia', 16, 'https://now.com.pe/cdn/shop/files/MiniVestidoMerly_6_460x.jpg?v=1764972460', 1, 5, 2, 109.9),
(33, 'Vestido Oasis', 'Mini vestido\nTiras con regulador \nEscote en espalda ', 19, 'https://now.com.pe/cdn/shop/files/VestidoOasis_4_460x.jpg?v=1764972284', 1, 5, 3, 149.9),
(34, 'Pantalón Slim Hombre AE', '• Estos Khakis son Real Good: Hechos en una fábrica que cumple con nuestros estándares de reciclaje y reducción de agua\n• Flex\n• Flex es Durable y Diseñado para aportar Stretch y poder moverte sin problema', 55, 'https://americaneagleperu.vtexassets.com/arquivos/ids/243445-800-auto?v=638694360852700000&width=800&height=auto&aspect=true', 2, 4, 3, 249),
(35, '   Pantalón Slim Hombre AE', '• Estos Khakis son Real Good: Hechos en una fábrica que cumple con nuestros estándares de reciclaje y reducción de agua\n• Flex\n• Flex es Durable y Diseñado para aportar Stretch y poder moverte sin problema', 16, 'https://americaneagleperu.vtexassets.com/arquivos/ids/243196-800-auto?v=638694360438430000&width=800&height=auto&aspect=true', 2, 4, 7, 249),
(36, 'Pantalón Slim Hombre AE', '• Estos Khakis son Real Good: Hechos en una fábrica que cumple con nuestros estándares de reciclaje y reducción de agua\n• Flex\n• Flex es Durable y Diseñado para aportar Stretch y poder moverte sin problema', 33, 'https://americaneagleperu.vtexassets.com/arquivos/ids/243270-800-auto?v=638694360536700000&width=800&height=auto&aspect=true', 2, 4, 5, 186),
(37, '   Pantalón Slim Hombre AE', '• Estos Khakis son Real Good: Hechos en una fábrica que cumple con nuestros estándares de reciclaje y reducción de agua\n• Flex\n• Flex es Durable y Diseñado para aportar Stretch y poder moverte sin problema', 12, 'https://americaneagleperu.vtexassets.com/arquivos/ids/243312-800-auto?v=638694360602900000&width=800&height=auto&aspect=true', 2, 4, 8, 249),
(38, 'Camiseta Ae tipo polo', 'Camiseta Ae tipo polo', 77, 'https://americaneagleperu.vtexassets.com/arquivos/ids/225380-800-auto?v=638628126215330000&width=800&height=auto&aspect=true', 2, 2, 7, 74),
(39, '   Camiseta Tipo Polo Clásica Ae', 'Camiseta Tipo Polo Clásica Ae', 17, 'https://americaneagleperu.vtexassets.com/arquivos/ids/2622629-800-auto?v=638999618652030000&width=800&height=auto&aspect=true', 2, 2, 4, 149),
(40, 'Camiseta Tipo Polo Clásica Ae', 'Camiseta Tipo Polo Clásica Ae', 77, 'https://americaneagleperu.vtexassets.com/arquivos/ids/2622584-800-auto?v=638999618625570000&width=800&height=auto&aspect=true', 2, 2, 3, 149),
(41, 'Camiseta Manga Corta Ae', 'Camiseta Manga Corta Ae', 7, 'https://americaneagleperu.vtexassets.com/arquivos/ids/2619783-800-auto?v=638999532648570000&width=800&height=auto&aspect=true', 2, 2, 2, 69),
(42, 'Camiseta Básica Manga Corta Hombre AE', 'Camiseta Básica Manga Corta Hombre AE', 26, 'https://americaneagleperu.vtexassets.com/arquivos/ids/2620956-800-auto?v=638999571755370000&width=800&height=auto&aspect=true', 2, 2, 5, 69),
(43, 'Camiseta Manga Corta Ae', 'Camiseta Manga Corta Ae', 27, 'https://americaneagleperu.vtexassets.com/arquivos/ids/2620120-800-auto?v=638999534593800000&width=800&height=auto&aspect=true', 2, 2, 1, 69),
(44, 'Camiseta AE gráfica ultra suave', 'Camiseta AE gráfica ultra suave', 45, 'https://americaneagleperu.vtexassets.com/arquivos/ids/202960-800-auto?v=638520117105530000&width=800&height=auto&aspect=true', 2, 2, 6, 49),
(45, 'Casaca Hombre Knife Total Bio Blue', 'Topitop ha diseñado prendas para pasar esta temporada con moda y estilo de la marca Hawk. Renueva tu guardarropa con esta Casaca Hombre en el color de tu preferencia y combínalos para armar tu look perfecto', 75, 'https://topitop.vtexassets.com/arquivos/ids/396592/3174300_1.jpg?v=638993578314370000', 2, 6, 7, 125.94),
(46, 'Casaca Hombre Lavandeira Azul Atlántico', 'Tipo de mangaLarga\nTipo de tejidoPlano\nEspecificacionesCasaca con bolsillo interno\nComposición100% nailon\nInstrucciones de usoNo lavar, no planchar, no usar blanqueador, limpieza al seco\nElaboraciónTeñido\nTipo de cuelloCon cierre', 13, 'https://topitop.vtexassets.com/arquivos/ids/387611/3143591_1.jpg?v=638900374567900000', 2, 6, 4, 194.5),
(47, 'Casaca Hombre Trauco Grey Fit Poly Htr', 'Tipo de manga Larga\nTipo de tejido Plano\nEspecificaciones Casaca gruesa estilo blazer con acolchado y bolsillos\nComposición100% poliéster\nInstrucciones de uso No lavar, no planchar, no usar blanqueador, limpieza al seco\nElaboración Jaspeado', 44, 'https://topitop.vtexassets.com/arquivos/ids/387603/3127472_1.jpg?v=638900373603200000', 2, 6, 3, 109.95),
(48, 'Casaca Hombre Enzo Total Bio Cristal', 'Tipo de mangaLarga\nTipo de tejidoPlano\nComposición70% algodón, 20% poliéster y 10% rayon\nInstrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente', 13, 'https://topitop.vtexassets.com/arquivos/ids/386963/3146514_1.jpg?v=638870234310870000', 2, 6, 5, 129.5),
(49, 'Casaca Hombre Kabult Total Frost Bleach', 'EspecificacionesCasaca cerrada con capucha, y bolsillo canguro en delantero con estampado\nInstrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente', 20, 'https://topitop.vtexassets.com/arquivos/ids/386257/3148370_1.jpg?v=638845957743730000', 2, 6, 1, 94.95),
(50, 'Chompa Hombre Bayco Camel', 'Tipo de mangaLarga\nTipo de tejidoPunto\nComposición100% poliéster\nInstrucciones de usoLavar a mano, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nElaboraciónHilados de distintos colores\nTipo de cuelloRedondo', 19, 'https://topitop.vtexassets.com/arquivos/ids/396700/3145083_1.jpg?v=638993784210930000', 2, 7, 6, 53.94),
(51, 'Chompa Hombre Bayco Verde Olive', 'Tipo de mangaLarga\nTipo de tejidoPunto\nComposición100% poliéster\nInstrucciones de usoLavar a mano, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nElaboraciónHilados de distintos colores\nTipo de cuelloRedondo', 16, 'https://topitop.vtexassets.com/arquivos/ids/396696/3148466_1.jpg?v=638993783772000000', 2, 7, 7, 53.94),
(52, 'Chompa Hombre Jhair Guinda Shadow', 'Tipo de mangaLarga\nTipo de tejidoPunto\nComposición100% poliéster\nInstrucciones de usoLavar a mano, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nElaboraciónHilados de distintos colores\nTipo de cuelloRedondo', 23, 'https://topitop.vtexassets.com/arquivos/ids/396150/3148223_1.jpg?v=638993520714770000', 2, 7, 4, 59.94),
(53, 'Chompa Hombre Sam Coco Melange', 'Topitop ha diseñado prendas para pasar esta temporada con moda y estilo de la marca Topitop Hombre. Renueva tu guardarropa con estas Chompas para Hombre en el color de tu preferencia y combínalos para armar tu look perfecto', 34, 'https://topitop.vtexassets.com/arquivos/ids/386702/1867045_1.jpg?v=638870105308970000', 2, 7, 3, 49.95),
(54, 'Chompa Hombre Jhair Blanco Optico', 'Tipo de mangaLarga\nTipo de tejidoPunto\nEspecificacionesLitado de diferentes colores\nComposición100% poliéster\nInstrucciones de usoLavar a mano, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente', 18, 'https://topitop.vtexassets.com/arquivos/ids/378656/3081731_1.jpg?v=638764072826600000', 2, 7, 2, 39.96),
(55, '  Chompa-Hombre-Sam-Rojo-Fuerte-M ', 'Topitop ha diseñado prendas para pasar esta temporada con moda y estilo de la marca Topitop Hombre. Renueva tu guardarropa con esta Chompa Hombre en el color de tu preferencia y combínalos para armar tu look perfecto', 56, 'https://topitop.vtexassets.com/arquivos/ids/378676/2074090_1.jpg?v=638764075229900000', 2, 7, 1, 49.95),
(56, 'Polera Hombre David Core Mostaza', 'Instrucciones de usoLavar a máquina 30°C, no usar blanqueador, secar a máquina 40°C, planchar T° máxima 110°C y no limpieza en seco\nComposición60% algodón y 40% poliéster\nElaboraciónTeñido\nTipo de mangaLarga\nBolsillosCon bolsillos delanteros', 34, 'https://topitop.vtexassets.com/arquivos/ids/361116/1729220_1.jpg?v=638549991624300000', 2, 1, 1, 71.94),
(57, 'Polera Hombre David Core Verde Campo', 'Instrucciones de usoLavar a máquina 30°C, no usar blanqueador, secar a máquina 40°C, planchar T° máxima 110°C y no limpieza en seco\nComposición60% algodón y 40% poliéster\nElaboraciónTeñido\nTipo de mangaLarga\nBolsillosCon bolsillos delanteros', 65, 'https://topitop.vtexassets.com/arquivos/ids/361100/1729204_1.jpg?v=638549991540900000', 2, 1, 6, 71.94),
(58, 'Polera Hombre Gabriel Core Verde Campo', 'Instrucciones de usoLavar a máquina 30°C, no usar blanqueador, secar a máquina 40°C, planchar T° máxima 110°C y no limpieza en seco\nComposición60% algodón y 40% poliéster\nElaboraciónTeñido\nTipo de mangaLarga\nMaterialFranela\nTipo de tejidoPunto', 35, 'https://topitop.vtexassets.com/arquivos/ids/366539/1729228_1.jpg?v=638630744007700000', 2, 1, 6, 59.94),
(59, 'Polera Hombre Gabriel Core Gris Fit Poly', 'Instrucciones de usoLavar a máquina 30°C, no usar blanqueador, secar a máquina 40°C, planchar T° máxima 110°C y no limpieza en seco\nComposición58% poliéster y 42% algodón\nTipo de mangaLarga\nMaterialFranela\nTipo de tejidoPunto\nTipo de cuelloRedondo', 45, 'https://topitop.vtexassets.com/arquivos/ids/366543/1729232_1.jpg?v=638630744031500000', 2, 1, 7, 59.94),
(60, 'Polera Hombre David Core Negro', 'Instrucciones de usoLavar a máquina 30°C, no usar blanqueador, secar a máquina 40°C, planchar T° máxima 110°C y no limpieza en seco\nComposición60% algodón y 40% poliéster\nElaboraciónTeñido\nBolsillosCon bolsillos delanteros\nMaterial95% algodón, 8% viscosa', 18, 'https://topitop.vtexassets.com/arquivos/ids/360984/1687340_1.jpg?v=638549990928730000', 2, 1, 4, 71.94),
(61, 'Bermuda Hombre Yann Coco', 'Composición51% algodón, 44% poliéster y 5% viscosa\nInstrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nElaboraciónHilados de distintos colores', 45, 'https://topitop.vtexassets.com/arquivos/ids/394724/3156611_1.jpg?v=638987561417800000', 2, 3, 3, 54.95),
(62, 'Bermuda Hombre Marvin Beige Oscuro', 'Tipo de tejidoPlano\nComposición75% algodón, 22% lino y 3% elastano\nInstrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente', 24, 'https://topitop.vtexassets.com/arquivos/ids/394728/3145616_1.jpg?v=638987561854130000', 2, 3, 2, 71.45),
(63, 'Bermuda Hombre Yann Azul Pageant', 'Tipo de tejidoPunto\nComposición51% algodón, 44% poliéster y 5% viscosa\nInstrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente', 9, 'https://topitop.vtexassets.com/arquivos/ids/394777/3156633_1.jpg?v=638987567445300000', 2, 3, 5, 54.95),
(64, 'Bermuda Hombre Anfib Beige Natural', 'Tipo de tejidoPlano\nEspecificacionesBolsillo cargo, pretina elasticada.\nComposición65% algodón, 32% nailon y 3% elastano\nInstrucciones de usoLavar a máquina con colores similares, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente', 12, 'https://topitop.vtexassets.com/arquivos/ids/394785/3149187_1.jpg?v=638987568316130000', 2, 3, 6, 77.94),
(65, 'Bermuda Hombre Golum Negro', 'Tipo de tejidoPlano\nEspecificacionesBolsillos cargo con cierre\nComposición100% algodón\nInstrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente', 18, 'https://topitop.vtexassets.com/arquivos/ids/394583/3145974_1.jpg?v=638987313506600000', 2, 3, 3, 65.95),
(66, 'Casaca Niño Sir Black Denim', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición100% algodón\nElaboraciónCrudo\nTipo de mangaLarga\nTipo de tejidoPlano\nTipo de cuelloCamisa', 12, 'https://topitop.vtexassets.com/arquivos/ids/386399/3099444_1.jpg?v=638848551518230000', 4, 6, 8, 49.95),
(67, 'Casaca Jovencito Milan Negro', 'Instrucciones de usoLavar a máquina 30ºC, no usar blanqueador, secar a máquina 40ºC, no planchar y no limpieza en seco\nComposición100% nailon\nElaboraciónTeñido\nTipo de mangaLarga\nBolsillosCon bolsillos delanteros\nTipo de tejidoPlano', 34, 'https://topitop.vtexassets.com/arquivos/ids/382078/3109251_1.jpg?v=638803500274300000', 4, 6, 8, 55.96),
(68, 'Casaca Jovencito Mark Negro', 'Instrucciones de usoLavar a mano, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nComposición100% nailon\nElaboraciónTeñido\nTipo de mangaLarga\nBolsillosCon bolsillos delanteros\nTipo de tejidoPlano', 23, 'https://topitop.vtexassets.com/arquivos/ids/383019/3108302_1.jpg?v=638808707930970000', 4, 6, 2, 56.96),
(69, 'Casaca Niña Erika Medium Wash', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición96% algodón, 2% elastano y 2% poliéster\nElaboraciónCrudo\nTipo de mangaLarga', 30, 'https://topitop.vtexassets.com/arquivos/ids/392248/3130325_1.jpg?v=638957320891870000', 4, 6, 8, 59.96),
(70, 'Casaca Niña Stella Coco', 'Instrucciones de usoLavar a máquina con colores similares, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nComposición100% poliéster\nElaboraciónEstampado\nTipo de mangaLarga\nBolsillosCon bolsillos delanteros\nTipo de tejidoPlano', 11, 'https://topitop.vtexassets.com/arquivos/ids/386465/3093600_1.jpg?v=638853506196400000', 4, 6, 9, 67.96),
(71, 'Casaca Niña Inde Light Wash', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición75% algodón, 13% viscosa y 12% poliéster\nElaboraciónCrudo', 34, 'https://topitop.vtexassets.com/arquivos/ids/386461/3108938_1.jpg?v=638853505697800000', 4, 6, 9, 51.96),
(72, 'Casaca Niña Oriana Coral Siena', 'Instrucciones de usoLavar a mano, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nComposición97% poliéster y 3% elastano\nElaboraciónTeñido\nTipo de mangaLarga ranglan\nBolsillosCon bolsillos delanteros', 23, 'https://topitop.vtexassets.com/arquivos/ids/385847/3100982_1.jpg?v=638838736133630000', 4, 6, 9, 47.96),
(73, 'Casaca Jovencita Sandra Azul Imperial', 'Instrucciones de usoNo lavar, no planchar, no usar blanqueador, limpieza al seco\nComposición100% poliéster\nElaboraciónTeñido\nTipo de mangaLarga\nBolsillosCon bolsillos delanteros\nTipo de tejidoPlano', 34, 'https://topitop.vtexassets.com/arquivos/ids/382946/3096865_1.jpg?v=638808699461570000', 4, 6, 2, 63.96),
(74, 'Casaca Jovencita Chana Rosado Agua', 'Instrucciones de usoLavar a máquina 30ºC, no usar blanqueador, secar a máquina 40ºC, no planchar y no limpieza en seco\nComposición100% nailon\nElaboraciónTeñido\nTipo de mangaLarga\nBolsillosCon bolsillos delanteros\nTipo de tejidoPlano', 45, 'https://topitop.vtexassets.com/arquivos/ids/359577/1999065_1.jpg?v=638525710945000000', 4, 6, 8, 55.96),
(75, 'Chompa Niña Patricia Rosado New', 'Instrucciones de usoLavar a mano, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nComposición80% algodón y 20% nailon\nElaboraciónTeñido\nTipo de mangaLarga\nTipo de tejidoPunto', 23, 'https://topitop.vtexassets.com/arquivos/ids/389312/3123369_1.jpg?v=638923530825200000', 4, 7, 8, 39.95),
(76, 'Chompa Niña Makayla Rojo Americ', 'Instrucciones de usoLavar a mano, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nComposición100% algodón\nElaboraciónTeñido\nTipo de mangaLarga\nTipo de tejidoPunto\nTipo de cuelloRedondo\nEspecificacionesBordado satínado en delantero', 23, 'https://topitop.vtexassets.com/arquivos/ids/383577/3089115_1.jpg?v=638814523736330000', 4, 7, 9, 31.96),
(77, 'Chompa Niña Novah Azul Imperial', 'Instrucciones de usoLavar a mano, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nComposición50% viscosa, 28% poliéster y 22% nailon\nElaboraciónTeñido\nTipo de mangaLarga\nTipo de tejidoPunto', 45, 'https://topitop.vtexassets.com/arquivos/ids/383581/3089154_1.jpg?v=638814524215070000', 4, 7, 9, 27.96),
(78, 'Chompa Niña Leonor Gris Melange', 'Instrucciones de usoLavar a mano, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nComposición50% viscosa, 28% poliéster y 22% nailon\nElaboraciónTeñido\nTipo de mangaLarga\nTipo de tejidoPunto\nTipo de cuelloRedondo', 14, 'https://topitop.vtexassets.com/arquivos/ids/383011/3085820_1.jpg?v=638808707041430000', 4, 7, 2, 27.96),
(79, 'Chompa Niña Leonor Azul Victoria', 'Instrucciones de usoLavar a mano, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nComposición50% viscosa, 28% poliéster y 22% nailon\nElaboraciónTeñido\nTipo de mangaLarga\nTipo de tejidoPunto\nTipo de cuelloRedondo', 34, 'https://topitop.vtexassets.com/arquivos/ids/383015/3085807_1.jpg?v=638808707492400000', 4, 7, 8, 27.96),
(80, ' Chompa Niño Oscar Verde', 'Instrucciones de usoLavar a máquina con colores similares, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nComposición50% viscosa, 28% poliéster y 22% nailon\nElaboraciónHilados de distintos colores\nTipo de mangaLarga', 36, 'https://topitop.vtexassets.com/arquivos/ids/382987/3096574_1.jpg?v=638808704162770000', 4, 7, 8, 27.96),
(81, 'Chompa Niño Oscar Azul Persa', 'Instrucciones de usoLavar a máquina con colores similares, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nComposición50% viscosa, 28% poliéster y 22% nailon\nElaboraciónHilados de distintos colores\nTipo de mangaLarga', 30, 'https://topitop.vtexassets.com/arquivos/ids/383003/3096535_1.jpg?v=638808706095330000', 4, 7, 2, 27.96),
(82, 'Chompa Niño Oscar Coco', 'Instrucciones de usoLavar a máquina con colores similares, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nComposición50% viscosa, 28% poliéster y 22% nailon\nElaboraciónHilados de distintos colores\nTipo de mangaLarga', 41, 'https://topitop.vtexassets.com/arquivos/ids/382999/3096561_1.jpg?v=638808705612000000', 4, 7, 2, 27.96),
(83, 'Falda Niña Luna Blanco', 'Instrucciones de usoLavar a mano, no usar blanqueador, no remojar, planchar al reves Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición99% poliéster y 1% elastano\nElaboraciónTeñido\nTipo de tejidoPlano', 14, 'https://topitop.vtexassets.com/arquivos/ids/395305/3136455_1.jpg?v=638987629731070000', 4, 8, 2, 32.95),
(84, 'Falda Niña Macarena Lila Violeta', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición60% algodón y 40% poliéster\nElaboraciónTeñido\nTipo de tejidoPlano', 23, 'https://topitop.vtexassets.com/arquivos/ids/394107/3170601_1.jpg?v=638975786536600000', 4, 8, 9, 34.95),
(85, 'Falda Niña Macarena Rosado Wood', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición100% algodón\nElaboraciónTeñido\nTipo de tejidoPlano\nEspecificacionesCon lazos decorativos', 12, 'https://topitop.vtexassets.com/arquivos/ids/394347/3155814_1.jpg?v=638975812301670000', 4, 8, 8, 34.95),
(86, 'Falda Jovencita Emma Crema Pastel', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición50% algodón y 50% poliéster\nElaboraciónTeñido\nTipo de tejidoPunto', 23, 'https://topitop.vtexassets.com/arquivos/ids/394259/3154880_1.jpg?v=638975802683100000', 4, 8, 9, 39.95),
(87, 'Falda Jovencita Emma Rosado Chicle', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición50% algodón y 50% poliéster\nEspecificacionesEstampado delantero y cinta en inferior', 18, 'https://topitop.vtexassets.com/arquivos/ids/394255/3154893_1.jpg?v=638975802274370000', 4, 8, 2, 39.95),
(88, 'Falda Short Niña Lucero Rosado Carmín', 'Instrucciones de usoLavar a mano, no usar blanqueador, no remojar, planchar al reves Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición60% algodón 40% poliéster y 95% algodón 5% elastano\nEspecificacionesFalda short, pretina con elástico', 45, 'https://topitop.vtexassets.com/arquivos/ids/390414/2066371_1.jpg?v=638949358652000000', 4, 8, 9, 27.96),
(89, 'Falda Niña Arlet Rosado Wood', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición50% algodón y 50% poliéster\nEspecificacionesFalda con tableros y pretina elástica', 34, 'https://topitop.vtexassets.com/arquivos/ids/391266/3135062_1.jpg?v=638949863977200000', 4, 8, 2, 34.95),
(90, 'Falda Denim Niña Rubi Medium Wash', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición100% algodón\nBolsillosCon bolsillos delanteros y posteriores\nEspecificacionesBasta con pliegue', 45, 'https://topitop.vtexassets.com/arquivos/ids/393015/3134280_1.jpg?v=638965890437200000', 4, 8, 8, 47.94),
(91, 'Falda Niña Luana Crema Pastel', 'Topitop ha diseñado prendas para pasar esta temporada con moda y estilo de la marca Topitop Kids. Renueva tu guardarropa con esta Falda Niña en el color de tu preferencia y combínalos para armar tu look perfecto', 34, 'https://topitop.vtexassets.com/arquivos/ids/397794/3156424_1.jpg?v=639008294281770000', 4, 8, 2, 41.94),
(92, 'Pantalón Niña Dercy Beige Arena', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición100% algodón\nElaboraciónTeñido\nBolsillosCon bolsillos a los costados\nTipo de tejidoPlano', 56, 'https://topitop.vtexassets.com/arquivos/ids/395317/3131343_1.jpg?v=638987630948670000', 4, 4, 8, 43.95),
(93, 'Jean Niña Ivy Medium Wash', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición100% algodón\nElaboraciónTeñido\nEspecificacionesCon pretina elasticada, doblez en basta', 12, 'https://topitop.vtexassets.com/arquivos/ids/395309/3169922_1.jpg?v=638987630130400000', 4, 4, 9, 47.95),
(94, 'Jean Niña Rosa Medium Wash', 'Instrucciones de usoLavar a mano, no usar blanqueador, no remojar, planchar al reves Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición100% lyocel\nElaboraciónCrudo\nTipo de tejidoPlano\nEspecificacionesPretina elasticada', 19, 'https://topitop.vtexassets.com/arquivos/ids/394039/3142541_1.jpg?v=638975779366270000', 4, 4, 2, 44.95),
(95, 'Jean Niña Jacky Acid Wash', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición72% algodón, 27% poliéster y 1% elastano\nElaboraciónCrudo\nBolsillosCon bolsillos posteriores', 18, 'https://topitop.vtexassets.com/arquivos/ids/394091/3142732_1.jpg?v=638975784842570000', 4, 4, 2, 34.95),
(96, 'Jean Niña Jacky Blue Wash', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición72% algodón, 27% poliéster y 1% elastano\nElaboraciónCrudo\nBolsillosCon bolsillos posteriores', 44, 'https://topitop.vtexassets.com/arquivos/ids/394087/3142745_1.jpg?v=638975784432070000', 4, 4, 2, 34.95),
(97, 'Jean Jovencita Rosita Blue Wash', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición100% algodón\nElaboraciónTeñido\nBolsillosCon bolsillos delanteros y posteriores', 17, 'https://topitop.vtexassets.com/arquivos/ids/392244/3084202_1.jpg?v=638957320463630000', 4, 4, 8, 49.95),
(98, 'Pantalón Niño Mateo Beige Safari', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición98% algodón y 2% elastano\nElaboraciónTeñido\nBolsillosCon bolsillos delanteros y posteriores', 23, 'https://topitop.vtexassets.com/arquivos/ids/395349/3141452_1.jpg?v=638987634265630000', 4, 4, 8, 49.45),
(99, 'Jogger Jovencito Joao Black Denim', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición82% algodón, 16% poliéster y 2% elastano\nBolsillosCon bolsillos delanteros y posteriores', 34, 'https://topitop.vtexassets.com/arquivos/ids/392228/3117561_1.jpg?v=638957318744600000', 4, 4, 9, 59.94),
(100, 'Jogger Niño Jackson Dark Wash', 'Instrucciones de usoLavar a máquina con colores similares, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nComposición76% algodón, 22% poliéster y 2% elastano\nElaboraciónTeñido\nBolsillosCon bolsillos delanteros y posteriores', 34, 'https://topitop.vtexassets.com/arquivos/ids/389898/2078438_1.jpg?v=638929684036570000', 4, 4, 9, 41.94),
(101, 'Pantalón Niño Sone Azul Sombra', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición100% algodón\nElaboraciónTeñido\nBolsillosCon bolsillos delanteros\nTipo de tejidoPlano', 45, 'https://topitop.vtexassets.com/arquivos/ids/391223/3122046_1.jpg?v=638949859192600000', 4, 4, 2, 44.95),
(102, 'Jean Niño Jack Dark Wash', 'Instrucciones de usoLavar a máquina 30ºC, lavar por separado, no usar blanqueador, secar a máquina 40ºC, planchar Tº máxima 110ºC y no limpieza en seco\nComposición76% algodón, 22% poliéster y 2% elastano\nBolsillosCon bolsillos delanteros y posteriores', 23, 'https://topitop.vtexassets.com/arquivos/ids/388967/3117597_1.jpg?v=638917482700470000', 4, 4, 8, 41.94),
(103, 'Jogger Jovencito Joao Medium Wash', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nEspecificacionesBolsillos cargo, cintura y botapies elasticadas', 45, 'https://topitop.vtexassets.com/arquivos/ids/380977/3080482_1.jpg?v=638793182669070000', 4, 4, 2, 59.94),
(104, 'Polera Niña Celine Rosado Icing', 'Instrucciones de usoLavar a máquina 30ºC, no usar blanqueador, secar a máquina 40ºC, planchar Tº máxima 110ºC y no limpieza en seco\nComposición50% algodón y 50% poliéster\nElaboraciónTeñido\nTipo de mangaLarga\nBolsillosCon bolsillos delanteros', 13, 'https://topitop.vtexassets.com/arquivos/ids/387757/3120391_1.jpg?v=638900435782370000', 4, 1, 2, 39.95),
(105, 'Polera Niña Gaia Fucsia Rose', 'Instrucciones de usoLavar a máquina con colores similares, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nComposición95% algodón y 5% poliéster\nElaboraciónTeñido\nTipo de mangaLarga\nBolsillosCon bolsillos delanteros', 68, 'https://topitop.vtexassets.com/arquivos/ids/387108/2074595_1.jpg?v=638870314001700000', 4, 1, 9, 34.95),
(106, 'Polera Niña Amelina Coco', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, no remojar, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición100% algodón\nEspecificacionesPolera con capucha y mangas estampadas', 65, 'https://topitop.vtexassets.com/arquivos/ids/384771/2076962_1.jpg?v=638827592833870000', 4, 1, 2, 36.96),
(107, 'Polera Niña Laura Fucsia Berry', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición60% algodón y 40% poliéster\nElaboraciónTeñido\nTipo de cuelloRedondo', 14, 'https://topitop.vtexassets.com/arquivos/ids/382895/3082078_1.jpg?v=638808694077130000', 4, 1, 9, 27.96),
(108, 'Polera Jovencita Train Verde Pad', 'Instrucciones de usoLavar a máquina con colores similares, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nComposición50% algodón y 50% poliéster', 17, 'https://topitop.vtexassets.com/arquivos/ids/382950/3080891_1.jpg?v=638808699937970000', 4, 1, 2, 36.96),
(109, 'Polera Niño Ryan Blanco', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición76% poliéster, 30% rayon y 4% elastano\nElaboraciónTeñido\nTipo de cuelloRedondo', 45, 'https://topitop.vtexassets.com/arquivos/ids/388987/3122325_1.jpg?v=638917485030400000', 4, 1, 8, 39.95),
(110, 'Polera Niño Juan Diego Verde Militar', 'Instrucciones de usoLavar a mano, no usar blanqueador, no remojar, planchar al reves Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición60% algodón y 40% poliéster\nElaboraciónTeñido\nEspecificacionesBordado y estampado en delantero', 45, 'https://topitop.vtexassets.com/arquivos/ids/388991/3122007_1.jpg?v=638917485485230000', 4, 1, 9, 44.95),
(111, 'Polera Niño Paulo Gris Melange', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, no remojar, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición50% algodón y 50% poliéster', 56, 'https://topitop.vtexassets.com/arquivos/ids/387721/3119077_1.jpg?v=638900431631900000', 4, 1, 2, 39.95),
(112, 'Polera Niño Paulo Negro', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, no remojar, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición50% algodón y 50% poliéster', 45, 'https://topitop.vtexassets.com/arquivos/ids/387717/3119116_1.jpg?v=638900431129300000', 4, 1, 9, 39.95),
(113, 'Polera Niño Lucio Rojo', 'Instrucciones de usoLavar a mano, no usar blanqueador, no remojar, planchar al reves Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición60% algodón y 40% poliéster\nElaboraciónTeñido\nTipo de mangaLarga\nTipo de tejidoPunto', 23, 'https://topitop.vtexassets.com/arquivos/ids/381071/3081521_1.jpg?v=638793192912500000', 4, 1, 8, 27.96),
(114, 'Polo Niña Karla Coco', 'Instrucciones de usoLavar a mano, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nComposición70% algodón, 20% nailon y 10% elastano\nElaboraciónTeñido\nTipo de mangaCorta\nEspecificacionesTela borderie con forro interno', 17, 'https://topitop.vtexassets.com/arquivos/ids/395258/3123343_1.jpg?v=638987624669030000', 4, 2, 8, 38.45),
(115, 'Polo Niña Belinda Blanco', 'Instrucciones de usoLavar a mano, no usar blanqueador, no remojar, planchar al reves Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición100% algodón\nElaboraciónTeñido\nTipo de mangaCero\nEspecificacionesCon estampado delantero', 45, 'https://topitop.vtexassets.com/arquivos/ids/395294/3132325_1.jpg?v=638987628501670000', 4, 2, 9, 32.95),
(116, 'Polo Niña Lazy Blanco', 'Instrucciones de usoLavar a mano, no usar blanqueador, no remojar, planchar al reves Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición100% algodón\nElaboraciónTeñido\nTipo de mangaCorta\nTipo de tejidoPunto\nTipo de cuelloRedondo', 34, 'https://topitop.vtexassets.com/arquivos/ids/395371/3135435_1.jpg?v=638987636436300000', 4, 2, 2, 27.45),
(117, 'Polo Niña Silvia Coco', 'Instrucciones de usoLavar a mano, no usar blanqueador, no remojar, planchar al reves Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición100% algodón\nElaboraciónTeñido\nTipo de mangaCorta\nEspecificacionesPolo con volantes', 43, 'https://topitop.vtexassets.com/arquivos/ids/394119/3147000_1.jpg?v=638975787819970000', 4, 2, 2, 29.95),
(118, 'Polo Jovencita Marieta Amarillo Light', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición100% algodón\nElaboraciónTeñido\nTipo de mangaCorta', 34, 'https://topitop.vtexassets.com/arquivos/ids/394251/3136804_1.jpg?v=638975801844900000', 4, 2, 8, 19.95),
(119, 'Polo Jovencita Marieta Lila Violeta', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición100% algodón\nElaboraciónTeñido\nTipo de mangaCorta', 45, 'https://topitop.vtexassets.com/arquivos/ids/394239/3136765_1.jpg?v=638975800548400000', 4, 2, 2, 19.95),
(120, ' Polo Niño Jack Coral Siena', 'Instrucciones de usoLavar a mano, no usar blanqueador, no remojar, planchar al reves Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición100% algodón\nElaboraciónTeñido\nTipo de mangaCorta', 34, 'https://topitop.vtexassets.com/arquivos/ids/395321/3139808_1.jpg?v=638987631361600000', 4, 2, 9, 27.45),
(121, 'Polo Cuello Camisa Niño Gino Naranja Ocre', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición100% algodón\nElaboraciónEstampado\nTipo de mangaCorta', 34, 'https://topitop.vtexassets.com/arquivos/ids/395419/3128292_1.jpg?v=638987641541300000', 4, 2, 8, 27.45),
(122, 'Polo Cuello Camisa Niño Gino Celeste Intenso', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición100% algodón\nElaboraciónEstampado\nTipo de mangaCorta', 45, 'https://topitop.vtexassets.com/arquivos/ids/395427/3128264_1.jpg?v=638987642395570000', 4, 2, 2, 27.45),
(123, 'Polo Niño Eros Aqua Neón', 'Instrucciones de usoLavar a mano, no usar blanqueador, no remojar, planchar al reves Tº máxima 110ºC, no limpieza al seco, secar al ambiente', 34, 'https://topitop.vtexassets.com/arquivos/ids/394307/3136325_1.jpg?v=638975807982270000', 4, 2, 9, 19.95),
(124, 'Polo Niño Eros Azul Atlántico', 'Instrucciones de usoLavar a mano, no usar blanqueador, no remojar, planchar al reves Tº máxima 110ºC, no limpieza al seco, secar al ambiente', 34, 'https://topitop.vtexassets.com/arquivos/ids/394303/3136299_1.jpg?v=638975807541670000', 4, 2, 8, 19.95),
(125, 'Short Niña Victoria Crema Pastel', 'Instrucciones de usoLavar a mano, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nComposición60% algodón y 40% acrílico\nElaboraciónHilados de distintos colores', 34, 'https://topitop.vtexassets.com/arquivos/ids/395278/3153588_1.jpg?v=638987627287170000', 4, 3, 8, 38.45),
(126, 'Short Niña Rosenda Medium Wash', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición100% algodón\nElaboraciónCrudo\nBolsillosCon bolsillos delanteros y posteriores', 45, 'https://topitop.vtexassets.com/arquivos/ids/394131/3143600_1.jpg?v=638975789123470000', 4, 3, 9, 41.94),
(127, 'Short Denim Niña Vilma Light Wash', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición100% algodón\nElaboraciónCrudo\nBolsillosCon bolsillos delanteros y posteriores', 19, 'https://topitop.vtexassets.com/arquivos/ids/394051/3130870_1.jpg?v=638975780661230000', 4, 3, 2, 41.94),
(128, 'Short Denim Jovencita Valeria Medium Wash', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición80% algodón, 19% poliéster y 1% elastano\nBolsillosCon bolsillos delanteros y posteriores', 45, 'https://topitop.vtexassets.com/arquivos/ids/394059/3138207_1.jpg?v=638975781497900000', 4, 3, 9, 39.95),
(129, 'Short Denim Jovencita Valeria Dark Wash', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición80% algodón, 19% poliéster y 1% elastano\nBolsillosCon bolsillos delanteros y posteriores', 34, 'https://topitop.vtexassets.com/arquivos/ids/394063/3138220_1.jpg?v=638975781920300000', 4, 3, 2, 39.95),
(130, 'Short Jovencita Eva Fucsia Rose', 'Instrucciones de usoLavar a mano, no usar blanqueador, no remojar, planchar al reves Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición98% algodón y 2% elastano\nElaboraciónTeñido\nBolsillosCon bolsillos delanteros', 34, 'https://topitop.vtexassets.com/arquivos/ids/394223/3143938_1.jpg?v=638975798861470000', 4, 3, 8, 39.94),
(131, 'Bermuda Niño Manu Nude', 'Instrucciones de usoLavar a mano, no usar blanqueador, no remojar, planchar al reves Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición73% algodón y 27% rayon', 18, 'https://topitop.vtexassets.com/arquivos/ids/395329/3166570_1.jpg?v=638987632218600000', 4, 3, 9, 38.45),
(132, 'Bermuda Denim Niño Olio Bleach', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición82% algodón, 16% poliéster y 2% elastano\nElaboraciónTeñido\nBolsillosCon bolsillos delanteros', 22, 'https://topitop.vtexassets.com/arquivos/ids/395254/3123502_1.jpg?v=638987623532400000', 4, 3, 8, 47.94),
(133, 'Bermuda Denim Niño Luty Light Wash', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición98% algodón y 2% elastano\nElaboraciónTeñido\nBolsillosCon bolsillos delanteros y posteriores', 15, 'https://topitop.vtexassets.com/arquivos/ids/394023/3134786_1.jpg?v=638975777620500000', 4, 3, 2, 34.95),
(134, 'Bermuda Jovencito Homero Beige Botanico', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición55% algodón y 45% poliéster\nElaboraciónTeñido\nBolsillosCon bolsillos delanteros', 18, 'https://topitop.vtexassets.com/arquivos/ids/394195/3133924_1.jpg?v=638975795903670000', 4, 3, 8, 29.95),
(135, 'Bermuda Jovencito Homero Niquel Poly Htr', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición55% algodón y 45% poliéster\nElaboraciónTeñido\nBolsillosCon bolsillos delanteros', 67, 'https://topitop.vtexassets.com/arquivos/ids/394191/3135728_1.jpg?v=638975795478500000', 4, 3, 9, 29.95),
(136, 'Bermuda Jovencito Franco Gris Melange', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición100% algodón\nElaboraciónTeñido\nBolsillosCon bolsillos delanteros y posteriores', 45, 'https://topitop.vtexassets.com/arquivos/ids/395391/3128323_1.jpg?v=638987638465500000', 4, 3, 8, 32.95),
(137, 'Vestido Niña Cleopatra Blanco', 'Instrucciones de usoLavar a máquina con colores similares, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nComposición100% algodón\nElaboraciónEstampado', 56, 'https://topitop.vtexassets.com/arquivos/ids/396628/3139334_1.jpg?v=638993582775470000', 4, 5, 8, 53.94),
(138, 'Vestido Niña Martina Rosado Chicle', 'Instrucciones de usoLavar a mano, no usar blanqueador, no planchar, no limpieza al seco, secar al ambiente\nComposición78% algodón, 17% poliéster y 5% elastano\nElaboraciónTeñido\nTipo de mangaCero', 34, 'https://topitop.vtexassets.com/arquivos/ids/396604/3158816_1.jpg?v=638993579678430000', 4, 5, 9, 41.94),
(139, 'Vestido Niña Nalia Amarillo Agua', 'Instrucciones de usoLavar a mano, no usar blanqueador, no remojar, planchar al reves Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición97% poliéster y 3% elastano\nElaboraciónEstampado\nTipo de mangaCorta', 19, 'https://topitop.vtexassets.com/arquivos/ids/396632/3139029_1.jpg?v=638993583249900000', 4, 5, 8, 36.95),
(140, 'Vestido Niña Xime Coco', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición53% poliéster, 42% algodón y 5% licra\nElaboraciónTeñido\nTipo de mangaCorta', 23, 'https://topitop.vtexassets.com/arquivos/ids/396624/3141896_1.jpg?v=638993582326700000', 4, 5, 2, 35.95),
(141, 'Vestido Niña Xime Lila Violeta', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición53% poliéster, 42% algodón y 5% licra\nElaboraciónTeñido\nTipo de mangaCorta', 45, 'https://topitop.vtexassets.com/arquivos/ids/396616/3141922_1.jpg?v=638993581000870000', 4, 5, 8, 36.94),
(142, 'Vestido Denim Niña Romelia Blue Wash', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición100% lyocel\nElaboraciónCrudo\nTipo de mangaCero', 34, 'https://topitop.vtexassets.com/arquivos/ids/395246/3143170_1.jpg?v=638987620230800000', 4, 5, 2, 43.93),
(143, 'Vestido Niña Magie Medium Was', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición77% algodón, 21% poliéster, y 2% elastano\nElaboraciónCrudo\nTipo de mangaCero', 18, 'https://topitop.vtexassets.com/arquivos/ids/394267/3133584_1.jpg?v=638975803534670000', 4, 5, 8, 39.96);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `stock`, `imagen_url`, `categoria_id`, `tipo_prenda_id`, `talla_id`, `precio`) VALUES
(144, 'Vestido Niña Magie Light Wash', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición77% algodón, 21% poliéster, y 2% elastano\nElaboraciónCrudo\nTipo de mangaCero', 32, 'https://topitop.vtexassets.com/arquivos/ids/394271/3133571_1.jpg?v=638975803973570000', 4, 5, 2, 39.94),
(145, 'Vestido Denim Niña Angelica Medium Wash', 'Instrucciones de usoLavar a mano o máquina con colores similares, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, secar al ambiente\nComposición100% lyocell\nElaboraciónCrudo\nTipo de mangaAlita', 45, 'https://topitop.vtexassets.com/arquivos/ids/394047/3141504_1.jpg?v=638975780220800000', 4, 5, 2, 34.96),
(146, ' Vestido-Niña-Magie-Acid-Wash-06 ', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nComposición77% algodón, 21% poliéster, y 2% elastano\nElaboraciónCrudo\nTipo de tejidoPlano', 32, 'https://topitop.vtexassets.com/arquivos/ids/394275/3133597_1.jpg?v=638975804408330000', 4, 5, 8, 39.95),
(147, 'Jean Mujer Fabiola Azul', 'Instrucciones de usoLavar a máquina 30ºC, lavar por separado, no usar blanqueador, secar a máquina 40ºC, planchar Tº máxima 110ºC y no limpieza en seco\nTipo de telaDenim\nElaboraciónTeñido\nBolsillosCon bolsillos delanteros y posteriores', 18, 'https://topitop.vtexassets.com/arquivos/ids/392212/3164242_1.jpg?v=638957316996570000', 1, 4, 1, 51.96),
(148, 'Jean Mujer Tayra Total Bleach', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nTipo de telaDenim\nElaboraciónTeñido\nBolsillosCon bolsillos delanteros y posteriores', 17, 'https://topitop.vtexassets.com/arquivos/ids/393999/3173060_1.jpg?v=638975774999530000', 1, 4, 6, 101.94),
(149, 'Falda Denim Mujer Zahori Cristal', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nTipo de telaDenim\nElaboraciónTeñido\nBolsillosCon bolsillos delanteros y posteriores', 34, 'https://topitop.vtexassets.com/arquivos/ids/393987/3173387_1.jpg?v=638975773706500000', 1, 8, 1, 95.94),
(150, 'Falda Denim Mujer Selena Total Bleach', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nTipo de telaDenim\nElaboraciónTeñido\nClaseFalda\nComposición100% algodón', 43, 'https://topitop.vtexassets.com/arquivos/ids/379526/3115102_1.jpg?v=638772243941130000', 1, 8, 7, 69.95),
(151, 'Falda Denim Mujer Carly Total Natural', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nTipo de telaDenim\nElaboraciónTeñido\nBolsillosCon bolsillos delanteros y posteriores', 67, 'https://topitop.vtexassets.com/arquivos/ids/377579/3112448_1.jpg?v=638745524663630000', 1, 8, 7, 64.95),
(152, 'Falda Short Denim Mujer Hellen Total Bio Bleach', 'Instrucciones de usoLavar por separado, no usar blanqueador, planchar Tº máxima 110ºC, no limpieza al seco, no remojar, secar a máquina o al ambiente\nTipo de telaDenim\nElaboraciónTeñido\nBolsillosCon bolsillos delanteros y posteriores', 12, 'https://topitop.vtexassets.com/arquivos/ids/393979/3173518_1.jpg?v=638975772837100000', 1, 3, 3, 83.94),
(153, 'Cardigan de algodón', 'Cardigan tejido en punto fino de algodón suave. Modelo con cuello redondo, botones y puños de volante. Ribete acanalado en cuello, tapeta, puños y bajo.', 12, 'https://hmperu.vtexassets.com/unsafe/768x0/center/middle/https%3A%2F%2Fhmperu.vtexassets.com%2Farquivos%2Fids%2F5567804%2FCardigan-de-algodon---Beige---H-M-PE.jpg%3Fv%3D638847299654030000', 3, NULL, 9, 39.95),
(154, 'Conjunto de 2 piezas en algodón', 'Conjunto de dos piezas en punto suave de algodón. Chompa tejida en punto texturizado con cuello redondo, mangas raglán y botones en un hombro y a lo largo de un lado. Remate acanalado en cuello, puños y bajo.', 34, 'https://hmperu.vtexassets.com/unsafe/768x0/center/middle/https%3A%2F%2Fhmperu.vtexassets.com%2Farquivos%2Fids%2F5486145%2FConjunto-de-2-piezas-en-algodon---Crema---H-M-PE.jpg%3Fv%3D638846417226270000', 3, NULL, 9, 79.95),
(155, 'Conjunto de cardigan y joggers', 'Conjunto de dos piezas en punto de algodón con interior cepillado suave. Cardigan con cuello redondo, botones a presión y detalle estampado adelante. Joggers con elástico revestido en cintura y bajos.', 15, 'https://hmperu.vtexassets.com/unsafe/768x0/center/middle/https%3A%2F%2Fhmperu.vtexassets.com%2Farquivos%2Fids%2F6073780%2FConjunto-de-cardigan-y-joggers---Blanco-Leopardo---H-M-PE.jpg%3Fv%3D638926843526900000', 3, NULL, 9, 69.95),
(156, 'Conjunto de 2 piezas en tejido polera', 'Conjunto de dos piezas en tejido polera con interior cepillado suave. Polera con hombros caídos y cuello acanalado redondo con botones a presión en un lado (excepto en tallas 98–104). Puños y bajo acanalados. ', 53, 'https://hmperu.vtexassets.com/unsafe/768x0/center/middle/https%3A%2F%2Fhmperu.vtexassets.com%2Farquivos%2Fids%2F5637171%2FConjunto-de-2-piezas-en-tejido-polera---Beige-grisaceo-Mickey-Mouse---H-M-PE.jpg%3Fv%3D638852593257930000', 3, NULL, 9, 79.95),
(157, 'Conjunto de 2 piezas con motivo estampado', 'Conjunto de dos piezas en tejido polera con motivo estampado e interior cepillado suave. Polera con botones a presión en un hombro (excepto en tallas 98–104) y hombros caídos.', 23, 'https://hmperu.vtexassets.com/unsafe/768x0/center/middle/https%3A%2F%2Fhmperu.vtexassets.com%2Farquivos%2Fids%2F5843018%2FConjunto-de-2-piezas-con-motivo-estampado---Gris-oscuro-El-rey-leon---H-M-PE.jpg%3Fv%3D638860379522200000', 3, NULL, 9, 79.95),
(158, 'Traje de Caballero para Bebé Niño', 'Conjunto de Fiesta con Cuello en V y Manga Regular con Detalle de Lazo, Ajuste para Todas las Estaciones', 56, 'https://img.kwcdn.com/product/fancy/682e2c58-d36b-47e7-8a82-063d3f260b6c.jpg?imageView2/2/w/800/q/70/format/avif', 3, NULL, 9, 62.04),
(159, 'Conjunto de Camisa Casual con Lazo y Pantalón', '2pcs Conjunto de Camisa Casual con Lazo y Pantalón con Bolsillo Inclinado para Niños, Ideal para Primavera Verano Otoño (Accesorios como Gafas y Zapatos no Incluidos)', 23, 'https://img.kwcdn.com/product/fancy/c574482c-56a2-4f70-8c30-8c39dea35014.jpg?imageView2/2/w/800/q/70/format/avif', 3, NULL, 9, 41.31),
(160, 'Conjunto para bebe', 'Traje de para bebé niño, camisa con corbata y chaleco a cuadros elegante con pantalón, conjunto de 3 piezas, traje formal para fiesta de cumpleaños de niño', 45, 'https://img.kwcdn.com/product/fancy/c34f679d-e653-4862-8d75-8493ad429797.jpg?imageView2/2/w/800/q/70/format/avif', 3, NULL, 9, 53.66),
(161, 'Conjunto para bebe', 'ropa para bebe varon recien nacido', 56, 'https://i.etsystatic.com/24661063/r/il/7bdb81/4813400573/il_fullxfull.4813400573_5s6s.jpg', 3, NULL, 9, 45.96),
(162, 'Abrigo para bebe', 'Conjuntos Para Recién Conjuntos De Recien Nacidos Varon Bebé Varón', 34, 'https://m.media-amazon.com/images/I/71TBdDUYwVL.jpg', 3, NULL, 9, 45.98),
(163, 'Camiseta deportiva', 'Camiseta deportiva del Real Madrid, si te la pones es para robar', 12, 'https://assets.adidas.com/images/w_450,f_auto,q_auto/1a69eff1774f4371b013639bcfac7b58_9366/IT5186_000_plp_model.jpg', 4, 2, 8, 250.9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talla`
--

CREATE TABLE `talla` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `talla`
--

INSERT INTO `talla` (`id`, `nombre`) VALUES
(7, 'BIG SIZE'),
(8, 'ESTÁNDAR'),
(4, 'L'),
(3, 'M'),
(9, 'PEQUEÑO'),
(2, 'S'),
(5, 'XL'),
(1, 'XS'),
(6, 'XXL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `id` bigint(20) NOT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `titular` varchar(255) DEFAULT NULL,
  `fecha_vencimiento` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `saldo` double DEFAULT NULL,
  `activa` bit(1) DEFAULT NULL,
  `cliente_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarjeta`
--

INSERT INTO `tarjeta` (`id`, `numero`, `titular`, `fecha_vencimiento`, `cvv`, `saldo`, `activa`, `cliente_id`) VALUES
(7, '1111222233334444', 'Brayan Cruz', '12/25', '313', 12508.24, b'1', 8),
(8, '4444333322221111', 'Nicol Cruz', '12/26', '121', 1410.1, b'1', 9),
(9, '7777555544446666', 'Brayan Cruz', '11/26', '123', 21.299999999999983, b'1', 11),
(14, '4557880609975770', 'Yuca Yercy', '09/2026', '123', 8316.32, b'1', 14),
(15, '5118420434378244', 'Brayan cruz', '09/2024', '123', 500, b'1', 8),
(16, '1234432156788765', 'Brayan Cruz', '11/2026', '143', 500, b'1', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_prenda`
--

CREATE TABLE `tipo_prenda` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_prenda`
--

INSERT INTO `tipo_prenda` (`id`, `nombre`) VALUES
(6, 'Casaca'),
(7, 'Chompa'),
(8, 'Falda'),
(4, 'Pantalón'),
(1, 'Polera'),
(2, 'Polo'),
(3, 'Short'),
(5, 'Vestido');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_carrito_cliente` (`cliente_id`);

--
-- Indices de la tabla `carrito_item`
--
ALTER TABLE `carrito_item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_carrito_producto` (`carrito_id`,`producto_id`),
  ADD UNIQUE KEY `UKkyskfy3hrx0lcxo0mj6v6gh9k` (`carrito_id`,`producto_id`),
  ADD KEY `fk_item_producto` (`producto_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuenta_tienda`
--
ALTER TABLE `cuenta_tienda`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1f0l5tpqdapkvbiw574i2kl2p` (`cliente_id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKngujt6d9ti8crahqfrfb4p9d8` (`pedido_id`);

--
-- Indices de la tabla `favorito`
--
ALTER TABLE `favorito`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`,`producto_id`),
  ADD UNIQUE KEY `UKhoe6d0jtoeehhd6fmtwrevcj9` (`usuario_id`,`producto_id`),
  ADD KEY `fk_fav_producto` (`producto_id`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8fojprqy7kv7k3d192m91e027` (`pedido_id`),
  ADD KEY `FK719gcyy2a08m13apobvuibbab` (`tarjeta_id`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pedido_cliente` (`cliente_id`),
  ADD KEY `FK57ghbo31e9gnmpcyg6ne1lkc9` (`envio_id`);

--
-- Indices de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `tipo_prenda_id` (`tipo_prenda_id`),
  ADD KEY `talla_id` (`talla_id`);

--
-- Indices de la tabla `talla`
--
ALTER TABLE `talla`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero` (`numero`),
  ADD KEY `FKrjij4g6aillsmt5k6c6b3vpmc` (`cliente_id`);

--
-- Indices de la tabla `tipo_prenda`
--
ALTER TABLE `tipo_prenda`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `carrito_item`
--
ALTER TABLE `carrito_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `envio`
--
ALTER TABLE `envio`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `favorito`
--
ALTER TABLE `favorito`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT de la tabla `talla`
--
ALTER TABLE `talla`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tipo_prenda`
--
ALTER TABLE `tipo_prenda`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `fk_carrito_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `carrito_item`
--
ALTER TABLE `carrito_item`
  ADD CONSTRAINT `fk_item_carrito` FOREIGN KEY (`carrito_id`) REFERENCES `carrito` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_item_producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `envio`
--
ALTER TABLE `envio`
  ADD CONSTRAINT `FK1f0l5tpqdapkvbiw574i2kl2p` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `FKn6q9mbkc0n4g1uux57clh2bq0` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`);

--
-- Filtros para la tabla `favorito`
--
ALTER TABLE `favorito`
  ADD CONSTRAINT `fk_fav_producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `fk_fav_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `FK719gcyy2a08m13apobvuibbab` FOREIGN KEY (`tarjeta_id`) REFERENCES `tarjeta` (`id`),
  ADD CONSTRAINT `FK8fojprqy7kv7k3d192m91e027` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK57ghbo31e9gnmpcyg6ne1lkc9` FOREIGN KEY (`envio_id`) REFERENCES `envio` (`id`),
  ADD CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD CONSTRAINT `pedido_detalle_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `pedido_detalle_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`tipo_prenda_id`) REFERENCES `tipo_prenda` (`id`),
  ADD CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`talla_id`) REFERENCES `talla` (`id`);

--
-- Filtros para la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD CONSTRAINT `FKrjij4g6aillsmt5k6c6b3vpmc` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
