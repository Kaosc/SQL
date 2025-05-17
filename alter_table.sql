USE Games;

-- Add new column
ALTER TABLE gamelist ADD website TEXT;

-- Change column data type 
ALTER TABLE gamelist ALTER COLUMN website TEXT;

-- Rename column 
EXEC sp_rename 'gamelist.gameType', 'gameTypeNew', 'COLUMN';

SELECT * FROM gamelist;