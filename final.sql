USE Games
GO

----------------------------------------------------------------
----------------------------------------------------------------

SELECT
   CASE
      WHEN Age BETWEEN 18 AND 24 THEN '18-24'
      WHEN Age BETWEEN 24 AND 39 THEN '24-39'
      WHEN AGE BETWEEN 39 AND 59 THEN '39-59'
      ELSE 'Others'
   END AS AgeGroup,
   COUNT(*) AS Total
FROM Users
GROUP BY 
   CASE
      WHEN Age BETWEEN 18 AND 24 THEN '18-24'
      WHEN Age BETWEEN 24 AND 39 THEN '24-39'
      WHEN Age BETWEEN 39 AND 59 THEN '39-59'
      ELSE 'Others'
   END
GO

-- Same thing but with CTE to prevent repeating the CASE statement

WITH AgeGroups AS (
  SELECT 
    CASE
      WHEN Age BETWEEN 18 AND 24 THEN '18-24'
      WHEN Age BETWEEN 25 AND 39 THEN '25-39'
      WHEN Age BETWEEN 40 AND 60 THEN '40-60'
      ELSE 'Other'
    END AS AgeGroup
  FROM Users
)

SELECT AgeGroup, COUNT(*) AS CountInGroup
FROM AgeGroups
GROUP BY AgeGroup;

----------------------------------------------------------------
----------------------------------------------------------------

IF EXISTS (SELECT * FROM Users WHERE Age BETWEEN 18 AND 24)
BEGIN
    SELECT '18-24' AS AgeGroup, COUNT(*) AS CountInGroup
    FROM Users
    WHERE Age BETWEEN 18 AND 24
END

IF EXISTS (SELECT * FROM Users WHERE Age BETWEEN 25 AND 39)
BEGIN
    SELECT '25-39' AS AgeGroup, COUNT(*) AS CountInGroup
    FROM Users
    WHERE Age BETWEEN 25 AND 39
END

IF EXISTS (SELECT * FROM Users WHERE Age BETWEEN 40 AND 60)
BEGIN
    SELECT '40-60' AS AgeGroup, COUNT(*) AS CountInGroup
    FROM Users
    WHERE Age BETWEEN 40 AND 60
END