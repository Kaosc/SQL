USE Games;

-- Create Users table
CREATE TABLE
    Users (
        -- Unique user ID with auto-increment
        UserID INT IDENTITY (1, 1) PRIMARY KEY,
        -- Username must be unique and not null
        Username VARCHAR(100) NOT NULL UNIQUE,
        -- Email must be unique and not null
        Email VARCHAR(255) NOT NULL UNIQUE,
        -- Optional join date, defaults to current date
        JoinDate DATE DEFAULT GETDATE (),
        -- Check to ensure email has at least 5 characters
        CHECK (LEN (Email) >= 5)
    );

-- Create GameList table with a foreign key reference to Users
CREATE TABLE
    GameList (
        -- Primary Key
        GameID INT IDENTITY (1, 1) PRIMARY KEY,
        -- Foreign Key to Users table
        UserID INT NOT NULL,
        -- Game details
        GameName VARCHAR(255) NOT NULL,
        GameType VARCHAR(100),
        HoursPlayed INT CHECK (HoursPlayed >= 0),
        AchievementCount INT CHECK (AchievementCount >= 0),
        LastPlayed DATE,
        CreatedAt DATETIME DEFAULT GETDATE (),
        -- Foreign Key constraint
        -- FK_GameList_User is the name of the foreign key constraint
        -- REFERENCES Users (UserID) establishes the relationship with the Users table, which is where the foreign key is pointing to
        CONSTRAINT FK_GameList_User FOREIGN KEY (UserID) REFERENCES Users (UserID) ON DELETE CASCADE ON UPDATE CASCADE
    );

--
CREATE TABLE
    GameReviews (
        ReviewID INT IDENTITY (1, 1) PRIMARY KEY,
        GameID INT NOT NULL,
        UserID INT NOT NULL,
        Review TEXT NOT NULL,
        ReviewViews INT CHECK (ReviewViews >= 0),
        CreatedAt DATETIME DEFAULT GETDATE (),
        CONSTRAINT FK_GameReviews_Game FOREIGN KEY (GameID) REFERENCES GameList (GameID),
        CONSTRAINT FK_GameReviews_User FOREIGN KEY (UserID) REFERENCES Users (UserID)
    )