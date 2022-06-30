CREATE PROCEDURE [dbo].[spProviders_Delete]
    @IdProvider int
AS
BEGIN TRY

    DELETE FROM [dbo].[Providers]
    WHERE [IdProvider] = @IdProvider;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
