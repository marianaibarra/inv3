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
