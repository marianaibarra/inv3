CREATE PROCEDURE [dbo].[spBusinesses_Insert]
    @NameBussiness varchar(30),
    @IdOwner int,
    @Finance money,
    @IsCountBalance bit,
    @IdBussiness int = 0 output
AS
BEGIN TRY
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Businesses]
    ([NameBussiness],[IdOwner],[Finance],[IsCountBalance])
    VALUES (@NameBussiness,@IdOwner,@Finance,@IsCountBalance)

    SELECT @IdBussiness = SCOPE_IDENTITY();

END TRY 

BEGIN CATCH

	SELECT ERROR_MESSAGE() AS Response;

END CATCH
