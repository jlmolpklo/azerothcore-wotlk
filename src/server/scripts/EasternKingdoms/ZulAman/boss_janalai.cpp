/*
 * This file is part of the AzerothCore Project. See AUTHORS file for Copyright information
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
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/* ScriptData
SDName: Boss_Janalai
SD%Complete: 100
SDComment:
SDCategory: Zul'Aman
EndScriptData */

#include "CellImpl.h"
#include "CreatureScript.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "PassiveAI.h"
#include "ScriptedCreature.h"
#include "zulaman.h"

enum Yells
{
    SAY_AGGRO                   = 0,
    SAY_FIRE_BOMBS              = 1,
    SAY_SUMMON_HATCHER          = 2,
    SAY_ALL_EGGS                = 3,
    SAY_BERSERK                 = 4,
    SAY_SLAY                    = 5,
    SAY_DEATH                   = 6,
    SAY_EVENT_STRANGERS         = 7,
    SAY_EVENT_FRIENDS           = 8
};

enum Spells
{
    // Jan'alai
    SPELL_FLAME_BREATH          = 43140,
    SPELL_FIRE_WALL             = 43113,
    SPELL_ENRAGE                = 44779,
    SPELL_SUMMON_PLAYERS        = 43097,
    SPELL_TELE_TO_CENTER        = 43098, // coord
    SPELL_HATCH_ALL             = 43144,
    SPELL_BERSERK               = 45078,

    // Fire Bob Spells
    SPELL_FIRE_BOMB_CHANNEL     = 42621, // last forever
    SPELL_FIRE_BOMB_THROW       = 42628, // throw visual
    SPELL_FIRE_BOMB_DUMMY       = 42629, // bomb visual
    SPELL_FIRE_BOMB_DAMAGE      = 42630,

    // Hatcher Spells
    SPELL_HATCH_EGG_ALL         = 42471,
    SPELL_HATCH_EGG_SINGULAR    = 43734,
    SPELL_SUMMON_HATCHLING      = 42493,

    // Hatchling Spells
    SPELL_FLAMEBUFFET           = 43299
};

enum Creatures
{
    NPC_AMANI_HATCHER           = 23818,
    NPC_HATCHLING               = 23598, // 42493
    NPC_EGG                     = 23817,
    NPC_FIRE_BOMB               = 23920
};

const int area_dx = 44;
const int area_dy = 51;

const Position janalainPos = {-33.93f, 1149.27f, 19.0f, 0.0f};

const Position fireWallCoords[4] =
{
    {-10.13f, 1149.27f, 19, 3.1415f},
    {-33.93f, 1123.90f, 19, 0.5f * 3.1415f},
    {-54.80f, 1150.08f, 19, 0.0f},
    {-33.93f, 1175.68f, 19, 1.5f * 3.1415f}
};

const Position hatcherway[2][5] =
{
    {
        {-87.46f, 1170.09f, 6.0f, 0.0f},
        {-74.41f, 1154.75f, 6.0f, 0.0f},
        {-52.74f, 1153.32f, 19.0f, 0.0f},
        {-33.37f, 1172.46f, 19.0f, 0.0f},
        {-33.09f, 1203.87f, 19.0f, 0.0f}
    },
    {
        {-86.57f, 1132.85f, 6.0f, 0.0f},
        {-73.94f, 1146.00f, 6.0f, 0.0f},
        {-52.29f, 1146.51f, 19.0f, 0.0f},
        {-33.57f, 1125.72f, 19.0f, 0.0f},
        {-34.29f, 1095.22f, 19.0f, 0.0f}
    }
};

enum HatchActions
{
    HATCH_RESET = 0,
    HATCH_ALL   = 1
};

enum Misc
{
    MAX_BOMB_COUNT              = 40,

    SCHEDULER_GROUP_HATCHING    = 1,

    EVENT_BERSERK               = 0
};

struct boss_janalai : public BossAI
{
    boss_janalai(Creature* creature) : BossAI(creature, DATA_JANALAI) { }

    void Reset() override
    {
        BossAI::Reset();
        HatchAllEggs(HATCH_RESET);
        _isBombing = false;
        _isFlameBreathing = false;

        ScheduleHealthCheckEvent(25, [&]{
            DoCastSelf(SPELL_ENRAGE, true);
        });

        ScheduleHealthCheckEvent(35, [&]{
            Talk(SAY_ALL_EGGS);
            me->AttackStop();
            me->GetMotionMaster()->Clear();
            me->SetPosition(janalainPos);
            me->StopMovingOnCurrentPos();
            DoCastSelf(SPELL_HATCH_ALL);
            HatchAllEggs(HATCH_ALL);
        });
    }

    void JustDied(Unit* killer) override
    {
        Talk(SAY_DEATH);
        BossAI::JustDied(killer);
    }

    void DamageDealt(Unit* target, uint32& damage, DamageEffectType /*damagetype*/) override
    {
        if (_isFlameBreathing)
        {
            if (!me->HasInArc(M_PI / 6, target))
                damage = 0;
        }
    }

    void JustEngagedWith(Unit* who) override
    {
        BossAI::JustEngagedWith(who);
        Talk(SAY_AGGRO);
        //schedule abilities
        ScheduleTimedEvent(30s, [&]{
            StartBombing();
        }, 20s, 40s);
        ScheduleTimedEvent(10s, [&]{
            if (HatchAllEggs(HATCH_RESET))
            {
                Talk(SAY_SUMMON_HATCHER);
                me->SummonCreature(NPC_AMANI_HATCHER, hatcherway[0][0], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
                me->SummonCreature(NPC_AMANI_HATCHER, hatcherway[1][0], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
            }
        }, 90s);
        ScheduleTimedEvent(8s, [&]{
            if (Unit* target = SelectTarget(SelectTargetMethod::Random, 0))
            {
                me->AttackStop();
                me->GetMotionMaster()->Clear();
                DoCast(target, SPELL_FLAME_BREATH);
                me->StopMoving();
                _isFlameBreathing = true;
                // placeholder time idk yet
                scheduler.Schedule(2s, [this](TaskContext)
                {
                    _isFlameBreathing = false;
                });
            }
        }, 8s);
        ScheduleUniqueTimedEvent(5min, [&]{
            Talk(SAY_BERSERK);
            DoCastSelf(SPELL_BERSERK);
        }, EVENT_BERSERK);
    }

    bool HatchAllEggs(uint32 hatchAction)
    {
        std::list<Creature* > eggList;
        me->GetCreaturesWithEntryInRange(eggList, 100.0f, NPC_EGG);
        if (eggList.empty())
            return false;

        if (hatchAction == HATCH_RESET)
            for (Creature* egg : eggList)
                egg->Respawn();
        else if (hatchAction == HATCH_ALL)
            DoCastSelf(SPELL_HATCH_EGG_ALL);

        if (hatchAction == HATCH_RESET)
        {
            std::list<Creature* > hatchlingList;
            me->GetCreaturesWithEntryInRange(hatchlingList, 100.0f, NPC_HATCHLING);
            for (Creature* hatchling : hatchlingList)
                hatchling->DespawnOrUnsummon();
            hatchlingList.clear();
        }
        eggList.clear();
        return true;
    }

    void FireWall()
    {
        for (uint8 i = 0; i < 4; ++i)
        {
            uint8 wallNum = i == 0 || i == 2 ? 3 : 2;

            for (uint8 j = 0; j < wallNum; j++)
            {
                Creature* wall = wallNum == 3
                        ? me->SummonCreature(NPC_FIRE_BOMB, fireWallCoords[i].GetPositionX(), fireWallCoords[i].GetPositionY() + 5 * (j - 1), fireWallCoords[i].GetPositionZ(), fireWallCoords[i].GetOrientation(), TEMPSUMMON_TIMED_DESPAWN, 15000)
                        : me->SummonCreature(NPC_FIRE_BOMB, fireWallCoords[i].GetPositionX() - 2 + 4 * j, fireWallCoords[i].GetPositionY(), fireWallCoords[i].GetPositionZ(), fireWallCoords[i].GetOrientation(), TEMPSUMMON_TIMED_DESPAWN, 15000);

                if (wall)
                {
                    wall->AI()->DoCastSelf(SPELL_FIRE_WALL, true);
                }
            }
        }
    }

    void SpawnBombs()
    {
        float dx, dy;
        for (int i = 0; i < MAX_BOMB_COUNT; ++i)
        {
            dx = float(irand(-area_dx / 2, area_dx / 2));
            dy = float(irand(-area_dy / 2, area_dy / 2));
            DoSpawnCreature(NPC_FIRE_BOMB, dx, dy, 0, 0, TEMPSUMMON_TIMED_DESPAWN, 15000);
        }
    }

    void Boom()
    {
        std::list<Creature*> fireBombs;
        me->GetCreaturesWithEntryInRange(fireBombs, 100.0f, NPC_FIRE_BOMB);

        if (fireBombs.empty())
            return;

        for (Creature* bomb : fireBombs)
        {
            bomb->AI()->DoCastSelf(SPELL_FIRE_BOMB_DAMAGE, true);
            bomb->RemoveAllAuras();
        }
        fireBombs.clear();
    }

    void StartBombing()
    {
        Talk(SAY_FIRE_BOMBS);
        me->AttackStop();
        me->GetMotionMaster()->Clear();
        me->SetPosition(janalainPos);
        me->StopMovingOnCurrentPos();
        DoCastSelf(SPELL_FIRE_BOMB_CHANNEL);

        FireWall();
        SpawnBombs();
        _isBombing = true;

        if (Map* map = me->GetMap())
        {
            map->DoForAllPlayers([&](Player* player)
            {
                if (player->IsAlive())
                    DoTeleportPlayer(player, janalainPos.GetPositionX() - 5 + rand() % 10, janalainPos.GetPositionY() - 5 + rand() % 10, janalainPos.GetPositionZ(), 0.0f);
            });
        }
        //DoCast(Temp, SPELL_SUMMON_PLAYERS, true) // core bug, spell does not work if too far
        ThrowBombs();

        scheduler.Schedule(11s, [this](TaskContext)
        {
            Boom();
            _isBombing = false;

            me->RemoveAurasDueToSpell(SPELL_FIRE_BOMB_CHANNEL);
        });
    }

    void ThrowBombs()
    {
        std::list<Creature*> fireBombs;
        std::chrono::milliseconds bombTimer = 100ms;
        me->GetCreaturesWithEntryInRange(fireBombs, 100.0f, NPC_FIRE_BOMB);
        for (Creature* bomb : fireBombs)
        {
            scheduler.Schedule(bombTimer, [this, bomb](TaskContext)
            {
                bomb->RemoveUnitFlag(UNIT_FLAG_NOT_SELECTABLE);
                DoCast(bomb, SPELL_FIRE_BOMB_THROW, true);
                bomb->SetUnitFlag(UNIT_FLAG_NOT_SELECTABLE);
            });
            bombTimer = bombTimer + 100ms;
        }
        fireBombs.clear();
    }

    bool CheckEvadeIfOutOfCombatArea() const override
    {
        return me->GetPositionZ() <= 12.0f;
    }
private:
    bool _isBombing;
    bool _isFlameBreathing;
};

struct npc_janalai_hatcher : public ScriptedAI
{
    npc_janalai_hatcher(Creature* creature) : ScriptedAI(creature)
    {
        _instance = creature->GetInstanceScript();
    }

    void Reset() override
    {
        ScriptedAI::Reset();
        scheduler.CancelAll();
        _side = (me->GetPositionY() < 1150);
        _waypoint = 0;
        _isHatching = false;
        _hasChangedSide = false;
        me->GetMotionMaster()->Clear();
        me->GetMotionMaster()->MovePoint(0, hatcherway[_side][0]);
    }

    void MovementInform(uint32, uint32) override
    {
        if (_waypoint == 5)
        {
            _isHatching = true;
            std::list<Creature* > eggList;
            me->GetCreaturesWithEntryInRange(eggList, 50.0f, NPC_EGG);
            scheduler.Schedule(1500ms, SCHEDULER_GROUP_HATCHING, [this, eggList](TaskContext context)
            {
                std::list<Creature* > unhatchedEggs;
                for (Creature* egg : eggList)
                {
                    if (egg->IsAlive())
                        unhatchedEggs.emplace_front(egg);
                }
                Acore::Containers::RandomResize(unhatchedEggs, 1);
                if (Creature* egg = unhatchedEggs.front())
                    egg->AI()->DoCastSelf(SPELL_HATCH_EGG_SINGULAR);
                else if (!_hasChangedSide)
                {
                    _side = _side ? 0 : 1;
                    _isHatching = false;
                    _waypoint = 3;
                    MoveToNewWaypoint(_waypoint);
                    _hasChangedSide = true;
                    context.CancelGroup(SCHEDULER_GROUP_HATCHING);
                }
                context.Repeat(1500ms);
            });
        }
        else
        {
            MoveToNewWaypoint(_waypoint);
            ++_waypoint;
        }
    }

    void MoveToNewWaypoint(uint8 waypoint)
    {
        if (!_isHatching)
        {
            scheduler.Schedule(100ms, [this, waypoint](TaskContext)
            {
                me->GetMotionMaster()->Clear();
                me->GetMotionMaster()->MovePoint(0, hatcherway[_side][waypoint]);
            });
        }
    }

    void UpdateAI(uint32 diff) override
    {
        scheduler.Update(diff);
    }

    void JustEngagedWith(Unit* /*who*/) override { }
    void AttackStart(Unit* /*who*/) override { }
    void MoveInLineOfSight(Unit* /*who*/) override { }

private:
    InstanceScript* _instance;
    uint8 _side;
    uint8 _waypoint;
    bool _isHatching;
    bool _hasChangedSide;
};

struct npc_janalai_hatchling : public ScriptedAI
{
    npc_janalai_hatchling(Creature* creature) : ScriptedAI(creature)
    {
        _instance = creature->GetInstanceScript();
    }

    void Reset() override
    {
        scheduler.CancelAll();
        if (me->GetPositionY() > 1150)
            me->GetMotionMaster()->MovePoint(0, hatcherway[0][3].GetPositionX() + rand() % 4 - 2, 1150.0f + rand() % 4 - 2, hatcherway[0][3].GetPositionY());
        else
            me->GetMotionMaster()->MovePoint(0, hatcherway[1][3].GetPositionX() + rand() % 4 - 2, 1150.0f + rand() % 4 - 2, hatcherway[1][3].GetPositionY());

        me->SetDisableGravity(true);
        me->SetInCombatWithZone();
    }

    void JustEngagedWith(Unit* who) override
    {
        ScriptedAI::JustEngagedWith(who);
        ScheduleTimedEvent(7s, [&]{
            DoCastVictim(SPELL_FLAMEBUFFET);
        }, 10s);
    }

    void UpdateAI(uint32 diff) override
    {
        if (!UpdateVictim())
            return;

        scheduler.Update(diff);

        DoMeleeAttackIfReady();
    }

private:
    InstanceScript* _instance;
};

struct npc_janalai_egg : public NullCreatureAI
{
    npc_janalai_egg(Creature* creature) : NullCreatureAI(creature) { }

    void SpellHit(Unit* /*caster*/, SpellInfo const* spell) override
    {
        if (spell->Id == SPELL_HATCH_EGG_ALL || spell->Id == SPELL_HATCH_EGG_SINGULAR)
            DoCastSelf(SPELL_SUMMON_HATCHLING);
    }
};

void AddSC_boss_janalai()
{
    RegisterZulAmanCreatureAI(boss_janalai);
    RegisterZulAmanCreatureAI(npc_janalai_hatcher);
    RegisterZulAmanCreatureAI(npc_janalai_hatchling);
    RegisterZulAmanCreatureAI(npc_janalai_egg);
}
