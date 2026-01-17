-------------UNION--------------
-- Combines results of two queries.
-- Removes duplicates automatically.

-- Table 1: Employees
CREATE TABLE Employees (
    EmployeeID INT,
    FirstName NVARCHAR(50),
    DepartmentID INT
);

-- Table 2: Contractors
CREATE TABLE Contractors (
    ContractorID INT,
    FirstName NVARCHAR(50),
    DepartmentID INT
);

-- Get all first names from Employees and Contractors, without duplicates
SELECT FirstName FROM Employees
UNION
SELECT FirstName FROM Contractors;


------- UNION ALL --------------------
-- Combines results of two queries.
-- Keeps duplicates.

-- Get all first names from Employees and Contractors, including duplicates
SELECT FirstName FROM Employees
UNION ALL
SELECT FirstName FROM Contractors;


------------Except ---------------------

-- Returns rows from the first query that do not exist in the second.
-- Automatically removes duplicates.

-- Get first names in Employees but not in Contractors
SELECT FirstName FROM Employees
EXCEPT
SELECT FirstName FROM Contractors;


---------- intersect -----------------------
-- Returns only rows that exist in both queries.
-- Automatically removes duplicates

-- Get first names that are both in Employees and Contractors
SELECT FirstName FROM Employees
INTERSECT
SELECT FirstName FROM Contractors;


----------------------Extra Notes for Practice----------------

-- Column count and data types must match for these set operators.
-- UNION and UNION ALL can return duplicates differently.
-- INTERSECT and EXCEPT always remove duplicates.
-- Sorting can be applied only once at the end:

SELECT FirstName FROM Employees
UNION
SELECT FirstName FROM Contractors
ORDER BY FirstName;
