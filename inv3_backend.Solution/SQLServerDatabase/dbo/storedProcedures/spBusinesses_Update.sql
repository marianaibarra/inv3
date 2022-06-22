CREATE PROCEDURE [dbo].[spBusinesses_Update]
    @IdBussiness int,
    @Name varchar(30),
    @IdOwner int,
    @Finance money,
    @IsCountBalance bit
AS
BEGIN TRY

    SET NOCOUNT ON;
    
    UPDATE [dbo].[Businesses]
    SET [IdBussiness] = [@IdBussiness],
    [Name] = [@Name],
    [IdOwner] = [@IdOwner],
    [Finance] = [@Finance],
    [IsCountBalance] = [@IsCountBalance]

    WHERE [IdBusinesse] = @IdBusinesse;

END TRY 

BEGIN CATCH

    SELECT ERROR_MESSAGE() AS Response;

END CATCH
