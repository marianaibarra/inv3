using Core.Models;

namespace DataAccess.Data
{
    public interface IBussinessData
    {
        Task<Bussiness> CreateBussiness(Bussiness bussiness);
        Task DeleteBussiness(int IdBussiness);
        Task<IEnumerable<Bussiness>> GetBussinesses();
        Task<IEnumerable<Bussiness?>> GetOneBussiness(int IdBussiness);
        Task UpdateBussiness(Bussiness bussiness);
    }
}