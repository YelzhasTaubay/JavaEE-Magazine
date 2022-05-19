-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Сен 17 2018 г., 16:19
-- Версия сервера: 10.1.26-MariaDB
-- Версия PHP: 7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `internet_shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `baskets`
--

CREATE TABLE `baskets` (
                           `id` int(11) NOT NULL,
                           `user_id` int(11) NOT NULL,
                           `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `baskets`
--

INSERT INTO `baskets` (`id`, `user_id`, `item_id`) VALUES
                                                       (11, 2, 6),
                                                       (12, 2, 6),
                                                       (13, 2, 6),
                                                       (14, 2, 6),
                                                       (15, 2, 6),
                                                       (16, 2, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
                              `id` int(11) NOT NULL,
                              `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
                                            (3, 'Electronics'),
                                            (5, 'Mobiles'),
                                            (7, 'Laptops'),
                                            (8, 'Televisions');

-- --------------------------------------------------------

--
-- Структура таблицы `items`
--

CREATE TABLE `items` (
                         `id` int(11) NOT NULL,
                         `name` varchar(200) NOT NULL,
                         `category_id` int(11) NOT NULL,
                         `price` int(10) NOT NULL,
                         `amount` int(10) NOT NULL,
                         `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `items`
--

INSERT INTO `items` (`id`, `name`, `category_id`, `price`, `amount`, `added_date`) VALUES
                                                                                       (2, 'Toshiba T34011111', 8, 200005, 32, '2018-09-15 13:54:17'),
                                                                                       (3, 'IPhone 7', 5, 120000, 50, '2018-09-15 13:54:42'),
                                                                                       (4, 'Lenovo L45', 7, 300000, 20, '2018-09-15 13:55:13'),
                                                                                       (5, 'Samsung S34', 8, 100000, 20, '2018-09-15 13:55:54'),
                                                                                       (6, 'LG Flatron', 8, 50000, 10, '2018-09-15 14:13:55'),
                                                                                       (7, 'Epson Projector', 3, 150000, 50, '2018-09-15 14:14:13');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
                         `id` int(11) NOT NULL,
                         `email` varchar(200) NOT NULL,
                         `password` varchar(200) NOT NULL,
                         `full_name` varchar(200) NOT NULL,
                         `role` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `full_name`, `role`) VALUES
                                                                         (1, 'arman@gmail.com', 'qwerty', 'Arman Erzhanov', 2),
                                                                         (2, 'ilyas@gmail.com', 'qweqwe', 'Ilyas Zhuanyshev', 2),
                                                                         (3, 'admin@gmail.com', 'qwerty', 'Admin', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `baskets`
--
ALTER TABLE `baskets`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `items`
--
ALTER TABLE `items`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `baskets`
--
ALTER TABLE `baskets`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `items`
--
ALTER TABLE `items`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
