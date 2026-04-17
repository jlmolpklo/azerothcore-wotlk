# AzerothCore 数据库表结构文档

本文档详细介绍 AzerothCore (WoW 3.3.5a 模拟器) 三个数据库的所有表结构。

---

## 一、acore_auth 数据库

### 1.1 account (账户表)

存储所有游戏账户的基本信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 账户ID，主键自增 |
| username | VARCHAR(32) | 用户名，唯一标识 |
| salt | BINARY(32) | 认证盐值 |
| verifier | BINARY(32) | 认证验证器 |
| session_key | BINARY(40) | 会话密钥 |
| last_ip | VARCHAR(15) | 最后登录IP |
| last_attempt_ip | VARCHAR(15) | 最后尝试登录IP |
| failed_logins | INT | 失败登录次数 |
| locked | TINYINT | 账户是否锁定 (0/1) |
| lock_country | VARCHAR(2) | 锁定国家代码 |
| last_login | DATETIME | 最后登录时间 |
| username_token | VARCHAR(64) | 用户名令牌 |
| registration_date | DATETIME | 注册时间 |

### 1.2 realmlist (服务器列表表)

定义所有可连接的服务器（realm）。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | Realm ID，主键 |
| name | VARCHAR(32) | Realm名称 |
| address | VARCHAR(255) | Realm地址 |
| localAddress | VARCHAR(255) | 本地地址 |
| localSubnetMask | VARCHAR(255) | 本地子网掩码 |
| port | SMALLINT | 端口 |
| icon | TINYINT | 图标类型 (0=正常, 1=PvP, 4=正常, 6=RP) |
| flag | TINYINT | 标记 |
| timezone | TINYINT | 时区 |
| required_security_level | TINYINT | 所需安全级别 |
| population | FLOAT | 人口(在线玩家比例) |
| gamebuild | INT | 游戏版本构建 |

### 1.3 account_access (账户权限表)

存储账户的权限级别。

| 字段 | 类型 | 说明 |
|------|------|------|
| account_id | INT | 账户ID，外键 |
| SecurityLevel | SMALLINT | 安全级别 (0=玩家, 1=GM, 2=高级GM, 3=管理员) |
| realmID | INT | 关联的Realm ID (-1表示全局) |

### 1.4 account_banned (账户封禁表)

记录被封禁的账户。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 主键自增 |
| account_id | INT | 被封禁的账户ID |
| bandate | BIGINT | 封禁开始时间 |
| unbandate | BIGINT | 封禁结束时间 (0表示永久) |
| bannedby | VARCHAR(50) | 执行封禁的管理员 |
| banreason | VARCHAR(255) | 封禁原因 |
| active | TINYINT | 是否仍然生效 |

### 1.5 ip_banned (IP封禁表)

记录被封禁的IP地址。

| 字段 | 类型 | 说明 |
|------|------|------|
| ip | VARCHAR(15) | 被封禁的IP地址 |
| bandate | BIGINT | 封禁开始时间 |
| unbandate | BIGINT | 封禁结束时间 |
| bannedby | VARCHAR(50) | 执行封禁者 |
| banreason | VARCHAR(255) | 封禁原因 |

### 1.6 logs_ip_actions (IP操作日志表)

记录IP相关的操作日志。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 主键自增 |
| date | DATETIME | 操作时间 |
| ip | VARCHAR(15) | IP地址 |
| action | TINYINT | 操作类型 |
| state | TINYINT | 状态 |

### 1.7 uptime (服务器运行时间表)

记录服务器的运行时间数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| realmid | INT | Realm ID |
| starttime | BIGINT | 启动时间戳 |
| uptime | INT | 运行时间(秒) |
| maxplayers | INT | 最高在线人数 |
| comment | VARCHAR(255) | 备注 |

### 1.8 autobroadcast (自动广播表)

存储自动广播消息。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 主键自增 |
| realmid | INT | Realm ID (-1表示全局) |
| weight | INT | 权重 |
| text | TEXT | 广播文本内容 |

### 1.9 motd (今日消息表)

服务器公告消息。

| 字段 | 类型 | 说明 |
|------|------|------|
| server | INT | 服务器ID |
| text | TEXT | 公告文本 |

### 1.10 realmcharacters (角色数量统计表)

统计每个账户在每个Realm的角色数量。

| 字段 | 类型 | 说明 |
|------|------|------|
| account_id | INT | 账户ID |
| realmid | INT | Realm ID |
| numchars | TINYINT | 角色数量 |

---

## 二、acore_characters 数据库

### 2.1 characters (角色表)

存储所有角色的核心信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID，主键 |
| account | INT | 所属账户ID |
| name | VARCHAR(12) | 角色名称 |
| race | TINYINT | 种族 |
| class | TINYINT | 职业 |
| gender | TINYINT | 性别 (0=男性, 1=女性) |
| level | TINYINT | 等级 |
| xp | INT | 当前经验值 |
| money | BIGINT | 金币数量 |
| playerBytes | INT | 角色外观字节数据 |
| playerBytes2 | INT | 角色外观字节数据2 |
| playerFlags | INT | 玩家标志 |
| position_x | FLOAT | 当前位置X坐标 |
| position_y | FLOAT | 当前位置Y坐标 |
| position_z | FLOAT | 当前位置Z坐标 |
| map | SMALLINT | 当前地图ID |
| instance_id | INT | 副本实例ID |
| instance_mode_mask | INT | 副本难度掩码 |
| online | TINYINT | 是否在线 (0/1) |
| totaltime | INT | 总游戏时间(秒) |
| leveltime | INT | 当前等级游戏时间 |
| logout_time | INT | 最后下线时间 |
| is_logout_resting | TINYINT | 是否在休息区域 |
| rest_bonus | FLOAT | 休息奖励经验 |
| resettalents_time | INT | 天赋重置时间戳 |
| talent_tree | VARCHAR(10) | 天赋树配置 |
| trans_x | FLOAT | 交通工具X坐标 |
| trans_y | FLOAT | 交通工具Y坐标 |
| trans_z | FLOAT | 交通工具Z坐标 |
| trans_o | FLOAT | 交通工具朝向 |
| transguid | BIGINT | 交通工具GUID |
| extra_flags | INT | 额外标志 |
| stable_slots | TINYINT | 宠物栏位数量 |
| at_login | INT | 登录标志 |
| zone | SMALLINT | 区域ID |
| online_time | INT | 在线时长 |
| mc_achievement_points | INT | 成就点数 |
| join_time | INT | 加入服务器时间 |

### 2.2 character_inventory (角色物品栏表)

存储角色背包和装备栏中的物品。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID |
| bag | TINYINT | 背包槽位 (0=装备栏, 1-4=背包) |
| slot | TINYINT | 物品槽位 |
| item | INT | 物品实例ID，外键指向item_instance |
| item_guid | INT | 物品GUID |

### 2.3 character_spell (角色技能表)

存储角色已学习的法术。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID |
| spell | INT | 法术ID |
| active | TINYINT | 是否激活 |
| disabled | TINYINT | 是否被禁用 |

### 2.4 character_aura (角色光环表)

存储角色当前生效的光环效果。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID |
| caster_guid | BIGINT | 释放者GUID |
| item_guid | INT | 物品GUID |
| spell | INT | 法术ID |
| effect_mask | INT | 效果掩码 |
| recalculate_mask | INT | 重新计算掩码 |
| stackcount | TINYINT | 堆叠层数 |
| amount | INT | 效果数值 |
| base_amount | INT | 基础数值 |
| maxduration | INT | 最大持续时间(毫秒) |
| remaintime | INT | 剩余时间(毫秒) |
| remaincharges | TINYINT | 剩余充能次数 |

### 2.5 character_queststatus (角色任务状态表)

记录角色任务完成状态。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID |
| quest | INT | 任务ID |
| status | TINYINT | 任务状态 (0=未接受, 1=进行中, 2=完成, 3=失败) |
| rewarded | TINYINT | 是否已奖励 |
| explored | TINYINT | 是否已探索 |
| timer | BIGINT | 任务计时器 |
| mobcount1-4 | SMALLINT | 击杀生物计数 |
| itemcount1-4 | INT | 物品计数 |

### 2.6 character_achievement (角色成就表)

记录角色已获得的成就。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID |
| achievement | SMALLINT | 成就ID |
| date | INT | 获得时间戳 |

### 2.7 character_reputation (角色声望表)

存储角色各阵营的声望等级。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID |
| faction | SMALLINT | 阵营ID |
| standing | INT | 声望值 |
| flags | INT | 标志 |

### 2.8 character_skills (角色专业技能表)

记录角色学会的专业技能。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID |
| skill | SMALLINT | 技能ID |
| value | INT | 技能当前值 |
| max | INT | 技能最大值 |

### 2.9 character_talent (角色天赋表)

存储角色的天赋点配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID |
| spell | INT | 法术ID |
| talent_group | TINYINT | 天赋专精 (0=主天赋, 1=副天赋) |

### 2.10 character_pet (角色宠物表)

存储角色宠物数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 宠物ID，主键 |
| owner | INT | 主人GUID |
| modelid | INT | 模型ID |
| CreatedBySpell | INT | 创建宠物的法术ID |
| PetType | TINYINT | 宠物类型 (0=野兽, 1=幽灵等) |
| level | INT | 等级 |
| exp | INT | 经验值 |
| Reactstate | TINYINT | 攻击状态 |
| name | VARCHAR(21) | 宠物名称 |
| renamed | TINYINT | 是否被重命名 |
| slot | TINYINT | 宠物栏位 |
| curhealth | INT | 当前生命值 |
| curmana | INT | 当前法力值 |
| abdata | TEXT | 宠物技能数据 |

### 2.11 guild (公会表)

存储公会基本信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| guildid | INT | 公会ID，主键 |
| name | VARCHAR(24) | 公会名称 |
| leader | INT | 会长GUID |
| EmblemStyle | TINYINT | 徽章样式 |
| EmblemColor | TINYINT | 徽章颜色 |
| BorderStyle | TINYINT | 边框样式 |
| BorderColor | TINYINT | 边框颜色 |
| BackgroundColor | TINYINT | 背景颜色 |
| info | VARCHAR(500) | 公会公告 |
| motd | VARCHAR(128) | 公会消息 |
| createdate | INT | 创建时间 |
| BankMoney | BIGINT | 公会银行金币 |

### 2.12 guild_member (公会成员表)

存储公会成员列表。

| 字段 | 类型 | 说明 |
|------|------|------|
| guildid | INT | 公会ID |
| guid | INT | 成员GUID |
| rank | TINYINT | 等级 (0=会长, 1-7=不同权限) |
| pnote | VARCHAR(31) | 个人备注 |
| offnote | VARCHAR(31) | 官员备注 |

### 2.13 arena_team (竞技场队伍表)

存储竞技场队伍信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| arenaTeamId | INT | 队伍ID，主键 |
| name | VARCHAR(24) | 队伍名称 |
| captainGuid | INT | 队长GUID |
| type | TINYINT | 竞技场类型 (2=2v2, 3=3v3, 5=5v5) |
| rating | SMALLINT | 评分 |
| seasonGames | SMALLINT | 赛季场次 |
| seasonWins | SMALLINT | 赛季胜场 |
| weekGames | SMALLINT | 本周场次 |
| weekWins | SMALLINT | 本周胜场 |
| rank | INT | 排名 |

### 2.14 arena_team_member (竞技场成员表)

存储竞技场队伍成员。

| 字段 | 类型 | 说明 |
|------|------|------|
| arenaTeamId | INT | 队伍ID |
| guid | INT | 成员GUID |
| weekGames | SMALLINT | 本周场次 |
| weekWins | SMALLINT | 本周胜场 |
| seasonGames | SMALLINT | 赛季场次 |
| seasonWins | SMALLINT | 赛季胜场 |
| rating | SMALLINT | 评分 |

### 2.15 mail (邮件表)

存储邮件数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| messageID | INT | 邮件ID，主键 |
| messageType | TINYINT | 类型 (0=普通, 2=GM邮件, 3=游戏内物品) |
| stationery | TINYINT | 信纸样式 |
| guid | INT | 发送者GUID |
| receiver | INT | 接收者GUID |
| subject | LONGTEXT | 主题 |
| body | LONGTEXT | 内容 |
| has_items | TINYINT | 是否包含物品 |
| expire_time | BIGINT | 过期时间 |
| deliver_time | BIGINT | 投递时间 |
| money | BIGINT | 金钱 |
| cod | BIGINT | 货到付款金额 |

### 2.16 corpse (角色尸体表)

存储死亡角色尸体位置。

| 字段 | 类型 | 说明 |
|------|------|------|
| corpseguid | INT | 尸体GUID |
| posX | FLOAT | X坐标 |
| posY | FLOAT | Y坐标 |
| posZ | FLOAT | Z坐标 |
| o | FLOAT | 朝向 |
| mapId | SMALLINT | 地图ID |
| displayId | INT | 显示模型ID |
| time | INT | 死亡时间 |
| corpse_type | TINYINT | 尸体类型 |
| guid | INT | 角色GUID |

### 2.17 item_instance (物品实例表)

存储所有物品实例的详细信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 物品GUID，主键 |
| owner_guid | INT | 拥有者GUID |
| creatorGuid | INT | 创建者GUID |
| giftCreatorGuid | INT | 赠送者GUID |
| count | INT | 堆叠数量 |
| duration | INT | 持续时间 |
| charges | TEXT | 充能数据 |
| flags | INT | 物品标志 |
| enchantments | TEXT | 附魔数据 |
| randomPropertyId | SMALLINT | 随机属性ID |
| durability | SMALLINT | 耐久度 |
| maxdurability | SMALLINT | 最大耐久度 |
| playedTime | INT | 已使用时间 |
| text | TEXT | 物品文本 |

### 2.18 character_homebind (角色绑定表)

存储角色的绑定信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID |
| bindId | INT | 绑定点ID |
| mapId | SMALLINT | 绑定地图ID |
| zoneId | SMALLINT | 绑定区域ID |
| posX | FLOAT | 绑定位置X |
| posY | FLOAT | 绑定位置Y |
| posZ | FLOAT | 绑定位置Z |

### 2.19 character_action (角色快捷键表)

存储角色动作栏配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID |
| spec | TINYINT | 专精 |
| button | TINYINT | 按钮槽位 (0-11) |
| action | INT | 动作ID |
| type | TINYINT | 类型 |

---

## 三、acore_world 数据库

### 3.1 creature_template (生物模板表)

定义所有生物的基础属性。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 生物ID，主键 |
| modelid1 | INT | 模型ID1 |
| modelid2 | INT | 模型ID2 |
| modelid3 | INT | 模型ID3 |
| modelid4 | INT | 模型ID4 |
| name | VARCHAR(96) | 名称 |
| subname | VARCHAR(100) | 副名称 |
| IconName | VARCHAR(100) | 图标名称 |
| gossip_menu_id | INT | 对话菜单ID |
| minlevel | TINYINT | 最小等级 |
| maxlevel | TINYINT | 最大等级 |
| exp | INT | 经验等级 |
| faction | INT | 阵营 |
| npcflag | INT | NPC标志 |
| speed_walk | FLOAT | 行走速度 |
| speed_run | FLOAT | 奔跑速度 |
| scale | FLOAT | 模型缩放 |
| rank | TINYINT | 等级 (0=普通, 1=精英, 2=稀有精英, 3=世界BOSS) |
| dmgschool | TINYINT | 伤害类型 |
| baseattacktime | INT | 基础攻击时间 |
| rangeattacktime | INT | 远程攻击时间 |
| unit_class | TINYINT | 单位职业 (1=战士) |
| unit_flags | INT | 单位标志 |
| unit_flags2 | INT | 单位标志2 |
| dynamicflags | INT | 动态标志 |
| family | TINYINT | 生物类型 |
| trainer_type | TINYINT | 训练师类型 |
| trainer_spell | INT | 训练师法术 |
| type | TINYINT | 生物类型 |
| type_flags | INT | 类型标志 |
| lootid | INT | 掉落ID |
| pickpocketLoot | INT | 偷窃掉落ID |
| SkinLoot | INT | 剥皮掉落ID |
| resistance1-6 | SMALLINT | 抗性 (奥术/火焰/暗影等) |
| flags_extra | INT | 额外标志 |
| ScriptName | VARCHAR(64) | 脚本名称 |
|VerifiedBuild | INT | 验证版本 |

### 3.2 item_template (物品模板表)

定义所有物品的模板数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 物品ID，主键 |
| class | TINYINT | 物品类别 |
| subclass | TINYINT | 物品子类别 |
| SoundOverrideSubclass | INT | 声音覆盖 |
| name | VARCHAR(255) | 物品名称 |
| displayid | INT | 显示模型ID |
| Quality | TINYINT | 品质 (0=灰色, 1=白色, 2=绿色, 3=蓝色, 4=紫色, 5=橙色) |
| flags | BIGINT | 物品标志 |
| flags2 | INT | 物品标志2 |
| flags3 | INT | 物品标志3 |
| BuyCount | INT | 购买数量 |
| BuyPrice | BIGINT | 购买价格 |
| SellPrice | BIGINT | 出售价格 |
| inventorytype | TINYINT | 装备位置 |
| allowclass | INT | 允许职业 |
| allowrace | INT | 允许种族 |
| itemlevel | SMALLINT | 物品等级 |
| RequiredLevel | TINYINT | 需要等级 |
| RequiredSkill | SMALLINT | 需要技能 |
| RequiredSkillRank | SMALLINT | 需要技能等级 |
| requiredspell | INT | 需要法术 |
| requiredhonorrank | INT | 需要荣誉等级 |
| RequiredCityRank | INT | 需要城市等级 |
| RequiredReputationFaction | SMALLINT | 需要声望阵营 |
| RequiredReputationRank | SMALLINT | 需要声望等级 |
| maxcount | INT | 最大数量 |
| stackable | INT | 可堆叠数量 |
| containerSlots | TINYINT | 容器槽位数 |
| StatsCount | INT | 属性数量 |
| stat_type1-10 | TINYINT | 属性类型1-10 |
| stat_value1-10 | INT | 属性数值1-10 |
| ScalingStatDistribution | INT | 缩放属性分布 |
| ScalingStatValue | INT | 缩放属性数值 |
| dmg_min1-2 | VARCHAR(255) | 伤害最小值 |
| dmg_max1-2 | VARCHAR(255) | 伤害最大值 |
| dmg_type1-2 | TINYINT | 伤害类型 |
| armor | INT | 护甲值 |
| holy_res | INT | 神圣抗性 |
| fire_res | INT | 火焰抗性 |
| nature_res | INT | 自然抗性 |
| frost_res | INT | 冰霜抗性 |
| shadow_res | INT | 暗影抗性 |
| arcane_res | INT | 奥术抗性 |
| delay | INT | 攻击间隔(毫秒) |
| ammo_type | INT | 弹药类型 |
| RangedModRange | FLOAT | 远程修正范围 |
| spellid_1-5 | INT | 触发法术ID 1-5 |
| spelltrigger_1-5 | TINYINT | 触发类型 1-5 |
| spellcharges_1-5 | INT | 法术充能 1-5 |
| spellppmRate_1-5 | INT | 每分钟触发概率 1-5 |
| spellcooldown_1-5 | INT | 法术冷却 1-5 |
| spellcategory_1-5 | SMALLINT | 法术分类 1-5 |
| spellcategorycooldown_1-5 | INT | 分类冷却 1-5 |
| bonding | TINYINT | 绑定类型 |
| description | VARCHAR(255) | 描述 |
| PageText | INT | 页文本ID |
| LanguageID | TINYINT | 语言ID |
| startquest | INT | 起始任务ID |
|泉 | INT | 素材 |
| lockid | INT | 锁类型ID |
| material | INT | 材质 |
| sheathe | TINYINT | 收纳类型 |
| extra | INT | 额外数据 |
| FoodType | TINYINT | 食物类型 |
| minMoneyLoot | BIGINT | 最小金币掉落 |
| maxMoneyLoot | BIGINT | 最大金币掉落 |
| ScriptName | VARCHAR(64) | 脚本名称 |
| VerifiedBuild | INT | 验证版本 |

### 3.3 quest_template (任务模板表)

定义所有任务的基本信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 任务ID，主键 |
| QuestType | TINYINT | 任务类型 (0=叙事, 1=击杀, 2=收集) |
| Level | SMALLINT | 任务等级 |
| MinLevel | TINYINT | 最低接取等级 |
| MaxLevel | TINYINT | 最高接取等级 |
| QuestSortID | INT | 任务分类ID |
| QuestInfoID | INT | 任务信息ID |
| SuggestedPlayers | TINYINT | 建议玩家数 |
| FocusFaction | INT | 专注阵营 |
| TimeAllowed | INT | 时间限制(秒) |
| AllowableClasses | INT | 允许职业 |
| SourceSpellID | INT | 源法术ID |
| Flags | INT | 任务标志 |
| Flags2 | INT | 任务标志2 |
| RewardMailTemplateID | INT | 奖励邮件模板ID |
| RewardMailDelay | INT | 奖励邮件延迟 |
| RequiredNpcOrGo1-4 | INT | 需要NPC或游戏对象1-4 |
| RequiredNpcOrGoCount1-4 | TINYINT | 需要数量1-4 |
| RewardOrRequiredItemId1-6 | INT | 奖励或需求物品ID |
| RewardOrRequiredItemCount1-6 | SMALLINT | 奖励或需求物品数量 |

### 3.4 gameobject_template (游戏对象模板表)

定义所有游戏对象（如宝箱、传送门等）。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 游戏对象ID，主键 |
| type | TINYINT | 游戏对象类型 (0=未使用, 1=门, 2=按钮, 3=传送门等) |
| displayId | INT | 显示ID |
| name | VARCHAR(100) | 名称 |
| iconName | VARCHAR(100) | 图标名称 |
| castCaption | VARCHAR(100) | 施法标题 |
| unfriendly | TINYINT | 对敌方是否可见 |
| size | FLOAT | 尺寸 |
| Data | TEXT | 类型特定数据 |
| ScriptName | VARCHAR(64) | 脚本名称 |
| VerifiedBuild | INT | 验证版本 |

### 3.5 npc_vendor (NPC商人表)

定义NPC出售的物品。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | NPC模板ID |
| slot | INT | 槽位 |
| item | INT | 物品ID |
| maxcount | INT | 最大数量 |
| incrtime | INT | 重生时间(秒) |
| ExtendedCost | INT | 扩展成本 |

### 3.6 game_tele (游戏传送表)

存储传送光柱的位置。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 传送ID，主键 |
| position_x | FLOAT | X坐标 |
| position_y | FLOAT | Y坐标 |
| position_z | FLOAT | Z坐标 |
| orientation | FLOAT | 朝向 |
| mapId | SMALLINT | 地图ID |
| name | VARCHAR(100) | 名称 |

### 3.7 playercreateinfo (玩家创建信息表)

定义角色创建时的初始数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| race | TINYINT | 种族 |
| class | TINYINT | 职业 |
| mapId | SMALLINT | 出生地图 |
| zoneId | INT | 区域ID |
| posX | FLOAT | X坐标 |
| posY | FLOAT | Y坐标 |
| posZ | FLOAT | Z坐标 |
| orientation | FLOAT | 朝向 |

### 3.8 player_class_stats (玩家职业属性表)

定义每个职业的基础属性成长。

| 字段 | 类型 | 说明 |
|------|------|------|
| class | TINYINT | 职业 |
| level | TINYINT | 等级 |
| basehp | INT | 基础生命值 |
| basemana | INT | 基础法力值 |
| base_STR | INT | 力量 |
| base_AGI | INT | 敏捷 |
| base_STA | INT | 耐力 |
| base_INT | INT | 智力 |
| base_SPI | INT | 精神 |

### 3.9 player_race_stats (玩家种族属性表)

定义每个种族的基础属性。

| 字段 | 类型 | 说明 |
|------|------|------|
| race | TINYINT | 种族 |
| class | TINYINT | 职业 |
| base_STR | INT | 力量 |
| base_AGI | INT | 敏捷 |
| base_STA | INT | 耐力 |
| base_INT | INT | 智力 |
| base_SPI | INT | 精神 |
| base_armor | INT | 护甲 |

### 3.10 creature_equip_template (生物装备模板表)

定义生物装备配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| CreatureID | INT | 生物模板ID |
| ID | INT | 装备配置ID |
| ItemID1 | INT | 物品ID1 |
| ItemID2 | INT | 物品ID2 |
| ItemID3 | INT | 物品ID3 |

---

### 3.11 conditions (条件表)

定义各种条件判断，用于控制游戏对象的触发条件。

| 字段 | 类型 | 说明 |
|------|------|------|
| SourceTypeOrReferenceId | INT | 条件来源类型 |
| SourceGroup | INT | 源组 |
| SourceEntry | INT | 源条目ID |
| SourceId | INT | 源ID |
| ElseGroup | INT | 否则组 |
| ConditionTypeOrReference | INT | 条件类型或引用 |
| ConditionTarget | TINYINT | 条件目标 (0=玩家, 1=生物, 2=游戏对象) |
| ConditionValue1 | INT | 条件值1 |
| ConditionValue2 | INT | 条件值2 |
| ConditionValue3 | INT | 条件值3 |
| NegativeCondition | TINYINT | 是否反转条件 (0/1) |
| ErrorType | INT | 错误类型 |
| ErrorTextId | INT | 错误文本ID |
| ScriptName | CHAR(64) | 脚本名称 |
| Comment | VARCHAR(255) | 备注说明 |

### 3.12 pool_creature (生物池表)

管理生物的刷新池，用于控制稀有生物和事件生物的刷新。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 生物实例GUID |
| pool_entry | INT | 所属池ID |
| chance | FLOAT | 单独刷新概率 (0表示使用池的默认概率) |
| description | VARCHAR(255) | 描述信息 |

### 3.13 pool_gameobject (游戏对象池表)

管理游戏对象（如宝箱、矿石等）的刷新池。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 游戏对象实例GUID |
| pool_entry | INT | 所属池ID |
| chance | FLOAT | 单独刷新概率 |
| description | VARCHAR(255) | 描述信息 |

### 3.14 creature_addon (生物附加数据表)

存储生物的附加属性，如路径、表情、光环等。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 生物实例GUID |
| path_id | INT | 路径ID |
| mount | INT | 坐骑ID |
| bytes1 | INT | 字节数据1 |
| bytes2 | INT | 字节数据2 |
| emote | INT | 表情ID |
| visibilityDistanceType | TINYINT | 可见距离类型 |
| auras | TEXT | 持续光环列表 (空格分隔的法术ID) |

### 3.15 spell_loot_template (法术掉落模板表)

定义通过法术（如采矿、采药）获得的物品。

| 字段 | 类型 | 说明 |
|------|------|------|
| Entry | INT | 法术ID |
| Item | INT | 物品ID |
| Reference | INT | 引用其他掉落模板 (0=直接掉落) |
| Chance | FLOAT | 掉落概率 (0-100) |
| QuestRequired | TINYINT | 是否任务需求物品 |
| LootMode | SMALLINT | 掉落模式 |
| GroupId | TINYINT | 分组ID |
| MinCount | TINYINT | 最小数量 |
| MaxCount | TINYINT | 最大数量 |
| Comment | VARCHAR(255) | 备注说明 |

### 3.16 creature_queststarter (生物任务起始表)

定义可以提供任务的NPC，关联生物和任务。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 生物模板ID (外键) |
| quest | INT | 任务ID (外键) |

---

## 四、acore_characters 数据库 (续)

### 4.1 character_social (角色社交表)

存储角色的好友和忽略列表。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID |
| friend | INT | 好友GUID |
| flags | TINYINT | 标志 (1=好友, 2=忽略) |

### 4.2 character_glyphs (角色雕文表)

存储角色的雕文配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID |
| talent | SMALLINT | 天赋ID |
| glyph | SMALLINT | 雕文ID |

### 4.3 character_equipmentsets (角色装备方案表)

存储角色的装备方案配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID |
| setguid | BIGINT | 方案GUID |
| setindex | TINYINT | 方案索引 (0-9) |
| name | VARCHAR(31) | 方案名称 |
| iconname | VARCHAR(100) | 图标名称 |
| item0-17 | INT | 各槽位物品ID |

### 4.4 character_pet_declinedname (宠物命名表)

存储已重命名的宠物名称。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 宠物ID |
| owner | INT | 主人GUID |
| genitive | VARCHAR(64) | 主格 |
| dative | VARCHAR(64) | 与格 |
| accusative | VARCHAR(64) | 宾格 |
| instrumental | VARCHAR(64) | 工具格 |
| prepositional | VARCHAR(64) | 前置词格 |

### 4.5 character_talent (角色天赋表)

存储角色天赋配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID |
| spell | INT | 法术ID |
| talent_group | TINYINT | 天赋组 (0=主天赋, 1=冰霜, 2=火焰等) |

### 4.6 character_achievement_progress (角色成就进度表)

存储角色成就进度数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID |
| criteria | SMALLINT | 成就条件ID |
| counter | INT | 计数器 |
| date | INT | 最近更新时间戳 |

### 4.7 character_arena_stats (角色竞技场统计表)

存储角色竞技场统计数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID |
| slot | TINYINT | 竞技场类型 (2v2, 3v3, 5v5) |
| rating | SMALLINT | 评分 |
| seasonGames | SMALLINT | 赛季场次 |
| seasonWins | SMALLINT | 赛季胜场 |

---

### 1.11 account_muted (账户禁言表)

记录被禁言的账户。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 账户ID |
| mutedate | INT | 禁言开始时间 |
| mutetime | INT | 禁言时长(秒) |
| mutedby | VARCHAR(50) | 执行禁言的管理员 |
| mutereason | VARCHAR(255) | 禁言原因 |

### 1.12 build_info (版本信息表)

存储客户端版本构建信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| build | INT | 构建号，主键 |
| majorVersion | INT | 主版本号 |
| minorVersion | INT | 次版本号 |
| bugfixVersion | INT | 修复版本号 |
| hotfixVersion | CHAR(3) | 热修复版本 |
| winAuthSeed | VARCHAR(32) | Windows认证种子 |
| win64AuthSeed | VARCHAR(32) | Windows64认证种子 |
| mac64AuthSeed | VARCHAR(32) | Mac64认证种子 |
| winChecksumSeed | VARCHAR(40) | Windows校验和种子 |
| macChecksumSeed | VARCHAR(40) | Mac校验和种子 |

### 1.13 logs (日志表)

存储服务器日志。

| 字段 | 类型 | 说明 |
|------|------|------|
| time | INT | 日志时间戳 |
| realm | INT | Realm ID |
| type | VARCHAR(250) | 日志类型 |
| level | TINYINT | 日志级别 |
| string | TEXT | 日志内容 |

### 1.14 secret_digest (密钥摘要表)

存储账户密钥摘要。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 账户ID，主键 |
| digest | VARCHAR(100) | 密钥摘要 |

### 1.15 updates (数据库更新记录表)

记录已应用的数据库更新。

| 字段 | 类型 | 说明 |
|------|------|------|
| name | VARCHAR(200) | 更新文件名 |
| hash | CHAR(40) | SHA1哈希 |
| state | ENUM | 状态 (RELEASED/CUSTOM/MODULE/ARCHIVED/PENDING) |
| timestamp | TIMESTAMP | 应用时间 |
| speed | INT | 执行耗时(毫秒) |

### 1.16 updates_include (更新包含目录表)

定义需要包含SQL更新的目录。

| 字段 | 类型 | 说明 |
|------|------|------|
| path | VARCHAR(200) | 目录路径 |
| state | ENUM | 状态 (RELEASED/ARCHIVED/CUSTOM/PENDING) |

---

## 四、acore_characters 数据库 (续)

### 4.8 calendar_events (日历事件表)

存储角色日历事件。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | BIGINT | 事件ID，主键 |
| creator | INT | 创建者GUID |
| title | VARCHAR(255) | 事件标题 |
| description | VARCHAR(255) | 事件描述 |
| type | TINYINT | 事件类型 |
| dungeon | INT | 地下城ID |
| eventtime | INT | 事件时间 |
| flags | INT | 事件标志 |
| time2 | INT | 备用时间字段 |

### 4.9 calendar_invites (日历邀请表)

存储日历邀请信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | BIGINT | 邀请ID，主键 |
| event | BIGINT | 关联事件ID |
| invitee | INT | 被邀请者GUID |
| sender | INT | 发送者GUID |
| status | TINYINT | 邀请状态 |
| statustime | INT | 状态更新时间 |
| rank | TINYINT | 邀请等级 |
| text | VARCHAR(255) | 邀请文本 |

### 4.10 character_account_data (角色账户数据表)

存储角色账户级别的数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID |
| type | TINYINT | 数据类型 |
| time | INT | 更新时间 |
| data | BLOB | 数据内容 |

### 4.11 character_instance (角色副本绑定表)

记录角色与副本的永久绑定。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID |
| instance | INT | 副本实例ID |
| permanent | TINYINT | 是否永久绑定 (0/1) |
| extended | TINYINT | 是否已延长 |

### 4.12 character_spell_cooldown (法术冷却表)

存储角色法术冷却信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID |
| spell | INT | 法术ID |
| category | INT | 法术分类 |
| item | INT | 物品ID |
| time | INT | 冷却结束时间 |
| needSend | TINYINT | 是否需要发送客户端 |

### 4.13 character_stats (角色属性表)

存储角色当前详细属性。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 角色GUID，主键 |
| maxhealth | INT | 最大生命值 |
| maxpower1-7 | INT | 各职业能量最大值 |
| strength | INT | 力量 |
| agility | INT | 敏捷 |
| stamina | INT | 耐力 |
| intellect | INT | 智力 |
| spirit | INT | 精神 |
| armor | INT | 护甲值 |
| resHoly/Fire/Nature/Frost/Shadow/Arcane | INT | 各类抗性 |
| blockPct | FLOAT | 招架百分比 |
| dodgePct | FLOAT | 闪避百分比 |
| parryPct | FLOAT | 格挡百分比 |
| critPct | FLOAT | 法术暴击百分比 |
| attackPower | INT | 攻击强度 |
| rangedAttackPower | INT | 远程攻击强度 |
| spellPower | INT | 法术强度 |
| resilience | INT | 韧性 |

### 4.14 groups (队伍表)

存储组队信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 队伍GUID，主键 |
| leaderGuid | INT | 队长GUID |
| lootMethod | TINYINT | 分配方式 |
| looterGuid | INT | 拾取者GUID |
| lootThreshold | TINYINT | 拾取阈值 |
| icon1-8 | BIGINT | 队伍标记图标 |
| groupType | TINYINT | 队伍类型 |
| difficulty | TINYINT | 难度 |
| raidDifficulty | TINYINT | 团队难度 |
| masterLooterGuid | INT | 主 lootmaster GUID |

### 4.15 group_member (队伍成员表)

存储队伍成员信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 队伍GUID |
| memberGuid | INT | 成员GUID，主键 |
| memberFlags | TINYINT | 成员标志 |
| subgroup | TINYINT | 子队伍分组 |
| roles | TINYINT | 角色职责 |

### 4.16 guild_rank (公会等级表)

定义公会等级权限。

| 字段 | 类型 | 说明 |
|------|------|------|
| guildid | INT | 公会ID |
| rid | TINYINT | 等级ID |
| rname | VARCHAR(20) | 等级名称 |
| rights | INT | 权限标志 |
| BankMoneyPerDay | INT | 每日银行金币限额 |

---

## 五、acore_world 数据库 (续)

### 5.1 waypoint_data (路径点数据表)

定义生物移动路径点。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 生物GUID |
| point | INT | 路径点序号 |
| position_x | FLOAT | X坐标 |
| position_y | FLOAT | Y坐标 |
| position_z | FLOAT | Z坐标 |
| orientation | FLOAT | 朝向 |
| delay | INT | 等待时间(毫秒) |
| move_type | INT | 移动类型 |
| action | INT | 触发动作 |
| action_chance | SMALLINT | 动作触发概率 |
| wpguid | INT | 路径点GUID |

### 5.2 creature_text (生物文本表)

存储生物对话文本。

| 字段 | 类型 | 说明 |
|------|------|------|
| CreatureID | INT | 生物模板ID |
| GroupID | TINYINT | 文本组ID |
| ID | TINYINT | 文本ID |
| Text | LONGTEXT | 对话内容 |
| Type | TINYINT | 文本类型 |
| Language | TINYINT | 语言ID |
| Probability | FLOAT | 触发概率 |
| Emote | INT | 表情ID |
| Duration | INT | 持续时间 |
| Sound | INT | 音效ID |
| BroadcastTextId | INT | 广播文本ID |
| TextRange | TINYINT | 文本范围 |

### 5.3 gossip_menu_option (对话选项表)

定义NPC对话选项。

| 字段 | 类型 | 说明 |
|------|------|------|
| MenuID | INT | 菜单ID |
| OptionID | SMALLINT | 选项ID |
| OptionIcon | INT | 选项图标 |
| OptionText | TEXT | 选项文本 |
| OptionBroadcastTextID | INT | 选项广播文本ID |
| OptionType | TINYINT | 选项类型 |
| OptionNpcFlag | INT | NPC标志 |
| ActionMenuID | INT | 动作菜单ID |
| ActionPoiID | INT | 动作POI ID |
| BoxCoded | TINYINT | 是否需要输入验证码 |
| BoxMoney | INT | 需要金额 |
| BoxText | TEXT | 输入框文本 |
| BoxBroadcastTextID | INT | 输入框广播文本ID |
| VerifiedBuild | INT | 验证版本 |

### 5.4 game_event (游戏事件表)

定义服务器游戏事件。

| 字段 | 类型 | 说明 |
|------|------|------|
| eventEntry | TINYINT | 事件ID，主键 |
| start_time | TIMESTAMP | 开始时间 |
| end_time | TIMESTAMP | 结束时间 |
| occurence | BIGINT | 事件周期(分钟) |
| length | BIGINT | 事件持续时间(分钟) |
| holiday | INT | 假日ID |
| holidayStage | TINYINT | 假日阶段 |
| description | VARCHAR(255) | 事件描述 |
| world_event | TINYINT | 是否世界事件 (0/1) |
| announce | TINYINT | 公告级别 (0/1/2) |

### 5.5 instance_template (副本模板表)

定义副本实例模板。

| 字段 | 类型 | 说明 |
|------|------|------|
| map | SMALLINT | 地图ID，主键 |
| parent | SMALLINT | 父地图ID |
| script | VARCHAR(128) | 关联脚本 |
| allowMount | TINYINT | 是否允许骑乘坐骑 |

### 5.6 disables (禁用表)

存储被禁用的功能条目。

| 字段 | 类型 | 说明 |
|------|------|------|
| sourceType | INT | 禁用来源类型 |
| entry | INT | 禁用条目ID |
| flags | TINYINT | 禁用标志 |
| params_0 | VARCHAR(255) | 参数0 |
| params_1 | VARCHAR(255) | 参数1 |
| comment | VARCHAR(255) | 备注说明 |

### 5.7 spell_linked_spell (法术联动表)

定义法术触发联动关系。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_trigger | INT | 触发法术ID |
| spell_effect | INT | 效果法术ID |
| type | TINYINT | 联动类型 |
| comment | TEXT | 备注说明 |

### 5.8 creature_movement_override (生物移动覆盖表)

覆盖生物默认移动行为。

| 字段 | 类型 | 说明 |
|------|------|------|
| SpawnId | INT | 生物生成ID，主键 |
| Ground | TINYINT | 地面移动 (0/1/2) |
| Swim | TINYINT | 水下移动 |
| Flight | TINYINT | 飞行移动 |
| Rooted | TINYINT | 是否定身 |
| Chase | TINYINT | 追击移动 |
| Random | TINYINT | 随机移动 |
| InteractionPauseTimer | INT | 交互暂停时间(毫秒) |

### 5.9 acore_string (服务器字符串表)

存储服务器使用的多语言字符串，用于命令输出和系统消息。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 字符串ID，主键 |
| content_default | TEXT | 默认语言文本 |
| locale_koKR | TEXT | 韩语文本 |
| locale_frFR | TEXT | 法语文本 |
| locale_deDE | TEXT | 德语文本 |
| locale_zhCN | TEXT | 简体中文文本 |
| locale_zhTW | TEXT | 繁体中文文本 |
| locale_esES | TEXT | 西班牙语文本 |
| locale_esMX | TEXT | 墨西哥西班牙语文本 |
| locale_ruRU | TEXT | 俄语文本 |

### 5.10 npc_text (NPC文本表)

存储NPC对话文本，支持多个文本变体和广播文本引用。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 文本ID，主键 |
| text0_0 ~ text7_0 | LONGTEXT | 第0-7组默认文本 |
| text0_1 ~ text7_1 | LONGTEXT | 第0-7组女性文本 |
| BroadcastTextID0 ~ 7 | INT | 对应广播文本ID |
| lang0 ~ 7 | TINYINT | 语言ID |
| Probability0 ~ 7 | FLOAT | 触发概率 |
| em0_0 ~ em7_5 | SMALLINT | 表情ID (0-5) |
| VerifiedBuild | INT | 验证版本 |

### 5.11 quest_template_addon (任务模板附加表)

存储任务的附加信息，包括前置/后续任务、技能要求和声望条件。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 任务ID，主键 (对应quest_template) |
| MaxLevel | TINYINT | 最大可接任务等级 |
| AllowableClasses | INT | 允许的职业掩码 |
| SourceSpellID | INT | 任务给予时施放的法术 |
| PrevQuestID | INT | 前置任务ID (负值表示排除) |
| NextQuestID | INT | 下一任务ID |
| ExclusiveGroup | INT | 独占任务组 |
| BreadcrumbForQuestId | INT | 面包屑任务ID |
| RewardMailTemplateID | INT | 奖励邮件模板ID |
| RewardMailDelay | INT | 奖励邮件延迟(秒) |
| RequiredSkillID | SMALLINT | 需要专业技能ID |
| RequiredSkillPoints | SMALLINT | 需要专业技能点数 |
| RequiredMinRepFaction | SMALLINT | 最低声望阵营ID |
| RequiredMaxRepFaction | SMALLINT | 最高声望阵营ID |
| RequiredMinRepValue | INT | 最低声望值 |
| RequiredMaxRepValue | INT | 最高声望值 |
| ProvidedItemCount | TINYINT | 提供物品数量 |
| SpecialFlags | INT | 特殊标志 |

### 5.12 smart_scripts (智能脚本表)

存储SMART AI脚本，用于控制生物和游戏对象的智能行为。

| 字段 | 类型 | 说明 |
|------|------|------|
| entryorguid | INT | 源GUID或条目ID |
| source_type | TINYINT | 事件源类型 (0=CREATURE, 1=GAMEOBJECT等) |
| id | SMALLINT | 脚本ID |
| link | SMALLINT | 链接ID |
| event_type | TINYINT | 触发事件类型 |
| event_phase_mask | SMALLINT | 事件阶段掩码 |
| event_chance | TINYINT | 触发概率 (0-100) |
| event_flags | SMALLINT | 事件标志 |
| event_param1 ~ 6 | INT | 事件参数1-6 |
| action_type | TINYINT | 动作类型 |
| action_param1 ~ 6 | INT | 动作参数1-6 |
| target_type | TINYINT | 目标类型 |
| target_param1 ~ 4 | INT | 目标参数1-4 |
| target_x | FLOAT | 目标X坐标 |
| target_y | FLOAT | 目标Y坐标 |
| target_z | FLOAT | 目标Z坐标 |
| target_o | FLOAT | 目标朝向 |
| comment | TEXT | 脚本注释说明 |

### 5.13 creature_loot_template (生物掉落模板表)

定义生物死亡时的掉落物品。

| 字段 | 类型 | 说明 |
|------|------|------|
| Entry | INT | 生物模板ID |
| Item | INT | 物品ID |
| Reference | INT | 引用掉落ID (非0时引用其他掉落表) |
| Chance | FLOAT | 掉落概率 (0-100) |
| QuestRequired | TINYINT | 是否任务物品 |
| LootMode | SMALLINT | 掉落模式 |
| GroupId | TINYINT | 掉落组ID |
| MinCount | TINYINT | 最小掉落数量 |
| MaxCount | TINYINT | 最大掉落数量 |
| Comment | VARCHAR(255) | 备注说明 |

### 5.14 gameobject_loot_template (游戏对象掉落模板表)

定义游戏对象(如箱子、尸体)被打开时的掉落物品。

| 字段 | 类型 | 说明 |
|------|------|------|
| Entry | INT | 游戏对象模板ID |
| Item | INT | 物品ID |
| Reference | INT | 引用掉落ID |
| Chance | FLOAT | 掉落概率 |
| QuestRequired | TINYINT | 是否任务物品 |
| LootMode | SMALLINT | 掉落模式 |
| GroupId | TINYINT | 掉落组ID |
| MinCount | TINYINT | 最小数量 |
| MaxCount | TINYINT | 最大数量 |
| Comment | VARCHAR(255) | 备注说明 |

### 5.15 spell_dbc (法术数据库表)

存储法术的完整定义数据，与客户端DBC文件对应。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 法术ID，主键 |
| Category ~ AttributesEx7 | INT | 分类、驱散类型、机械师、各种属性标志 |
| ShapeshiftMask | BIGINT | 变形状态掩码 |
| ShapeshiftExclude | BIGINT | 变形排除掩码 |
| Targets | INT | 目标类型 |
| TargetCreatureType | INT | 目标生物类型 |
| RequiresSpellFocus | INT | 需要SpellFocus |
| CasterAuraState ~ ExcludeTargetAuraSpell | INT | 施法者/目标光环状态 |
| CastingTimeIndex ~ ChannelInterruptFlags | INT | 施法时间和中断标志 |
| ProcTypeMask ~ ProcCharges | INT | 触发相关 |
| MaxLevel ~ SpellLevel | INT | 等级相关 |
| DurationIndex | INT | 持续时间索引 |
| PowerType ~ ManaPerSecondPerLevel | INT | 能量消耗相关 |
| RangeIndex | INT | 范围索引 |
| Speed | FLOAT | 飞行速度 |
| Totem_1 ~ Totem_2 | INT | 图腾需求 |
| Reagent_1 ~ Reagent_8 | INT | 试剂ID |
| ReagentCount_1 ~ 8 | INT | 试剂数量 |
| EquippedItemClass | INT | 需求装备类型 |
| Effect_1 ~ 3 | INT | 效果类型 |
| EffectDieSides_1 ~ 3 | INT | 效果骰子面数 |
| EffectBaseDice_1 ~ 3 | INT | 效果基础值 |

### 5.16 broadcast_text (广播文本表)

存储游戏中的广播文本，用于NPC对话、系统消息等，支持多语言和表情动画。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 广播文本ID，主键 |
| LanguageID | INT | 语言ID |
| MaleText | LONGTEXT | 男性文本 |
| FemaleText | LONGTEXT | 女性文本 |
| EmoteID1 ~ 3 | INT | 表情ID 1-3 |
| EmoteDelay1 ~ 3 | INT | 表情延迟1-3 |
| SoundEntriesId | INT | 音效ID |
| EmotesID | INT | 表情组ID |
| Flags | INT | 标志 |
| VerifiedBuild | SMALLINT | 验证版本 |

---

### 5.17 achievement_dbc (成就数据库表)

存储游戏成就定义数据，与客户端DBC文件对应。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 成就ID，主键 |
| Faction | INT | 阵营限制 (-1=双方, 0=联盟, 1=部落) |
| Instance_Id | INT | 副本ID关联 |
| Supercedes | INT | 前置成就ID |
| Title_Lang_xx | VARCHAR(100) | 各语言成就标题 |
| Description_Lang_xx | VARCHAR(200) | 各语言成就描述 |
| Category | INT | 成就分类 |
| Points | INT | 成就点数 |
| Ui_Order | INT | UI显示顺序 |
| Flags | INT | 成就标志 |
| IconID | INT | 图标ID |
| Reward_Lang_xx | VARCHAR(100) | 各语言奖励文本 |

### 5.18 chrclasses_dbc (职业数据库表)

存储游戏职业定义数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 职业ID，主键 |
| Field01 | INT | 职业字段数据 |
| DisplayPower | INT | 显示的能量类型 |
| PetNameToken | INT | 宠物名称标记 |
| Name_Lang_xx | VARCHAR(100) | 各语言职业名称 |
| Name_Female_Lang_xx | VARCHAR(100) | 各语言女性角色名 |
| Name_Male_Lang_xx | VARCHAR(100) | 各语言男性角色名 |
| SpellIcon | INT | 法术图标ID |

### 5.19 chrraces_dbc (种族数据库表)

存储游戏种族定义数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 种族ID，主键 |
| Flags | INT | 种族标志 |
| FactionID | INT | 所属阵营 (Alliance/Horde) |
| ExplorationSoundID | INT | 探索音效ID |
| MaleDisplayId | INT | 男性模型ID |
| FemaleDisplayId | INT | 女性模型ID |
| ClientPrefix | VARCHAR(100) | 客户端前缀 |
| BaseLanguage | INT | 基础语言 |
| CreatureType | INT | 生物类型 |
| ResSicknessSpellID | INT | 复活疾病法术ID |
| SplashSoundID | INT | 溅落音效ID |
| CinematicSequenceID | INT | 电影序列ID |
| Name_Lang_xx | VARCHAR(100) | 各语言种族名称 |

### 5.20 faction_dbc (阵营数据库表)

存储游戏阵营定义数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 阵营ID，主键 |
| ReputationIndex | INT | 声望索引 |
| ReputationRaceMask_1~4 | INT | 各阵营种族掩码 |
| ReputationClassMask_1~4 | INT | 各阵营职业掩码 |
| ReputationBase_1~4 | INT | 各阵营基础声望 |
| ReputationFlags_1~4 | INT | 各阵营声望标志 |
| ParentFactionID | INT | 父阵营ID |
| ParentFactionMod_1~2 | FLOAT | 父阵营修正值 |
| ParentFactionCap_1~2 | INT | 父阵营上限 |
| Name_Lang_xx | VARCHAR(100) | 各语言阵营名称 |

### 5.21 item_template (物品模板表)

定义所有游戏物品的模板数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 物品ID，主键 |
| class | TINYINT | 物品类别 |
| subclass | TINYINT | 物品子类别 |
| name | VARCHAR(255) | 物品名称 |
| displayid | INT | 显示模型ID |
| Quality | TINYINT | 品质等级 (0-7) |
| Flags | INT | 物品标志 |
| FlagsExtra | INT | 额外标志 |
| BuyPrice | BIGINT | 购买价格 |
| SellPrice | INT | 出售价格 |
| InventoryType | TINYINT | 装备槽位类型 |
| AllowableClass | INT | 允许的职业掩码 |
| AllowableRace | INT | 允许的种族掩码 |
| ItemLevel | SMALLINT | 物品等级 |
| RequiredLevel | TINYINT | 需求等级 |
| RequiredSkill | SMALLINT | 需求技能 |
| RequiredSkillRank | SMALLINT | 需求技能等级 |
| RequiredReputationFaction | SMALLINT | 需求阵营 |
| RequiredReputationRank | SMALLINT | 需求声望等级 |
| maxcount | INT | 最大堆叠数量 |
| stackable | INT | 堆叠数量 |
| stat_type1~10 | TINYINT | 属性类型1-10 |
| stat_value1~10 | INT | 属性值1-10 |
| dmg_min1~2 | FLOAT | 伤害最小值1-2 |
| dmg_max1~2 | FLOAT | 伤害最大值1-2 |
| dmg_type1~2 | TINYINT | 伤害类型1-2 |
| armor | INT | 护甲值 |
| holy_res~arcane_res | SMALLINT | 各类抗性 |

### 5.22 quest_template (任务模板表)

定义所有任务的模板数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 任务ID，主键 |
| QuestType | TINYINT | 任务类型 |
| QuestLevel | SMALLINT | 任务等级 |
| MinLevel | TINYINT | 最低等级 |
| QuestSortID | SMALLINT | 任务分类ID |
| QuestInfoID | TINYINT | 任务信息类型 |
| RequiredFactionId1~2 | SMALLINT | 需求阵营ID |
| RequiredFactionValue1~2 | INT | 需求阵营声望值 |
| RewardMoney | INT | 奖励金钱 |
| RewardHonor | INT | 奖励荣誉 |
| StartItem | INT | 起始物品ID |
| Flags | INT | 任务标志 |
| RewardItem1~4 | INT | 奖励物品ID |
| RewardAmount1~4 | SMALLINT | 奖励物品数量 |
| RewardChoiceItemID1~6 | INT | 可选奖励物品ID |
| RewardChoiceItemQuantity1~6 | SMALLINT | 可选奖励物品数量 |
| POIContinent | SMALLINT | POI所在地图 |
| POIx~y | FLOAT | POI坐标 |
| RequiredNpcOrGo1~4 | INT | 需求NPC或游戏对象 |
| RequiredNpcOrGoCount1~4 | SMALLINT | 需求数量 |
| RequiredSpellCast1~4 | INT | 需求施放的法术 |

---

### 5.23 creature_template (生物模板表)

定义所有生物/NPC的模板数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 生物模板ID，主键 |
| difficulty_entry_1~3 | INT | 不同难度级别的条目ID |
| KillCredit1~2 | INT | 击杀积分NPC |
| name | CHAR(100) | 生物名称 |
| subname | CHAR(100) | 副名称/称号 |
| gossip_menu_id | INT | 对话菜单ID |
| minlevel~maxlevel | TINYINT | 最小/最大等级 |
| exp | SMALLINT | 经验值标志 |
| faction | SMALLINT | 所属阵营 |
| npcflag | INT | NPC标志 |
| speed_walk~flight | FLOAT | 移动速度 |
| detection_range | FLOAT | 探测范围 |
| scale | FLOAT | 模型缩放 |
| rank | TINYINT | 等级 (0=普通, 1=精英, 2=稀有精英, 3=世界BOSS) |
| dmgschool | TINYINT | 伤害类型 |
| DamageModifier | FLOAT | 伤害修正 |
| BaseAttackTime~RangeAttackTime | INT | 攻击时间(毫秒) |
| unit_class | TINYINT | 单位职业 (1=战士, 2=圣骑士等) |
| unit_flags~2 | INT | 单位标志 |
| family | TINYINT | 生物家族 |
| type | TINYINT | 生物类型 |
| type_flags | INT | 类型标志 |
| lootid~skinloot | INT | 掉落/扒窃/剥皮模板ID |
| PetSpellDataId | INT | 宠物法术数据ID |
| VehicleId | INT | 载具ID |
| mingold~maxgold | INT | 金币掉落范围 |
| AIName | CHAR(64) | AI名称 |
| MovementType | TINYINT | 移动类型 |
| HoverHeight | FLOAT | 悬停高度 |
| HealthModifier~ManaModifier | FLOAT | 生命/法力修正 |
| mechanic_immune_mask | INT | 免疫机制掩码 |
| spell_school_immune_mask | INT | 法术系免疫掩码 |
| ScriptName | CHAR(64) | 关联脚本名称 |

### 5.24 skillline_dbc (技能线数据库表)

存储专业技能和技能线定义数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 技能线ID，主键 |
| CategoryID | INT | 所属分类ID |
| SkillCostsID | INT | 技能成本ID |
| DisplayName_Lang_xx | VARCHAR(100) | 各语言显示名称 |
| Description_Lang_xx | VARCHAR(300) | 各语言描述 |
| Flags | INT | 技能线标志 |

### 5.25 map_dbc (地图数据库表)

存储游戏世界地图定义数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 地图ID，主键 |
| Directory | VARCHAR(100) | 地图目录名 |
| InstanceType | INT | 实例类型 (0=服务器地图, 1=副本, 2=战场, 4=竞技场) |
| Flags | INT | 地图标志 |
| PVP | INT | PVP标志 |
| MapName_Lang_xx | VARCHAR(100) | 各语言地图名称 |
| AreaTableID | INT | 区域表ID |
| MapDescription_Lang_xx | TEXT | 各语言地图描述 |
| LoadingScreen | INT | 加载画面ID |
| MinimapIconScale | FLOAT | 小地图图标缩放 |
| corpse | FLOAT | 尸体坐标 |
| corpseMap | INT | 尸体所在地图 |

### 5.26 battleground_template (战场模板表)

定义所有战场的模板数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 战场ID，主键 |
| MinPlayersPerTeam | SMALLINT | 每队最少玩家数 |
| MaxPlayersPerTeam | SMALLINT | 每队最多玩家数 |
| MinLvl | TINYINT | 最低等级 |
| MaxLvl | TINYINT | 最高等级 |
| AllianceStartLoc~O | INT/FLOAT | 联盟起点位置和朝向 |
| HordeStartLoc~O | INT/FLOAT | 部落起点位置和朝向 |
| StartMaxDist | FLOAT | 起点最大距离 |
| Weight | TINYINT | 权重（随机战场选择权重） |
| ScriptName | CHAR(64) | 关联脚本 |
| Comment | CHAR(38) | 备注说明 |

---

### 5.27 command (命令表)

存储所有游戏内命令的定义。

| 字段 | 类型 | 说明 |
|------|------|------|
| name | VARCHAR(50) | 命令名称，主键 |
| security | TINYINT | 所需安全级别 (0=玩家, 1=GM, 2=高级GM, 3=管理员) |
| help | LONGTEXT | 命令帮助文本 |

### 5.28 areatable_dbc (区域数据库表)

存储游戏世界区域定义数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 区域ID，主键 |
| ContinentID | INT | 所属大陆ID |
| ParentAreaID | INT | 父区域ID |
| AreaBit | INT | 区域比特 |
| Flags | INT | 区域标志 |
| SoundProviderPref | INT | 音效偏好 |
| AmbienceID | INT | 环境音效ID |
| ZoneMusic | INT | 区域音乐ID |
| IntroSound | INT | 进场音效ID |
| ExplorationLevel | INT | 探索等级 |
| AreaName_Lang_xx | VARCHAR(100) | 各语言区域名称 |
| FactionGroupMask | INT | 阵营组掩码 |
| LiquidTypeID_1~4 | INT | 液体类型ID |
| MinElevation | FLOAT | 最小海拔 |
| Lightid | INT | 光照ID |

### 5.29 talent_dbc (天赋数据库表)

存储职业天赋定义数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 天赋ID，主键 |
| TabID | INT | 天赋标签页ID (对应职业天赋树) |
| TierID | INT | 天赋层 (0-9) |
| ColumnIndex | INT | 列索引 (0-3) |
| SpellRank_1~9 | INT | 各等级天赋法术ID |
| PrereqTalent_1~3 | INT | 前置天赋ID |
| PrereqRank_1~3 | INT | 前置天赋等级 |
| Flags | INT | 天赋标志 |
| RequiredSpellID | INT | 需求法术ID |
| CategoryMask_1~2 | INT | 分类掩码 |

---

### 5.30 transportanimation_dbc (交通动画数据库表)

定义交通工具的动画节点位置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| TransportID | INT | 交通工具ID |
| TimeIndex | INT | 时间索引 |
| PosX~Z | FLOAT | 位置坐标 |
| SequenceID | INT | 序列ID |

### 5.31 vehicle_dbc (载具数据库表)

存储载具定义数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 载具ID，主键 |
| Flags | INT | 载具标志 |
| TurnSpeed~PitchSpeed | FLOAT | 转弯/俯仰速度 |
| PitchMin~Max | FLOAT | 俯仰角度范围 |
| SeatID_1~8 | INT | 座位ID |
| MouseLookOffsetPitch | FLOAT | 鼠标视角俯仰偏移 |
| CameraFadeDistScalarMin~Max | FLOAT | 相机淡出距离 |
| CameraPitchOffset | FLOAT | 相机俯仰偏移 |
| FacingLimitRight~Left | FLOAT | 视角限制 |
| MsslTrgt* | Various | 导弹目标相关参数 |
| VehicleUIIndicatorID | INT | UI指示器ID |

### 5.32 item_dbc (物品数据库表)

存储物品基本类别定义数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 物品ID，主键 |
| ClassID | INT | 物品类别 |
| SubclassID | INT | 物品子类别 |
| Sound_Override_Subclassid | INT | 声音覆盖子类别 |
| Material | INT | 材质 |
| DisplayInfoID | INT | 显示信息ID |
| InventoryType | INT | 装备槽位类型 |
| SheatheType | INT | 收起类型 |

---

### 5.33 emotes_dbc (表情数据库表)

存储游戏内表情/动作定义数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 表情ID，主键 |
| EmoteSlashCommand | VARCHAR(100) | 斜杠命令 |
| AnimID | INT | 动画ID |
| EmoteFlags | INT | 表情标志 |
| EmoteSpecProc | INT | 特殊处理ID |
| EventSoundID | INT | 事件音效ID |

### 5.34 soundentries_dbc (音效数据库表)

存储游戏音效定义数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 音效ID，主键 |
| SoundType | INT | 音效类型 |
| Name | VARCHAR(100) | 音效名称 |
| File_1~10 | VARCHAR(100) | 音效文件名 |
| Freq_1~10 | INT | 音效频率 |
| DirectoryBase | VARCHAR(100) | 目录基础路径 |
| Volumefloat | FLOAT | 音量 |
| Flags | INT | 标志 |
| MinDistance | FLOAT | 最小距离 |
| DistanceCutoff | FLOAT | 距离截止值 |
| EAXDef | INT | EAX定义 |

### 5.35 creaturefamily_dbc (生物家族数据库表)

存储生物家族/类型定义数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 家族ID，主键 |
| MinScale~MaxScale | FLOAT | 最小/最大缩放 |
| MinScaleLevel~MaxScaleLevel | INT | 缩放对应等级 |
| SkillLine_1~2 | INT | 技能线 |
| PetFoodMask | INT | 宠物食物掩码 |
| PetTalentType | INT | 宠物天赋类型 |
| CategoryEnumID | INT | 分类枚举ID |
| Name_Lang_xx | VARCHAR(100) | 各语言家族名称 |
| IconFile | VARCHAR(100) | 图标文件 |

---

### 5.36 page_text (书籍页面文本表)

存储可阅读物品（如书籍、卷轴）的页面文本内容。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 页面ID，主键 |
| Text | LONGTEXT | 页面文本内容 |
| NextPageID | INT | 下一页ID (0表示最后一页) |
| VerifiedBuild | INT | 验证版本 |

### 5.37 game_tele (游戏传送表)

存储游戏中可使用的传送光柱位置信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 传送ID，主键 |
| position_x~z | FLOAT | 目标位置坐标 |
| orientation | FLOAT | 朝向角度 |
| map | SMALLINT | 地图ID |
| name | VARCHAR(100) | 传送点名称 |

### 5.38 points_of_interest (兴趣点表)

存储游戏世界中的兴趣点(POI)位置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | POI ID，主键 |
| PositionX | FLOAT | X坐标 |
| PositionY | FLOAT | Y坐标 |
| PositionZ | FLOAT | Z坐标 |
| Icon | INT | 图标ID |
| Flags | INT | 标志 |
| Importance | INT | 重要性 |
| Name | VARCHAR(100) | POI名称 |

### 5.39 weather (天气表)

定义各区域的天气系统。

| 字段 | 类型 | 说明 |
|------|------|------|
| zone | INT | 区域ID，主键 |
| season | TINYINT | 季节 |
| weathertype | INT | 天气类型 |
| severity | INT | 严重程度 |
| temp_min~max | INT | 温度范围 |
| rain_min~max | INT | 降雨范围 |

---

### 5.40 spell_area (法术区域关联表)

定义法术与区域的关联关系，用于区域增益等。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell | INT | 法术ID |
| area | INT | 区域ID |
| quest_start | INT | 起始任务ID |
| quest_end | INT | 结束任务ID |
| aura_spell | INT | 光环法术ID |
| racemask | INT | 种族掩码 |
| gender | TINYINT | 性别 (0=男性, 1=女性, 2=通用) |
| autocast | TINYINT | 是否自动施放 |
| quest_start_status | INT | 起始任务状态 |
| quest_end_status | INT | 结束任务状态 |

### 5.41 spell_linked_spell (法术联动表)

定义法术触发联动关系。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_trigger | INT | 触发法术ID |
| spell_effect | INT | 效果法术ID |
| type | TINYINT | 联动类型 |
| comment | TEXT | 备注说明 |

### 5.42 spell_threat (法术威胁值表)

存储法术产生的威胁值数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 法术ID，主键 |
|threat | INT | 威胁值 |
| effects | INT | 效果掩码 |
| scripted_target | INT | 脚本目标 |

---

### 5.43 spell_threat (法术威胁值表)

存储法术产生的威胁值数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 法术ID，主键 |
| flatMod | INT | 固定威胁值修正 |
| pctMod | FLOAT | 威胁值百分比修正 |
| apPctMod | FLOAT | 攻击强度百分比修正 |

### 5.44 spell_proc_event (法术触发事件表)

定义法术触发事件的条件和参数。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 法术ID，主键 |
| SchoolMask | TINYINT | 法术学派掩码 |
| SpellFamilyName | SMALLINT | 法术家族名称 |
| SpellFamilyMask0~2 | INT | 法术家族掩码 |
| procFlags | INT | 触发标志 |
| procEx | INT | 触发排除标志 |
| procPhase | INT | 触发阶段 |
| pmmRate | FLOAT | 每分钟触发次数 |
| CustomChance | FLOAT | 自定义触发概率 |
| Cooldown | INT | 冷却时间(毫秒) |

### 5.45 spell_group (法术分组表)

定义法术分组，用于分组互斥等。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 分组ID |
| spell_id | INT | 法术ID |

### 5.46 spell_ranks (法术等级表)

存储法术等级序列关系。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_id | INT | 法术ID |
| rank | INT | 等级 |

### 5.47 spell_required (法术前置需求表)

定义学习法术的前置要求。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_id | INT | 法术ID |
| req_spell | INT | 需求法术ID |

---

### 5.48 spell_ranks (法术等级表)

存储法术等级序列关系。

| 字段 | 类型 | 说明 |
|------|------|------|
| first_spell_id | INT | 起始法术ID |
| spell_id | INT | 法术ID |
| rank | TINYINT | 等级序号 |

### 5.49 spell_required (法术前置需求表)

定义学习法术的前置要求。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_id | INT | 法术ID |
| req_spell | INT | 需求法术ID |

### 5.50 spell_script_names (法术脚本名称表)

关联法术与自定义脚本。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_id | INT | 法术ID |
| ScriptName | VARCHAR(64) | 脚本名称 |

### 5.51 spell_scripts (法术脚本表)

存储法术触发脚本数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | ID |
| spellId | INT | 法术ID |
| effectId | INT | 效果ID |
| script | VARCHAR(64) | 脚本名称 |

---

### 5.52 quest_greeting (任务问候语表)

存储NPC给予任务前的问候语。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 任务ID |
| type | TINYINT | 类型 |
| GreetEmoteType | SMALLINT | 问候表情类型 |
| GreetEmoteDelay | INT | 问候表情延迟 |
| Greeting | TEXT | 问候文本 |
| VerifiedBuild | INT | 验证版本 |

### 5.53 quest_offer_reward (任务提供奖励表)

存储NPC在任务完成时提供的奖励文本。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 任务ID |
| Emote1~4 | SMALLINT | 完成奖励时的表情1-4 |
| EmoteDelay1~4 | INT | 表情延迟1-4 |
| RewardText | TEXT | 奖励文本 |
| VerifiedBuild | INT | 验证版本 |

### 5.54 quest_request_items (任务需求物品表)

存储NPC请求物品时的文本。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 任务ID |
| EmoteType | SMALLINT | 表情类型 |
| EmoteDelay | INT | 表情延迟 |
| RequestItemsText | TEXT | 请求物品文本 |
| VerifiedBuild | INT | 验证版本 |

---

### 5.55 quest_request_items (任务需求物品表)

存储NPC请求物品时的文本。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 任务ID |
| EmoteOnComplete | SMALLINT | 完成时的表情 |
| EmoteOnIncomplete | SMALLINT | 未完成时的表情 |
| CompletionText | TEXT | 请求物品文本 |
| VerifiedBuild | INT | 验证版本 |

### 5.56 graveyard_zone (墓地区域表)

定义各区域的墓地位置信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID |
| GhostZone | INT | 鬼魂区域ID |
| Faction | SMALLINT | 阵营 (0=通用, 67=部落, 469=联盟) |
| Comment | TEXT | 备注说明 |

### 5.57 worldmapoverlay (世界地图覆盖表)

存储世界地图上的覆盖区域信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| mapId | INT | 地图ID |
| areaId | INT | 区域ID |
| method | INT | 方法 |
| Comment | VARCHAR(255) | 备注说明 |

---

### 5.58 worldmapoverlay_dbc (世界地图覆盖数据库表)

存储世界地图上的覆盖区域信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| MapAreaID | INT | 地图区域ID |
| AreaID_1~4 | INT | 关联区域ID |
| MapPointX~Y | INT | 地图点坐标 |
| TextureName | VARCHAR(100) | 纹理名称 |
| TextureWidth~Height | INT | 纹理尺寸 |
| OffsetX~Y | INT | 偏移量 |
| HitRectTop~Right | INT | 命中矩形区域 |

### 5.59 worldmaparea_dbc (世界地图区域数据库表)

存储世界地图区域定义数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| MapID | INT | 地图ID |
| AreaID | INT | 区域ID |
| AreaName | VARCHAR(100) | 区域名称 |
| LocLeft~Bottom | FLOAT | 区域边界坐标 |
| DisplayMapID | INT | 显示地图ID |
| DefaultDungeonFloor | INT | 默认地下城楼层 |
| ParentWorldMapID | INT | 父地图ID |

### 5.60 worldmaparea (世界地图区域表)

定义世界地图区域配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| areaId | INT | 区域ID |
| mapId | INT | 地图ID |
| zoneId | INT | 区域ID |
| parentAreaId | INT | 父区域ID |
| samplingStep | INT | 采样步长 |

---

### 5.61 linked_respawn (链接刷新表)

定义生物/游戏对象的链接刷新关系。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 依赖生物/对象GUID |
| linkedGuid | INT | 主生物/对象GUID |
| linkType | TINYINT | 链接类型 |

### 5.62 creature_formations (生物编队表)

定义生物编队成员关系。

| 字段 | 类型 | 说明 |
|------|------|------|
| leaderGUID | INT | 队长GUID |
| memberGUID | INT | 成员GUID |
| dist | FLOAT | 距离 |
| angle | FLOAT | 角度 |
| groupAI | INT | 编队AI类型 |
| leader_spell | INT | 队长法术 |

---

### 5.63 quest_poi (任务兴趣点表)

存储任务在游戏内小地图/世界地图上显示的POI（兴趣点）信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| QuestID | INT | 任务ID |
| id | INT | POI点的唯一标识符 |
| ObjectiveIndex | INT | 目标索引，-1表示结束点 |
| MapID | INT | 所在地图ID |
| WorldMapAreaId | INT | 世界地图区域ID |
| Floor | INT | 楼层 |
| Priority | INT | 优先级 |
| Flags | INT | 标志位 |
| VerifiedBuild | INT | 验证的版本 |

---

### 5.64 quest_poi_points (任务兴趣点坐标表)

存储任务POI的具体坐标点。

| 字段 | 类型 | 说明 |
|------|------|------|
| QuestID | INT | 任务ID |
| Idx1 | INT | 第一层索引 |
| Idx2 | INT | 第二层索引 |
| X | INT | X坐标 |
| Y | INT | Y坐标 |
| VerifiedBuild | INT | 验证的版本 |

---

### 5.65 quest_mail_sender (任务邮件发送者表)

定义任务奖励邮件的发送NPC。

| 字段 | 类型 | 说明 |
|------|------|------|
| QuestId | INT | 任务ID |
| RewardMailSenderEntry | INT | 邮件发送者的NPC entry |

---

### 5.66 game_graveyard (墓地表)

存储墓地/复活点的位置信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 墓地ID |
| Map | INT | 地图ID |
| x | FLOAT | X坐标 |
| y | FLOAT | Y坐标 |
| z | FLOAT | Z坐标 |
| Comment | VARCHAR(255) | 备注说明 |

---

### 5.67 skill_discovery_template (技能发现模板表)

定义通过技能或物品触发发现的技能/配方。

| 字段 | 类型 | 说明 |
|------|------|------|
| spellId | INT | 可发现的法术ID |
| reqSpell | INT | 需求法术ID |
| reqSkillValue | INT | 需求技能值 |
| chance | FLOAT | 发现概率 |

---

### 5.68 trainer (训练师表)

存储训练师NPC的基本信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| Id | INT | 训练师ID |
| Type | TINYINT | 类型 (0=职业训练师, 1=专业训练师, 2=技能训练师) |
| Requirement | INT | 前置要求 |
| Greeting | MEDIUMTEXT | 训练师招呼语 |
| VerifiedBuild | INT | 验证的版本 |

---

### 5.69 trainer_spell (训练师法术表)

定义训练师可教授的法术及学习条件。

| 字段 | 类型 | 说明 |
|------|------|------|
| TrainerId | INT | 训练师ID |
| SpellId | INT | 法术ID |
| MoneyCost | INT | 训练费用 (铜币) |
| ReqSkillLine | INT | 需求技能线 |
| ReqSkillRank | INT | 需求技能等级 |
| ReqAbility1~3 | INT | 前置能力1~3 |
| ReqLevel | TINYINT | 需求等级 |
| VerifiedBuild | INT | 验证的版本 |

---

### 5.70 npc_trainer (NPC训练师法术表)

存储NPC训练师可教的法术列表。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | NPC entry |
| SpellID | INT | 法术ID |
| MoneyCost | INT | 费用 |
| ReqSkillLine | INT | 需求技能线 |
| ReqSkillRank | INT | 需求技能等级 |
| ReqLevel | INT | 需求等级 |
| ReqSpell | INT | 前置任务/条件 |

---

### 5.71 creature (生物实例表)

存储世界中已生成的生物实例数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 生物实例GUID，主键自增 |
| id1 | INT | 生物模板ID (entry) |
| id2 | INT | 生物模板ID 2 |
| id3 | INT | 生物模板ID 3 |
| map | SMALLINT | 所在地图ID |
| zoneId | SMALLINT | 区域ID |
| areaId | SMALLINT | 地区ID |
| spawnMask | TINYINT | 生成掩码 |
| phaseMask | INT | 相位掩码 |
| equipment_id | TINYINT | 装备模板ID |
| position_x | FLOAT | X坐标 |
| position_y | FLOAT | Y坐标 |
| position_z | FLOAT | Z坐标 |
| orientation | FLOAT | 朝向角度 |
| spawntimesecs | INT | 生成时间(秒) |
| wander_distance | FLOAT | 游荡距离 |
| currentwaypoint | INT | 当前路径点 |
| curhealth | INT | 当前生命值 |
| curmana | INT | 当前法力值 |
| MovementType | TINYINT | 移动类型 (0=静止, 1=随机, 2=路径) |
| npcflag | INT | NPC标志 |
| unit_flags | INT | 单元标志 |
| dynamicflags | INT | 动态标志 |
| ScriptName | CHAR(64) | 脚本名称 |
| VerifiedBuild | INT | 验证版本 |

---

### 5.72 gameobject (游戏对象实例表)

存储世界中已生成的游戏对象实例数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 游戏对象实例GUID，主键自增 |
| id | INT | 游戏对象模板ID |
| map | SMALLINT | 所在地图ID |
| zoneId | SMALLINT | 区域ID |
| areaId | SMALLINT | 地区ID |
| spawnMask | TINYINT | 生成掩码 |
| phaseMask | INT | 相位掩码 |
| position_x | FLOAT | X坐标 |
| position_y | FLOAT | Y坐标 |
| position_z | FLOAT | Z坐标 |
| orientation | FLOAT | 朝向角度 |
| rotation0~3 | FLOAT | 旋转四元数 |
| spawntimesecs | INT | 生成时间(秒) |
| animprogress | TINYINT | 动画进度 |
| state | TINYINT | 对象状态 |
| ScriptName | CHAR(64) | 脚本名称 |
| VerifiedBuild | INT | 验证版本 |
| Comment | TEXT | 备注 |

---

### 5.73 item_template (物品模板表)

定义所有物品的属性模板。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 物品ID，主键 |
| class | TINYINT | 物品类别 (0=消耗品, 1=容器, 2=武器, 3=护甲, 4= reagent, 5=商品, 12任务物品等) |
| subclass | TINYINT | 物品子类别 |
| SoundOverrideSubclass | INT | 声音覆盖 |
| name | VARCHAR(255) | 物品名称 |
| displayid | INT | 显示模型ID |
| Quality | TINYINT | 品质 (0=普通, 1=优秀, 2=精良, 3=稀有, 4=史诗, 5=传说, 6=神器) |
| Flags | INT | 全局标志 |
| FlagsExtra | INT | 额外标志 |
| BuyCount | TINYINT | 购买数量 |
| BuyPrice | BIGINT | 购买价格(铜币) |
| SellPrice | INT | 出售价格 |
| InventoryType | TINYINT | 装备位置 (0=无, 1=头部, 2=颈部, 3=肩部, 4=衬衫, 5=胸部, 6=腰部, 7=腿部, 8=脚, 9=手腕, 10=手, 11=戒指, 12=饰品, 13=单手, 14=盾牌, 15=远程, 16=背部, 17=双持, 18=公文包, 20=副手, 21=战袍, 22=三专, 23=宝袋) |
| AllowableClass | INT | 允许使用的职业 (-1=全部) |
| AllowableRace | INT | 允许使用的种族 (-1=全部) |
| ItemLevel | SMALLINT | 物品等级 |
| RequiredLevel | TINYINT | 需求等级 |
| RequiredSkill | SMALLINT | 需求技能 |
| RequiredSkillRank | SMALLINT | 需求技能等级 |
| requiredspell | INT | 需求法术 |
| requiredhonorrank | INT | 需求荣誉等级 |
| RequiredCityRank | INT | 需求城市等级 |
| RequiredReputationFaction | SMALLINT | 需求声望阵营 |
| RequiredReputationRank | SMALLINT | 需求声望等级 |
| maxcount | INT | 最大堆叠数量 |
| stackable | INT | 堆叠数量 (1=不可堆叠) |
| ContainerSlots | TINYINT | 容器槽位数 |
| stat_type1~10 | TINYINT | 属性类型1~10 |
| stat_value1~10 | INT | 属性值1~10 |
| ScalingStatDistribution | SMALLINT | 缩放属性分配 |
| ScalingStatValue | INT | 缩放属性值 |
| dmg_min1~2 | FLOAT | 伤害最小值1~2 |
| dmg_max1~2 | FLOAT | 伤害最大值1~2 |
| dmg_type1~2 | TINYINT | 伤害类型1~2 |
| armor | INT | 护甲值 |
| holy_res~arcane_res | SMALLINT | 神圣/火焰/自然/冰霜/暗影/奥术抗性 |
| delay | SMALLINT | 攻击间隔(毫秒) |
| ammo_type | TINYINT | 弹药类型 |
| RangedModRange | FLOAT | 远程修正范围 |
| spellid_1~5 | INT | 触发法术ID 1~5 |
| spelltrigger_1~5 | TINYINT | 触发类型 (0=使用, 1=装备, 2=命中, 3=周期) |
| spellcharges_1~5 | SMALLINT | 法术充能 |
| spellppmRate_1~5 | FLOAT | 每分钟触发概率 |
| spellcooldown_1~5 | INT | 法术冷却 |
| spellcategory_1~5 | SMALLINT | 法术分类 |
| spellcategorycooldown_1~5 | INT | 分类冷却 |
| bonding | TINYINT | 绑定类型 (0=无, 1=装备后绑定, 2=装备后绑定, 3=任务绑定, 4=使用后绑定) |
| description | VARCHAR(255) | 物品描述 |
| PageText | INT | 页文本ID |
| LanguageID | TINYINT | 语言ID |
| PageMaterial | TINYINT | 页材质 |
| startquest | INT | 起始任务ID |
| lockid | INT | 锁类型ID |
| Material | INT | 材质 |
| sheath | TINYINT | 鞘类型 |
| RandomProperty | INT | 随机属性ID |
| RandomSuffix | INT | 随机后缀ID |
| block | INT | 盾牌格挡值 |
| itemset | INT | 套装ID |
| MaxDurability | SMALLINT | 最大耐久度 |
| area | INT | 区域ID |
| Map | SMALLINT | 地图ID |
| BagFamily | INT | 背包家族 |
| TotemCategory | INT | 图腾分类 |
| socketColor_1~3 | TINYINT | 插槽颜色 |
| socketContent_1~3 | INT | 插槽内容 |
| socketBonus | INT | 插槽奖励 |
| GemProperties | INT | 宝石属性 |
| RequiredDisenchantSkill | SMALLINT | 需求分解技能 |
| ArmorDamageModifier | FLOAT | 护甲伤害修正 |
| duration | INT | 持续时间(秒) |
| ItemLimitCategory | SMALLINT | 物品限制分类 |
| HolidayId | INT | 假日ID |
| ScriptName | VARCHAR(64) | 脚本名称 |
| DisenchantID | INT | 分解配方ID |
| FoodType | TINYINT | 食物类型 |
| minMoneyLoot | INT | 最小金币掉落 |
| maxMoneyLoot | INT | 最大金币掉落 |
| flagsCustom | INT | 自定义标志 |
| VerifiedBuild | INT | 验证版本 |

---

### 5.74 creature_classlevelstats (生物等级属性表)

定义生物随等级和职业变化的属性。

| 字段 | 类型 | 说明 |
|------|------|------|
| level | TINYINT | 等级 |
| class | TINYINT | 职业/类型 |
| basehp0~2 | INT | 基础生命值 |
| basemana | INT | 基础法力值 |
| basearmor | INT | 基础护甲 |
| attackpower | INT | 攻击强度 |
| rangedattackpower | INT | 远程攻击强度 |
| damage_base | FLOAT | 基础伤害 |
| damage_exp1~2 | FLOAT | 扩展伤害 |
| Strength | INT | 力量 |
| Agility | INT | 敏捷 |
| Stamina | INT | 耐力 |
| Intellect | INT | 智力 |
| Spirit | INT | 精神 |
| comment | TEXT | 备注 |

---

### 5.75 playercreateinfo (玩家创建信息表)

定义每个种族/职业组合的初始创建位置。

| 字段 | 类型 | 说明 |
|------|------|------|
| race | TINYINT | 种族ID |
| class | TINYINT | 职业ID |
| map | SMALLINT | 初始地图ID |
| zone | INT | 初始区域ID |
| position_x | FLOAT | X坐标 |
| position_y | FLOAT | Y坐标 |
| position_z | FLOAT | Z坐标 |
| orientation | FLOAT | 朝向 |

---

### 5.76 outdoorpvp_template (户外PVP模板表)

定义户外PVP区域的脚本模板。

| 字段 | 类型 | 说明 |
|------|------|------|
| TypeId | TINYINT | 类型ID |
| ScriptName | CHAR(64) | 脚本名称 |
| comment | TEXT | 备注 |

---

### 5.77 creature_default_trainer (生物默认训练师表)

定义生物默认的训练师。

| 字段 | 类型 | 说明 |
|------|------|------|
| CreatureId | INT | 生物ID |
| TrainerId | INT | 训练师ID |

---

### 5.78 creature_questitem (生物任务物品表)

定义生物作为任务目标要求的物品或任务奖励。

| 字段 | 类型 | 说明 |
|------|------|------|
| CreatureEntry | INT | 生物ID |
| Idx | INT | 索引 |
| ItemId | INT | 物品ID |
| VerifiedBuild | INT | 验证版本 |

---

### 5.79 transportrotation_dbc (交通工具旋转表)

定义交通工具（如船、飞艇）的旋转动画数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 唯一标识符 |
| GameObjectsID | INT | 游戏对象ID |
| TimeIndex | INT | 时间索引 |
| RotX | FLOAT | X轴旋转 |
| RotY | FLOAT | Y轴旋转 |
| RotZ | FLOAT | Z轴旋转 |
| RotW | FLOAT | W轴旋转（四元数） |

---

### 5.80 game_event_arena_seasons (游戏事件竞技场赛季表)

关联游戏事件与竞技场赛季。

| 字段 | 类型 | 说明 |
|------|------|------|
| eventEntry | TINYINT | 游戏事件ID |
| season | TINYINT | 竞技场赛季编号 |

---

### 5.81 game_event_condition (游戏事件条件表)

定义游戏事件触发的前置条件。

| 字段 | 类型 | 说明 |
|------|------|------|
| eventEntry | TINYINT | 游戏事件ID |
| condition_id | INT | 条件ID |
| req_num | FLOAT | 所需数量 |
| max_world_state_field | SMALLINT | 最大世界状态字段 |
| done_world_state_field | SMALLINT | 完成世界状态字段 |
| description | VARCHAR(25) | 条件描述 |

---

### 5.82 pool_quest (任务池表)

定义任务池，将多个任务组成一个互斥池（一次只出现一个）。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 任务ID |
| pool_entry | INT | 池ID |
| description | VARCHAR(255) | 备注 |

---

### 5.83 player_factionchange_achievement (玩家阵营变更成就表)

定义阵营转换后联盟与部落成就的对应关系。

| 字段 | 类型 | 说明 |
|------|------|------|
| alliance_id | INT | 联盟成就ID |
| alliance_comment | TEXT | 联盟成就备注 |
| horde_id | INT | 部落成就ID |
| horde_comment | TEXT | 部落成就备注 |

---

### 5.84 spell_group_stack_rules (法术组堆叠规则表)

定义法术组的堆叠规则，控制同类buff/debuff如何相互作用。

| 字段 | 类型 | 说明 |
|------|------|------|
| group_id | INT | 法术组ID |
| stack_rule | TINYINT | 堆叠规则（0=无特殊规则，1=战斗药水，2=祝福类，3=debuff类，4=buff类） |
| description | VARCHAR(150) | 描述 |

---

### 5.85 spell_bonus_data (法术加成数据表)

存储法术的直接伤害加成、持续伤害加成和攻击强度加成系数。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 法术ID |
| direct_bonus | FLOAT | 直接伤害加成系数 |
| dot_bonus | FLOAT | 持续伤害加成系数 |
| ap_bonus | FLOAT | 攻击强度直接加成 |
| ap_dot_bonus | FLOAT | 攻击强度持续加成 |
| comments | VARCHAR(255) | 备注说明 |

---

### 5.86 spell_mixology (法术混合学表)

定义炼金术混合学天赋对药水效果的额外加成。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 法术ID |
| pctMod | FLOAT | 额外加成百分比（默认30） |

---

### 5.87 spell_enchant_proc_data (法术附魔触发数据表)

定义附魔触发效果的触发几率数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 附魔ID |
| customChance | INT | 自定义触发几率 |
| PPMChance | FLOAT | 每分钟触发次数(PPM) |
| procEx | INT | 触发效果掩码 |
| attributeMask | INT | 属性掩码 |

---

### 5.88 spell_custom_attr (法术自定义属性表)

为法术定义自定义属性，扩展默认的SpellInfo行为。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_id | INT | 法术ID |
| attributes | INT | 自定义属性标志 |

---

### 5.89 spell_proc (法术触发条件表)

定义法术触发的详细条件配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| SpellId | INT | 法术ID |
| SchoolMask | TINYINT | 学派掩码 |
| SpellFamilyName | SMALLINT | 法术家族名称 |
| SpellFamilyMask0~2 | INT | 法术家族掩码 |
| ProcFlags | INT | 触发标志 |
| SpellTypeMask | INT | 法术类型掩码 |
| SpellPhaseMask | INT | 法术阶段掩码 |
| HitMask | INT | 命中掩码 |
| AttributesMask | INT | 属性掩码 |
| DisableEffectsMask | INT | 禁用效果掩码 |
| ProcsPerMinute | FLOAT | 每分钟触发次数 |
| Chance | FLOAT | 触发几率 |
| Cooldown | INT | 冷却时间(毫秒) |
| Charges | TINYINT | 触发次数限制 |

---

### 5.90 powerdisplay_dbc (能量显示颜色表)

定义不同能量类型的显示颜色。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 唯一标识符 |
| ActualType | INT | 实际能量类型 |
| GlobalstringBaseTag | VARCHAR(100) | 全局字符串标签 |
| Red | TINYINT | 红色分量 |
| Green | TINYINT | 绿色分量 |
| Blue | TINYINT | 蓝色分量 |

---

### 5.91 player_factionchange_titles (玩家阵营变更称号表)

定义阵营转换后联盟与部落称号的对应关系。

| 字段 | 类型 | 说明 |
|------|------|------|
| alliance_id | INT | 联盟称号ID |
| alliance_comment | TEXT | 联盟称号备注 |
| horde_id | INT | 部落称号ID |
| horde_comment | TEXT | 部落称号备注 |

---

### 5.92 summonproperties_dbc (召唤属性表)

定义召唤物的属性，包括控制类型、阵营、标题和槽位。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 唯一标识符 |
| Control | INT | 控制类型 |
| Faction | INT | 阵营ID |
| Title | INT | 标题/类型 |
| Slot | INT | 槽位 |
| Flags | INT | 标志 |

---

### 5.93 vehicleseat_dbc (载具座位表)

定义载具（如骑士座骑、飞机）的座位配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 唯一标识符 |
| Flags | INT | 座位标志 |
| AttachmentID | INT | 附件ID |
| AttachmentOffsetX/Y/Z | FLOAT | 附件偏移坐标 |
| EnterPreDelay | FLOAT | 进入前延迟 |
| EnterSpeed | FLOAT | 进入速度 |
| EnterGravity | FLOAT | 进入重力 |
| EnterMinDuration | FLOAT | 最小进入持续时间 |
| EnterMaxDuration | FLOAT | 最大进入持续时间 |
| EnterMinArcHeight | FLOAT | 最小进入弧高 |
| EnterMaxArcHeight | FLOAT | 最大进入弧高 |
| EnterAnimStart | INT | 进入开始动画 |
| EnterAnimLoop | INT | 进入循环动画 |
| RideAnimStart | INT | 骑乘开始动画 |
| RideAnimLoop | INT | 骑乘循环动画 |
| RideUpperAnimStart | INT | 上身开始动画 |
| RideUpperAnimLoop | INT | 上身循环动画 |
| ExitPreDelay | FLOAT | 退出前延迟 |
| ExitSpeed | FLOAT | 退出速度 |
| ExitGravity | FLOAT | 退出重力 |
| ExitMinDuration | FLOAT | 最小退出持续时间 |
| ExitMaxDuration | FLOAT | 最大退出持续时间 |
| ExitMinArcHeight | FLOAT | 最小退出弧高 |
| ExitMaxArcHeight | FLOAT | 最大退出弧高 |
| ExitAnimStart | INT | 退出开始动画 |
| ExitAnimLoop | INT | 退出循环动画 |
| ExitAnimEnd | INT | 退出结束动画 |
| PassengerYaw | FLOAT | 乘客偏航角 |
| PassengerPitch | FLOAT | 乘客俯仰角 |
| PassengerRoll | FLOAT | 乘客翻滚角 |
| PassengerAttachmentID | INT | 乘客附件ID |
| VehicleEnterAnim | INT | 载具进入动画 |
| VehicleExitAnim | INT | 载具退出动画 |
| VehicleRideAnimLoop | INT | 载具骑乘动画 |
| VehicleEnterAnimBone | INT | 进入动画骨骼 |
| VehicleExitAnimBone | INT | 退出动画骨骼 |
| VehicleRideAnimLoopBone | INT | 骑乘动画骨骼 |
| VehicleEnterAnimDelay | FLOAT | 进入动画延迟 |
| VehicleExitAnimDelay | FLOAT | 退出动画延迟 |
| VehicleAbilityDisplay | INT | 载具技能显示 |
| EnterUISoundID | INT | 进入UI音效ID |
| ExitUISoundID | INT | 退出UI音效ID |
| UiSkin | INT | UI皮肤 |
| FlagsB | INT | 标志B |
| CameraEnteringDelay | FLOAT | 相机进入延迟 |
| CameraEnteringDuration | FLOAT | 相机进入持续时间 |
| CameraExitingDelay | FLOAT | 相机退出延迟 |
| CameraExitingDuration | FLOAT | 相机退出持续时间 |
| CameraOffsetX/Y/Z | FLOAT | 相机偏移 |
| CameraPosChaseRate | FLOAT | 相机位置追踪速率 |
| CameraFacingChaseRate | FLOAT | 相机朝向追踪速率 |
| CameraEnteringZoom | FLOAT | 相机进入缩放 |
| CameraSeatZoomMin | FLOAT | 最小座位缩放 |
| CameraSeatZoomMax | FLOAT | 最大座位缩放 |

---

### 5.94 game_event_prerequisite (游戏事件前置条件表)

定义游戏事件的前置事件要求。

| 字段 | 类型 | 说明 |
|------|------|------|
| eventEntry | TINYINT | 游戏事件ID |
| prerequisite_event | INT | 前置事件ID |

---

### 5.95 game_event_npcflag (游戏事件NPC标志表)

定义游戏事件期间NPC的动态标志。

| 字段 | 类型 | 说明 |
|------|------|------|
| eventEntry | TINYINT | 游戏事件ID |
| guid | INT | NPC的GUID |
| npcflag | INT | NPC标志 |

---

### 5.96 creature_summon_groups (生物召唤组表)

定义生物召唤物的分组和位置信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| summonerId | INT | 召唤者ID |
| summonerType | TINYINT | 召唤者类型 |
| groupId | TINYINT | 组ID |
| entry | INT | 被召唤生物ID |
| position_x | FLOAT | X坐标 |
| position_y | FLOAT | Y坐标 |
| position_z | FLOAT | Z坐标 |
| orientation | FLOAT | 朝向 |
| summonType | TINYINT | 召唤类型 |
| summonTime | INT | 召唤持续时间 |
| Comment | VARCHAR(255) | 备注 |

---

### 5.97 creature_sparring (生物切磋表)

定义生物切磋练习的伤害百分比。

| 字段 | 类型 | 说明 |
|------|------|------|
| GUID | INT | 生物GUID |
| SparringPCT | FLOAT | 伤害百分比(0-100) |

---

### 5.98 pet_levelstats (宠物等级属性表)

存储宠物各等级的属性数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| creature_entry | INT | 生物ID |
| level | TINYINT | 等级 |
| hp | INT | 生命值 |
| mana | INT | 法力值 |
| armor | INT | 护甲 |
| str | INT | 力量 |
| agi | INT | 敏捷 |
| sta | INT | 耐力 |
| inte | INT | 智力 |
| spi | INT | 精神 |
| min_dmg | INT | 最小伤害 |
| max_dmg | INT | 最大伤害 |

---

### 5.99 game_event_gameobject_quest (游戏事件游戏对象任务表)

关联游戏事件中的游戏对象与任务。

| 字段 | 类型 | 说明 |
|------|------|------|
| eventEntry | TINYINT | 游戏事件ID |
| id | INT | 游戏对象ID |
| quest | INT | 任务ID |

---

### 6.0 spell_linked_spell (法术关联表)

定义法术之间的触发关联关系，用于实现法术的连锁效果。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_trigger | INT | 触发法术ID |
| spell_effect | INT | 关联法术ID |
| type | TINYINT | 关联类型 |
| comment | TEXT | 备注说明 |

---

### 6.1 creature_addon (生物附加数据表)

存储生物实例的附加信息，如路径、骑乘、动画和光环等。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 生物实例GUID |
| path_id | INT | 路径ID |
| mount | INT | 骑乘显示ID |
| bytes1 | INT | 字节1标记 |
| bytes2 | INT | 字节2标记 |
| emote | INT | 表情动画ID |
| visibilityDistanceType | TINYINT | 可见距离类型 |
| auras | TEXT | 附加光环列表 |

---

### 6.2 game_event (游戏事件表)

定义游戏中各种事件的配置信息，包括节日、活动、季节性事件等。

| 字段 | 类型 | 说明 |
|------|------|------|
| eventEntry | TINYINT | 事件ID |
| start_time | TIMESTAMP | 开始时间 |
| end_time | TIMESTAMP | 结束时间 |
| occurence | BIGINT | 事件周期(分钟) |
| length | BIGINT | 事件持续时间(分钟) |
| holiday | INT | 客户端假日ID |
| holidayStage | TINYINT | 假日阶段 |
| description | VARCHAR(255) | 事件描述 |
| world_event | TINYINT | 世界事件标记 |
| announce | TINYINT | 公告设置 |

---

### 6.3 creature_formations (生物编队表)

定义生物之间的编队关系，控制多个生物的协同行为。

| 字段 | 类型 | 说明 |
|------|------|------|
| leaderGUID | INT | 队长GUID |
| memberGUID | INT | 成员GUID |
| dist | FLOAT | 距离 |
| angle | FLOAT | 角度 |
| groupAI | INT | 组AI类型 |
| point_1 | SMALLINT | 路径点1 |
| point_2 | SMALLINT | 路径点2 |

---

### 6.4 npc_vendor (NPC商人表)

定义NPC销售的物品列表。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | NPC entry |
| slot | SMALLINT | 槽位 |
| item | INT | 物品ID |
| maxcount | INT | 最大数量 |
| incrtime | INT | 重生时间(秒) |
| ExtendedCost | INT | 扩展成本 |
| VerifiedBuild | INT | 验证版本 |

---

### 6.5 conditions (条件表)

定义各种条件判断，用于任务、NPC对话、游戏对象交互等的条件限制。

| 字段 | 类型 | 说明 |
|------|------|------|
| SourceTypeOrReferenceId | INT | 源类型或引用ID |
| SourceGroup | INT | 源组 |
| SourceEntry | INT | 源条目 |
| SourceId | INT | 源ID |
| ElseGroup | INT | 否则组 |
| ConditionTypeOrReference | INT | 条件类型或引用 |
| ConditionTarget | TINYINT | 条件目标 |
| ConditionValue1 | INT | 条件值1 |
| ConditionValue2 | INT | 条件值2 |
| ConditionValue3 | INT | 条件值3 |
| NegativeCondition | TINYINT | 反向条件 |
| ErrorType | INT | 错误类型 |
| ErrorTextId | INT | 错误文本ID |
| ScriptName | CHAR(64) | 脚本名称 |
| Comment | VARCHAR(255) | 备注 |

---

### 6.6 gameobject_template (游戏对象模板表)

定义所有游戏对象(如宝箱、传送门、任务物品等)的基础模板。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 对象ID |
| type | TINYINT | 对象类型 |
| displayId | INT | 显示模型ID |
| name | VARCHAR(100) | 名称 |
| IconName | VARCHAR(100) | 图标名 |
| castBarCaption | VARCHAR(100) | 施法条标题 |
| unk1 | VARCHAR(100) | 未知字段 |
| size | FLOAT | 缩放比例 |
| Data0-23 | INT | 类型相关数据 |
| AIName | CHAR(64) | AI名称 |
| ScriptName | CHAR(64) | 脚本名称 |
| VerifiedBuild | INT | 验证版本 |

---

### 6.7 smart_scripts (智能脚本表)

存储智能AI脚本，用于控制生物、游戏对象的自动化行为。

| 字段 | 类型 | 说明 |
|------|------|------|
| entryorguid | INT | 源GUID |
| source_type | TINYINT | 源类型 |
| id | SMALLINT | 脚本ID |
| link | SMALLINT | 链接ID |
| event_type | TINYINT | 事件类型 |
| event_phase_mask | SMALLINT | 事件阶段掩码 |
| event_chance | TINYINT | 事件概率 |
| event_flags | SMALLINT | 事件标志 |
| event_param1-6 | INT | 事件参数 |
| action_type | TINYINT | 动作类型 |
| action_param1-6 | INT | 动作参数 |
| target_type | TINYINT | 目标类型 |
| target_param1-4 | INT | 目标参数 |
| target_x/y/z | FLOAT | 目标坐标 |
| target_o | FLOAT | 目标朝向 |
| comment | TEXT | 脚本注释 |

---

### 6.8 quest_template (任务模板表)

定义所有任务的基础信息，包括任务目标、奖励、要求等。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 任务ID |
| QuestType | TINYINT | 任务类型 |
| QuestLevel | SMALLINT | 任务等级 |
| MinLevel | TINYINT | 最低等级 |
| QuestSortID | SMALLINT | 任务分类ID |
| QuestInfoID | SMALLINT | 任务信息ID |
| SuggestedGroupNum | TINYINT | 建议队伍人数 |
| RequiredFactionId1/2 | SMALLINT | 需求阵营 |
| RequiredFactionValue1/2 | INT | 阵营声望值 |
| RewardNextQuest | INT | 奖励任务ID |
| RewardMoney | INT | 奖励金钱 |
| RewardDisplaySpell | INT | 奖励展示法术 |
| RewardSpell | INT | 奖励法术 |
| RewardHonor | INT | 奖励荣誉 |
| Flags | INT | 任务标志 |
| RewardItem1-4 | INT | 奖励物品ID |
| RewardItemAmount1-4 | SMALLINT | 物品数量 |
| RewardChoiceItemID1-6 | INT | 可选奖励物品 |
| RewardChoiceItemQuantity1-6 | SMALLINT | 可选物品数量 |
| LogTitle | TEXT | 任务标题 |
| LogDescription | TEXT | 任务描述 |
| QuestDescription | TEXT | 任务详情 |
| AreaDescription | TEXT | 区域描述 |
| RequiredNpcOrGo1-4 | INT | 需求NPC/对象 |
| RequiredNpcOrGoCount1-4 | SMALLINT | 需求数量 |
| RequiredItemId1-6 | INT | 需求物品ID |
| RequiredItemCount1-6 | SMALLINT | 物品数量 |
| VerifiedBuild | INT | 验证版本 |

---

### 6.9 creature_template (生物模板表)

定义所有生物(NPC/怪物)的基础模板数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 生物ID |
| difficulty_entry_1/2/3 | INT | 难度模式变体 |
| KillCredit1/2 | INT | 击杀计数ID |
| name | CHAR(100) | 名称 |
| subname | CHAR(100) | 副标题 |
| IconName | CHAR(100) | 图标名 |
| gossip_menu_id | INT | 对话菜单ID |
| minlevel/maxlevel | TINYINT | 等级范围 |
| exp | SMALLINT | 经验等级 |
| faction | SMALLINT | 阵营ID |
| npcflag | INT | NPC标志 |
| speed_walk/run/swim/flight | FLOAT | 移动速度 |
| detection_range | FLOAT | 发现范围 |
| scale | FLOAT | 模型缩放 |
| rank | TINYINT | 稀有度 |
| dmgschool | TINYINT | 伤害系别 |
| DamageModifier | FLOAT | 伤害修正 |
| BaseAttackTime | INT | 基础攻击时间 |
| unit_class | TINYINT | 单位职业 |
| unit_flags/flags2 | INT | 单位标志 |
| dynamicflags | INT | 动态标志 |
| family | TINYINT | 物种分类 |
| type | TINYINT | 生物类型 |
| type_flags | INT | 类型标志 |
| lootid/pickpocketloot/skinloot | INT | 掉落ID |
| VehicleId | INT | 载具ID |
| mingold/maxgold | INT | 金币掉落范围 |
| AIName | CHAR(64) | AI名称 |
| MovementType | TINYINT | 移动类型 |
| HoverHeight | FLOAT | 悬浮高度 |
| Health/Mana/ArmorModifier | FLOAT | 属性修正 |
| RacialLeader | TINYINT | 种族领袖 |
| movementId | INT | 移动ID |
| RegenHealth | TINYINT | 自然回血 |
| mechanic_immune_mask | INT | 免疫机制掩码 |
| ScriptName | CHAR(64) | 脚本名称 |
| VerifiedBuild | INT | 验证版本 |

### 6.10 item_template (物品模板表)

物品模板表是游戏世界中所有物品的定义表,定义了游戏中每一个物品的基本属性,包括武器、防具、消耗品、任务物品等所有类型的物品。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 物品ID,唯一标识符 |
| class | TINYINT | 物品类别 (0=消耗品,1=容器,2=武器,3=珠宝,4=护甲,5=材料,6=弹药,7=商品,8=投掷武器,9=绷带,10=食品,12=任务物品,15=钥匙,18=书籍) |
| subclass | TINYINT | 物品子类别,与class配合确定具体物品类型 |
| SoundOverrideSubclass | TINYINT | 声音覆盖子类别 |
| name | VARCHAR(255) | 物品名称 |
| displayid | INT | 显示模型ID |
| Quality | TINYINT | 物品品质 (0=普通,1=优秀,2=精良,3=稀有,4=史诗,5=传说,6=神器,7=传家宝) |
| Flags | INT | 物品标志 (0=无,1=灵魂绑定,2=任务物品,4=无法交易,8192=无删除确认) |
| FlagsExtra | INT | 额外标志 |
| BuyCount | TINYINT | 购买数量 |
| BuyPrice | BIGINT | 购买价格 (铜币) |
| SellPrice | INT | 出售价格 (铜币) |
| InventoryType | TINYINT | 装备位置 (0=无,1=头部,2=项链,3=肩部,4=衬衫,5=胸甲,6=腰部,7=腿部,8=脚部,9=手腕,10=手套,11=戒指,12=饰品,13=单手,14=盾牌,15=披风,16=双手,17=背包,18=副手,19=远程,20=弹药,21=武器主手,22=副手近战) |
| AllowableClass | INT | 允许使用的职业 (-1=所有职业) |
| AllowableRace | INT | 允许使用的种族 (-1=所有种族) |
| ItemLevel | SMALLINT | 物品等级 |
| RequiredLevel | TINYINT | 需求等级 |
| RequiredSkill | SMALLINT | 需求专业技能 |
| RequiredSkillRank | SMALLINT | 需求技能等级 |
| requiredspell | INT | 需求法术 |
| requiredhonorrank | INT | 需求荣誉等级 |
| RequiredCityRank | INT | 需求城市声望等级 |
| RequiredReputationFaction | SMALLINT | 需求声望阵营 |
| RequiredReputationRank | SMALLINT | 需求声望等级 |
| maxcount | INT | 最大堆叠数量 |
| stackable | INT | 可堆叠数量 |
| ContainerSlots | TINYINT | 容器槽位数 |
| stat_type1-10 | TINYINT | 属性类型 (1=力量,2=敏捷,3=耐力,4=智力,5=精神,6=神圣,7=防护,8=暗影,9=自然,10=火焰,11=冰霜,12=暗影,13=奥术) |
| stat_value1-10 | INT | 属性值 |
| ScalingStatDistribution | SMALLINT | 缩放属性分配ID |
| ScalingStatValue | INT | 缩放属性值 |
| dmg_min1-2 | FLOAT | 伤害最小值 |
| dmg_max1-2 | FLOAT | 伤害最大值 |
| dmg_type1-2 | TINYINT | 伤害类型 (0=物理,1=魔法) |
| armor | INT | 护甲值 |
| holy_res/fire_res/nature_res/frost_res/shadow_res/arcane_res | SMALLINT | 抗性值 (神圣/火焰/自然/冰霜/暗影/奥术) |
| delay | SMALLINT | 攻击间隔 (毫秒) |
| ammo_type | TINYINT | 弹药类型 |
| RangedModRange | FLOAT | 远程修正范围 |
| spellid_1-5 | INT | 触发法术ID |
| spelltrigger_1-5 | TINYINT | 触发类型 (0=使用,1=装备,2=命中,3=击中,4=暴击) |
| spellcharges_1-5 | SMALLINT | 法术充能次数 |
| spellppmRate_1-5 | FLOAT | 每分钟触发概率 |
| spellcooldown_1-5 | INT | 法术冷却时间 (毫秒,-1=无冷却) |
| spellcategory_1-5 | SMALLINT | 法术分类ID |
| spellcategorycooldown_1-5 | INT | 法术分类冷却时间 (毫秒) |
| bonding | TINYINT | 绑定类型 (0=无,1=拾取绑定,2=装备绑定,3=使用绑定) |
| description | VARCHAR(255) | 物品描述文本 |
| PageText | INT | 页文本ID (对于书籍类物品) |
| LanguageID | TINYINT | 语言ID |
| PageMaterial | TINYINT | 页材质 |
| startquest | INT | 起始任务ID |
| lockid | INT | 锁类型ID |
| Material | TINYINT | 材质类型 |
| sheath | TINYINT | 武器鞘类型 (0=无,1=单手,2=双手,3=远程) |
| RandomProperty | INT | 随机属性ID |
| RandomSuffix | INT | 随机后缀ID |
| block | INT | 盾牌格挡值 |
| itemset | INT | 套装ID |
| MaxDurability | SMALLINT | 最大耐久度 |
| area | INT | 区域ID |
| Map | SMALLINT | 地图ID |
| BagFamily | INT | 背包分类 |
| TotemCategory | INT | 图腾分类 |
| socketColor_1-3 | TINYINT | 插槽颜色 (1=多彩,2=红,4=黄,8=蓝) |
| socketContent_1-3 | INT | 插槽内容 (宝石ID) |
| socketBonus | INT | 插槽奖励ID |
| GemProperties | INT | 宝石属性ID |
| RequiredDisenchantSkill | SMALLINT | 需求分解技能等级 |
| ArmorDamageModifier | FLOAT | 护甲伤害修正 |
| duration | INT | 持续时间 (秒) |
| ItemLimitCategory | SMALLINT | 物品限制分类 |
| HolidayId | INT | 节日ID |
| ScriptName | VARCHAR(64) | 脚本名称 |
| DisenchantID | INT | 可分解为物品ID |
| FoodType | TINYINT | 食物类型 (对于可食用物品) |
| minMoneyLoot/maxMoneyLoot | INT | 最小/最大金币掉落 |
| flagsCustom | INT | 自定义标志 |
| VerifiedBuild | INT | 验证版本 |

### 6.11 quest_template (任务模板表)

任务模板表定义了游戏中所有任务的基本信息,包括任务奖励、任务目标、任务描述、任务需求等。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 任务ID,唯一标识符 |
| QuestType | TINYINT | 任务类型 (1=故事线,2=击杀任务,3=收集任务,4=探索任务,5=护送任务,6=使用物品任务,7=击败首领) |
| QuestLevel | SMALLINT | 任务等级 |
| MinLevel | TINYINT | 最低接受等级 |
| QuestSortID | SMALLINT | 任务分类ID (对应区域) |
| QuestInfoID | SMALLINT | 任务信息ID (区分任务类型) |
| SuggestedGroupNum | TINYINT | 建议队伍人数 |
| RequiredFactionId1/2 | SMALLINT | 需求阵营ID |
| RequiredFactionValue1/2 | INT | 需求阵营声望值 |
| RewardNextQuest | INT | 下一个任务ID |
| RewardXPDifficulty | TINYINT | 奖励经验难度 |
| RewardMoney | INT | 奖励金钱 (铜币) |
| RewardMoneyDifficulty | INT | 奖励金钱难度 |
| RewardDisplaySpell | INT | 显示奖励法术ID |
| RewardSpell | INT | 奖励法术ID |
| RewardHonor | INT | 奖励荣誉点数 |
| RewardKillHonor | FLOAT | 击杀荣誉奖励 |
| StartItem | INT | 起始物品ID |
| Flags | INT | 任务标志 (如524288=日常任务,8=需要组队) |
| RequiredPlayerKills | TINYINT | 需求击杀玩家数 |
| RewardItem1-4 | INT | 奖励物品ID |
| RewardAmount1-4 | SMALLINT | 奖励物品数量 |
| ItemDrop1-4 | INT | 物品掉落ID (任务相关) |
| ItemDropQuantity1-4 | SMALLINT | 物品掉落数量 |
| RewardChoiceItemID1-6 | INT | 奖励选择物品ID |
| RewardChoiceItemQuantity1-6 | SMALLINT | 奖励选择物品数量 |
| POIContinent | SMALLINT | 任务目标大陆ID |
| POIx/POIy | FLOAT | 任务目标坐标 |
| POIPriority | INT | 任务目标优先级 |
| RewardTitle | TINYINT | 奖励称号ID |
| RewardTalents | TINYINT | 奖励天赋点数 |
| RewardArenaPoints | SMALLINT | 奖励竞技场点数 |
| RewardFactionID1-5 | SMALLINT | 奖励阵营ID |
| RewardFactionValue1-5 | INT | 奖励阵营声望值 |
| RewardFactionOverride1-5 | INT | 奖励阵营声望覆盖值 |
| TimeAllowed | INT | 允许时间 (秒) |
| AllowableRaces | INT | 允许种族 |
| LogTitle | TEXT | 任务日志标题 |
| LogDescription | TEXT | 任务日志描述 |
| QuestDescription | TEXT | 任务描述文本 |
| AreaDescription | TEXT | 区域描述 |
| QuestCompletionLog | TEXT | 任务完成日志 |
| RequiredNpcOrGo1-4 | INT | 需求NPC或游戏对象ID |
| RequiredNpcOrGoCount1-4 | SMALLINT | 需求NPC或游戏对象数量 |
| RequiredItemId1-6 | INT | 需求物品ID |
| RequiredItemCount1-6 | SMALLINT | 需求物品数量 |
| ObjectiveText1-4 | TEXT | 目标文本提示 |
| VerifiedBuild | INT | 验证版本 |

### 6.12 gameobject_template (游戏对象模板表)

游戏对象模板表定义了游戏中所有游戏对象的基本信息,包括门、箱子、开关、传送门、钓鱼点等各种交互对象。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 游戏对象ID,唯一标识符 |
| type | TINYINT | 游戏对象类型 (0=无法识别,1=按钮,2=聊天框,3=尸体,4=棺材,5=门,6=传送门,7=矿袋,8=工具袋,9=花,10=墓地,11=开关,12=大门,13=一般,14=书籍,15=集市摊位,16=摇晃的树,17=钓鱼洞,18=邮件,19=拍卖行,20=邮箱,21=窗户,22=门) |
| displayId | INT | 显示模型ID |
| name | VARCHAR(100) | 游戏对象名称 |
| IconName | VARCHAR(100) | 图标名称 |
| castBarCaption | VARCHAR(100) | 施法条标题 |
| unk1 | VARCHAR(100) | 未知字段 |
| size | FLOAT | 模型大小比例 |
| Data0-23 | INT | 类型相关数据字段,不同type有不同的含义 |
| AIName | CHAR(64) | AI行为名称 |
| ScriptName | VARCHAR(64) | C++脚本名称 |
| VerifiedBuild | INT | 验证版本 |

**Data字段说明(按type类型):**
- 门(Data0=锁类型, Data1=开启时间)
- 按钮(Data0=锁类型, Data1=延迟)
- 传送门(Data0=目标地图ID)
- 箱子(Data0=锁类型, Data1=小游戏ID)
- 钓鱼洞(Data0=鱼类ID)

### 6.13 smart_scripts (智能脚本表)

智能脚本表(SmartAI)定义了游戏对象的自动化行为脚本,用于控制NPC、游戏对象等的交互逻辑。

| 字段 | 类型 | 说明 |
|------|------|------|
| entryorguid | INT | 源GUID或模板ID |
| source_type | TINYINT | 源类型 (0=creature,1=gameobject,4=areatrigger) |
| id | SMALLINT | 脚本ID |
| link | SMALLINT | 链接ID(用于链式触发) |
| event_type | TINYINT | 事件类型 (0=更新,1=交谈,2=攻击,4=血量,8=死亡,10=遭遇,13=距离等) |
| event_phase_mask | SMALLINT | 事件阶段掩码 |
| event_chance | TINYINT | 事件触发概率(0-100) |
| event_flags | SMALLINT | 事件标志 |
| event_param1-6 | INT | 事件参数 |
| action_type | TINYINT | 动作类型 (0=无,4=说话,10=施法,12=移动,20=设置flag等) |
| action_param1-6 | INT | 动作参数 |
| target_type | TINYINT | 目标类型 (0=自我,1=近战,7=玩家,20=坐标) |
| target_param1-4 | INT | 目标参数 |
| target_x/y/z | FLOAT | 目标坐标 |
| target_o | FLOAT | 目标朝向 |
| comment | TEXT | 脚本注释说明 |

### 6.14 npc_vendor (NPC商人表)

NPC商人表定义了所有商人NPC出售的物品,一个商人可以出售多种物品。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | NPC模板ID |
| slot | SMALLINT | 物品槽位(0=默认) |
| item | INT | 物品ID (对应item_template.entry) |
| maxcount | INT | 最大堆叠数量(0=无限) |
| incrtime | INT | 重生时间(秒,定时刷新的数量) |
| ExtendedCost | INT | 扩展成本(需要声望/代币等) |
| VerifiedBuild | INT | 验证版本 |

### 6.15 conditions (条件表)

条件表定义了各种游戏内容之间的条件关系,用于控制任务、NPC对话、物品使用等的触发条件。

| 字段 | 类型 | 说明 |
|------|------|------|
| SourceTypeOrReferenceId | INT | 源类型 (1=NPC对话,6=任务完成,13=钓鱼,14=使用物品等) |
| SourceGroup | INT | 源组ID |
| SourceEntry | INT | 源条目ID |
| SourceId | INT | 源ID |
| ElseGroup | INT | 否则分组(条件分组) |
| ConditionTypeOrReference | INT | 条件类型 (1=等级,4=物品,6=NPC,8=声望,9=种族,10=职业等) |
| ConditionTarget | TINYINT | 条件目标 (0=玩家,1=世界,2=NPC) |
| ConditionValue1-3 | INT | 条件值参数 |
| NegativeCondition | TINYINT | 是否反转条件 (0=满足条件,1=不满足条件) |
| ErrorType | INT | 错误类型ID |
| ErrorTextId | INT | 错误文本ID |
| ScriptName | CHAR(64) | 脚本名称 |
| Comment | VARCHAR(255) | 条件注释 |

### 6.16 game_event (游戏事件表)

游戏事件表定义了所有游戏内节日和活动,控制事件的开始时间、持续时间、重复间隔等。

| 字段 | 类型 | 说明 |
|------|------|------|
| eventEntry | TINYINT | 事件ID |
| start_time | TIMESTAMP | 绝对开始时间 |
| end_time | TIMESTAMP | 绝对结束时间 |
| occurence | BIGINT | 事件重复间隔(分钟) |
| length | BIGINT | 事件持续时间(分钟) |
| holiday | INT | 客户端假日ID |
| holidayStage | TINYINT | 假日阶段 |
| description | VARCHAR(255) | 事件描述 |
| world_event | TINYINT | 是否为世界事件 (0=普通,1=世界事件) |
| announce | TINYINT | 公告设置 (0=不公告,1=公告,2=配置文件设置) |

**示例事件:**
- Midsummer Fire Festival (仲夏火焰节)
- Winter Veil (冬幕节)
- Darkmoon Faire (暗月马戏团)

### 6.17 creature_addon (生物附加数据表)

生物附加数据表存储了游戏中每个生物实例的额外信息,如路径、骑乘状态、动画等。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 生物实例GUID |
| path_id | INT | 路径ID (用于巡逻) |
| mount | INT | 骑乘显示模型ID |
| bytes1 | INT | 字节字段1 (动画/状态) |
| bytes2 | INT | 字节字段2 (战斗状态等) |
| emote | INT | 表情动画ID |
| visibilityDistanceType | TINYINT | 可见距离类型 (0=普通,1=近,2=远,3=无限) |
| auras | TEXT | 附加光环列表 (空格分隔的法术ID) |

### 6.18 creature_formations (生物编队表)

生物编队表定义了NPC之间的编队关系,使多个NPC作为一个整体移动和作战。

| 字段 | 类型 | 说明 |
|------|------|------|
| leaderGUID | INT | 领队生物的GUID |
| memberGUID | INT | 成员生物的GUID |
| dist | FLOAT | 跟随距离 |
| angle | FLOAT | 跟随角度 |
| groupAI | INT | 编队AI标志 (0=服从领队,2=保持阵型) |
| point_1/point_2 | SMALLINT | 编队点位置 |

### 6.19 spell_linked_spell (法术关联表)

法术关联表定义了法术之间的触发关系,当一个法术被使用时自动触发另一个法术。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_trigger | INT | 触发法术ID (负数表示特殊条件) |
| spell_effect | INT | 效果法术ID |
| type | TINYINT | 关联类型 (0=触发,1=叠加,2=刷新) |
| comment | TEXT | 关联说明 |

### 6.20 creature_template (生物模板表)

生物模板表是游戏世界中所有NPC和怪物的定义表,定义了每个生物的基本属性。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 生物模板ID |
| difficulty_entry_1-3 | INT | 不同难度级别的模板ID |
| KillCredit1/2 | INT | 击杀积分ID |
| name | CHAR(100) | 生物名称 |
| subname | CHAR(100) | 生物副名称 |
| IconName | CHAR(100) | 图标名称 |
| gossip_menu_id | INT | 对话菜单ID |
| minlevel/maxlevel | TINYINT | 最小/最大等级 |
| exp | SMALLINT | 经验值系数 |
| faction | SMALLINT | 阵营ID |
| npcflag | INT | NPC标志 |
| speed_walk/run/swim/flight | FLOAT | 移动速度 |
| detection_range | FLOAT | 探测范围 |
| scale | FLOAT | 模型缩放 |
| rank | TINYINT | 等级类型 (0=普通,1=精英,2=稀有精英,3=世界BOSS) |
| dmgschool | TINYINT | 伤害类型 |
| DamageModifier | FLOAT | 伤害修正 |
| BaseAttackTime/RangeAttackTime | INT | 攻击间隔(毫秒) |
| unit_class | TINYINT | 单位职业 (1=战士,2=牧师,4=猎人,8=法师) |
| unit_flags/unit_flags2 | INT | 单位标志 |
| dynamicflags | INT | 动态标志 |
| family | TINYINT | 生物分类 |
| type | TINYINT | 生物类型 (0=野兽,1=龙类,2=恶魔,3=元素,4=巨人,5=人型,6=机械等) |
| type_flags | INT | 类型标志 |
| lootid/pickpocketloot/skinloot | INT | 掉落ID |
| PetSpellDataId | INT | 宠物法术数据ID |
| VehicleId | INT | 载具ID |
| mingold/maxgold | INT | 金币掉落范围 |
| AIName | CHAR(64) | AI名称 |
| MovementType | TINYINT | 移动类型 |
| HoverHeight | FLOAT | 悬浮高度 |
| Health/Mana/ArmorModifier | FLOAT | 属性修正 |
| RacialLeader | TINYINT | 种族领袖 |
| movementId | INT | 移动ID |
| RegenHealth | TINYINT | 自然回血 |
| mechanic_immune_mask | INT | 免疫机制掩码 |
| spell_school_immune_mask | INT | 法术免疫掩码 |
| flags_extra | INT | 额外标志 |
| ScriptName | CHAR(64) | 脚本名称 |
| VerifiedBuild | INT | 验证版本 |

### 6.21 waypoint_data (路径点数据表)

路径点数据表定义了生物的巡逻路径,用于控制NPC的移动轨迹。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 生物GUID |
| point | INT | 路径点序号 |
| position_x/y/z | FLOAT | 坐标位置 |
| orientation | FLOAT | 朝向角度 |
| delay | INT | 在此点停留时间(毫秒) |
| move_type | INT | 移动类型 (0=走路,1=跑步) |
| action | INT | 到达此点时执行的动作 |
| action_chance | SMALLINT | 动作触发概率(0-100) |
| wpguid | INT | 关联路径GUID |

### 6.22 creature_text (生物文本表)

生物文本表定义了NPC的对话和喊话内容,支持多语言、多表情、多音效。

| 字段 | 类型 | 说明 |
|------|------|------|
| CreatureID | INT | 生物模板ID |
| GroupID | TINYINT | 文本组ID (同一组只会随机说一句) |
| ID | TINYINT | 文本序号 |
| Text | LONGTEXT | 对话文本内容 |
| Type | TINYINT | 文本类型 (0=说,1=喊,2= whispering,3=表情) |
| Language | TINYINT | 语言ID (0=通用,1=兽人语等) |
| Probability | FLOAT | 触发概率(0-100) |
| Emote | INT | 表情动画ID |
| Duration | INT | 持续时间(毫秒) |
| Sound | INT | 音效ID |
| BroadcastTextId | INT | 广播文本ID |
| TextRange | TINYINT | 文本范围 (0=近,1=全图) |
| comment | VARCHAR(255) | 文本注释 |

### 6.23 gossip_menu_option (闲聊菜单选项表)

闲聊菜单选项表定义了NPC头顶交互菜单的选项内容。

| 字段 | 类型 | 说明 |
|------|------|------|
| MenuID | INT | 菜单ID (对应creature_template.gossip_menu_id) |
| OptionID | SMALLINT | 选项ID |
| OptionIcon | INT | 选项图标 |
| OptionText | TEXT | 选项文本 |
| OptionBroadcastTextID | INT | 选项广播文本ID |
| OptionType | TINYINT | 选项类型 (1=任务,2=聊天) |
| OptionNpcFlag | INT | NPC标志需求 |
| ActionMenuID | INT | 点击后打开的菜单ID |
| ActionPoiID | INT | 地图坐标点ID |
| BoxCoded | TINYINT | 是否需要输入代码 |
| BoxMoney | INT | 需要金币数量 |
| BoxText | TEXT | 输入框提示文本 |
| BoxBroadcastTextID | INT | 输入框广播文本ID |
| VerifiedBuild | INT | 验证版本 |

### 6.24 pool_creature (生物池表)

生物池表用于管理一组相关生物的刷新逻辑,支持概率刷新和共享池。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 生物实例GUID |
| pool_entry | INT | 池ID (对应pool_template.entry) |
| chance | FLOAT | 单独刷新概率(0=使用池概率) |
| description | VARCHAR(255) | 池描述 |

### 6.25 pool_gameobject (游戏对象池表)

游戏对象池表用于管理一组相关游戏对象的刷新逻辑,支持概率刷新和共享池。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 游戏对象实例GUID |
| pool_entry | INT | 池ID (对应pool_template.entry) |
| chance | FLOAT | 单独刷新概率(0=使用池概率) |
| description | VARCHAR(255) | 池描述 |

### 6.26 instance_template (副本模板表)

副本模板表定义了副本地图的基本属性,包括所属脚本、是否允许骑坐骑等。

| 字段 | 类型 | 说明 |
|------|------|------|
| map | SMALLINT | 地图ID |
| parent | SMALLINT | 父地图ID (用于关联地图) |
| script | VARCHAR(128) | 实例脚本名称 |
| allowMount | TINYINT | 是否允许骑坐骑 (0=不允许,1=允许) |

### 6.27 disables (禁用内容表)

禁用内容表用于禁用游戏中的某些功能,包括禁用地图、副本、NPC、任务、法术等。

| 字段 | 类型 | 说明 |
|------|------|------|
| sourceType | INT | 源类型 (0=法术,2=NPC,4=地图,5=战场,7=成就等) |
| entry | INT | 被禁用的条目ID |
| flags | TINYINT | 禁用标志 |
| params_0/1 | VARCHAR(255) | 额外参数 |
| comment | VARCHAR(255) | 禁用原因说明 |

### 6.28 creature_equip_template (生物装备模板表)

生物装备模板表定义了NPC携带的武器和装备。

| 字段 | 类型 | 说明 |
|------|------|------|
| CreatureID | INT | 生物模板ID |
| ID | TINYINT | 装备配置ID |
| ItemID1/2/3 | INT | 装备物品ID (主手/副手/远程) |
| VerifiedBuild | INT | 验证版本 |

### 6.29 creature_movement_override (生物移动覆盖表)

生物移动覆盖表用于覆盖特定生物实例的移动行为设置。

| 字段 | 类型 | 说明 |
|------|------|------|
| SpawnId | INT | 生物刷新ID |
| Ground | TINYINT | 地面移动 (0=否,1=是) |
| Swim | TINYINT | 水下游泳 (0=否,1=是) |
| Flight | TINYINT | 飞行模式 (0=否,1=是) |
| Rooted | TINYINT | 静止模式 (0=否,1=是) |
| Chase | TINYINT | 追逐模式 |
| Random | TINYINT | 随机移动模式 |
| InteractionPauseTimer | INT | 交互后暂停时间(毫秒) |

### 6.30 playercreateinfo (玩家创建信息表)

玩家创建信息表定义了每个种族和职业组合的新角色起始位置。

| 字段 | 类型 | 说明 |
|------|------|------|
| race | TINYINT | 种族ID (1=人类,2=兽人,3=矮人,4=暗夜精灵,5=亡灵,6=牛头人,7=侏儒,8=巨魔,10=血精灵,11=德莱尼) |
| class | TINYINT | 职业ID (1=战士,2=圣骑士,3=猎人,4=潜行者,5=牧师,6=死亡骑士,7=萨满,8=法师,9=术士,11=德鲁伊) |
| map | SMALLINT | 起始地图ID |
| zone | INT | 起始区域ID |
| position_x/y/z | FLOAT | 起始坐标 |
| orientation | FLOAT | 起始朝向 |

### 6.31 player_class_stats (职业属性表)

职业属性表定义了每个职业在每个等级的基础属性成长值。

| 字段 | 类型 | 说明 |
|------|------|------|
| Class | TINYINT | 职业ID |
| Level | TINYINT | 等级 |
| BaseHP | INT | 基础生命值 |
| BaseMana | INT | 基础法力值 |
| Strength | INT | 力量 |
| Agility | INT | 敏捷 |
| Stamina | INT | 耐力 |
| Intellect | INT | 智力 |
| Spirit | INT | 精神 |

### 6.32 player_race_stats (种族属性表)

种族属性表定义了每个种族的属性加成值。

| 字段 | 类型 | 说明 |
|------|------|------|
| Race | TINYINT | 种族ID |
| Strength | INT | 力量加成 |
| Agility | INT | 敏捷加成 |
| Stamina | INT | 耐力加成 |
| Intellect | INT | 智力加成 |
| Spirit | INT | 精神加成 |

### 6.33 game_tele (游戏传送表)

游戏传送表定义了所有可用 `.tele` 命令传送的位置。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 传送ID |
| position_x/y/z | FLOAT | 目标坐标 |
| orientation | FLOAT | 目标朝向 |
| map | SMALLINT | 目标地图ID |
| name | VARCHAR(100) | 传送名称/别名 |

### 6.34 command (命令表)

命令表定义了所有游戏内管理员命令的帮助信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| name | VARCHAR(50) | 命令名称 |
| security | TINYINT | 所需权限等级 (0=玩家,1=客服,2=GM,3=高级GM,4=管理员) |
| help | LONGTEXT | 命令帮助说明 |

### 6.35 acore_string (自定义字符串表)

自定义字符串表用于存储游戏内的多语言字符串,支持简体中文、英文等多种语言。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 字符串ID |
| content_default | TEXT | 默认语言文本(英文) |
| locale_koKR | TEXT | 韩语文本 |
| locale_frFR | TEXT | 法语文本 |
| locale_deDE | TEXT | 德语文本 |
| locale_zhCN | TEXT | 简体中文文本 |
| locale_zhTW | TEXT | 繁体中文文本 |
| locale_esES | TEXT | 西班牙语文本 |
| locale_esMX | TEXT | 墨西哥西班牙语文本 |
| locale_ruRU | TEXT | 俄语文本 |

### 6.36 npc_text (NPC文本表)

NPC文本表定义了NPC对话的文本内容,支持多个选项和随机选择。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 文本ID |
| text0_0/text0_1 | LONGTEXT | 第一个文本选项(男/女) |
| BroadcastTextID0 | INT | 广播文本ID |
| lang0 | TINYINT | 语言ID |
| Probability0 | FLOAT | 触发概率 |
| em0_0-5 | SMALLINT | 表情动画ID |
| text1_0-7_0/1 | LONGTEXT | 其他文本选项 |
| VerifiedBuild | INT | 验证版本 |

### 6.37 broadcast_text (广播文本表)

广播文本表存储了游戏中的NPC对话文本,支持男女不同文本、表情动画和音效。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 广播文本ID |
| LanguageID | INT | 语言ID |
| MaleText | LONGTEXT | 男性角色对话文本 |
| FemaleText | LONGTEXT | 女性角色对话文本 |
| EmoteID1/2/3 | INT | 表情动画ID |
| EmoteDelay1/2/3 | INT | 表情延迟(毫秒) |
| SoundEntriesId | INT | 音效ID |
| EmotesID | INT | 综合表情ID |
| Flags | INT | 标志 |
| VerifiedBuild | SMALLINT | 验证版本 |

### 6.38 creature_loot_template (生物掉落模板表)

生物掉落模板表定义了怪物的掉落物品,包括金币和物品。

| 字段 | 类型 | 说明 |
|------|------|------|
| Entry | INT | 生物模板ID (对应creature_template.entry) |
| Item | INT | 物品ID |
| Reference | INT | 引用其他掉落模板 (不为0时引用) |
| Chance | FLOAT | 掉落概率(0-100) |
| QuestRequired | TINYINT | 是否任务物品 (1=任务需求) |
| LootMode | SMALLINT | 掉落模式 |
| GroupId | TINYINT | 掉落分组 |
| MinCount/MaxCount | TINYINT | 最小/最大数量 |
| Comment | VARCHAR(255) | 掉落注释 |

### 6.39 gameobject_loot_template (游戏对象掉落模板表)

游戏对象掉落模板表定义了可打开的游戏对象(如箱子、尸体等)的掉落物品。

| 字段 | 类型 | 说明 |
|------|------|------|
| Entry | INT | 游戏对象模板ID |
| Item | INT | 物品ID |
| Reference | INT | 引用其他掉落模板 |
| Chance | FLOAT | 掉落概率 |
| QuestRequired | TINYINT | 是否任务物品 |
| LootMode | SMALLINT | 掉落模式 |
| GroupId | TINYINT | 掉落分组 |
| MinCount/MaxCount | TINYINT | 最小/最大数量 |
| Comment | VARCHAR(255) | 掉落注释 |

### 6.40 spell_dbc (法术数据库表)

spell_dbc表存储了所有法术的完整定义,是从官方DBC文件导入的法术数据,包含法术的所有属性和效果。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 法术ID |
| Category | INT | 法术分类 |
| DispelType | INT | 驱散类型 |
| Mechanic | INT | 机制 |
| Attributes/AttributesEx-7 | INT | 法术属性标志 |
| ShapeshiftMask | BIGINT | 变形状态掩码 |
| Targets | INT | 目标类型 |
| CasterAuraState/TargetAuraState | INT | 光环状态需求 |
| RecoveryTime | INT | 冷却时间 |
| CategoryRecoveryTime | INT | 分类冷却时间 |
| InterruptFlags | INT | 中断标志 |
| AuraInterruptFlags | INT | 光环中断标志 |
| ProcTypeMask/ProcChance/ProcCharges | INT | 触发相关 |
| MaxLevel/SpellLevel/BaseLevel | INT | 等级相关 |
| DurationIndex | INT | 持续时间索引 |
| PowerType | INT | 能量类型 |
| ManaCost/ManaCostPerLevel | INT | 法力消耗 |
| Speed | FLOAT | 飞行速度 |
| Totem_1/2 | INT | 图腾需求 |
| Reagent_1-8 | INT | 试剂ID |
| ReagentCount_1-8 | INT | 试剂数量 |
| SpellDescription | TEXT | 法术描述 |
| VerifiedBuild | INT | 验证版本 |

**注:** spell_dbc表有200+字段,涵盖法术的完整定义,包括效果、目标、施法条件等。

### 6.41 talent_dbc (天赋数据库表)

talent_dbc表存储了所有职业天赋树的数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 天赋ID |
| TabID | INT | 天赋树标签ID (对应职业天赋树) |
| TierID | INT | 天赋层ID |
| ColumnIndex | INT | 天赋列索引 |
| SpellRank_1-9 | INT | 天赋法术等级 |
| PrereqTalent_1-3 | INT | 前置天赋ID |
| PrereqRank_1-3 | INT | 前置天赋等级 |
| Flags | INT | 天赋标志 |
| RequiredSpellID | INT | 需求法术ID |
| CategoryMask_1/2 | INT | 分类掩码 |

### 6.42 vehicle_dbc (载具数据库表)

vehicle_dbc表存储了载具的定义数据,包括坐骑的座位、速度、视角等属性。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 载具ID |
| Flags | INT | 载具标志 |
| TurnSpeed/PitchSpeed | FLOAT | 转向速度 |
| PitchMin/PitchMax | FLOAT | 俯仰角度限制 |
| SeatID_1-8 | INT | 座位ID (最多8个座位) |
| MouseLookOffsetPitch | FLOAT | 鼠标视角偏移 |
| CameraFadeDistScalarMin/Max | FLOAT | 相机淡出距离 |
| CameraPitchOffset | FLOAT | 相机俯仰偏移 |
| FacingLimitRight/Left | FLOAT | 视角限制 |
| MsslTrgt* | FLOAT | 导弹目标参数 |
| VehicleUIIndicatorID | INT | UI指示器ID |

### 6.43 skillline_dbc (技能线数据库表)

skillline_dbc表存储了所有专业技能和技能线的信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 技能线ID |
| CategoryID | INT | 分类ID |
| SkillCostsID | INT | 技能花费ID |
| DisplayName_Lang_* | VARCHAR(100) | 多语言技能名称 |
| Description_Lang_* | VARCHAR(300) | 多语言技能描述 |
| Flags | INT | 技能标志 |

### 6.44 map_dbc (地图数据库表)

map_dbc表存储了所有地图的信息,包括世界地图、副本、战场等。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 地图ID |
| Directory | VARCHAR(100) | 地图目录名 |
| InstanceType | INT | 实例类型 (0=世界,1=副本,2=战场,3=竞技场) |
| Flags | INT | 地图标志 |
| PVP | INT | PVP标志 |
| MapName_Lang_* | VARCHAR(100) | 多语言地图名称 |
| AreaTableID | INT | 区域表ID |
| MapDescription_*_Lang | TEXT | 多语言地图描述 |

### 6.45 chrclasses_dbc (职业数据库表)

chrclasses_dbc表存储了所有职业的定义信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 职业ID |
| DisplayPower | INT | 显示的能量类型 |
| PetNameToken | INT | 宠物名称标记 |
| Name_Lang_* | VARCHAR(100) | 多语言职业名称(男性) |
| Name_Female_Lang_* | VARCHAR(100) | 多语言职业名称(女性) |
| NameLang_Mask | INT | 语言掩码 |
| Description_Lang_* | TEXT | 多语言职业描述 |
| RolesMask | INT | 角色掩码 |
| SpellClassSet | INT | 法术职业集合 |

### 6.46 chrraces_dbc (种族数据库表)

chrraces_dbc表存储了所有种族的基本定义信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 种族ID |
| Flags | INT | 种族标志 |
| FactionID | INT | 阵营ID |
| ExplorationSoundID | INT | 探索声音ID |
| MaleDisplayId/FemaleDisplayId | INT | 角色模型ID |
| BaseLanguage | INT | 基础语言 |
| CreatureType | INT | 生物类型 |
| ResSicknessSpellID | INT | 复活病法术ID |
| SplashSoundID | INT | 溅水声音ID |
| CinematicSequenceID | INT | 电影序列ID |
| Name_Lang_* | VARCHAR(100) | 多语言种族名称 |
| Name_Female_Lang_* | VARCHAR(100) | 多语言种族名称(女性) |

### 6.47 faction_dbc (阵营数据库表)

faction_dbc表存储了所有阵营的声望信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 阵营ID |
| ReputationIndex | INT | 声望索引 |
| ReputationRaceMask_1-4 | INT | 种族掩码 |
| ReputationClassMask_1-4 | INT | 职业掩码 |
| ReputationBase_1-4 | INT | 基础声望值 |
| ReputationFlags_1-4 | INT | 声望标志 |
| ParentFactionID | INT | 父阵营ID |
| ParentFactionMod_1/2 | FLOAT | 父阵营修正 |
| ParentFactionCap_1/2 | INT | 父阵营上限 |
| Name_Lang_* | VARCHAR(100) | 多语言阵营名称 |
| Description_Lang_* | TEXT | 多语言阵营描述 |

### 6.48 emotes_dbc (表情数据库表)

emotes_dbc表存储了游戏中的表情动作定义。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 表情ID |
| EmoteSlashCommand | VARCHAR(100) | 表情命令 |
| AnimID | INT | 动画ID |
| EmoteFlags | INT | 表情标志 |
| EmoteSpecProc | INT | 特殊处理 |
| EmoteSpecProcParam | INT | 特殊处理参数 |
| EventSoundID | INT | 事件声音ID |

### 6.49 soundentries_dbc (声音数据库表)

soundentries_dbc表存储了游戏中的声音文件定义。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 声音ID |
| SoundType | INT | 声音类型 |
| Name | VARCHAR(100) | 声音名称 |
| File_1-10 | VARCHAR(100) | 声音文件名 |
| Freq_1-10 | INT | 播放频率 |

### 6.50 achievement_dbc (成就数据库表)

achievement_dbc表存储了游戏中的成就定义。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 成就ID |
| Faction | INT | 阵营 (-1=双方,0=联盟,1=部落) |
| Instance_Id | INT | 关联实例ID |
| Supercedes | INT | 前置成就ID |
| Title_Lang_* | VARCHAR(100) | 多语言成就名称 |
| Description_Lang_* | VARCHAR(200) | 多语言成就描述 |
| Category | INT | 成就分类 |
| UIOrder | INT | UI排序 |
| Flags | INT | 成就标志 |
| IconID | INT | 图标ID |
| CriteriaTree | INT | 条件树ID |

### 6.51 creaturefamily_dbc (生物分类数据库表)

creaturefamily_dbc表存储了宠物和坐骑的生物分类信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 分类ID |
| MinScale/MaxScale | FLOAT | 缩放比例范围 |
| MinScaleLevel/MaxScaleLevel | INT | 缩放等级范围 |
| SkillLine_1/2 | INT | 技能线ID |
| PetFoodMask | INT | 可食用物品掩码 |
| PetTalentType | INT | 宠物天赋类型 |
| CategoryEnumID | INT | 分类枚举ID |
| Name_Lang_* | VARCHAR(100) | 多语言分类名称 |
| IconFile | INT | 图标文件ID |

### 6.52 item_dbc (物品基础数据库表)

item_dbc表存储了物品的基础定义信息,是item_template的补充。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 物品ID |
| ClassID | INT | 物品类别ID |
| SubclassID | INT | 物品子类别ID |
| Sound_Override_Subclassid | INT | 声音覆盖子类别 |
| Material | INT | 材质 |
| DisplayInfoID | INT | 显示信息ID |
| InventoryType | INT | 装备位置类型 |
| SheatheType | INT | 武器鞘类型 |

### 6.53 areatable_dbc (区域数据库表)

areatable_dbc表存储了游戏世界中所有区域的信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 区域ID |
| ContinentID | INT | 所属大陆ID |
| ParentAreaID | INT | 父区域ID |
| AreaBit | INT | 区域位 |
| Flags | INT | 区域标志 |
| SoundProviderPref | INT | 音效偏好 |
| SoundProviderPrefUnderwater | INT | 水下音效偏好 |
| AmbienceID | INT | 环境音ID |
| ZoneMusic | INT | 区域音乐ID |
| IntroSound | INT | 进入声音ID |
| ExplorationLevel | INT | 探索等级 |
| AreaName_Lang_* | VARCHAR(100) | 多语言区域名称 |

### 6.54 worldmaparea_dbc (世界地图区域数据库表)

worldmaparea_dbc表定义了世界地图上区域的位置映射。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 地图区域ID |
| MapID | INT | 地图ID |
| AreaID | INT | 区域ID |
| AreaName | VARCHAR(100) | 区域名称 |
| LocLeft/Right/Top/Bottom | FLOAT | 地图边界坐标 |
| DisplayMapID | INT | 显示地图ID |
| DefaultDungeonFloor | INT | 默认地下城楼层 |
| ParentWorldMapID | INT | 父地图ID |

### 6.55 worldmapoverlay_dbc (世界地图覆盖物数据库表)

worldmapoverlay_dbc表定义了世界地图上的覆盖物信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 覆盖物ID |
| MapAreaID | INT | 地图区域ID |
| AreaID_1-4 | INT | 关联区域ID |
| MapPointX/Y | INT | 地图点坐标 |
| TextureName | VARCHAR(100) | 纹理文件名 |
| TextureWidth/Height | INT | 纹理尺寸 |
| OffsetX/Y | INT | 偏移量 |
| HitRectTop/Left/Bottom/Right | INT | 点击区域矩形 |

### 6.56 game_weather (天气表)

game_weather表定义了各区域的天气概率。

| 字段 | 类型 | 说明 |
|------|------|------|
| zone | INT | 区域ID |
| spring_rain/snow/storm_chance | TINYINT | 春季下雨/下雪/暴风雨概率 |
| summer_rain/snow/storm_chance | TINYINT | 夏季下雨/下雪/暴风雨概率 |
| fall_rain/snow/storm_chance | TINYINT | 秋季下雨/下雪/暴风雨概率 |
| winter_rain/snow/storm_chance | TINYINT | 冬季下雨/下雪/暴风雨概率 |
| ScriptName | CHAR(64) | 脚本名称 |

### 6.57 page_text (书籍页面文本表)

page_text表存储了可阅读物品(如书籍、信笺)的页面文本内容。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 页面ID |
| Text | LONGTEXT | 页面文本内容 |
| NextPageID | INT | 下一页ID (0=无下一页) |
| VerifiedBuild | INT | 验证版本 |

### 6.58 points_of_interest (兴趣点表)

points_of_interest表定义了地图上的重要位置点,用于显示在游戏地图上。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 兴趣点ID |
| PositionX/Y | FLOAT | 坐标位置 |
| Icon | INT | 图标类型 |
| Flags | INT | 标志 |
| Importance | INT | 重要程度 |
| Name | TEXT | 兴趣点名称 |

### 6.59 graveyard_zone (墓地区域表)

graveyard_zone表定义了墓地与区域的关联,指定玩家死亡后灵魂绑定的墓地。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 墓地ID |
| GhostZone | INT | 关联区域ID |
| Faction | SMALLINT | 阵营需求 (0=双方,35=部落,469=联盟) |
| Comment | TEXT | 注释说明 |

### 6.60 spell_area (法术区域关联表)

spell_area表定义了法术在特定区域、任务状态下的生效规则。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell | INT | 法术ID |
| area | INT | 区域ID (0=所有区域) |
| quest_start | INT | 起始任务ID |
| quest_end | INT | 结束任务ID |
| aura_spell | INT | 光环法术ID |
| racemask | INT | 种族掩码 |
| gender | TINYINT | 性别 (0=男,1=女,2=不限) |
| autocast | TINYINT | 自动施放 |
| quest_start_status | INT | 起始任务状态掩码 |
| quest_end_status | INT | 结束任务状态掩码 |

### 6.61 spell_threat (法术仇恨表)

spell_threat表定义了法术产生的仇恨值修正。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 法术ID |
| flatMod | INT | 固定仇恨修正值 |
| pctMod | FLOAT | 仇恨百分比修正系数 |
| apPctMod | FLOAT | 攻击功率百分比修正 |

### 6.63 spell_bonus_data (法术伤害加成数据表)

spell_bonus_data表存储了法术的伤害加成计算数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 法术ID |
| direct_bonus | FLOAT | 直接伤害加成 |
| dot_bonus | FLOAT | 持续伤害加成 |
| ap_bonus | FLOAT | 攻击强度加成 |
| ap_dot_bonus | FLOAT | 攻击强度对持续伤害加成 |
| comments | VARCHAR(255) | 注释 |

### 6.64 spell_mixology (混合法术表)

spell_mixology表定义了炼金术饮料的额外效果加成。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 法术ID |
| pctMod | FLOAT | 额外加成百分比 |

### 6.65 spell_proc (法术触发配置表)

spell_proc表存储了法术触发效果的配置数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| SpellId | INT | 法术ID |
| SchoolMask | TINYINT | 法术学派掩码 |
| SpellFamilyName | SMALLINT | 法术家族名称 |
| SpellFamilyMask0-2 | INT | 法术家族掩码 |
| ProcFlags | INT | 触发标志 |
| SpellTypeMask | INT | 法术类型掩码 |
| SpellPhaseMask | INT | 法术阶段掩码 |
| HitMask | INT | 命中掩码 |
| AttributesMask | INT | 属性掩码 |
| DisableEffectsMask | INT | 禁用效果掩码 |
| ProcsPerMinute | FLOAT | 每分钟触发次数 |
| Chance | FLOAT | 触发概率 |
| Cooldown | INT | 冷却时间 |
| Charges | TINYINT | 充能次数 |

### 6.66 spell_enchant_proc_data (附魔触发数据表)

spell_enchant_proc_data表定义了物品附魔的触发效果配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 附魔ID |
| customChance | INT | 自定义触发概率 |
| PPMChance | FLOAT | 每分钟触发概率(PPM) |
| procEx | INT | 触发条件扩展 |
| attributeMask | INT | 属性掩码 |

### 6.67 spell_custom_attr (法术自定义属性表)

spell_custom_attr表用于扩展法术的自定义属性。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_id | INT | 法术ID |
| attributes | INT | 自定义属性标志 |

### 6.68 spell_group (法术组表)

spell_group表定义了法术组,同一组内的法术通常互斥。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 法术组ID |
| spell_id | INT | 法术ID |

### 6.69 spell_ranks (法术等级表)

spell_ranks表定义了法术的等级关系。

| 字段 | 类型 | 说明 |
|------|------|------|
| first_spell_id | INT | 起始法术ID |
| spell_id | INT | 当前法术ID |
| rank | TINYINT | 法术等级 |

### 6.70 spell_required (法术前置要求表)

spell_required表定义了学习法术的前置要求。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_id | INT | 需要学习的法术ID |
| req_spell | INT | 前置法术ID |

### 6.71 spell_script_names (法术脚本名称表)

spell_script_names表将法术ID与对应的C++脚本名称关联。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_id | INT | 法术ID |
| ScriptName | CHAR(64) | 脚本名称 |

### 6.72 spell_scripts (法术脚本表)

spell_scripts表存储了通过脚本命令触发的法术效果数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 脚本ID |
| effIndex | TINYINT | 效果索引 |
| delay | INT | 延迟时间 |
| command | INT | 命令类型 |
| datalong | INT | 数据参数1 |
| datalong2 | INT | 数据参数2 |
| dataint | INT | 整型数据 |
| x/y/z | FLOAT | 坐标参数 |
| o | FLOAT | 朝向参数 |

### 6.73 spell_proc_event (法术触发事件表)

spell_proc_event表扩展了法术触发事件的配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 法术ID |
| SchoolMask | TINYINT | 法术学派掩码 |
| SpellFamilyName | SMALLINT | 法术家族名称 |
| SpellFamilyMask0-2 | INT | 法术家族掩码 |
| procFlags | INT | 触发标志 |
| procEx | INT | 触发扩展 |
| procPhase | INT | 触发阶段 |
| ppmRate | FLOAT | 每分钟触发概率 |
| CustomChance | FLOAT | 自定义概率 |
| Cooldown | INT | 冷却时间 |

### 6.74 quest_greeting (任务问候语表)

quest_greeting表定义了NPC的任务对话问候语。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | NPC模板ID或任务ID |
| type | TINYINT | 类型 (0=NPC,1=任务) |
| GreetEmoteType | SMALLINT | 问候表情类型 |
| GreetEmoteDelay | INT | 问候表情延迟 |
| Greeting | TEXT | 问候文本 |
| VerifiedBuild | INT | 验证版本 |

### 6.75 quest_offer_reward (任务奖励文本表)

quest_offer_reward表定义了玩家完成任务后NPC的奖励文本和表情。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 任务ID |
| Emote1-4 | SMALLINT | 完成任务时的表情ID |
| EmoteDelay1-4 | INT | 表情延迟时间 |
| RewardText | TEXT | 奖励文本 |
| VerifiedBuild | INT | 验证版本 |

### 6.76 quest_request_items (任务需求物品文本表)

quest_request_items表定义了玩家上交任务物品时NPC的对话文本。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 任务ID |
| EmoteOnComplete | SMALLINT | 完成任务时的表情 |
| EmoteOnIncomplete | SMALLINT | 未完成时的表情 |
| CompletionText | TEXT | 对话文本 |
| VerifiedBuild | INT | 验证版本 |

### 6.77 quest_template_addon (任务模板附加表)

quest_template_addon表是quest_template的扩展,存储了任务的额外信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 任务ID |
| MaxLevel | TINYINT | 最大等级 |
| AllowableClasses | INT | 允许的职业 |
| SourceSpellID | INT | 任务来源法术 |
| PrevQuestID | INT | 前置任务ID |
| NextQuestID | INT | 下一任务ID |
| ExclusiveGroup | INT | 独占任务组 |
| BreadcrumbForQuestId | INT | 面包屑任务ID |
| RewardMailTemplateID | INT | 奖励邮件模板ID |
| RewardMailDelay | INT | 奖励邮件延迟 |
| RequiredSkillID | SMALLINT | 需求技能ID |
| RequiredSkillPoints | SMALLINT | 需求技能点数 |
| RequiredMin/MaxRepFaction | SMALLINT | 需求声望阵营 |
| RequiredMin/MaxRepValue | INT | 需求声望值 |
| ProvidedItemCount | TINYINT | 提供物品数量 |
| SpecialFlags | INT | 特殊标志 |

### 6.78 quest_poi (任务目标点表)

quest_poi表定义了任务目标在地图上的显示位置。

| 字段 | 类型 | 说明 |
|------|------|------|
| QuestID | INT | 任务ID |
| id | INT | POI ID |
| ObjectiveIndex | INT | 目标索引 |
| MapID | INT | 地图ID |
| WorldMapAreaId | INT | 世界地图区域ID |
| Floor | INT | 楼层 |
| Priority | INT | 优先级 |
| Flags | INT | 标志 |
| VerifiedBuild | INT | 验证版本 |

### 6.79 quest_poi_points (任务目标点坐标表)

quest_poi_points表存储了任务目标点的具体坐标。

| 字段 | 类型 | 说明 |
|------|------|------|
| QuestID | INT | 任务ID |
| Idx1 | INT | 第一索引 |
| Idx2 | INT | 第二索引 |
| X/Y | INT | 坐标位置 |
| VerifiedBuild | INT | 验证版本 |

### 6.80 linked_respawn (关联重生表)

linked_respawn表定义了生物之间的重生关联关系。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 依赖生物GUID |
| linkedGuid | INT | 主导生物GUID |
| linkType | TINYINT | 关联类型 (0=生物,1=游戏对象) |

### 6.81 battleground_template (战场模板表)

battleground_template表定义了战场的模板配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 战场ID |
| MinPlayersPerTeam | SMALLINT | 每队最少玩家数 |
| MaxPlayersPerTeam | SMALLINT | 每队最多玩家数 |
| MinLvl/MaxLvl | TINYINT | 最小/最大等级 |
| AllianceStartLoc | INT | 联盟起始位置ID |
| AllianceStartO | FLOAT | 联盟起始朝向 |
| HordeStartLoc | INT | 部落起始位置ID |
| HordeStartO | FLOAT | 部落起始朝向 |
| StartMaxDist | FLOAT | 起始区域最大距离 |
| Weight | TINYINT | 权重 |
| ScriptName | CHAR(64) | 脚本名称 |
| Comment | CHAR(38) | 战场名称 |

### 6.82 powerdisplay_dbc (能量显示数据库表)

powerdisplay_dbc表定义了能量条的颜色显示。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 能量类型ID |
| ActualType | INT | 实际能量类型 |
| GlobalstringBaseTag | VARCHAR(100) | 全局字符串标签 |
| Red/Green/Blue | TINYINT | RGB颜色值 |

### 6.83 summonproperties_dbc (召唤属性数据库表)

summonproperties_dbc表定义了召唤生物的属性配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 召唤属性ID |
| Control | INT | 控制类型 |
| Faction | INT | 阵营 |
| Title | INT | 召唤标题 |
| Slot | INT | 召唤槽位 |
| Flags | INT | 标志 |

---

### 6.84 talent_dbc (天赋数据库表)

talent_dbc表定义了游戏中所有的天赋配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 天赋ID |
| TabID | INT | 天赋标签页ID |
| TierID | INT | 天赋层数 |
| ColumnIndex | INT | 天赋列索引 |
| SpellRank_1-9 | INT | 法术等级1-9 |
| PrereqTalent_1-3 | INT | 前置天赋1-3 |
| PrereqRank_1-3 | INT | 前置天赋等级1-3 |
| Flags | INT | 天赋标志 |
| RequiredSpellID | INT | 需求法术ID |
| CategoryMask_1-2 | INT | 分类掩码1-2 |

### 6.85 talenttab_dbc (天赋标签数据库表)

talenttab_dbc表定义了天赋标签页的配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 标签页ID |
| Name_Lang_enUS | VARCHAR(100) | 英文名称 |
| Name_Lang_zhCN | VARCHAR(100) | 中文名称 |
| SpellIconID | INT | 法术图标ID |
| RaceMask | INT | 种族掩码 |
| ClassMask | INT | 职业掩码 |
| PetTalentMask | INT | 宠物天赋掩码 |
| OrderIndex | INT | 排序索引 |
| BackgroundFile | VARCHAR(100) | 背景图片文件 |

### 6.86 taxinodes_dbc (Taxi节点数据库表)

taxinodes_dbc表定义了所有飞行路线节点。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 节点ID |
| ContinentID | INT | 所在大陆ID |
| X/Y/Z | FLOAT | 坐标位置 |
| Name_Lang_zhCN | VARCHAR(100) | 中文名称 |
| MountCreatureID_1-2 | INT | 骑乘生物ID(1和2) |

### 6.87 taxipath_dbc (Taxi路径数据库表)

taxipath_dbc表定义了飞行路径的路线信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 路径ID |
| FromTaxiNode | INT | 起始节点 |
| ToTaxiNode | INT | 目标节点 |
| Cost | INT | 费用 |

### 6.88 taxipathnode_dbc (Taxi路径节点数据库表)

taxipathnode_dbc表定义了飞行路径的详细节点。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 节点ID |
| PathID | INT | 路径ID |
| NodeIndex | INT | 节点索引 |
| ContinentID | INT | 所在大陆ID |
| LocX/Y/Z | FLOAT | 节点坐标 |
| Flags | INT | 节点标志 |
| Delay | INT | 延迟时间 |
| ArrivalEventID | INT | 到达事件ID |
| DepartureEventID | INT | 出发事件ID |

### 6.89 teamcontributionpoints_dbc (队伍贡献点数据库表)

teamcontributionpoints_dbc表定义了队伍贡献点数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID |
| Data | FLOAT | 贡献点数据 |

### 6.90 totemcategory_dbc (图腾分类数据库表)

totemcategory_dbc表定义了游戏中图腾的分类信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 图腾分类ID |
| Name_Lang_zhCN | VARCHAR(100) | 中文名称 |
| TotemCategoryType | INT | 图腾分类类型 |
| TotemCategoryMask | INT | 图腾分类掩码 |

### 6.91 trainer (训练师表)

trainer表定义了游戏中训练师的基本信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| Id | INT | 训练师ID |
| Type | TINYINT | 训练师类型(0=职业训练师,1=技能训练师,2=专业训练师) |
| Requirement | MEDIUMINT | 需求条件 |
| Greeting | MEDIUMTEXT | 问候语 |
| VerifiedBuild | INT | 验证版本 |

### 6.92 trainer_locale (训练师本地化表)

trainer_locale表存储训练师文本的多语言版本。

| 字段 | 类型 | 说明 |
|------|------|------|
| Id | INT | 训练师ID |
| locale | VARCHAR(4) | 语言代码 |
| Greeting_lang | MEDIUMTEXT | 当地语言问候语 |
| VerifiedBuild | INT | 验证版本 |

### 6.93 trainer_spell (训练师法术表)

trainer_spell表定义了训练师可以教授的法术。

| 字段 | 类型 | 说明 |
|------|------|------|
| TrainerId | INT | 训练师ID |
| SpellId | INT | 法术ID |
| MoneyCost | INT | 训练费用(铜币) |
| ReqSkillLine | INT | 需求技能线 |
| ReqSkillRank | INT | 需求技能等级 |
| ReqAbility1-3 | INT | 前置能力1-3 |
| ReqLevel | TINYINT | 需求等级 |
| VerifiedBuild | INT | 验证版本 |

---

### 6.94 transportanimation_dbc (运输工具动画数据库表)

transportanimation_dbc表定义了运输工具(如飞船、电梯)的动画节点位置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 动画ID |
| TransportID | INT | 运输工具ID |
| TimeIndex | INT | 时间索引 |
| PosX/Y/Z | FLOAT | 位置坐标 |
| SequenceID | INT | 序列ID |

### 6.95 transportrotation_dbc (运输工具旋转数据库表)

transportrotation_dbc表定义了运输工具的旋转动画数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 旋转ID |
| GameObjectsID | INT | 游戏对象ID |
| TimeIndex | INT | 时间索引 |
| RotX/Y/Z/W | FLOAT | 四元数旋转值 |

### 6.96 transports (运输工具表)

transports表定义了游戏中的运输工具(如船、飞艇)。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 运输工具GUID |
| entry | INT | 运输工具条目ID |
| name | TEXT | 运输工具名称 |
| ScriptName | CHAR(64) | 脚本名称 |

### 6.97 updates (数据库更新记录表)

updates表记录了所有已应用的数据库更新。

| 字段 | 类型 | 说明 |
|------|------|------|
| name | VARCHAR(200) | 更新文件名 |
| hash | CHAR(40) | SQL文件的SHA1哈希值 |
| state | ENUM | 状态(RELEASED/CUSTOM/MODULE/ARCHIVED/PENDING) |
| timestamp | TIMESTAMP | 应用时间戳 |
| speed | INT | 执行速度(毫秒) |

### 6.98 updates_include (更新包含目录表)

updates_include表定义了需要包含SQL更新的目录。

| 字段 | 类型 | 说明 |
|------|------|------|
| path | VARCHAR(200) | 目录路径($表示相对路径) |
| state | ENUM | 状态(RELEASED/ARCHIVED/CUSTOM/PENDING) |

---

### 6.99 vehicle_accessory (载具附件表)

vehicle_accessory表定义了载具的附件(如骑乘的生物)。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 载具GUID |
| accessory_entry | INT | 附件生物条目ID |
| seat_id | TINYINT | 座位ID |
| minion | TINYINT | 是否为宠物(0/1) |
| description | TEXT | 描述信息 |
| summontype | TINYINT | 召唤类型 |
| summontimer | INT | 召唤计时器(毫秒) |

### 6.100 vehicle_dbc (载具数据库表)

vehicle_dbc表定义了载具的基础配置数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 载具ID |
| Flags | INT | 载具标志 |
| TurnSpeed | FLOAT | 转向速度 |
| PitchSpeed | FLOAT | 俯仰速度 |
| SeatID_1-8 | INT | 座位ID(1-8) |
| PowerDisplayID_1-3 | INT | 能量显示ID |

### 6.101 vehicle_seat_addon (载具座位附加表)

vehicle_seat_addon表为载具座位提供额外的配置信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| SeatEntry | INT | 座位条目ID |
| SeatOrientation | FLOAT | 座位朝向 |
| ExitParamX/Y/Z/O | FLOAT | 退出位置参数 |
| ExitParamValue | TINYINT | 退出参数值 |

### 6.102 vehicle_template_accessory (载具模板附件表)

vehicle_template_accessory表定义了载具模板的附件配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 载具模板ID |
| accessory_entry | INT | 附件生物条目ID |
| seat_id | TINYINT | 座位ID |
| minion | TINYINT | 是否为宠物(0/1) |
| description | TEXT | 描述信息 |
| summontype | TINYINT | 召唤类型 |
| summontimer | INT | 召唤计时器(毫秒) |

### 6.103 vehicleseat_dbc (载具座位数据库表)

vehicleseat_dbc表定义了载具座位的详细配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 座位ID |
| Flags | INT | 座位标志 |
| AttachmentID | INT | 附件ID |
| AttachmentOffsetX/Y/Z | FLOAT | 附件偏移量 |
| EnterPreDelay | FLOAT | 进入前延迟 |
| EnterSpeed | FLOAT | 进入速度 |
| RideAnimStart | INT | 骑乘动画开始 |
| ExitSpeed | FLOAT | 退出速度 |
| PassengerYaw/Pitch/Roll | FLOAT | 乘客朝向 |
| CameraEnteringDelay | FLOAT | 相机进入延迟 |
| CameraOffsetX/Y/Z | FLOAT | 相机偏移量 |

### 6.104 version (版本信息表)

version表存储了服务器和数据库的版本信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| core_version | VARCHAR(255) | 核心版本名称 |
| core_revision | VARCHAR(120) | 核心Git提交哈希 |
| db_version | VARCHAR(120) | 数据库版本 |
| cache_id | INT | 缓存ID |

### 6.105 warden_checks ( Warden 反作弊检查表)

warden_checks表定义了客户端 Warden 反作弊系统的检查规则。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | SMALLINT | 检查ID (自增主键) |
| type | TINYINT | 检查类型 |
| data | VARCHAR(48) | 检查数据 |
| str | VARCHAR(170) | 字符串数据 |
| address | INT | 内存地址 |
| length | TINYINT | 数据长度 |
| result | VARCHAR(24) | 检查结果 |
| comment | VARCHAR(50) | 备注信息 |

### 6.106 waypoint_data (路径点数据表)

waypoint_data表存储了生物移动路径点的详细信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 生物GUID |
| point | INT | 路径点序号 |
| position_x/y/z | FLOAT | 坐标位置 |
| orientation | FLOAT | 朝向角度 |
| delay | INT | 到达后延迟时间 |
| move_type | INT | 移动类型 |
| action | INT | 触发动作 |
| action_chance | SMALLINT | 动作触发概率 |
| wpguid | INT | 路径点GUID |

### 6.107 waypoint_scripts (路径点脚本表)

waypoint_scripts表定义了路径点触发的脚本命令。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 生物GUID |
| delay | INT | 执行延迟 |
| command | INT | 命令类型 |
| datalong | INT | 数据参数1 |
| datalong2 | INT | 数据参数2 |
| dataint | INT | 整数数据 |
| x/y/z | FLOAT | 坐标位置 |
| o | FLOAT | 朝向 |
| guid | INT | 脚本记录GUID |

### 6.108 waypoints (路径点表)

waypoints表定义了生物的路径点列表及注释信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 生物条目ID |
| pointid | INT | 路径点ID |
| position_x/y/z | FLOAT | 坐标位置 |
| orientation | FLOAT | 朝向角度 |
| delay | INT | 延迟时间 |
| point_comment | TEXT | 路径点备注 |

### 6.109 achievement_reward (成就奖励表)

achievement_reward表定义了成就完成后的奖励内容。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 成就ID |
| TitleA | INT | 联盟玩家获得的头衔ID |
| TitleH | INT | 部落玩家获得的头衔ID |
| ItemID | INT | 奖励物品ID |
| Sender | INT | 发送者NPC ID |
| Subject | VARCHAR(255) | 邮件主题 |
| Body | TEXT | 邮件正文内容 |
| MailTemplateID | INT | 邮件模板ID |

### 6.110 achievement_reward_locale (成就奖励本地化表)

achievement_reward_locale表存储成就奖励邮件的多语言版本。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 成就ID |
| Locale | VARCHAR(4) | 语言代码 (如 zhCN, enUS) |
| Subject | TEXT | 邮件主题 (本地化) |
| Text | TEXT | 邮件正文 (本地化) |

### 6.111 achievement_category_dbc (成就类别数据库表)

achievement_category_dbc表定义了成就的分类结构。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 类别ID |
| Parent | INT | 父类别ID |
| Name_Lang_enUS ~ Name_Lang_Mask | 多语言字段 | 类别名称 (支持多语言) |
| Ui_Order | INT | UI排序顺序 |

### 6.112 achievement_criteria_dbc (成就条件数据库表)

achievement_criteria_dbc表定义了成就的具体完成条件。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 条件ID |
| Achievement_Id | INT | 所属成就ID |
| Type | INT | 条件类型 |
| Asset_Id | INT | 资产ID |
| Quantity | INT | 所需数量 |
| Start_Event | INT | 开始事件 |
| Start_Asset | INT | 开始资产 |
| Fail_Event | INT | 失败事件 |
| Fail_Asset | INT | 失败资产 |
| Description_Lang_* | 多语言字段 | 条件描述 |
| Flags | INT | 标志 |
| Timer_Start_Event | INT | 计时器开始事件 |
| Timer_Asset_Id | INT | 计时器资产ID |
| Timer_Time | INT | 计时器时间 |
| Ui_Order | INT | UI排序顺序 |

### 6.113 achievement_criteria_data (成就条件数据表)

achievement_criteria_data表存储成就条件的额外数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| criteria_id | INT | 条件ID |
| type | TINYINT | 数据类型 |
| value1 | INT | 数据值1 |
| value2 | INT | 数据值2 |
| ScriptName | CHAR(64) | 关联脚本名称 |

### 6.114 achievement_dbc (成就数据库表)

achievement_dbc表是成就的主数据表。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 成就ID |
| Faction | INT | 阵营限制 (-1表示无限制) |
| Instance_Id | INT | 副本ID |
| Supercedes | INT | 被取代的成就ID |
| Title_Lang_* | 多语言字段 | 成就标题 |
| Description_Lang_* | 多语言字段 | 成就描述 |
| Category | INT | 所属类别 |
| Points | INT | 成就点数 |
| Ui_Order | INT | UI排序顺序 |
| Flags | INT | 成就标志 |
| IconID | INT | 图标ID |
| Reward_Lang_* | 多语言字段 | 奖励描述 |
| Minimum_Criteria | INT | 最低条件数 |
| Shares_Criteria | INT | 共享条件ID |

### 6.115 antidos_opcode_policies (反DOS操作码策略表)

antidos_opcode_policies表定义了服务器对客户端操作码的限流策略。

| 字段 | 类型 | 说明 |
|------|------|------|
| Opcode | SMALLINT | 操作码 |
| Policy | TINYINT | 策略类型 |
| MaxAllowedCount | SMALLINT | 最大允许次数 |

### 6.116 areatrigger (区域触发器表)

areatrigger表定义了游戏中的区域触发器坐标。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 触发器ID (自增主键) |
| map | INT | 地图ID |
| x/y/z | FLOAT | 中心坐标 |
| radius | FLOAT | 触发半径 (码) |
| length/width/height | FLOAT | 触发区域尺寸 |
| orientation | FLOAT | 朝向角度 |

### 6.117 areatrigger_involvedrelation (区域触发器关联任务表)

areatrigger_involvedrelation表定义了区域触发器与任务的关联。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 触发器ID |
| quest | INT | 任务ID |

### 6.118 areatrigger_scripts (区域触发器脚本表)

areatrigger_scripts表为区域触发器绑定自定义脚本。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 触发器ID |
| ScriptName | CHAR(64) | 脚本名称 |

### 6.119 areatrigger_tavern (区域触发器酒馆表)

areatrigger_tavern表定义酒馆类型的区域触发器。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 触发器ID |
| name | TEXT | 酒馆名称 |
| faction | INT | 所属阵营 |

### 6.120 areatrigger_teleport (区域触发器传送表)

areatrigger_teleport表定义传送门类型的区域触发器。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 触发器ID |
| Name | TEXT | 传送门名称 |
| target_map | SMALLINT | 目标地图ID |
| target_position_x/y/z | FLOAT | 目标坐标 |
| target_orientation | FLOAT | 目标朝向 |

### 6.121 arena_season_reward (竞技场赛季奖励表)

arena_season_reward表定义竞技场赛季排名奖励。

| 字段 | 类型 | 说明 |
|------|------|------|
| group_id | INT | 奖励组ID (关联arena_season_reward_group) |
| type | ENUM | 奖励类型 (achievement/item) |
| entry | INT | 成就ID或物品ID |

### 6.122 arena_season_reward_group (竞技场赛季奖励组表)

arena_season_reward_group表定义竞技场赛季奖励组的详细规则。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 组ID (自增主键) |
| arena_season | TINYINT | 赛季编号 |
| criteria_type | ENUM | 评判类型 (pct-百分比/abs-绝对排名) |
| min_criteria | FLOAT | 最低条件值 |
| max_criteria | FLOAT | 最高条件值 |
| reward_mail_template_id | INT | 奖励邮件模板ID |
| reward_mail_subject | VARCHAR(255) | 邮件主题 |
| reward_mail_body | TEXT | 邮件正文 |
| gold_reward | INT | 金币奖励数量 |

### 6.123 battleground_template (战场模板表)

battleground_template表定义了战场的模板配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 战场ID |
| MinPlayersPerTeam | SMALLINT | 每队最少玩家数 |
| MaxPlayersPerTeam | SMALLINT | 每队最多玩家数 |
| MinLvl | TINYINT | 最低等级要求 |
| MaxLvl | TINYINT | 最高等级限制 |
| AllianceStartLoc | INT | 联盟起始位置ID |
| AllianceStartO | FLOAT | 联盟起始朝向 |
| HordeStartLoc | INT | 部落起始位置ID |
| HordeStartO | FLOAT | 部落起始朝向 |
| StartMaxDist | FLOAT | 起始区域最大距离 |
| Weight | TINYINT | 权重 (随机战场权重) |
| ScriptName | CHAR(64) | 脚本名称 |
| Comment | CHAR(38) | 战场名称备注 |

### 6.124 battlemaster_entry (战场管理员入口表)

battlemaster_entry表定义了哪些NPC可以进入哪个战场。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 战场管理员NPC的entry值 |
| bg_template | INT | 战场模板ID |

### 6.125 battlemasterlist_dbc (战场列表数据库表)

battlemasterlist_dbc表存储了所有战场的信息定义。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 战场ID |
| MapID_1~8 | INT | 战场地图ID（最多8个） |
| InstanceType | INT | 实例类型 |
| GroupsAllowed | INT | 允许的队伍人数 |
| Name_Lang_enUS等 | VARCHAR(100) | 战场名称（多语言） |
| Name_Lang_Mask | INT | 语言掩码 |
| MaxGroupSize | INT | 最大队伍人数 |
| HolidayWorldState | INT | 节日世界状态 |
| Minlevel | INT | 最低等级 |
| Maxlevel | INT | 最高等级 |

### 6.126 broadcast_text (广播文本表)

broadcast_text表存储了游戏中NPC的对话文本和广播信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 文本ID |
| LanguageID | INT | 语言ID |
| MaleText | LONGTEXT | 男性文本 |
| FemaleText | LONGTEXT | 女性文本 |
| EmoteID1~3 | INT | 表情ID（最多3个） |
| EmoteDelay1~3 | INT | 表情延迟（毫秒） |
| SoundEntriesId | INT | 音效ID |
| EmotesID | INT | 表情组ID |
| Flags | INT | 标志 |
| VerifiedBuild | SMALLINT | 验证版本 |

### 6.127 broadcast_text_locale (广播文本本地化表)

broadcast_text_locale表存储了广播文本的多语言版本。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 广播文本ID |
| locale | VARCHAR(4) | 语言代码 |
| MaleText | TEXT | 男性文本（本地化） |
| FemaleText | TEXT | 女性文本（本地化） |
| VerifiedBuild | SMALLINT | 验证版本 |

### 6.128 creature (生物表)

creature表存储了世界中所有生物（Npc）的实例数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 生物实例唯一ID（自增主键） |
| id1 | INT | 生物ID（主要ID） |
| id2 | INT | 生物ID（扩展1） |
| id3 | INT | 生物ID（扩展2） |
| map | SMALLINT | 地图ID |
| zoneId | SMALLINT | 区域ID |
| areaId | SMALLINT | 地区ID |
| spawnMask | TINYINT | 生成掩码 |
| phaseMask | INT | 相位掩码 |
| equipment_id | TINYINT | 装备模板ID |
| position_x/y/z | FLOAT | 坐标位置 |
| orientation | FLOAT | 朝向角度 |
| spawntimesecs | INT | 生成时间（秒） |
| wander_distance | FLOAT | 漫游距离 |
| currentwaypoint | INT | 当前路径点 |
| curhealth | INT | 当前生命值 |
| curmana | INT | 当前法力值 |
| MovementType | TINYINT | 移动类型 |
| npcflag | INT | NPC标志 |
| unit_flags | INT | 单位标志 |
| dynamicflags | INT | 动态标志 |
| ScriptName | CHAR(64) | 自定义脚本名称 |
| VerifiedBuild | INT | 验证版本 |
| CreateObject | TINYINT | 是否创建为对象 |
| Comment | TEXT | 备注信息 |

### 6.129 creature_classlevelstats (生物等级属性表)

creature_classlevelstats表定义了生物每等级的基础属性。

| 字段 | 类型 | 说明 |
|------|------|------|
| level | TINYINT | 等级 |
| class | TINYINT | 职业/类型 |
| basehp0~2 | INT | 基础生命值（0/1/2难度） |
| basemana | INT | 基础法力值 |
| basearmor | INT | 基础护甲 |
| attackpower | INT | 攻击强度 |
| rangedattackpower | INT | 远程攻击强度 |
| damage_base | FLOAT | 基础伤害 |
| damage_exp1~2 | FLOAT | 额外伤害 |
| Strength | INT | 力量属性 |
| Agility | INT | 敏捷属性 |
| Stamina | INT | 耐力属性 |
| Intellect | INT | 智力属性 |
| Spirit | INT | 精神属性 |

### 6.130 creature_default_trainer (生物默认训练师表)

creature_default_trainer表定义了生物默认的训练师模板。

| 字段 | 类型 | 说明 |
|------|------|------|
| CreatureId | INT | 生物ID |
| TrainerId | INT | 训练师模板ID |

### 6.131 creature_equip_template (生物装备模板表)

creature_equip_template表定义了生物穿戴的装备模板。

| 字段 | 类型 | 说明 |
|------|------|------|
| CreatureID | INT | 生物ID |
| ID | TINYINT | 装备模板ID |
| ItemID1~3 | INT | 装备物品ID（主手/副手/远程） |
| VerifiedBuild | INT | 验证版本 |

### 6.132 creature_loot_template (生物掉落模板表)

creature_loot_template表定义了生物被击杀时的掉落物品。

| 字段 | 类型 | 说明 |
|------|------|------|
| Entry | INT | 生物ID |
| Item | INT | 物品ID |
| Reference | INT | 引用模板ID（0表示直接掉落） |
| Chance | FLOAT | 掉落概率（百分比） |
| QuestRequired | TINYINT | 是否任务需求 |
| LootMode | SMALLINT | 掉落模式 |
| GroupId | TINYINT | 分组ID |
| MinCount | TINYINT | 最小数量 |
| MaxCount | TINYINT | 最大数量 |
| Comment | VARCHAR(255) | 备注信息 |

### 6.134 creature_addon (生物额外信息表)

creature_addon表存储了生物实例的额外信息，如路径ID、坐骑、姿态和光环等。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 生物实例GUID |
| path_id | INT | 路径ID（移动路径） |
| mount | INT | 坐骑显示ID |
| bytes1 | INT | 字节字段1（姿态等） |
| bytes2 | INT | 字节字段2 |
| emote | INT | 表情动画ID |
| visibilityDistanceType | TINYINT | 可见距离类型 |
| auras | TEXT | 生效光环列表 |

### 6.135 creature_formations (生物编队表)

creature_formations表定义了生物之间的编队关系，使多个生物能够保持特定队形移动。

| 字段 | 类型 | 说明 |
|------|------|------|
| leaderGUID | INT | 队长GUID |
| memberGUID | INT | 成员GUID |
| dist | FLOAT | 与队长的距离 |
| angle | FLOAT | 与队长的角度 |
| groupAI | INT | 编队AI标志 |
| point_1 | SMALLINT | 路径点1 |
| point_2 | SMALLINT | 路径点2 |

### 6.136 creature_template (生物模板表)

creature_template表是定义游戏中所有生物的核心模板表，包含了生物的基本属性、AI设置、战斗参数等。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 生物模板ID（主键） |
| difficulty_entry_1~3 | INT | 不同难度版本ID |
| KillCredit1/2 | INT | 击杀积分奖励ID |
| name | CHAR(100) | 生物名称 |
| subname | CHAR(100) | 副名称 |
| IconName | CHAR(100) | 图标名称 |
| gossip_menu_id | INT | 对话菜单ID |
| minlevel/maxlevel | TINYINT | 最小/最大等级 |
| exp | SMALLINT | 经验值倍数 |
| faction | SMALLINT | 阵营ID |
| npcflag | INT | NPC标志 |
| speed_walk/run/swim/flight | FLOAT | 移动速度 |
| detection_range | FLOAT | 感知范围 |
| scale | FLOAT | 模型缩放 |
| rank | TINYINT | 稀有度等级 (0=普通,1=精英,2=稀有,3=世界BOSS) |
| dmgschool | TINYINT | 伤害系 |
| DamageModifier | FLOAT | 伤害修正 |
| BaseAttackTime/RangeAttackTime | INT | 攻击间隔 |
| unit_class | TINYINT | 单位职业 |
| unit_flags/unit_flags2 | INT | 单位标志 |
| dynamicflags | INT | 动态标志 |
| family | TINYINT | 家族分类 |
| type | TINYINT | 生物类型 |
| type_flags | INT | 类型标志 |
| lootid/pickpocketloot/skinloot | INT | 掉落/偷窃/剥皮模板ID |
| VehicleId | INT | 载具ID |
| mingold/maxgold | INT | 金币数量范围 |
| AIName | CHAR(64) | AI名称 |
| MovementType | TINYINT | 移动类型 |
| HoverHeight | FLOAT | 悬浮高度 |
| Health/Mana/ArmorModifier | FLOAT | 属性修正 |
| RacialLeader | TINYINT | 种族领袖标志 |
| movementId | INT | 移动ID |
| RegenHealth | TINYINT | 自动回血 |
| mechanic_immune_mask | INT | 免疫机制掩码 |
| spell_school_immune_mask | INT | 法术系免疫掩码 |
| flags_extra | INT | 额外标志 |
| ScriptName | CHAR(64) | 脚本名称 |

### 6.137 creature_template_locale (生物模板本地化表)

creature_template_locale表存储了生物模板的名称和称号的本地化翻译。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 生物模板ID |
| locale | VARCHAR(4) | 语言代码 |
| Name | TEXT | 本地化名称 |
| Title | TEXT | 本地化称号 |
| VerifiedBuild | INT | 验证版本 |

### 6.138 creature_template_movement (生物模板移动表)

creature_template_movement表定义了生物模板的移动模式，覆盖默认设置。

| 字段 | 类型 | 说明 |
|------|------|------|
| CreatureId | INT | 生物模板ID |
| Ground | TINYINT | 地面移动类型 |
| Swim | TINYINT | 水下移动类型 |
| Flight | TINYINT | 飞行移动类型 |
| Rooted | TINYINT | 定身类型 |
| Chase | TINYINT | 追逐移动类型 |
| Random | TINYINT | 随机移动类型 |
| InteractionPauseTimer | INT | 玩家交互后暂停时间(毫秒) |

### 6.139 creature_questitem (生物任务物品表)

creature_questitem表定义了特定生物在完成某些任务时额外提供的物品。

| 字段 | 类型 | 说明 |
|------|------|------|
| CreatureEntry | INT | 生物模板ID |
| Idx | INT | 物品索引 |
| ItemId | INT | 物品ID |
| VerifiedBuild | INT | 验证版本 |

### 6.140 creature_sparring (生物切磋表)

creature_sparring表用于设置生物切磋练习的伤害百分比限制。

| 字段 | 类型 | 说明 |
|------|------|------|
| GUID | INT | 生物实例GUID |
| SparringPCT | FLOAT | 切磋伤害百分比 (0-100) |

### 6.141 creature_summon_groups (生物召唤组表)

creature_summon_groups表定义了生物召唤时的分组信息，包括召唤位置和类型。

| 字段 | 类型 | 说明 |
|------|------|------|
| summonerId | INT | 召唤者ID |
| summonerType | TINYINT | 召唤者类型 |
| groupId | TINYINT | 分组ID |
| entry | INT | 被召唤生物ID |
| position_x/y/z | FLOAT | 召唤位置坐标 |
| orientation | FLOAT | 召唤朝向 |
| summonType | TINYINT | 召唤类型 |
| summonTime | INT | 召唤持续时间 |
| Comment | VARCHAR(255) | 备注 |

---

### 6.142 creature_text_locale (生物文本本地化表)

creature_text_locale表存储生物对话文本的本地化翻译内容，支持多种语言。

| 字段 | 类型 | 说明 |
|------|------|------|
| CreatureID | INT | 生物ID |
| GroupID | TINYINT | 文本组ID |
| ID | TINYINT | 文本ID |
| Locale | VARCHAR(4) | 语言代码 (如 zhCN, frFR) |
| Text | TEXT | 本地化文本内容 |

### 6.143 creature_movement_override (生物移动覆盖表)

creature_movement_override表用于覆盖特定生物的移动行为设置。

| 字段 | 类型 | 说明 |
|------|------|------|
| SpawnId | INT | 生物刷新ID，主键 |
| Ground | TINYINT | 地面移动模式 |
| Swim | TINYINT | 游泳模式 |
| Flight | TINYINT | 飞行模式 |
| Rooted | TINYINT | 束缚状态 |
| Chase | TINYINT | 追击模式 |
| Random | TINYINT | 随机移动模式 |
| InteractionPauseTimer | INT | 玩家交互后的暂停时间(毫秒) |

### 6.144 disables (禁用条目表)

disables表定义服务器中被禁用的各种功能，如技能、任务、成就等。

| 字段 | 类型 | 说明 |
|------|------|------|
| sourceType | INT | 禁用来源类型 |
| entry | INT | 被禁用的条目ID |
| flags | TINYINT | 禁用标志 |
| params_0 | VARCHAR(255) | 额外参数0 |
| params_1 | VARCHAR(255) | 额外参数1 |
| comment | VARCHAR(255) | 备注说明 |

### 6.145 exploration_basexp (探索基础经验表)

exploration_basexp表定义玩家探索区域时获得的基础经验值，按等级排列。

| 字段 | 类型 | 说明 |
|------|------|------|
| level | TINYINT | 玩家等级，主键 |
| basexp | INT | 基础经验值 |

### 6.146 factiontemplate_dbc (阵营模板表)

factiontemplate_dbc表定义了游戏中的阵营模板，包括阵营关系和敌友状态。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 模板ID，主键 |
| Faction | INT | 阵营ID |
| Flags | INT | 阵营标志 |
| FactionGroup | INT | 阵营组 |
| FriendGroup | INT | 友好阵营组 |
| EnemyGroup | INT | 敌对阵营组 |
| Enemies_1-4 | INT | 敌对阵营ID (4个) |
| Friend_1-4 | INT | 友好阵营ID (4个) |

### 6.147 fishing_loot_template (钓鱼掉落模板表)

fishing_loot_template表定义钓鱼活动的物品掉落规则。

| 字段 | 类型 | 说明 |
|------|------|------|
| Entry | INT | 钓鱼区域ID |
| Item | INT | 物品ID |
| Reference | INT | 引用模板ID |
| Chance | FLOAT | 掉落概率(%) |
| QuestRequired | TINYINT | 是否任务需求 |
| LootMode | SMALLINT | 掉落模式 |
| GroupId | TINYINT | 分组ID |
| MinCount | TINYINT | 最小数量 |
| MaxCount | TINYINT | 最大数量 |
| Comment | VARCHAR(255) | 备注说明 |

### 6.148 game_event_arena_seasons (竞技场赛季事件表)

game_event_arena_seasons表关联游戏事件与竞技场赛季。

| 字段 | 类型 | 说明 |
|------|------|------|
| eventEntry | TINYINT | 游戏事件ID |
| season | TINYINT | 竞技场赛季编号，复合唯一键 |

### 6.149 game_event_condition (游戏事件条件表)

game_event_condition表定义游戏事件触发所需的条件。

| 字段 | 类型 | 说明 |
|------|------|------|
| eventEntry | TINYINT | 游戏事件ID，主键 |
| condition_id | INT | 条件ID，主键 |
| req_num | FLOAT | 需求数值 |
| max_world_state_field | SMALLINT | 最大世界状态字段 |
| done_world_state_field | SMALLINT | 完成世界状态字段 |
| description | VARCHAR(25) | 条件描述 |

### 6.150 game_event_creature_quest (游戏事件生物任务表)

game_event_creature_quest表关联游戏事件中生物与任务的关系。

| 字段 | 类型 | 说明 |
|------|------|------|
| eventEntry | TINYINT | 游戏事件ID |
| id | INT | 生物ID，复合主键 |
| quest | INT | 任务ID，复合主键 |

---

### 6.151 game_event_gameobject (游戏事件游戏对象表)

game_event_gameobject表关联游戏事件与游戏对象(GO)的刷新状态。

| 字段 | 类型 | 说明 |
|------|------|------|
| eventEntry | SMALLINT | 游戏事件ID，负值表示事件期间移除 |
| guid | INT | 游戏对象的全局唯一标识 |

### 6.152 game_event_gameobject_quest (游戏事件对象任务表)

game_event_gameobject_quest表关联游戏事件中游戏对象与任务的关系。

| 字段 | 类型 | 说明 |
|------|------|------|
| eventEntry | TINYINT | 游戏事件ID |
| id | INT | 游戏对象ID，复合主键 |
| quest | INT | 任务ID，复合主键 |

### 6.153 game_event_npcflag (游戏事件NPC标志表)

game_event_npcflag表定义游戏事件期间NPC的标志位变化。

| 字段 | 类型 | 说明 |
|------|------|------|
| eventEntry | TINYINT | 游戏事件ID，主键 |
| guid | INT | NPC的全局唯一标识，主键 |
| npcflag | INT | NPC标志位 |

### 6.154 game_event_pool (游戏事件对象池表)

game_event_pool表关联游戏事件与对象池。

| 字段 | 类型 | 说明 |
|------|------|------|
| eventEntry | SMALLINT | 游戏事件ID，负值表示事件期间移除 |
| pool_entry | INT | 对象池ID，主键 |

### 6.155 game_event_prerequisite (游戏事件前置条件表)

game_event_prerequisite表定义游戏事件的前置条件事件。

| 字段 | 类型 | 说明 |
|------|------|------|
| eventEntry | TINYINT | 游戏事件ID，主键 |
| prerequisite_event | INT | 前置事件ID，复合主键 |

### 6.156 game_tele (游戏传送表)

game_tele表存储所有游戏内传送命令可到达的位置点。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 传送点ID，主键 |
| position_x | FLOAT | X坐标 |
| position_y | FLOAT | Y坐标 |
| position_z | FLOAT | Z坐标 |
| orientation | FLOAT | 朝向 |
| map | SMALLINT | 地图ID |
| name | VARCHAR(100) | 传送点名称 |

### 6.157 game_weather (游戏天气表)

game_weather表定义各区域在不同季节的天气概率。

| 字段 | 类型 | 说明 |
|------|------|------|
| zone | INT | 区域ID，主键 |
| spring_rain_chance | TINYINT | 春季下雨概率 |
| spring_snow_chance | TINYINT | 春季下雪概率 |
| spring_storm_chance | TINYINT | 春季暴风雨概率 |
| summer_rain_chance | TINYINT | 夏季下雨概率 |
| summer_snow_chance | TINYINT | 夏季下雪概率 |
| summer_storm_chance | TINYINT | 夏季暴风雨概率 |
| fall_rain_chance | TINYINT | 秋季下雨概率 |
| fall_snow_chance | TINYINT | 秋季下雪概率 |
| fall_storm_chance | TINYINT | 秋季暴风雨概率 |
| winter_rain_chance | TINYINT | 冬季下雨概率 |
| winter_snow_chance | TINYINT | 冬季下雪概率 |
| winter_storm_chance | TINYINT | 冬季暴风雨概率 |
| ScriptName | CHAR(64) | 天气脚本名称 |

### 6.158 gameobject_loot_template (游戏对象掉落模板表)

gameobject_loot_template表定义游戏对象(如宝箱、尸体等)的物品掉落规则。

| 字段 | 类型 | 说明 |
|------|------|------|
| Entry | INT | 游戏对象ID |
| Item | INT | 物品ID |
| Reference | INT | 引用模板ID |
| Chance | FLOAT | 掉落概率(%) |
| QuestRequired | TINYINT | 是否任务需求 |
| LootMode | SMALLINT | 掉落模式 |
| GroupId | TINYINT | 分组ID |
| MinCount | TINYINT | 最小数量 |
| MaxCount | TINYINT | 最大数量 |
| Comment | VARCHAR(255) | 备注说明 |

### 6.159 gameobject_summon_groups (游戏对象召唤组表)

gameobject_summon_groups表定义游戏对象召唤生物的位置和参数。

| 字段 | 类型 | 说明 |
|------|------|------|
| summonerId | INT | 召唤者ID |
| summonerType | TINYINT | 召唤者类型 |
| groupId | TINYINT | 分组ID |
| entry | INT | 被召唤对象ID |
| position_x/y/z | FLOAT | 召唤位置坐标 |
| orientation | FLOAT | 召唤朝向 |
| rotation0-3 | FLOAT | 旋转角度 |
| respawnTime | INT | 重生时间(秒) |
| Comment | VARCHAR(255) | 备注说明 |

### 6.160 gemproperties_dbc (宝石属性表)

gemproperties_dbc表定义游戏中宝石的属性和附魔信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 宝石属性ID，主键 |
| Enchant_Id | INT | 附魔ID |
| Maxcount_Inv | INT | 背包最大堆叠数 |
| Maxcount_Item | INT | 物品最大堆叠数 |
| Type | INT | 宝石类型 |

### 6.161 gossip_menu_option (对话菜单选项表)

gossip_menu_option表定义游戏中NPC对话菜单的选项。

| 字段 | 类型 | 说明 |
|------|------|------|
| MenuID | INT | 菜单ID，复合主键 |
| OptionID | SMALLINT | 选项ID，复合主键 |
| OptionIcon | INT | 选项图标 |
| OptionText | TEXT | 选项文本 |
| OptionBroadcastTextID | INT | 选项广播文本ID |
| OptionType | TINYINT | 选项类型 (1=对话, 2=任务等) |
| OptionNpcFlag | INT | NPC标志位需求 |
| ActionMenuID | INT | 点击后打开的菜单ID |
| ActionPoiID | INT | 关联的POI信息ID |
| BoxCoded | TINYINT | 是否需要输入验证码 |
| BoxMoney | INT | 需要输入的金钱数量 |
| BoxText | TEXT | 验证码框文本 |
| BoxBroadcastTextID | INT | 验证码框广播文本ID |
| VerifiedBuild | INT | 验证版本号 |

### 6.162 gossip_menu_option_locale (对话菜单选项本地化表)

gossip_menu_option_locale表存储对话菜单选项的多语言文本。

| 字段 | 类型 | 说明 |
|------|------|------|
| MenuID | INT | 菜单ID，复合主键 |
| OptionID | SMALLINT | 选项ID，复合主键 |
| Locale | VARCHAR(4) | 语言代码(如zhCN, enUS等)，复合主键 |
| OptionText | TEXT | 选项文本(该语言) |
| BoxText | TEXT | 验证码框文本(该语言) |

### 6.163 graveyard_zone (墓地区域表)

graveyard_zone表定义各区域的墓地位置和可用阵营。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 记录ID，复合主键 |
| GhostZone | INT | 墓地所属区域ID，复合主键 |
| Faction | SMALLINT | 可用阵营 (0=双方, 67=部落, 469=联盟) |
| Comment | TEXT | 备注说明 |

### 6.164 gtbarbershopcostbase_dbc (理发店基础成本表)

gtbarbershopcostbase_dbc表定义游戏中理发店各等级的基础消费成本。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 等级ID (0-99)，主键 |
| Data | FLOAT | 基础消费成本 |

### 6.165 gtchancetomeleecritbase_dbc (近战暴击基础概率表)

gtchancetomeleecritbase_dbc表定义角色近战暴击的基础概率。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 索引ID，主键 |
| Data | FLOAT | 近战暴击基础概率值 |

### 6.166 gtchancetomeleecrit_dbc (近战暴击概率表)

gtchancetomeleecrit_dbc表定义角色随等级变化的近战暴击概率。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 索引ID (等级*系数+职业)，主键 |
| Data | FLOAT | 近战暴击概率值 |

### 6.167 gtchancetospellcritbase_dbc (法术暴击基础概率表)

gtchancetospellcritbase_dbc表定义角色法术暴击的基础概率。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 索引ID，主键 |
| Data | FLOAT | 法术暴击基础概率值 |

### 6.168 gtchancetospellcrit_dbc (法术暴击概率表)

gtchancetospellcrit_dbc表定义角色随等级变化的法术暴击概率。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 索引ID (等级*系数+职业)，主键 |
| Data | FLOAT | 法术暴击概率值 |

### 6.169 gtcombatratings_dbc (战斗评级表)

gtcombatratings_dbc表定义各种战斗评级的缩放系数。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 评级类型ID，主键 |
| Data | FLOAT | 评级缩放系数值 |

### 6.170 gtregenhpperspt_dbc (生命恢复每秒表)

gtregenhpperspt_dbc表定义角色休息时每秒钟的生命恢复量。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 索引ID (等级*系数+职业)，主键 |
| Data | FLOAT | 每秒生命恢复量 |

### 6.171 gtregenmpperspt_dbc (法力恢复每秒表)

gtregenmpperspt_dbc表定义角色休息时每秒钟的法力恢复量。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 索引ID (等级*系数+职业)，主键 |
| Data | FLOAT | 每秒法力恢复量 |

### 6.172 gtnpcmanacostscaler_dbc (NPC法力消耗缩放表)

gtnpcmanacostscaler_dbc表定义游戏中NPC法术的法力消耗缩放系数。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 索引ID，主键 |
| Data | FLOAT | 法力消耗缩放系数 |

### 6.173 gtoctclasscombatratingscalar_dbc (职业战斗评级缩放表)

gtoctclasscombatratingscalar_dbc表定义各职业对不同战斗评级的缩放系数。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 索引ID (职业*系数+评级类型)，主键 |
| Data | FLOAT | 战斗评级缩放系数 |

### 6.174 gtoctregenhp_dbc (职业生命恢复表)

gtoctregenhp_dbc表定义各职业的生命恢复速率。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 索引ID (职业*系数+等级)，主键 |
| Data | FLOAT | 生命恢复速率系数 |

### 6.175 instance_template (副本模板表)

instance_template表定义副本地图的基本属性。

| 字段 | 类型 | 说明 |
|------|------|------|
| map | INT | 地图ID，主键 |
| parent | INT | 父地图ID |
| script | VARCHAR(128) | 副本脚本名称 |
| allowMount | TINYINT | 是否允许骑乘 |

### 6.176 instance_encounters (副本遭遇战表)

instance_encounters表定义副本中的Boss遭遇战信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 条目ID，主键 |
| creditType | TINYINT | 奖励类型 (0=按计数, 1=按遭遇) |
| creditEntry | INT | 奖励条目ID |
| instructEntry | INT | 指示条目ID |
| mapId | INT | 地图ID |
| difficulty | TINYINT | 难度等级 |
| completionText | TEXT | 完成时显示文本 |
| completeFlags | INT | 完成标志位 |

### 6.177 lfg_dungeon_rewards (地下城奖励表)

lfg_dungeon_rewards表定义随机地下城奖励的Quest ID。

| 字段 | 类型 | 说明 |
|------|------|------|
| dungeonId | INT | 地下城ID (LFGDungeons.dbc)，主键 |
| maxLevel | TINYINT | 最高等级限制，主键 |
| firstQuestId | INT | 首次完成奖励的Quest ID |
| otherQuestId | INT | 非首次完成奖励的Quest ID |

### 6.178 lfg_dungeon_template (地下城模板表)

lfg_dungeon_template表定义地下城的入口位置信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| dungeonId | INT | 地下城ID，主键 |
| name | VARCHAR(255) | 地下城名称 |
| position_x | FLOAT | 入口X坐标 |
| position_y | FLOAT | 入口Y坐标 |
| position_z | FLOAT | 入口Z坐标 |
| orientation | FLOAT | 入口朝向 |
| VerifiedBuild | INT | 验证版本号 |

### 6.179 lfgdungeons_dbc (地下城数据表)

lfgdungeons_dbc表存储所有地下城的配置数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 地下城ID，主键 |
| Name_Lang_enUS ~ Name_Lang_itIT | TEXT | 各语言版本的名称 |
| Name_Lang_Mask | INT | 语言掩码 |
| MinLevel / MaxLevel | INT | 最小/最大等级限制 |
| Target_Level / Target_Level_Min / Target_Level_Max | INT | 目标等级范围 |
| MapID | INT | 关联的地图ID |
| Difficulty | INT | 难度等级 |
| Flags | INT | 标志位 |
| TypeID | INT | 类型ID |
| Faction | INT | 阵营要求 |
| TextureFilename | TEXT | 纹理文件名 |
| ExpansionLevel | INT | 资料片等级 |
| Order_Index | INT | 排序索引 |
| Group_Id | INT | 组ID |
| Description_Lang_* | TEXT | 各语言版本的描述 |

### 6.180 light_dbc (光照数据表)

light_dbc表定义游戏世界中的光照配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 光照ID，主键 |
| ContinentID | INT | 所属大陆/地图ID |
| X / Y / Z | FLOAT | 光照位置坐标 |
| FalloffStart | FLOAT | 衰减开始距离 |
| FalloffEnd | FLOAT | 衰减结束距离 |
| LightParamsID_1 ~ LightParamsID_8 | INT | 光照参数ID |

### 6.181 linked_respawn (关联复活表)

linked_respawn表定义生物之间的复活关联关系。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT | 依赖生物的GUID，主键 |
| linkedGuid | INT | 主生物的GUID |
| linkType | TINYINT | 关联类型，主键 |

### 6.182 liquidtype_dbc (液体类型表)

liquidtype_dbc表定义游戏中各种液体的属性。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 液体类型ID，主键 |
| Name | VARCHAR(100) | 液体名称 |
| Flags | INT | 标志位 |
| Type | INT | 液体类型 |
| SoundID | INT | 关联的声音ID |
| SpellID | INT | 关联的法术ID |
| MaxDarkenDepth | FLOAT | 最大黑暗深度 |
| FogDarkenintensity | FLOAT | 雾暗化强度 |
| AmbDarkenintensity | FLOAT | 环境暗化强度 |
| DirDarkenintensity | FLOAT | 方向暗化强度 |
| LightID | INT | 光照ID |
| ParticleScale | FLOAT | 粒子缩放 |
| ParticleMovement | INT | 粒子运动类型 |
| ParticleTexSlots | INT | 粒子纹理槽位 |
| MaterialID | INT | 材质ID |
| Texture_1 ~ Texture_6 | VARCHAR(100) | 液体纹理 |
| Color_1 / Color_2 | INT | 液体颜色 |
| Float_1 ~ Float_18 | FLOAT | 浮点参数 |
| Int_1 ~ Int_4 | INT | 整型参数 |

### 6.183 lock_dbc (锁类型表)

lock_dbc表定义游戏中锁的类型和所需技能。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 锁ID，主键 |
| Type_1 ~ Type_8 | INT | 锁类型（1=钥匙，2=矿石等） |
| Index_1 ~ Index_8 | INT | 锁索引 |
| Skill_1 ~ Skill_8 | INT | 所需技能ID |
| Action_1 ~ Action_8 | INT | 解锁动作ID |

### 6.184 mail_level_reward (等级邮件奖励表)

mail_level_reward表定义玩家达到特定等级时收到的邮件奖励。

| 字段 | 类型 | 说明 |
|------|------|------|
| level | TINYINT | 等级，主键 |
| raceMask | INT | 种族掩码，主键 |
| mailTemplateId | INT | 邮件模板ID |
| senderEntry | INT | 发送者生物ID |

### 6.185 mail_loot_template (邮件 loot 模板表)

mail_loot_template表定义邮件附件的物品 loot 规则。

| 字段 | 类型 | 说明 |
|------|------|------|
| Entry | INT | 邮件模板ID，主键 |
| Item | INT | 物品ID，主键 |
| Reference | INT | 引用其他 loot 模板 |
| Chance | FLOAT | 掉落概率（百分比） |
| QuestRequired | TINYINT | 是否任务必需 |
| LootMode | SMALLINT | loot 模式 |
| GroupId | TINYINT | 分组ID |
| MinCount / MaxCount | TINYINT | 最小/最大数量 |
| Comment | VARCHAR(255) | 备注 |

### 6.186 mailtemplate_dbc (邮件模板表)

mailtemplate_dbc表存储邮件的模板数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 模板ID，主键 |
| Subject_Lang_enUS ~ Subject_Lang_itIT | VARCHAR(100) | 各语言版本的主题 |
| Subject_Lang_Mask | INT | 语言掩码 |
| Body_Lang_enUS ~ Body_Lang_itIT | VARCHAR(500) | 各语言版本的正文 |
| Body_Lang_Mask | INT | 语言掩码 |

### 6.187 map_dbc (地图数据表)

map_dbc表存储所有游戏地图的配置信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 地图ID，主键 |
| Directory | VARCHAR(100) | 地图目录名 |
| InstanceType | INT | 实例类型（0=普通，1=副本等） |
| Flags | INT | 地图标志 |
| PVP | INT | PVP标志 |
| MapName_Lang_enUS ~ MapName_Lang_itIT | VARCHAR(100) | 各语言版本的地图名称 |
| AreaTableID | INT | 区域表ID |
| MapDescription0_Lang_* | TEXT | 地图描述（联盟） |
| MapDescription1_Lang_* | TEXT | 地图描述（部落） |
| LoadingScreenID | INT | 加载画面ID |
| MinimapIconScale | FLOAT | 小地图图标缩放 |
| CorpseMapID | INT | 尸体所在地图ID |
| CorpseX / CorpseY | FLOAT | 尸体坐标 |
| TimeOfDayOverride | INT | 时间覆盖 |
| ExpansionID | INT | 资料片ID |
| RaidOffset | INT | 团队副本偏移 |
| MaxPlayers | INT | 最大玩家数 |

### 6.188 mapdifficulty_dbc (地图难度表)

mapdifficulty_dbc表定义副本的难度配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 难度ID，主键 |
| MapID | INT | 地图ID |
| Difficulty | INT | 难度等级 |
| Message_Lang_enUS ~ Message_Lang_itIT | VARCHAR(200) | 各语言版本的难度提示 |
| Message_Lang_Mask | INT | 语言掩码 |
| RaidDuration | INT | 副本持续时间 |
| MaxPlayers | INT | 最大玩家数 |
| Difficultystring | VARCHAR(100) | 难度字符串 |

### 6.189 milling_loot_template (磨碎 loot 模板表)

milling_loot_template表定义炼金术磨碎技能的 loot 规则。

| 字段 | 类型 | 说明 |
|------|------|------|
| Entry | INT | -entry，主键 |
| Item | INT | 物品ID，主键 |
| Reference | INT | 引用其他 loot 模板 |
| Chance | FLOAT | 掉落概率 |
| QuestRequired | TINYINT | 是否任务必需 |
| LootMode | SMALLINT | loot 模式 |
| GroupId | TINYINT | 分组ID |
| MinCount / MaxCount | TINYINT | 最小/最大数量 |
| Comment | VARCHAR(255) | 备注 |

### 6.190 module_string (模块字符串表)

module_string表存储模块自定义的字符串。

| 字段 | 类型 | 说明 |
|------|------|------|
| module | VARCHAR(255) | 模块目录名，主键 |
| id | INT | 字符串ID，主键 |
| string | TEXT | 字符串内容 |

### 6.191 module_string_locale (模块字符串本地化表)

module_string_locale表存储模块字符串的本地化版本。

| 字段 | 类型 | 说明 |
|------|------|------|
| module | VARCHAR(255) | 模块名，主键 |
| id | INT | 字符串ID，主键 |
| locale | ENUM | 语言代码（koKR/frFR/deDE/zhCN/zhTW/esES/esMX/ruRU），主键 |
| string | TEXT | 本地化字符串内容 |

### 6.192 movie_dbc (电影数据表)

movie_dbc表定义游戏内的过场动画。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 电影ID，主键 |
| Filename | VARCHAR(100) | 电影文件名 |
| Volume | INT | 音量 |

### 6.193 namesprofanity_dbc (禁用名字表)

namesprofanity_dbc表定义游戏中禁止使用的名字。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 禁用词ID，主键 |
| Pattern | TINYTEXT | 禁用模式/关键词 |
| LanguagueID | TINYINT | 语言ID |

### 6.194 namesreserved_dbc (保留名字表)

namesreserved_dbc表定义游戏中保留的名字。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 保留词ID，主键 |
| Pattern | TINYTEXT | 保留模式/关键词 |
| LanguagueID | TINYINT | 语言ID |

### 6.195 npc_spellclick_spells (NPC点击施法表)

npc_spellclick_spells表定义NPC点击时触发的法术。

| 字段 | 类型 | 说明 |
|------|------|------|
| npc_entry | INT | NPC模板ID，主键 |
| spell_id | INT | 施放的法术ID，主键 |
| cast_flags | TINYINT | 施法标志（位掩码） |
| user_type | SMALLINT | 用户类型关系 |

### 6.196 npc_text (NPC文本表)

npc_text表存储NPC对话文本。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 文本ID，主键 |
| text0_0 / text0_1 | LONGTEXT | 第一组文本（男/女） |
| BroadcastTextID0 | INT | 广播文本ID |
| lang0 | TINYINT | 语言 |
| Probability0 | FLOAT | 出现概率 |
| em0_0 ~ em0_5 | SMALLINT | 表情动画ID |
| text1_0 ~ text7_0 / text1_1 ~ text7_1 | LONGTEXT | 第2-8组文本 |
| BroadcastTextID1 ~ BroadcastTextID7 | INT | 各组广播文本ID |
| lang1 ~ lang7 | TINYINT | 各组语言 |
| Probability1 ~ Probability7 | FLOAT | 各组概率 |
| em1_0 ~ em7_5 | SMALLINT | 各组表情动画 |
| VerifiedBuild | INT | 验证版本号 |

### 6.197 npc_text_locale (NPC文本本地化表)

npc_text_locale表存储NPC对话文本的本地化版本。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 文本ID，主键 |
| locale | VARCHAR(4) | 语言代码（如 zhCN），主键 |
| Text | TEXT | 本地化文本内容 |
| VerifiedBuild | INT | 验证版本号 |

### 6.198 npc_trainer (NPC训练师表)

npc_trainer表定义游戏中可教授技能的训练师NPC。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | NPC模板ID，主键 |
| spell_id | INT | 教授的法术ID，主键 |
| spellcost | INT | 学习费用（金币） |
| reqspell | INT | 前置必需法术ID |
| reqlevel | TINYINT | 最低等级要求 |

### 6.199 npc_vendor (NPC供应商表)

npc_vendor表定义游戏中销售物品的商人NPC。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | NPC模板ID，主键 |
| slot | SMALLINT | 商品栏位顺序，主键 |
| item | INT | 物品ID，主键 |
| maxcount | INT | 最大库存数量（0=无限） |
| incrtime | INT | 重生时间（秒） |
| ExtendedCost | INT | 扩展费用（需要荣誉/牌子等） |
| Type | TINYINT | 销售类型（0=普通，1=资料片） |
| condition_id | INT | 触发条件ID |
| PlayerConditionID | INT | 玩家条件ID |

### 6.200 outdoorpvp_template (户外PVP模板表)

outdoorpvp_template表定义户外PVP区域的行为模板。

| 字段 | 类型 | 说明 |
|------|------|------|
| TypeId | TINYINT UNSIGNED | PVP类型ID，主键 |
| ScriptName | VARCHAR(64) | 关联的脚本名称 |
| Comment | VARCHAR(255) | 备注说明 |

### 6.201 overridespelldata_dbc (法术数据覆盖表)

overridespelldata_dbc表定义需要覆盖的法术数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| Spells | VARCHAR(255) | 逗号分隔的法术ID列表 |

### 6.202 page_text (页面文本表)

page_text表存储游戏中的书籍和信件页面内容。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 页面ID，主键 |
| Text | LONGTEXT | 页面文本内容 |
| VerifiedBuild | INT | 验证版本号 |

### 6.203 page_text_locale (页面文本本地化表)

page_text_locale表存储页面文本的本地化版本。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 页面ID，主键 |
| locale | VARCHAR(4) | 语言代码，主键 |
| Text | TEXT | 本地化文本内容 |
| VerifiedBuild | INT | 验证版本号 |

### 6.204 pet_levelstats (宠物等级属性表)

pet_levelstats表存储宠物每等级的属性数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| creature_entry | INT | 生物模板ID，主键 |
| level | TINYINT | 等级，主键 |
| hp | INT | 生命值 |
| mana | INT | 法力值 |
| armor | INT | 护甲值 |
| str | INT | 力量 |
| agi | INT | 敏捷 |
| sta | INT | 耐力 |
| inte | INT | 智力 |
| spi | INT | 精神 |
| min_dmg | INT | 最小攻击伤害 |
| max_dmg | INT | 最大攻击伤害 |

### 6.205 pet_name_generation (宠物名字生成表)

pet_name_generation表定义宠物名字的生成规则。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 名字片段ID，主键 |
| word | TINYTEXT | 名字片段 |
| entry | INT | 关联的生物ID |
| half | TINYINT | 片段位置（0=前缀，1=后缀） |

### 6.206 pet_name_generation_locale (宠物名字生成本地化表)

pet_name_generation_locale表存储宠物名字片段的本地化版本。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 名字片段ID，主键 |
| Locale | VARCHAR(4) | 语言代码，主键 |
| Word | TINYTEXT | 本地化名字片段 |
| Entry | INT | 关联的生物ID |
| Half | TINYINT | 片段位置 |

### 6.207 player_factionchange_achievement (阵营变更成就映射表)

player_factionchange_achievement表定义联盟和部落成就之间的映射关系，用于阵营转换时转换成就。

| 字段 | 类型 | 说明 |
|------|------|------|
| alliance_id | INT | 联盟成就ID，主键 |
| alliance_comment | TEXT | 联盟成就名称备注 |
| horde_id | INT | 部落成就ID，主键 |
| horde_comment | TEXT | 部落成就名称备注 |

### 6.208 player_factionchange_items (阵营变更物品映射表)

player_factionchange_items表定义联盟和部落特有物品之间的映射关系，用于阵营转换时转换背包物品。

| 字段 | 类型 | 说明 |
|------|------|------|
| alliance_id | INT | 联盟物品ID，主键 |
| alliance_comment | TEXT | 联盟物品名称备注 |
| horde_id | INT | 部落物品ID，主键 |
| horde_comment | TEXT | 部落物品名称备注 |

### 6.209 player_factionchange_spells (阵营变更法术映射表)

player_factionchange_spells表定义联盟和部落特有法术（如技能、召唤物）之间的映射关系。

| 字段 | 类型 | 说明 |
|------|------|------|
| alliance_id | INT | 联盟法术ID，主键 |
| alliance_comment | TEXT | 联盟法术名称备注 |
| horde_id | INT | 部落法术ID，主键 |
| horde_comment | TEXT | 部落法术名称备注 |

### 6.210 player_factionchange_titles (阵营变更称号映射表)

player_factionchange_titles表定义联盟和部落特有称号之间的映射关系。

| 字段 | 类型 | 说明 |
|------|------|------|
| alliance_id | INT | 联盟称号ID，主键 |
| alliance_comment | TEXT | 联盟称号名称备注 |
| horde_id | INT | 部落称号ID，主键 |
| horde_comment | TEXT | 部落称号名称备注 |

### 6.211 player_xp_for_level (等级经验值表)

player_xp_for_level表存储每个等级所需的经验值数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| Level | TINYINT | 等级，主键 |
| Experience | INT | 升级到下一级所需的经验值 |

### 6.212 powerdisplay_dbc (能量显示数据表)

powerdisplay_dbc表定义游戏中能量类型（如法力、怒气、能量条）的显示配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 能量类型ID，主键 |
| ActualType | INT | 实际能量类型 |
| GlobalstringBaseTag | VARCHAR(100) | 全局字符串标签 |
| Red | TINYINT | 红色分量 |
| Green | TINYINT | 绿色分量 |
| Blue | TINYINT | 蓝色分量 |

### 6.213 quest_template (任务模板表)

quest_template表存储所有游戏任务的完整定义，是最重要的数据表之一。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 任务ID，主键 |
| QuestType | TINYINT | 任务类型（2=击杀/收集等） |
| QuestLevel | SMALLINT | 任务等级 |
| MinLevel | TINYINT | 最低接取等级 |
| QuestSortID | SMALLINT | 任务分类ID |
| QuestInfoID | SMALLINT | 任务信息类型 |
| SuggestedGroupNum | TINYINT | 建议组队人数 |
| RequiredFactionId1/2 | SMALLINT | 所需阵营ID |
| RequiredFactionValue1/2 | INT | 阵营声望值要求 |
| RewardMoney | INT | 奖励金钱 |
| RewardSpell | INT | 奖励法术 |
| RewardHonor | INT | 奖励荣誉 |
| StartItem | INT | 起始物品ID |
| Flags | INT | 任务标志位 |
| RewardItem1~4 | INT | 固定奖励物品ID |
| RewardChoiceItemID1~6 | INT | 选择奖励物品ID |
| RequiredNpcOrGo1~4 | INT | 所需NPC或游戏物体ID |
| RequiredItemId1~6 | INT | 所需物品ID |
| LogTitle / LogDescription | TEXT | 任务日志标题/描述 |
| QuestDescription | TEXT | 任务描述 |
| AreaDescription | TEXT | 区域描述 |
| CompletedText | TEXT | 完成任务时显示的文本 |
| VerifiedBuild | INT | 验证版本号 |

### 6.214 quest_template_locale (任务模板本地化表)

quest_template_locale表存储任务文本的本地化版本。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 任务ID，主键 |
| locale | VARCHAR(4) | 语言代码（如 zhCN），主键 |
| Title | TEXT | 本地化任务标题 |
| Details | TEXT | 本地化任务详情 |
| Objectives | TEXT | 本地化任务目标 |
| EndText | TEXT | 本地化结束文本 |
| CompletedText | TEXT | 本地化完成文本 |
| ObjectiveText1~4 | TEXT | 各目标文本 |
| VerifiedBuild | INT | 验证版本号 |

### 6.215 reference_loot_template (参考掉落模板表)

reference_loot_template表定义可被其他掉落表引用的掉落规则。

| 字段 | 类型 | 说明 |
|------|------|------|
| Entry | INT | 模板ID，主键 |
| Item | INT | 物品ID，主键 |
| Reference | INT | 引用其他掉落模板 |
| Chance | FLOAT | 掉落概率（百分比） |
| QuestRequired | TINYINT | 是否任务必需 |
| LootMode | SMALLINT | loot 模式 |
| GroupId | TINYINT | 分组ID |
| MinCount / MaxCount | TINYINT | 最小/最大数量 |
| Comment | VARCHAR(255) | 备注 |

### 6.217 scalingstatdistribution_dbc (属性缩放分布表)

scalingstatdistribution_dbc 定义属性的缩放分布规则。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 主键 |
| StatID_1 ~ StatID_10 | INT | 属性ID（最多10个） |
| Bonus_1 ~ Bonus_10 | INT | 各属性的加成值 |
| Maxlevel | INT | 最大等级 |

### 6.218 script_waypoint (脚本路径点表)

存储 NPC 脚本路径点信息，用于定义 NPC 的巡逻路径。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 生物模板ID，外键关联creature_template |
| pointid | INT | 路径点序号 |
| location_x / location_y / location_z | FLOAT | 路径点坐标 |
| waittime | INT | 在该点等待时间（毫秒） |
| point_comment | TEXT | 路径点备注 |

### 6.219 skill_discovery_template (技能发现模板)

定义玩家在练习专业技能时可能发现的额外配方。

| 字段 | 类型 | 说明 |
|------|------|------|
| spellId | INT | 可发现的法术ID |
| reqSpell | INT | 需求法术ID（前置配方） |
| reqSkillValue | SMALLINT | 需求技能值 |
| chance | FLOAT | 发现概率 |

### 6.220 skill_extra_item_template (技能额外物品模板)

定义专业技能的额外物品创造规则（如双采、附魔等）。

| 字段 | 类型 | 说明 |
|------|------|------|
| spellId | INT | 物品创造法术ID |
| requiredSpecialization | INT | 需求专精法术ID |
| additionalCreateChance | FLOAT | 额外创造概率 |
| additionalMaxNum | TINYINT | 额外最大数量 |

### 6.221 skill_fishing_base_level (钓鱼基础等级表)

定义各区域的钓鱼基础技能等级要求。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 区域ID，主键 |
| skill | SMALLINT | 基础钓鱼技能等级要求 |

### 6.222 skill_perfect_item_template (技能完美物品模板)

定义制造专业中完美物品的创造规则。

| 字段 | 类型 | 说明 |
|------|------|------|
| spellId | INT | 制造法术ID |
| requiredSpecialization | INT | 需求专精法术ID |
| perfectCreateChance | FLOAT | 创造完美物品的概率 |
| perfectItemType | INT | 完美物品类型ID |

### 6.223 skillline_dbc (技能线表)

存储所有技能线的信息（DBC数据）。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 技能线ID，主键 |
| CategoryID | INT | 技能分类ID |
| SkillCostsID | INT | 技能消耗ID |
| DisplayName_Lang_xx | VARCHAR(100) | 各语言版本的显示名称 |
| Description_Lang_xx | VARCHAR(300) | 各语言版本的描述 |
| SpellIconID | INT | 技能图标ID |
| AlternateVerb_Lang_xx | VARCHAR(100) | 各语言版本的替代动词 |
| CanLink | INT | 是否可链接 |

### 6.224 skilllineability_dbc (技能线能力表)

定义技能线与法术的关联关系。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 主键 |
| SkillLine | INT | 技能线ID |
| Spell | INT | 关联的法术ID |
| RaceMask | INT | 种族掩码限制 |
| ClassMask | INT | 职业掩码限制 |
| ExcludeRace | INT | 排除的种族 |
| ExcludeClass | INT | 排除的职业 |
| MinSkillLineRank | INT | 最小技能等级 |
| SupercededBySpell | INT | 被替代的法术 |
| AcquireMethod | INT | 获取方式 |
| TrivialSkillLineRankHigh / Low | INT |  trivial 技能等级范围 |
| CharacterPoints_1 / _2 | INT | 角色点数 |

### 6.225 skillraceclassinfo_dbc (技能种族职业信息表)

定义技能与种族、职业的关联限制。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 主键 |
| SkillID | INT | 技能ID |
| RaceMask | INT | 种族掩码 |
| ClassMask | INT | 职业掩码 |
| Flags | INT | 标志 |
| MinLevel | INT | 最小等级 |
| SkillTierID | INT | 技能层ID |
| SkillCostIndex | INT | 技能消耗索引 |

### 6.226 skilltiers_dbc (技能等级成本表)

定义技能各等级的学习成本。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 主键 |
| Cost_1 ~ Cost_16 | INT | 各等级的学习成本（金币） |
| Value_1 ~ Value_16 | INT | 各等级的技能值 |

### 6.227 skinning_loot_template (剥皮掉落模板)

定义剥皮活动的掉落规则。

| 字段 | 类型 | 说明 |
|------|------|------|
| Entry | INT | 模板ID，主键 |
| Item | INT | 物品ID |
| Reference | INT | 引用其他掉落模板 |
| Chance | FLOAT | 掉落概率 |
| QuestRequired | TINYINT | 是否任务必需 |
| LootMode | SMALLINT | 掉落模式 |
| GroupId | TINYINT | 分组ID |
| MinCount / MaxCount | TINYINT | 最小/最大数量 |
| Comment | VARCHAR(255) | 备注 |

### 6.228 smart_scripts (智能脚本表)

存储 NPC/游戏物体/区域触发器的智能脚本配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| entryorguid | INT | 原始实体GUID |
| source_type | INT | 事件源类型 |
| event_id | INT | 事件ID |
| event_phase_mask | INT | 事件阶段掩码 |
| event_chance | INT | 事件触发概率 |
| event_flags | INT | 事件标志 |
| event_param1 ~ event_param3 | INT | 事件参数1-3 |
| action_type | INT | 动作类型 |
| action_param1 ~ action_param6 | INT | 动作参数1-6 |
| target_type | INT | 目标类型 |
| target_param1 ~ target_param3 | INT | 目标参数1-3 |
| target_coords | TEXT | 目标坐标 |
| comment | TEXT | 备注说明 |

### 6.229 soundentries_dbc (声音条目表)

存储游戏声音的配置信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 声音ID，主键 |
| SoundTypeID | INT | 声音类型ID |
| Name | VARCHAR(100) | 声音名称 |
| FilePath_1 ~ FilePath_10 | VARCHAR(256) | 声音文件路径 |
| Freq_1 ~ Freq_10 | INT | 各文件播放频率 |
| VolumeFloat | FLOAT | 音量 |
| Flags | INT | 标志 |
| Preloaded | INT | 是否预加载 |
| Channel | INT | 声道 |
| DistanceCutoff | FLOAT | 距离截止 |

### 6.230 spell_area (法术区域表)

定义法术在特定区域/环境下的使用规则。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell | INT | 法术ID |
| area | INT | 区域ID |
| area_group | INT | 区域组ID |
| quest_start | INT | 起始任务ID |
| quest_start_active | INT | 激活的起始任务ID |
| quest_end | INT | 结束任务ID |
| aura_spell | INT | 触发光环的法术ID |
| race_mask | INT | 种族掩码 |
| gender | INT | 性别 |
| flags | INT | 标志 |

### 6.231 spell_bonus_data (法术加成数据表)

定义法术伤害/治疗加成的额外数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 法术ID，主键 |
| direct_bonus | FLOAT | 直接伤害加成 |
| dot_bonus | FLOAT | 持续伤害加成 |
| ap_bonus | FLOAT | 攻击强度加成 |
| ap_dot_bonus | FLOAT | 攻击强度持续伤害加成 |
| comments | VARCHAR(255) | 备注 |

### 6.232 spell_cooldown_overrides (法术冷却覆盖表)

定义法术冷却的覆盖规则。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_id | INT | 法术ID，主键 |
| category_cooldown | INT | 分类冷却时间（毫秒） |
| global_cooldown | INT | 全局冷却时间（毫秒） |
| start_category_cooldown_at_category | TINYINT | 是否在分类冷却时启动 |

### 6.233 spell_custom_attr (法术自定义属性表)

定义法术的自定义属性标记。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_id | INT | 法术ID，主键 |
| custom_attr | INT | 自定义属性掩码 |

### 6.234 spell_dbc (法术定义表)

存储法术的完整定义数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 法术ID，主键 |
| Category | INT | 分类ID |
| DispelType | INT | 驱散类型 |
| Mechanic | INT | 机制 |
| Attributes | INT | 属性 |
| AttributesEx | INT | 扩展属性 |
| ShapeshiftMask | INT | 变形形态掩码 |
| ShapeshiftExclude | INT | 排除的变形形态 |
| AttackerIgnoreGearDr | INT | 是否忽略攻击者护甲 |
| Targets | INT | 目标类型 |
| TargetCreatureType | INT | 目标生物类型 |
| RequiresSpellFocus | INT | 需求法术焦点 |
| FacingCasterFlags | INT | 朝向标记 |
| CasterAuraState | INT | 施法者光环状态 |
| TargetAuraState | INT | 目标光环状态 |
| CasterAuraStateNot | INT | 非施法者光环状态 |
| TargetAuraStateNot | INT | 非目标光环状态 |
| CasterAuraSpell | INT | 施法者光环法术 |
| TargetAuraSpell | INT | 目标光环法术 |
| ExcludeCasterAuraSpell | INT | 排除施法者光环 |
| ExcludeTargetAuraSpell | INT | 排除目标光环 |
| CastTime | INT | 施法时间 |
| Duration | INT | 持续时间 |
| MaxDuration | INT | 最大持续时间 |
| Range | INT | 范围 |
| StackCount | INT | 堆叠层数 |
| SpellVisualID_1 / _2 | INT | 视觉ID |
| SpellIconID | INT | 图标ID |
| ActiveIconID | INT | 激活图标ID |
| SpellPriority | INT | 优先级 |
| Name | VARCHAR(100) | 法术名称 |
| Rank | VARCHAR(100) | 等级描述 |
| RankFlags | INT | 等级标志 |
| MaxTargetLevel | INT | 最大目标等级 |
| SpellFamilyName | INT | 法术家族名称 |
| SpellFamilyFlags | INT | 法术家族标记 |
| SpellFamilyFlags2 | INT | 法术家族标记2 |
| DmgClass | INT | 伤害分类 |
| TypeMask | INT | 类型掩码 |
| Subtype | INT | 子类型 |
| UnitFlags | INT | 单位标志 |
| UnitFlags2 | INT | 单位标志2 |
| UnitCasterConditions | VARCHAR(100) | 施法者触发条件 |
| SpellDifficultyID | INT | 难度ID |
| ScalingID | INT | 缩放ID |
| spells | TEXT | 关联法术列表 |

### 6.235 spell_enchant_proc_data (法术附魔触发数据表)

定义附魔触发的特殊配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| EnchantID | INT | 附魔ID，主键 |
| Chance | FLOAT | 触发概率 |
| Proctype | INT | 触发类型 |
| HitType | INT | 命中类型 |

### 6.236 spell_group (法术组表)

定义法术分组，用于法术堆叠规则管理。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 法师组ID |
| spell_id | INT | 法术ID |

### 6.237 spell_group_stack_rules (法术组堆叠规则表)

定义法术组的堆叠规则。

| 字段 | 类型 | 说明 |
|------|------|------|
| group_id | INT | 法术组ID |
| stack_rule | INT | 堆叠规则（0=无规则，1=覆盖，2=不能同时存在，3=特殊，4=互斥） |
| description | VARCHAR(150) | 规则描述 |

### 6.238 spell_jump_distance (法术跳跃距离表)

定义法术跳跃效果的距离配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_id | INT | 法术ID，主键 |
| min_range | FLOAT | 最小距离 |
| max_range | FLOAT | 最大距离 |
| speed | FLOAT | 跳跃速度 |

### 6.240 spell_linked_spell (法术链接表)

定义法术之间的触发关联关系。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_trigger | INT | 触发条件 |
| spell_linked | INT | 被触发的法术 |
| type | INT | 触发类型 |
| comment | VARCHAR(255) | 备注 |

### 6.241 spell_loot_template (法术掉落模板)

定义使用法术（如开锁）时的掉落规则。

| 字段 | 类型 | 说明 |
|------|------|------|
| Entry | INT | 模板ID，主键 |
| Item | INT | 物品ID |
| Reference | INT | 引用其他掉落模板 |
| Chance | FLOAT | 掉落概率 |
| QuestRequired | TINYINT | 是否任务必需 |
| LootMode | SMALLINT | 掉落模式 |
| GroupId | TINYINT | 分组ID |
| MinCount / MaxCount | TINYINT | 最小/最大数量 |
| Comment | VARCHAR(255) | 备注 |

### 6.242 spell_mixology (法术混合理念表)

定义炼金术药水效果增强规则。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_id | INT | 法术ID（药水），主键 |
| reagent | INT | 需要的试剂 |
| reagent_count | INT | 试剂数量 |

### 6.243 spell_pet_auras (法术宠物光环表)

定义宠物通过主人法术获得的光环。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_id | INT | 主人法术ID |
| aura_id | INT | 宠物获得的光环ID |

### 6.244 spell_proc (法术触发表)

定义法术触发的配置数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| SpellId | INT | 法术ID，主键 |
| SchoolMask | INT | 护甲类型掩码 |
| SpellFamilyName | INT | 法术家族名称 |
| SpellFamilyMask0 | INT | 法术家族标记0 |
| SpellFamilyMask1 | INT | 法术家族标记1 |
| SpellFamilyMask2 | INT | 法术家族标记2 |
| ProcFlags | INT | 触发标志 |
| ProcEx | INT | 触发额外标志 |
| DamageCooldown | INT | 触发冷却时间 |

### 6.245 spell_proc_event (法术触发事件表)

定义法术触发事件的配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 法术ID，主键 |
| school_mask | INT | 护甲类型掩码 |
| spell_family_name | INT | 法术家族名称 |
| spell_family_mask0 / spell_family_mask1 / spell_family_mask2 | INT | 法术家族标记 |
| proc_flags | INT | 触发标志 |
| proc_ex | INT | 触发额外标志 |
| cooldown | INT | 冷却时间 |
| comments | VARCHAR(255) | 备注 |

### 6.246 spell_ranks (法术等级表)

定义法术各等级之间的关联关系。

| 字段 | 类型 | 说明 |
|------|------|------|
| first_spell_id | INT | 起始法术ID |
| spell_id | INT | 法术ID |

### 6.247 spell_required (法术前置要求表)

定义学习法术的前置要求。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_id | INT | 需求法术ID |
| required_spell_id | INT | 前置法术ID |

### 6.248 spell_script_names (法术脚本名称表)

关联法术与脚本系统。

| 字段 | 类型 | 说明 |
|------|------|------|
| spell_id | INT | 法术ID，主键 |
| ScriptName | VARCHAR(64) | 脚本名称 |

### 6.249 spell_scripts (法术脚本表)

定义法术脚本的具体执行配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | ID，主键 |
| delay | INT | 延迟时间 |
| command | INT | 命令类型 |
| data_long_1 / data_long_2 | INT | 长整数数据 |
| data_float_1 / data_float_2 | FLOAT | 浮点数据 |
| comment | VARCHAR(255) | 备注 |

### 6.250 spell_target_position (法术目标位置表)

定义传送法术的目标坐标。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 目标ID，主键 |
| target_map | INT | 目标地图ID |
| target_position_x | FLOAT | 目标X坐标 |
| target_position_y | FLOAT | 目标Y坐标 |
| target_position_z | FLOAT | 目标Z坐标 |
| target_orientation | FLOAT | 目标朝向 |

### 6.251 spell_threat (法术威胁值表)

定义法术产生的威胁值。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT | 法术ID，主键 |
| threat | INT | 威胁值 |
| ap_bonus | FLOAT | 攻击强度加成 |
| dot_bonus | FLOAT | 持续伤害加成 |
| comments | VARCHAR(255) | 备注 |

### 6.252 spellcasttimes_dbc (法术施法时间表)

定义法术的施法时间配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| Base | INT | 基础施法时间 |
| PerLevel | INT | 每等级变化时间 |
| Minimum | INT | 最小施法时间 |

### 6.253 spellcategory_dbc (法术分类表)

定义法术分类。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 分类ID，主键 |
| Name | VARCHAR(100) | 分类名称 |

### 6.254 spelldifficulty_dbc (法术难度表)

定义不同难度下的法术替换。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| SpellID_0 | INT | 普通难度法术ID |
| SpellID_1 | INT | 英雄难度法术ID |

### 6.255 spellduration_dbc (法术持续时间表)

定义法术的持续时间配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| Duration_1 | INT | 持续时间1 |
| Duration_2 | INT | 持续时间2 |
| Duration_3 | INT | 持续时间3 |

### 6.256 spellfocusobject_dbc (法术焦点对象表)

定义法术焦点的交互对象类型。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| Name | VARCHAR(100) | 焦点对象名称 |

### 6.257 spellitemenchantment_dbc (法术物品附魔表)

定义物品附魔的详细配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| Name | VARCHAR(100) | 附魔名称 |
| Type_1 / Type_2 / Type_3 | INT | 附魔类型 |
| Amount_1 / Amount_2 / Amount_3 | INT | 附魔数值 |
| SpellID_1 / SpellID_2 / SpellID_3 | INT | 触发法术ID |
| Description | VARCHAR(255) | 描述 |

### 6.258 spellitemenchantmentcondition_dbc (附魔条件表)

定义附魔的条件配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| Type_1 ~ Type_5 | INT | 条件类型1-5 |
| Value_1 ~ Value_5 | INT | 条件值1-5 |

### 6.259 spellradius_dbc (法术范围表)

定义法术半径配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| Radius_1 | FLOAT | 半径1 |
| Radius_2 | FLOAT | 半径2 |

### 6.260 spellrange_dbc (法术范围表)

定义法术的范围配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| Range_Min | FLOAT | 最小范围 |
| Range_Max | FLOAT | 最大范围 |

### 6.261 spellrunecost_dbc (法术消耗表)

定义法术的资源消耗配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| Cost | INT | 基础消耗 |
| CostPerLevel | INT | 每等级消耗增加 |

### 6.262 spellshapeshiftform_dbc (法术变形形态表)

定义变形形态的配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 形态ID，主键 |
| Name | VARCHAR(100) | 形态名称 |
| Flags | INT | 形态标志 |

### 6.263 spellvisual_dbc (法术视觉表)

定义法术的视觉效果配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| Name | VARCHAR(100) | 视觉名称 |

### 6.264 stableslotprices_dbc (马厩槽位价格表)

定义马厩存储槽位的价格。

| 字段 | 类型 | 说明 |
|------|------|------|
| Slot | INT | 槽位ID，主键 |
| Price | INT | 价格（金币） |

### 6.265 summonproperties_dbc (召唤属性表)

定义召唤生物的属性配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| Category | INT | 分类 |
| Faction | INT | 阵营 |
| Type | INT | 类型 |
| Slot | INT | 槽位 |
| MaxCount | INT | 最大数量 |

### 6.266 talent_dbc (天赋表)

定义职业天赋配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 天赋ID，主键 |
| TabID | INT | 天赋页ID |
| Tier | INT | 层数 |
| Column | INT | 列位置 |
| SpellID | INT | 关联法术ID |
| Rank | INT | 天赋点数 |

### 6.267 talenttab_dbc (天赋页表)

定义天赋页的配置。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 天赋页ID，主键 |
| Name | VARCHAR(100) | 天赋页名称 |
| SpellIconID | INT | 图标ID |
| RaceMask | INT | 种族掩码 |
| ClassMask | INT | 职业掩码 |

### 6.268 taxinodes_dbc (Taxi节点表)

定义所有Taxi飞行节点。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 节点ID，主键 |
| Name | VARCHAR(100) | 节点名称 |
| MapID | INT | 地图ID |
| X / Y / Z | FLOAT | 节点坐标 |

### 6.269 taxipath_dbc (Taxi路径表)

定义Taxi飞行路径。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 路径ID，主键 |
| From | INT | 起始节点ID |
| To | INT | 目标节点ID |
| Price | INT | 价格 |

### 6.270 taxipathnode_dbc (Taxi路径节点表)

定义Taxi路径的详细节点。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| PathID | INT | 路径ID |
| NodeIndex | INT | 节点索引 |
| MapID | INT | 地图ID |
| X / Y / Z | FLOAT | 节点坐标 |

### 6.271 vehicle_dbc (载具DBC表)

存储载具的基础属性和配置信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 载具ID，主键 |
| Flags | INT | 载具标志 |
| TurnSpeed | FLOAT | 转向速度 |
| PitchSpeed | FLOAT | 俯仰速度 |
| PitchMin | FLOAT | 最小俯仰角 |
| PitchMax | FLOAT | 最大俯仰角 |
| SeatID_1 ~ SeatID_8 | INT | 座位ID（最多8个座位） |
| MouseLookOffsetPitch | FLOAT | 鼠标视角偏移俯仰角 |
| CameraFadeDistScalarMin | FLOAT | 相机淡出距离最小值 |
| CameraFadeDistScalarMax | FLOAT | 相机淡出距离最大值 |
| CameraPitchOffset | FLOAT | 相机俯仰偏移 |
| FacingLimitRight | FLOAT | 面向限制右侧 |
| FacingLimitLeft | FLOAT | 面向限制左侧 |
| MsslTrgtTurnLingering | FLOAT | 导弹目标转向持续时间 |
| MsslTrgtPitchLingering | FLOAT | 导弹目标俯仰持续时间 |
| MsslTrgtMouseLingering | FLOAT | 导弹目标鼠标滞留时间 |
| MsslTrgtEndOpacity | FLOAT | 导弹目标结束透明度 |
| MsslTrgtArcSpeed | FLOAT | 导弹目标弧线速度 |
| MsslTrgtArcRepeat | FLOAT | 导弹目标弧线重复次数 |
| MsslTrgtArcWidth | FLOAT | 导弹目标弧线宽度 |
| MsslTrgtImpactRadius_1 / _2 | FLOAT | 导弹目标影响半径 |
| MsslTrgtArcTexture | VARCHAR(100) | 导弹目标弧线纹理 |
| MsslTrgtImpactTexture | VARCHAR(100) | 导弹目标撞击纹理 |
| MsslTrgtImpactModel_1 / _2 | VARCHAR(100) | 导弹目标撞击模型 |
| CameraYawOffset | FLOAT | 相机偏航偏移 |
| UilocomotionType | INT | UI本地移动类型 |
| MsslTrgtImpactTexRadius | FLOAT | 导弹目标纹理半径 |
| VehicleUIIndicatorID | INT | 载具UI指示器ID |
| PowerDisplayID_1 ~ _3 | INT | 能量显示ID（最多3个） |

### 6.272 vehicle_seat_addon (载具座位附件表)

定义载具座位的额外配置信息，用于覆盖载具座位的默认行为。

| 字段 | 类型 | 说明 |
|------|------|------|
| SeatEntry | INT UNSIGNED | 座位条目ID，主键 |
| SeatOrientation | FLOAT | 座位朝向覆盖值 |
| ExitParamX | FLOAT | 离开位置X坐标 |
| ExitParamY | FLOAT | 离开位置Y坐标 |
| ExitParamZ | FLOAT | 离开位置Z坐标 |
| ExitParamO | FLOAT | 离开朝向 |
| ExitParamValue | TINYINT | 离开参数值类型（0=不使用，1=距离，2=坐标） |

### 6.273 vehicle_template_accessory (载具模板附件表)

定义载具模板的乘客/附件配置。一个载具可以有多个附件（如炮台、乘客等）。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT UNSIGNED | 载具模板ID，主键 |
| accessory_entry | INT UNSIGNED | 附件NPC条目ID |
| seat_id | TINYINT | 座位ID（-1表示随机座位） |
| minion | TINYINT UNSIGNED | 是否为从属单位（1=是） |
| description | TEXT | 描述信息 |
| summontype | TINYINT UNSIGNED | 召唤类型（见TempSummonType枚举） |
| summontimer | INT UNSIGNED | 召唤计时器（毫秒） |

### 6.274 vehicleseat_dbc (载具座位DBC表)

存储载具座位的详细属性和动画配置信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 座位ID，主键 |
| Flags / FlagsB | INT | 座位标志 |
| AttachmentID | INT | 附件ID |
| AttachmentOffsetX / Y / Z | FLOAT | 附件偏移坐标 |
| EnterPreDelay | FLOAT | 进入前延迟 |
| EnterSpeed | FLOAT | 进入速度 |
| EnterGravity | FLOAT | 进入重力 |
| EnterMinDuration / EnterMaxDuration | FLOAT | 进入持续时间范围 |
| EnterMinArcHeight / EnterMaxArcHeight | FLOAT | 进入弧线高度范围 |
| EnterAnimStart / EnterAnimLoop | INT | 进入动画 |
| RideAnimStart / RideAnimLoop / RideUpperAnimStart / RideUpperAnimLoop | INT | 骑乘动画 |
| ExitPreDelay | FLOAT | 离开前延迟 |
| ExitSpeed | FLOAT | 离开速度 |
| ExitGravity | FLOAT | 离开重力 |
| ExitMinDuration / ExitMaxDuration | FLOAT | 离开持续时间范围 |
| ExitMinArcHeight / ExitMaxArcHeight | FLOAT | 离开弧线高度范围 |
| ExitAnimStart / ExitAnimLoop / ExitAnimEnd | INT | 离开动画 |
| PassengerYaw / PassengerPitch / PassengerRoll | FLOAT | 乘客朝向/俯仰/翻滚 |
| PassengerAttachmentID | INT | 乘客附件ID |
| VehicleEnterAnim / VehicleExitAnim / VehicleRideAnimLoop | INT | 载具动画 |
| VehicleEnterAnimBone / VehicleExitAnimBone / VehicleRideAnimLoopBone | INT | 载具动画骨骼 |
| VehicleEnterAnimDelay / VehicleExitAnimDelay | FLOAT | 载具动画延迟 |
| VehicleAbilityDisplay | INT | 载具能力显示 |
| EnterUISoundID / ExitUISoundID | INT | UI声音ID |
| UiSkin | INT | UI皮肤 |
| CameraEnteringDelay / CameraEnteringDuration | FLOAT | 相机进入延迟/持续时间 |
| CameraExitingDelay / CameraExitingDuration | FLOAT | 相机离开延迟/持续时间 |
| CameraOffsetX / Y / Z | FLOAT | 相机偏移坐标 |
| CameraPosChaseRate / CameraFacingChaseRate | FLOAT | 相机追踪速率 |
| CameraEnteringZoom | FLOAT | 相机进入缩放 |
| CameraSeatZoomMin / CameraSeatZoomMax | FLOAT | 相机座位缩放范围 |

### 6.275 worldmapoverlay_dbc (世界地图覆盖层DBC表)

定义世界地图上的覆盖层信息，用于在特定区域显示自定义纹理。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 覆盖层ID，主键 |
| MapAreaID | INT | 所属地图区域ID |
| AreaID_1 ~ AreaID_4 | INT | 关联的区域ID（最多4个） |
| MapPointX / MapPointY | INT | 地图点位坐标 |
| TextureName | VARCHAR(100) | 纹理文件名 |
| TextureWidth / TextureHeight | INT | 纹理尺寸 |
| OffsetX / OffsetY | INT | 偏移坐标 |
| HitRectTop / HitRectLeft / HitRectBottom / HitRectRight | INT | 碰撞矩形区域 |

### 6.276 teamcontributionpoints_dbc (阵营贡献点数表)

存储阵营贡献点数数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| Data | FLOAT | 贡献点数数据值 |

### 6.277 totemcategory_dbc (图腾类别DBC表)

定义游戏中所有图腾类别的属性和名称。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 图腾类别ID，主键 |
| Name_Lang_enUS ~ Name_Lang_itIT | VARCHAR(100) | 各语言版本名称（英美/英联邦/韩语/法语/德语/简体中文/繁体中文/西班牙语/墨西哥西班牙语/俄语/葡萄牙语/巴西葡萄牙语/意大利语） |
| Name_Lang_Unk | VARCHAR(100) | 未知语言名称 |
| Name_Lang_Mask | INT UNSIGNED | 语言掩码 |
| TotemCategoryType | INT | 图腾类别类型 |
| TotemCategoryMask | INT | 图腾类别掩码 |

### 6.278 trainer (训练师表)

定义游戏中训练师NPC的基本信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| Id | INT UNSIGNED | 训练师ID，主键 |
| Type | TINYINT UNSIGNED | 训练师类型（0=职业训练师，1=专业训练师，2=技能训练师，3=其他） |
| Requirement | MEDIUMINT UNSIGNED | 前置要求（通常是技能ID） |
| Greeting | MEDIUMTEXT | 训练师问候语 |
| VerifiedBuild | INT | 验证版本号 |

### 6.279 trainer_locale (训练师本地化表)

存储训练师问候语的多语言版本。

| 字段 | 类型 | 说明 |
|------|------|------|
| Id | INT UNSIGNED | 训练师ID，主键（联合主键） |
| locale | VARCHAR(4) | 语言代码（deDE/esES/ruRU/zhCN/zhTW等），主键 |
| Greeting_lang | MEDIUMTEXT | 本地化的训练师问候语 |
| VerifiedBuild | INT | 验证版本号 |

### 6.280 trainer_spell (训练师技能表)

定义训练师可以教授的技能/法术及其学习条件。

| 字段 | 类型 | 说明 |
|------|------|------|
| TrainerId | INT UNSIGNED | 训练师ID，主键（联合主键） |
| SpellId | INT UNSIGNED | 技能/法术ID，主键（联合主键） |
| MoneyCost | INT UNSIGNED | 学习费用（铜币） |
| ReqSkillLine | INT UNSIGNED | 需要的专业技能线 |
| ReqSkillRank | INT UNSIGNED | 需要的专业技能等级 |
| ReqAbility1 ~ ReqAbility3 | INT UNSIGNED | 前置技能ID（最多3个） |
| ReqLevel | TINYINT UNSIGNED | 最低等级要求 |
| VerifiedBuild | INT | 验证版本号 |

### 6.281 transportanimation_dbc (运输工具动画DBC表)

定义运输工具（如飞船、飞艇）的路径动画关键帧。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| TransportID | INT | 运输工具ID |
| TimeIndex | INT | 时间索引（毫秒） |
| PosX / PosY / PosZ | FLOAT | 位置坐标 |
| SequenceID | INT | 序列ID |

### 6.282 transportrotation_dbc (运输工具旋转DBC表)

定义运输工具的旋转动画关键帧。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | ID，主键 |
| GameObjectsID | INT | 游戏对象ID |
| TimeIndex | INT | 时间索引（毫秒） |
| RotX / RotY / RotZ / RotW | FLOAT | 四元数旋转值 |

### 6.283 transports (运输工具表)

存储游戏中可交互的运输工具（如飞船、飞艇、电梯）实例。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT UNSIGNED | 全局唯一标识符，自增主键 |
| entry | INT UNSIGNED | 运输工具条目ID，唯一索引 |
| name | TEXT | 运输工具名称 |
| ScriptName | CHAR(64) | 关联的脚本名称 |

### 6.286 vehicle_accessory (载具附件表)

存储载具实例的附件/乘客配置信息。

| 字段 | 类型 | 说明 |
|------|------|------|
| guid | INT UNSIGNED | 载具GUID，主键（联合主键） |
| accessory_entry | INT UNSIGNED | 附件NPC条目ID |
| seat_id | TINYINT | 座位ID |
| minion | TINYINT UNSIGNED | 是否为从属单位（1=是） |
| description | TEXT | 描述信息 |
| summontype | TINYINT UNSIGNED | 召唤类型（见TempSummonType枚举） |
| summontimer | INT UNSIGNED | 召唤计时器（毫秒） |

### 6.287 warden_checks (Warden反作弊检查表)

存储Warden反作弊系统的内存检查规则。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | SMALLINT UNSIGNED | 检查ID，自增主键 |
| type | TINYINT UNSIGNED | 检查类型 |
| data | VARCHAR(48) | 检查数据 |
| str | VARCHAR(170) | 字符串数据 |
| address | INT UNSIGNED | 内存地址 |
| length | TINYINT UNSIGNED | 数据长度 |
| result | VARCHAR(24) | 检查结果 |
| comment | VARCHAR(50) | 备注说明 |

### 6.288 waypoint_data (路径点数据表)

存储 creature 的移动路径点数据。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT UNSIGNED | Creature GUID，主键（联合主键） |
| point | INT UNSIGNED | 路径点序号，主键（联合主键） |
| position_x | FLOAT | X坐标 |
| position_y | FLOAT | Y坐标 |
| position_z | FLOAT | Z坐标 |
| orientation | FLOAT | 朝向 |
| delay | INT UNSIGNED | 到达后延迟（毫秒） |
| move_type | INT | 移动类型 |
| action | INT | 触发动作 |
| action_chance | SMALLINT | 动作触发概率 |
| wpguid | INT UNSIGNED | 路径点GUID |

### 6.289 waypoint_scripts (路径点脚本表)

定义路径点触发的脚本命令。

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT UNSIGNED | 路径点ID |
| delay | INT UNSIGNED | 延迟（秒） |
| command | INT UNSIGNED | 命令类型 |
| datalong | INT UNSIGNED | 数据参数1 |
| datalong2 | INT UNSIGNED | 数据参数2 |
| dataint | INT UNSIGNED | 整数数据 |
| x | FLOAT | X坐标 |
| y | FLOAT | Y坐标 |
| z | FLOAT | Z坐标 |
| o | FLOAT | 朝向 |
| guid | INT | 脚本GUID，主键 |

### 6.290 waypoints (路径点表)

存储 creature 的路径点定义（含注释）。

| 字段 | 类型 | 说明 |
|------|------|------|
| entry | INT UNSIGNED | Creature条目ID，主键（联合主键） |
| pointid | INT UNSIGNED | 路径点ID，主键（联合主键） |
| position_x | FLOAT | X坐标 |
| position_y | FLOAT | Y坐标 |
| position_z | FLOAT | Z坐标 |
| orientation | FLOAT | 朝向 |
| delay | INT UNSIGNED | 延迟（毫秒） |
| point_comment | TEXT | 路径点备注 |

### 6.291 wmoareatable_dbc (WMO区域DBC表)

定义WMO（World Map Object）区域属性和名称。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | WMO区域ID，主键 |
| WMOID | INT | WMO ID |
| NameSetID | INT | 名称集ID |
| WMOGroupID | INT | WMO组ID |
| SoundProviderPref | INT | 声音提供商偏好 |
| SoundProviderPrefUnderwater | INT | 水下声音提供商偏好 |
| AmbienceID | INT | 环境音ID |
| ZoneMusic | INT | 区域音乐ID |
| IntroSound | INT | 进入音效ID |
| Flags | INT | 标志 |
| AreaTableID | INT | 区域表ID |
| AreaName_Lang_enUS ~ AreaName_Lang_itIT | VARCHAR(100) | 各语言版本名称 |
| AreaName_Lang_Unk | VARCHAR(100) | 未知语言名称 |
| AreaName_Lang_Mask | INT | 语言掩码 |

### 6.292 worldmaparea_dbc (世界地图区域DBC表)

定义世界地图区域边界和层级关系。

| 字段 | 类型 | 说明 |
|------|------|------|
| ID | INT | 区域ID，主键 |
| MapID | INT | 所属地图ID |
| AreaID | INT | 区域ID |
| AreaName | VARCHAR(100) | 区域名称 |
| LocLeft | FLOAT | 区域左边界 |
| LocRight | FLOAT | 区域右边界 |
| LocTop | FLOAT | 区域上边界 |
| LocBottom | FLOAT | 区域下边界 |
| DisplayMapID | INT | 显示地图ID |
| DefaultDungeonFloor | INT | 默认地下城楼层 |
| ParentWorldMapID | INT | 父级世界地图ID |

---

*文档生成完成*

共计收录表结构：
- acore_auth: 约18个表
- acore_characters: 约100+个表
- acore_world: 已收录 292 个表 (共 304 个)

*文档生成完成*
