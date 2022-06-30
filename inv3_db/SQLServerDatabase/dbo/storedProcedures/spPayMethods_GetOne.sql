CREATE PROCEDURE [dbo].[spPayMethods_GetOne]
    @IdPayMethod int
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
