CREATE PROCEDURE [dbo].[spOrders_Delete]
    @IdOrder int
AS
BEGIN TRY

    DELETE FROM [dbo].[Orders]
    WHERE [IdOrder] = @IdOrder;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
