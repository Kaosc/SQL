USE Northwind;
GO

------------ CREATING STORED FUNCTIONS ------------

-- This is a table-valued function where it just returns a table
-- without using and BEGIN/END block.
CREATE FUNCTION getProducts(@ProductID INT) 
RETURNS TABLE 
AS 
RETURN ( -- Think this is a returning React Component where it just a component it self
   SELECT
      ProductID,
      ProductName,
      QuantityPerUnit,
      UnitPrice,
      UnitsInStock
   FROM
      Products
   WHERE
      ProductID = @ProductID
)
GO

-- Multi-statement table-valued function. - RETURNING A TABLE WITH A CONDITION (BEGIN/END BLOCK)
-- But when there is a logic or a condition to be checked, we need to use the BEGIN/END block.
-- This is the same function but with a condition.
CREATE FUNCTION filteredProducts(@minPrice INT)
RETURNS @result TABLE (
    ProductID INT,
    ProductName NVARCHAR(40),
    UnitPrice INT
)
AS
BEGIN -- Think this like returning a react component but we use a condition to check inside like 
      -- defining const inside it and other kind of shit
    INSERT INTO @result -- insert into the table variable -- This is why we need to use the BEGIN/END block
    SELECT ProductID, ProductName, UnitPrice
    FROM Products
    WHERE UnitPrice >= @minPrice;

    RETURN; 
    -- return the table variable -- 
    -- @result is not like a scalar variable, it's a special table variable that the function is designed to return. So no need to return it.
END;
GO

-- Create a scalar function - RETURNING A SINGLE VALUE
CREATE FUNCTION GetCustomerCount()
RETURNS INT
AS
BEGIN
    DECLARE @CustomerCount INT;
    SELECT @CustomerCount = COUNT(*) FROM Customers;
    RETURN @CustomerCount;
END
GO

------------ USING THE FUNCTIONS ------------

-- use the function in a SELECT statement
SELECT * FROM GetCustomersByCountry('Germany');

-- use the function with exec command
EXEC GetCustomerCount 

-- use the function with a parameter
EXEC filteredProducts @Beginning_Date = '1996-01-01', @Ending_Date = '2000-12-31';

-- DELETE THE FUNCTION
DROP FUNCTION GetCustomersSummary;
