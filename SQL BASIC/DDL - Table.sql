


-----Object: Table

--- create object: table

use [BASICDATABASE]
go

Create table Person
(
	PersonName varchar(50),
	PersonSurname varchar(50),
	PersonPhoneNumber char(9)
)
go

--- modify object: table

Alter table Person
add PersonAdd varchar(15)
go

Alter table dbo.Person
alter column PersonPhoneNumber varchar(15)
go

Alter table dbo.Person
drop column PersonAdd
go

---------------------------------------------------

--- delete object: table

drop table Person
go

