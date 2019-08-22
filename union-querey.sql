--Students with GPA 3.00 and above
Select 'Green' as 'Color', *
From Student
Where GPA >= 3.00;

--Students with GPA below 3.00
Select 'Blue' as 'Color', *
From Student
Where not GPA >= 3.00;

---Form a union to creat one table with both 'blue' and 'green' students
Select 'Green' as 'Color', *
From Student
Where GPA >= 3.00
union
Select 'Blue' as 'Color', *
From Student
Where not GPA >= 3.00
Order by GPA;

--Add another union
Select 'Green' as 'Color', *
From Student
Where GPA >= 3.00
union
Select 'Blue' as 'Color', *
From Student
Where GPA >= 2.5 and GPA <3.00
union
Select 'Orange' as Color, *
From Student
Where GPA < 2.5
Order by GPA;
