/*
Plantilla de script posterior a la implementación							
--------------------------------------------------------------------------------------
 Este archivo contiene instrucciones de SQL que se anexarán al script de compilación.		
 Use la sintaxis de SQLCMD para incluir un archivo en el script posterior a la implementación.			
 Ejemplo:      :r .\miArchivo.sql								
 Use la sintaxis de SQLCMD para hacer referencia a una variable en el script posterior a la implementación.		
 Ejemplo:      :setvar TableName miTabla							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
IF NOT EXISTS (SELECT 1 FROM [dbo].[Categories])
BEGIN

    INSERT INTO [dbo].[Categories] ([Category]) VALUES ("Food");
    INSERT INTO [dbo].[Categories] ([Category]) VALUES ("Tech");
    INSERT INTO [dbo].[Products] VALUES ("Empanada", "empanada.png", 1, 45.5, 20.5, 10);
    INSERT INTO [dbo].[Products] VALUES ("Arepa", "arepa.png", 1, 50.9, 20.5, 100);
    INSERT INTO [dbo].[Products] VALUES ("Asus vivobook", "asusvivobook.png", 2, 162.3, 400.5, 8);

END
