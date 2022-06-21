CREATE PROCEDURE [dbo].[spPayMethods_Insert]
    @PayMethod varchar(20),
    @IdPayMethod  int = 0 output
AS
BEGIN TRY
    SET NOCOUNT ON;

    INSERT INTO [dbo].[PayMethods]
    ([PayMethod])
    VALUES ([@PayMethod])

    SELECT @IdPayMethod = SCOPE_IDENTITY();

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH
