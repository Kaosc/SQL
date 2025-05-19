USE Northwind;
GO

IF EXISTS (SELECT * FROM Customers WHERE Country = 'Turkey')
   BEGIN
      PRINT 'Turkey Customers Found'
   END
ELSE IF 
   EXISTS (SELECT * FROM Customers WHERE Country = 'USA')
   BEGIN
      DECLARE @CustomerCount INT
      SET @CustomerCount = (SELECT COUNT(*) FROM Customers WHERE Country = 'USA')
      PRINT 'USA Customers Found: ' + CAST(@CustomerCount AS VARCHAR(10))
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
