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
