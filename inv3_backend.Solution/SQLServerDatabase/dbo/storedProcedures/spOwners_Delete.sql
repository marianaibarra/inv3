CREATE PROCEDURE [dbo].[spOwners_Delete]
    @IdOwner int
AS
BEGIN TRY

    DELETE FROM [dbo].[Owners]
    WHERE [IdOwner] = @IdOwner;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
