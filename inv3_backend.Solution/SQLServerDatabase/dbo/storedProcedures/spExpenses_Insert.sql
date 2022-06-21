CREATE PROCEDURE [dbo].[spExpenses_Insert]
    @DateExpense datetime,
    @IdPayMethod int,
    @IdProvider int,
    @Spent money,
    @IdProduct int,
    @IdExpense  int = 0 output
AS
BEGIN TRY
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Expenses]
    ([DateExpense],[IdPayMethod],[IdProvider],[Spent],[IdProduct])
    VALUES ([@DateExpense],[@IdPayMethod],[@IdProvider],[@Spent],[@IdProduct])

    SELECT @IdExpense = SCOPE_IDENTITY();

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH
