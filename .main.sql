USE Northwind;
GO

SELECT * FROM GetCustomersByCountry('Germany');

EXEC [Sales by Year]
   @Beginning_Date = '1996-01-01',
   @Ending_Date = '2000-12-31';