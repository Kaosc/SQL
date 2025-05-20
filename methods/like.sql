USE Northwind;
GO

-- CREATE FUNCTION dbo.getProducts () RETURNS TABLE AS RETURN (
--    SELECT
--       ProductID,
--       ProductName,
--       QuantityPerUnit,
--       UnitPrice,
--       UnitsInStock
--    FROM
--       Products
-- )
-- GO 

-- INSERT INTO Products
-- VALUES ('Test Product %', 1, 1, '20 oz', 12.2, 100, 32, 25, 0)
-- GO

SELECT * FROM dbo.getProducts()
-- WHERE ProductName LIKE '__a__'; -- first two characters can be anything, then a, then two characters, max 5
-- WHERE ProductName LIKE '%a%'; -- includes a but not at the beginning or end
-- WHERE ProductName LIKE '%a'; -- last character can be a and then any character
-- WHERE ProductName LIKE 'a%'; -- first character can be a and then any character
-- WHERE ProductName LIKE '[az]%'; -- first character can be a, b, or c and then any character
-- WHERE ProductName LIKE '[c-f]%'; -- first character CAN be between c and f and then any character
-- WHERE ProductName LIKE '[^a-t]%'; -- first character CANNOT be between a and t and then any character
-- WHERE ProductName LIKE '%\%%' ESCAPE '\' -- % is a wildcard, so we need to escape it with a backslash
-- WHERE ProductName LIKE '%\_%' ESCAPE '\' -- _ is a wildcard, so we need to escape it with a backslash
WHERE ProductName LIKE '%''s%'; -- ' includes a single quate then 's' and then any character (Something's)

GO