using System.Data;
using Core.Models;
using Dapper;
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

    public async Task<Bussiness> CreateBussiness(Bussiness bussiness)
    {
        var p = new DynamicParameters();
        p.Add("@NameBussiness", bussiness.NameBussiness);
        p.Add("@Finance", bussiness.Finance);
        p.Add("@IsCountBalance", bussiness.IsCountBalance);
        p.Add("@IdOwner", bussiness.Owner.IdOwner);
        p.Add("@IdBussiness", 0, dbType: DbType.Int32, direction: ParameterDirection.Output);
        await _database.SaveData(storedProcedure: "dbo.spBusinesses_Create", parameters: p);

        bussiness.IdBussiness = p.Get<int>("@IdBussiness");
        return bussiness;
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
