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
-- Table structure for table `holiday_dates`
--

DROP TABLE IF EXISTS `holiday_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holiday_dates` (
  `id` int unsigned NOT NULL,
  `date_id` tinyint unsigned NOT NULL,
  `date_value` int unsigned NOT NULL,
  `holiday_duration` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`date_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holiday_dates`
--

LOCK TABLES `holiday_dates` WRITE;
/*!40000 ALTER TABLE `holiday_dates` DISABLE KEYS */;
INSERT INTO `holiday_dates` VALUES
(181,6,220708864,0),
(181,7,238354432,0),
(181,8,254885888,0),
(181,9,270974976,0),
(181,10,288620544,0),
(181,11,305152000,0),
(181,12,322256896,0),
(181,13,338886656,0),
(181,14,355663872,0),
(181,15,372441088,0),
(181,16,389218304,0),
(181,17,405979136,0),
(181,18,422756352,0),
(201,9,221708288,0),
(201,10,238469120,0),
(201,11,255229952,0),
(201,12,272646144,0),
(201,13,289406976,0),
(201,14,305610752,0),
(201,15,322371584,0),
(201,16,339738624,0),
(201,17,356515840,0),
(201,18,373293056,0),
(201,19,390070272,0),
(201,20,406274048,0),
(201,21,423051264,0),
(321,7,210092032,0),
(321,8,226689024,0),
(321,9,243286016,0),
(321,10,260374528,0),
(321,11,276955136,0),
(321,12,294060032,0),
(321,13,310657024,0),
(321,14,344391680,0),
(321,15,361168896,0),
(321,16,377946112,0),
(321,17,394723328,0),
(321,18,411484160,0),
(321,19,428261376,0),
(327,7,218529792,336),
(327,8,235192320,336),
(327,9,252952576,336),
(327,10,269484032,336),
(327,11,285540352,336),
(327,12,303169536,336),
(327,13,319209472,336),
(327,14,335921152,336),
(327,15,352681984,336),
(327,16,369459200,336),
(327,17,386236416,336),
(327,18,403013632,336),
(327,19,419774464,336),
(374,1,391135232,0),
(374,2,394264576,0),
(374,3,397410304,0),
(374,4,404750336,0),
(374,5,407339008,0),
(374,6,410468352,0),
(374,7,413597696,0),
(374,8,420921344,0),
(374,9,424099840,0),
(374,10,427884544,0),
(374,11,431030272,0),
(374,12,437682176,0),
(374,13,441516032,0),
(374,14,444645376,0),
(374,15,447791104,0),
(374,16,455147520,0),
(374,17,458276864,0),
(374,18,461406208,0),
(374,19,464551936,0),
(374,20,471891968,0),
(374,21,475021312,0),
(374,22,478150656,0),
(374,23,481296384,0),
(374,24,488652800,0),
(374,25,491782144,0),
(375,1,391593984,0),
(375,2,395395072,0),
(375,3,402718720,0),
(375,4,405864448,0),
(375,5,409010176,0),
(375,6,412139520,0),
(375,7,419463168,0),
(375,8,422625280,0),
(375,9,425771008,0),
(375,10,428900352,0),
(375,11,436224000,0),
(375,12,439386112,0),
(375,13,442531840,0),
(375,14,445661184,0),
(375,15,452984832,0),
(375,16,456146944,0),
(375,17,459292672,0),
(375,18,462422016,0),
(375,19,469778432,0),
(375,20,472924160,0),
(375,21,476069888,0),
(375,22,479199232,0),
(375,23,486604800,0),
(375,24,489111552,0),
(375,25,492240896,0),
(376,1,393265152,0),
(376,2,396394496,0),
(376,3,403718144,0),
(376,4,406880256,0),
(376,5,410009600,0),
(376,6,413138944,0),
(376,7,419921920,0),
(376,8,423641088,0),
(376,9,426770432,0),
(376,10,429359104,0),
(376,11,436682752,0),
(376,12,440401920,0),
(376,13,442990592,0),
(376,14,446119936,0),
(376,15,454098944,0),
(376,16,456605696,0),
(376,17,459751424,0),
(376,18,463536128,0),
(376,19,470859776,0),
(376,20,474021888,0),
(376,21,477151232,0),
(376,22,480280576,0),
(376,23,487604224,0),
(376,24,490782720,0),
(376,25,493912064,0),
(404,4,228982784,0),
(404,5,245743616,0),
(404,6,262504448,0),
(404,7,279248896,0),
(404,8,296009728,0),
(404,9,312770560,0),
(404,10,329646080,0),
(404,11,346390592,0),
(404,12,363167808,0),
(404,13,379945024,0),
(404,14,396722240,0),
(404,15,413483072,0),
(404,16,430260288,0),
(423,3,219299840,0),
(423,4,236077056,0),
(423,5,252723200,0),
(423,6,269713408,0),
(423,7,286359552,0),
(423,8,303169536,0),
(423,9,319881216,0),
(423,10,336707584,0),
(423,11,353468416,0),
(423,12,370245632,0),
(423,13,387022848,0),
(423,14,403800064,0),
(423,15,420560896,0);
/*!40000 ALTER TABLE `holiday_dates` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-14 18:04:23
