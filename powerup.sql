-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 20. Jun 2023 um 19:15
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
(7, '40115', 'schuckspecht'),
(8, '40111', 'Test'),
(9, '40113', 'Test'),
(10, '40116', 'schuckspecht'),
(11, '67064', 'schuckspecht');

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
(44, 'Wicked Ametrine', 'jc', '40156', 'orange'),
(46, 'Sunforged Breastplate', 'bc', '47593', NULL),
(47, 'Protectors of Life', 'bc', '49905', NULL),
(48, 'Hellfrozen Bonegrinders', 'bc', '49906', NULL),
(49, 'Boots of Kingly Upheaval', 'bc', '49907', NULL),
(50, 'Puresteel Legplates', 'bc', '49902', NULL),
(51, 'Pillars of Might', 'bc', '49904', NULL),
(52, 'Legplates of Painful Death', 'bc', '49903', NULL),
(53, 'Titanium Spikeguards', 'bc', '47572', NULL),
(54, 'Sunforged Bracers', 'bc', '47574', NULL),
(55, 'Saronite Swordbreakers', 'bc', '47570', NULL),
(56, 'Deathchill Cloak', 'tr', '41610', NULL),
(57, 'Wispcloak', 'tr', '41609', NULL),
(58, 'Royal Moonshroud Robe', 'tr', '47605', NULL),
(59, 'Merlin\'s Robe', 'tr', '47603', NULL),
(60, 'Sandals of Consecration', 'tr', '49893', NULL),
(61, 'Deathfrost Boots', 'tr', '49890', NULL),
(62, 'Lightweave Leggings', 'tr', '49892', NULL),
(63, 'Leggings of Woven Death', 'tr', '49891', NULL),
(64, 'Royal Moonshroud Bracers', 'tr', '47587', NULL),
(65, 'Bejeweled Wizard\'s Bracers', 'tr', '47585', NULL),
(66, 'Lunar Eclipse Robes', 'lw', '47602', NULL),
(67, 'Knightbane Carapace', 'lw', '47599', NULL),
(68, 'Footpads of Impending Death', 'lw', '49895', NULL),
(69, 'Blessed Cenarion Boots', 'lw', '49894', NULL),
(70, 'Legwraps of Unleashed Nature', 'lw', '49898', NULL),
(71, 'Bladeborn Leggings', 'lw', '49899', NULL),
(72, 'Moonshadow Armguards', 'lw', '47583', NULL),
(73, 'Bracers of Swift Death', 'lw', '47581', NULL),
(74, 'Dazzling Eye of Zul', 'jc', '40175', 'green'),
(75, 'Enduring Eye of Zul', 'jc', '40167', 'green'),
(76, 'Energized Eye of Zul', 'jc', '40179', 'green'),
(77, 'Forceful Eye of Zul', 'jc', '40169', 'green'),
(78, 'Intricate Eye of Zul', 'jc', '40174', 'green'),
(79, 'Jagged Eye of Zul', 'jc', '40165', 'green'),
(80, 'Lambient Eye of Zul', 'jc', '40177', 'green'),
(81, 'Misty Eye of Zul', 'jc', '40171', 'green'),
(82, 'Opaque Eye of Zul', 'jc', '40178', 'green'),
(83, 'Radiant Eye of Zul', 'jc', '40180', 'green'),
(84, 'Seer\'s Eye of Zul', 'jc', '40170', 'green'),
(85, 'Shattered Eye of Zul', 'jc', '40182', 'green'),
(86, 'Shining Eye of Zul', 'jc', '40172', 'green'),
(87, 'Steady Eye of Zul', 'jc', '40168', 'green'),
(88, 'Sundered Eye of Zul', 'jc', '40176', 'green'),
(89, 'Tense Eye of Zul', 'jc', '40181', 'green'),
(90, 'Timeless Eye of Zul', 'jc', '40164', 'green'),
(91, 'Turbid Eye of Zul', 'jc', '40173', 'green'),
(92, 'Vivid Eye of Zul', 'jc', '40166', 'green'),
(93, 'Balanced Dreadstone', 'jc', '40136', 'purple'),
(94, 'Defender\'s Dreadstone', 'jc', '40139', 'purple'),
(95, 'Glowing Dreadstone', 'jc', '40132', 'purple'),
(96, 'Guardian\'s Dreadstone', 'jc', '40141', 'purple'),
(97, 'Infused Dreadstone', 'jc', '40137', 'purple'),
(98, 'Mysterious Dreadstone', 'jc', '40135', 'purple'),
(99, 'Puissant Dreadstone', 'jc', '40140', 'purple'),
(100, 'Purified Dreadstone', 'jc', '40133', 'purple'),
(101, 'Regal Dreadstone', 'jc', '40138', 'purple'),
(102, 'Royal Dreadstone', 'jc', '40134', 'purple'),
(103, 'Shifting Dreadstone', 'jc', '40130', 'purple'),
(104, 'Sovereign Dreadstone', 'jc', '40129', 'purple'),
(105, 'Tenuous Dreadstone', 'jc', '40131', 'purple');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `crafting_recipes`
--
ALTER TABLE `crafting_recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
