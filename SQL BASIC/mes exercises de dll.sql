use master
go

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create database [candidatedb]
go

use candidatedb
go

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create schema newcandidates
go

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table newcandidates.jobApplication
(
jobApplicationID INT primary key identity(1,1) not null,
jobName varchar(50) not null
)
go

create table newcandidates.candidateDetails
(
candidateDetailsID Int primary key identity(1,1) not null,
CandidateDetailsName varchar(50) not null,
candidateDetailsSurname varchar(50) not null,
candidateDetailsNumber varchar(12) not null,
candidateDetailsaddress varchar(500) null,
candidateDetailsEmail varchar (50) not null,
candidateDetailsjobApplicationID int foreign key references newcandidates.jobApplication(jobApplicationID)
)
go

insert into newcandidates.jobApplication(jobName)
values('Finance Inspector'),
      ('Human Ressources')
go

select * from newcandidates.jobApplication
go

insert into newcandidates.candidateDetails(CandidateDetailsName, candidateDetailsSurname, candidateDetailsNumber, candidateDetailsaddress, candidateDetailsEmail, candidateDetailsjobApplicationID)
                                     values('Floris'            , 'Ngoma'                ,  '087 456 7869'       , NULL                   , 'floris@gmail.com'   , 1),
									      ('Francis'           , 'Mouyabi'              ,  '065 678 4322'       , 'Parklands'            , 'mouyabi@hotmail.com', 2),
										  ('Favy'              , 'Mbadinga'             ,  '081 490 5699'       , 'Sandton'              , 'favy23@gmail.com'   , 2)
go

select * from newcandidates.candidateDetails
go
