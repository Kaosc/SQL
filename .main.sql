USE Games
GO


SELECT Username, Age, DATEPART(year, GETDATE()) - AGE AS 'Birth Year' FROM Users