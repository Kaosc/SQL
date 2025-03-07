-- Add new column 
ALTER TABLE Games ADD gameType TEXT;

-- Change column data type 
ALTER TABLE Games
ALTER COLUMN gameType VARCHAR(50);