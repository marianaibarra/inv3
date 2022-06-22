CREATE PROCEDURE [dbo].[spSales_Get]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdSale],[DateSale],[IdPayMethod],[IdClient],[Income],[IdProduct]
    FROM [dbo].[Sales]

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
