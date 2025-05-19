USE NorthWind;

GO
-- List all orders per customer with a specific contact name
SELECT
   Orders.OrderID,
   Customers.contactName
FROM
   Orders
   JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE
   ContactName = 'Liz Nixon';

GO