
--- CREATE

declare @Name varchar(100);
declare @Surname varchar(100) = 'Mbadinga'
declare @PhoneNumber varchar (9) = '673458877'   

--- ALTER
select @Surname

Set @Name = 'Rock'
Set @Surname = 'Dicoco'

--- DROP
--go


--- READ
select @Name
select @Surname


INSERT INTO [dbo].[Person]
           ([PersonName]
           ,[PersonSurname]
           ,[PersonPhoneNumber])
     VALUES
           (@Name, @Surname, @PhoneNumber)  
go 

           