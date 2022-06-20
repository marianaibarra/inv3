CREATE TABLE [dbo].[Sales] (
    [IdSale]      INT      IDENTITY (1, 1) NOT NULL,
    [DateSale]    DATETIME NOT NULL,
    [IdPayMethod] INT      NOT NULL,
    [IdClient]    INT      NOT NULL,
    [Income]      MONEY    NOT NULL,
    [IdProduct]   INT      NOT NULL,
    PRIMARY KEY CLUSTERED ([IdSale] ASC),
    CONSTRAINT [FK_Sales_Client] FOREIGN KEY ([IdClient]) REFERENCES [dbo].[Clients] ([IdClient]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_Sales_PayMethod] FOREIGN KEY ([IdPayMethod]) REFERENCES [dbo].[PayMethods] ([IdPayMethod]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_Sales_Product] FOREIGN KEY ([IdProduct]) REFERENCES [dbo].[Products] ([IdProduct]) ON DELETE CASCADE ON UPDATE CASCADE
);

