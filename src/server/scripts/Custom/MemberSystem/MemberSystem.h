/*
 * Copyright (C) 2026 AzerothCore Project
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Affero General Public License as published by the
 * Free Software Foundation; either version 3 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for
 * more details.
 *
 * You should have received a copy of the GNU Affero General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef MEMBER_SYSTEM_H
#define MEMBER_SYSTEM_H

#include "Common.h"
#include "Define.h"
#include <array>
#include <unordered_map>

enum MemberTier : uint32
{
    MEMBER_TIER_NONE      = 0,  // 普通会员 (VIP0)
    MEMBER_TIER_SENIOR    = 1,  // 高级会员 (VIP1)
    MEMBER_TIER_SUPER     = 2,  // 超级会员 (VIP2)
    MEMBER_TIER_ULTIMATE  = 3   // 至尊会员 (VIP3)
};

#define MAX_MEMBER_TIER 4

struct MemberData
{
    uint32 accountId;
    uint32 tier;
    uint32 expireTime;
    uint64 createTime;
    uint64 updateTime;

    MemberData() : accountId(0), tier(MEMBER_TIER_NONE), expireTime(0), createTime(0), updateTime(0) {}
};

struct UpgradeLog
{
    uint64 id;
    uint32 accountId;
    uint32 oldTier;
    uint32 newTier;
    uint32 itemId;
    uint32 quantity;
    uint64 upgradeTime;
};

struct UpgradeItemConfig
{
    uint32 itemId;
    uint32 quantity;

    UpgradeItemConfig() : itemId(0), quantity(0) {}
    UpgradeItemConfig(uint32 id, uint32 qty) : itemId(id), quantity(qty) {}
};

class MemberSystem
{
public:
    static MemberSystem* instance();

    // 初始化
    bool LoadConfig();
    bool LoadFromDB();

    // 系统状态
    bool IsEnabled() const { return m_enabled; }

    // 会员数据访问
    uint32 GetMemberTier(uint32 accountId) const;
    float GetDropRateBonus(uint32 accountId) const;
    uint8 GetTalentPointBonus(uint32 accountId, uint8 level) const;
    bool CanLearnSpell(uint32 accountId, uint32 spellId) const;

    // 数据缓存管理
    void LoadMemberCache(uint32 accountId);
    void SaveMemberToDB(uint32 accountId, uint32 tier, uint32 expireTime);
    void RefreshMemberCache(uint32 accountId);

    // 会员升级
    bool GetUpgradeInfo(uint32 targetTier, uint32& itemId, uint32& quantity) const;
    bool CheckUpgradeItems(Player* player, uint32 targetTier) const;
    bool ConsumeUpgradeItems(Player* player, uint32 targetTier);
    bool UpgradeMember(uint32 accountId, uint32 targetTier);
    void SaveUpgradeLog(uint32 accountId, uint32 oldTier, uint32 newTier, uint32 itemId, uint32 quantity);
    std::vector<UpgradeLog> GetUpgradeLogs(uint32 accountId, uint32 limit = 10) const;

    // GM 命令
    bool SetUpgradeItem(uint32 targetTier, uint32 itemId, uint32 quantity);

    // 配置访问
    float GetTierDropRateBonus(uint32 tier) const;
    uint8 GetTierTalentBonus(uint32 tier) const;
    uint32 GetMinTierForSpell(uint32 spellId) const;

    // 重载配置
    void ReloadConfig();
    void ReloadUpgradeItems();

private:
    MemberSystem();
    ~MemberSystem();
    MemberSystem(MemberSystem const&) = delete;
    MemberSystem& operator=(MemberSystem const&) = delete;

    // 加载配置
    bool LoadSpellAccessFromDB();
    bool LoadUpgradeItemsFromDB();

    // 配置数据
    bool m_enabled;
    std::array<float, MAX_MEMBER_TIER> m_dropRateBonuses;
    std::array<uint8, MAX_MEMBER_TIER> m_talentPointBonuses;

    // 缓存数据
    std::unordered_map<uint32, MemberData> m_memberCache;
    
    // 技能权限缓存
    std::unordered_map<uint32, uint32> m_spellMinTierCache;
    
    // 升级物品配置缓存
    std::array<UpgradeItemConfig, MAX_MEMBER_TIER> m_upgradeItemConfigs;
};

#define sMemberSystem MemberSystem::instance()

#endif
