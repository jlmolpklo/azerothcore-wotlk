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

#include "Chat.h"
#include "MemberSystem.h"
#include "Player.h"
#include "Language.h"

class vip_commandscript : public CommandScript
{
public:
    vip_commandscript() : CommandScript("vip") { }

    std::vector<ChatCommand> GetCommands() const override
    {
        static std::vector<ChatCommand> commandTable =
        {
            { "set",          HandleVipSetCommand,      SEC_GAMEMASTER, Console::Yes },
            { "info",         HandleVipInfoCommand,     SEC_GAMEMASTER, Console::Yes },
            { "reload",       HandleVipReloadCommand,   SEC_ADMINISTRATOR, Console::Yes },
            { "upgrade",      HandleVipUpgradeCommand,  SEC_PLAYER, Console::No },
            { "log",          HandleVipLogCommand,      SEC_GAMEMASTER, Console::Yes },
            { "upgrade set",  HandleVipUpgradeSetCommand, SEC_ADMINISTRATOR, Console::Yes },
        };

        static std::vector<ChatCommand> commandSet =
        {
            { "vip",          commandTable, SEC_GAMEMASTER, Console::Yes },
        };

        return commandSet;
    }

    static bool HandleVipSetCommand(ChatHandler* handler, const char* args)
    {
        if (!*args)
        {
            handler->PSendSysMessage("Usage: .vip set [player] [level]");
            handler->PSendSysMessage("Levels: 0=VIP0, 1=VIP1, 2=VIP2, 3=VIP3");
            return false;
        }

        char* playerName = strtok((char*)args, " ");
        char* levelStr = strtok(NULL, " ");

        if (!playerName || !levelStr)
        {
            handler->PSendSysMessage("Usage: .vip set [player] [level]");
            handler->PSendSysMessage("Levels: 0=VIP0, 1=VIP1, 2=VIP2, 3=VIP3");
            return false;
        }

        uint32 level = atoi(levelStr);
        if (level > 3)
        {
            handler->PSendSysMessage("Invalid level. Must be 0-3.");
            return false;
        }

        // 查找目标玩家
        Player* target = handler->GetPlayerFromObjectOrRemoteTarget(playerName);
        uint32 accountId = 0;
        std::string playerNameStr;

        if (target)
        {
            // 玩家在线
            accountId = target->GetSession()->GetAccountId();
            playerNameStr = target->GetName();
        }
        else
        {
            // 玩家离线，从数据库查找
            ObjectGuid guid = sCharacterCache->GetCharacterGuidByName(playerName);
            if (!guid)
            {
                handler->PSendSysMessage(LANG_COMMAND_PLAYER_NOT_FOUND, playerName);
                handler->SetSentErrorMessage(true);
                return false;
            }

            std::string safeName = playerName;
            if (!CharacterDatabase::NormalizePlayerName(safeName))
            {
                handler->SendSysMessage(LANG_BAD_VALUE);
                handler->SetSentErrorMessage(true);
                return false;
            }

            accountId = sAccountCache->GetAccountIdByPlayerName(safeName, handler->GetSessionDbLocale());
            if (!accountId)
            {
                handler->PSendSysMessage(LANG_COMMAND_PLAYER_NOT_FOUND, playerName);
                handler->SetSentErrorMessage(true);
                return false;
            }

            playerNameStr = safeName;
        }

        // 设置会员等级
        uint32 expireTime = 0; // 0 表示永久
        sMemberSystem->SaveMemberToDB(accountId, level, expireTime);

        handler->PSendSysMessage("VIP level for player %s set to VIP%u", playerNameStr.c_str(), level);

        // 如果玩家在线，刷新其缓存
        if (target)
        {
            sMemberSystem->RefreshMemberCache(accountId);
            handler->PSendSysMessage("Player is online, cache refreshed.");
        }

        return true;
    }

    static bool HandleVipInfoCommand(ChatHandler* handler, const char* args)
    {
        if (!*args)
        {
            handler->PSendSysMessage("Usage: .vip info [player]");
            return false;
        }

        // 查找目标玩家
        Player* target = handler->GetPlayerFromObjectOrRemoteTarget(args);
        uint32 accountId = 0;
        std::string playerNameStr;

        if (target)
        {
            // 玩家在线
            accountId = target->GetSession()->GetAccountId();
            playerNameStr = target->GetName();
        }
        else
        {
            // 玩家离线，从数据库查找
            ObjectGuid guid = sCharacterCache->GetCharacterGuidByName(args);
            if (!guid)
            {
                handler->PSendSysMessage(LANG_COMMAND_PLAYER_NOT_FOUND, args);
                handler->SetSentErrorMessage(true);
                return false;
            }

            std::string safeName = args;
            if (!CharacterDatabase::NormalizePlayerName(safeName))
            {
                handler->SendSysMessage(LANG_BAD_VALUE);
                handler->SetSentErrorMessage(true);
                return false;
            }

            accountId = sAccountCache->GetAccountIdByPlayerName(safeName, handler->GetSessionDbLocale());
            if (!accountId)
            {
                handler->PSendSysMessage(LANG_COMMAND_PLAYER_NOT_FOUND, args);
                handler->SetSentErrorMessage(true);
                return false;
            }

            playerNameStr = safeName;
        }

        // 获取会员信息
        uint32 tier = sMemberSystem->GetMemberTier(accountId);
        float dropBonus = sMemberSystem->GetDropRateBonus(accountId);
        uint8 talentBonus = sMemberSystem->GetTierTalentBonus(tier);

        handler->PSendSysMessage("=== VIP Info for %s ===", playerNameStr.c_str());
        handler->PSendSysMessage("VIP Level: %u", tier);
        handler->PSendSysMessage("Drop Rate Bonus: %.1f%%", dropBonus * 100.0f);
        handler->PSendSysMessage("Talent Point Bonus: %u per 10 levels", talentBonus);

        return true;
    }

    static bool HandleVipReloadCommand(ChatHandler* handler, const char* /*args*/)
    {
        sMemberSystem->ReloadConfig();
        sMemberSystem->ReloadUpgradeItems();
        handler->PSendSysMessage("Member system configuration reloaded.");
        return true;
    }

    static bool HandleVipUpgradeCommand(ChatHandler* handler, const char* args)
    {
        Player* player = handler->GetPlayerFromObjectOrRemoteTarget(handler->GetSession()->GetPlayerName());
        if (!player)
        {
            handler->SendSysMessage(LANG_CMD_PLAYER_NOT_FOUND);
            handler->SetSentErrorMessage(true);
            return false;
        }

        uint32 accountId = player->GetSession()->GetAccountId();
        uint32 currentTier = sMemberSystem->GetMemberTier(accountId);

        // 如果没有指定目标等级，显示下一级信息
        if (!*args)
        {
            uint32 nextTier = currentTier + 1;
            if (nextTier >= MAX_MEMBER_TIER)
            {
                handler->PSendSysMessage("You are already at maximum VIP level (VIP3).");
                return true;
            }

            uint32 itemId = 0, quantity = 0;
            if (!sMemberSystem->GetUpgradeInfo(nextTier, itemId, quantity))
            {
                handler->PSendSysMessage("Upgrade configuration for VIP%u is not set.", nextTier);
                return true;
            }

            ItemTemplate const* itemTemplate = sObjectMgr->GetItemTemplate(itemId);
            std::string itemName = itemTemplate ? itemTemplate->Name1 : "Unknown Item";

            uint32 playerCount = player->GetItemCount(itemId, true);
            bool hasEnough = playerCount >= quantity;

            handler->PSendSysMessage("=== VIP Upgrade Info ===");
            handler->PSendSysMessage("Current Level: VIP%u", currentTier);
            handler->PSendSysMessage("Next Level: VIP%u", nextTier);
            handler->PSendSysMessage("Required: %u x %s (Item ID: %u)", quantity, itemName.c_str(), itemId);
            handler->PSendSysMessage("You have: %u x %s", playerCount, itemName.c_str());
            handler->PSendSysMessage("Status: %s", hasEnough ? "|cFF00FF00Ready to upgrade|r" : "|cFFFF0000Not enough items|r");
            handler->PSendSysMessage("Usage: .vip upgrade <target_level>");
            return true;
        }

        // 指定目标等级进行升级
        uint32 targetTier = atoi(args);
        if (targetTier >= MAX_MEMBER_TIER || targetTier == 0)
        {
            handler->PSendSysMessage("Invalid target level. Must be 1-3.");
            return false;
        }

        if (targetTier <= currentTier)
        {
            handler->PSendSysMessage("Your current VIP level (VIP%u) is already equal or higher than target.", currentTier);
            return false;
        }

        // 检查升级物品
        if (!sMemberSystem->CheckUpgradeItems(player, targetTier))
        {
            uint32 itemId = 0, quantity = 0;
            sMemberSystem->GetUpgradeInfo(targetTier, itemId, quantity);
            uint32 playerCount = player->GetItemCount(itemId, true);

            ItemTemplate const* itemTemplate = sObjectMgr->GetItemTemplate(itemId);
            std::string itemName = itemTemplate ? itemTemplate->Name1 : "Unknown Item";

            handler->PSendSysMessage("|cFFFF0000Not enough items for upgrade!|r");
            handler->PSendSysMessage("Required: %u x %s", quantity, itemName.c_str());
            handler->PSendSysMessage("You have: %u x %s", playerCount, itemName.c_str());
            handler->PSendSysMessage("Missing: %u x %s", quantity - playerCount, itemName.c_str());
            return false;
        }

        // 执行升级
        uint32 oldTier = currentTier;
        if (!sMemberSystem->UpgradeMember(accountId, targetTier))
        {
            handler->PSendSysMessage("|cFFFF0000Upgrade failed. Please contact administrator.|r");
            return false;
        }

        // 扣除物品
        sMemberSystem->ConsumeUpgradeItems(player, targetTier);

        // 记录日志
        uint32 itemId = 0, quantity = 0;
        sMemberSystem->GetUpgradeInfo(targetTier, itemId, quantity);
        sMemberSystem->SaveUpgradeLog(accountId, oldTier, targetTier, itemId, quantity);

        // 发送通知
        handler->PSendSysMessage("|cFF00FF00=== VIP Upgrade Successful! ===|r");
        handler->PSendSysMessage("Previous Level: VIP%u", oldTier);
        handler->PSendSysMessage("New Level: VIP%u", targetTier);
        handler->PSendSysMessage("Consumed: %u x Item ID %u", quantity, itemId);

        LOG_INFO("member", "Player {} (Account {}) upgraded from VIP{} to VIP{}", player->GetName(), accountId, oldTier, targetTier);
        return true;
    }

    static bool HandleVipLogCommand(ChatHandler* handler, const char* args)
    {
        if (!*args)
        {
            handler->PSendSysMessage("Usage: .vip log [player]");
            return false;
        }

        Player* target = handler->GetPlayerFromObjectOrRemoteTarget(args);
        uint32 accountId = 0;
        std::string playerNameStr;

        if (target)
        {
            accountId = target->GetSession()->GetAccountId();
            playerNameStr = target->GetName();
        }
        else
        {
            ObjectGuid guid = sCharacterCache->GetCharacterGuidByName(args);
            if (!guid)
            {
                handler->PSendSysMessage(LANG_COMMAND_PLAYER_NOT_FOUND, args);
                handler->SetSentErrorMessage(true);
                return false;
            }

            std::string safeName = args;
            if (!CharacterDatabase::NormalizePlayerName(safeName))
            {
                handler->SendSysMessage(LANG_BAD_VALUE);
                handler->SetSentErrorMessage(true);
                return false;
            }

            accountId = sAccountCache->GetAccountIdByPlayerName(safeName, handler->GetSessionDbLocale());
            if (!accountId)
            {
                handler->PSendSysMessage(LANG_COMMAND_PLAYER_NOT_FOUND, args);
                handler->SetSentErrorMessage(true);
                return false;
            }

            playerNameStr = safeName;
        }

        std::vector<UpgradeLog> logs = sMemberSystem->GetUpgradeLogs(accountId, 10);

        handler->PSendSysMessage("=== VIP Upgrade History for %s ===", playerNameStr.c_str());

        if (logs.empty())
        {
            handler->PSendSysMessage("No upgrade history found.");
            return true;
        }

        for (auto const& log : logs)
        {
            char timeBuf[100];
            time_t upgradeTime = static_cast<time_t>(log.upgradeTime);
            strftime(timeBuf, sizeof(timeBuf), "%Y-%m-%d %H:%M:%S", localtime(&upgradeTime));

            handler->PSendSysMessage("[%s] VIP%u -> VIP%u | Consumed: %u x ItemID:%u",
                timeBuf, log.oldTier, log.newTier, log.quantity, log.itemId);
        }

        return true;
    }

    static bool HandleVipUpgradeSetCommand(ChatHandler* handler, const char* args)
    {
        if (!*args)
        {
            handler->PSendSysMessage("Usage: .vip upgrade set [target_level] [item_id] [quantity]");
            handler->PSendSysMessage("Example: .vip upgrade set 1 12345 100");
            return false;
        }

        char* tierStr = strtok((char*)args, " ");
        char* itemIdStr = strtok(NULL, " ");
        char* quantityStr = strtok(NULL, " ");

        if (!tierStr || !itemIdStr || !quantityStr)
        {
            handler->PSendSysMessage("Usage: .vip upgrade set [target_level] [item_id] [quantity]");
            return false;
        }

        uint32 targetTier = atoi(tierStr);
        uint32 itemId = atoi(itemIdStr);
        uint32 quantity = atoi(quantityStr);

        if (targetTier >= MAX_MEMBER_TIER || targetTier == 0)
        {
            handler->PSendSysMessage("Invalid target level. Must be 1-3.");
            return false;
        }

        if (itemId == 0 || quantity == 0)
        {
            handler->PSendSysMessage("Invalid item ID or quantity.");
            return false;
        }

        ItemTemplate const* itemTemplate = sObjectMgr->GetItemTemplate(itemId);
        std::string itemName = itemTemplate ? itemTemplate->Name1 : "Unknown Item";

        if (!sMemberSystem->SetUpgradeItem(targetTier, itemId, quantity))
        {
            handler->PSendSysMessage("|cFFFF0000Failed to set upgrade item.|r");
            return false;
        }

        handler->PSendSysMessage("|cFF00FF00Upgrade item configuration updated!|r");
        handler->PSendSysMessage("Target Level: VIP%u", targetTier);
        handler->PSendSysMessage("Required: %u x %s (Item ID: %u)", quantity, itemName.c_str(), itemId);
        handler->PSendSysMessage("Note: Changes take effect immediately. Use .vip reload to refresh cache.");

        return true;
    }
};

void AddSC_vip_commandscript()
{
    new vip_commandscript();
}
