CREATE PROCEDURE [dbo].[spProducts_Create]
	@NameProduct varchar(15),
	@ImageProduct varchar(100),
	@IdCategory int,
	@Price money,
	@UnitaryCost money,
	@Quantity int,
	@IdProduct int = 0 output
AS
BEGIN TRY

	INSERT INTO [dbo].[Products] 
	(NameProduct, ImageProduct, IdCategory, Price, UnitaryCost, Quantity)
	VALUES 
	(@NameProduct, @ImageProduct, @IdCategory, @Price, @UnitaryCost, @Quantity );
	
	SELECT 'Saved succesfully' AS Response;

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH

GO;