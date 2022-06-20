using Core.Models;

namespace DataAccess.Data
{
    public interface IProviderData
    {
        Task<Provider> CreateProvider(Provider provider);
        Task DeleteProvider(int IdProvider);
        Task<IEnumerable<Provider>> GetOneProvider(int IdProvider);
        Task<IEnumerable<Provider>> GetProviders();
        Task UpdateProvider(Provider provider);
    }
}