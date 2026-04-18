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
        handler->PSendSysMessage("Member system configuration reloaded.");
        return true;
    }
};

void AddSC_vip_commandscript()
{
    new vip_commandscript();
}
