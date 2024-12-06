
-- Delete unofficial npcs

DELETE FROM `creature` WHERE (`id1` = 28940) AND (`guid` IN (129709, 129724, 129726));
DELETE FROM `creature_addon` WHERE (`guid` IN (129709, 129724, 129726));

DELETE FROM `creature` WHERE (`id1` = 28610) AND (`guid` IN (130036, 130015));
DELETE FROM `creature_addon` WHERE (`guid` IN (130036, 130015));

DELETE FROM `creature` WHERE (`id1` = 28936) AND (`guid` IN (129644));
DELETE FROM `creature_addon` WHERE (`guid` IN (129644));


-- Adding Waypoints

DELETE FROM `waypoint_data` WHERE `id` IN (12964600, 12965500, 12963900, 12964800, 12965100, 12965600, 12963800, 12964000, 12964900, 12965300, 12964300, 12965700, 12965400, 13000900, 12970200, 13001400, 12972200, 12965200);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES

(12964600, 1, 1732.11, -5776.87, 115.589, NULL, 0, 0, 0, 100, 0),
(12964600, 2, 1728.72, -5777.74, 115.262, NULL, 0, 0, 0, 100, 0),
(12964600, 3, 1718.53, -5780.24, 114.403, NULL, 0, 0, 0, 100, 0),
(12964600, 4, 1713.24, -5780.54, 114.028, NULL, 0, 0, 0, 100, 0),
(12964600, 5, 1698.87, -5780.64, 113.636, NULL, 0, 0, 0, 100, 0),
(12964600, 6, 1699.34, -5786.9, 114.22, NULL, 0, 0, 0, 100, 0),
(12964600, 7, 1699.64, -5796.75, 115.044, NULL, 0, 0, 0, 100, 0),
(12964600, 8, 1699.73, -5805.7, 115.703, NULL, 0, 0, 0, 100, 0),
(12964600, 9, 1699.69, -5809.83, 115.933, NULL, 0, 0, 0, 100, 0),
(12964600, 10, 1699.73, -5805.7, 115.703, NULL, 0, 0, 0, 100, 0),
(12964600, 11, 1699.64, -5796.75, 115.044, NULL, 0, 0, 0, 100, 0),
(12964600, 12, 1699.34, -5786.9, 114.22, NULL, 0, 0, 0, 100, 0),
(12964600, 13, 1698.87, -5780.64, 113.636, NULL, 0, 0, 0, 100, 0),
(12964600, 14, 1713.24, -5780.54, 114.028, NULL, 0, 0, 0, 100, 0),
(12964600, 15, 1718.53, -5780.24, 114.403, NULL, 0, 0, 0, 100, 0),
(12964600, 16, 1728.72, -5777.74, 115.262, NULL, 0, 0, 0, 100, 0),
(12964600, 17, 1732.11, -5776.87, 115.589, NULL, 0, 0, 0, 100, 0),
(12964600, 18, 1739.78, -5775.24, 116.06, NULL, 0, 0, 0, 100, 0),

(12965500, 1, 1717.5, -5871.82, 116.139, NULL, 0, 0, 0, 100, 0),
(12965500, 2, 1708.7, -5871.41, 116.126, NULL, 0, 0, 0, 100, 0),
(12965500, 3, 1699.96, -5870.13, 116.138, NULL, 0, 0, 0, 100, 0),
(12965500, 4, 1696.44, -5869.54, 116.145, NULL, 0, 0, 0, 100, 0),
(12965500, 5, 1697.06, -5863.35, 116.147, NULL, 0, 0, 0, 100, 0),
(12965500, 6, 1697.85, -5853.36, 116.15, NULL, 0, 0, 0, 100, 0),
(12965500, 7, 1698.8, -5839.74, 116.137, NULL, 0, 0, 0, 100, 0),
(12965500, 8, 1697.85, -5853.36, 116.15, NULL, 0, 0, 0, 100, 0),
(12965500, 9, 1697.06, -5863.35, 116.147, NULL, 0, 0, 0, 100, 0),
(12965500, 10, 1696.44, -5869.54, 116.145, NULL, 0, 0, 0, 100, 0),
(12965500, 11, 1699.96, -5870.13, 116.138, NULL, 0, 0, 0, 100, 0),
(12965500, 12, 1708.7, -5871.41, 116.126, NULL, 0, 0, 0, 100, 0),
(12965500, 13, 1717.5, -5871.82, 116.139, NULL, 0, 0, 0, 100, 0),
(12965500, 14, 1726.44, -5871.98, 116.12, NULL, 0, 0, 0, 100, 0),

(12963900, 1, 1662.2, -5842.81, 116.149, NULL, 0, 0, 0, 100, 0),
(12963900, 2, 1670.47, -5842, 116.155, NULL, 0, 0, 0, 100, 0),
(12963900, 3, 1675.52, -5837.58, 116.151, NULL, 0, 0, 0, 100, 0),
(12963900, 4, 1681.92, -5832.42, 116.132, NULL, 0, 0, 0, 100, 0),
(12963900, 5, 1691.65, -5834.89, 116.135, NULL, 0, 0, 0, 100, 0),
(12963900, 6, 1697.77, -5831.2, 116.131, NULL, 0, 0, 0, 100, 0),
(12963900, 7, 1704.59, -5827.17, 116.124, NULL, 0, 0, 0, 100, 0),
(12963900, 8, 1708.67, -5824.83, 116.123, NULL, 0, 0, 0, 100, 0),
(12963900, 9, 1706.14, -5817.84, 116.121, NULL, 0, 0, 0, 100, 0),
(12963900, 10, 1703.89, -5811.78, 116.022, NULL, 0, 0, 0, 100, 0),
(12963900, 11, 1701, -5806.55, 115.761, NULL, 0, 0, 0, 100, 0),
(12963900, 12, 1696.82, -5810.47, 115.969, NULL, 0, 0, 0, 100, 0),
(12963900, 13, 1687.4, -5820.39, 116.123, NULL, 0, 0, 0, 100, 0),
(12963900, 14, 1683.54, -5831.59, 116.129, NULL, 0, 0, 0, 100, 0),
(12963900, 15, 1671.76, -5841.22, 116.154, NULL, 0, 0, 0, 100, 0),
(12963900, 16, 1653.99, -5842.91, 116.13, NULL, 0, 0, 0, 100, 0),

(12964800, 1, 1624.65, -5775.75, 116.118, NULL, 0, 0, 0, 100, 0),
(12964800, 2, 1633.19, -5776.35, 116.135, NULL, 0, 0, 0, 100, 0),
(12964800, 3, 1643.35, -5777.64, 116.173, NULL, 0, 0, 0, 100, 0),
(12964800, 4, 1650.32, -5778.36, 116.156, NULL, 0, 0, 0, 100, 0),
(12964800, 5, 1660.28, -5779.68, 116.114, NULL, 0, 0, 0, 100, 0),
(12964800, 6, 1660.86, -5783.13, 116.116, NULL, 0, 0, 0, 100, 0),
(12964800, 7, 1662.02, -5792.15, 116.12, NULL, 0, 0, 0, 100, 0),
(12964800, 8, 1662.83, -5799.71, 116.12, NULL, 0, 0, 0, 100, 0),
(12964800, 9, 1662.02, -5792.15, 116.12, NULL, 0, 0, 0, 100, 0),
(12964800, 10, 1660.86, -5783.13, 116.116, NULL, 0, 0, 0, 100, 0),
(12964800, 11, 1660.28, -5779.68, 116.114, NULL, 0, 0, 0, 100, 0),
(12964800, 12, 1650.32, -5778.36, 116.156, NULL, 0, 0, 0, 100, 0),
(12964800, 13, 1643.35, -5777.64, 116.173, NULL, 0, 0, 0, 100, 0),
(12964800, 14, 1633.19, -5776.35, 116.135, NULL, 0, 0, 0, 100, 0),
(12964800, 15, 1624.65, -5775.75, 116.118, NULL, 0, 0, 0, 100, 0),
(12964800, 16, 1605.68, -5769.41, 116.09, NULL, 0, 0, 0, 100, 0),

(12965100, 1, 1697.22, -5681.61, 100.935, NULL, 0, 0, 0, 100, 0),
(12965100, 2, 1697.21, -5693.08, 100.954, NULL, 0, 0, 0, 100, 0),
(12965100, 3, 1697.24, -5703, 102.153, NULL, 0, 0, 0, 100, 0),
(12965100, 4, 1697.37, -5713.05, 103.852, NULL, 0, 0, 0, 100, 0),
(12965100, 5, 1697.4, -5722.63, 105.462, NULL, 0, 0, 0, 100, 0),
(12965100, 6, 1697.42, -5732.5, 107.141, NULL, 0, 0, 0, 100, 0),
(12965100, 7, 1697.47, -5743.48, 108.924, NULL, 0, 0, 0, 100, 0),
(12965100, 8, 1697.75, -5751.68, 110.122, NULL, 0, 0, 0, 100, 0),
(12965100, 9, 1698.26, -5763.04, 111.63, NULL, 0, 0, 0, 100, 0),
(12965100, 10, 1698.62, -5770.41, 112.531, NULL, 0, 0, 0, 100, 0),
(12965100, 11, 1698.26, -5763.04, 111.63, NULL, 0, 0, 0, 100, 0),
(12965100, 12, 1697.75, -5751.68, 110.122, NULL, 0, 0, 0, 100, 0),
(12965100, 13, 1697.47, -5743.48, 108.924, NULL, 0, 0, 0, 100, 0),
(12965100, 14, 1697.42, -5732.5, 107.141, NULL, 0, 0, 0, 100, 0),
(12965100, 15, 1697.4, -5722.63, 105.462, NULL, 0, 0, 0, 100, 0),
(12965100, 16, 1697.37, -5713.05, 103.852, NULL, 0, 0, 0, 100, 0),
(12965100, 17, 1697.24, -5703, 102.153, NULL, 0, 0, 0, 100, 0),
(12965100, 18, 1697.21, -5693.08, 100.954, NULL, 0, 0, 0, 100, 0),
(12965100, 19, 1697.22, -5681.61, 100.935, NULL, 0, 0, 0, 100, 0),
(12965100, 20, 1697.03, -5672.62, 100.93, NULL, 0, 0, 0, 100, 0),

(12965600, 1, 1652.49, -5964.18, 130.396, NULL, 0, 0, 0, 100, 0),
(12965600, 2, 1652.54, -5957.19, 128.178, NULL, 0, 0, 0, 100, 0),
(12965600, 3, 1652.8, -5946.69, 125.333, NULL, 0, 0, 0, 100, 0),
(12965600, 4, 1652.97, -5939.69, 123.965, NULL, 0, 0, 0, 100, 0),
(12965600, 5, 1653.16, -5929.19, 121.793, NULL, 0, 0, 0, 100, 0),
(12965600, 6, 1653.53, -5918.7, 118.519, NULL, 0, 0, 0, 100, 0),
(12965600, 7, 1653.77, -5911.7, 116.768, NULL, 0, 0, 0, 100, 0),
(12965600, 8, 1654.04, -5903.89, 116.144, NULL, 0, 0, 0, 100, 0),
(12965600, 9, 1658.65, -5901, 116.141, NULL, 0, 0, 0, 100, 0),
(12965600, 10, 1667.72, -5895.71, 116.143, NULL, 0, 0, 0, 100, 0),
(12965600, 11, 1673.84, -5892.31, 116.149, NULL, 0, 0, 0, 100, 0),
(12965600, 12, 1684.22, -5886.85, 116.146, NULL, 0, 0, 0, 100, 0),
(12965600, 13, 1691.82, -5882.8, 116.14, NULL, 0, 0, 0, 100, 0),
(12965600, 14, 1684.22, -5886.85, 116.146, NULL, 0, 0, 0, 100, 0),
(12965600, 15, 1673.84, -5892.31, 116.149, NULL, 0, 0, 0, 100, 0),
(12965600, 16, 1667.72, -5895.71, 116.143, NULL, 0, 0, 0, 100, 0),
(12965600, 17, 1658.65, -5901, 116.141, NULL, 0, 0, 0, 100, 0),
(12965600, 18, 1654.04, -5903.89, 116.144, NULL, 0, 0, 0, 100, 0),
(12965600, 19, 1653.77, -5911.7, 116.768, NULL, 0, 0, 0, 100, 0),
(12965600, 20, 1653.53, -5918.7, 118.519, NULL, 0, 0, 0, 100, 0),
(12965600, 21, 1653.16, -5929.19, 121.793, NULL, 0, 0, 0, 100, 0),
(12965600, 22, 1652.97, -5939.69, 123.965, NULL, 0, 0, 0, 100, 0),
(12965600, 23, 1652.8, -5946.69, 125.333, NULL, 0, 0, 0, 100, 0),
(12965600, 24, 1652.54, -5957.19, 128.178, NULL, 0, 0, 0, 100, 0),
(12965600, 25, 1652.49, -5964.18, 130.396, NULL, 0, 0, 0, 100, 0),
(12965600, 26, 1652.36, -5975.49, 132.70, NULL, 0, 0, 0, 100, 0),

(12963800, 1, 1561.98, -5777.51, 118.155, NULL, 0, 0, 0, 100, 0),
(12963800, 2, 1555, -5777.93, 118.64, NULL, 0, 0, 0, 100, 0),
(12963800, 3, 1548.01, -5778.28, 119.784, NULL, 0, 0, 0, 100, 0),
(12963800, 4, 1541.01, -5778.58, 121.11, NULL, 0, 0, 0, 100, 0),
(12963800, 5, 1530.52, -5778.36, 122.516, NULL, 0, 0, 0, 100, 0),
(12963800, 6, 1523.52, -5778.15, 123.093, NULL, 0, 0, 0, 100, 0),
(12963800, 7, 1515.65, -5777.74, 124.393, NULL, 0, 0, 0, 100, 0),
(12963800, 8, 1516.09, -5770.75, 122.7, NULL, 0, 0, 0, 100, 0),
(12963800, 9, 1516.54, -5763.77, 121.79, NULL, 0, 0, 0, 100, 0),
(12963800, 10, 1517.23, -5753.29, 120.96, NULL, 0, 0, 0, 100, 0),
(12963800, 11, 1517.65, -5746.3, 119.79, NULL, 0, 0, 0, 100, 0),
(12963800, 12, 1518.32, -5735.24, 117.575, NULL, 0, 0, 0, 100, 0),
(12963800, 13, 1518.56, -5731.75, 116.641, NULL, 0, 0, 0, 100, 0),
(12963800, 14, 1519.11, -5723.94, 116.102, NULL, 0, 0, 0, 100, 0),
(12963800, 15, 1519.65, -5720.09, 116.102, NULL, 0, 0, 0, 100, 0),
(12963800, 16, 1522.66, -5713.76, 116.103, NULL, 0, 0, 0, 100, 0),
(12963800, 17, 1529.94, -5703.6, 116.103, NULL, 0, 0, 0, 100, 0),
(12963800, 18, 1522.66, -5713.76, 116.103, NULL, 0, 0, 0, 100, 0),
(12963800, 19, 1519.65, -5720.09, 116.102, NULL, 0, 0, 0, 100, 0),
(12963800, 20, 1519.11, -5723.94, 116.102, NULL, 0, 0, 0, 100, 0),
(12963800, 21, 1518.56, -5731.75, 116.641, NULL, 0, 0, 0, 100, 0),
(12963800, 22, 1518.32, -5735.24, 117.575, NULL, 0, 0, 0, 100, 0),
(12963800, 23, 1517.65, -5746.3, 119.79, NULL, 0, 0, 0, 100, 0),
(12963800, 24, 1517.23, -5753.29, 120.96, NULL, 0, 0, 0, 100, 0),
(12963800, 25, 1516.54, -5763.77, 121.79, NULL, 0, 0, 0, 100, 0),
(12963800, 26, 1516.09, -5770.75, 122.7, NULL, 0, 0, 0, 100, 0),
(12963800, 27, 1515.65, -5777.74, 124.393, NULL, 0, 0, 0, 100, 0),
(12963800, 28, 1523.52, -5778.15, 123.093, NULL, 0, 0, 0, 100, 0),
(12963800, 29, 1530.52, -5778.36, 122.516, NULL, 0, 0, 0, 100, 0),
(12963800, 30, 1541.01, -5778.58, 121.11, NULL, 0, 0, 0, 100, 0),
(12963800, 31, 1548.01, -5778.28, 119.784, NULL, 0, 0, 0, 100, 0),
(12963800, 32, 1555, -5777.93, 118.64, NULL, 0, 0, 0, 100, 0),
(12963800, 33, 1561.98, -5777.51, 118.155, NULL, 0, 0, 0, 100, 0),
(12963800, 34, 1570.41, -5776.94, 117.86, NULL, 0, 0, 0, 100, 0),

(12964000, 1, 1600.55, -5908.86, 116.317, NULL, 0, 0, 0, 100, 0),
(12964000, 2, 1593.85, -5906.81, 117.143, NULL, 0, 0, 0, 100, 0),
(12964000, 3, 1583.88, -5903.53, 119.437, NULL, 0, 0, 0, 100, 0),
(12964000, 4, 1577.6, -5901.65, 120.72, NULL, 0, 0, 0, 100, 0),
(12964000, 5, 1570.77, -5900.11, 122.094, NULL, 0, 0, 0, 100, 0),
(12964000, 6, 1562.59, -5898.43, 123.523, NULL, 0, 0, 0, 100, 0),
(12964000, 7, 1555.69, -5897.28, 125.116, NULL, 0, 0, 0, 100, 0),
(12964000, 8, 1545.34, -5895.51, 127.386, NULL, 0, 0, 0, 100, 0),
(12964000, 9, 1535.03, -5893.55, 129.08, NULL, 0, 0, 0, 100, 0),
(12964000, 10, 1526.53, -5890.97, 130.096, NULL, 0, 0, 0, 100, 0),
(12964000, 11, 1519.88, -5888.78, 130.624, NULL, 0, 0, 0, 100, 0),
(12964000, 12, 1511.25, -5885.75, 131.014, NULL, 0, 0, 0, 100, 0),
(12964000, 13, 1504.95, -5883.19, 131.188, NULL, 0, 0, 0, 100, 0),
(12964000, 14, 1511.25, -5885.75, 131.014, NULL, 0, 0, 0, 100, 0),
(12964000, 15, 1519.88, -5888.78, 130.624, NULL, 0, 0, 0, 100, 0),
(12964000, 16, 1526.53, -5890.97, 130.096, NULL, 0, 0, 0, 100, 0),
(12964000, 17, 1535.03, -5893.55, 129.08, NULL, 0, 0, 0, 100, 0),
(12964000, 18, 1545.34, -5895.51, 127.386, NULL, 0, 0, 0, 100, 0),
(12964000, 19, 1555.69, -5897.28, 125.116, NULL, 0, 0, 0, 100, 0),
(12964000, 20, 1562.59, -5898.43, 123.523, NULL, 0, 0, 0, 100, 0),
(12964000, 21, 1570.77, -5900.11, 122.094, NULL, 0, 0, 0, 100, 0),
(12964000, 22, 1577.6, -5901.65, 120.72, NULL, 0, 0, 0, 100, 0),
(12964000, 23, 1583.88, -5903.53, 119.437, NULL, 0, 0, 0, 100, 0),
(12964000, 24, 1593.85, -5906.81, 117.143, NULL, 0, 0, 0, 100, 0),
(12964000, 25, 1600.55, -5908.86, 116.317, NULL, 0, 0, 0, 100, 0),
(12964000, 26, 1608.16, -5911.04, 116.14, NULL, 0, 0, 0, 100, 0),

(12964900, 1, 1688.65, -5983.67, 130.425, NULL, 0, 0, 0, 100, 0),
(12964900, 2, 1690.94, -5989.71, 130.732, NULL, 0, 0, 0, 100, 0),
(12964900, 3, 1693.11, -5995.7, 132.877, NULL, 0, 0, 0, 100, 0),
(12964900, 4, 1694.74, -6000.31, 134.985, NULL, 0, 0, 0, 100, 0),
(12964900, 5, 1696.61, -6005.58, 135.86, NULL, 0, 0, 0, 100, 0),
(12964900, 6, 1697.87, -6008.84, 135.329, NULL, 0, 0, 0, 100, 0),
(12964900, 7, 1701.65, -6018.64, 134.577, NULL, 0, 0, 0, 100, 0),
(12964900, 8, 1705.38, -6028.45, 133.91, NULL, 0, 0, 0, 100, 0),
(12964900, 9, 1707.82, -6035.01, 133.047, NULL, 0, 0, 0, 100, 0),
(12964900, 10, 1711.37, -6044.9, 134.387, NULL, 0, 0, 0, 100, 0),
(12964900, 11, 1713.94, -6052.34, 136.517, NULL, 0, 0, 0, 100, 0),
(12964900, 12, 1716.5, -6059.74, 140.355, NULL, 0, 0, 0, 100, 0),
(12964900, 13, 1710.82, -6059.63, 139.044, NULL, 0, 0, 0, 100, 0),
(12964900, 14, 1702.12, -6059.45, 139.905, NULL, 0, 0, 0, 100, 0),
(12964900, 15, 1698.4, -6059.93, 139.766, NULL, 0, 0, 0, 100, 0),
(12964900, 16, 1690.63, -6048.82, 134.459, NULL, 0, 0, 0, 100, 0),
(12964900, 17, 1688.63, -6037.27, 133.038, NULL, 0, 0, 0, 100, 0),
(12964900, 18, 1688.04, -6026.31, 133.144, NULL, 0, 0, 0, 100, 0),
(12964900, 19, 1687.62, -6016.61, 133.455, NULL, 0, 0, 0, 100, 0),
(12964900, 20, 1686.48, -6005.39, 133.494, NULL, 0, 0, 0, 100, 0),
(12964900, 21, 1685.56, -5993.86, 132.473, NULL, 0, 0, 0, 100, 0),
(12964900, 22, 1681.00, -5986.50, 132.497, NULL, 0, 0, 0, 100, 0),
(12964900, 23, 1675.66, -5976.37, 132.764, NULL, 0, 0, 0, 100, 0),

(12965300, 1, 1567.97, -5940.48, 119.88, NULL, 0, 0, 0, 100, 0),
(12965300, 2, 1563.68, -5946.02, 119.894, NULL, 0, 0, 0, 100, 0),
(12965300, 3, 1557.54, -5954.54, 119.346, NULL, 0, 0, 0, 100, 0),
(12965300, 4, 1551.49, -5963.11, 118.323, NULL, 0, 0, 0, 100, 0),
(12965300, 5, 1546.54, -5968.03, 117.729, NULL, 0, 0, 0, 100, 0),
(12965300, 6, 1538.71, -5975.02, 116.86, NULL, 0, 0, 0, 100, 0),
(12965300, 7, 1530.83, -5981.96, 116.347, NULL, 0, 0, 0, 100, 0),
(12965300, 8, 1525.5, -5986.5, 116.363, NULL, 0, 0, 0, 100, 0),
(12965300, 9, 1517.01, -5994.29, 116.634, NULL, 0, 0, 0, 100, 0),
(12965300, 10, 1525.5, -5986.5, 116.363, NULL, 0, 0, 0, 100, 0),
(12965300, 11, 1530.83, -5981.96, 116.347, NULL, 0, 0, 0, 100, 0),
(12965300, 12, 1538.71, -5975.02, 116.86, NULL, 0, 0, 0, 100, 0),
(12965300, 13, 1546.54, -5968.03, 117.729, NULL, 0, 0, 0, 100, 0),
(12965300, 14, 1551.49, -5963.11, 118.323, NULL, 0, 0, 0, 100, 0),
(12965300, 15, 1557.54, -5954.54, 119.346, NULL, 0, 0, 0, 100, 0),
(12965300, 16, 1563.68, -5946.02, 119.894, NULL, 0, 0, 0, 100, 0),
(12965300, 17, 1567.97, -5940.48, 119.88, NULL, 0, 0, 0, 100, 0),
(12965300, 18, 1573.61, -5933.74, 119.60, NULL, 0, 0, 0, 100, 0),

(12964300, 1, 1472.9, -6114.2, 116.284, NULL, 0, 0, 0, 100, 0),
(12964300, 2, 1471.64, -6106.69, 116.356, NULL, 0, 0, 0, 100, 0),
(12964300, 3, 1472.5, -6099.53, 116.542, NULL, 0, 0, 0, 100, 0),
(12964300, 4, 1474.55, -6088, 116.602, NULL, 0, 0, 0, 100, 0),
(12964300, 5, 1474.32, -6083.01, 116.443, NULL, 0, 0, 0, 100, 0),
(12964300, 6, 1474.06, -6072.51, 116.309, NULL, 0, 0, 0, 100, 0),
(12964300, 7, 1473.89, -6062.02, 116.303, NULL, 0, 0, 0, 100, 0),
(12964300, 8, 1473.73, -6051.52, 116.329, NULL, 0, 0, 0, 100, 0),
(12964300, 9, 1473.35, -6041.03, 116.308, NULL, 0, 0, 0, 100, 0),
(12964300, 10, 1474.46, -6030.12, 116.284, NULL, 0, 0, 0, 100, 0),
(12964300, 11, 1475.86, -6023.26, 116.283, NULL, 0, 0, 0, 100, 0),
(12964300, 12, 1477.33, -6016.42, 116.284, NULL, 0, 0, 0, 100, 0),
(12964300, 13, 1478.8, -6009.57, 116.283, NULL, 0, 0, 0, 100, 0),
(12964300, 14, 1485.28, -6002.28, 116.304, NULL, 0, 0, 0, 100, 0),
(12964300, 15, 1490.99, -5999.12, 116.399, NULL, 0, 0, 0, 100, 0),
(12964300, 16, 1501.04, -5996.1, 116.65, NULL, 0, 0, 0, 100, 0),
(12964300, 17, 1507.75, -5994.11, 116.622, NULL, 0, 0, 0, 100, 0),
(12964300, 18, 1516.05, -5992.28, 116.59, NULL, 0, 0, 0, 100, 0),
(12964300, 19, 1517.43, -5995.25, 116.657, NULL, 0, 0, 0, 100, 0),
(12964300, 20, 1518.63, -6004.94, 116.705, NULL, 0, 0, 0, 100, 0),
(12964300, 21, 1519.26, -6015.85, 116.698, NULL, 0, 0, 0, 100, 0),
(12964300, 22, 1520.53, -6022.74, 116.677, NULL, 0, 0, 0, 100, 0),
(12964300, 23, 1521.85, -6029.61, 116.667, NULL, 0, 0, 0, 100, 0),
(12964300, 24, 1523.13, -6040.01, 116.691, NULL, 0, 0, 0, 100, 0),
(12964300, 25, 1523.7, -6050.49, 116.641, NULL, 0, 0, 0, 100, 0),
(12964300, 26, 1524.2, -6057.48, 116.612, NULL, 0, 0, 0, 100, 0),
(12964300, 27, 1524.55, -6064.47, 116.582, NULL, 0, 0, 0, 100, 0),
(12964300, 28, 1524.98, -6074.96, 116.429, NULL, 0, 0, 0, 100, 0),
(12964300, 29, 1524.17, -6079.84, 116.371, NULL, 0, 0, 0, 100, 0),
(12964300, 30, 1521.86, -6087.35, 116.354, NULL, 0, 0, 0, 100, 0),
(12964300, 31, 1517.24, -6096.78, 116.334, NULL, 0, 0, 0, 100, 0),
(12964300, 32, 1514.14, -6103.05, 116.301, NULL, 0, 0, 0, 100, 0),
(12964300, 33, 1508.61, -6108.06, 116.283, NULL, 0, 0, 0, 100, 0),
(12964300, 34, 1502.59, -6111.64, 116.28, NULL, 0, 0, 0, 100, 0),
(12964300, 35, 1493.14, -6116.19, 116.278, NULL, 0, 0, 0, 100, 0),
(12964300, 36, 1486.7, -6118.93, 116.278, NULL, 0, 0, 0, 100, 0),
(12964300, 37, 1476.94, -6122.82, 116.278, NULL, 0, 0, 0, 100, 0),

(12965700, 1, 1479.77, -5795.9, 131.225, NULL, 0, 0, 0, 100, 0),
(12965700, 2, 1473.2, -5788.08, 131.226, NULL, 0, 0, 0, 100, 0),
(12965700, 3, 1459.8, -5772.83, 131.277, NULL, 0, 0, 0, 100, 0),
(12965700, 4, 1453.71, -5765.56, 131.249, NULL, 0, 0, 0, 100, 0),
(12965700, 5, 1446.44, -5756.63, 131.211, NULL, 0, 0, 0, 100, 0),
(12965700, 6, 1438.99, -5751.49, 131.211, NULL, 0, 0, 0, 100, 0),
(12965700, 7, 1425.57, -5746.22, 131.211, NULL, 0, 0, 0, 100, 0),
(12965700, 8, 1416.81, -5751.64, 131.245, NULL, 0, 0, 0, 100, 0),
(12965700, 9, 1413.58, -5757.84, 131.376, NULL, 0, 0, 0, 100, 0),
(12965700, 10, 1408.82, -5766.98, 131.427, NULL, 0, 0, 0, 100, 0),
(12965700, 11, 1403.24, -5779.82, 131.324, NULL, 0, 0, 0, 100, 0),
(12965700, 12, 1398.89, -5791.07, 131.218, NULL, 0, 0, 0, 100, 0),
(12965700, 13, 1397.04, -5798.61, 131.221, NULL, 0, 0, 0, 100, 0),
(12965700, 14, 1400.24, -5806.23, 131.229, NULL, 0, 0, 0, 100, 0),
(12965700, 15, 1403.84, -5814.47, 131.213, NULL, 0, 0, 0, 100, 0),
(12965700, 16, 1413.36, -5825.58, 131.21, NULL, 0, 0, 0, 100, 0),
(12965700, 17, 1418.04, -5830.78, 131.202, NULL, 0, 0, 0, 100, 0),
(12965700, 18, 1428.02, -5842.01, 131.206, NULL, 0, 0, 0, 100, 0),
(12965700, 19, 1437.58, -5853.39, 131.21, NULL, 0, 0, 0, 100, 0),
(12965700, 20, 1450.56, -5856.58, 131.219, NULL, 0, 0, 0, 100, 0),
(12965700, 21, 1460.17, -5856.59, 131.218, NULL, 0, 0, 0, 100, 0),
(12965700, 22, 1468.48, -5856.22, 131.29, NULL, 0, 0, 0, 100, 0),
(12965700, 23, 1484.22, -5855.63, 131.217, NULL, 0, 0, 0, 100, 0),
(12965700, 24, 1493.32, -5851.1, 131.214, NULL, 0, 0, 0, 100, 0),
(12965700, 25, 1492.52, -5840.63, 131.211, NULL, 0, 0, 0, 100, 0),
(12965700, 26, 1491.61, -5830.18, 131.211, NULL, 0, 0, 0, 100, 0),
(12965700, 27, 1490.1, -5819.79, 131.211, NULL, 0, 0, 0, 100, 0),
(12965700, 28, 1487.21, -5806.08, 131.221, NULL, 0, 0, 0, 100, 0),

(12965400, 1, 1431.17, -5838.02, 131.213, NULL, 0, 0, 0, 100, 0),
(12965400, 2, 1426.36, -5832.93, 131.21, NULL, 0, 0, 0, 100, 0),
(12965400, 3, 1421.49, -5827.91, 131.207, NULL, 0, 0, 0, 100, 0),
(12965400, 4, 1411, -5816.86, 131.208, NULL, 0, 0, 0, 100, 0),
(12965400, 5, 1407.67, -5812.31, 131.209, NULL, 0, 0, 0, 100, 0),
(12965400, 6, 1404.21, -5806.8, 131.213, NULL, 0, 0, 0, 100, 0),
(12965400, 7, 1402.93, -5801.91, 131.214, NULL, 0, 0, 0, 100, 0),
(12965400, 8, 1404.46, -5794.68, 131.211, NULL, 0, 0, 0, 100, 0),
(12965400, 9, 1407.36, -5788.31, 131.211, NULL, 0, 0, 0, 100, 0),
(12965400, 10, 1411.81, -5778.8, 131.23, NULL, 0, 0, 0, 100, 0),
(12965400, 11, 1414.23, -5773.33, 131.243, NULL, 0, 0, 0, 100, 0),
(12965400, 12, 1418.51, -5763.75, 131.241, NULL, 0, 0, 0, 100, 0),
(12965400, 13, 1421.65, -5756.73, 131.214, NULL, 0, 0, 0, 100, 0),
(12965400, 14, 1425.45, -5753.72, 131.211, NULL, 0, 0, 0, 100, 0),
(12965400, 15, 1435.95, -5755.48, 131.211, NULL, 0, 0, 0, 100, 0),
(12965400, 16, 1442.46, -5762.51, 131.211, NULL, 0, 0, 0, 100, 0),
(12965400, 17, 1447.39, -5767.48, 131.211, NULL, 0, 0, 0, 100, 0),
(12965400, 18, 1454.41, -5775.28, 131.211, NULL, 0, 0, 0, 100, 0),
(12965400, 19, 1461.21, -5783.29, 131.211, NULL, 0, 0, 0, 100, 0),
(12965400, 20, 1468.03, -5791.27, 131.211, NULL, 0, 0, 0, 100, 0),
(12965400, 21, 1476.99, -5802.03, 131.211, NULL, 0, 0, 0, 100, 0),
(12965400, 22, 1482.16, -5813.56, 131.211, NULL, 0, 0, 0, 100, 0),
(12965400, 23, 1484.44, -5820.17, 131.211, NULL, 0, 0, 0, 100, 0),
(12965400, 24, 1486.73, -5832.7, 131.222, NULL, 0, 0, 0, 100, 0),
(12965400, 25, 1487.87, -5843.14, 131.215, NULL, 0, 0, 0, 100, 0),
(12965400, 26, 1483.61, -5849.93, 131.216, NULL, 0, 0, 0, 100, 0),
(12965400, 27, 1476.62, -5850.23, 131.246, NULL, 0, 0, 0, 100, 0),
(12965400, 28, 1466.13, -5850.69, 131.242, NULL, 0, 0, 0, 100, 0),
(12965400, 29, 1457.02, -5851.2, 131.282, NULL, 0, 0, 0, 100, 0),
(12965400, 30, 1447.8, -5852.53, 131.261, NULL, 0, 0, 0, 100, 0),
(12965400, 31, 1441.34, -5848.46, 131.213, NULL, 0, 0, 0, 100, 0),
(12965400, 32, 1437.42, -5844.97, 131.213, NULL, 0, 0, 0, 100, 0),

(13000900, 1, 1426.98, -5781.28, 131.21, NULL, 0, 0, 0, 100, 0),
(13000900, 2, 1434.25, -5776.49, 131.21, NULL, 0, 0, 0, 100, 0),
(13000900, 3, 1439.64, -5781.63, 131.21, NULL, 0, 0, 0, 100, 0),
(13000900, 4, 1444.88, -5786.62, 131.21, NULL, 0, 0, 0, 100, 0),
(13000900, 5, 1449.79, -5791.61, 131.21, NULL, 0, 0, 0, 100, 0),
(13000900, 6, 1457.11, -5799.14, 131.21, NULL, 0, 0, 0, 100, 0),
(13000900, 7, 1464.51, -5806.59, 131.211, NULL, 0, 0, 0, 100, 0),
(13000900, 8, 1474.33, -5816.57, 131.212, NULL, 0, 0, 0, 100, 0),
(13000900, 9, 1472.52, -5821.27, 131.231, NULL, 0, 0, 0, 100, 0),
(13000900, 10, 1466.63, -5826.96, 131.329, NULL, 0, 0, 0, 100, 0),
(13000900, 11, 1460.48, -5821.82, 131.277, NULL, 0, 0, 0, 100, 0),
(13000900, 12, 1451.37, -5815.2, 131.245, NULL, 0, 0, 0, 100, 0),
(13000900, 13, 1446.33, -5810.34, 131.216, NULL, 0, 0, 0, 100, 0),
(13000900, 14, 1442.31, -5806.39, 131.211, NULL, 0, 0, 0, 100, 0),
(13000900, 15, 1436.56, -5800.31, 131.211, NULL, 0, 0, 0, 100, 0),
(13000900, 16, 1435.51, -5799.23, 131.211, NULL, 0, 0, 0, 100, 0),
(13000900, 17, 1432.09, -5791.48, 131.211, NULL, 0, 0, 0, 100, 0),
(13000900, 18, 1428.52, -5787.77, 131.211, NULL, 0, 0, 0, 100, 0),

(12970200, 1, 1429.63, -5825.72, 131.211, NULL, 0, 0, 0, 100, 0),
(12970200, 2, 1439.79, -5834.19, 131.215, NULL, 0, 0, 0, 100, 0),
(12970200, 3, 1444.87, -5836.49, 131.217, NULL, 0, 0, 0, 100, 0),
(12970200, 4, 1449.51, -5834.77, 131.231, NULL, 0, 0, 0, 100, 0),
(12970200, 5, 1458.49, -5824.22, 131.288, NULL, 0, 0, 0, 100, 0),
(12970200, 6, 1453.36, -5819.46, 131.274, NULL, 0, 0, 0, 100, 0),
(12970200, 7, 1445.71, -5812.28, 131.219, NULL, 0, 0, 0, 100, 0),
(12970200, 8, 1438.24, -5804.9, 131.211, NULL, 0, 0, 0, 100, 0),
(12970200, 9, 1431.81, -5798.58, 131.211, NULL, 0, 0, 0, 100, 0),
(12970200, 10, 1422.92, -5789.67, 131.211, NULL, 0, 0, 0, 100, 0),
(12970200, 11, 1418.38, -5794.73, 131.211, NULL, 0, 0, 0, 100, 0),
(12970200, 12, 1411.83, -5802.83, 131.211, NULL, 0, 0, 0, 100, 0),
(12970200, 13, 1415.87, -5808.55, 131.211, NULL, 0, 0, 0, 100, 0),
(12970200, 14, 1424.03, -5820.05, 131.211, NULL, 0, 0, 0, 100, 0),

(13001400, 1, 1458.06, -5921.76, 131.27, NULL, 0, 0, 0, 100, 0),
(13001400, 2, 1475.02, -5919.98, 131.59, NULL, 0, 0, 0, 100, 0),
(13001400, 3, 1474.97, -5909.23, 131.613, NULL, 0, 0, 0, 100, 0),
(13001400, 4, 1472.46, -5906.79, 131.597, NULL, 0, 0, 0, 100, 0),
(13001400, 5, 1465.15, -5899.26, 131.481, NULL, 0, 0, 0, 100, 0),
(13001400, 6, 1457.8, -5891.76, 131.258, NULL, 0, 0, 0, 100, 0),
(13001400, 7, 1452.89, -5886.77, 131.217, NULL, 0, 0, 0, 100, 0),
(13001400, 8, 1443.26, -5877.43, 131.214, NULL, 0, 0, 0, 100, 0),
(13001400, 9, 1438.41, -5882.54, 131.214, NULL, 0, 0, 0, 100, 0),
(13001400, 10, 1432.28, -5889.9, 131.214, NULL, 0, 0, 0, 100, 0),
(13001400, 11, 1441.93, -5901.71, 131.232, NULL, 0, 0, 0, 100, 0),
(13001400, 12, 1447.28, -5908.45, 131.306, NULL, 0, 0, 0, 100, 0),
(13001400, 13, 1452.15, -5914.63, 131.353, NULL, 0, 0, 0, 100, 0),

(12972200, 1, 1467.87, -5870.13, 131.579, NULL, 0, 0, 0, 100, 0),
(12972200, 2, 1474.8, -5877.15, 131.827, NULL, 0, 0, 0, 100, 0),
(12972200, 3, 1481.43, -5883.86, 131.999, NULL, 0, 0, 0, 100, 0),
(12972200, 4, 1483.68, -5886.54, 132, NULL, 0, 0, 0, 100, 0),
(12972200, 5, 1487.81, -5891.63, 132.238, NULL, 0, 0, 0, 100, 0),
(12972200, 6, 1491.96, -5897.79, 132.383, NULL, 0, 0, 0, 100, 0),
(12972200, 7, 1488.27, -5902.55, 132.249, NULL, 0, 0, 0, 100, 0),
(12972200, 8, 1482.63, -5910.16, 131.814, NULL, 0, 0, 0, 100, 0),
(12972200, 9, 1477.54, -5905.35, 131.701, NULL, 0, 0, 0, 100, 0),
(12972200, 10, 1469.88, -5897.95, 131.562, NULL, 0, 0, 0, 100, 0),
(12972200, 11, 1463.56, -5891.29, 131.344, NULL, 0, 0, 0, 100, 0),
(12972200, 12, 1456.9, -5884.41, 131.22, NULL, 0, 0, 0, 100, 0),
(12972200, 13, 1450.85, -5876.98, 131.214, NULL, 0, 0, 0, 100, 0),
(12972200, 14, 1447.34, -5872.19, 131.214, NULL, 0, 0, 0, 100, 0),
(12972200, 15, 1453.71, -5868.07, 131.214, NULL, 0, 0, 0, 100, 0),
(12972200, 16, 1460.86, -5863.47, 131.254, NULL, 0, 0, 0, 100, 0),
(12972200, 17, 1463.84, -5865.97, 131.358, NULL, 0, 0, 0, 100, 0),

(12965200, 1, 1750.42, -5952.79, 116.165, NULL, 0, 0, 0, 100, 0),
(12965200, 2, 1752.08, -5949.71, 116.137, NULL, 0, 0, 0, 100, 0),
(12965200, 3, 1757.09, -5940.48, 116.12, NULL, 0, 0, 0, 100, 0),
(12965200, 4, 1760.35, -5934.29, 116.119, NULL, 0, 0, 0, 100, 0),
(12965200, 5, 1766.73, -5921.46, 116.12, NULL, 0, 0, 0, 100, 0),
(12965200, 6, 1772.87, -5923.81, 116.113, NULL, 0, 0, 0, 100, 0),
(12965200, 7, 1779.4, -5926.32, 116.119, NULL, 0, 0, 0, 100, 0),
(12965200, 8, 1785.94, -5928.83, 116.123, NULL, 0, 0, 0, 100, 0),
(12965200, 9, 1797.67, -5933.39, 115.997, NULL, 0, 0, 0, 100, 0),
(12965200, 10, 1785.94, -5928.83, 116.123, NULL, 0, 0, 0, 100, 0),
(12965200, 11, 1779.4, -5926.32, 116.119, NULL, 0, 0, 0, 100, 0),
(12965200, 12, 1772.87, -5923.81, 116.113, NULL, 0, 0, 0, 100, 0),
(12965200, 13, 1766.73, -5921.46, 116.12, NULL, 0, 0, 0, 100, 0),
(12965200, 14, 1760.35, -5934.29, 116.119, NULL, 0, 0, 0, 100, 0),
(12965200, 15, 1757.09, -5940.48, 116.12, NULL, 0, 0, 0, 100, 0),
(12965200, 16, 1752.08, -5949.71, 116.137, NULL, 0, 0, 0, 100, 0),
(12965200, 17, 1750.42, -5952.79, 116.165, NULL, 0, 0, 0, 100, 0),
(12965200, 18, 1747.20, -5958.90, 116.26, NULL, 0, 0, 0, 100, 0);


-- SCARLET COMMANDERS

-- Positions

UPDATE `creature` SET `position_x` = 1739.78, `position_y` = -5775.24, `position_z` = 116.06, `orientation` = 3.4451 WHERE `guid` = 129646 AND `id1` = 28936;
UPDATE `creature` SET `position_x` = 1605.68, `position_y` = -5769.41, `position_z` = 116.09, `orientation` = 2.6490 WHERE `guid` = 129648 AND `id1` = 28936;
UPDATE `creature` SET `position_x` = 1697.03, `position_y` = -5672.62, `position_z` = 100.93, `orientation` = 4.7433 WHERE `guid` = 129651 AND `id1` = 28936;
UPDATE `creature` SET `position_x` = 1608.16, `position_y` = -5911.04, `position_z` = 116.14, `orientation` = 2.9603 WHERE `guid` = 129640 AND `id1` = 28936;
UPDATE `creature` SET `position_x` = 1487.00, `position_y` = -5806.24, `position_z` = 131.22, `orientation` = 2.2424 WHERE `guid` = 129657 AND `id1` = 28936;
UPDATE `creature` SET `position_x` = 1437.52, `position_y` = -5845.08, `position_z` = 131.21, `orientation` = 2.3013 WHERE `guid` = 129654 AND `id1` = 28936;
UPDATE `creature` SET `position_x` = 1726.44, `position_y` = -5871.98, `position_z` = 116.12, `orientation` = 3.1842 WHERE `guid` = 129655 AND `id1` = 28936;
UPDATE `creature` SET `position_x` = 1653.99, `position_y` = -5842.91, `position_z` = 116.13, `orientation` = 0.0018 WHERE `guid` = 129639 AND `id1` = 28936;
UPDATE `creature` SET `position_x` = 1573.61, `position_y` = -5933.74, `position_z` = 119.60, `orientation` = 3.9996 WHERE `guid` = 129653 AND `id1` = 28936;
UPDATE `creature` SET `position_x` = 1475.07, `position_y` = -6122.79, `position_z` = 116.27, `orientation` = 1.8018 WHERE `guid` = 129643 AND `id1` = 28936;
UPDATE `creature` SET `position_x` = 1652.36, `position_y` = -5975.49, `position_z` = 132.70, `orientation` = 1.5437 WHERE `guid` = 129656 AND `id1` = 28936;
UPDATE `creature` SET `position_x` = 1570.41, `position_y` = -5776.94, `position_z` = 117.86, `orientation` = 3.2414 WHERE `guid` = 129638 AND `id1` = 28936;
UPDATE `creature` SET `position_x` = 1747.20, `position_y` = -5958.90, `position_z` = 116.26, `orientation` = 0.9770 WHERE `guid` = 129652 AND `id1` = 28936;

-- Wander Distance and Movement Type

UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 2 WHERE `guid` IN (129646, 129648, 129651, 129640, 129657, 129654, 129655, 129639, 129649, 129653, 129643, 129656, 129638, 129649, 129652) AND `id1` = 28936;
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 129645 AND `id1` = 28936;

-- Paths

DELETE FROM `creature_addon` WHERE (`guid` IN (129646, 129655, 129639, 129648, 129651, 129656, 129638, 129640, 129649, 129653, 129657, 129643, 129654, 129652));
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES
(129646, 12964600, 2404, 0, 1, 0, 0, ''),
(129655, 12965500, 2404, 0, 1, 0, 0, ''),
(129639, 12963900, 2404, 0, 1, 0, 0, ''),
(129648, 12964800, 2404, 0, 1, 0, 0, ''),
(129651, 12965100, 2404, 0, 1, 0, 0, ''),
(129656, 12965600, 2404, 0, 1, 0, 0, ''),
(129638, 12963800, 2404, 0, 1, 0, 0, ''),
(129640, 12964000, 2404, 0, 1, 0, 0, ''),
(129649, 12964900, 2404, 0, 1, 0, 0, ''),
(129653, 12965300, 2404, 0, 1, 0, 0, ''),
(129643, 12964300, 2404, 0, 1, 0, 0, ''),
(129657, 12965700, 2404, 0, 1, 0, 0, ''),
(129654, 12965400, 2404, 0, 1, 0, 0, ''),
(129652, 12965200, 2404, 0, 1, 0, 0, '');


-- SCARLET PREACHERS

-- Positions

UPDATE `creature` SET `position_x` = 1653.99, `position_y` = -5842.91, `position_z` = 116.13, `orientation` = 0.0018 WHERE `guid` = 129674 AND `id1` = 28939;
UPDATE `creature` SET `position_x` = 1697.03, `position_y` = -5672.62, `position_z` = 100.93, `orientation` = 4.7433 WHERE `guid` = 129675 AND `id1` = 28939;
UPDATE `creature` SET `position_x` = 1605.68, `position_y` = -5769.41, `position_z` = 116.09, `orientation` = 2.6490 WHERE `guid` = 129672 AND `id1` = 28939;
UPDATE `creature` SET `position_x` = 1739.78, `position_y` = -5775.24, `position_z` = 116.06, `orientation` = 3.4451 WHERE `guid` = 129677 AND `id1` = 28939;
UPDATE `creature` SET `position_x` = 1726.44, `position_y` = -5871.98, `position_z` = 116.12, `orientation` = 3.1842 WHERE `guid` = 129673 AND `id1` = 28939;
UPDATE `creature` SET `position_x` = 1573.61, `position_y` = -5933.74, `position_z` = 119.60, `orientation` = 3.9996 WHERE `guid` = 129681 AND `id1` = 28939;
UPDATE `creature` SET `position_x` = 1475.07, `position_y` = -6122.79, `position_z` = 116.27, `orientation` = 1.8018 WHERE `guid` = 129667 AND `id1` = 28939;
UPDATE `creature` SET `position_x` = 1652.36, `position_y` = -5975.49, `position_z` = 132.70, `orientation` = 1.5437 WHERE `guid` = 129678 AND `id1` = 28939;
UPDATE `creature` SET `position_x` = 1570.41, `position_y` = -5776.94, `position_z` = 117.86, `orientation` = 3.2414 WHERE `guid` = 129679 AND `id1` = 28939;
UPDATE `creature` SET `position_x` = 1747.20, `position_y` = -5958.90, `position_z` = 116.26, `orientation` = 0.9770 WHERE `guid` = 129680 AND `id1` = 28939;
UPDATE `creature` SET `position_x` = 1608.16, `position_y` = -5911.04, `position_z` = 116.14, `orientation` = 2.9603 WHERE `guid` = 129671 AND `id1` = 28939;

-- Wander Distance and Movement Type

UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 2 WHERE `guid` IN (129674, 129675, 129672, 129677, 129673, 129681, 129667, 129678, 129671, 129679, 129680) AND `id1` = 28939;


-- Paths

DELETE FROM `creature_addon` WHERE (`guid` IN (129677, 129673, 129674, 129672, 129675, 129678, 129679, 129671, 129681, 129667, 129680));
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES
(129677, 12964600, 0, 0, 1, 0, 0, ''),
(129673, 12965500, 0, 0, 1, 0, 0, ''),
(129674, 12963900, 0, 0, 1, 0, 0, ''),
(129672, 12964800, 0, 0, 1, 0, 0, ''),
(129675, 12965100, 0, 0, 1, 0, 0, ''),
(129678, 12965600, 0, 0, 1, 0, 0, ''),
(129679, 12963800, 0, 0, 1, 0, 0, ''),
(129671, 12964000, 0, 0, 1, 0, 0, ''),
(129681, 12965300, 0, 0, 1, 0, 0, ''),
(129667, 12964300, 0, 0, 1, 0, 0, ''),
(129680, 12965200, 0, 0, 1, 0, 0, '');


-- SCARLET CRUSADERS

-- Positions

UPDATE `creature` SET `position_x` = 1479.81, `position_y` = -5878.11, `position_z` = 132.03, `orientation` = 3.4523 WHERE `guid` = 129723 AND `id1` = 28940;

-- Wander Distance and Movement Type

UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 129723 AND `id1` = 28940;
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 2 WHERE `guid` IN (129702, 129722) AND `id1` = 28940;

-- Paths

UPDATE `creature_addon` SET `path_id` = 12970200, `auras` = 52103 WHERE (`guid` IN (129702));
UPDATE `creature_addon` SET `path_id` = 12972200, `auras` = 52103 WHERE (`guid` IN (129722));


-- SCARLET MARKSMEN

-- Wander Distance and Movement Type

UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 2 WHERE `guid` IN (130009, 130014) AND `id1` = 28610;

-- Paths

UPDATE `creature_addon` SET `path_id` = 13000900, `auras` = 52103 WHERE (`guid` IN (130009));
UPDATE `creature_addon` SET `path_id` = 13001400, `auras` = 52103 WHERE (`guid` IN (130014));


-- Random Spawn for Scarlet Commanders/Preachers with Waypoints

DELETE FROM `pool_template` WHERE (`entry` IN (22346, 22347, 22348, 22349, 22350, 22351, 22352, 22353, 22354, 22355, 22356));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES 
(22346, 1, 'Scarlet Commander/Preacher Spawn (1 out 11)'),
(22347, 1, 'Scarlet Commander/Preacher Spawn (2 out 11)'),
(22348, 1, 'Scarlet Commander/Preacher Spawn (3 out 11)'),
(22349, 1, 'Scarlet Commander/Preacher Spawn (4 out 11)'),
(22350, 1, 'Scarlet Commander/Preacher Spawn (5 out 11)'),
(22351, 1, 'Scarlet Commander/Preacher Spawn (6 out 11)'),
(22352, 1, 'Scarlet Commander/Preacher Spawn (7 out 11)'),
(22353, 1, 'Scarlet Commander/Preacher Spawn (8 out 11)'),
(22354, 1, 'Scarlet Commander/Preacher Spawn (9 out 11)'),
(22355, 1, 'Scarlet Commander/Preacher Spawn (10 out 11)'),
(22356, 1, 'Scarlet Commander/Preacher Spawn (11 out 11)');


DELETE FROM `pool_creature` WHERE (`guid` IN (129656, 129678, 129655, 129673, 129639, 129674, 129646, 129677, 129651, 129675, 129648, 129672, 129638, 129679, 129640, 129671, 129653, 129681, 129643, 129667, 129652, 129680));
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES 
(129656, 22346, 0, 'Scarlet Commander (28936) (1 out 11)'),
(129678, 22346, 0, 'Scarlet Preacher (28939) (1 out 11)'),

(129655, 22347, 0, 'Scarlet Commander (28936) (2 out 11)'),
(129673, 22347, 0, 'Scarlet Preacher (28939) (2 out 11)'),

(129639, 22348, 0, 'Scarlet Commander (28936) (3 out 11)'),
(129674, 22348, 0, 'Scarlet Preacher (28939) (3 out 11)'),

(129646, 22349, 0, 'Scarlet Commander (28936) (4 out 11)'),
(129677, 22349, 0, 'Scarlet Preacher (28939) (4 out 11)'),

(129651, 22350, 0, 'Scarlet Commander (28936) (5 out 11)'),
(129675, 22350, 0, 'Scarlet Preacher (28939) (5 out 11)'),

(129648, 22351, 0, 'Scarlet Commander (28936) (6 out 11)'),
(129672, 22351, 0, 'Scarlet Preacher (28939) (6 out 11)'),

(129638, 22352, 0, 'Scarlet Commander (28936) (7 out 11)'),
(129679, 22352, 0, 'Scarlet Preacher (28939) (7 out 11)'),

(129640, 22353, 0, 'Scarlet Commander (28936) (8 out 11)'),
(129671, 22353, 0, 'Scarlet Preacher (28939) (8 out 11)'),

(129653, 22354, 0, 'Scarlet Commander (28936) (9 out 11)'),
(129681, 22354, 0, 'Scarlet Preacher (28939) (9 out 11)'),

(129643, 22355, 0, 'Scarlet Commander (28936) (10 out 11)'),
(129667, 22355, 0, 'Scarlet Preacher (28939) (10 out 11)'),

(129652, 22356, 0, 'Scarlet Commander (28936) (11 out 11)'),
(129680, 22356, 0, 'Scarlet Preacher (28939) (11 out 11)');
