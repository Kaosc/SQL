/**
 *HAVING (Used with GROUP BY to filter the result set based on a condition)
 */
SELECT
   gameType,
   SUM(hoursPlayed)
FROM
   Games
GROUP BY
   gameType
HAVING
   SUM(hoursPlayed) > 200;