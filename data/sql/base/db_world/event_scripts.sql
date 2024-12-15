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
-- Table structure for table `event_scripts`
--

DROP TABLE IF EXISTS `event_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_scripts` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `command` int unsigned NOT NULL DEFAULT '0',
  `datalong` int unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_scripts`
--

LOCK TABLES `event_scripts` WRITE;
/*!40000 ALTER TABLE `event_scripts` DISABLE KEYS */;
INSERT INTO `event_scripts` VALUES
(259,2,10,1770,300000,0,881.63,1230.37,47.83,3.1),
(1785,0,10,5676,180000,0,1704.61,41.9147,-63.8433,0.435896),
(1787,0,10,5676,180000,0,1806.13,-4372.67,-17.4888,4.41785),
(1131,0,10,5676,180000,0,-8973.05,1043.72,52.8631,2),
(1786,0,10,5677,180000,0,1704.61,41.9147,-63.8433,0.435896),
(1788,0,10,5677,180000,0,1806.13,-4372.67,-17.4888,4.41785),
(1134,0,10,5677,180000,0,-8973.05,1043.72,52.8631,2),
(1449,0,10,6268,180000,0,-767.591,-3721.71,42.3617,2.79602),
(1033,100,10,5402,3000000,0,-1129.9,2896.08,195.91,3.15),
(1033,100,10,6070,3000000,0,-1130.26,2894.02,196.27,3.15),
(1033,100,10,6069,3000000,0,-1134.43,2902.35,196.56,3.85),
(1033,100,10,6069,3000000,0,-1131.98,2886.77,197.59,2.55),
(1033,40,10,6070,3000000,0,-1129.04,2895.67,195.7,3.11),
(1033,40,10,6069,3000000,0,-1130.01,2901.11,195.35,3.35),
(1033,40,10,6069,3000000,0,-1125.46,2890.14,195.27,2.9),
(1033,0,10,6069,3000000,0,-1126.97,2901.03,194.33,3.45),
(1033,0,10,6069,3000000,0,-1123.14,2892.65,194.96,3.11),
(727,0,10,4504,3000000,0,264.94,-264.13,145.03,3.41),
(452,0,10,2937,3000000,0,-2360.55,-4102.38,6.93,2.25),
(5991,0,10,12138,180000,0,6359.26,143.38,23.61,4.124),
(6028,0,10,12138,180000,0,-2500.89,-1628.45,91.7042,6.01041),
(2998,0,10,3257,180000,0,-435,-3428,91.75,5.323),
(2980,0,10,3475,180000,0,453.896,-3039.76,91.7854,3.952),
(8438,0,10,14500,180000,0,38.4345,156.93,83.545,1.40746),
(420,0,10,2755,600000,0,-931.73,-3111.81,48.517,3.27404),
(4975,1,7,5056,0,0,0,0,0,0),
(2048,0,10,3456,3000000,0,-3592.45,-1872.06,91.62,0.19),
(2313,0,10,7411,3000000,0,9639.5,2528.97,1331.72,5.28395),
(2648,0,10,2707,9000000,0,-407,-2862,77.31,5.87),
(3973,0,10,8075,9000000,0,-2764.68,2623.21,70.4204,2.33578),
(3084,0,10,8392,300000,0,2249,-7221.97,13.82,1.02),
(8502,0,10,8443,9000000,0,-466.86,272.31,-90.74,3.52),
(3839,0,10,9598,2000000,1,5998.7,-1208,377.75,0.36),
(3980,0,9,27142,180,0,0,0,0,0),
(4338,0,10,10040,3000000,0,-7968.53,-1097.05,-327.09,3.3),
(4338,0,10,10040,3000000,0,-7979.87,-1095.38,-327.55,5.94),
(4338,40,10,10040,3000000,0,-7976.31,-1101.03,-328.11,6.1),
(4338,40,10,10040,3000000,0,-7969.05,-1102.24,-329.02,3.36),
(4338,40,10,10040,3000000,0,-7987.08,-1096.74,-329.16,5.55),
(4338,90,10,10040,3000000,0,-7977.93,-1079.71,-329.1,4.5),
(4338,90,10,10040,3000000,0,-7963.49,-1081.18,-328.64,4.32),
(4338,90,10,10041,3000000,0,-7969.74,-1077.94,-328.73,4.54),
(3938,0,10,10373,3000000,0,6881.64,-506.63,40.14,2.02),
(6138,0,10,2179,3000000,0,6873.65,-659.95,84.16,0.76),
(6138,0,10,12321,3000000,0,6881.62,-651.81,84.59,1.05),
(5246,0,10,12319,3000000,0,331.5,-2272.41,241.82,5.23),
(6721,180,10,12918,180000,0,2208.93,-1567.59,87.2283,0),
(6721,155,10,3743,180000,0,2202.16,-1544.48,87.796,0),
(6721,155,10,3749,180000,0,2237.48,-1524.45,89.7827,0),
(6721,125,10,3750,180000,0,2260.9,-1547.91,89.1733,0),
(6721,125,10,3743,180000,0,2235.44,-1578.43,86.4944,0),
(6721,125,10,3749,180000,0,2208.93,-1567.59,87.2283,0),
(6721,105,10,3750,180000,0,2202.16,-1544.48,87.796,0),
(6721,105,10,3743,180000,0,2237.48,-1524.45,89.7827,0),
(6721,75,10,3749,180000,0,2260.9,-1547.91,89.1733,0),
(6721,75,10,3750,180000,0,2235.44,-1578.43,86.4944,0),
(6721,75,10,3743,180000,0,2208.93,-1567.59,87.2283,0),
(6721,55,10,3749,180000,0,2202.16,-1544.48,87.796,0),
(6721,55,10,3750,180000,0,2237.48,-1524.45,89.7827,0),
(6721,25,10,3743,180000,0,2260.9,-1547.91,89.1733,0),
(6721,25,10,3749,180000,0,2235.44,-1578.43,86.4944,0),
(6721,25,10,3750,180000,0,2208.93,-1567.59,87.2283,0),
(6721,5,10,3743,180000,0,2202.16,-1544.48,87.796,0),
(6721,5,10,3749,180000,0,2237.48,-1524.45,89.7827,0),
(8328,0,10,14467,180000,0,5780.34,-964.844,412.695,3.08),
(8420,550,10,14483,3000000,0,-57.25,827.99,-29.53,0),
(8420,530,10,14482,1000000,0,-46.09,835.36,-29.53,0),
(8420,530,10,14483,3000000,0,-57.25,827.99,-29.53,0),
(8420,520,10,14482,1000000,0,-42.93,836.33,-29.53,0),
(8420,520,10,14482,1000000,0,-38.99,836.11,-29.53,0),
(8420,520,10,14482,1000000,0,-34.41,835.52,-29.53,0),
(8420,460,10,14482,1000000,0,-18.06,824.63,-29.53,0),
(8420,460,10,14482,1000000,0,-16.21,820.88,-29.53,0),
(8420,460,10,14482,1000000,0,-14.66,817.02,-29.53,0),
(8420,460,10,14483,3000000,0,-42.93,836.33,-29.53,0),
(8420,460,9,99775,900,0,0,0,0,0),
(8420,460,10,14482,1000000,0,-15.42,812.75,-29.53,0),
(8420,380,10,14482,1000000,0,-49.92,799.51,-29.53,0),
(8420,380,10,14482,1000000,0,-53.75,794.28,-29.53,0),
(8420,380,10,14482,1000000,0,-56.91,797.55,-29.53,0),
(8420,380,10,14482,1000000,0,-59.82,800.75,-29.53,0),
(8420,380,10,14482,1000000,0,-61.79,816.85,-29.53,0),
(8420,380,10,14482,1000000,0,-60.93,820.51,-29.53,0),
(8420,380,10,14482,1000000,0,-59.12,824.9,-29.53,0),
(8420,380,10,14482,1000000,0,-57.25,827.99,-29.53,0),
(8420,370,9,99776,900,0,0,0,0,0),
(8420,310,10,14482,1000000,0,-46.09,835.36,-29.53,0),
(8420,310,10,14482,1000000,0,-42.93,836.33,-29.53,0),
(8420,310,10,14482,1000000,0,-38.99,836.11,-29.53,0),
(8420,310,10,14482,1000000,0,-34.41,835.52,-29.53,0),
(8420,310,10,14483,3000000,0,-16.21,820.88,-29.53,0),
(8420,300,9,99777,900,0,0,0,0,0),
(8420,300,10,14482,1000000,0,-18.06,824.63,-29.53,0),
(8420,270,10,14482,1000000,0,-16.21,820.88,-29.53,0),
(8420,270,10,14482,1000000,0,-14.66,817.02,-29.53,0),
(8420,270,10,14482,1000000,0,-15.42,812.75,-29.53,0),
(8420,270,10,14482,1000000,0,-49.92,799.51,-29.53,0),
(8420,270,10,14482,1000000,0,-53.75,794.28,-29.53,0),
(8420,270,10,14482,1000000,0,-56.91,797.55,-29.53,0),
(8420,260,9,99778,900,0,0,0,0,0),
(8420,210,10,14482,1000000,0,-59.82,800.75,-29.53,0),
(8420,210,10,14482,1000000,0,-61.79,816.85,-29.53,0),
(8420,210,10,14482,1000000,0,-60.93,820.51,-29.53,0),
(8420,200,10,14483,3000000,0,-57.25,827.99,-29.53,0),
(8420,180,9,99779,900,0,0,0,0,0),
(8420,160,10,14482,1000000,0,-59.12,824.9,-29.53,0),
(8420,160,10,14482,1000000,0,-57.25,827.99,-29.53,0),
(8420,160,10,14482,1000000,0,-46.09,835.36,-29.53,0),
(8420,160,10,14482,1000000,0,-42.93,836.33,-29.53,0),
(8420,120,10,14482,1000000,0,-38.99,836.11,-29.53,0),
(8420,120,10,14482,1000000,0,-34.41,835.52,-29.53,0),
(8420,120,10,14482,1000000,0,-18.06,824.63,-29.53,0),
(8420,120,10,14482,1000000,0,-16.21,820.88,-29.53,0),
(8420,110,10,14482,1000000,0,-14.66,817.02,-29.53,0),
(8420,110,10,14482,1000000,0,-15.42,812.75,-29.53,0),
(8420,110,9,99780,900,0,0,0,0,0),
(8420,100,10,14483,3000000,0,-57.25,827.99,-29.53,0),
(8420,40,10,14482,1000000,0,-49.92,799.51,-29.53,0),
(8420,40,10,14482,1000000,0,-53.75,794.28,-29.53,0),
(8420,40,10,14482,1000000,0,-56.91,797.55,-29.53,0),
(8420,40,10,14482,1000000,0,-59.82,800.75,-29.53,0),
(8420,30,9,99781,900,0,0,0,0,0),
(8420,30,10,14483,3000000,0,-16.21,820.88,-29.53,0),
(8420,10,10,14482,1000000,0,-61.79,816.85,-29.53,0),
(8420,10,10,14482,1000000,0,-60.93,820.51,-29.53,0),
(8420,10,10,14482,1000000,0,-59.12,824.9,-29.53,0),
(8420,10,10,14482,1000000,0,-57.25,827.99,-29.53,0),
(8420,8,9,99782,900,0,0,0,0,0),
(8420,5,10,14482,1000000,0,-46.09,835.36,-29.53,0),
(8420,5,10,14482,1000000,0,-42.93,836.33,-29.53,0),
(8420,5,10,14482,1000000,0,-38.99,836.11,-29.53,0),
(8420,5,10,14482,1000000,0,-34.41,835.52,-29.53,0),
(8420,5,10,14482,1000000,0,-18.06,824.63,-29.53,0),
(8420,5,10,14482,1000000,0,-16.21,820.88,-29.53,0),
(8420,5,10,14482,1000000,0,-14.66,817.02,-29.53,0),
(8420,5,10,14482,1000000,0,-15.42,812.75,-29.53,0),
(8420,0,10,14500,60000,0,-38.8,812.69,-29.53,0),
(9208,0,10,14862,9000000,0,-7276.38,852.34,3.64,0.5),
(17609,0,7,12028,0,0,0,0,0,0),
(9542,0,10,15571,9000000,0,3483,-6692.79,-2.43,0.8),
(9571,0,10,15623,3000000,0,6724.96,-5275.13,778.23,1.82),
(10015,0,10,16387,9000000,0,3644,-3473.77,138.56,4.47),
(10362,0,10,17000,30000,0,426.15,3461.03,63.4,3.14),
(10554,0,10,17207,3000000,1,-12132.4,964.982,5.19424,5.13056),
(10561,0,10,17233,55000,0,972.97,-1824.72,82.5407,0.2935),
(10591,0,10,17225,3000000,0,-11003.7,-1760.19,140.25,0.29),
(11206,1,9,50472,900,0,0,0,0,0),
(11420,0,10,18182,3000000,0,-879.8,8691,252.5,0.9),
(11413,0,10,18185,3000000,0,-301.42,7247.97,30.92,5.86),
(12530,0,10,19456,120000,0,8216.55,-6335.38,64.5098,3.48),
(12925,0,10,18544,3000000,0,3780.22,1458.31,-149.97,0),
(13008,0,10,19493,360000,0,2766.21,3199.86,150.73,2.41),
(13037,0,10,16939,3000000,0,-1243.23,1312.41,3.55,1.34),
(13666,8,10,19991,3000000,0,1718.86,6304.43,-0.33,1.11),
(13666,8,10,19991,3000000,0,1717.2,6301.02,-0.33,1.11),
(13666,50,10,19952,3000000,0,1718.86,6304.43,-0.33,1.11),
(13666,50,10,21238,3000000,0,1717.2,6301.02,-0.33,1.11),
(13666,50,10,21238,3000000,0,1716.45,6299.46,-0.36,1.11),
(13666,130,10,19956,3000000,0,1718.86,6304.43,-0.33,1.11),
(13666,130,10,21294,3000000,0,1717.2,6301.02,-0.33,1.11),
(13666,130,10,21294,3000000,0,1716.45,6299.46,-0.36,1.11),
(13666,180,10,20116,3000000,0,1716.33,6299.22,-0.36,1.11),
(13980,0,10,21735,3000000,0,-3368.91,2145.37,-8.39026,4.4855),
(14029,0,10,21767,9000000,0,3170.83,5345.7,180.57,0),
(12650,15,8,18384,30,0,0,0,0,0),
(14274,2,10,22114,3000000,0,2669.7,5650.77,-13.45,4.55),
(14536,2,10,21514,30000,0,3629.58,7163.36,141.83,2.37),
(14536,0,10,10204,30000,0,3605.5,7186.44,141.12,5.45),
(15406,5,10,23789,300000,0,-4713.87,-3730.99,54.14,0.6),
(14400,2,10,21514,30000,0,3629.58,7163.36,141.83,2.37),
(3981,0,10,9684,3000000,0,-7196.45,-2405.63,-217.28,4.8),
(10608,0,10,5676,180000,0,7931.42,-6174.3,40.92,3.54),
(1370,0,10,6239,300000,0,332.821,-1473.05,42.2658,3.99963),
(8420,600,9,99774,900,0,0,0,0,0),
(8420,620,10,14482,1000000,0,-57.25,827.99,-29.53,0),
(8420,630,10,14482,1000000,0,-59.12,824.9,-29.53,0),
(8420,640,10,14482,1000000,0,-60.93,820.51,-29.53,0),
(8420,650,10,14482,1000000,0,-61.79,816.85,-29.53,0),
(8420,660,10,14482,1000000,0,-59.82,800.75,-29.53,0),
(8420,660,10,14482,1000000,0,-56.91,797.55,-29.53,0),
(8420,660,10,14482,1000000,0,-53.75,794.28,-29.53,0),
(8420,660,10,14482,1000000,0,-49.92,799.51,-29.53,0),
(8420,750,9,99784,900,0,0,0,0,0),
(8420,750,9,99896,900,0,0,0,0,0),
(8428,0,9,99783,15,0,0,0,0,0),
(8428,10,10,14502,9000000,0,-35.712,796.486,-29.5359,1.90495),
(14139,0,10,21894,360000,0,568.418,8653.05,19.9106,1.18595),
(12823,3,10,19864,120000,0,-1194.89,2267.52,47.29,5.36),
(12823,3,10,20137,120000,0,-1190.24,2269.2,46.0973,4.97419),
(12823,3,10,20137,120000,0,-1193.53,2259.04,47.484,0.820305),
(12823,3,10,20137,120000,0,-1196.75,2264.76,47.9826,6.19592),
(12823,3,10,20137,120000,0,-1190.11,2258.2,46.6871,1.36136),
(12823,0,10,19862,120000,0,-1175.41,2264.59,53.1733,3.15905),
(264,3,10,2044,300000,0,-9548.42,-1440.2,62.29,2.19),
(415,3,10,2569,300000,0,-1777.64,-1513.58,75.51,5.28),
(415,3,10,2570,300000,0,-1778.46,-1510.57,75.17,5.22),
(417,3,10,2569,300000,0,-1772.93,-1505.9,91.87,5.7),
(417,3,10,2570,300000,0,-1774.76,-1495.07,90.6,5.27),
(416,3,10,2569,300000,0,-1797.32,-1504.7,99.39,5.14),
(416,3,10,2570,300000,0,-1789.8,-1499.9,99.38,4.6),
(498,3,10,3129,300000,0,-228.09,-5115.08,49.32,1.28),
(619,3,10,634,300000,0,-18.44,-617.46,14.12,0.08),
(5300,5,10,11121,900000,0,3818.7,-3730.37,141.88,1.86),
(5301,5,10,11120,900000,0,3589.51,-2991.87,125.18,3.35),
(664,3,10,3946,60000,0,-11142.5,-1151.78,43.61,5.28),
(364,5,10,2624,900000,0,-12179.4,644.22,-67.1,5.18),
(3301,2,10,7664,900000,0,-11234.4,-2842.68,157.92,1.42),
(5759,2,10,11886,600000,0,1571.63,-3276,88.88,6.05),
(5759,6,10,11887,600000,0,1569.4,-3272,88.15,0.28),
(5759,6,10,11887,600000,0,1572.08,-3278,89.31,0.34),
(5759,6,10,11887,600000,0,1576.6,-3275,89.08,0.16),
(18455,0,10,28236,13000,0,1340.4,1077.85,458.61,3.196),
(9980,2,10,16292,900000,0,7941.15,-7636.45,116.19,5.66),
(10626,2,10,17206,900000,0,-5027.5,-10964.4,20.69,2.18),
(10685,5,10,6748,900000,0,-1647.27,-10907,58.3257,4.56593),
(10685,5,10,6748,900000,0,-1637.9,-10915.8,58.3306,4.15948),
(10685,2,10,17359,900000,0,-1651.2,-10924.1,58.633,4.13593),
(11027,2,10,17715,60000,0,-1896.13,-12861.1,87.1412,3.5412),
(12307,1,10,19055,900000,0,-2413.4,6914.48,25.01,3.67),
(20082,0,10,30891,600000,0,6418.42,422.971,511.196,5.8119),
(19410,2,10,29775,600000,1,7991.81,-827.6,968.263,2.897),
(16103,0,10,24500,300000,1,2321.08,-5260.12,221.109,0.24883),
(17364,0,8,26105,0,0,0,0,0,0),
(747,5,10,4490,900000,1,-5589.63,-1575.89,11.75,6.02),
(3201,2,9,16736,600,0,0,0,0,0),
(3201,2,9,16741,600,0,0,0,0,0),
(3202,2,9,16737,600,0,0,0,0,0),
(3202,2,9,16742,600,0,0,0,0,0),
(3203,2,9,16738,600,0,0,0,0,0),
(3203,2,9,16743,600,0,0,0,0,0),
(3204,2,9,16735,600,0,0,0,0,0),
(3204,2,9,16740,600,0,0,0,0,0),
(3708,3,10,9453,300000,0,-8170.74,-5078.13,15.83,4.83),
(11206,1,9,50471,900,0,0,0,0,0),
(11206,1,9,50470,900,0,0,0,0,0),
(11206,1,9,50469,1200,0,0,0,0,0),
(11206,1,9,50468,1200,0,0,0,0,0),
(11206,1,9,50467,1200,0,0,0,0,0),
(11206,1,9,50466,1200,0,0,0,0,0),
(11206,1,9,50465,1200,0,0,0,0,0),
(11206,1,9,50464,1200,0,0,0,0,0),
(11206,1,9,50463,1200,0,0,0,0,0),
(11206,1,9,50462,1200,0,0,0,0,0),
(11206,1,9,50461,1200,0,0,0,0,0),
(11206,1,9,50460,1200,0,0,0,0,0),
(11206,1,9,50459,1200,0,0,0,0,0),
(11206,1,9,50457,1200,0,0,0,0,0),
(11206,1,9,50456,1200,0,0,0,0,0),
(11206,1,9,50455,1200,0,0,0,0,0),
(11206,0,10,17915,3000000,1,3678,-3639,140,0),
(15385,1,9,21607,180,0,0,0,0,0),
(15385,3,10,23768,180000,0,-3532.56,-4316.76,7.04,2.98),
(15385,3,10,23769,180000,0,-3533.17,-4318.34,7.05,2.51),
(14143,5,9,21611,60,0,0,0,0,0),
(14092,0,10,21876,360000,0,-4509.67,1047.06,26.4582,3.78736),
(14092,1,10,21876,360000,0,-4523.75,1062.35,24.3041,4.43314),
(14092,2,10,21876,360000,0,-4525,1045.41,19.8945,4.15388),
(14092,0,10,21876,360000,0,-4551.17,1044.11,16.521,5.21853),
(14092,1,10,21876,360000,0,-4537.54,1049.36,18.7409,4.41568),
(14092,0,10,21876,360000,0,-4504.67,1020.56,33.0728,2.93215),
(14092,3,10,21876,360000,0,-4515.17,1033.11,20.7127,3.1765),
(14092,0,10,21876,360000,0,-4515.91,1020.08,23.6738,2.72271),
(14092,2,10,21876,360000,0,-4524.73,1009.76,21.3249,2.02458),
(12930,0,10,20518,300000,0,4006.81,1517.19,-115.9,-1.6057),
(11424,1,9,6781,180,0,0,0,0,0),
(11424,3,10,19656,10000,0,1176.53,8130.83,20.13,1.86),
(13666,0,9,28288,600,0,0,0,0,0),
(14379,2,10,22374,300000,0,-248.426,3032.92,-65.5952,1.309),
(14379,2,10,16878,300000,0,-246.012,3027.31,-65.4702,1.309),
(14379,2,10,16878,300000,0,-252.792,3030.24,-65.7743,1.309),
(11087,0,10,17592,150000,0,-1121.53,-12600.8,134.03,2.86),
(13961,3,10,21310,50000,0,-3590.54,1832.34,41.7499,1.65),
(17451,2,10,25986,300000,0,2798.57,5275.49,21.7547,2.03006),
(17430,5,10,26224,900000,0,3615.42,3654.44,26.1622,1.58951),
(17430,5,10,26224,900000,0,3616.73,3653.83,26.2139,1.904),
(17430,5,10,26224,900000,0,3615.34,3645.98,24.7895,1.71918),
(17430,8,10,26225,900000,0,3616.73,3653.83,26.2139,1.78023),
(466,0,9,46424,0,0,0,0,0,0),
(467,0,9,46425,0,0,0,0,0,0),
(468,0,9,46429,0,0,0,0,0,0),
(10675,0,10,17318,90000,0,-5139.79,-11248.3,5.23,6.27609),
(15939,0,10,24381,1800000,0,2406.49,-5739,274.02,0.703918),
(15672,0,10,23671,1800000,0,1699.13,-4105.1,271.04,2.77),
(15578,0,10,24019,180000,0,2827,-3680,307,1.6),
(16889,0,10,27939,900000,0,2946.24,7152.2,0,3.3),
(16716,0,15,45605,1,0,0,0,0,0),
(17209,1,8,27995,1,0,0,0,0,0),
(17567,0,10,26510,180000,0,2650.01,1007.89,-24.7,0.94),
(15726,0,10,24173,300000,0,2950.32,-4551.76,273.648,5.4937),
(19455,2,10,29626,180000,0,6447.57,-1728.76,480.719,5.66264),
(10745,0,10,17404,180000,0,211.41,4128.27,78.88,2.23),
(11674,0,8,18393,0,0,0,0,0,0),
(11675,0,8,18395,0,0,0,0,0,0),
(18223,0,10,23837,180000,0,2629.2,8.1333,26.347,0.401426),
(18503,12,10,28317,360000,0,5443.6,4874.97,-199.83,1.5),
(11669,1,8,18388,1,0,0,0,0,0),
(21998,0,10,34980,90000,0,10399,940.692,123.857,5.8),
(22030,0,10,35012,90000,0,10006.3,646.524,10.245,3.8),
(20543,0,10,32163,180000,0,7511.13,2600.6,534.672,3.43),
(20543,0,10,32162,180000,0,7508.16,2601.39,534.672,3.43),
(16904,1,10,25830,3000000,0,4118.11,5087.8,-1.43304,2.25307),
(17208,1,10,25833,3000000,0,3781.2,4832.6,-13.0414,5.14137),
(16909,1,10,25831,3000000,0,4208.38,4807.07,-12.7529,5.80932),
(17207,1,10,25832,3000000,0,4029,4883.08,-12.7148,1.31061),
(17209,3,10,25834,300000,0,4004.18,4850.36,26.0508,2.3911),
(11225,0,14,38776,0,0,0,0,0,0),
(17609,0,10,26594,1,0,3117,1288,173,0),
(17608,0,10,26594,1,0,3129,1556,178,0),
(17607,0,10,26594,1,0,2854,1514,167,0),
(14525,0,10,22473,300000,0,3718.36,5361.27,-8,2.14),
(14525,0,10,20555,300000,0,3703.51,5387.74,-4.37,5.9),
(18481,0,10,28256,30000,0,5211.89,5788.68,-71.0877,2.1648),
(17499,2,10,26237,300000,0,3789,6534,175.31,1),
(11424,5,8,18152,0,0,0,0,0,0),
(19423,3,10,29851,300000,0,8593.94,2618.04,652.353,3.17445),
(17606,0,10,26594,1,0,3014,1321,168,0),
(17605,0,10,26594,1,0,3097,1037,128,0),
(17084,1,10,25794,60000,0,3505.78,4558.7,-12.98,4.16),
(16929,1,10,25742,60000,0,3505.78,4558.7,-12.98,4.16),
(17841,0,10,27273,3000,0,307,-357.5,91.0833,6.02139),
(17841,0,10,27273,3000,0,285.6,-357.5,91.0833,5.75959),
(19714,0,10,30461,600000,0,6947.48,-859.518,1147.6,5.67487),
(10951,0,10,17651,300000,0,-11161,-1923.2,91.4737,2.89811),
(9417,0,8,15415,1,0,0,0,0,0),
(12608,0,10,19543,25000,0,2235.09,2319.32,92.0764,3.88962),
(12609,0,10,19544,25000,0,2197.27,2334.74,89.5162,2.26361),
(12610,0,10,19545,25000,0,2212.53,2401.58,108.876,2.39606),
(12607,0,10,19546,25000,0,2236.97,2393.12,112.374,5.81195),
(18940,6,11,57571,180,0,0,0,0,0),
(18858,0,9,16969,30,0,0,0,0,0),
(18858,0,9,16970,30,0,0,0,0,0),
(18858,0,9,16971,30,0,0,0,0,0),
(18858,0,9,16972,30,0,0,0,0,0),
(18858,0,9,16973,30,0,0,0,0,0),
(18858,0,10,23837,30000,0,5711.15,-4361.72,387.669,5.25344),
(18858,0,10,23837,30000,0,5726,-4372.46,387.974,2.77507),
(18858,0,10,23837,30000,0,5707.19,-4371.67,387.434,3.22886),
(18858,0,10,23837,30000,0,5721.95,-4361.92,387.81,4.29351),
(18858,0,10,23837,30000,0,5717.04,-4378.73,387.642,1.5708),
(20990,0,10,33273,42000,0,4602.98,-1600.14,156.783,0.750492),
(18475,0,7,12537,0,0,0,0,0,0),
(18474,1,10,28253,60000,0,6202.68,4948.74,-86,0),
(17604,0,10,26594,1,0,2686,934,18,0),
(20722,0,10,32588,60000,0,6342.65,2399.02,478.483,5.5137),
(11225,0,7,9718,0,0,0,0,0,0),
(20724,0,10,32588,60000,0,6351.15,2315.5,474.698,1.2568),
(20069,5,10,30924,180000,0,7229.44,3642.27,809.018,0),
(18281,0,10,27851,20000,0,4819.28,-583.566,163.564,1.3439),
(13888,10,10,21410,300000,0,-4057.3,1511.83,90.91,1.61),
(13888,10,10,21409,300000,0,-4056.69,1519.2,92.02,4.59),
(13584,2,8,21176,0,0,0,0,0,0),
(21997,0,10,34965,180000,1,10182,1183.42,76.2,5.93),
(15363,0,8,23727,1,0,0,0,0,0),
(15363,0,10,23741,600000,0,-2617.89,-3277.13,31.9344,0.541052),
(15363,0,10,23741,600000,0,-2621.78,-3275.27,30.6254,0.296706),
(15363,0,10,23741,600000,0,-2620.45,-3279.92,31.8134,0.296706),
(15363,0,10,23741,600000,0,-2482.96,-3240.59,40.9678,2.49582),
(15363,0,10,23741,600000,0,-2481.63,-3245.02,43.0934,2.58309),
(15363,0,10,23741,600000,0,-2479.41,-3239,40.0641,2.53073),
(15363,0,10,23741,600000,0,-2524.42,-3128.14,29.7597,0.331613),
(15363,0,10,23741,600000,0,-2527.19,-3125.76,29.5518,0.383972),
(15363,0,10,23741,600000,0,-2526.19,-3131.12,29.0088,0.279253),
(20269,0,8,31235,1,0,0,0,0,0),
(17767,0,10,27002,300000,0,2791.48,381.745,77.1908,2.6067),
(18014,0,10,27476,600000,1,3098.4,-1253.4,11.44,2.21),
(20108,0,10,31016,500000,0,7088.22,4380.14,872.267,4.36759),
(20269,0,10,31235,30000,0,6636.56,3210.9,668.56,1.02),
(13685,0,10,21319,90000,0,1314.47,6687.27,-18.28,0.27),
(14860,0,10,23100,300000,1,-2468.7,4700.5,155.82,3),
(15014,4,10,21838,600000,1,-3788,3509,287,5.7),
(18454,0,10,28236,13000,0,1292.56,1015,458.51,1.708),
(10665,0,10,28236,13000,0,1230.42,1063.8,458.61,0.015),
(12229,0,10,28236,13000,0,1278.19,1123.95,458.61,4.8026),
(15005,0,10,23282,300000,0,2424.98,6933.42,409.55,1.43117),
(15005,1,10,23364,100000,0,2426.95,7001.48,367.382,0),
(15003,0,10,23261,300000,0,3845.31,5220.04,295.412,0),
(15002,0,10,23281,300000,0,4176.5,5452.21,291.923,0),
(15004,0,10,23061,300000,0,2060.6,7418.53,391.098,0),
(10301,0,16,5495,2,0,0,0,0,0),
(14739,0,10,23019,500000,0,3535.11,5590.63,0.385938,0.785398),
(14462,0,10,22448,300000,0,3688,5353,25,0),
(14462,0,10,20555,300000,0,3703.51,5387.74,-4.37,5.9),
(14400,0,10,10204,30000,0,3605.5,7186.44,141.12,5.45),
(18481,1,10,28230,30000,0,5219.11,5779.45,-71.0571,4.5204),
(18481,1,10,28230,30000,0,5225.28,5777.67,-67.5094,5.06145),
(18481,1,10,28230,30000,0,5215.02,5777.66,-71.1333,3.75245),
(18481,1,10,28230,30000,0,5220.02,5771.54,-68.3226,5.16617),
(18481,1,10,28230,30000,0,5214.41,5784.44,-62.0158,0.59341),
(18481,1,10,28230,30000,0,5208.64,5778.08,-63.0435,2.56563),
(18481,0,9,9263,30,0,0,0,0,0),
(18481,1,15,39983,1,0,0,0,0,0),
(18481,1,10,28279,30000,0,5240.07,5784.48,-63.6731,3.76355),
(18481,1,10,28279,30000,0,5243.02,5777.95,-65.7595,2.06222),
(18481,1,10,28279,30000,0,5259.32,5768,-63.7346,2.75762),
(18481,1,10,28279,30000,0,5242.08,5740.67,-59.9892,4.18879),
(18481,1,10,28279,30000,0,5249.26,5765.97,-59.9069,6.17846),
(18481,1,10,28279,30000,0,5197.42,5776.38,-70.2504,2.09439),
(18481,1,10,28279,30000,0,5207.38,5800.15,-67.0273,3.82227),
(18481,1,10,28279,30000,0,5206.19,5754.94,-71.6155,2.87979),
(18481,1,10,28279,30000,0,5204.7,5791.86,-68.1195,1.62315),
(18481,1,10,28279,30000,0,5214.36,5743.66,-73.3691,4.29351),
(18481,1,10,28279,30000,0,5232.82,5750.23,-63.9341,3.96189),
(18481,1,10,28279,30000,0,5242.87,5777.24,-65.6762,2.426),
(18481,1,10,28279,30000,0,5232.51,5731.53,-68.7676,4.76474),
(18481,1,10,28279,30000,0,5206.44,5767.63,-68.1974,3.82227),
(18481,1,10,28279,30000,0,5254.31,5781.61,-67.9666,3.42084),
(18481,1,10,28279,30000,0,5223.68,5794.55,-64.1046,5.95157),
(18481,1,10,28279,30000,0,5232,5790.67,-68.2579,1.51843),
(18481,1,10,28279,30000,0,5240.94,5786.49,-63.5898,1.22173),
(18481,1,10,28279,30000,0,5198.98,5768.56,-70.7088,0.43633),
(18481,1,10,28279,30000,0,5230.02,5771.1,-56.9605,1.71042),
(18481,1,10,28279,30000,0,5199.84,5789.27,-62.4512,2.77507),
(18481,1,10,28279,30000,0,5215.57,5799.32,-68.9914,3.19395),
(18481,1,10,28279,30000,0,5221.6,5749.74,-63.7595,3.54301),
(10302,0,16,5495,2,0,0,0,0,0),
(16395,0,16,5495,2,0,0,0,0,0),
(16396,0,16,5495,2,0,0,0,0,0),
(16397,0,16,5495,2,0,0,0,0,0),
(16398,0,16,5495,2,0,0,0,0,0),
(16399,0,16,5495,2,0,0,0,0,0),
(16400,0,16,5495,2,0,0,0,0,0),
(16401,0,16,5495,2,0,0,0,0,0),
(16402,0,16,5495,2,0,0,0,0,0),
(16522,0,16,5495,2,0,0,0,0,0),
(19030,0,16,5495,2,0,0,0,0,0),
(19031,0,16,5495,2,0,0,0,0,0),
(19032,0,16,5495,2,0,0,0,0,0),
(19033,0,16,5495,2,0,0,0,0,0),
(19123,0,16,5495,2,0,0,0,0,0),
(19124,0,16,5495,2,0,0,0,0,0),
(2153,5,10,7167,900000,0,-1463.4,-3926.96,0.24,4.88),
(15452,0,9,5448,20,0,0,0,0,0),
(12857,0,10,19938,10000,0,2248.43,2227.97,138.56,2.48121),
(12857,0,9,30029,10,0,0,0,0,0),
(15312,0,16,11804,4,24,0,0,0,0),
(15314,0,16,11804,4,24,0,0,0,0),
(15318,0,16,11804,4,24,0,0,0,0),
(15320,0,16,11804,4,24,0,0,0,0),
(15322,0,16,11804,4,24,0,0,0,0),
(15324,0,16,11804,4,24,0,0,0,0),
(15430,0,16,11804,4,24,0,0,0,0),
(15431,0,16,11804,4,24,0,0,0,0),
(19126,0,16,11804,4,24,0,0,0,0),
(19127,0,16,11804,4,24,0,0,0,0),
(19137,0,16,11804,4,24,0,0,0,0),
(19139,0,16,11804,4,24,0,0,0,0),
(21868,0,16,11804,4,24,0,0,0,0),
(21870,0,16,11804,4,24,0,0,0,0);
/*!40000 ALTER TABLE `event_scripts` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-14 18:04:19
