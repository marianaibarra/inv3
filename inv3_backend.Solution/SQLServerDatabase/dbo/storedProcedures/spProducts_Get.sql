CREATE PROCEDURE [dbo].[spProducts_Get]
AS
BEGIN
	
	set nocount on;
	SELECT [IdProduct], [NameProduct], [ImageProduct], [IdCategory], [Price], [UnitaryCost],[Quantity]
	FROM [dbo].[Products];

END