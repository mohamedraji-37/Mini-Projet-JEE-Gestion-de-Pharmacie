-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 05 avr. 2026 à 16:37
-- Version du serveur : 11.5.2-MariaDB
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pharmacie`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(5, 'Ismail Asraoui', 'b3c55a02882e9050dcd4a6739d4a288c'),
(6, 'Hamza Khaddoumi', '28936322a5eb164c9ced5a0166f93f15'),
(3, 'Mohamed Raji', '3a70c7e9eb00d97c4ed04aefca543688');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `telephone`, `email`, `password`) VALUES
(5, 'Amina Elbazz', '0654312670', 'aminaelbazz@email.com', 'd94ffac19279613aa76dce8b859624e8'),
(4, 'Ahmadi Ali', '0678778824', 'aliahmadi@gmail.com', '0aa6379615c6ed98a2641d867b62c1fc'),
(8, 'Mohamed Raji', '0606816951', 'rajimohammed805@gmail.com', '3a70c7e9eb00d97c4ed04aefca543688'),
(7, 'Ayman Houssayni', '0678778826', 'rartdzdzftazfyopdoe@gmail.com', '25d55ad283aa400af464c76d713c07ad'),
(9, 'Zakaria Alami', '0654312673', 'zakariaalami@gmail.com', '8a7f73af5c24304fee4f85b7cff9ad12'),
(10, 'Zakaria Habti', '0654312672', 'zakariahabti@gmail.com', '72d6678c071712764c88731efbb03603');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `date_commande` date NOT NULL,
  `id_client` int(11) NOT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `code_suivi` varchar(20) NOT NULL,
  `etat` varchar(20) DEFAULT 'En attente',
  PRIMARY KEY (`id_commande`),
  UNIQUE KEY `code_suivi` (`code_suivi`),
  KEY `id_client` (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `date_commande`, `id_client`, `total`, `code_suivi`, `etat`) VALUES
(3, '2026-04-04', 1, 132.00, 'PHAR-FD2545F2', 'Validée'),
(4, '2026-04-04', 1, 278.00, 'PHAR-E9EE5BE1', 'Validée'),
(5, '2026-04-04', 1, 147.00, 'PHAR-582091D8', 'Annulée'),
(6, '2026-04-04', 1, 480.00, 'PHAR-51F724E0', 'En attente'),
(7, '2026-04-05', 8, 132.00, 'PHAR-A19E1D57', 'En attente'),
(8, '2026-04-05', 7, 57.00, 'PHAR-564EA938', 'En attente');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

DROP TABLE IF EXISTS `ligne_commande`;
CREATE TABLE IF NOT EXISTS `ligne_commande` (
  `id_ligne` int(11) NOT NULL AUTO_INCREMENT,
  `id_commande` int(11) NOT NULL,
  `id_medicament` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix_unitaire` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_ligne`),
  KEY `id_commande` (`id_commande`),
  KEY `id_medicament` (`id_medicament`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`id_ligne`, `id_commande`, `id_medicament`, `quantite`, `prix_unitaire`) VALUES
(6, 3, 13, 1, 22.00),
(7, 3, 12, 1, 95.00),
(8, 3, 1, 1, 15.00),
(9, 4, 3, 5, 35.00),
(10, 4, 13, 4, 22.00),
(11, 4, 1, 1, 15.00),
(12, 5, 3, 1, 35.00),
(13, 5, 13, 1, 22.00),
(14, 5, 1, 6, 15.00),
(15, 6, 14, 8, 60.00),
(16, 7, 13, 6, 22.00),
(17, 8, 3, 1, 35.00),
(18, 8, 13, 1, 22.00);

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

DROP TABLE IF EXISTS `medicament`;
CREATE TABLE IF NOT EXISTS `medicament` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `prix` double NOT NULL,
  `quantite` int(11) NOT NULL,
  `date_expiration` date DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`id`, `nom`, `description`, `prix`, `quantite`, `date_expiration`, `image`) VALUES
(1, 'Doliprane 500mg', 'Médicament utilisé pour soulager la douleur et réduire la fièvre (paracétamol). Utilisé pour les maux de tête, grippe et douleurs légères à modérées.', 15, 91, '2026-11-11', 'Doliprane.jpg'),
(13, 'Spasfon', 'Antispasmodique utilisé pour les douleurs abdominales', 22, 75, '2026-12-10', 'Spasfon.jpg'),
(3, 'Smecta', 'Médicament utilisé pour traiter la diarrhée et protéger la muqueuse digestive.', 35, 63, '2027-05-26', 'Smecta.jpg'),
(4, 'Efferalgan 1000mg', 'Antalgique et antipyrétique utilisé pour traiter la douleur et la fièvre.', 20, 90, '2026-11-20', 'Efferalgan Sirop.jpg'),
(5, 'Amoxicilline 500mg', 'Antibiotique utilisé pour traiter diverses infections bactériennes comme les infections ORL et respiratoires.', 30, 60, '2026-07-16', 'Amoxicilline_500mg.jpg'),
(14, 'Ventoline', 'Médicament pour traiter l’asthme et les difficultés respiratoires', 60, 22, '2026-03-10', 'ventoline.jpg'),
(15, 'Gaviscon', 'Traitement contre les brûlures d’estomac et reflux gastrique', 48, 70, '2026-12-10', 'Gaviscon.jpg'),
(16, 'Adol 500mg', 'Paracétamol pour traiter douleur et fièvre', 10, 120, '2026-09-10', 'Adol 500mg.jpg'),
(17, 'Imodium', 'Traitement contre la diarrhée aiguë', 38, 50, '2026-09-10', 'Imodium.jpg'),
(18, 'Maalox', 'Soulage les brûlures d’estomac et reflux gastrique', 42, 65, '2026-07-10', 'Maalox.jpg'),
(19, 'Nurofen 400mg', 'Anti-inflammatoire pour douleurs musculaires', 25, 85, '2026-11-10', 'Nurofen 400mg.jpg'),
(20, 'Toplexil', 'Sirop contre la toux', 30, 55, '2026-10-10', 'Toplexil.jpg'),
(21, 'Hexaspray', 'Spray pour traiter les maux de gorge', 33, 45, '2026-08-10', 'Hexaspray.jpg'),
(22, 'Panadol', 'Antidouleur et antipyrétique', 20, 100, '2027-04-01', 'panadol.jpg'),
(23, 'Ibuprofene', 'Anti-inflammatoire pour douleurs et fièvre', 28, 90, '2027-06-01', 'ibuprofene.jpg'),
(24, 'Motilium', 'Traitement contre les nausées et vomissements', 32, 70, '2027-07-01', 'motilium.jpg'),
(25, 'Aerius', 'Antihistaminique pour allergies', 45, 50, '2026-12-01', 'aerius.jpg'),
(26, 'Clamoxyl', 'Antibiotique pour infections bactériennes', 60, 40, '2027-01-01', 'clamoxyl.jpg'),
(27, 'Biafine', 'Crème pour brûlures et irritations de la peau', 55, 35, '2027-07-01', 'biafine.jpg'),
(28, 'Fervex', 'Traitement contre les symptômes du rhume et grippe', 38, 65, '2027-07-01', 'fervex.jpg'),
(29, 'Actifed', 'Médicament pour rhume et congestion nasale', 33, 75, '2027-12-01', 'actifed.jpg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
