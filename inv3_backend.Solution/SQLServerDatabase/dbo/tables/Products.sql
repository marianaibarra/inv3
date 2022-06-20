CREATE TABLE [dbo].[Products] (
    [IdProduct]   INT           IDENTITY (1, 1) NOT NULL,
    [NameProduct]        VARCHAR(15)   NOT NULL,
    [ImageProduct]       VARCHAR (100) NOT NULL,
    [IdCategory]  INT           NOT NULL,
    [Price]       MONEY         NOT NULL,
    [UnitaryCost] MONEY         NOT NULL,
    [Quantity]    INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([IdProduct] ASC),
    CONSTRAINT [FK_Products_Category] FOREIGN KEY ([IdCategory]) REFERENCES [dbo].[Categories] ([IdCategory]) ON DELETE CASCADE ON UPDATE CASCADE
);

