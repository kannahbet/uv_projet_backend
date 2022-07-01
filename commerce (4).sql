-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 01 juil. 2022 à 14:10
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `commerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `cathegories`
--

DROP TABLE IF EXISTS `cathegories`;
CREATE TABLE IF NOT EXISTS `cathegories` (
  `codeC` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  `illustration` varchar(255) NOT NULL,
  PRIMARY KEY (`codeC`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cathegories`
--

INSERT INTO `cathegories` (`codeC`, `nom`, `description`, `illustration`) VALUES
(1, 'mens clothing', 'habit masculin', 'consu pour toute l\'année\r\n'),
(2, 'jewelery', 'Diamant', 'collier, bijou, bague\r\n'),
(3, 'electronics', 'les appariels electroniques', 'tout equiment electronique'),
(4, 'women s clothing', 'habit feminin', 'robe, chaussure,pantalon');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `code_client` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `birthdate` varchar(255) NOT NULL,
  `username` varchar(11) NOT NULL,
  `password` varchar(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `title` varchar(20) NOT NULL,
  `picture` varchar(15) NOT NULL,
  PRIMARY KEY (`code_client`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`code_client`, `email`, `gender`, `phone_number`, `birthdate`, `username`, `password`, `first_name`, `last_name`, `title`, `picture`) VALUES
(1, 'noah.dupont@example.com', 'male', '(280)-900-0140', '857793035', 'redbear614', 'adidas', 'noah', 'dupont', 'monsieur', 'men/52.jpg'),
(2, 'nerea.mendez@example.com', 'female', '600-927-322', '275245760', 'tinybird877', '4567', 'nerea', 'mendez', 'miss', 'women/29.jpg'),
(3, 'alma.thomsen@example.com', 'female', '85041366', '1268379241', 'tinyfish204', 'moomoo', 'alma', 'thomsen', 'mrs', 'women/55.jpg'),
(4, 'guillermo.saez@example.com', 'male', '686-658-217', '724236927', 'redduck278', 'santiago', 'guillermo', 'saez', 'mr', 'men/19.jpg'),
(5, 'judith.schmitz@example.com', 'female', '0171-7824648', '1348121292', 'smallcat785', 'prissy', 'judith', 'schmitz', 'miss', 'women/49.jpg'),
(6, 'gilbert.willis@example.com', 'male', '(016)-019-8853', '16157918', 'bluebear261', 'tinkerbe', 'gilbert', 'willis', 'mr', 'men/27.jpg'),
(7, 'selma.andersen@example.com', 'female', '25728984', '1123567', 'bluedog190', 'lkjhgfds', 'selma', 'andersen', 'miss', 'women/18.jpg'),
(8, 'andrea.hernandez@example.com', 'female', '649-994-475', '1437798771', 'redduck501', 'lowrider', 'andrea', 'hernandez', 'ms', 'women/56.jpg'),
(9, 'alfred.nielsen@example.com', 'male', '13271213', '656385992', 'crazydog340', 'stinker', 'alfred', 'nielsen', 'mr', 'men/47.jpg'),
(10, 'sandra.lucas@example.com', 'female', '(937)-800-4403', '1186324487', 'whitecat630', 'toonarmy', 'sandra', 'lucas', 'mademoiselle', 'women/78.jpg'),
(11, 'sara.johansen@example.com', 'female', '52918686', '1278082796', 'tinywolf270', '123456789', 'sara', 'johansen', 'mrs', 'women/39.jpg'),
(12, 'naja.larsen@example.com', 'female', '47342413', '685240705', 'bluefish638', 'dirtbike', 'naja', 'larsen', 'miss', 'women/44.jpg'),
(13, 'oscar.christiansen@example.com', 'male', '38396305', '1335200641', 'smalldog404', 'gggggggg', 'oscar', 'christiansen', 'mr', 'men/95.jpg'),
(14, 'florence.newman@example.com', 'female', '081-451-6846', '823456158', 'greendog405', 'danzig', 'florence', 'newman', 'mrs', 'women/1.jpg'),
(15, 'lucas.harris@example.com', 'male', '405-581-1720', '1386280410', 'tinyduck137', 'decker', 'lucas', 'harris', 'mr', 'men/78.jpg'),
(16, 'leo.abraham@example.com', 'male', '122-307-5945', '888702754', 'lazylion665', 'fruity', 'leo', 'abraham', 'mr', 'men/92.jpg'),
(17, 'Ø¢Ù†ÛŒØªØ§.ÙƒØ§Ù…ÙŠØ§Ø±Ø§Ù†@example.com', 'female', '0995-752-6408', '452998355', 'blueduck902', 'puppet', 'Ø¢Ù†ÛŒØªØ§', 'ÙƒØ§Ù…ÙŠØ§Ø±Ø§Ù†', 'mrs', 'women/67.jpg'),
(18, 'aurÃ©lien.leroy@example.com', 'male', '06-17-90-10-30', '325313009', 'greencat660', 'darkman', 'aurÃ©lien', 'leroy', 'mr', 'men/35.jpg'),
(19, 'emine.barentsen@example.com', 'female', '(131)-731-5524', '1396240428', 'bigtiger174', 'anne', 'emine', 'barentsen', 'miss', 'women/22.jpg'),
(20, 'carsta.rocha@example.com', 'male', '(60) 1416-4953', '296641611', 'redfish833', 'soccer12', 'carsta', 'rocha', 'mr', 'men/4.jpg'),
(21, 'marcus.walker@example.com', 'male', '(690)-027-1079', '1382119558', 'redfrog556', 'girfriend', 'marcus', 'walker', 'mr', 'men/82.jpg'),
(22, 'sheryl.carr@example.com', 'female', '0731-134-689', '117923501', 'redbear154', 'ziggy', 'sheryl', 'carr', 'ms', 'women/75.jpg'),
(23, 'sofia.sales@example.com', 'female', '(69) 6275-4624', '841700488', 'redlion952', 'kaiser', 'sofia', 'sales', 'ms', 'women/66.jpg'),
(24, 'alyssa.andre@example.com', 'female', '06-61-26-48-78', '14471564', 'bigtiger239', 'clover', 'alyssa', 'andre', 'mrs', 'women/37.jpg'),
(25, 'Ø¢Ø±Ù…ÛŒØªØ§.Ø³Ù„Ø·Ø§Ù†ÛŒÙ†Ú˜Ø§Ø¯@example.com', 'female', '0904-946-2757', '1282460030', 'blueswan165', 'nudes', 'Ø¢Ø±Ù…ÛŒØªØ§', 'Ø³Ù„Ø·Ø§Ù†ÛŒ Ù†Ú˜Ø§Ø¯', 'mrs', 'women/8.jpg'),
(26, 'stefan.siebert@example.com', 'male', '0175-8081099', '995242988', 'crazycat938', 'sommer', 'stefan', 'siebert', 'mr', 'men/21.jpg'),
(27, 'amy.miller@example.com', 'female', '567-629-4636', '487837819', 'bluebear787', 'soft', 'amy', 'miller', 'miss', 'women/58.jpg'),
(28, 'liam.walters@example.com', 'male', '0438-376-652', '826530877', 'biglion964', 'training', 'liam', 'walters', 'mr', 'men/50.jpg'),
(29, 'deolindo.vieira@example.com', 'male', '(93) 2134-8962', '1116215145', 'bigsnake641', 'darklord', 'deolindo', 'vieira', 'mr', 'men/59.jpg'),
(30, 'joaquin.hidalgo@example.com', 'male', '614-654-138', '1381390352', 'bigcat536', 'kris', 'joaquin', 'hidalgo', 'mr', 'men/57.jpg'),
(31, 'pauline.perez@example.com', 'female', '(189)-609-2928', '917729650', 'tinyfish934', 'oicu812', 'pauline', 'perez', 'madame', 'women/96.jpg'),
(32, 'laly.dasilva@example.com', 'female', '(082)-419-9335', '1123776172', 'bluebird274', 'design', 'laly', 'da silva', 'mademoiselle', 'women/9.jpg'),
(33, 'cassandre.leroux@example.com', 'female', '06-09-96-38-18', '569521519', 'bigwolf469', 'spooge', 'cassandre', 'leroux', 'mrs', 'women/25.jpg'),
(34, 'edgar.shelton@example.com', 'male', '0467-658-105', '125584897', 'tinyswan868', 'mmmm', 'edgar', 'shelton', 'mr', 'men/46.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `dateCommande` date NOT NULL,
  `destinataire` int(11) NOT NULL,
  `Date_envoi` date NOT NULL,
  `adresse_livraison` text NOT NULL,
  PRIMARY KEY (`id_commande`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `dateCommande`, `destinataire`, `Date_envoi`, `adresse_livraison`) VALUES
(1, '2020-06-10', 1, '2021-06-11', 'on conserve l\'adresse du client'),
(2, '2020-06-10', 3, '2020-06-11', 'on conserve l\'adresse du client'),
(3, '2021-01-01', 2, '2021-01-02', 'on conserve l\'adresse du client'),
(4, '2021-02-02', 5, '2021-02-02', 'on conserve l\'adresse du client'),
(5, '2021-02-10', 2, '2021-02-10', 'on conserve l\'adresse du client');

-- --------------------------------------------------------

--
-- Structure de la table `details _commande`
--

DROP TABLE IF EXISTS `details _commande`;
CREATE TABLE IF NOT EXISTS `details _commande` (
  `id_details` int(11) NOT NULL AUTO_INCREMENT,
  `quantite` int(11) NOT NULL,
  `remise` int(11) NOT NULL,
  `ref_prod` int(11) NOT NULL,
  `ref_comma` int(11) NOT NULL,
  PRIMARY KEY (`id_details`),
  KEY `ref_comma` (`ref_comma`),
  KEY `ref_prod` (`ref_prod`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `details _commande`
--

INSERT INTO `details _commande` (`id_details`, `quantite`, `remise`, `ref_prod`, `ref_comma`) VALUES
(1, 14, 0, 6, 1),
(2, 34, 0, 1, 2),
(3, 16, 254, 5, 1),
(4, 20, 0, 2, 2),
(5, 14, 0, 3, 3),
(6, 34, 0, 8, 4),
(7, 2, 0, 6, 4),
(8, 23, 0, 8, 5);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `Refpro` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `price` float NOT NULL,
  `description` text NOT NULL,
  `category` text NOT NULL,
  `image` text NOT NULL,
  `rate` float NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`Refpro`),
  KEY `category` (`category`(333))
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`Refpro`, `title`, `price`, `description`, `category`, `image`, `rate`, `count`) VALUES
(1, ' Backpack, Fits 15 Laptops', 109.95, 'Your perfect pack for everyday use and walks in the forest. S ', '1', 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg', 3.9, 120),
(2, 'Mens Casual Premium Slim Fit T-Shirts ', 22.3, 'Slim-fitting style, contrast raglan long sleeve.', '1', 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg', 4.1, 259),
(3, 'Mens Cotton Jacket', 55.99, 'great outerwear jackets for Spring/Autumn/Winter.', '1', 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg', 4.7, 500),
(4, 'Mens Casual Slim Fit', 15.99, 'The color could be slightly different between on the.', '1', 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg', 2.1, 430),
(5, ' Silver Dragon Station Chain Bracelet', 695, 'From our Legends Collection, the Naga was inspired by the mythical water dragon that protects.', '2', 'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg', 4.6, 400),
(6, 'Solid Gold Petite Micropave ', 168, 'Satisfaction Guaranteed. Return or exchange any order within 30 days.', '2', 'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg', 3.9, 70),
(7, 'White Gold Plated Princess', 9.99, 'Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, ', '2', 'https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg', 3, 400),
(8, 'Pierced Owl Rose Gold Plated Stainless Steel Double', 10.99, 'Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel', '2', 'https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_.jpg', 1.9, 100),
(9, 'WD 2TB Elements Portable External Hard Drive - USB 3.0 ', 64, 'USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; ', '3', 'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg', 3.3, 203),
(10, 'SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s', 109, 'Easy upgrade for faster boot up, shutdown, application load and response (As compared to 5400 RPM SATA 2.5â€ hard drive; ', '3', 'https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg', 2.9, 470),
(11, 'Silicon Power 256GB SSD Performance Boost SATA III ', 109, '3D NAND flash are applied to deliver high transfer speeds Remarkable transfer .', '3', 'https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_.jpg', 4.8, 319),
(12, 'Playstation 4 Portable External Hard Drive', 114, 'Expand your PS4 gaming experience, Play anywhere, setup Sleek design with high capacity', '3', 'https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_.jpg', 4.8, 400),
(13, 'Acer SB220Q bi 21.5 IPS Ultra-Thin', 599, '21. 5 inches Full HD (1920 x 1080) widescreen IPS display And Radeon free Sync technology. No compa', '3', 'https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_.jpg', 2.9, 250),
(14, 'Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) â€“ Super Ultrawide Screen QLED ', 999.99, '49 INCH SUPER ULTRAWIDE 32:9 CURVED GAMING MONITOR with dual 27 inch screen', '3', 'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg', 2.2, 140),
(15, 'Jacket Winter Coats', 56.99, 'Note:The Jackets is US standard size, Please choose size as your usual wear Material:', '4', 'https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg', 2.6, 235),
(16, 'Rain Jacket Women Windbreaker Striped Climbing', 39.99, 'Lightweight perfet for trip or casual wear---Long sleeve with hooded, adjustable drawstring waist design.', '4', 'https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg', 3.8, 679),
(17, 'DANVOUY Womens T Shirt Casual Cotton Short', 12.99, '95%Cotton,5%Spandex, ', '4', 'https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg', 3.6, 145);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
