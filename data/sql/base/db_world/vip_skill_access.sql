-- 技能会员权限表
DROP TABLE IF EXISTS `vip_skill_access`;
CREATE TABLE `vip_skill_access` (
  `spell_id` int(10) unsigned NOT NULL COMMENT '技能 ID',
  `min_tier` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '最低会员等级要求 (0-3)',
  PRIMARY KEY (`spell_id`),
  KEY `idx_min_tier` (`min_tier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='技能会员权限表';

-- 插入示例数据 (可选)
-- 以下是一些示例技能权限配置，根据实际需要修改
-- INSERT INTO `vip_skill_access` (`spell_id`, `min_tier`) VALUES
-- (1, 1),  -- 技能 ID 1 需要 VIP1 及以上
-- (2, 2),  -- 技能 ID 2 需要 VIP2 及以上
-- (3, 3);  -- 技能 ID 3 需要 VIP3 (至尊会员)
