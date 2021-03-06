CREATE DATABASE gasofa;

USE gasofa;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- --------------------------------------------------------

--
-- Table structure for table `gasolineras_departamento`
--

CREATE TABLE IF NOT EXISTS `gasolineras_departamento` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `zona_id` int(11) NOT NULL
) DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `gasolineras_departamento`
--

INSERT INTO `gasolineras_departamento` (`id`, `nombre`, `zona_id`) VALUES
(1, 'Ahuachapán', 1),
(2, 'Santa Ana', 1),
(3, 'Sonsonate', 1),
(4, 'La Libertad', 2),
(5, 'Chalatenango', 2),
(6, 'San Salvador', 2),
(7, 'Cuscatlán', 3),
(8, 'La Paz', 3),
(9, 'Cabañas', 3),
(10, 'San Vicente', 3),
(11, 'Usulután', 4),
(12, 'Morazán', 4),
(13, 'San Miguel', 4),
(14, 'La Unión', 4);

-- --------------------------------------------------------

--
-- Table structure for table `gasolineras_gasolineras`
--

CREATE TABLE IF NOT EXISTS `gasolineras_gasolineras` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `municipio_id` int(11) NOT NULL
) DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `gasolineras_gasolineras`
--

INSERT INTO `gasolineras_gasolineras` (`id`, `nombre`, `direccion`, `municipio_id`) VALUES
(1, 'Texaco los heroes', 'Boulevard de los heroes #219', 214),
(3, 'Texaco Masferrer', 'Masferrer', 203);

-- --------------------------------------------------------

--
-- Table structure for table `gasolineras_municipio`
--

CREATE TABLE IF NOT EXISTS `gasolineras_municipio` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `departamento_id` int(11) NOT NULL
) DEFAULT CHARSET=utf8 AUTO_INCREMENT=263 ;

--
-- Dumping data for table `gasolineras_municipio`
--

INSERT INTO `gasolineras_municipio` (`id`, `nombre`, `departamento_id`) VALUES
(1, 'Ahuachapán', 1),
(2, 'Jujutla', 1),
(3, 'Atiquizaya', 1),
(4, 'Concepción de Ataco', 1),
(5, 'El Refugio', 1),
(6, 'Guaymango', 1),
(7, 'Apaneca', 1),
(8, 'San Francisco Menéndez', 1),
(9, 'San Lorenzo', 1),
(10, 'San Pedro Puxtla', 1),
(11, 'Tacuba', 1),
(12, 'Turín', 1),
(13, 'Candelaria de la Frontera', 2),
(14, 'Chalchuapa', 2),
(15, 'Coatepeque', 2),
(16, 'El Congo', 2),
(17, 'El Porvenir', 2),
(18, 'Masahuat', 2),
(19, 'Metapán', 2),
(20, 'San Antonio Pajonal', 2),
(21, 'San Sebastián Salitrillo', 2),
(22, 'Santa Ana', 2),
(23, 'Santa Rosa Guachipilín', 2),
(24, 'Santiago de la Frontera', 2),
(25, 'Texistepeque', 2),
(26, 'Acajutla', 3),
(27, 'Armenia', 3),
(28, 'Caluco', 3),
(29, 'Cuisnahuat', 3),
(30, 'Izalco', 3),
(31, 'Juayúa', 3),
(32, 'Nahuizalco', 3),
(33, 'Nahulingo', 3),
(34, 'Salcoatitán', 3),
(35, 'San Antonio del Monte', 3),
(36, 'San Julián', 3),
(37, 'Santa Catarina Masahuat', 3),
(38, 'Santa Isabel Ishuatán', 3),
(39, 'Santo Domingo de Guzmán', 3),
(40, 'Sonsonate', 3),
(41, 'Sonzacate', 3),
(42, 'Alegría', 11),
(43, 'Berlín', 11),
(44, 'California', 11),
(45, 'Concepción Batres', 11),
(46, 'El Triunfo', 11),
(47, 'Ereguayquín', 11),
(48, 'Estanzuelas', 11),
(49, 'Jiquilisco', 11),
(50, 'Jucuapa', 11),
(51, 'Jucuarán', 11),
(52, 'Mercedes Umaña', 11),
(53, 'Nueva Granada', 11),
(54, 'Ozatlán', 11),
(55, 'Puerto El Triunfo', 11),
(56, 'San Agustín', 11),
(57, 'San Buenaventura', 11),
(58, 'San Dionisio', 11),
(59, 'San Francisco Javier', 11),
(60, 'Santa Elena', 11),
(61, 'Santa María', 11),
(62, 'Santiago de María', 11),
(63, 'Tecapán', 11),
(64, 'Usulután', 11),
(65, 'Carolina', 13),
(66, 'Chapeltique', 13),
(67, 'Chinameca', 13),
(68, 'Chirilagua', 13),
(69, 'Ciudad Barrios', 13),
(70, 'Comacarán', 13),
(71, 'El Tránsito', 13),
(72, 'Lolotique', 13),
(73, 'Moncagua', 13),
(74, 'Nueva Guadalupe', 13),
(75, 'Nuevo Edén de San Juan', 13),
(76, 'Quelepa', 13),
(77, 'San Antonio del Mosco', 13),
(78, 'San Gerardo', 13),
(79, 'San Jorge', 13),
(80, 'San Luis de la Reina', 13),
(81, 'San Miguel', 13),
(82, 'San Rafael Oriente', 13),
(83, 'Sesori', 13),
(84, 'Uluazapa', 13),
(85, 'Arambala', 12),
(86, 'Cacaopera', 12),
(87, 'Chilanga', 12),
(88, 'Corinto', 12),
(89, 'Delicias de Concepción', 12),
(90, 'El Divisadero', 12),
(91, 'El Rosario (Morazán)', 12),
(92, 'Gualococti', 12),
(93, 'Guatajiagua', 12),
(94, 'Joateca', 12),
(95, 'Jocoaitique', 12),
(96, 'Jocoro', 12),
(97, 'Lolotiquillo', 12),
(98, 'Meanguera', 12),
(99, 'Osicala', 12),
(100, 'Perquín', 12),
(101, 'San Carlos', 12),
(102, 'San Fernando (Morazán)', 12),
(103, 'San Francisco Gotera', 12),
(104, 'San Isidro (Morazán)', 12),
(105, 'San Simón', 12),
(106, 'Sensembra', 12),
(107, 'Sociedad', 12),
(108, 'Torola', 12),
(109, 'Yamabal', 12),
(110, 'Yoloaiquín', 12),
(111, 'La Unión', 14),
(112, 'San Alejo', 14),
(113, 'Yucuaiquín', 14),
(114, 'Conchagua', 14),
(115, 'Intipucá', 14),
(116, 'San José', 14),
(117, 'El Carmen (La Unión)', 14),
(118, 'Yayantique', 14),
(119, 'Bolívar', 14),
(120, 'Meanguera del Golfo', 14),
(121, 'Santa Rosa de Lima', 14),
(122, 'Pasaquina', 14),
(123, 'Anamoros', 14),
(124, 'Nueva Esparta', 14),
(125, 'El Sauce', 14),
(126, 'Concepción de Oriente', 14),
(127, 'Polorós', 14),
(128, 'Lislique', 14),
(129, 'Antiguo Cuscatlán', 4),
(130, 'Chiltiupán', 4),
(131, 'Ciudad Arce', 4),
(132, 'Colón', 4),
(133, 'Comasagua', 4),
(134, 'Huizúcar', 4),
(135, 'Jayaque', 4),
(136, 'Jicalapa', 4),
(137, 'La Libertad', 4),
(138, 'Santa Tecla', 4),
(139, 'Nuevo Cuscatlán', 4),
(140, 'San Juan Opico', 4),
(141, 'Quezaltepeque', 4),
(142, 'Sacacoyo', 4),
(143, 'San José Villanueva', 4),
(144, 'San Matías', 4),
(145, 'San Pablo Tacachico', 4),
(146, 'Talnique', 4),
(147, 'Tamanique', 4),
(148, 'Teotepeque', 4),
(149, 'Tepecoyo', 4),
(150, 'Zaragoza', 4),
(151, 'Agua Caliente', 5),
(152, 'Arcatao', 5),
(153, 'Azacualpa', 5),
(154, 'Cancasque', 5),
(155, 'Chalatenango', 5),
(156, 'Citalá', 5),
(157, 'Comapala', 5),
(158, 'Concepción Quezaltepeque', 5),
(159, 'Dulce Nombre de María', 5),
(160, 'El Carrizal', 5),
(161, 'El Paraíso', 5),
(162, 'La Laguna', 5),
(163, 'La Palma', 5),
(164, 'La Reina', 5),
(165, 'Las Vueltas', 5),
(166, 'Nueva Concepción', 5),
(167, 'Nueva Trinidad', 5),
(168, 'Nombre de Jesús', 5),
(169, 'Ojos de Agua', 5),
(170, 'Potonico', 5),
(171, 'San Antonio de la Cruz', 5),
(172, 'San Antonio Los Ranchos', 5),
(173, 'San Fernando (Chalatenango)', 5),
(174, 'San Francisco Lempa', 5),
(175, 'San Francisco Morazán', 5),
(176, 'San Ignacio', 5),
(177, 'San Isidro Labrador', 5),
(178, 'Las Flores', 5),
(179, 'San Luis del Carmen', 5),
(180, 'San Miguel de Mercedes', 5),
(181, 'San Rafael', 5),
(182, 'Santa Rita', 5),
(183, 'Tejutla', 5),
(184, 'Cojutepeque', 7),
(185, 'Candelaria', 7),
(186, 'El Carmen (Cuscatlán)', 7),
(187, 'El Rosario (Cuscatlán)', 7),
(188, 'Monte San Juan', 7),
(189, 'Oratorio de Concepción', 7),
(190, 'San Bartolomé Perulapía', 7),
(191, 'San Cristóbal', 7),
(192, 'San José Guayabal', 7),
(193, 'San Pedro Perulapán', 7),
(194, 'San Rafael Cedros', 7),
(195, 'San Ramón', 7),
(196, 'Santa Cruz Analquito', 7),
(197, 'Santa Cruz Michapa', 7),
(198, 'Suchitoto', 7),
(199, 'Tenancingo', 7),
(200, 'Aguilares', 6),
(201, 'Apopa', 6),
(202, 'Ayutuxtepeque', 6),
(203, 'Cuscatancingo', 6),
(204, 'Ciudad Delgado', 6),
(205, 'El Paisnal', 6),
(206, 'Guazapa', 6),
(207, 'Ilopango', 6),
(208, 'Mejicanos', 6),
(209, 'Nejapa', 6),
(210, 'Panchimalco', 6),
(211, 'Rosario de Mora', 6),
(212, 'San Marcos', 6),
(213, 'San Martín', 6),
(214, 'San Salvador', 6),
(215, 'Santiago Texacuangos', 6),
(216, 'Santo Tomás', 6),
(217, 'Soyapango', 6),
(218, 'Tonacatepeque', 6),
(219, 'Zacatecoluca', 8),
(220, 'Cuyultitán', 8),
(221, 'El Rosario (La Paz)', 8),
(222, 'Jerusalén', 8),
(223, 'Mercedes La Ceiba', 8),
(224, 'Olocuilta', 8),
(225, 'Paraíso de Osorio', 8),
(226, 'San Antonio Masahuat', 8),
(227, 'San Emigdio', 8),
(228, 'San Francisco Chinameca', 8),
(229, 'San Pedro Masahuat', 8),
(230, 'San Juan Nonualco', 8),
(231, 'San Juan Talpa', 8),
(232, 'San Juan Tepezontes', 8),
(233, 'San Luis La Herradura', 8),
(234, 'San Luis Talpa', 8),
(235, 'San Miguel Tepezontes', 8),
(236, 'San Pedro Nonualco', 8),
(237, 'San Rafael Obrajuelo', 8),
(238, 'Santa María Ostuma', 8),
(239, 'Santiago Nonualco', 8),
(240, 'Tapalhuaca', 8),
(241, 'Cinquera', 9),
(242, 'Dolores', 9),
(243, 'Guacotecti', 9),
(244, 'Ilobasco', 9),
(245, 'Jutiapa', 9),
(246, 'San Isidro (Cabañas)', 9),
(247, 'Sensuntepeque', 9),
(248, 'Tejutepeque', 9),
(249, 'Victoria', 9),
(250, 'Apastepeque', 10),
(251, 'Guadalupe', 10),
(252, 'San Cayetano Istepeque', 10),
(253, 'San Esteban Catarina', 10),
(254, 'San Ildefonso', 10),
(255, 'San Lorenzo', 10),
(256, 'San Sebastián', 10),
(257, 'San Vicente', 10),
(258, 'Santa Clara', 10),
(259, 'Santo Domingo', 10),
(260, 'Tecoluca', 10),
(261, 'Tepetitán', 10),
(262, 'Verapaz', 10);

-- --------------------------------------------------------

--
-- Table structure for table `gasolineras_precios`
--

CREATE TABLE IF NOT EXISTS `gasolineras_precios` (
`id` int(11) NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `tipo_precio_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tipo_gasolina_id` int(11) NOT NULL
) DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `gasolineras_precios`
--

INSERT INTO `gasolineras_precios` (`id`, `precio`, `fecha_creacion`, `tipo_precio_id`, `usuario_id`, `tipo_gasolina_id`) VALUES
(12, '3.70', '2021-05-01', 1, 1, 1),
(13, '3.71', '2021-05-02', 1, 1, 1),
(14, '3.72', '2021-05-03', 1, 1, 1),
(15, '3.50', '2021-05-04', 1, 1, 1),
(16, '3.55', '2021-05-05', 1, 1, 1),
(17, '3.61', '2021-05-06', 1, 1, 1),
(18, '3.62', '2021-05-07', 1, 1, 1),
(19, '3.67', '2021-05-08', 1, 1, 1),
(20, '3.64', '2021-05-09', 1, 1, 1),
(21, '3.61', '2021-05-10', 1, 1, 1),
(22, '3.70', '2021-05-01', 3, 1, 1),
(23, '3.71', '2021-05-02', 3, 1, 1),
(24, '3.72', '2021-05-03', 3, 1, 1),
(25, '3.50', '2021-05-04', 3, 1, 1),
(26, '3.55', '2021-05-05', 3, 1, 1),
(27, '3.61', '2021-05-06', 3, 1, 1),
(28, '3.62', '2021-05-07', 3, 1, 1),
(29, '3.67', '2021-05-08', 3, 1, 1),
(30, '3.64', '2021-05-09', 3, 1, 1),
(31, '3.61', '2021-05-10', 3, 1, 1),
(32, '6.00', '2021-06-18', 2, 1, 3),
(33, '5.00', '2021-06-18', 1, 2, 2),
(34, '7.00', '2021-06-18', 3, 1, 2),
(35, '8.00', '2021-06-18', 1, 1, 2),
(36, '9.00', '2021-06-19', 1, 1, 3),
(37, '10.00', '2021-06-19', 1, 1, 1),
(38, '10.00', '2021-06-19', 1, 1, 1),
(39, '8.03', '2021-06-19', 1, 1, 1),
(40, '8.30', '2021-06-19', 1, 1, 1),
(41, '5.23', '2021-06-19', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gasolineras_precios_gasolineras`
--

CREATE TABLE IF NOT EXISTS `gasolineras_precios_gasolineras` (
`id` int(11) NOT NULL,
  `gasolinera_id` int(11) NOT NULL,
  `precio_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `gasolineras_precios_gasolineras`
--

INSERT INTO `gasolineras_precios_gasolineras` (`id`, `gasolinera_id`, `precio_id`, `usuario_id`) VALUES
(1, 1, 22, 1),
(2, 1, 23, 1),
(3, 1, 24, 1),
(4, 1, 25, 1),
(5, 1, 26, 1),
(6, 3, 27, 1),
(7, 3, 28, 1),
(8, 3, 29, 1),
(9, 3, 30, 1),
(10, 3, 31, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gasolineras_precios_zonas`
--

CREATE TABLE IF NOT EXISTS `gasolineras_precios_zonas` (
`id` int(11) NOT NULL,
  `precio_id` int(11) NOT NULL,
  `zona_id` int(11) NOT NULL
) DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `gasolineras_precios_zonas`
--

INSERT INTO `gasolineras_precios_zonas` (`id`, `precio_id`, `zona_id`) VALUES
(1, 12, 1),
(2, 13, 1),
(3, 14, 1),
(4, 15, 2),
(5, 16, 2),
(6, 17, 2),
(7, 18, 4),
(8, 19, 4),
(9, 20, 4),
(10, 21, 2),
(12, 21, 2);

-- --------------------------------------------------------

--
-- Table structure for table `gasolineras_tipo_gasolina`
--

CREATE TABLE IF NOT EXISTS `gasolineras_tipo_gasolina` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `gasolineras_tipo_gasolina`
--

INSERT INTO `gasolineras_tipo_gasolina` (`id`, `nombre`) VALUES
(1, 'Especial'),
(2, 'Regular'),
(3, 'Diesel');

-- --------------------------------------------------------

--
-- Table structure for table `gasolineras_tipo_precio`
--

CREATE TABLE IF NOT EXISTS `gasolineras_tipo_precio` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `gasolineras_tipo_precio`
--

INSERT INTO `gasolineras_tipo_precio` (`id`, `nombre`) VALUES
(1, 'Precio referencia'),
(2, 'Precio gasolinera'),
(3, 'Precio usuario final');

-- --------------------------------------------------------

--
-- Table structure for table `gasolineras_tipo_usuario`
--

CREATE TABLE IF NOT EXISTS `gasolineras_tipo_usuario` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `gasolineras_tipo_usuario`
--

INSERT INTO `gasolineras_tipo_usuario` (`id`, `nombre`) VALUES
(1, 'MINEC'),
(2, 'gasolinera');

-- --------------------------------------------------------

--
-- Table structure for table `gasolineras_usuarios`
--

CREATE TABLE IF NOT EXISTS `gasolineras_usuarios` (
`id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `tipo_usuario_id` int(11) NOT NULL
) DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `gasolineras_usuarios`
--

INSERT INTO `gasolineras_usuarios` (`id`, `usuario`, `clave`, `tipo_usuario_id`) VALUES
(1, 'carlos', '12345', 1),
(2, 'cornejo', '12345', 1),
(3, 'Pineda', '12345', 2);

-- --------------------------------------------------------

--
-- Table structure for table `gasolineras_zona`
--

CREATE TABLE IF NOT EXISTS `gasolineras_zona` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `gasolineras_zona`
--

INSERT INTO `gasolineras_zona` (`id`, `nombre`) VALUES
(1, 'Occidental'),
(2, 'Central'),
(3, 'Paracentral'),
(4, 'Oriental');


--
-- Indexes for table `gasolineras_departamento`
--
ALTER TABLE `gasolineras_departamento`
 ADD PRIMARY KEY (`id`), ADD KEY `gasolineras_departamento_zona_id_1d1d4d41_fk_gasolineras_zona_id` (`zona_id`);

--
-- Indexes for table `gasolineras_gasolineras`
--
ALTER TABLE `gasolineras_gasolineras`
 ADD PRIMARY KEY (`id`), ADD KEY `gasolineras_gasoline_municipio_id_231896ba_fk_gasoliner` (`municipio_id`);

--
-- Indexes for table `gasolineras_municipio`
--
ALTER TABLE `gasolineras_municipio`
 ADD PRIMARY KEY (`id`), ADD KEY `gasolineras_municipi_departamento_id_51649d71_fk_gasoliner` (`departamento_id`);

--
-- Indexes for table `gasolineras_precios`
--
ALTER TABLE `gasolineras_precios`
 ADD PRIMARY KEY (`id`), ADD KEY `gasolineras_precios_tipo_precio_id_a674bedc_fk_gasoliner` (`tipo_precio_id`), ADD KEY `gasolineras_precios_usuario_id_acc0fcd7_fk_gasoliner` (`usuario_id`), ADD KEY `gasolineras_precios_tipo_gasolina_id_2d5e7565_fk_gasoliner` (`tipo_gasolina_id`);

--
-- Indexes for table `gasolineras_precios_gasolineras`
--
ALTER TABLE `gasolineras_precios_gasolineras`
 ADD PRIMARY KEY (`id`), ADD KEY `gasolineras_precios__gasolinera_id_1eaf63cd_fk_gasoliner` (`gasolinera_id`), ADD KEY `gasolineras_precios__precio_id_91c0d864_fk_gasoliner` (`precio_id`), ADD KEY `gasolineras_precios__usuario_id_7380c637_fk_gasoliner` (`usuario_id`);

--
-- Indexes for table `gasolineras_precios_zonas`
--
ALTER TABLE `gasolineras_precios_zonas`
 ADD PRIMARY KEY (`id`), ADD KEY `gasolineras_precios__precio_id_bbe9d8a6_fk_gasoliner` (`precio_id`), ADD KEY `gasolineras_precios__zona_id_43c674d1_fk_gasoliner` (`zona_id`);

--
-- Indexes for table `gasolineras_tipo_gasolina`
--
ALTER TABLE `gasolineras_tipo_gasolina`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gasolineras_tipo_precio`
--
ALTER TABLE `gasolineras_tipo_precio`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gasolineras_tipo_usuario`
--
ALTER TABLE `gasolineras_tipo_usuario`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gasolineras_usuarios`
--
ALTER TABLE `gasolineras_usuarios`
 ADD PRIMARY KEY (`id`), ADD KEY `gasolineras_usuarios_tipo_usuario_id_bdf2919a_fk_gasoliner` (`tipo_usuario_id`);

--
-- Indexes for table `gasolineras_zona`
--
ALTER TABLE `gasolineras_zona`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for table `gasolineras_departamento`
--
ALTER TABLE `gasolineras_departamento`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `gasolineras_gasolineras`
--
ALTER TABLE `gasolineras_gasolineras`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `gasolineras_municipio`
--
ALTER TABLE `gasolineras_municipio`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=263;
--
-- AUTO_INCREMENT for table `gasolineras_precios`
--
ALTER TABLE `gasolineras_precios`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `gasolineras_precios_gasolineras`
--
ALTER TABLE `gasolineras_precios_gasolineras`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `gasolineras_precios_zonas`
--
ALTER TABLE `gasolineras_precios_zonas`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `gasolineras_tipo_gasolina`
--
ALTER TABLE `gasolineras_tipo_gasolina`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `gasolineras_tipo_precio`
--
ALTER TABLE `gasolineras_tipo_precio`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `gasolineras_tipo_usuario`
--
ALTER TABLE `gasolineras_tipo_usuario`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `gasolineras_usuarios`
--
ALTER TABLE `gasolineras_usuarios`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `gasolineras_zona`
--
ALTER TABLE `gasolineras_zona`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;

--
-- Constraints for table `gasolineras_departamento`
--
ALTER TABLE `gasolineras_departamento`
ADD CONSTRAINT `gasolineras_departamento_zona_id_1d1d4d41_fk_gasolineras_zona_id` FOREIGN KEY (`zona_id`) REFERENCES `gasolineras_zona` (`id`);

--
-- Constraints for table `gasolineras_gasolineras`
--
ALTER TABLE `gasolineras_gasolineras`
ADD CONSTRAINT `gasolineras_gasoline_municipio_id_231896ba_fk_gasoliner` FOREIGN KEY (`municipio_id`) REFERENCES `gasolineras_municipio` (`id`);

--
-- Constraints for table `gasolineras_municipio`
--
ALTER TABLE `gasolineras_municipio`
ADD CONSTRAINT `gasolineras_municipi_departamento_id_51649d71_fk_gasoliner` FOREIGN KEY (`departamento_id`) REFERENCES `gasolineras_departamento` (`id`);

--
-- Constraints for table `gasolineras_precios`
--
ALTER TABLE `gasolineras_precios`
ADD CONSTRAINT `gasolineras_precios_tipo_gasolina_id_2d5e7565_fk_gasoliner` FOREIGN KEY (`tipo_gasolina_id`) REFERENCES `gasolineras_tipo_gasolina` (`id`),
ADD CONSTRAINT `gasolineras_precios_tipo_precio_id_a674bedc_fk_gasoliner` FOREIGN KEY (`tipo_precio_id`) REFERENCES `gasolineras_tipo_precio` (`id`),
ADD CONSTRAINT `gasolineras_precios_usuario_id_acc0fcd7_fk_gasoliner` FOREIGN KEY (`usuario_id`) REFERENCES `gasolineras_usuarios` (`id`);

--
-- Constraints for table `gasolineras_precios_gasolineras`
--
ALTER TABLE `gasolineras_precios_gasolineras`
ADD CONSTRAINT `gasolineras_precios__gasolinera_id_1eaf63cd_fk_gasoliner` FOREIGN KEY (`gasolinera_id`) REFERENCES `gasolineras_gasolineras` (`id`),
ADD CONSTRAINT `gasolineras_precios__precio_id_91c0d864_fk_gasoliner` FOREIGN KEY (`precio_id`) REFERENCES `gasolineras_precios` (`id`),
ADD CONSTRAINT `gasolineras_precios__usuario_id_7380c637_fk_gasoliner` FOREIGN KEY (`usuario_id`) REFERENCES `gasolineras_usuarios` (`id`);

--
-- Constraints for table `gasolineras_precios_zonas`
--
ALTER TABLE `gasolineras_precios_zonas`
ADD CONSTRAINT `gasolineras_precios__precio_id_bbe9d8a6_fk_gasoliner` FOREIGN KEY (`precio_id`) REFERENCES `gasolineras_precios` (`id`),
ADD CONSTRAINT `gasolineras_precios__zona_id_43c674d1_fk_gasoliner` FOREIGN KEY (`zona_id`) REFERENCES `gasolineras_zona` (`id`);

--
-- Constraints for table `gasolineras_usuarios`
--
ALTER TABLE `gasolineras_usuarios`
ADD CONSTRAINT `gasolineras_usuarios_tipo_usuario_id_bdf2919a_fk_gasoliner` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `gasolineras_tipo_usuario` (`id`);