-- mod-temucraft-library: library books (40), two librarians and their rewards. Re-runnable.
-- Positions come from the guide's map coordinates; heights are a nearby spawn's, and the module puts each book
-- on the ground under it at startup.
SET @Book := 601650;
SET @BookSpawn := 9200100;
SET @Librarian := 601641;
SET @LibrarianSpawn := 9200150;
SET @Reward := 601660;
DELETE FROM `gameobject` WHERE `guid` BETWEEN @BookSpawn AND @BookSpawn+39;
DELETE FROM `gameobject_template` WHERE `entry` BETWEEN @Book AND @Book+39;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES
(@Book, 10, 255, 'Defensive Magics 101', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+1, 10, 6893, 'A Web of Lies: Debunking Myths and Legends', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+2, 10, 6894, 'Everyday Etiquette', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+3, 10, 6908, 'Mummies: A Guide to the Unsavory Undead', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+4, 10, 6909, 'Arcanic Systems Manual', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+5, 10, 7693, 'Baxtan: On Destructive Magics', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+6, 10, 255, 'Secrets of the Dreamers', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+7, 10, 6893, 'Conjurer\'s Codex', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+8, 10, 6894, 'Stonewrought Design', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+9, 10, 6908, 'Magma or Lava?', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+10, 10, 6909, 'Nar\'thalas Almanac, Vol. 74', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+11, 10, 7693, 'Demons and You', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+12, 10, 255, 'Crimes Against Anatomy', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+13, 10, 6893, 'RwlRwlRwlRwl!', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+14, 10, 6894, 'A Study of the Light', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+15, 10, 6908, 'Scourge: Undead Menace or Misunderstood?', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+16, 10, 6909, 'The Knight and the Lady', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+17, 10, 7693, 'Archmage Theocritus\' Research Journal', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+18, 10, 255, 'Northern Kalimdor - A Comprehensive Guide', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+19, 10, 6893, 'The Liminal and the Arcane', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+20, 10, 6894, 'Venomous Journeys', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+21, 10, 6908, 'Archmage Antonidas: The Unabridged Autobiography', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+22, 10, 6909, 'Runes of the Sorcerer-Kings', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+23, 10, 7693, 'The Lessons of Ta\'zo', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+24, 10, 255, 'A Mind of Metal', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+25, 10, 6893, 'Ataeric: On Arcane Curiosities', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+26, 10, 6894, 'The Dalaran Digest, Vol. 23', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+27, 10, 6908, 'Fury of the Land', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+28, 10, 6909, 'Basilisks: Should Petrification be Feared?', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+29, 10, 7693, 'A Luddite\'s Guide to Caring for Your Demonic Pet', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+30, 10, 255, 'Sanguine Sorcery', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+31, 10, 6893, 'Legends of the Tidesages', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+32, 10, 6894, 'Geomancy: The Stone-Cold Truth', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+33, 10, 6908, 'The Apothecary\'s Metaphysical Primer', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+34, 10, 6909, 'Necromancy 101', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+35, 10, 7693, 'Undead Potatoes', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+36, 10, 255, 'Bewitchments and Glamours', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+37, 10, 6893, 'Rumi of Gnomeregan: The Collected Works', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+38, 10, 210, 'Goaz Scrolls', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0),
(@Book+39, 10, 6908, 'Ka-Boom!', 'Interact', '', '', 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mod_temucraft_library_book', 0);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES
(@BookSpawn, @Book, 0, 0, 0, 1, 1, 424.8, -571.87, 171.29, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Alterac Mountains: Defensive Magics 101'),
(@BookSpawn+1, @Book+1, 0, 0, 0, 1, 1, -1698.13, -3516.27, 60.43, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Arathi Highlands: A Web of Lies: Debunking Myths and Legends'),
(@BookSpawn+2, @Book+2, 1, 0, 0, 1, 1, 3245.29, -4326.75, 132.40, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Azshara: Everyday Etiquette'),
(@BookSpawn+3, @Book+3, 0, 0, 0, 1, 1, -6551.26, -3489.58, 292.77, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Badlands: Mummies: A Guide to the Unsavory Undead'),
(@BookSpawn+4, @Book+4, 1, 0, 0, 1, 1, 1017.95, -3082.15, 91.72, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'The Barrens: Arcanic Systems Manual'),
(@BookSpawn+5, @Book+5, 1, 0, 0, 1, 1, -840.02, -3730.68, 19.97, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'The Barrens: Baxtan: On Destructive Magics'),
(@BookSpawn+6, @Book+6, 1, 0, 0, 1, 1, -853.53, -2038.42, 81.19, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'The Barrens: Secrets of the Dreamers'),
(@BookSpawn+7, @Book+7, 0, 0, 0, 1, 1, -11285.8, -3097.57, -1.07, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Blasted Lands: Conjurer\'s Codex'),
(@BookSpawn+8, @Book+8, 0, 0, 0, 1, 1, -7595.4, -1116.12, 252.79, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Burning Steppes: Stonewrought Design'),
(@BookSpawn+9, @Book+9, 0, 0, 0, 1, 1, -7581.74, -1133.7, 299.04, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Burning Steppes: Magma or Lava?'),
(@BookSpawn+10, @Book+10, 1, 0, 0, 1, 1, 7363.93, -962.13, 32.25, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Darkshore: Nar\'thalas Almanac, Vol. 74'),
(@BookSpawn+11, @Book+11, 1, 0, 0, 1, 1, -333.37, 1756.13, 139.60, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Desolace: Demons and You'),
(@BookSpawn+12, @Book+12, 0, 0, 0, 1, 1, -10229.67, 385.13, 10.51, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Duskwood: Crimes Against Anatomy'),
(@BookSpawn+13, @Book+13, 1, 0, 0, 1, 1, -2761.33, -3978.0, 34.81, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Dustwallow Marsh: RwlRwlRwlRwl!'),
(@BookSpawn+14, @Book+14, 0, 0, 0, 1, 1, 2408.79, -5181.94, 74.51, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Eastern Plaguelands: A Study of the Light'),
(@BookSpawn+15, @Book+15, 0, 0, 0, 1, 1, 3139.79, -3549.28, 152.41, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Eastern Plaguelands: Scourge: Undead Menace or Misunderstood?'),
(@BookSpawn+16, @Book+16, 0, 0, 0, 1, 1, 2567.35, -4194.28, 56.26, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Eastern Plaguelands: The Knight and the Lady'),
(@BookSpawn+17, @Book+17, 0, 0, 0, 1, 1, -9562.11, -734.51, 99.30, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Elwynn Forest: Archmage Theocritus\' Research Journal'),
(@BookSpawn+18, @Book+18, 1, 0, 0, 1, 1, 7006.83, -2107.33, 601.65, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Felwood: Northern Kalimdor - A Comprehensive Guide'),
(@BookSpawn+19, @Book+19, 1, 0, 0, 1, 1, -3094.1, 1924.97, 29.13, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Feralas: The Liminal and the Arcane'),
(@BookSpawn+20, @Book+20, 0, 0, 0, 1, 1, -401.87, -2961.0, 94.18, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'The Hinterlands: Venomous Journeys'),
(@BookSpawn+21, @Book+21, 0, 0, 0, 1, 1, -4624.64, -1312.09, 502.95, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Ironforge: Archmage Antonidas: The Unabridged Autobiography'),
(@BookSpawn+22, @Book+22, 0, 0, 0, 1, 1, -4745.04, -4128.7, 307.38, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Loch Modan: Runes of the Sorcerer-Kings'),
(@BookSpawn+23, @Book+23, 1, 0, 0, 1, 1, 1540.51, -4223.41, 41.24, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Orgrimmar: The Lessons of Ta\'zo'),
(@BookSpawn+24, @Book+24, 0, 0, 0, 1, 1, -6833.34, -1166.33, 241.17, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Searing Gorge: A Mind of Metal'),
(@BookSpawn+25, @Book+25, 0, 0, 0, 1, 1, 513.07, 1627.2, 130.93, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Silverpine Forest: Ataeric: On Arcane Curiosities'),
(@BookSpawn+26, @Book+26, 0, 0, 0, 1, 1, -100.13, 783.0, 66.12, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Silverpine Forest: The Dalaran Digest, Vol. 23'),
(@BookSpawn+27, @Book+27, 1, 0, 0, 1, 1, 126.06, -387.37, 1.57, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Stonetalon Mountains: Fury of the Land'),
(@BookSpawn+28, @Book+28, 0, 0, 0, 1, 1, -13334.12, -421.0, 14.75, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Stranglethorn Vale: Basilisks: Should Petrification be Feared?'),
(@BookSpawn+29, @Book+29, 0, 0, 0, 1, 1, -9963.37, -3631.28, 22.89, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Swamp of Sorrows: A Luddite\'s Guide to Caring for Your Demonic Pet'),
(@BookSpawn+30, @Book+30, 0, 0, 0, 1, 1, -10400.71, -3828.54, 31.63, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Swamp of Sorrows: Sanguine Sorcery'),
(@BookSpawn+31, @Book+31, 1, 0, 0, 1, 1, -8073.8, -5235.05, 2.39, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Tanaris: Legends of the Tidesages'),
(@BookSpawn+32, @Book+32, 1, 0, 0, 1, 1, -5142.93, -1946.93, 89.27, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Thousand Needles: Geomancy: The Stone-Cold Truth'),
(@BookSpawn+33, @Book+33, 0, 0, 0, 1, 1, 2261.96, 349.2, 36.02, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Tirisfal Glades: The Apothecary\'s Metaphysical Primer'),
(@BookSpawn+34, @Book+34, 0, 0, 0, 1, 1, 1279.73, -2567.53, 94.11, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Western Plaguelands: Necromancy 101'),
(@BookSpawn+35, @Book+35, 0, 0, 0, 1, 1, 1801.47, -1230.23, 60.34, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Western Plaguelands: Undead Potatoes'),
(@BookSpawn+36, @Book+36, 0, 0, 0, 1, 1, -11045.0, 1427.67, 44.44, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Westfall: Bewitchments and Glamours'),
(@BookSpawn+37, @Book+37, 0, 0, 0, 1, 1, -10655.33, 1172.17, 34.37, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Westfall: Rumi of Gnomeregan: The Collected Works'),
(@BookSpawn+38, @Book+38, 0, 0, 0, 1, 1, -3468.16, -1779.08, 16.24, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Wetlands: Goaz Scrolls'),
(@BookSpawn+39, @Book+39, 1, 0, 0, 1, 1, 6748.87, -4626.37, 729.53, 0, 0, 0, 0, 1, 300, 255, 1, '', 0, 'Winterspring: Ka-Boom!');

DELETE FROM `creature` WHERE `guid` IN (@LibrarianSpawn, @LibrarianSpawn+1);
DELETE FROM `creature_template` WHERE `entry` IN (@Librarian, @Librarian+1);
DELETE FROM `creature_template_model` WHERE `CreatureID` IN (@Librarian, @Librarian+1);
INSERT INTO `creature_template` (`entry`, `name`, `subname`, `minlevel`, `maxlevel`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `unit_class`, `unit_flags`, `type`, `AIName`, `MovementType`, `HealthModifier`, `RegenHealth`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@Librarian, 'Garion Wendell', 'Librarian', 60, 60, 12, 1, 1, 1.14286, 8, 0, 7, '', 0, 1, 1, 2, 'npc_temucraft_librarian', 0),
(@Librarian+1, 'Owen Thadd', 'Librarian', 60, 60, 68, 1, 1, 1.14286, 8, 0, 7, '', 0, 1, 1, 2, 'npc_temucraft_librarian', 0);
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@Librarian, 0, 1758, 1, 1, 0),
(@Librarian+1, 0, 2657, 1, 1, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES
(@LibrarianSpawn, @Librarian, 0, 0, 0, 1, 1, 0, -8996.63, 871.54, 148.72, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 'Stormwind City: librarian'),
(@LibrarianSpawn+1, @Librarian+1, 0, 0, 0, 1, 1, 0, 1670.55, 163.26, -62.05, 0, 300, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 'Undercity: librarian');

-- Rewards: copies of existing items of the right level, renamed
DELETE FROM `item_template` WHERE `entry` BETWEEN @Reward AND @Reward+9;
DROP TEMPORARY TABLE IF EXISTS `temucraft_library_items`;
CREATE TEMPORARY TABLE `temucraft_library_items` LIKE `item_template`;
INSERT INTO `temucraft_library_items` SELECT * FROM `item_template` WHERE `entry` = 6695;
UPDATE `temucraft_library_items` SET `entry` = @Reward, `name` = 'Scholarly Pendant', `bonding` = 1, `description` = 'A reward from the librarians for recovered books.', `VerifiedBuild` = 0 WHERE `entry` = 6695;
INSERT INTO `temucraft_library_items` SELECT * FROM `item_template` WHERE `entry` = 13087;
UPDATE `temucraft_library_items` SET `entry` = @Reward+1, `name` = 'Erudite\'s Amulet', `bonding` = 1, `description` = 'A reward from the librarians for recovered books.', `VerifiedBuild` = 0 WHERE `entry` = 13087;
INSERT INTO `temucraft_library_items` SELECT * FROM `item_template` WHERE `entry` = 2951;
UPDATE `temucraft_library_items` SET `entry` = @Reward+2, `name` = 'Field Researcher\'s Loop', `bonding` = 1, `description` = 'A reward from the librarians for recovered books.', `VerifiedBuild` = 0 WHERE `entry` = 2951;
INSERT INTO `temucraft_library_items` SELECT * FROM `item_template` WHERE `entry` = 13093;
UPDATE `temucraft_library_items` SET `entry` = @Reward+3, `name` = 'Philanthropist\'s Ring', `bonding` = 1, `description` = 'A reward from the librarians for recovered books.', `VerifiedBuild` = 0 WHERE `entry` = 13093;
INSERT INTO `temucraft_library_items` SELECT * FROM `item_template` WHERE `entry` = 19560;
UPDATE `temucraft_library_items` SET `entry` = @Reward+4, `name` = 'Truthseeker\'s Bow', `bonding` = 1, `description` = 'A reward from the librarians for recovered books.', `VerifiedBuild` = 0 WHERE `entry` = 19560;
INSERT INTO `temucraft_library_items` SELECT * FROM `item_template` WHERE `entry` = 13029;
UPDATE `temucraft_library_items` SET `entry` = @Reward+5, `name` = 'Crest of Elucidation', `bonding` = 1, `description` = 'A reward from the librarians for recovered books.', `VerifiedBuild` = 0 WHERE `entry` = 13029;
INSERT INTO `temucraft_library_items` SELECT * FROM `item_template` WHERE `entry` = 43661;
UPDATE `temucraft_library_items` SET `entry` = @Reward+6, `name` = 'Researcher\'s Night Light', `bonding` = 1, `description` = 'A reward from the librarians for recovered books.', `VerifiedBuild` = 0 WHERE `entry` = 43661;
INSERT INTO `temucraft_library_items` SELECT * FROM `item_template` WHERE `entry` = 11631;
UPDATE `temucraft_library_items` SET `entry` = @Reward+7, `name` = 'Antique Bulwark', `bonding` = 1, `description` = 'A reward from the librarians for recovered books.', `VerifiedBuild` = 0 WHERE `entry` = 11631;
INSERT INTO `temucraft_library_items` SELECT * FROM `item_template` WHERE `entry` = 13085;
UPDATE `temucraft_library_items` SET `entry` = @Reward+8, `name` = 'Museum Keeper\'s Chain', `bonding` = 1, `description` = 'A reward from the librarians for recovered books.', `VerifiedBuild` = 0 WHERE `entry` = 13085;
INSERT INTO `temucraft_library_items` SELECT * FROM `item_template` WHERE `entry` = 19539;
UPDATE `temucraft_library_items` SET `entry` = @Reward+9, `name` = 'Artifact Seeker\'s Pendant', `bonding` = 1, `description` = 'A reward from the librarians for recovered books.', `VerifiedBuild` = 0 WHERE `entry` = 19539;
INSERT INTO `item_template` SELECT * FROM `temucraft_library_items`;
DROP TEMPORARY TABLE `temucraft_library_items`;
