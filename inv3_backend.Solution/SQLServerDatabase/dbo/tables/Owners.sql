CREATE TABLE [dbo].[Owners] (
    [IdOwner]  INT          IDENTITY (1, 1) NOT NULL,
    [Username] VARCHAR (15) NOT NULL,
    [Name]     VARCHAR (25) NOT NULL,
    [LastName] VARCHAR (25) NOT NULL,
    [Password] VARCHAR (80) NOT NULL,
    [Email]    VARCHAR (40) NOT NULL,
    [Phone]    VARCHAR (12) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdOwner] ASC),
    CONSTRAINT AK_Owneers_Username UNIQUE([Username])
);