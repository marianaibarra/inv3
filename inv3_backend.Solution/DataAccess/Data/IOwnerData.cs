using Core.Models;

namespace DataAccess.Data
{
    public interface IOwnerData
    {
        Task CreateOwner(Owner owner);
        Task DeleteOwner(int IdOwner);
        Task<IEnumerable<Owner>> GetOneOwner(int IdOwner);
        Task<IEnumerable<Owner>> GetOwners();
        Task UpdateOwner(Owner owner);
    }
}