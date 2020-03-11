GO
IF DB_ID('ChatDB') IS NOT NULL 
BEGIN
	DROP DATABASE ChatDB;
END
GO

GO
CREATE DATABASE [ChatDB]
GO


USE [ChatDB]
IF OBJECT_ID(N'User',N'U') IS NOT NULL
	DROP TABLE [User]
ELSE
	
	CREATE TABLE [User]
	(
		ID BIGINT IDENTITY (1,1) NOT NULL,
		FirstName NVARCHAR(255) NOT NULL,
		LastName NVARCHAR(255)NOT NULL,
		Email NVARCHAR(255) NOT NULL UNIQUE, 
		PRIMARY KEY (ID)
	);

IF OBJECT_ID(N'User',N'U') IS NOT NULL
	DROP TABLE [Users]
ELSE
CREATE TABLE Users
	(
		ID_Record BIGINT IDENTITY (1,1) NOT NULL,
		ID BIGINT NOT NULL,
		Created DATETIME2 DEFAULT GETDATE(),
		PRIMARY KEY(ID_Record),
		FOREIGN KEY (ID) REFERENCES [User](ID)
	);



IF OBJECT_ID(N'User',N'U') IS NOT NULL
	DROP TABLE [BlockList]
ELSE
CREATE TABLE BlockList
(
	ID_Record BIGINT IDENTITY (1,1) NOT NULL,
	ID_Entity BIGINT NOT NULL,
	Blocked DATETIME2 DEFAULT GETDATE(),
	Unblocked DATETIME2 DEFAULT GETDATE()
	PRIMARY KEY(ID_Record),
	FOREIGN KEY(ID_Entity) REFERENCES [User](ID)
);

IF OBJECT_ID(N'User',N'U') IS NOT NULL
	DROP TABLE [Chat]
ELSE
CREATE TABLE Chat
(
	ID BIGINT IDENTITY (1,1) NOT NULL,
	ChatRoomName NVARCHAR(255) NOT NULL UNIQUE CHECK (ChatRoomName LIKE '[a-z]') ,
	Created DATETIME2 DEFAULT GETDATE(),
	Active BIT DEFAULT 0,
	AdminRoom BIGINT NOT NULL,
	PRIMARY KEY(ID)
);

IF OBJECT_ID(N'User',N'U') IS NOT NULL
	DROP TABLE [Message_records]
ELSE
CREATE TABLE Message_records(
	ID BIGINT IDENTITY (1,1) NOT NULL,
	message_text NVARCHAR(255),
	Created DATETIME2 DEFAULT GETDATE(),
	ID_User BIGINT NOT NULL,
	Chat_Name NVARCHAR(255) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY(ID_User) REFERENCES  [User](ID),
	FOREIGN KEY (Chat_Name) REFERENCES Chat(ChatRoomName) ON UPDATE CASCADE
);


IF OBJECT_ID(N'User',N'U') IS NOT NULL
	DROP TABLE [Active_Users]
ELSE
CREATE TABLE Active_Users 
(
	ID_User BIGINT IDENTITY (1,1) NOT NULL,
	Chat_ID BIGINT NOT NULL,
	UserSession NVARCHAR(255) NOT NULL UNIQUE,
	PRIMARY KEY(ID_User),
	FOREIGN KEY(CHAT_ID) REFERENCES Chat(ID)
);

IF OBJECT_ID(N'User',N'U') IS NOT NULL
	DROP TABLE [Media]
ELSE
CREATE TABLE Media 
(
	ID_Attachment BIGINT IDENTITY (1,1) NOT NULL ,
	AttachementName NVARCHAR(255) CHECK (AttachementName NOT LIKE '%[a-z]%') ,
	Size INT ,
	ID_User BIGINT NOT NULL,
	FOREIGN KEY(ID_User) REFERENCES  [User](ID),
	PRIMARY KEY (ID_Attachment),
);
