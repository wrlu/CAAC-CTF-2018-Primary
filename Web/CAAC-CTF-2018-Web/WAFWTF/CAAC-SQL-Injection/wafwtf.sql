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

-- 导出  表 caac.air 结构
DROP TABLE IF EXISTS `air`;
CREATE TABLE IF NOT EXISTS `air` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `details` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 正在导出表  caac.air 的数据：6 rows
/*!40000 ALTER TABLE `air` DISABLE KEYS */;
INSERT IGNORE INTO `air` (`Id`, `name`, `details`) VALUES
	(1, 'CA1318', '广州白云T1-天津滨海T2'),
	(2, 'HU7202', '广州白云T1-天津滨海T2'),
	(3, 'CZ3302', '天津滨海T2-广州白云T2'),
	(4, 'GS7583', '天津滨海T2-哈尔滨太平'),
	(5, 'JD5611', '海口美兰T1-沈阳桃仙T3'),
	(6, 'ZH9723', '沈阳桃仙T3-三亚凤凰T2');
/*!40000 ALTER TABLE `air` ENABLE KEYS */;

-- 导出  表 caac.secret 结构
DROP TABLE IF EXISTS `secret`;
CREATE TABLE IF NOT EXISTS `secret` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `flag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  caac.secret 的数据：1 rows
/*!40000 ALTER TABLE `secret` DISABLE KEYS */;
INSERT IGNORE INTO `secret` (`Id`, `flag`) VALUES
	(1, 'flag{such_E@sy_W@f_t0_1nj}');
/*!40000 ALTER TABLE `secret` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
