use Reception
go

----- DML --> Data Manipulation Language



---- Add

--Insert

Insert into Client.Divorce(Divorcereason)
values('I don''t like him anymore'),
      ('he''s broke now')
go

insert into Client.Client(Clientname, Clientsurname, Clientaddress, Clientemail, DivorceId)
			       values('favy'    , 'mbadinga'   , 'parklands, cape town', 'favy@gmail.com', NULL),
						 ('floris'    , 'ngoma'   , 'parklands, cape town', 'floris@gmail.com', NULL),
						 ('francis'    , 'mouyabi'   , 'parklands, cape town', 'francis@gmail.com', 1)
go
---- Read

--select
select * from  Client.Divorce
go

select Divorcereason
from Client.Divorce


select * from Client.Client
where ClientId = 2
go

select Clientname, Clientsurname, Clientaddress, Clientemail
from Client.Client


---- Mofify

-- Update
update Client.Client
set Clientsurname = 'Bissila'
where ClientId = 3
go

---- Delete
--Delete
delete from Client.Client
where ClientId = 1
go

----------------------------------------
--fwghso
--from
--where
--group
--having
--select
--order by