DECLARE @today DATE = GETDATE();
DECLARE @birthDate DATE = '2000-06-07';

-- Print current date and time --

DECLARE @age INT;

SET @age = DATEDIFF(YEAR, @birthDate, @today);

PRINT 'Age: ' + CAST(@age AS NVARCHAR(3));

-- Calculate score and print grade --

DECLARE @point INT = 85;
DECLARE @note NVARCHAR(10);

SET @note = CASE
             WHEN @point >= 90 THEN 'AA'
             WHEN @point >= 80 THEN 'BA'
             ELSE 'FF'
           END;

PRINT 'Note: ' + @note;

-- Find how many days left until a specific date --

DECLARE @celeb DATE = '2025-06-06';
DECLARE @daysLeftToCeleb INT;

SET @daysLeftToCeleb = DATEDIFF(DAY, @today, @celeb);

PRINT 'Days Left to celeb: ' + CAST(@daysLeftToCeleb AS NVARCHAR);

-- Find how many days left with given birth --

DECLARE @thisYearsBirthday DATE = DATEFROMPARTS(YEAR(@today), MONTH(@birthDate), DAY(@birthDate));
DECLARE @daysLeft INT;

SET @daysLeft = DATEDIFF(DAY, @today, @thisYearsBirthday);
PRINT 'Days until birthday: ' + CAST(@daysLeft AS NVARCHAR);