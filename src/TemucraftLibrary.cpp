/*
 * mod-temucraft-library: library books.
 *
 * 40 lost books lie around the old world (gameobjects 601650-601689). Clicking one recovers
 * it for that character. The librarians, Garion Wendell in Stormwind's Mage Quarter and Owen Thadd in Undercity's
 * Magic Quarter, reward each character once at 10, 20, 25 and all 40 books (the last from level 50), with a choice of
 * items. At startup every book is put on the ground under its spot (the spots come from map coordinates).
 */

#include "Chat.h"
#include "Config.h"
#include "StringConvert.h"
#include "Tokenize.h"
#include "TemucraftModuleText.h"
#include "DatabaseEnv.h"
#include "GameObject.h"
#include "Log.h"
#include "Map.h"
#include "MapMgr.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "ScriptedGossip.h"

#include <array>
#include <cmath>
#include <mutex>
#include <set>
#include <unordered_map>
#include <vector>

namespace
{
    uint32 BOOK_FIRST = 601650;          // Temucraft.Library.BookFirst
    constexpr uint32 BOOK_COUNT = 40;

    struct Milestone
    {
        uint32 books;
        uint8 level;
        std::vector<uint32> items;
    };

    // Temucraft.Library.Milestones
    constexpr char const* DEFAULT_MILESTONES = "10:0:601660,601661 20:0:601662,601663 25:0:601664,601665,601666 40:50:601667,601668,601669";
    std::vector<Milestone> MILESTONES;

    // "books:level:item,item,... books:level:item,..." (at most 10 items each)
    std::vector<Milestone> ParseMilestones(std::string const& text)
    {
        std::vector<Milestone> list;
        for (std::string_view entry : Acore::Tokenize(text, ' ', false))
        {
            std::vector<std::string_view> parts = Acore::Tokenize(entry, ':', false);
            if (parts.size() != 3)
                continue;
            Optional<uint32> books = Acore::StringTo<uint32>(parts[0]);
            Optional<uint32> level = Acore::StringTo<uint32>(parts[1]);
            if (!books || !level)
                continue;
            Milestone m{ *books, uint8(std::min<uint32>(*level, 255)), {} };
            for (std::string_view id : Acore::Tokenize(parts[2], ',', false))
                if (Optional<uint32> item = Acore::StringTo<uint32>(id); item && m.items.size() < 10)
                    m.items.push_back(*item);
            if (!m.items.empty())
                list.push_back(std::move(m));
        }
        return list;
    }

    enum Sender : uint32
    {
        SENDER_MAIN = 1,
        SENDER_MILESTONE = 2,
        SENDER_CHOOSE = 3,
        SENDER_INFO = 4,
    };

    std::mutex sLock;
    std::unordered_map<ObjectGuid::LowType, std::set<uint8>> sFound;    // character -> books
    std::unordered_map<ObjectGuid::LowType, std::set<uint32>> sClaimed; // character -> milestones claimed

    void LoadCharacter(Player* player)
    {
        ObjectGuid::LowType guid = player->GetGUID().GetCounter();
        std::set<uint8> found;
        std::set<uint32> claimed;
        if (QueryResult result = CharacterDatabase.Query("SELECT `book` FROM `mod_temucraft_library_book` WHERE `guid` = {}", guid))
            do found.insert(result->Fetch()[0].Get<uint8>());
            while (result->NextRow());
        if (QueryResult result = CharacterDatabase.Query("SELECT `milestone` FROM `mod_temucraft_library_reward` WHERE `guid` = {}", guid))
            do claimed.insert(result->Fetch()[0].Get<uint32>());
            while (result->NextRow());
        std::lock_guard lock(sLock);
        sFound[guid] = std::move(found);
        sClaimed[guid] = std::move(claimed);
    }

    uint32 FoundCount(Player* player)
    {
        std::lock_guard lock(sLock);
        return uint32(sFound[player->GetGUID().GetCounter()].size());
    }

    bool Claimed(Player* player, uint32 books)
    {
        std::lock_guard lock(sLock);
        return sClaimed[player->GetGUID().GetCounter()].count(books) != 0;
    }

    std::string ItemName(uint32 entry)
    {
        ItemTemplate const* proto = sObjectMgr->GetItemTemplate(entry);
        return proto ? proto->Name1 : Acore::StringFormat("item {}", entry);
    }

    void SendMain(Player* player, Creature* creature)
    {
        uint32 found = FoundCount(player);
        ClearGossipMenuFor(player);
        AddGossipItemFor(player, GOSSIP_ICON_CHAT, Acore::StringFormat(TemucraftModuleText("mod-temucraft-library", player, 1, "|cff8a4b00Books you have recovered: {} of {}.|r"), found, BOOK_COUNT),
            SENDER_INFO, 0);
        for (uint32 i = 0; i < MILESTONES.size(); ++i)
        {
            Milestone const& m = MILESTONES[i];
            if (Claimed(player, m.books))
                AddGossipItemFor(player, GOSSIP_ICON_CHAT, Acore::StringFormat(TemucraftModuleText("mod-temucraft-library", player, 2, "{} books: reward taken."), m.books), SENDER_INFO, 0);
            else if (found >= m.books && player->GetLevel() >= m.level)
                AddGossipItemFor(player, GOSSIP_ICON_VENDOR, Acore::StringFormat(TemucraftModuleText("mod-temucraft-library", player, 3, "I've brought back {} books. (choose a reward)"), m.books),
                    SENDER_MILESTONE, i);
            else
                AddGossipItemFor(player, GOSSIP_ICON_CHAT, m.level && player->GetLevel() < m.level ?
                    Acore::StringFormat(TemucraftModuleText("mod-temucraft-library", player, 4, "{} books: a reward from level {}."), m.books, m.level) :
                    Acore::StringFormat(TemucraftModuleText("mod-temucraft-library", player, 5, "{} books: a reward waits for you."), m.books), SENDER_INFO, 0);
        }
        SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
    }

    void SendChoices(Player* player, Creature* creature, uint32 index)
    {
        Milestone const& m = MILESTONES[index];
        ClearGossipMenuFor(player);
        for (uint32 i = 0; i < m.items.size(); ++i)
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, ItemName(m.items[i]), SENDER_CHOOSE, index * 10 + i,
                Acore::StringFormat(TemucraftModuleText("mod-temucraft-library", player, 6, "Take {}?"), ItemName(m.items[i])), 0, false);
        AddGossipItemFor(player, GOSSIP_ICON_TALK, TemucraftModuleText("mod-temucraft-library", player, 7, "Back"), SENDER_MAIN, 0);
        SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
    }

    // Each book onto the ground under its spot (heights in the SQL are only a nearby spawn's)
    void GroundBooks()
    {
        QueryResult result = WorldDatabase.Query("SELECT `guid` FROM `gameobject` WHERE `id` BETWEEN {} AND {}", BOOK_FIRST,
            BOOK_FIRST + BOOK_COUNT - 1);
        if (!result)
            return;
        uint32 moved = 0;
        do
        {
            ObjectGuid::LowType guid = result->Fetch()[0].Get<uint32>();
            GameObjectData const* data = sObjectMgr->GetGameObjectData(guid);
            if (!data)
                continue;
            Map* map = sMapMgr->CreateBaseMap(data->mapid);
            if (!map)
                continue;
            float ground = map->GetHeight(data->phaseMask, data->posX, data->posY, data->posZ + 5.0f, true, 40.0f);
            if (ground <= INVALID_HEIGHT || std::fabs(ground - data->posZ) < 0.3f)
                continue;
            const_cast<GameObjectData*>(data)->posZ = ground;
            WorldDatabase.Execute("UPDATE `gameobject` SET `position_z` = {:.3f} WHERE `guid` = {}", ground, guid);
            ++moved;
        } while (result->NextRow());
        if (moved)
            LOG_INFO("module", "mod-temucraft-library: {} library book(s) put on the ground", moved);
    }
}

class go_mod_temucraft_library_book : public GameObjectScript
{
public:
    go_mod_temucraft_library_book() : GameObjectScript("go_mod_temucraft_library_book") { }

    bool OnGossipHello(Player* player, GameObject* go) override
    {
        uint32 index = go->GetEntry() - BOOK_FIRST;
        if (index >= BOOK_COUNT)
            return true;
        ObjectGuid::LowType guid = player->GetGUID().GetCounter();
        uint32 count;
        {
            std::lock_guard lock(sLock);
            if (!sFound[guid].insert(uint8(index)).second)
            {
                ChatHandler(player->GetSession()).PSendSysMessage(TemucraftModuleText("mod-temucraft-library", player->GetSession(), 8, "|cffffcc00You've already recovered {}.|r"), go->GetGOInfo()->name);
                return true;
            }
            count = uint32(sFound[guid].size());
        }
        CharacterDatabase.Execute("INSERT IGNORE INTO `mod_temucraft_library_book` (`guid`, `book`) VALUES ({}, {})", guid, index);
        ChatHandler(player->GetSession()).PSendSysMessage(TemucraftModuleText("mod-temucraft-library", player->GetSession(), 9, "|cffff8000Library book recovered:|r {} ({} of {}). The librarians in "
            "Stormwind and Undercity will want to hear about it."), go->GetGOInfo()->name, count, BOOK_COUNT);
        return true;
    }
};

class npc_temucraft_librarian : public CreatureScript
{
public:
    npc_temucraft_librarian() : CreatureScript("npc_temucraft_librarian") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        SendMain(player, creature);
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action) override
    {
        switch (sender)
        {
            case SENDER_MILESTONE:
                if (action < MILESTONES.size())
                    SendChoices(player, creature, action);
                return true;
            case SENDER_CHOOSE:
            {
                uint32 index = action / 10, choice = action % 10;
                if (index >= MILESTONES.size() || choice >= MILESTONES[index].items.size())
                    return true;
                Milestone const& m = MILESTONES[index];
                if (Claimed(player, m.books) || FoundCount(player) < m.books || player->GetLevel() < m.level)
                {
                    SendMain(player, creature);
                    return true;
                }
                ItemPosCountVec dest;
                if (player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, m.items[choice], 1) != EQUIP_ERR_OK)
                {
                    ChatHandler(player->GetSession()).SendSysMessage(TemucraftModuleText("mod-temucraft-library", player->GetSession(), 10, "|cffff4c4cYour bags are full.|r"));
                    CloseGossipMenuFor(player);
                    return true;
                }
                if (Item* item = player->StoreNewItem(dest, m.items[choice], true))
                    player->SendNewItem(item, 1, true, false);
                {
                    std::lock_guard lock(sLock);
                    sClaimed[player->GetGUID().GetCounter()].insert(m.books);
                }
                CharacterDatabase.Execute("INSERT IGNORE INTO `mod_temucraft_library_reward` (`guid`, `milestone`) VALUES ({}, {})",
                    player->GetGUID().GetCounter(), m.books);
                SendMain(player, creature);
                return true;
            }
            default:
                SendMain(player, creature);
                return true;
        }
    }
};

class TemucraftLibrary_Player : public PlayerScript
{
public:
    TemucraftLibrary_Player() : PlayerScript("TemucraftLibrary_Player", { PLAYERHOOK_ON_LOGIN, PLAYERHOOK_ON_LOGOUT }) { }

    void OnPlayerLogin(Player* player) override
    {
        LoadCharacter(player);
    }

    void OnPlayerLogout(Player* player) override
    {
        std::lock_guard lock(sLock);
        sFound.erase(player->GetGUID().GetCounter());
        sClaimed.erase(player->GetGUID().GetCounter());
    }
};

class TemucraftLibrary_World : public WorldScript
{
public:
    TemucraftLibrary_World() : WorldScript("TemucraftLibrary_World", { WORLDHOOK_ON_AFTER_CONFIG_LOAD, WORLDHOOK_ON_STARTUP }) { }

    void OnAfterConfigLoad(bool /*reload*/) override
    {
        BOOK_FIRST = sConfigMgr->GetOption<uint32>("Temucraft.Library.BookFirst", 601650);
        MILESTONES = ParseMilestones(sConfigMgr->GetOption<std::string>("Temucraft.Library.Milestones", DEFAULT_MILESTONES));
    }

    void OnStartup() override
    {
        GroundBooks();
    }
};

// a deleted character's read books and claimed milestones go with it
// OnPlayerDeleteFromDB: only when the character is really removed (not a CharDelete.Method = 1 unlink, which can be
// restored), and in the same transaction as the core's own deletes.
class TemucraftLibrary_Delete : public PlayerScript
{
public:
    TemucraftLibrary_Delete() : PlayerScript("TemucraftLibrary_Delete", { PLAYERHOOK_ON_DELETE_FROM_DB }) { }

    void OnPlayerDeleteFromDB(CharacterDatabaseTransaction trans, uint32 guid) override
    {
        trans->Append("DELETE FROM `mod_temucraft_library_book` WHERE `guid` = {}", guid);
        trans->Append("DELETE FROM `mod_temucraft_library_reward` WHERE `guid` = {}", guid);
    }
};

void AddTemucraftLibraryScripts()
{
    new go_mod_temucraft_library_book();
    new npc_temucraft_librarian();
    new TemucraftLibrary_Player();
    new TemucraftLibrary_World();
    new TemucraftLibrary_Delete();
}
