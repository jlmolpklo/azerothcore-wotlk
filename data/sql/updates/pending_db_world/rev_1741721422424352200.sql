-- Update gameobject 'Orb of the Blue Flight' with sniffed values
-- new spawns
DELETE FROM `gameobject` WHERE (`id` IN (188415)) AND (`guid` IN (257, 258, 259, 260));
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES
(257, 188415, 585, 0, 0, 3, 1, -19.2306861877441406, -551.10784912109375, -63.7666511535644531, 4.607671737670898437, 0, 0, -0.74314403533935546, 0.669131457805633544, 7200, 255, 1, "", 50664, NULL),
(258, 188415, 585, 0, 0, 3, 1, -32.2288398742675781, -646.16180419921875, -63.6902046203613281, 1.48352813720703125, 0, 0, 0.675589561462402343, 0.737277925014495849, 7200, 255, 1, "", 50664, NULL),
(259, 188415, 585, 0, 0, 3, 1, -73.1546249389648437, -601.76910400390625, -63.7666511535644531, 0.069811686873435974, 0, 0, 0.034898757934570312, 0.999390840530395507, 7200, 255, 1, "", 50664, NULL),
(260, 188415, 585, 0, 0, 3, 1, 20.02517318725585937, -593.69659423828125, -63.6475372314453125, 3.211419343948364257, 0, 0, -0.9993906021118164, 0.034906134009361267, 7200, 255, 1, "", 50664, NULL);
