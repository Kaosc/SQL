UPDATE Games
SET lastPlayed = '2025-02-5'
WHERE game_id = 1;

-- Update specific column in a row
UPDATE Games
SET gameType = 'SURVIVAL'
WHERE game_id = 5;