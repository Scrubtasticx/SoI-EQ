ALTER TABLE `botbuffs`  ADD COLUMN `CorruptionCounters` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `CurseCounters`;
ALTER TABLE `bots`  ADD COLUMN `Corrup` SMALLINT(5) NOT NULL DEFAULT '0' AFTER `PR`;
ALTER TABLE `npc_types`  ADD COLUMN `Corrup` SMALLINT(5) NOT NULL DEFAULT '0' AFTER `PR`;