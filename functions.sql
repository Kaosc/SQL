USE Northwind;
GO

-- Inline
IF EXISTS (SELECT * FROM Customers WHERE Country = 'USA')
   BEGIN
      PRINT 'USA Customers Found'
   END
ELSE
   BEGIN
      PRINT 'No USA Customers Found'
   END
GO

-- Create a scalar function
CREATE FUNCTION GetCustomerCount()
RETURNS INT
AS
BEGIN
    DECLARE @CustomerCount INT;
    SELECT @CustomerCount = COUNT(*) FROM Customers;
    RETURN @CustomerCount;
END
GO

-- Create a table-valued function
CREATE FUNCTION GetCustomersByCountry(@Country NVARCHAR(50))
RETURNS TABLE
AS
RETURN
   (
      SELECT * FROM Customers WHERE Country = @Country
   );
GO

-- Create a table-valued function
CREATE FUNCTION GetCustomersSummary(@Country NVARCHAR(50))
RETURNS @Result TABLE (CustomerID INT, CompanyName NVARCHAR(100))
AS
BEGIN
   INSERT INTO @Result
   SELECT CustomerID, CompanyName
   FROM Customers
   WHERE Country = @Country;

   RETURN;
END
GO


-- use the function
SELECT * FROM GetCustomersByCountry('Germany');

-- use the function
EXEC [Sales by Year]
   @Beginning_Date = '1996-01-01',
   @Ending_Date = '2000-12-31';

-- Delete the function
DROP FUNCTION GetCustomersSummary;
GO