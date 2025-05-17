USE Games;

UPDATE gamelist
SET gameType = 'Survival'
WHERE game_id = 5;

UPDATE gamelist
SET website = 'https://www.counter-strike.net/'
WHERE gameName = 'Counter-Strike 2';

SELECT * FROM gamelist;