--Categories:: CategoryID, CategoryName, Description, Picture
--CustomerCustomerDemo:: CustomerID, CustomerTypeID
--CustomerDemographics:: CustomerTypeID, CustomerDesc
--Customers:: CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax
--Employees:: EmployeeID, LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, Extension, Photo, Notes, ReportsTo, PhotoPath
--EmployeeTerritories:: EmployeeID, TerritoryID
--Order Details:: OrderID, ProductID, UnitPrice, Quantity, Discount
--Orders:: OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry
--Products:: ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
--Region:: RegionID, RegionDescription
--Shippers:: ShipperID, CompanyName, Phone
--Suppliers:: SupplierID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax, HomePage
--Territories:: TerritoryID, TerritoryDescription, RegionID
USE Northwind;
GO

---------------------- Q1 ------------------------
-- How do you query the latest order date of a customer's order based on the `OrderDate` information in the Northwind database?

SELECT Customers.ContactName, MAX(OrderDate) AS "Last Order Date" FROM Orders
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.ContactName
GO

---------------------- Q2 ----------------------
-- Write a query that calculates the products that need to be reordered and how many of these products need to be ordered by comparing the `ReorderLevel` and `UnitsInStock` columns of the products in the Products table with today's date.

SELECT
   ProductName,
   (ReorderLevel - UnitsInStock) as orderCount
FROM
   Products
WHERE
   UnitsInStock < ReorderLevel
GO
----------- or ----------

SELECT
   ProductName,
   CASE
      WHEN ReorderLevel > UnitsInStock THEN ReorderLevel - UnitsInStock
      ELSE 0
   END AS reorderAmount
FROM
   Products
GO
-------------------- Q3----------------------
-- Write a query that lists the total number of employees in each country, grouping the employees in the Employees table by the `Country` field.

SELECT Country, COUNT(*) AS EmployeeCount 
FROM Employees 
GROUP BY Country
GO

---------------------- Q4 --------------------
-- Write a query that displays which customer (CustomerID and CompanyName) placed each order using the Orders and Customers tables.

SELECT Customers.CustomerID, Customers.CompanyName, Orders.OrderID FROM Orders
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GO

-------------------- Q5 --------------------
-- For each order in the Orders table, write a query that shows how many days ago the order was placed (based on OrderDate). (Hint: Use GETDATE() and DATEDIFF().)

SELECT OrderID, DATEDIFF(DAY, OrderDate, GETDATE()) AS 'Ordered Days Ago' FROM Orders
GO

-------------------- Q6 --------------------
-- Write a query in the Northwind database that lists the regions for which employees are responsible. Related tables: Employees, EmployeeTerritories, Territories, Region.

SELECT DISTINCT Employees.EmployeeID, Employees.FirstName, Region.RegionDescription FROM Employees
JOIN EmployeeTerritories ON Employees.EmployeeID =EmployeeTerritories.EmployeeID
JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID
JOIN Region ON Territories.RegionID = Region.RegionID
GO

-------------------- Q7 --------------------
-- Define a procedure: It will take a CustomerID as a parameter and calculate and list the total amount of orders for that customer (Order Details: UnitPrice * Quantity * (1 - Discount)). Then call it.

CREATE PROCEDURE totalCostByCustomer @CustomerID NVARCHAR(5)
AS
BEGIN
SELECT CompanyName, ProductID, (UnitPrice * Quantity * (1 - Discount)) AS "Total Cost"
   FROM Customers
   JOIN Orders ON Orders.CustomerID = Customers.CustomerID
   JOIN [Order Details] On Orders.OrderID = [Order Details].OrderID
   WHERE Customers.CustomerID = @CustomerID
END
GO

-- Call it
EXEC totalCostByCustomer @CustomerID = 'ALFKI'
GO