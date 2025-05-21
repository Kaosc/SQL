USE Northwind;

GO
-- List all orders per customer descending by order count
SELECT
   COUNT(OrderID) AS orderCount,
   ContactName
FROM
   Orders
   JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY
   ContactName
ORDER BY
   orderCount DESC;