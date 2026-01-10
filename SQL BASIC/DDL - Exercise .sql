use master
go

--drop Reception
drop database Reception
go

create database [Reception]
go

use [Reception]
go

create schema [Client]
go

create schema [Bills]
go

create schema [Drafts]
go

---------------------- Relationship -------------------------
-------------------------- Add With table ----------------------------------

create table Client.Divorce
(
DivorceId int primary key identity(1,1) not null,
Divorcereason varchar(max) not null
)
go


create table Client.Client 
(
ClientId int primary key identity(1,1) not null,
Clientname varchar(50) not null,
Clientsurname varchar(50) not null,
Clientaddress varchar(500) not null,
Clientemail varchar(50) not null,
DivorceId int foreign key references Client.Divorce(DivorceId)
)
go

-------------------------- Add after table ----------------------------------

create table Client.Divorcetwo
(
DivorceId int not null identity(1,1),
Divorcereason varchar(max) not null
)
go


create table Client.Clienttwo 
(
ClientId int not null identity(1,1),
Clientname varchar(50) not null,
Clientsurname varchar(50) not null,
Clientaddress varchar(500) not null,
Clientemail varchar(50) not null,
DivorceId int null
)
go

alter table Client.Divorcetwo
add constraint PK_Divorcetwo
primary key(DivorceId)
go

alter table Client.Clienttwo
add constraint PK_Clienttwo
primary key(ClientId)
go

alter table Client.Clienttwo
add constraint fk_Divorce_Clienttwo 
foreign key(DivorceID)
references Client.Divorcetwo(DivorceID) 
go


Alter table dbo.Student
 Drop constraint fk_Student_StudentTeacherID -- foreign key (StudentTeacherID) references dbo.Teacher(TeacherID);
go