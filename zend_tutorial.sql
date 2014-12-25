-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 25 2014 г., 17:42
-- Версия сервера: 5.6.11
-- Версия PHP: 5.5.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `zend_tutorial`
--
CREATE DATABASE IF NOT EXISTS `zend_tutorial` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `zend_tutorial`;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_name` varchar(100) NOT NULL,
  `usr_password` varchar(100) NOT NULL,
  `usr_email` varchar(60) NOT NULL,
  `usr1_id` int(11) DEFAULT NULL,
  `lng_id` int(11) DEFAULT NULL,
  `usr_active` tinyint(1) NOT NULL,
  `usr_question` varchar(100) DEFAULT NULL,
  `usr_answer` varchar(100) DEFAULT NULL,
  `usr_picture` varchar(255) DEFAULT NULL,
  `usr_password_salt` varchar(100) DEFAULT NULL,
  `usr_registration_date` datetime DEFAULT NULL,
  `usr_registration_token` varchar(100) DEFAULT NULL,
  `usr_email_confirmed` tinyint(1) NOT NULL,
  PRIMARY KEY (`usr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`usr_id`, `usr_name`, `usr_password`, `usr_email`, `usr1_id`, `lng_id`, `usr_active`, `usr_question`, `usr_answer`, `usr_picture`, `usr_password_salt`, `usr_registration_date`, `usr_registration_token`, `usr_email_confirmed`) VALUES
(1, 'Ailin_Ilchuk', '1111111', 'ai.ilchuk@gmail.com', 1, 1, 1, '', '', '', '', '2014-12-24 12:00:00', '', 1),
(2, 'Sergey_Vyazmikin', '22222222', 'metisb@gmail.com', 1, 1, 1, 'Hi Sergey', 'Hi Ailin', '', '', '2014-12-24 12:00:00', '', 1),
(3, 'Vitaliy_Tsud', '33333333', 'b_med@gmail.com', 1, 1, 1, '', '', '', '', '2014-12-24 12:00:00', '', 1),
(4, 'Dmitriy_Ilchuk', '1111111', 'metisb@gmail.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(5, 'Anna_Tsud', '1111111', 'tsud@gmail.com', 1, 1, 1, '', '', '', '', '2014-12-24 12:00:00', '', 1),
(6, 'Ailin.Ilchuk', '1111111', '1111111', 1, 1, 1, 'Hl', 'Hi', 'https://www.', '', '2014-12-24 12:00:00', '', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
