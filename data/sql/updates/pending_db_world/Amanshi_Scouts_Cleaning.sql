
-- Remove unofficial Npcs
DELETE FROM `creature` WHERE (`id1` = 23586) AND (`guid` IN (89274, 89287, 89288, 89293, 89303, 89308, 89312, 89313, 89329));
DELETE FROM `creature_addon` WHERE (`guid` IN (89274, 89287, 89288, 89293, 89303, 89308, 89312, 89313, 89329));
DELETE FROM `linked_respawn` WHERE (`guid` IN (89274, 89287, 89288, 89293, 89303, 89308, 89312, 89313, 89329));

-- Update Positions, Wander Distance, Movement Type and pose for 89280 (sit).
UPDATE `creature` SET `position_x` = -138.5746, `position_y` = 1164.1141, `position_z` = 3.0369, `orientation` = 1.3761, `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 89284 AND `id1` = 23586;
UPDATE `creature` SET `position_x` = -219.4417, `position_y` = 1379.474, `position_z` = 0.0258, `orientation` = 0.9638, `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 89280 AND `id1` = 23586;
UPDATE `creature_addon` SET `bytes1` = 1 WHERE `guid` = 89280;

-- Add Waypoints for two Scout Patrols
DELETE FROM `waypoint_data` WHERE `id` IN (8927800);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(8927800, 1, -197.76129, 1336.6729, 0.25522953, NULL, 0, 0, 0, 100, 0),
(8927800, 2, -195.18869, 1319.1761, 1.2445819, NULL, 0, 0, 0, 100, 0),
(8927800, 3, -194.77528, 1288.6068, 1.3654809, NULL, 0, 0, 0, 100, 0),
(8927800, 4, -199.99263, 1259.6373, 1.1474091, NULL, 0, 0, 0, 100, 0),
(8927800, 5, -191.13173, 1241.6224, 0.58376735, NULL, 0, 0, 0, 100, 0),
(8927800, 6, -148.23947, 1214.8658, 0.9682467, NULL, 0, 0, 0, 100, 0),
(8927800, 7, -141.05751, 1192.8319, 0.071034685, NULL, 0, 0, 0, 100, 0),
(8927800, 8, -141.5868, 1124.066, 0.026241792, NULL, 0, 0, 0, 100, 0),
(8927800, 9, -141.05751, 1192.8319, 0.071034685, NULL, 0, 0, 0, 100, 0),
(8927800, 10, -148.23947, 1214.8658, 0.9682467, NULL, 0, 0, 0, 100, 0),
(8927800, 11, -191.13173, 1241.6224, 0.58376735, NULL, 0, 0, 0, 100, 0),
(8927800, 12, -199.99263, 1259.6373, 1.1474091, NULL, 0, 0, 0, 100, 0),
(8927800, 13, -194.77528, 1288.6068, 1.3654809, NULL, 0, 0, 0, 100, 0),
(8927800, 14, -195.18869, 1319.1761, 1.2445819, NULL, 0, 0, 0, 100, 0),
(8927800, 15, -197.76129, 1336.6729, 0.25522953, NULL, 0, 0, 0, 100, 0),
(8927800, 16, -208.06369, 1379.98, -0.11678864, NULL, 0, 0, 0, 100, 0);

DELETE FROM `waypoint_data` WHERE `id` IN (8928900);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(8928900, 1, -206.0561, 1178.5385, -0.56990623, NULL, 0, 0, 0, 100, 0),
(8928900, 2, -201.31548, 1195.815, -0.02255094, NULL, 0, 0, 0, 100, 0),
(8928900, 3, -177.1632, 1235.7587, 0.89132327, NULL, 0, 0, 0, 100, 0),
(8928900, 4, -142.62305, 1206.9307, 1.0594966, NULL, 0, 0, 0, 100, 0),
(8928900, 5, -136.43565, 1188.6288, 0.00022190076, NULL, 0, 0, 0, 100, 0),
(8928900, 6, -130.66829, 1163.2294, 0.48558202, NULL, 0, 0, 0, 100, 0),
(8928900, 7, -138.89366, 1149.0428, 0.025163397, NULL, 0, 0, 0, 100, 0),
(8928900, 8, -134.64996, 1118.2001, 0.48225334, NULL, 0, 0, 0, 100, 0),
(8928900, 9, -152.4376, 1100.2438, 0.32423848, NULL, 0, 0, 0, 100, 0),
(8928900, 10, -174.22884, 1083.7368, 0.10808088, NULL, 0, 0, 0, 100, 0),
(8928900, 11, -187.53537, 1094.5493, 1.7097571, NULL, 0, 0, 0, 100, 0),
(8928900, 12, -203.66646, 1117.7672, -0.08857499, NULL, 0, 0, 0, 100, 0),
(8928900, 13, -215.36795, 1135.6195, -1.8750997, NULL, 0, 0, 0, 100, 0),
(8928900, 14, -215.95822, 1155.653, -1.9799352, NULL, 0, 0, 0, 100, 0);

-- Load WPs to the Patrols
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 2 WHERE `guid` IN (89278, 89289) AND `id1` = 23586;
UPDATE `creature_addon` SET `path_id` = 8927800 WHERE (`guid` IN (89278));
UPDATE `creature_addon` SET `path_id` = 8928900 WHERE (`guid` IN (89289));
