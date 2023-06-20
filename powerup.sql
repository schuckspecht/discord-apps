-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 20. Jun 2023 um 17:39
-- Server-Version: 10.4.28-MariaDB
-- PHP-Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `powerup`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `crafting_characters`
--

CREATE TABLE `crafting_characters` (
  `id` int(11) NOT NULL,
  `crafting_recipe_ID` varchar(255) NOT NULL,
  `crafting_character` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `crafting_characters`
--

INSERT INTO `crafting_characters` (`id`, `crafting_recipe_ID`, `crafting_character`) VALUES
(1, '40114', 'Eitrí'),
(2, '40114', 'Cazzac'),
(3, '40112', 'Eitrí'),
(4, '47585', 'Laea'),
(5, '40111', 'Laea'),
(6, '40111', 'Cazzac'),
(7, '40115', 'schuckspecht');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `crafting_recipes`
--

CREATE TABLE `crafting_recipes` (
  `id` int(11) NOT NULL,
  `recipe_name` varchar(255) NOT NULL,
  `recipe_profession` varchar(255) NOT NULL,
  `recipe_ID` varchar(255) NOT NULL,
  `jc_color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `crafting_recipes`
--

INSERT INTO `crafting_recipes` (`id`, `recipe_name`, `recipe_profession`, `recipe_ID`, `jc_color`) VALUES
(1, 'Bold Cardinal Ruby', 'jc', '40111', 'red'),
(2, 'Bright Cardinal Ruby', 'jc', '40114', 'red'),
(3, 'Delicate Cardinal Ruby', 'jc', '40112', 'red'),
(4, 'Flashing Cardinal Ruby', 'jc', '40116', 'red'),
(5, 'Fractured Cardinal Ruby', 'jc', '40117', 'red'),
(6, 'Precise Cardinal Ruby', 'jc', '40118', 'red'),
(7, 'Runed Cardinal Ruby', 'jc', '40113', 'red'),
(8, 'Subtle Cardinal Ruby', 'jc', '40115', 'red'),
(9, 'Bejeweled Wizard\'s Bracers', 'jc', '47585', ''),
(10, 'Brilliant King\'s Amber', 'jc', '40123', 'yellow'),
(11, 'Jeeves', 'en', '68067', ''),
(12, 'Mystic King\'s Amber', 'jc', '40127', 'yellow'),
(13, 'Quick King\'s Amber', 'jc', '40128', 'yellow'),
(14, 'Rigid King\'s Amber', 'jc', '40125', 'yellow'),
(15, 'Royal Moonshroud Robe', 'tr', '67064', ''),
(16, 'Smooth King\'s Amber', 'jc', '40124', 'yellow'),
(17, 'Thick King\'s Amber', 'jc', '40126', 'yellow'),
(18, 'Breastplate of the White Knight', 'bs', '47591', ''),
(19, 'Lustrous Majestic Zircon', 'jc', '40121', 'blue'),
(20, 'Solid Majestic Zircon', 'jc', '40119', 'blue'),
(21, 'Sparkling Majestic Zircon', 'jc', '40120', 'blue'),
(22, 'Stormy Majestic Zircon', 'jc', '40122', 'blue'),
(23, 'Accurate Ametrine', 'jc', '40162', 'orange'),
(24, 'Champion\'s Ametrine', 'jc', '40144', 'orange'),
(25, 'Deadly Ametrine', 'jc', '40147', 'orange'),
(26, 'Deft Ametrine', 'jc', '40150', 'orange'),
(27, 'Durable Ametrine', 'jc', '40154', 'orange'),
(28, 'Empowered Ametrine', 'jc', '40158', 'orange'),
(29, 'Etched Ametrine', 'jc', '40143', 'orange'),
(30, 'Fierce Ametrine', 'jc', '40146', 'orange'),
(31, 'Glimmering Ametrine', 'jc', '40161', 'orange'),
(32, 'Glinting Ametrine', 'jc', '40148', 'orange'),
(33, 'Inscribed Ametrine', 'jc', '40142', 'orange'),
(34, 'Lucent Ametrine', 'js', '40149', 'orange'),
(35, 'Luminous Ametrine', 'jc', '40151', 'orange'),
(36, 'Potent Ametrine', 'jc', '40152', 'orange'),
(37, 'Pristine Ametrine', 'jc', '40157', 'orange'),
(38, 'Reckless Ametrine', 'jc', '40155', 'orange'),
(39, 'Resolute Ametrine', 'jc', '40163', 'orange'),
(40, 'Resplendent Ametrine', 'jc', '40145', 'orange'),
(41, 'Stalwart Ametrine', 'jc', '40160', 'orange'),
(42, 'Stark Ametrine', 'jc', '40159', 'orange'),
(43, 'Veiled Ametrine', 'jc', '40153', 'orange'),
(44, 'Wicked Ametrine', 'jc', '40156', 'orange');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `crafting_characters`
--
ALTER TABLE `crafting_characters`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `crafting_recipes`
--
ALTER TABLE `crafting_recipes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `crafting_characters`
--
ALTER TABLE `crafting_characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `crafting_recipes`
--
ALTER TABLE `crafting_recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
