CREATE TABLE [dbo].[Expenses] (
    [IdExpense]   INT      IDENTITY (1, 1) NOT NULL,
    [DateExpense] DATETIME NOT NULL,
    [IdPayMethod] INT      NOT NULL,
    [IdProvider]  INT      NOT NULL,
    [Spent]       MONEY    NOT NULL,
    [IdProduct]   INT      NOT NULL,
    PRIMARY KEY CLUSTERED ([IdExpense] ASC),
    CONSTRAINT [FK_Expenses_PayMethod] FOREIGN KEY ([IdPayMethod]) REFERENCES [dbo].[PayMethods] ([IdPayMethod]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_Expenses_Product] FOREIGN KEY ([IdProduct]) REFERENCES [dbo].[Products] ([IdProduct]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_Expenses_Provider] FOREIGN KEY ([IdProvider]) REFERENCES [dbo].[Providers] ([IdProvider]) ON DELETE CASCADE ON UPDATE CASCADE
);

