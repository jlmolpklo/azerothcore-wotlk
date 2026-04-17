# AzerothCore 数据库结构概述

本文档介绍 AzerothCore 服务器的三个核心数据库的结构和用途。

## 目录

- [数据库概述](#数据库概述)
- [acore_auth 数据库](#acore_auth-数据库)
- [acore_characters 数据库](#acore_characters-数据库)
- [acore_world 数据库](#acore_world-数据库)
- [更新文件规律](#更新文件规律)

---

## 数据库概述

AzerothCore 使用 MySQL 数据库存储服务器运行所需的所有数据。数据库分为三个部分：

| 数据库名 | 用途 | 主要数据类型 |
|---------|------|-------------|
| acore_auth | 认证数据库 | 账户信息、登录验证、服务器列表 |
| acore_characters | 角色数据库 | 玩家角色、物品、公会、社会关系 |
| acore_world | 世界数据库 | 游戏内容、NPC、任务、地图数据 |

### 三个数据库的区别

1. **acore_auth (认证数据库)**
   - 负责处理用户身份验证
   - 存储账户凭证（用户名、密码验证信息）
   - 管理服务器集群信息（realmlist）
   - 记录账户权限和GM级别
   - 包含IP封禁和日志记录

2. **acore_characters (角色数据库)**
   - 存储所有玩家角色的详细数据
   - 每个角色对应唯一的GUID（全局唯一标识符）
   - 包含角色的装备、背包、任务进度等信息
   - 管理公会、社交关系、邮件系统
   - 记录角色死亡、复活、重生点等状态数据

3. **acore_world (世界数据库)**
   - 存储游戏世界的静态内容和配置数据
   - 定义所有NPC、生物、怪物的模板数据
   - 包含任务定义、触发条件、奖励设置
   - 管理游戏对象（门、宝箱、传送门等）
   - 存储技能、法术、buff配置
   - 包含所有地图的区域信息和刷新规则

---

## acore_auth 数据库

**位置**: `data/sql/base/db_auth/`

**作用**: 负责用户身份验证、账户管理和服务器列表

### 表说明

| 文件名 | 表名 | 用途说明 |
|-------|------|---------|
| account.sql | account | 核心账户表，存储用户名、Salt/Verifier 认证信息、会话密钥、TOTP秘钥、注册邮箱、最后登录IP等 |
| account_access.sql | account_access | 账户权限表，定义GM级别和可访问的服务器范围 |
| account_banned.sql | account_banned | 账户封禁记录 |
| account_muted.sql | account_muted | 账户禁言记录 |
| ip_banned.sql | ip_banned | IP封禁表，记录被封禁的IP地址及封禁原因 |
| logs.sql | logs | 日志表，记录服务器日志 |
| logs_ip_actions.sql | logs_ip_actions | IP操作日志 |
| motd.sql | motd | 服务器公告信息 |
| motd_localized.sql | motd_localized | 本地化服务器公告 |
| realmlist.sql | realmlist | 服务器列表，定义所有可连接的服务器信息（名称、地址、端口、人口上限等） |
| realmcharacters.sql | realmcharacters | 服务器角色数量统计 |
| secret_digest.sql | secret_digest | 账户安全摘要信息 |
| uptime.sql | uptime | 服务器运行时间记录 |
| autobroadcast.sql | autobroadcast | 自动广播消息 |
| autobroadcast_locale.sql | autobroadcast_locale | 本地化自动广播 |
| build_info.sql | build_info | 客户端版本信息 |

### 核心表结构

**account 表主要字段**:
- `id`: 账户唯一标识（主键）
- `username`: 用户名
- `salt` / `verifier`: SRP6 认证所需的盐值和验证器
- `session_key`: 会话密钥
- `totp_secret`: 二次验证码密钥
- `email`: 注册邮箱
- `reg_mail`: 注册邮箱（用于转移）
- `last_ip`: 最后登录IP
- `failed_logins`: 失败登录次数
- `locked` / `lock_country`: 账户锁定状态
- `expansion`: 客户端资料片等级
- `mutetime` / `mutereason` / `muteby`: 禁言信息

**realmlist 表主要字段**:
- `id`: 服务器ID
- `name`: 服务器名称
- `address`: 外部地址
- `localAddress`: 本地地址
- `port`: 端口
- `icon`: 服务器类型图标
- `flag`: 服务器标志
- `timezone`: 时区
- `allowedSecurityLevel`: 允许的最低安全级别
- `population`: 人口
- `gamebuild`: 支持的客户端版本

---

## acore_characters 数据库

**位置**: `data/sql/base/db_characters/`

**作用**: 存储所有玩家角色的运行时数据

### 主要角色表

| 文件名 | 表名 | 用途说明 |
|-------|------|---------|
| characters.sql | characters | 核心角色表，存储角色基本信息（等级、金钱、位置、属性、外观、工会信息等） |
| character_action.sql | character_action | 角色动作条配置 |
| character_aura.sql | character_aura | 角色光环效果 |
| character_spell.sql | character_spell | 角色已学习技能 |
| character_talent.sql | character_talent | 角色天赋点配置 |
| character_glyphs.sql | character_glyphs | 角色雕文配置 |
| character_skills.sql | character_skills | 角色专业技能 |
| character_stats.sql | character_stats | 角色属性数值 |
| character_queststatus.sql | character_queststatus | 角色任务状态 |
| character_queststatus_daily.sql | character_queststatus_daily | 每日任务状态 |
| character_queststatus_weekly.sql | character_queststatus_weekly | 每周任务状态 |
| character_queststatus_seasonal.sql | character_queststatus_seasonal | 季节任务状态 |
| character_queststatus_rewarded.sql | character_queststatus_rewarded | 已奖励任务记录 |
| character_achievement.sql | character_achievement | 角色成就 |
| character_achievement_progress.sql | character_achievement_progress | 成就进度 |
| character_achievement_offline_updates.sql | character_achievement_offline_updates | 离线成就更新 |
| character_reputation.sql | character_reputation | 角色阵营声望 |
| character_inventory.sql | character_inventory | 角色背包快照 |
| item_instance.sql | item_instance | 物品实例，存储所有背包物品的详细信息 |
| item_refund_instance.sql | item_refund_instance | 物品退款记录 |
| item_soulbound_trade_data.sql | item_soulbound_trade_data | 灵魂绑定物品交易数据 |
| item_loot_storage.sql | item_loot_storage | 物品掉落存储 |

### 公会系统表

| 文件名 | 表名 | 用途说明 |
|-------|------|---------|
| guild.sql | guild | 公会信息（名称、会长、纹章、银行资金等） |
| guild_member.sql | guild_member | 公会成员列表 |
| guild_rank.sql | guild_rank | 公会 rank 等级 |
| guild_bank_tab.sql | guild_bank_tab | 公会银行标签页 |
| guild_bank_item.sql | guild_bank_item | 公会银行物品 |
| guild_bank_right.sql | guild_bank_right | 公会银行权限 |
| guild_bank_eventlog.sql | guild_bank_eventlog | 公会银行事件日志 |
| guild_eventlog.sql | guild_eventlog | 公会事件日志 |
| guild_member_withdraw.sql | guild_member_withdraw | 成员取出记录 |

### 社交与组队表

| 文件名 | 表名 | 用途说明 |
|-------|------|---------|
| character_social.sql | character_social | 好友/忽略列表 |
| group_member.sql | group_member | 队伍成员 |
| channels.sql | channels | 聊天频道 |
| channels_bans.sql | channels_bans | 频道封禁 |
| channels_rights.sql | channels_rights | 频道权限 |

### 邮件系统表

| 文件名 | 表名 | 用途说明 |
|-------|------|---------|
| mail.sql | mail | 邮件头信息 |
| mail_items.sql | mail_items | 邮件物品附件 |
| mail_server_template.sql | mail_server_template | 邮件服务器模板 |
| mail_server_template_items.sql | mail_server_template_items | 模板物品 |
| mail_server_template_conditions.sql | mail_server_template_conditions | 模板条件 |
| mail_server_character.sql | mail_server_character | 邮件角色关联 |

### 宠物与坐骑表

| 文件名 | 表名 | 用途说明 |
|-------|------|---------|
| character_pet.sql | character_pet | 宠物信息 |
| pet_spell.sql | pet_spell | 宠物技能 |
| pet_aura.sql | pet_aura | 宠物光环 |
| pet_spell_cooldown.sql | pet_spell_cooldown | 宠物技能冷却 |
| character_pet_declinedname.sql | character_pet_declinedname | 宠物拒绝的名字 |

### 实例与副本表

| 文件名 | 表名 | 用途说明 |
|-------|------|---------|
| instance.sql | instance | 实例信息 |
| character_instance.sql | character_instance | 角色进入的实例 |
| instance_reset.sql | instance_reset | 实例重置时间 |
| instance_saved_go_state_data.sql | instance_saved_go_state_data | 游戏对象状态 |
| dungeon_access_template.sql | dungeon_access_template | 副本访问模板 |
| dungeon_access_requirements.sql | dungeon_access_requirements | 副本进入条件 |

### 竞技场与战场表

| 文件名 | 表名 | 用途说明 |
|-------|------|---------|
| arena_team.sql | arena_team | 竞技场队伍 |
| arena_team_member.sql | arena_team_member | 竞技场成员 |
| character_arena_stats.sql | character_arena_stats | 角色竞技场统计 |
| pvpstats_battlegrounds.sql | pvpstats_battlegrounds | 战场统计 |
| pvpstats_players.sql | pvpstats_players | 战场玩家统计 |
| log_arena_fights.sql | log_arena_fights | 竞技场战斗日志 |
| log_arena_memberstats.sql | log_arena_memberstats | 竞技场成员统计 |
| lag_reports.sql | lag_reports | 卡顿报告 |

### 其他角色相关表

| 文件名 | 表名 | 用途说明 |
|-------|------|---------|
| character_homebind.sql | character_homebind | 主页绑定点 |
| character_declinedname.sql | character_declinedname | 角色拒绝的名字 |
| character_gifts.sql | character_gifts | 角色礼物 |
| character_settings.sql | character_settings | 角色设置 |
| character_account_data.sql | character_account_data | 账户角色数据 |
| account_data.sql | account_data | 账户数据 |
| account_tutorial.sql | account_tutorial | 教程进度 |
| account_instance_times.sql | account_instance_times | 账户副本时间 |
| character_equipmentsets.sql | character_equipmentsets | 装备方案 |
| character_spell_cooldown.sql | character_spell_cooldown | 技能冷却 |
| corpse.sql | corpse | 尸体信息 |
| creature_respawn.sql | creature_respawn | 生物重生时间 |
| gameobject_respawn.sql | gameobject_respawn | 游戏对象重生时间 |
| character_banned.sql | character_banned | 角色封禁 |
| banned_addons.sql | banned_addons | 封禁插件 |
| addons.sql | addons | 已用插件 |
| gm_ticket.sql | gm_ticket | GM工单 |
| gm_survey.sql | gm_survey | GM调查 |
| gm_subsurvey.sql | gm_subsurvey | GM子调查 |
| bugreport.sql | bugreport | 漏洞报告 |
| calendar_events.sql | calendar_events | 日历事件 |
| calendar_invites.sql | calendar_invites | 日历邀请 |
| game_event_condition_save.sql | game_event_condition_save | 游戏事件条件保存 |
| game_event_save.sql | game_event_save | 游戏事件保存 |
| auctionhouse.sql | auctionhouse | 拍卖行 |
| pet_aura.sql | pet_aura | 宠物光环 |
| lfg_data.sql | lfg_data | 寻求组队数据 |
| log_encounter.sql | log_encounter | 遭遇战日志 |
| log_money.sql | log_money | 金钱变动日志 |
| pool_quest_save.sql | pool_quest_save | 任务池保存 |
| profanity_name.sql | profanity_name | 敏感词 |
| quest_tracker.sql | quest_tracker | 任务追踪 |
| world_state.sql | world_state | 世界状态 |
| worldstates.sql | worldstates | 世界状态变量 |
| active_arena_season.sql | active_arena_season | 激活的竞技场赛季 |
| character_brew_of_the_month.sql | character_brew_of_the_month | 角色每月酿酒 |

### characters 表主要字段

- `guid`: 角色全局唯一标识符（主键）
- `account`: 所属账户ID
- `name`: 角色名
- `race` / `class` / `gender`: 种族/职业/性别
- `level` / `xp`: 等级和经验值
- `money`: 金币
- `position_x/y/z` / `map` / `orientation`: 位置信息
- `taximask`: 飞行路径解锁状态
- `online`: 是否在线
- `totaltime` / `leveltime`: 总在线时间/本等级在线时间
- `rest_bonus`: 休息奖励经验
- `resettalents_cost` / `resettalents_time`: 天赋重置信息
- `playerFlags`: 玩家标志
- `health` / `power1-7`: 生命值和各能量
- `latency`: 网络延迟
- `talentGroupsCount` / `activeTalentGroup`: 双天赋信息

---

## acore_world 数据库

**位置**: `data/sql/base/db_world/`

**作用**: 存储游戏世界的静态内容定义和配置数据

### NPC与生物模板表

| 文件名 | 表名 | 用途说明 |
|-------|------|---------|
| creature_template.sql | creature_template | 生物模板定义，包含名称、等级、属性、AI类型等 |
| creature_template_addon.sql | creature_template_addon | 生物模板附加数据 |
| creature_template_model.sql | creature_template_model | 生物模型映射 |
| creature_classlevelstats.sql | creature_classlevelstats | 生物等级属性 |
| creature_model_info.sql | creature_model_info | 生物模型信息 |
| creaturedisplayinfoextra_dbc.sql | creaturedisplayinfoextra_dbc | 生物显示扩展信息 |
| creaturemodeldata_dbc.sql | creaturemodeldata_dbc | 生物模型数据 |
| creaturefamily_dbc.sql | creaturefamily_dbc | 生物分类（科属） |
| creaturetype_dbc.sql | creaturetype_dbc | 生物类型定义 |
| creature_queststarter.sql | creature_queststarter | 任务触发NPC |
| creature_questender.sql | creature_questender | 任务完成NPC |
| creature_spellclick_spells.sql | creature_spellclick_spells | spellclick 触发法术 |
| npc_spellclick_spells.sql | npc_spellclick_spells | NPC spellclick |
| vehicle_template_accessory.sql | vehicle_template_accessory | 载具模板附件 |
| creature_respawn.sql | creature_respawn | 生物重生队列（运行时） |

### 游戏对象表

| 文件名 | 表名 | 用途说明 |
|-------|------|---------|
| gameobject.sql | gameobject | 游戏对象实例数据 |
| gameobject_template.sql | gameobject_template | 游戏对象模板 |
| gameobject_queststarter.sql | gameobject_queststarter | 任务触发对象 |
| gameobject_questender.sql | gameobject_questender | 任务完成对象 |
| gameobject_summon_groups.sql | gameobject_summon_groups | 召唤组 |
| gameobject_questitem.sql | gameobject_questitem | 对象任务物品 |
| gameobject_loot_template.sql | gameobject_loot_template | 对象掉落模板 |

### 任务系统表

| 文件名 | 表名 | 用途说明 |
|-------|------|---------|
| quest_template.sql | quest_template | 任务模板，定义任务的所有属性、目标、奖励 |
| quest_template_addon.sql | quest_template_addon | 任务附加数据 |
| quest_greeting.sql | quest_greeting | 任务对话文本 |
| quest_greeting_locale.sql | quest_greeting_locale | 本地化任务对话 |
| quest_request_items.sql | quest_request_items | 任务需要的物品 |
| quest_request_items_locale.sql | quest_request_items_locale | 本地化物品需求 |
| quest_poi_points.sql | quest_poi_points | 任务POI坐标点 |
| quest_mail_sender.sql | quest_mail_sender | 任务邮件发送者 |
| quest_money_reward.sql | quest_money_reward | 任务金钱奖励 |
| pool_quest.sql | pool_quest | 任务池 |

### 技能与法术表

| 文件名 | 表名 | 用途说明 |
|-------|------|---------|
| spell_template.sql | spell_template | 法术模板 |
| spell_ranks.sql | spell_ranks | 法术等级对应 |
| spell_requirement.sql | spell_requirement | 法术需求 |
| spell_area.sql | spell_area | 法术区域效果 |
| spell_threat.sql | spell_threat | 法术威胁值 |
| spell_proc.sql | spell_proc | 法术触发机制 |
| spell_target_position.sql | spell_target_position | 法术目标位置 |
| spell_dbc.sql | spell_dbc | DBC格式法术数据 |
| spell_script_names.sql | spell_script_names | 脚本绑定 |
| spell_custom_attr.sql | spell_custom_attr | 自定义属性 |
| spell_jump_distance.sql | spell_jump_distance | 跳跃距离 |
| spell_linked_spell.sql | spell_linked_spell | 关联法术 |

### 掉落与物品表

| 文件名 | 表名 | 用途说明 |
|-------|------|---------|
| item_template.sql | item_template | 物品模板定义 |
| item_dbc.sql | item_dbc | DBC格式物品数据 |
| item_set_names.sql | item_set_names | 套装名称 |
| itemlimitcategory_dbc.sql | itemlimitcategory_dbc | 物品限制分类 |
| itemdisplayinfo_dbc.sql | itemdisplayinfo_dbc | 物品显示信息 |
| reference_dbc.sql | reference_dbc | 引用模板 |
| disenchant_loot_template.sql | disenchant_loot_template | 分解掉落 |
| fishing_loot_template.sql | fishing_loot_template | 钓鱼掉落 |
| gameobject_loot_template.sql | gameobject_loot_template | 对象掉落 |
| item_loot_template.sql | item_loot_template | 物品掉落 |
| pickpocketing_loot_template.sql | pickpocketing_loot_template | 偷窃掉落 |
| prosecting_loot_template.sql | prosecting_loot_template | 勘探掉落 |
| skinning_loot_template.sql | skinning_loot_template | 剥皮掉落 |
| spell_loot_template.sql | spell_loot_template | 法术掉落 |
| master_loot_template.sql | master_loot_template | 主导掉落 |

### 区域与地图表

| 文件名 | 表名 | 用途说明 |
|-------|------|---------|
| areatable_dbc.sql | areatable_dbc | 区域定义 |
| areatrigger.sql | areatrigger | 区域触发器 |
| areatrigger_scripts.sql | areatrigger_scripts | 触发器脚本 |
| areapoi_dbc.sql | areapoi_dbc | 区域POI |
| battlemaster_entry.sql | battlemaster_entry | 战场管理员入口 |
| changelog.sql | changelog | 变更日志 |
| conditions.sql | conditions | 条件系统 |
| corpse_addon.sql | corpse_addon | 尸体附加 |
| corpse_phases.sql | corpse_phases | 尸体阶段 |
| creature_addon.sql | creature_addon | 生物附加 |
| creature_formations.sql | creature_formations | 生物编队 |
| creature_questrelation.sql | creature_questrelation | 生物任务关联 |
| vehicle_accessory.sql | vehicle_accessory | 载具附件 |
| vehicle_template_accessory.sql | vehicle_template_accessory | 载具模板附件 |

### 广播文本与本地化

| 文件名 | 表名 | 用途说明 |
|-------|------|---------|
| broadcasts.sql | broadcasts | 广播文本 |
| broadcast_text.sql | broadcast_text | 广播文本完整 |
| npc_text.sql | npc_text | NPC对话文本 |
| npc_text_locale.sql | npc_text_locale | 本地化NPC文本 |
| gossip_menu_option.sql | gossip_menu_option | 对话菜单选项 |
| points_of_interest.sql | points_of_interest | 兴趣点 |
| points_of_interest_locale.sql | points_of_interest_locale | 本地化POI |
| mail_level_reward.sql | mail_level_reward | 等级奖励邮件 |
| mail_loot_template.sql | mail_loot_template | 邮件掉落 |

### 刷新区与刷新表

| 文件名 | 表名 | 用途说明 |
|-------|------|---------|
| spawn_group.sql | spawn_group | 生成组 |
| spawn_group_template.sql | spawn_group_template | 生成组模板 |
| creature_spawns.sql | creature_spawns | 生物生成 |
| gameobject_spawns.sql | gameobject_spawns | 对象生成 |
| waypoint_data.sql | waypoint_data | 路径点数据 |
| waypoint_scripts.sql | waypoint_scripts | 路径点脚本 |
| smart_scripts.sql | smart_scripts | SmartAI 脚本 |
| smart_scripts_reference.sql | smart_scripts_reference | SmartAI 引用 |
| spell_scripts.sql | spell_scripts | 法术脚本 |

### DBC 数据表

| 文件名 | 表名 | 用途说明 |
|-------|------|---------|
| achievement_dbc.sql | achievement_dbc | 成就数据 |
| achievement_criteria_dbc.sql | achievement_criteria_dbc | 成就条件 |
| achievement_reward.sql | achievement_reward | 成就奖励 |
| achievement_reward_locale.sql | achievement_reward_locale | 本地化成就奖励 |
| achievement_criteria_data.sql | achievement_criteria_data | 成就条件数据 |
| areatable_dbc.sql | areatable_dbc | 区域表 |
| arena_season_reward.sql | arena_season_reward | 竞技场赛季奖励 |
| arena_season_reward_group.sql | arena_season_reward_group | 赛季奖励组 |
| barbershopstyle_dbc.sql | barbershopstyle_dbc | 理发店样式 |
| chatchannels_dbc.sql | chatchannels_dbc | 聊天频道 |
| chrclasses_dbc.sql | chrclasses_dbc | 职业定义 |
| charstartoutfit_dbc.sql | charstartoutfit_dbc | 起始套装 |
| factiontemplate_dbc.sql | factiontemplate_dbc | 阵营模板 |
| gtchancetomeleecritbase_dbc.sql | gtchancetomeleecritbase_dbc | 暴击基础几率 |
| gtchancetospellcrit_dbc.sql | gtchancetospellcrit_dbc | 法术暴击几率 |
| gtcombatratings_dbc.sql | gtcombatratings_dbc | 战斗等级 |
| gtoctregenhp_dbc.sql | gtoctregenhp_dbc | 生命恢复 |
| gtnpcmanacostscaler_dbc.sql | gtnpcmanacostscaler_dbc | 法力消耗 |
| glyphslot_dbc.sql | glyphslot_dbc | 雕文槽 |
| holidays_dbc.sql | holidays_dbc | 假日数据 |
| item_dbc.sql | item_dbc | 物品DBC |
| itemdisplayinfo_dbc.sql | itemdisplayinfo_dbc | 显示信息 |
| lock_dbc.sql | lock_dbc | 锁定义 |
| namesprofanity_dbc.sql | namesprofanity_dbc | 禁用名 |
| overridespelldata_dbc.sql | overridespelldata_dbc | 法术覆盖 |
| powerdisplay_dbc.sql | powerdisplay_dbc | 能量显示 |
| pvpdifficulty_dbc.sql | pvpdifficulty_dbc | PVP难度 |
| questxp_dbc.sql | questxp_dbc | 任务经验 |
| scalingstatdistribution_dbc.sql | scalingstatdistribution_dbc | 缩放属性分布 |
| skillraceclassinfo_dbc.sql | skillraceclassinfo_dbc | 技能种族职业信息 |
| spellitemenchantmentcondition_dbc.sql | spellitemenchantmentcondition_dbc | 附魔条件 |
| spellradius_dbc.sql | spellradius_dbc | 法术范围 |
| spellrange_dbc.sql | spellrange_dbc | 法术距离 |
| taxinodes_dbc.sql | taxinodes_dbc | 飞行路径节点 |
| trainer_spell.sql | trainer_spell | 训练师法术 |
| transport_template.sql | transport_template | 交通模板 |
| worldmapoverlay_dbc.sql | worldmapoverlay_dbc | 世界地图覆盖 |
| wmoareatable_dbc.sql | wmoareatable_dbc | WMO区域表 |
| playercreateinfo_cast_spell.sql | playercreateinfo_cast_spell | 创建角色时施放法术 |
| playercreateinfo_spell_custom.sql | playercreateinfo_spell_custom | 自定义初始法术 |
| player_race_stats.sql | player_race_stats | 种族属性 |
| player_class_stats.sql | player_class_stats | 职业属性 |
| player_totem_model.sql | player_totem_model |  totem 模型 |
| lfg_dungeon_rewards.sql | lfg_dungeon_rewards | LFG地下城奖励 |
| game_event_creature.sql | game_event_creature | 游戏事件生物 |
| game_event_creature_quest.sql | game_event_creature_quest | 事件任务 |
| game_event_gameobject.sql | game_event_gameobject | 事件对象 |
| game_event_gameobject_quest.sql | game_event_gameobject_quest | 事件对象任务 |
| game_event_prerequisite.sql | game_event_prerequisite | 事件前置 |
| game_event_seasonal_questrelation.sql | game_event_seasonal_questrelation | 季节任务 |
| game_event_condition.sql | game_event_condition | 事件条件 |
| game_event_quest_condition.sql | game_event_quest_condition | 任务条件 |
| game_event_save.sql | game_event_save | 事件保存 |
| game_event_condition_save.sql | game_event_condition_save | 条件保存 |
| factionchange_achievements.sql | factionchange_achievements | 阵营转换成就 |
| factionchange_items.sql | factionchange_items | 阵营转换物品 |
| factionchange_spells.sql | factionchange_spells | 阵营转换法术 |
| factionchange_titles.sql | factionchange_titles | 阵营转换称号 |
| pool_creature.sql | pool_creature | 生物池 |
| pool_gameobject.sql | pool_gameobject | 对象池 |
| pool_pool.sql | pool_pool | 池中池 |
| pool_template.sql | pool_template | 池模板 |
| player_factionchange_achievements.sql | player_factionchange_achievements | 玩家成就阵营变更 |
| player_factionchange_items.sql | player_factionchange_items | 玩家物品阵营变更 |
| player_factionchange_spells.sql | player_factionchange_spells | 玩家法术阵营变更 |
| player_factionchange_titles.sql | player_factionchange_titles | 玩家称号阵营变更 |
| progression_buff.sql | progression_buff | 进度buff |
| random_property_mods.sql | random_property_mods | 随机属性模组 |
| random_suffix_mods.sql | random_suffix_mods | 随机后缀模组 |
| reference_loot_template.sql | reference_loot_template | 引用掉落模板 |
| reputation_reward_rate.sql | reputation_reward_rate | 声望奖励比率 |
| reputation_spillover_template.sql | reputation_spillover_template | 声望溢出模板 |
| script_waypoint.sql | script_waypoint | 脚本路径点 |
| script_waypoint_data.sql | script_waypoint_data | 路径点数据 |
| skip_loot_template.sql | skip_loot_template | 跳过掉落 |
| transports.sql | transports | 交通 |
| warden_checks.sql | warden_checks |  warden 检查 |
| version.sql | version | 版本信息 |

### creature_template 表主要字段

- `entry`: 生物模板唯一标识（主键）
- `name`: 生物名称
- `subname`: 副名称
- `minlevel` / `maxlevel`: 最小/最大等级
- `exp`: 经验值系数
- `faction`: 阵营
- `npcflag`: NPC标志
- `speed_walk` / `speed_run`: 移动速度
- `scale`: 体型缩放
- `rank`: 等级（普通/精英/稀有/世界BOSS）
- `dmgschool`: 伤害类型
- `BaseAttackTime` / `RangeAttackTime`: 攻击间隔
- `unit_class`: 单位职业
- `unit_flags` / `unit_flags2`: 标志
- `type` / `family`: 生物类型/科属
- `lootid` / `pickpocketloot` / `skinloot`: 掉落ID
- `PetSpellDataId`: 宠物技能数据
- `VehicleId`: 载具ID
- `mingold` / `maxgold`: 金币掉落范围
- `AIName`: AI名称
- `MovementType`: 移动类型
- `HealthModifier` / `ManaModifier` / `ArmorModifier`: 属性修正
- `ScriptName`: 绑定脚本

---

## 更新文件规律

### 目录结构

```
data/sql/updates/
  db_auth/           # 认证数据库增量更新
  db_characters/     # 角色数据库增量更新
  db_world/          # 世界数据库增量更新
  pending_db_auth/   # 待处理的认证更新
  pending_db_characters/  # 待处理的角色更新
  pending_db_world/  # 待处理的世界更新
```

### 命名规范

更新文件名遵循以下格式：

```
YYYY_MM_DD_XX.sql
```

- `YYYY`: 年份（4位数字）
- `MM`: 月份（2位数字）
- `DD`: 日期（2位数字）
- `XX`: 当天第几个更新文件（从00开始）

### 示例

```
2026_04_16_00.sql  # 2026年4月16日的第1个更新
2026_04_16_01.sql  # 2026年4月16日的第2个更新
2025_12_29_04.sql  # 2025年12月29日的第5个更新
```

### 版本分布

根据文件时间戳分析：

| 数据库 | 更新时间范围 | 文件数量 |
|-------|------------|---------|
| db_auth | 2024-01 至 2025-07 | 8 个文件 |
| db_characters | 较少量更新 | 数量有限 |
| db_world | 2025-01 至 2026-04 | 大量文件 |

### pending 目录

`pending_*` 目录用于存放待处理的更新文件，通常在 PR 合并前使用。一旦更新被确认并应用，相关文件应移动到正式的 `updates` 目录。

### 更新文件内容

每个更新文件通常包含：
- 表结构变更（ALTER TABLE）
- 数据插入/更新/删除
- 索引调整
- 数据迁移脚本

---

## 数据库关系图

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│  acore_auth     │     │ acore_characters│     │  acore_world   │
├─────────────────┤     ├─────────────────┤     ├─────────────────┤
│ account         │◄────│ characters      │     │ creature_template│
│ account_access  │     │ (account_id)    │     │ gameobject_template│
│ realmlist       │     │ item_instance   │     │ quest_template  │
│ ip_banned       │     │ character_xxx   │     │ spell_template  │
│ logs            │     │ guild_xxx       │     │ item_template   │
└─────────────────┘     │ mail_xxx        │     │ map/area tables │
                        │ pet_xxx         │     │ loot templates  │
                        └─────────────────┘     └─────────────────┘
```

---

## 文档信息

- 创建日期: 2026-04-17
- 数据来源: `/workspace/data/sql/base/` 目录下的 SQL 定义文件
