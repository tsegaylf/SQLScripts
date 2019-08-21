--List all majors offered
Select *
From Major;

--List Students
Select *
From Student;

--List of students with major
Select s.Firstname, s.Lastname, m.Description
From Student s
join Major m 
on m.id = s.MajorId;

--Include in list all students even those that are undeclared (those with NULL value for major)
Select s.Firstname, s.Lastname, m.Description as 'Major'
From Student s
left join Major m 
on m.id = s.MajorId;

--Change the NULL values to 'Undeclared'
Select s.Firstname, s.Lastname, isnull(m.Description, 'Undeclared') as 'Major'
From Student s
left join Major m 
on m.id = s.MajorId;

--Add student GPA and SAT
Select s.Firstname, s.Lastname, s.GPA, s.SAT, isnull(m.Description, 'Undeclared') as 'Major'
From Student s
left join Major m 
on m.id = s.MajorId;

--Write a querey to tell you the number of students
Select count(*)
From Student;

--Find the max and min score for SAT and the avg GPA
Select Max(SAT)
From Student;

Select Min(SAT)
From Student;

Select AVG(GPA)
From Student;

