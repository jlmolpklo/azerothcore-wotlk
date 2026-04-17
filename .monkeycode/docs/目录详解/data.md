# data 目录详解

`data` 目录包含所有游戏数据和 SQL 文件，是游戏内容的核心数据源。

## 目录结构

```
data/
├── sql/                          # SQL 数据文件
│   ├── base/                     # 基础数据库结构
│   │   ├── db_auth/              # 认证数据库
│   │   ├── db_characters/        # 角色数据库
│   │   └── db_world/              # 世界数据库
│   └── updates/                  # 数据库更新
│       ├── pending/              # 待合并的更新
│       ├── db_auth/              # 按日期组织
│       ├── db_characters/
│       └── db_world/
├──dbc/                          # DBC 数据文件（可选）
└── maps/                        # 地图文件（客户端提取）
```

---

## sql/base/ 基础数据库

### db_auth/ - 认证数据库（18 个文件）

| 文件 | 创建的表 | 用途 |
|------|---------|------|
| `00000_migration_history.sql` | `migration_history` | 记录已执行的迁移 |
| `00100_auth_database.sql` | `account`, `account_access`, `ip_banned` 等 | 核心账号表 |
| `00200_realmlist.sql` | `realmlist` | 服务器列表 |
| `00300_logs_database.sql` | `logs` | 日志表 |

### db_characters/ - 角色数据库（106 个文件）

| 文件 | 创建的表 | 用途 |
|------|---------|------|
| `00000_migration_history.sql` | `migration_history` | 记录迁移 |
| `00100_characters_database.sql` | `characters`, `character_homebind` 等 | 角色核心数据 |
| `00200_items_database.sql` | `item_instance`, `character_inventory` | 物品系统 |
| `00300_guild_database.sql` | `guild`, `guild_member` 等 | 公会系统 |
| `00400_mail_database.sql` | `mail`, `mail_items` 等 | 邮件系统 |
| ... | ... | ... |

### db_world/ - 世界数据库（304 个文件）

| 类别 | 文件前缀 | 创建的表 |
|------|---------|---------|
| 技能系统 | `skill_tiers` | `skill_tiers` |
| 任务系统 | `quest_template.sql` | `quest_template`, `quest_details` 等 |
| 物品系统 | `item_template.sql` | `item_template` |
| 生物模板 | `creature_template.sql` | `creature_template` |
| 游戏对象 | `gameobject_template.sql` | `gameobject_template` |
| 区域定义 | `areas.sql` | `areas`, `areatrigger_teleport` |
| 种族/职业 | `playercreateinfo*.sql` | `playercreateinfo_*` |
| 种族/职业初始数据 | `player_levelstats.sql` | `player_levelstats` |
| 法术系统 | `spell_template*.sql` | 各种 spell_* 表 |

---

## sql/updates/ 数据库更新

### 目录结构
```
updates/
├── pending/                    # 待合并的更新（PR 阶段）
│   ├── db_auth/
│   ├── db_characters/
│   └── db_world/
├── db_auth/                   # 已合并的认证更新
│   ├── 2024_01_01_00.sql
│   └── ...
├── db_characters/             # 已合并的角色更新
│   └── ...
└── db_world/                   # 已合并的世界更新
    ├── 2024_01_01_00.sql
    ├── 2024_01_01_01.sql
    ├── 2024_01_01_02.sql
    ├── 2024_01_01_03.sql
    └── ... (按日期一直到现在)
```

### 命名规则
```
YYYY_MM_DD_XX.sql
```
- `YYYY` = 年
- `MM` = 月
- `DD` = 日
- `XX` = 当天的序号（00, 01, 02...）

### 示例
```
2024_07_09_00.sql  # 2024年7月9日的第1个更新
2024_07_09_01.sql  # 2024年7月9日的第2个更新
```

### pending/ 目录说明
- 包含还未合并到主仓库的更新
- 用于模块开发或临时修复
- 文件名是随机生成的

---

## 常用修改场景

### 1. 添加新的 NPC
```sql
-- 在 creature_template 中添加
INSERT INTO creature_template (...) VALUES (...);
-- 在 creature_questrelation 中添加任务关联
```

### 2. 添加新的任务
```sql
-- 在 quest_template 中添加
INSERT INTO quest_template (...) VALUES (...);
```

### 3. 添加新的物品
```sql
-- 在 item_template 中添加
INSERT INTO item_template (...) VALUES (...);
```

### 4. 修改游戏平衡性
```sql
-- 修改技能伤害
UPDATE spell_template SET ... WHERE ...;
-- 修改物品属性
UPDATE item_template SET ... WHERE ...;
```

### 5. 添加新的区域传送
```sql
-- 在 areatrigger_teleport 中添加
INSERT INTO areatrigger_teleport (...) VALUES (...);
```

---

## 数据库更新工具

AzerothCore 提供了数据库更新工具：

```bash
# 使用 worldserver 内置命令
.server update subcommand

# 或手动执行 SQL
source data/sql/updates/db_world/2024_07_09_00.sql
```
