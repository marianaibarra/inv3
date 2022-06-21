CREATE PROCEDURE [dbo].[spCategories_Insert]
    @Category varchar(20),
    @IdCategory int = 0 output
AS
BEGIN TRY
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Categories]
    ([Category])
    VALUES ([@Category])

    SELECT @IdCategory = SCOPE_IDENTITY();

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH
