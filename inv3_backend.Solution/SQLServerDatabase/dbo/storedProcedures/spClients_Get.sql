CREATE PROCEDURE [dbo].[spClients_Get]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdClient],[Name],[LastName],[Address],[Phone],[Email]
    FROM [dbo].[Clients]

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
