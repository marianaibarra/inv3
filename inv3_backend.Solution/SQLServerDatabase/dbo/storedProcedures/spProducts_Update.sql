CREATE PROCEDURE [dbo].[spProducts_Update]
	@IdProduct int,
	@NameProduct varchar(15),
	@ImageProduct varchar(100),
	@IdCategory int,
	@Price money,
	@UnitaryCost money,
	@Quantity int
AS
BEGIN

	UPDATE [dbo].[Products]
	SET [NameProduct] = @NameProduct, 
		[ImageProduct] = @ImageProduct,
		[IdCategory] = @IdCategory,
		[Price] = @Price, 
		[UnitaryCost] = @UnitaryCost, 
		[Quantity] = @Quantity
	WHERE [IdProduct] = @IdProduct;

END