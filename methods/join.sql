
-- INNER will only return rows that have matching values in both tables
-- LEFT will return all rows from the left table (GameReviews), and the matched rows from the right table (GameList)
-- RIGHT will return all rows from the right table (GameList), and the matched rows from the left table (GameReviews)
-- Think like you are moving the tables to given keyword (INNER(MID), LEFT, RIGHT) and the matched rows will be returned
-- On full join, all rows from both tables will be returned, and NULLs will be used to fill in the gaps where there are no matches

-- List order count  per customer with a specific contact name
USE Northwind;
GO

SELECT COUNT(Orders.OrderID), Customers.contactName
FROM Orders
   JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.contactName
HAVING Customers.contactName = 'Liz Nixon';
GO

USE Games;
GO

SELECT *
FROM Users
   LEFT JOIN GameList ON Users.UserID = GameList.UserID
ORDER BY Users.UserID DESC;
GO

-- List the all games that have not been reviewed by any user

SELECT *
FROM GameReviews
   RIGHT JOIN GameList ON GameReviews.GameID = GameList.GameID

-- List all users and their total number of games in the GameList table

SELECT COUNT(GameID) AS "Total Games", UserID AS "User ID"
FROM GameList
GROUP BY UserID
GO

-- List all users and their total number of games in the GameList table, including users with no games
SELECT GameList.GameID, Users.UserID, GameReviews.ReviewID, Users.Username, Gamelist.GameName, GameReviews.Review
FROM GameReviews
   RIGHT JOIN Users ON GameReviews.UserID = Users.UserID
   RIGHT JOIN GameList ON GameReviews.GameID = GameList.GameID
WHERE GameReviews.Review IS NULL
GO