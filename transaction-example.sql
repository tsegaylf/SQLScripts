--Insert a new student "Jane Doe" 
Insert into Student (ID, Firstname, Lastname, SAT, GPA, MajorID) 
Values (999, 'Jane', 'Doe', 1200, 3.2, null);

--Delete 'Jane Doe'
DELETE from Student
Where ID = 999;

--Insert a new student "John Smith" with the MajorID of 999
--This will not work because the MajorID is a FK 
--Values in that column have to exist in another table (Major table)
Insert into Student (ID, Firstname, Lastname, SAT, GPA, MajorID) 
Values (998, 'John', 'Smith', 1000, 2.7, 999);

--To verify 
Select *
From Student
Where ID = 999;

Select *
From Student
Where ID in (999, 998);

--To correct the "John Smith" entry use a Transaction clause
Begin Transaction

Insert into Student (ID, Firstname, Lastname, SAT, GPA, MajorID) 
Values (999, 'Jane', 'Doe', 1200, 3.2, null);

If @@ROWCOUNT <> 1 
BEGIN 
   Rollback Transaction
END

Insert into Student (ID, Firstname, Lastname, SAT, GPA, MajorID) 
Values (998, 'John', 'Smith', 1000, 2.7, 999);

If @@ROWCOUNT <> 1 
BEGIN 
   Rollback Transaction
END

Commit Transaction



