----- TABLE VARIABLE

use Myfinance
go

create table budget.groceries

(
groceriesID int primary key identity (1,1) not null,
groceriesAmount money not null,
groceriesDescription varchar(100) null,
groceriesCategory varchar(100) null
)  
go 

declare @groceries table

(
groceriesID int primary key identity (1,1) not null,
groceriesAmount money not null,
groceriesDescription varchar(100) null,
groceriesCategory varchar(100) null
)  

insert into @groceries

(
groceriesAmount,
groceriesDescription,
groceriesCategory
) 

values 
(
3000,
'Beef',
'Meat'
)

select * from @groceries
go



