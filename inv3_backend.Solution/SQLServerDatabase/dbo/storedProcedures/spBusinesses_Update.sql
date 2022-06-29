CREATE PROCEDURE [dbo].[spBusinesses_Update]
    @IdBussiness int,
    @NameBussiness varchar(30),
    @IdOwner int,
    @Finance money,
    @IsCountBalance bit
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    UPDATE [dbo].[Businesses]
    SET [IdBussiness] = @IdBussiness,
    [NameBussiness] = @NameBussiness,
    [IdOwner] = @IdOwner,
    [Finance] = @Finance,
    [IsCountBalance] = @IsCountBalance

    WHERE [IdBussiness] = @IdBussiness;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
