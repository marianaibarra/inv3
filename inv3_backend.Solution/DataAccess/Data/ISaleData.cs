using Core.Models;

namespace DataAccess.Data
{
    public interface ISaleData
    {
        Task CreateSale(Sale sale);
        Task DeleteSale(int IdSale);
        Task<IEnumerable<Sale>> GetOneSale(int IdSale);
        Task<IEnumerable<Sale>> GetSales();
        Task UpdateSale(Sale sale);
    }
}