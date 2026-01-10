---- PART 1 ---- EXERCISE 1

Use master
go

Create database StudentDB
go

Use StudentDB
go

Create schema app_schema 
go

---- PART 2 ---- EXERCISE 2

Create table app_schema.Students
(
StudentID int primary key identity(1,1) not null,
FisrtName varchar(50) not null,
LastName varchar(50) not null,
BirthDate date,
Gender char(1),
CreatedAt datetime default getdate()
)
go


Alter table app_schema.Students
Add constraint CK_Students_Gender
Check (Gender in ('M', 'F'))
go 


---- EXERCISE 3

Insert into app_schema.Students (FisrtName, LastName, BirthDate, Gender)
Values
('Eden', 'Ngoma', '22 May 1997', 'F'),
('Favy', 'Mbadinga', '17 July 1996', 'M'), 
('Victoire', 'Mapssi', '30 October 1996', 'F'),
('Francis', 'Mouyabi', '04 september 1997', 'M'),
('Rolly', 'Ngoma', '11 April 1996', 'M')
go

select * from app_schema.Students
go 





