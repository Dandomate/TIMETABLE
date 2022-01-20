-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Jan 20. 18:44
-- Kiszolgáló verziója: 10.4.22-MariaDB
-- PHP verzió: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `orarend`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `diak`
--

CREATE TABLE `diak` (
  `OMA_DIAK` int(10) NOT NULL,
  `Nev` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `OSZTALY_ID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `diak`
--

INSERT INTO `diak` (`OMA_DIAK`, `Nev`, `OSZTALY_ID`) VALUES
(121001, 'Zsoltika', 1),
(213321, 'Janoska', 2),
(1232121, 'Mateka', 1),
(21312312, 'Mark', 0),
(75327421, 'Martina', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orarend`
--

CREATE TABLE `orarend` (
  `ORAREND_ID` int(3) NOT NULL,
  `TANTARGY_ID` int(3) NOT NULL,
  `OSZTALY_ID` int(3) NOT NULL,
  `AJTOSZAM_ID` int(3) NOT NULL,
  `Nap` varchar(10) COLLATE utf8_hungarian_ci NOT NULL,
  `Hanyadikora` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `orarend`
--

INSERT INTO `orarend` (`ORAREND_ID`, `TANTARGY_ID`, `OSZTALY_ID`, `AJTOSZAM_ID`, `Nap`, `Hanyadikora`) VALUES
(1, 2, 0, 102, 'Hétfő', 1),
(2, 2, 0, 102, 'Hétfő', 2),
(3, 1, 2, 3, 'Hétfő', 1),
(4, 1, 2, 3, 'Hétfő', 2),
(5, 3, 2, 202, 'Hétfő', 3),
(6, 4, 0, 201, 'Hétfő', 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `osztaly`
--

CREATE TABLE `osztaly` (
  `OSZTALY_ID` int(3) NOT NULL,
  `Osztaly` varchar(10) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `osztaly`
--

INSERT INTO `osztaly` (`OSZTALY_ID`, `Osztaly`) VALUES
(0, '2/14C'),
(2, '12');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tanar`
--

CREATE TABLE `tanar` (
  `OMA_TANAR` int(10) NOT NULL,
  `Nev` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `Tel` int(10) NOT NULL,
  `jelszo` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `Admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tanar`
--

INSERT INTO `tanar` (`OMA_TANAR`, `Nev`, `Tel`, `jelszo`, `Admin`) VALUES
(751234567, 'Bakti András', 6201121, '', 0),
(759576543, 'Huri Gábor', 6202233, '', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tanartargyai`
--

CREATE TABLE `tanartargyai` (
  `TANTARGY_ID` int(11) NOT NULL,
  `TARGY_ID` int(3) NOT NULL,
  `OMA_TANAR` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tanartargyai`
--

INSERT INTO `tanartargyai` (`TANTARGY_ID`, `TARGY_ID`, `OMA_TANAR`) VALUES
(1, 1, 751234567),
(2, 1, 759576543),
(3, 2, 751234567),
(4, 2, 759576543);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tantargy`
--

CREATE TABLE `tantargy` (
  `TARGY_ID` int(3) NOT NULL,
  `tantargy_neve` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tantargy`
--

INSERT INTO `tantargy` (`TARGY_ID`, `tantargy_neve`) VALUES
(1, 'IKT'),
(2, 'ADATBAZIS'),
(3, 'Ének'),
(4, 'Rajz'),
(5, 'Töri');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tanterem`
--

CREATE TABLE `tanterem` (
  `AJTOSZAM_ID` int(3) NOT NULL,
  `Ferohely` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tanterem`
--

INSERT INTO `tanterem` (`AJTOSZAM_ID`, `Ferohely`) VALUES
(3, 32),
(102, 36),
(201, 12),
(202, 16);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `diak`
--
ALTER TABLE `diak`
  ADD PRIMARY KEY (`OMA_DIAK`),
  ADD KEY `OSZTALY` (`OSZTALY_ID`);

--
-- A tábla indexei `orarend`
--
ALTER TABLE `orarend`
  ADD PRIMARY KEY (`ORAREND_ID`),
  ADD KEY `TANTARGY_ID` (`TANTARGY_ID`,`OSZTALY_ID`,`AJTOSZAM_ID`),
  ADD KEY `OSZTALY_ID` (`OSZTALY_ID`),
  ADD KEY `AJTOSZAM_ID` (`AJTOSZAM_ID`);

--
-- A tábla indexei `osztaly`
--
ALTER TABLE `osztaly`
  ADD PRIMARY KEY (`OSZTALY_ID`);

--
-- A tábla indexei `tanar`
--
ALTER TABLE `tanar`
  ADD PRIMARY KEY (`OMA_TANAR`);

--
-- A tábla indexei `tanartargyai`
--
ALTER TABLE `tanartargyai`
  ADD PRIMARY KEY (`TANTARGY_ID`),
  ADD KEY `OMA_TANAR` (`OMA_TANAR`),
  ADD KEY `TARGY_ID` (`TARGY_ID`);

--
-- A tábla indexei `tantargy`
--
ALTER TABLE `tantargy`
  ADD PRIMARY KEY (`TARGY_ID`);

--
-- A tábla indexei `tanterem`
--
ALTER TABLE `tanterem`
  ADD PRIMARY KEY (`AJTOSZAM_ID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `orarend`
--
ALTER TABLE `orarend`
  MODIFY `ORAREND_ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `tanartargyai`
--
ALTER TABLE `tanartargyai`
  MODIFY `TANTARGY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `tantargy`
--
ALTER TABLE `tantargy`
  MODIFY `TARGY_ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `orarend`
--
ALTER TABLE `orarend`
  ADD CONSTRAINT `orarend_ibfk_1` FOREIGN KEY (`OSZTALY_ID`) REFERENCES `osztaly` (`OSZTALY_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orarend_ibfk_2` FOREIGN KEY (`TANTARGY_ID`) REFERENCES `tanartargyai` (`TANTARGY_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orarend_ibfk_3` FOREIGN KEY (`AJTOSZAM_ID`) REFERENCES `tanterem` (`AJTOSZAM_ID`) ON UPDATE CASCADE;

--
-- Megkötések a táblához `osztaly`
--
ALTER TABLE `osztaly`
  ADD CONSTRAINT `osztaly_ibfk_1` FOREIGN KEY (`OSZTALY_ID`) REFERENCES `diak` (`OSZTALY_ID`) ON UPDATE CASCADE;

--
-- Megkötések a táblához `tanartargyai`
--
ALTER TABLE `tanartargyai`
  ADD CONSTRAINT `tanartargyai_ibfk_1` FOREIGN KEY (`OMA_TANAR`) REFERENCES `tanar` (`OMA_TANAR`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tanartargyai_ibfk_2` FOREIGN KEY (`TARGY_ID`) REFERENCES `tantargy` (`TARGY_ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
