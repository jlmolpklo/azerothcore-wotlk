-- 会员升级物品配置表
DROP TABLE IF EXISTS `vip_upgrade_items`;
CREATE TABLE `vip_upgrade_items` (
  `target_tier` tinyint(3) unsigned NOT NULL COMMENT '目标会员等级 (1-3)',
  `item_id` int(10) unsigned NOT NULL COMMENT '所需物品 ID',
  `quantity` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '所需物品数量',
  PRIMARY KEY (`target_tier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员升级物品配置表';

-- 插入默认配置 (示例，可根据需要修改)
-- VIP1 升级：需要 10 个 [金币] (物品 ID: 1)
INSERT INTO `vip_upgrade_items` (`target_tier`, `item_id`, `quantity`) VALUES (1, 1, 10);
-- VIP2 升级：需要 50 个 [金币] (物品 ID: 1)
INSERT INTO `vip_upgrade_items` (`target_tier`, `item_id`, `quantity`) VALUES (2, 1, 50);
-- VIP3 升级：需要 200 个 [金币] (物品 ID: 1)
INSERT INTO `vip_upgrade_items` (`target_tier`, `item_id`, `quantity`) VALUES (3, 1, 200);

-- 会员升级日志表
DROP TABLE IF EXISTS `vip_upgrade_log`;
CREATE TABLE `vip_upgrade_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL COMMENT '账号 ID',
  `old_tier` tinyint(3) unsigned NOT NULL COMMENT '原会员等级',
  `new_tier` tinyint(3) unsigned NOT NULL COMMENT '新会员等级',
  `item_id` int(10) unsigned NOT NULL COMMENT '消耗物品 ID',
  `quantity` int(10) unsigned NOT NULL COMMENT '消耗物品数量',
  `upgrade_time` bigint(20) unsigned NOT NULL COMMENT '升级时间 (Unix 时间戳)',
  PRIMARY KEY (`id`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_upgrade_time` (`upgrade_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员升级日志表';
