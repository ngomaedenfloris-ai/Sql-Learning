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
 



