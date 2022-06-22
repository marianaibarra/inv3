CREATE PROCEDURE [dbo].[spSales_Update]
    @IdSale  int,
    @DateSale datetime,
    @IdPayMethod int,
    @IdClient int,
    @Income money,
    @IdProduct int
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    UPDATE [dbo].[Sales]
    SET [IdSale] = [@IdSale],
    [DateSale] = [@DateSale],
    [IdPayMethod] = [@IdPayMethod],
    [IdClient] = [@IdClient],
    [Income] = [@Income],
    [IdProduct] = [@IdProduct]
    
    WHERE [IdSale] = @IdSale;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
