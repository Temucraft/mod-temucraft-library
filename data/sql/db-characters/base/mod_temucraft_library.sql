-- mod-temucraft-library: characters tables
CREATE TABLE IF NOT EXISTS `mod_temucraft_library_book` (
    `guid` INT UNSIGNED NOT NULL,
    `book` TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (`guid`, `book`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mod_temucraft_library_reward` (
    `guid`      INT UNSIGNED NOT NULL,
    `milestone` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`guid`, `milestone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
