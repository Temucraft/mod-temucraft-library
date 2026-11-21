# mod-temucraft-library

40 lost books lie around the old world. Clicking one recovers it; the librarians in Stormwind and Undercity reward 10, 20, 25 and 40 recovered books (40 also needs level 50).

## Install

1. Put this folder in `modules/` of your AzerothCore source, re-run CMake and build.
2. The SQL in `data/sql/` is applied by the worldserver on its next start (AzerothCore's module updater). Every file deletes its own rows before inserting them, so running one again is safe.
   Copy `conf/mod-temucraft-library.conf.dist` to your `configs/modules/` as `mod-temucraft-library.conf` to change its settings (first book id, librarian rewards).
3. No client changes: it works with an unmodified 3.3.5a client.

## What it adds, and where

| Database | Table | IDs |
|---|---|---|
| world | `gameobject_template` | 601650-601689 (books) |
| world | `gameobject` | spawns 9200100-9200139 |
| world | `creature_template` | 601641-601642 (librarians) |
| world | `creature` | spawns 9200150-9200151 |
| world | `item_template` | 601660-601669 (rewards) |
| characters | `mod_temucraft_library_book`, `mod_temucraft_library_reward` | per character |

## Works with other modules

- Reward items are copies of existing items (renamed).

## Independence

This module doesn't need any other module, nor any other Temucraft module. Books are put on the ground at startup by the script, so it works with any map data.

## Customising IDs

The entries above are a block reserved for this module. The book objects (601650-601689) and reward items (601660-601669) are also in the script (`BOOK_FIRST`, the reward table): change both together.

## Texts and translations

The 10 player-facing texts (chat messages, gossip options) are in the `module_string` table under the module name
`mod-temucraft-library`, so they can be changed without rebuilding. Translations go in `module_string_locale` with the same
module and id plus the locale (`deDE`, `esES`, `frFR`, ...). If a row is missing the English text in the code is used.

Part of the Temucraft modules for AzerothCore 3.3.5a.
