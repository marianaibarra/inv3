CREATE PROCEDURE [dbo].[spClients_GetOne]
    @IdClient int
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdClient],[Name],[LastName],[Address],[Phone],[Email]
    FROM [dbo].[Clients]
    WHERE [IdClient] = @IdClient;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
