CREATE PROCEDURE [dbo].[spPayMethods_Delete]
    @IdPayMethod int
AS
BEGIN TRY

    DELETE FROM [dbo].[PayMethods]
    WHERE [IdPayMethod] = @IdPayMethod;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
