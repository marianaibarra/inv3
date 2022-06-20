CREATE PROCEDURE [dbo].[spProducts_Delete]
	@IdProduct int

AS
BEGIN
	DELETE FROM [dbo].[Products]
	WHERE [IdProduct] = @IdProduct;
END