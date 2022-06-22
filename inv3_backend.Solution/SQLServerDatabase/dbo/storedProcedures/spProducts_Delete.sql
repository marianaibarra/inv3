CREATE PROCEDURE [dbo].[spProducts_Delete]
    @IdProduct int
AS
BEGIN TRY

    DELETE FROM [dbo].[Products]
    WHERE [IdProduct] = @IdProduct;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
