-- Update gameobject 'Sitting Skeleton 01' with sniffed values
-- updated spawns
DELETE FROM `gameobject` WHERE (`id` IN (185434))
AND (`guid` IN (58140, 58141, 58142, 58144, 58145, 77704, 77708, 77835, 77855));
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES
(58140, 185434, 571, 0, 0, 1, 1, 4894.68701171875, -4735.16650390625, 27.44149971008300781, 5.550147056579589843, 0, 0, -0.358367919921875, 0.933580458164215087, 120, 255, 1, "", 47720, NULL),
(58141, 185434, 571, 0, 0, 1, 1, 4904.41259765625, -4740.48828125, 27.35112571716308593, 2.932138919830322265, 0, 0, 0.994521141052246093, 0.104535527527332305, 120, 255, 1, "", 47720, NULL),
(58142, 185434, 571, 0, 0, 1, 1, 4878.97509765625, -4750.39453125, 27.38018226623535156, 6.195919513702392578, 0, 0, -0.04361915588378906, 0.999048233032226562, 120, 255, 1, "", 47720, NULL),
(58144, 185434, 571, 0, 0, 1, 1, 4911.53369140625, -4829.2470703125, 32.69454574584960937, 1.291541695594787597, 0, 0, 0.60181427001953125, 0.798636078834533691, 120, 255, 1, "", 47720, NULL),
(58145, 185434, 571, 0, 0, 1, 1, 4904.88330078125, -4790.09423828125, 32.67609786987304687, 4.398232460021972656, 0, 0, -0.80901622772216796, 0.587786316871643066, 120, 255, 1, "", 47720, NULL),
(77704, 185434, 530, 0, 0, 1, 1, -1730.2025146484375, 5241.88232421875, -48.3983039855957031, 0.506144583225250244, 0, 0, 0.250379562377929687, 0.968147754669189453, 120, 255, 1, "", 45942, NULL),
(77708, 185434, 530, 0, 0, 1, 1, -1695.12353515625, 5272.62451171875, -50.1243476867675781, 5.654868602752685546, 0, 0, -0.30901622772216796, 0.95105677843093872, 120, 255, 1, "", 45942, NULL),
(77835, 185434, 530, 0, 0, 1, 1, -1598.3919677734375, 5396.74462890625, -40.1712608337402343, 3.769911527633666992, 0, 0, -0.95105648040771484, 0.309017121791839599, 120, 255, 1, "", 45942, NULL),
(77855, 185434, 530, 0, 0, 1, 1, -1744.1417236328125, 5123.6201171875, -35.8245086669921875, 2.024578809738159179, 0, 0, 0.848047256469726562, 0.529920578002929687, 120, 255, 1, "", 45942, NULL);

DELETE FROM `game_event_gameobject` WHERE (`eventEntry` = 12)
AND (`guid` IN (58140, 58141, 58142, 58144, 58145, 77704, 77708, 77835, 77855));
INSERT INTO `game_event_gameobject` (`eventEntry`,`guid`) VALUES
-- do not link static spawns to game event
-- (12, 58140),
-- (12, 58141),
-- (12, 58142),
-- (12, 58144),
-- (12, 58145),
(12, 77704),
(12, 77708),
(12, 77835),
(12, 77855);

-- new spawns
DELETE FROM `gameobject` WHERE (`id` IN (185434))
AND (`guid` BETWEEN 2120 AND 2146);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES
(2120, 185434, 530, 0, 0, 1, 1, -3908.9296875, 2094.20654296875, 94.9646148681640625, 2.391098499298095703, 0, 0, 0.930417060852050781, 0.366502493619918823, 120, 255, 1, "", 46158, NULL),
(2121, 185434, 530, 0, 0, 1, 1, -4058.828125, 2193.834716796875, 109.88818359375, 5.061456203460693359, 0, 0, -0.57357597351074218, 0.819152355194091796, 120, 255, 1, "", 51943, NULL),
(2122, 185434, 530, 0, 0, 1, 1, -4063.20263671875, 2172.899169921875, 111.9463272094726562, 6.12610626220703125, 0, 0, -0.07845878601074218, 0.996917366981506347, 120, 255, 1, "", 51943, NULL),
(2123, 185434, 530, 0, 0, 1, 1, -563.19317626953125, 4148.06591796875, 68.07712554931640625, 3.089183330535888671, 0, 0, 0.99965667724609375, 0.026201646775007247, 120, 255, 1, "", 45942, NULL),
(2124, 185434, 530, 0, 0, 1, 1, -567.26629638671875, 4138.7255859375, 68.07688140869140625, 2.303830623626708984, 0, 0, 0.913544654846191406, 0.406738430261611938, 120, 255, 1, "", 45942, NULL),
(2125, 185434, 530, 0, 0, 1, 1, -602.5694580078125, 4111.8681640625, 89.85257720947265625, 1.727874636650085449, 0, 0, 0.760405540466308593, 0.649448513984680175, 120, 255, 1, "", 45942, NULL),
(2126, 185434, 530, 0, 0, 1, 1, -604.217041015625, 4078.874267578125, 91.83621978759765625, 1.692969322204589843, 0, 0, 0.748955726623535156, 0.662620067596435546, 120, 255, 1, "", 45942, NULL),
(2127, 185434, 530, 0, 0, 1, 1, -608.302001953125, 4181.24609375, 63.87285232543945312, 5.637413978576660156, 0, 0, -0.31730461120605468, 0.948323667049407958, 120, 255, 1, "", 45942, NULL),
(2128, 185434, 530, 0, 0, 1, 1, -626.50543212890625, 4148.89794921875, 64.19754791259765625, 1.85004889965057373, 0, 0, 0.798635482788085937, 0.60181504487991333, 120, 255, 1, "", 45942, NULL),
(2129, 185434, 530, 0, 0, 1, 1, -703.6990966796875, 4170.35009765625, 58.32717514038085937, 1.343901276588439941, 0, 0, 0.622513771057128906, 0.78260880708694458, 120, 255, 1, "", 45942, NULL),
(2130, 185434, 530, 0, 0, 1, 1, 100.2886276245117187, 4305.134765625, 103.1036834716796875, 2.565631866455078125, 0, 0, 0.958819389343261718, 0.284016460180282592, 120, 255, 1, "", 51943, NULL),
(2131, 185434, 530, 0, 0, 1, 1, 2020.560302734375, 6865.56982421875, 174.3394012451171875, 4.415683269500732421, 0, 0, -0.80385684967041015, 0.594822824001312255, 120, 255, 1, "", 51943, NULL),
(2132, 185434, 530, 0, 0, 1, 1, 210.0439453125, 4327.62841796875, 119.2413330078125, 0.523597896099090576, 0, 0, 0.258818626403808593, 0.965925931930541992, 120, 255, 1, "", 51943, NULL),
(2133, 185434, 530, 0, 0, 1, 1, 2115.908447265625, 6759.33447265625, 165.8119659423828125, 4.520402908325195312, 0, 0, -0.77162456512451171, 0.636078238487243652, 120, 255, 1, "", 51943, NULL),
(2134, 185434, 530, 0, 0, 1, 1, 224.58209228515625, 4347.96923828125, 119.3044662475585937, 5.148722648620605468, 0, 0, -0.53729915618896484, 0.843391716480255126, 120, 255, 1, "", 51943, NULL),
(2135, 185434, 530, 0, 0, 1, 1, 2378.06591796875, 5940.251953125, 151.9701690673828125, 1.221729278564453125, 0, 0, 0.573575973510742187, 0.819152355194091796, 120, 255, 1, "", 45942, NULL),
(2136, 185434, 530, 0, 0, 1, 1, 2436.565673828125, 5997.64404296875, 153.714508056640625, 1.658061861991882324, 0, 0, 0.737277030944824218, 0.67559051513671875, 120, 255, 1, "", 45942, NULL),
(2137, 185434, 530, 0, 0, 1, 1, 93.29047393798828125, 4294.8173828125, 101.8708267211914062, 0.017452461645007133, 0, 0, 0.008726119995117187, 0.999961912631988525, 120, 255, 1, "", 51943, NULL),
(2138, 185434, 568, 0, 0, 1, 1, -146.864044189453125, 1332.2203369140625, 48.17387771606445312, 5.323255538940429687, 0, 0, -0.46174812316894531, 0.887011110782623291, 7200, 255, 1, "", 49345, NULL),
(2139, 185434, 568, 0, 0, 1, 1, -23.8944225311279296, 1332.4141845703125, 48.17390823364257812, 0.645771682262420654, 0, 0, 0.317304611206054687, 0.948323667049407958, 7200, 255, 1, "", 49345, NULL),
(2140, 185434, 568, 0, 0, 1, 1, -73.5284271240234375, 1139.153076171875, 5.194067001342773437, 4.014260292053222656, 0, 0, -0.90630722045898437, 0.422619491815567016, 7200, 255, 1, "", 49345, NULL),
(2141, 185434, 568, 0, 0, 1, 1, -75.1178359985351562, 1137.77197265625, 5.211043834686279296, 1.169368624687194824, 0, 0, 0.551936149597167968, 0.833886384963989257, 7200, 255, 1, "", 49345, NULL),
(2142, 185434, 568, 0, 0, 1, 1, 293.915374755859375, 1458.404296875, 81.50594329833984375, 5.026549339294433593, 0, 0, -0.5877847671508789, 0.809017360210418701, 7200, 255, 1, "", 49345, NULL),
(2143, 185434, 568, 0, 0, 1, 1, 343.360565185546875, 1311.3314208984375, 81.5876007080078125, 0.017452461645007133, 0, 0, 0.008726119995117187, 0.999961912631988525, 7200, 255, 1, "", 49345, NULL),
(2144, 185434, 568, 0, 0, 1, 1, 392.563140869140625, 1155.3741455078125, 6.343638896942138671, 4.468043327331542968, 0, 0, -0.7880105972290039, 0.615661680698394775, 7200, 255, 1, "", 49345, NULL),
(2145, 185434, 571, 0, 0, 1, 1, 4905.34228515625, -4740.84375, 27.37196159362792968, 4.817109584808349609, 0, 0, -0.66913032531738281, 0.74314504861831665, 120, 255, 1, "", 47720, NULL),
(2146, 185434, 571, 0, 0, 1, 1, 5527.5595703125, -2646.9267578125, 303.953948974609375, 2.600535154342651367, 0, 0, 0.963629722595214843, 0.26724100112915039, 120, 255, 1, "", 46158, NULL);

DELETE FROM `game_event_gameobject` WHERE (`eventEntry` = 12)
AND (`guid` BETWEEN 2120 AND 2146);
INSERT INTO `game_event_gameobject` (`eventEntry`,`guid`) VALUES
(12, 2120),
(12, 2121),
(12, 2122),
(12, 2123),
(12, 2124),
(12, 2125),
(12, 2126),
(12, 2127),
(12, 2128),
(12, 2129),
(12, 2130),
(12, 2131),
(12, 2132),
(12, 2133),
(12, 2134),
(12, 2135),
(12, 2136),
(12, 2137),
-- do not link static spawns to game event
-- (12, 2138),
-- (12, 2139),
-- (12, 2140),
-- (12, 2141),
-- (12, 2142),
-- (12, 2143),
-- (12, 2144),
-- (12, 2145),
(12, 2146);
