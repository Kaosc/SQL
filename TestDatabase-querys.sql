USE testdb;
--DROP TABLE Games;

--CREATE TABLE Games (
--    game_id int,
--    gameName TEXT,
--    hoursPlayed int,
--    achievementCount int
--);

-- DELETE
--DELETE FROM Games WHERE game_id = 2;

-- ADD COLUMN
-- ALTER TABLE Games
-- ADD gameType TEXT;

-- UPDATE COLUMN NAME

-- SQL:
--ALTER TABLE Games RENAME COLUMN lastPlayed to lastPlayedOn;

-- SQL SERVER: 
--EXEC sp_rename 'Games.lastPlayedOn',  'lastPlayed', 'COLUMN';

-- update specific row
-- UPDATE Games SET gameType = 'SURVIVAL' WHERE game_id =5;

-- update column name --

-- UPDATE Games
-- SET lastPlayed = '2025-02-5'
-- WHERE game_id = 1;

-- HAVING (Used with GROUP BY to filter the result set based on a condition) --
-- SELECT gameType, SUM(hoursPlayed) FROM Games GROUP BY gameType HAVING SUM(hoursPlayed) > 200;

-- Change column data type -- 
--  ALTER TABLE Games ALTER COLUMN gameType VARCHAR(50);

SELECT * FROM Games;