CREATE PROCEDURE [dbo].[spExpenses_Get]
    
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    SELECT [IdExpense],[DateExpense],[IdPayMethod],[IdProvider],[Spent],[IdProduct]
    FROM [dbo].[Expenses]

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
