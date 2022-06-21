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
    VALUES ([@Name],[@LastName],[@Address],[@Phone],[@Email])

    SELECT @IdClient = SCOPE_IDENTITY();

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH
