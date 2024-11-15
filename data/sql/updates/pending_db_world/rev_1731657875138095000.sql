-- Update gameobject 'The Dark Portal and the Fall of Stormwind' with sniffed values
-- updated spawns
DELETE FROM `gameobject` WHERE (`id` IN (175745))
AND (`guid` IN (18578, 29686, 42442, 42618, 43218));
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES
(18578, 175745, 0, 0, 0, 1, 1, -8416.1337890625, 280.4483642578125, 122.0174713134765625, 3.839725255966186523, 0, 0, -0.93969249725341796, 0.34202045202255249, 120, 255, 1, "", 45854, NULL),
(29686, 175745, 0, 0, 0, 1, 1, -10462.3818359375, -3316.7744140625, 22.00571823120117187, 4.59021615982055664, 0, 0, -0.74895572662353515, 0.662620067596435546, 120, 255, 1, "", 45613, NULL),
(42442, 175745, 0, 0, 0, 1, 1, -10974.99609375, -3479.037841796875, 103.9837722778320312, 4.293513298034667968, 0, 0, -0.8386697769165039, 0.544640243053436279, 120, 255, 1, "", 48632, NULL),
(42618, 175745, 0, 0, 0, 1, 1, -9238.68359375, -2152.519287109375, 72.14923858642578125, 0.069811686873435974, 0, 0, 0.034898757934570312, 0.999390840530395507, 120, 255, 1, "", 45435, NULL),
(43218, 175745, 289, 0, 0, 1, 1, 231.8676300048828125, -4.19411897659301757, 117.05206298828125, 2.024578809738159179, 0, 0, 0.848047256469726562, 0.529920578002929687, 7200, 255, 1, "", 49345, NULL);
