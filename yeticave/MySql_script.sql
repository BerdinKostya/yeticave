-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:6600
-- Время создания: Мар 28 2020 г., 00:23
-- Версия сервера: 5.6.38
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yeticave`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Bet`
--

CREATE TABLE `Bet` (
  `bet_id` int(11) NOT NULL,
  `bet_date` date NOT NULL,
  `bet_amount` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lot_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Category`
--

CREATE TABLE `Category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Lot`
--

CREATE TABLE `Lot` (
  `lot_id` int(11) NOT NULL,
  `lot_name` varchar(45) NOT NULL,
  `lot_description` varchar(45) DEFAULT NULL,
  `lot_image` blob,
  `lot_start_price` int(11) NOT NULL,
  `finish_date` date DEFAULT NULL,
  `bid_step` int(11) NOT NULL,
  `autor` int(11) NOT NULL,
  `winner` int(11) NOT NULL,
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `User`
--

CREATE TABLE `User` (
  `User_id` int(11) NOT NULL,
  `registration_date` datetime NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `user_password` varchar(45) NOT NULL,
  `user_avatar` blob,
  `contact_information` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Bet`
--
ALTER TABLE `Bet`
  ADD PRIMARY KEY (`bet_id`),
  ADD KEY `Lot_user_idx` (`user_id`),
  ADD KEY `Bet_lot_idx` (`lot_id`);

--
-- Индексы таблицы `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `Lot`
--
ALTER TABLE `Lot`
  ADD PRIMARY KEY (`lot_id`),
  ADD KEY `Lot_user_idx` (`autor`),
  ADD KEY `Lot_winner_idx` (`winner`),
  ADD KEY `Lot_category_idx` (`category`);

--
-- Индексы таблицы `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`User_id`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Bet`
--
ALTER TABLE `Bet`
  ADD CONSTRAINT `Bet_lot` FOREIGN KEY (`lot_id`) REFERENCES `Lot` (`lot_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Bet_user` FOREIGN KEY (`user_id`) REFERENCES `User` (`User_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `Lot`
--
ALTER TABLE `Lot`
  ADD CONSTRAINT `Lot_autor` FOREIGN KEY (`autor`) REFERENCES `User` (`User_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Lot_category` FOREIGN KEY (`category`) REFERENCES `Category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Lot_winner` FOREIGN KEY (`winner`) REFERENCES `User` (`User_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
