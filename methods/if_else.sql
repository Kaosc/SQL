USE Northwind;
GO

DECLARE @Country NVARCHAR(50) = 'USA';

IF @Country = 'Turkey'
   BEGIN
      PRINT 'Turkey Customers Found'
   END
ELSE IF @Country = 'USA'
   BEGIN
      DECLARE @CustomerCount1 INT
      SET @CustomerCount1 = (SELECT COUNT(*) FROM Customers WHERE Country = 'USA')
      PRINT 'USA Customers Found: ' + CAST(@CustomerCount1 AS VARCHAR(10))
   END
ELSE IF @Country = 'Mexico'
   BEGIN
      PRINT 'Mexico Customers Found'
   END
ELSE
   BEGIN
      PRINT 'No Customers Found'
   END

-- EXISTS used here cause we need a boolean value to check if the condition is true or false

IF EXISTS (SELECT * FROM Customers WHERE Country = 'Turkey')
   BEGIN
      PRINT 'Turkey Customers Found'
   END
ELSE IF 
   EXISTS (SELECT * FROM Customers WHERE Country = 'USA')
   BEGIN
      DECLARE @CustomerCount2 INT
      SET @CustomerCount2 = (SELECT COUNT(*) FROM Customers WHERE Country = 'USA')
      PRINT 'USA Customers Found: ' + CAST(@CustomerCount2 AS VARCHAR(10))
   END
ELSE IF 
   EXISTS (SELECT * FROM Customers WHERE Country = 'Mexico')
   BEGIN
      PRINT 'Mexico Customers Found'
   END
ELSE
   BEGIN
      PRINT 'No Customers Found'
   END
GO
