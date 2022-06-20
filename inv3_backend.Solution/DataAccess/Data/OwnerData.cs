using Core.Models;
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

    public Task CreateOwner(Owner owner)
    {
        return _database.SaveData(storedProcedure: "dbo.Owners_Create", parameters: new
        {
            owner.Username,
            owner.NameOwner,
            owner.LastNameOwner,
            owner.Email,
            owner.Phone,
            owner.Business.IdBussiness
        });
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
