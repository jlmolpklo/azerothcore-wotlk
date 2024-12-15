-- MySQL dump 10.13  Distrib 8.4.1, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: acore_world
-- ------------------------------------------------------
-- Server version	8.4.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `factiontemplate_dbc`
--

DROP TABLE IF EXISTS `factiontemplate_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factiontemplate_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `Faction` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `FactionGroup` int NOT NULL DEFAULT '0',
  `FriendGroup` int NOT NULL DEFAULT '0',
  `EnemyGroup` int NOT NULL DEFAULT '0',
  `Enemies_1` int NOT NULL DEFAULT '0',
  `Enemies_2` int NOT NULL DEFAULT '0',
  `Enemies_3` int NOT NULL DEFAULT '0',
  `Enemies_4` int NOT NULL DEFAULT '0',
  `Friend_1` int NOT NULL DEFAULT '0',
  `Friend_2` int NOT NULL DEFAULT '0',
  `Friend_3` int NOT NULL DEFAULT '0',
  `Friend_4` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factiontemplate_dbc`
--

LOCK TABLES `factiontemplate_dbc` WRITE;
/*!40000 ALTER TABLE `factiontemplate_dbc` DISABLE KEYS */;
INSERT INTO `factiontemplate_dbc` VALUES
(1,1,72,3,2,12,0,0,0,0,0,0,0,0),
(2,2,72,5,4,10,0,0,0,0,0,0,0,0),
(3,3,72,3,2,12,0,0,0,0,0,0,0,0),
(4,4,72,3,2,12,0,0,0,0,0,0,0,0),
(5,5,72,5,4,10,0,0,0,0,0,0,0,0),
(6,6,72,5,4,10,0,0,0,0,0,0,0,0),
(7,7,0,0,0,0,0,0,0,0,0,0,0,0),
(10,40,2056,3,2,0,0,0,0,0,0,0,0,0),
(11,72,2081,3,2,12,0,0,0,0,0,0,0,0),
(12,72,0,2,2,4,0,0,0,0,72,0,0,0),
(14,14,0,8,0,1,0,0,0,0,0,0,0,0),
(15,7,1,0,0,0,0,0,0,0,7,0,0,0),
(16,14,1,8,0,1,0,0,0,0,14,0,0,0),
(17,15,1,8,0,1,0,0,0,0,15,0,0,0),
(18,19,1,8,0,1,0,0,0,0,19,0,0,0),
(19,17,1,8,0,1,0,0,0,0,17,0,0,0),
(20,16,1,8,0,1,0,0,0,0,16,0,0,0),
(21,20,1,8,8,1,0,0,0,0,20,0,0,0),
(22,22,0,8,0,1,0,0,0,0,22,0,0,0),
(23,54,2049,2,2,4,0,0,0,0,0,0,0,0),
(24,24,1,8,0,1,0,0,0,0,24,0,0,0),
(25,25,0,8,0,0,0,0,0,0,25,0,0,0),
(26,25,1,8,0,1,0,0,0,0,25,0,0,0),
(27,15,1,8,0,1,1,0,0,0,15,0,0,0),
(28,26,1,8,0,1,0,0,0,0,26,0,0,0),
(29,76,0,4,4,2,0,0,0,0,0,0,0,0),
(30,27,1,8,0,1,0,0,0,0,27,0,0,0),
(31,28,1024,0,0,0,973,0,0,0,148,28,0,0),
(32,29,16,0,0,0,28,0,0,0,0,0,0,0),
(33,40,2056,5,4,0,0,0,0,0,0,0,0,0),
(34,15,1,8,0,0,0,0,0,0,15,0,0,0),
(35,31,0,0,1,0,0,0,0,0,31,0,0,0),
(36,32,1025,0,0,0,0,0,0,0,32,0,0,0),
(37,33,1,8,0,1,0,0,0,0,33,0,0,0),
(38,29,33,8,0,1,28,0,0,0,29,0,0,0),
(39,18,1,8,0,1,0,0,0,0,18,0,0,0),
(40,34,1,8,0,1,0,0,0,0,34,0,0,0),
(41,35,49,8,0,1,36,0,0,0,35,0,0,0),
(42,36,9,1,1,0,0,0,0,0,36,0,0,0),
(43,35,33,8,0,0,36,0,0,0,35,0,0,0),
(44,37,1,8,0,1,0,0,0,0,37,0,0,0),
(45,38,1,8,0,1,0,0,0,0,38,0,0,0),
(46,39,1,8,0,1,0,0,0,0,39,0,0,0),
(47,41,1,8,0,1,0,0,0,0,41,0,0,0),
(48,42,1,8,0,1,0,0,0,0,42,0,0,0),
(49,43,0,8,0,1,0,0,0,0,43,0,0,0),
(50,44,1,8,0,1,0,0,0,0,44,0,0,0),
(51,45,1,8,0,1,46,40,0,0,45,0,0,0),
(52,769,8,8,0,0,770,0,0,0,0,0,0,0),
(53,49,0,2,2,12,0,0,0,0,49,0,0,0),
(54,48,1,8,0,1,0,0,0,0,48,0,0,0),
(55,47,0,2,2,4,0,0,0,0,47,0,0,0),
(56,49,33,2,2,12,0,0,0,0,49,0,0,0),
(57,47,2081,3,2,12,0,0,0,0,0,0,0,0),
(58,7,1,8,0,0,0,0,0,0,0,0,0,0),
(59,32,1,8,0,1,0,0,0,0,32,0,0,0),
(60,50,1,8,0,1,0,0,0,0,50,0,0,0),
(61,51,1,8,0,1,0,0,0,0,51,0,0,0),
(62,52,1,8,0,1,1015,932,934,0,52,0,0,0),
(63,53,1,8,0,1,0,0,0,0,53,0,0,0),
(64,54,1,2,2,4,0,0,0,0,0,0,0,0),
(65,76,1,0,0,0,45,0,0,0,76,0,0,0),
(66,55,17,8,0,1,28,0,0,0,55,0,0,0),
(67,56,1,8,0,1,0,0,0,0,56,0,0,0),
(68,68,0,4,4,2,0,0,0,0,0,0,0,0),
(69,470,0,0,0,0,0,0,0,0,470,0,0,0),
(70,57,1,8,0,1,0,0,0,0,57,0,0,0),
(71,68,2081,5,4,10,0,0,0,0,0,0,0,0),
(72,58,1,8,0,1,0,0,0,0,58,0,0,0),
(73,669,1,8,0,1,0,0,0,0,669,0,0,0),
(74,60,1,8,0,1,289,0,0,0,60,0,0,0),
(76,61,33,0,2,4,0,0,0,0,61,0,0,0),
(77,62,0,8,0,0,0,0,0,0,0,0,0,0),
(78,63,0,8,0,1,0,0,0,0,0,0,0,0),
(79,69,2081,3,2,12,0,0,0,0,0,0,0,0),
(80,69,72,3,2,12,0,0,0,0,69,0,0,0),
(81,64,1025,8,0,1,0,0,0,0,64,0,0,0),
(82,65,1,8,0,1,0,0,0,0,65,0,0,0),
(83,66,0,4,4,10,79,0,0,0,66,0,0,0),
(84,189,33,2,2,4,0,0,0,0,0,0,0,0),
(85,76,2081,5,4,10,0,0,0,0,0,0,0,0),
(86,770,64,0,1,0,769,0,0,0,771,0,0,0),
(87,70,1,8,0,1,0,0,0,0,70,0,0,0),
(88,71,33,2,2,4,0,0,0,0,71,0,0,0),
(89,56,33,8,0,1,20,0,0,0,56,0,0,0),
(90,73,1,8,0,1,0,0,0,0,73,0,0,0),
(91,74,0,8,0,1,0,0,0,0,74,0,0,0),
(92,75,0,8,0,1,0,0,0,0,0,0,0,0),
(93,14,8,8,0,1,0,0,0,0,0,0,0,0),
(94,77,0,0,8,0,0,0,0,0,0,0,0,0),
(95,78,1,8,0,1,0,0,0,0,78,0,0,0),
(96,79,0,2,2,0,66,0,0,0,79,0,0,0),
(97,70,64,8,0,0,79,0,0,0,70,0,0,0),
(98,68,8,4,4,10,0,0,0,0,0,0,0,0),
(99,36,8,8,0,0,0,0,0,0,0,0,0,0),
(100,77,32,0,0,9,0,0,0,0,0,0,0,0),
(101,77,0,0,8,4,0,0,0,0,0,0,0,0),
(102,77,0,0,8,2,0,0,0,0,0,0,0,0),
(103,80,65,8,0,1,689,0,0,0,80,0,0,0),
(104,81,0,4,4,2,0,0,0,0,0,0,0,0),
(105,81,2081,5,4,10,0,0,0,0,0,0,0,0),
(106,66,33,4,4,10,0,0,0,0,0,0,0,0),
(107,33,0,8,0,1,0,0,0,0,0,0,0,0),
(108,70,64,0,0,0,79,0,0,0,70,0,0,0),
(109,110,1,8,0,1,0,0,0,0,110,111,0,0),
(110,110,33,8,0,1,85,0,0,0,110,0,0,0),
(111,85,1,8,0,1,0,0,0,0,85,111,0,0),
(112,85,33,8,0,1,110,0,0,0,85,111,0,0),
(113,40,2056,1,1,0,0,0,0,0,0,0,0,0),
(114,77,0,0,0,1,0,0,0,0,0,0,0,0),
(115,8,72,3,2,12,0,0,0,0,0,0,0,0),
(116,9,72,5,4,10,0,0,0,0,0,0,0,0),
(118,68,33,4,4,2,0,0,0,0,0,0,0,0),
(119,87,1,8,0,1,0,0,0,0,87,0,0,0),
(120,21,0,0,0,0,0,0,0,0,21,0,0,0),
(121,21,6177,1,0,8,0,0,0,0,21,0,0,0),
(122,47,33,2,2,4,0,0,0,0,0,0,0,0),
(123,72,33,2,2,4,0,0,0,0,0,0,0,0),
(124,69,33,2,2,4,0,0,0,0,0,0,0,0),
(125,76,33,4,4,2,0,0,0,0,0,0,0,0),
(126,530,0,4,4,2,0,0,0,0,0,0,0,0),
(127,35,32,0,0,1,0,0,0,0,0,0,0,0),
(128,88,1,8,0,1,0,0,0,0,88,0,0,0),
(129,89,1,8,0,1,0,0,0,0,89,0,0,0),
(130,90,1,8,0,1,0,0,0,0,90,0,0,0),
(131,91,1,8,0,1,0,0,0,0,91,0,0,0),
(132,92,1,8,0,1,0,0,0,0,92,0,0,0),
(133,93,1,8,0,1,0,0,0,0,93,0,0,0),
(134,94,1,8,0,1,0,0,0,0,94,0,0,0),
(148,14,0,8,0,1,0,0,0,0,0,0,0,0),
(149,108,1025,2,2,0,0,0,0,0,0,0,0,0),
(150,108,2081,3,2,12,0,0,0,0,0,0,0,0),
(151,108,0,2,0,4,0,0,0,0,0,0,0,0),
(152,109,1,8,0,1,0,0,0,0,109,111,0,0),
(153,109,0,8,0,0,0,0,0,0,109,111,0,0),
(154,111,1,8,0,1,0,0,0,0,109,85,111,110),
(168,128,0,0,0,1,0,0,0,0,0,0,0,0),
(188,148,1025,0,0,0,0,0,0,0,148,28,0,0),
(189,7,1024,0,0,0,0,0,0,0,0,0,0,0),
(190,148,0,0,0,0,0,0,0,0,0,0,0,0),
(208,168,5,2,2,0,0,0,0,0,168,0,0,0),
(209,168,2,2,2,0,0,0,0,0,168,0,0,0),
(210,189,33,2,2,12,0,0,0,0,189,0,0,0),
(230,573,1,8,0,1,0,0,0,0,573,0,0,0),
(231,40,2120,3,2,8,0,0,0,0,0,0,0,0),
(232,40,2120,5,4,8,0,0,0,0,0,0,0,0),
(233,20,33,8,0,1,68,0,0,0,20,0,0,0),
(250,40,2120,1,1,8,0,0,0,0,0,0,0,0),
(270,229,1,8,0,1,0,0,0,0,229,0,0,0),
(290,40,8,1,1,0,0,0,0,0,0,0,0,0),
(310,249,1,8,0,1,0,0,0,0,249,0,0,0),
(311,249,1,8,0,0,0,0,0,0,249,0,0,0),
(312,22,1,8,0,1,0,0,0,0,22,0,0,0),
(330,229,1,8,0,0,0,0,0,0,229,0,0,0),
(350,88,0,8,0,0,0,0,0,0,88,0,0,0),
(370,915,33,8,8,1,912,0,0,0,915,0,0,0),
(371,269,0,2,2,4,0,0,0,0,269,0,0,0),
(390,21,33,0,0,0,60,0,0,0,21,0,0,0),
(410,43,1,8,0,1,0,0,0,0,43,0,0,0),
(411,310,1,8,0,1,0,0,0,0,310,0,0,0),
(412,510,33,4,4,2,509,0,0,0,510,0,0,0),
(413,309,1,8,0,1,0,0,0,0,309,0,0,0),
(414,576,1,8,0,1,65,0,0,0,576,0,0,0),
(415,311,1,8,0,1,0,0,0,0,311,0,0,0),
(416,311,0,8,0,0,0,0,0,0,0,0,0,0),
(430,329,0,0,0,0,0,0,0,0,0,0,0,0),
(450,229,33,8,0,1,40,0,0,0,229,0,0,0),
(470,311,0,8,0,1,0,0,0,0,0,0,0,0),
(471,349,1,0,0,0,0,0,0,0,349,0,0,0),
(472,70,65,8,0,1,349,0,0,0,70,0,0,0),
(473,349,65,0,0,0,70,0,0,0,349,0,0,0),
(474,369,0,0,0,0,0,0,0,0,369,0,0,0),
(475,369,6177,1,0,8,0,0,0,0,369,0,0,0),
(494,389,32,8,0,1,53,0,0,0,389,0,0,0),
(495,40,2121,1,1,8,0,0,0,0,40,0,0,0),
(514,409,1,8,0,1,0,0,0,0,409,0,0,0),
(534,189,0,2,2,0,0,0,0,0,0,0,0,0),
(554,429,1,8,0,7,0,0,0,0,429,0,0,0),
(574,449,33,8,0,1,450,0,0,0,449,0,0,0),
(575,450,0,8,0,1,0,0,0,0,450,0,0,0),
(594,32,0,8,0,0,0,0,0,0,0,0,0,0),
(614,36,9,0,1,0,0,0,0,0,36,0,0,0),
(634,14,0,8,0,0,0,0,0,0,0,0,0,0),
(635,609,1,0,0,0,0,0,0,0,609,0,0,0),
(636,576,0,8,0,1,65,0,0,0,576,0,0,0),
(637,470,6177,1,0,8,0,0,0,0,470,0,0,0),
(654,82,1,8,0,1,0,0,0,0,82,0,0,0),
(655,90,9,8,0,5,0,0,0,0,90,0,0,0),
(674,48,1,0,0,0,0,0,0,0,48,0,0,0),
(694,189,0,2,2,4,0,0,0,0,189,0,0,0),
(695,749,1,0,0,0,0,0,0,0,749,0,0,0),
(714,66,33,4,4,10,0,0,0,0,0,0,0,0),
(734,48,1,1,1,0,0,0,0,0,48,0,0,0),
(735,489,0,1,1,0,0,0,0,0,489,0,0,0),
(736,489,1,8,0,1,0,0,0,0,489,0,0,0),
(754,48,65,8,0,1,34,0,0,0,48,0,0,0),
(774,40,8,3,2,0,0,0,0,0,0,0,0,0),
(775,40,8,5,4,0,0,0,0,0,0,0,0,0),
(776,910,0,0,0,0,249,80,0,0,910,531,0,0),
(777,912,33,1,1,0,915,0,0,0,912,0,0,0),
(778,511,1,8,0,1,0,0,0,0,511,0,0,0),
(794,529,0,1,0,0,0,0,0,0,529,0,0,0),
(795,572,1,8,0,1,0,0,0,0,572,0,0,0),
(814,529,1,1,0,0,0,0,0,0,529,0,0,0),
(834,74,1,8,0,1,0,0,0,0,74,0,0,0),
(854,577,6177,1,0,8,0,0,0,0,577,0,0,0),
(855,577,0,0,0,0,0,0,0,0,577,0,0,0),
(874,589,33,2,2,4,0,0,0,0,0,0,0,0),
(875,54,0,2,2,4,0,0,0,0,0,0,0,0),
(876,530,33,4,4,2,0,0,0,0,0,0,0,0),
(877,530,2081,5,4,10,0,0,0,0,0,0,0,0),
(894,108,0,2,2,4,0,0,0,0,108,0,0,0),
(914,679,0,0,0,0,0,0,0,0,0,0,0,0),
(934,575,0,8,0,1,0,0,0,0,575,0,0,0),
(954,73,0,8,0,1,0,0,0,0,73,0,0,0),
(974,20,0,8,0,1,0,0,0,0,20,0,0,0),
(994,609,0,0,0,0,0,0,0,0,609,0,0,0),
(995,81,33,4,4,2,0,0,0,0,0,0,0,0),
(996,609,33,1,0,8,249,0,0,0,609,0,0,0),
(1014,629,1,0,0,0,0,0,0,0,629,0,0,0),
(1015,629,0,0,0,0,0,0,0,0,629,0,0,0),
(1034,66,0,4,0,2,0,0,0,0,0,0,0,0),
(1054,189,2081,3,2,12,0,0,0,0,189,0,0,0),
(1055,189,33,2,2,4,0,0,0,0,189,0,0,0),
(1074,76,1,4,4,2,0,0,0,0,0,0,0,0),
(1075,108,1,2,2,4,0,0,0,0,108,0,0,0),
(1076,69,1,2,2,4,0,0,0,0,69,0,0,0),
(1077,108,33,2,2,4,0,0,0,0,108,0,0,0),
(1078,72,1,2,2,4,0,0,0,0,72,0,0,0),
(1080,31,8,0,1,0,74,0,0,0,31,649,0,0),
(1081,74,1,8,0,1,649,0,0,0,74,0,0,0),
(1094,23,1024,0,0,0,0,0,0,0,0,0,0,0),
(1095,679,0,0,0,0,0,0,0,0,0,0,0,0),
(1096,108,2080,3,2,12,679,0,0,0,0,0,0,0),
(1097,69,32,2,2,4,0,0,0,0,0,0,0,0),
(1114,689,64,8,0,1,80,0,0,0,689,0,0,0),
(1134,68,2080,5,4,10,679,0,0,0,0,0,0,0),
(1154,68,2080,5,4,10,679,0,0,0,0,0,0,0),
(1174,76,73,4,4,2,0,0,0,0,0,0,0,0),
(1194,709,0,0,0,0,0,0,0,0,0,0,0,0),
(1214,729,33,5,4,10,730,0,0,0,729,0,0,0),
(1215,729,1,4,4,2,730,0,0,0,729,0,0,0),
(1216,730,33,3,2,12,729,0,0,0,730,0,0,0),
(1217,730,1,2,2,4,729,0,0,0,730,0,0,0),
(1234,750,33,8,0,1,749,0,0,0,750,0,0,0),
(1235,750,1,8,0,1,749,0,0,0,750,0,0,0),
(1236,750,0,8,0,1,749,0,0,0,750,0,0,0),
(1254,609,4129,1,0,8,0,0,0,0,609,0,0,0),
(1274,7,33,0,0,4,0,0,0,0,0,0,0,0),
(1275,7,33,0,0,2,0,0,0,0,0,0,0,0),
(1294,771,0,8,0,1,770,0,0,0,0,0,0,0),
(1314,66,65,4,4,2,0,0,0,0,0,0,0,0),
(1315,189,65,2,2,4,0,0,0,0,0,0,0,0),
(1334,730,0,2,2,4,729,0,0,0,730,0,0,0),
(1335,729,0,4,4,2,730,0,0,0,729,0,0,0),
(1354,809,0,0,0,0,0,0,0,0,809,0,0,0),
(1355,809,1,0,0,0,0,0,0,0,809,0,0,0),
(1374,829,1,8,0,1,0,0,0,0,38,0,0,0),
(1375,77,32,0,0,9,0,0,0,0,0,0,0,0),
(1394,80,33,8,0,1,689,47,0,0,80,0,0,0),
(1395,916,1,8,0,1,0,0,0,0,916,0,0,0),
(1414,790,0,0,0,4,0,0,0,0,0,0,0,0),
(1415,849,0,0,0,2,0,0,0,0,0,0,0,0),
(1434,869,1,8,0,1,0,0,0,0,869,0,0,0),
(1454,36,9,0,1,0,35,0,0,0,36,0,0,0),
(1474,59,1,0,0,0,0,0,0,0,59,0,0,0),
(1475,59,0,0,0,0,0,0,0,0,59,0,0,0),
(1494,66,0,4,4,2,0,0,0,0,66,0,0,0),
(1495,66,2081,5,4,10,0,0,0,0,66,0,0,0),
(1496,66,33,4,4,2,0,0,0,0,66,0,0,0),
(1514,890,33,2,2,4,0,0,0,0,0,0,0,0),
(1515,889,33,4,4,2,0,0,0,0,0,0,0,0),
(1534,730,33,2,2,4,729,0,0,0,730,0,0,0),
(1554,729,2120,5,4,8,0,0,0,0,0,0,0,0),
(1555,909,0,0,0,0,0,0,0,0,909,0,0,0),
(1574,270,0,0,0,0,0,0,0,0,270,0,0,0),
(1575,72,33,3,2,12,0,0,0,0,0,0,0,0),
(1576,269,33,2,2,4,0,0,0,0,269,0,0,0),
(1577,509,33,2,2,4,510,0,0,0,509,0,0,0),
(1594,69,33,3,2,12,0,0,0,0,0,0,0,0),
(1595,76,33,5,4,10,0,0,0,0,0,0,0,0),
(1596,730,33,3,2,12,729,0,0,0,730,0,0,0),
(1597,729,33,5,4,10,730,0,0,0,729,0,0,0),
(1598,510,0,4,4,2,509,0,0,0,510,0,0,0),
(1599,509,0,2,2,4,510,0,0,0,509,0,0,0),
(1600,69,33,2,2,8,0,0,0,0,0,0,0,0),
(1601,910,33,0,0,0,249,80,0,0,910,531,0,0),
(1602,911,33,4,4,2,0,0,0,0,0,0,0,0),
(1603,911,2081,5,4,10,0,0,0,0,0,0,0,0),
(1604,911,0,4,4,2,0,0,0,0,0,0,0,0),
(1605,531,0,0,0,1,0,0,0,0,531,0,0,0),
(1606,7,0,0,4,2,7,0,0,0,0,0,0,0),
(1607,7,0,0,4,2,7,0,0,0,0,0,0,0),
(1608,609,73,1,0,8,249,0,0,0,609,0,0,0),
(1610,914,72,5,4,10,0,0,0,0,0,0,0,0),
(1611,47,65,3,2,4,916,0,0,0,0,0,0,0),
(1612,76,65,5,4,2,916,0,0,0,0,0,0,0),
(1613,912,0,1,1,0,915,0,0,0,912,0,0,0),
(1614,14,1,8,0,1,0,0,0,0,14,0,0,0),
(1615,169,6177,1,0,8,0,0,0,0,21,577,369,0),
(1616,919,0,0,15,0,918,0,0,0,919,0,0,0),
(1617,918,64,0,0,1,919,0,0,0,918,0,0,0),
(1618,47,33,2,2,12,0,0,0,0,0,0,0,0),
(1619,76,33,4,4,10,0,0,0,0,0,0,0,0),
(1620,128,0,0,0,15,0,0,0,0,0,0,0,0),
(1621,921,0,2,0,4,920,0,0,0,0,0,0,0),
(1622,920,0,2,0,4,921,0,0,0,0,0,0,0),
(1623,922,0,4,4,2,0,0,0,0,0,0,0,0),
(1624,529,2115,1,0,8,0,0,0,0,529,0,0,0),
(1625,529,4129,1,0,8,0,0,0,0,529,0,0,0),
(1626,20,33,8,0,1,679,0,0,0,20,0,0,0),
(1627,923,33,4,4,2,0,0,0,0,0,0,0,0),
(1628,922,35,4,4,2,0,0,0,0,0,0,0,0),
(1629,927,72,3,2,12,0,0,0,0,0,0,0,0),
(1630,928,8229,8,0,7,14,148,0,0,928,20,0,0),
(1634,928,33,8,0,0,68,72,0,0,928,20,0,0),
(1635,169,6161,0,0,0,891,0,0,0,169,892,0,0),
(1636,923,1,4,4,2,0,0,0,0,0,0,0,0),
(1637,923,0,4,4,2,0,0,0,0,0,0,0,0),
(1638,930,0,2,2,4,0,0,0,0,0,0,0,0),
(1639,930,2081,3,2,12,0,0,0,0,0,0,0,0),
(1640,930,33,2,2,4,0,0,0,0,0,0,0,0),
(1641,889,1,4,4,2,0,0,0,0,0,0,0,0),
(1642,890,1,2,2,4,0,0,0,0,0,0,0,0),
(1643,937,1,8,0,1,0,0,0,0,937,0,0,0),
(1644,940,33,2,2,4,0,0,0,0,0,0,0,0),
(1645,940,2081,3,2,12,0,0,0,0,0,0,0,0),
(1646,930,33,2,2,4,0,0,0,0,0,0,0,0),
(1647,930,2081,3,2,12,0,0,0,0,0,0,0,0),
(1648,940,0,2,2,4,0,0,0,0,72,0,0,0),
(1649,940,1,2,2,4,0,0,0,0,72,0,0,0),
(1650,941,2081,5,4,10,0,0,0,0,0,0,0,0),
(1651,941,33,4,4,2,28,0,0,0,0,0,0,0),
(1652,941,0,4,4,2,0,0,0,0,0,0,0,0),
(1653,941,1,4,4,2,0,0,0,0,0,0,0,0),
(1654,930,0,2,2,4,0,0,0,0,69,0,0,0),
(1655,930,1,2,2,4,0,0,0,0,69,0,0,0),
(1656,911,2081,5,4,10,0,0,0,0,0,0,0,0),
(1657,911,33,4,4,2,0,0,0,0,0,0,0,0),
(1658,911,0,4,4,2,0,0,0,0,0,0,0,0),
(1659,942,33,1,0,8,60,0,0,0,942,0,0,0),
(1660,942,0,1,0,8,0,0,0,0,942,0,0,0),
(1661,942,4129,1,0,8,0,0,0,0,942,0,0,0),
(1662,943,1,8,0,1,0,0,0,0,943,0,0,0),
(1663,944,289,8,0,1,945,0,0,0,944,0,0,0),
(1664,945,33,8,0,1,944,0,0,0,945,0,0,0),
(1665,0,2080,1,7,8,0,0,0,0,0,0,0,0),
(1666,946,2081,3,2,12,0,0,0,0,0,0,0,0),
(1667,946,1,2,2,4,0,0,0,0,72,0,0,0),
(1668,947,2081,5,4,10,0,0,0,0,0,0,0,0),
(1669,947,1,4,4,2,0,0,0,0,0,0,0,0),
(1670,947,33,4,4,2,0,0,0,0,0,0,0,0),
(1671,946,33,2,2,4,0,0,0,0,0,0,0,0),
(1672,949,64,1,7,0,952,0,0,0,949,0,0,0),
(1673,950,0,0,0,0,951,0,0,0,950,0,0,0),
(1674,953,0,0,15,0,951,0,0,0,950,953,0,0),
(1675,952,64,0,15,0,949,0,0,0,952,0,0,0),
(1676,954,0,0,15,0,0,0,0,0,954,0,0,0),
(1677,951,0,0,15,0,0,0,0,0,954,0,0,0),
(1678,956,1,8,0,1,0,0,0,0,956,0,0,0),
(1679,955,1,8,0,1,40,0,0,0,955,0,0,0),
(1680,74,37,0,1,0,957,0,0,0,74,0,0,0),
(1681,957,36,8,0,1,74,0,0,0,74,0,0,0),
(1682,958,32,0,0,0,958,0,0,0,0,0,0,0),
(1683,959,293,0,0,0,960,0,0,0,959,0,0,0),
(1684,960,293,0,0,0,959,0,0,0,960,0,0,0),
(1685,961,0,2,0,4,0,0,0,0,961,0,0,0),
(1686,961,33,2,2,4,962,0,0,0,961,0,0,0),
(1687,962,1,8,0,1,961,0,0,0,962,0,0,0),
(1688,963,32,0,1,0,964,0,0,0,963,0,0,0),
(1689,964,32,0,1,0,963,0,0,0,964,0,0,0),
(1690,963,0,0,1,0,964,0,0,0,963,0,0,0),
(1691,964,0,0,1,0,963,0,0,0,964,0,0,0),
(1692,965,161,8,8,1,966,0,0,0,965,0,0,0),
(1693,966,161,8,8,1,965,0,0,0,966,0,0,0),
(1694,930,1,2,2,4,0,0,0,0,0,0,0,0),
(1695,911,0,4,4,2,0,0,0,0,0,0,0,0),
(1696,967,1,0,0,0,0,0,0,0,967,0,0,0),
(1697,943,1,8,0,1,946,947,0,0,943,0,0,0),
(1698,930,0,2,2,4,968,0,0,0,930,0,0,0),
(1699,930,1,2,2,4,968,0,0,0,930,0,0,0),
(1700,930,33,2,2,4,968,0,0,0,930,0,0,0),
(1701,968,33,8,0,7,930,0,0,0,968,0,0,0),
(1702,968,1,8,0,7,930,0,0,0,968,0,0,0),
(1703,679,0,0,0,0,0,0,0,0,0,0,0,0),
(1704,943,1,8,0,1,679,0,0,0,943,0,0,0),
(1705,943,1,8,0,1,0,0,0,0,943,679,0,0),
(1706,971,33,8,0,1,970,0,0,0,971,0,0,0),
(1707,970,0,1,0,8,0,0,0,0,970,0,0,0),
(1708,970,1,1,0,8,0,0,0,0,970,0,0,0),
(1709,970,33,1,0,8,971,0,0,0,970,0,0,0),
(1710,942,1,1,0,8,0,0,0,0,942,0,0,0),
(1711,973,33,8,0,1,974,0,0,0,973,0,0,0),
(1712,974,1,8,0,1,0,0,0,0,974,0,0,0),
(1713,974,1024,8,0,1,0,0,0,0,974,0,0,0),
(1714,968,33,8,0,7,930,975,0,0,968,0,0,0),
(1715,975,17,8,0,1,0,0,0,0,975,0,0,0),
(1716,976,1024,0,1,8,0,0,0,0,976,0,0,0),
(1717,976,1,0,1,0,0,0,0,0,976,0,0,0),
(1718,976,33,0,1,0,977,0,0,0,976,0,0,0),
(1719,976,0,0,1,8,0,0,0,0,976,0,0,0),
(1720,977,32,8,0,1,976,0,0,0,977,0,0,0),
(1721,978,2081,3,2,12,0,0,0,0,978,0,0,0),
(1722,978,0,2,2,4,0,0,0,0,978,0,0,0),
(1723,978,1,2,2,4,0,0,0,0,978,0,0,0),
(1724,978,33,2,2,4,0,0,0,0,978,0,0,0),
(1725,979,1,0,7,8,0,0,0,0,469,67,0,0),
(1726,979,4129,0,7,0,0,0,0,0,469,67,0,0),
(1727,979,0,0,7,8,0,0,0,0,469,67,0,0),
(1728,942,2080,1,0,8,14,0,0,0,942,0,0,0),
(1729,947,0,4,4,2,0,0,0,0,0,0,0,0),
(1730,933,33,1,0,8,0,0,0,0,933,0,0,0),
(1731,933,0,1,0,8,0,0,0,0,933,0,0,0),
(1732,189,0,2,2,4,0,0,0,0,0,0,0,0),
(1733,189,1,2,2,4,0,0,0,0,0,0,0,0),
(1734,66,1,4,4,2,0,0,0,0,0,0,0,0),
(1735,66,0,4,4,2,0,0,0,0,0,0,0,0),
(1736,966,161,8,8,0,965,0,0,0,966,0,0,0),
(1737,946,0,2,2,4,0,0,0,0,72,0,0,0),
(1738,981,1,8,0,1,0,0,0,0,981,0,0,0),
(1739,982,0,0,0,1,0,0,0,0,982,0,0,0),
(1740,983,0,0,0,1,0,0,0,0,982,0,0,0),
(1741,935,0,1,0,8,0,0,0,0,935,0,0,0),
(1742,984,0,0,0,1,0,0,0,0,984,0,0,0),
(1743,932,0,0,0,0,0,0,0,0,932,0,0,0),
(1744,934,0,0,0,0,0,0,0,0,934,0,0,0),
(1745,911,33,4,4,2,679,0,0,0,0,0,0,0),
(1746,934,289,0,0,0,0,0,0,0,934,0,0,0),
(1747,985,2121,1,1,0,986,987,0,0,985,0,0,0),
(1748,986,33,8,0,1,985,0,0,0,986,0,0,0),
(1749,987,33,0,0,0,985,0,0,0,987,0,0,0),
(1750,988,1,8,0,1,0,0,0,0,14,0,0,0),
(1751,14,33,8,0,1,932,935,0,0,0,0,0,0),
(1752,993,33,8,0,7,991,992,943,529,993,0,0,0),
(1753,993,32,8,0,7,991,992,943,529,993,0,0,0),
(1754,993,96,8,0,7,991,992,943,529,993,0,0,0),
(1755,991,33,2,2,0,993,0,0,0,991,992,0,0),
(1756,991,1,2,2,0,993,0,0,0,991,992,0,0),
(1757,991,65,2,2,0,993,0,0,0,991,992,0,0),
(1758,992,33,4,4,0,993,0,0,0,992,991,0,0),
(1759,992,65,4,4,0,993,0,0,0,992,991,0,0),
(1760,992,1,4,4,0,993,0,0,0,992,991,0,0),
(1761,994,36,0,0,15,994,0,0,0,0,0,0,0),
(1762,995,36,0,0,7,996,997,998,994,0,0,0,0),
(1763,996,36,0,0,7,997,998,994,995,0,0,0,0),
(1764,997,36,0,0,7,998,994,995,996,0,0,0,0),
(1765,998,36,0,0,7,994,995,996,997,0,0,0,0),
(1766,529,2115,0,0,0,993,0,0,0,529,0,0,0),
(1767,529,2083,0,0,0,993,0,0,0,529,0,0,0),
(1768,73,33,0,0,15,14,529,0,0,73,0,0,0),
(1769,73,65,0,0,15,14,529,0,0,73,0,0,0),
(1770,959,293,0,1,0,960,0,0,0,959,0,0,0),
(1771,960,293,0,0,1,959,0,0,0,960,0,0,0),
(1772,999,17,8,0,1,968,0,0,0,999,0,0,0),
(1773,1000,0,0,1,0,0,0,0,0,1000,0,0,0),
(1774,31,0,0,1,0,1000,0,0,0,31,0,0,0),
(1775,935,6177,1,0,8,0,0,0,0,935,0,0,0),
(1776,932,4113,0,0,0,1010,0,0,0,932,0,0,0),
(1777,932,17,0,0,0,0,0,0,0,932,0,0,0),
(1778,990,0,0,0,0,0,0,0,0,990,0,0,0),
(1779,989,0,0,0,0,0,0,0,0,989,0,0,0),
(1780,1001,33,8,0,1,929,0,0,0,1001,0,0,0),
(1781,929,33,8,0,1,1001,0,0,0,929,0,0,0),
(1782,1001,32,8,0,1,929,0,0,0,1001,0,0,0),
(1783,929,32,8,0,1,1001,0,0,0,929,0,0,0),
(1784,1001,1,8,0,1,929,0,0,0,1001,0,0,0),
(1785,929,32,8,0,1,1001,0,0,0,929,0,0,0),
(1786,73,1,8,0,1,0,0,0,0,73,0,0,0),
(1787,14,33,8,0,1,994,0,0,0,14,0,0,0),
(1788,933,33,1,0,8,968,0,0,0,933,0,0,0),
(1789,968,33,8,0,7,933,0,0,0,968,0,0,0),
(1790,1001,289,8,0,1,929,0,0,0,1001,0,0,0),
(1791,929,289,8,0,1,1001,0,0,0,929,0,0,0),
(1792,943,33,8,0,1,0,0,0,0,943,0,0,0),
(1793,968,32,8,0,7,930,0,0,0,968,0,0,0),
(1794,1003,1,0,1,0,0,0,0,0,1003,0,0,0),
(1795,1003,33,0,1,0,956,0,0,0,1003,0,0,0),
(1796,956,33,8,0,1,1003,0,0,0,956,0,0,0),
(1797,1003,0,0,1,0,0,0,0,0,1003,0,0,0),
(1798,1004,33,8,0,1,0,0,0,0,968,1004,0,0),
(1799,1002,1,8,0,1,956,0,0,0,1002,0,0,0),
(1800,956,1,8,0,1,1002,0,0,0,956,0,0,0),
(1801,67,33,5,4,10,0,0,0,0,0,0,0,0),
(1802,469,33,3,2,12,0,0,0,0,0,0,0,0),
(1803,148,33,0,0,4,0,0,0,0,0,0,0,0),
(1804,148,33,0,0,2,0,0,0,0,0,0,0,0),
(1805,932,0,1,1,0,0,0,0,0,932,0,0,0),
(1806,31,4097,0,1,8,0,0,0,0,31,0,0,0),
(1807,1003,2121,1,1,8,0,0,0,0,1003,0,0,0),
(1808,1007,32,8,0,1,0,0,0,0,1007,0,0,0),
(1809,1009,32,8,0,1,0,0,0,0,1009,0,0,0),
(1810,1006,32,8,0,1,0,0,0,0,1006,0,0,0),
(1811,1008,32,8,0,1,0,0,0,0,1008,0,0,0),
(1812,31,4161,0,1,8,0,0,0,0,31,0,0,0),
(1813,1010,1,8,0,1,1023,0,0,0,1010,0,0,0),
(1814,966,32,8,8,1,965,0,0,0,966,0,0,0),
(1815,29,65,8,0,1,28,0,0,0,29,0,0,0),
(1816,31,1024,0,1,0,0,0,0,0,31,0,0,0),
(1818,1011,0,0,0,0,0,0,0,0,1011,0,0,0),
(1819,189,2081,2,2,12,73,0,0,0,471,0,0,0),
(1820,1012,33,0,0,0,0,0,0,0,1012,0,0,0),
(1821,1013,0,0,1,0,0,0,0,0,1013,0,0,0),
(1822,1014,0,0,1,0,0,0,0,0,1013,0,0,0),
(1823,956,32,8,0,1,0,0,0,0,956,0,0,0),
(1824,1015,33,0,0,0,0,0,0,0,1015,0,0,0),
(1825,73,73,0,0,15,14,529,0,0,73,0,0,0),
(1826,1010,33,8,0,1,73,1023,0,0,1010,0,0,0),
(1827,1016,1,8,0,1,0,0,0,0,1016,0,0,0),
(1828,1017,64,0,0,0,1016,0,0,0,1017,0,0,0),
(1829,1018,32,0,1,0,0,0,0,0,1018,14,0,0),
(1830,1019,32,0,1,0,0,0,0,0,1019,14,0,0),
(1831,1020,32,0,1,0,0,0,0,0,1020,14,0,0),
(1832,1021,32,0,1,0,0,0,0,0,1021,14,0,0),
(1833,1022,32,0,1,0,0,0,0,0,1022,14,0,0),
(1834,1023,73,0,0,15,14,1010,0,0,1023,0,0,0),
(1835,66,2081,4,4,10,73,0,0,0,471,0,0,0),
(1836,933,4129,1,0,8,0,0,0,0,933,0,0,0),
(1837,970,4129,1,0,8,971,0,0,0,970,0,0,0),
(1838,934,4385,0,0,0,1010,0,0,0,934,0,0,0),
(1839,1024,33,8,0,1,1025,0,0,0,1024,0,0,0),
(1840,1025,32,1,7,0,1024,0,0,0,1025,0,0,0),
(1841,1026,32,0,1,0,0,0,0,0,1026,0,0,0),
(1842,1027,0,0,0,1,0,0,0,0,0,0,0,0),
(1843,1010,65,8,0,1,932,934,1033,1012,1010,0,0,0),
(1844,932,17,0,0,0,1010,0,0,0,932,0,0,0),
(1845,934,289,0,0,0,1010,0,0,0,934,0,0,0),
(1846,1028,1,8,0,1,0,0,0,0,1028,0,0,0),
(1847,965,0,8,8,1,966,0,0,0,965,0,0,0),
(1848,966,0,8,8,1,965,0,0,0,966,0,0,0),
(1849,1010,32,8,0,1,1023,0,0,0,1010,0,0,0),
(1850,1015,33,0,0,0,52,0,0,0,1015,0,0,0),
(1851,1011,6177,1,0,8,0,0,0,0,1011,0,0,0),
(1852,1029,0,0,1,0,0,0,0,0,963,964,1029,0),
(1853,1010,33,8,0,1,932,934,0,0,1010,0,0,0),
(1854,932,17,0,0,0,1030,0,0,0,932,934,0,0),
(1855,934,289,0,0,0,1030,0,0,0,934,932,0,0),
(1856,1031,0,1,0,0,0,0,0,0,1031,0,0,0),
(1857,31,6177,1,1,8,0,0,0,0,1032,0,0,0),
(1858,1012,321,0,1,0,1030,0,0,0,932,934,1012,1033),
(1859,1033,321,0,1,0,1030,0,0,0,932,934,1012,1033),
(1860,1034,1,0,1,0,0,0,0,0,1034,0,0,0),
(1862,1035,1,8,0,1,0,0,0,0,1035,0,0,0),
(1863,52,4161,8,0,1,1015,1036,932,934,52,0,0,0),
(1864,1036,65,8,0,1,52,0,0,0,14,0,0,0),
(1865,52,1,8,0,1,0,0,0,0,52,0,0,0),
(1866,1012,65,1,0,0,1010,0,0,0,1012,0,0,0),
(1867,1033,328,0,1,0,1010,0,0,0,932,934,1012,1033),
(1868,966,161,0,1,0,965,0,0,0,966,0,0,0),
(1869,981,1,8,0,0,0,0,0,0,1035,0,0,0),
(1870,1031,4129,1,0,0,0,0,0,0,1031,0,0,0),
(1871,1035,65,8,0,1,0,0,0,0,1035,0,0,0),
(1872,1038,0,1,0,0,0,0,0,0,1038,0,0,0),
(1873,1024,33,8,0,1,0,0,0,0,1024,0,0,0),
(1874,1038,4097,1,0,0,0,0,0,0,1038,0,0,0),
(1875,932,17,0,0,0,52,0,0,0,932,0,0,0),
(1876,934,289,0,0,0,52,0,0,0,934,0,0,0),
(1877,52,33,8,0,1,1015,932,934,0,52,0,0,0),
(1878,1041,1,8,0,1,0,0,0,0,1041,0,0,0),
(1879,1042,33,8,0,1,1031,0,0,0,1042,0,0,0),
(1880,52,0,8,0,1,0,0,0,0,52,0,0,0),
(1881,1035,64,8,0,1,0,0,0,0,1035,0,0,0),
(1882,1010,72,8,0,1,1023,0,0,0,1010,0,0,0),
(1883,1044,33,8,0,7,0,0,0,0,1044,0,0,0),
(1884,1047,1,8,8,1,0,0,0,0,0,0,0,0),
(1885,1045,129,8,0,1,0,0,0,0,1045,0,0,0),
(1886,7,1,8,0,1,0,0,0,0,7,0,0,0),
(1887,7,1024,8,0,0,0,0,0,0,7,7,0,0),
(1888,1046,1,8,8,1,0,0,0,0,1046,0,0,0),
(1889,1048,1,8,0,1,0,0,0,0,1048,0,0,0),
(1890,1049,1,8,0,1,0,0,0,0,1049,0,0,0),
(1891,1050,2081,3,2,4,0,0,0,0,1050,0,0,0),
(1892,1050,0,2,2,4,0,0,0,0,1050,0,0,0),
(1893,1050,64,3,2,4,1045,0,0,0,1050,0,0,0),
(1894,1045,289,8,0,1,0,0,0,0,1045,0,0,0),
(1895,1045,32,8,0,1,1050,0,0,0,1045,0,0,0),
(1896,909,6177,1,1,8,0,0,0,0,909,0,0,0),
(1897,1067,65,4,4,2,1045,1050,0,0,1052,1067,0,0),
(1898,1050,73,2,2,4,1067,0,0,0,1050,0,0,0),
(1899,1050,72,2,2,4,1067,0,0,0,1050,0,0,0),
(1900,1067,64,4,4,2,1053,0,0,0,1052,1067,0,0),
(1901,1052,1,4,4,2,0,0,0,0,1052,0,0,0),
(1902,960,1,8,0,1,0,0,0,0,0,0,0,0),
(1904,960,1,8,0,1,0,0,0,0,0,0,0,0),
(1905,1055,64,0,0,0,1054,0,0,0,1055,0,0,0),
(1906,1054,0,8,0,1,1055,0,0,0,1054,0,0,0),
(1907,949,0,1,0,8,949,0,0,0,948,0,0,0),
(1908,949,0,1,0,0,949,0,0,0,948,0,0,0),
(1909,42,1,0,0,9,14,0,0,0,42,0,0,0),
(1910,1056,0,0,1,0,0,0,0,0,1056,0,0,0),
(1911,1057,0,0,1,0,0,0,0,0,1057,0,0,0),
(1912,1058,0,1,1,0,0,0,0,0,1058,0,0,0),
(1913,1059,0,0,7,0,0,0,0,0,1059,0,0,0),
(1914,1045,32,8,0,1,1067,1085,0,0,1045,0,0,0),
(1915,1060,0,0,0,0,0,0,0,0,1060,0,0,0),
(1916,1033,72,0,1,0,1010,0,0,0,932,934,1012,1033),
(1917,7,1,0,0,1,0,0,0,0,7,0,0,0),
(1918,1052,64,4,4,2,679,0,0,0,1052,0,0,0),
(1919,1062,32,8,0,1,1063,0,0,0,1062,0,0,0),
(1920,1063,64,3,0,4,1062,0,0,0,1063,0,0,0),
(1921,1064,1,0,4,2,0,0,0,0,1064,0,0,0),
(1922,1064,0,0,4,2,0,0,0,0,1064,0,0,0),
(1923,1064,2113,0,4,2,0,0,0,0,1064,0,0,0),
(1924,1065,1,8,0,1,0,0,0,0,1065,0,0,0),
(1925,14,64,8,0,9,14,0,0,0,0,0,0,0),
(1926,1068,1,2,0,4,0,0,0,0,1068,0,0,0),
(1927,1068,0,2,0,4,0,0,0,0,1068,0,0,0),
(1928,1067,0,4,0,2,0,0,0,0,1067,1052,0,0),
(1929,1067,1,4,0,2,0,0,0,0,1067,1052,0,0),
(1930,1069,0,0,0,0,0,0,0,0,1069,0,0,0),
(1931,1070,0,0,0,0,0,0,0,0,1070,0,0,0),
(1932,74,32,0,0,15,14,0,0,0,74,0,0,0),
(1933,31,0,0,4,0,0,0,0,0,31,0,0,0),
(1934,959,293,2,2,4,960,0,0,0,959,0,0,0),
(1935,959,293,4,4,2,960,0,0,0,959,0,0,0),
(1936,1071,0,0,0,0,0,0,0,0,0,0,0,0),
(1937,1071,0,0,0,0,0,0,0,0,0,0,0,0),
(1938,1071,0,0,0,0,0,0,0,0,0,0,0,0),
(1939,1071,0,0,0,0,0,0,0,0,0,0,0,0),
(1940,1071,0,0,0,0,0,0,0,0,0,0,0,0),
(1941,1071,0,0,0,0,0,0,0,0,0,0,0,0),
(1942,1071,0,0,0,0,0,0,0,0,960,0,0,0),
(1943,1071,0,0,0,0,0,0,0,0,0,0,0,0),
(1944,1071,0,0,0,0,0,0,0,0,0,0,0,0),
(1945,1071,8191,15,15,15,0,0,0,0,1071,551,189,0),
(1947,1071,8191,15,15,15,0,0,0,0,1071,551,189,0),
(1948,921,8191,1,2,1,469,0,0,0,921,0,0,0),
(1949,1073,33,0,0,0,1046,0,0,0,1073,0,0,0),
(1950,1073,33,0,0,0,0,0,0,0,1073,0,0,0),
(1951,69,33,2,2,12,22,29,0,0,69,0,0,0),
(1952,1074,0,0,1,0,0,0,0,0,1074,0,0,0),
(1953,973,65,8,0,1,974,0,0,0,973,0,0,0),
(1954,1076,129,8,0,1,0,0,0,0,1076,0,0,0),
(1955,1076,128,8,0,1,0,0,0,0,1076,0,0,0),
(1956,1077,1,1,0,0,0,0,0,0,1077,0,0,0),
(1957,1077,1,1,0,0,0,0,0,0,1077,0,0,0),
(1958,960,293,8,0,1,959,0,0,0,960,0,0,0),
(1959,960,293,0,1,0,959,0,0,0,960,0,0,0),
(1960,1077,4113,1,0,0,0,0,0,0,1077,0,0,0),
(1961,1078,72,0,15,0,1078,0,0,0,0,0,0,0),
(1962,20,32,8,0,1,73,0,0,0,20,0,0,0),
(1963,73,33,8,0,1,20,0,0,0,73,0,0,0),
(1964,20,33,8,0,1,73,0,0,0,20,0,0,0),
(1965,965,160,8,8,1,966,0,0,0,965,0,0,0),
(1966,19,65,8,0,0,60,0,0,0,19,0,0,0),
(1967,1077,0,1,0,0,1077,0,0,0,0,0,0,0),
(1968,1079,64,0,0,8,19,0,0,0,1079,0,0,0),
(1969,19,65,8,0,1,1079,0,0,0,19,0,0,0),
(1970,14,64,8,0,1,1079,0,0,0,14,0,0,0),
(1971,1080,1,0,1,0,0,0,0,0,1080,0,0,0),
(1972,1081,0,0,0,0,0,0,0,0,0,0,0,0),
(1973,1050,1,3,2,4,0,0,0,0,1050,0,0,0),
(1974,1050,65,2,2,4,1084,20,0,0,1050,0,0,0),
(1975,20,33,8,0,7,1050,0,0,0,20,0,0,0),
(1976,1050,33,3,2,4,679,0,0,0,1050,0,0,0),
(1977,1050,0,3,2,4,1050,0,0,0,0,0,0,0),
(1978,1085,1,4,0,2,0,0,0,0,1085,0,0,0),
(1979,1085,33,4,0,2,0,0,0,0,1085,0,0,0),
(1980,1085,33,4,0,2,20,0,0,0,1085,0,0,0),
(1981,1085,0,4,0,2,0,0,0,0,1085,0,0,0),
(1982,20,33,8,0,1,1085,0,0,0,20,0,0,0),
(1983,965,65,8,8,1,966,0,0,0,965,0,0,0),
(1984,966,65,8,8,1,965,0,0,0,966,0,0,0),
(1985,14,33,8,0,1,20,0,0,0,14,0,0,0),
(1986,40,2121,1,1,8,1057,1058,1056,0,40,0,0,0),
(1987,942,65,1,0,0,1086,0,0,0,942,148,0,0),
(1988,20,32,8,0,7,1050,0,0,0,20,0,0,0),
(1989,1086,65,8,0,1,148,942,0,0,1086,0,0,0),
(1990,148,65,8,0,1,0,0,0,0,148,942,0,0),
(1991,20,69,0,0,7,14,148,0,0,928,20,0,0),
(1992,14,64,0,0,9,14,0,0,0,0,0,0,0),
(1993,965,160,2,2,4,966,0,0,0,965,0,0,0),
(1994,966,32,2,2,4,965,0,0,0,966,0,0,0),
(1995,1059,0,0,5,2,0,0,0,0,1059,0,0,0),
(1997,1059,0,0,3,4,0,0,0,0,1059,0,0,0),
(1998,1087,129,8,0,1,0,0,0,0,1087,0,0,0),
(1999,974,1024,8,0,0,0,0,0,0,974,0,0,0),
(2000,974,1,8,0,0,0,0,0,0,974,0,0,0),
(2001,1088,65,8,8,1,1089,0,0,0,1088,0,0,0),
(2003,1089,65,8,8,1,1088,0,0,0,1089,0,0,0),
(2004,1050,64,3,2,4,20,0,0,0,1050,0,0,0),
(2005,20,33,8,0,7,1050,0,0,0,20,0,0,0),
(2006,1090,1,0,0,0,0,0,0,0,1090,0,0,0),
(2007,1090,0,0,0,0,0,0,0,0,1090,0,0,0),
(2008,1090,4097,0,0,0,0,0,0,0,1090,0,0,0),
(2009,1090,6145,1,0,0,0,0,0,0,1090,0,0,0),
(2010,1091,0,0,0,0,0,0,0,0,1091,0,0,0),
(2011,1091,1,0,0,0,0,0,0,0,1091,0,0,0),
(2012,1091,4097,0,0,0,0,0,0,0,1091,0,0,0),
(2013,1091,6145,0,0,0,0,0,0,0,1091,0,0,0),
(2014,1092,1,0,0,0,0,0,0,0,1092,0,0,0),
(2016,1092,65,0,0,0,20,0,0,0,1092,0,0,0),
(2017,1092,0,0,0,0,0,0,0,0,1092,0,0,0),
(2018,20,65,8,0,7,1092,0,0,0,20,0,0,0),
(2019,1064,65,0,4,2,20,0,0,0,1064,0,0,0),
(2020,1085,0,4,4,2,0,0,0,0,1085,0,0,0),
(2021,1082,0,3,2,4,0,0,0,0,1082,0,0,0),
(2022,14,72,8,0,1,0,0,0,0,14,0,0,0),
(2023,928,8229,9,0,6,14,148,0,0,928,20,0,0),
(2024,1067,2081,5,0,2,0,0,0,0,1067,0,0,0),
(2025,1094,1,3,2,4,67,0,0,0,1094,0,0,0),
(2026,1094,33,3,2,4,67,0,0,0,1094,0,0,0),
(2027,1094,0,3,2,4,67,0,0,0,1094,0,0,0),
(2028,148,512,0,1,0,0,0,0,0,0,0,0,0),
(2029,973,32,8,0,1,974,28,0,0,973,0,0,0),
(2030,973,32,8,0,1,974,28,0,0,973,0,0,0),
(2031,66,33,4,4,0,0,0,0,0,148,0,0,0),
(2032,1095,33,0,2,4,0,0,0,0,1095,0,0,0),
(2033,14,0,8,0,1,56,0,0,0,0,0,0,0),
(2034,1085,33,4,0,2,1095,0,0,0,1085,0,0,0),
(2035,20,65,8,0,7,31,0,0,0,20,0,0,0),
(2036,31,0,0,1,8,20,0,0,0,31,0,0,0),
(2037,1050,73,2,2,4,148,0,0,0,1050,0,0,0),
(2038,148,64,8,0,0,1050,0,0,0,148,0,0,0),
(2039,14,33,8,0,1,1050,0,0,0,14,0,0,0),
(2040,1050,64,3,2,4,14,0,0,0,1050,0,0,0),
(2041,1091,65,0,0,0,20,0,0,0,1091,0,0,0),
(2042,20,65,8,0,7,1091,0,0,0,20,0,0,0),
(2043,20,33,8,0,7,1050,1085,0,0,20,0,0,0),
(2044,1050,65,1,2,4,20,0,0,0,1050,0,0,0),
(2045,1085,33,0,4,2,20,0,0,0,1085,0,0,0),
(2046,40,72,5,4,8,0,0,0,0,0,0,0,0),
(2047,1073,32,0,0,0,965,0,0,0,0,0,0,0),
(2048,928,0,8,0,0,0,0,0,0,928,20,0,0),
(2049,928,8,0,0,0,0,0,0,0,928,20,0,0),
(2050,1098,0,1,0,0,0,0,0,0,1098,0,0,0),
(2051,1098,6177,1,0,0,0,0,0,0,1098,0,0,0),
(2052,1099,33,8,1,0,1050,1085,1101,1100,1099,0,0,0),
(2053,1100,65,1,6,0,20,1099,0,0,1100,0,0,0),
(2054,1101,33,0,6,0,20,1099,0,0,1101,0,0,0),
(2055,965,160,4,4,2,966,0,0,0,965,0,0,0),
(2056,966,32,4,4,2,965,0,0,0,966,0,0,0),
(2057,1066,1,8,0,1,0,0,0,0,1066,0,0,0),
(2058,1102,0,0,7,0,0,0,0,0,1102,0,0,0),
(2059,1103,0,0,7,0,0,0,0,0,1103,0,0,0),
(2060,1104,0,0,0,0,0,0,0,0,1104,0,0,0),
(2061,1104,65,0,0,0,1105,0,0,0,1104,0,0,0),
(2062,1104,6177,0,0,0,1105,0,0,0,1104,0,0,0),
(2063,1105,0,0,0,0,0,0,0,0,1105,0,0,0),
(2064,1105,65,0,0,0,1104,0,0,0,1105,0,0,0),
(2065,1105,1,0,0,0,14,0,0,0,1105,0,0,0),
(2066,1105,6177,0,0,0,1104,0,0,0,1105,0,0,0),
(2067,1091,65,0,0,8,14,0,0,0,1091,0,0,0),
(2068,20,33,8,0,7,1107,1106,959,0,20,0,0,0),
(2069,1107,33,8,0,7,1106,20,0,0,1107,0,0,0),
(2070,1106,0,0,0,0,0,0,0,0,1106,0,0,0),
(2071,1106,1,0,0,0,0,0,0,0,1106,0,0,0),
(2072,1106,6145,0,0,0,0,0,0,0,1106,0,0,0),
(2073,1106,33,0,0,0,1107,20,0,0,1106,0,0,0),
(2074,986,33,8,0,0,0,0,0,0,986,987,0,0),
(2075,1110,33,8,0,1,1108,0,0,0,1110,0,0,0),
(2076,1108,33,0,1,0,1110,1109,0,0,1108,0,0,0),
(2077,1108,65,0,1,0,1110,1109,0,0,1108,0,0,0),
(2078,1109,0,0,0,0,0,0,0,0,1109,0,0,0),
(2079,1108,65,0,1,0,1110,1109,0,0,1108,0,0,0),
(2080,20,65,8,0,7,1111,0,0,0,20,0,0,0),
(2081,1111,32,0,1,0,20,0,0,0,1111,0,0,0),
(2082,20,0,0,1,0,0,0,0,0,20,0,0,0),
(2083,20,1,0,1,0,0,0,0,0,20,0,0,0),
(2084,20,33,0,1,0,529,56,0,0,20,0,0,0),
(2085,20,2081,0,1,0,529,56,0,0,20,0,0,0),
(2086,529,0,8,0,1,0,0,0,0,529,0,0,0),
(2087,529,1,8,0,1,0,0,0,0,529,0,0,0),
(2088,960,33,0,0,1,20,56,0,0,960,0,0,0),
(2089,56,65,8,0,1,20,529,0,0,56,0,0,0),
(2090,1112,0,2,0,0,0,0,0,0,1112,0,0,0),
(2091,1113,0,4,0,0,0,0,0,0,1113,0,0,0),
(2092,1114,0,0,1,0,0,0,0,0,1114,0,0,0),
(2093,20,0,0,1,0,959,0,0,0,20,0,0,0),
(2094,20,0,0,1,0,0,0,0,0,20,0,0,0),
(2095,56,0,8,0,1,20,529,0,0,56,0,0,0),
(2096,56,0,0,0,0,20,529,0,0,56,0,0,0),
(2097,20,0,8,0,1,0,0,0,0,20,0,0,0),
(2098,1116,33,8,0,1,1115,0,0,0,1116,0,0,0),
(2099,1115,33,8,0,1,1116,0,0,0,1115,0,0,0),
(2100,20,65,0,1,8,529,56,0,0,20,0,0,0),
(2101,960,36,0,1,0,959,0,0,0,960,0,0,0),
(2102,960,36,0,0,1,959,0,0,0,960,0,0,0),
(2103,56,64,8,0,1,20,529,0,0,56,0,0,0),
(2104,965,160,1,1,0,966,0,0,0,965,0,0,0),
(2105,966,32,1,1,0,965,0,0,0,966,0,0,0),
(2106,148,17,8,0,1,28,0,0,0,148,0,0,0),
(2107,1119,33,8,0,0,1120,1121,0,0,1119,0,0,0),
(2108,1120,33,8,0,1,1119,0,0,0,1120,0,0,0),
(2109,1121,129,8,0,1,0,0,0,0,1121,0,0,0),
(2110,31,65,0,1,8,0,0,0,0,31,0,0,0),
(2111,14,33,8,0,1,31,0,0,0,14,0,0,0),
(2112,1119,33,8,0,0,1121,0,0,0,1119,0,0,0),
(2113,1121,161,8,0,1,1119,0,0,0,1121,0,0,0),
(2114,1045,129,8,0,1,0,0,0,0,1045,20,0,0),
(2115,959,33,0,1,8,1107,20,0,0,959,0,0,0),
(2116,1045,0,8,0,1,0,0,0,0,1045,0,0,0),
(2117,959,32,0,1,8,1107,20,0,0,959,0,0,0),
(2118,1122,33,0,1,0,1120,0,0,0,1122,0,0,0),
(2119,1123,1,8,0,1,0,0,0,0,965,966,1123,0),
(2120,1123,0,8,0,1,0,0,0,0,965,966,1123,0),
(2121,1124,1,4,4,2,0,0,0,0,1124,0,0,0),
(2122,1124,129,4,4,2,0,0,0,0,1124,0,0,0),
(2123,1124,0,4,4,2,0,0,0,0,1124,0,0,0),
(2124,14,33,8,0,1,1119,0,0,0,14,0,0,0),
(2125,1121,161,8,0,1,148,0,0,0,1121,0,0,0),
(2126,1121,129,8,0,1,148,0,0,0,1121,0,0,0),
(2127,148,1,0,0,0,1121,0,0,0,148,0,0,0),
(2128,1125,33,0,1,0,1125,0,0,0,1125,0,0,0),
(2129,1124,2177,4,4,10,0,0,0,0,1124,0,0,0),
(2130,1094,2081,3,2,12,67,0,0,0,1094,0,0,0),
(2131,1106,73,0,0,0,1107,20,0,0,1106,0,0,0),
(2132,1085,2081,5,4,2,0,0,0,0,1085,0,0,0),
(2133,1121,32,8,0,1,1119,0,0,0,1121,0,0,0),
(2134,1106,8,0,0,0,20,0,0,0,1106,0,0,0),
(2135,31,4097,0,1,0,0,0,0,0,31,0,0,0),
(2136,148,1,0,0,0,0,0,0,0,148,0,0,0),
(2137,31,65,0,1,0,148,0,0,0,31,0,0,0),
(2138,1106,32,0,0,0,1107,20,0,0,1106,0,0,0),
(2139,928,0,8,0,1,68,72,0,0,928,20,0,0),
(2140,31,65,0,1,0,20,0,0,0,31,0,0,0),
(2141,31,2113,0,1,8,0,0,0,0,31,0,0,0),
(2142,469,73,3,2,12,0,0,0,0,0,0,0,0),
(2143,1050,73,2,2,4,1085,0,0,0,1050,0,0,0),
(2144,1098,32,1,0,0,20,0,0,0,1098,0,0,0),
(2145,928,8224,8,0,7,14,148,0,0,928,20,0,0),
(2148,1073,6177,0,0,0,0,0,0,0,1073,0,0,0),
(2150,966,8224,8,8,1,965,0,0,0,0,0,0,0),
(2155,47,1,2,2,4,0,0,0,0,47,0,0,0),
(2156,973,65,0,0,0,0,0,0,0,973,0,0,0),
(2176,959,2341,4,4,2,960,0,0,0,959,0,0,0),
(2178,959,2341,2,2,4,960,0,0,0,959,0,0,0),
(2189,1145,8224,8,0,15,0,0,0,0,1145,0,0,0),
(2190,1145,8225,8,0,15,0,0,0,0,1145,0,0,0),
(2191,1145,8192,8,0,15,0,0,0,0,1145,0,0,0),
(2209,20,65,8,0,7,1098,1106,0,0,20,0,0,0),
(2210,911,0,4,7,0,0,0,0,0,0,0,0,0),
(2212,20,64,8,0,7,1098,1106,0,0,20,0,0,0),
(2214,1098,64,1,6,0,20,0,0,0,1098,529,0,0),
(2216,1156,0,0,0,0,0,0,0,0,1106,1156,1098,0),
(2217,1156,1,0,0,0,0,0,0,0,1106,1156,1098,0),
(2218,1156,33,0,0,0,20,0,0,0,1106,1156,1098,0),
(2219,1156,6177,0,0,0,20,0,0,0,1106,1156,1098,0),
(2226,1098,65,1,6,0,20,0,0,0,1098,529,0,0),
(2230,1106,72,0,0,0,1107,20,0,0,1106,0,0,0),
(2235,1160,0,0,5,2,0,0,0,0,1160,0,0,0),
(2236,1159,0,0,3,4,0,0,0,0,1159,0,0,0);
/*!40000 ALTER TABLE `factiontemplate_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-14 18:04:19
