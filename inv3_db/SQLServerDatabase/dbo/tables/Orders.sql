CREATE TABLE [dbo].[Orders]
(
	[IdOrder] INT NOT NULL IDENTITY (1,1),
	[IdProduct] INT NOT NULL,
	[IdClient] INT NOT NULL,
	[OrderDate] DATETIME NOT NULL,
	[DeliveryDate] DATETIME NOT NULL,
	[OrderOrigin] varchar(10) NOT NULL,
	PRIMARY KEY CLUSTERED ([IdOrder] ASC),
    CONSTRAINT [FK_Orders_Product] FOREIGN KEY ([IdProduct]) REFERENCES [dbo].[Products] ([IdProduct]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_Orders_Client] FOREIGN KEY ([IdClient]) REFERENCES [dbo].[Clients] ([IdClient]) ON DELETE CASCADE ON UPDATE CASCADE,
)
