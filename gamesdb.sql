--GameList:: GameID, UserID, GameName, GameType, GameDate, HoursPlayed, AchievementCount, LastPlayed, CreatedAt
--Users:: UserID, UserName, Email, JoinDate
--GameReviews:: ReviewID, GameID, UserID, Review, ReviewViews, CreatedAt

USE Games;
GO

-------------------- Q1 --------------------
-- Define a procedure: This procedure will take a parameter `GameID` and return all game reviews (`GameReviews`) belonging to it.

CREATE PROCEDURE listReviewsByGame (@GameID INT)
AS 
BEGIN 
   SELECT * FROM GameReviews WHERE GameReviews.GameID = @GameID
END
GO

EXEC dbo.listReviewsByGame @GameID = 1
GO

-------------------- Q2 --------------------
-- Define a function for the Games database that returns the total hours played (HoursPlayed) for a given UserID, with a result of type INT.

CREATE FUNCTION totalHoursPlayed (@UserID INT)
RETURNS INT
AS 
BEGIN
   DECLARE @totalHoursPlayed INT = 0;
   SELECT @totalHoursPlayed = SUM(hoursPlayed) FROM GameList WHERE GameList.UserID = @UserID
   RETURN @totalHoursPlayed;
END
GO

-- Call scalar-function
DECLARE @total INT = dbo.totalHoursPlayed(1)
PRINT CAST(@total AS NVARCHAR)
GO

----------- or ----------

CREATE FUNCTION totalHoursPlayedAsTable (@UserID INT)
RETURNS TABLE
AS
RETURN (
   SELECT Users.Username, Users.UserID, SUM(hoursPlayed) AS TotalHoursPlayed 
   FROM GameList 
   JOIN Users ON GameList.UserID = Users.UserID 
   GROUP BY Users.UserID, Users.Username HAVING Users.UserID = @UserID
);
GO

-- Call table-valued function
SELECT * FROM totalHoursPlayedAsTable(2);
GO

-------------------- Q3 --------------------
-- Write a query that displays the average number of achievements (AchievementCount) for each game type, grouped by game type (GameType) in the GameList table.

SELECT GameType, AVG(AchievementCount) "Average Achievement"
FROM GameList
GROUP BY GameType
GO