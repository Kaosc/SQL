USE Northwind;
GO

-- CREATE PROCEDURE

CREATE PROCEDURE SelectAllCustomers
AS
BEGIN
	SELECT * FROM Customers
END
GO

-- USING PROCEDURE

EXEC SalesByCategory
   @CategoryName = 'Beverages',
   @OrdYear = 1997
GO