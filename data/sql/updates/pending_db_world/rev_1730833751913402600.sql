-- Update gameobject 'Gypsy Wagon' with sniffed values
-- updated spawns
DELETE FROM `gameobject` WHERE (`id` IN (178666))
AND (`guid` IN (42037, 42038));
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES
(42037, 178666, 1, 0, 0, 1, 1, 1653.41845703125, -4431.62841796875, 17.25320243835449218, 0.349065244197845458, 0, 0, 0.173647880554199218, 0.984807789325714111, 120, 255, 1, "", 47168, NULL),
(42038, 178666, 0, 0, 0, 1, 1, -4924.6943359375, -983.04644775390625, 501.4610595703125, 5.969027042388916015, 0, 0, -0.1564340591430664, 0.987688362598419189, 120, 255, 1, "", 52237, NULL);

DELETE FROM `game_event_gameobject` WHERE (`eventEntry` = 2)
AND (`guid` IN (42037, 42038));
INSERT INTO `game_event_gameobject` (`eventEntry`,`guid`) VALUES
(2, 42037),
(2, 42038);

-- Update gameobject 'Rope Line / Rope Line Pole' with sniffed values
-- updated spawns
DELETE FROM `gameobject` WHERE (`id` IN (178764, 178765))
AND (`guid` IN (41011, 41014, 41018, 41021, 41029, 41031, 41039, 41042, 41044, 41046, 41051, 41053, 41057, 41061, 41066, 41072, 41541, 41547, 50675, 50676, 50677, 50678, 50679, 50680, 50681, 50682, 50683, 50684, 50685, 50686, 50687, 50688, 50689, 50690, 50691, 50692));
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES
(41011, 178764, 0, 0, 0, 1, 1, -4918.9052734375, -965.48199462890625, 501.48486328125, 5.078907966613769531, 0, 0, -0.56640625, 0.824126183986663818, 120, 255, 1, "", 52237, NULL),
(41014, 178764, 0, 0, 0, 1, 1, -4913.3388671875, -972.4051513671875, 501.459259033203125, 0.366517573595046997, 0, 0, 0.182234764099121093, 0.98325502872467041, 120, 255, 1, "", 52237, NULL),
(41018, 178764, 0, 0, 0, 1, 1, -4911.2529296875, -977.67425537109375, 501.443695068359375, 0.383971005678176879, 0, 0, 0.190808296203613281, 0.981627285480499267, 120, 255, 1, "", 52237, NULL),
(41021, 178764, 0, 0, 0, 1, 1, -4918.62890625, -974.24786376953125, 501.465545654296875, 1.919861555099487304, 0, 0, 0.819151878356933593, 0.573576688766479492, 120, 255, 1, "", 52237, NULL),
(41029, 178764, 0, 0, 0, 1, 1, -4912.283203125, -975.0438232421875, 501.451446533203125, 0.383971005678176879, 0, 0, 0.190808296203613281, 0.981627285480499267, 120, 255, 1, "", 52237, NULL),
(41031, 178764, 0, 0, 0, 1, 1, -4915.3115234375, -967.1434326171875, 501.47454833984375, 3.508116960525512695, 0, 0, -0.98325443267822265, 0.182238012552261352, 120, 255, 1, "", 52237, NULL),
(41039, 178764, 0, 0, 0, 1, 1, -4921.30126953125, -975.2080078125, 501.469390869140625, 0.314158439636230468, 0, 0, 0.156434059143066406, 0.987688362598419189, 120, 255, 1, "", 52237, NULL),
(41042, 178764, 0, 0, 0, 1, 1, -4914.31689453125, -969.7490234375, 501.466949462890625, 1.954769015312194824, 0, 0, 0.829037666320800781, 0.559192776679992675, 120, 255, 1, "", 52237, NULL),
(41044, 178764, 0, 0, 0, 1, 1, -4923.08837890625, -969.91839599609375, 501.484649658203125, 4.991643905639648437, 0, 0, -0.60181427001953125, 0.798636078834533691, 120, 255, 1, "", 52237, NULL),
(41046, 178764, 0, 0, 0, 1, 1, -4916.884765625, -970.794189453125, 501.4693603515625, 1.902408957481384277, 0, 0, 0.814115524291992187, 0.580702960491180419, 120, 255, 1, "", 52237, NULL),
(41051, 178764, 0, 0, 0, 1, 1, -4924.03662109375, -967.21954345703125, 501.492523193359375, 3.490667104721069335, 0, 0, -0.98480701446533203, 0.173652306199073791, 120, 255, 1, "", 52237, NULL),
(41053, 178764, 0, 0, 0, 1, 1, -4920.4345703125, -969.16339111328125, 501.480377197265625, 5.078907966613769531, 0, 0, -0.56640625, 0.824126183986663818, 120, 255, 1, "", 52237, NULL),
(41057, 178764, 0, 0, 0, 1, 1, -4921.57958984375, -966.4464111328125, 501.48870849609375, 5.061456203460693359, 0, 0, -0.57357597351074218, 0.819152355194091796, 120, 255, 1, "", 52237, NULL),
(41061, 178764, 0, 0, 0, 1, 1, -4916.27099609375, -964.49664306640625, 501.482208251953125, 3.490667104721069335, 0, 0, -0.98480701446533203, 0.173652306199073791, 120, 255, 1, "", 52237, NULL),
(41066, 178764, 0, 0, 0, 1, 1, -4922.1279296875, -972.53399658203125, 501.476959228515625, 0.366517573595046997, 0, 0, 0.182234764099121093, 0.98325502872467041, 120, 255, 1, "", 52237, NULL),
(41072, 178764, 0, 0, 0, 1, 1, -4916.01123046875, -973.2606201171875, 501.462249755859375, 1.937312245368957519, 0, 0, 0.824125289916992187, 0.566407561302185058, 120, 255, 1, "", 52237, NULL),
(41541, 178765, 0, 0, 0, 1, 1, -4919.544921875, -971.7509765625, 501.472869873046875, 4.48549652099609375, 0, 0, -0.7826080322265625, 0.622514784336090087, 120, 255, 1, "", 52237, NULL),
(41547, 178765, 0, 0, 0, 1, 1, -4917.80712890625, -968.16656494140625, 501.476898193359375, 4.886923789978027343, 0, 0, -0.64278697967529296, 0.766044974327087402, 120, 255, 1, "", 52237, NULL),
-- static spawns
(50675, 178764, 530, 0, 0, 1, 1, -2271.068603515625, 5565.81103515625, 67.00568389892578125, 2.792518377304077148, 0, 0, 0.984807014465332031, 0.173652306199073791, 120, 255, 1, "", 45704, NULL),
(50676, 178764, 530, 0, 0, 1, 1, -2267.534912109375, 5573.65673828125, 67.00290679931640625, 2.740161895751953125, 0, 0, 0.979924201965332031, 0.199370384216308593, 120, 255, 1, "", 45704, NULL),
(50677, 178765, 530, 0, 0, 1, 1, -2269.834228515625, 5568.56982421875, 67.004913330078125, 0, 0, 0, 0, 1, 120, 255, 1, "", 45704, NULL),
(50678, 178764, 530, 0, 0, 1, 1, -2272.033203125, 5563.20556640625, 67.00420379638671875, 2.827429771423339843, 0, 0, 0.987688064575195312, 0.156436234712600708, 120, 255, 1, "", 45704, NULL),
(50679, 178764, 530, 0, 0, 1, 1, -2264.985107421875, 5572.4501953125, 67.0045166015625, 1.169368624687194824, 0, 0, 0.551936149597167968, 0.833886384963989257, 120, 255, 1, "", 45704, NULL),
(50680, 178764, 530, 0, 0, 1, 1, -2268.71142578125, 5571.01953125, 67.00385284423828125, 2.740161895751953125, 0, 0, 0.979924201965332031, 0.199370384216308593, 120, 255, 1, "", 45704, NULL),
(50681, 178764, 530, 0, 0, 1, 1, -2272.909423828125, 5560.52978515625, 67.00284576416015625, 4.310965538024902343, 0, 0, -0.83388519287109375, 0.55193793773651123, 120, 255, 1, "", 45704, NULL),
(50682, 178764, 530, 0, 0, 1, 1, -2270.34814453125, 5559.4482421875, 67.005462646484375, 4.310965538024902343, 0, 0, -0.83388519287109375, 0.55193793773651123, 120, 255, 1, "", 45942, NULL),
(50683, 178764, 530, 0, 0, 1, 1, -2262.407470703125, 5571.27783203125, 67.0049285888671875, 1.169368624687194824, 0, 0, 0.551936149597167968, 0.833886384963989257, 120, 255, 1, "", 45704, NULL),
(50684, 178765, 530, 0, 0, 1, 1, -2260.2587890625, 5561.38916015625, 67.01305389404296875, 0, 0, 0, 0, 1, 120, 255, 1, "", 45942, NULL),
(50685, 178764, 530, 0, 0, 1, 1, -2265.07421875, 5557.19189453125, 67.00565338134765625, 4.310965538024902343, 0, 0, -0.83388519287109375, 0.55193793773651123, 120, 255, 1, "", 45942, NULL),
(50686, 178764, 530, 0, 0, 1, 1, -2257.212158203125, 5569.00244140625, 67.00687408447265625, 1.169368624687194824, 0, 0, 0.551936149597167968, 0.833886384963989257, 120, 255, 1, "", 45942, NULL),
(50687, 178764, 530, 0, 0, 1, 1, -2259.40283203125, 5563.6630859375, 67.01308441162109375, 5.89921426773071289, 0, 0, -0.19080829620361328, 0.981627285480499267, 120, 255, 1, "", 45942, NULL),
(50688, 178764, 530, 0, 0, 1, 1, -2259.855712890625, 5570.13671875, 67.0053253173828125, 1.169368624687194824, 0, 0, 0.551936149597167968, 0.833886384963989257, 120, 255, 1, "", 45942, NULL),
(50689, 178764, 530, 0, 0, 1, 1, -2261.313720703125, 5558.73876953125, 67.00978851318359375, 5.89921426773071289, 0, 0, -0.19080829620361328, 0.981627285480499267, 120, 255, 1, "", 45942, NULL),
(50690, 178764, 530, 0, 0, 1, 1, -2267.728271484375, 5558.32666015625, 67.00565338134765625, 4.310965538024902343, 0, 0, -0.83388519287109375, 0.55193793773651123, 120, 255, 1, "", 45942, NULL),
(50691, 178764, 530, 0, 0, 1, 1, -2262.440673828125, 5556.1025390625, 67.0064697265625, 5.89921426773071289, 0, 0, -0.19080829620361328, 0.981627285480499267, 120, 255, 1, "", 45942, NULL),
(50692, 178764, 530, 0, 0, 1, 1, -2258.307861328125, 5566.337890625, 67.00997161865234375, 5.89921426773071289, 0, 0, -0.19080829620361328, 0.981627285480499267, 120, 255, 1, "", 45942, NULL);

DELETE FROM `game_event_gameobject` WHERE (`eventEntry` = 2)
AND (`guid` IN (41011, 41014, 41018, 41021, 41029, 41031, 41039, 41042, 41044, 41046, 41051, 41053, 41057, 41061, 41066, 41072, 41541, 41547));
INSERT INTO `game_event_gameobject` (`eventEntry`,`guid`) VALUES
(2, 41011),
(2, 41014),
(2, 41018),
(2, 41021),
(2, 41029),
(2, 41031),
(2, 41039),
(2, 41042),
(2, 41044),
(2, 41046),
(2, 41051),
(2, 41053),
(2, 41057),
(2, 41061),
(2, 41066),
(2, 41072),
(2, 41541),
(2, 41547);
