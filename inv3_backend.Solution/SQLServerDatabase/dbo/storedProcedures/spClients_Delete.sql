CREATE PROCEDURE [dbo].[spClients_Delete]
    @IdClient int
AS
BEGIN TRY

    DELETE FROM [dbo].[Clients]
    WHERE [IdClient] = @IdClient;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
