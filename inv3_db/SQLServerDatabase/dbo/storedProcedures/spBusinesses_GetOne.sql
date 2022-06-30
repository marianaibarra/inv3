CREATE PROCEDURE [dbo].[spBusinesses_GetOne]
    @IdBussiness int

AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdBussiness],[NameBussiness],[IdOwner],[Finance],[IsCountBalance]
    FROM [dbo].[Businesses]
    WHERE [IdBussiness] = @IdBussiness;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
