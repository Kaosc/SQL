USE Games;

INSERT INTO Users (
    Username,
    Email
)
VALUES
    ('kaosc', 'kaosc@example.com'),
    ('moonlight', 'moonlight@example.com'),
    ('phantom', 'phantom@example.com');
GO

INSERT INTO GameList (
    UserID,
    GameName,
    GameType,
    HoursPlayed,
    AchievementCount,
    LastPlayed
)
VALUES
    (1, 'Counter-Strike 2', 'FPS', 120, 45, '2025-01-10'),
    (2, 'PLAYERUNKNOWN''S BATTLEGROUNDS', 'Battle Royale', 250, 35, '2025-03-15'),
    (3, 'Cyberpunk 2077', 'RPG', 180, 55, '2024-06-20');
GO

INSERT INTO GameReviews (
    GameID,
    UserID,
    Review,
    ReviewViews,
    CreatedAt
)
VALUES 
    (1, 1, 'Great game with amazing graphics!', 100, '2025-01-15'),
    (2, 1, 'Intense gameplay and great mechanics.', 150, '2025-02-20'),
    (3, 2, 'A masterpiece in storytelling.', 200, '2025-03-25');
