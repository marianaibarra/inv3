CREATE PROCEDURE [dbo].[spOwners_Get]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdOwner],[Username],[Name],[LastName],[Password],[Email],[Phone]
    FROM [dbo].[Owners]

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
