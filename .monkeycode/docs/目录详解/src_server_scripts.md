# /workspace/src/server/scripts 目录结构详解

本文档详细介绍了 AzerothCore 游戏服务器脚本系统的目录结构和加载机制。

## 1. 目录概览

```
src/server/scripts/
|-- Commands/          # 游戏命令脚本
|-- Custom/            # 自定义脚本（用户扩展）
|-- EasternKingdoms/   # 东部王国区域脚本
|-- Events/            # 节日事件脚本
|-- Kalimdor/          # 卡利姆多区域脚本
|-- Northrend/         # 诺森德区域脚本
|-- OutdoorPvP/        # 户外PVP脚本
|-- Outland/           # 外域区域脚本
|-- Pet/               # 宠物脚本
|-- Spells/            # 法术脚本
|-- World/             # 世界脚本
|-- CMakeLists.txt     # CMake 构建配置
|-- ScriptLoader.h     # 脚本加载器头文件
|-- ScriptLoader.cpp.in.cmake  # CMake 模板文件
|-- ScriptPCH.h        # 预编译头文件
```

---

## 2. 各子目录详细说明

### 2.1 EasternKingdoms（东部王国）

**路径**: `src/server/scripts/EasternKingdoms/`

**作用**: 包含东部王国大陆的所有副本和区域脚本。

**子目录结构**:
| 子目录 | 说明 |
|--------|------|
| `AlteracValley/` | 奥特兰克山谷战场 |
| `BlackrockMountain/` | 黑石山（含黑石深渊、黑翼之巢、黑石塔、熔火之心） |
| `Deadmines/` | 死亡矿井 |
| `Gnomeregan/` | 诺姆瑞根 |
| `Karazhan/` | 卡拉赞副本 |
| `MagistersTerrace/` | 魔导师平台 |
| `ScarletEnclave/` | 血色领地（亡灵新手区） |
| `ScarletMonastery/` | 血色修道院 |
| `Scholomance/` | 通灵学院 |
| `ShadowfangKeep/` | 影牙城堡 |
| `Stratholme/` | 斯坦索姆 |
| `SunkenTemple/` | 沉没的神庙 |
| `SunwellPlateau/` | 太阳之井高地 |
| `TheStockade/` | 监狱副本 |
| `Uldaman/` | 奥达曼 |
| `ZulAman/` | 祖阿曼 |
| `ZulGurub/` | 祖尔格拉布 |

**区域脚本文件**（按区域划分）:
- `zone_arathi_highlands.cpp` - 阿拉希高地
- `zone_blasted_lands.cpp` - 诅咒之地
- `zone_duskwood.cpp` - 暮色森林
- `zone_eastern_plaguelands.cpp` - 东瘟疫之地
- `zone_elwynn_forest.cpp` - 艾尔文森林
- `zone_eversong_woods.cpp` - 永歌森林
- `zone_ghostlands.cpp` - 幽魂之地
- `zone_hinterlands.cpp` - 辛特兰
- `zone_ironforge.cpp` - 铁炉堡
- `zone_isle_of_queldanas.cpp` - 奎尔丹纳斯岛
- `zone_redridge_mountains.cpp` - 赤脊山
- `zone_silverpine_forest.cpp` - 银松森林
- `zone_stormwind_city.cpp` - 暴风城
- `zone_undercity.cpp` - 幽暗城
- `zone_western_plaguelands.cpp` - 西瘟疫之地
- `zone_westfall.cpp` - 西部荒野
- `zone_wetlands.cpp` - 湿地

---

### 2.2 Northrend（诺森德）

**路径**: `src/server/scripts/Northrend/`

**作用**: 包含诺森德大陆的所有副本和区域脚本。

**子目录结构**:
| 子目录 | 说明 |
|--------|------|
| `AzjolNerub/` | 艾卓-尼鲁布（地下王国） |
| `ChamberOfAspects/` | 巨龙之魂-巨龙封印 |
| `CrusadersColiseum/` | 十字军试炼场 |
| `DraktharonKeep/` | 德拉克苏尔避难所 |
| `FrozenHalls/` | 冰霜大厅（灵魂大厅、萨隆矿坑、反响大厅） |
| `Gundrak/` | 古达克 |
| `IcecrownCitadel/` | 冰冠堡垒 |
| `Naxxramas/` | NAXX副本 |
| `Nexus/` | 起源大厅/蓝龙军团 |
| `Ulduar/` | 奥杜尔 |
| `UtgardeKeep/` | 乌特加德城堡 |

**区域脚本文件**:
- `isle_of_conquest.cpp` - 征服之岛
- `zone_borean_tundra.cpp` - 北风冻原
- `zone_crystalsong_forest.cpp` - 水晶森林
- `zone_dalaran.cpp` - 达拉然
- `zone_dragonblight.cpp` - 龙骨荒野
- `zone_grizzly_hills.cpp` - 灰熊丘陵
- `zone_howling_fjord.cpp` - 咆哮海峡
- `zone_icecrown.cpp` - 冰冠冰川
- `zone_sholazar_basin.cpp` - 索拉查盆地
- `zone_storm_peaks.cpp` - 风暴峭壁
- `zone_wintergrasp.cpp` - 冬拥湖
- `zone_zuldrak.cpp` - 祖达克

---

### 2.3 Outland（外域）

**路径**: `src/server/scripts/Outland/`

**作用**: 包含外域区域的所有副本和区域脚本。

**子目录结构**:
| 子目录 | 说明 |
|--------|------|
| `Auchindoun/` | 奥金顿（塞泰克大厅、暗影迷宫、法力陵墓、考古墓穴） |
| `BlackTemple/` | 黑庙 |
| `CoilfangReservoir/` | 盘牙洞穴（奴隶围栏、幽暗沼泽、蒸汽地窟） |
| `GruulsLair/` - 戈鲁尔之巢 |
| `HellfireCitadel/` | 地狱火堡垒（地狱火城墙、血熔炉、破碎大厅、玛瑟里顿的巢穴） |
| `TempestKeep/` | 风暴要塞（艾兰里王国、博学者庭院、机械区、能量舰） |

**区域脚本文件**:
- `zone_blades_edge_mountains.cpp` - 刀锋山
- `zone_hellfire_peninsula.cpp` - 地狱火半岛
- `zone_nagrand.cpp` - 纳格兰
- `zone_netherstorm.cpp` - 虚空风暴
- `zone_shadowmoon_valley.cpp` - 影月谷
- `zone_shattrath_city.cpp` - 沙塔斯城
- `zone_terokkar_forest.cpp` - 泰罗卡森林

**世界首领**:
- `boss_doomlord_kazzak.cpp` - 末日领主卡扎克
- `boss_doomwalker.cpp` - 末日行者

---

### 2.4 Kalimdor（卡利姆多）

**路径**: `src/server/scripts/Kalimdor/`

**作用**: 包含卡利姆多大陆的所有副本和区域脚本。

**子目录结构**:
| 子目录 | 说明 |
|--------|------|
| `BlackfathomDeeps/` | 黑暗深渊 |
| `CavernsOfTime/` | 时光之穴（海加尔山、旧希尔斯布莱德、黑色沼泽、净化斯坦索姆） |
| `DireMaul/` | 厄运之槌 |
| `Maraudon/` - 玛拉顿 |
| `OnyxiasLair/` | 奥妮克希亚的巢穴 |
| `RagefireChasm/` | 怒焰裂穴 |
| `RazorfenDowns/` | 剃刀高地 |
| `RazorfenKraul/` | 剃刀沼泽 |
| `RuinsOfAhnQiraj/` | 安其拉废墟 |
| `TempleOfAhnQiraj/` | 安其拉神殿 |
| `WailingCaverns/` | 哀嚎洞穴 |
| `ZulFarrak/` | 祖尔法拉克 |

**区域脚本文件**:
- `zone_ashenvale.cpp` - 灰谷
- `zone_azuremyst_isle.cpp` - 秘蓝岛
- `zone_bloodmyst_isle.cpp` - 秘血岛
- `zone_darkshore.cpp` - 黑海岸
- `zone_desolace.cpp` - 荒芜之地
- `zone_durotar.cpp` - 杜隆塔尔
- `zone_dustwallow_marsh.cpp` - 尘泥沼泽
- `zone_felwood.cpp` - 费伍德森林
- `zone_feralas.cpp` - 菲拉斯
- `zone_moonglade.cpp` - 月光林地
- `zone_orgrimmar.cpp` - 奥格瑞玛
- `zone_silithus.cpp` - 希利苏斯
- `zone_stonetalon_mountains.cpp` - 石爪山脉
- `zone_tanaris.cpp` - 塔纳利斯
- `zone_teldrassil.cpp` - 泰达希尔
- `zone_the_barrens.cpp` - 贫瘠之地
- `zone_thousand_needles.cpp` - 千针石林
- `zone_thunder_bluff.cpp` - 雷霆崖
- `zone_ungoro_crater.cpp` - 安戈洛环形山
- `zone_winterspring.cpp` - 冬泉谷

**世界首领**:
- `boss_azuregos.cpp` - 艾索雷葛斯

---

### 2.5 Spells（法术脚本）

**路径**: `src/server/scripts/Spells/`

**作用**: 包含所有职业法术和相关效果的脚本实现。

**主要文件**:
| 文件 | 说明 |
|------|------|
| `spell_dk.cpp` | 死亡骑士法术 |
| `spell_druid.cpp` | 德鲁伊法术 |
| `spell_generic.cpp` | 通用法术（无法归类的法术） |
| `spell_hunter.cpp` | 猎人法术 |
| `spell_item.cpp` | 物品触发法术 |
| `spell_mage.cpp` | 法师法术 |
| `spell_paladin.cpp` | 圣骑士法术 |
| `spell_priest.cpp` | 牧师法术 |
| `spell_quest.cpp` | 任务相关法术 |
| `spell_rogue.cpp` | 盗贼法术 |
| `spell_shaman.cpp` | 萨满法术 |
| `spell_warlock.cpp` | 术士法术 |
| `spell_warrior.cpp` | 战士法术 |

---

### 2.6 Commands（命令脚本）

**路径**: `src/server/scripts/Commands/`

**作用**: 包含所有游戏内命令的实现。

**主要命令文件**:
| 文件 | 功能 |
|------|------|
| `cs_account.cpp` | 账号相关命令 |
| `cs_achievement.cpp` | 成就相关命令 |
| `cs_arena.cpp` | 竞技场相关命令 |
| `cs_autobroadcast.cpp` | 自动广播命令 |
| `cs_bag.cpp` | 背包相关命令 |
| `cs_ban.cpp` | 封禁相关命令 |
| `cs_cast.cpp` | 施法相关命令 |
| `cs_character.cpp` | 角色相关命令 |
| `cs_debug.cpp` | 调试命令 |
| `cs_gobject.cpp` | 游戏对象命令 |
| `cs_go.cpp` | 传送命令 |
| `cs_gm.cpp` | GM命令 |
| `cs_group.cpp` | 队伍相关命令 |
| `cs_guild.cpp` | 公会相关命令 |
| `cs_learn.cpp` | 学习技能/法术命令 |
| `cs_list.cpp` | 列表显示命令 |
| `cs_lookup.cpp` | 查找命令 |
| `cs_mail.cpp` | 邮件相关命令 |
| `cs_misc.cpp` | 杂项命令 |
| `cs_modify.cpp` | 属性修改命令 |
| `cs_npc.cpp` | NPC相关命令 |
| `cs_pet.cpp` | 宠物相关命令 |
| `cs_pool.cpp` | 对象池命令 |
| `cs_quest.cpp` | 任务相关命令 |
| `cs_reload.cpp` | 重载配置命令 |
| `cs_reset.cpp` | 重置命令 |
| `cs_spellinfo.cpp` | 法术信息命令 |
| `cs_tele.cpp` | 传送命令 |
| `cs_ticket.cpp` | 作弊票命令 |
| `cs_titles.cpp` | 称号命令 |
| `cs_wp.cpp` | 路径点命令 |

---

### 2.7 World（世界脚本）

**路径**: `src/server/scripts/World/`

**作用**: 包含世界级的通用脚本，如成就脚本、物品脚本、NPC脚本等。

**主要文件**:
| 文件 | 说明 |
|------|------|
| `achievement_scripts.cpp` | 成就触发脚本 |
| `action_ip_logger.cpp` | IP日志记录 |
| `areatrigger_scripts.cpp` | 区域触发器脚本 |
| `boss_emerald_dragons.cpp` | 翡翠四龙脚本 |
| `chat_log.cpp` | 聊天日志 |
| `go_scripts.cpp` | 游戏对象脚本 |
| `guards.cpp` | 守卫NPC脚本 |
| `item_scripts.cpp` | 物品脚本 |
| `mob_generic_creature.cpp` | 通用生物AI |
| `npc_innkeeper.cpp` | 旅店老板NPC |
| `npc_professions.cpp` | 专业技能NPC |
| `npc_taxi.cpp` | 出租车NPC |
| `npcs_special.cpp` | 特殊NPC脚本 |
| `player_scripts.cpp` | 玩家脚本 |
| `scourge_invasion.cpp` | 天灾入侵事件 |
| `transport_zeppelins.cpp` | 飞艇运输脚本 |

---

### 2.8 Events（事件脚本）

**路径**: `src/server/scripts/Events/`

**作用**: 包含所有游戏内节日事件的脚本实现。

**主要文件**:
| 文件 | 对应事件 |
|------|----------|
| `brewfest.cpp` | 啤酒节 |
| `childrens_week.cpp` | 儿童周 |
| `firework_show/` | 烟花表演子目录 |
| `hallows_end.cpp` | 万圣节 |
| `love_in_air.cpp` | 情人节活动 |
| `midsummer.cpp` | 仲夏节 |
| `noblegarden.cpp` | 复活节（Noblegarden） |
| `pilgrims_bounty.cpp` | 感恩节 |
| `winter_veil.cpp` | 冬幕节 |

---

### 2.9 OutdoorPvP（户外PVP脚本）

**路径**: `src/server/scripts/OutdoorPvP/`

**作用**: 包含户外PVP区域的脚本实现。

**主要文件**:
| 文件 | 对应区域 |
|------|----------|
| `OutdoorPvPEP.cpp/h` | 东方海滩（东瘟疫之地PVP） |
| `OutdoorPvPGH.cpp/h` | 格罗玛什要塞PVP |
| `OutdoorPvPHP.cpp/h` | 希尔斯布莱德丘陵PVP |
| `OutdoorPvPNA.cpp/h` | 北风苔原PVP |
| `OutdoorPvPSI.cpp/h` | 冰冠冰川PVP |
| `OutdoorPvPTF.cpp/h` | 塔尔湖PVP |
| `OutdoorPvPZM.cpp/h` | 赞格沼泽PVP |

---

### 2.10 Pet（宠物脚本）

**路径**: `src/server/scripts/Pet/`

**作用**: 包含宠物相关的AI脚本实现。

**主要文件**:
| 文件 | 说明 |
|------|------|
| `pet_dk.cpp` | 死亡骑士宠物 |
| `pet_generic.cpp` | 通用宠物AI |
| `pet_hunter.cpp` | 猎人宠物 |
| `pet_mage.cpp` | 法师宠物（镜像） |
| `pet_priest.cpp` | 牧师宠物（暗影恶魔） |
| `pet_shaman.cpp` | 萨满宠物（元素） |

---

### 2.11 Custom（自定义脚本）

**路径**: `src/server/scripts/Custom/`

**作用**: 提供给用户进行自定义脚本开发的目录。

**说明**: 该目录目前为空（仅包含 `custom_script_loader.cpp`），主要用于用户添加自己的脚本扩展。

---

## 3. 脚本加载机制

### 3.1 整体架构

AzerothCore 的脚本系统采用分层加载机制：

```
CMake 配置
    ↓
ScriptLoader.cpp.in.cmake（模板）
    ↓
gen_scriptloader/（生成的加载器）
    ↓
各区域的 *_script_loader.cpp
    ↓
具体脚本文件（boss_*.cpp, zone_*.cpp 等）
```

### 3.2 脚本注册流程

#### 步骤 1: 定义注册函数

在每个区域脚本目录中，首先声明 `AddSC_xxx()` 函数：

```cpp
// eastern_kingdoms_script_loader.cpp
void AddSC_alterac_valley();                 // 副本/区域
void AddSC_boss_ragnaros();                  // Boss
void AddSC_instance_molten_core();           // 实例脚本
void AddSC_arathi_highlands();               // 区域脚本
```

#### 步骤 2: 实现注册函数

在对应的脚本文件中实现注册函数：

```cpp
// boss_ragnaros.cpp
void AddSC_boss_ragnaros()
{
    // 注册到 ScriptMgr
}
```

#### 步骤 3: 调用注册函数

在区域加载器中统一调用：

```cpp
// eastern_kingdoms_script_loader.cpp
void AddEasternKingdomsScripts()
{
    AddSC_alterac_valley();
    AddSC_boss_ragnaros();
    AddSC_instance_molten_core();
    // ...
}
```

#### 步骤 4: CMake 自动生成

CMake 会自动收集所有 `*_script_loader.cpp` 文件，并生成最终的 `ScriptLoader.cpp`。

### 3.3 脚本注册宏

AzerothCore 提供了多种注册宏：

```cpp
// 注册生物AI
#define RegisterCreatureAI(ai_name) new GenericCreatureScript<ai_name>(#ai_name)

// 注册带工厂函数的生物AI
#define RegisterCreatureAIWithFactory(ai_name, factory_fn) new FactoryCreatureScript<ai_name, &factory_fn>(#ai_name)

// 注册实例脚本
#define RegisterInstanceScript(ai_name, scriptName) new ai_name(scriptName)

// 注册法术脚本
class spell_xxx : public SpellScript { ... };
class spell_xxx_AuraScript : public AuraScript { ... };
```

### 3.4 脚本类型系统

脚本系统定义了多种脚本类型：

| 脚本类型 | 基类 | 绑定方式 |
|----------|------|----------|
| CreatureScript | ScriptObject | 数据库绑定 |
| GameObjectScript | ScriptObject | 数据库绑定 |
| AreaTriggerScript | ScriptObject | 数据库绑定 |
| SpellScript | ScriptObject | 通过法术ID |
| AuraScript | ScriptObject | 通过法术ID |
| CommandScript | ScriptObject | 无需数据库 |
| PlayerScript | ScriptObject | 无需数据库 |
| WorldScript | ScriptObject | 无需数据库 |

---

## 4. 脚本编写示例

### 4.1 Boss 脚本示例

```cpp
// boss_ragnaros.cpp
#include "CreatureScript.h"
#include "ScriptedCreature.h"

class boss_ragnaros : public CreatureScript
{
public:
    boss_ragnaros() : CreatureScript("boss_ragnaros") {}

    struct boss_ragnarosAI : public ScriptedAI
    {
        boss_ragnarosAI(Creature* creature) : ScriptedAI(creature) {}

        void Reset() override
        {
            // 初始化
        }

        void EnterCombat(Unit* who) override
        {
            // 进入战斗
        }

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim())
                return;
            // AI 逻辑
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new boss_ragnarosAI(creature);
    }
};

void AddSC_boss_ragnaros()
{
    new boss_ragnaros();
}
```

### 4.2 区域脚本示例

```cpp
// zone_elwynn_forest.cpp
#include "CreatureScript.h"
#include "ScriptedCreature.h"

class zone_elwynn_forest : public ZoneScript
{
public:
    zone_elwynn_forest() : ZoneScript("zone_elwynn_forest") {}

    void OnPlayerEnter(Player* player) override
    {
        // 玩家进入区域时的逻辑
    }
};

void AddSC_elwynn_forest()
{
    new zone_elwynn_forest();
}
```

### 4.3 法术脚本示例

```cpp
// spell_fireball.cpp
#include "SpellScript.h"
#include "SpellScriptLoader.h"

class spell_fireball : public SpellScript
{
    PrepareSpellScript(spell_fireball);

    void HandleHit(SpellEffIndex effIndex)
    {
        // 施法命中时的逻辑
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_fireball::HandleHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
    }
};

void AddSC_fireball()
{
    new SpellScriptLoader("spell_fireball");
}
```

---

## 5. 脚本与数据库的绑定

### 5.1 数据库绑定方式

部分脚本需要与数据库中的数据绑定：

1. **Creature 模板绑定**: 通过 `creature_template` 表中的 `ScriptName` 字段
2. **GameObject 模板绑定**: 通过 `gameobject_template` 表中的 `ScriptName` 字段
3. **区域触发器绑定**: 通过 `areatrigger` 表

### 5.2 绑定示例

在数据库中设置：
```sql
UPDATE creature_template SET ScriptName = 'boss_ragnaros' WHERE entry = 11502;
```

---

## 6. CMake 构建配置

### 6.1 构建选项

| 选项 | 说明 | 可选值 |
|------|------|--------|
| `SCRIPTS` | 脚本编译方式 | none, static, dynamic, minimal-static, minimal-dynamic |
| `MODULES` | 模块编译方式 | none, static, dynamic |

### 6.2 静态加载

当 `SCRIPTS=static` 时，所有脚本会被编译进 `worldserver` 可执行文件。

### 6.3 动态加载

当 `SCRIPTS=dynamic` 时，脚本会被编译成独立的动态链接库（`.so` 或 `.dll`），可以在运行时加载/卸载。

---

## 7. 目录结构总结

| 目录 | 脚本数量 | 主要内容 |
|------|---------|----------|
| EasternKingdoms | ~100+ | 东部王国副本、Boss、区域 |
| Northrend | ~80+ | 诺森德副本、Boss、区域 |
| Outland | ~60+ | 外域副本、Boss、区域 |
| Kalimdor | ~60+ | 卡利姆多副本、Boss、区域 |
| Spells | 13 | 职业法术、物品法术 |
| Commands | ~50 | 游戏命令 |
| World | ~20 | 世界通用脚本 |
| Events | 9 | 节日事件 |
| OutdoorPvP | 7 | 户外PVP |
| Pet | 6 | 宠物AI |
| Custom | 0 | 自定义扩展 |

---

## 8. 参考资源

- **官方 Wiki**: https://www.azerothcore.org/wiki/hooks-script
- **脚本系统指南**: 参考 `src/server/game/Scripting/` 目录下的头文件

---

本文档最后更新于 2026-04-17。
