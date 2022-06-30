CREATE PROCEDURE [dbo].[spProductsUpdate]
    @IdProduct int,
    @NameProduct varchar(15),
    @ImageProduct varchar(100),
    @IdCategory int,
    @Price money,
    @UnitaryCost money,
    @Quantity int
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    UPDATE [dbo].[Products]
    SET [IdProduct] = @IdProduct,
    [NameProduct] = @NameProduct,
    [ImageProduct] = @ImageProduct,
    [IdCategory] = @IdCategory,
    [Price] = @Price,
    [UnitaryCost] = @UnitaryCost,
    [Quantity] = @Quantity

    WHERE [IdProduct] = @IdProduct;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
