-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 17, 2025 alle 18:58
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
(1, 'Alperen', 'Sengun', 'C', 1, 1133822, 7.5),
(2, 'Fred', 'VanVleet', 'G', 1, 846972, 7.4),
(3, 'Jabari', 'Smith', 'F', 1, 1178599, 7),
(4, 'Dillon', 'Brooks', 'GF', 1, 885254, 7.1),
(5, 'Jalen', 'Green', 'G', 1, 1133838, 6),
(6, 'Tari', 'Eason', 'F', 1, 1178696, 6.5),
(7, 'Reed', 'Sheppard', 'G', 1, 1599611, 6.8),
(8, 'Jeff', 'Green', 'F', 1, 817126, 6.2),
(9, 'Steven', 'Adams', 'C', 1, 816938, 0),
(10, 'Aaron\r\n', 'Holiday', 'G', 1, 940789, 0),
(11, 'Jock', 'Landale', 'C', 1, 954950, 0),
(12, 'Jae\'Sean', 'Tate', 'F', 1, 1092887, 0),
(13, 'Cody', 'Zeller', 'FC', 1, 817464, 0),
(14, 'Cam', 'Whitmore', 'F', 1, 1433908, 0),
(15, 'Jimmy', 'Butler', 'F', 2, 817017, 0),
(16, 'Stephen', 'Curry', 'G', 2, 817050, 0),
(17, 'Draymond', 'Green', 'F', 2, 817122, 0),
(18, 'Jonathan', 'Kuminga', 'F', 2, 1132126, 0),
(19, 'Buddy', 'Hield', 'G', 2, 846905, 0),
(20, 'Brandin', 'Podziemski', 'G', 2, 1178388, 0),
(21, 'Moses', 'Moody', 'G', 2, 1132134, 0),
(22, 'Trayce', 'Jackson-Davis', 'FC', 2, 1178292, 0),
(23, 'Kevon', 'Looney', 'F', 2, 817235, 0),
(24, 'Gary', 'Payton II', 'G', 2, 855982, 0),
(25, 'Lindy', 'Waters III', 'G', 2, 1182205, 0),
(26, 'Pat', 'Spencer', 'G', 2, 1392409, 0),
(27, 'Taran', 'Armstrong', 'G', 2, 1181902, 0),
(28, 'Gui', 'Santos', 'F', 2, 1386098, 0),
(29, 'Quinten', 'Post', 'F', 2, 1178523, 0),
(30, 'Kevin', 'Knox', 'F', 2, 940782, 0),
(31, 'Jackson', 'Rowe', 'F', 2, 1409161, 0);

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
  `id` int(11) NOT NULL,
  `idUtente` int(11) NOT NULL,
  `idGiocatore` int(11) NOT NULL,
  `prezzo` float NOT NULL,
  `data` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `squadrautente`
--

INSERT INTO `squadrautente` (`id`, `idUtente`, `idGiocatore`, `prezzo`, `data`) VALUES
(1, 1, 1, 7.5, '2025-04-17 18:39:51');

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
  `nomeSquadra` varchar(255) NOT NULL,
  `logoSquadra` varchar(255) NOT NULL,
  `crediti` int(11) NOT NULL DEFAULT 800
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`id`, `username`, `password`, `email`, `apiKey`, `nomeSquadra`, `logoSquadra`, `crediti`) VALUES
(1, 'pippo', 'avsd', 'vads', '809720-0bf3f4-516349-fc0074-b5e278', 'pippo', 'pippo.jpg', 720);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `giocatore`
--
ALTER TABLE `giocatore`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk1` (`idSquadra`);

--
-- Indici per le tabelle `squadra`
--
ALTER TABLE `squadra`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `squadrautente`
--
ALTER TABLE `squadrautente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk2` (`idGiocatore`),
  ADD KEY `fk3` (`idUtente`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api-key` (`apiKey`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `giocatore`
--
ALTER TABLE `giocatore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

--
-- AUTO_INCREMENT per la tabella `squadra`
--
ALTER TABLE `squadra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `squadrautente`
--
ALTER TABLE `squadrautente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `giocatore`
--
ALTER TABLE `giocatore`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`idSquadra`) REFERENCES `squadra` (`id`);

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
