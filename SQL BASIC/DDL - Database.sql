

----create object

--Create ...

-----Object: Database

use master
go

Create database [BASICDATABASE]
go

use [BASICDATABASE]
go

--- modify object

Alter database [BASICDATABASE]
set read_only
go

Alter database [BASICDATABASE]
set read_write
go

--- delete object

drop database [BASICDATABASE]
go

