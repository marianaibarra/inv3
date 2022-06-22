CREATE PROCEDURE [dbo].[spExpenses_GetOne]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdExpense],[DateExpense],[IdPayMethod],[IdProvider],[Spent],[IdProduct]
    FROM [dbo].[Expenses]
    WHERE [IdExpense] = @IdExpense;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
