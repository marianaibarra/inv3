CREATE PROCEDURE [dbo].[spProducts_Insert]
    @NameProduct varchar 15,
    @ImageProduct varchar 100,
    @IdCategory int None,
    @Price money None,
    @UnitaryCost money None,
    @Quantity int None,
    @IdProduct  int = 0 output
AS
BEGIN TRY
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Products]
	([NameProduct],[ImageProduct],[IdCategory],[Price],[UnitaryCost],[Quantity])
    VALUES ([@NameProduct],[@ImageProduct],[@IdCategory],[@Price],[@UnitaryCost],[@Quantity])

    SELECT @IdProduct = SCOPE_IDENTITY();

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH
