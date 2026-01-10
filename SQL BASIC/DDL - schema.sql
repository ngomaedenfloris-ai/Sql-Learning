

--Create ...

-----Object: Schema (tiroir)

use [BASICDATABASE]
go

Create schema [Visa]
go

--- modify object

Alter schema [Visa]
Transfer dbo.Person
go


--- delete object

---first remove what we have inside the schema

alter schema [dbo]
Transfer Visa.Person
go


drop schema [Visa]
go




