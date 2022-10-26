-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2022 a las 17:53:35
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `11_18_28_bet_el_cakes_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_activities`
--

CREATE TABLE `btl_activities` (
  `activity_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `log_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_addresses`
--

CREATE TABLE `btl_addresses` (
  `address_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `address_1` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_2` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_allergenables`
--

CREATE TABLE `btl_allergenables` (
  `allergen_id` int(10) UNSIGNED NOT NULL,
  `allergenable_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allergenable_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_allergens`
--

CREATE TABLE `btl_allergens` (
  `allergen_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_assignable_logs`
--

CREATE TABLE `btl_assignable_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assignable_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assignable_id` bigint(20) UNSIGNED NOT NULL,
  `assignee_id` int(10) UNSIGNED DEFAULT NULL,
  `assignee_group_id` int(10) UNSIGNED DEFAULT NULL,
  `status_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_cache`
--

CREATE TABLE `btl_cache` (
  `key` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_categories`
--

CREATE TABLE `btl_categories` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `permalink_slug` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_countries`
--

CREATE TABLE `btl_countries` (
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `country_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_code_2` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_code_3` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `format` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 999,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_countries`
--

INSERT INTO `btl_countries` (`country_id`, `country_name`, `iso_code_2`, `iso_code_3`, `format`, `status`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(2, 'Albania', 'AL', 'ALB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(3, 'Algeria', 'DZ', 'DZA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(4, 'American Samoa', 'AS', 'ASM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(5, 'Andorra', 'AD', 'AND', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(6, 'Angola', 'AO', 'AGO', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(7, 'Anguilla', 'AI', 'AIA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(8, 'Antarctica', 'AQ', 'ATA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(10, 'Argentina', 'AR', 'ARG', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(11, 'Armenia', 'AM', 'ARM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(12, 'Aruba', 'AW', 'ABW', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(13, 'Australia', 'AU', 'AUS', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(14, 'Austria', 'AT', 'AUT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(15, 'Azerbaijan', 'AZ', 'AZE', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(16, 'Bahamas', 'BS', 'BHS', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(17, 'Bahrain', 'BH', 'BHR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(18, 'Bangladesh', 'BD', 'BGD', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(19, 'Barbados', 'BB', 'BRB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(20, 'Belarus', 'BY', 'BLR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(21, 'Belgium', 'BE', 'BEL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(22, 'Belize', 'BZ', 'BLZ', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(23, 'Benin', 'BJ', 'BEN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(24, 'Bermuda', 'BM', 'BMU', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(25, 'Bhutan', 'BT', 'BTN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(26, 'Bolivia', 'BO', 'BOL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(27, 'Bosnia and Herzegowina', 'BA', 'BIH', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(28, 'Botswana', 'BW', 'BWA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(29, 'Bouvet Island', 'BV', 'BVT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(30, 'Brazil', 'BR', 'BRA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(32, 'Brunei Darussalam', 'BN', 'BRN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(33, 'Bulgaria', 'BG', 'BGR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(34, 'Burkina Faso', 'BF', 'BFA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(35, 'Burundi', 'BI', 'BDI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(36, 'Cambodia', 'KH', 'KHM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(37, 'Cameroon', 'CM', 'CMR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(38, 'Canada', 'CA', 'CAN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(39, 'Cape Verde', 'CV', 'CPV', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(40, 'Cayman Islands', 'KY', 'CYM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(41, 'Central African Republic', 'CF', 'CAF', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(42, 'Chad', 'TD', 'TCD', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(43, 'Chile', 'CL', 'CHL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(44, 'China', 'CN', 'CHN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(45, 'Christmas Island', 'CX', 'CXR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(47, 'Colombia', 'CO', 'COL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(48, 'Comoros', 'KM', 'COM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(49, 'Congo', 'CG', 'COG', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(50, 'Cook Islands', 'CK', 'COK', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(51, 'Costa Rica', 'CR', 'CRI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(52, 'Cote D\'Ivoire', 'CI', 'CIV', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(53, 'Croatia', 'HR', 'HRV', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(54, 'Cuba', 'CU', 'CUB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(55, 'Cyprus', 'CY', 'CYP', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(56, 'Czech Republic', 'CZ', 'CZE', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(57, 'Denmark', 'DK', 'DNK', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(58, 'Djibouti', 'DJ', 'DJI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(59, 'Dominica', 'DM', 'DMA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(60, 'Dominican Republic', 'DO', 'DOM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(61, 'East Timor', 'TP', 'TMP', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(62, 'Ecuador', 'EC', 'ECU', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(63, 'Egypt', 'EG', 'EGY', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(64, 'El Salvador', 'SV', 'SLV', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(66, 'Eritrea', 'ER', 'ERI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(67, 'Estonia', 'EE', 'EST', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(68, 'Ethiopia', 'ET', 'ETH', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(70, 'Faroe Islands', 'FO', 'FRO', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(71, 'Fiji', 'FJ', 'FJI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(72, 'Finland', 'FI', 'FIN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(73, 'France', 'FR', 'FRA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(74, 'France, Metropolitan', 'FX', 'FXX', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(75, 'French Guiana', 'GF', 'GUF', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(76, 'French Polynesia', 'PF', 'PYF', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(77, 'French Southern Territories', 'TF', 'ATF', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(78, 'Gabon', 'GA', 'GAB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(79, 'Gambia', 'GM', 'GMB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(80, 'Georgia', 'GE', 'GEO', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(81, 'Germany', 'DE', 'DEU', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(82, 'Ghana', 'GH', 'GHA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(83, 'Gibraltar', 'GI', 'GIB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(84, 'Greece', 'GR', 'GRC', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(85, 'Greenland', 'GL', 'GRL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(86, 'Grenada', 'GD', 'GRD', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(87, 'Guadeloupe', 'GP', 'GLP', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(88, 'Guam', 'GU', 'GUM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(89, 'Guatemala', 'GT', 'GTM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(90, 'Guinea', 'GN', 'GIN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(91, 'Guinea-bissau', 'GW', 'GNB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(92, 'Guyana', 'GY', 'GUY', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(93, 'Haiti', 'HT', 'HTI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(95, 'Honduras', 'HN', 'HND', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(96, 'Hong Kong', 'HK', 'HKG', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(97, 'Hungary', 'HU', 'HUN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(98, 'Iceland', 'IS', 'ISL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(99, 'India', 'IN', 'IND', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(100, 'Indonesia', 'ID', 'IDN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(102, 'Iraq', 'IQ', 'IRQ', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(103, 'Ireland', 'IE', 'IRL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(104, 'Israel', 'IL', 'ISR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(105, 'Italy', 'IT', 'ITA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(106, 'Jamaica', 'JM', 'JAM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(107, 'Japan', 'JP', 'JPN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(108, 'Jordan', 'JO', 'JOR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(109, 'Kazakhstan', 'KZ', 'KAZ', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(110, 'Kenya', 'KE', 'KEN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(111, 'Kiribati', 'KI', 'KIR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(112, 'North Korea', 'KP', 'PRK', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(113, 'Korea, Republic of', 'KR', 'KOR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(114, 'Kuwait', 'KW', 'KWT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(116, 'Lao People\'s Democratic Republic', 'LA', 'LAO', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(117, 'Latvia', 'LV', 'LVA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(118, 'Lebanon', 'LB', 'LBN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(119, 'Lesotho', 'LS', 'LSO', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(120, 'Liberia', 'LR', 'LBR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(122, 'Liechtenstein', 'LI', 'LIE', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(123, 'Lithuania', 'LT', 'LTU', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(124, 'Luxembourg', 'LU', 'LUX', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(125, 'Macau', 'MO', 'MAC', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(126, 'FYROM', 'MK', 'MKD', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(127, 'Madagascar', 'MG', 'MDG', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(128, 'Malawi', 'MW', 'MWI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(129, 'Malaysia', 'MY', 'MYS', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(130, 'Maldives', 'MV', 'MDV', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(131, 'Mali', 'ML', 'MLI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(132, 'Malta', 'MT', 'MLT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(133, 'Marshall Islands', 'MH', 'MHL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(134, 'Martinique', 'MQ', 'MTQ', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(135, 'Mauritania', 'MR', 'MRT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(136, 'Mauritius', 'MU', 'MUS', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(137, 'Mayotte', 'YT', 'MYT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(138, 'Mexico', 'MX', 'MEX', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(140, 'Moldova, Republic of', 'MD', 'MDA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(141, 'Monaco', 'MC', 'MCO', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(142, 'Mongolia', 'MN', 'MNG', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(143, 'Montserrat', 'MS', 'MSR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(144, 'Morocco', 'MA', 'MAR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(145, 'Mozambique', 'MZ', 'MOZ', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(146, 'Myanmar', 'MM', 'MMR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(147, 'Namibia', 'NA', 'NAM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(148, 'Nauru', 'NR', 'NRU', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(149, 'Nepal', 'NP', 'NPL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(150, 'Netherlands', 'NL', 'NLD', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(151, 'Netherlands Antilles', 'AN', 'ANT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(152, 'New Caledonia', 'NC', 'NCL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(153, 'New Zealand', 'NZ', 'NZL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(154, 'Nicaragua', 'NI', 'NIC', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(155, 'Niger', 'NE', 'NER', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(156, 'Nigeria', 'NG', 'NGA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(157, 'Niue', 'NU', 'NIU', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(158, 'Norfolk Island', 'NF', 'NFK', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(160, 'Norway', 'NO', 'NOR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(161, 'Oman', 'OM', 'OMN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(162, 'Pakistan', 'PK', 'PAK', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(163, 'Palau', 'PW', 'PLW', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(164, 'Panama', 'PA', 'PAN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(165, 'Papua New Guinea', 'PG', 'PNG', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(166, 'Paraguay', 'PY', 'PRY', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(167, 'Peru', 'PE', 'PER', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(168, 'Philippines', 'PH', 'PHL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(169, 'Pitcairn', 'PN', 'PCN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(170, 'Poland', 'PL', 'POL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(171, 'Portugal', 'PT', 'PRT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(172, 'Puerto Rico', 'PR', 'PRI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(173, 'Qatar', 'QA', 'QAT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(174, 'Reunion', 'RE', 'REU', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(175, 'Romania', 'RO', 'ROM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(176, 'Russian Federation', 'RU', 'RUS', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(177, 'Rwanda', 'RW', 'RWA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(179, 'Saint Lucia', 'LC', 'LCA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(181, 'Samoa', 'WS', 'WSM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(182, 'San Marino', 'SM', 'SMR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(183, 'Sao Tome and Principe', 'ST', 'STP', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(184, 'Saudi Arabia', 'SA', 'SAU', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(185, 'Senegal', 'SN', 'SEN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(186, 'Seychelles', 'SC', 'SYC', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(187, 'Sierra Leone', 'SL', 'SLE', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(188, 'Singapore', 'SG', 'SGP', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(189, 'Slovak Republic', 'SK', 'SVK', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(190, 'Slovenia', 'SI', 'SVN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(191, 'Solomon Islands', 'SB', 'SLB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(192, 'Somalia', 'SO', 'SOM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(193, 'South Africa', 'ZA', 'ZAF', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(195, 'Spain', 'ES', 'ESP', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(196, 'Sri Lanka', 'LK', 'LKA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(197, 'St. Helena', 'SH', 'SHN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(199, 'Sudan', 'SD', 'SDN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(200, 'Suriname', 'SR', 'SUR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(202, 'Swaziland', 'SZ', 'SWZ', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(203, 'Sweden', 'SE', 'SWE', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(204, 'Switzerland', 'CH', 'CHE', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(206, 'Taiwan', 'TW', 'TWN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(207, 'Tajikistan', 'TJ', 'TJK', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(209, 'Thailand', 'TH', 'THA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(210, 'Togo', 'TG', 'TGO', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(211, 'Tokelau', 'TK', 'TKL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(212, 'Tonga', 'TO', 'TON', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(214, 'Tunisia', 'TN', 'TUN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(215, 'Turkey', 'TR', 'TUR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(216, 'Turkmenistan', 'TM', 'TKM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(218, 'Tuvalu', 'TV', 'TUV', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(219, 'Uganda', 'UG', 'UGA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(220, 'Ukraine', 'UA', 'UKR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(221, 'United Arab Emirates', 'AE', 'ARE', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(222, 'United Kingdom', 'GB', 'GBR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(223, 'United States', 'US', 'USA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(225, 'Uruguay', 'UY', 'URY', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(226, 'Uzbekistan', 'UZ', 'UZB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(227, 'Vanuatu', 'VU', 'VUT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(229, 'Venezuela', 'VE', 'VEN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(230, 'Viet Nam', 'VN', 'VNM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(234, 'Western Sahara', 'EH', 'ESH', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(235, 'Yemen', 'YE', 'YEM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(236, 'Yugoslavia', 'YU', 'YUG', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(238, 'Zambia', 'ZM', 'ZMB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36'),
(239, 'Zimbabwe', 'ZW', 'ZWE', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999, '2022-10-26 20:20:36', '2022-10-26 20:20:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_currencies`
--

CREATE TABLE `btl_currencies` (
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` int(11) NOT NULL,
  `currency_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` decimal(15,8) NOT NULL,
  `symbol_position` tinyint(1) DEFAULT NULL,
  `thousand_sign` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_sign` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_position` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_alpha2` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_alpha3` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_numeric` int(11) DEFAULT NULL,
  `currency_status` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_currencies`
--

INSERT INTO `btl_currencies` (`currency_id`, `country_id`, `currency_name`, `currency_code`, `currency_symbol`, `currency_rate`, `symbol_position`, `thousand_sign`, `decimal_sign`, `decimal_position`, `iso_alpha2`, `iso_alpha3`, `iso_numeric`, `currency_status`, `updated_at`, `created_at`) VALUES
(1, 222, 'Pound Sterling', 'GBP', '£', '0.00000000', 0, ',', '.', '2', 'GB', 'GBR', 826, 1, '2022-10-26 15:20:37', '2022-10-26 20:20:37'),
(2, 223, 'US Dollar', 'USD', '$', '0.00000000', 0, ',', '.', '2', 'US', 'USA', 840, 0, '2022-10-26 15:20:37', '2022-10-26 20:20:37'),
(3, 44, 'Yuan Renminbi', 'CNY', '¥', '0.00000000', 0, ',', '.', '2', 'CN', 'CHN', 156, 0, '2022-10-26 15:20:37', '2022-10-26 20:20:37'),
(4, 13, 'Australian Dollar', 'AUD', '$', '0.00000000', 0, ',', '.', '2', 'AU', 'AUS', 36, 1, '2022-10-26 15:20:37', '2022-10-26 20:20:37'),
(5, 156, 'Naira', 'NGN', '₦', '0.00000000', 0, ',', '.', '2', 'NG', 'NGA', 566, 1, '2022-10-26 15:20:37', '2022-10-26 20:20:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_customers`
--

CREATE TABLE `btl_customers` (
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `newsletter` tinyint(1) DEFAULT NULL,
  `customer_group_id` int(11) NOT NULL,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `reset_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_time` datetime DEFAULT NULL,
  `activation_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_activated` tinyint(1) DEFAULT NULL,
  `date_activated` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_location_area` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_customer_groups`
--

CREATE TABLE `btl_customer_groups` (
  `customer_group_id` bigint(20) UNSIGNED NOT NULL,
  `group_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approval` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_customer_groups`
--

INSERT INTO `btl_customer_groups` (`customer_group_id`, `group_name`, `description`, `approval`, `created_at`, `updated_at`) VALUES
(1, 'Default group', NULL, 0, '2022-10-26 20:20:37', '2022-10-26 20:20:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_extensions`
--

CREATE TABLE `btl_extensions` (
  `extension_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '1.0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_extensions`
--

INSERT INTO `btl_extensions` (`extension_id`, `name`, `version`) VALUES
(1, 'igniter.demo', '0.1.0'),
(2, 'igniter.cart', 'v2.15.2'),
(3, 'igniter.local', 'v2.9.1'),
(4, 'igniter.user', 'v1.10.1'),
(5, 'igniter.payregister', 'v2.5.0'),
(6, 'igniter.frontend', 'v1.10.1'),
(7, 'igniter.reservation', 'v2.9.1'),
(8, 'igniterlabs.smsnotify', 'v3.0.2'),
(9, 'igniter.coupons', 'v1.10.1'),
(10, 'SussexCoder.Poll', 'v1.0.0'),
(11, 'thoughtco.reports', '2.0.4'),
(12, 'igniter.automation', 'v1.6.1'),
(13, 'igniter.pages', 'v1.9.3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_extension_settings`
--

CREATE TABLE `btl_extension_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_extension_settings`
--

INSERT INTO `btl_extension_settings` (`id`, `item`, `data`) VALUES
(1, 'igniter_review_settings', '{\"allow_reviews\":\"1\",\"approve_reviews\":\"1\",\"ratings\":{\"ratings\":[\"Bad\",\"Worse\",\"Good\",\"Average\",\"Excellent\"]}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_failed_jobs`
--

CREATE TABLE `btl_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_igniterlabs_smsnotify_channels`
--

CREATE TABLE `btl_igniterlabs_smsnotify_channels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT 0,
  `is_default` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_igniterlabs_smsnotify_logs`
--

CREATE TABLE `btl_igniterlabs_smsnotify_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `channel` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_igniterlabs_smsnotify_templates`
--

CREATE TABLE `btl_igniterlabs_smsnotify_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_custom` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_igniterlabs_smsnotify_templates`
--

INSERT INTO `btl_igniterlabs_smsnotify_templates` (`id`, `code`, `name`, `content`, `is_custom`, `created_at`, `updated_at`) VALUES
(1, 'igniterlabs.smsnotify::_sms.new_order', 'igniterlabs.smsnotify::default.template.text_order_placed', NULL, 0, '2022-10-26 21:48:33', '2022-10-26 21:48:33'),
(2, 'igniterlabs.smsnotify::_sms.new_reservation', 'igniterlabs.smsnotify::default.template.text_new_reservation', NULL, 0, '2022-10-26 21:48:33', '2022-10-26 21:48:33'),
(3, 'igniterlabs.smsnotify::_sms.order_assigned', 'igniterlabs.smsnotify::default.template.text_order_assigned', NULL, 0, '2022-10-26 21:48:33', '2022-10-26 21:48:33'),
(4, 'igniterlabs.smsnotify::_sms.order_confirmed', 'igniterlabs.smsnotify::default.template.text_order_confirmed', NULL, 0, '2022-10-26 21:48:33', '2022-10-26 21:48:33'),
(5, 'igniterlabs.smsnotify::_sms.order_status_changed', 'igniterlabs.smsnotify::default.template.text_order_status_changed', NULL, 0, '2022-10-26 21:48:33', '2022-10-26 21:48:33'),
(6, 'igniterlabs.smsnotify::_sms.reservation_assigned', 'igniterlabs.smsnotify::default.template.text_reservation_assigned', NULL, 0, '2022-10-26 21:48:33', '2022-10-26 21:48:33'),
(7, 'igniterlabs.smsnotify::_sms.reservation_confirmed', 'igniterlabs.smsnotify::default.template.text_reservation_confirmed', NULL, 0, '2022-10-26 21:48:33', '2022-10-26 21:48:33'),
(8, 'igniterlabs.smsnotify::_sms.reservation_status_changed', 'igniterlabs.smsnotify::default.template.text_reservation_status_changed', NULL, 0, '2022-10-26 21:48:33', '2022-10-26 21:48:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_igniter_automation_logs`
--

CREATE TABLE `btl_igniter_automation_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `automation_rule_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rule_action_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_success` tinyint(1) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exception` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_igniter_automation_rules`
--

CREATE TABLE `btl_igniter_automation_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_class` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_igniter_automation_rule_actions`
--

CREATE TABLE `btl_igniter_automation_rule_actions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `automation_rule_id` bigint(20) UNSIGNED DEFAULT NULL,
  `class_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_igniter_automation_rule_conditions`
--

CREATE TABLE `btl_igniter_automation_rule_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `automation_rule_id` bigint(20) UNSIGNED DEFAULT NULL,
  `class_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_igniter_cart_cart`
--

CREATE TABLE `btl_igniter_cart_cart` (
  `identifier` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_igniter_coupons`
--

CREATE TABLE `btl_igniter_coupons` (
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(15,4) DEFAULT NULL,
  `min_total` decimal(15,4) DEFAULT NULL,
  `redemptions` int(11) NOT NULL DEFAULT 0,
  `customer_redemptions` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` date NOT NULL,
  `validity` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_date` date DEFAULT NULL,
  `fixed_from_time` time DEFAULT NULL,
  `fixed_to_time` time DEFAULT NULL,
  `period_start_date` date DEFAULT NULL,
  `period_end_date` date DEFAULT NULL,
  `recurring_every` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recurring_from_time` time DEFAULT NULL,
  `recurring_to_time` time DEFAULT NULL,
  `order_restriction` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_limited_to_cart_item` tinyint(1) NOT NULL DEFAULT 0,
  `auto_apply` tinyint(1) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_igniter_coupons`
--

INSERT INTO `btl_igniter_coupons` (`coupon_id`, `name`, `code`, `type`, `discount`, `min_total`, `redemptions`, `customer_redemptions`, `description`, `status`, `created_at`, `validity`, `fixed_date`, `fixed_from_time`, `fixed_to_time`, `period_start_date`, `period_end_date`, `recurring_every`, `recurring_from_time`, `recurring_to_time`, `order_restriction`, `is_limited_to_cart_item`, `auto_apply`, `updated_at`) VALUES
(1, 'Half Sundays', '2222', 'F', '100.0000', '500.0000', 0, 0, NULL, 1, '2022-10-26', 'forever', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00'),
(2, 'Half Tuesdays', '3333', 'P', '30.0000', '1000.0000', 0, 0, NULL, 1, '2022-10-26', 'forever', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00'),
(3, 'Full Mondays', 'MTo6TuTg', 'P', '50.0000', '0.0000', 0, 1, NULL, 1, '2022-10-26', 'forever', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00'),
(4, 'Full Tuesdays', '4444', 'F', '500.0000', '5000.0000', 0, 0, NULL, 1, '2022-10-26', 'forever', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_igniter_coupons_history`
--

CREATE TABLE `btl_igniter_coupons_history` (
  `coupon_history_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_total` decimal(15,4) DEFAULT NULL,
  `amount` decimal(15,4) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_igniter_coupon_categories`
--

CREATE TABLE `btl_igniter_coupon_categories` (
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_igniter_coupon_menus`
--

CREATE TABLE `btl_igniter_coupon_menus` (
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_igniter_frontend_banners`
--

CREATE TABLE `btl_igniter_frontend_banners` (
  `banner_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `click_url` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  `alt_text` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_igniter_frontend_sliders`
--

CREATE TABLE `btl_igniter_frontend_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_igniter_frontend_sliders`
--

INSERT INTO `btl_igniter_frontend_sliders` (`id`, `name`, `code`, `metadata`, `created_at`, `updated_at`) VALUES
(1, 'Homepage slider', 'home-slider', NULL, '2022-10-26 21:44:40', '2022-10-26 21:44:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_igniter_frontend_subscribers`
--

CREATE TABLE `btl_igniter_frontend_subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statistics` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_igniter_pages_menus`
--

CREATE TABLE `btl_igniter_pages_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme_code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_igniter_pages_menus`
--

INSERT INTO `btl_igniter_pages_menus` (`id`, `theme_code`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'tastyigniter-orange', 'Footer menu', 'footer-menu', '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(2, 'tastyigniter-orange', 'Main menu', 'main-menu', '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(3, 'tastyigniter-orange', 'Pages menu', 'pages-menu', '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(4, 'tastyigniter-red', 'Footer menu', 'footer-menu', '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(5, 'tastyigniter-red', 'Main menu', 'main-menu', '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(6, 'tastyigniter-red', 'Pages menu', 'pages-menu', '2022-10-26 21:48:59', '2022-10-26 21:48:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_igniter_pages_menu_items`
--

CREATE TABLE `btl_igniter_pages_menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_igniter_pages_menu_items`
--

INSERT INTO `btl_igniter_pages_menu_items` (`id`, `menu_id`, `parent_id`, `title`, `code`, `description`, `type`, `url`, `reference`, `config`, `nest_left`, `nest_right`, `priority`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'TastyIgniter', '', NULL, 'header', NULL, NULL, '[]', 1, 8, 1, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(2, 1, 1, 'main::lang.menu_menu', '', NULL, 'theme-page', NULL, 'local\\menus', '[]', 2, 3, 2, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(3, 1, 1, 'main::lang.menu_reservation', '', NULL, 'theme-page', NULL, 'reservation\\reservation', '[]', 4, 5, 3, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(4, 1, 1, 'main::lang.menu_locations', '', NULL, 'theme-page', NULL, 'locations', '[]', 6, 7, 4, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(5, 1, NULL, 'main::lang.text_information', '', NULL, 'header', NULL, NULL, '[]', 9, 18, 5, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(6, 1, 5, 'main::lang.menu_contact', '', NULL, 'theme-page', NULL, 'contact', '[]', 10, 11, 6, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(7, 1, 5, 'main::lang.menu_admin', '', NULL, 'url', 'http://localhost/testigniter/admin', NULL, '[]', 12, 13, 7, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(8, 1, 5, 'About Us', '', NULL, 'static-page', NULL, '1', '[]', 14, 15, 8, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(9, 1, 5, 'Privacy Policy', '', NULL, 'static-page', NULL, '2', '[]', 16, 17, 9, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(10, 2, NULL, 'main::lang.menu_menu', 'view-menu', NULL, 'theme-page', NULL, 'local\\menus', '[]', 19, 20, 10, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(11, 2, NULL, 'main::lang.menu_reservation', 'reservation', NULL, 'theme-page', NULL, 'reservation\\reservation', '[]', 21, 22, 11, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(12, 2, NULL, 'main::lang.menu_login', 'login', NULL, 'theme-page', NULL, 'account\\login', '[]', 23, 24, 12, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(13, 2, NULL, 'main::lang.menu_register', 'register', NULL, 'theme-page', NULL, 'account\\register', '[]', 25, 26, 13, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(14, 2, NULL, 'main::lang.menu_my_account', 'account', NULL, 'theme-page', NULL, 'account\\account', '[]', 27, 38, 14, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(15, 2, 14, 'main::lang.menu_recent_order', 'recent-orders', NULL, 'theme-page', NULL, 'account\\orders', '[]', 28, 29, 15, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(16, 2, 14, 'main::lang.menu_my_account', '', NULL, 'theme-page', NULL, 'account\\account', '[]', 30, 31, 16, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(17, 2, 14, 'main::lang.menu_address', '', NULL, 'theme-page', NULL, 'account\\address', '[]', 32, 33, 17, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(18, 2, 14, 'main::lang.menu_recent_reservation', '', NULL, 'theme-page', NULL, 'account\\reservations', '[]', 34, 35, 18, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(19, 2, 14, 'main::lang.menu_logout', '', NULL, 'url', 'javascript:;', NULL, '{\"extraAttributes\":\"data-request=\\\"session::onLogout\\\"\"}', 36, 37, 19, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(20, 3, NULL, 'Pages', '', NULL, 'all-static-pages', NULL, '', '[]', 39, 40, 20, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(21, 4, NULL, 'TastyIgniter', '', NULL, 'header', NULL, NULL, '[]', 41, 48, 21, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(22, 4, 21, 'main::lang.menu_menu', '', NULL, 'theme-page', NULL, 'local/menus', '[]', 42, 43, 22, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(23, 4, 21, 'main::lang.menu_reservation', '', NULL, 'theme-page', NULL, 'reservation/reservation', '[]', 44, 45, 23, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(24, 4, 21, 'main::lang.menu_locations', '', NULL, 'theme-page', NULL, 'locations', '[]', 46, 47, 24, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(25, 4, NULL, 'main::lang.text_information', '', NULL, 'header', NULL, NULL, '[]', 49, 58, 25, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(26, 4, 25, 'main::lang.menu_contact', '', NULL, 'theme-page', NULL, 'contact', '[]', 50, 51, 26, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(27, 4, 25, 'main::lang.menu_admin', '', NULL, 'url', 'http://localhost/testigniter/admin', NULL, '[]', 52, 53, 27, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(28, 4, 25, 'About Us', '', NULL, 'static-page', NULL, '1', '[]', 54, 55, 28, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(29, 4, 25, 'Privacy Policy', '', NULL, 'static-page', NULL, '2', '[]', 56, 57, 29, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(30, 5, NULL, 'main::lang.menu_menu', 'view-menu', NULL, 'theme-page', NULL, 'local/menus', '[]', 59, 60, 30, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(31, 5, NULL, 'main::lang.menu_reservation', 'reservation', NULL, 'theme-page', NULL, 'reservation/reservation', '[]', 61, 62, 31, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(32, 5, NULL, 'main::lang.menu_login', 'login', NULL, 'theme-page', NULL, 'account/login', '[]', 63, 64, 32, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(33, 5, NULL, 'main::lang.menu_register', 'register', NULL, 'theme-page', NULL, 'account/register', '[]', 65, 66, 33, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(34, 5, NULL, 'main::lang.menu_my_account', 'account', NULL, 'theme-page', NULL, 'account/account', '[]', 67, 78, 34, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(35, 5, 34, 'main::lang.menu_recent_order', 'recent-orders', NULL, 'theme-page', NULL, 'account/orders', '[]', 68, 69, 35, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(36, 5, 34, 'main::lang.menu_my_account', '', NULL, 'theme-page', NULL, 'account/account', '[]', 70, 71, 36, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(37, 5, 34, 'main::lang.menu_address', '', NULL, 'theme-page', NULL, 'account/address', '[]', 72, 73, 37, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(38, 5, 34, 'main::lang.menu_recent_reservation', '', NULL, 'theme-page', NULL, 'account/reservations', '[]', 74, 75, 38, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(39, 5, 34, 'main::lang.menu_logout', '', NULL, 'url', 'javascript:;', NULL, '{\"extraAttributes\":\"data-request=\\\"session::onLogout\\\"\"}', 76, 77, 39, '2022-10-26 21:48:59', '2022-10-26 21:48:59'),
(40, 6, NULL, 'Pages', '', NULL, 'all-static-pages', NULL, '', '[]', 79, 80, 40, '2022-10-26 21:48:59', '2022-10-26 21:48:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_igniter_reviews`
--

CREATE TABLE `btl_igniter_reviews` (
  `review_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sale_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sale_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `author` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quality` int(11) NOT NULL,
  `delivery` int(11) NOT NULL,
  `service` int(11) NOT NULL,
  `review_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `review_status` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_jobs`
--

CREATE TABLE `btl_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_job_batches`
--

CREATE TABLE `btl_job_batches` (
  `id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_languages`
--

CREATE TABLE `btl_languages` (
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idiom` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `original_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `version` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_languages`
--

INSERT INTO `btl_languages` (`language_id`, `code`, `name`, `image`, `idiom`, `status`, `can_delete`, `original_id`, `created_at`, `updated_at`, `version`) VALUES
(1, 'en', 'English', NULL, 'english', 1, 0, NULL, '2022-10-26 20:20:37', '2022-10-26 20:20:37', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_language_translations`
--

CREATE TABLE `btl_language_translations` (
  `translation_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namespace` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `group` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unstable` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_locationables`
--

CREATE TABLE `btl_locationables` (
  `location_id` int(11) NOT NULL,
  `locationable_id` int(11) NOT NULL,
  `locationable_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_locationables`
--

INSERT INTO `btl_locationables` (`location_id`, `locationable_id`, `locationable_type`, `options`) VALUES
(1, 1, 'tables', NULL),
(1, 2, 'tables', NULL),
(1, 3, 'tables', NULL),
(1, 4, 'tables', NULL),
(1, 5, 'tables', NULL),
(1, 6, 'tables', NULL),
(1, 7, 'tables', NULL),
(1, 8, 'tables', NULL),
(1, 9, 'tables', NULL),
(1, 10, 'tables', NULL),
(1, 11, 'tables', NULL),
(1, 12, 'tables', NULL),
(1, 13, 'tables', NULL),
(1, 14, 'tables', NULL),
(1, 1, 'staffs', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_locations`
--

CREATE TABLE `btl_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `location_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_address_1` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_address_2` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_city` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_state` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_country_id` int(11) DEFAULT NULL,
  `location_telephone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_lat` double DEFAULT NULL,
  `location_lng` double DEFAULT NULL,
  `location_radius` int(11) DEFAULT NULL,
  `location_status` tinyint(1) DEFAULT NULL,
  `permalink_slug` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_locations`
--

INSERT INTO `btl_locations` (`location_id`, `location_name`, `location_email`, `description`, `location_address_1`, `location_address_2`, `location_city`, `location_state`, `location_postcode`, `location_country_id`, `location_telephone`, `location_lat`, `location_lng`, `location_radius`, `location_status`, `permalink_slug`, `created_at`, `updated_at`) VALUES
(1, 'Default', 'admin@restaurant.com', NULL, 'Broad Ln', NULL, 'Coventry', NULL, NULL, 222, '8765456789', 52.415884, -1.603648, NULL, 1, 'default', '2022-10-26 20:20:37', '2022-10-26 20:20:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_location_areas`
--

CREATE TABLE `btl_location_areas` (
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `location_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `boundaries` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `conditions` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_location_options`
--

CREATE TABLE `btl_location_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`value`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_mail_layouts`
--

CREATE TABLE `btl_mail_layouts` (
  `layout_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `layout` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plain_layout` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout_css` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_mail_layouts`
--

INSERT INTO `btl_mail_layouts` (`layout_id`, `name`, `language_id`, `created_at`, `updated_at`, `status`, `code`, `layout`, `plain_layout`, `layout_css`, `is_locked`) VALUES
(1, 'Default layout', 0, '2022-10-26 16:27:52', '2022-10-26 16:27:52', 0, 'default', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/>\n</head>\n<body>\n<style type=\"text/css\">\n    {{ $custom_css }}\n    {{ $layout_css }}\n</style>\n\n<table class=\"wrapper\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td align=\"center\">\n            <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                @partial(\'header\')\n                @php $site_logo = setting(\'mail_logo\') ?: $site_logo; @endphp\n                @isset($site_logo)\n                    <img\n                        src=\"{{ \\Main\\Models\\Image_tool_model::resize($site_logo, [\'height\' => 90]) }}\"\n                        alt=\"{{ $site_name }}\"\n                    >\n                @endisset\n                @endpartial\n                <tr>\n                    <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                        <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                            <!-- Body content -->\n                            <tr>\n                                <td class=\"content-cell\">\n                                    {{ $body }}\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                </tr>\n                @partial(\'footer\')\n                <p>&copy; {{ date(\'Y\') }} {{ $site_name }}. All rights reserved.</p>\n                @endpartial\n            </table>\n        </td>\n    </tr>\n</table>\n</body>\n</html>', '{{ $body }}', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_mail_partials`
--

CREATE TABLE `btl_mail_partials` (
  `partial_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `html` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_mail_partials`
--

INSERT INTO `btl_mail_partials` (`partial_id`, `name`, `code`, `html`, `text`, `is_custom`, `created_at`, `updated_at`) VALUES
(1, 'Header', 'header', '<tr>\n    <td class=\"header\">\n        @if (isset($url))\n        <a href=\"{{ $url }}\">\n            {{ $slot }}\n        </a>\n        @else\n        <span>\n            {{ $slot }}\n        </span>\n        @endif\n    </td>\n</tr>', '*** {{ $slot }} <{{ $url }}>', 0, '2022-10-26 21:27:52', '2022-10-26 21:27:52'),
(2, 'Footer', 'footer', '<tr>\n    <td>\n        <table class=\"footer\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n            <tr>\n                <td class=\"content-cell\" align=\"center\">\n                    {{ $slot }}\n                </td>\n            </tr>\n        </table>\n    </td>\n</tr>', '-------------------\n{{ $slot }}', 0, '2022-10-26 21:27:52', '2022-10-26 21:27:52'),
(3, 'Button', 'button', '<table class=\"action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td>\n            <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n                <tr>\n                    <td>\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n                            <tr>\n                                <td>\n                                    <a href=\"{{ $url }}\" class=\"button button-{{ $type ?? \'primary\' }}\" target=\"_blank\">{{ $slot }}</a>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                </tr>\n            </table>\n        </td>\n    </tr>\n</table>', '{{ $slot }} <{{ $url }}>', 0, '2022-10-26 21:27:52', '2022-10-26 21:27:52'),
(4, 'Panel', 'panel', '<table class=\"panel\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td class=\"panel-content\">\n            <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                <tr>\n                    <td class=\"panel-item\">\n                        {{ $slot }}\n                    </td>\n                </tr>\n            </table>\n        </td>\n    </tr>\n</table>', '{{ $slot }}', 0, '2022-10-26 21:27:52', '2022-10-26 21:27:52'),
(5, 'Table', 'table', '<div class=\"table\">\n{{ $slot }}\n</div>', '{{ $slot }}', 0, '2022-10-26 21:27:52', '2022-10-26 21:27:52'),
(6, 'Subcopy', 'subcopy', '<table class=\"subcopy\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td>\n            {{ $slot }}\n        </td>\n    </tr>\n</table>', '-----\n{{ $slot }}', 0, '2022-10-26 21:27:52', '2022-10-26 21:27:52'),
(7, 'Promotion', 'promotion', '<table class=\"promotion\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td align=\"center\">\n            {{ $slot }}\n        </td>\n    </tr>\n</table>', '{{ $slot }}', 0, '2022-10-26 21:27:52', '2022-10-26 21:27:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_mail_templates`
--

CREATE TABLE `btl_mail_templates` (
  `template_id` bigint(20) UNSIGNED NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_custom` tinyint(1) DEFAULT NULL,
  `plain_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_mail_templates`
--

INSERT INTO `btl_mail_templates` (`template_id`, `layout_id`, `code`, `subject`, `body`, `created_at`, `updated_at`, `label`, `is_custom`, `plain_body`) VALUES
(1, 1, 'admin::_mail.order_update', '', '', '2022-10-26 16:27:52', '2022-10-26 16:27:52', 'lang:system::lang.mail_templates.text_order_update', 0, NULL),
(2, 1, 'admin::_mail.reservation_update', '', '', '2022-10-26 16:27:52', '2022-10-26 16:27:52', 'lang:system::lang.mail_templates.text_reservation_update', 0, NULL),
(3, 1, 'admin::_mail.password_reset', '', '', '2022-10-26 16:27:52', '2022-10-26 16:27:52', 'lang:system::lang.mail_templates.text_password_reset_alert', 0, NULL),
(4, 1, 'admin::_mail.password_reset_request', '', '', '2022-10-26 16:27:52', '2022-10-26 16:27:52', 'lang:system::lang.mail_templates.text_password_reset_request_alert', 0, NULL),
(5, 1, 'igniter.user::mail.password_reset', '', '', '2022-10-26 16:48:35', '2022-10-26 16:48:35', 'Password reset email to customer', 0, NULL),
(6, 1, 'igniter.user::mail.password_reset_request', '', '', '2022-10-26 16:48:35', '2022-10-26 16:48:35', 'Password reset request email to customer', 0, NULL),
(7, 1, 'igniter.user::mail.registration', '', '', '2022-10-26 16:48:35', '2022-10-26 16:48:35', 'Registration email to customer', 0, NULL),
(8, 1, 'igniter.user::mail.registration_alert', '', '', '2022-10-26 16:48:35', '2022-10-26 16:48:35', 'Registration email to admin', 0, NULL),
(9, 1, 'igniter.user::mail.activation', '', '', '2022-10-26 16:48:35', '2022-10-26 16:48:35', 'Registration activation email to customer', 0, NULL),
(10, 1, 'igniter.reservation::mail.reservation', '', '', '2022-10-26 16:48:35', '2022-10-26 16:48:35', 'Reservation confirmation email to customer', 0, NULL),
(11, 1, 'igniter.reservation::mail.reservation_alert', '', '', '2022-10-26 16:48:35', '2022-10-26 16:48:35', 'New reservation alert email to admin', 0, NULL),
(12, 1, 'igniter.local::mail.review_chase', '', '', '2022-10-26 16:48:35', '2022-10-26 16:48:35', 'lang:igniter.local::default.reviews.text_chase_email', 0, NULL),
(13, 1, 'igniter.frontend::mail.contact', '', '', '2022-10-26 16:48:35', '2022-10-26 16:48:35', 'Contact form email to admin', 0, NULL),
(14, 1, 'igniter.cart::mail.order', '', '', '2022-10-26 16:48:35', '2022-10-26 16:48:35', 'Order confirmation email to customer', 0, NULL),
(15, 1, 'igniter.cart::mail.order_alert', '', '', '2022-10-26 16:48:35', '2022-10-26 16:48:35', 'New order alert email to admin', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_mealtimes`
--

CREATE TABLE `btl_mealtimes` (
  `mealtime_id` bigint(20) UNSIGNED NOT NULL,
  `mealtime_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL DEFAULT '00:00:00',
  `end_time` time NOT NULL DEFAULT '23:59:59',
  `mealtime_status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_mealtimes`
--

INSERT INTO `btl_mealtimes` (`mealtime_id`, `mealtime_name`, `start_time`, `end_time`, `mealtime_status`, `created_at`, `updated_at`) VALUES
(1, 'Breakfast', '07:00:00', '10:00:00', 1, '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(2, 'Lunch', '12:00:00', '14:30:00', 1, '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(3, 'Dinner', '18:00:00', '20:00:00', 1, '2022-10-26 20:20:37', '2022-10-26 20:20:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_media_attachments`
--

CREATE TABLE `btl_media_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `disk` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `tag` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `custom_properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_media_attachments`
--

INSERT INTO `btl_media_attachments` (`id`, `disk`, `name`, `file_name`, `mime_type`, `size`, `tag`, `attachment_type`, `attachment_id`, `is_public`, `custom_properties`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'media', '635955e87e799053389277.png', 'slide.png', 'image/jpeg', 748127, 'images', 'sliders', 1, 1, '[]', 1, '2022-10-26 21:44:40', '2022-10-26 21:44:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_menus`
--

CREATE TABLE `btl_menus` (
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `menu_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_price` decimal(15,4) NOT NULL,
  `minimum_qty` int(11) NOT NULL DEFAULT 0,
  `menu_status` tinyint(1) NOT NULL,
  `menu_priority` int(11) NOT NULL DEFAULT 0,
  `order_restriction` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_menus_specials`
--

CREATE TABLE `btl_menus_specials` (
  `special_id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(11) NOT NULL DEFAULT 0,
  `start_date` datetime DEFAULT current_timestamp(),
  `end_date` datetime DEFAULT current_timestamp(),
  `special_price` decimal(15,4) DEFAULT NULL,
  `special_status` tinyint(1) NOT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validity` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurring_every` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recurring_from` time DEFAULT NULL,
  `recurring_to` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_menu_categories`
--

CREATE TABLE `btl_menu_categories` (
  `menu_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_menu_item_options`
--

CREATE TABLE `btl_menu_item_options` (
  `menu_option_id` bigint(20) UNSIGNED NOT NULL,
  `option_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  `min_selected` int(11) NOT NULL DEFAULT 0,
  `max_selected` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_menu_item_option_values`
--

CREATE TABLE `btl_menu_item_option_values` (
  `menu_option_value_id` bigint(20) UNSIGNED NOT NULL,
  `menu_option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `new_price` decimal(15,4) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `is_default` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_menu_mealtimes`
--

CREATE TABLE `btl_menu_mealtimes` (
  `menu_id` int(10) UNSIGNED NOT NULL,
  `mealtime_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_menu_options`
--

CREATE TABLE `btl_menu_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `update_related_menu_item` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_menu_option_values`
--

CREATE TABLE `btl_menu_option_values` (
  `option_value_id` bigint(20) UNSIGNED NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,4) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_migrations`
--

CREATE TABLE `btl_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `group` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `migration` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_migrations`
--

INSERT INTO `btl_migrations` (`id`, `group`, `migration`, `batch`) VALUES
(1, 'System', '2015_03_25_000001_create_tables', 1),
(2, 'System', '2016_11_29_000300_optimize_tables_columns', 1),
(3, 'System', '2017_04_13_000300_modify_columns_on_users_and_customers_tables', 1),
(4, 'System', '2017_05_08_000300_add_columns', 1),
(5, 'System', '2017_06_11_000300_create_payments_and_payment_logs_table', 1),
(6, 'System', '2017_08_23_000300_create_themes_table', 1),
(7, 'System', '2018_01_23_000300_create_language_translations_table', 1),
(8, 'System', '2018_03_30_000300_create_extension_settings_table', 1),
(9, 'System', '2018_06_12_000300_rename_model_class_names_to_morph_map_custom_names', 1),
(10, 'System', '2018_10_19_000300_create_media_attachments_table', 1),
(11, 'System', '2018_10_21_131033_create_queue_table', 1),
(12, 'System', '2018_10_21_131044_create_sessions_table', 1),
(13, 'System', '2019_04_16_000300_nullify_customer_id_on_addresses_table', 1),
(14, 'System', '2019_07_01_000300_delete_unused_columns_from_activities_table', 1),
(15, 'System', '2019_07_22_000300_add_user_type_column_to_activities_table', 1),
(16, 'System', '2019_07_30_000300_create_mail_partials_table', 1),
(17, 'System', '2020_02_05_000300_delete_stale_unused_table', 1),
(18, 'System', '2020_04_16_000300_drop_stale_unused_columns', 1),
(19, 'System', '2020_05_24_000300_create_request_logs_table', 1),
(20, 'System', '2021_07_20_000300_add_uuid_column_to_failed_jobs_table', 1),
(21, 'System', '2021_07_20_172212_create_job_batches_table', 1),
(22, 'System', '2021_07_20_172321_create_cache_table', 1),
(23, 'System', '2021_09_06_010000_add_timestamps_to_tables', 1),
(24, 'System', '2021_10_22_010000_make_primary_key_bigint_all_tables', 1),
(25, 'System', '2021_10_25_010000_add_foreign_key_constraints_to_tables', 1),
(26, 'System', '2022_04_20_000300_add_version_column_to_languages_table', 1),
(27, 'System', '2022_06_30_010000_drop_foreign_key_constraints_on_all_tables', 1),
(28, 'Admin', '2017_08_25_000300_create_location_areas_table', 1),
(29, 'Admin', '2017_08_25_000300_create_menu_categories_table', 1),
(30, 'Admin', '2018_01_19_000300_add_hash_columns_on_orders_reservations_table', 1),
(31, 'Admin', '2018_04_06_000300_drop_unique_on_order_totals_table', 1),
(32, 'Admin', '2018_04_12_000300_modify_columns_on_orders_reservations_table', 1),
(33, 'Admin', '2018_05_21_000300_drop_redundant_columns_on_kitchen_tables', 1),
(34, 'Admin', '2018_05_29_000300_add_columns_on_location_areas_table', 1),
(35, 'Admin', '2018_06_12_000300_create_locationables_table', 1),
(36, 'Admin', '2018_07_04_000300_create_user_preferences_table', 1),
(37, 'Admin', '2018_10_09_000300_auto_increment_on_order_totals_table', 1),
(38, 'Admin', '2019_04_09_000300_auto_increment_on_user_preferences_table', 1),
(39, 'Admin', '2019_07_02_000300_add_columns_on_menu_specials_table', 1),
(40, 'Admin', '2019_07_16_000300_create_reservation_tables_table', 1),
(41, 'Admin', '2019_07_21_000300_change_sort_value_ratings_to_config_on_settings_table', 1),
(42, 'Admin', '2019_11_08_000300_add_selected_columns_to_menu_options_table', 1),
(43, 'Admin', '2020_02_18_000400_create_staffs_groups_and_locations_table', 1),
(44, 'Admin', '2020_02_21_000400_create_staff_roles_table', 1),
(45, 'Admin', '2020_02_22_000300_remove_add_columns_on_staff_staff_groups_table', 1),
(46, 'Admin', '2020_02_25_000300_create_assignable_logs_table', 1),
(47, 'Admin', '2020_03_18_000300_add_quantity_column_to_order_menu_options_table', 1),
(48, 'Admin', '2020_04_05_000300_create_payment_profiles_table', 1),
(49, 'Admin', '2020_04_16_000300_drop_stale_unused_columns', 1),
(50, 'Admin', '2020_05_31_000300_drop_more_unused_columns', 1),
(51, 'Admin', '2020_06_11_000300_create_menu_mealtimes_table', 1),
(52, 'Admin', '2020_08_16_000300_modify_columns_on_tables_reservations_table', 1),
(53, 'Admin', '2020_08_18_000300_create_allergens_table', 1),
(54, 'Admin', '2020_09_28_000300_add_refund_columns_to_payment_logs_table', 1),
(55, 'Admin', '2020_12_13_000300_merge_staffs_locations_into_locationables_table', 1),
(56, 'Admin', '2020_12_22_000300_add_priority_column_to_location_areas_table', 1),
(57, 'Admin', '2021_01_04_000300_add_update_related_column_to_menu_options_table', 1),
(58, 'Admin', '2021_01_04_010000_add_order_time_is_asap_on_orders_table', 1),
(59, 'Admin', '2021_04_23_010000_remove_unused_columns', 1),
(60, 'Admin', '2021_05_26_010000_alter_order_type_columns', 1),
(61, 'Admin', '2021_05_29_010000_add_is_summable_on_order_totals_table', 1),
(62, 'Admin', '2021_07_20_010000_add_columns_default_value', 1),
(63, 'Admin', '2021_09_03_010000_make_serialize_columns_json', 1),
(64, 'Admin', '2021_09_06_010000_add_timestamps_to_tables', 1),
(65, 'Admin', '2021_10_22_010000_make_primary_key_bigint_all_tables', 1),
(66, 'Admin', '2021_10_25_010000_add_foreign_key_constraints_to_tables', 1),
(67, 'Admin', '2021_11_28_000300_create_stocks_table', 1),
(68, 'Admin', '2022_02_07_010000_add_low_stock_alerted_on_stocks_table', 1),
(69, 'Admin', '2022_04_27_000300_create_location_options_table', 1),
(70, 'Admin', '2022_05_10_000300_add_primary_key_to_working_hours_table', 1),
(71, 'Admin', '2022_06_30_010000_drop_foreign_key_constraints_on_all_tables', 1),
(72, 'Admin', '2022_09_03_000300_make_location_options_fields_unique', 1),
(73, 'igniter.cart', '2017_10_20_000100_create_conditions_settings', 1),
(74, 'igniter.cart', '2017_11_20_010000_create_cart_table', 1),
(75, 'igniter.cart', '2018_09_20_010000_rename_content_field_on_cart_table', 1),
(76, 'igniter.local', '2020_09_17_000300_create_reviews_table_or_rename', 1),
(77, 'igniter.local', '2020_12_10_000300_update_reviews_table', 1),
(78, 'igniter.local', '2021_01_02_000300_add_last_location_area_customers_table', 1),
(79, 'igniter.local', '2021_09_06_010000_add_timestamps_to_reviews', 1),
(80, 'igniter.local', '2021_11_18_010000_make_primary_key_bigint_all_tables', 1),
(81, 'igniter.payregister', '2021_05_08_000300_seed_default_payment_gateways', 1),
(82, 'igniter.frontend', '2018_01_28_000300_create_subscribers_table', 1),
(83, 'igniter.frontend', '2018_06_28_000300_create_banners_table', 1),
(84, 'igniter.frontend', '2019_11_02_000300_create_sliders_table', 1),
(85, 'igniter.frontend', '2021_10_20_000300_rename_banners_table', 1),
(86, 'igniter.frontend', '2021_11_18_010000_make_primary_key_bigint_all_tables', 1),
(87, 'igniter.frontend', '2021_11_18_010300_add_foreign_key_constraints_to_tables', 1),
(88, 'igniter.frontend', '2022_06_30_010000_drop_foreign_key_constraints', 1),
(89, 'igniterlabs.smsnotify', '2019_06_30_000300_create_smsnotify_tables', 1),
(90, 'igniterlabs.smsnotify', '2021_11_30_010000_make_primary_key_bigint_all_tables', 1),
(91, 'igniter.coupons', '2020_09_17_000300_create_coupons_table_or_rename', 1),
(92, 'igniter.coupons', '2020_09_18_000300_create_coupon_relations_tables', 1),
(93, 'igniter.coupons', '2020_10_15_000300_create_cart_restriction', 1),
(94, 'igniter.coupons', '2020_11_01_000300_add_auto_apply_field_on_coupons_table', 1),
(95, 'igniter.coupons', '2021_02_22_000300_increase_coupon_code_character_limit', 1),
(96, 'igniter.coupons', '2021_05_26_010000_alter_order_restriction_column', 1),
(97, 'igniter.coupons', '2021_09_06_010000_add_timestamps_to_coupons', 1),
(98, 'igniter.coupons', '2021_11_18_010000_make_primary_key_bigint_all_tables', 1),
(99, 'igniter.coupons', '2021_11_18_010300_add_foreign_key_constraints_to_tables', 1),
(100, 'igniter.coupons', '2022_06_30_010000_drop_foreign_key_constraints', 1),
(101, 'SussexCoder.Poll', '2020_12_14_211221_create_vote__models_table', 1),
(102, 'thoughtco.reports', '2021_06_02_setup_report_tables', 1),
(103, 'igniter.automation', '2018_10_01_000100_create_all_tables', 1),
(104, 'igniter.automation', '2020_11_08_000300_create_task_log_table', 1),
(105, 'igniter.automation', '2021_11_18_010000_make_primary_key_bigint_all_tables', 1),
(106, 'igniter.automation', '2021_11_18_010300_add_foreign_key_constraints_to_tables', 1),
(107, 'igniter.automation', '2022_06_30_010000_drop_foreign_key_constraints', 1),
(108, 'igniter.pages', '2018_06_28_000300_create_pages_table', 1),
(109, 'igniter.pages', '2019_11_28_000300_create_menus_table', 1),
(110, 'igniter.pages', '2019_11_28_000400_alter_columns_on_pages_table', 1),
(111, 'igniter.pages', '2021_03_31_000300_seed_menus_table', 1),
(112, 'igniter.pages', '2021_09_06_010000_add_timestamps_to_pages', 1),
(113, 'igniter.pages', '2021_10_20_010000_add_foreign_key_constraints_to_tables', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_orders`
--

CREATE TABLE `btl_orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `first_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `cart` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_items` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `order_time` time NOT NULL,
  `order_date` date NOT NULL,
  `order_total` decimal(15,4) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `assignee_group_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_prefix` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processed` tinyint(1) DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  `assignee_updated_at` datetime DEFAULT NULL,
  `order_time_is_asap` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_order_menus`
--

CREATE TABLE `btl_order_menus` (
  `order_menu_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(15,4) DEFAULT NULL,
  `subtotal` decimal(15,4) DEFAULT NULL,
  `option_values` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_order_menu_options`
--

CREATE TABLE `btl_order_menu_options` (
  `order_option_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `order_option_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_option_price` decimal(15,4) DEFAULT NULL,
  `order_menu_id` int(11) NOT NULL,
  `order_menu_option_id` int(11) NOT NULL,
  `menu_option_value_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_order_totals`
--

CREATE TABLE `btl_order_totals` (
  `order_total_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(15,4) NOT NULL,
  `priority` tinyint(1) NOT NULL DEFAULT 0,
  `is_summable` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_pages`
--

CREATE TABLE `btl_pages` (
  `page_id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `permalink_slug` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_pages`
--

INSERT INTO `btl_pages` (`page_id`, `language_id`, `title`, `content`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`, `status`, `permalink_slug`, `layout`, `metadata`, `priority`) VALUES
(1, 1, 'About Us', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '', '', '2022-10-26 16:48:59', '2022-10-26 16:48:59', 1, 'about-us', 'static', '{\"navigation\":\"0\"}', NULL),
(2, 1, 'Policy', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '', '', '2022-10-26 16:48:59', '2022-10-26 16:48:59', 1, 'policy', 'static', '{\"navigation\":\"0\"}', NULL),
(3, 1, 'Terms and Conditions', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '', '', '2022-10-26 16:48:59', '2022-10-26 16:48:59', 1, 'terms-and-conditions', 'static', '{\"navigation\":\"0\"}', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_payments`
--

CREATE TABLE `btl_payments` (
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json)',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_payments`
--

INSERT INTO `btl_payments` (`payment_id`, `name`, `code`, `class_name`, `description`, `data`, `status`, `is_default`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'Cash On Delivery', 'cod', 'Igniter\\PayRegister\\Payments\\Cod', 'Accept cash on delivery during checkout', NULL, 1, 1, 1, '2022-10-26 16:44:07', '2022-10-26 16:44:07'),
(2, 'PayPal Express', 'paypalexpress', 'Igniter\\PayRegister\\Payments\\PaypalExpress', 'Allows your customers to make payment using PayPal', NULL, 0, 0, 2, '2022-10-26 16:44:07', '2022-10-26 16:44:07'),
(3, 'Authorize.Net (AIM)', 'authorizenetaim', 'Igniter\\PayRegister\\Payments\\AuthorizeNetAim', 'Accept credit card payments though Authorize.Net', NULL, 0, 0, 3, '2022-10-26 16:44:07', '2022-10-26 16:44:07'),
(4, 'Stripe Payment', 'stripe', 'Igniter\\PayRegister\\Payments\\Stripe', 'Accept credit card payments using Stripe', NULL, 0, 0, 4, '2022-10-26 16:44:07', '2022-10-26 16:44:07'),
(5, 'Mollie Payment', 'mollie', 'Igniter\\PayRegister\\Payments\\Mollie', 'Accept credit card payments using Mollie API', NULL, 0, 0, 5, '2022-10-26 16:44:07', '2022-10-26 16:44:07'),
(6, 'Square Payment', 'square', 'Igniter\\PayRegister\\Payments\\Square', 'Accept credit card payments using Square', NULL, 0, 0, 6, '2022-10-26 16:44:07', '2022-10-26 16:44:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_payment_logs`
--

CREATE TABLE `btl_payment_logs` (
  `payment_log_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_success` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `payment_code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_refundable` tinyint(1) NOT NULL DEFAULT 0,
  `refunded_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_payment_profiles`
--

CREATE TABLE `btl_payment_profiles` (
  `payment_profile_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `card_brand` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last4` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_request_logs`
--

CREATE TABLE `btl_request_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_code` int(11) DEFAULT NULL,
  `referrer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_request_logs`
--

INSERT INTO `btl_request_logs` (`id`, `url`, `status_code`, `referrer`, `count`, `created_at`, `updated_at`) VALUES
(1, 'http://localhost/testigniter/login', 404, NULL, 1, '2022-10-26 21:38:33', '2022-10-26 21:38:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_reservations`
--

CREATE TABLE `btl_reservations` (
  `reservation_id` bigint(20) UNSIGNED NOT NULL,
  `location_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `guest_num` int(11) NOT NULL,
  `occasion_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `first_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reserve_time` time NOT NULL,
  `reserve_date` date NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `assignee_group_id` int(10) UNSIGNED DEFAULT NULL,
  `notify` tinyint(1) DEFAULT NULL,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` tinyint(1) NOT NULL,
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `processed` tinyint(1) DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  `assignee_updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_reservation_tables`
--

CREATE TABLE `btl_reservation_tables` (
  `reservation_id` int(10) UNSIGNED NOT NULL,
  `table_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_sessions`
--

CREATE TABLE `btl_sessions` (
  `id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_activity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_settings`
--

CREATE TABLE `btl_settings` (
  `setting_id` bigint(20) UNSIGNED NOT NULL,
  `sort` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serialized` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_settings`
--

INSERT INTO `btl_settings` (`setting_id`, `sort`, `item`, `value`, `serialized`) VALUES
(1, 'prefs', 'default_location_id', '1', NULL),
(2, 'config', 'site_logo', '/bet-el cake.png', NULL),
(3, 'config', 'country_id', '222', NULL),
(4, 'config', 'timezone', 'Europe/London', NULL),
(5, 'config', 'default_currency_code', 'GBP', NULL),
(6, 'config', 'default_language', 'en', NULL),
(7, 'config', 'detect_language', '0', NULL),
(9, 'config', 'allow_registration', '1', NULL),
(10, 'config', 'customer_group_id', '11', NULL),
(14, 'config', 'maps_api_key', '', NULL),
(15, 'config', 'distance_unit', 'mi', NULL),
(16, 'config', 'location_order', '0', NULL),
(17, 'config', 'location_order_email', '0', NULL),
(18, 'config', 'location_reserve_email', '0', NULL),
(19, 'config', 'default_order_status', '1', NULL),
(22, 'config', 'menus_page', 'account\\reset', NULL),
(23, 'config', 'reservation_page', 'account\\reset', NULL),
(24, 'config', 'guest_order', '1', NULL),
(25, 'config', 'default_reservation_status', '8', NULL),
(26, 'config', 'confirmed_reservation_status', '6', NULL),
(27, 'config', 'canceled_order_status', '9', NULL),
(28, 'config', 'canceled_reservation_status', '7', NULL),
(30, 'config', 'tax_mode', '0', NULL),
(31, 'config', 'invoice_prefix', 'INV-{year}-00', NULL),
(32, 'config', 'protocol', 'log', NULL),
(33, 'config', 'smtp_host', 'smtp.mailgun.org', NULL),
(34, 'config', 'smtp_port', '587', NULL),
(35, 'config', 'smtp_user', '', NULL),
(36, 'config', 'smtp_pass', '', NULL),
(37, 'config', 'log_threshold', '1', NULL),
(38, 'config', 'permalink', '1', NULL),
(39, 'config', 'maintenance_mode', '0', NULL),
(40, 'config', 'maintenance_message', 'Site is under maintenance. Please check back later.', NULL),
(41, 'config', 'cache_mode', '0', NULL),
(42, 'config', 'cache_time', '0', NULL),
(44, 'prefs', 'ti_setup', 'installed', NULL),
(45, 'prefs', 'ti_version', 'v3.5.5', NULL),
(46, 'prefs', 'sys_hash', 'fa8e6939a54fc58e957d2927dfe00c3f9fd5c596', NULL),
(47, 'prefs', 'site_key', '578539a2ab00394e09be86ef9c81b621b3e55629', NULL),
(48, 'config', 'supported_languages.0', 'en', NULL),
(49, 'config', 'registration_email.0', 'customer', NULL),
(50, 'config', 'order_email.0', 'customer', NULL),
(51, 'config', 'order_email.1', 'admin', NULL),
(52, 'config', 'reservation_email.0', 'customer', NULL),
(53, 'config', 'reservation_email.1', 'admin', NULL),
(54, 'config', 'processing_order_status.0', '2', NULL),
(55, 'config', 'processing_order_status.1', '3', NULL),
(56, 'config', 'processing_order_status.2', '4', NULL),
(57, 'config', 'completed_order_status.0', '5', NULL),
(58, 'config', 'image_manager.max_size', '300', NULL),
(59, 'config', 'image_manager.thumb_width', '320', NULL),
(60, 'config', 'image_manager.thumb_height', '220', NULL),
(61, 'config', 'image_manager.uploads', '1', NULL),
(62, 'config', 'image_manager.new_folder', '1', NULL),
(63, 'config', 'image_manager.copy', '1', NULL),
(64, 'config', 'image_manager.move', '1', NULL),
(65, 'config', 'image_manager.rename', '1', NULL),
(66, 'config', 'image_manager.delete', '1', NULL),
(67, 'config', 'image_manager.transliteration', '0', NULL),
(68, 'config', 'image_manager.remember_days', '7', NULL),
(69, 'config', 'demo_data', '0', NULL),
(70, 'config', 'site_name', 'Bet-el Cakes', NULL),
(71, 'config', 'site_email', 'admin@restaurant.com', NULL),
(72, 'config', 'staff_name', 'Chef Sam', NULL),
(73, 'config', 'username', 'admin_vamato', NULL),
(74, 'config', 'password', '{V@n3ss@1995}', NULL),
(75, 'config', 'sender_name', 'Bet-el Cakes', NULL),
(76, 'config', 'sender_email', 'vamato1807@gmail.com', NULL),
(78, 'config', 'installed_themes.demo', '1', NULL),
(79, 'config', 'installed_themes.tastyigniter-orange', '1', NULL),
(80, 'config', 'installed_themes.tastyigniter-red', '1', NULL),
(81, 'config', 'installed_themes.tastyigniter-orange-yhp', '1', NULL),
(82, 'config', 'mail_logo', '/bet-el cake.png', NULL),
(83, 'config', 'sendmail_path', '/usr/sbin/sendmail -bs', NULL),
(84, 'config', 'smtp_encryption', 'tls', NULL),
(85, 'config', 'mailgun_domain', '', NULL),
(86, 'config', 'mailgun_secret', '', NULL),
(87, 'config', 'postmark_token', '', NULL),
(88, 'config', 'ses_key', '', NULL),
(89, 'config', 'ses_secret', '', NULL),
(90, 'config', 'ses_region', '', NULL),
(91, 'prefs', 'carte_key', '7b2e3e5353fc481403184b685871877371fcf0da', NULL),
(92, 'prefs', 'carte_info.id', '4849', NULL),
(93, 'prefs', 'carte_info.owner', 'esneider buelvas', NULL),
(94, 'prefs', 'carte_info.name', 'bet-el-cakes', NULL),
(95, 'prefs', 'carte_info.url', 'http://localhost/testigniter/', NULL),
(97, 'prefs', 'carte_info.is_premium', '0', NULL),
(98, 'prefs', 'carte_info.items_count', '0', NULL),
(99, 'prefs', 'carte_info.updated_at', '2022-10-26T15:18:40.000000Z', NULL),
(100, 'prefs', 'carte_info.created_at', '2022-10-26T14:15:09.000000Z', NULL),
(105, 'prefs', 'default_themes.main', 'tastyigniter-orange', NULL),
(106, 'config', 'default_geocoder', 'chain', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_staffs`
--

CREATE TABLE `btl_staffs` (
  `staff_id` bigint(20) UNSIGNED NOT NULL,
  `staff_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_role_id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `created_at` date NOT NULL,
  `staff_status` tinyint(1) NOT NULL,
  `sale_permission` tinyint(4) DEFAULT 1,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_staffs`
--

INSERT INTO `btl_staffs` (`staff_id`, `staff_name`, `staff_email`, `staff_role_id`, `language_id`, `created_at`, `staff_status`, `sale_permission`, `updated_at`) VALUES
(1, 'Chef Sam', 'admin@restaurant.com', 1, 1, '2022-10-26', 1, 1, '2022-10-26 20:20:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_staffs_groups`
--

CREATE TABLE `btl_staffs_groups` (
  `staff_id` int(10) UNSIGNED NOT NULL,
  `staff_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_staffs_groups`
--

INSERT INTO `btl_staffs_groups` (`staff_id`, `staff_group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_staff_groups`
--

CREATE TABLE `btl_staff_groups` (
  `staff_group_id` bigint(20) UNSIGNED NOT NULL,
  `staff_group_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_assign` tinyint(1) DEFAULT 0,
  `auto_assign_mode` tinyint(4) DEFAULT 1,
  `auto_assign_limit` int(11) DEFAULT 20,
  `auto_assign_availability` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_staff_groups`
--

INSERT INTO `btl_staff_groups` (`staff_group_id`, `staff_group_name`, `description`, `auto_assign`, `auto_assign_mode`, `auto_assign_limit`, `auto_assign_availability`, `created_at`, `updated_at`) VALUES
(1, 'Owners', 'Default group for owners', 0, 1, 20, 1, '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(2, 'Managers', 'Default group for managers', 0, 1, 20, 1, '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(3, 'Waiters', 'Default group for waiters.', 0, 1, 20, 1, '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(4, 'Delivery', 'Default group for delivery drivers.', 0, 1, 20, 1, '2022-10-26 20:20:37', '2022-10-26 20:20:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_staff_roles`
--

CREATE TABLE `btl_staff_roles` (
  `staff_role_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_staff_roles`
--

INSERT INTO `btl_staff_roles` (`staff_role_id`, `name`, `code`, `description`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Owner', 'owner', 'Default role for restaurant owners', NULL, '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(2, 'Manager', 'manager', 'Default role for restaurant managers.', 'a:16:{s:15:\"Admin.Dashboard\";s:1:\"1\";s:16:\"Admin.Categories\";s:1:\"1\";s:14:\"Admin.Statuses\";s:1:\"1\";s:12:\"Admin.Staffs\";s:1:\"1\";s:17:\"Admin.StaffGroups\";s:1:\"1\";s:15:\"Admin.Customers\";s:1:\"1\";s:20:\"Admin.CustomerGroups\";s:1:\"1\";s:14:\"Admin.Payments\";s:1:\"1\";s:18:\"Admin.Reservations\";s:1:\"1\";s:12:\"Admin.Orders\";s:1:\"1\";s:12:\"Admin.Tables\";s:1:\"1\";s:15:\"Admin.Locations\";s:1:\"1\";s:15:\"Admin.Mealtimes\";s:1:\"1\";s:11:\"Admin.Menus\";s:1:\"1\";s:11:\"Site.Themes\";s:1:\"1\";s:18:\"Admin.MediaManager\";s:1:\"1\";}', '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(3, 'Waiter', 'waiter', 'Default role for restaurant waiters.', 'a:4:{s:16:\"Admin.Categories\";s:1:\"1\";s:18:\"Admin.Reservations\";s:1:\"1\";s:12:\"Admin.Orders\";s:1:\"1\";s:11:\"Admin.Menus\";s:1:\"1\";}', '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(4, 'Delivery', 'delivery', 'Default role for restaurant delivery.', 'a:3:{s:14:\"Admin.Statuses\";s:1:\"1\";s:18:\"Admin.Reservations\";s:1:\"1\";s:12:\"Admin.Orders\";s:1:\"1\";}', '2022-10-26 20:20:37', '2022-10-26 20:20:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_statuses`
--

CREATE TABLE `btl_statuses` (
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `status_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notify_customer` tinyint(1) DEFAULT NULL,
  `status_for` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_color` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_statuses`
--

INSERT INTO `btl_statuses` (`status_id`, `status_name`, `status_comment`, `notify_customer`, `status_for`, `status_color`, `created_at`, `updated_at`) VALUES
(1, 'Received', 'Your order has been received.', 1, 'order', '#686663', '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(2, 'Pending', 'Your order is pending', 1, 'order', '#f0ad4e', '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(3, 'Preparation', 'Your order is in the kitchen', 1, 'order', '#00c0ef', '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(4, 'Delivery', 'Your order will be with you shortly.', 0, 'order', '#00a65a', '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(5, 'Completed', '', 0, 'order', '#00a65a', '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(6, 'Confirmed', 'Your table reservation has been confirmed.', 0, 'reserve', '#00a65a', '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(7, 'Canceled', 'Your table reservation has been canceled.', 0, 'reserve', '#dd4b39', '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(8, 'Pending', 'Your table reservation is pending.', 0, 'reserve', '', '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(9, 'Canceled', '', 0, 'order', '#ea0b29', '2022-10-26 20:20:37', '2022-10-26 20:20:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_status_history`
--

CREATE TABLE `btl_status_history` (
  `status_history_id` bigint(20) UNSIGNED NOT NULL,
  `object_id` int(11) NOT NULL,
  `object_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `notify` tinyint(1) DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_stocks`
--

CREATE TABLE `btl_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `stockable_id` bigint(20) UNSIGNED NOT NULL,
  `stockable_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `low_stock_alert` tinyint(1) NOT NULL DEFAULT 0,
  `low_stock_threshold` int(11) NOT NULL DEFAULT 0,
  `is_tracked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `low_stock_alert_sent` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_stock_history`
--

CREATE TABLE `btl_stock_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `state` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_sussexcoder_poll_vote__models`
--

CREATE TABLE `btl_sussexcoder_poll_vote__models` (
  `id` int(10) UNSIGNED NOT NULL,
  `poll_name` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_item_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_tables`
--

CREATE TABLE `btl_tables` (
  `table_id` bigint(20) UNSIGNED NOT NULL,
  `table_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_capacity` int(11) NOT NULL,
  `max_capacity` int(11) NOT NULL,
  `table_status` tinyint(1) NOT NULL,
  `extra_capacity` int(11) NOT NULL DEFAULT 0,
  `is_joinable` tinyint(1) NOT NULL DEFAULT 1,
  `priority` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_tables`
--

INSERT INTO `btl_tables` (`table_id`, `table_name`, `min_capacity`, `max_capacity`, `table_status`, `extra_capacity`, `is_joinable`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'Table 1', 4, 11, 1, 0, 1, 0, '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(2, 'Table 2', 3, 6, 1, 0, 1, 0, '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(3, 'Table 3', 5, 6, 1, 0, 1, 0, '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(4, 'Table 4', 5, 6, 1, 0, 1, 0, '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(5, 'Table 5', 2, 8, 1, 0, 1, 0, '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(6, 'Table 6', 5, 9, 1, 0, 1, 0, '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(7, 'Table 7', 4, 6, 1, 0, 1, 0, '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(8, 'Table 8', 4, 6, 1, 0, 1, 0, '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(9, 'Table 9', 2, 8, 1, 0, 1, 0, '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(10, 'Table 10', 2, 10, 1, 0, 1, 0, '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(11, 'Table 11', 3, 8, 1, 0, 1, 0, '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(12, 'Table 12', 5, 7, 1, 0, 1, 0, '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(13, 'Table 13', 5, 9, 1, 0, 1, 0, '2022-10-26 20:20:37', '2022-10-26 20:20:37'),
(14, 'Table 14', 4, 12, 1, 0, 1, 0, '2022-10-26 20:20:37', '2022-10-26 20:20:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_themes`
--

CREATE TABLE `btl_themes` (
  `theme_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '0.0.1',
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json)',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_themes`
--

INSERT INTO `btl_themes` (`theme_id`, `name`, `code`, `description`, `version`, `data`, `status`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Demo Theme', 'demo', 'Demonstration theme for TastyIgniter front-end', '0.1.0', NULL, 1, 0, NULL, '2022-10-26 21:49:09'),
(2, 'Orange Theme', 'tastyigniter-orange', 'Free Modern, Responsive and Clean TastyIgniter Theme based on Bootstrap.', '0.1.0', NULL, 1, 0, NULL, '2022-10-26 21:49:09'),
(3, 'TastyIgniter Red', 'tastyigniter-red', 'TastyIgniter Theme - Red', '0.0.1', NULL, 1, 0, NULL, '2022-10-26 21:49:09'),
(4, 'Orange Theme [child]', 'tastyigniter-orange-yhp', 'Free Modern, Responsive and Clean TastyIgniter Theme based on Bootstrap.', '0.0.1', '[]', 1, 0, NULL, '2022-10-26 21:49:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_thoughtco_reportbuilder`
--

CREATE TABLE `btl_thoughtco_reportbuilder` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `builderjson` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `list_columns` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `csv_columns` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_thoughtco_reportbuilder`
--

INSERT INTO `btl_thoughtco_reportbuilder` (`id`, `title`, `builderjson`, `list_columns`, `csv_columns`, `created_at`, `updated_at`) VALUES
(1, 'Orders in the last 30 days', '{\"model\":\"\\\\Admin\\\\Models\\\\Orders_model\",\"rules\":{\"condition\":\"AND\",\"rules\":[{\"id\":\"order_date_relative\",\"field\":\"order_date_relative\",\"type\":\"string\",\"input\":\"select\",\"operator\":\"greater_or_equal\",\"value\":\"30\"}],\"valid\":true}}', '[{\"priority\":0,\"column\":\"{                        \\\"key\\\": \\\"email\\\",                        \\\"contexts\\\": [\\\"\\\\Admin\\\\Models\\\\Customers_model\\\", \\\"\\\\Admin\\\\Models\\\\Orders_model\\\"]        }\",\"label\":\"Email\"},{\"priority\":1,\"column\":\"{                        \\\"key\\\": \\\"customer_name\\\",                        \\\"contexts\\\": [\\\"\\\\Admin\\\\Models\\\\Customers_model\\\", \\\"\\\\Admin\\\\Models\\\\Orders_model\\\"]        }\",\"label\":\"Name\"},{\"priority\":2,\"column\":\"{                        \\\"key\\\": \\\"order_total\\\",                        \\\"contexts\\\": [\\\"\\\\Admin\\\\Models\\\\Orders_model\\\"]        }\",\"label\":\"Order Total\"},{\"priority\":3,\"column\":\"{                        \\\"key\\\": \\\"order_date\\\",                        \\\"contexts\\\": [\\\"\\\\Admin\\\\Models\\\\Orders_model\\\"]        }\",\"label\":\"Date\"}]', '[{\"priority\":0,\"column\":\"{                        \\\"key\\\": \\\"email\\\",                        \\\"contexts\\\": [\\\"\\\\Admin\\\\Models\\\\Customers_model\\\", \\\"\\\\Admin\\\\Models\\\\Orders_model\\\"]        }\",\"label\":\"Email\"},{\"priority\":1,\"column\":\"{                        \\\"key\\\": \\\"customer_name\\\",                        \\\"contexts\\\": [\\\"\\\\Admin\\\\Models\\\\Customers_model\\\", \\\"\\\\Admin\\\\Models\\\\Orders_model\\\"]        }\",\"label\":\"Name\"},{\"priority\":2,\"column\":\"{                        \\\"key\\\": \\\"order_total\\\",                        \\\"contexts\\\": [\\\"\\\\Admin\\\\Models\\\\Orders_model\\\"]        }\",\"label\":\"Order Total\"},{\"priority\":3,\"column\":\"{                        \\\"key\\\": \\\"order_date\\\",                        \\\"contexts\\\": [\\\"\\\\Admin\\\\Models\\\\Orders_model\\\"]        }\",\"label\":\"Date\"}]', NULL, NULL),
(2, 'Customers who registered in the last 90 days', '{\"model\":\"\\\\Admin\\\\Models\\\\Customers_model\",\"rules\":{\"condition\":\"AND\",\"rules\":[{\"id\":\"date_added_relative\",\"field\":\"date_added_relative\",\"type\":\"string\",\"input\":\"select\",\"operator\":\"greater_or_equal\",\"value\":\"90\"}],\"valid\":true}}', '[{\"priority\":0,\"column\":\"{                        \\\"key\\\": \\\"customer_name\\\",                        \\\"contexts\\\": [\\\"\\\\Admin\\\\Models\\\\Customers_model\\\", \\\"\\\\Admin\\\\Models\\\\Orders_model\\\"]        }\",\"label\":\"Name\"},{\"priority\":1,\"column\":\"{                        \\\"key\\\": \\\"email\\\",                        \\\"contexts\\\": [\\\"\\\\Admin\\\\Models\\\\Customers_model\\\", \\\"\\\\Admin\\\\Models\\\\Orders_model\\\"]        }\",\"label\":\"Email\"},{\"priority\":2,\"column\":\"{                        \\\"key\\\": \\\"customer_address\\\",                        \\\"contexts\\\": [\\\"\\\\Admin\\\\Models\\\\Customers_model\\\"]        }\",\"label\":\"Address\"}]', '[{\"priority\":0,\"column\":\"{                        \\\"key\\\": \\\"customer_name\\\",                        \\\"contexts\\\": [\\\"\\\\Admin\\\\Models\\\\Customers_model\\\", \\\"\\\\Admin\\\\Models\\\\Orders_model\\\"]        }\",\"label\":\"Name\"},{\"priority\":1,\"column\":\"{                        \\\"key\\\": \\\"email\\\",                        \\\"contexts\\\": [\\\"\\\\Admin\\\\Models\\\\Customers_model\\\", \\\"\\\\Admin\\\\Models\\\\Orders_model\\\"]        }\",\"label\":\"Email\"},{\"priority\":2,\"column\":\"{                        \\\"key\\\": \\\"customer_address\\\",                        \\\"contexts\\\": [\\\"\\\\Admin\\\\Models\\\\Customers_model\\\"]        }\",\"label\":\"Address\"}]', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_users`
--

CREATE TABLE `btl_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` int(11) NOT NULL,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `super_user` tinyint(1) DEFAULT NULL,
  `reset_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_time` datetime DEFAULT NULL,
  `activation_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_activated` tinyint(1) DEFAULT NULL,
  `date_activated` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_users`
--

INSERT INTO `btl_users` (`user_id`, `staff_id`, `username`, `password`, `super_user`, `reset_code`, `reset_time`, `activation_code`, `remember_token`, `is_activated`, `date_activated`, `last_login`, `last_seen`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin_vamato', '$2y$10$4uKyLEE5JhvjfGN8iQ7pUefVdtGIf4ujsMPQGXPf5ZHdXxpSSWC.e', 1, NULL, NULL, NULL, 'Y0vQRwGuw0x1UK7cf73bFOqcPtPfS938KTK4hqQ2k0', 1, '2022-10-26 15:20:37', '2022-10-26 16:38:50', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_user_preferences`
--

CREATE TABLE `btl_user_preferences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `btl_working_hours`
--

CREATE TABLE `btl_working_hours` (
  `location_id` int(11) NOT NULL,
  `weekday` int(11) NOT NULL,
  `opening_time` time NOT NULL DEFAULT '00:00:00',
  `closing_time` time NOT NULL DEFAULT '00:00:00',
  `status` tinyint(1) NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `btl_working_hours`
--

INSERT INTO `btl_working_hours` (`location_id`, `weekday`, `opening_time`, `closing_time`, `status`, `type`, `id`) VALUES
(1, 0, '00:00:00', '23:59:00', 1, 'opening', 1),
(1, 1, '00:00:00', '23:59:00', 1, 'opening', 2),
(1, 2, '00:00:00', '23:59:00', 1, 'opening', 3),
(1, 3, '00:00:00', '23:59:00', 1, 'opening', 4),
(1, 4, '00:00:00', '23:59:00', 1, 'opening', 5),
(1, 5, '00:00:00', '23:59:00', 1, 'opening', 6),
(1, 6, '00:00:00', '23:59:00', 1, 'opening', 7),
(1, 0, '00:00:00', '23:59:00', 1, 'delivery', 8),
(1, 1, '00:00:00', '23:59:00', 1, 'delivery', 9),
(1, 2, '00:00:00', '23:59:00', 1, 'delivery', 10),
(1, 3, '00:00:00', '23:59:00', 1, 'delivery', 11),
(1, 4, '00:00:00', '23:59:00', 1, 'delivery', 12),
(1, 5, '00:00:00', '23:59:00', 1, 'delivery', 13),
(1, 6, '00:00:00', '23:59:00', 1, 'delivery', 14),
(1, 0, '00:00:00', '23:59:00', 1, 'collection', 15),
(1, 1, '00:00:00', '23:59:00', 1, 'collection', 16),
(1, 2, '00:00:00', '23:59:00', 1, 'collection', 17),
(1, 3, '00:00:00', '23:59:00', 1, 'collection', 18),
(1, 4, '00:00:00', '23:59:00', 1, 'collection', 19),
(1, 5, '00:00:00', '23:59:00', 1, 'collection', 20),
(1, 6, '00:00:00', '23:59:00', 1, 'collection', 21);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `btl_activities`
--
ALTER TABLE `btl_activities`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indices de la tabla `btl_addresses`
--
ALTER TABLE `btl_addresses`
  ADD PRIMARY KEY (`address_id`);

--
-- Indices de la tabla `btl_allergenables`
--
ALTER TABLE `btl_allergenables`
  ADD UNIQUE KEY `allergenable_unique` (`allergen_id`,`allergenable_id`,`allergenable_type`),
  ADD KEY `allergenable_index` (`allergenable_type`,`allergenable_id`),
  ADD KEY `btl_allergenables_allergen_id_index` (`allergen_id`);

--
-- Indices de la tabla `btl_allergens`
--
ALTER TABLE `btl_allergens`
  ADD PRIMARY KEY (`allergen_id`);

--
-- Indices de la tabla `btl_assignable_logs`
--
ALTER TABLE `btl_assignable_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `btl_assignable_logs_assignable_type_assignable_id_index` (`assignable_type`,`assignable_id`);

--
-- Indices de la tabla `btl_cache`
--
ALTER TABLE `btl_cache`
  ADD UNIQUE KEY `btl_cache_key_unique` (`key`);

--
-- Indices de la tabla `btl_categories`
--
ALTER TABLE `btl_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indices de la tabla `btl_countries`
--
ALTER TABLE `btl_countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indices de la tabla `btl_currencies`
--
ALTER TABLE `btl_currencies`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indices de la tabla `btl_customers`
--
ALTER TABLE `btl_customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `btl_customers_email_unique` (`email`);

--
-- Indices de la tabla `btl_customer_groups`
--
ALTER TABLE `btl_customer_groups`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Indices de la tabla `btl_extensions`
--
ALTER TABLE `btl_extensions`
  ADD PRIMARY KEY (`extension_id`),
  ADD UNIQUE KEY `btl_extensions_name_unique` (`name`);

--
-- Indices de la tabla `btl_extension_settings`
--
ALTER TABLE `btl_extension_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `btl_extension_settings_item_unique` (`item`);

--
-- Indices de la tabla `btl_failed_jobs`
--
ALTER TABLE `btl_failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `btl_failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `btl_igniterlabs_smsnotify_channels`
--
ALTER TABLE `btl_igniterlabs_smsnotify_channels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `btl_igniterlabs_smsnotify_channels_code_unique` (`code`),
  ADD KEY `btl_igniterlabs_smsnotify_channels_class_name_index` (`class_name`);

--
-- Indices de la tabla `btl_igniterlabs_smsnotify_logs`
--
ALTER TABLE `btl_igniterlabs_smsnotify_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `btl_igniterlabs_smsnotify_templates`
--
ALTER TABLE `btl_igniterlabs_smsnotify_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `btl_igniterlabs_smsnotify_templates_code_unique` (`code`);

--
-- Indices de la tabla `btl_igniter_automation_logs`
--
ALTER TABLE `btl_igniter_automation_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `btl_igniter_automation_logs_automation_rule_id_foreign` (`automation_rule_id`),
  ADD KEY `btl_igniter_automation_logs_rule_action_id_foreign` (`rule_action_id`);

--
-- Indices de la tabla `btl_igniter_automation_rules`
--
ALTER TABLE `btl_igniter_automation_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `btl_igniter_automation_rule_actions`
--
ALTER TABLE `btl_igniter_automation_rule_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `btl_igniter_actions_automation_rule_id_foreign` (`automation_rule_id`);

--
-- Indices de la tabla `btl_igniter_automation_rule_conditions`
--
ALTER TABLE `btl_igniter_automation_rule_conditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `btl_igniter_conditions_automation_rule_id_foreign` (`automation_rule_id`);

--
-- Indices de la tabla `btl_igniter_cart_cart`
--
ALTER TABLE `btl_igniter_cart_cart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indices de la tabla `btl_igniter_coupons`
--
ALTER TABLE `btl_igniter_coupons`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `btl_igniter_coupons_code_unique` (`code`);

--
-- Indices de la tabla `btl_igniter_coupons_history`
--
ALTER TABLE `btl_igniter_coupons_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Indices de la tabla `btl_igniter_coupon_categories`
--
ALTER TABLE `btl_igniter_coupon_categories`
  ADD UNIQUE KEY `btl_igniter_coupon_categories_coupon_id_category_id_unique` (`coupon_id`,`category_id`),
  ADD KEY `btl_igniter_coupon_categories_coupon_id_index` (`coupon_id`),
  ADD KEY `btl_igniter_coupon_categories_category_id_index` (`category_id`);

--
-- Indices de la tabla `btl_igniter_coupon_menus`
--
ALTER TABLE `btl_igniter_coupon_menus`
  ADD UNIQUE KEY `btl_igniter_coupon_menus_coupon_id_menu_id_unique` (`coupon_id`,`menu_id`),
  ADD KEY `btl_igniter_coupon_menus_coupon_id_index` (`coupon_id`),
  ADD KEY `btl_igniter_coupon_menus_menu_id_index` (`menu_id`);

--
-- Indices de la tabla `btl_igniter_frontend_banners`
--
ALTER TABLE `btl_igniter_frontend_banners`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indices de la tabla `btl_igniter_frontend_sliders`
--
ALTER TABLE `btl_igniter_frontend_sliders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `btl_igniter_frontend_sliders_code_unique` (`code`);

--
-- Indices de la tabla `btl_igniter_frontend_subscribers`
--
ALTER TABLE `btl_igniter_frontend_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `btl_igniter_pages_menus`
--
ALTER TABLE `btl_igniter_pages_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `btl_igniter_pages_menus_theme_code_index` (`theme_code`);

--
-- Indices de la tabla `btl_igniter_pages_menu_items`
--
ALTER TABLE `btl_igniter_pages_menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `btl_igniter_pages_menu_items_menu_id_index` (`menu_id`),
  ADD KEY `btl_igniter_pages_menu_items_parent_id_index` (`parent_id`);

--
-- Indices de la tabla `btl_igniter_reviews`
--
ALTER TABLE `btl_igniter_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `btl_igniter_reviews_review_id_sale_type_sale_id_index` (`review_id`,`sale_type`,`sale_id`);

--
-- Indices de la tabla `btl_jobs`
--
ALTER TABLE `btl_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `btl_jobs_queue_index` (`queue`);

--
-- Indices de la tabla `btl_job_batches`
--
ALTER TABLE `btl_job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `btl_languages`
--
ALTER TABLE `btl_languages`
  ADD PRIMARY KEY (`language_id`);

--
-- Indices de la tabla `btl_language_translations`
--
ALTER TABLE `btl_language_translations`
  ADD PRIMARY KEY (`translation_id`),
  ADD UNIQUE KEY `btl_language_translations_locale_namespace_group_item_unique` (`locale`,`namespace`,`group`,`item`),
  ADD KEY `btl_language_translations_group_index` (`group`);

--
-- Indices de la tabla `btl_locations`
--
ALTER TABLE `btl_locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indices de la tabla `btl_location_areas`
--
ALTER TABLE `btl_location_areas`
  ADD PRIMARY KEY (`area_id`);

--
-- Indices de la tabla `btl_location_options`
--
ALTER TABLE `btl_location_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `btl_location_options_location_id_item_unique` (`location_id`,`item`);

--
-- Indices de la tabla `btl_mail_layouts`
--
ALTER TABLE `btl_mail_layouts`
  ADD PRIMARY KEY (`layout_id`);

--
-- Indices de la tabla `btl_mail_partials`
--
ALTER TABLE `btl_mail_partials`
  ADD PRIMARY KEY (`partial_id`);

--
-- Indices de la tabla `btl_mail_templates`
--
ALTER TABLE `btl_mail_templates`
  ADD PRIMARY KEY (`template_id`),
  ADD UNIQUE KEY `btl_mail_templates_data_template_id_code_unique` (`layout_id`,`code`);

--
-- Indices de la tabla `btl_mealtimes`
--
ALTER TABLE `btl_mealtimes`
  ADD PRIMARY KEY (`mealtime_id`);

--
-- Indices de la tabla `btl_media_attachments`
--
ALTER TABLE `btl_media_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `btl_media_attachments_attachment_type_attachment_id_index` (`attachment_type`,`attachment_id`),
  ADD KEY `btl_media_attachments_tag_index` (`tag`);

--
-- Indices de la tabla `btl_menus`
--
ALTER TABLE `btl_menus`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indices de la tabla `btl_menus_specials`
--
ALTER TABLE `btl_menus_specials`
  ADD PRIMARY KEY (`special_id`),
  ADD UNIQUE KEY `btl_menus_specials_special_id_menu_id_unique` (`special_id`,`menu_id`);

--
-- Indices de la tabla `btl_menu_categories`
--
ALTER TABLE `btl_menu_categories`
  ADD UNIQUE KEY `btl_menu_categories_menu_id_category_id_unique` (`menu_id`,`category_id`),
  ADD KEY `btl_menu_categories_menu_id_index` (`menu_id`),
  ADD KEY `btl_menu_categories_category_id_index` (`category_id`);

--
-- Indices de la tabla `btl_menu_item_options`
--
ALTER TABLE `btl_menu_item_options`
  ADD PRIMARY KEY (`menu_option_id`);

--
-- Indices de la tabla `btl_menu_item_option_values`
--
ALTER TABLE `btl_menu_item_option_values`
  ADD PRIMARY KEY (`menu_option_value_id`);

--
-- Indices de la tabla `btl_menu_mealtimes`
--
ALTER TABLE `btl_menu_mealtimes`
  ADD UNIQUE KEY `btl_menu_mealtimes_menu_id_mealtime_id_unique` (`menu_id`,`mealtime_id`),
  ADD KEY `btl_menu_mealtimes_menu_id_index` (`menu_id`),
  ADD KEY `btl_menu_mealtimes_mealtime_id_index` (`mealtime_id`);

--
-- Indices de la tabla `btl_menu_options`
--
ALTER TABLE `btl_menu_options`
  ADD PRIMARY KEY (`option_id`);

--
-- Indices de la tabla `btl_menu_option_values`
--
ALTER TABLE `btl_menu_option_values`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Indices de la tabla `btl_migrations`
--
ALTER TABLE `btl_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `btl_orders`
--
ALTER TABLE `btl_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `btl_orders_hash_index` (`hash`);

--
-- Indices de la tabla `btl_order_menus`
--
ALTER TABLE `btl_order_menus`
  ADD PRIMARY KEY (`order_menu_id`);

--
-- Indices de la tabla `btl_order_menu_options`
--
ALTER TABLE `btl_order_menu_options`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Indices de la tabla `btl_order_totals`
--
ALTER TABLE `btl_order_totals`
  ADD PRIMARY KEY (`order_total_id`);

--
-- Indices de la tabla `btl_pages`
--
ALTER TABLE `btl_pages`
  ADD PRIMARY KEY (`page_id`),
  ADD KEY `btl_pages_language_id_foreign` (`language_id`);

--
-- Indices de la tabla `btl_payments`
--
ALTER TABLE `btl_payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `btl_payments_code_unique` (`code`);

--
-- Indices de la tabla `btl_payment_logs`
--
ALTER TABLE `btl_payment_logs`
  ADD PRIMARY KEY (`payment_log_id`);

--
-- Indices de la tabla `btl_payment_profiles`
--
ALTER TABLE `btl_payment_profiles`
  ADD PRIMARY KEY (`payment_profile_id`),
  ADD KEY `btl_payment_profiles_customer_id_index` (`customer_id`),
  ADD KEY `btl_payment_profiles_payment_id_index` (`payment_id`);

--
-- Indices de la tabla `btl_request_logs`
--
ALTER TABLE `btl_request_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `btl_reservations`
--
ALTER TABLE `btl_reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `btl_reservations_location_id_table_id_index` (`location_id`,`table_id`),
  ADD KEY `btl_reservations_hash_index` (`hash`);

--
-- Indices de la tabla `btl_reservation_tables`
--
ALTER TABLE `btl_reservation_tables`
  ADD UNIQUE KEY `btl_reservation_tables_reservation_id_table_id_unique` (`reservation_id`,`table_id`),
  ADD KEY `btl_reservation_tables_reservation_id_index` (`reservation_id`),
  ADD KEY `btl_reservation_tables_table_id_index` (`table_id`);

--
-- Indices de la tabla `btl_sessions`
--
ALTER TABLE `btl_sessions`
  ADD UNIQUE KEY `btl_sessions_id_unique` (`id`);

--
-- Indices de la tabla `btl_settings`
--
ALTER TABLE `btl_settings`
  ADD PRIMARY KEY (`setting_id`),
  ADD UNIQUE KEY `btl_settings_sort_item_unique` (`sort`,`item`);

--
-- Indices de la tabla `btl_staffs`
--
ALTER TABLE `btl_staffs`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `staff_email` (`staff_email`);

--
-- Indices de la tabla `btl_staffs_groups`
--
ALTER TABLE `btl_staffs_groups`
  ADD PRIMARY KEY (`staff_id`,`staff_group_id`);

--
-- Indices de la tabla `btl_staff_groups`
--
ALTER TABLE `btl_staff_groups`
  ADD PRIMARY KEY (`staff_group_id`);

--
-- Indices de la tabla `btl_staff_roles`
--
ALTER TABLE `btl_staff_roles`
  ADD PRIMARY KEY (`staff_role_id`);

--
-- Indices de la tabla `btl_statuses`
--
ALTER TABLE `btl_statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Indices de la tabla `btl_status_history`
--
ALTER TABLE `btl_status_history`
  ADD PRIMARY KEY (`status_history_id`);

--
-- Indices de la tabla `btl_stocks`
--
ALTER TABLE `btl_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `btl_stock_history`
--
ALTER TABLE `btl_stock_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `btl_stock_history_stock_id_foreign` (`stock_id`),
  ADD KEY `btl_stock_history_order_id_foreign` (`order_id`);

--
-- Indices de la tabla `btl_sussexcoder_poll_vote__models`
--
ALTER TABLE `btl_sussexcoder_poll_vote__models`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `btl_tables`
--
ALTER TABLE `btl_tables`
  ADD PRIMARY KEY (`table_id`);

--
-- Indices de la tabla `btl_themes`
--
ALTER TABLE `btl_themes`
  ADD PRIMARY KEY (`theme_id`),
  ADD UNIQUE KEY `btl_themes_code_unique` (`code`);

--
-- Indices de la tabla `btl_thoughtco_reportbuilder`
--
ALTER TABLE `btl_thoughtco_reportbuilder`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `btl_users`
--
ALTER TABLE `btl_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `btl_users_staff_id_unique` (`staff_id`),
  ADD UNIQUE KEY `btl_users_username_unique` (`username`);

--
-- Indices de la tabla `btl_user_preferences`
--
ALTER TABLE `btl_user_preferences`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `btl_working_hours`
--
ALTER TABLE `btl_working_hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `btl_working_hours_location_id_weekday_type_index` (`location_id`,`weekday`,`type`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `btl_activities`
--
ALTER TABLE `btl_activities`
  MODIFY `activity_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_addresses`
--
ALTER TABLE `btl_addresses`
  MODIFY `address_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_allergens`
--
ALTER TABLE `btl_allergens`
  MODIFY `allergen_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_assignable_logs`
--
ALTER TABLE `btl_assignable_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_categories`
--
ALTER TABLE `btl_categories`
  MODIFY `category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_countries`
--
ALTER TABLE `btl_countries`
  MODIFY `country_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT de la tabla `btl_currencies`
--
ALTER TABLE `btl_currencies`
  MODIFY `currency_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `btl_customers`
--
ALTER TABLE `btl_customers`
  MODIFY `customer_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_customer_groups`
--
ALTER TABLE `btl_customer_groups`
  MODIFY `customer_group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `btl_extensions`
--
ALTER TABLE `btl_extensions`
  MODIFY `extension_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `btl_extension_settings`
--
ALTER TABLE `btl_extension_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `btl_failed_jobs`
--
ALTER TABLE `btl_failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_igniterlabs_smsnotify_channels`
--
ALTER TABLE `btl_igniterlabs_smsnotify_channels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_igniterlabs_smsnotify_logs`
--
ALTER TABLE `btl_igniterlabs_smsnotify_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_igniterlabs_smsnotify_templates`
--
ALTER TABLE `btl_igniterlabs_smsnotify_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `btl_igniter_automation_logs`
--
ALTER TABLE `btl_igniter_automation_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_igniter_automation_rules`
--
ALTER TABLE `btl_igniter_automation_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_igniter_automation_rule_actions`
--
ALTER TABLE `btl_igniter_automation_rule_actions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_igniter_automation_rule_conditions`
--
ALTER TABLE `btl_igniter_automation_rule_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_igniter_coupons`
--
ALTER TABLE `btl_igniter_coupons`
  MODIFY `coupon_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `btl_igniter_coupons_history`
--
ALTER TABLE `btl_igniter_coupons_history`
  MODIFY `coupon_history_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_igniter_frontend_banners`
--
ALTER TABLE `btl_igniter_frontend_banners`
  MODIFY `banner_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_igniter_frontend_sliders`
--
ALTER TABLE `btl_igniter_frontend_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `btl_igniter_frontend_subscribers`
--
ALTER TABLE `btl_igniter_frontend_subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_igniter_pages_menus`
--
ALTER TABLE `btl_igniter_pages_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `btl_igniter_pages_menu_items`
--
ALTER TABLE `btl_igniter_pages_menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `btl_igniter_reviews`
--
ALTER TABLE `btl_igniter_reviews`
  MODIFY `review_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_jobs`
--
ALTER TABLE `btl_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_languages`
--
ALTER TABLE `btl_languages`
  MODIFY `language_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `btl_language_translations`
--
ALTER TABLE `btl_language_translations`
  MODIFY `translation_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_locations`
--
ALTER TABLE `btl_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `btl_location_areas`
--
ALTER TABLE `btl_location_areas`
  MODIFY `area_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_location_options`
--
ALTER TABLE `btl_location_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_mail_layouts`
--
ALTER TABLE `btl_mail_layouts`
  MODIFY `layout_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `btl_mail_partials`
--
ALTER TABLE `btl_mail_partials`
  MODIFY `partial_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `btl_mail_templates`
--
ALTER TABLE `btl_mail_templates`
  MODIFY `template_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `btl_mealtimes`
--
ALTER TABLE `btl_mealtimes`
  MODIFY `mealtime_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `btl_media_attachments`
--
ALTER TABLE `btl_media_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `btl_menus`
--
ALTER TABLE `btl_menus`
  MODIFY `menu_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_menus_specials`
--
ALTER TABLE `btl_menus_specials`
  MODIFY `special_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_menu_item_options`
--
ALTER TABLE `btl_menu_item_options`
  MODIFY `menu_option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_menu_item_option_values`
--
ALTER TABLE `btl_menu_item_option_values`
  MODIFY `menu_option_value_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_menu_options`
--
ALTER TABLE `btl_menu_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_menu_option_values`
--
ALTER TABLE `btl_menu_option_values`
  MODIFY `option_value_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_migrations`
--
ALTER TABLE `btl_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de la tabla `btl_orders`
--
ALTER TABLE `btl_orders`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_order_menus`
--
ALTER TABLE `btl_order_menus`
  MODIFY `order_menu_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_order_menu_options`
--
ALTER TABLE `btl_order_menu_options`
  MODIFY `order_option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_order_totals`
--
ALTER TABLE `btl_order_totals`
  MODIFY `order_total_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_payments`
--
ALTER TABLE `btl_payments`
  MODIFY `payment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `btl_payment_logs`
--
ALTER TABLE `btl_payment_logs`
  MODIFY `payment_log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_payment_profiles`
--
ALTER TABLE `btl_payment_profiles`
  MODIFY `payment_profile_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_request_logs`
--
ALTER TABLE `btl_request_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `btl_reservations`
--
ALTER TABLE `btl_reservations`
  MODIFY `reservation_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_settings`
--
ALTER TABLE `btl_settings`
  MODIFY `setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT de la tabla `btl_staffs`
--
ALTER TABLE `btl_staffs`
  MODIFY `staff_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `btl_staff_groups`
--
ALTER TABLE `btl_staff_groups`
  MODIFY `staff_group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `btl_staff_roles`
--
ALTER TABLE `btl_staff_roles`
  MODIFY `staff_role_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `btl_statuses`
--
ALTER TABLE `btl_statuses`
  MODIFY `status_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `btl_status_history`
--
ALTER TABLE `btl_status_history`
  MODIFY `status_history_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_stocks`
--
ALTER TABLE `btl_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_stock_history`
--
ALTER TABLE `btl_stock_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_sussexcoder_poll_vote__models`
--
ALTER TABLE `btl_sussexcoder_poll_vote__models`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_tables`
--
ALTER TABLE `btl_tables`
  MODIFY `table_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `btl_themes`
--
ALTER TABLE `btl_themes`
  MODIFY `theme_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `btl_thoughtco_reportbuilder`
--
ALTER TABLE `btl_thoughtco_reportbuilder`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `btl_users`
--
ALTER TABLE `btl_users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `btl_user_preferences`
--
ALTER TABLE `btl_user_preferences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `btl_working_hours`
--
ALTER TABLE `btl_working_hours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `btl_igniter_automation_logs`
--
ALTER TABLE `btl_igniter_automation_logs`
  ADD CONSTRAINT `btl_igniter_automation_logs_automation_rule_id_foreign` FOREIGN KEY (`automation_rule_id`) REFERENCES `btl_igniter_automation_rules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `btl_igniter_automation_logs_rule_action_id_foreign` FOREIGN KEY (`rule_action_id`) REFERENCES `btl_igniter_automation_rule_actions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `btl_igniter_automation_rule_actions`
--
ALTER TABLE `btl_igniter_automation_rule_actions`
  ADD CONSTRAINT `btl_igniter_actions_automation_rule_id_foreign` FOREIGN KEY (`automation_rule_id`) REFERENCES `btl_igniter_automation_rules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `btl_igniter_automation_rule_conditions`
--
ALTER TABLE `btl_igniter_automation_rule_conditions`
  ADD CONSTRAINT `btl_igniter_conditions_automation_rule_id_foreign` FOREIGN KEY (`automation_rule_id`) REFERENCES `btl_igniter_automation_rules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `btl_pages`
--
ALTER TABLE `btl_pages`
  ADD CONSTRAINT `btl_pages_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `btl_languages` (`language_id`);

--
-- Filtros para la tabla `btl_stock_history`
--
ALTER TABLE `btl_stock_history`
  ADD CONSTRAINT `btl_stock_history_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `btl_orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `btl_stock_history_stock_id_foreign` FOREIGN KEY (`stock_id`) REFERENCES `btl_stocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
