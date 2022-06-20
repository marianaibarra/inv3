using System.Data;
using Core.Models;
using Dapper;
using DataAccess.DbAccess;

namespace DataAccess.Data;

public class OwnerData : IOwnerData
{
    private readonly ISqlDataAccess _database;
    public OwnerData(ISqlDataAccess database)
    {
        _database = database;
    }

    public Task<IEnumerable<Owner>> GetOwners()
    {
        return _database.LoadData<Owner, dynamic>(storedProcedure: "dbo.Owners_Get", parameters: new { });
    }

    public async Task<IEnumerable<Owner>> GetOneOwner(int IdOwner)
    {
        return await _database.LoadData<Owner, dynamic>(storedProcedure: "dbo.Owners_GetOne", parameters: new { IdOwner });
    }
    public async Task<Owner> CreateOwner(Owner owner)
    {
        var p = new DynamicParameters();
        p.Add("@Username", owner.Username);
        p.Add("@NameOwner", owner.NameOwner);
        p.Add("@LastNameOwner", owner.LastNameOwner);
        p.Add("@Email", owner.Email);
        p.Add("@Phone", owner.Phone);
        p.Add("@IdOwner", 0, dbType: DbType.Int32, direction: ParameterDirection.Output);
        await _database.SaveData(storedProcedure: "dbo.spProducts_Create", parameters: p);

        owner.IdOwner = p.Get<int>("@IdOwner");
        return owner;
    }

    public Task UpdateOwner(Owner owner)
    {
        return _database.SaveData(storedProcedure: "dbo.Owners_Update", parameters: owner);
    }

    public Task DeleteOwner(int IdOwner)
    {
        return _database.SaveData(storedProcedure: "dbo.Owners_Delete", parameters: new { IdOwner });
    }
}
