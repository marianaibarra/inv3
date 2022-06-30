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
