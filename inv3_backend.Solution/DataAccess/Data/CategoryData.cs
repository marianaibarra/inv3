using System.Data;
using Core.Models;
using Dapper;
using DataAccess.DbAccess;

namespace DataAccess.Data;

public class CategoryData : ICategoryData
{
    private readonly ISqlDataAccess _database;

    public CategoryData(ISqlDataAccess database)
    {
        _database = database;
    }

    public Task<IEnumerable<Category>> GetCategories()
    {
        return _database.LoadData<Category, dynamic>(storedProcedure: "dbo.Categories_Get", parameters: new { });
    }

    public async Task<IEnumerable<Category>> GetOneCategory(int IdCategory)
    {
        return await _database.LoadData<Category, dynamic>(storedProcedure: "dbo.Categories_GetOne", parameters: new { IdCategory });
    }

    public async Task<Category> CreateCategory(Category category)
    {
        var p = new DynamicParameters();
        p.Add("@NameCategory", category.NameCategory);
        p.Add("@IdCategory", 0, dbType: DbType.Int32, direction: ParameterDirection.Output);
        await _database.SaveData(storedProcedure: "dbo.Categories_Insert", parameters: p);

        category.IdCategory = p.Get<int>("@IdCategory");
        return category;
    }

    public Task UpdateCategory(Category category)
    {
        return _database.SaveData(storedProcedure: "dbo.Categories_Update", parameters: category);
    }

    public Task DeleteCategory(int IdCategory)
    {
        return _database.SaveData(storedProcedure: "dbo.Categories_Delete", parameters: new { IdCategory });
    }
}
