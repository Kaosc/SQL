-- T-SQL Cheatsheet: DECLARE, SET, PRINT, CASE, BEGIN, BREAK

-- Variable Declaration and Assignment
DECLARE @age INT;
DECLARE @name NVARCHAR(50);

SET @age = 25;
SET @name = 'John';

-- Printing Values
PRINT @name;
PRINT 'Age: ' + CAST(@age AS NVARCHAR);

-- Date Calculation (Age from Birthdate)
DECLARE @birthDate DATE = '2000-05-18';
DECLARE @today DATE = GETDATE();
DECLARE @calculatedAge INT;

SET @calculatedAge = DATEDIFF(YEAR, @birthDate, @today);
PRINT 'Age: ' + CAST(@calculatedAge AS NVARCHAR);

-- CASE Expression (Grading Example)
DECLARE @score INT = 85;
DECLARE @grade NVARCHAR(10);

SET @grade = CASE
               WHEN @score >= 90 THEN 'A'
               WHEN @score >= 80 THEN 'B'
               ELSE 'F'
             END;

PRINT 'Your grade: ' + @grade;

-- Example Query: Days Until Eid
DECLARE @eidDate DATE = '2025-06-06';
DECLARE @daysLeft INT;

SET @daysLeft = DATEDIFF(DAY, GETDATE(), @eidDate);
PRINT 'Days until Eid: ' + CAST(@daysLeft AS NVARCHAR);

-- BEGIN...END Block with WHILE Loop and BREAK
DECLARE @i INT = 1;

WHILE @i <= 5
BEGIN
    IF @i = 3
        BREAK;

    PRINT 'Number: ' + CAST(@i AS NVARCHAR);
    SET @i = @i + 1;
END
