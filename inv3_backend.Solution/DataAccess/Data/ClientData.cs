using Core.Models;
using DataAccess.DbAccess;

namespace DataAccess.Data;

public class ClientData : IClientData
{
    private readonly ISqlDataAccess _database;

    public ClientData(ISqlDataAccess database)
    {
        _database = database;
    }

    public Task<IEnumerable<Client>> GetClients()
    {
        return _database.LoadData<Client, dynamic>(storedProcedure: "dbo.Clients_Get", parameters: new { });
    }

    public async Task<IEnumerable<Client>> GetOneClient(int IdClient)
    {
        return await _database.LoadData<Client, dynamic>(storedProcedure: "dbo.Clients_GetOne", parameters: new { IdClient });
    }

    public Task CreateClient(Client client)
    {
        return _database.SaveData(storedProcedure: "dbo.Clients_Create", parameters: new
        {
            client.NameClient,
            client.LastName,
            client.EmailClient,
            client.PhoneClient,
            client.AddressClient
        });
    }

    public Task UpdateClient(Client client)
    {
        return _database.SaveData(storedProcedure: "dbo.Clients_Update", parameters: client);
    }

    public Task DeleteClient(int IdClient)
    {
        return _database.SaveData(storedProcedure: "dbo.Clients_Delete", parameters: new { IdClient });
    }
}
