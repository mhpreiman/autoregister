-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2017 at 12:24 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `khk_andmebaasid`
--

-- --------------------------------------------------------

--
-- Table structure for table `auto`
--

CREATE TABLE `auto` (
  `auto_id` int(11) NOT NULL,
  `mark` tinytext,
  `regnr` varchar(9) NOT NULL,
  `aasta` year(4) NOT NULL,
  `regpiirk` int(10) NOT NULL,
  `L_O_kuup` date DEFAULT NULL,
  `L_O_osaline` set('kannataja','tekitaja') DEFAULT NULL,
  `K_koef` float UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auto`
--

INSERT INTO `auto` (`auto_id`, `mark`, `regnr`, `aasta`, `regpiirk`, `L_O_kuup`, `L_O_osaline`, `K_koef`) VALUES
(1, 'audi', '402730845', 2004, 4, NULL, NULL, 0.59),
(2, 'ford', '105136794', 2001, 1, '2017-01-03', 'tekitaja', 1.8),
(3, 'lada', '484987201', 1998, 8, '2016-12-13', 'kannataja', 0.4),
(4, 'ford', '100546591', 1989, 5, NULL, NULL, 1.2),
(5, 'bmw', '407454501', 1997, 9, '2017-01-10', 'tekitaja', 0.705),
(6, 'opel', '301937541', 2016, 11, NULL, NULL, 1.8),
(44, 'audi', '105487314', 1998, 10, NULL, NULL, 1.15),
(59, 'bentley', '964957212', 2012, 12, '2017-01-10', 'kannataja', 0.92),
(60, 'citroen', '421415950', 2005, 3, '2016-12-13', 'tekitaja', 2.445),
(61, 'toyota', '055153271', 2003, 5, NULL, NULL, 0.2),
(62, 'mitsubishi', '940234682', 1996, 2, NULL, NULL, 0.85),
(79, 'bmw', 'efe545454', 2000, 3, NULL, NULL, NULL);

--
-- Triggers `auto`
--
DELIMITER $$
CREATE TRIGGER `trigger_auto_delete_logi` BEFORE DELETE ON `auto` FOR EACH ROW BEGIN
INSERT INTO logi (toiming, aeg, auto_id, mark, regnr, aasta, regpiirk)
 	SELECT 'delete', NOW(), auto_id, mark, regnr, aasta, regpiirk
  	FROM auto
 	WHERE regnr = OLD.regnr;
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_auto_insert_logi` AFTER INSERT ON `auto` FOR EACH ROW BEGIN
  INSERT INTO logi (toiming, aeg, auto_id, mark, regnr, aasta, regpiirk)
  SELECT 'insert', NOW(), auto_id, mark, regnr,  aasta,  regpiirk
  FROM auto WHERE auto_id = (select max(auto_id) from auto);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_auto_update_logi` BEFORE UPDATE ON `auto` FOR EACH ROW BEGIN
IF (OLD.L_O_kuup IS NULL
AND
NEW.L_O_kuup IS NOT NULL 
AND 
NEW.L_O_osaline = 'tekitaja'
)
THEN 
SET NEW.K_koef = (OLD.K_koef * 1.5);
	END IF;
INSERT INTO logi (toiming, aeg, auto_id, mark, regnr, aasta, regpiirk, L_O_kuup, L_O_osaline, K_koef)
 	SELECT 'update', NOW(), OLD.auto_id, OLD.mark, OLD.regnr, OLD.aasta, OLD.regpiirk,
OLD.L_O_kuup, OLD.L_O_osaline, OLD.K_koef
  	FROM auto
 	WHERE regnr = OLD.regnr;
	

	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `linnad`
--

CREATE TABLE `linnad` (
  `linnid` int(11) NOT NULL,
  `nimi` varchar(50) CHARACTER SET latin1 NOT NULL,
  `rahvaarv` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `linnad`
--

INSERT INTO `linnad` (`linnid`, `nimi`, `rahvaarv`) VALUES
(1, 'Tallinn', 401821),
(2, 'Tartu', 98214),
(3, 'P&auml;rnu', 43669),
(4, 'Valga', 14890),
(5, 'Viljandi', 17473),
(6, 'J&otilde;geva', 5517),
(7, 'Rakvere', 15591),
(8, 'Kuressaare', 13386);

-- --------------------------------------------------------

--
-- Table structure for table `logi`
--

CREATE TABLE `logi` (
  `id` int(15) NOT NULL,
  `auto_id` int(15) DEFAULT NULL,
  `toiming` varchar(10) NOT NULL,
  `aeg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mark` tinytext,
  `regnr` char(9) NOT NULL,
  `aasta` year(4) NOT NULL,
  `regpiirk` int(11) NOT NULL,
  `L_O_kuup` date DEFAULT NULL,
  `L_O_osaline` set('kannataja','tekitaja') DEFAULT NULL,
  `K_koef` float(2,2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logi`
--

INSERT INTO `logi` (`id`, `auto_id`, `toiming`, `aeg`, `mark`, `regnr`, `aasta`, `regpiirk`, `L_O_kuup`, `L_O_osaline`, `K_koef`) VALUES
(347, 3, 'update', '2017-01-27 01:35:21', 'lada', '484987201', 1998, 6, NULL, NULL, 0.40),
(348, 61, 'insert', '2017-01-25 14:29:14', 'toyota', '055153271', 2003, 5, NULL, NULL, NULL),
(349, 62, 'insert', '2017-01-25 14:29:14', 'mitsubishi', '940234682', 1996, 2, NULL, NULL, NULL),
(350, 61, 'update', '2017-01-25 14:29:56', 'toyota', '055153271', 2003, 5, NULL, NULL, NULL),
(352, 3, 'update', '2017-01-25 14:30:39', 'lada', '484987201', 1998, 8, NULL, NULL, 0.40),
(353, 5, 'update', '2017-01-27 01:35:27', 'bmw', '407454501', 1997, 3, NULL, NULL, 0.47),
(354, 60, 'update', '2017-01-25 14:31:55', 'citroen', '421415950', 2005, 3, NULL, NULL, 1.63),
(355, 59, 'update', '2017-01-27 01:35:11', 'bentley', '964957212', 2012, 1, NULL, NULL, 0.92),
(356, 2, 'update', '2017-01-25 14:32:15', 'ford', '105136794', 2001, 1, NULL, NULL, 1.20),
(357, 4, 'update', '2017-01-25 14:32:59', 'ford', '100546591', 1989, 5, NULL, NULL, 3.20),
(358, 59, 'update', '2017-01-27 01:35:04', 'bentley', '964957212', 2012, 5, NULL, 'kannataja', 0.92),
(359, 5, 'update', '2017-01-27 01:35:47', 'bmw', '407454501', 1997, 4, NULL, 'tekitaja', 0.47),
(360, 3, 'update', '2017-01-25 14:33:33', 'lada', '484987201', 1998, 8, NULL, 'kannataja', 0.40),
(361, 60, 'update', '2017-01-25 14:33:44', 'citroen', '421415950', 2005, 3, NULL, 'tekitaja', 1.63),
(362, 2, 'update', '2017-01-25 14:34:01', 'ford', '105136794', 2001, 1, NULL, 'tekitaja', 1.20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`auto_id`);

--
-- Indexes for table `linnad`
--
ALTER TABLE `linnad`
  ADD PRIMARY KEY (`linnid`);

--
-- Indexes for table `logi`
--
ALTER TABLE `logi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auto`
--
ALTER TABLE `auto`
  MODIFY `auto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT for table `linnad`
--
ALTER TABLE `linnad`
  MODIFY `linnid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `logi`
--
ALTER TABLE `logi`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=408;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
