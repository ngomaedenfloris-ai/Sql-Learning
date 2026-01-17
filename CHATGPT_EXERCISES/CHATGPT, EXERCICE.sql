---- EXERCISE 1 - NNER JOIN (Basic Match)
-- Story
-- A small training center stores students and the courses they are enrolled in. Some students exist without enrollments, and some courses have no students yet.

-- Your Tasks
-- Create a table Students(StudentID, StudentName)
-- Create a table Enrollments(StudentID, CourseName)
-- Insert:
-- At least one student with no enrollment
-- At least one enrollment linked to a student
-- Write an INNER JOIN that shows:
-- StudentName
-- CourseName
-- Only students who are enrolled should appear.

Use SQLPractice
Go 

Create table dbo.Students
(
    StudentID Int Primary Key Identity(1,1),
    StudentName Varchar(50) not null
)
Go

Insert into dbo.Students(StudentName)
Values 
('Eden'),
('Favy'),
('Emma');
Go

Drop table dbo.Students
Go
Select * from dbo.Students
Go

Create table dbo.Enrollments
(
    EnrollementID Int Primary Key Identity(1,1),
    EnrollmentCourseName Varchar(50) not null,
    EnrollementStudentId int not null foreign key references dbo.students(StudentID)
)
Go 



Insert into dbo.Enrollments(EnrollmentCourseName, EnrollementStudentId)
Values 
('Legal Practice', 1),
('Economics', 2),
('Business Management', 2);
Go

Drop table dbo.Enrollments
Go
Select * from dbo.Enrollments
Go

Select Std.StudentID [Student ID],
       Std.StudentName [Student Name],
       Enr.EnrollementID [EnrollementID ID],
       EnrollmentCourseName [Enrollment Course Name]


From dbo.Enrollments Enr
Inner join dbo.Students Std 
On Std.StudentID = Enr.EnrollementStudentID
Go

----- EXERCISE 2 – INNER JOIN (Filtering Reality)
-- Your Tasks:

-- Create Employees(EmployeeID, EmployeeName, DepartmentID)
-- Create Departments(DepartmentID, DepartmentName)
-- Insert:
-- One employee without a department
-- Two employees with valid departments
-- Use an INNER JOIN to list:
-- EmployeeName
-- DepartmentName

Create table dbo.Departments
(
 DepartmentID Int primary Key Identity(1,1),
 DepartmentName Varchar(50) not null
)
Go 

Insert into dbo.Departments(DepartmentName)
Values 
('Human Resources'),
('Finance'),
('Marketing');
Go

Create table dbo.Employees
(
    EmployeeID Int Primary Key Identity(1,1),
    EmployeeName Varchar(50) not null,
    EmployeeDepartmentID Int null Foreign key References dbo.Departments(DepartmentID)
) 
Go 

Insert into dbo.Employees(EmployeeName, EmployeeDepartmentID)
Values 
('Favy', 1),
('Francis', Null),
('Emma', 3);
Go 

Select * from dbo.Departments
Go
Select * from dbo.Employees
Go
Drop table dbo.Employees
Go

Select Dpt.DepartmentID [Department ID],
       Emp.EmployeeID [EmployeeI D],
       Dpt.DepartmentName [Department Name],
       Emp.EmployeeName [Employee Name]

From dbo.Employees Emp 
Inner Join dbo.Departments Dpt 
On Dpt.DepartmentID = Emp.EmployeeDepartmentID
Go

----- EXERCISE 3 – LEFT JOIN (Preserve the Left)
-- Story
-- An online shop wants to list all customers, including those who have never placed an order.

-- Your Tasks
-- Create Customers(CustomerID, CustomerName)
-- Create Orders(OrderID, CustomerID, OrderDate)

-- Insert:
-- Customers with and without orders
-- Write a LEFT JOIN showing:
-- CustomerName
-- OrderDate
-- Customers without orders must still appear.

Create table dbo.Customers 
(
    CustomerID Int Primary Key Identity(1,1),
    CustomerName Varchar(50) not NULL
)
Go 

Insert into dbo.Customers(CustomerName)
Values
('Eden'),
('Lisa'),
('Magali');
Go 

Create table dbo.Orders 
(
    OrderID Int Primary Key Identity(1,1),
    OrderCustomerID Int null Foreign Key References dbo.Customers(CustomerID),
    OrderDate Date not null Default GetDate()
)
Go

Insert into dbo.Orders(OrderCustomerID)
Values 
(1),
(2),
(1);
Go 

Select Cust.CustomerID [Customer ID],
       Ord.OrderID [Order ID],
       Ord.OrderCustomerID [Order Customer ID],
       Cust.CustomerName [Customer Name],
       Ord.OrderDate [Order Date]

From dbo.Orders Ord
Left join dbo.Customers Cust 
On Cust.CustomerID = Ord.OrderCustomerID
Go 

------EXERCISE 4 – LEFT JOIN (Finding Missing Data)
-- Story
-- A library wants to find members who have never borrowed a book.
-- Your Tasks
-- Create Members(MemberID, MemberName)
-- Create Loans(LoanID, MemberID, BookTitle)

-- Insert:
-- Members with loans
-- Members without loans
-- Use a LEFT JOIN and filter to show:
-- Only members who never borrowed any book


Create table dbo.Members
(
    MemberID Int Identity(1,1) Primary Key,
    MemberName Varchar(50)
)
Go 

Insert into dbo.Members(MemberName)
Values 
('Gloria'),
('Magali'),
('Lisa'),
('Margis'),
('Malvin');
Go 

Select * from dbo.Members
Go
Drop table dbo.Members
go

Create table dbo.Loans
(
    LoanID Int Identity(1,1) Primary Key,
    LoanMemberID Int null Foreign Key References dbo.Members(MemberID),
    BookTitle Varchar(100)
)
Go 

Insert into dbo.Loans(LoanMemberID, BookTitle)
Values 
(1, 'Love Is Magic'),
(2, 'Africa Best Dish'),
(Null, 'Best Image'),
(4, 'Economics'),
(Null, 'The Paradise');
Go 

Select Memb.MemberID [Member ID],
       Ls.LoanID [Loan ID],
       Ls.LoanMemberID[Loan Member ID],
       Memb.MemberName [Member Name],
       ls.BookTitle [Book Title]

       From dbo.Loans Ls 
       Left Join dbo.Members Memb
       On Ls.LoanID = Ls.LoanMemberID
       Go 

---- EXERCISE 5 – RIGHT JOIN (Same Logic, Different Perspective)
--        Story
-- A school tracks exam results. Some exams exist even if no student took them yet.
-- Your Tasks
-- Create Students(StudentID, StudentName)
-- Create Exams(ExamID, StudentID, Subject)
-- Insert:
-- Exams without students
-- Exams with students-- Write a RIGHT JOIN listing:
-- StudentName
-- Subject
-- Ensure exams with no students still appear.

Create table dbo.Students
(
    StudentID Int Identity(1,1),
    StudentName Varchar(50) not null
)
Go 

Create table dbo.Exams 
(
    ExamID Int identity(1,1),
    ExamsStudentID Int null,
    ExamsSubject Varchar(100) not null
)
Go 


Alter table dbo.Students
Add Constraint PK_Students Primary key(StudentID)
Go 

Alter table dbo.Exams
Add Constraint PK_Exams Primary key(ExamID)
Go 

Alter table dbo.Exams
Add Constraint FK_Students_Exams Foreign key(ExamsStudentID) References dbo.Students(StudentID)
Go 

Insert into dbo.Students(StudentName)
Values 
('Lisa'),
('Lola'),
('Margis'),
('Doris');
Go 

Insert Into dbo.Exams(ExamsStudentID, ExamsSubject)
Values 
(1,'French'),
(Null, 'Science'),
(3, 'Economics'),
(Null, 'Latin');
Go

Select * from dbo.Students
Select * from dbo.Exams

Select S.StudentName,
       Sb.ExamsSubject

From dbo.Students as S 
Right Join Exams as Sb 
On S.StudentID = Sb.ExamsStudentID;


----EXERCISE 6 – RIGHT JOIN (Understanding Symmetry)
-- A company tracks invoices and payments. Some payments were logged before invoice data was finalized.
-- Your Tasks
-- Create Invoices(InvoiceID, InvoiceAmount)
-- Create Payments(PaymentID, InvoiceID, PaymentAmount)
-- Insert:
-- Payments without matching invoices
-- Write a RIGHT JOIN showing:
-- InvoiceAmount
-- PaymentAmount

CREATE TABLE dbo.Invoices 
(
    InvoiceID INT IDENTITY(1,1),
    InvoiceAmount MONEY NOT NULL
)
GO 

CREATE TABLE dbo.Payments
(
    PaymentID INT IDENTITY(1,1),
    PaymentInvoiceID INT NULL,
    PaymentAmount MONEY NOT NULL
)
GO

ALTER TABLE dbo.Invoices
ADD CONSTRAINT PK_Invoices PRIMARY KEY(InvoiceID)
GO

ALTER TABLE dbo.Payments
ADD CONSTRAINT PK_Payments PRIMARY KEY(PaymentID)
GO

ALTER TABLE dbo.Payments
ADD CONSTRAINT FK_Invoices_Payments FOREIGN KEY(PaymentInvoiceID) REFERENCES dbo.Invoices(InvoiceID)
GO

INSERT into dbo.Invoices(InvoiceAmount)
VALUES
(5000),
(10000),
(7000),
(2000);
GO

INSERT into dbo.Payments(PaymentInvoiceID, PaymentAmount)
VALUES
(null, 4000),
(2, 10000),
(null, 6500),
(4, 2000);
GO

SELECT INV.InvoiceAmount,
       PMT.PaymentAmount

FROM dbo.Invoices as INV 
RIGHT JOIN dbo.Payments as PMT
ON INV.InvoiceID = PMT.PaymentInvoiceID
GO

------- EXERCISE 7 – FULL JOIN (Everything from Both Sides)

-- Story
-- Two systems track employees: HR and Security. Some employees exist in only one system.
-- Your Tasks
-- Create HR_Employees(EmployeeID, Name)
-- Create Security_Employees(EmployeeID, Name)
-- Insert:
-- Employees in both tables
-- Employees in only one table
-- Write a FULL JOIN showing:
-- EmployeeID
-- HR name
-- Security name
---------------------------------------------------------------
-- IF OBJECT_ID('dbo.HR_Employees','u') is not NULL
-- DROP TABLE dbo.HR_Employees
-- CREATE TABLE dbo.HR_Employees
-- (
--     EmployeeID INT not null,
--     [Name] VARCHAR(50) NOT NULL
-- );
-- GO

-- IF OBJECT_ID('dbo.Security_Employees','u') is not NULL
-- DROP TABLE dbo.Security_Employees
-- CREATE TABLE dbo.Security_Employees
-- (
--     EmployeeID INT not null,
--     [Name] VARCHAR(50) NOT NULL
-- );
--go 
-----------------------------------------------------------------

CREATE TABLE dbo.HR_Employees
(
    EmployeeID INT NOT NULL,
    [Name] VARCHAR(50) NOT NULL
)
GO

CREATE TABLE dbo.Security_Employees 
(
    EmployeeID INT NOT NULL,
    [Name] VARCHAR(50) NOT NULL
)
GO

ALTER TABLE dbo.HR_Employees 
ADD CONSTRAINT PK_HR_Employees PRIMARY KEY(EmployeeID)
GO

ALTER TABLE dbo.Security_Employees
ADD CONSTRAINT PK_Security_Employees PRIMARY KEY(EmployeeID)
GO

INSERT into dbo.HR_Employees(EmployeeID, [Name])
VALUES
(1, 'Sara'),
(2, 'Patrick'),
(3, 'Karl'),
(4, 'Felix');
GO

INSERT into dbo.Security_Employees(EmployeeID, [Name])
VALUES
(2, 'Patrick'),
(3, 'Karl'),
(4, 'Felix'),
(5, 'Jenny');
GO

SELECT HR.Name [HR Name],
       SN.Name [Security Name]

FROM dbo.HR_Employees AS HR 
Full JOIN dbo.Security_Employees AS SN 
ON HR.EmployeeID = SN.EmployeeID

-------- EXERCISE 8 – FULL JOIN (Data Reconciliation)
-- Concept Reminder
-- FULL JOIN is ideal for reconciliation and audits.
-- Story
-- An accountant compares bank transactions with internal transaction records.
-- Your Tasks
-- Create BankTransactions(TransactionID, Amount)
-- Create InternalTransactions(TransactionID, Amount)
-- Insert mismatched records
-- Write a FULL JOIN to display:
-- Bank amount
-- Internal amount
-- All mismatches must be visible.

Create table dbo.BankTransactions
(
TransactionID int not null,
Amount Money not null
);
Go

Alter table dbo.BankTransactions 
Add constraint PK_BankTransactions primary key(TransactionID)
Go

Insert into dbo.BankTransactions(TransactionID, Amount)
Values
(1, 2000),
(2, 4500),
(3, 10000),
(4, 8000);
Go
select * from BankTransactions


Create table dbo.InternalTransactions
(
TransactionID int not null,
Amount Money not null
);
Go

Alter table dbo.InternalTransactions
Add constraint PK_InternalTransactions primary key(TransactionID)
Go

Insert into dbo.InternalTransactions(TransactionID, Amount)
Values
(1, 2000),
(3, 500),
(4, 8000),
(5, 5700);
Go
select * from InternalTransactions


Select BT.Amount [Bank amount],
       IT.Amount [Internal amount]

From dbo.BankTransactions as BT
Full join dbo.InternalTransactions as IT
On BT.TransactionID = IT.TransactionID;

---- EXERCISE 9 – SELF JOIN (Table Joins Itself) 
--A SELF JOIN joins a table to itself using aliases.

--Story
--Employees have managers, and managers are also employees.
--Your Tasks
--Create Employees(EmployeeID, EmployeeName, ManagerID)
--Insert:
--Managers
--Employees reporting to managers
--Write a SELF JOIN to show:
--EmployeeName
--ManagerName

Create table dbo.Employees
(
EmployeeID int primary key,
EmployeeName varchar(50) not null,
ManagerID int null
);
Go 

ALTER TABLE dbo.Employees
ADD CONSTRAINT FK_Employees_Manager
FOREIGN KEY (ManagerID)
REFERENCES dbo.Employees(EmployeeID);

Insert into dbo.Employees(EmployeeID, EmployeeName, ManagerID)
Values 
(1, 'Eden', Null),
(2, 'magali', 1),
(3, 'Lisa', 1),
(4, 'Margis', 2),
(5, 'Favy', 2),
(6, 'Florette', 3);
Go

Select E.EmployeeName [Employee Name],
       M.EmployeeName [Manager Name]

From dbo.Employees as E
LEFT join dbo.Employees as M
On E.ManagerID = M.EmployeeID;  

Drop table dbo.Employees
go 



select * 
from dbo.Employees

-------------------------------------------------

----------------------------------------------------
--From


--Where


--GHSO

---FROM
--select ----
--From table
--From table inner join tableB
--From table left join tableB
--From table Cross join tableB
--from table full join tableB
--from table union all
--from table union
--from table except
--from table intercept
--from table self join


select * 
from 
(

select TeacherId, TeacherName, TeacherSubject 
from dbo.Teacher
Where TeacherSubject <> 'Physic'

) as newTeacherTable

------------------------------------------------------

----CTE

--with newTeacherTable
--as
--(
--	select TeacherId, TeacherName, TeacherSubject 
--	from dbo.Teacher
--	Where TeacherSubject <> 'Physic'
--)
--select * from newTeacherTable
--------
--select TeacherSubject
--from dbo.Teacher
--where TeacherId in  --and condition
--(
--	select t.TeacherId
--	from dbo.Teacher t
--	where t.TeacherId = 1
--);

--------------------------------------------------------------
------ EXERCISE 10 – SELF JOIN (Hierarchy Thinking)

-- SELF JOIN allows hierarchical relationships without recursion.
-- Story
-- A company tracks mentor relationships between staff.
-- Your Tasks
-- Use the same Employees table
-- Insert mentor relationships
-- Write a SELF JOIN showing:
-- EmployeeName
-- MentorName

ALTER TABLE dbo.Employees
ADD MentorID INT NULL;

-- SELECT * 
-- FROM dbo.Employees 

UPDATE dbo.Employees SET MentorID = 1 WHERE EmployeeID IN (2, 3);
UPDATE dbo.Employees SET MentorID = 2 WHERE EmployeeID IN (4, 5);
UPDATE dbo.Employees SET MentorID = 3 WHERE EmployeeID = 6;
GO 

SELECT E.EmployeeName AS [Employee Name],
       MT.EmployeeName AS [Mentor Name]

FROM dbo.Employees AS E 
LEFT JOIN dbo.Employees AS MT 
ON E.MentorID = MT.EmployeeID;

------ EXERCISE 11 – CROSS JOIN (Every Combination)

-- Concept Reminder
-- A CROSS JOIN returns the Cartesian product: every row combined with every other row.
-- Story
-- A clothing brand wants to generate all combinations of sizes and colors.
-- Your Tasks
-- Create Sizes(Size)
-- Create Colors(Color)
-- Insert at least 3 sizes and 3 colors
-- Write a CROSS JOIN to list all combinations

CREATE TABLE dbo.Sizes 
(
    SizeID INT PRIMARY KEY IDENTITY(1,1),
    Size VARCHAR(50) NOT NULL
);
GO

CREATE TABLE dbo.Colors 
(
    ColorID INT PRIMARY KEY IDENTITY(1,1),
    Color  VARCHAR(50) NOT NULL
);
GO

INSERT into dbo.Sizes(Size)
VALUES
('XS'),
('S'),
('M'),
('L');
GO

INSERT into dbo.Colors(Color)
VALUES
('Black'),
('White'),
('Red'),
('Green');
GO

SELECT S.Size,
       C.Color

FROM dbo.Sizes AS S 
CROSS JOIN dbo.Colors AS C 



select * from dbo.Sizes
Select * from dbo.Colors

drop table dbo.Sizes
Drop table dbo.Colors

-------- EXERCISE 12 – CROSS JOIN (Scenario Simulation)
-- Concept Reminder
-- CROSS JOIN is useful for simulations, test data, and scenario planning.
-- Story
-- A restaurant wants to see all possible menu combinations of dishes and days.
-- Your Tasks
-- Create Dishes(DishName)
-- Create Days(DayName)
-- Insert sample data
-- Write a CROSS JOIN producing:
-- DishName
-- DayName

CREATE TABLE dbo.Dishes 
(
    DisheID INT PRIMARY KEY IDENTITY(1,1),
    DisheName VARCHAR(100) NOT NULL
);
GO

CREATE TABLE dbo.Days 
(
    DayID INT PRIMARY KEY IDENTITY(1,1),
    DayName VARCHAR(100) NOT NULL
);
GO

INSERT into dbo.Dishes(DisheName)
VALUES
('Omelette jambon fromage'),
('Steak aux petit poids'),
('Crème brûlée'),
('Crêpes au chocolat');
GO 

INSERT into dbo.Days(DayName)
VALUES
('Monday'),
('Tuesday'),
('Wednesday'),
('Thursday'),
('Friday');
GO

select * from dbo.Dishes
select * from dbo.Days 

SELECT D.DisheName AS [Dishe Name],
       Dys.DayName AS [Day Name]

FROM dbo.Dishes AS D 
CROSS JOIN dbo.Days AS Dys 
