CREATE PROCEDURE [dbo].[spPayMethods_Get]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdPayMethod],[PayMethod]
    FROM [dbo].[PayMethods]

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
