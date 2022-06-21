CREATE PROCEDURE [dbo].[spOrders_Insert]
    @IdProduct int,
    @IdClient int,
    @OrderDate datetime,
    @DeliveryDate datetime,
    @OrderOrigin varchar(10),
    @IdOrder  int = 0 output
AS
BEGIN TRY
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Orders]
    ([IdProduct],[IdClient],[OrderDate],[DeliveryDate],[OrderOrigin])
    VALUES ([@IdProduct],[@IdClient],[@OrderDate],[@DeliveryDate],[@OrderOrigin])

    SELECT @IdOrder = SCOPE_IDENTITY();

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH
