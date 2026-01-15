--------------------------------------- Primary key constraint ---------------------------------------------------

Alter Table dbo.Teacher
Add Constraint pk_Teacher_TeacherId Primary key (TeacherId)

Alter Table dbo.Student
Add Constraint pk_Student_StudentId Primary key (StudentId)
go

---------------------------------------- Foreign key constraint --------------------------------------------------

Alter Table dbo.Student
Add Constraint fk_Student_StudentTeacherId foreign key (StudentTeacherId) REFERENCES dbo.Teacher(TeacherId)
go

-----------------------------------------default constraint -------------------------------------------------
Alter Table dbo.Student
Add Constraint df_Student_StudentGender default 'Not specified' for StudentGender
go

-----------------------------------------unique constraint -------------------------------------------------
Alter Table dbo.Student
Add Constraint uq_Student_StudentPhoneNumber unique (StudentPhoneNumber)
go

-----------------------------------------check constraint -------------------------------------------------
Alter Table dbo.Student
Add Constraint ck_Student_StudentAge check (StudentAge > 16)