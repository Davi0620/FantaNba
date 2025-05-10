-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 10, 2025 alle 09:56
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fantanba`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `giocatore`
--

CREATE TABLE `giocatore` (
  `id` int(11) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `Cognome` varchar(255) NOT NULL,
  `Posizione` varchar(2) NOT NULL,
  `idSquadra` int(11) NOT NULL,
  `idApi` int(11) NOT NULL,
  `Valutazione` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `giocatore`
--

INSERT INTO `giocatore` (`id`, `Nome`, `Cognome`, `Posizione`, `idSquadra`, `idApi`, `Valutazione`) VALUES
(1, 'Alperen', 'Sengun', 'C', 1, 1133822, 72),
(2, 'Fred', 'VanVleet', 'G', 1, 846972, 72),
(3, 'Jabari', 'Smith', 'F', 1, 1178599, 60),
(4, 'Dillon', 'Brooks', 'GF', 1, 885254, 61),
(5, 'Jalen', 'Green', 'G', 1, 1133838, 65),
(6, 'Tari', 'Eason', 'F', 1, 1178696, 61),
(7, 'Reed', 'Sheppard', 'G', 1, 1599611, 55),
(8, 'Jeff', 'Green', 'F', 1, 817126, 55),
(9, 'Steven', 'Adams', 'C', 1, 816938, 60),
(10, 'Aaron\r\n', 'Holiday', 'G', 1, 940789, 55),
(11, 'Jock', 'Landale', 'C', 1, 954950, 55),
(12, 'Jae\'Sean', 'Tate', 'F', 1, 1092887, 55),
(13, 'Cody', 'Zeller', 'FC', 1, 817464, 55),
(14, 'Cam', 'Whitmore', 'F', 1, 1433908, 55),
(15, 'Jimmy', 'Butler', 'F', 2, 817017, 82),
(16, 'Stephen', 'Curry', 'G', 2, 817050, 86),
(17, 'Draymond', 'Green', 'F', 2, 817122, 79),
(18, 'Jonathan', 'Kuminga', 'F', 2, 1132126, 48),
(19, 'Buddy', 'Hield', 'G', 2, 846905, 100),
(20, 'Brandin', 'Podziemski', 'G', 2, 1178388, 61),
(21, 'Moses', 'Moody', 'G', 2, 1132134, 50),
(22, 'Trayce', 'Jackson-Davis', 'FC', 2, 1178292, 55),
(23, 'Kevon', 'Looney', 'F', 2, 817235, 63),
(24, 'Gary', 'Payton II', 'G', 2, 855982, 62),
(25, 'Lindy', 'Waters III', 'G', 2, 1182205, 55),
(26, 'Pat', 'Spencer', 'G', 2, 1392409, 55),
(27, 'Taran', 'Armstrong', 'G', 2, 1181902, 55),
(28, 'Gui', 'Santos', 'F', 2, 1386098, 55),
(29, 'Quinten', 'Post', 'F', 2, 1178523, 55),
(30, 'Kevin', 'Knox', 'F', 2, 940782, 55),
(31, 'Jackson', 'Rowe', 'F', 2, 1409161, 55),
(332, 'Steve', 'Kerr', 'A', 2, 794632, 55),
(333, 'Ime', 'Udoka', 'A', 1, 796108, 55);

-- --------------------------------------------------------

--
-- Struttura della tabella `partite`
--

CREATE TABLE `partite` (
  `id` int(11) NOT NULL,
  `idPartita` int(11) NOT NULL,
  `idCasa` int(11) NOT NULL,
  `idOspite` int(11) NOT NULL,
  `puntiCasa` int(11) DEFAULT NULL,
  `puntiOspite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `partite`
--

INSERT INTO `partite` (`id`, `idPartita`, `idCasa`, `idOspite`, `puntiCasa`, `puntiOspite`) VALUES
(1, 13753661, 3412, 3428, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `squadra`
--

CREATE TABLE `squadra` (
  `id` int(11) NOT NULL,
  `Nome` varchar(25) NOT NULL,
  `idAPI` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `squadra`
--

INSERT INTO `squadra` (`id`, `Nome`, `idAPI`) VALUES
(1, 'Houston Rockets', 3412),
(2, 'Golden State Warriors', 3428);

-- --------------------------------------------------------

--
-- Struttura della tabella `squadrautente`
--

CREATE TABLE `squadrautente` (
  `idUtente` int(11) NOT NULL,
  `idGiocatore` int(11) NOT NULL,
  `prezzo` float NOT NULL,
  `data` datetime NOT NULL DEFAULT current_timestamp(),
  `posizione` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `squadrautente`
--

INSERT INTO `squadrautente` (`idUtente`, `idGiocatore`, `prezzo`, `data`, `posizione`) VALUES
(2, 1, 75, '2025-04-24 17:10:11', 0),
(2, 2, 82, '2025-05-10 08:48:13', 6),
(2, 3, 68, '2025-05-10 08:48:25', 1),
(2, 7, 55, '2025-05-10 08:49:13', 5),
(2, 9, 70, '2025-05-10 08:48:20', 10),
(2, 11, 55, '2025-05-10 08:49:05', 2),
(2, 13, 55, '2025-05-10 08:54:17', 9),
(2, 17, 68, '2025-05-10 08:47:31', 8),
(2, 20, 84, '2025-05-10 08:48:08', 7),
(2, 21, 60, '2025-05-10 08:49:11', 4),
(2, 23, 55, '2025-05-10 08:49:08', 3),
(2, 332, 55, '2025-05-10 09:24:34', 11),
(7, 1, 79, '2025-05-10 09:37:01', 2),
(7, 7, 55, '2025-05-10 09:37:13', 6),
(7, 8, 55, '2025-05-10 09:37:22', 8),
(7, 10, 55, '2025-05-10 09:37:06', 4),
(7, 11, 55, '2025-05-10 09:37:26', 10),
(7, 15, 82, '2025-05-10 09:36:47', 1),
(7, 17, 70, '2025-05-10 09:37:03', 3),
(7, 19, 44, '2025-05-10 09:37:19', 7),
(7, 21, 65, '2025-05-10 09:37:09', 5),
(7, 22, 55, '2025-05-10 09:37:24', 9),
(7, 332, 53, '2025-05-10 09:37:29', 11);

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `apiKey` char(34) NOT NULL,
  `nomeSquadra` varchar(255) DEFAULT NULL,
  `logoSquadra` varchar(255) DEFAULT NULL,
  `crediti` int(11) NOT NULL DEFAULT 800,
  `gestore` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`id`, `username`, `password`, `email`, `apiKey`, `nomeSquadra`, `logoSquadra`, `crediti`, `gestore`) VALUES
(2, 'pippoTest', '202cb962ac59075b964b07152d234b70', 'test@test.it', '044e5d-324071-e12ab0-40050c-93c4e5', 'pippo', 'http://localhost/progettoNBA/immagini/1.jpg', 145, 1),
(7, 'pippo2', '202cb962ac59075b964b07152d234b70', 'tesy@t.cpm', '61416e-5d7ee6-75fb5a-83e132-5b265d', 'test', '4.jpg', 132, 0);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `giocatore`
--
ALTER TABLE `giocatore`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idApi` (`idApi`),
  ADD KEY `fk1` (`idSquadra`);

--
-- Indici per le tabelle `partite`
--
ALTER TABLE `partite`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idPartita` (`idPartita`),
  ADD KEY `fk4` (`idCasa`),
  ADD KEY `fk5` (`idOspite`);

--
-- Indici per le tabelle `squadra`
--
ALTER TABLE `squadra`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idAPI` (`idAPI`);

--
-- Indici per le tabelle `squadrautente`
--
ALTER TABLE `squadrautente`
  ADD PRIMARY KEY (`idUtente`,`idGiocatore`),
  ADD KEY `fk2` (`idGiocatore`),
  ADD KEY `fk3` (`idUtente`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api-key` (`apiKey`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `giocatore`
--
ALTER TABLE `giocatore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=334;

--
-- AUTO_INCREMENT per la tabella `partite`
--
ALTER TABLE `partite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `squadra`
--
ALTER TABLE `squadra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `giocatore`
--
ALTER TABLE `giocatore`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`idSquadra`) REFERENCES `squadra` (`id`);

--
-- Limiti per la tabella `partite`
--
ALTER TABLE `partite`
  ADD CONSTRAINT `fk4` FOREIGN KEY (`idCasa`) REFERENCES `squadra` (`idAPI`),
  ADD CONSTRAINT `fk5` FOREIGN KEY (`idOspite`) REFERENCES `squadra` (`idAPI`);

--
-- Limiti per la tabella `squadrautente`
--
ALTER TABLE `squadrautente`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`idGiocatore`) REFERENCES `giocatore` (`id`),
  ADD CONSTRAINT `fk3` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
