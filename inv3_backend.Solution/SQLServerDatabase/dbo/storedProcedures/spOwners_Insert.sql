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
    VALUES ([@Username],[@Name],[@LastName],[@Password],[@Email],[@Phone])

    SELECT @IdOwner = SCOPE_IDENTITY();

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH
