CREATE PROCEDURE [dbo].[spBusinesses_GetOne]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdBussiness],[Name],[IdOwner],[Finance],[IsCountBalance]
    FROM [dbo].[Businesses]
    WHERE [IdBussiness] = @IdBussiness;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
