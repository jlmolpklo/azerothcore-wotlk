--
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` &~ 8, `mechanic_immune_mask` = `mechanic_immune_mask`|131072 WHERE `entry` = 22855;
