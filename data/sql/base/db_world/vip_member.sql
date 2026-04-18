-- 会员信息表
DROP TABLE IF EXISTS `vip_member`;
CREATE TABLE `vip_member` (
  `account_id` int(10) unsigned NOT NULL COMMENT '账号 ID',
  `tier` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '会员等级 (0-3: VIP0-VIP3)',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间 (Unix 时间戳，0 表示永久)',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间 (Unix 时间戳)',
  `update_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间 (Unix 时间戳)',
  PRIMARY KEY (`account_id`),
  KEY `idx_expire_time` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员信息表';

-- 插入示例数据 (可选)
-- INSERT INTO `vip_member` (`account_id`, `tier`, `expire_time`, `create_time`, `update_time`) VALUES
-- (1, 3, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),  -- 账号 1 为至尊会员
-- (2, 2, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());  -- 账号 2 为超级会员
