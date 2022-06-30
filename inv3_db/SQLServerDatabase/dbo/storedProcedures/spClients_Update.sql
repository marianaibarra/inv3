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
