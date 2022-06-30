CREATE TABLE [dbo].[Providers] (
    [IdProvider] INT          IDENTITY (1, 1) NOT NULL,
    [Name]       VARCHAR (30) NOT NULL,
    [Address]    VARCHAR (15) NOT NULL,
    [Phone]      VARCHAR (12) NOT NULL,
    [Email]      VARCHAR (40) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdProvider] ASC)
);

