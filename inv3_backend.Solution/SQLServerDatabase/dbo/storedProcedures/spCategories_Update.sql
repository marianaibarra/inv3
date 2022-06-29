CREATE PROCEDURE [dbo].[spCategories_Update]
    @IdCategory int,
    @Category varchar(20)
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    UPDATE [dbo].[Categories]
    SET [IdCategory] = @IdCategory,
    [Category] = @Category
    
    WHERE [IdCategory] = @IdCategory;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
