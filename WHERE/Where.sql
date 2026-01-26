
USE SQLPractice
go

SELECT [EmployeeID]
      ,[EmployeeName]
      ,[ManagerID]
FROM [SQLPractice].[dbo].[Employees]

------------- Where --------------

WHERE [ManagerID] < 3

-------------- And ---------------

--AND [EmployeeID] > 6

-------------- And ---------------
OR [EmployeeID] < 5
GO
--------- And / or ---------------

SELECT [EmployeeID]
      ,[EmployeeName]
      ,[ManagerID]
FROM [SQLPractice].[dbo].[Employees]
WHERE ([EmployeeID] = 1 AND [EmployeeName] = 'Eden')
OR [ManagerID] < 2

--------- NULL ---------------
SELECT [EmployeeID]
      ,[EmployeeName]
      ,[ManagerID]
FROM [SQLPractice].[dbo].[Employees]
WHERE ([EmployeeID] = 1 OR [EmployeeName] = 'Eden')
AND [ManagerID] < 2 --- Null issue

SELECT [EmployeeID]
      ,[EmployeeName]
      ,[ManagerID]
FROM [SQLPractice].[dbo].[Employees]
WHERE [ManagerID] is NULL


SELECT [EmployeeID]
      ,[EmployeeName]
      ,[ManagerID]
FROM [SQLPractice].[dbo].[Employees]
WHERE [ManagerID] is not NULL


------------- IN/ NOT IN -------------
SELECT [EmployeeID]
      ,[EmployeeName]
      ,[ManagerID]
FROM [SQLPractice].[dbo].[Employees]
WHERE [ManagerID] IN (1,2)

SELECT [EmployeeID]
      ,[EmployeeName]
      ,[ManagerID]
FROM [SQLPractice].[dbo].[Employees]
WHERE [ManagerID] NOT IN (1,2)


---------- BETWEEN ---------------

SELECT [EmployeeID]
      ,[EmployeeName]
      ,[ManagerID]
FROM [SQLPractice].[dbo].[Employees]
WHERE [ManagerID] BETWEEN 1 AND 3


---------- like ---------------
SELECT [EmployeeID]
      ,[EmployeeName]
      ,[ManagerID]
FROM [SQLPractice].[dbo].[Employees]
WHERE [EmployeeName] lIKE 'Lisa' -- exact match

SELECT [EmployeeID]
      ,[EmployeeName]
      ,[ManagerID]
FROM [SQLPractice].[dbo].[Employees]
WHERE [EmployeeName] lIKE 'Li%' -- starts with


SELECT [EmployeeID]
      ,[EmployeeName]
      ,[ManagerID]
FROM [SQLPractice].[dbo].[Employees]
WHERE [EmployeeName] lIKE '%Li' -- ends with

SELECT [EmployeeID]
      ,[EmployeeName]
      ,[ManagerID]
FROM [SQLPractice].[dbo].[Employees]
WHERE [EmployeeName] lIKE 'F__Y' -- starts with F each _ is a character, then ends with Y


SELECT [EmployeeID]
      ,[EmployeeName]
      ,[ManagerID]
FROM [SQLPractice].[dbo].[Employees]
WHERE [EmployeeName] = 'FAVY' -- is not case sensitive