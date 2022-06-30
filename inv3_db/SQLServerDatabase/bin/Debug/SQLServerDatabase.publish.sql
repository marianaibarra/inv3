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
/*
La columna Email de la tabla [dbo].[Clients] debe cambiarse de NULL a NOT NULL. Si la tabla contiene datos, puede que no funcione el script ALTER. Para evitar esta incidencia, debe agregar valores en todas las filas de esta columna, marcar la columna de modo que permita valores NULL o habilitar la generación de valores predeterminados inteligentes como opción de implementación.

La columna LastName de la tabla [dbo].[Clients] debe cambiarse de NULL a NOT NULL. Si la tabla contiene datos, puede que no funcione el script ALTER. Para evitar esta incidencia, debe agregar valores en todas las filas de esta columna, marcar la columna de modo que permita valores NULL o habilitar la generación de valores predeterminados inteligentes como opción de implementación.
*/

IF EXISTS (select top 1 1 from [dbo].[Clients])
    RAISERROR (N'Se detectaron filas. La actualización del esquema va a terminar debido a una posible pérdida de datos.', 16, 127) WITH NOWAIT

GO
/*
Se está quitando la columna [dbo].[Expenses].[income]; puede que se pierdan datos.

Debe agregarse la columna [dbo].[Expenses].[Spent] de la tabla [dbo].[Expenses], pero esta columna no tiene un valor predeterminado y no admite valores NULL. Si la tabla contiene datos, el script ALTER no funcionará. Para evitar esta incidencia, agregue un valor predeterminado a la columna, márquela de modo que permita valores NULL o habilite la generación de valores predeterminados inteligentes como opción de implementación.
*/

IF EXISTS (select top 1 1 from [dbo].[Expenses])
    RAISERROR (N'Se detectaron filas. La actualización del esquema va a terminar debido a una posible pérdida de datos.', 16, 127) WITH NOWAIT

GO
/*
La columna LastName de la tabla [dbo].[Owners] debe cambiarse de NULL a NOT NULL. Si la tabla contiene datos, puede que no funcione el script ALTER. Para evitar esta incidencia, debe agregar valores en todas las filas de esta columna, marcar la columna de modo que permita valores NULL o habilitar la generación de valores predeterminados inteligentes como opción de implementación.

La columna Phone de la tabla [dbo].[Owners] debe cambiarse de NULL a NOT NULL. Si la tabla contiene datos, puede que no funcione el script ALTER. Para evitar esta incidencia, debe agregar valores en todas las filas de esta columna, marcar la columna de modo que permita valores NULL o habilitar la generación de valores predeterminados inteligentes como opción de implementación.
*/

IF EXISTS (select top 1 1 from [dbo].[Owners])
    RAISERROR (N'Se detectaron filas. La actualización del esquema va a terminar debido a una posible pérdida de datos.', 16, 127) WITH NOWAIT

GO
/*
Debe agregarse la columna [dbo].[Products].[Name] de la tabla [dbo].[Products], pero esta columna no tiene un valor predeterminado y no admite valores NULL. Si la tabla contiene datos, el script ALTER no funcionará. Para evitar esta incidencia, agregue un valor predeterminado a la columna, márquela de modo que permita valores NULL o habilite la generación de valores predeterminados inteligentes como opción de implementación.
*/

IF EXISTS (select top 1 1 from [dbo].[Products])
    RAISERROR (N'Se detectaron filas. La actualización del esquema va a terminar debido a una posible pérdida de datos.', 16, 127) WITH NOWAIT

GO
PRINT N'Quitando Clave externa [dbo].[FK_Expenses_PayMethod]...';


GO
ALTER TABLE [dbo].[Expenses] DROP CONSTRAINT [FK_Expenses_PayMethod];


GO
PRINT N'Quitando Clave externa [dbo].[FK_Expenses_Provider]...';


GO
ALTER TABLE [dbo].[Expenses] DROP CONSTRAINT [FK_Expenses_Provider];


GO
PRINT N'Quitando Clave externa [dbo].[FK_Expenses_Product]...';


GO
ALTER TABLE [dbo].[Expenses] DROP CONSTRAINT [FK_Expenses_Product];


GO
PRINT N'Quitando Clave externa [dbo].[FK_Products_Category]...';


GO
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Products_Category];


GO
PRINT N'Quitando Clave externa [dbo].[FK_Sales_Product]...';


GO
ALTER TABLE [dbo].[Sales] DROP CONSTRAINT [FK_Sales_Product];


GO
PRINT N'Modificando Tabla [dbo].[Clients]...';


GO
ALTER TABLE [dbo].[Clients] ALTER COLUMN [email] VARCHAR (40) NOT NULL;

ALTER TABLE [dbo].[Clients] ALTER COLUMN [lastName] VARCHAR (30) NOT NULL;


GO
PRINT N'Iniciando recompilación de la tabla [dbo].[Expenses]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Expenses] (
    [IdExpense]   INT      IDENTITY (1, 1) NOT NULL,
    [DateExpense] DATETIME NOT NULL,
    [IdPayMethod] INT      NOT NULL,
    [IdProvider]  INT      NOT NULL,
    [Spent]       MONEY    NOT NULL,
    [IdProduct]   INT      NOT NULL,
    PRIMARY KEY CLUSTERED ([IdExpense] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Expenses])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Expenses] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Expenses] ([IdExpense], [dateExpense], [idPayMethod], [idProvider], [idProduct])
        SELECT   [IdExpense],
                 [dateExpense],
                 [idPayMethod],
                 [idProvider],
                 [idProduct]
        FROM     [dbo].[Expenses]
        ORDER BY [IdExpense] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Expenses] OFF;
    END

DROP TABLE [dbo].[Expenses];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Expenses]', N'Expenses';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Modificando Tabla [dbo].[Owners]...';


GO
ALTER TABLE [dbo].[Owners] ALTER COLUMN [lastName] VARCHAR (25) NOT NULL;

ALTER TABLE [dbo].[Owners] ALTER COLUMN [phone] VARCHAR (12) NOT NULL;


GO
PRINT N'Creando Restricción UNIQUE [dbo].[AK_Owneers_Username]...';


GO
ALTER TABLE [dbo].[Owners]
    ADD CONSTRAINT [AK_Owneers_Username] UNIQUE NONCLUSTERED ([Username] ASC);


GO
PRINT N'Iniciando recompilación de la tabla [dbo].[Products]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Products] (
    [IdProduct]   INT           IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (15)  NOT NULL,
    [Image]       VARCHAR (100) NOT NULL,
    [IdCategory]  INT           NOT NULL,
    [Price]       MONEY         NOT NULL,
    [UnitaryCost] MONEY         NOT NULL,
    [Quantity]    INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([IdProduct] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Products])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Products] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Products] ([IdProduct], [image], [idCategory], [price], [unitaryCost], [quantity])
        SELECT   [IdProduct],
                 [image],
                 [idCategory],
                 [price],
                 [unitaryCost],
                 [quantity]
        FROM     [dbo].[Products]
        ORDER BY [IdProduct] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Products] OFF;
    END

DROP TABLE [dbo].[Products];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Products]', N'Products';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


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
PRINT N'Creando Clave externa [dbo].[FK_Expenses_PayMethod]...';


GO
ALTER TABLE [dbo].[Expenses] WITH NOCHECK
    ADD CONSTRAINT [FK_Expenses_PayMethod] FOREIGN KEY ([IdPayMethod]) REFERENCES [dbo].[PayMethods] ([idPayMethod]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [dbo].[FK_Expenses_Provider]...';


GO
ALTER TABLE [dbo].[Expenses] WITH NOCHECK
    ADD CONSTRAINT [FK_Expenses_Provider] FOREIGN KEY ([IdProvider]) REFERENCES [dbo].[Providers] ([idProvider]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [dbo].[FK_Expenses_Product]...';


GO
ALTER TABLE [dbo].[Expenses] WITH NOCHECK
    ADD CONSTRAINT [FK_Expenses_Product] FOREIGN KEY ([IdProduct]) REFERENCES [dbo].[Products] ([IdProduct]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [dbo].[FK_Products_Category]...';


GO
ALTER TABLE [dbo].[Products] WITH NOCHECK
    ADD CONSTRAINT [FK_Products_Category] FOREIGN KEY ([IdCategory]) REFERENCES [dbo].[Categories] ([idCategory]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa [dbo].[FK_Sales_Product]...';


GO
ALTER TABLE [dbo].[Sales] WITH NOCHECK
    ADD CONSTRAINT [FK_Sales_Product] FOREIGN KEY ([IdProduct]) REFERENCES [dbo].[Products] ([IdProduct]) ON DELETE CASCADE ON UPDATE CASCADE;


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
PRINT N'Modificando Procedimiento [dbo].[spProducts_Get]...';


GO
ALTER procedure [dbo].[spProducts_Get]
AS
BEGIN
	
	set nocount on;
	SELECT [idProduct], [image], [idCategory], [price], [unitaryCost],[quantity]
	FROM [dbo].[Products];

END
GO
PRINT N'Creando Procedimiento [dbo].[spProducts_Create]...';


GO
CREATE PROCEDURE [dbo].[spProducts_Create]
	@name varchar(15),
	@image varchar(100),
	@idCategory int,
	@price money,
	@unitaryCost money,
	@quantity int
AS
BEGIN

	INSERT INTO [dbo].[Products]
	VALUES (@name, @image, @idCategory, @price, @unitaryCost, @quantity );

END
GO
PRINT N'Creando Procedimiento [dbo].[spProducts_Delete]...';


GO
CREATE PROCEDURE [dbo].[spProducts_Delete]
	@idProduct int = 0

AS
BEGIN
	DELETE FROM [dbo].[Products]
	WHERE [idProduct] = @idProduct;
END
GO
PRINT N'Creando Procedimiento [dbo].[spProducts_GetOne]...';


GO
CREATE PROCEDURE [dbo].[spProducts_GetOne]
	@id int
AS
BEGIN
	set nocount on;
	SELECT [idProduct], [image], [idCategory], [price], [unitaryCost],[quantity]
	FROM [dbo].[Products]
	WHERE [idProduct] = @id;
END
GO
PRINT N'Creando Procedimiento [dbo].[spProducts_Update]...';


GO
CREATE PROCEDURE [dbo].[spProducts_Update]
	@idProduct int,
	@name varchar(15),
	@image varchar(100),
	@idCategory int,
	@price money,
	@unitaryCost money,
	@quantity int
AS
BEGIN

	UPDATE [dbo].[Products]
	SET [name] = @name, 
		[image] = @image,
		[idCategory] = @idCategory,
		[price] = @price, 
		[unitaryCost] = @unitaryCost, 
		[quantity] = @quantity
	WHERE [idProduct] = @idProduct;

END
GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Expenses] WITH CHECK CHECK CONSTRAINT [FK_Expenses_PayMethod];

ALTER TABLE [dbo].[Expenses] WITH CHECK CHECK CONSTRAINT [FK_Expenses_Provider];

ALTER TABLE [dbo].[Expenses] WITH CHECK CHECK CONSTRAINT [FK_Expenses_Product];

ALTER TABLE [dbo].[Products] WITH CHECK CHECK CONSTRAINT [FK_Products_Category];

ALTER TABLE [dbo].[Sales] WITH CHECK CHECK CONSTRAINT [FK_Sales_Product];

ALTER TABLE [dbo].[Orders] WITH CHECK CHECK CONSTRAINT [FK_Orders_Product];

ALTER TABLE [dbo].[Orders] WITH CHECK CHECK CONSTRAINT [FK_Orders_Client];


GO
PRINT N'Actualización completada.';


GO
