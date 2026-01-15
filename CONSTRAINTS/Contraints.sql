
--- PRIMARY KEY
--- FOREIGN KEY
--- UNIQUE
--- CHECK
--- DEFAULT


---------------------------------------------
use SQLPractice
go

if(object_id('dbo.exampleParent', 'U') is not null)
	drop table dbo.exampleParent
else
	create table dbo.exampleParent
	(
	exampleParentId int not null identity,
	exampleParentName varchar(100) not null
	)
go

if(object_id('dbo.example', 'U') is not null)
	drop table dbo.example
else
	create table dbo.example
	(
	exampleid int not null identity(1,1),
	exampleName varchar(100) null,
	exampleAge int not null,
	exampleDescription varchar(512) null,
	exampleExampleParentId int not null
	)
go

--- PRIMARY KEY
alter table dbo.exampleParent
add constraint PK_exampleParent primary key(exampleParentId)
go

alter table dbo.example
add constraint PK_Example primary key(exampleId)
go

--- FOREIGN KEY
alter table dbo.example
add constraint FK_ExampleParent_Example foreign key(exampleExampleParentId)
references exampleParent(exampleParentId)
go

--- UNIQUE
alter table dbo.example
add constraint UQ_Example_ExampleName Unique(exampleName)
go

--- CHECK
alter table dbo.example
add constraint CK_Example_ExampleAge Check(exampleAge > 18)
go

--- DEFAULT
alter table dbo.example
add constraint DF_Example_ExampleDescription Default('N/A') For exampleDescription
go
