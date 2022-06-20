CREATE PROCEDURE [dbo].[spProducts_GetOne]
	@IdProduct int
AS
BEGIN
	set nocount on;
	SELECT [IdProduct], [NameProduct], [ImageProduct], [IdCategory], [Price], [UnitaryCost],[Quantity]
	FROM [dbo].[Products]
	WHERE [IdProduct] = @IdProduct;
END