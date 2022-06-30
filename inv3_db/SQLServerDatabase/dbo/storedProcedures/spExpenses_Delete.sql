CREATE PROCEDURE [dbo].[spExpenses_Delete]
    @IdExpense int
AS
BEGIN TRY

    DELETE FROM [dbo].[Expenses]
    WHERE [IdExpense] = @IdExpense;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
