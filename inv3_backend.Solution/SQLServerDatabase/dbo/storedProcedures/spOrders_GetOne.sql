CREATE PROCEDURE [dbo].[spOrders_GetOne]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdOrder],[IdProduct],[IdClient],[OrderDate],[DeliveryDate],[OrderOrigin]
    FROM [dbo].[Orders]
    WHERE [IdOrder] = @IdOrder;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
