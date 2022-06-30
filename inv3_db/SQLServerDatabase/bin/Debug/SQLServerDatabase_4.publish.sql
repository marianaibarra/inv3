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
PRINT N'La siguiente operación se generó a partir de un archivo de registro de refactorización f31b6482-5e7f-4900-a647-4d8e72068301';

PRINT N'Cambiar el nombre de [dbo].[Businesses].[Name] a NameBussiness';


GO
EXECUTE sp_rename @objname = N'[dbo].[Businesses].[Name]', @newname = N'NameBussiness', @objtype = N'COLUMN';


GO
PRINT N'Creando Procedimiento [dbo].[spBusinesses_Delete]...';


GO
CREATE PROCEDURE [dbo].[spBusinesses_Delete]
    @IdBussiness int
AS
BEGIN TRY

    DELETE FROM [dbo].[Businesses]
    WHERE [IdBussiness] = @IdBussiness;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spBusinesses_Get]...';


GO
CREATE PROCEDURE [dbo].[spBusinesses_Get]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdBussiness],[NameBussiness],[IdOwner],[Finance],[IsCountBalance]
    FROM [dbo].[Businesses]

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spBusinesses_GetOne]...';


GO
CREATE PROCEDURE [dbo].[spBusinesses_GetOne]
    @IdBussiness int

AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdBussiness],[NameBussiness],[IdOwner],[Finance],[IsCountBalance]
    FROM [dbo].[Businesses]
    WHERE [IdBussiness] = @IdBussiness;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spBusinesses_Insert]...';


GO
CREATE PROCEDURE [dbo].[spBusinesses_Insert]
    @NameBussiness varchar(30),
    @IdOwner int,
    @Finance money,
    @IsCountBalance bit,
    @IdBussiness int = 0 output
AS
BEGIN TRY
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Businesses]
    ([NameBussiness],[IdOwner],[Finance],[IsCountBalance])
    VALUES (@NameBussiness,@IdOwner,@Finance,@IsCountBalance)

    SELECT @IdBussiness = SCOPE_IDENTITY();

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spBusinesses_Update]...';


GO
CREATE PROCEDURE [dbo].[spBusinesses_Update]
    @IdBussiness int,
    @NameBussiness varchar(30),
    @IdOwner int,
    @Finance money,
    @IsCountBalance bit
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    UPDATE [dbo].[Businesses]
    SET [IdBussiness] = @IdBussiness,
    [NameBussiness] = @NameBussiness,
    [IdOwner] = @IdOwner,
    [Finance] = @Finance,
    [IsCountBalance] = @IsCountBalance

    WHERE [IdBussiness] = @IdBussiness;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spCategories_Delete]...';


GO
CREATE PROCEDURE [dbo].[spCategories_Delete]
    @IdCategory int
AS
BEGIN TRY

    DELETE FROM [dbo].[Categories]
    WHERE [IdCategory] = @IdCategory;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spCategories_Get]...';


GO
CREATE PROCEDURE [dbo].[spCategories_Get]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdCategory],[Category]
    FROM [dbo].[Categories]

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spCategories_GetOne]...';


GO
CREATE PROCEDURE [dbo].[spCategories_GetOne]
    @IdCategory int

AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdCategory],[Category]
    FROM [dbo].[Categories]
    WHERE [IdCategory] = @IdCategory;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spCategories_Insert]...';


GO
CREATE PROCEDURE [dbo].[spCategories_Insert]
    @Category varchar(20),
    @IdCategory int = 0 output
AS
BEGIN TRY
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Categories]
    ([Category])
    VALUES (@Category)

    SELECT @IdCategory = SCOPE_IDENTITY();

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spCategories_Update]...';


GO
CREATE PROCEDURE [dbo].[spCategories_Update]
    @IdCategory int,
    @Category varchar(20)
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    UPDATE [dbo].[Categories]
    SET [IdCategory] = @IdCategory,
    [Category] = @Category
    
    WHERE [IdCategory] = @IdCategory;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spClients_Delete]...';


GO
CREATE PROCEDURE [dbo].[spClients_Delete]
    @IdClient int
AS
BEGIN TRY

    DELETE FROM [dbo].[Clients]
    WHERE [IdClient] = @IdClient;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spClients_Get]...';


GO
CREATE PROCEDURE [dbo].[spClients_Get]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdClient],[Name],[LastName],[Address],[Phone],[Email]
    FROM [dbo].[Clients]

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spClients_GetOne]...';


GO
CREATE PROCEDURE [dbo].[spClients_GetOne]
    @IdClient int
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdClient],[Name],[LastName],[Address],[Phone],[Email]
    FROM [dbo].[Clients]
    WHERE [IdClient] = @IdClient;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spClients_Insert]...';


GO
CREATE PROCEDURE [dbo].[spClients_Insert]
    @Name varchar(30),
    @LastName varchar(30),
    @Address varchar(15),
    @Phone varchar(12),
    @Email varchar(40),
    @IdClient  int = 0 output
AS
BEGIN TRY
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Clients]
    ([Name],[LastName],[Address],[Phone],[Email])
    VALUES (@Name,@LastName,@Address,@Phone,@Email)

    SELECT @IdClient = SCOPE_IDENTITY();

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spClients_Update]...';


GO
CREATE PROCEDURE [dbo].[spClients_Update]
    @IdClient int,
    @Name varchar(30),
    @LastName varchar(30),
    @Address varchar(15),
    @Phone varchar(12),
    @Email varchar(40)
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    UPDATE [dbo].[Clients]
    SET [IdClient] = @IdClient,
    [Name] = @Name,
    [LastName] = @LastName,
    [Address] = @Address,
    [Phone] = @Phone,
    [Email] = @Email
    
    WHERE [IdClient] = @IdClient;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spExpenses_Delete]...';


GO
CREATE PROCEDURE [dbo].[spExpenses_Delete]
    @IdExpense int
AS
BEGIN TRY

    DELETE FROM [dbo].[Expenses]
    WHERE [IdExpense] = @IdExpense;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spExpenses_Get]...';


GO
CREATE PROCEDURE [dbo].[spExpenses_Get]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdExpense],[DateExpense],[IdPayMethod],[IdProvider],[Spent],[IdProduct]
    FROM [dbo].[Expenses]

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spExpenses_GetOne]...';


GO
CREATE PROCEDURE [dbo].[spExpenses_GetOne]
    @IdExpense int
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdExpense],[DateExpense],[IdPayMethod],[IdProvider],[Spent],[IdProduct]
    FROM [dbo].[Expenses]
    WHERE [IdExpense] = @IdExpense;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spExpenses_Insert]...';


GO
CREATE PROCEDURE [dbo].[spExpenses_Insert]
    @DateExpense datetime,
    @IdPayMethod int,
    @IdProvider int,
    @Spent money,
    @IdProduct int,
    @IdExpense  int = 0 output
AS
BEGIN TRY
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Expenses]
    ([DateExpense],[IdPayMethod],[IdProvider],[Spent],[IdProduct])
    VALUES (@DateExpense,@IdPayMethod,@IdProvider,@Spent,@IdProduct)

    SELECT @IdExpense = SCOPE_IDENTITY();

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spExpenses_Update]...';


GO
CREATE PROCEDURE [dbo].[spExpenses_Update]
    @IdExpense int,
    @DateExpense datetime,
    @IdPayMethod int,
    @IdProvider int,
    @Spent money,
    @IdProduct int
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    UPDATE [dbo].[Expenses]
    SET [IdExpense] = @IdExpense,
    [DateExpense] = @DateExpense,
    [IdPayMethod] = @IdPayMethod,
    [IdProvider] = @IdProvider,
    [Spent] = @Spent,
    [IdProduct] = @IdProduct
    
    WHERE [IdExpense] = @IdExpense;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spOrders_Delete]...';


GO
CREATE PROCEDURE [dbo].[spOrders_Delete]
    @IdOrder int
AS
BEGIN TRY

    DELETE FROM [dbo].[Orders]
    WHERE [IdOrder] = @IdOrder;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spOrders_Get]...';


GO
CREATE PROCEDURE [dbo].[spOrders_Get]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdOrder],[IdProduct],[IdClient],[OrderDate],[DeliveryDate],[OrderOrigin]
    FROM [dbo].[Orders]

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spOrders_GetOne]...';


GO
CREATE PROCEDURE [dbo].[spOrders_GetOne]
    @IdOrder int
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdOrder],[IdProduct],[IdClient],[OrderDate],[DeliveryDate],[OrderOrigin]
    FROM [dbo].[Orders]
    WHERE [IdOrder] = @IdOrder;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spOrders_Insert]...';


GO
CREATE PROCEDURE [dbo].[spOrders_Insert]
    @IdProduct int,
    @IdClient int,
    @OrderDate datetime,
    @DeliveryDate datetime,
    @OrderOrigin varchar(10),
    @IdOrder  int = 0 output
AS
BEGIN TRY
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Orders]
    ([IdProduct],[IdClient],[OrderDate],[DeliveryDate],[OrderOrigin])
    VALUES (@IdProduct,@IdClient,@OrderDate,@DeliveryDate,@OrderOrigin)

    SELECT @IdOrder = SCOPE_IDENTITY();

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spOrders_Update]...';


GO
CREATE PROCEDURE [dbo].[spOrders_Update]
    @IdOrder int,
    @IdProduct int,
    @IdClient int,
    @OrderDate datetime,
    @DeliveryDate datetime,
    @OrderOrigin varchar(10)
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    UPDATE [dbo].[Orders]
    SET [IdOrder] = @IdOrder,
    [IdProduct] = @IdProduct,
    [IdClient] = @IdClient,
    [OrderDate] = @OrderDate,
    [DeliveryDate] = @DeliveryDate,
    [OrderOrigin] = @OrderOrigin

    WHERE [IdOrder] = @IdOrder;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spOwners_Delete]...';


GO
CREATE PROCEDURE [dbo].[spOwners_Delete]
    @IdOwner int
AS
BEGIN TRY

    DELETE FROM [dbo].[Owners]
    WHERE [IdOwner] = @IdOwner;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spOwners_Get]...';


GO
CREATE PROCEDURE [dbo].[spOwners_Get]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdOwner],[Username],[Name],[LastName],[Password],[Email],[Phone]
    FROM [dbo].[Owners]

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spOwners_GetOne]...';


GO
CREATE PROCEDURE [dbo].[spOwners_GetOne]
    @IdOwner int

AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdOwner],[Username],[Name],[LastName],[Password],[Email],[Phone]
    FROM [dbo].[Owners]
    WHERE [IdOwner] = @IdOwner;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spOwners_Insert]...';


GO
CREATE PROCEDURE [dbo].[spOwners_Insert]
    @Username varchar(15),
    @Name varchar(25),
    @LastName varchar(25),
    @Password varchar(80),
    @Email varchar(40),
    @Phone varchar(12),
    @IdOwner  int = 0 output
AS
BEGIN TRY
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Owners]
    ([Username],[Name],[LastName],[Password],[Email],[Phone])
    VALUES (@Username,@Name,@LastName,@Password,@Email,@Phone)

    SELECT @IdOwner = SCOPE_IDENTITY();

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spOwners_Update]...';


GO
CREATE PROCEDURE [dbo].[spOwners_Update]
    @IdOwner int,
    @Username varchar(15),
    @Name varchar(25),
    @LastName varchar(25),
    @Password varchar(80),
    @Email varchar(40),
    @Phone varchar(12)
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    UPDATE [dbo].[Owners]
    SET [IdOwner] = @IdOwner,
    [Username] = @Username,
    [Name] = @Name,
    [LastName] = @LastName,
    [Password] = @Password,
    [Email] = @Email,
    [Phone] = @Phone
    
    WHERE [IdOwner] = @IdOwner;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spPayMethods_Delete]...';


GO
CREATE PROCEDURE [dbo].[spPayMethods_Delete]
    @IdPayMethod int
AS
BEGIN TRY

    DELETE FROM [dbo].[PayMethods]
    WHERE [IdPayMethod] = @IdPayMethod;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spPayMethods_Get]...';


GO
CREATE PROCEDURE [dbo].[spPayMethods_Get]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdPayMethod],[PayMethod]
    FROM [dbo].[PayMethods]

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spPayMethods_GetOne]...';


GO
CREATE PROCEDURE [dbo].[spPayMethods_GetOne]
    @IdPayMethod int
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdPayMethod],[PayMethod]
    FROM [dbo].[PayMethods]
    WHERE [IdPayMethod] = @IdPayMethod;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spPayMethods_Insert]...';


GO
CREATE PROCEDURE [dbo].[spPayMethods_Insert]
    @PayMethod varchar(20),
    @IdPayMethod  int = 0 output
AS
BEGIN TRY
    SET NOCOUNT ON;

    INSERT INTO [dbo].[PayMethods]
    ([PayMethod])
    VALUES (@PayMethod)

    SELECT @IdPayMethod = SCOPE_IDENTITY();

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spPayMethods_Update]...';


GO
CREATE PROCEDURE [dbo].[spPayMethods_Update]
    @IdPayMethod int,
    @PayMethod varchar(20)
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    UPDATE [dbo].[PayMethods]
    SET [IdPayMethod] = @IdPayMethod,
    [PayMethod] = @PayMethod

    WHERE [IdPayMethod] = @IdPayMethod;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spProducts_Insert]...';


GO
CREATE PROCEDURE [dbo].[spProducts_Insert]
    @NameProduct varchar(15),
    @ImageProduct varchar(100),
    @IdCategory int,
    @Price money,
    @UnitaryCost money,
    @Quantity int,
    @IdProduct  int = 0 output
AS
BEGIN TRY
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Products]
	([NameProduct],[ImageProduct],[IdCategory],[Price],[UnitaryCost],[Quantity])
    VALUES (@NameProduct,@ImageProduct,@IdCategory,@Price,@UnitaryCost,@Quantity)

    SELECT @IdProduct = SCOPE_IDENTITY();

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spProductsGetOne]...';


GO
CREATE PROCEDURE [dbo].[spProductsGetOne]
    @IdProduct int
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdProduct],[NameProduct],[ImageProduct],[IdCategory],[Price],[UnitaryCost],[Quantity]
    FROM [dbo].[Products]
    WHERE [IdProduct] = @IdProduct;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spProductsUpdate]...';


GO
CREATE PROCEDURE [dbo].[spProductsUpdate]
    @IdProduct int,
    @NameProduct varchar(15),
    @ImageProduct varchar(100),
    @IdCategory int,
    @Price money,
    @UnitaryCost money,
    @Quantity int
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    UPDATE [dbo].[Products]
    SET [IdProduct] = @IdProduct,
    [NameProduct] = @NameProduct,
    [ImageProduct] = @ImageProduct,
    [IdCategory] = @IdCategory,
    [Price] = @Price,
    [UnitaryCost] = @UnitaryCost,
    [Quantity] = @Quantity

    WHERE [IdProduct] = @IdProduct;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spProviders_Delete]...';


GO
CREATE PROCEDURE [dbo].[spProviders_Delete]
    @IdProvider int
AS
BEGIN TRY

    DELETE FROM [dbo].[Providers]
    WHERE [IdProvider] = @IdProvider;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spProviders_Get]...';


GO
CREATE PROCEDURE [dbo].[spProviders_Get]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdProvider],[Name],[Address],[Phone],[Email]
    FROM [dbo].[Providers]

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spProviders_GetOne]...';


GO
CREATE PROCEDURE [dbo].[spProviders_GetOne]
    @IdProvider int

AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdProvider],[Name],[Address],[Phone],[Email]
    FROM [dbo].[Providers]
    WHERE [IdProvider] = @IdProvider;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spProviders_Insert]...';


GO
CREATE PROCEDURE [dbo].[spProviders_Insert]
    @Name varchar(30),
    @Address varchar(15),
    @Phone varchar(12),
    @Email varchar(40),
    @IdProvider  int = 0 output
AS
BEGIN TRY
SET NOCOUNT ON;

    INSERT INTO [dbo].[Providers]
    ([Name],[Address],[Phone],[Email])
    VALUES (@Name,@Address,@Phone,@Email)

    SELECT @IdProvider = SCOPE_IDENTITY();

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spProviders_Update]...';


GO
CREATE PROCEDURE [dbo].[spProviders_Update]
    @IdProvider int,
    @Name varchar(30),
    @Address varchar(15),
    @Phone varchar(12),
    @Email varchar(40)
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    UPDATE [dbo].[Providers]
    SET [IdProvider] = @IdProvider,
    [Name] = @Name,
    [Address] = @Address,
    [Phone] = @Phone,
    [Email] = @Email

    WHERE [IdProvider] = @IdProvider;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spSales_Delete]...';


GO
CREATE PROCEDURE [dbo].[spSales_Delete]
    @IdSale int
AS
BEGIN TRY

    DELETE FROM [dbo].[Sales]
    WHERE [IdSale] = @IdSale;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spSales_Get]...';


GO
CREATE PROCEDURE [dbo].[spSales_Get]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdSale],[DateSale],[IdPayMethod],[IdClient],[Income],[IdProduct]
    FROM [dbo].[Sales]

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spSales_GetOne]...';


GO
CREATE PROCEDURE [dbo].[spSales_GetOne]
    @IdSale int
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdSale],[DateSale],[IdPayMethod],[IdClient],[Income],[IdProduct]
    FROM [dbo].[Sales]
    WHERE [IdSale] = @IdSale;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spSales_Insert]...';


GO
CREATE PROCEDURE [dbo].[spSales_Insert]
    @DateSale datetime,
    @IdPayMethod int,
    @IdClient int,
    @Income money,
    @IdProduct int,
    @IdSale  int = 0 output
AS
BEGIN TRY
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Sales]
    ([DateSale],[IdPayMethod],[IdClient],[Income],[IdProduct])
    VALUES (@DateSale,@IdPayMethod,@IdClient,@Income,@IdProduct)

    SELECT @IdSale = SCOPE_IDENTITY();

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
PRINT N'Creando Procedimiento [dbo].[spSales_Update]...';


GO
CREATE PROCEDURE [dbo].[spSales_Update]
    @IdSale  int,
    @DateSale datetime,
    @IdPayMethod int,
    @IdClient int,
    @Income money,
    @IdProduct int
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    UPDATE [dbo].[Sales]
    SET [IdSale] = @IdSale,
    [DateSale] = @DateSale,
    [IdPayMethod] = @IdPayMethod,
    [IdClient] = @IdClient,
    [Income] = @Income,
    [IdProduct] = @IdProduct
    
    WHERE [IdSale] = @IdSale;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
GO
-- Paso de refactorización para actualizar el servidor de destino con los registros de transacciones implementadas
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f31b6482-5e7f-4900-a647-4d8e72068301')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f31b6482-5e7f-4900-a647-4d8e72068301')

GO

GO
/*
Plantilla de script posterior a la implementación							
--------------------------------------------------------------------------------------
 Este archivo contiene instrucciones de SQL que se anexarán al script de compilación.		
 Use la sintaxis de SQLCMD para incluir un archivo en el script posterior a la implementación.			
 Ejemplo:      :r .\miArchivo.sql								
 Use la sintaxis de SQLCMD para hacer referencia a una variable en el script posterior a la implementación.		
 Ejemplo:      :setvar TableName miTabla							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
IF NOT EXISTS (SELECT 1 FROM [dbo].[Categories])
BEGIN

    INSERT INTO [dbo].[Categories] ([Category]) VALUES ("Food");
    INSERT INTO [dbo].[Categories] ([Category]) VALUES ("Tech");
    INSERT INTO [dbo].[Products] VALUES ("Empanada", "empanada.png", 1, 45.5, 20.5, 10);
    INSERT INTO [dbo].[Products] VALUES ("Arepa", "arepa.png", 1, 50.9, 20.5, 100);
    INSERT INTO [dbo].[Products] VALUES ("Asus vivobook", "asusvivobook.png", 2, 162.3, 400.5, 8);

END
GO

GO
PRINT N'Actualización completada.';


GO
