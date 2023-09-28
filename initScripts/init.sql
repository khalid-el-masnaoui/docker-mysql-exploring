CREATE DATABASE IF NOT EXISTS `khalid` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
GO
USE `khalid`;
GO
CREATE TABLE `tests` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `results` varchar(30) NOT NULL,
  `no_tests` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
GO
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);
