Use SQLPractice
Go


--------- EXERCISE 1 - CREATE TABLE (DDL) ----
Create SCHEMA FinanceApp
Go

Create table FinanceApp.Clients
(
ClientID INT Primary Key Identity(1,1),
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) not null,
Email VARCHAR(100) NULL,
PhoneNumber VARCHAR(20) NULL
)
Go

--------- EXERCISE 2 - INSERT DATA (DML)
Insert into FinanceApp.Clients(FirstName, LastName, Email, PhoneNumber) 
Values 
('Eden', 'Ngoma', 'eden@email.com', '0123456789'),
('Felix', 'Moyo', 'felix@email.com', '0987654321'),
('Prince', 'Okoro', NULL, '0112233445')
Go

Select * From FinanceApp.Clients;
Go 
Drop Table FinanceApp.Clients;
Go

--------- EXERCISE 3 - UPDATE DATA (DML)
Update FinanceApp.Clients
Set Email = 'felix.moyo@email.com'
Where FirstName = 'Felix' And LastName = 'Moyo' 
Go

-------- EXERCISE 4 - DELETE DATA (DML)
Delete FinanceApp.Clients
Where FirstName = 'Prince' And LastName = 'Okoro'
Go 

--------- EXERCISE 5 - USING A VARIABLE 
-- Instructions:
-- 1. Declare a variable called @ClientID of type INT
-- 2. Assign it the value of Felix's ClientID
-- 3. Use a SELECT statement to display the FirstName of that client using the variable

Declare @ClientID INT =
(Select ClientID From FinanceApp.Clients
Where FirstName = 'Felix' And LastName = 'Moyo');  


----------- EXERCISE 6 - USING A TABLE VARIABLE
-- Instructions:
-- 1. Declare a table variable @TempClients with columns ClientID, FirstName, LastName
-- 2. Insert all current clients from FinanceApp.Clients into the table variable
-- 3. Select all rows from the table variable

Declare @TempClients table 
(
ClientID INT Primary Key,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) not null
);

Insert into @TempClients(ClientID, FirstName, LastName)
Select ClientID, FirstName, LastName
From FinanceApp.Clients;


Select * from @TempClients;

------ EXERCISE 7 - CONDITIONAL UPDATE USING VARIABLE
-- Instructions:
-- 1. Declare a variable @NewPhone VARCHAR(20)
-- 2. Assign it '0999999999'
-- 3. Update Eden's PhoneNumber with this variable
-- 4. Check using a SELECT statement
	
	Declare @NewPhone VARCHAR(20) 
	Set @NewPhone = '0999999999';

	Update FinanceApp.Clients
	Set PhoneNumber = @NewPhone
	Where FirstName = 'Eden';
	
Select ClientID, FirstName, LastName, PhoneNumber
From FinanceApp.Clients
Where FirstName = 'Eden';

------- EXERCISE 8 - CREATE ANOTHER TABLE WITH A FOREIGN KEY

Create table FinanceApp.Debts
(
DebtID INT Primary key identity(1,1),
ClientID INT NOT NULL,
Amount MONEY NOT NULL,
Reference VARCHAR(50) NOT NULL

Constraint FK_Debts_Clients foreign key (ClientID) references FinanceApp.Clients(ClientID)
)
Go

Select * from FinanceApp.Debts
Go 

--------- EXERCISE 9 - INSERT DATA USING VARIABLE
-- Instructions:
-- 1. Declare @FelixID INT and assign it Felix's ClientID
-- 2. Declare @Amount MONEY and assign 5000
-- 3. Declare @Reference VARCHAR(50) and assign 'Debt2026'
-- 4. Insert a row into FinanceApp.Debts using these variables


Declare @FelixID INT;
Declare @Amount MONEY;
Declare @Reference VARCHAR(50)
 
 Select @FelixID = ClientID
 From FinanceApp.Clients
 Where FirstName = 'Felix';
 

 Set @Amount = 5000
 Set @Reference = 'Debt2026'

 Insert into FinanceApp.Debts( ClientID, Amount, Reference)
 Values 
 (
 @FelixID, @Amount, @Reference
 );

 Select * from FinanceApp.Debts
 Where ClientID = @FelixID; 

 ------- EXERCISE 10 - Using Table Variable for Multiple Debts
 -- Instructions:
-- 1. Declare a table variable @NewDebts with columns ClientID, Amount, Reference
-- 2. Insert 2-3 sample debts into @NewDebts
-- 3. Insert all rows from @NewDebts into FinanceApp.Debts
-- 4. Check the contents of FinanceApp.Debts


















