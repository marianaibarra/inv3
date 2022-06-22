CREATE PROCEDURE [dbo].[spOrders_Get]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdOrder],[IdProduct],[IdClient],[OrderDate],[DeliveryDate],[OrderOrigin]
    FROM [dbo].[Orders]

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
