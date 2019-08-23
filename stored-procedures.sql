/*
--Create a Stored Procedure

CREATE PROCEDURE ListStudentsByName as 

select s.ID, concat(s.Lastname, ',', s.Firstname) as 'Name', s.SAT, s.GPA, isnull(m.Description, 'Undeclared') as 'Major'
From Student s
left join Major m
on s.MajorId=m.ID
Order by Name;

--Execute a Stored Procedure
exec ListStudentsByName

--Changing a Stored Procedure
ALTER PROCEDURE ListStudentsByName as 
BEGIN
select s.ID, concat(s.Lastname, ',', s.Firstname) as 'Student', s.SAT, s.GPA, isnull(m.Description, 'Undeclared') as 'Major'
From Student s
left join Major m
on s.MajorId=m.ID
Order by Student;
END
go
exec ListStudentsByName
go

*/

--Create a Parameter
CREATE PROCEDURE ListStudentsWithinGPA 
@LowGPA decimal(4,2),
@HighGPA decimal(4,2)

AS
BEGIN
select s.ID, concat(s.Lastname, ',', s.Firstname) as 'Student', s.SAT, s.GPA, isnull(m.Description, 'Undeclared') as 'Major'
From Student s
left join Major m
on s.MajorId=m.ID
Where s.GPA between @LowGPA and @HighGPA
Order by Student;

END
go
exec ListStudentsWithinGPA 2.5,3.5;
go

--You can set defaults in a Stored Procedure. It will run even if the parameter isnot set (check line 65).
ALTER PROCEDURE ListStudentsWithinGPA 
@LowGPA decimal(4,2) = 2.0,
@HighGPA decimal(4,2) = 3.0

AS
BEGIN
select s.ID, concat(s.Lastname, ',', s.Firstname) as 'Student', s.SAT, s.GPA, isnull(m.Description, 'Undeclared') as 'Major'
From Student s
left join Major m
on s.MajorId=m.ID
Where s.GPA between @LowGPA and @HighGPA
Order by Student;

END
go
exec ListStudentsWithinGPA;
go

-- Another way to do it 
ALTER PROCEDURE ListStudentsWithinGPA 
@LowGPA decimal(4,2) = 2.0,
@HighGPA decimal(4,2) = 3.0

AS
BEGIN
select s.ID, concat(s.Lastname, ',', s.Firstname) as 'Student', s.SAT, s.GPA, isnull(m.Description, 'Undeclared') as 'Major'
From Student s
left join Major m
on s.MajorId=m.ID
Where s.GPA between @LowGPA and @HighGPA
Order by Student;

END
go
exec ListStudentsWithinGPA @HighGPA = 3.2, @LowGPA = 2.5;
go

---Try with SAT Score 

