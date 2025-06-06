USE Games;
GO

-- SELECT 
--     column1,
--     column2,
--     CASE 
--         WHEN condition1 THEN result1
--         WHEN condition2 THEN result2
--         ELSE default_result
--     END AS new_column_name
-- FROM table_name;

SELECT
   GameName,
   HoursPlayed,
   CASE 
      WHEN HoursPlayed >= 300 THEN 'Hardcore'
      WHEN HoursPlayed >= 100 THEN 'Regular'
      ELSE 'Casual'
   END AS PlayerCategory
FROM GameList;
GO

------------------------------------------------------

SELECT GameID,
   CASE 
      WHEN AchievementCount >= 100 THEN 'High Achiever'
      WHEN AchievementCount BETWEEN 50 AND 99 THEN 'Moderate Achiever'
      ELSE 'Newbie'
   END AS AchievementLevel
FROM GameList
WHERE GameType = 'Action';

------------------------------------------------------

SELECT ProductName,
   CASE
      WHEN ReorderLevel > UnitsInStock THEN ReorderLevel - UnitsInStock
      ELSE 0
   END AS reorderAmount
FROM Products