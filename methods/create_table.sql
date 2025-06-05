
-- | Keyword / Clause     | Purpose                                                               |
-- | -------------------- | --------------------------------------------------------------------- |
-- | `INT IDENTITY(1,1)`  | Auto-incrementing number, starts at 1, increments by 1                |
-- | `PRIMARY KEY`        | Uniquely identifies each row in the table                             |
-- | `NOT NULL`           | Field must have a value                                               |
-- | `UNIQUE`             | No duplicates allowed in this column                                  |
-- | `NULL`               | Field can be empty                                                    |
-- | `CHECK (...)`        | Adds validation rules on allowed values                               |
-- | `DECIMAL(10,2)`      | Decimal number, 10 total digits, 2 after the dot                      |
-- | `FOREIGN KEY`        | Links to another table's column                                       |
-- | `REFERENCES`         | Defines which table/column the foreign key points to                  |
-- | `ON UPDATE CASCADE`  | Automatically update this column if referenced column value changes   |
-- | `ON DELETE SET NULL` | Set this column to NULL if referenced row is deleted                  |
-- | `CONSTRAINT`         | Names a constraint (e.g., foreign key) — optional but helps debugging |

USE Games;

CREATE TABLE
    Users (
        UserID INT IDENTITY (1, 1) PRIMARY KEY,
        Username VARCHAR(100) NOT NULL UNIQUE,
        Email VARCHAR(255) NOT NULL UNIQUE CHECK (LEN (Email) >= 5), --<-- Inline check constraint for email length
        JoinDate DATE DEFAULT GETDATE (),
        LastLogin DATETIME,
        
        -- Create a constraint
        -- Or you can use inline check like above
        CONSTRAINT CK_Email_Length CHECK (LEN(Email) >= 5),

        -- Check constraint for JoinDate
        CHECK (JoinDate <= GETDATE ()),
    );

---------------------------------------------------

CREATE TABLE
    GameList (
        -- Primary Key
        GameID INT IDENTITY (1, 1) PRIMARY KEY,

        -- Foreign Key to Users table
        UserID INT NOT NULL,

        GameName VARCHAR(255) NOT NULL,
        GameType VARCHAR(100),
        HoursPlayed INT CHECK (HoursPlayed >= 0),
        AchievementCount INT CHECK (AchievementCount >= 0),
        LastPlayed DATE,
        CreatedAt DATETIME DEFAULT GETDATE (),

        -- Foreign Key constraint
        -- FK_GameList_User is the name of the foreign key constraint
        -- REFERENCES Users (UserID) establishes the relationship with the Users table, which is where the foreign key is pointing to
        CONSTRAINT FK_GameList_User 
            FOREIGN KEY (UserID) 
            REFERENCES Users (UserID) 
            ON DELETE CASCADE 
            ON UPDATE CASCADE
    );

---------------------------------------------------

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