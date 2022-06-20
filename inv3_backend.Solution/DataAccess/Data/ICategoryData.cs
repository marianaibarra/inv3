using Core.Models;

namespace DataAccess.Data
{
    public interface ICategoryData
    {
        Task CreateCategory(Category category);
        Task DeleteCategory(int IdCategory);
        Task<IEnumerable<Category>> GetCategories();
        Task<IEnumerable<Category>> GetOneCategory(int IdCategory);
        Task UpdateCategory(Category category);
    }
}