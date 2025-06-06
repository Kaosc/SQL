


-- WITH
-- WITH is used to create a temporary result set that can be referenced within a SELECT, INSERT, UPDATE, or DELETE statement. It makes complex queries more readable by breaking them into smaller, named, and reusable subqueries.

-- WITH cte_name (column1, column2, ...) AS (
--     subquery
-- )
-- SELECT columns
-- FROM cte_name
-- WHERE condition;

WITH TopGames AS (
    SELECT TOP 10 * FROM GameList
    ORDER BY hoursPlayed DESC
)

SELECT *
FROM TopGames -- <- Using the CTE to select top games
WHERE hoursPlayed > 100