CREATE PROCEDURE [dbo].[spProviders_Get]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdProvider],[Name],[Address],[Phone],[Email]
    FROM [dbo].[Providers]

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
