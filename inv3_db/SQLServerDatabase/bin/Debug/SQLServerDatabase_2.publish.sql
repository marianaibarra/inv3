/*
Script de implementación para Inv3

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Inv3"
:setvar DefaultFilePrefix "Inv3"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detectar el modo SQLCMD y deshabilitar la ejecución del script si no se admite el modo SQLCMD.
Para volver a habilitar el script después de habilitar el modo SQLCMD, ejecute lo siguiente:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'El modo SQLCMD debe estar habilitado para ejecutar correctamente este script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE,
                DISABLE_BROKER 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'Creando Tabla [dbo].[Businesses]...';


GO
CREATE TABLE [dbo].[Businesses] (
    [IdBussiness]    INT          IDENTITY (1, 1) NOT NULL,
    [Name]           VARCHAR (30) NOT NULL,
    [IdOwner]        INT          NOT NULL,
    [Finance]        MONEY        NOT NULL,
    [IsCountBalance] BIT          NOT NULL,
    PRIMARY KEY CLUSTERED ([IdBussiness] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[Categories]...';


GO
CREATE TABLE [dbo].[Categories] (
    [idCategory] INT          IDENTITY (1, 1) NOT NULL,
    [category]   VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([idCategory] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[Clients]...';


GO
CREATE TABLE [dbo].[Clients] (
    [IdClient] INT          IDENTITY (1, 1) NOT NULL,
    [Name]     VARCHAR (30) NOT NULL,
    [LastName] VARCHAR (30) NOT NULL,
    [Address]  VARCHAR (15) NOT NULL,
    [Phone]    VARCHAR (12) NOT NULL,
    [Email]    VARCHAR (40) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdClient] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[Expenses]...';


GO
CREATE TABLE [dbo].[Expenses] (
    [IdExpense]   INT      IDENTITY (1, 1) NOT NULL,
    [DateExpense] DATETIME NOT NULL,
    [IdPayMethod] INT      NOT NULL,
    [IdProvider]  INT      NOT NULL,
    [Spent]       MONEY    NOT NULL,
    [IdProduct]   INT      NOT NULL,
    PRIMARY KEY CLUSTERED ([IdExpense] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[Orders]...';


GO
CREATE TABLE [dbo].[Orders] (
    [IdOrder]      INT          IDENTITY (1, 1) NOT NULL,
    [IdProduct]    INT          NOT NULL,
    [IdClient]     INT          NOT NULL,
    [OrderDate]    DATETIME     NOT NULL,
    [DeliveryDate] DATETIME     NOT NULL,
    [OrderOrigin]  VARCHAR (10) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdOrder] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[Owners]...';


GO
CREATE TABLE [dbo].[Owners] (
    [IdOwner]  INT          IDENTITY (1, 1) NOT NULL,
    [Username] VARCHAR (15) NOT NULL,
    [Name]     VARCHAR (25) NOT NULL,
    [LastName] VARCHAR (25) NOT NULL,
    [Password] VARCHAR (80) NOT NULL,
    [Email]    VARCHAR (40) NOT NULL,
    [Phone]    VARCHAR (12) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdOwner] ASC),
    CONSTRAINT [AK_Owneers_Username] UNIQUE NONCLUSTERED ([Username] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[PayMethods]...';


GO
CREATE TABLE [dbo].[PayMethods] (
    [idPayMethod] INT          IDENTITY (1, 1) NOT NULL,
    [payMethod]   VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([idPayMethod] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[Products]...';


GO
CREATE TABLE [dbo].[Products] (
    [IdProduct]   INT           IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (15)  NOT NULL,
    [Image]       VARCHAR (100) NOT NULL,
    [IdCategory]  INT           NOT NULL,
    [Price]       MONEY         NOT NULL,
    [UnitaryCost] MONEY         NOT NULL,
    [Quantity]    INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([IdProduct] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[Providers]...';


GO
CREATE TABLE [dbo].[Providers] (
    [idProvider] INT          IDENTITY (1, 1) NOT NULL,
    [name]       VARCHAR (30) NOT NULL,
    [address]    VARCHAR (15) NOT NULL,
    [phone]      VARCHAR (12) NOT NULL,
    [email]      VARCHAR (40) NOT NULL,
    PRIMARY KEY CLUSTERED ([idProvider] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[Sales]...';


GO
CREATE TABLE [dbo].[Sales] (
    [IdSale]      INT      IDENTITY (1, 1) NOT NULL,
    [DateSale]    DATETIME NOT NULL,
    [IdPayMethod] INT      NOT NULL,
    [IdClient]    INT      NOT NULL,
    [Income]      MONEY    NOT NULL,
    [IdProduct]   INT      NOT NULL,
    PRIMARY KEY CLUSTERED ([IdSale] ASC)
);


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[Businesses]...';


GO
ALTER TABLE [dbo].[Businesses]
    ADD DEFAULT ((0)) FOR [Finance];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[Businesses]...';


GO
ALTER TABLE [dbo].[Businesses]
    ADD DEFAULT ((0)) FOR [IsCountBalance];


GO
PRINT N'Creando Clave externa [dbo].[FK_Bussiness_Owner]...';


GO
ALTER TABLE [dbo].[Businesses] WITH NOCHECK
    ADD CONSTRAINT [FK_Bussiness_Owner] FOREIGN KEY ([IdOwner]) REFERENCES [dbo].[Owners] ([IdOwner]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [dbo].[FK_Expenses_PayMethod]...';


GO
ALTER TABLE [dbo].[Expenses] WITH NOCHECK
    ADD CONSTRAINT [FK_Expenses_PayMethod] FOREIGN KEY ([IdPayMethod]) REFERENCES [dbo].[PayMethods] ([idPayMethod]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [dbo].[FK_Expenses_Product]...';


GO
ALTER TABLE [dbo].[Expenses] WITH NOCHECK
    ADD CONSTRAINT [FK_Expenses_Product] FOREIGN KEY ([IdProduct]) REFERENCES [dbo].[Products] ([IdProduct]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [dbo].[FK_Expenses_Provider]...';


GO
ALTER TABLE [dbo].[Expenses] WITH NOCHECK
    ADD CONSTRAINT [FK_Expenses_Provider] FOREIGN KEY ([IdProvider]) REFERENCES [dbo].[Providers] ([idProvider]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [dbo].[FK_Orders_Product]...';


GO
ALTER TABLE [dbo].[Orders] WITH NOCHECK
    ADD CONSTRAINT [FK_Orders_Product] FOREIGN KEY ([IdProduct]) REFERENCES [dbo].[Products] ([IdProduct]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [dbo].[FK_Orders_Client]...';


GO
ALTER TABLE [dbo].[Orders] WITH NOCHECK
    ADD CONSTRAINT [FK_Orders_Client] FOREIGN KEY ([IdClient]) REFERENCES [dbo].[Clients] ([IdClient]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [dbo].[FK_Products_Category]...';


GO
ALTER TABLE [dbo].[Products] WITH NOCHECK
    ADD CONSTRAINT [FK_Products_Category] FOREIGN KEY ([IdCategory]) REFERENCES [dbo].[Categories] ([idCategory]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [dbo].[FK_Sales_Client]...';


GO
ALTER TABLE [dbo].[Sales] WITH NOCHECK
    ADD CONSTRAINT [FK_Sales_Client] FOREIGN KEY ([IdClient]) REFERENCES [dbo].[Clients] ([IdClient]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [dbo].[FK_Sales_PayMethod]...';


GO
ALTER TABLE [dbo].[Sales] WITH NOCHECK
    ADD CONSTRAINT [FK_Sales_PayMethod] FOREIGN KEY ([IdPayMethod]) REFERENCES [dbo].[PayMethods] ([idPayMethod]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [dbo].[FK_Sales_Product]...';


GO
ALTER TABLE [dbo].[Sales] WITH NOCHECK
    ADD CONSTRAINT [FK_Sales_Product] FOREIGN KEY ([IdProduct]) REFERENCES [dbo].[Products] ([IdProduct]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Procedimiento [dbo].[spProducts_Create]...';


GO
CREATE PROCEDURE [dbo].[spProducts_Create]
	@Name varchar(15),
	@Image varchar(100),
	@IdCategory int,
	@Price money,
	@UnitaryCost money,
	@Quantity int
AS
BEGIN

	INSERT INTO [dbo].[Products]
	VALUES (@Name, @Image, @IdCategory, @Price, @UnitaryCost, @Quantity );

END
GO
PRINT N'Creando Procedimiento [dbo].[spProducts_Delete]...';


GO
CREATE PROCEDURE [dbo].[spProducts_Delete]
	@IdProduct int = 0

AS
BEGIN
	DELETE FROM [dbo].[Products]
	WHERE [IdProduct] = @IdProduct;
END
GO
PRINT N'Creando Procedimiento [dbo].[spProducts_Get]...';


GO
CREATE PROCEDURE [dbo].[spProducts_Get]
AS
BEGIN
	
	set nocount on;
	SELECT [IdProduct], [Image], [IdCategory], [Price], [UnitaryCost],[Quantity]
	FROM [dbo].[Products];

END
GO
PRINT N'Creando Procedimiento [dbo].[spProducts_GetOne]...';


GO
CREATE PROCEDURE [dbo].[spProducts_GetOne]
	@IdProduct int
AS
BEGIN
	set nocount on;
	SELECT [IdProduct], [Image], [IdCategory], [Price], [UnitaryCost],[Quantity]
	FROM [dbo].[Products]
	WHERE [IdProduct] = @IdProduct;
END
GO
PRINT N'Creando Procedimiento [dbo].[spProducts_Update]...';


GO
CREATE PROCEDURE [dbo].[spProducts_Update]
	@IdProduct int,
	@Name varchar(15),
	@Image varchar(100),
	@IdCategory int,
	@Price money,
	@UnitaryCost money,
	@Quantity int
AS
BEGIN

	UPDATE [dbo].[Products]
	SET [Name] = @Name, 
		[Image] = @Image,
		[IdCategory] = @IdCategory,
		[Price] = @Price, 
		[UnitaryCost] = @UnitaryCost, 
		[Quantity] = @Quantity
	WHERE [IdProduct] = @IdProduct;

END
GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Businesses] WITH CHECK CHECK CONSTRAINT [FK_Bussiness_Owner];

ALTER TABLE [dbo].[Expenses] WITH CHECK CHECK CONSTRAINT [FK_Expenses_PayMethod];

ALTER TABLE [dbo].[Expenses] WITH CHECK CHECK CONSTRAINT [FK_Expenses_Product];

ALTER TABLE [dbo].[Expenses] WITH CHECK CHECK CONSTRAINT [FK_Expenses_Provider];

ALTER TABLE [dbo].[Orders] WITH CHECK CHECK CONSTRAINT [FK_Orders_Product];

ALTER TABLE [dbo].[Orders] WITH CHECK CHECK CONSTRAINT [FK_Orders_Client];

ALTER TABLE [dbo].[Products] WITH CHECK CHECK CONSTRAINT [FK_Products_Category];

ALTER TABLE [dbo].[Sales] WITH CHECK CHECK CONSTRAINT [FK_Sales_Client];

ALTER TABLE [dbo].[Sales] WITH CHECK CHECK CONSTRAINT [FK_Sales_PayMethod];

ALTER TABLE [dbo].[Sales] WITH CHECK CHECK CONSTRAINT [FK_Sales_Product];


GO
PRINT N'Actualización completada.';


GO
