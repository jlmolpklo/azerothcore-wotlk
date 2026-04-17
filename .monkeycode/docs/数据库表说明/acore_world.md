# acore_world 数据库表说明

`acore_world` 是游戏内容数据库，存储所有游戏世界的静态数据（NPC、任务、物品、法术等）。

## 核心表分类

### 1. 生物/单位模板 (Creature)

#### creature_template - 生物模板
| 字段 | 类型 | 说明 |
|------|------|------|
| entry | int | 生物 ID (主键) |
| difficulty_entry_A | int | 英雄模式 ID |
| difficulty_entry_B | int | 英雄模式 ID B |
| difficulty_entry_C | int | 英雄模式 ID C |
| KillCredit1 | int | 击杀积分生物 1 |
| KillCredit2 | int | 击杀积分生物 2 |
| modelid_A | int | 模型 A |
| modelid_A2 | int | 模型 A2 |
| modelid_H | int | 模型 人类 |
| modelid_H2 | int | 模型 人类2 |
| name | varchar(100) | 生物名称 |
| subname | varchar(100) | 副名称 |
| IconName | varchar(100) | 图标名 |
| gossip_menu_id | int | 对话菜单 ID |
| minlevel | tinyint | 最小等级 |
| maxlevel | tinyint | 最大等级 |
| exp | smallint | 经验倍数 |
| faction | smallint | 阵营 |
| npcflag | int | NPC 标志 |
| speed_walk | float | 行走速度 |
| speed_run | float | 奔跑速度 |
| scale | float | 模型缩放 |
| rank | tinyint | 稀有度 (0=普通, 1=精英, 2=稀有, 3=世界首领) |
| dmgschool | tinyint | 伤害学派 |
| BaseAttackTime | int | 基础攻击时间 |
| RangeAttackTime | int | 远程攻击时间 |
| BaseVariance | float | 基础方差 |
| RangeVariance | float | 远程方差 |
| unit_class | tinyint | 单位职业 (1=战士等) |
| unit_flags | int | 单位标志 |
| unit_flags2 | int | 单位标志 2 |
| dynamicflags | int | 动态标志 |
| family | tinyint | 家族 |
| trainer_type | tinyint | 训练师类型 |
| trainer_spell | int | 训练师法术 |
| type | tinyint | 生物类型 |
| type_flags | int | 类型标志 |
| lootid | int | 掉落 ID |
| pickpocketLoot | int | 偷窃掉落 |
| SkinLoot | int | 剥皮掉落 |
| resistance1-6 | smallint | 抗性 |
| spells | varchar(100) | 可施放法术 |
| petslot | int | 宠物栏位 |
| VehicleId | int | 载具 ID |
| mingold | int | 最小金币 |
| maxgold | int | 最大金币 |
| AIName | varchar(50) | AI 名称 |
| MovementType | tinyint | 移动类型 |
| inhabittype | tinyint | 栖息类型 |
| HoverHeight | float | 悬浮高度 |
| HealthMod | float | 生命值修正 |
| ManaMod | float | 法力值修正 |
| ArmorMod | float | 护甲修正 |
| damageModifier | float | 伤害修正 |
| experienceModifier | float | 经验修正 |
| ScriptName | varchar(64) | 脚本名称 |
| VerifiedBuild | smallint | 验证的构建号 |

#### creature_template_addon - 生物模板附加
| 字段 | 类型 | 说明 |
|------|------|------|
| entry | int | 生物 ID (FK) |
| path_id | int | 路径 ID |
| mount | int | 坐骑 ID |
| bytes1 | int | 字节数据 |
| bytes2 | int | 字节数据 |
| emote | int | 表情 |
| isMoving | tinyint | 是否移动 |
|auras | text | 光环 |

#### creature_equip_template - 生物装备
| 字段 | 类型 | 说明 |
|------|------|------|
| CreatorGUID | int | 生物 ID |
| ItemID1 | int | 物品 ID 1 |
| ItemID2 | int | 物品 ID 2 |
| ItemID3 | int | 物品 ID 3 |

#### creature_questrelation - 生物任务关联
| 字段 | 类型 | 说明 |
|------|------|------|
| id | int | 生物 ID |
| quest | int | 任务 ID |

---

### 2. 游戏对象模板 (GameObject)

#### gameobject_template - 游戏对象模板
| 字段 | 类型 | 说明 |
|------|------|------|
| entry | int | 对象 ID (主键) |
| type | tinyint | 类型 (0=门, 1=按钮, 2=宝箱等) |
| displayId | int | 显示模型 ID |
| name | varchar(100) | 名称 |
| iconName | varchar(100) | 图标名 |
| castBarCaption | varchar(100) | 施法条标题 |
| unk1 | varchar(100) | 未知 |
| faction | int | 阵营 |
| flags | int | 标志 |
| size | float | 大小 |
| data | text | 数据数组 (最多 32 个) |
| ScriptName | varchar(64) | 脚本名 |
| VerifiedBuild | smallint | 验证构建号 |

---

### 3. 任务模板 (Quest)

#### quest_template - 任务模板
| 字段 | 类型 | 说明 |
|------|------|------|
| ID | int | 任务 ID |
| QuestType | tinyint | 任务类型 |
| Level | smallint | 等级 |
| MinLevel | tinyint | 最小等级 |
| MaxLevel | tinyint | 最大等级 |
| QuestSortID | smallint | 任务分类 |
| QuestInfoID | smallint | 任务信息 ID |
| SuggestedPlayers | tinyint | 建议玩家数 |
| RequiredFactionId1 | smallint | 所需阵营 1 |
| RequiredFactionId2 | smallint | 所需阵营 2 |
| RewardNextQuest | int | 下一任务 |
| RewardXPDifficulty | int | 奖励经验难度 |
| RewardMoney | int | 奖励金钱 |
| RewardBonusMoney | int | 奖励额外金钱 |
| RewardDisplaySpell | int | 显示奖励法术 |
| RewardSpell | int | 奖励法术 |
| RewardItem1-4 | int | 奖励物品 1-4 |
| RewardItemCount1-4 | int | 奖励物品数量 1-4 |
| RequiredNpcOrGo1-4 | int | 所需 NPC/GO 1-4 |
| RequiredNpcOrGoCount1-4 | int | 所需数量 1-4 |
| SourceItemID | int | 源物品 ID |
| Flags | int | 标志 |
| SpecialFlags | tinyint | 特殊标志 |
| Title | varchar(255) | 标题 |
| Objectives | varchar(255) | 目标 |
| Details | text | 详情 |
| EndText | varchar(255) | 结束文本 |
| CompletedText | varchar(255) | 完成文本 |
| ... | ... | ... (还有很多字段) |

---

### 4. 物品模板 (Item)

#### item_template - 物品模板
| 字段 | 类型 | 说明 |
|------|------|------|
| entry | int | 物品 ID (主键) |
| class | tinyint | 物品类别 |
| subclass | tinyint | 物品子类别 |
| SoundOverrideSubclass | smallint | 声音覆盖 |
| name | varchar(255) | 名称 |
| displayid | int | 显示 ID |
| Quality | tinyint | 品质 (0=灰色, 1=白色, 2=绿色, 3=蓝色, 4=紫色, 5=橙色) |
| Flags | int | 标志 |
| FlagsExtra | int | 额外标志 |
| buyCount | tinyint | 购买数量 |
| buyPrice | bigint | 购买价格 |
| sellPrice | int | 出售价格 |
| inventoryType | tinyint | 装备类型 |
| allowableClass | int | 允许职业 |
| allowableRace | int | 允许种族 |
| itemLevel | smallint | 物品等级 |
| RequiredLevel | tinyint | 需要等级 |
| requiredSkill | smallint | 需要技能 |
| requiredSkillRank | smallint | 需要技能等级 |
| item_bind | tinyint | 绑定类型 |
| bonding | tinyint | 绑定描述 |
| description | varchar(255) | 描述 |
| PageText | int | 页文本 ID |
| languageID | tinyint | 语言 |
| pageTextMaterial | tinyint | 页文本材质 |
| startQuest | int | 开始任务 |
| lockID | int | 锁 ID |
| material | tinyint | 材质 |
| sheath | tinyint | 鞘类型 |
| extra | int | 额外数据 |
| randomProperty | int | 随机属性 |
| randomSuffix | int | 随机后缀 |
| block | int | 格挡值 |
| itemset | int | 套装 ID |
| MaxDurability | int | 最大耐久度 |
| area | int | 区域 ID |
| map | smallint | 地图 ID |
| bagFamily | int | 背包家族 |
| TotemCategory | int | 图腾类别 |
| socketColor1-3 | tinyint | 插槽颜色 1-3 |
| socketBonus | int | 插槽奖励 |
| GemProperties | int | 宝石属性 |
| RequiredDisenchantSkill | smallint | 需要分解技能 |
| ArmorDamageModifier | float | 护甲伤害修正 |
| duration | int | 持续时间 |
| ItemLimitCategory | smallint | 物品限制类别 |
| HolidayID | int | 节日 ID |
| ScriptName | varchar(64) | 脚本名 |
| DisenchantID | int | 分解 ID |
| FoodType | tinyint | 食物类型 |
| minMoneyLoot | int | 最小金币掉落 |
| maxMoneyLoot | int | 最大金币掉落 |
| FlagsCustom | int | 自定义标志 |

---

### 5. 法术/技能 (Spell)

#### spell_template - 法术模板
| 字段 | 类型 | 说明 |
|------|------|------|
| Id | int | 法术 ID |
| School | tinyint | 学派 |
| Category | int | 类别 |
| Dispel | int | 驱散类型 |
| Mechanic | int | 机制 |
| Attributes | int | 属性 |
| AttributesEx | int | 扩展属性 |
| ... | ... | ... (大量法术属性字段) |

#### spell_group - 法术组
| 字段 | 类型 | 说明 |
|------|------|------|
| group_id | int | 组 ID |
| spell_id | int | 法术 ID |

---

### 6. 区域/传送 (Area/Transport)

#### areas - 区域表
| 字段 | 类型 | 说明 |
|------|------|------|
| ID | int | 区域 ID |
| area_name | varchar(100) | 区域名 |
| mapid | int | 地图 ID |
| zone | int | 区域 |
| flags | int | 标志 |

#### areatrigger_teleport - 区域触发传送
| 字段 | 类型 | 说明 |
|------|------|------|
| ID | int | 触发器 ID |
| name | varchar(100) | 名称 |
| mapid | int | 地图 ID |
| teleport_position | float | X,Y,Z,O |
| spell_id | int | 传送后施放的法术 |
| volumeid | int | 音量 ID |
| areapritionId | int | 区域优先级 |

---

### 7. 其他重要表

#### playercreateinfo - 玩家创建信息
| 字段 | 类型 | 说明 |
|------|------|------|
| race | tinyint | 种族 |
| class | tinyint | 职业 |
| mapId | smallint | 初始地图 |
| zoneId | int | 初始区域 |
| posX | float | X 坐标 |
| posY | float | Y 坐标 |
| posZ | float | Z 坐标 |
| orientation | float | 方向 |

#### player_levelstats - 玩家等级属性
| 字段 | 类型 | 说明 |
|------|------|------|
| race | tinyint | 种族 |
| class | tinyint | 职业 |
| level | tinyint | 等级 |
| str | tinyint | 力量 |
| agi | tinyint | 敏捷 |
| sta | tinyint | 耐力 |
| inte | tinyint | 智力 |
| spi | tinyint | 精神 |

#### skill_tiers - 技能等级
| 字段 | 类型 | 说明 |
|------|------|------|
| id | int | ID |
| skill | int | 技能 ID |
| value | int | 值 |
| max | int | 最大值 |

#### worldbroadcast - 世界广播
| 字段 | 类型 | 说明 |
|------|------|------|
| id | int | ID |
| content | varchar(255) | 内容 |

---

## 常用修改场景

### 1. 添加新 NPC
```sql
INSERT INTO creature_template (entry, name, minlevel, maxlevel, faction, ...)
VALUES (90001, 'My Custom NPC', 80, 80, 35, ...);
```

### 2. 添加新任务
```sql
INSERT INTO quest_template (ID, Level, Title, Details, ...)
VALUES (99999, 80, 'My Quest', 'Description...', ...);
```

### 3. 添加新物品
```sql
INSERT INTO item_template (entry, name, class, subclass, Quality, ...)
VALUES (99999, 'My Item', 2, 0, 4, ...);
```

### 4. 添加传送门
```sql
INSERT INTO areatrigger_teleport (ID, name, mapid, X, Y, Z, O)
VALUES (9999, 'My Teleport', 0, -8949.95, -132.493, 83.5312, 0);
```

### 5. 修改掉落率
```sql
UPDATE creature_template SET lootid = 99999 WHERE entry = 12345;
INSERT INTO creature_loot_template (entry, item, ChanceOrQuestChance, ...)
VALUES (99999, 12345, 100, ...);
```
