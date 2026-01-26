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



----------- EXERCISE 2 – UNION ALL (Combine Including Duplicates)

-- Concept Reminder
-- UNION ALL combines results and keeps duplicates.
-- Story
-- A bookstore tracks online and in-store orders. Some customers ordered in both channels.
-- Tasks
-- Create OnlineOrders(OrderID, CustomerName)
-- Create StoreOrders(OrderID, CustomerName)
-- Insert overlapping orders
-- Use UNION ALL to list all orders including duplicates

CREATE TABLE dbo.OnlineOrders 
(
    OrderID INT,
    CustomerName VARCHAR(50) NOT NULL
);
GO

CREATE TABLE dbo.StoreOrders
(
    OrderID INT,
    CustomerName VARCHAR(50) NOT NULL
);
GO

INSERT into dbo.OnlineOrders(OrderID, CustomerName)
VALUES
(1, 'Karl'),
(2, 'Samy'),
(3, 'Rock'),
(4, 'Floris');
GO

INSERT into dbo.StoreOrders(OrderID, CustomerName)
VALUES
(4, 'Floris'),
(5, 'Jenny'),
(6, 'Mark');
GO

SELECT CustomerName FROM dbo.OnlineOrders 
UNION ALL
SELECT customerName FROM dbo.StoreOrders 

------------ EXERCISE 3 – INTERSECT (Find Common Rows)

-- Concept Reminder
-- INTERSECT returns only rows present in both result sets.
-- Story
-- A company wants a marketing list of customers who bought both Product A and Product B.
-- Tasks
-- Create ProductA_Customers(CustomerID, CustomerName)
-- Create ProductB_Customers(CustomerID, CustomerName)
-- Insert overlapping and non-overlapping customers
-- Use INTERSECT to list customers who bought both products 


CREATE TABLE dbo.ProductA_Customers
(
    CustomerID INT,
    CustomerName VARCHAR(50) NOT NULL
);
GO

INSERT dbo.ProductA_Customers(CustomerID, CustomerName)
VALUES
(1, 'Magali'),
(2, 'Lisa'),
(3, 'Margis'),
(4, 'Cindy');
GO


CREATE TABLE dbo.ProductB_Customers
(
    CustomerID INT,
    CustomerName VARCHAR(50) NOT NULL
);
GO

INSERT dbo.ProductB_Customers(CustomerID, CustomerName)
VALUES
(3, 'Margis'),
(4, 'Cindy'),
(5, 'Pascal'),
(6, 'Jenny');
GO

SELECT CustomerName as [Customer Name] FROM dbo.ProductA_Customers
INTERSECT
SELECT CustomerName as [Customer Name] FROM dbo.ProductB_Customers


-----EXERCISE 4 – EXCEPT (Find Missing Rows)

-- Concept Reminder
-- EXCEPT returns rows in the first query not present in the second query.
-- Story
-- A gym wants to know which members have not attended the latest fitness class.
-- Tasks
-- Create AllMembers(MemberID, MemberName)
-- Create AttendedClass(MemberID, MemberName)
-- Insert some overlapping data
-- Use EXCEPT to list members who did not attend 


CREATE TABLE dbo.AllMembers
(
    MemberID INT,
    MemberName VARCHAR(50)
);
GO

INSERT dbo.AllMembers(MemberID, MemberName)
VALUES
(1, 'Peppin'),
(2, 'Love'),
(3, 'Ben'),
(4, 'Sary');
GO

CREATE TABLE dbo.AttendedClass
(
    MemberID INT,
    MemberName VARCHAR(50) NOT NULL  
);
GO

INSERT dbo.AttendedClass(MemberID, MemberName)
VALUES
(4, 'Sary'),
(5, 'Victoire'), 
(6, 'Remy');
GO

SELECT MemberID FROM dbo.AllMembers
EXCEPT
SELECT MemberID FROM dbo.AttendedClass