----- Exercise 1 — Basic Filtering with WHERE -----

-- Goal
-- Understand simple row elimination.
-- Story
-- You work in a small shop database.
-- Tasks
-- Create a table Products
-- Insert at least 5 products with different prices
-- Select only products with price greater than 100 

CREATE TABLE dbo.Products 
(
    ProductID INT,
    ProductName VARCHAR(100),
    Price INT
);
GO 

INSERT into dbo.Products(ProductID, ProductName, Price)
VALUES
(1, 'Water', 150),
(2, 'Cake', 200),
(3, 'Charger', 360),
(4, 'Apple', 50),
(5, 'Pen', 20);
GO 

SELECT [ProductID],
       [ProductName],
       [Price] 

FROM [SQLPractice].[dbo].[Products]
WHERE Price > 100 
 

------- Exercise 2 — Comparison Operators -------

-- Goal
-- Practice =, <>, >=, <=
-- Story
-- You are checking employee salaries.
-- Tasks
-- Create table Employees
-- Insert salaries: 3000, 5000, 7000, 9000
-- Select employees whose salary is not equal to 5000
-- Select employees whose salary is greater or equal to 7000
-- Expected Outcome
-- First query excludes salary 5000
-- Second query returns 7000 and 9000 only




