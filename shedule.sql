-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 02 2024 г., 15:57
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shedule`
--
CREATE DATABASE IF NOT EXISTS `shedule` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `shedule`;

-- --------------------------------------------------------

--
-- Структура таблицы `course`
--

CREATE TABLE `course` (
  `course_id` int NOT NULL,
  `course` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `course`
--

INSERT INTO `course` (`course_id`, `course`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` int NOT NULL,
  `faculty` varchar(100) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `faculty`, `createdAt`, `updatedAt`) VALUES
(1, 'Інформаційних технологій та кібербезпеки', NULL, NULL),
(2, 'Телекомунікацій та радіотехніки', NULL, NULL),
(3, 'Бізнесу та соціальних комунікацій', NULL, NULL),
(4, 'Електроніки автоматизації та метрології', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `friday`
--

CREATE TABLE `friday` (
  `id` int NOT NULL,
  `group_id` int DEFAULT NULL,
  `firstLesson` varchar(255) DEFAULT NULL,
  `secondLesson` varchar(255) DEFAULT NULL,
  `thirdLesson` varchar(255) DEFAULT NULL,
  `fourthLesson` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `friday`
--

INSERT INTO `friday` (`id`, `group_id`, `firstLesson`, `secondLesson`, `thirdLesson`, `fourthLesson`) VALUES
(1, 23, 'Безпека життєдіяльності та охорона праці (Лк) З-б тиждень, в. Гинда В.В.', 'Мобільні комунікації (Лк) 3,4 тиждень, доц. Сідень С.В.', 'Технології розподілених систем та паралельних обчислень (Пр) 3-15 тиждень, доц. Заврак М.В.', 'Мобільні комунікації (Пр) 5-9 тиждень, в. Кійко С.М. (Лб) 10-13 тиждень, ст.в. Степанова Л.І., в. Кійко С.М.'),
(2, 22, 'Безпека життєдіяльності та охорона праці (Лк) З-б тиждень, в. Гинда В.В.', 'Мобільні комунікації (Лк) 3,4 тиждень, доц. Сідень С.В.', 'Мобільні комунікації (Пр) 5-9 тиждень, в. Кійко С.М. (Лб) 10-13 тиждень, ст.в. Степанова Л.І.', 'Веб-технології та веб-дизайн (Лб) 3-15 тиждень, ст.в. Рябов Д.М., ст.в. Макоганюк АО.'),
(3, 24, 'Безпека життєдіяльності та охорона праці (Лк) З-б тиждень, в. Гинда В.В.', 'Мобільні комунікації (Лк) 3,4 тиждень, доц. Сідень С.В.', 'Якість програмного забезпечення та тестування (Лб) 7-13 тиждень, в. Липовська ІА.,', 'Методи та системи штучного інтелекту (Лб) 3-12 тиждень, ст.в. Гурюгіс І.В. в. Липовська І.А.');

-- --------------------------------------------------------

--
-- Структура таблицы `monday`
--

CREATE TABLE `monday` (
  `id` int NOT NULL,
  `group_id` int DEFAULT NULL,
  `firstLesson` varchar(255) DEFAULT NULL,
  `secondLesson` varchar(255) DEFAULT NULL,
  `thirdLesson` varchar(255) DEFAULT NULL,
  `fourthLesson` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `monday`
--

INSERT INTO `monday` (`id`, `group_id`, `firstLesson`, `secondLesson`, `thirdLesson`, `fourthLesson`) VALUES
(1, 23, 'Методи та системи штучного інтелекту (Лб) 3-12 тиждень, ст.в. Макогонюк А.О., в. Литовська І.А.', NULL, 'Веб-технології та веб-дизайн (Лк) 3-12 тиждень, ст.в. Северин М.В.', NULL),
(2, 22, NULL, 'Якість програмного забезпечення та тестування (Пр) 3-14 тиждень, в. Липовська І.А.', 'Веб-технології та веб-дизайн (Лк) 3-12 тиждень, ст.в. Северин М.В.', NULL),
(3, 24, NULL, NULL, 'Веб-технології та веб-дизайн (Лк) 3-12 тиждень, ст.в. Северин М.В.', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `professor`
--

CREATE TABLE `professor` (
  `professor_id` int NOT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `professor`
--

INSERT INTO `professor` (`professor_id`, `fullName`, `phone`, `link`) VALUES
(1, 'Один', '+380 11 111 11 11', 'https://us04web.zoom.us/'),
(2, 'Два', '+380 22 222 22 22', 'https://us04web.zoom.us/'),
(3, 'Три', '+380 33 333 33 33', 'https://us04web.zoom.us/'),
(4, 'Чотири', '+380 44 444 44 44', 'https://us04web.zoom.us/'),
(5, 'П\'ять', '+380 55 555 55 55', 'https://us04web.zoom.us/'),
(6, 'Шість', '+380 66 666 66 66', 'https://us04web.zoom.us/'),
(7, 'Сім', '+380 77 777 77 77', 'https://us04web.zoom.us/'),
(8, 'Вісім', '+380 88 888 88 88', 'https://us04web.zoom.us/');

-- --------------------------------------------------------

--
-- Структура таблицы `saturday`
--

CREATE TABLE `saturday` (
  `id` int NOT NULL,
  `group_id` int DEFAULT NULL,
  `firstLesson` varchar(255) DEFAULT NULL,
  `secondLesson` varchar(255) DEFAULT NULL,
  `thirdLesson` varchar(255) DEFAULT NULL,
  `fourthLesson` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `speciality`
--

CREATE TABLE `speciality` (
  `speciality_id` int NOT NULL,
  `speciality` varchar(100) DEFAULT NULL,
  `faculty_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `speciality`
--

INSERT INTO `speciality` (`speciality_id`, `speciality`, `faculty_id`) VALUES
(1, '121. Інженерія програмного забезпечення', 1),
(2, '122. Комп\'ютерні науки', 1),
(3, '123. Комп\'ютерна інженерія', 1),
(4, '125. Кібербезпека та захист інформації', 1),
(5, '126. Інформаційні системи та технології', 1),
(6, '172. Телекомунікації та радіотехніка', 2),
(7, '051. Економіка', 3),
(8, '073. Менеджмент', 3),
(9, '054. Соціологія', 3),
(10, '061. Журналістика', 3),
(11, '281. Публічне управління та адміністрування', 3),
(12, '075. Маркетинг', 3),
(13, '053. Психологія', 3),
(14, '011. Освітні та педагогічні науки', 4),
(15, '275. Транспортні технології', 4),
(16, '174. Автоматизація, комп\'ютерно-інтегровані технології та робототехніка', 4),
(17, '175. Інформаційно-вимірювальні технології', 4),
(18, '176. Мікро та наносистемна техніка', 4),
(19, '171. Електроніка', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `student_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `group_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`student_id`, `name`, `surname`, `email`, `group_id`) VALUES
(1, 'Євгеній', 'Артьомов', 'eujen@gmail.com', 23),
(2, 'Кирило', 'Афтанов', 'kirill@gmail.com', 23),
(3, 'Олександр', 'Бондарчук', 'sasa@gmail.com', 23),
(4, 'Олександр', 'Гончаров', 'goncharov@gmail.com', 23),
(5, 'Максим', 'Грищенко', 'hryschenko@gmail.com', 23),
(6, 'Микола', 'Захарчук', 'zaharchuk@gmail.com', 23),
(7, 'Микита', 'Кандул', 'nikitos@gmail.com', 23),
(8, 'Родіон', 'Клочан', 'rodion@gmail.com', 23),
(9, 'Костянтин', 'Лук`яненко', 'kostya@gmail.com', 23),
(10, 'Дмитро', 'Мамчур', 'dmitry@gmail.com', 23),
(11, 'Богдан', 'Матюшин', 'bohdan@gmail.com', 23),
(12, 'Олександр', 'Міщеряков', 'misheryakov@gmail.com', 23),
(13, 'Ігор', 'Нікітін', 'igorik@gmail.com', 23),
(14, 'Олександр', 'Нягу', 'alexand@gmail.com', 23),
(15, 'Валерія', 'Павлова', 'lera@gmail.com', 23),
(16, 'Владислав', 'Слатвінський', 'vlad@gmail.com', 23),
(17, 'Ігор', 'Стоянов', 'ihor22@gmail.com', 23),
(18, 'Тетяна', 'Урсу', 'tana@gmail.com', 23),
(19, 'Анна', 'Фесик', 'anna@gmail.com', 23),
(20, 'Андрій', 'Трікачов', 'andriy@gmail.com', 23);

-- --------------------------------------------------------

--
-- Структура таблицы `thursday`
--

CREATE TABLE `thursday` (
  `id` int NOT NULL,
  `group_id` int DEFAULT NULL,
  `firstLesson` varchar(255) DEFAULT NULL,
  `secondLesson` varchar(255) DEFAULT NULL,
  `thirdLesson` varchar(255) DEFAULT NULL,
  `fourthLesson` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `thursday`
--

INSERT INTO `thursday` (`id`, `group_id`, `firstLesson`, `secondLesson`, `thirdLesson`, `fourthLesson`) VALUES
(1, 23, 'Технології захисту інформації (Лк) 3-8 тиждень, доц. Кононович В.Г.', 'Технології захисту інформації (Пр) 9-13 тиждень, доц. Кононович В.Г.', 'Якість програмного забезпечення та тестування (Пр) 3-14 тиждень, в. Литовська ІА.', NULL),
(2, 22, 'Технології захисту інформації (Лк) 3-8 тиждень, доц. Кононович В.Г.', NULL, 'Технології захисту інформації (Пр) 9-13 тиждень, доц. Кононович В.Г.', 'Технології розподілених систем та паралельних обчислень (Пр) 3-15 тиждень, доц. Заврак М.В.'),
(3, 24, 'Технології захисту інформації (Лк) 3-8 тиждень, доц. Кононович В.Г.', 'Мобільні комунікації (Пр) 5-9 тиждень, в. Кійко С.М.', 'Веб-технології та веб-дизайн (Лб) 3-15 тиждень, СТ.В. Макоганюк АО., в. Липовська 1.А.', 'Технології захисту інформації (Пр) 9-13 тиждень, доц Кононович В.Г.');

-- --------------------------------------------------------

--
-- Структура таблицы `tuesday`
--

CREATE TABLE `tuesday` (
  `id` int NOT NULL,
  `group_id` int DEFAULT NULL,
  `firstLesson` varchar(255) DEFAULT NULL,
  `secondLesson` varchar(255) DEFAULT NULL,
  `thirdLesson` varchar(255) DEFAULT NULL,
  `fourthLesson` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tuesday`
--

INSERT INTO `tuesday` (`id`, `group_id`, `firstLesson`, `secondLesson`, `thirdLesson`, `fourthLesson`) VALUES
(1, 23, 'Технології розподілених систем та паралельних обчислень (Лк) 3-12 тиждень, доц. Заврак М.В.', 'Технології захисту інформації (Лб) 9-13 тиждень, доц Назаренко О.А., доц. Кононович В.Г.', NULL, NULL),
(2, 22, 'Технології розподілених систем та паралельних обчислень (Лк) 3-12 тиждень, доц. Заврак М.В.', 'Безпека життєдіяльності та охорона праці (Пр) 7-14 тиждень, в.Гинда В.В. інформації (Лб) 9-13 тиждень, доц Назаренко О.А., доц. Кононович В.Г.', NULL, NULL),
(3, 24, 'Технології розподілених систем та паралельних обчислень (Лк) 3-12 тиждень, доц. Заврак М.В.', 'Якість програмного забезпечення та тестування (Пр) 3-14 тиждень, в. Литовська І.А.', 'Технолога розподілених систем та паралельних обчислень (Пр) 3-15 тиждень, ст. в. Гуркліс І.В.', 'Технології захисту інформації (Лб) 9-13 тиждень, доц Назаренко О А., доц. Кононович В.Г.');

-- --------------------------------------------------------

--
-- Структура таблицы `wednesday`
--

CREATE TABLE `wednesday` (
  `id` int NOT NULL,
  `group_id` int DEFAULT NULL,
  `firstLesson` varchar(255) DEFAULT NULL,
  `secondLesson` varchar(255) DEFAULT NULL,
  `thirdLesson` varchar(255) DEFAULT NULL,
  `fourthLesson` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `wednesday`
--

INSERT INTO `wednesday` (`id`, `group_id`, `firstLesson`, `secondLesson`, `thirdLesson`, `fourthLesson`) VALUES
(1, 23, 'Якість програмного забезпечення та тестування (Лк) 3-12 тиждень, в. Литовська І.А.', 'Безпека життєдіяльності та охорона праці (Пр) 7-14 тиждень, в.Гинда В.В.', 'Методи та системи ппучного інтелекту (Лк) 3-9 тиждень, ст.в. Макогонюк А.О.', 'Веб-технології та веб-дизайн (Лб) 3-15 тиждень, доц. Трегубова І А., в. Литовська І.А.'),
(2, 22, 'Якість програмного забезпечення та тестування (Лк) 3-12 тиждень, в. Литовська І.А.', 'Методи та системи штучного інтелекту (Лб) 3-12 тиждень, ст.в. МакогонюкА.О., в. Литовська І.А.', 'Методи та системи ппучного інтелекту (Лк) 3-9 тиждень, ст.в. Макогонюк А.О.', 'Технології захисту інформації (Лб) 9-13 тиждень, доц. Назаренко О.А., доц. Кононович В.Г.'),
(3, 24, 'Якість програмного забезпечення та тестування (Лк) 3-12 тиждень, в. Литовська І.А.', NULL, 'Методи та системи ппучного інтелекту (Лк) 3-9 тиждень, ст.в. Макогонюк А.О.', 'Безпека життєдіяльності та охорона праці (Пр) 7-14 тиждень, ст.в. Бугеда Л.К.');

-- --------------------------------------------------------

--
-- Структура таблицы `_group`
--

CREATE TABLE `_group` (
  `group_id` int NOT NULL,
  `group_name` varchar(10) DEFAULT NULL,
  `speciality_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `_group`
--

INSERT INTO `_group` (`group_id`, `group_name`, `speciality_id`, `course_id`) VALUES
(1, 'ІПЗ-1.01', 1, 1),
(2, 'ІПЗ-1.02', 1, 1),
(3, 'ІПЗ-1.03', 1, 1),
(4, 'ІПЗ-2.01', 1, 2),
(5, 'ІПЗ-2.02', 1, 2),
(6, 'ІПЗ-2.03', 1, 2),
(7, 'ІПЗ-3.01', 1, 3),
(8, 'ІПЗ-3.02', 1, 3),
(9, 'ІПЗ-3.03', 1, 3),
(10, 'ІПЗ-4.01', 1, 4),
(11, 'ІПЗ-4.02', 1, 4),
(12, 'ІПЗ-4.03', 1, 4),
(13, 'КН-1.01', 2, 1),
(14, 'КН-1.02', 2, 1),
(15, 'КН-1.03', 2, 1),
(16, 'КН-2.01', 2, 2),
(17, 'КН-2.02', 2, 2),
(18, 'КН-2.03', 2, 2),
(19, 'КН-3.01', 2, 3),
(20, 'КН-3.02', 2, 3),
(21, 'КН-3.03', 2, 3),
(22, 'КН-4.01', 2, 4),
(23, 'КН-4.02', 2, 4),
(24, 'КН-4.03', 2, 4),
(25, 'КІ-1.01', 3, 1),
(26, 'КІ-1.02', 3, 1),
(27, 'КІ-1.03', 3, 1),
(28, 'КІ-2.01', 3, 2),
(29, 'КІ-2.02', 3, 2),
(30, 'КІ-2.03', 3, 2),
(31, 'КІ-3.01', 3, 3),
(32, 'КІ-3.02', 3, 3),
(33, 'КІ-3.03', 3, 3),
(34, 'КІ-4.01', 3, 4),
(35, 'КІ-4.02', 3, 4),
(36, 'КІ-4.03', 3, 4),
(37, 'КБЗІ-1.01', 4, 1),
(38, 'КБЗІ-1.02', 4, 1),
(39, 'КБЗІ-1.03', 4, 1),
(40, 'КБЗІ-2.01', 4, 2),
(41, 'КБЗІ-2.02', 4, 2),
(42, 'КБЗІ-2.03', 4, 2),
(43, 'КБЗІ-3.01', 4, 3),
(44, 'КБЗІ-3.02', 4, 3),
(45, 'КБЗІ-3.03', 4, 3),
(46, 'КБЗІ-4.01', 4, 4),
(47, 'КБЗІ-4.02', 4, 4),
(48, 'КБЗІ-4.03', 4, 4),
(49, 'ІСТ-1.01', 5, 1),
(50, 'ІСТ-1.02', 5, 1),
(51, 'ІСТ-1.03', 5, 1),
(52, 'ІСТ-2.01', 5, 2),
(53, 'ІСТ-2.02', 5, 2),
(54, 'ІСТ-2.03', 5, 2),
(55, 'ІСТ-3.01', 5, 3),
(56, 'ІСТ-3.02', 5, 3),
(57, 'ІСТ-3.03', 5, 3),
(58, 'ІСТ-4.01', 5, 4),
(59, 'ІСТ-4.02', 5, 4),
(60, 'ІСТ-4.03', 5, 4),
(61, 'ТР-1.01', 6, 1),
(62, 'ТР-1.02', 6, 1),
(63, 'ТР-1.03', 6, 1),
(64, 'ТР-2.01', 6, 2),
(65, 'ТР-2.02', 6, 2),
(66, 'ТР-2.03', 6, 2),
(67, 'ТР-3.01', 6, 3),
(68, 'ТР-3.02', 6, 3),
(69, 'ТР-3.03', 6, 3),
(70, 'ТР-4.01', 6, 4),
(71, 'ТР-4.02', 6, 4),
(72, 'ТР-4.03', 6, 4),
(73, 'Е-1.01', 7, 1),
(74, 'Е-1.02', 7, 1),
(75, 'Е-1.03', 7, 1),
(76, 'Е-2.01', 7, 2),
(77, 'Е-2.02', 7, 2),
(78, 'Е-2.03', 7, 2),
(79, 'Е-3.01', 7, 3),
(80, 'Е-3.02', 7, 3),
(81, 'Е-3.03', 7, 3),
(82, 'Е-4.01', 7, 4),
(83, 'Е-4.02', 7, 4),
(84, 'Е-4.03', 7, 4),
(85, 'М-1.01', 8, 1),
(86, 'М-1.02', 8, 1),
(87, 'М-1.03', 8, 1),
(88, 'М-2.01', 8, 2),
(89, 'М-2.02', 8, 2),
(90, 'М-2.03', 8, 2),
(91, 'М-3.01', 8, 3),
(92, 'М-3.02', 8, 3),
(93, 'М-3.03', 8, 3),
(94, 'М-4.01', 8, 4),
(95, 'М-4.02', 8, 4),
(96, 'М-4.03', 8, 4),
(97, 'С-1.01', 9, 1),
(98, 'С-1.02', 9, 1),
(99, 'С-1.03', 9, 1),
(100, 'С-2.01', 9, 2),
(101, 'С-2.02', 9, 2),
(102, 'С-2.03', 9, 2),
(103, 'С-3.01', 9, 3),
(104, 'С-3.02', 9, 3),
(105, 'С-3.03', 9, 3),
(106, 'С-4.01', 9, 4),
(107, 'С-4.02', 9, 4),
(108, 'С-4.03', 9, 4),
(109, 'Ж-1.01', 10, 1),
(110, 'Ж-1.02', 10, 1),
(111, 'Ж-1.03', 10, 1),
(112, 'Ж-2.01', 10, 2),
(113, 'Ж-2.02', 10, 2),
(114, 'Ж-2.03', 10, 2),
(115, 'Ж-3.01', 10, 3),
(116, 'Ж-3.02', 10, 3),
(117, 'Ж-3.03', 10, 3),
(118, 'Ж-4.01', 10, 4),
(119, 'Ж-4.02', 10, 4),
(120, 'Ж-4.03', 10, 4),
(121, 'ПУ-1.01', 11, 1),
(122, 'ПУ-1.02', 11, 1),
(123, 'ПУ-1.03', 11, 1),
(124, 'ПУ-2.01', 11, 2),
(125, 'ПУ-2.02', 11, 2),
(126, 'ПУ-2.03', 11, 2),
(127, 'ПУ-3.01', 11, 3),
(128, 'ПУ-3.02', 11, 3),
(129, 'ПУ-3.03', 11, 3),
(130, 'ПУ-4.01', 11, 4),
(131, 'ПУ-4.02', 11, 4),
(132, 'ПУ-4.03', 11, 4),
(133, 'Мар-1.01', 12, 1),
(134, 'Мар-1.02', 12, 1),
(135, 'Мар-1.03', 12, 1),
(136, 'Мар-2.01', 12, 2),
(137, 'Мар-2.02', 12, 2),
(138, 'Мар-2.03', 12, 2),
(139, 'Мар-3.01', 12, 3),
(140, 'Мар-3.02', 12, 3),
(141, 'Мар-3.03', 12, 3),
(142, 'Мар-4.01', 12, 4),
(143, 'Мар-4.02', 12, 4),
(144, 'Мар-4.03', 12, 4),
(145, 'П-1.01', 13, 1),
(146, 'П-1.02', 13, 1),
(147, 'П-1.03', 13, 1),
(148, 'П-2.01', 13, 2),
(149, 'П-2.02', 13, 2),
(150, 'П-2.03', 13, 2),
(151, 'П-3.01', 13, 3),
(152, 'П-3.02', 13, 3),
(153, 'П-3.03', 13, 3),
(154, 'П-4.01', 13, 4),
(155, 'П-4.02', 13, 4),
(156, 'П-4.03', 13, 4),
(157, 'ОПН-1.01', 14, 1),
(158, 'ОПН-1.02', 14, 1),
(159, 'ОПН-1.03', 14, 1),
(160, 'ОПН-2.01', 14, 2),
(161, 'ОПН-2.02', 14, 2),
(162, 'ОПН-2.03', 14, 2),
(163, 'ОПН-3.01', 14, 3),
(164, 'ОПН-3.02', 14, 3),
(165, 'ОПН-3.03', 14, 3),
(166, 'ОПН-4.01', 14, 4),
(167, 'ОПН-4.02', 14, 4),
(168, 'ОПН-4.03', 14, 4),
(169, 'ТТ-1.01', 15, 1),
(170, 'ТТ-1.02', 15, 1),
(171, 'ТТ-1.03', 15, 1),
(172, 'ТТ-2.01', 15, 2),
(173, 'ТТ-2.02', 15, 2),
(174, 'ТТ-2.03', 15, 2),
(175, 'ТТ-3.01', 15, 3),
(176, 'ТТ-3.02', 15, 3),
(177, 'ТТ-3.03', 15, 3),
(178, 'ТТ-4.01', 15, 4),
(179, 'ТТ-4.02', 15, 4),
(180, 'ТТ-4.03', 15, 4),
(181, 'АКІТР-1.01', 16, 1),
(182, 'АКІТР-1.02', 16, 1),
(183, 'АКІТР-1.03', 16, 1),
(184, 'АКІТР-2.01', 16, 2),
(185, 'АКІТР-2.02', 16, 2),
(186, 'АКІТР-2.03', 16, 2),
(187, 'АКІТР-3.01', 16, 3),
(188, 'АКІТР-3.02', 16, 3),
(189, 'АКІТР-3.03', 16, 3),
(190, 'АКІТР-4.01', 16, 4),
(191, 'АКІТР-4.02', 16, 4),
(192, 'АКІТР-4.03', 16, 4),
(193, 'ІВТ-1.01', 17, 1),
(194, 'ІВТ-1.02', 17, 1),
(195, 'ІВТ-1.03', 17, 1),
(196, 'ІВТ-2.01', 17, 2),
(197, 'ІВТ-2.02', 17, 2),
(198, 'ІВТ-2.03', 17, 2),
(199, 'ІВТ-3.01', 17, 3),
(200, 'ІВТ-3.02', 17, 3),
(201, 'ІВТ-3.03', 17, 3),
(202, 'ІВТ-4.01', 17, 4),
(203, 'ІВТ-4.02', 17, 4),
(204, 'ІВТ-4.03', 17, 4),
(205, 'МНТ-1.01', 18, 1),
(206, 'МНТ-1.02', 18, 1),
(207, 'МНТ-1.03', 18, 1),
(208, 'МНТ-2.01', 18, 2),
(209, 'МНТ-2.02', 18, 2),
(210, 'МНТ-2.03', 18, 2),
(211, 'МНТ-3.01', 18, 3),
(212, 'МНТ-3.02', 18, 3),
(213, 'МНТ-3.03', 18, 3),
(214, 'МНТ-4.01', 18, 4),
(215, 'МНТ-4.02', 18, 4),
(216, 'МНТ-4.03', 18, 4),
(217, 'Е-1.01', 19, 1),
(218, 'Е-1.02', 19, 1),
(219, 'Е-1.03', 19, 1),
(220, 'Е-2.01', 19, 2),
(221, 'Е-2.02', 19, 2),
(222, 'Е-2.03', 19, 2),
(223, 'Е-3.01', 19, 3),
(224, 'Е-3.02', 19, 3),
(225, 'Е-3.03', 19, 3),
(226, 'Е-4.01', 19, 4),
(227, 'Е-4.02', 19, 4),
(228, 'Е-4.03', 19, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `_user`
--

CREATE TABLE `_user` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT 'guest',
  `password` varchar(255) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `_user`
--

INSERT INTO `_user` (`id`, `name`, `surname`, `email`, `role`, `password`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'Анна', 'Фесик', 'anna@gmail.com', 'student', '$2a$10$PpTaokr5o83zeZX4dHszcOORNC6KpRUtlJAxfQSexeFaqtF7mbCQu', '2024-01-02 12:13:47', '2024-01-02 12:13:47', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Индексы таблицы `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Индексы таблицы `friday`
--
ALTER TABLE `friday`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Индексы таблицы `monday`
--
ALTER TABLE `monday`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Индексы таблицы `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`professor_id`);

--
-- Индексы таблицы `saturday`
--
ALTER TABLE `saturday`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Индексы таблицы `speciality`
--
ALTER TABLE `speciality`
  ADD PRIMARY KEY (`speciality_id`),
  ADD KEY `faculty_id` (`faculty_id`);

--
-- Индексы таблицы `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Индексы таблицы `thursday`
--
ALTER TABLE `thursday`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Индексы таблицы `tuesday`
--
ALTER TABLE `tuesday`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Индексы таблицы `wednesday`
--
ALTER TABLE `wednesday`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Индексы таблицы `_group`
--
ALTER TABLE `_group`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `speciality_id` (`speciality_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Индексы таблицы `_user`
--
ALTER TABLE `_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `faculty`
--
ALTER TABLE `faculty`
  MODIFY `faculty_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `friday`
--
ALTER TABLE `friday`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `monday`
--
ALTER TABLE `monday`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `professor`
--
ALTER TABLE `professor`
  MODIFY `professor_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `saturday`
--
ALTER TABLE `saturday`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `speciality`
--
ALTER TABLE `speciality`
  MODIFY `speciality_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `thursday`
--
ALTER TABLE `thursday`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `tuesday`
--
ALTER TABLE `tuesday`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `wednesday`
--
ALTER TABLE `wednesday`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `_group`
--
ALTER TABLE `_group`
  MODIFY `group_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT для таблицы `_user`
--
ALTER TABLE `_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `friday`
--
ALTER TABLE `friday`
  ADD CONSTRAINT `friday_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `_group` (`group_id`);

--
-- Ограничения внешнего ключа таблицы `monday`
--
ALTER TABLE `monday`
  ADD CONSTRAINT `monday_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `_group` (`group_id`);

--
-- Ограничения внешнего ключа таблицы `saturday`
--
ALTER TABLE `saturday`
  ADD CONSTRAINT `saturday_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `_group` (`group_id`);

--
-- Ограничения внешнего ключа таблицы `speciality`
--
ALTER TABLE `speciality`
  ADD CONSTRAINT `speciality_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`);

--
-- Ограничения внешнего ключа таблицы `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `_group` (`group_id`);

--
-- Ограничения внешнего ключа таблицы `thursday`
--
ALTER TABLE `thursday`
  ADD CONSTRAINT `thursday_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `_group` (`group_id`);

--
-- Ограничения внешнего ключа таблицы `tuesday`
--
ALTER TABLE `tuesday`
  ADD CONSTRAINT `tuesday_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `_group` (`group_id`);

--
-- Ограничения внешнего ключа таблицы `wednesday`
--
ALTER TABLE `wednesday`
  ADD CONSTRAINT `wednesday_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `_group` (`group_id`);

--
-- Ограничения внешнего ключа таблицы `_group`
--
ALTER TABLE `_group`
  ADD CONSTRAINT `_group_ibfk_1` FOREIGN KEY (`speciality_id`) REFERENCES `speciality` (`speciality_id`),
  ADD CONSTRAINT `_group_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
