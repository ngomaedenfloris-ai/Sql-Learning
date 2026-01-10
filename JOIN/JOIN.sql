--INNER JOINS-------------------------------------------------------------
 select t.TeacherName,
        t.TeacherSubject,
		s.StudentName,
		s.studentAge
from dbo.Student s
inner join dbo.Teacher t
on t.TeacherId=s.StudentTeacherId
go

---LEFT JOIN----
Select t.TeacherName,
       t.TeacherSubject,
	   s.StudentName,
	   s.StudentAge
From dbo.Student s
left join dbo.Teacher t
on t.TeacherID = s.StudentTeacherID
go

----RIGHT JOIN--------
Select t.TeacherName,
       t.TeacherSubject,
	   s.StudentName,
	   s.StudentAge
From dbo.Student s
Right join dbo.Teacher t
on t.TeacherID = s.StudentTeacherID
go

-------FULL OUTER JOIN ----

Select t.TeacherName,
       t.TeacherSubject,
	   s.StudentName,
	   s.StudentAge
From dbo.Student s
full join dbo.Teacher t
on t.TeacherID = s.StudentTeacherID
go


-------CROSS JOIN ---

Select t.TeacherName,
       t.TeacherSubject,
	   s.StudentName,
	   s.StudentAge
From dbo.Student s
Cross join dbo.Teacher t
go

---End----

