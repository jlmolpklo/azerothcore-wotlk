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

#include "MemberSystem.h"
#include "ConfigMgr.h"
#include "DatabaseEnv.h"
#include "Log.h"

MemberSystem* MemberSystem::instance()
{
    static MemberSystem instance;
    return &instance;
}

MemberSystem::MemberSystem()
    : m_enabled(false)
    , m_dropRateBonuses{0.0f, 0.0f, 0.0f, 0.0f}
    , m_talentPointBonuses{0, 0, 0, 0}
{
}

MemberSystem::~MemberSystem()
{
}

bool MemberSystem::LoadConfig()
{
    m_enabled = sConfigMgr->GetOption<bool>("MemberSystem.Enable", true);

    m_dropRateBonuses[MEMBER_TIER_NONE] = sConfigMgr->GetOption<float>("MemberSystem.DropRateBonus.0", 0.0f);
    m_dropRateBonuses[MEMBER_TIER_SENIOR] = sConfigMgr->GetOption<float>("MemberSystem.DropRateBonus.1", 0.2f);
    m_dropRateBonuses[MEMBER_TIER_SUPER] = sConfigMgr->GetOption<float>("MemberSystem.DropRateBonus.2", 0.5f);
    m_dropRateBonuses[MEMBER_TIER_ULTIMATE] = sConfigMgr->GetOption<float>("MemberSystem.DropRateBonus.3", 1.0f);

    m_talentPointBonuses[MEMBER_TIER_NONE] = sConfigMgr->GetOption<uint8>("MemberSystem.TalentPointBonus.0", 0);
    m_talentPointBonuses[MEMBER_TIER_SENIOR] = sConfigMgr->GetOption<uint8>("MemberSystem.TalentPointBonus.1", 1);
    m_talentPointBonuses[MEMBER_TIER_SUPER] = sConfigMgr->GetOption<uint8>("MemberSystem.TalentPointBonus.2", 2);
    m_talentPointBonuses[MEMBER_TIER_ULTIMATE] = sConfigMgr->GetOption<uint8>("MemberSystem.TalentPointBonus.3", 5);

    LOG_INFO("server.loading", "Member system configuration loaded successfully");
    return true;
}

bool MemberSystem::LoadFromDB()
{
    if (!m_enabled)
    {
        LOG_INFO("server.loading", "Member system is disabled, skipping database load");
        return true;
    }

    auto result = DatabaseEnv::WorldDatabase.Query("SELECT account_id, tier, expire_time, create_time, update_time FROM vip_member");
    if (!result)
    {
        LOG_ERROR("member", "Failed to load member data from database");
        return false;
    }

    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();
        
        MemberData data;
        data.accountId = fields[0].Get<uint32>();
        data.tier = fields[1].Get<uint32>();
        data.expireTime = fields[2].Get<uint32>();
        data.createTime = fields[3].Get<uint64>();
        data.updateTime = fields[4].Get<uint64>();

        // 验证会员等级
        if (data.tier >= MAX_MEMBER_TIER)
        {
            LOG_WARN("member", "Invalid member tier {} for account {}, defaulting to VIP0", data.tier, data.accountId);
            data.tier = MEMBER_TIER_NONE;
        }

        // 检查过期时间
        uint32 currentTime = uint32(time(nullptr));
        if (data.expireTime > 0 && data.expireTime < currentTime)
        {
            LOG_DEBUG("member", "Member for account {} has expired, downgrading to VIP0", data.accountId);
            data.tier = MEMBER_TIER_NONE;
        }

        m_memberCache[data.accountId] = data;
        count++;
    } while (result->NextRow());

    LOG_INFO("server.loading", "Loaded {} member records", count);

    // 加载技能权限
    LoadSpellAccessFromDB();

    return true;
}

bool MemberSystem::LoadSpellAccessFromDB()
{
    auto result = DatabaseEnv::WorldDatabase.Query("SELECT spell_id, min_tier FROM vip_skill_access");
    if (!result)
    {
        LOG_WARN("member", "No spell access rules found in database");
        return true;
    }

    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();
        uint32 spellId = fields[0].Get<uint32>();
        uint32 minTier = fields[1].Get<uint32>();

        if (minTier >= MAX_MEMBER_TIER)
        {
            LOG_WARN("member", "Invalid min tier {} for spell {}, skipping", minTier, spellId);
            continue;
        }

        m_spellMinTierCache[spellId] = minTier;
        count++;
    } while (result->NextRow());

    LOG_INFO("server.loading", "Loaded {} spell access rules", count);
    return true;
}

uint32 MemberSystem::GetMemberTier(uint32 accountId) const
{
    if (!m_enabled)
        return MEMBER_TIER_NONE;

    auto iter = m_memberCache.find(accountId);
    if (iter == m_memberCache.end())
        return MEMBER_TIER_NONE;

    // 检查过期
    if (iter->second.expireTime > 0 && iter->second.expireTime < time(nullptr))
        return MEMBER_TIER_NONE;

    return iter->second.tier;
}

float MemberSystem::GetDropRateBonus(uint32 accountId) const
{
    if (!m_enabled)
        return 0.0f;

    uint32 tier = GetMemberTier(accountId);
    return m_dropRateBonuses[tier];
}

uint8 MemberSystem::GetTalentPointBonus(uint32 accountId, uint8 level) const
{
    if (!m_enabled)
        return 0;

    uint32 tier = GetMemberTier(accountId);
    uint8 bonusPerLevel = m_talentPointBonuses[tier];
    
    // 每 10 级奖励一次
    return (level / 10) * bonusPerLevel;
}

bool MemberSystem::CanLearnSpell(uint32 accountId, uint32 spellId) const
{
    if (!m_enabled)
        return true;

    uint32 tier = GetMemberTier(accountId);

    // 检查该技能是否有会员等级要求
    auto iter = m_spellMinTierCache.find(spellId);
    if (iter == m_spellMinTierCache.end())
        return true;  // 没有配置的技能，所有会员都可以学习

    return tier >= iter->second;
}

void MemberSystem::LoadMemberCache(uint32 accountId)
{
    if (!m_enabled)
        return;

    // 如果缓存中已存在，不重新加载
    if (m_memberCache.find(accountId) != m_memberCache.end())
        return;

    // 从数据库加载
    auto result = DatabaseEnv::WorldDatabase.Query(
        "SELECT account_id, tier, expire_time, create_time, update_time FROM vip_member WHERE account_id = {}",
        accountId
    );

    if (result)
    {
        Field* fields = result->Fetch();
        
        MemberData data;
        data.accountId = fields[0].Get<uint32>();
        data.tier = fields[1].Get<uint32>();
        data.expireTime = fields[2].Get<uint32>();
        data.createTime = fields[3].Get<uint64>();
        data.updateTime = fields[4].Get<uint64>();

        m_memberCache[accountId] = data;
    }
    else
    {
        // 不存在则创建默认记录
        MemberData data;
        data.accountId = accountId;
        data.tier = MEMBER_TIER_NONE;
        data.expireTime = 0;
        data.createTime = uint64(time(nullptr));
        data.updateTime = data.createTime;

        m_memberCache[accountId] = data;
        SaveMemberToDB(accountId, MEMBER_TIER_NONE, 0);
    }
}

void MemberSystem::SaveMemberToDB(uint32 accountId, uint32 tier, uint32 expireTime)
{
    uint32 currentTime = uint32(time(nullptr));

    // 检查是否存在
    auto iter = m_memberCache.find(accountId);
    if (iter != m_memberCache.end())
    {
        // 更新现有记录
        DatabaseEnv::WorldDatabase.Execute(
            "UPDATE vip_member SET tier = {}, expire_time = {}, update_time = {} WHERE account_id = {}",
            tier, expireTime, currentTime, accountId
        );

        // 更新缓存
        iter->second.tier = tier;
        iter->second.expireTime = expireTime;
        iter->second.updateTime = currentTime;
    }
    else
    {
        // 创建新记录
        DatabaseEnv::WorldDatabase.Execute(
            "INSERT INTO vip_member (account_id, tier, expire_time, create_time, update_time) VALUES ({}, {}, {}, {}, {})",
            accountId, tier, expireTime, currentTime, currentTime
        );

        // 更新缓存
        MemberData data;
        data.accountId = accountId;
        data.tier = tier;
        data.expireTime = expireTime;
        data.createTime = currentTime;
        data.updateTime = currentTime;

        m_memberCache[accountId] = data;
    }

    LOG_INFO("member", "Saved member data for account {}: tier={}, expireTime={}", accountId, tier, expireTime);
}

void MemberSystem::RefreshMemberCache(uint32 accountId)
{
    if (!m_enabled)
        return;

    m_memberCache.erase(accountId);
    LoadMemberCache(accountId);
}

float MemberSystem::GetTierDropRateBonus(uint32 tier) const
{
    if (tier >= MAX_MEMBER_TIER)
        return 0.0f;

    return m_dropRateBonuses[tier];
}

uint8 MemberSystem::GetTierTalentBonus(uint32 tier) const
{
    if (tier >= MAX_MEMBER_TIER)
        return 0;

    return m_talentPointBonuses[tier];
}

uint32 MemberSystem::GetMinTierForSpell(uint32 spellId) const
{
    if (!m_enabled)
        return 0;

    auto iter = m_spellMinTierCache.find(spellId);
    if (iter == m_spellMinTierCache.end())
        return 0;

    return iter->second;
}

void MemberSystem::ReloadConfig()
{
    m_spellMinTierCache.clear();
    LoadSpellAccessFromDB();
    LOG_INFO("member", "Member system spell access reloaded");
}
