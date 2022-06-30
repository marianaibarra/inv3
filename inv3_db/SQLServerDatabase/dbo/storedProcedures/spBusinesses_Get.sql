CREATE PROCEDURE [dbo].[spBusinesses_Get]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdBussiness],[NameBussiness],[IdOwner],[Finance],[IsCountBalance]
    FROM [dbo].[Businesses]

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
