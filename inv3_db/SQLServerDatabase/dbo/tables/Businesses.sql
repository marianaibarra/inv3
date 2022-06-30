CREATE TABLE [dbo].[Businesses] (
    [IdBussiness]    INT          IDENTITY (1, 1) NOT NULL,
    [NameBussiness]           VARCHAR (30) NOT NULL,
    [IdOwner]        INT          NOT NULL,
    [Finance]        MONEY        DEFAULT ((0)) NOT NULL,
    [IsCountBalance] BIT          DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdBussiness] ASC),
    CONSTRAINT [FK_Bussiness_Owner] FOREIGN KEY ([IdOwner]) REFERENCES [dbo].[Owners] ([IdOwner]) ON DELETE CASCADE ON UPDATE CASCADE
);

