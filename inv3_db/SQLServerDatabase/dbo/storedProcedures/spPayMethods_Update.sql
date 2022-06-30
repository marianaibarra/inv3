CREATE PROCEDURE [dbo].[spPayMethods_Update]
    @IdPayMethod int,
    @PayMethod varchar(20)
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    UPDATE [dbo].[PayMethods]
    SET [IdPayMethod] = @IdPayMethod,
    [PayMethod] = @PayMethod

    WHERE [IdPayMethod] = @IdPayMethod;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
