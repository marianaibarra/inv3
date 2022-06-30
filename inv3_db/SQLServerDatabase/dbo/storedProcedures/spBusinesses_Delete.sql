CREATE PROCEDURE [dbo].[spBusinesses_Delete]
    @IdBussiness int
AS
BEGIN TRY

    DELETE FROM [dbo].[Businesses]
    WHERE [IdBussiness] = @IdBussiness;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
