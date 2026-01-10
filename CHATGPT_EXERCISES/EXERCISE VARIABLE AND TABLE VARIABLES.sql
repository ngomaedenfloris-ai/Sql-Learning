---- CREATE A TABLE (DDL) - EXERCISE 1
use master
Go

Create database ChatGPT

Go

Use ChatGPT
go

Create schema FinanceApp
Go

Create table FinanceApp.Clients 
(
ClientsID Int Primary Key Identity(1,1) not null,
FirstName Varchar(50) not null,
LastName Varchar(50) not null,
Email Varchar(100) null,
PhoneNumber Varchar(20) null
)
Go 

Select * from FinanceApp.Clients
Go


----- INSERT DATA (DML) - EXERCISE 2

Insert into FinanceApp.Clients(FirstName, LastName, Email, PhoneNumber)
values
('Eden', 'Ngoma', 'eden@email.com', '0123456789'),
('Felix', 'Moyo', 'felix@email.com', '0987654321'),
('Prince', 'Okoro', Null, '0112233445')
Go

Select * from FinanceApp.Clients
Go


------ UPDATE DATA (DML) - EXERCISE 3

Update FinanceApp.Clients
Set Email = 'felix.moyo@email.com'
Where FirstName = 'Felix' and LastName = 'Moyo'
Go

Select * from FinanceApp.Clients
Go


------ DELEATE DATA (DML) - EXERCICE 4

Delete FinanceApp.Clients
Where FirstName = 'Prince' and LastName = 'Okoro'
Go

Select * from FinanceApp.Clients
Go


------  VARIABLE - EXERCISE 5

Declare @ClientsID Int

Select @ClientsID = ClientsID
From Clients
Where FirstName = 'Felix' 

Select FirstName
From Clients
Where ClientsID = @ClientsID

Go




