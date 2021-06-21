-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2021 at 06:45 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

CREATE DATABASE gasofa;

USE gasofa;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gasofa`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

CREATE TABLE IF NOT EXISTS `account_emailaddress` (
`id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

CREATE TABLE IF NOT EXISTS `account_emailconfirmation` (
`id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE IF NOT EXISTS `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
`id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
`id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Token', 7, 'add_token'),
(26, 'Can change Token', 7, 'change_token'),
(27, 'Can delete Token', 7, 'delete_token'),
(28, 'Can view Token', 7, 'view_token'),
(29, 'Can add token', 8, 'add_tokenproxy'),
(30, 'Can change token', 8, 'change_tokenproxy'),
(31, 'Can delete token', 8, 'delete_tokenproxy'),
(32, 'Can view token', 8, 'view_tokenproxy'),
(33, 'Can add site', 9, 'add_site'),
(34, 'Can change site', 9, 'change_site'),
(35, 'Can delete site', 9, 'delete_site'),
(36, 'Can view site', 9, 'view_site'),
(37, 'Can add email address', 10, 'add_emailaddress'),
(38, 'Can change email address', 10, 'change_emailaddress'),
(39, 'Can delete email address', 10, 'delete_emailaddress'),
(40, 'Can view email address', 10, 'view_emailaddress'),
(41, 'Can add email confirmation', 11, 'add_emailconfirmation'),
(42, 'Can change email confirmation', 11, 'change_emailconfirmation'),
(43, 'Can delete email confirmation', 11, 'delete_emailconfirmation'),
(44, 'Can view email confirmation', 11, 'view_emailconfirmation'),
(45, 'Can add social account', 12, 'add_socialaccount'),
(46, 'Can change social account', 12, 'change_socialaccount'),
(47, 'Can delete social account', 12, 'delete_socialaccount'),
(48, 'Can view social account', 12, 'view_socialaccount'),
(49, 'Can add social application', 13, 'add_socialapp'),
(50, 'Can change social application', 13, 'change_socialapp'),
(51, 'Can delete social application', 13, 'delete_socialapp'),
(52, 'Can view social application', 13, 'view_socialapp'),
(53, 'Can add social application token', 14, 'add_socialtoken'),
(54, 'Can change social application token', 14, 'change_socialtoken'),
(55, 'Can delete social application token', 14, 'delete_socialtoken'),
(56, 'Can view social application token', 14, 'view_socialtoken'),
(57, 'Can add departamento', 15, 'add_departamento'),
(58, 'Can change departamento', 15, 'change_departamento'),
(59, 'Can delete departamento', 15, 'delete_departamento'),
(60, 'Can view departamento', 15, 'view_departamento'),
(61, 'Can add gasolineras', 16, 'add_gasolineras'),
(62, 'Can change gasolineras', 16, 'change_gasolineras'),
(63, 'Can delete gasolineras', 16, 'delete_gasolineras'),
(64, 'Can view gasolineras', 16, 'view_gasolineras'),
(65, 'Can add precios', 17, 'add_precios'),
(66, 'Can change precios', 17, 'change_precios'),
(67, 'Can delete precios', 17, 'delete_precios'),
(68, 'Can view precios', 17, 'view_precios'),
(69, 'Can add tipo_ precio', 18, 'add_tipo_precio'),
(70, 'Can change tipo_ precio', 18, 'change_tipo_precio'),
(71, 'Can delete tipo_ precio', 18, 'delete_tipo_precio'),
(72, 'Can view tipo_ precio', 18, 'view_tipo_precio'),
(73, 'Can add tipo_ usuario', 19, 'add_tipo_usuario'),
(74, 'Can change tipo_ usuario', 19, 'change_tipo_usuario'),
(75, 'Can delete tipo_ usuario', 19, 'delete_tipo_usuario'),
(76, 'Can view tipo_ usuario', 19, 'view_tipo_usuario'),
(77, 'Can add zona', 20, 'add_zona'),
(78, 'Can change zona', 20, 'change_zona'),
(79, 'Can delete zona', 20, 'delete_zona'),
(80, 'Can view zona', 20, 'view_zona'),
(81, 'Can add usuarios', 21, 'add_usuarios'),
(82, 'Can change usuarios', 21, 'change_usuarios'),
(83, 'Can delete usuarios', 21, 'delete_usuarios'),
(84, 'Can view usuarios', 21, 'view_usuarios'),
(85, 'Can add precios_ zonas', 22, 'add_precios_zonas'),
(86, 'Can change precios_ zonas', 22, 'change_precios_zonas'),
(87, 'Can delete precios_ zonas', 22, 'delete_precios_zonas'),
(88, 'Can view precios_ zonas', 22, 'view_precios_zonas'),
(89, 'Can add precios_ gasolineras', 23, 'add_precios_gasolineras'),
(90, 'Can change precios_ gasolineras', 23, 'change_precios_gasolineras'),
(91, 'Can delete precios_ gasolineras', 23, 'delete_precios_gasolineras'),
(92, 'Can view precios_ gasolineras', 23, 'view_precios_gasolineras'),
(93, 'Can add municipio', 24, 'add_municipio'),
(94, 'Can change municipio', 24, 'change_municipio'),
(95, 'Can delete municipio', 24, 'delete_municipio'),
(96, 'Can view municipio', 24, 'view_municipio'),
(97, 'Can add tipo_ gasolina', 25, 'add_tipo_gasolina'),
(98, 'Can change tipo_ gasolina', 25, 'change_tipo_gasolina'),
(99, 'Can delete tipo_ gasolina', 25, 'delete_tipo_gasolina'),
(100, 'Can view tipo_ gasolina', 25, 'view_tipo_gasolina');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
`id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
`id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
`id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(10, 'account', 'emailaddress'),
(11, 'account', 'emailconfirmation'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'authtoken', 'token'),
(8, 'authtoken', 'tokenproxy'),
(5, 'contenttypes', 'contenttype'),
(15, 'gasolineras', 'departamento'),
(16, 'gasolineras', 'gasolineras'),
(24, 'gasolineras', 'municipio'),
(17, 'gasolineras', 'precios'),
(23, 'gasolineras', 'precios_gasolineras'),
(22, 'gasolineras', 'precios_zonas'),
(25, 'gasolineras', 'tipo_gasolina'),
(18, 'gasolineras', 'tipo_precio'),
(19, 'gasolineras', 'tipo_usuario'),
(21, 'gasolineras', 'usuarios'),
(20, 'gasolineras', 'zona'),
(6, 'sessions', 'session'),
(9, 'sites', 'site'),
(12, 'socialaccount', 'socialaccount'),
(13, 'socialaccount', 'socialapp'),
(14, 'socialaccount', 'socialtoken');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
`id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-06-19 03:17:38.467871'),
(2, 'auth', '0001_initial', '2021-06-19 03:17:38.785867'),
(3, 'account', '0001_initial', '2021-06-19 03:17:39.547868'),
(4, 'account', '0002_email_max_length', '2021-06-19 03:17:39.784867'),
(5, 'admin', '0001_initial', '2021-06-19 03:17:39.854864'),
(6, 'admin', '0002_logentry_remove_auto_add', '2021-06-19 03:17:40.066865'),
(7, 'admin', '0003_logentry_add_action_flag_choices', '2021-06-19 03:17:40.084866'),
(8, 'contenttypes', '0002_remove_content_type_name', '2021-06-19 03:17:40.235865'),
(9, 'auth', '0002_alter_permission_name_max_length', '2021-06-19 03:17:40.326866'),
(10, 'auth', '0003_alter_user_email_max_length', '2021-06-19 03:17:40.420865'),
(11, 'auth', '0004_alter_user_username_opts', '2021-06-19 03:17:40.436867'),
(12, 'auth', '0005_alter_user_last_login_null', '2021-06-19 03:17:40.512867'),
(13, 'auth', '0006_require_contenttypes_0002', '2021-06-19 03:17:40.517867'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2021-06-19 03:17:40.532867'),
(15, 'auth', '0008_alter_user_username_max_length', '2021-06-19 03:17:40.622873'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2021-06-19 03:17:40.707866'),
(17, 'auth', '0010_alter_group_name_max_length', '2021-06-19 03:17:40.793870'),
(18, 'auth', '0011_update_proxy_permissions', '2021-06-19 03:17:40.810866'),
(19, 'authtoken', '0001_initial', '2021-06-19 03:17:40.875864'),
(20, 'authtoken', '0002_auto_20160226_1747', '2021-06-19 03:17:41.183865'),
(21, 'authtoken', '0003_tokenproxy', '2021-06-19 03:17:41.192874'),
(22, 'gasolineras', '0001_initial', '2021-06-19 03:17:42.076873'),
(23, 'gasolineras', '0002_auto_20210530_0456', '2021-06-19 03:17:43.212867'),
(24, 'gasolineras', '0003_remove_precios_gasolineras_tipo_precio', '2021-06-19 03:17:43.324864'),
(25, 'sessions', '0001_initial', '2021-06-19 03:17:43.383866'),
(26, 'sites', '0001_initial', '2021-06-19 03:17:43.474860'),
(27, 'sites', '0002_alter_domain_unique', '2021-06-19 03:17:43.512869'),
(28, 'socialaccount', '0001_initial', '2021-06-19 03:17:43.816864'),
(29, 'socialaccount', '0002_token_max_lengths', '2021-06-19 03:17:44.543864'),
(30, 'socialaccount', '0003_extra_data_default_dict', '2021-06-19 03:17:44.560863'),
(31, 'gasolineras', '0004_auto_20210618_2329', '2021-06-19 05:29:21.486160');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
`id` int(11) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `gasolineras_departamento`
--

CREATE TABLE IF NOT EXISTS `gasolineras_departamento` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `zona_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=263 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `gasolineras_zona`
--

INSERT INTO `gasolineras_zona` (`id`, `nombre`) VALUES
(1, 'Occidental'),
(2, 'Central'),
(3, 'Paracentral'),
(4, 'Oriental');

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialaccount`
--

CREATE TABLE IF NOT EXISTS `socialaccount_socialaccount` (
`id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp`
--

CREATE TABLE IF NOT EXISTS `socialaccount_socialapp` (
`id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp_sites`
--

CREATE TABLE IF NOT EXISTS `socialaccount_socialapp_sites` (
`id` int(11) NOT NULL,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialtoken`
--

CREATE TABLE IF NOT EXISTS `socialaccount_socialtoken` (
`id` int(11) NOT NULL,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`), ADD KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `key` (`key`), ADD KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`);

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
 ADD PRIMARY KEY (`key`), ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`), ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`), ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`), ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
 ADD PRIMARY KEY (`id`), ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`), ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
 ADD PRIMARY KEY (`session_key`), ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `django_site`
--
ALTER TABLE `django_site`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`);

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
-- Indexes for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`), ADD KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`), ADD KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`);

--
-- Indexes for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`), ADD KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `django_site`
--
ALTER TABLE `django_site`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
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
-- AUTO_INCREMENT for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
ADD CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

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

--
-- Constraints for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
ADD CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
ADD CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
ADD CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Constraints for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
ADD CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
ADD CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
