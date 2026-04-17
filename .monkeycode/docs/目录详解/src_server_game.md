# src/server/game 目录结构详解

本文档详细介绍 AzerothCore 游戏服务器（worldserver）的核心代码目录结构。该目录包含了游戏逻辑的主要实现，是整个服务器最核心的部分。

## 目录概览

`src/server/game` 目录包含 51 个子目录，主要分为以下几大类：

| 类别 | 子目录数量 | 说明 |
|------|-----------|------|
| 核心系统 | 8 | Entities、World、Server、Maps、Spells、AI、Movement、Scripting |
| 游戏玩法 | 15 | Battlegrounds、Groups、Guilds、Quests、AuctionHouse、Loot 等 |
| 管理功能 | 8 | Chat、Tickets、Accounts、Mails、Calendar 等 |
| 数据存储 | 3 | DataStores、Cache、Conditions |
| 其他系统 | 17 | OutdoorPvP、Weather、Warden、Pools 等 |

---

## 一、核心子系统

### 1. Entities（实体系统）

**路径**: `/workspace/src/server/game/Entities`

**作用**: 游戏中最基本的对象实体系统，所有游戏对象（玩家、生物、物品、游戏对象等）都继承自此目录下的类。

#### 子目录结构

| 子目录 | 文件数 | 说明 |
|--------|--------|------|
| Object | 16 | 最基础的 world object 类，所有对象的基类 |
| Unit | 9 | 战斗单位基类（继承自 Object），包含战斗逻辑 |
| Player | 22 | 玩家实体，包含角色所有功能 |
| Creature | 10 | NPC/怪物实体 |
| GameObject | 4 | 游戏对象（如门、宝箱、传送门等） |
| Item | 6 | 物品系统，包含背包容器 |
| Pet | 4 | 宠物系统 |
| Vehicle | 3 | 载具系统 |
| Totem | 2 | 图腾系统 |
| Corpse | 2 | 尸体系统 |
| DynamicObject | 2 | 动态对象（如法师的冰盾） |
| Transport | 2 | 交通系统（如电梯、飞船） |

#### 核心文件说明

**Object 类层次结构**:
```
Object (基类)
├── Unit (战斗单位)
│   ├── Player (玩家)
│   ├── Creature (生物/NPC)
│   ├── Pet (宠物)
│   └── Totem (图腾)
├── GameObject (游戏对象)
├── Item (物品)
│   └── Container/Bag (容器/背包)
├── Corpse (尸体)
├── DynamicObject (动态对象)
└── Transport (交通工具)
```

**关键文件**:

| 文件 | 功能说明 |
|------|----------|
| `Object/Object.h/cpp` | 所有游戏对象的基类，提供 GUID、位置、更新等基本功能 |
| `Object/ObjectGuid.h/cpp` | 对象全局唯一标识符管理 |
| `Object/Position.h/cpp` | 位置和坐标管理 |
| `Object/Updates/` | 对象更新数据系统，处理客户端同步 |
| `Unit/Unit.h/cpp` | 战斗单位基类，包含生命值、战斗状态、威胁值等 |
| `Unit/StatSystem.cpp` | 属性系统（力量、敏捷、智力等） |
| `Unit/CharmInfo.h/cpp` | 宠物/控制单位的信息管理 |
| `Player/Player.h/cpp` | 玩家类，包含背包、任务、技能、社交等所有玩家功能 |
| `Creature/Creature.h/cpp` | NPC/怪物类，包含 AI 触发、寻路路径点等 |
| `Item/Item.h/cpp` | 物品实例类 |
| `GameObject/GameObject.h/cpp` | 游戏对象类（门、宝箱、钓鱼点等） |

---

### 2. Spells（法术系统）

**路径**: `/workspace/src/server/game/Spells`

**作用**: 处理游戏中所有的法术/技能逻辑，包括施法机制、buff/debuff（光环）等。

#### 子目录

| 子目录 | 说明 |
|--------|------|
| Auras | 光环系统（buff/debuff） |

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `Spell.h/cpp` | 法术施放核心类，处理施法流程、目标选择、消耗计算 |
| `SpellInfo.h/cpp` | 法术信息定义，包含法术的所有元数据 |
| `SpellInfoCorrections.cpp` | 法术数据的修正/补丁 |
| `SpellMgr.h/cpp` | 法术管理器，加载和管理法术数据 |
| `SpellEffects.cpp` | 法术效果实现（伤害、治疗、召唤等） |
| `SpellScript.h/cpp` | 法术脚本接口，用于定制法术行为 |
| `Auras/SpellAuras.h/cpp` | 光环（Aura）系统，管理持续性效果 |
| `Auras/SpellAuraEffects.h/cpp` | 光环效果的具体实现 |
| `SpellDefines.h` | 法术相关枚举和常量定义 |

#### 法术系统架构

```
Spell (施法)
├── SpellInfo (法术数据)
├── SpellEffects (法术效果)
└── SpellAuras (光环/Buff)
    └── SpellAuraEffects (光环效果)
```

---

### 3. Maps（地图系统）

**路径**: `/workspace/src/server/game/Maps`

**作用**: 管理游戏世界中的所有地图实例，包括世界地图、副本、战场地图等。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `Map.h/cpp` | 地图基类，管理地图上的对象、网格、碰撞检测 |
| `MapMgr.h/cpp` | 地图管理器，负责地图的更新和对象管理 |
| `MapInstanced.h/cpp` | 实例地图（如副本）管理 |
| `MapUpdater.h/cpp` | 地图更新器，处理地图异步更新 |
| `ZoneScript.h/cpp` | 区域脚本接口 |
| `TransportMgr.h/cpp` | 交通工具管理器（电梯、飞船） |
| `AreaBoundary.h/cpp` | 区域边界定义 |
| `SpawnData.h` | 生成数据定义 |
| `AreaDefines.h` | 区域相关定义 |

#### 地图类型

| 类型 | 说明 |
|------|------|
| ContinentMap | 大陆地图（如东部王国、诺森德） |
| InstanceMap | 副本地图（如斯坦索姆、黑石深渊） |
| BattlegroundMap | 战场地图 |
| ArenaMap | 竞技场地图 |

---

### 4. AI（人工智能系统）

**路径**: `/workspace/src/server/game/AI`

**作用**: 管理 NPC 的行为和决策逻辑。

#### 子目录

| 子目录 | 说明 |
|--------|------|
| CoreAI | 核心 AI 实现（被动、战斗、宠物等） |
| SmartScripts | SmartAI 脚本系统 |
| ScriptedAI | 脚本化 AI 实现 |

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `CreatureAI.h/cpp` | NPC AI 基类，定义 AI 接口 |
| `UnitAI.h/cpp` | 单元 AI 基类 |
| `CreatureAIRegistry.h/cpp` | AI 注册系统 |
| `CreatureAISelector.h/cpp` | AI 选择器，根据条件选择合适的 AI |
| `MotionMaster.h/cpp` | 运动控制器，管理 NPC 移动 |
| `SmartScripts/SmartScript.h/cpp` | SmartAI 脚本系统核心 |
| `SmartScripts/SmartScriptMgr.h/cpp` | SmartAI 管理器 |
| `SmartScripts/SmartAI.h/cpp` | SmartAI 实现 |
| `ScriptedAI/ScriptedCreature.h/cpp` | 脚本化生物 AI |
| `CoreAI/CombatAI.h/cpp` | 战斗 AI |
| `CoreAI/PetAI.h/cpp` | 宠物 AI |
| `CoreAI/TotemAI.h/cpp` | 图腾 AI |
| `CoreAI/PassiveAI.h/cpp` | 被动 AI |
| `CoreAI/GuardAI.h/cpp` | 守卫 AI |

#### AI 类型

| AI 类型 | 说明 |
|---------|------|
| NullAI | 空 AI，不执行任何行为 |
| PassiveAI | 被动 AI，只在被攻击时反击 |
| AggressiveAI | 主动攻击 AI |
| DefenderAI | 防御性 AI |
| PetAI | 宠物 AI |
| TotemAI | 图腾 AI |
| SmartAI | 可编程 AI，通过数据库配置 |

---

### 5. Handlers（处理器/处理器）

**路径**: `/workspace/src/server/game/Handlers`

**作用**: 处理客户端发送的数据包（Packet），每个 Handler 对应一种客户端请求。

#### 核心文件（按功能分类）

**连接与会话**:
| 文件 | 功能说明 |
|------|----------|
| `AuthHandler.cpp` | 认证相关处理 |
| `WorldSocket.cpp` | 网络套接字管理 |
| `WorldSession.cpp` | 世界会话管理 |

**角色管理**:
| 文件 | 功能说明 |
|------|----------|
| `CharacterHandler.cpp` | 角色创建、删除、复活等 |
| `ChatHandler.cpp` | 聊天消息处理 |
| `Socialhandler.cpp` | 好友列表、黑名单 |

**战斗相关**:
| 文件 | 功能说明 |
|------|----------|
| `SpellHandler.cpp` | 法术施放、取消等 |
| `CombatHandler.cpp` | 战斗状态处理 |
| `DuelHandler.cpp` | 决斗系统 |

**物品与交易**:
| 文件 | 功能说明 |
|------|----------|
| `ItemHandler.cpp` | 物品使用、装备、交易 |
| `TradeHandler.cpp` | 交易处理 |
| `BankHandler.cpp` | 银行操作 |

** NPC 与任务**:
| 文件 | 功能说明 |
|------|----------|
| `NPCHandler.cpp` | NPC 对话、购买、出售 |
| `QuestHandler.cpp` | 任务接受、完成任务 |
| `GossipHandler.cpp` | 对话选项 |

**组队与工会**:
| 文件 | 功能说明 |
|------|----------|
| `GroupHandler.cpp` | 队伍管理 |
| `GuildHandler.cpp` | 工会管理 |

**移动相关**:
| 文件 | 功能说明 |
|------|----------|
| `MovementHandler.cpp` | 玩家移动、位置同步 |
| `TaxiHandler.cpp` | 飞行路线 |

**副本与战场**:
| 文件 | 功能说明 |
|------|----------|
| `BattleGroundHandler.cpp` | 战场相关 |
| `LFGHandler.cpp` | 地下城查找器 |
| `PetHandler.cpp` | 宠物管理 |

**邮件系统**:
| 文件 | 功能说明 |
|------|----------|
| `MailHandler.cpp` | 邮件发送、接收 |

**其他功能**:
| 文件 | 功能说明 |
|------|----------|
| `CalendarHandler.cpp` | 日历系统 |
| `TicketHandler.cpp` | 客服工单 |
| `AuctionHouseHandler.cpp` | 拍卖行 |
| `ArenaTeamHandler.cpp` | 竞技场队伍 |
| `VehicleHandler.cpp` | 载具系统 |
| `SkillHandler.cpp` | 技能系统 |
| `AddonHandler.cpp` | 插件管理 |
| `MiscHandler.cpp` | 杂项处理 |
| `QueryHandler.cpp` | 查询处理 |
| `VoiceChatHandler.cpp` | 语音聊天 |

---

### 6. World（世界系统）

**路径**: `/workspace/src/server/game/World`

**作用**: 全局世界状态管理，是整个游戏服务器的核心控制类。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `World.h/cpp` | 世界核心类，管理全局状态、配置、更新循环 |
| `IWorld.h` | 世界接口定义 |
| `WorldConfig.h/cpp` | 世界配置管理（端口、倍率等） |
| `WorldState.h/cpp` | 世界状态管理 |

#### 主要功能

- 全局配置管理
- 服务器更新循环
- 事件调度
- 环境状态维护
- 广播消息处理

---

### 7. Server（服务器框架）

**路径**: `/workspace/src/server/game/Server`

**作用**: 提供网络通信、协议处理、会话管理等基础设施。

#### 子目录

| 子目录 | 说明 |
|--------|------|
| Protocol | 网络协议（opcode 定义） |
| Packets | 服务器发往客户端的数据包 |

#### 核心文件

**网络通信**:
| 文件 | 功能说明 |
|------|----------|
| `WorldSocket.h/cpp` | 网络套接字，处理 TCP 连接 |
| `WorldSocketMgr.h/cpp` | 套接字管理器 |
| `WorldSession.h/cpp` | 会话管理，每个玩家连接对应一个会话 |
| `WorldSessionMgr.h/cpp` | 会话管理器 |
| `WorldPacket.h` | 世界数据包格式 |

**协议**:
| 文件 | 功能说明 |
|------|----------|
| `Protocol/Opcodes.h` | 操作码定义（CMSG_*, SMSG_*） |
| `Protocol/Opcodes.cpp` | 操作码实现 |
| `Protocol/ServerPktHeader.h` | 服务器数据包头 |
| `Packet.cpp` | 数据包基类 |

**数据包**:
| 文件 | 功能说明 |
|------|----------|
| `Packets/ChatPackets.h/cpp` | 聊天相关数据包 |
| `Packets/CharacterPackets.h/cpp` | 角色相关数据包 |
| `Packets/CombatPackets.h/cpp` | 战斗相关数据包 |
| `Packets/GuildPackets.h/cpp` | 公会相关数据包 |
| `Packets/ItemPackets.h/cpp` | 物品相关数据包 |
| `Packets/SpellPackets.h/cpp` | 法术相关数据包 |
| `Packets/WorldStatePackets.h/cpp` | 世界状态同步数据包 |

---

### 8. Movement（移动系统）

**路径**: `/workspace/src/server/game/Movement`

**作用**: 处理游戏中所有对象的移动、路径规划、移动生成器等。

#### 子目录

| 子目录 | 说明 |
|--------|------|
| Spline | 样条曲线移动（平滑曲线） |
| MovementGenerators | 移动生成器（各种移动行为） |
| Waypoints | 路径点系统 |

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `MovementGenerator.h` | 移动生成器基类接口 |
| `MotionMaster.h/cpp` | 运动控制器核心类 |
| `Spline/MoveSpline.h/cpp` | 样条曲线移动实现 |
| `Spline/MoveSplineInit.h/cpp` | 样条移动初始化 |
| `Spline/MovementPacketBuilder.cpp` | 移动数据包构建 |
| `MovementGenerators/IdleMovementGenerator.h/cpp` | 静止移动 |
| `MovementGenerators/PointMovementGenerator.h/cpp` | 点对点移动 |
| `MovementGenerators/TargetedMovementGenerator.h/cpp` | 跟随目标移动 |
| `MovementGenerators/WaypointMovementGenerator.h/cpp` | 路径点移动 |
| `MovementGenerators/RandomMovementGenerator.h/cpp` | 随机移动 |
| `MovementGenerators/FleeingMovementGenerator.h/cpp` | 逃跑移动 |
| `MovementGenerators/ConfusedMovementGenerator.h/cpp` | 混乱移动 |
| `MovementGenerators/HomeMovementGenerator.h/cpp` | 回家移动 |
| `MovementGenerators/EscortMovementGenerator.h/cpp` | 护送移动 |
| `MovementGenerators/FormationMovementGenerator.h/cpp` | 编队移动 |
| `MovementGenerators/PathGenerator.h/cpp` | 路径规划 |
| `Waypoints/WaypointMgr.h/cpp` | 路径点管理器 |

---

### 9. Scripting（脚本系统）

**路径**: `/workspace/src/server/game/Scripting`

**作用**: 提供脚本接口和脚本管理器，用于扩展游戏内容。

#### 子目录

| 子目录 | 说明 |
|--------|------|
| ScriptDefines | 各种脚本类型定义 |

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `ScriptMgr.h/cpp` | 脚本管理器，负责加载和调用脚本 |
| `ScriptObject.h/cpp` | 脚本对象基类 |
| `ScriptSystem.h/cpp` | 脚本系统接口 |
| `MapScripts.cpp` | 地图脚本实现 |
| `ScriptDefines/` | 包含所有脚本类型的接口定义 |

#### 脚本类型

| 脚本类型 | 说明 |
|----------|------|
| CreatureScript | NPC 脚本 |
| GameObjectScript | 游戏对象脚本 |
| SpellScript | 法术脚本 |
| InstanceMapScript | 副本脚本 |
| BattlegroundScript | 战场脚本 |
| CommandScript | 命令脚本 |
| PlayerScript | 玩家脚本 |
| GuildScript | 公会脚本 |

---

## 二、游戏玩法系统

### 10. Battlegrounds（战场系统）

**路径**: `/workspace/src/server/game/Battlegrounds`

**作用**: 管理所有战场玩法。

#### 子目录

| 子目录 | 说明 |
|--------|------|
| Zones | 各战场地图实现 |
| ArenaSeason | 竞技场赛季奖励 |

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `Battleground.h/cpp` | 战场基类 |
| `BattlegroundMgr.h/cpp` | 战场管理器 |
| `BattlegroundQueue.h/cpp` | 战场排队系统 |
| `Arena.h/cpp` | 竞技场基类 |
| `ArenaTeam.h/cpp` | 竞技场队伍 |
| `ArenaTeamMgr.h/cpp` | 竞技场队伍管理器 |
| `BattlegroundSpamProtect.h/cpp` | 战场防刷系统 |

#### 战场地图实现

| 战场 | 说明 |
|------|------|
| BattlegroundAV | 奥特兰克山谷 |
| BattlegroundWS | 战歌峡谷 |
| BattlegroundAB | 阿拉希盆地 |
| BattlegroundEY | 风暴之眼 |
| BattlegroundSA | 萨尔萨玛 |
| BattlegroundIC | 岛屿之战 |
| BattlegroundDS | 怯懦试炼 |
| BattlegroundRV | 随机战场 |
| BattlegroundNA | 北锁战场 |
| BattlegroundBE | 燃烧平原 |
| BattlegroundRL | 荣耀战场 |

---

### 11. Groups（队伍系统）

**路径**: `/workspace/src/server/game/Groups`

**作用**: 管理玩家组队逻辑。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `Group.h/cpp` | 队伍类，管理组队逻辑 |
| `GroupMgr.h/cpp` | 队伍管理器 |
| `GroupReference.h/cpp` | 队伍成员引用 |

---

### 12. Guilds（公会系统）

**路径**: `/workspace/src/server/game/Guilds`

**作用**: 管理公会创建、成员、等级、银行等。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `Guild.h/cpp` | 公会核心类 |
| `GuildMgr.h/cpp` | 公会管理器 |

---

### 13. Quests（任务系统）

**路径**: `/workspace/src/server/game/Quests`

**作用**: 管理任务相关逻辑。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `QuestDef.h/cpp` | 任务定义 |

---

### 14. AuctionHouse（拍卖行）

**路径**: `/workspace/src/server/game/AuctionHouse`

**作用**: 拍卖行系统。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `AuctionHouseMgr.h/cpp` | 拍卖行管理器 |
| `AuctionHouseSearcher.h/cpp` | 拍卖搜索 |

---

### 15. Loot（战利品系统）

**路径**: `/workspace/src/server/game/Loot`

**作用**: 管理掉落物品逻辑。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `LootMgr.h/cpp` | 战利品管理器 |
| `LootItemStorage.h/cpp` | 战利品存储 |

---

### 16. OutdoorPvP（户外 PVP）

**路径**: `/workspace/src/server/game/OutdoorPvP`

**作用**: 户外 PVP 玩法（如世界 Boss、领地战）。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `OutdoorPvP.h/cpp` | 户外 PVP 基类 |
| `OutdoorPvPMgr.h/cpp` | 户外 PVP 管理器 |

---

### 17. DungeonFinding（地下城查找器）

**路径**: `/workspace/src/server/game/DungeonFinding`

**作用**: 随机副本系统（LFG）。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `LFG.h/cpp` | LFG 核心定义 |
| `LFGMgr.h/cpp` | LFG 管理器 |
| `LFGQueue.h/cpp` | LFG 队列 |
| `LFGScripts.h/cpp` | LFG 脚本 |

---

### 18. Calendar（日历系统）

**路径**: `/workspace/src/server/game/Calendar`

**作用**: 游戏内日历，管理公会活动。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `CalendarMgr.h/cpp` | 日历管理器 |

---

### 19. ArenaSpectator（竞技场观战）

**路径**: `/workspace/src/server/game/ArenaSpectator`

**作用**: 竞技场观战系统。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `ArenaSpectator.h/cpp` | 观战系统 |

---

## 三、管理功能系统

### 20. Chat（聊天系统）

**路径**: `/workspace/src/server/game/Chat`

**作用**: 处理游戏内聊天、频道、指令。

#### 子目录

| 子目录 | 说明 |
|--------|------|
| Channels | 聊天频道 |
| ChatCommands | 聊天指令 |

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `Chat.h/cpp` | 聊天核心 |
| `Channels/Channel.h/cpp` | 频道类 |
| `Channels/ChannelMgr.h/cpp` | 频道管理器 |
| `ChatCommands/ChatCommand.h` | 命令基类 |
| `Hyperlinks.h/cpp` | 超链接处理 |

---

### 21. Tickets（工单系统）

**路径**: `/workspace/src/server/game/Tickets`

**作用**: GM 工单系统。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `TicketMgr.h/cpp` | 工单管理器 |

---

### 22. Accounts（账号系统）

**路径**: `/workspace/src/server/game/Accounts`

**作用**: 账号管理。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `AccountMgr.h/cpp` | 账号管理器 |

---

### 23. Mails（邮件系统）

**路径**: `/workspace/src/server/game/Mails`

**作用**: 游戏内邮件。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `Mail.h/cpp` | 邮件类 |
| `ServerMailMgr.h/cpp` | 服务器邮件管理器 |

---

## 四、数据存储系统

### 24. DataStores（DBC 数据存储）

**路径**: `/workspace/src/server/game/DataStores`

**作用**: 加载和管理 DBC 数据库文件（客户端数据）。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `DBCStores.h/cpp` | DBC 数据存储核心 |
| `M2Stores.h/cpp` | M2 模型数据 |
| `M2Structure.h` | M2 结构定义 |

---

### 25. Cache（缓存系统）

**路径**: `/workspace/src/server/game/Cache`

**作用**: 内存缓存。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `CharacterCache.h/cpp` | 角色缓存 |
| `WhoListCacheMgr.h/cpp` | 玩家列表缓存 |

---

### 26. Conditions（条件系统）

**路径**: `/workspace/src/server/game/Conditions`

**作用**: 条件判断系统。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `ConditionMgr.h/cpp` | 条件管理器 |
| `DisableMgr.h/cpp` | 禁用管理器 |

---

## 五、其他重要系统

### 27. Combat（战斗系统）

**路径**: `/workspace/src/server/game/Combat`

**作用**: 战斗相关核心逻辑。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `CombatManager.h/cpp` | 战斗管理器 |
| `ThreatManager.h/cpp` | 威胁值管理器 |

---

### 28. Grids（网格系统）

**路径**: `/workspace/src/server/game/Grids`

**作用**: 游戏世界的网格划分系统，用于空间分区和对象查找优化。

#### 子目录

| 子目录 | 说明 |
|--------|------|
| Notifiers | 网格通知器 |
| Cells | 网格单元 |

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `GridDefines.h` | 网格定义 |
| `GridRefMgr.h/cpp` | 网格引用管理 |
| `GridNotifiers.h/cpp` | 网格通知实现 |
| `Cell.h/cpp` | 单元格定义 |
| `MapGrid.h/cpp` | 地图网格 |

---

### 29. Globals（全局管理器）

**路径**: `/workspace/src/server/game/Globals`

**作用**: 全局对象管理器。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `ObjectMgr.h/cpp` | 对象管理器（NPC、物品模板等） |
| `ObjectAccessor.h/cpp` | 对象访问器 |
| `WorldGlobals.h/cpp` | 世界全局 |

---

### 30. Instances（副本系统）

**路径**: `/workspace/src/server/game/Instances`

**作用**: 副本管理。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `InstanceScript.h/cpp` | 副本脚本基类 |
| `InstanceSaveMgr.h/cpp` | 副本保存管理器 |

---

### 31. Achievements（成就系统）

**路径**: `/workspace/src/server/game/Achievements`

**作用**: 成就追踪和奖励。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `AchievementMgr.h/cpp` | 成就管理器 |

---

### 32. Reputation（声望系统）

**路径**: `/workspace/src/server/game/Reputation`

**作用**: 阵营声望。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `ReputationMgr.h/cpp` | 声望管理器 |

---

### 33. Skills（技能系统）

**路径**: `/workspace/src/server/game/Skills`

**作用**: 技能相关扩展。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `SkillExtraItems.h/cpp` | 技能额外物品制作 |
| `SkillDiscovery.h/cpp` | 技能发现 |

---

### 34. Weather（天气系统）

**路径**: `/workspace/src/server/game/Weather`

**作用**: 天气效果。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `Weather.h/cpp` | 天气类 |
| `WeatherMgr.h/cpp` | 天气管理器 |

---

### 35. Warden（作弊检测）

**路径**: `/workspace/src/server/game/Warden`

**作用**: 客户端作弊检测系统。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `Warden.h/cpp` | Warden 基类 |
| `WardenWin.h/cpp` | Windows Warden 实现 |
| `WardenMac.h/cpp` | Mac Warden 实现 |
| `WardenCheckMgr.h/cpp` | Warden 检查管理器 |
| `WardenPayloadMgr.h/cpp` | Warden 负载管理器 |

---

### 36. Pools（对象池）

**路径**: `/workspace/src/server/game/Pools`

**作用**: 游戏对象池管理（刷新、重生）。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `PoolMgr.h/cpp` | 对象池管理器 |

---

### 37. Events（事件系统）

**路径**: `/workspace/src/server/game/Events`

**作用**: 游戏事件管理。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `GameEventMgr.h/cpp` | 游戏事件管理器 |
| `HolidayDateCalculator.h/cpp` | 假日日期计算 |

---

### 38. Battlefield（战场管理器）

**路径**: `/workspace/src/server/game/Battlefield`

**作用**: 大型战场（如冬拥湖）。

#### 子目录

| 子目录 | 说明 |
|--------|------|
| Zones | 各大型战场实现 |

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `Battlefield.h/cpp` | 战场基类 |
| `BattlefieldMgr.h/cpp` | 战场管理器 |
| `Zones/BattlefieldWG.h/cpp` | 冬拥湖战场 |

---

### 39. Miscellaneous（杂项）

**路径**: `/workspace/src/server/game/Miscellaneous`

**作用**: 杂项功能。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `Language.h` | 语言 ID 定义 |
| `Formulas.h/cpp` | 各种游戏公式 |

---

### 40. Motd（当日消息）

**路径**: `/workspace/src/server/game/Motd`

**作用**: 服务器公告消息。

---

### 41. Addons（插件系统）

**路径**: `/workspace/src/server/game/Addons`

**作用**: 插件管理。

---

### 42. Petitions（请愿系统）

**路径**: `/workspace/src/server/game/Petitions`

**作用**: 公会创建请愿。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `PetitionMgr.h/cpp` | 请愿管理器 |

---

### 43. Texts（文本系统）

**路径**: `/workspace/src/server/game/Texts`

**作用**: 游戏文本（NPC 对话等）。

---

### 44. Tools（工具）

**路径**: `/workspace/src/server/game/Tools`

**作用**: 开发工具。

---

### 45. Time（时间系统）

**路径**: `/workspace/src/server/game/Time`

**作用**: 游戏时间管理。

#### 核心文件

| 文件 | 功能说明 |
|------|----------|
| `GameTime.h/cpp` | 游戏时间 |
| `UpdateTime.h/cpp` | 更新计时 |

---

### 46. Autobroadcast（自动广播）

**路径**: `/workspace/src/server/game/Autobroadcast`

**作用**: 服务器自动广播消息。

---

### 47. PrecompiledHeaders（预编译头）

**路径**: `/workspace/src/server/game/PrecompiledHeaders`

**作用**: 预编译头文件。

---

### 48. Modules（模块）

**路径**: `/workspace/src/server/game/Modules`

**作用**: 扩展模块。

---

## 总结

`src/server/game` 目录是 AzerothCore 服务器的核心，包含约 51 个子目录和数千个源文件。主要子系统包括：

1. **Entities** - 所有游戏对象的基类
2. **Spells** - 法术和技能系统
3. **Maps** - 地图和实例管理
4. **AI** - NPC 人工智能
5. **Handlers** - 客户端数据包处理
6. **World** - 全局世界状态
7. **Server** - 网络和协议
8. **Movement** - 移动和路径规划
9. **Scripting** - 脚本系统
10. **Battlegrounds** - 战场系统

理解这个目录的结构对于开发 AzerothCore 服务器至关重要。
