CREATE PROCEDURE [dbo].[spSales_GetOne]
    @IdSale int
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdSale],[DateSale],[IdPayMethod],[IdClient],[Income],[IdProduct]
    FROM [dbo].[Sales]
    WHERE [IdSale] = @IdSale;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
