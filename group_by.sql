USE Northwind;

GO
-- List all orders per customer descending by order count
SELECT
   COUNT(OrderID) AS orderCount,
   contactName AS contactNameCount
FROM
   Orders
   JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY
   contactName
ORDER BY
   orderCount DESC;

GO