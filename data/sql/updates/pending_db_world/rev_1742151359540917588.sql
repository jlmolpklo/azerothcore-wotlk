-- fixes quest "Pushed Too Far" not having a prerequisite
-- https://github.com/azerothcore/azerothcore-wotlk/issues/21553
UPDATE `quest_template_addon` SET `PrevQuestID` = 12867 WHERE (`ID` = 12869);
