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
