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
    StudentID Int primary key Identity(1,1),
    StudentName Varchar(50)
)
Go 
Select * from dbo.Students
Go 

Insert Into dbo.Students(StudentName)
Values 
('Lisa'),
('Magali'),
('Felix'),
('Margis');
Go 

Create table dbo.Exams 
(
    ExamID Int primary key identity(1,1),
    Subject Varchar(100)
    
)
Go 

Insert into dbo.Exams(Subject)
Values 
('French'),
('Science'),
('Latin'),
('Economics');
Go 







