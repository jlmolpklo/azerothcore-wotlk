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

#include "Player.h"
#include "SpellInfo.h"
#include "GlobalScript.h"
#include "PlayerScript.h"
#include "MemberSystem.h"

class MemberSystem_GlobalScript : public GlobalScript
{
public:
    MemberSystem_GlobalScript() : GlobalScript("MemberSystem_GlobalScript") { }

    // 掉落率加成
    void OnBeforeDropAddItem(Player const* player, Loot& /*loot*/, bool /*canRate*/, uint16 /*lootMode*/, LootStoreItem* /*LootStoreItem*/, LootStore const& /*store*/) override
    {
        if (!sMemberSystem->IsEnabled())
            return;

        if (!player)
            return;

        uint32 accountId = player->GetSession()->GetAccountId();
        float bonus = sMemberSystem->GetDropRateBonus(accountId);

        if (bonus <= 0.0f)
            return;

        // 通过修改掉落率来实现加成
        // 注意：这里需要在掉落计算时应用加成
        // 由于 OnBeforeDropAddItem 没有直接提供掉落率参数，我们需要通过其他方式实现
        // 这里使用 OnAfterCalculateLootGroupAmount 来修改掉落数量
    }

    void OnAfterCalculateLootGroupAmount(Player const* player, Loot& loot, uint16 /*lootMode*/, uint32& groupAmount, LootStore const& /*store*/) override
    {
        if (!sMemberSystem->IsEnabled())
            return;

        if (!player)
            return;

        uint32 accountId = player->GetSession()->GetAccountId();
        float bonus = sMemberSystem->GetDropRateBonus(accountId);

        if (bonus <= 0.0f)
            return;

        // 基于掉落率加成增加掉落数量
        // 例如：20% 掉落率加成 = 0.2 概率额外掉落 1 个物品
        if (groupAmount > 0 && bonus > 0.0f)
        {
            float roll = static_cast<float>(rand() % 1000) / 1000.0f;
            if (roll < bonus)
            {
                groupAmount++;
                LOG_DEBUG("member", "Member drop bonus applied for player {}, additional drop added", accountId);
            }
        }
    }
};

class MemberSystem_PlayerScript : public PlayerScript
{
public:
    MemberSystem_PlayerScript() : PlayerScript("MemberSystem_PlayerScript") { }

    // 天赋点数计算
    void OnCalculateTalentsPoints(Player* player, uint8 /*level*/, uint32& points) override
    {
        if (!sMemberSystem->IsEnabled())
            return;

        if (!player)
            return;

        uint32 accountId = player->GetSession()->GetAccountId();
        uint8 level = player->GetLevel();
        uint8 bonus = sMemberSystem->GetTalentPointBonus(accountId, level);

        if (bonus > 0)
        {
            points += bonus;
            LOG_DEBUG("member", "Member talent bonus applied for player {} (level {}), bonus: {}", accountId, level, bonus);
        }
    }

    // 技能学习检查
    bool OnBeforeLearnSpell(Player* player, uint32 spellID, bool /*isTutorial*/) override
    {
        if (!sMemberSystem->IsEnabled())
            return true;

        if (!player)
            return true;

        uint32 accountId = player->GetSession()->GetAccountId();
        
        if (!sMemberSystem->CanLearnSpell(accountId, spellID))
        {
            // 会员等级不足，发送错误消息
            uint32 requiredTier = sMemberSystem->GetMinTierForSpell(spellID);
            ChatHandler(player->GetSession()).PSendSysMessage("Your VIP level is too low to learn this spell. Required: VIP%u", requiredTier);
            return false;
        }

        return true;
    }
};

void AddMemberSystem_GlobalScript()
{
    new MemberSystem_GlobalScript();
}

void AddMemberSystem_PlayerScript()
{
    new MemberSystem_PlayerScript();
}
