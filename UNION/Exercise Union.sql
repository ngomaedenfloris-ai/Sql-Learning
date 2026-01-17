------- EXERCISE 1 – UNION (Combine Unique Rows)

Concept Reminder
UNION combines the results of two queries and removes duplicates.
Story
A company tracks customers from two regions separately. Some customers appear in both regions.
Tasks
Create RegionA_Customers(CustomerID, CustomerName)
Create RegionB_Customers(CustomerID, CustomerName)
Insert some overlapping and some unique customers
Use UNION to list all unique customers from both regions

CREATE TABLE dbo.RegionA_Customers
(
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(50) NOT NULL
);
GO

CREATE TABLE dbo.RegionB_Customers 
(
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(50) NOT NULL
);
GO 

INSERT into dbo.RegionA_Customers(CustomerName)
VALUES
('Arthur'),
('Rock'),
('Zack'),
('Kris');
GO

INSERT into dbo.RegionB_Customers(CustomerName)
VALUES
('Bruno'),
('Francis'),
('Rolly'),
('Robert');
GO

SELECT CustomerName FROM dbo.RegionA_Customers
UNION
SELECT CustomerName FROM dbo.RegionB_Customers 