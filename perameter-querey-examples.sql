--Display students with SAT scores from 1000 to 1300
Select *
From Student
Where SAT >=1000 and SAT <=1300;

--Display the AVG student SAT score
Select AVG(SAT)
From Student;

--Students with SAT less that 1000 or more than 1400
Select *
From Student
Where SAT < 1000 or SAT > 1400;

--Count of Students with SAT scores from 1000 to 1300
Select Count(*)
From Student
Where SAT >=1000 and SAT <=1300;

--Count of Students with SAT scoresless that 1000 or more than 1400
Select Count(*)
From Student
Where SAT < 1000 or SAT > 1400;


/*Setting Parameter 
First declare the perameter exists
Use @ infront of the name of the parameter
Then tell it what type of date it will hold
End with a semi colone (;)

To set the values use the SET command*/

DECLARE @LowSAT int;
DECLARE @HighSAT int;

SET @LowSAT = 1000;
SET @HighSAT = 1400;

Select *
From Student
Where SAT < @LowSAT or SAT > @HighSAT;

--Display student where GPA are greater than or equal to 3.00
DECLARE @TargetGPA decimal(4,2);

SET @TargetGPA = 2.70;

Select *
From Student
Where GPA >= @TargetGPA;


