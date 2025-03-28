USE Games;

SELECT * FROM gamelist
WHERE gameType IN ('Horror', 'FPS')
AND achievementCount > 25;

SELECT gameType, SUM(hoursPlayed) FROM gamelist
WHERE gameType IN ('Horror', 'FPS')
GROUP BY gameType

SELECT gameName, gameType, hoursPlayed FROM gamelist
WHERE gameType IN ('Horror', 'FPS')
AND hoursPlayed > 10
ORDER BY hoursPlayed DESC;