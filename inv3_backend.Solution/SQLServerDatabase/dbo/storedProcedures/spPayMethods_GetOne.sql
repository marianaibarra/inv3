CREATE PROCEDURE [dbo].[spPayMethods_GetOne]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdPayMethod],[PayMethod]
    FROM [dbo].[PayMethods]
    WHERE [IdPayMethod] = @IdPayMethod;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
