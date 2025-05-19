USE Games;

-- List all users and their total number of games in the GameList table
-- SELECT COUNT(GameID) AS "Total Games", UserID AS "User ID" FROM GameList
-- GROUP BY UserID
-- GO

SELECT * FROM Users
LEFT JOIN GameList ON Users.UserID = GameList.UserID
ORDER BY Users.UserID DESC;