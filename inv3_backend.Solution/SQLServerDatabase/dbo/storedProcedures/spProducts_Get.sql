CREATE PROCEDURE [dbo].[spProducts_Get]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdProduct],[NameProduct],[ImageProduct],[IdCategory],[Price],[UnitaryCost],[Quantity]
    FROM [dbo].[Products]

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
