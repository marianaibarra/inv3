using Core.Models;

namespace DataAccess.Data;

public interface IClientData
{
    Task CreateClient(Client client);
    Task DeleteClient(int IdClient);
    Task<IEnumerable<Client>> GetClients();
    Task<IEnumerable<Client>> GetOneClient(int IdClient);
    Task UpdateClient(Client client);
}