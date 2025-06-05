-- GETDATE()
-- Results in the current date and time in SQL Server.
SELECT GETDATE()

-- DATEDIFF(datepart, start_date, end_date)
-- Returns the difference between two dates in the specified date part (e.g., year, month, day).
SELECT DATEDIFF(DAY, '2023-01-01', '2023-12-31') AS DaysDifference --> 365

-- DATEADD(datepart, number, date)
-- Adds a specified number of date parts to a date.
SELECT DATEADD(MONTH, 1, '2023-01-01') AS NextMonthDate --> 2023-02-01

-- DATEPART(datepart, date)
-- Returns a specific part of a date (e.g., year, month, day, weekday, hour, minute, second).
SELECT DATEPART(YEAR, '2023-12-31') AS YearPart --> 2023

-- DATEFROMPARTS(year, month, day)
-- Creates a date from individual year, month, and day components.
SELECT DATEFROMPARTS(2023, 12, 31) AS SpecificDate --> 2023-12-31

-- FORMAT(value, format [, culture])
-- Formats a date or number according to a specified format and culture.
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd') AS FormattedDate --> 2023-12-31 (or current date)

-- CONVERT(data_type, expression [, style])
-- Converts an expression to a specified data type, with optional style for formatting.
SELECT CONVERT(VARCHAR, GETDATE(), 23) AS FormattedDate --> 2023-12-31 (or current date)

-- ISDATE(expression)
-- Checks if an expression can be converted to a date.
SELECT ISDATE('2023-12-31') AS IsValidDate --> 1 (true)

-- EOMONTH(start_date [, month_to_add])
-- Returns the last day of the month that contains the specified date.
SELECT EOMONTH('2023-01-15') AS EndOfMonth --> 2023-01-31
