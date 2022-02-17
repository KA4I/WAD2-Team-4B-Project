-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Apr 18, 2021 at 11:30 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`ID`, `UserID`) VALUES
(11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cartitems`
--

CREATE TABLE `cartitems` (
  `ID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `ShoppingCartID` int(11) NOT NULL,
  `Wishlist` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cartitems`
--

INSERT INTO `cartitems` (`ID`, `ProductID`, `Quantity`, `ShoppingCartID`, `Wishlist`) VALUES
(79, 54, 1, 11, 2);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`) VALUES
(1, 'Mountain Bicycles'),
(2, 'Test Kolela');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `CountryName` varchar(255) COLLATE utf8_bin NOT NULL,
  `CountryID` varchar(2) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `CountryName`, `CountryID`) VALUES
(1, 'Andorra', 'AD'),
(2, 'Afghanistan', 'AF'),
(3, 'Aland Islands', 'AX'),
(4, 'Albania', 'AL'),
(5, 'Algeria', 'DZ'),
(6, 'American Samoa', 'AS'),
(7, 'Angola', 'AO'),
(8, 'Anguilla', 'AI'),
(10, 'Antigua and Barbuda', 'AG'),
(11, 'Argentina', 'AR'),
(12, 'Armenia', 'AM'),
(13, 'Aruba', 'AW'),
(14, 'Australia', 'AU'),
(15, 'Austria', 'AT'),
(16, 'Azerbaijan', 'AZ'),
(17, 'Bahamas', 'BS'),
(18, 'Bahrain', 'BH'),
(19, 'Bangladesh', 'BD'),
(20, 'Barbados', 'BB'),
(21, 'Belarus', 'BY'),
(22, 'Belgium', 'BE'),
(23, 'Belize', 'BZ'),
(24, 'Benin', 'BJ'),
(25, 'Bermuda', 'BM'),
(26, 'Bhutan', 'BT'),
(27, 'Bolivia (Plurinational State of)', 'BO'),
(28, 'Bonaire, Sint Eustatius and Saba', 'BQ'),
(29, 'Bosnia and Herzegovina', 'BA'),
(30, 'Botswana', 'BW'),
(31, 'Bouvet Island', 'BV'),
(32, 'Brazil', 'BR'),
(33, 'British Indian Ocean Territory', 'IO'),
(34, 'Brunei Darussalam', 'BN'),
(35, 'Bulgaria', 'BG'),
(36, 'Burkina Faso', 'BF'),
(37, 'Burundi', 'BI'),
(38, 'Cabo Verde', 'CV'),
(39, 'Cambodia', 'KH'),
(40, 'Cameroon', 'CM'),
(41, 'Canada', 'CA'),
(42, 'Cayman Islands', 'KY'),
(43, 'Central African Republic', 'CF'),
(44, 'Chad', 'TD'),
(45, 'Chile', 'CL'),
(46, 'China', 'CN'),
(47, 'Christmas Island', 'CX'),
(48, 'Cocos (Keeling) Islands', 'CC'),
(49, 'Colombia', 'CO'),
(50, 'Comoros', 'KM'),
(51, 'Congo', 'CG'),
(52, 'Congo (Democratic Republic of the)', 'CD'),
(53, 'Cook Islands', 'CK'),
(54, 'Costa Rica', 'CR'),
(55, 'Cote d\'Ivoire', 'CI'),
(56, 'Croatia', 'HR'),
(57, 'Cuba', 'CU'),
(58, 'Curacao', 'CW'),
(59, 'Cyprus', 'CY'),
(60, 'Czech Republic', 'CZ'),
(61, 'Denmark', 'DK'),
(62, 'Djibouti', 'DJ'),
(63, 'Dominica', 'DM'),
(64, 'Dominican Republic', 'DO'),
(65, 'Ecuador', 'EC'),
(66, 'Egypt', 'EG'),
(67, 'El Salvador', 'SV'),
(68, 'Equatorial Guinea', 'GQ'),
(69, 'Eritrea', 'ER'),
(70, 'Estonia', 'EE'),
(71, 'Ethiopia', 'ET'),
(72, 'Falkland Islands (Malvinas)', 'FK'),
(73, 'Faroe Islands', 'FO'),
(74, 'Fiji', 'FJ'),
(75, 'Finland', 'FI'),
(76, 'France', 'FR'),
(77, 'French Guiana', 'GF'),
(78, 'French Polynesia', 'PF'),
(79, 'French Southern Territories', 'TF'),
(80, 'Gabon', 'GA'),
(81, 'Gambia', 'GM'),
(82, 'Georgia', 'GE'),
(83, 'Germany', 'DE'),
(84, 'Ghana', 'GH'),
(85, 'Gibraltar', 'GI'),
(86, 'Greece', 'GR'),
(87, 'Greenland', 'GL'),
(88, 'Grenada', 'GD'),
(89, 'Guadeloupe', 'GP'),
(90, 'Guam', 'GU'),
(91, 'Guatemala', 'GT'),
(92, 'Guernsey', 'GG'),
(93, 'Guinea', 'GN'),
(94, 'Guinea-Bissau', 'GW'),
(95, 'Guyana', 'GY'),
(96, 'Haiti', 'HT'),
(97, 'Heard Island and McDonald Islands', 'HM'),
(98, 'Holy See', 'VA'),
(99, 'Honduras', 'HN'),
(100, 'Hong Kong', 'HK'),
(101, 'Hungary', 'HU'),
(102, 'Iceland', 'IS'),
(103, 'India', 'IN'),
(104, 'Indonesia', 'ID'),
(105, 'Iran (Islamic Republic of)', 'IR'),
(106, 'Iraq', 'IQ'),
(107, 'Ireland', 'IE'),
(108, 'Isle of Man', 'IM'),
(109, 'Israel', 'IL'),
(110, 'Italy', 'IT'),
(111, 'Jamaica', 'JM'),
(112, 'Japan', 'JP'),
(113, 'Jersey', 'JE'),
(114, 'Jordan', 'JO'),
(115, 'Kazakhstan', 'KZ'),
(116, 'Kenya', 'KE'),
(117, 'Kiribati', 'KI'),
(118, 'Korea (Democratic People\'s Republic of)', 'KP'),
(119, 'Korea (Republic of)', 'KR'),
(120, 'Kuwait', 'KW'),
(121, 'Kyrgyzstan', 'KG'),
(122, 'Lao People\'s Democratic Republic', 'LA'),
(123, 'Latvia', 'LV'),
(124, 'Lebanon', 'LB'),
(125, 'Lesotho', 'LS'),
(126, 'Liberia', 'LR'),
(127, 'Libya', 'LY'),
(128, 'Liechtenstein', 'LI'),
(129, 'Lithuania', 'LT'),
(130, 'Luxembourg', 'LU'),
(131, 'Macao', 'MO'),
(132, 'North Macedonia', 'MK'),
(133, 'Madagascar', 'MG'),
(134, 'Malawi', 'MW'),
(135, 'Malaysia', 'MY'),
(136, 'Maldives', 'MV'),
(137, 'Mali', 'ML'),
(138, 'Malta', 'MT'),
(139, 'Marshall Islands', 'MH'),
(140, 'Martinique', 'MQ'),
(141, 'Mauritania', 'MR'),
(142, 'Mauritius', 'MU'),
(143, 'Mayotte', 'YT'),
(144, 'Mexico', 'MX'),
(145, 'Micronesia (Federated States of)', 'FM'),
(146, 'Moldova (Republic of)', 'MD'),
(147, 'Monaco', 'MC'),
(148, 'Mongolia', 'MN'),
(149, 'Montenegro', 'ME'),
(150, 'Montserrat', 'MS'),
(151, 'Morocco', 'MA'),
(152, 'Mozambique', 'MZ'),
(153, 'Myanmar', 'MM'),
(154, 'Namibia', 'NA'),
(155, 'Nauru', 'NR'),
(156, 'Nepal', 'NP'),
(157, 'Netherlands', 'NL'),
(158, 'New Caledonia', 'NC'),
(159, 'New Zealand', 'NZ'),
(160, 'Nicaragua', 'NI'),
(161, 'Niger', 'NE'),
(162, 'Nigeria', 'NG'),
(163, 'Niue', 'NU'),
(164, 'Norfolk Island', 'NF'),
(165, 'Northern Mariana Islands', 'MP'),
(166, 'Norway', 'NO'),
(167, 'Oman', 'OM'),
(168, 'Pakistan', 'PK'),
(169, 'Palau', 'PW'),
(170, 'Palestine, State of', 'PS'),
(171, 'Panama', 'PA'),
(172, 'Papua New Guinea', 'PG'),
(173, 'Paraguay', 'PY'),
(174, 'Peru', 'PE'),
(175, 'Philippines', 'PH'),
(176, 'Pitcairn', 'PN'),
(177, 'Poland', 'PL'),
(178, 'Portugal', 'PT'),
(179, 'Puerto Rico', 'PR'),
(180, 'Qatar', 'QA'),
(181, 'Reunion', 'RE'),
(182, 'Romania', 'RO'),
(183, 'Russian Federation', 'RU'),
(184, 'Rwanda', 'RW'),
(185, 'Saint Barthelemy', 'BL'),
(186, 'Saint Helena, Ascension and Tristan da Cunha', 'SH'),
(187, 'Saint Kitts and Nevis', 'KN'),
(188, 'Saint Lucia', 'LC'),
(189, 'Saint Martin (French part)', 'MF'),
(190, 'Saint Pierre and Miquelon', 'PM'),
(191, 'Saint Vincent and the Grenadines', 'VC'),
(192, 'Samoa', 'WS'),
(193, 'San Marino', 'SM'),
(194, 'Sao Tome and Principe', 'ST'),
(195, 'Saudi Arabia', 'SA'),
(196, 'Senegal', 'SN'),
(197, 'Serbia', 'RS'),
(198, 'Seychelles', 'SC'),
(199, 'Sierra Leone', 'SL'),
(200, 'Singapore', 'SG'),
(201, 'Sint Maarten (Dutch part)', 'SX'),
(202, 'Slovakia', 'SK'),
(203, 'Slovenia', 'SI'),
(204, 'Solomon Islands', 'SB'),
(205, 'Somalia', 'SO'),
(206, 'South Africa', 'ZA'),
(207, 'South Georgia and the South Sandwich Islands', 'GS'),
(208, 'South Sudan', 'SS'),
(209, 'Spain', 'ES'),
(210, 'Sri Lanka', 'LK'),
(211, 'Sudan', 'SD'),
(212, 'Suriname', 'SR'),
(213, 'Svalbard and Jan Mayen', 'SJ'),
(214, 'Swaziland', 'SZ'),
(215, 'Sweden', 'SE'),
(216, 'Switzerland', 'CH'),
(217, 'Syrian Arab Republic', 'SY'),
(218, 'Taiwan, Province of China', 'TW'),
(219, 'Tajikistan', 'TJ'),
(220, 'Tanzania, United Republic of', 'TZ'),
(221, 'Thailand', 'TH'),
(222, 'Timor-Leste', 'TL'),
(223, 'Togo', 'TG'),
(224, 'Tokelau', 'TK'),
(225, 'Tonga', 'TO'),
(226, 'Trinidad and Tobago', 'TT'),
(227, 'Tunisia', 'TN'),
(228, 'Turkey', 'TR'),
(229, 'Turkmenistan', 'TM'),
(230, 'Turks and Caicos Islands', 'TC'),
(231, 'Tuvalu', 'TV'),
(232, 'Uganda', 'UG'),
(233, 'Ukraine', 'UA'),
(234, 'United Arab Emirates', 'AE'),
(235, 'United Kingdom of Great Britain and Northern Ireland', 'GB'),
(236, 'United States Minor Outlying Islands', 'UM'),
(237, 'United States of America', 'US'),
(238, 'Uruguay', 'UY'),
(239, 'Uzbekistan', 'UZ'),
(240, 'Vanuatu', 'VU'),
(241, 'Venezuela (Bolivarian Republic of)', 'VE'),
(242, 'Viet Nam', 'VN'),
(243, 'Virgin Islands (British)', 'VG'),
(244, 'Virgin Islands (U.S.)', 'VI'),
(245, 'Wallis and Futuna', 'WF'),
(246, 'Western Sahara', 'EH'),
(247, 'Yemen', 'YE'),
(248, 'Zambia', 'ZM'),
(249, 'Zimbabwe', 'ZW');

-- --------------------------------------------------------

--
-- Table structure for table `courrier`
--

CREATE TABLE `courrier` (
  `CourrierID` int(11) NOT NULL,
  `Name` longtext NOT NULL,
  `Phone` longtext NOT NULL,
  `Address` longtext NOT NULL,
  `Email` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` longtext DEFAULT NULL,
  `LastName` longtext DEFAULT NULL,
  `Address` longtext DEFAULT NULL,
  `Telephone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `FirstName`, `LastName`, `Address`, `Telephone`) VALUES
(1, 'Bach', 'Kach', '12 Street Name', '0156498565');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `ImageID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `ImageLoc` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`ImageID`, `ProductID`, `ImageLoc`) VALUES
(1, 77, 'images/Products/Mountain Bicycles/Kotence.jpg'),
(2, 77, 'images/Products/Mountain Bicycles/Kotence2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE `months` (
  `MonthID` int(255) NOT NULL,
  `Month` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`MonthID`, `Month`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderProductID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `FirstName` longtext NOT NULL,
  `LastName` longtext NOT NULL,
  `CountryID` int(11) UNSIGNED NOT NULL,
  `Address` longtext NOT NULL,
  `Address2` longtext DEFAULT NULL,
  `Note` longtext DEFAULT NULL,
  `Phone` varchar(20) NOT NULL,
  `Email` longtext NOT NULL,
  `CourrierID` int(10) DEFAULT NULL,
  `OrderDate` datetime NOT NULL,
  `Total` decimal(30,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `passwordrecovery`
--

CREATE TABLE `passwordrecovery` (
  `RequestID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `RecoveryHash` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passwordrecovery`
--

INSERT INTO `passwordrecovery` (`RequestID`, `UserID`, `RecoveryHash`) VALUES
(27, 1, '$2y$10$0eAqgwmDGiUm5t0ceEWSC.tLShI76H3zqI4UM324yEo4wRJ.47eee');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `Description` longtext NOT NULL,
  `Name` longtext NOT NULL,
  `ImageCover` longtext NOT NULL,
  `ImageCoverHover` longtext DEFAULT NULL,
  `Stock` bigint(20) NOT NULL,
  `Sales` bigint(20) NOT NULL,
  `Price` decimal(4,0) NOT NULL,
  `Cost` decimal(4,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `CategoryID`, `Description`, `Name`, `ImageCover`, `ImageCoverHover`, `Stock`, `Sales`, `Price`, `Cost`) VALUES
(1, 1, 'Koleloto Na Baba', 'A', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(2, 1, 'Kolelce', 'B', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(52, 1, 'Koleloto Na Baba', 'C', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(53, 1, 'Kolelce', 'Fas', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(54, 1, 'Koleloto Na Baba', '1', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(55, 1, 'Kolelce', '2', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(56, 1, 'Koleloto Na Baba', '3', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(57, 1, 'Kolelce', '4', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(58, 1, 'Koleloto Na Baba', '1', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(59, 1, 'Kolelce', '2', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(60, 1, 'Koleloto Na Baba', '3', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(61, 1, 'Kolelce', '4', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(62, 1, 'Koleloto Na Baba', 'A', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(63, 1, 'Kolelce', 'B', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(64, 1, 'Koleloto Na Baba', 'C', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(65, 1, 'Kolelce', 'D', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(66, 1, 'Koleloto Na Baba', '1', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(67, 1, 'Koleloto Na Baba', '1', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(68, 1, 'Kolelce', '2', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(69, 1, 'Kolelce', '2', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(70, 1, 'Koleloto Na Baba', '3', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(71, 1, 'Koleloto Na Baba', '3', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(72, 1, 'Kolelce', '4', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(73, 1, 'Kolelce', '4', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(74, 1, 'Koleloto Na Baba', 'A', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(75, 1, 'Koleloto Na Baba', 'A', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(76, 1, 'Kolelce', 'B', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(77, 1, 'Kolelce', 'B', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(78, 1, 'Koleloto Na Baba', 'C', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(79, 1, 'Koleloto Na Baba', 'C', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(80, 1, 'Kolelce', 'D', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(81, 1, 'Kolelce', 'D', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(82, 1, 'Koleloto Na Baba', 'A', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(83, 1, 'Kolelce', 'B', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(84, 1, 'Koleloto Na Baba', 'C', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(85, 1, 'Kolelce', 'D', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(86, 1, 'Koleloto Na Baba', '1', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(87, 1, 'Kolelce', '2', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(88, 1, 'Koleloto Na Baba', '3', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(89, 1, 'Kolelce', '4', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(90, 1, 'Koleloto Na Baba', 'A', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(91, 1, 'Kolelce', 'B', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(92, 1, 'Koleloto Na Baba', 'C', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(93, 1, 'Kolelce', 'D', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(94, 1, 'Koleloto Na Baba', '1', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(95, 1, 'Kolelce', '2', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(96, 1, 'Koleloto Na Baba', '3', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(97, 1, 'Kolelce', '4', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(98, 1, 'Koleloto Na Baba', 'A', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(99, 1, 'Kolelce', 'B', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(100, 1, 'Koleloto Na Baba', 'C', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(101, 1, 'Kolelce', 'D', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(102, 1, 'Koleloto Na Baba', '1', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(103, 1, 'Kolelce', '2', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(104, 1, 'Koleloto Na Baba', '3', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(105, 1, 'Kolelce', '4', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(106, 1, 'Koleloto Na Baba', 'A', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(107, 1, 'Kolelce', 'B', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(108, 1, 'Koleloto Na Baba', 'C', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(109, 1, 'Kolelce', 'D', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(110, 1, 'Koleloto Na Baba', '1', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(111, 1, 'Kolelce', '2', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(112, 1, 'Koleloto Na Baba', '3', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(113, 1, 'Kolelce', '4', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(114, 1, 'Koleloto Na Baba', 'A', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(115, 1, 'Kolelce', 'B', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(116, 1, 'Koleloto Na Baba', 'C', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(117, 1, 'Kolelce', 'D', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(118, 1, 'Koleloto Na Baba', '1', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(119, 1, 'Kolelce', '2', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100'),
(120, 1, 'Koleloto Na Baba', '3', 'images/Products/Mountain Bicycles/Kotence.jpg', NULL, 300, 0, '550', '150'),
(121, 1, 'Kolelce', '4', 'images/Products/Mountain Bicycles/MonB.png', NULL, 235, 0, '150', '100');

-- --------------------------------------------------------

--
-- Table structure for table `productsupply`
--

CREATE TABLE `productsupply` (
  `ProductSupplyID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productsupply`
--

INSERT INTO `productsupply` (`ProductSupplyID`, `ProductID`, `SupplierID`) VALUES
(1, 1, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `SalesID` int(255) NOT NULL,
  `ProductID` int(255) NOT NULL,
  `YearID` int(255) NOT NULL,
  `MonthID` int(255) NOT NULL,
  `Sales` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`SalesID`, `ProductID`, `YearID`, `MonthID`, `Sales`) VALUES
(1, 1, 1, 8, 123),
(2, 1, 1, 9, 325),
(3, 1, 1, 10, 521),
(4, 1, 1, 11, 221),
(5, 1, 1, 12, 324),
(6, 1, 2, 1, 321),
(7, 1, 2, 2, 211),
(8, 1, 2, 3, 124),
(9, 1, 2, 4, 215),
(10, 1, 2, 5, 632),
(11, 1, 2, 6, 254),
(12, 1, 2, 7, 350),
(13, 1, 2, 8, 954),
(14, 1, 2, 9, 324),
(21, 2, 2, 9, 237),
(22, 2, 2, 2, 558),
(28, 2, 2, 6, 524),
(29, 2, 2, 5, 356),
(30, 2, 2, 4, 248),
(31, 2, 2, 1, 456),
(32, 2, 1, 12, 546),
(33, 2, 2, 8, 442);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SupplierID` int(11) NOT NULL,
  `Name` longtext NOT NULL,
  `Phone` longtext NOT NULL,
  `Address` longtext NOT NULL,
  `Email` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SupplierID`, `Name`, `Phone`, `Address`, `Email`) VALUES
(1, 'Gosho Tavata', '0123456789', '1 Random Street', 'gosho_tavata@abv.bg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `CountryID` int(11) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `CustomerID`, `username`, `password`, `email`, `CountryID`, `created_at`) VALUES
(1, 1, 'Karate', '$2y$10$m7P2yH/S3ramYfbf0Odt2eC2cFaTSr9h6HOiYEO6qhQND0bc6N3u.', 'horosho9741@gmail.com', 35, '2020-01-16 13:52:23');

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

CREATE TABLE `years` (
  `YearID` int(255) NOT NULL,
  `Year` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `years`
--

INSERT INTO `years` (`YearID`, `Year`) VALUES
(1, 2018),
(2, 2019);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `cartitems`
--
ALTER TABLE `cartitems`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProductID` (`ProductID`,`ShoppingCartID`),
  ADD KEY `cartitems_ibfk_2` (`ShoppingCartID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courrier`
--
ALTER TABLE `courrier`
  ADD PRIMARY KEY (`CourrierID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`ImageID`),
  ADD KEY `Images_fk0` (`ProductID`);

--
-- Indexes for table `months`
--
ALTER TABLE `months`
  ADD PRIMARY KEY (`MonthID`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`OrderProductID`),
  ADD KEY `OrderDetails_fk0` (`ProductID`),
  ADD KEY `OrderDetails_fk1` (`OrderID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `Orders_fk0` (`userID`),
  ADD KEY `Orders_fk2` (`CourrierID`),
  ADD KEY `CountryID` (`CountryID`);

--
-- Indexes for table `passwordrecovery`
--
ALTER TABLE `passwordrecovery`
  ADD PRIMARY KEY (`RequestID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `Product_fk0` (`CategoryID`);

--
-- Indexes for table `productsupply`
--
ALTER TABLE `productsupply`
  ADD PRIMARY KEY (`ProductSupplyID`),
  ADD KEY `ProductSupply_fk0` (`ProductID`),
  ADD KEY `ProductSupply_fk1` (`SupplierID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`SalesID`),
  ADD KEY `Sales_fk0` (`ProductID`),
  ADD KEY `Sales_fk1` (`YearID`),
  ADD KEY `Sales_fk2` (`MonthID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `CountryID` (`CountryID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `years`
--
ALTER TABLE `years`
  ADD PRIMARY KEY (`YearID`),
  ADD UNIQUE KEY `Year` (`Year`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cartitems`
--
ALTER TABLE `cartitems`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `courrier`
--
ALTER TABLE `courrier`
  MODIFY `CourrierID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `ImageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `months`
--
ALTER TABLE `months`
  MODIFY `MonthID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `OrderProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `passwordrecovery`
--
ALTER TABLE `passwordrecovery`
  MODIFY `RequestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `productsupply`
--
ALTER TABLE `productsupply`
  MODIFY `ProductSupplyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `SalesID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `SupplierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `years`
--
ALTER TABLE `years`
  MODIFY `YearID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`);

--
-- Constraints for table `cartitems`
--
ALTER TABLE `cartitems`
  ADD CONSTRAINT `cartitems_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE,
  ADD CONSTRAINT `cartitems_ibfk_2` FOREIGN KEY (`ShoppingCartID`) REFERENCES `cart` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `Images_fk0` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `OrderDetails_fk0` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  ADD CONSTRAINT `OrderDetails_fk1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `Orders_fk0` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `Orders_fk2` FOREIGN KEY (`CourrierID`) REFERENCES `courrier` (`CourrierID`),
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CountryID`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `passwordrecovery`
--
ALTER TABLE `passwordrecovery`
  ADD CONSTRAINT `passwordrecovery_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `Product_fk0` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`);

--
-- Constraints for table `productsupply`
--
ALTER TABLE `productsupply`
  ADD CONSTRAINT `ProductSupply_fk0` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  ADD CONSTRAINT `ProductSupply_fk1` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `Sales_fk0` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  ADD CONSTRAINT `Sales_fk1` FOREIGN KEY (`YearID`) REFERENCES `years` (`YearID`),
  ADD CONSTRAINT `Sales_fk2` FOREIGN KEY (`MonthID`) REFERENCES `months` (`MonthID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`CountryID`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
