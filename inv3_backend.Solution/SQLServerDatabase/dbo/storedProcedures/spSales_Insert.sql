CREATE PROCEDURE [dbo].[spSales_Insert]
    @DateSale datetime,
    @IdPayMethod int,
    @IdClient int,
    @Income money,
    @IdProduct int,
    @IdSale  int = 0 output
AS
BEGIN TRY
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Sales]
    ([DateSale],[IdPayMethod],[IdClient],[Income],[IdProduct])
    VALUES (@DateSale,@IdPayMethod,@IdClient,@Income,@IdProduct)

    SELECT @IdSale = SCOPE_IDENTITY();

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH
