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
