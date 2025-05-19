USE Northwind;
GO

-- This is a table-valued function where it just returns a table
-- without using and BEGIN/END block.
GO CREATE FUNCTION dbo.getProducts () RETURNS TABLE AS RETURN (
   SELECT
      ProductID,
      ProductName,
      QuantityPerUnit,
      UnitPrice,
      UnitsInStock
   FROM
      Products
)
GO
-- But when there is a logic or a condition to be checked, we need to use the BEGIN/END block.
-- This is the same function but with a condition.
CREATE FUNCTION dbo.filteredProducts (@minPrice MONEY)
RETURNS @result TABLE (
    ProductID INT,
    ProductName NVARCHAR(40),
    UnitPrice MONEY
)
AS
BEGIN
    INSERT INTO @result
    SELECT ProductID, ProductName, UnitPrice
    FROM Products
    WHERE UnitPrice >= @minPrice;

    RETURN;
END;
GO
------------------------------------------------------------

-- Create a scalar function - returns a single value 
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
