using Core.Models;

namespace DataAccess.Data
{
    public interface IProductData
    {
        Task<IEnumerable<Product>> GetProducts();
        Task<Product?> GetOneProduct(int id);
        Task<Product> CreateProduct(Product product);
        Task updateProduct(Product product);
        Task deleteProduct(int id);
    }
}