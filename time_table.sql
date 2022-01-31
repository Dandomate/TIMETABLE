-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Jan 31. 21:05
-- Kiszolgáló verziója: 10.4.22-MariaDB
-- PHP verzió: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `time_table`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `class`
--

CREATE TABLE `class` (
  `CLASS_ID` int(3) NOT NULL,
  `Class` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `class`
--

INSERT INTO `class` (`CLASS_ID`, `Class`) VALUES
(1, '9'),
(2, '10'),
(3, '11'),
(4, '12'),
(5, '13'),
(6, '14');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `classroom`
--

CREATE TABLE `classroom` (
  `DOORNUMBER_ID` int(3) NOT NULL,
  `Door` varchar(10) NOT NULL,
  `Space` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `classroom`
--

INSERT INTO `classroom` (`DOORNUMBER_ID`, `Door`, `Space`) VALUES
(1, '1', 20),
(2, '2', 30),
(3, '3', 12),
(4, '4', 20),
(5, '5', 30),
(6, '6', 30);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `student`
--

CREATE TABLE `student` (
  `OMA_STUDENT` int(3) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `CLASS_ID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `student`
--

INSERT INTO `student` (`OMA_STUDENT`, `Name`, `CLASS_ID`) VALUES
(75346621, 'Péter Kiss', 1),
(75346622, 'Anna Tóth', 1),
(75346631, 'Flóra Pataki', 2),
(75346632, 'László Nagy', 2),
(75346641, 'Rita Tóth', 3),
(75346642, 'Kristóf Antal', 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `subject`
--

CREATE TABLE `subject` (
  `SUBJECT_ID` int(3) NOT NULL,
  `SubjectName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `subject`
--

INSERT INTO `subject` (`SUBJECT_ID`, `SubjectName`) VALUES
(1, 'DATABASE'),
(2, 'IKT'),
(3, 'FPET'),
(4, 'JAVA');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `teacher`
--

CREATE TABLE `teacher` (
  `OMA_TEACHER` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Phone` int(10) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Admin` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `teacher`
--

INSERT INTO `teacher` (`OMA_TEACHER`, `Name`, `Phone`, `Password`, `Admin`) VALUES
(711235670, 'Gábor Huri', 620123012, '', 1),
(711235671, 'András Bakti', 630210210, '', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `teachersubject`
--

CREATE TABLE `teachersubject` (
  `SUBJECT_TEACHER_ID` int(11) NOT NULL,
  `SUBJECT_ID` int(3) NOT NULL,
  `OMA_TEACHER` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `teachersubject`
--

INSERT INTO `teachersubject` (`SUBJECT_TEACHER_ID`, `SUBJECT_ID`, `OMA_TEACHER`) VALUES
(1, 1, 711235670),
(2, 2, 711235671);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `timetable`
--

CREATE TABLE `timetable` (
  `TIMETABLE_ID` int(3) NOT NULL,
  `SUBJECT_TEACHER_ID` int(3) NOT NULL,
  `CLASS_ID` int(3) NOT NULL,
  `DOORNUMBER_ID` int(3) NOT NULL,
  `Day` varchar(10) NOT NULL,
  `Lesson` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `timetable`
--

INSERT INTO `timetable` (`TIMETABLE_ID`, `SUBJECT_TEACHER_ID`, `CLASS_ID`, `DOORNUMBER_ID`, `Day`, `Lesson`) VALUES
(1, 1, 5, 5, 'Monday', 1),
(2, 2, 6, 6, 'Monday', 1);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`CLASS_ID`);

--
-- A tábla indexei `classroom`
--
ALTER TABLE `classroom`
  ADD PRIMARY KEY (`DOORNUMBER_ID`);

--
-- A tábla indexei `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`OMA_STUDENT`),
  ADD KEY `CLASS_ID` (`CLASS_ID`);

--
-- A tábla indexei `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`SUBJECT_ID`);

--
-- A tábla indexei `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`OMA_TEACHER`);

--
-- A tábla indexei `teachersubject`
--
ALTER TABLE `teachersubject`
  ADD PRIMARY KEY (`SUBJECT_TEACHER_ID`),
  ADD KEY `SUBJECT_ID` (`SUBJECT_ID`,`OMA_TEACHER`),
  ADD KEY `OMA_TEACHER` (`OMA_TEACHER`);

--
-- A tábla indexei `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`TIMETABLE_ID`),
  ADD KEY `SUBJECT_TEACHER_ID` (`SUBJECT_TEACHER_ID`,`CLASS_ID`,`DOORNUMBER_ID`),
  ADD KEY `DOORNUMBER_ID` (`DOORNUMBER_ID`),
  ADD KEY `CLASS_ID` (`CLASS_ID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `class`
--
ALTER TABLE `class`
  MODIFY `CLASS_ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `classroom`
--
ALTER TABLE `classroom`
  MODIFY `DOORNUMBER_ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `subject`
--
ALTER TABLE `subject`
  MODIFY `SUBJECT_ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `teachersubject`
--
ALTER TABLE `teachersubject`
  MODIFY `SUBJECT_TEACHER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `timetable`
--
ALTER TABLE `timetable`
  MODIFY `TIMETABLE_ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`CLASS_ID`) REFERENCES `class` (`CLASS_ID`) ON UPDATE CASCADE;

--
-- Megkötések a táblához `teachersubject`
--
ALTER TABLE `teachersubject`
  ADD CONSTRAINT `teachersubject_ibfk_1` FOREIGN KEY (`SUBJECT_ID`) REFERENCES `subject` (`SUBJECT_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `teachersubject_ibfk_2` FOREIGN KEY (`OMA_TEACHER`) REFERENCES `teacher` (`OMA_TEACHER`) ON UPDATE CASCADE;

--
-- Megkötések a táblához `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`DOORNUMBER_ID`) REFERENCES `classroom` (`DOORNUMBER_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `timetable_ibfk_2` FOREIGN KEY (`CLASS_ID`) REFERENCES `class` (`CLASS_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `timetable_ibfk_3` FOREIGN KEY (`SUBJECT_TEACHER_ID`) REFERENCES `teachersubject` (`SUBJECT_TEACHER_ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
