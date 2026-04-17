# acore_characters 数据库表说明

`acore_characters` 是角色数据库，存储所有玩家的角色数据和游戏物品。

## 核心表

### characters - 角色表
| 字段 | 类型 | 说明 |
|------|------|------|
| guid | int | 角色 GUID (主键) |
| account | int | 账号 ID (FK) |
| name | varchar(12) | 角色名 |
| race | tinyint | 种族 |
| class | tinyint | 职业 |
| gender | tinyint | 性别 |
| level | tinyint | 等级 |
| xp | int | 当前经验值 |
| money | bigint | 金币 |
| playerBytes | int | 角色外观数据 |
| playerBytes2 | int | 角色外观数据2 |
| playerFlags | int | 玩家标志 |
| position_x | float | X 坐标 |
| position_y | float | Y 坐标 |
| position_z | float | Z 坐标 |
| map | smallint | 地图 ID |
| online | tinyint | 是否在线 |
| totaltime | int | 总在线时间(秒) |
| leveltime | int | 当前等级在线时间 |
| logout_time | bigint | 最后下线时间 |
| is_logout_resting | tinyint | 是否休息状态 |
| resettalents_time | bigint | 天赋重置时间 |
| transrer | bigint | 传送位置 |
| extra_flags | smallint | 额外标志 |
| stable_slots | tinyint | 驯兽栏位数 |
| at_login | smallint | 登录标志 |
| priest_bank_slots_N | ... | ... |
| zone | smallint | 区域 ID |
| online_time | int | 在线时间 |
| m deed | int | ... |
| achievements | text | 成就数据 |
| championingFaction | int | 冠军阵营 |
| watchedFaction | int | 观察的阵营 |
| drunk | tinyint | 醉酒状态 |
| health | int | 生命值 |
| power | int | 能量值 |
| power_type | tinyint | 能量类型 |
| spec_count | tinyint | 专精数量 |
| active_spec | tinyint | 当前专精 |
| exploredZones | text | 探索区域 |
| equipmentCache | text | 装备缓存 |
| ammo_id | int | 弹药 ID |
| known_titles | text | 已知称号 |
| actionBars | tinyint | 动作条状态 |
| rng | float | 随机数种子 |

### character_account_data - 账号角色数据
| 字段 | 类型 | 说明 |
|------|------|------|
| guid | int | 角色 GUID |
| type | tinyint | 数据类型 |
| time | bigint | 时间戳 |
| data | blob | 数据 |

### character_arena_stats - 竞技场统计
| 字段 | 类型 | 说明 |
|------|------|------|
| guid | int | 角色 GUID |
| slot | tinyint | 槽位 |
| matchMakerRating | int | 匹配评分 |

### character_auditlog - 审计日志
| 字段 | 类型 | 说明 |
|------|------|------|
| guid | int | 角色 GUID |
| event | tinyint | 事件类型 |
| ip | varchar(32) | IP 地址 |
| systemnote | varchar(255) | 系统备注 |
| time | bigint | 时间 |

### character_homebind - 家绑定
| 字段 | 类型 | 说明 |
|------|------|------|
| guid | int | 角色 GUID |
| mapId | smallint | 地图 ID |
| zoneId | smallint | 区域 ID |
| posX | float | X 坐标 |
| posY | float | Y 坐标 |
| posZ | float | Z 坐标 |

### character_instance - 角色副本绑定
| 字段 | 类型 | 说明 |
|------|------|------|
| guid | int | 角色 GUID |
| instance | int | 实例 ID |
| permanent | tinyint | 是否永久 |

### character_inventory - 角色背包
| 字段 | 类型 | 说明 |
|------|------|------|
| guid | int | 角色 GUID |
| bag | tinyint | 背包槽位 |
| slot | tinyint | 物品槽位 |
| item | int | 物品 ID (FK) |

### item_instance - 物品实例
| 字段 | 类型 | 说明 |
|------|------|------|
| guid | int | 物品 GUID (主键) |
| owner_guid | int | 拥有者 GUID |
| creator_guid | int | 创建者 GUID |
| gift_creator_guid | int | 赠送者 GUID |
| count | int | 数量 |
| duration | int | 持续时间 |
| charges | text | 充能数据 |
| flags | int | 标志 |
| enchantments | text | 附魔数据 |
| random_property_id | smallint | 随机属性 ID |
| durability | smallint | 耐久度 |
| played_time | int | 使用时间 |
| text | text | 物品文本 |

### character_queststatus - 任务状态
| 字段 | 类型 | 说明 |
|------|------|------|
| guid | int | 角色 GUID |
| quest | int | 任务 ID |
| status | tinyint | 状态 |
| explored | tinyint | 是否探索 |
| timer | bigint | 剩余时间 |
| mobcount1-4 | smallint | 击杀计数 |
| itemcount1-6 | int | 物品计数 |
| reward | tinyint | 奖励选择 |

### character_social - 角色社交
| 字段 | 类型 | 说明 |
|------|------|------|
| guid | int | 角色 GUID |
| friend | int | 好友 GUID |
| flags | tinyint | 标志 |
| note | varchar | 备注 |

### character_spell - 角色法术
| 字段 | 类型 | 说明 |
|------|------|------|
| guid | int | 角色 GUID |
| spell | int | 法术 ID |
| active | tinyint | 是否激活 |
| disabled | tinyint | 是否禁用 |

### character_talent - 角色天赋
| 字段 | 类型 | 说明 |
|------|------|------|
| guid | int | 角色 GUID |
| spell | int | 法术 ID |
| talentGroup | tinyint | 天赋专精 |

### guild - 公会表
| 字段 | 类型 | 说明 |
|------|------|------|
| guildid | int | 公会 ID |
| name | varchar(24) | 公会名 |
| leaderguid | int | 会长 GUID |
| EmblemStyle | tinyint | 徽章样式 |
| EmblemColor | tinyint | 徽章颜色 |
| BorderStyle | tinyint | 边框样式 |
| BorderColor | tinyint | 边框颜色 |
| BackgroundColor | tinyint | 背景颜色 |
| info | varchar(500) | 公会公告 |
| motd | varchar(128) | 会长留言 |
| createdate | int | 创建时间 |
| BankMoney | bigint | 公会银行金币 |

### guild_member - 公会成员
| 字段 | 类型 | 说明 |
|------|------|------|
| guildid | int | 公会 ID |
| guid | int | 角色 GUID |
| rank | tinyint | 等级 |
| pnote | varchar(31) | 成员备注 |
| offnote | varchar(31) | 官员备注 |

### mail - 邮件
| 字段 | 类型 | 说明 |
|------|------|------|
| messageid | int | 邮件 ID |
| messageType | tinyint | 邮件类型 |
| stationery | tinyint | 信纸类型 |
| money | bigint | 金币 |
| cod | bigint | 需付款 |
| checked | tinyint | 已读标志 |
| deliver_time | bigint | 投递时间 |
| expire_time | bigint | 过期时间 |
| body | text | 邮件正文 |
| subject | text | 邮件主题 |

### pet_instance - 宠物实例
| 字段 | 类型 | 说明 |
|------|------|------|
| id | int | 宠物 ID |
| modelid | int | 模型 ID |
| createdby | int | 创建者 GUID |
| unit | int | 单位 GUID |

---

## 常用修改场景

### 1. 修改角色等级
```sql
UPDATE characters SET level = 80 WHERE guid = 12345;
```

### 2. 重置角色天赋
```sql
DELETE FROM character_talent WHERE guid = 12345;
UPDATE characters SET resetTalents_time = 0 WHERE guid = 12345;
```

### 3. 修改角色金币
```sql
UPDATE characters SET money = money + 100000 WHERE guid = 12345;
```

### 4. 删除角色物品
```sql
DELETE FROM character_inventory WHERE guid = 12345;
DELETE FROM item_instance WHERE owner_guid = 12345;
```

### 5. 重置角色密码/重置成就
```sql
-- 成就
UPDATE characters SET achievements = '' WHERE guid = 12345;
```
