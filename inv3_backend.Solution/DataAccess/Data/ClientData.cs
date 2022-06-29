using System.Data;
using Core.Models;
using Dapper;
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
        return _database.LoadData<Client, dynamic>(storedProcedure: "dbo.spClients_Get", parameters: new { });
    }

    public async Task<IEnumerable<Client>> GetOneClient(int IdClient)
    {
        return await _database.LoadData<Client, dynamic>(storedProcedure: "dbo.spClients_GetOne", parameters: new { IdClient });
    }

    public async Task<Client> CreateClient(Client client)
    {
        var p = new DynamicParameters();
        p.Add("@NameClient", client.NameClient);
        p.Add("@LastName", client.LastName);
        p.Add("@EmailClient", client.EmailClient);
        p.Add("@PhoneClient", client.PhoneClient);
        p.Add("@AddressClient", client.AddressClient);
        p.Add("@IdClient", 0, dbType: DbType.Int32, direction: ParameterDirection.Output);
        await _database.SaveData(storedProcedure: "dbo.spClients_Insert", parameters: p);

        client.IdClient = p.Get<int>("@IdClient");
        return client;
    }

    public Task UpdateClient(Client client)
    {
        return _database.SaveData(storedProcedure: "dbo.spClients_Update", parameters: client);
    }

    public Task DeleteClient(int IdClient)
    {
        return _database.SaveData(storedProcedure: "dbo.spClients_Delete", parameters: new { IdClient });
    }
}
