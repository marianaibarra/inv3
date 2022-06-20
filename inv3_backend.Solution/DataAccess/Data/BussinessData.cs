using Core.Models;
using DataAccess.DbAccess;

namespace DataAccess.Data;

public class BussinessData : IBussinessData
{
    private readonly ISqlDataAccess _database;

    public BussinessData(ISqlDataAccess database)
    {
        _database = database;
    }

    public Task<IEnumerable<Bussiness>> GetBussinesses()
    {
        return _database.LoadData<Bussiness, dynamic>(storedProcedure: "dbo.spBusinesses_Get", parameters: new { });
    }

    public async Task<IEnumerable<Bussiness?>> GetOneBussiness(int IdBussiness)
    {
        return await _database.LoadData<Bussiness, dynamic>(storedProcedure: "dbo.spBusinesses_GetOne", parameters: new { IdBussiness });
    }

    public Task CreateBussiness(Bussiness bussiness)
    {
        return _database.SaveData(storedProcedure: "dbo.spBusinesses_Create", parameters: new
        {
            bussiness.NameBussiness,
            bussiness.Finance,
            bussiness.IsCountBalance,
            bussiness.Owner.IdOwner
        });
    }

    public Task UpdateBussiness(Bussiness bussiness)
    {
        return _database.SaveData(storedProcedure: "dbo.spBusinesses_Update", parameters: new
        {
            bussiness.IdBussiness,
            bussiness.NameBussiness,
            bussiness.Finance,
            bussiness.IsCountBalance,
            bussiness.Owner.IdOwner
        });
    }

    public Task DeleteBussiness(int IdBussiness)
    {
        return _database.SaveData(storedProcedure: "dbo.spBusinesses_Update", parameters: new { IdBussiness });
    }
}
