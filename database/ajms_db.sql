-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Гру 14 2022 р., 21:31
-- Версія сервера: 10.4.25-MariaDB
-- Версія PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `ajms_db`
--

-- --------------------------------------------------------

--
-- Структура таблиці `account_list`
--

CREATE TABLE `account_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `account_list`
--

INSERT INTO `account_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Кульчицький Ігор Михайлович', 'Персональна', 1, 0, '2022-02-01 10:09:26', '2022-12-14 21:47:40'),
(2, 'Озимак Іван Володимирович', 'Підприємець', 1, 0, '2022-02-01 10:09:40', '2022-12-14 21:46:00'),
(3, 'Ткач Перто Іванович', 'Підприємець', 1, 0, '2022-02-01 10:09:56', '2022-12-14 21:45:03'),
(4, 'Плітонов Олег Михайлович', 'Підприємець', 0, 0, '2022-02-01 10:10:22', '2022-12-14 21:45:19'),
(5, 'Климко Василь Антонович', 'Персональна', 0, 0, '2022-02-01 10:10:57', '2022-12-14 21:48:26'),
(50, 'Іванишин Артур Петрович', 'Підприємець', 1, 0, '2022-12-14 21:47:06', '2022-12-14 21:48:07');

-- --------------------------------------------------------

--
-- Структура таблиці `group_list`
--

CREATE TABLE `group_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = Персональна, 2= Підприємець',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=Inactive, 1= Active',
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = No, 1 = Yes ',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `group_list`
--

INSERT INTO `group_list` (`id`, `name`, `description`, `type`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'село Васильківці, Чортківського району', '53 км2', 2, 1, 0, '2022-02-01 09:56:35', '2022-12-14 13:08:47'),
(2, 'село Коцюбинці, Чортківського району', '5 км2', 1, 0, 0, '2022-02-01 09:57:45', '2022-12-14 13:10:32'),
(3, 'село Трибухівці, Бучацького району', '12 км2', 2, 1, 0, '2022-02-01 09:58:09', '2022-12-14 13:12:14'),
(4, 'село Конюхи, Козівського району', '42 км2', 2, 1, 0, '2022-02-01 09:58:34', '2022-12-14 13:21:09'),
(5, 'село Біла, Чотківського району', '16 км2', 2, 0, 0, '2022-02-01 09:59:05', '2022-12-14 13:22:13'),
(8, 'село Пробіжна, Чортківського району', '23 км2', 1, 1, 0, '2022-12-14 13:28:07', '2022-12-14 13:31:21');

-- --------------------------------------------------------

--
-- Структура таблиці `journal_entries`
--

CREATE TABLE `journal_entries` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `journal_date` date NOT NULL,
  `description` text NOT NULL,
  `user_id` int(30) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `journal_entries`
--

INSERT INTO `journal_entries` (`id`, `code`, `journal_date`, `description`, `user_id`, `date_created`, `date_updated`) VALUES
(4, 'село Васильківці, Чортківського району', '2022-02-01', 'Іванишин Артур Петрович', 1, '2022-02-01 15:55:46', '2022-12-14 22:20:17'),
(6, 'село Конюхи, Козівського району', '2022-02-01', 'Озимак Іван Володимирович', 1, '2022-02-01 15:55:46', '2022-12-14 22:20:17'),
(7, 'село Трибухівці, Бучацького району', '2021-12-06', 'Ткач Перто Іванович', 1, '2022-02-01 15:55:46', '2022-12-14 22:20:17');

-- --------------------------------------------------------

--
-- Структура таблиці `journal_items`
--

CREATE TABLE `journal_items` (
  `journal_id` int(30) NOT NULL,
  `account_id` int(30) NOT NULL,
  `group_id` int(30) NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `journal_items`
--

INSERT INTO `journal_items` (`journal_id`, `account_id`, `group_id`, `amount`, `date_created`) VALUES
(4, 50, 1, 15000, '2022-12-05 22:17:11'),
(6, 2, 4, 63000, '2022-12-14 22:25:29'),
(7, 3, 3, 2400, '2022-12-14 22:27:11');

-- --------------------------------------------------------

--
-- Структура таблиці `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Облік земель Тернопільської області'),
(6, 'short_name', 'Облік земель'),
(11, 'logo', 'uploads/logo-1643680475.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1643680511.jpg'),
(15, 'content', 'Array'),
(16, 'email', 'info@xyzcompany.com'),
(17, 'contact', '09854698789 / 78945632'),
(18, 'from_time', '11:00'),
(19, 'to_time', '21:30'),
(20, 'address', 'XYZ Street, There City, Here, 2306');

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Адміністратор', NULL, 'Admin', 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'uploads/avatar-1.png?v=1643703899', NULL, 1, 1, '2021-01-20 14:02:37', '2022-12-13 19:00:37'),
(7, 'Ігор', NULL, 'Кульчицький', 'test', '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, 2, 1, '2022-12-13 18:58:42', '2022-12-14 22:28:26');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `account_list`
--
ALTER TABLE `account_list`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `group_list`
--
ALTER TABLE `group_list`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `journal_entries`
--
ALTER TABLE `journal_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Індекси таблиці `journal_items`
--
ALTER TABLE `journal_items`
  ADD KEY `journal_id` (`journal_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Індекси таблиці `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `account_list`
--
ALTER TABLE `account_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT для таблиці `group_list`
--
ALTER TABLE `group_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблиці `journal_entries`
--
ALTER TABLE `journal_entries`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблиці `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `journal_entries`
--
ALTER TABLE `journal_entries`
  ADD CONSTRAINT `journal_entries_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Обмеження зовнішнього ключа таблиці `journal_items`
--
ALTER TABLE `journal_items`
  ADD CONSTRAINT `journal_items_ibfk_1` FOREIGN KEY (`journal_id`) REFERENCES `journal_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `journal_items_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `account_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `journal_items_ibfk_3` FOREIGN KEY (`group_id`) REFERENCES `group_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
