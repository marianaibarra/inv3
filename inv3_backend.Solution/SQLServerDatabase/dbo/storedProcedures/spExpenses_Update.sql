CREATE PROCEDURE [dbo].[spExpenses_Update]
    @IdExpense int,
    @DateExpense datetime,
    @IdPayMethod int,
    @IdProvider int,
    @Spent money,
    @IdProduct int
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    UPDATE [dbo].[Expenses]
    SET [IdExpense] = @IdExpense,
    [DateExpense] = @DateExpense,
    [IdPayMethod] = @IdPayMethod,
    [IdProvider] = @IdProvider,
    [Spent] = @Spent,
    [IdProduct] = @IdProduct
    
    WHERE [IdExpense] = @IdExpense;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
