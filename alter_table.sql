USE Games;

-- Add new column 
-- ALTER TABLE Games ADD gameType TEXT;

-- -- Change column data type 
-- ALTER TABLE Games
-- ALTER COLUMN gameType VARCHAR(50);

-- Rename column 

-- SQL Server (MSSQL)
EXEC sp_rename 'gamelist.gameType', 'gameTypeNew', 'COLUMN';

-- MySQL 8.0+ & MariaDB 10.5+PostgreSQL
-- ALTER TABLE gamelist 
-- RENAME COLUMN gameType TO gameType2;