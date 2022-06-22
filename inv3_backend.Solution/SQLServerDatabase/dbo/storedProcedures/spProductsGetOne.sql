CREATE PROCEDURE [dbo].[spProductsGetOne]
    @IdProduct int
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdProduct],[NameProduct],[ImageProduct],[IdCategory],[Price],[UnitaryCost],[Quantity]
    FROM [dbo].[Products]
    WHERE [IdProduct] = @IdProduct;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
