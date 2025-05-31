---------- BACKUP DATABASE ----------

USE [Games];
GO

BACKUP DATABASE [Games]
TO DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\Games.bak'
WITH NOFORMAT, NOINIT,
NAME = N'Games-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10;
GO

USE [Northwind];
GO

BACKUP DATABASE [Northwind]
TO DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\Northwind.bak'
WITH NOFORMAT, NOINIT,
NAME = N'Northwind-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10;
GO

---------- RESTORE DATABASE ----------

USE [Games];
GO

RESTORE DATABASE [Games]
FROM DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\Games.bak' WITH  FILE = 1, NOUNLOAD, STATS = 5;
GO

USE [Northwind];
GO

RESTORE DATABASE [Northwind]
FROM DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\Northwind.bak' WITH  FILE = 1, NOUNLOAD, STATS = 5;
GO