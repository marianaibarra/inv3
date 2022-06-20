using System.Data;
using Core.Models;
using Dapper;
using DataAccess.DbAccess;

namespace DataAccess.Data;

public class ProductData : IProductData
{
    private readonly ISqlDataAccess _database;
    public ProductData(ISqlDataAccess database)
    {
        _database = database;
    }

    public Task<IEnumerable<Product>> GetProducts()
    {
        return _database.LoadData<Product, dynamic>(storedProcedure: "dbo.spProducts_Get", parameters: new { });
    }

    public async Task<Product> GetOneProduct(int IdProduct)
    {
        // TODO: Get category
        var result = await _database.LoadData<Product, dynamic>(storedProcedure: "dbo.spProducts_GetOne",
            parameters: new { IdProduct });

        return result.FirstOrDefault();
    }

    public async Task<Product> CreateProduct(Product product)
    {
        var p = new DynamicParameters();
        p.Add("@NameProduct", product.NameProduct);
        p.Add("@ImageProduct", product.ImageProduct);
        p.Add("@IdCategory", product.Category.IdCategory);
        p.Add("@Price", product.Price);
        p.Add("@UnitaryCost", product.UnitaryCost);
        p.Add("@Quantity", product.Quantity);
        p.Add("@IdProduct", 0, dbType: DbType.Int32, direction: ParameterDirection.Output);
        await _database.SaveData(storedProcedure: "dbo.spProducts_Create", parameters: p);

        product.IdProduct = p.Get<int>("@IdProduct");
        return product;
    }

    public Task updateProduct(Product product)
    {
        return _database.SaveData(storedProcedure: "dbo.spProducts_Update", parameters: product);
    }

    public Task deleteProduct(int id)
    {
        return _database.SaveData(storedProcedure: "dbo.spProducts_Delete", parameters: new { IdProduct = id });
    }
} 
