-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.53 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.5.0.5249
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 caac 的数据库结构
DROP DATABASE IF EXISTS `caac`;
CREATE DATABASE IF NOT EXISTS `caac` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `caac`;

-- 导出  表 caac.include 结构
DROP TABLE IF EXISTS `include`;
CREATE TABLE IF NOT EXISTS `include` (
  `flag` varchar(255) NOT NULL,
  PRIMARY KEY (`flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  caac.include 的数据：1 rows
/*!40000 ALTER TABLE `include` DISABLE KEYS */;
INSERT IGNORE INTO `include` (`flag`) VALUES
	('flag{#1n@1udE_php_1nc1udE_@hE@k}');
/*!40000 ALTER TABLE `include` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
