/*
Create Database PrsDB; 

--Move to database PrsDB before creating tables

Create Table [User] (
ID int not null Primary Key identity(1,1), 
Username nvarchar(30) not null Constraint AK_Username UNIQUE (Username),
Password nvarchar(30) not null,
FirstName nvarchar(30) not null,
LastName nvarchar(30) not null,
Phone nvarchar(12) null,
Email nvarchar(255) null,
IsReviewer bit not null default 1,
IsAdmin bit not null default 1
);

Select *
From [User]; 

--Vendor Table
Create Table Vendor (
ID int not null Primary Key identity(1,1), 
Code nvarchar(30) not null Constraint AK_Code UNIQUE (Code),
Name nvarchar(30) not null,
Address nvarchar(30) not null,
City nvarchar(30) not null,
State nvarchar(2) not null,
Phone nvarchar(12) null,
Email nvarchar(255) null
);

Select *
From vendor;

-- Products
Create Table Products (
ID int not null Primary Key identity(1,1), 
PartNbr nvarchar(30) not null Constraint AK_PartNbr UNIQUE (PartNbr),
Name nvarchar(30) not null,
Price Decimal(11,2) not null,
Unit nvarchar(30) not null,
PhotoPath nvarchar(255) null,
VendorID int not null Foreign Key References Vendor(ID),
);

Select *
From Products;

--Request
Create Table Request (
ID int not null Primary Key identity(1,1), 
Description nvarchar(80) not null,
Justification nvarchar(80) not null,
RejectionReason nvarchar(80) not null,
DiliveryMode nvarchar(20) not null DEFAULT 'Pickup',
Status nvarchar(10) not null DEFAULT 'NEW',
Total Decimal(11,2) not null DEFAULT 0,
UserID int not null Foreign Key References [User](ID),
);

Select *
From Request;

--RequestLine
Create Table RequestLine (
ID int not null Primary Key identity(1,1), 
RequestID int not null Foreign Key References Request(ID),
QuantityID int not null Foreign Key References Products(ID) DEFAULT 1,
);

Select *
From RequestLine;


--Insert RequestLine
Insert into RequestLine
(RequestID,QuantityID)
Values (4, 1);

--Insert Vendor

Insert into Vendor
(Code, Name, Address, City, State, Phone, Email)
Values ('MAXA', 'MAX Atletics', '123 Beach St', 'Cincinnati', 'OH', '513-098-7642', 'practice@Maxatletics.com')

--Insert Products

Insert into Products
(PartNbr, Name, Price, Unit, VendorID)
Values (8, 'Soccer Ball', 14.98, 5, 1)

--Insert Request
Insert into Request
(Description, Justification, RejectionReason, Status, Total, UserID)
Values ('Soccer Ball', 'Malfunction', 'Deflated', 'InRoute', 14.98, 1)

--Insert User
Insert into [USER]
(Username, Password, FirstName, LastName, Phone, Email, IsReviewer)
Values ('okuwmoc', 'Chi!X', 'Chi', 'Oku', '513-239-8465', 'chiamaka@Maxtrain.com', 1)

Insert into [USER]
(Username, Password, FirstName, LastName, Phone, Email, IsReviewer, IsAdmin)
Values ('tsegaylf', 'Phil!X', 'Li', 'Tse', '513-009-8765', 'lidya@Maxtrain.com', 1, 1)

Insert into [USER]
(Username, Password, FirstName, LastName, Phone, Email, IsReviewer, IsAdmin)
Values ('asgedomyn', 'Y0n!3-', 'Yoh', 'Asg', '723-009-8765', 'Yohanna@Maxtrain.com', 1, 1)


*/

Select *
From [User];

