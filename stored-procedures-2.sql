/*
ALTER PROCEDURE AddUser
	@Username nvarchar(30),
	@Password nvarchar(30),
	@FirstName nvarchar(30),
	@LastName nvarchar(30),
	@Phone nvarchar(12) = null,
	@Email nvarchar(255) = null,
	@IsReviewer bit = 0,
	@IsAdmin bit = 0
As
BEGIN

IF EXISTS (SELECT Username FROM Users WHERE Username = @Username)
BEGIN
 Print 'There is already a user with the username of' + @Username
END

INSERT into Users
	(Username, Password, FirstName, LastName, Phone, Email, IsReviewer, IsAdmin)
	VALUES(@Username, @Password, @FirstName, @LastName, @Phone, @Email, @IsReviewer, @IsAdmin) 
IF @@ROWCOUNT != 1
BEGIN
	Print 'The insert failed';
	Return;
END
	Print 'The insert was successful!'
	Return;
END
GO 

ALTER PROCEDURE AddUser
	@Username nvarchar(30),
	@Password nvarchar(30),
	@FirstName nvarchar(30),
	@LastName nvarchar(30),
	@Phone nvarchar(12) = null,
	@Email nvarchar(255) = null,
	@IsReviewer bit = 0,
	@IsAdmin bit = 0
As
BEGIN

IF EXISTS (SELECT Username FROM Users WHERE Username = @Username)
BEGIN
 Print 'There is already a user with the username of' + @Username
END

INSERT into Users
	(Username, Password, FirstName, LastName, Phone, Email, IsReviewer, IsAdmin)
	VALUES(@Username, @Password, @FirstName, @LastName, @Phone, @Email, @IsReviewer, @IsAdmin) 
IF @@ROWCOUNT != 1
BEGIN
	Print 'The insert failed';
	Return;
END
	Print 'The insert was successful!'
	Return;
END
GO

EXEC AddUser @Username = 'SuperUser',
			@Password = 'SuperUser',
			@FirstName = 'SuperUser',
			@LastName = 'SuperUser';
GO

---------------
CREATE PROCEDURE ChangeUser
	@Username nvarchar(30),
	@Password nvarchar(30),
	@FirstName nvarchar(30),
	@LastName nvarchar(30),
	@Phone nvarchar(12),
	@Email nvarchar(255),
	@IsReviewer bit = 0,
	@IsAdmin bit = 0
As
BEGIN
DECLARE @Id int;

IF NOT EXISTS (SELECT * FROM Users WHERE Username = @Username)
BEGIN
	Print 'No user with username of' +@Username+ 'exists'
Return 	
END

 SELECT @iD = ID FROM Users WHERE Username = @Username

UPDATE Users SET
	Username = @Username, 
	Password = @Password, 
	FirstName = @FirstName, 
	LastName = @LastName, 
	Phone = @Phone, 
	Email = @Email, 
	IsReviewer = @IsReviewer,
	IsAdmin = @IsAdmin
	WHERE ID = @ID
	 
IF @@ROWCOUNT != 1

BEGIN
	Print 'The insert failed';
	Return;
END
	Print 'The insert was successful!';
	
END
GO
EXEC ChangeUser @Username = 'SuperUser',
			@Password = 'SuperUser',
			@FirstName = 'Super Duper',
			@LastName = 'User',
			@Phone = null,
			@Email = null, 
			@IsReviewer = 1, 
			@IsAdmin = 1;
GO


ALTER PROCEDURE RemoveUser
	@Username nvarchar(30)
AS
BEGIN
DECLARE @Id int;

IF NOT EXISTS (SELECT * FROM Users WHERE Username = @Username)
BEGIN
	Print 'No user with username of' + @Username + 'exists'
Return 	
END

 SELECT @iD = ID FROM Users WHERE Username = @Username

DELETE FROM Users 
WHERE @ID = ID
	
IF @@ROWCOUNT != 1

BEGIN
	Print 'The insert failed';
	Return;
END
	Print 'The insert was successful!';
	
END
GO
EXEC RemoveUser @Username = 'SuperUser';

GO

*/