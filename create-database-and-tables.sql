/* --Make a database. Make sure you are in Master when doing this step.

Create Database Apprenti; 


--Switch to the Apprenti database when creating tables
Create Table TechTrac (
ID char(4) not null Primary Key,
Description nvarchar(30) not null,
NbrOfWeeks int not null, 
Available bit not null
);


Create Table Developers (
ID int not null Primary Key, --If we want Id to generate randomly use identity(x,y)
FirstName nvarchar(30) not null,
LastName nvarchar(30) not null,
Phone nvarchar(20) not null, --It is a nvarchar because there is no reason for it to be an interger/not needed for any function 
PrimaryEmail nvarchar(255) not null,
SecondaryEmail nvarchar(255) null,
City nvarchar(50) not null default 'Cincinnati', --This has a default only because this database is for the Cincinnati students
State nchar(2) not null default 'OH',
Active bit not null default 1, --Specify a default, True by default 
TechTracID char(4) not null Foreign Key References TechTrac(ID) --you need to Reference the FK to the PK
);


--When inputting data you will need to input into TechTrac first before inputting into the Developers table, because of the PK and FK relationship

select *
From Developers;


Select *
From TechTrac;


Insert into TechTrac (ID, Description, NbrOfWeeks, Available)
Values ('DNET', 'Dot Net', 12, 1);

Insert into TechTrac (ID, Description, NbrOfWeeks, Available)
Values ('JAVA', 'JAVA Software Developer', 12, 1);

Insert into TechTrac (ID, Description, NbrOfWeeks, Available)
Values ('NSEC', 'Network Security Administrator', 8, 1);


Insert into Developers
(ID, FirstName, LastName, Phone, PrimaryEmail, SecondaryEmail, TechTracID)
Values (8, 'Lidya', 'Tsegay', 513-501-8332, 'lidyaphillipos@gmail.com', null, 'DNET')

Insert into Developers
(ID, FirstName, LastName, Phone, PrimaryEmail, SecondaryEmail, TechTracID)
Values (12, 'Justin', 'Dudley', 513-801-8332, 'justin@maxtrain.com', null, 'DNET')

Insert into Developers
(ID, FirstName, LastName, Phone, PrimaryEmail, SecondaryEmail, TechTracID)
Values (17, 'Tricia', 'Good', 513-701-8332, 'justin@maxtrain.com', null, 'DNET')


Select FirstName, LastName, Description as 'Program'
From Developers d
Join TechTrac t
on t.ID = d.TechTracID;

Create Table TechTopics (
ClassID int not null Primary Key identity(1,1),
ClassDescription nvarchar(80) not null
);

.NET Topics
Insert into TechTopics (ClassDescription) Values ('Git/Github')
Insert into TechTopics (ClassDescription) Values ('SQL Server')
Insert into TechTopics (ClassDescription) Values ('C#')
Insert into TechTopics (ClassDescription) Values ('EntityFramework')
Insert into TechTopics (ClassDescription) Values ('MVC')
Insert into TechTopics (ClassDescription) Values ('WebApi')
Insert into TechTopics (ClassDescription) Values ('HTML')
Insert into TechTopics (ClassDescription) Values ('CSS')
Insert into TechTopics (ClassDescription) Values ('JavaScript')
Insert into TechTopics (ClassDescription) Values ('Bootstrap')
Insert into TechTopics (ClassDescription) Values ('jQuerey')
Insert into TechTopics (ClassDescription) Values ('Typescript')
Insert into TechTopics (ClassDescription) Values ('Angular')

--JAVA Topics
Insert into TechTopics (ClassDescription) Values ('MySql')
Insert into TechTopics (ClassDescription) Values ('Java')
Insert into TechTopics (ClassDescription) Values ('Hibernate')
Insert into TechTopics (ClassDescription) Values ('Spring')
Insert into TechTopics (ClassDescription) Values ('JPA')


--Create a table to accomidate the manay to many relationship between TechTopics and TechTrac
Create Table TechTracTopics (
ID int not null Primary Key identity(1,1),
TechTracID char(4) not null Foreign Key References TechTrac(ID), 
TechTopicsID int not null Foreign Key References TechTopics(ClassID)
);


Select ClassID 
From TechTopics 
Where ClassDescription = 'Git/Github';

Select *
From TechTrac;

Select *
From TechTopics;

Select *
From TechTracTopics;

--1
Declare @GitGithubID int;
Select @GitGithubID = ClassID From TechTopics Where ClassDescription = 'Git/Github';

Insert TechTracTopics (TechTracID, TechTopicsID) Values ('DNET', @GitGithubID);
Insert TechTracTopics (TechTracID, TechTopicsID) Values ('JAVA', @GitGithubID);

--2
Declare @SQLServerID int;
Select @SQLServerID = ClassID From TechTopics Where ClassDescription = 'SQL Server';

Insert TechTracTopics (TechTracID, TechTopicsID) Values ('DNET', @SQLServerID);
Insert TechTracTopics (TechTracID, TechTopicsID) Values ('JAVA', @SQLServerID);

--3
Declare @C#ID int;
Select @C#ID = ClassID From TechTopics Where ClassDescription = 'C#';

Insert TechTracTopics (TechTracID, TechTopicsID) Values ('DNET', @C#ID); 
Insert TechTracTopics (TechTracID, TechTopicsID) Values ('JAVA', @C#ID);

--4
Declare @EntityFrameworkID int;
Select @EntityFrameworkID = ClassID From TechTopics Where ClassDescription = 'EntityFramework';

Insert TechTracTopics (TechTracID, TechTopicsID) Values ('DNET', @EntityFrameworkID);


--5
Declare @MVCID int;
Select @MVCID = ClassID From TechTopics Where ClassDescription = 'MVC';

Insert TechTracTopics (TechTracID, TechTopicsID) Values ('DNET', @MVCID);

--6
Declare @MySQLID int;
Select @MySQLID = ClassID From TechTopics Where ClassDescription = 'MySql';

Insert TechTracTopics (TechTracID, TechTopicsID) Values ('JAVA', @MYSQLID);

--7
Declare @JavaID int;
Select @JavaID = ClassID From TechTopics Where ClassDescription = 'Java';

Insert TechTracTopics (TechTracID, TechTopicsID) Values ('JAVA', @JavaID);


--First try was incorrect. Look at second one for correct Select statement, leaving it for reference on join. 
Select *
From TechTrac a
join TechTracTopics b
on a.id = b.TechTracId
join TechTopics c
on c.classid = b.TechTopicsID
Where a.Description = 'Git/Github';

Select a.ClassDescription, c.ID, c.Description
From TechTopics a
join TechTracTopics b
on a.classid = b.TechTopicsId
join TechTrac c
on c.ID = b.TechTracID
Where a.ClassDescription = 'Java';

Create Table Contacts (
ID int not null Primary Key identity(1,1), 
FirstName nvarchar(30) not null,
LastName nvarchar(30) not null,
Phone nvarchar(20) not null, 
PrimaryEmail nvarchar(255) not null,
SecondaryEmail nvarchar(255) null,
Relationship nvarchar(30) not null,
Address nvarchar(50) null,
City nvarchar(50) not null, 
State nchar(2) not null,
Birthday DateTime null,
Favorite bit not null default 1,
LastContact DateTime not null
);

--1
INSERT into Contacts
 (FirstName, LastName, Phone, PrimaryEmail, Relationship, City, State, Birthday, Favorite, LastContact)
Values ('Jane', 'Doe', '513-123-4567', 'JaneDoe@gmail.com', 'Best Friend', 'Newport', 'KY', '1988-01-01', 1, '2019-08-22');


Select *
From Contacts;

*/
 

go
Alter table Contacts --Alter to add new column
	add BFF bit default 0;
go
Alter table Contacts --Alter exisiting column
	add column Address nvarchar(50);
go
Alter table Contacts -- 
	Drop Constraints [DF_Contacts_Favori_66603565]
go
Alter table Contacts --
	Drop column Favorite;
	go








