CREATE PROCEDURE [dbo].[spSales_Delete]
    @IdSale int
AS
BEGIN TRY

    DELETE FROM [dbo].[Sales]
    WHERE [IdSale] = @IdSale;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
