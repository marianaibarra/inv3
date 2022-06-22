CREATE PROCEDURE [dbo].[spProviders_GetOne]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdProvider],[Name],[Address],[Phone],[Email]
    FROM [dbo].[Providers]
    WHERE [IdProvider] = @IdProvider;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
