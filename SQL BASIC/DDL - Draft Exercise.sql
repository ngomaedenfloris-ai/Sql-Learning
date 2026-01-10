use master
go

create database [Reception]
go

create schema [Client]
go

create schema [Bills]
go

create schema [Drafts]
go

create table Client.Divorce
(
Clientname varchar(50),
Clientsurname varchar(50),
Clientnumber varchar(12),
Clientaddress varchar(500),
Clientdivorcereason varchar(max)
)
go

use master 
go

drop table Client.Divorce
go

drop schema [Clients]
go

drop schema [Bills]
go

drop schema [Drafts]
go 

---------------------------
use Reception
go


create table Client.Information
(
Clientname varchar(50),
Clientsurname varchar(50),
Clientaddress varchar(500),
Clientemail varchar(50)
)
go 

drop table Client.Information
go

create table Client.Client 
(
Clientname varchar(50),
Clientsurname varchar(50),
Clientaddress varchar(500),
Clientemail varchar(50)
)
go

alter table Client.Client
add ClientID INT 
go

alter table Client.Divorce
add DivorceID INT 
go

alter table Client.Client
add DivorceID INT 
go

-----------------------------------------------------------------------

alter table Client.Divorce
add constraint PK_Divorce
primary key(DivorceID)
go


alter table Client.Client

add constraint PK_Client

primary key(ClientId)
go

alter table Client.Client

add constraint FK_Divoce_Client

foreign key(DivorceID)

references Client.Divorce(DivorceId)
go


---------------------------------------------
create table drafts.Person
(
	personId int primary key identity(1,1) not null,
	personName varchar(100) not null,
	personAge int null,
	personDescription varchar(max)

)
go

create table drafts.[Product]
(
 productId int primary key identity(1,1) not null,
 productName varchar(255) not null,
 productDescription varchar(max) null,
 productPersonId int foreign key references drafts.Person(personId)
)
go




