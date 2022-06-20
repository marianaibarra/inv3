using Core.Models;
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

    public Task CreateCategory(Category category)
    {
        return _database.SaveData(storedProcedure: "dbo.Categories_Create", parameters: new
        {
            category.NameCategory
        });
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
