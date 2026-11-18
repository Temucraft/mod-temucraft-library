-- mod-temucraft-library: player-facing texts. Translations go in module_string_locale (same module and id, plus the locale).
DELETE FROM `module_string` WHERE `module` = 'mod-temucraft-library';
INSERT INTO `module_string` (`module`, `id`, `string`) VALUES
('mod-temucraft-library', 1, '|cff8a4b00Books you have recovered: {} of {}.|r'),
('mod-temucraft-library', 2, '{} books: reward taken.'),
('mod-temucraft-library', 3, 'I''ve brought back {} books. (choose a reward)'),
('mod-temucraft-library', 4, '{} books: a reward from level {}.'),
('mod-temucraft-library', 5, '{} books: a reward waits for you.'),
('mod-temucraft-library', 6, 'Take {}?'),
('mod-temucraft-library', 7, 'Back'),
('mod-temucraft-library', 8, '|cffffcc00You''ve already recovered {}.|r'),
('mod-temucraft-library', 9, '|cffff8000Library book recovered:|r {} ({} of {}). The librarians in Stormwind and Undercity will want to hear about it.'),
('mod-temucraft-library', 10, '|cffff4c4cYour bags are full.|r');
