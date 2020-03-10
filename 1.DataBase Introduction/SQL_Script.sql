USE [master]
GO
IF DB_ID('ChatDB') IS NOT NULL
	BEGIN 
		DROP DATABASE ChatDB;
	END
GO

GO
CREATE DATABASE [ChatDB]
GO

GO
CREATE TABLE [User](
	ID BIGINT NOT NULL,
	FirstName NVARCHAR(255) NOT NULL,
	LastName NVARCHAR(255) NOT NULL,
	Email NVARCHAR(255) NOT NULL UNIQUE,
	Registered DATETIME2 DEFAULT GETDATE()
);
GO

GO
CREATE TABLE [ActivityUsers](
	
	ActivityID BIGINT NOT NULL,
	ID_User BIGINT NOT NULL,
	TrackUser DATETIME2 NOT NULL DEFAULT GETDate(),
	[Status] BIT NOT NULL DEFAULT (0)
);
GO

GO
CREATE TABLE [Chat](
	Chat_ID BIGINT NOT NULL,
	Created DATETIME2 NOT NULL,
	[Name] NVARCHAR(255) NOT NULL,
);

GO

GO
CREATE TABLE [MessageHistory](
	Message_ID BIGINT NOT NULL,
	[User_Id] BIGINT NOT NULL,
	ChatID BIGINT NOT NULL,
	MessageText NVARCHAR(255)
);
GO

GO
CREATE TABLE [Media](
	ID_Attachment BIGINT NOT NULL,
	Uploaded DATETIME2 DEFAULT GETDATE(),
	ID_User BIGINT NOT NULL
);

GO

GO
CREATE TABLE [BlockList](
	
	ID_User BIGINT NOT NULL,
	BlockedDate DATETIME2 DEFAULT GETDATE(),
	UnblockedDate DATETIME2 NULL
);
GO