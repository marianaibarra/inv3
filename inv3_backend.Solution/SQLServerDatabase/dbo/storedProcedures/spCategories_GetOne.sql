CREATE PROCEDURE [dbo].[spCategories_GetOne]
    
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
