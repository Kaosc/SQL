USE Northwind;
GO

-- without parameters
CREATE PROCEDURE GetAllCustomers
AS
BEGIN
    SELECT * FROM Customers
END
GO

-- with parameters
CREATE PROCEDURE GetCustomerOrders
    @CustomerID NVARCHAR(5)
AS
BEGIN
    SELECT * FROM Orders WHERE CustomerID = @CustomerID
END
GO

-- with default parameters
CREATE PROCEDURE GetCustomersByCity
    @City NVARCHAR(15) = NULL
AS
BEGIN
    IF @City IS NULL
        SELECT * FROM Customers
    ELSE
        SELECT * FROM Customers WHERE City = @City
END
GO

-- with OUTPUT parameters
CREATE PROCEDURE GetOrderCountByCustomer
    @CustomerID NVARCHAR(5),
    @TotalOrders INT OUTPUT
AS
BEGIN
    SELECT @TotalOrders = COUNT(*) FROM Orders WHERE CustomerID = @CustomerID
END
GO

-- with TRY...CATCH
CREATE PROCEDURE SafeDivide
    @A INT, 
    @B INT
AS
BEGIN
    BEGIN TRY
        SELECT @A / @B AS Result
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage
    END CATCH
END
GO

-- with dynamic SQL
CREATE PROCEDURE GetTableData
    @TableName NVARCHAR(128)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)
    SET @SQL = 'SELECT TOP 10 * FROM ' + QUOTENAME(@TableName)
    EXEC sp_executesql @SQL
END
GO

---- USING THE PROCEDURES ----

-- without parameters
EXEC GetAllCustomers;

-- with parameters
EXEC GetCustomerOrders @CustomerID = 'ALFKI';

-- with default parameter
EXEC GetCustomersByCity; -- Tüm müşteriler
EXEC GetCustomersByCity @City = 'Berlin'; -- Berlin'dekiler

-- with OUTPUT parameter
DECLARE @Count INT;
EXEC GetOrderCountByCustomer @CustomerID = 'ALFKI', @TotalOrders = @Count OUTPUT;
PRINT @Count;

-- with TRY...CATCH
EXEC SafeDivide @A = 10, @B = 2;   -- Geçerli
EXEC SafeDivide @A = 10, @B = 0;   -- Hata yakalanır

-- with dynamic SQL
EXEC GetTableData @TableName = 'Products';
