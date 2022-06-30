CREATE PROCEDURE [dbo].[spOrders_Update]
    @IdOrder int,
    @IdProduct int,
    @IdClient int,
    @OrderDate datetime,
    @DeliveryDate datetime,
    @OrderOrigin varchar(10)
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    UPDATE [dbo].[Orders]
    SET [IdOrder] = @IdOrder,
    [IdProduct] = @IdProduct,
    [IdClient] = @IdClient,
    [OrderDate] = @OrderDate,
    [DeliveryDate] = @DeliveryDate,
    [OrderOrigin] = @OrderOrigin

    WHERE [IdOrder] = @IdOrder;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
