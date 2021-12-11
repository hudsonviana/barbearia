-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11/12/2021 às 21:24
-- Versão do servidor: 10.4.11-MariaDB
-- Versão do PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `barberapp`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(200) NOT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `social_link` varchar(45) DEFAULT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `companies`
--

INSERT INTO `companies` (`id`, `name`, `address`, `latitude`, `longitude`, `phone`, `social_link`, `image`) VALUES
(1, 'Espaço Homem', 'Rua A, n. 10. B. Teste. Cidade - CD', '-2.9043633091504724', '-41.76888156616043', '84 98877-6655', 'https://instagram.com/', ''),
(2, 'Barbearia Brasil', 'Rua B, n. 11. B. Teste. Cidade - CD', '-2.9096351038075587', '-41.75356078864123', NULL, 'https://instagram.com/', ''),
(3, 'La Maison Barbearia', 'Rua B, n. 15. B. Teste. Cidade - CD', '-2.9053919539309203', '-41.77042651850738', NULL, 'https://instagram.com/', ''),
(4, 'Le Figaro', 'Rua A, n. 01. B. Teste. Cidade - CD', '-2.905219434465409', '-41.76699333599692', NULL, NULL, ''),
(5, 'Sublime Eliane', 'Rua das Margaridas, 196', '-123456', '-789112', '84 87788-9966', NULL, 'x'),
(7, 'Fica Bonita', 'Av. lá na esquina 17', '-11151', '-45115151', '84 11111-9966', NULL, 'x'),
(8, 'Carinha de Anjo', 'Rua do Sbt', '-11151', '-45115151', '84 11111-9966', NULL, 'x');

-- --------------------------------------------------------

--
-- Estrutura para tabela `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `image` varchar(200) NOT NULL,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `image`, `company_id`, `user_id`) VALUES
(1, 'Fulano', 'de Tal', 'https://i.imgur.com/hUw8Bc4.jpeg', 1, 2),
(3, 'Hudson', 'Andrade', '', 5, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `employees_services`
--

CREATE TABLE `employees_services` (
  `employee_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `employees_services`
--

INSERT INTO `employees_services` (`employee_id`, `service_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `scheduling_date` datetime DEFAULT NULL,
  `scheduling_hour` varchar(45) DEFAULT NULL,
  `hour_start` varchar(45) DEFAULT NULL,
  `hour_end` varchar(45) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `schedules`
--

INSERT INTO `schedules` (`id`, `scheduling_date`, `scheduling_hour`, `hour_start`, `hour_end`, `user_id`, `employee_id`, `service_id`) VALUES
(1, '2020-12-11 00:00:00', NULL, '7', '8', 3, NULL, 1),
(2, '2020-12-11 00:00:00', NULL, '19', '20', 3, NULL, 1),
(3, '2020-12-14 00:00:00', NULL, '12', '17', 3, NULL, 1),
(4, '2020-12-27 00:00:00', NULL, '17', '18', 3, NULL, 1),
(5, '2020-12-31 00:00:00', NULL, '16', '18', 3, NULL, 2),
(6, '2021-01-05 00:00:00', NULL, '10', '12', 3, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(155) DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `cost`, `company_id`) VALUES
(1, 'Corte de cabelo', 'Cortamos seu cabelo em até 30min', 25, 1),
(2, 'Barba', '', 15, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `username` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(150) NOT NULL,
  `image` longblob NOT NULL,
  `activated` tinyint(4) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `email`, `password`, `image`, `activated`, `updated_at`, `created_at`) VALUES
(1, 'Empresa ', 'empresa', '', '$2y$10$6mBTaqY1bRZG/sN3abnbl.B7McoKQ8JDG9B0maGOq5uGamngZG8bC', '', 1, '2021-12-07 02:50:58', NULL),
(2, 'Funcionário', 'funcionario', '', '$2y$10$NY0Py3K4sLxbtR7gAOPm9ueb5Zj5Y2A4VWC.Xthgsq9/d2Th9gZD6', '', 1, '2021-12-07 02:50:58', NULL),
(3, 'Cliente', 'cliente', '', '$2y$10$n2Etn44XaKzQKIs6HZtiUedV3kldxaRiSW.BzOntQksfDL0S96syi', '', 1, '2021-12-07 02:50:58', NULL),
(4, 'Teste', 'teste', 'teste@gmail.com', '$2y$10$aNtBsBJhEnOHq9E3R/l5/eR44cHCv6h8q9oHNhP5H88jfo5ior2ly', 0x68747470733a2f2f706e672e706e67747265652e636f6d2f706e672d636c69706172742f32303139303932342f6f726967696e616c2f706e67747265652d757365722d766563746f722d6176617461722d706e672d696d6167655f343833303532312e6a7067, 1, '2021-12-11 20:23:52', '2021-12-07 05:56:32'),
(5, 'testando', 'testando', 'testando@gmail.com', '$2y$10$Jpx.jEYQpkO0ip2t/BInoOh1Wh4peiE80QPqealqlEwFNR8CbHKXy', 0x68747470733a2f2f706e672e706e67747265652e636f6d2f706e672d636c69706172742f32303139303932342f6f726967696e616c2f706e67747265652d757365722d766563746f722d6176617461722d706e672d696d6167655f343833303532312e6a7067, 1, '2021-12-11 20:24:18', '2021-12-07 06:04:10');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_employees_companies1_idx` (`company_id`),
  ADD KEY `fk_employees_users1_idx` (`user_id`);

--
-- Índices de tabela `employees_services`
--
ALTER TABLE `employees_services`
  ADD PRIMARY KEY (`employee_id`,`service_id`),
  ADD KEY `fk_employees_has_services_services1_idx` (`service_id`),
  ADD KEY `fk_employees_has_services_employees1_idx` (`employee_id`);

--
-- Índices de tabela `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_schedules_users_idx` (`user_id`),
  ADD KEY `fk_schedules_employees1_idx` (`employee_id`),
  ADD KEY `fk_schedules_services1_idx` (`service_id`);

--
-- Índices de tabela `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_services_companies1_idx` (`company_id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_employees_companies1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `fk_employees_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `employees_services`
--
ALTER TABLE `employees_services`
  ADD CONSTRAINT `fk_employees_has_services_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `fk_employees_has_services_services1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Restrições para tabelas `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `fk_schedules_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `fk_schedules_services1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `fk_schedules_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `fk_services_companies1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
