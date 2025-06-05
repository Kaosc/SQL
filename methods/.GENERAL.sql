USE Games;
GO

-- Create database
CREATE DATABASE Games;

-- Delete database
DROP DATABASE Games;

-- Delete entire table
DROP TABLE gamelist;

-- Clear table data without deleting the table structure
TRUNCATE TABLE GameReviews;

-- Add new column
ALTER TABLE gamelist ADD website TEXT;

-- Delete entire column
ALTER TABLE gamelist DROP COLUMN website;

-- Rename column 
EXEC sp_rename 'gamelist.gameType', 'gameTypeNew', 'COLUMN';

-- Change column data type 
ALTER TABLE gamelist ALTER COLUMN GameType NVARCHAR(50);

-- Update specific row
UPDATE gamelist SET gameType = 'Survival' WHERE game_id = 5;

-- Delete row with specific condition
DELETE FROM Games WHERE game_id = 2;

-- TRY CATCH 
BEGIN TRY
   PRINT 'Some execution code here';
END TRY
BEGIN CATCH
   PRINT 'An error occurred:';
END CATCH

-- UNION
-- The UNION operator is used to combine the result-set of two or more SELECT statements.
   -- Every SELECT statement within UNION must have the same number of columns
   -- The columns must also have similar data types
   -- The columns in every SELECT statement must also be in the same order
SELECT UserID FROM Users UNION SELECT GameID FROM GameList;

-- GOTO
-- Even if the GOTO statement is not executed, the PRINT statement under SkipPart will be printed.
DECLARE @x INT = 1;

IF @x = 1
   GOTO SkipPart;

PRINT 'This will not be printed.';

SkipPart:
PRINT 'This will be printed.';

-- GROUP BY
SELECT COUNT(OrderID) AS orderCount, ContactName FROM Orders
   JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY ContactName
ORDER BY orderCount DESC;

-- HAVING
SELECT gameType, SUM(hoursPlayed) FROM Games
GROUP BY gameType
HAVING SUM(hoursPlayed) > 200;

-- IN
-- The IN operator is used to specify multiple values in a WHERE clause.
SELECT * FROM GameList
WHERE GameType IN ('Action', 'Adventure');

-- TOP
-- The TOP clause is used to specify the number of records to return.
SELECT TOP 5 * FROM GameList
ORDER BY hoursPlayed DESC;

-- TOP PERCENT
-- The TOP PERCENT clause is used to specify the percentage of records to return.
SELECT TOP 50 PERCENT * FROM Customers;