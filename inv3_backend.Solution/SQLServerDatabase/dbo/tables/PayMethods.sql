CREATE TABLE [dbo].[PayMethods] (
    [IdPayMethod] INT          IDENTITY (1, 1) NOT NULL,
    [PayMethod]   VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdPayMethod] ASC)
);

